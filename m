Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A6B903B3
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Aug 2019 16:11:31 +0200 (CEST)
Received: from localhost ([::1]:56776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hycx0-0006fw-DO
	for lists+qemu-devel@lfdr.de; Fri, 16 Aug 2019 10:11:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41797)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1hyclR-0003dH-PP
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 09:59:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hyclQ-0003mc-Or
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 09:59:33 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:42881)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hyclQ-0003lL-Fw; Fri, 16 Aug 2019 09:59:32 -0400
Received: by mail-ed1-x542.google.com with SMTP id m44so5188230edd.9;
 Fri, 16 Aug 2019 06:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LEjiUDOb+hTxmzXiEjUa11B5LYGalHGyzZrRkJMp7wM=;
 b=daYMnMemZYX6hIRDzEV9sZJ3dUDY20zR6/PgQ8F56j3fcPwkOxxaBXTvB0R/2TaGBi
 b3wfu6DMcj8PH4urAtBCXr+hD+yGbWeF+HIcQr4XtgeJI2JFmo3aSn8zXZTztM//njno
 SNz24idu8TiB9EvTzCvQvUGt5gdBlxIwN+tvZe+RP7IXoloQoY1o1XgHjm9QkomgYc7q
 9jhSm0teWuKgEzL3rNPsCzkKyWQYQEGGIqxc3AS/iVcG2KRLkjcPFWgXAUEESXD/UWx0
 saMTaagf5umqf9NwqFFdhbaEN2BeyfS3JC/hZjNcABhiOFVh71psiRdZhP2BOB7Nkxy7
 uImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LEjiUDOb+hTxmzXiEjUa11B5LYGalHGyzZrRkJMp7wM=;
 b=mZooH2PLEwULiUmqxex0vsc1XypZRCMtIWLUrmRq0B+6gaTObwEyVTmfd5wdmb8vAM
 kh8+9WGiobtGqodQNuR+yX3dZuutWDzXtQnOSDrVmlKKTtl+gZ0DB6xqzzLPToVeMGN6
 cqyqRJY2NPzKvGF+5uiOhD6lFM3A/PGkZRtcE3hyM9WwUEsv1MZef+TIMQ9vHp2Tz5Q8
 wxYxB0ArvoWt4FkEPSbh55F0pHQX23YlluOXpTAGZmeim/vdiCsKL7zfaj90omDpXi59
 gvpa5Xys5gwxbJQ9X+9g9VUsHo+HRAYX+6HO7HKoKaYNKk5H8P84cOMBakyYTKMxgOUz
 UiXQ==
X-Gm-Message-State: APjAAAX1iQUoAS7XN4SMIa20ptGb5RJVYnAnMTVLMySVqV9MN9xosRMr
 cHMw0LiVsW90RvOfm4BcyoXXS79XDvyVmDvuNEE=
X-Google-Smtp-Source: APXvYqy80Zt+BcclFPvWd0zd29W3I6fwKt2p6yml4iEK40FulYGXhl2SwIrfdrZZizBz755i7YVXPtIZ5xjLFpp7hTk=
X-Received: by 2002:a17:906:32c2:: with SMTP id
 k2mr9338357ejk.308.1565963970807; 
 Fri, 16 Aug 2019 06:59:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1565904855.git.alistair.francis@wdc.com>
 <4c3b0d0df95674ab0c049b75506f3ee3237ea14b.1565904855.git.alistair.francis@wdc.com>
In-Reply-To: <4c3b0d0df95674ab0c049b75506f3ee3237ea14b.1565904855.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 16 Aug 2019 21:59:18 +0800
Message-ID: <CAEUhbmUKmvnh0mHiMJD2sXeV1Pv9pbvifye4AEFTr62TPTw32g@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::542
Subject: Re: [Qemu-devel] [PATCH v3 5/7] target/riscv: Use both register
 name and ABI name
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
Cc: Alistair Francis <alistair23@gmail.com>, Palmer Dabbelt <palmer@sifive.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 16, 2019 at 5:48 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> From: Atish Patra <atish.patra@wdc.com>
>
> Use both the generic register name and ABI name for the general purpose
> registers and floating point registers.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

