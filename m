Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3739835DE43
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 14:06:40 +0200 (CEST)
Received: from localhost ([::1]:35766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWHoV-00085p-Bz
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 08:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lWHlI-0005so-H6
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 08:03:20 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:36776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lWHlG-00021i-IC
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 08:03:20 -0400
Received: by mail-wr1-x433.google.com with SMTP id m9so3447821wrx.3
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 05:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=FOs8ZW1e8xrwZKThkRrC+OQIctET2/vrsW4YBYhiUfA=;
 b=kKSWC4RMc3gcDOYaF1CWywWxKDuDC9wer82OX6Za2QSTGtUhPOV447nuXK9Znc+zxH
 8502pVTtgGD4uyxVbxQ4mEtC1rB0QCsyEY7WIH42O8P54buf2ULlcHq2EPiAjennoNJf
 zovBmxXahcWcatEM4glsRtYJ/lxK9rrDMwviuwr3VsFq831tKmp9FoeilzVv6egoGKfW
 nbTZ1DVIpSwlnTYB7vKC2LSDl8B+nD+9ICHsRhZJR5Ht/jRfo+CBIL462CpC26E3Kh//
 AsjHKEQov7NnE7Ab3wmBzctdB1/gg7Gi1IgmbDQMDRk1Hep3aGTFD0uw74p+4ooslL0L
 fUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=FOs8ZW1e8xrwZKThkRrC+OQIctET2/vrsW4YBYhiUfA=;
 b=OgW843YMPTYx8wJIw8s/Vz3mhYlDSTh7w95piKJyIxOZSd88brd5o69EjuzKGxiad5
 hbmpbJjK0q93vA2LxLDTJOnoX4MQEEDJrqMzJIfjbgtXljsYGfFDfveXAZyGGq3yr9HF
 YffHvunNlhop1EqoQ8H32YBYINz7+Y7UUInH2VIuDLPPIq880fQrTuXPjSi5WA2atSF0
 ddV73B7CN/6Fu+1xNllioE0AXh9mAbfk9U2s4u2uFXM6jFAtjtOwNJBWC2koRyBIJP4E
 QzePPujktUpf0kUCNiN3mhlq9cYgrUpq65ZHrmRseN/nr2Ja9eHropbgDrOr2O7HWYQA
 CBmA==
X-Gm-Message-State: AOAM533nW+MiMSCw3Ko0gfN+xiCC12nTUiarLjveklaGgW0H6AeQw4d2
 Flf/t9OAf5MIMhp4NIwXu7QTI/5wYvhXHQ==
X-Google-Smtp-Source: ABdhPJyU8DYnqK9/AvzqJZhxP4gy1mndg0mx5ATYVsdwoJ+kK2ShW5HSgnBxttHHQu57acV/t1XM0w==
X-Received: by 2002:a5d:4592:: with SMTP id p18mr38758049wrq.244.1618315396156; 
 Tue, 13 Apr 2021 05:03:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a3sm21108642wru.40.2021.04.13.05.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 05:03:14 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 79CCE1FF7E;
 Tue, 13 Apr 2021 13:03:13 +0100 (BST)
References: <BN7PR02MB4194DF5752EF3BADE858018DB8799@BN7PR02MB4194.namprd02.prod.outlook.com>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Brian Cain <bcain@quicinc.com>
Subject: Re: testing/next - hexagon toolchain update
Date: Tue, 13 Apr 2021 13:02:32 +0100
In-reply-to: <BN7PR02MB4194DF5752EF3BADE858018DB8799@BN7PR02MB4194.namprd02.prod.outlook.com>
Message-ID: <87czuymlxa.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Brian Cain <bcain@quicinc.com> writes:

> Alex,
>
> You are the one maintaining the testing/next tree at
> https://gitlab.com/stsquad/qemu correct? The current patch series for
> hexagon under review requires toolchain updates. These changes to
> llvm/clang landed in the last week or two.
>
> Can you apply this patch?

I've applied to my tree. I didn't get it in this cycle but I'll post a
new testing/next for review in the next week or so ready for master to
re-open.

>
> ~~~~
>
> From 68547357c895934796e9b4687338bb9e39ac86c5 Mon Sep 17 00:00:00 2001
> From: Brian Cain mailto:bcain@quicinc.com
> Date: Thu, 1 Apr 2021 10:32:24 -0500
> Subject: [PATCH] Update llvm-project commit
>
> clang was updated with new inline asm registers for hexagon, this is
> necessary for QEMU test cases currently under review.
>
> Signed-off-by: Brian Cain mailto:bcain@quicinc.com
> ---
>  tests/docker/dockerfiles/debian-hexagon-cross.docker | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/docker/dockerfiles/debian-hexagon-cross.docker b/tests=
/docker/dockerfiles/debian-hexagon-cross.docker
> index b6fb651..1d19e8f 100644
> --- a/tests/docker/dockerfiles/debian-hexagon-cross.docker
> +++ b/tests/docker/dockerfiles/debian-hexagon-cross.docker
> @@ -24,7 +24,7 @@ RUN apt update && \
>  ENV TOOLCHAIN_INSTALL /usr/local
>  ENV ROOTFS /usr/local
>
> -ENV LLVM_URL https://github.com/llvm/llvm-project/archive/3d8149c2a12286=
09fd7d7c91a04681304a2f0ca9.tar.gz
> +ENV LLVM_URL https://github.com/llvm/llvm-project/archive/bfcd21876adc34=
98065e4da92799f613e730d475.tar.gz
>  ENV MUSL_URL https://github.com/quic/musl/archive/aff74b395fbf59cd7e93b3=
691905aa1af6c0778c.tar.gz
>  ENV LINUX_URL https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.6.18.=
tar.xz
>
> [2. 0001-Update-llvm-project-commit.patch --- text/x-diff; 0001-Update-ll=
vm-project-commit.patch]...


--=20
Alex Benn=C3=A9e

