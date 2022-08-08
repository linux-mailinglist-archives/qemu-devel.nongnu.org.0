Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7AE58C749
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 13:09:14 +0200 (CEST)
Received: from localhost ([::1]:60716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL0dF-00036L-E5
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 07:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oL05K-0002cg-5n; Mon, 08 Aug 2022 06:34:13 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:35357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oL05I-0002GF-FD; Mon, 08 Aug 2022 06:34:09 -0400
Received: by mail-pl1-x632.google.com with SMTP id y1so2540007plb.2;
 Mon, 08 Aug 2022 03:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=DeVYaj7uSNsCkDlnQqMl58pnDhVkolhQFiPB11T3pC0=;
 b=a4DK7BPG+xc+DHj+oVBesUO7ndE3EgekyDERQyXd7h41+WB6CiGi5N64NfHg8RlPUG
 m05YE8gHO1y82yafw1PA7F4QqmJJOVrMYK5wMVgYmYJHXQoQYzjIFM6QzysjiFqwNxvN
 z0sK44n/NxWbzNoox2rNAnn/shtsU0zs5yMikO8KM5pS7B+QYzxshdVWpZMP7rwmPMn7
 Z5+J+OEz9IXlWiLtCkj8ZKG+gMP2Totgc1WWI7BY7L0Fa5Pc1hGCmdmyOFHLyNl1vofI
 UrKdjC3N1lwGTWwqCw27HJ/6jHnU/28JUb7bnKUbCyxJFNGIaq04RLTz9h4MnRUucs06
 3TgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=DeVYaj7uSNsCkDlnQqMl58pnDhVkolhQFiPB11T3pC0=;
 b=eyuM+JAG4QIvEKRDv3E3Jw3nNa/Tm6g8m2jYm7/3OHl1KflxmSaM18JaAwU5L+tpfq
 jieSIMDrg08eL49dnjAfpdBQhv59VkK48KcBc6egNmRVecMLIMCr7JXByxZe5it+SVd8
 lv6NHAYkP5FOpU7OcuKZRkpdGnKiHpJMqz+JLybmELJW3vS8KQ0vFgD97+cIBjxE9EbT
 ej5++HqbgaWeDsCA6bSBHAWHfqwe12nMbRJh3Fb+b8zR9Mz5orodc4CMILY9G5k77+Fm
 uiyikt4C5EDWWWvmv1hxI7PU4dDAH7GQKshFbRFR1+q70hE9yJ99g/GK+Ku0nPg92UDg
 zMjQ==
X-Gm-Message-State: ACgBeo3EjRQEXupqoAZXqr9/7rwLOtCxq66Ka2F45Ay0JeLMdZcQcEyQ
 NjRE94iio+0qj9NP61u3+3aebe1GA9Y8p/gOZXY=
X-Google-Smtp-Source: AA6agR5oIOBIx+4wx1xdvvxlwj6jW21PX1iSNAuBeA3udvn0eklStUFpl1TXAvSmmCIy2rW8DmbxOhWf9RZXsOk9HXM=
X-Received: by 2002:a17:90b:3b49:b0:1f4:df09:d671 with SMTP id
 ot9-20020a17090b3b4900b001f4df09d671mr20155464pjb.129.1659954846622; Mon, 08
 Aug 2022 03:34:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220808080116.2184881-1-cyruscyliu@gmail.com>
In-Reply-To: <20220808080116.2184881-1-cyruscyliu@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 8 Aug 2022 20:33:40 +1000
Message-ID: <CAKmqyKPvvY9WGz1xRmn4-mS4JTzfZ4PK7aawDaaW53+n0y2UNQ@mail.gmail.com>
Subject: Re: [PATCH] xlnx_dp: drop unsupported AUXCommand in
 xlnx_dp_aux_set_command
To: Qiang Liu <cyruscyliu@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Thomas Huth <thuth@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 8, 2022 at 6:09 PM Qiang Liu <cyruscyliu@gmail.com> wrote:
>
> In xlnx_dp_aux_set_command, when the command leads to the default
> branch, xlxn-dp will abort and then crash.
>
> This patch removes this abort and drops this operation.
>
> Fixes: 58ac482 ("introduce xlnx-dp")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/411
> Reported-by: Qiang Liu <cyruscyliu@gmail.com>
> Tested-by: Qiang Liu <cyruscyliu@gmail.com>
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/display/xlnx_dp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> index a071c81..b0828d6 100644
> --- a/hw/display/xlnx_dp.c
> +++ b/hw/display/xlnx_dp.c
> @@ -532,8 +532,8 @@ static void xlnx_dp_aux_set_command(XlnxDPState *s, uint32_t value)
>          qemu_log_mask(LOG_UNIMP, "xlnx_dp: Write i2c status not implemented\n");
>          break;
>      default:
> -        error_report("%s: invalid command: %u", __func__, cmd);
> -        abort();
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid command: %u", __func__, cmd);
> +        return;
>      }
>
>      s->core_registers[DP_INTERRUPT_SIGNAL_STATE] |= 0x04;
> --
> 2.25.1
>
>

