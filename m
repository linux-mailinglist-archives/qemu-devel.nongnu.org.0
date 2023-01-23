Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 897E36773CA
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 02:30:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJleI-0004tN-7C; Sun, 22 Jan 2023 20:29:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pJleG-0004sV-MC
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 20:29:24 -0500
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pJleE-0000gl-SL
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 20:29:24 -0500
Received: by mail-vs1-xe29.google.com with SMTP id i185so11384156vsc.6
 for <qemu-devel@nongnu.org>; Sun, 22 Jan 2023 17:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0c5EN37PcOwrkhoLD/2Ns1XK+lRpHl0nqCWCM/stGtQ=;
 b=Rs8wGgL+IYzVzX2CihVejjYPPT+MwJ3CvmOBUJSMcgyiY0XujlJ1Lwf8zjEvggKxzS
 cELCUHMnbVfC0vx9DLmrdr2nN1J2TeskfHG6mQ8/T9bhrdy8kotqyB/xo+9FhECdKVV5
 Xyq1pKwFXGPnzEXP25a9Gap0svQfWV9yDDJsVcw1deB9KWoq0yFY5T6hhQo8ZlmRL+mn
 W4CEBNGR030uGncF5gFcAbRwG2baPXX3mAxlby5crVHNBv/Y1rRKTgtB65hg8kWVRA5t
 SSrFUAdM3frN9GUK0iC2PsCx9Ahewk5uEzd8vz08/EQYVadD/67H9iuHAftrPogH5zuy
 rG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0c5EN37PcOwrkhoLD/2Ns1XK+lRpHl0nqCWCM/stGtQ=;
 b=Oc0sjFajTD9ZbX06irAyKarcNUaFWUjGFQdCWdSgHUvo/42I/8uss7cAuDv0YsbjeF
 bG1rZ8I9Ovtq3ZTa8dzBIA3WaYpJ5qLfOENJ1S4ZIhUDqngenzPhVEGQIUszd4+IKpba
 1KYfTxG4BNc0pOK+JmdzxGqYVcM9r0FV/glEJK42KeLqdi6kkaRyi9vw7kMLngkqzXaR
 HXUquKm8Kng9z/t84DnrO//BXo0oIVck44wDf9WG806QytDhI+6qChrDh2+eog4zqCve
 VSLlJO2kaGG/CDoPMdZjN4wF1pFs9aCm5l/YGcIHsjDXrZavZTG87LqVee2I/iQjjGvz
 bYKQ==
X-Gm-Message-State: AFqh2koBzFpfdDKuBajRSwfuCEuMNo9iXyDwt7xtoZdsOAMKVfpT2o3E
 dcMRt4ve8UkI3SIEUBUuQ01aohjN50ZUehYb+iU=
X-Google-Smtp-Source: AMrXdXtcgZkOdSyXNjCFYGhigE7KOiRxyIwCr1/qaMTRxkMHwIdOkJeI543CI/q4n2ervS0NjJ1SGwkkdpMEa0iWuxU=
X-Received: by 2002:a67:e14a:0:b0:3d3:f10a:4f56 with SMTP id
 o10-20020a67e14a000000b003d3f10a4f56mr2979852vsl.10.1674437361941; Sun, 22
 Jan 2023 17:29:21 -0800 (PST)
MIME-Version: 1.0
References: <20230121023542.1726168-1-philipp.tomsich@vrull.eu>
 <20230121023542.1726168-2-philipp.tomsich@vrull.eu>
In-Reply-To: <20230121023542.1726168-2-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Jan 2023 11:28:55 +1000
Message-ID: <CAKmqyKOQbeLwDuMNKjV5Pfk52pxHLVEviKZ+7gmopgxFE9WKQQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] target/riscv: redirect XVentanaCondOps to use the
 Zicond functions
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Cc: qemu-devel@nongnu.org, Kito Cheng <kito.cheng@sifive.com>, 
 Christoph Muellner <christoph.muellner@vrull.eu>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe29.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Sat, Jan 21, 2023 at 12:36 PM Philipp Tomsich
<philipp.tomsich@vrull.eu> wrote:
>
> The Zicond standard extension implements the same instruction
> semantics as XVentanaCondOps, although using different mnemonics and
> opcodes.
>
> Point XVentanaCondOps to the (newly implemented) Zicond implementation
> to reduce the future maintenance burden.
>
> Also updating MAINTAINERS as trans_xventanacondops.c.inc will not see
> active maintenance from here forward.
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> ---
>
> Changes in v2:
> - Calls into the gen_czero_{eqz,nez} helpers instead of calling
>   trans_czero_{eqz,nez} to bypass the require-check and ensure that
>   XVentanaCondOps can be enabled/disabled independently of Zicond.
>
>  MAINTAINERS                                    |  2 +-
>  .../insn_trans/trans_xventanacondops.c.inc     | 18 +++---------------
>  2 files changed, 4 insertions(+), 16 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ca914c42fa..293a9d1c8c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -305,7 +305,7 @@ F: target/riscv/insn_trans/trans_zicond.c.inc
>  RISC-V XVentanaCondOps extension
>  M: Philipp Tomsich <philipp.tomsich@vrull.eu>
>  L: qemu-riscv@nongnu.org
> -S: Supported
> +S: Odd Fixes

Should this extension be deprecated then?

Alistair

