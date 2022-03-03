Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A28F74CC1E9
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 16:48:41 +0100 (CET)
Received: from localhost ([::1]:59144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPnh2-0002Ad-Oz
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 10:48:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPnLX-0007VZ-VT
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:26:27 -0500
Received: from [2607:f8b0:4864:20::b32] (port=43993
 helo=mail-yb1-xb32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPnLV-0007b1-TN
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:26:27 -0500
Received: by mail-yb1-xb32.google.com with SMTP id g26so10896637ybj.10
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 07:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y7YHUt1/i+bS0wtiGGtuv2gq6G6NR6OP3AL6NSpuUPU=;
 b=mCpPFqRdZWlKyq4rQKs6SG7+E/NRKZAFxtcbK1qh84j2N5PIcfpfXK0Mg5A5uaUryF
 qvDOvbutzsQOrmZygm4G1qWTEWQXGCNgm4Yp5My0HBsuIVgHU+TwHE9hVBqNdiwlynt4
 Sd6lZ6WBDJ8nVtp3FImRRxoqYWftPfeJnOzKnD1esBFyWP/PpPtU1MLuJgS7jWfTt4Id
 /MUNUtgA68zEVprYlRemOvLZl47UayiC8d5mk1kEHtxig0pr9Nkr6EBeuGMvRcP3e34w
 3beDAiIrsWkcBxZtKXBsRdEl0QGg4m4QIzE7v1HvG5Ji666tuQnebN2RqBiJASu1verq
 Ju2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y7YHUt1/i+bS0wtiGGtuv2gq6G6NR6OP3AL6NSpuUPU=;
 b=ugPEAM9oe9P991DHPjX1AY4g/XRylzPGEjCKtvHWXZu7Xxm+IeZOHfgssfNMHaREtC
 IOLy7BaJMRdCcWygYdBgbe3vwu6+S5P1lkP/4mRHyMYdCgg3qbiwR6OjMZbKu3U6YKUk
 PP2jVgP2nYK5MYIv+fNnxW2ugKdANIBJExWEh7T6vVA2ijkIo37oMMdvXVCpHs8KW+dV
 NZqPb4QxTZ45z3m45gXEjW+XchvxG+tFvfVFyoXi3a5QDhi8lbrzlOuLByJUXymUqeBp
 qn7ksM//4TrS7/2Ie62JgsO3WGSV22FWOuN9wRzQHo/IUlN1TASTCZc5gh8wrTrCpPNF
 Rc7w==
X-Gm-Message-State: AOAM533RM3ssd5Mya+3ktKt4Ildf/ydDZltUEEfRbX9uQkqr39heOzSo
 190I3Tj0kK0leQZlLQNsarAtjlZXE56S4kymfgKR6Q==
X-Google-Smtp-Source: ABdhPJys9m22vnTu8WYEqT9qX8xhUzEbi/4WHFqQ/H7zFHK20ySZpc1cfwkm/TOqzlHzv3CDN3Nu3LLNwqopdFfrzP0=
X-Received: by 2002:a5b:350:0:b0:628:86b8:6e09 with SMTP id
 q16-20020a5b0350000000b0062886b86e09mr11292631ybp.39.1646321184817; Thu, 03
 Mar 2022 07:26:24 -0800 (PST)
MIME-Version: 1.0
References: <20220302212752.6922-1-mark.cave-ayland@ilande.co.uk>
 <20220302212752.6922-5-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220302212752.6922-5-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Mar 2022 15:26:13 +0000
Message-ID: <CAFEAcA8s9j7ypQXiY8AE_NiqjO9aTfVx+6P60BgVTqJFTTv3MA@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] macfb: add VMStateDescription fields for display
 type and VBL timer
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
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
> These fields are required in the migration stream to restore macfb state
> correctly.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/display/macfb.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
> index dfdae90144..7371986480 100644
> --- a/hw/display/macfb.c
> +++ b/hw/display/macfb.c
> @@ -625,9 +625,11 @@ static const VMStateDescription vmstate_macfb = {
>      .minimum_version_id = 1,
>      .post_load = macfb_post_load,
>      .fields = (VMStateField[]) {
> +        VMSTATE_UINT8(type, MacfbState),
>          VMSTATE_UINT8_ARRAY(color_palette, MacfbState, 256 * 3),
>          VMSTATE_UINT32(palette_current, MacfbState),
>          VMSTATE_UINT32_ARRAY(regs, MacfbState, MACFB_NUM_REGS),
> +        VMSTATE_TIMER_PTR(vbl_timer, MacfbState),
>          VMSTATE_END_OF_LIST()
>      }
>  };

Same bump-versions-or-explain-why-not as previous patch, otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

