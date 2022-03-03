Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FF34CC564
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 19:45:39 +0100 (CET)
Received: from localhost ([::1]:43380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPqSH-0002ZE-M1
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 13:45:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPqNI-0000wS-P7
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 13:40:28 -0500
Received: from [2607:f8b0:4864:20::b2e] (port=35581
 helo=mail-yb1-xb2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPqNG-0000OX-V2
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 13:40:28 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id bt13so12138352ybb.2
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 10:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=05WOp5T4/fGLOby7qI0wTINvs2lKwC6V2aoIOR9B8Ig=;
 b=ynbMRc9zJe8maNDELQBaK3VdfQjXZkXmZTDCgAssdwdrnTIXnKJOY5XELWu+ZVFXeA
 1J9NaAC0NnpCyIV7vCMyMfFYwdiQAyvwXV0W9gFM1GMvFSsqBlPGgO1oEDduyd4MK1m8
 DI2pCx+3BsHOgVIpl6j0vYzVLIzNnf5xPZckk+t7b2HHst6XTFZns2q7+EBt9HjtPnLU
 9XOHhmJ2ri8zASZgOH68iNzi8jIMwjYXfF2khqveWnHvZT9zXJHlSFFuxrOb3RnYWIec
 +l+EBpC0NNBuXCO7oPYBhsSu+OyEmea/04ulPqtQ6/kTC5ZhyrZaUPibu2+K+XpIGkEp
 ru6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=05WOp5T4/fGLOby7qI0wTINvs2lKwC6V2aoIOR9B8Ig=;
 b=lU89JAc+Nl+l2toaB8vAvlbMgUGtMCiqzqdbvoi9bQmD0ZDsQ6Gj6q39oHaTtLzu1o
 07L2x19sRGf15msZeYAZeIuqZOiIxm5AfK14Wd1QNB3mD074QTjkBlQ50wBinpUcNtRw
 0iR/hox13uzO655fNyjIrigytic07Wf/iAng7vTlQkyTmAXc0AyawTwaaEBv2JvIBXON
 4t1L44UmVrX1fTBDg7+NJBie1LPRkR0kvJnqSYHdSE97uCBEIxFPoHcoB++eeZ9w/2C+
 r8OiP+3V8bKadFBUCoKGjbTaijB5mGY21krtxlw+8wJAfuIFmF6qblW8DbV1S6u5fq0d
 5K+Q==
X-Gm-Message-State: AOAM531kUR1PflYjBSWlK9X1ZK3UxsNBgFXjH2/awl5sRUQdr8QyaGoN
 De02uTINDO4N2LHvvQ5F+up5PrV8UNnDDr9YrWLOMQ==
X-Google-Smtp-Source: ABdhPJwg6q8/GD+bP+TxTP6Fnuo0VugXR/JXFmuHl1lxEPd7+0UI5leit3mBPsgJySahc8mfN+9EYmsEgg56DIK2nLA=
X-Received: by 2002:a05:6902:83:b0:61a:709b:d841 with SMTP id
 h3-20020a056902008300b0061a709bd841mr33797813ybs.140.1646332825507; Thu, 03
 Mar 2022 10:40:25 -0800 (PST)
MIME-Version: 1.0
References: <20220302212752.6922-1-mark.cave-ayland@ilande.co.uk>
 <20220302212752.6922-4-mark.cave-ayland@ilande.co.uk>
 <CAFEAcA8-_khhe0999QB=wsUi=HEcPa6G3C7p_P63UibkF6FNUA@mail.gmail.com>
 <d2d6510d-3f3a-81a0-e28e-d5a4a4b3ccc1@ilande.co.uk>
In-Reply-To: <d2d6510d-3f3a-81a0-e28e-d5a4a4b3ccc1@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Mar 2022 18:40:14 +0000
Message-ID: <CAFEAcA93GFLH-OC7T_U0XQ=7B5uBmD147XMoTcJguj=wjfeChQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] macfb: increase number of registers saved in
 MacfbState
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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

On Thu, 3 Mar 2022 at 17:44, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> On 03/03/2022 15:25, Peter Maydell wrote:
>
> > On Wed, 2 Mar 2022 at 21:31, Mark Cave-Ayland
> > <mark.cave-ayland@ilande.co.uk> wrote:
> >>
> >> The MacOS toolbox ROM accesses a number of addresses between 0x0 and 0x200 during
> >> initialisation and resolution changes. Whilst the function of many of these
> >> registers is unknown, it is worth the minimal cost of saving these extra values as
> >> part of migration to help future-proof the migration stream for the q800 machine
> >> as it starts to stabilise.
> >>
> >> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> >> ---
> >>   hw/display/macfb.c         | 8 ++++++++
> >>   include/hw/display/macfb.h | 3 ++-
> >>   2 files changed, 10 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
> >> index fb54b460c1..dfdae90144 100644
> >> --- a/hw/display/macfb.c
> >> +++ b/hw/display/macfb.c
> >> @@ -537,6 +537,10 @@ static uint64_t macfb_ctrl_read(void *opaque,
> >>       case DAFB_MODE_SENSE:
> >>           val = macfb_sense_read(s);
> >>           break;
> >> +    default:
> >> +        if (addr < MACFB_CTRL_TOPADDR) {
> >> +            val = s->regs[addr >> 2];
> >> +        }
> >>       }
> >>
> >>       trace_macfb_ctrl_read(addr, val, size);
> >> @@ -592,6 +596,10 @@ static void macfb_ctrl_write(void *opaque,
> >>               macfb_invalidate_display(s);
> >>           }
> >>           break;
> >> +    default:
> >> +        if (addr < MACFB_CTRL_TOPADDR) {
> >> +            s->regs[addr >> 2] = val;
> >> +        }
> >>       }
> >>
> >>       trace_macfb_ctrl_write(addr, val, size);
> >> diff --git a/include/hw/display/macfb.h b/include/hw/display/macfb.h
> >> index 6d9f0f7869..55a50d3fb0 100644
> >> --- a/include/hw/display/macfb.h
> >> +++ b/include/hw/display/macfb.h
> >> @@ -48,7 +48,8 @@ typedef struct MacFbMode {
> >>       uint32_t offset;
> >>   } MacFbMode;
> >>
> >> -#define MACFB_NUM_REGS      8
> >> +#define MACFB_CTRL_TOPADDR  0x200
> >> +#define MACFB_NUM_REGS      (MACFB_CTRL_TOPADDR / sizeof(uint32_t))
> >
> > You should either bump the vmstate_macfb version numbers here,
> > or at least note in the commit message that although it's a
> > migration break we know nobody's migrating this device because
> > of the bug we just fixed in the previous commit.
> >
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> I can do this if you like, although until the last 2 patches anything that is using
> the disk will fail, and that's just about everything because DMA requests require
> guest support to move the data from the ESP to the CPU.
>
> In terms of the q800 machine there is an implicit assumption that there will be more
> migration breaks to come, mainly because there are new devices to be added to the
> q800 machine in my outstanding MacOS patches that will break migration again once. So
> until these are finally merged I don't think it's worth trying to stabilise the
> migration stream.

Yeah, fair enough; just put a note in the commit message to
that effect.  (Mostly bumping the migration version is about making
the error message nicer if somebody does do a mismatched save/load.)

thanks
-- PMM

