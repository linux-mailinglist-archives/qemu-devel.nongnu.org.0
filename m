Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC394CC1A8
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 16:40:47 +0100 (CET)
Received: from localhost ([::1]:34206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPnZM-00024R-TG
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 10:40:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPnKT-0005IH-75
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:25:22 -0500
Received: from [2607:f8b0:4864:20::b34] (port=44996
 helo=mail-yb1-xb34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPnKR-0007Ma-FE
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:25:20 -0500
Received: by mail-yb1-xb34.google.com with SMTP id u61so10883479ybi.11
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 07:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OMiCi5NiO6x9IcZXpv78IPVVx/Prln6VRMt8Cgq+0gw=;
 b=N1uQH6g9vMk57izIacJnA5F1vD61giNKVKCoajHqNfBN+Haad9DmEUxJrbFw9+zu61
 J/dRgT1ZuXhC94jSKIg1YbmrU+HYqIuUz12V1i2Q0xU84v1Pzrl27OzYVlBpFccgTcBX
 RrY6KpzOjVHbCB1TGR7wCt4P2R9OCPPTIlx+ovH+OG7vALRCtaVQC/5yurQ2o1tZCoW/
 ILRcN+PZFFpvt+FILrhBnQM+UTW3ZxwxwIkWPlZjU+s7KxF8Kyooyb3Pvm1VK1Irn2nh
 P4T964t6+kbSj8GoW4u4Uus4P0Hu+9+5wGyhLMNWHx/5KM+2F7tn2iPGJjIc/3fpqGwk
 7CMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OMiCi5NiO6x9IcZXpv78IPVVx/Prln6VRMt8Cgq+0gw=;
 b=8PxceoDZoqVRMfQL7iMJUoRDQu3xOnOrLznxEid3jJvu/czrWpt8bJbnESEPc3LvBk
 LxZHFBQy2qDNmAhYnZK0mfpbLNZcpd+zy+xi4cl3j27Z1LjMPPAv6WgD2yP7EGiuogZq
 jOD/mjIzjhGJVEXCWIgi0anNnR9Ts2czQHzFrrawxC9msZEGgtGvkAQr+JF67Do5RT4M
 OnZST6FVF7tTyka+hZ3gmTHxz+MMmPCRxmeGa8GJ+PoDIW0/snyQ9ahaByJU1hlgkKR4
 m30JYllyiKolDtsX/+GyCNv/uAGnoHBnGmowrxEBTW0S98gdSLaHqbIprKN0ipXEsz9T
 AXlA==
X-Gm-Message-State: AOAM531D5kZJ950LDr7QK5AbCKz8LFkWOOlUIoQnZR3xOo7MV9gWutbu
 Ol0FU9PmCAawWqretkv1Ja4FZqjSGgvoVEnC7HnUwg==
X-Google-Smtp-Source: ABdhPJwGybde/VqNbodaoGCfWitLIEjympYaDHHD2W4Grv5IkL2HjCi8Iqe+20SP/rmsFckhj4gtwbHEN6tHCy0zDLs=
X-Received: by 2002:a25:9c08:0:b0:628:a472:30f4 with SMTP id
 c8-20020a259c08000000b00628a47230f4mr7316637ybo.67.1646321117409; Thu, 03 Mar
 2022 07:25:17 -0800 (PST)
MIME-Version: 1.0
References: <20220302212752.6922-1-mark.cave-ayland@ilande.co.uk>
 <20220302212752.6922-4-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220302212752.6922-4-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Mar 2022 15:25:06 +0000
Message-ID: <CAFEAcA8-_khhe0999QB=wsUi=HEcPa6G3C7p_P63UibkF6FNUA@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] macfb: increase number of registers saved in
 MacfbState
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, pbonzini@redhat.com, Laurent@vivier.eu,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Mar 2022 at 21:31, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> The MacOS toolbox ROM accesses a number of addresses between 0x0 and 0x200 during
> initialisation and resolution changes. Whilst the function of many of these
> registers is unknown, it is worth the minimal cost of saving these extra values as
> part of migration to help future-proof the migration stream for the q800 machine
> as it starts to stabilise.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/display/macfb.c         | 8 ++++++++
>  include/hw/display/macfb.h | 3 ++-
>  2 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
> index fb54b460c1..dfdae90144 100644
> --- a/hw/display/macfb.c
> +++ b/hw/display/macfb.c
> @@ -537,6 +537,10 @@ static uint64_t macfb_ctrl_read(void *opaque,
>      case DAFB_MODE_SENSE:
>          val = macfb_sense_read(s);
>          break;
> +    default:
> +        if (addr < MACFB_CTRL_TOPADDR) {
> +            val = s->regs[addr >> 2];
> +        }
>      }
>
>      trace_macfb_ctrl_read(addr, val, size);
> @@ -592,6 +596,10 @@ static void macfb_ctrl_write(void *opaque,
>              macfb_invalidate_display(s);
>          }
>          break;
> +    default:
> +        if (addr < MACFB_CTRL_TOPADDR) {
> +            s->regs[addr >> 2] = val;
> +        }
>      }
>
>      trace_macfb_ctrl_write(addr, val, size);
> diff --git a/include/hw/display/macfb.h b/include/hw/display/macfb.h
> index 6d9f0f7869..55a50d3fb0 100644
> --- a/include/hw/display/macfb.h
> +++ b/include/hw/display/macfb.h
> @@ -48,7 +48,8 @@ typedef struct MacFbMode {
>      uint32_t offset;
>  } MacFbMode;
>
> -#define MACFB_NUM_REGS      8
> +#define MACFB_CTRL_TOPADDR  0x200
> +#define MACFB_NUM_REGS      (MACFB_CTRL_TOPADDR / sizeof(uint32_t))

You should either bump the vmstate_macfb version numbers here,
or at least note in the commit message that although it's a
migration break we know nobody's migrating this device because
of the bug we just fixed in the previous commit.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

