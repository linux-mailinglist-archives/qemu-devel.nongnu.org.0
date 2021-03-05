Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED99332F302
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:44:49 +0100 (CET)
Received: from localhost ([::1]:55058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIFRR-0004NK-0S
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:44:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIEyz-0007gx-Oy
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 13:15:25 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:38016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIEyx-0000CU-Sf
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 13:15:25 -0500
Received: by mail-ej1-x636.google.com with SMTP id mj10so5258682ejb.5
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 10:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ne4GAY1NMm+pBxICtr0n9rS65futHHjyEkAiDqM5a/o=;
 b=I8vQxuiAy1OKkhz4GYBshDkE7MOjs3dRTUIpj/VtRYNlUkJ4pBLuemAZLHIo2Zs8iK
 F4Ce6kSTOIj+uXnO14Aad6uSz9+FwVI2OtaJpfkAzyayf/OLYsczH1cwIjYYWglu+hCW
 84AcjijWI7ZQP2FE9tirfe8LAPSudq8BolKi223z78Q0cRMHhK47km4eT1TZLzdlhVKR
 CATVNAJANRJAEHH+HJTORxswU1oL8DB/q7hQlIUfrO1eGfy4lr6D+llmgSmvBxozcqrD
 q2zoyU/qlxw1GE7PAb8Nu+Lzxg6l9ltHCH0XqJri6AmDahf+pII/1TsBvQ2iXFDP07V+
 b31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ne4GAY1NMm+pBxICtr0n9rS65futHHjyEkAiDqM5a/o=;
 b=qqUHjnD8seX4koBpoBfMWW3kPmyM9ZcqJwd79n7z9+FRLkdWjPdr91bHzqvgkYa3zp
 VDjjmincnRBgihZOUa0iTgQTg81jISk07OboYuhKMKVY1H31aDnTEAQEhPm8l+ryPf8+
 axAoxiDi4DnldRMvICu7BbhfGwdH/50DzM1NsgoeitR5ekmiw1nVBkgJ2MAoaKxgbbZH
 ruHUTtuZSRX9fX6O8ctMASx4yPZPerzatHjI6AFF5b71/JkqJrEd9vsB4B9krzILP/oz
 GtIkC4iNUg/X62n1UZdDwQQuUP8WrebR0hK+KgYWJiUxpz/RdA2U1DvnBw0KMfIs5qBt
 NzEw==
X-Gm-Message-State: AOAM532SsqX0cetvCAVQ7LPgqiui5Cl90wJG06KtoHZOZHURDmmSvSJc
 5721VPLGGCOa33coe4N4c2Dla4GUSponcHXG1+nbAQ==
X-Google-Smtp-Source: ABdhPJye27gf0LTVRRXZ/xDRLml9h0xGFcAAvFsYS64dYhb0GJfEkRzZg32wgWcFRLZ/zjz8yi4S72vMshTwZFtevns=
X-Received: by 2002:a17:906:1ecc:: with SMTP id
 m12mr3441838ejj.4.1614968121986; 
 Fri, 05 Mar 2021 10:15:21 -0800 (PST)
MIME-Version: 1.0
References: <27dfe8eb-adce-8db4-f28b-c42858b086db@msgid.tls.msk.ru>
 <CAFEAcA-d811Ou-Ks_c_j4kPnD2DrUSfvUYwfsOgonazj16RokA@mail.gmail.com>
 <e6048b19-2759-edfa-f129-8438341e07aa@vivier.eu>
In-Reply-To: <e6048b19-2759-edfa-f129-8438341e07aa@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Mar 2021 18:15:05 +0000
Message-ID: <CAFEAcA9UMcVGkN_uhVcdjwPghuQFSiSZJJ=9NQ0eoVZYCYTFog@mail.gmail.com>
Subject: Re: RFC: linux-user: preserving argv[0] of the original binary in
 context of binfmt-misc
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Mar 2021 at 18:07, Laurent Vivier <laurent@vivier.eu> wrote:
> Le 05/03/2021 =C3=A0 18:53, Peter Maydell a =C3=A9crit :
> > Alternatively, if anybody has a bright idea for how to get the kernel
> > to tell us how it's invoking us (ELF auxv entry???) maybe we could make
> > a proposal to the kernel folks.
>
> My patch has been merged in v5.12:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D2347961b11d4079deace3c81dceed460c08a8fc1

Ha! I must have seen that before and forgotten about it but
my subconscious still remembered the part about the ELF auxv...

thanks
-- PMM

