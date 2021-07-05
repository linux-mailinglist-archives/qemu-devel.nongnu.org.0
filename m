Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E35293BC360
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 22:29:29 +0200 (CEST)
Received: from localhost ([::1]:53758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0VDc-0006js-W2
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 16:29:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0VCs-00064A-Az
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 16:28:42 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0VCp-00054d-Ox
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 16:28:41 -0400
Received: by mail-wr1-x435.google.com with SMTP id u8so23394867wrq.8
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 13:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Yb1Kauj8G9kNGh7dORRL6ZZ7peF0OLdZziZXg7IBduU=;
 b=EHGOm212XAqxA/qOK0s1d/X6UY1zqF3IgaNrn0pCEUsIo5fK4krSA0ZlhnU0O8hqS/
 vx9i+s6l7UC+RrUCIjznvNWx3sLFXaaqVorgA/JGiiZYoM2jNuyrgCb9ksYTsnMUD5Bj
 5X2nqXYjK8/qRodC2LSDwue7aW+ZAJ/2Ay5+Mw4FCSHSouz4qO/PMyXn/Vtaat+vp9n7
 NclaJQecRkOCq1WMDzD0XADJDjZbcQlgV/J3RPoRPUCU1kg5h9pMDZUV9h4YlPQFOIat
 T9qbC1IPn/ltWVM53uc+3Jzc/zolws7K0ufFNfEs3A1WSn0zUrUMGpXFiGvnBNy+31wV
 KkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Yb1Kauj8G9kNGh7dORRL6ZZ7peF0OLdZziZXg7IBduU=;
 b=EAu3nWcpvl4eGqf3598YMQyH+hzv1UXh9NAWm/Qqqc8td2TlSgiTo2KJh4PHScf34Z
 8HzKLBaqO6jpUK5JjljtiFoPccUNARrrbBNvEBLEnSEsrlWNs23DXeGUbGXK/UY9nl7+
 6c3gyLgicNY7unc5WISNJEMDvTV7feXbIQwL6bgZtLSedFnEwNxN4jD5ZzTnn4EbGEOR
 rLKGiY5QRE0qalKYc6ONEDuWY8g/n3OtVf0HbXnG5jdYaTxkg4CRY+9owtvqRqXzE6nC
 8Tvx7MpJ34LKV/p7knAFIxPdSRgrhW3ngpyFLsxfbh0ha/iFQ1AOvBEp67xLKfOdo8K4
 iABQ==
X-Gm-Message-State: AOAM533agPQ0nHvjFX+YBxQCmeKbZRnzsr4sUCU507AIH0E8rmrYQUq3
 s98p/p6+ivjkhJM3K+SnxaQ7ag==
X-Google-Smtp-Source: ABdhPJznUPRuj4/pGPTNPbB41IIhv/h4zMA33rpQhZyvzbadtJdD+wSoxHDupLy6zRs8oEgzAQayHg==
X-Received: by 2002:a5d:4846:: with SMTP id n6mr17801362wrs.72.1625516917562; 
 Mon, 05 Jul 2021 13:28:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t11sm14603032wrz.7.2021.07.05.13.28.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 13:28:36 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 29A521FF7E;
 Mon,  5 Jul 2021 21:28:36 +0100 (BST)
References: <20210623142245.307776-1-berrange@redhat.com>
 <20210623142245.307776-12-berrange@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v4 11/22] tests/docker: expand centos8 package list
Date: Mon, 05 Jul 2021 21:27:56 +0100
In-reply-to: <20210623142245.307776-12-berrange@redhat.com>
Message-ID: <87wnq4tsi3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> This is the fully expanded list of build pre-requisites QEMU can
> conceivably use in any scenario.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  tests/docker/dockerfiles/centos8.docker | 68 +++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>
> diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/docke=
rfiles/centos8.docker
> index 5f1c57b4ad..4cc4c0c8a1 100644
> --- a/tests/docker/dockerfiles/centos8.docker
> +++ b/tests/docker/dockerfiles/centos8.docker
> @@ -3,36 +3,104 @@ FROM docker.io/centos:8
>  RUN dnf -y update
>  ENV PACKAGES \
>      SDL2-devel \
> +    alsa-lib-devel \
> +    bc \
> +    brlapi-devel \
>      bzip2 \
>      bzip2-devel \
> +    ca-certificates \
> +    capstone-devel \

CentOS8 doesn't seem to package capstone-devel or is it meant to come
from somewhere else?

--=20
Alex Benn=C3=A9e

