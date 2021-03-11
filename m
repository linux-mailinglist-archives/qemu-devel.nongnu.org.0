Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8192A3378EE
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 17:14:34 +0100 (CET)
Received: from localhost ([::1]:53788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKNxJ-0000Bf-Ja
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 11:14:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKNL5-0007Tn-Oj
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 10:35:07 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:39677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKNL0-0004BS-TW
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 10:35:03 -0500
Received: by mail-ed1-x533.google.com with SMTP id bf3so3379430edb.6
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 07:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aChvB70ga2vyQQ6upZMSMkTcWbC7jbTXxgEhfs6fhw4=;
 b=iEbqqxyBm9OxKYC4cfcJvubqMnCygTJ/QEm5H3YkTR4OvVQZ+tLyCWSclQre5bzV5X
 Z+RPnHH5mR2bW1i64Ip/o3HF2KLOELj7R2n7OacNtty9OOfiMnlkfJa+Uv3WO8HwYQdJ
 EQARJ6a+dOFtkvxOR++lZtWsj/Y1Uotz4J/KVucEkzlPOOBOO+HBnx53uPbPPv/sRv8c
 RRLiADniapFOajYBzOrOYAJjqogqryNB5ob8ZCpldMy6w6/wrTIT1i7mtdNWIzjfHs3j
 4slFZNCAspVtbM5y2T+wyp91fLuc6RBMLMgS+J5NG9m9pRMUdREO+0wbHHMi4k4xLSVl
 sr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aChvB70ga2vyQQ6upZMSMkTcWbC7jbTXxgEhfs6fhw4=;
 b=Uq/ID08lG5jn7Us/12k+4cu7kJvMYBqEiQQyzTpAUai19HEUv9iTZhrDZZPU5jedAY
 xuKHu+WaDLM0aFWAvkR4d0hcTg08njiHE6oOh1H5BT4nAzpYcnlJXDvgaq0h0sULMY0W
 Ul+6dUsCIUiT2WqDFiXyZV1zUB+2FdQOMVhIkICL80terQ9pEWCr7Deu5TvX3VrriflB
 hjN0hOWZ4vnYQpO1ZFjsAD2xSvcOaHeK0p3zs8IY4K8FZFFX23oW506TrjFHdPVE42pm
 WRCK0dVyeQvFkOY0qhuhQbYcTdnwtGgwP/PaDTafC1Xo3lE3C3ntttNS7hBqUvxuPIpZ
 czJA==
X-Gm-Message-State: AOAM532WQ1XnygHoiu8fp/YEkYPGVYNlKhasPwCOOL2VkpOiB7tSDNDy
 06nGx5UAUTPJXl0rXSfjhUTZs4HTZR1UWF+sBFTqFQ==
X-Google-Smtp-Source: ABdhPJzwwP8i57BNXeWDrDFNfRiRCg1ALMprDvIgZR3dEsAYkymPJt/4U1HE4Ovv6eiRcZtHsp54iu1FhcLTiMOw9ZI=
X-Received: by 2002:aa7:c3cd:: with SMTP id l13mr8991421edr.52.1615476897275; 
 Thu, 11 Mar 2021 07:34:57 -0800 (PST)
MIME-Version: 1.0
References: <20210310195820.21950-1-nieklinnenbank@gmail.com>
In-Reply-To: <20210310195820.21950-1-nieklinnenbank@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 15:34:38 +0000
Message-ID: <CAFEAcA8+Xc1fzCcNVQjGu_WJ3gZLnUXu-iPz1AJ8WS5Q+-7mKQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Allwinner H3 fixes for EMAC and acceptance tests
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Pavel Dovgaluk <Pavel.Dovgaluk@ispras.ru>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 10 Mar 2021 at 19:58, Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
>
> The following are maintenance patches for the Allwinner H3. The first patch
> resolves artifact download errors by updating the URLs to the armbian.com server.
>
> The second patch is a fix for the EMAC that is used by the Allwinner H3 / Orange Pi PC machine.
>
> All these patches have been reviewed and tested and should be ready to pull in.



Applied to target-arm.next, thanks.

-- PMM

