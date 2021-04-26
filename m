Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA3136B13C
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 12:07:26 +0200 (CEST)
Received: from localhost ([::1]:55240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lay9E-0006h0-P1
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 06:07:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lay5q-0004bZ-ON
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 06:03:54 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:52753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lay5n-0001hZ-2M
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 06:03:54 -0400
Received: by mail-wm1-x32d.google.com with SMTP id g65so493402wmg.2
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 03:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=eikHqw6dMaFm+MmsjY59irhljCbax8l+9Jvb/aq0SFs=;
 b=Pp3OiK/vpZ25RVNwk0yj/N/qKsaLEpT67NAlYkpwV/kVKM13sPlOpMuQlFrqdD0O+/
 UauM9IuiTLoBHSsas4+gAmDnGan1TxwO8kxbtxR0H/D7y3hG3kfb1WGRmlzWgGQB0vVx
 5HGqdK2SXiGVB2/jyZS04omyAIkduxY2FJsYi+O/FMKDOtdewlAreejdpgmlTw+SvlUH
 8MsZIXSzn+/PFBs6LMzqusCD7Qbkfr8MW4x4+WWAONhQzN6EHIS19IWkJxaqErawK4E5
 MIE9ks0SDCOGHVXLRagUakbJxuEqSMZXur6HCvLW4bbhXUfkaX9CFgHw4hI8IKZW/Syv
 0MfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=eikHqw6dMaFm+MmsjY59irhljCbax8l+9Jvb/aq0SFs=;
 b=NNKeq3we3L0KkNPUBgwYA1KcqL5ySM97xhSynyhkcPb1z705dCyEYbEj/wXnq7mZdy
 JhY/dfS9xbpDiVP7ms1VFBs9M7KNWr0ak9DzgY5+oebvPSFmiTEcZAolZkwW+67CU3F7
 rrVl6ugjTdCLNg0/RkFbFnT5kRkWjrk64vE4ZN+LwSWqt+2oCVGbSERcfYg9TI2kBcVF
 X2+YrnEW7cU3Fl4mgXexbmAzcBdZbbhhh86NC8mxr6INayFgxnqCebt9J9Z2rD5opzLU
 B+d8YxqRIDPqeoIUijPoA1OVz0vTOXl6n22Jpv1UrosLuzIX/zRdxlTdX1AI15WaPwYv
 mjtg==
X-Gm-Message-State: AOAM530AZKHdOEp3ivYtiH/ZkDQ8dBMBIpRRs/T2LKQo+biabBi3lpBP
 RdgadBNgBPaAZHsBhT5q4NXxgw==
X-Google-Smtp-Source: ABdhPJyWxjjF8w/bFdy6kFchGsFqmsdWvELD4Rqi88tme16irJpaHZL5f5O3OAnS2FM/5hJPmYdrIA==
X-Received: by 2002:a1c:f313:: with SMTP id q19mr18640965wmq.142.1619431426389; 
 Mon, 26 Apr 2021 03:03:46 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f24sm19790909wmb.32.2021.04.26.03.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 03:03:45 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E90E01FF7E;
 Mon, 26 Apr 2021 11:03:44 +0100 (BST)
References: <20210423205757.1752480-1-matheus.ferst@eldorado.org.br>
User-agent: mu4e 1.5.12; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v3 0/2] tests/docker: tests/tcg/ppc64le: Newer toolchain
 to build tests for PowerISA v3.1 instructions
Date: Mon, 26 Apr 2021 11:01:35 +0100
In-reply-to: <20210423205757.1752480-1-matheus.ferst@eldorado.org.br>
Message-ID: <87bla1tla7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: gustavo.romero@protonmail.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, bruno.larsen@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


matheus.ferst@eldorado.org.br writes:

> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>
> This series adds gcc-10 based images to enable the build of tests with Po=
wer10
> instructions. Then, to put it to good use, a tests for the byte-reverse
> instructions (implemented in 9d69cfa2faa7) is introduced.
>
> v3:
> - Fixed field 'needs' of powerpc-test-debian-cross-container in
>   .gitlab-ci.d/containers.yml
>
> v2:
> - Unused images removed from tests/docker/Makefile.include,
>   tests/docker/dockerfiles, and .gitlab-ci.d/containers.yml
> - Nested ppc64-* and ppc64le-* cases in tests/tcg/configure.sh
> - Fixed inline assembly usage and unused header removed from
>   tests/tcg/ppc64le/byte_reverse.c
>
> Matheus Ferst (2):
>   tests/docker: gcc-10 based images for ppc64{,le} tests
>   tests/tcg/ppc64le: tests for brh/brw/brd
>
>  .gitlab-ci.d/containers.yml                   | 13 +++---------
>  tests/docker/Makefile.include                 |  5 ++---
>  .../dockerfiles/debian-powerpc-cross.docker   | 12 -----------
>  .../debian-powerpc-test-cross.docker          | 17 +++++++++++++++
>  .../dockerfiles/debian-ppc64-cross.docker     | 11 ----------
>  tests/tcg/configure.sh                        | 20 +++++++++---------
>  tests/tcg/ppc64/Makefile.target               |  7 +++++++
>  tests/tcg/ppc64le/Makefile.target             |  7 +++++++
>  tests/tcg/ppc64le/byte_reverse.c              | 21 +++++++++++++++++++
>  9 files changed, 67 insertions(+), 46 deletions(-)
>  delete mode 100644 tests/docker/dockerfiles/debian-powerpc-cross.docker
>  create mode 100644 tests/docker/dockerfiles/debian-powerpc-test-cross.do=
cker
>  delete mode 100644 tests/docker/dockerfiles/debian-ppc64-cross.docker
>  create mode 100644 tests/tcg/ppc64le/byte_reverse.c

Queued to testing/next, thanks.

It should be noted the GitLab CI run still skips these tests due to use
of debian-all-test-cross which is still debian10 based. As long as the
maintainer and interested developers still run tests locally this
shouldn't be a major hole in coverage.

Once bullseye goes gold we will be updating all our test images in due
course anyway.

--=20
Alex Benn=C3=A9e

