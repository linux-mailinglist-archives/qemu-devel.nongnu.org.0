Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA5A2C0EF1
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 16:38:38 +0100 (CET)
Received: from localhost ([::1]:48584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khDvJ-0000xs-1p
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 10:38:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1khDto-0000TD-Ra
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 10:37:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1khDtn-0005IE-65
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 10:37:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606145821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FvWrZYVj60QjKxYyTFc0gtmk5KPGKBlnjgYVLiU1SMU=;
 b=YR1hKb+VY5vdY0wDC9/v2xAbX+3KFSYAd+lbnBugerBJEGvCQKoGuBD9ouoKVbAtL0xuCm
 AGFx5p54uAWzQBeh56j5cGrM5GX3cMGQyGQC3DcVFLLmcbbGkgdEU+EPDyEjechOXMS07m
 wGoAx8Fkuzzs71xZICdw2uVepFbnOI0=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503--tY9FbQKOJmNY0JFrB1nWg-1; Mon, 23 Nov 2020 10:36:59 -0500
X-MC-Unique: -tY9FbQKOJmNY0JFrB1nWg-1
Received: by mail-vs1-f70.google.com with SMTP id n16so3087902vsr.17
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 07:36:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FvWrZYVj60QjKxYyTFc0gtmk5KPGKBlnjgYVLiU1SMU=;
 b=mfHapPaSlC2N40h8c/T7tSypAPZ4uAVMYCPKD+kmn4EVaIydUef9jVRixx/egSYOal
 dU7kWnQPvOsFIFyOBZjl+PxE2kFkehUJsUDrQBW/Eqqv5aMQ73rMDhlEGdPXFYQFDDq5
 hl3MlY7cNP705iju4mb9yYVJbTO7tHMkzNSQE2kTeuVxNeNnk0u4CIAB9WNpx3V7PWCQ
 NcWx1ksYoqy66v2PkkNflnE3OW9Pg8W4s7BbY4b4ae8NNgD5xchHg/N8s+hc8cy1OfMS
 +24CRzrAcAkPl5Yr1+Vff+hvoeGE6M2LLylU4dVRLcUM6DZg9V7VJdmO8TKhVoNQR0qd
 H2IA==
X-Gm-Message-State: AOAM530sHkACT+e30QQyRNcfayenEtCmJgX/YaWaVJMXvsHy2s3vaY2b
 GS8afJ4yGdhrUTp/dz1N4DnR4B6URjosRahAAVUqCMDWEteVTWQOexrtf590wET0BBvs2fmhb93
 gFZ24RTD6gO8ovKZPyuQYmLDmYXW37t0=
X-Received: by 2002:a67:f255:: with SMTP id y21mr115568vsm.50.1606145818752;
 Mon, 23 Nov 2020 07:36:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyeimXqKLuGr/PgyyNtLw5BrrkdQTvlLUjVRAi8V6vkRF4toMZy3TJwPRKdpfqaILaBHI4ScY3aUi8tJiMcvic=
X-Received: by 2002:a67:f255:: with SMTP id y21mr115552vsm.50.1606145818590;
 Mon, 23 Nov 2020 07:36:58 -0800 (PST)
MIME-Version: 1.0
References: <20201108221925.2344515-1-philmd@redhat.com>
 <20201108221925.2344515-7-philmd@redhat.com>
In-Reply-To: <20201108221925.2344515-7-philmd@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 23 Nov 2020 12:36:47 -0300
Message-ID: <CAKJDGDatq_wisvHP-So5v7h71m8KS624n60WXahEYZpzPCz=mA@mail.gmail.com>
Subject: Re: [PATCH v3 06/11] gitlab-ci: Rename acceptance_test_job ->
 integration_test_job
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Nov 8, 2020 at 7:27 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  .gitlab-ci.yml | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 0ef814764a0..d4526323169 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -42,7 +42,7 @@ include:
>      - find . -type f -exec touch {} +
>      - make $MAKE_CHECK_ARGS
>
> -.acceptance_test_job:
> +.integration_test_job:
>    extends: .native_test_job
>    cache:
>      key: "${CI_JOB_NAME}-cache"
> @@ -89,8 +89,8 @@ check-system-ubuntu:
>      IMAGE: ubuntu2004
>      MAKE_CHECK_ARGS: check
>
> -acceptance-system-ubuntu:
> -  extends: .acceptance_test_job
> +integration-system-ubuntu:
> +  extends: .integration_test_job
>    needs:
>      - job: build-system-ubuntu
>        artifacts: true
> @@ -119,8 +119,8 @@ check-system-debian:
>      IMAGE: debian-amd64
>      MAKE_CHECK_ARGS: check
>
> -acceptance-system-debian:
> -  extends: .acceptance_test_job
> +integration-system-debian:
> +  extends: .integration_test_job
>    needs:
>      - job: build-system-debian
>        artifacts: true
> @@ -150,8 +150,8 @@ check-system-fedora:
>      IMAGE: fedora
>      MAKE_CHECK_ARGS: check
>
> -acceptance-system-fedora:
> -  extends: .acceptance_test_job
> +integration-system-fedora:
> +  extends: .integration_test_job
>    needs:
>      - job: build-system-fedora
>        artifacts: true
> @@ -181,8 +181,8 @@ check-system-centos:
>      IMAGE: centos8
>      MAKE_CHECK_ARGS: check
>
> -acceptance-system-centos:
> -  extends: .acceptance_test_job
> +integration-system-centos:
> +  extends: .integration_test_job
>    needs:
>      - job: build-system-centos
>        artifacts: true
> --
> 2.26.2
>
>

Makes sense, thanks!

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


