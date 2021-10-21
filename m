Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DE5435BCC
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 09:34:41 +0200 (CEST)
Received: from localhost ([::1]:44180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdSb2-0002V5-23
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 03:34:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mdSZG-0000fC-Dd; Thu, 21 Oct 2021 03:32:50 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:44783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mdSZE-0002VR-TQ; Thu, 21 Oct 2021 03:32:50 -0400
Received: by mail-qk1-x72b.google.com with SMTP id a13so6270232qkg.11;
 Thu, 21 Oct 2021 00:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4ebt9aX5WS14mBwTiikqyjzGpnq3NbbXX28kKxTwdrA=;
 b=OG+CwTJVO6odG7oZ5WCxPvVipKmTWeg+hhz+DoBldS2MG3LDwr0KznGfinspEZyKSL
 /F3rKkb5XMYC7hmGpcMMy+0gO9nhWThBDtAphuDqBIXVG0WokLNzAQy6SmZODv0Xnkdy
 NJCwcns2KbaS1iXlWkKSU+IC4lbxXx2nijIAUFGEOJGgVH9BVB08NvSxwql757rwNJs+
 xqqdDMO/QMDYVVlJat+6+SRsILd7N19al4p988iox0e75n6VgTuuv39ZJ3egYNUQOkEJ
 Nksv1ED9pzh4K7tuU6haqXN5zjoF/8pbTfjiWHTgVPtuANYdRYJtpqFjLl8Pk7+nr13l
 OLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4ebt9aX5WS14mBwTiikqyjzGpnq3NbbXX28kKxTwdrA=;
 b=QzEsF2rla6tSC7rqGugoeR39AhEqJY0ABIWSjeAL5BHW7bB/n7jMZxKRW6UStH2ZHp
 iX4+EaJRKXeylGsf1K2TDOSrCcm5VCOLEAepzCd4lA4dOF1BFBPT0Y8hl8QDr16LFfJm
 6rIZHflMF1aEpcQ5LEGvXO/GiPqrcEMC1DZU+3nzPBttzVuQDnDWY+vYwuLIXOZlDgt8
 duc70SOBF4JWAo9XcWCw7tYwGmR9x3Mi+pdBZVBFhCPu4nCOpzQECuxLaOzOVdKyWCg2
 WFglvL+UqTfAGfSa0jl9PyUf35hC17Y1QsckKUTLtAVIpOC+bY9YHppE8jzfe8BbYPFt
 yicw==
X-Gm-Message-State: AOAM5313AvJN6ygmAIVJv0xrlrmfNKgHibJatjhVR2JF0/sL+NrsTGWH
 I4faRFVxZ4QgGsiGRpB1jlgra0Hpql55AwFegd8=
X-Google-Smtp-Source: ABdhPJy964FZ/MNZTLTmKSfczjRx9S2qWWPuVEBc8omxLFGH2opdRhXmRE7sOgcp++M91LbFKakHlye4SrH00NkLTK4=
X-Received: by 2002:a25:346:: with SMTP id 67mr3968142ybd.345.1634801566429;
 Thu, 21 Oct 2021 00:32:46 -0700 (PDT)
MIME-Version: 1.0
References: <18b1b681b0f8dd2461e819d1217bf0b530812680.1634524691.git.alistair.francis@wdc.com>
 <b94c098cb221e744683349b1ac794c23102ef471.1634524691.git.alistair.francis@wdc.com>
In-Reply-To: <b94c098cb221e744683349b1ac794c23102ef471.1634524691.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 21 Oct 2021 15:32:35 +0800
Message-ID: <CAEUhbmUdVUABcTcqojR0iB1ErroooUuyYzH4Z_O2fG1z_NWKtg@mail.gmail.com>
Subject: Re: [PATCH v1 4/9] hw/intc: sifive_plic: Cleanup the realize function
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72b.google.com
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

On Mon, Oct 18, 2021 at 10:39 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/intc/sifive_plic.c | 45 +++++++++++++++++++++++--------------------
>  1 file changed, 24 insertions(+), 21 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

