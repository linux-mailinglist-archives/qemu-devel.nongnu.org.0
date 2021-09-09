Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE950404485
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 06:39:07 +0200 (CEST)
Received: from localhost ([::1]:44286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOBq6-0004aO-UE
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 00:39:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mOBnj-0002P2-2k; Thu, 09 Sep 2021 00:36:39 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:37877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mOBnb-000727-4L; Thu, 09 Sep 2021 00:36:38 -0400
Received: by mail-yb1-xb31.google.com with SMTP id r4so1333289ybp.4;
 Wed, 08 Sep 2021 21:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rn34bvr4KMNo3slHsFSbxrpRcE17nLdKPhLxljmipJA=;
 b=K8RD/tRlK0PWBgf4/tAgZgjzgIZR18zeMbBejsbS3EcfzQbFB6Jk1sIorMeQDFtNvu
 0AZ+RX5ZRZRHB1dtXLfZl0dkUrHIJTsKmYJdE3tZ2wO2KlIGL2XG2aJ48kk7aOEtOtQ6
 IDBp+qOgcQnti3q8KpLaW2PMjMAQsgjkY3R4RJmKEvtwYHKj0ekfHxAritXvOxc62Xk0
 nqM3YeuO9z2FsJ+aTQUFyrVNtKTM8bxXu7lUNZCfLzc0FCldrycbai0C9HnN7BKEzUpd
 yl2KLfxa6/xnEPB/opQoaApGReA9b8hB2y5a1lPSAR3TbWFNixctn0SkPJVxU1Tx7z0y
 iAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rn34bvr4KMNo3slHsFSbxrpRcE17nLdKPhLxljmipJA=;
 b=OVmP0Ha5QYiSB9ZPJMkkq8kpLTtFCwfQLcn95MHo1vKPKdvhf91ZjfHBJ0UIhQ4TZi
 ZZKvZ+kKYt6SQ1yfErtk98nsN8IWDJwI7Qk+fnSh7N0Hjfh57J6mYMqAU1j/OIx5TX7c
 nTqfZMGKRmROsM72gahnM6WPcdrKLsSokjFor83H3rY92oUREvxIX5PNI70TVY/2iepS
 aJSCyeNfoHp4r0C7C2aJbsOt4UBBSeaEYyfw+ZM/hhVUo8togmFVZQuyNlhlexPnogcC
 cgXLmmcBR6dVH+uwrdfImZTFqAK0aX0sV8FkNLFnQbUGj0sySlabBxcw7AfBXgww1Hq8
 9ivQ==
X-Gm-Message-State: AOAM531HN8dvScg/s4o/JkAqCaOTVqDDN/ZIIXXpfdhCLXkdpiGaJAin
 s2bzrb5jpDsttr8SU74/6aEn58uvE+NEazO2OZ8=
X-Google-Smtp-Source: ABdhPJw+7MkbN+8cjAe6149HQ2It7uYusfCA8xCnIa3gJCjm0tZwWF9m8eZl1a/O5unp+qgw9LNC3GtifkKMiYgxktY=
X-Received: by 2002:a25:ad52:: with SMTP id l18mr1206915ybe.453.1631162172329; 
 Wed, 08 Sep 2021 21:36:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1631159656.git.alistair.francis@wdc.com>
 <9f70a210acbfaf0e1ea6ad311ab892ac69134d8b.1631159656.git.alistair.francis@wdc.com>
In-Reply-To: <9f70a210acbfaf0e1ea6ad311ab892ac69134d8b.1631159656.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 9 Sep 2021 12:36:00 +0800
Message-ID: <CAEUhbmU4w3atyrQcLvg5wt48vAO4sLLknUVBCVutEr1UN4RvLQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] hw/timer: Add SiFive PWM support
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 9, 2021 at 11:55 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> This is the initial commit of the SiFive PWM timer. This is used by
> guest software as a timer and is included in the SiFive FU540 SoC.
>
> Signed-off-by: Justin Restivo <jrestivo@draper.com>
> Signed-off-by: Alexandra Clifford <aclifford@draper.com>
> Signed-off-by: Amanda Strnad <astrnad@draper.com>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  include/hw/timer/sifive_pwm.h |  62 +++++
>  hw/timer/sifive_pwm.c         | 467 ++++++++++++++++++++++++++++++++++
>  hw/timer/Kconfig              |   3 +
>  hw/timer/meson.build          |   1 +
>  hw/timer/trace-events         |   6 +
>  5 files changed, 539 insertions(+)
>  create mode 100644 include/hw/timer/sifive_pwm.h
>  create mode 100644 hw/timer/sifive_pwm.c
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

