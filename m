Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F3A419140
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 11:03:56 +0200 (CEST)
Received: from localhost ([::1]:39054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUmYE-0008LY-L8
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 05:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUmW8-0007Q2-Cm
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 05:01:44 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUmW3-0003J2-QG
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 05:01:41 -0400
Received: by mail-wr1-x436.google.com with SMTP id g16so50306022wrb.3
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 02:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xXeuM+jIVZhXZtle5xYXIuA7MXa1njdQRPv/CJUBXuk=;
 b=zTb2Ws220XGBOXXRdweFRBNw7tILMCd3+ltDpzZNhAmPVNFLaU1ddVsnbaIJ1ystdc
 zo9jZxbkwvWAwSnCFxy21O8EWnw5nRVdXeV7QWkTnCyNXwEJrL6y/skTFH4EKzCsQZ9A
 wW/l5bdNMgAaIE9MGHV4E6bnPsqA9yAuTwosMPXZZ0FUIk4jJrt4kr4JoyDLhPBQQ0kx
 v/KNBPYMSmsRlopy+PBpvddWeH+z9BGhQGOgHal2puY9v1mYiAe2Q3+4Rw8JK1ikudCV
 2MRiUTUpAWmVY9CJV+rQJWqgvAOOlpJ07nobvhhZK/MihbXWMsyKQn2cHcOFzwQlMEsx
 QtaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xXeuM+jIVZhXZtle5xYXIuA7MXa1njdQRPv/CJUBXuk=;
 b=8FY2HXN9uirDu8WBh36dk/avpA8JEbkPiz5MJ4fI5D8D7xC8n78tdMUTPDobisvLF4
 pGu3Z+uwezpZewbSowmVYnzyRkhbImesgJXl7Jnfc8Mxv1cGDVxRVyiaO06GtkEqcGFM
 UvWWoGl3uuCZ9MdA+D94Znra2yEBgFCGwn24eDdZb+lzdBJz7n1JsITwlOtPAAKU5Ytz
 sKQAZNO2w5iwNirOJWd6YVRZfpOmNZ57Vs9xbiZ2ClAOB9ZU6YYjxBfeNZbtu5+LIL9b
 I70ZgGaZYLjaRqdyqmaeD9z2Kh3SCfOdx3Qh32V1qXzkaEfhE+MKzDfTo/v75AWqQMrW
 8ihw==
X-Gm-Message-State: AOAM532zYT9Chw1yusxt05r3vjtd45RT3lguGK87er4CpYYhEV5T3NAd
 QrWR72iw0T1UXzIiRsJJG90IE72rbt5fmOWQ1DvNDg==
X-Google-Smtp-Source: ABdhPJwy79VyMSA73RcjIKg/DfG5nbeQ+0evZmzbRXCnNM2S59tNWP0tesvefP+1zdiF7DdHyvoWThnFhnZZdrLRuPM=
X-Received: by 2002:a05:600c:d6:: with SMTP id
 u22mr1856182wmm.133.1632733297879; 
 Mon, 27 Sep 2021 02:01:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210924090427.9218-1-kwolf@redhat.com>
 <20210924090427.9218-12-kwolf@redhat.com>
In-Reply-To: <20210924090427.9218-12-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Sep 2021 10:00:44 +0100
Message-ID: <CAFEAcA-Paf0+BvdFrT=B_jfzCNzGB6w4-7hjBeXWt0sJJYJs-Q@mail.gmail.com>
Subject: Re: [PATCH 11/11] Deprecate stable non-JSON -device and -object
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Krempa <pkrempa@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Libvirt <libvir-list@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 24 Sept 2021 at 10:14, Kevin Wolf <kwolf@redhat.com> wrote:
>
> We want to switch both from QemuOpts to the keyval parser in the future,
> which results in some incompatibilities, mainly around list handling.
> Mark the non-JSON version of both as unstable syntax so that management
> tools switch to JSON and we can later make the change without breaking
> things.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

> +Stable non-JSON ``-device`` and ``-object`` syntax (since 6.2)
> +''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +If you rely on a stable interface for ``-device`` and ``-object`` that doesn't
> +change incompatibly between QEMU versions (e.g. because you are using the QEMU
> +command line as a machine interface in scripts rather than interactively), use
> +JSON syntax for these options instead.
> +
> +There is no intention to remove support for non-JSON syntax entirely, but
> +future versions may change the way to spell some options.

As it stands, this is basically saying "pretty much anybody
using the command line, your stuff may break in future, instead
use some other interface you've never heard of, which doesn't
appear to be documented in the manual and which none of the
documentation's examples use". Is there some more limited
deprecation we can do rather than "the entire commandline
for almost all users" ?

thanks
-- PMM

