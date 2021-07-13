Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD01F3C700B
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 13:57:56 +0200 (CEST)
Received: from localhost ([::1]:33022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3H2x-0007Db-Dj
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 07:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1m3H1o-0006Hh-K2; Tue, 13 Jul 2021 07:56:44 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:43575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1m3H1m-0002nG-1M; Tue, 13 Jul 2021 07:56:44 -0400
Received: by mail-oi1-x231.google.com with SMTP id w188so3730949oif.10;
 Tue, 13 Jul 2021 04:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NXU0PYFM3uq576WZv55oeI5hBvm9Gh8eYHSUXbwzl98=;
 b=f97Guda6F/J3J+FJXm3cEVflhlLvk56ZJogDEsOHnnavzYzX6wbxrESWeAl99cHjxS
 IOfdMAcIRww4I3RlkJfl/LKik7NPPK3him6KWO4KUAoPiA/yeXLn0JE5VBxsebb7GcVg
 K40NEJgdtmyimHwbuTW7fUPs3r1YIOqFmVhH8VUPyVpoct9gpzmRbs7SSBpLrE+lchuk
 5MtUiyhyKsW5qFIUoPXBJveuLTrUt/ZwOFu8ZfHMPswdT5Z2WfMnWXRxFeKC/dZ4Hnk7
 4B3bBewKWdOvFgJfHtFui/I9qyKPU8+XwybzGn7wl9+s4YdgeEP5hcJ7u1+vvxxwTnl8
 NJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NXU0PYFM3uq576WZv55oeI5hBvm9Gh8eYHSUXbwzl98=;
 b=RStVHv2J0HUQ+54TJdm5H3xPFpwxl6XpTgdRjyORLyjnM/yxNxIH/0iUvK218Vngl4
 J3KG5YBN7U7cTgAnq5OOvHq9iVYqqhdXyBwPqLhK++s5xiWifbDJlm8aoMFPNC1w+2Eb
 sP2zvcRbS/u+nYzQcsVf2GixhNes1DPK6vCnRaqV+4/FvQ/spjc96huee2ey5HjWLHCX
 GYgxehYTunyKfiTM3TKkOYaqIu99WTKZxq5p4Uxl6DkIa1E7j51WvGbBEETnn6MlzyBr
 qfGjsODW+LlfCQ2TMGxaJoAhaCgH0TxWlKQafmy7og5+VCk9s/uJm/sGeRhEPa9buVR/
 7u+w==
X-Gm-Message-State: AOAM532PGMqeHu2PmGwGwK5aTIFEMDovVSJ/vqSabtTWu2OSklYQ5Ijj
 WbQ1rNUZZSgF0Nbqg5dg4lya97Mwdjk5oRcXpQg=
X-Google-Smtp-Source: ABdhPJz1Vd3ocO4q+GVD4icjPwpRqHM3TyMZJAI+oJen2QdBdKZ16CdasTNLOEcmuw3KAci1TMnxsf/HLk7ZjNN+PKQ=
X-Received: by 2002:a05:6808:68d:: with SMTP id
 k13mr2837305oig.83.1626177400664; 
 Tue, 13 Jul 2021 04:56:40 -0700 (PDT)
MIME-Version: 1.0
References: <1626146083-19434-1-git-send-email-cyruscyliu@gmail.com>
 <5c8d9875-ecf1-4f67-f26d-da010bdab9bb@amsat.org>
 <a0fe9b97-f9dd-9122-8b40-342ab3c8a232@amsat.org>
In-Reply-To: <a0fe9b97-f9dd-9122-8b40-342ab3c8a232@amsat.org>
From: Qiang Liu <cyruscyliu@gmail.com>
Date: Tue, 13 Jul 2021 19:56:27 +0800
Message-ID: <CAAKa2jmFKf4wMwtz+7nChR-vQcOtQc4ZKKVeyL7tJs0YXBbWtg@mail.gmail.com>
Subject: Re: [PATCH] hw/display/xlnx_dp: fix an out-of-bounds read in
 xlnx_dp_read
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=cyruscyliu@gmail.com; helo=mail-oi1-x231.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Alexander Bulekov <alxndr@redhat.com>,
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 13, 2021 at 6:24 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 7/13/21 12:20 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 7/13/21 5:14 AM, Qiang Liu wrote:
> >> xlnx_dp_read allows an out-of-bounds read at its default branch becaus=
e
> >> of an improper index.
> >>
> >> According to
> >> https://www.xilinx.com/html_docs/registers/ug1087/ug1087-zynq-ultrasca=
le-registers.html
> >> (DP Module), registers 0x3A4/0x3A4/0x3AC are allowed.
> >>
> >> DP_INT_MASK  0x000003A4      32      mixed   0xFFFFF03F      Interrupt=
 Mask Register for intrN.
> >> DP_INT_EN    0x000003A8      32      mixed   0x00000000      Interrupt=
 Enable Register.
> >> DP_INT_DS    0x000003AC      32      mixed   0x00000000      Interrupt=
 Disable Register.
> >>
> >> In xlnx_dp_write, when the offset is 0x3A8 and 0x3AC, the virtual devi=
ce
> >> will write s->core_registers[0x3A4
> >>>> 2]. That is to say, the maxize of s->core_registers could be ((0x3A4
> >>>> 2) + 1). However, the current size of s->core_registers is (0x3AF >>
> >>>> 2), that is ((0x3A4 >> 2) + 2), which is out of the range.
> >> In xlxn_dp_read, the access to offset 0x3A8 or 0x3AC will be directed =
to
> >> the offset 0x3A8 (incorrect functionality) or 0x3AC (out-of-bounds rea=
d)
> >> rather than 0x3A4.
> >>
> >> This patch adjusts the size of s->core_registers and enforces the read
> >> access to offset 0x3A* and 0x3AC to 0x3A4. BTW, because the size of th=
is
> >> MMIO region is 0x3AF, this patch also removes the assertion in
> >> xlnx_dp_write.
> >>
> >> Fixes: 58ac482a66de ("introduce xlnx-dp")
> >> Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
> >> ---
> >>  hw/display/xlnx_dp.c         | 7 ++++---
> >>  include/hw/display/xlnx_dp.h | 2 +-
> >>  2 files changed, 5 insertions(+), 4 deletions(-)
> >
> > Can you provide a qtest reproducer please?
>
> See examples in tests/qtest/fuzz*test.c
Yeah. I can add the qtest reproducer.

> >> diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> >> index 7bcbb13..8903181 100644
> >> --- a/hw/display/xlnx_dp.c
> >> +++ b/hw/display/xlnx_dp.c
> >> @@ -713,8 +713,10 @@ static uint64_t xlnx_dp_read(void *opaque, hwaddr=
 offset, unsigned size)
> >>          ret =3D 0;
> >>          break;
> >>      default:
> >> -        assert(offset <=3D (0x3AC >> 2));
> >> -        ret =3D s->core_registers[offset];
> >> +        if (offset =3D=3D (0x3A8 >> 2) || offset =3D=3D (0x3AC >> 2))
> >> +            ret =3D s->core_registers[DP_INT_MASK];
> >> +        else
> >
> > Invalid code style.
Will refine it.

> >> +            ret =3D s->core_registers[offset];
> >>          break;
> >>      }
> >>
> >> @@ -876,7 +878,6 @@ static void xlnx_dp_write(void *opaque, hwaddr off=
set, uint64_t value,
> >>          xlnx_dp_update_irq(s);
> >>          break;
> >>      default:
> >> -        assert(offset <=3D (0x504C >> 2));
> >>          s->core_registers[offset] =3D value;
> >>          break;
> >>      }
> >> diff --git a/include/hw/display/xlnx_dp.h b/include/hw/display/xlnx_dp=
.h
> >> index e85e428..99a6d47 100644
> >> --- a/include/hw/display/xlnx_dp.h
> >> +++ b/include/hw/display/xlnx_dp.h
> >> @@ -39,7 +39,7 @@
> >>  #define AUD_CHBUF_MAX_DEPTH                 (32 * KiB)
> >>  #define MAX_QEMU_BUFFER_SIZE                (4 * KiB)
> >>
> >> -#define DP_CORE_REG_ARRAY_SIZE              (0x3AF >> 2)
> >> +#define DP_CORE_REG_ARRAY_SIZE              (0x3A8 >> 2)
> >
> > NAck: this breaks migration.
I will not modify this.

> >>  #define DP_AVBUF_REG_ARRAY_SIZE             (0x238 >> 2)
> >>  #define DP_VBLEND_REG_ARRAY_SIZE            (0x1DF >> 2)
> >>  #define DP_AUDIO_REG_ARRAY_SIZE             (0x50 >> 2)

Thank you for the review. I will resend the patch soon.

Best,
Qiang

