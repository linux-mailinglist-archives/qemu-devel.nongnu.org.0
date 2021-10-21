Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF3D435D65
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 10:55:07 +0200 (CEST)
Received: from localhost ([::1]:57534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdTqs-0002eB-8O
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 04:55:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mdTpC-0008WJ-0g; Thu, 21 Oct 2021 04:53:23 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:40848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mdTpA-00018y-7z; Thu, 21 Oct 2021 04:53:21 -0400
Received: by mail-qk1-x733.google.com with SMTP id x123so6846837qke.7;
 Thu, 21 Oct 2021 01:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fXLA/63xWvgAjSUU0F8HHo3Kh2+SdvNCIvJsLObc6ro=;
 b=IzjiPhxOhHDcl819Hh4hLS/F4vgkvC9td47oLRn/GtpTgmFJ3OVWKTqvRyU7S9F0Yi
 0mvKyRa3w5ba+/v06iWPya0Mwmm/RsLrV12XDDXnppUpDClEKNFALUw9mkmCkmBbNOna
 8IjGx+fUG9hSKTJJgm2NyrVjeQ9zhp6+zj84qJblztEjJV+drOe+Z+NmC0bl37mQcLq6
 MiKsa/+ySIKdLd6SClf3Zmc/3QpE7rDTP/xMlwLCFV4dgRkLbWp0sq/+xTi3LjC5O309
 9mguQzunSUE5AaWPh/F6vJfwenzKL7N0AORoJkuGc9RGf46prknbe0wljlOpM+Jv7lQu
 uC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fXLA/63xWvgAjSUU0F8HHo3Kh2+SdvNCIvJsLObc6ro=;
 b=1vBJrpB1v+V2dizqcKhhaoqTVZ0+/aJ0TT4YY4/kWDVwnzkx7GCDaHRKPF+xjt8mya
 6pVj3p8KiugGo2F2BR7lnb0qidWPDFUVkSc0pBahtlhSBX5eBsivJZpcUhiRDjaM7Tt5
 wTUUe+fvxs8r0+uRn/3HNMPD8+5znhWi/XAEp+DdaXArnyiUH7ppkH/9hsADPvtrlubH
 EOXo1BVKksiacif6Zhq2ckzApjKMzNsCQafT584i9BQKz63NWTLpsX9b14j9y/9WIgvc
 B7hH3R134DCpn10mYZ7gxbCbxRV2EHG9nIRkmCZ6RV3KIEan20DBlvJlkGnyrqjbDfiw
 3eWQ==
X-Gm-Message-State: AOAM530ossLnYotGGPrBc+vH+ozf/0s/niCG/VkiNc8NTr68cntL6LUH
 Waj+PN4RGJwpygmg4S8Yj2VTbJtdGYD15ADcCQs=
X-Google-Smtp-Source: ABdhPJyyRwADKjaUP6lGQJ8A46mZ7SN9F4fElWvJwd75T5P+uvMyTCtgBXVM8T47bh4JnH7FAfazrfMwZth/oRcTQ3w=
X-Received: by 2002:a25:c0d2:: with SMTP id c201mr4856285ybf.467.1634806397901; 
 Thu, 21 Oct 2021 01:53:17 -0700 (PDT)
MIME-Version: 1.0
References: <18b1b681b0f8dd2461e819d1217bf0b530812680.1634524691.git.alistair.francis@wdc.com>
 <3daa501cf8ea5c10a887474ab9f899124ad779e1.1634524691.git.alistair.francis@wdc.com>
In-Reply-To: <3daa501cf8ea5c10a887474ab9f899124ad779e1.1634524691.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 21 Oct 2021 16:53:06 +0800
Message-ID: <CAEUhbmXOsan-EQFTwOTHcy5c230gHsQPh=+vQihPA0MKzpYfZg@mail.gmail.com>
Subject: Re: [PATCH v1 7/9] hw/intc: sifive_plic: Cleanup the write function
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x733.google.com
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 18, 2021 at 10:40 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/intc/sifive_plic.c | 82 +++++++++++++++++--------------------------
>  1 file changed, 33 insertions(+), 49 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

