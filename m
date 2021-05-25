Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDFF390002
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 13:31:19 +0200 (CEST)
Received: from localhost ([::1]:36016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llVHF-0007TN-Dq
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 07:31:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llVBW-0003S0-RG
 for qemu-devel@nongnu.org; Tue, 25 May 2021 07:25:19 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:42548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llVBT-0003Gx-Ke
 for qemu-devel@nongnu.org; Tue, 25 May 2021 07:25:18 -0400
Received: by mail-wr1-x42d.google.com with SMTP id x8so31806283wrq.9
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 04:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=XARvnOCvb5g+LcI7J+KbKWF9i+0I4Y5vLAg4AI4IXrQ=;
 b=Lv3ZzylaJLpfkChV9sGM8jWMQzOLYAE+bPdXyUx2NqD0c814b0N4U8qr12tdkBclJi
 ATenv+ZDnEEcKCjbO/Ka9DcgGoAVcC5lVluufiuNiS3fSWipkoQeAjdXFJh5e+DTbmC8
 hHfzUsqB2wF48Nr1vv+Fw+ZNkQrWufKX630kJFLx8cqcvroLJnwbxf5FDiy49pi1gbZ9
 n6Ko+pJwyJ9bSKmspZunT1aoCNpaGnXFqxXhONhNaCHnZseapUC0YVkvp012iqv1DzBs
 NnSochWDIE+hVbpmjhJ0wrvN5E5Bc5z603TgR45mnzc/cFRRe3jrmvF7cNfSpl7xIrJA
 tg9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=XARvnOCvb5g+LcI7J+KbKWF9i+0I4Y5vLAg4AI4IXrQ=;
 b=HsEeYAZ2wiKB8IUCSgbtYD5teeB+7oKx8hzlbBukCP/Bk9iKphb3B4YNkrBdcnWJ6h
 wAfbejbNywzy6n/DXacFMFN9n/S+ZeL3LzyM9S5JyqfB2+AsZpARGAcYcyC1QU0sfYd3
 OMFIaYsTZTS0MOeIZsa+Xjq6Jynz3ZFZjEK8X1HEH5c/Q3QNSDijihwjkCvlsfRMhuUe
 b0i85rprI+IiOjzoF5hacNPCPQUBrhnipWDkiRfSbHxbKlXFkFDdZ8kW3quvYGIqdXsN
 TUOp7qRP+ocWdGu0/e4D6wDQWfFjB0e1svGvyYZomyr/TyK3Ol/Xz5Iyrg0U06NhxvuL
 koRg==
X-Gm-Message-State: AOAM5304nmJxW3M2Ii+N6xLJfn/ZfZKwQpmihxN/qMfxTAjIcwE92WVV
 hrs1nTGvNbgrnXW/dXnNL7cOEg==
X-Google-Smtp-Source: ABdhPJxH2hJhcvwoDfpZt/Zl4UDxNuknbzNtspCV3V+qKQWK/V7lcki7jVIpTziIXaDr0MhHDrg0lg==
X-Received: by 2002:a5d:6ac9:: with SMTP id u9mr25220471wrw.290.1621941913779; 
 Tue, 25 May 2021 04:25:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q20sm2658269wmq.2.2021.05.25.04.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 04:25:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 585751FF7E;
 Tue, 25 May 2021 12:25:12 +0100 (BST)
References: <20210525082556.4011380-1-f4bug@amsat.org>
 <20210525082556.4011380-9-f4bug@amsat.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 8/9] gitlab-ci: Run Avocado tests manually (except
 mainstream CI)
Date: Tue, 25 May 2021 12:25:05 +0100
In-reply-to: <20210525082556.4011380-9-f4bug@amsat.org>
Message-ID: <87o8cz2gyv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Due to a design problem and misunderstanding between the Avocado
> framework and QEMU, Avocado is fetching many asset artifacts it
> shouldn't be fetching, exhausting the jobs CI timeout.
>
> Since Avocado artifacts are cached, this is not an issue with old
> forks, which already have populated the cache and do not need to
> download new artifacts to run the tests.
>
> However this is very confusing to new contributors who start to
> fork the project and keep having failing CI pipelines.
>
> As a temporary kludge, add the QEMU_CI_AVOCADO_TESTING variable
> to allow old forks to keep running the Avocado tests, while still
> allowing new forks to use the mainstream set of CI tests.
>
> Keep the tests enabled by default on the mainstream namespace
> which is old enough to have a populated cache, hoping we will
> keep this cache long enough until the Avocado/QEMU design issue
> is fixed.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

