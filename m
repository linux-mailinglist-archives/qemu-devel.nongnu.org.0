Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E483E4361C2
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 14:36:47 +0200 (CEST)
Received: from localhost ([::1]:50958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdXJP-0000rO-1a
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 08:36:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mdXGF-0008Rm-Bb
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 08:33:31 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mdXGD-0006ne-DH
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 08:33:30 -0400
Received: by mail-wr1-x434.google.com with SMTP id m22so963735wrb.0
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 05:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=cx0hOTSI/SeopA7AmLP0UXoj1IybFNPvey7T5bHTDOQ=;
 b=Om8BWquOUKJRgeA8JlACdRoyu5szGjnnqUA7jw6x7iMAwoS2W7ICbXw/TlUOfMP+kq
 rUZZbLWSjq7Zp4WQUA5ktnlzkD+h5Gk4S+D2JXm7H+kJtPt/OjbJ+Wm8UgKC/nFgKvjY
 DC+FuPPIx3iBE6KuqrW3CHnrePw0MdpMDpzuHu+xQ+dZRSgukAFyWdiatj2snlD0zl4Z
 3lF/nvcNwhFXPLzRp+vvGrCwuprw3ZwhGuphEMdXfPKRDAbyayO+KuSHyGjXWm16ujv7
 sTFaWigJiVkNBTmG5d+GOz+GfURpkTvVfmaSvgd/KuQaSAtRPtY/RcSActEcqt+Y/4pN
 /5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=cx0hOTSI/SeopA7AmLP0UXoj1IybFNPvey7T5bHTDOQ=;
 b=7FtD4tk5Qi6HiHIOsPizP4RFLxmaNZ7gjDVYYW5C5YMebSMwjQJVyfp1LnbfgJLpXn
 lKkGGK3br/38EuQbs50DWsIZNfEPnf/mVfS5J71AUbU58qnLodlGSuXklXLJSg4QMXjB
 QQgfREqFT2NHNmhHdcCrlASIEwQ0xElqrbzk9XaPL29bRPk9GwUdOmyAxbSHPWyQyHdK
 4Gk+5IJ/DNYfZH9S+VVYw5Y6D9BS8U9kFiY9S8LxMLssPHK9w8k2bA0ARTEnVb+PIJPO
 9VI2apnq6P0jkNFmLM83QJbZhNc/9ErN2olkxvVUgJ0ysoZCrbm/dBn25m+tqn1JG+yd
 W9RA==
X-Gm-Message-State: AOAM532poQbqqbEQBCqVEhqa4cmER6sT4rwu16760EP+vflc+2XJNeXH
 8qIU/nr5RdswyNOEfGJRzRyefg==
X-Google-Smtp-Source: ABdhPJzRJpOXZ8GzrmBV3ztXNuEiCqy9MRK+VRQq2/DNrJTXkpo8eBat7NyHRhqWdIp+jQjFpWJmWQ==
X-Received: by 2002:adf:a292:: with SMTP id s18mr6946907wra.42.1634819607490; 
 Thu, 21 Oct 2021 05:33:27 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i17sm5256043wru.18.2021.10.21.05.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 05:33:26 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BC53F1FF96;
 Thu, 21 Oct 2021 13:33:25 +0100 (BST)
References: <YUOssEF1lND+Rhsr@strawberry.localdomain>
 <87fsu3tppe.fsf@linaro.org> <YUpAXEYX0D27BnEA@strawberry.localdomain>
 <YUuQeSFsmM6YiBCp@strawberry.localdomain>
 <YXBN4UZvY5ESdz6v@strawberry.localdomain> <87cznzvavq.fsf@linaro.org>
 <YXCA62xdRDeueQR6@strawberry.localdomain>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: Re: plugins: Missing Store Exclusive Memory Accesses
Date: Thu, 21 Oct 2021 13:28:32 +0100
In-reply-to: <YXCA62xdRDeueQR6@strawberry.localdomain>
Message-ID: <87mtn2tv56.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: cota@braap.org, richard.henderson@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Aaron Lindsay <aaron@os.amperecomputing.com> writes:

> On Oct 20 18:54, Alex Benn=C3=A9e wrote:
>> Have you got a test case you are using so I can try and replicate the
>> failure you are seeing? So far by inspection everything looks OK to me.
>
> I took some time today to put together a minimal(ish) reproducer using
> usermode. The source files used are below, I compiled the test binary on =
an
> AArch64 system using:
>
> $ gcc -g -o stxp stxp.s stxp.c
>
> Then built the plugin from stxp_plugin.cc, and ran it all like:
>
> qemu-aarch64 \
>     -cpu cortex-a57 \
>     -D stxp_plugin.log \
>     -d plugin \
>     -plugin 'stxp_plugin.so' \
>     ./stxp
>
> I observe that, for me, the objdump of stxp contains:
> 000000000040070c <loop>:
>   40070c:   f9800011    prfm    pstl1strm, [x0]
>   400710:   c87f4410    ldxp    x16, x17, [x0]
>   400714:   c8300c02    stxp    w16, x2, x3, [x0]
>   400718:   f1000652    subs    x18, x18, #0x1
>   40071c:   54000040    b.eq    400724 <done>  // b.none
>   400720:   17fffffb    b   40070c <loop>
>
> But the output in stxp_plugin.log looks something like:
> 	Executing PC: 0x40070c
> 	Executing PC: 0x400710
> 	PC 0x400710 accessed memory at 0x550080ec70
> 	PC 0x400710 accessed memory at 0x550080ec78
> 	Executing PC: 0x400714
> 	Executing PC: 0x400718
> 	Executing PC: 0x40071c
> 	Executing PC: 0x400720
>
> From this, I believe the ldxp instruction at PC 0x400710 is reporting two
> memory accesses but the stxp instruction at 0x400714 is not.

This is fascinating but I can't replicate your results. I get the
following pattern:

  Executing PC: 0x400910=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  Executing PC: 0x400914=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  PC 0x400914 accessed memory at 0x55007fffd0=20
  PC 0x400914 accessed memory at 0x55007fffd8=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
  Executing PC: 0x400918=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  PC 0x400918 accessed memory at 0x55007fffd0=20
  PC 0x400918 accessed memory at 0x55007fffd8=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
  PC 0x400918 accessed memory at 0x55007fffd0=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
  PC 0x400918 accessed memory at 0x55007fffd8=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
  Executing PC: 0x40091c=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  Executing PC: 0x400920=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  Executing PC: 0x400924=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  Executing PC: 0x400910=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  Executing PC: 0x400914=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  PC 0x400914 accessed memory at 0x55007fffd0=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
  PC 0x400914 accessed memory at 0x55007fffd8=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
  Executing PC: 0x400918=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  PC 0x400918 accessed memory at 0x55007fffd0=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
  PC 0x400918 accessed memory at 0x55007fffd8=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
  PC 0x400918 accessed memory at 0x55007fffd0=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
  PC 0x400918 accessed memory at 0x55007fffd8=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
  Executing PC: 0x40091c=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  Executing PC: 0x400920=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  Executing PC: 0x400924=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  Executing PC: 0x400910=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  Executing PC: 0x400914=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  PC 0x400914 accessed memory at 0x55007fffd0=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
  PC 0x400914 accessed memory at 0x55007fffd8=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
  Executing PC: 0x400918=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  PC 0x400918 accessed memory at 0x55007fffd0=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
  PC 0x400918 accessed memory at 0x55007fffd8=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
  PC 0x400918 accessed memory at 0x55007fffd0=20
  PC 0x400918 accessed memory at 0x55007fffd8=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
  Executing PC: 0x40091c=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  Executing PC: 0x400920=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  Executing PC: 0x400924=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  Executing PC: 0x400910=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  Executing PC: 0x400914=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  PC 0x400914 accessed memory at 0x55007fffd0=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
  PC 0x400914 accessed memory at 0x55007fffd8=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
  Executing PC: 0x400918=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  PC 0x400918 accessed memory at 0x55007fffd0=20
  PC 0x400918 accessed memory at 0x55007fffd8=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
  PC 0x400918 accessed memory at 0x55007fffd0=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
  PC 0x400918 accessed memory at 0x55007fffd8=20

It's a bit clearer if you use the contrib/execlog plugin:

  ./qemu-aarch64 -plugin contrib/plugins/libexeclog.so -d plugin  ./tests/t=
cg/aarch64-linux-user/stxp

  0, 0x400910, 0xf9800011, "prfm pstl1strm, [x0]
  0, 0x400914, 0xc87f4410, "ldxp x16, x17, [x0]", load, 0x55007fffd0, load,=
 0x55007fffd8=20
  0, 0x400918, 0xc8300c02, "stxp w16, x2, x3, [x0]", load, 0x55007fffd0, lo=
ad, 0x55007fffd8, store, 0x55007fffd0, store, 0x55007fffd8=20
  0, 0x40091c, 0xf1000652, "subs x18, x18, #1"
  0, 0x400920, 0x54000040, "b.eq #0x400928"
  0, 0x400924, 0x17fffffb, "b #0x400910"
  0, 0x400910, 0xf9800011, "prfm pstl1strm, [x0]
  0, 0x400914, 0xc87f4410, "ldxp x16, x17, [x0]", load, 0x55007fffd0, load,=
 0x55007fffd8=20
  0, 0x400918, 0xc8300c02, "stxp w16, x2, x3, [x0]", load, 0x55007fffd0, lo=
ad, 0x55007fffd8, store, 0x55007fffd0, store, 0x55007fffd8=20
  0, 0x40091c, 0xf1000652, "subs x18, x18, #1"
  0, 0x400920, 0x54000040, "b.eq #0x400928"
  0, 0x400924, 0x17fffffb, "b #0x400910"
  0, 0x400910, 0xf9800011, "prfm pstl1strm, [x0]
  0, 0x400914, 0xc87f4410, "ldxp x16, x17, [x0]", load, 0x55007fffd0, load,=
 0x55007fffd8=20
  0, 0x400918, 0xc8300c02, "stxp w16, x2, x3, [x0]", load, 0x55007fffd0, lo=
ad, 0x55007fffd8, store, 0x55007fffd0, store, 0x55007fffd8=20
  0, 0x40091c, 0xf1000652, "subs x18, x18, #1"
  0, 0x400920, 0x54000040, "b.eq #0x400928"
  0, 0x400924, 0x17fffffb, "b #0x400910"
  0, 0x400910, 0xf9800011, "prfm pstl1strm, [x0]
  0, 0x400914, 0xc87f4410, "ldxp x16, x17, [x0]", load, 0x55007fffd0, load,=
 0x55007fffd8=20
  0, 0x400918, 0xc8300c02, "stxp w16, x2, x3, [x0]", load, 0x55007fffd0, lo=
ad, 0x55007fffd8, store, 0x55007fffd0, store, 0x55007fffd8=20
  0, 0x40091c, 0xf1000652, "subs x18, x18, #1"
  0, 0x400920, 0x54000040, "b.eq #0x400928"
  0, 0x400924, 0x17fffffb, "b #0x400910"
  0, 0x400910, 0xf9800011, "prfm pstl1strm, [x0]
  0, 0x400914, 0xc87f4410, "ldxp x16, x17, [x0]", load, 0x55007fffd0, load,=
 0x55007fffd8=20
  0, 0x400918, 0xc8300c02, "stxp w16, x2, x3, [x0]", load, 0x55007fffd0, lo=
ad, 0x55007fffd8, store, 0x55007fffd0, store, 0x55007fffd8=20
  0, 0x40091c, 0xf1000652, "subs x18, x18, #1"
  0, 0x400920, 0x54000040, "b.eq #0x400928"
  0, 0x400924, 0x17fffffb, "b #0x400910"

Although you can see stxp looks a bit weird on account of the loads it
does during the cmpxchng. So consider me stumped. The only thing I can
thing of next is to see how closely I can replicate your build
environment.

--=20
Alex Benn=C3=A9e

