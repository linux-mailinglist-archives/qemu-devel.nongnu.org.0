Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 876CB355001
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 11:35:43 +0200 (CEST)
Received: from localhost ([::1]:37788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTi7a-0002uc-1Q
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 05:35:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTi6P-0002Q1-Bb
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 05:34:29 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTi6N-0000WA-26
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 05:34:28 -0400
Received: by mail-wr1-x435.google.com with SMTP id q26so7755379wrz.9
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 02:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=QC8frFbObdezScohL+J9LYEphVqCXhCxRhA1FNWAA8s=;
 b=SdmKJkuJltnUl8Rp7nhuCNqWD7KCvWawZ1lcIaPC5EnHcgyfa1Twn9mLTwJ6CHqrpw
 NeB4MAnlcTZ2tkCGVDuMi/N4NfbFQPfbG47HX37MokR/G0HqGypRwCXsalEQzzLyetm2
 8Jz5cCZENFbM4nWeJDJ66TDmrQt3+02BCkcCcBV7LJY/KjihW0JY9zbvvNUQBvtsSbnG
 tJFv7/Z3Alu12ipWpLWa/62MajLfTW0hedr3sJeN9pJSYa+7eSXOB2B9adh8a7HPDWaK
 WH9RwMltxt8bwMYm56jD0M06mrYQ36rA5VsUXdCRGAbh8mPrWaF0hBzq5NRpr5tIxNTu
 33iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=QC8frFbObdezScohL+J9LYEphVqCXhCxRhA1FNWAA8s=;
 b=QDxI7B0AiPp+4sg/prFcxLOs0awKiZ5GSCVjQoasu5LCGfRtoigIk8J/aicFOLOs94
 M2bK/KCnyPJja7oZMUiqlzEioxtl2jhSEPYMxGqvc63H2FDkuBM1xjjXHJotf3QBOPgJ
 G9YvG/zjQoKNJhoJwh28A7qbZv4AcB3d5Oj29fXVhRTW+XcMIUq2xJUMf6tx5TO6/ELY
 oQx+06nY4LrhZprTWkSWpzVHKthsBAhNN7QZE3RrGH/zy2N5W18chdK2gUl3de8eCgGL
 niCbsdK//GlYx2KKTxcdGa0rYDdxM6tLKj2MIrX4PnfNWdxQ7526h/0XN0jNWjHs2xUz
 PWcQ==
X-Gm-Message-State: AOAM533XBsadNx3jSmhUcfnfEDyBPzRpJ603ZYNFursRyzqSYH2/ZPwu
 khc1YVnb4OP4FK7WTVdVGBkqgQ==
X-Google-Smtp-Source: ABdhPJwxaILb2gUNdIG1SpM7Biv3WQUouNdwXcDh7awxk0xvVMq6aRWpAwwPwJvt3h8Pp44dJF4h3A==
X-Received: by 2002:adf:f5cb:: with SMTP id k11mr1648860wrp.374.1617701664454; 
 Tue, 06 Apr 2021 02:34:24 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r206sm2040591wma.46.2021.04.06.02.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 02:34:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 75DBA1FF7E;
 Tue,  6 Apr 2021 10:34:22 +0100 (BST)
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-27-git-send-email-tsimpson@quicinc.com>
 <13a3eb3b-49e8-f62e-5222-e787911b69f8@amsat.org>
 <BYAPR02MB4886B81512579C4A88AA99D0DE779@BYAPR02MB4886.namprd02.prod.outlook.com>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Taylor Simpson <tsimpson@quicinc.com>
Subject: Re: [PATCH v8 26/35] Hexagon (target/hexagon) TCG generation
Date: Tue, 06 Apr 2021 10:20:05 +0100
In-reply-to: <BYAPR02MB4886B81512579C4A88AA99D0DE779@BYAPR02MB4886.namprd02.prod.outlook.com>
Message-ID: <87y2dvwych.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "ale@rev.ng" <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "laurent@vivier.eu" <laurent@vivier.eu>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Taylor Simpson <tsimpson@quicinc.com> writes:

>> -----Original Message-----
>> From: Philippe Mathieu-Daud=C3=A9 <philippe.mathieu.daude@gmail.com> On
>> Behalf Of Philippe Mathieu-Daud=C3=A9
>> Sent: Thursday, February 11, 2021 6:23 PM
>> To: Taylor Simpson <tsimpson@quicinc.com>; qemu-devel@nongnu.org
>> Cc: richard.henderson@linaro.org; alex.bennee@linaro.org;
>> laurent@vivier.eu; ale@rev.ng; Brian Cain <bcain@quicinc.com>
>> Subject: Re: [PATCH v8 26/35] Hexagon (target/hexagon) TCG generation
>>
>> Hi Taylor,
>>
>> On 2/8/21 6:46 AM, Taylor Simpson wrote:
>> > Include the generated files and set up the data structures
>> >
>> > Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
>> > ---
>> >  target/hexagon/genptr.h |  25 ++++
>> >  target/hexagon/genptr.c | 331
>> ++++++++++++++++++++++++++++++++++++++++++++++++
>> >  2 files changed, 356 insertions(+)
>> >  create mode 100644 target/hexagon/genptr.h
>> >  create mode 100644 target/hexagon/genptr.c
>> >
>> > diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
>> > new file mode 100644
>> > index 0000000..7481f4c
>> > --- /dev/null
>> > +++ b/target/hexagon/genptr.c
>> > @@ -0,0 +1,331 @@
>> > +
>> > +#define QEMU_GENERATE
>>
>> Maybe move this ...
>>
>> > +#include "qemu/osdep.h"
>> > +#include "qemu/log.h"
>> > +#include "cpu.h"
>> > +#include "internal.h"
>> > +#include "tcg/tcg-op.h"
>> > +#include "insn.h"
>> > +#include "opcodes.h"
>> > +#include "translate.h"
>>
>> ... here with a comment:
>>
>> #define QEMU_GENERATE /* Used internally by macros.h */
>>
>> > +#include "macros.h"
>>
>> and undef?
>>
>> #undef QEMU_GENERATE
>
> OK
>
>> > +#include "gen_tcg.h"
>> > +
>> > +static inline TCGv gen_read_preg(TCGv pred, uint8_t num)
>> > +{
>> > +    tcg_gen_mov_tl(pred, hex_pred[num]);
>> > +    return pred;
>> > +}
>> > +
>> > +static inline void gen_log_predicated_reg_write(int rnum, TCGv val, i=
nt
>> slot)
>> > +{
>> > +    TCGv one =3D tcg_const_tl(1);
>> > +    TCGv zero =3D tcg_const_tl(0);
>> > +    TCGv slot_mask =3D tcg_temp_new();
>> > +
>> > +    tcg_gen_andi_tl(slot_mask, hex_slot_cancelled, 1 << slot);
>> > +    tcg_gen_movcond_tl(TCG_COND_EQ, hex_new_value[rnum],
>> slot_mask, zero,
>> > +                           val, hex_new_value[rnum]);
>> > +#if HEX_DEBUG
>>
>> Can you declare an 'bool hexagon_debug_enabled(void);' eventually
>> inlined, so we can get this code compiled (to avoid bitroting) using
>>
>>   if (hexagon_debug_enabled()) {
>>
>> > +    /* Do this so HELPER(debug_commit_end) will know */
>> > +    tcg_gen_movcond_tl(TCG_COND_EQ, hex_reg_written[rnum],
>> slot_mask, zero,
>> > +                       one, hex_reg_written[rnum]);
>>
>>   }
>>
>> > +#endif
>
> Do we really need a function?  Why not change
>
> #if HEX_DEBUG
>     ...
> #endif
>
> to
>
> if (HEX_DEBUG) {
>     ...
> }

You can go the whole hog and wrap everything up to minimise the chance
of functional changes in your debug legs in the main code, e.g.:

  #define tlb_debug(fmt, ...) do { \
      if (DEBUG_TLB_LOG_GATE) { \
          qemu_log_mask(CPU_LOG_MMU, "%s: " fmt, __func__, \
                        ## __VA_ARGS__); \
      } else if (DEBUG_TLB_GATE) { \
          fprintf(stderr, "%s: " fmt, __func__, ## __VA_ARGS__); \
      } \
  } while (0)

Then a statement like:

  tlb_debug("mmu_idx:0x%04" PRIx16 "\n", asked);

is unambiguously:

  - obviously a debug statement
  - always compiled, hence no bit rot
  - optimises away when gates are 0
  - doesn't accidentally include changes in behaviour

>
>
> Thanks,
> Taylor


--=20
Alex Benn=C3=A9e

