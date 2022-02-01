Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AFC4A5580
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 04:13:40 +0100 (CET)
Received: from localhost ([::1]:52328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEjbv-0006uo-Tm
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 22:13:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nEjZn-0004rJ-DC
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 22:11:27 -0500
Received: from [2607:f8b0:4864:20::d36] (port=37577
 helo=mail-io1-xd36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nEjZl-0005eV-VN
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 22:11:27 -0500
Received: by mail-io1-xd36.google.com with SMTP id n17so19540186iod.4
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 19:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hECvO/2qE6OongYKCkHfspcTgSblOn+GwKmItv8xfB0=;
 b=pOuWgfSiDJrwiT9Kewx3hcYA1PxeLxP55kVcz48wF2YjBh6qeSHoP7A0DZ1Jc5wfFU
 9lN3+TvmwIkz7wnV94v/aqgTDT3qQPOtPK4rDHXURqw9wHDvDnhCG997sfDHR2PCiEi1
 D/4JaqXMvmh/1Y2kgBi+eQWlf2iHkwrXHUTNsWFuUaPAzSQNqxzC+Ua4Y5QmQ84sTNK1
 VmGzCok6ksJrXAMeoiNDx687FWZe25Ub81/CEuzsJLepLpDCrGvXVlJ2ozESf07lzeNw
 XD1b1aouTFgVqzhJ0DUiqC3XxCJn+LexR/b/E4sZBc8Yn1AmqgchUIUHYyjJ90ch2u6J
 rwIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hECvO/2qE6OongYKCkHfspcTgSblOn+GwKmItv8xfB0=;
 b=dSsAchYdJ9yNXc/XphhumQEUloVvQl7HGYK+sScT3v0qAqfhZoZsafR7tveE7jjEQQ
 ahbmJphZ7VG8sQLd4ljDnETEJP7W0o0uKSQz3b+06ypdccIfpLHE2Ka8ZDdd8XdPfTsc
 axar462X9wjr2L5WGPmOV1o7zXXOH1jfRwyhEi3niUbB+i55R/y86h7IlUIPYN7EwQFV
 hgKNa0tJDYaBGdu9uHstG0Svl4NMbynGNQ/dltRI2AiDuUfDnux83BYloaDbaIkND1m2
 yZlcq5h3Ng760XuKZNv7lDTgYyX3i+ZRxhJS70aGZxdH7yJ29mh0fVBetXGJnYPFZqxi
 digw==
X-Gm-Message-State: AOAM533oK38Z5RPOE21UXQ+lqFl4uiCwyAlSooyZRs1bgG2/Vv4YCpsl
 J0EyV6xXKXqB+xMbwg4DleRHIeSB+FCBfoYvdSo=
X-Google-Smtp-Source: ABdhPJy8eovvrbhECiruA5HRybFWWyaiQGg5mfrun2v9BcceO2BmaXwaYhuTYPf7RWE9292j6G66/HIONsjoxprtPFE=
X-Received: by 2002:a05:6602:727:: with SMTP id
 g7mr13061764iox.90.1643685083624; 
 Mon, 31 Jan 2022 19:11:23 -0800 (PST)
MIME-Version: 1.0
References: <20220131110201.2303275-1-philipp.tomsich@vrull.eu>
 <20220131110201.2303275-8-philipp.tomsich@vrull.eu>
In-Reply-To: <20220131110201.2303275-8-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 1 Feb 2022 13:10:57 +1000
Message-ID: <CAKmqyKOOtEv14vOs6UzVhghkUW_vsjKZV3dBTJdiL8BDiBUykg@mail.gmail.com>
Subject: Re: [PATCH v5 7/7] target/riscv: add a MAINTAINERS entry for
 XVentanaCondOps
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Greg Favor <gfavor@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 31, 2022 at 9:24 PM Philipp Tomsich
<philipp.tomsich@vrull.eu> wrote:
>
> The XVentanaCondOps extension is supported by VRULL on behalf of the
> Ventana Micro.  Add myself as a point-of-contact.
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
> (no changes since v3)
>
> Changes in v3:
> - add a MAINTAINERS entry for XVentanaCondOps
>
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b43344fa98..2e0b2ae947 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -286,6 +286,13 @@ F: include/hw/riscv/
>  F: linux-user/host/riscv32/
>  F: linux-user/host/riscv64/
>
> +RISC-V XVentanaCondOps extension
> +M: Philipp Tomsich <philipp.tomsich@vrull.eu>
> +L: qemu-riscv@nongnu.org
> +S: Supported
> +F: target/riscv/XVentanaCondOps.decode
> +F: target/riscv/insn_trans/trans_xventanacondops.c.inc
> +
>  RENESAS RX CPUs
>  R: Yoshinori Sato <ysato@users.sourceforge.jp>
>  S: Orphan
> --
> 2.33.1
>
>

