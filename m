Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B22A2ECF02
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 12:50:28 +0100 (CET)
Received: from localhost ([::1]:54146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxToB-0008Og-DI
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 06:50:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kxTmk-0006zY-Fx
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 06:48:58 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kxTmh-0005PH-Mz
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 06:48:57 -0500
Received: by mail-wr1-x436.google.com with SMTP id c5so5347603wrp.6
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 03:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ZuqmGMMA8FUb7dMWg1DmXuELLuKPdiYZrS8QWwwRv0w=;
 b=FKKi8TVi0r46AdndONW/K3E3PE6XrMoVPOjRUk6QyGF1olnAPqUQ08Cso+FCAS2Sxq
 OJPACg3SIOGL7sNu+gX5ZGHE+D2K8GdffJtstqCBlieO4yM1yKquQHf+qVXbwY9phxzO
 x/XH/DX74ehgAIcmxgPDcabYTAPb/5C2iiMxs3KZpo+SKp1XkWSLKSg7iL3K0Nc9E0zM
 nHLJlhSgYGVlUAmV41EhOkn/RVAZqmuBL/yfGR6IVFTFIDj2oXgz4MybWKHMUzBQ1H1o
 VM29ptyHLmv/mJzuEmNyaD/sDwbiREdhrG1nA8NU2Uq8Mn6GS3cIvmUfU4kklQ2m0a5k
 abEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ZuqmGMMA8FUb7dMWg1DmXuELLuKPdiYZrS8QWwwRv0w=;
 b=cl2rIU+K+3OfTy+JqM5rTwuTLoLnEjTTdPDz4H8OIwEPMnZkpbQLgYh/XG88H7uT0W
 Y8uBX+2BcEVyey6PPqs9+xZTj0REtDV+vPPT1jg039LBO4QUVo6g+EwL4uFWxNXFZymw
 ds2zSk8sl/QR+6GIPFLEeCa//jsz4tYrgEBL9ikeav4tz60c3yTNv1kFpr+w11phm2tg
 pnUYYdaxDSFHUEnV01hEE5p86Fyv/4NRSfxdKeGqrG6H+g+INh5x1NOdhBDNAfJwnWtT
 iGNJD7hvkE5pUv5/Hz+pbHNXRf6dp2pJ9I4aiPu6n/OvuflsCMnku+0ivgcRB8vpDPxN
 8yIA==
X-Gm-Message-State: AOAM530JeifqTFQZJtVllDhLRzga1P+oduvDxvQ+8tRgxaUn1E37zoAN
 g0NK/BqlmK6HfyIDSPdDEat6yQ==
X-Google-Smtp-Source: ABdhPJwTvLDPKPih1N7O8LYfjsBuYNi5buGcs82L5duB1odLalw85adekc3lzz9jBgtpGs6Ev1W4kQ==
X-Received: by 2002:adf:97dd:: with SMTP id t29mr8522448wrb.357.1610020134258; 
 Thu, 07 Jan 2021 03:48:54 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a62sm8230317wmh.40.2021.01.07.03.48.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 03:48:53 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B55B31FF7E;
 Thu,  7 Jan 2021 11:48:52 +0000 (GMT)
References: <20210107072933.3828450-1-f4bug@amsat.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH] tests/docker: Remove Debian 9 remnant lines
Date: Thu, 07 Jan 2021 11:48:46 +0000
In-reply-to: <20210107072933.3828450-1-f4bug@amsat.org>
Message-ID: <87pn2h0xy3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Debian 9 base container has been removed in commits
> e3755276d1f and c9d78b06c06. Remove the last remnants.
>
> Fixes: e3755276d1f ("tests/docker: Remove old Debian 9 containers")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Queued to testing/next, thanks.

> ---
>  tests/docker/Makefile.include | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index c254ac38d0a..0779dab5b96 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -108,7 +108,6 @@ ifneq ($(HOST_ARCH),x86_64)
>  DOCKER_PARTIAL_IMAGES +=3D debian-mips-cross debian-mipsel-cross debian-=
mips64el-cross
>  DOCKER_PARTIAL_IMAGES +=3D debian-ppc64el-cross
>  DOCKER_PARTIAL_IMAGES +=3D debian-s390x-cross
> -DOCKER_PARTIAL_IMAGES +=3D debian-win32-cross debian-win64-cross
>  DOCKER_PARTIAL_IMAGES +=3D fedora travis
>  endif


--=20
Alex Benn=C3=A9e

