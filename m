Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7EB694B8C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 16:45:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRb0N-0000Md-2P; Mon, 13 Feb 2023 10:44:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRb0G-0000Ji-Hf
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 10:44:29 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRb0C-0008Uu-MZ
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 10:44:27 -0500
Received: by mail-pg1-x529.google.com with SMTP id n2so8383685pgb.2
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 07:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676303054;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VitgINuCT2pYdX0aBpGyBSblWAGTg9vf0KH63awuwgc=;
 b=OvoP1nljw3f0gT/7q7J4hFMpO36HlapBQxpa8XVIyKgpaesanyaEPKLLeByN7SGNL0
 kalprWrFTAyriI1/CY6yKniP0Yu2UMgzedgeUrSCz2sgc2RNBkXKlijKqnWxEwnrzoFs
 RIUy9ML99OlL/GtoUsEOWAMHbF/JaKSpUqH0KZbmm5kQWwF95TYzgvsi1Ofk123sc8X5
 m2wfM6O355J+hHKVzhsZbRgFyu57SB2uj6zZFF4VtZz0SrNsFQFAz8QC9IakYCpXQrqS
 w5UbEnktSv4Z70dAymNzoXexSibrWIkRY61MDTdlx5jhx9DRTE2KjzOEa+/45pAzv/UK
 h9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676303054;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VitgINuCT2pYdX0aBpGyBSblWAGTg9vf0KH63awuwgc=;
 b=qmADf+49RiawsOENMEvLtwWuNG9fWM08zwU1rrkaQuTfRQdFYdhDcoxlewbKNBgsUs
 Y4Qzj0r7g3vxzdcyb8culL2AaVc6iHqbtr7wFdv1LIXzzejqL/MAapK3VHZ/6FQlDOW2
 3Qfhj1xO4vmfbLjUCS2EMdop94N5OAvox1Zjo3toCpW/Y5jMfywu7da9TyRMFOnc21QH
 ghOdIgwAPtO9f/LRK1YSjJwa82OT6oPSn2e6JkjvCp0xwBRbB4P80qxFoPpzJg7r+cPN
 osRxdpNqS8DbWcHle9i5Hcl/sQn7r5xv8qqDSxPdHd71z/IuXCEEBs+MvYT7cZfdX5ib
 +Rsg==
X-Gm-Message-State: AO0yUKXnJ3za5V4GDpV8LwiIoZcBZurX1EUhsz0AKoex+LDBAhRjCsWW
 BJ+cShK3yRJvSXD5ChmbDp3DO7hc/F+gQCNFw4DeIw==
X-Google-Smtp-Source: AK7set8y0LDcOx7klQRZPsYPTh4bHE2GmDKKG8IXgIPwLzLhSILff1Y3rRx87izkivwmf2He5ArHn298KLp07Bm/dik=
X-Received: by 2002:aa7:9ec5:0:b0:5a8:beb3:d561 with SMTP id
 r5-20020aa79ec5000000b005a8beb3d561mr534559pfq.17.1676303054255; Mon, 13 Feb
 2023 07:44:14 -0800 (PST)
MIME-Version: 1.0
References: <alpine.DEB.2.22.394.2302101420510.4661@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2302101420510.4661@ubuntu-linux-20-04-desktop>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Feb 2023 15:44:02 +0000
Message-ID: <CAFEAcA9kshowaoWFCPRmVy4G2dD+EqiG5cKAAgkJO63MNrEheQ@mail.gmail.com>
Subject: Re: [PULL 00/10] xenpvh machine
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 10 Feb 2023 at 22:27, Stefano Stabellini <sstabellini@kernel.org> wrote:
>
> The following changes since commit 90595cc9396bb910b148391fea2e78dd8c6c8b27:
>
>   Merge tag 'migration-20230209-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-02-10 10:50:21 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/sstabellini/qemu.git xenpvh
>
> for you to fetch changes up to 3f8ee848693872e3783cdcf2862be5421bb9cbcb:
>
>   meson.build: enable xenpv machine build for ARM (2023-02-10 14:23:47 -0800)

Hi -- 'xenpvh' doesn't appear to be a signed tag:

From https://gitlab.com/sstabellini/qemu
 * branch                    xenpvh     -> FETCH_HEAD
error: FETCH_HEAD: cannot verify a non-tag object of type commit.
Does not appear to be a signed tag

thanks
-- PMM

