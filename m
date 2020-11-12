Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4FC2B00A1
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 08:56:34 +0100 (CET)
Received: from localhost ([::1]:43630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kd7T7-0001wu-Qf
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 02:56:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kd7Rj-0001U1-FJ
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 02:55:07 -0500
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44]:36062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kd7Rh-0001a8-Gc
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 02:55:07 -0500
Received: by mail-yb1-xb44.google.com with SMTP id l14so359548ybq.3
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 23:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dpQDQnaD1kMqTZ96qQLns0r+Skgg40ZqGYZum9uZVtg=;
 b=KPnIYNrsSWr0xV7tIsHnCaJkcSTVzzu8XyEOZdxq/C5hC5RERtGppuqUwwcYwmWX1K
 pdV0nVuZgHxDt0Nvw4hFnAq+hmgy+byZXrKROesNZD18vLRQwPj+0igl8jWj99YYxrlI
 AEFhupRp7VBxHEVGUQLM9sTsLnZ2pY2JxEFIB8+YPW12lNEcjG5wQ+oikZUUZOezQ/iO
 kVsDrvSebywAxyQfQVNAAUlv85HFdfVi/xxlnDt28w5U8pBgTwWwsd0LYqYlRgz8VLHT
 UBLzcShwJskFuMfgS8SQw+IiTpnWQSfC2d74067nWJNtenKVf75MC7lxYcjDL/Ix2foW
 0HoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dpQDQnaD1kMqTZ96qQLns0r+Skgg40ZqGYZum9uZVtg=;
 b=B3oP321WqLsrucYyAmBmEP4CTEt6MzAHMMDKnTqccmWJiWdquBWYj63B2BYZbKDr/9
 PBBFeYRKnTbs8tSK/RDCwp30wPg3MHS/3Sbtn+giEkW1MiBRaM2Pq7IoN9Rgou8MM/h8
 NctU4ZEBXpyL/JefSJ9IJnhVv6e8teFvTdiFDTMaM4hdcWwCkq7Z/UotcSeOS6oIpVLp
 dmRpmhplc2kU62XJoFEq7rG1rl+IevN9p8lAd2jJgTX0oMbd3QpX48lKDcWYMmJc2qe0
 bZPBH5pO+Bx4kQma77JPZ4TLsUz+kPxi97rm4sLX9uUaWiBsqsP/xv8f5GA/fiKIcr8T
 aT2g==
X-Gm-Message-State: AOAM532Wes58XTsiIZCJeh2hjkMzdskveJ/pYb2jCwl53EdswYE1tFuI
 /CVtQ9YBBOSTovyBRUbJEyX014qL/xCWO6SzxcU=
X-Google-Smtp-Source: ABdhPJy91xyfJUFJot2Y/RgLKyoLLjFDpWy2Ja++gj9nbY9W8G6dxVfX5+S4m8l3NwPfQe7E3EtLZuGk3esiw1pfO6Y=
X-Received: by 2002:a25:7355:: with SMTP id o82mr31799642ybc.122.1605167704404; 
 Wed, 11 Nov 2020 23:55:04 -0800 (PST)
MIME-Version: 1.0
References: <20201112074950.33283-1-vitaly.wool@konsulko.com>
In-Reply-To: <20201112074950.33283-1-vitaly.wool@konsulko.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 12 Nov 2020 15:54:52 +0800
Message-ID: <CAEUhbmUbbT=9Gb27aOAVzgrGP8UCwT3bsd2-fAVdihN0qbL+bg@mail.gmail.com>
Subject: Re: [PATCH v2] hw/riscv: microchip_pfsoc: add QSPI NOR flash
To: Vitaly Wool <vitaly.wool@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b44;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 12, 2020 at 3:50 PM Vitaly Wool <vitaly.wool@konsulko.com> wrote:
>
> Add QSPI NOR flash definition for Microchip PolarFire SoC.
>
> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
> ---
>  hw/riscv/microchip_pfsoc.c         | 21 +++++++++++++++++++++
>  include/hw/riscv/microchip_pfsoc.h |  3 +++
>  2 files changed, 24 insertions(+)
>

Reviewed-by: Bin Meng <bin.meng@windriver.com>

