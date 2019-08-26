Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5DC9DA1F
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 01:49:28 +0200 (CEST)
Received: from localhost ([::1]:58430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2Ojn-00051K-OR
	for lists+qemu-devel@lfdr.de; Mon, 26 Aug 2019 19:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59734)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i2OiT-00049H-Lu
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 19:48:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i2OiS-0004yt-Hl
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 19:48:05 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44756)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i2OiS-0004xA-BW
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 19:48:04 -0400
Received: by mail-pg1-f195.google.com with SMTP id i18so11525389pgl.11
 for <qemu-devel@nongnu.org>; Mon, 26 Aug 2019 16:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Qg97ovKp6M6fr6vn7k4ZGE1sL7iuQpMEjXXay3ouk4M=;
 b=MF0SyuQtA3ctWObZIkT4tXqVDvij3ldYSfDlkghFZh6OVvNEocel8hyUs1S6SY87He
 OtTvtxPz3lOHc0MTIjL150rTyHuNkQngjY+4NjWkvTJfwJ0u/0ksCOX9kZccl8+FkGsj
 +55NXh9Ea5JPfRF5B/GosjkmFV8xqxj+jpTFwURnP+Cc8HSx3fy7O9zI/WVKxv9+5ovS
 rVqO5KWQykkgv8H/koQ38L6BrdxL6AdVxIo/MObnDRpKYe7QjERoZNUGIeodi3IsWoLp
 jnY88rJIg93cAeGeZ2HOZ8wfa9uowfEQr6LB/gQGkideoaxpKfgrWfByjB5OPG+PsJcw
 JwRw==
X-Gm-Message-State: APjAAAUNQBntIkErFDYygsTHdQ1BF0xpQqEL1CMkpLDlbcdtA+EgAqKp
 WFWd0/alQvAgvBFZbHMtHa7Rpg==
X-Google-Smtp-Source: APXvYqwC0fdE0AsetU0WYTna3zWcrUMdBYmcwI5hXpitibmbyx4pNcytn4x5XjkSxIWVKZ+jm1YRmQ==
X-Received: by 2002:a17:90a:1b24:: with SMTP id
 q33mr22051014pjq.80.1566863282197; 
 Mon, 26 Aug 2019 16:48:02 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id 65sm14694174pff.148.2019.08.26.16.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 16:48:01 -0700 (PDT)
Date: Mon, 26 Aug 2019 16:48:01 -0700 (PDT)
X-Google-Original-Date: Mon, 26 Aug 2019 15:47:41 PDT (-0700)
In-Reply-To: <1565960976-6693-1-git-send-email-bmeng.cn@gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: bmeng.cn@gmail.com
Message-ID: <mhng-5c1b5c56-2659-4e37-b9fc-eba7d8418083@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.195
Subject: Re: [Qemu-devel] [PATCH 0/2] riscv: Fix "-L" not working for bios
 image search path
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 sagark@eecs.berkeley.edu, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 16 Aug 2019 06:09:34 PDT (-0700), bmeng.cn@gmail.com wrote:
> Currently when QEMU is given a bios image with only a file name and
> its file path passed in "-L", it still reports file not found.
>
> This series fixes the issue. This is especially helpful for creating
> distro QEMU packages.
>
>
> Bin Meng (2):
>   riscv: Add a helper routine for finding firmware
>   riscv: Resolve full path of the given bios image
>
>  hw/riscv/boot.c         | 26 +++++++++++++++++---------
>  include/hw/riscv/boot.h |  1 +
>  2 files changed, 18 insertions(+), 9 deletions(-)

Thanks, I've put these two in the patch queue with Alistair's review.

