Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CFD38B561
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 19:43:13 +0200 (CEST)
Received: from localhost ([::1]:41784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljmhU-0002gj-DJ
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 13:43:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljmgJ-0001On-As
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:41:59 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:34494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljmgE-0000O6-BY
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:41:59 -0400
Received: by mail-ed1-x52c.google.com with SMTP id w12so12632256edx.1
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 10:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1SPEDuuUTBsAFkEqt2Y2fYzKz+eIiXbiNpYUjzy1x5Y=;
 b=tmAnGCX+SpNZ5TpNFXDK1EM9Thvgk+0sSH3xjP9C9kmPjxQWm7gPjkxyfHLBmYJxGS
 d0t9OU8O0YITIKzR5tJ7I+sUIpU59/nr//LI6NeKiEDH7K4379aDE4tCSSdf79ZKiNbU
 PMW8udq59zgY4JdoiJOKlgMEYm3sdfK/F2YwSLZkMPKT9jWdOz7mq4MlnkXN7Ime4Dnz
 BKNmN0VNCWzENvR43RaqP4HSeoTR+GJJLWoRMHiBWUmnPrh5uFGcvZFhHiIVOR9iYBd0
 MuPq2zvCKKvpr13mrHwbu/gedagyJv9zheyBmSEexbDlNWgu+clm3Qr2C8aSo64BpMnH
 YXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1SPEDuuUTBsAFkEqt2Y2fYzKz+eIiXbiNpYUjzy1x5Y=;
 b=SN+O0zDpv5UxdYgnfzH0qhX6HKPU19yJBTS6ZiAEt3XEMr38gpsdfoNJ8TAKT/Abkw
 PvpUIGEVR8iviK5wajiiyGeARKNm4+etsK7EJDhdkqhguCm1FbsDG0C1QBOAa+xPG9Or
 grSYjJA7At12bVLZ1TcVfBfOAQKUVN7aMlpzXKegLeRinZY0e+3HRdCHe7CUSznR3ir9
 JBDzeHTlMP5lEFQJ4bwEe9VRTwRsLgKlFDz0n8X+GiEhohSqaoshKAGz83ejCiuKXNQT
 cLiPTXXDJJzyozkZ0eOoeDZ5WEeQ06D9AliOnXGOu7uH4L2SxI76HqGGAbaAGakVr6hP
 mIog==
X-Gm-Message-State: AOAM5319+FgDn8zSAsVWqn0lldjcrTO+U3fLTK+gejbT9ozAaePWRMcz
 GI/T9pRKw8+hJHUFcDCaR1x/zo+7RWJF6mEVJEz42g==
X-Google-Smtp-Source: ABdhPJwgoG9idud5sd2wNoGGzj3n7Lr/cdSZp21QDfjgGHTG1Z/ebYRPRcFJi974Hx9Bt0UEhgrQ2HVjhoXLXMQtgyA=
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr6077934edd.251.1621532512649; 
 Thu, 20 May 2021 10:41:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210512171720.46744-1-imp@bsdimp.com>
In-Reply-To: <20210512171720.46744-1-imp@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 May 2021 18:41:34 +0100
Message-ID: <CAFEAcA8D5wBzrMx16280wZWmtX8Ug6mQJBCa7-TzGTFMtZCdNQ@mail.gmail.com>
Subject: Re: [PULL 00/20] bsd-user style tweaks and start cleanup
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 12 May 2021 at 18:26, Warner Losh <imp@bsdimp.com> wrote:
>
> The following changes since commit f9a576a818044133f8564e0d243ebd97df0b3280:
>
>   Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-virtiofs-20210506' into staging (2021-05-11 13:03:44 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bsdimp/qemu.git tags/pull-bsd-user-20210511
>
> for you to fetch changes up to afcbcff80bf81a3399e24c7908b17776e1489df9:
>
>   bsd-user: rename linux_binprm to bsd_binprm (2021-05-11 13:53:52 -0600)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

