Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 483EA663FB3
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 13:03:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFDLQ-00017o-Uh; Tue, 10 Jan 2023 07:03:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1pFDKo-00010U-PA; Tue, 10 Jan 2023 07:02:41 -0500
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1pFDKh-0001aR-GD; Tue, 10 Jan 2023 07:02:25 -0500
Received: by mail-lj1-x232.google.com with SMTP id o7so11863277ljj.8;
 Tue, 10 Jan 2023 04:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gnbzpvoQ4eKeeZKYsWILJWo3UH7620WiiCMoShR6aSY=;
 b=jkuAY340miTrtxnx65h4km4PzgRMtM+JbKmzPtBuU/odg5CCO16uDiWAFBpKbZLnqB
 +LVkuswdAS0wdlbDfRsR/7aShP1oG0U0m6fiBUxdYpSNJfTYfMHfCh/T/KPEfxFIG9M9
 AzGvaUsFBuQNxlnkuv51mtsLAXvP2ug/iS8PyUzAjLKhts24yBbjTs0F07yaETtjy5hc
 WYIAaiEu6Nsr2ttgrNqCx/DM3zRMUVf93f4DP3aLz3z1E6qQ2rK+wZB2z5fb3OQTjMW+
 a+UClFQB2mxdD3nzF7Ef4HNGcCqS2QaLTJDFmbDbmRDSgcAZbSr9c2ya0etOQ404+zVI
 Swsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gnbzpvoQ4eKeeZKYsWILJWo3UH7620WiiCMoShR6aSY=;
 b=KNz+oYAswPmqHk0xcc6QhJqJnl+c000nJkzq0ghBNs5wCTnipppY4nG4rF0hquUhyR
 GiJSn7E5HNv2VQcTGhEoGlKvkuNr7N76PrMmyOj1GAKiO6j2+PdLXtwXJfqh/ctt7222
 /6xbtRbYnirCypghtDPu1tpGEQBIsJTPysthknMXlWByrMUpsL1fhof+3hUh8XOUePDW
 hHqq1jRJLH1KFnxSvwBnIcXopPdUyZSuC1nsOwo/u5xkN/DAe3F0rXbw2vHLVumZdoE0
 ClATQo1Lo60GJnJRF0UuGW/MXv3/UdV+1YU7yFwIDcr3oMwn2DnsL+j8ohYMxavQ72bd
 yLqQ==
X-Gm-Message-State: AFqh2kotjN7LXe4pitHMkg/fLuI0gLPeBLhmHY/5trD83NApYVXRsgAz
 dz2IOTKJ/L9t93K+wuG/nIQ=
X-Google-Smtp-Source: AMrXdXsgLjwEu3yvLDT+aZ17Tvijv9pRFMqZHnoWESN+w0LTm6aezF0B+vTsfRpgVPIJUIKyRg/AKw==
X-Received: by 2002:a05:651c:10d:b0:27f:e6e7:7e36 with SMTP id
 a13-20020a05651c010d00b0027fe6e77e36mr11021340ljb.21.1673352136695; 
 Tue, 10 Jan 2023 04:02:16 -0800 (PST)
Received: from gmail.com (81-232-4-135-no39.tbcn.telia.com. [81.232.4.135])
 by smtp.gmail.com with ESMTPSA id
 bg20-20020a05651c0b9400b0027710117ebdsm1283990ljb.121.2023.01.10.04.02.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 04:02:16 -0800 (PST)
Date: Tue, 10 Jan 2023 13:02:15 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Qiang Liu <cyruscyliu@gmail.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>,
 Frederic Konrad <konrad.frederic@yahoo.fr>
Subject: Re: [PATCH] hw/display/xlnx_dp: fix overflow in
 xlnx_dp_aux_push_tx_fifo()
Message-ID: <Y71Tx4ODBZr1HnML@toto>
References: <20230109055933.749233-1-cyruscyliu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230109055933.749233-1-cyruscyliu@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Mon, Jan 09, 2023 at 01:59:33PM +0800, Qiang Liu wrote:
> This patch checks if the s->tx_fifo is full.

+ CC: Fred

Reviewed-by: Edgar E. Iglesias <edgar@zeroasic.com>


> 
> Fixes: 58ac482a66de ("introduce xlnx-dp")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1424
> Reported-by: Qiang Liu <cyruscyliu@gmail.com>
> Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
> ---
>  hw/display/xlnx_dp.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> index 972473d94f..617b394af2 100644
> --- a/hw/display/xlnx_dp.c
> +++ b/hw/display/xlnx_dp.c
> @@ -854,7 +854,11 @@ static void xlnx_dp_write(void *opaque, hwaddr offset, uint64_t value,
>          break;
>      case DP_AUX_WRITE_FIFO: {
>          uint8_t c = value;
> -        xlnx_dp_aux_push_tx_fifo(s, &c, 1);
> +        if (fifo8_is_full(&s->tx_fifo)) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "xlnx_dp: TX fifo is full");
> +        } else {
> +            xlnx_dp_aux_push_tx_fifo(s, &c, 1);
> +        }
>          break;
>      }
>      case DP_AUX_CLOCK_DIVIDER:
> -- 
> 2.25.1
> 
> 

