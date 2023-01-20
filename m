Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1CE675CA9
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 19:24:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIw2d-0002NE-Kz; Fri, 20 Jan 2023 13:23:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIw2a-0002MG-Jf
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 13:23:04 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIw2Y-0000Hk-M8
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 13:23:04 -0500
Received: by mail-pf1-x435.google.com with SMTP id z31so1498163pfw.4
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 10:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BHGbdpUEq+ly8Y80sFE/YLFYBzrHFkyHeGlIttzRn3g=;
 b=UvdwxYzgUDE6p6+Xj7h0ff8WFkOntbeyFsXzScbsDsv5ZEVaiOB/sRRzd8WwcdL5B7
 PE7KnTeArtvuXBYdpXyBXPz5Pry2Jcjzu8PxoCojdWrr+hfW0hG2rEk40iJkc0Ex/R1C
 gjFC+BE5DN+F2HqvxfBIOYHrfWMYB9Thf1t+62zA/3vJKQZD2gNX/IfLbK71ClB4xgyv
 q1LuMFvPyjd/yJTHEMQifEypJrFZrBbFk/oEcqMSG4XQGE3DnaHwoFhhguJNYn4IUwZt
 a0EtMO61PL76aMFwXCWai2D4vQo1LRwWYgmebojMdaff8dTcXDn8Y8Rc7VlIKrRw0sau
 Sxpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BHGbdpUEq+ly8Y80sFE/YLFYBzrHFkyHeGlIttzRn3g=;
 b=XFE8kLQ725Vj9vIUiso9dWKTgDGRDudeHswI3UvHLRjA9Pfcc0FTqq+5mrw0K+APJ+
 sA6SIc87TIx0doeyyi58+QFfzB6GKc2ge74FtFTuM5TbpTGH4vm5ZyxYu0PTYceXE6Rb
 EbMVpMI0iKg4E1paSNohJ3rxbKa37aR+ncJJUVEGEkK3m02KRjClpSIc+x3uTeB7yY3c
 drd04COMkvKaeIO+d+NoVfgp/nt1wCShjHcb/4+yPQbv3LUWHHaiYd1envbBq4t2RF5K
 SfRwRsMMw1RgRzgneVAiF5XzV25U5LPCA6r8szUvDiv1uZXB2u8FpAJ99HZYp1V5HsVa
 kO8Q==
X-Gm-Message-State: AFqh2kpfT20RRJHUvSZsg+oP5ex7EXbXaFK+2GRSBq4u0kSoziWrHHFC
 N4+9oUnW9qq/jpVIYcdH4RpiODo/mp604idKdZTXEg==
X-Google-Smtp-Source: AMrXdXvNQsYrroFtxUTrFiuwah7EiSUHEFhG33iTrBJClBDI2ewyuyPt7WOZOMrrp2KMLGClN55QcTL1CLuyAK4m/XM=
X-Received: by 2002:aa7:8d1a:0:b0:58b:c7ef:25ca with SMTP id
 j26-20020aa78d1a000000b0058bc7ef25camr1693489pfe.51.1674238980732; Fri, 20
 Jan 2023 10:23:00 -0800 (PST)
MIME-Version: 1.0
References: <20230120155447.31702-1-eiakovlev@linux.microsoft.com>
 <20230120155447.31702-3-eiakovlev@linux.microsoft.com>
In-Reply-To: <20230120155447.31702-3-eiakovlev@linux.microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Jan 2023 18:22:49 +0000
Message-ID: <CAFEAcA8RSCvkt+k2N+At67CYZejJgnrkqCox-meq0TtraooBCg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] hw/char/pl011: add post_load hook for
 backwards-compatibility
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, 20 Jan 2023 at 15:54, Evgeny Iakovlev
<eiakovlev@linux.microsoft.com> wrote:
>
> Previous change slightly modified the way we handle data writes when
> FIFO is disabled. Previously we kept incrementing read_pos and were
> storing data at that position, although we only have a
> single-register-deep FIFO now. Then we changed it to always store data
> at pos 0.
>
> If guest disables FIFO and the proceeds to read data, it will work out
> fine, because we read from current read_pos before setting it to 0.
>
> However, to make code less fragile, introduce a post_load hook for
> PL011State and move fixup read FIFO state when FIFO is disabled. Since
> we are introducing a post_load hook, also do some sanity checking on
> untrusted incoming input state.
>
> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
> ---
>  hw/char/pl011.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> index 3fa3b75d04..4df649a064 100644
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -352,10 +352,35 @@ static const VMStateDescription vmstate_pl011_clock = {
>      }
>  };
>
> +static int pl011_post_load(void *opaque, int version_id)
> +{
> +    PL011State* s = opaque;
> +
> +    /* Sanity-check input state */
> +    if (s->read_pos >= ARRAY_SIZE(s->read_fifo) ||
> +        s->read_count > ARRAY_SIZE(s->read_fifo)) {
> +        return -1;
> +    }
> +
> +    if (version_id < 3 && !pl011_is_fifo_enabled(s)) {
> +        /*
> +         * Older versions of PL011 didn't ensure that the single
> +         * character in the FIFO in FIFO-disabled mode is in
> +         * element 0 of the array; convert to follow the current
> +         * code's assumptions.
> +         */
> +        s->read_fifo[0] = s->read_fifo[s->read_pos];
> +        s->read_pos = 0;
> +    }

You don't need to bump the version id and do this
check based on version ID. You can just check whether
the old state indicates that the data isn't in slot 0
of the array, the way I suggested in my comment on the
previous version of the patchset.

(New->old migration will work fine.)

thanks
-- PMM

