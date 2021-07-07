Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7204B3BE630
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 12:12:17 +0200 (CEST)
Received: from localhost ([::1]:48858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m14XQ-0005Ll-9q
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 06:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1m14Vi-0003xp-RP
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:10:30 -0400
Received: from forward4-smtp.messagingengine.com ([66.111.4.238]:52383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1m14Vf-0006O0-6q
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:10:30 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailforward.nyi.internal (Postfix) with ESMTP id C6B031940A95;
 Wed,  7 Jul 2021 06:10:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 07 Jul 2021 06:10:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=4WFZkI
 qFucvxApFj10Psye5LSKg2fXRNlu/SJZTJ6Ws=; b=WMrXGTYFDiKAuUUWbEfH+v
 zxGWvHtFEZoe+xvOUtB/W2K7vJBRGzUTS3CwqavSdhnRyr/g0qvU1/rzSKZ0aJGB
 WXgxiIZNyVr6OP2vqI4gy5lh6pyjFT+FKhaGBLFUw2/spwVDUG2D1wdMVT+z7RRN
 m3dv2U+Ucpx1EYSTw4bKqZtMiCzX8g2z/fU1c3kDWeOn0OXr5kqrrOiREdlAwM3H
 rY2KWiqAJelR/Ts2MqM/D0wfABQFIPK598VP6kXadxS53EM2DUH7B2f1baMYaDh6
 mLeU6dHkB5iulimIzPD9ZV7PstTBXNoBco5d1cHMUnCtWHOh0Akw1XPRqiV08wtA
 ==
X-ME-Sender: <xms:kH3lYNczy8Rmnr92EN3NifG5X48Rog3Xm9pzF0B90p2IbWJwpTMxlg>
 <xme:kH3lYLNYQt8LENRYiS9cZofsxhEsauMoTUTK_kJB7fAZCfITJ-DLJ2-4d8I9bg1k-
 AyWttkypfwYmON6rSc>
X-ME-Received: <xmr:kH3lYGjuVKG09eL7XEPDdAWEU7Du_wrvDrNhDA5S2EOfx3f9Gh7nNAc9ZJ_azClXI4BArOjBqhW-s7afdPhiTAXEbdhkrzyuoR6VC0WrU5M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddvgddvgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefvufgjfhfhfffkgggtsehttdertddttddtnecuhfhrohhmpeffrghvihguucfg
 ughmohhnughsohhnuceoughmvgesughmvgdrohhrgheqnecuggftrfgrthhtvghrnhephf
 ekgeeutddvgeffffetheejvdejieetgfefgfffudegffffgeduheegteegleeknecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepughmvgesughmvg
 drohhrgh
X-ME-Proxy: <xmx:kH3lYG9eHjyTum8BgmjTLEGkRgkNUAD8HOnD65FqSbiYBV_RZ7XSMw>
 <xmx:kH3lYJuzXW4b-Bc1bmFpMTGBZ4pFtCVS5JySFq686rTmLOonTQtXZA>
 <xmx:kH3lYFFXDasi371bjWJwxdpP5yxzsJlcYSl4r6z3ZNzBgTROBDPkNw>
 <xmx:kH3lYKli1NMLlsQcgLXp_WRnZF9MPKEuZGR42SKoAMTBYDCZM-LWzQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 06:10:23 -0400 (EDT)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id ad53b2bc;
 Wed, 7 Jul 2021 10:10:21 +0000 (UTC)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH 8/8] target/i386: Move X86XSaveArea into TCG
In-Reply-To: <0d75c3ab-926b-d4cd-244a-8c8b603535f9@linaro.org>
References: <20210705104632.2902400-1-david.edmondson@oracle.com>
 <20210705104632.2902400-9-david.edmondson@oracle.com>
 <0d75c3ab-926b-d4cd-244a-8c8b603535f9@linaro.org>
X-HGTTG: heart-of-gold
From: David Edmondson <dme@dme.org>
Date: Wed, 07 Jul 2021 11:10:21 +0100
Message-ID: <m2czru4epe.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: neutral client-ip=66.111.4.238; envelope-from=dme@dme.org;
 helo=forward4-smtp.messagingengine.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Michael Roth <michael.roth@amd.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Cameron Esfahani <dirty@apple.com>, babu.moger@amd.com,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tuesday, 2021-07-06 at 18:09:42 -07, Richard Henderson wrote:

> On 7/5/21 3:46 AM, David Edmondson wrote:
>> Given that TCG is now the only consumer of X86XSaveArea, move the
>> structure definition and associated offset declarations and checks to a
>> TCG specific header.
>> 
>> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
>> ---
>>   target/i386/cpu.h            | 57 ------------------------------------
>>   target/i386/tcg/fpu_helper.c |  1 +
>>   target/i386/tcg/tcg-cpu.h    | 57 ++++++++++++++++++++++++++++++++++++
>>   3 files changed, 58 insertions(+), 57 deletions(-)
>> 
>> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
>> index 96b672f8bd..0f7ddbfeae 100644
>> --- a/target/i386/cpu.h
>> +++ b/target/i386/cpu.h
>> @@ -1305,48 +1305,6 @@ typedef struct XSavePKRU {
>>       uint32_t padding;
>>   } XSavePKRU;
>>   
>> -#define XSAVE_FCW_FSW_OFFSET    0x000
>> -#define XSAVE_FTW_FOP_OFFSET    0x004
>> -#define XSAVE_CWD_RIP_OFFSET    0x008
>> -#define XSAVE_CWD_RDP_OFFSET    0x010
>> -#define XSAVE_MXCSR_OFFSET      0x018
>> -#define XSAVE_ST_SPACE_OFFSET   0x020
>> -#define XSAVE_XMM_SPACE_OFFSET  0x0a0
>> -#define XSAVE_XSTATE_BV_OFFSET  0x200
>> -#define XSAVE_AVX_OFFSET        0x240
>> -#define XSAVE_BNDREG_OFFSET     0x3c0
>> -#define XSAVE_BNDCSR_OFFSET     0x400
>> -#define XSAVE_OPMASK_OFFSET     0x440
>> -#define XSAVE_ZMM_HI256_OFFSET  0x480
>> -#define XSAVE_HI16_ZMM_OFFSET   0x680
>> -#define XSAVE_PKRU_OFFSET       0xa80
>> -
>> -typedef struct X86XSaveArea {
>> -    X86LegacyXSaveArea legacy;
>> -    X86XSaveHeader header;
>> -
>> -    /* Extended save areas: */
>> -
>> -    /* AVX State: */
>> -    XSaveAVX avx_state;
>> -
>> -    /* Ensure that XSaveBNDREG is properly aligned. */
>> -    uint8_t padding[XSAVE_BNDREG_OFFSET
>> -                    - sizeof(X86LegacyXSaveArea)
>> -                    - sizeof(X86XSaveHeader)
>> -                    - sizeof(XSaveAVX)];
>> -
>> -    /* MPX State: */
>> -    XSaveBNDREG bndreg_state;
>> -    XSaveBNDCSR bndcsr_state;
>> -    /* AVX-512 State: */
>> -    XSaveOpmask opmask_state;
>> -    XSaveZMM_Hi256 zmm_hi256_state;
>> -    XSaveHi16_ZMM hi16_zmm_state;
>> -    /* PKRU State: */
>> -    XSavePKRU pkru_state;
>> -} X86XSaveArea;
>> -
>>   QEMU_BUILD_BUG_ON(sizeof(XSaveAVX) != 0x100);
>>   QEMU_BUILD_BUG_ON(sizeof(XSaveBNDREG) != 0x40);
>>   QEMU_BUILD_BUG_ON(sizeof(XSaveBNDCSR) != 0x40);
>> @@ -1355,21 +1313,6 @@ QEMU_BUILD_BUG_ON(sizeof(XSaveZMM_Hi256) != 0x200);
>>   QEMU_BUILD_BUG_ON(sizeof(XSaveHi16_ZMM) != 0x400);
>>   QEMU_BUILD_BUG_ON(sizeof(XSavePKRU) != 0x8);
>>   
>> -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fcw) != XSAVE_FCW_FSW_OFFSET);
>> -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.ftw) != XSAVE_FTW_FOP_OFFSET);
>> -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fpip) != XSAVE_CWD_RIP_OFFSET);
>> -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fpdp) != XSAVE_CWD_RDP_OFFSET);
>> -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.mxcsr) != XSAVE_MXCSR_OFFSET);
>> -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fpregs) != XSAVE_ST_SPACE_OFFSET);
>> -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.xmm_regs) != XSAVE_XMM_SPACE_OFFSET);
>> -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, avx_state) != XSAVE_AVX_OFFSET);
>> -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, bndreg_state) != XSAVE_BNDREG_OFFSET);
>> -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, bndcsr_state) != XSAVE_BNDCSR_OFFSET);
>> -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, opmask_state) != XSAVE_OPMASK_OFFSET);
>> -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, zmm_hi256_state) != XSAVE_ZMM_HI256_OFFSET);
>> -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, hi16_zmm_state) != XSAVE_HI16_ZMM_OFFSET);
>> -QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, pkru_state) != XSAVE_PKRU_OFFSET);
>> -
>>   typedef struct ExtSaveArea {
>>       uint32_t feature, bits;
>>       uint32_t offset, size;
>> diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
>> index 4e11965067..74bbe94b80 100644
>> --- a/target/i386/tcg/fpu_helper.c
>> +++ b/target/i386/tcg/fpu_helper.c
>> @@ -20,6 +20,7 @@
>>   #include "qemu/osdep.h"
>>   #include <math.h>
>>   #include "cpu.h"
>> +#include "tcg-cpu.h"
>>   #include "exec/helper-proto.h"
>>   #include "fpu/softfloat.h"
>>   #include "fpu/softfloat-macros.h"
>> diff --git a/target/i386/tcg/tcg-cpu.h b/target/i386/tcg/tcg-cpu.h
>> index 36bd300af0..53a8494455 100644
>> --- a/target/i386/tcg/tcg-cpu.h
>> +++ b/target/i386/tcg/tcg-cpu.h
>> @@ -19,6 +19,63 @@
>>   #ifndef TCG_CPU_H
>>   #define TCG_CPU_H
>>   
>> +#define XSAVE_FCW_FSW_OFFSET    0x000
>> +#define XSAVE_FTW_FOP_OFFSET    0x004
>> +#define XSAVE_CWD_RIP_OFFSET    0x008
>> +#define XSAVE_CWD_RDP_OFFSET    0x010
>> +#define XSAVE_MXCSR_OFFSET      0x018
>> +#define XSAVE_ST_SPACE_OFFSET   0x020
>> +#define XSAVE_XMM_SPACE_OFFSET  0x0a0
>> +#define XSAVE_XSTATE_BV_OFFSET  0x200
>> +#define XSAVE_AVX_OFFSET        0x240
>> +#define XSAVE_BNDREG_OFFSET     0x3c0
>> +#define XSAVE_BNDCSR_OFFSET     0x400
>> +#define XSAVE_OPMASK_OFFSET     0x440
>> +#define XSAVE_ZMM_HI256_OFFSET  0x480
>> +#define XSAVE_HI16_ZMM_OFFSET   0x680
>> +#define XSAVE_PKRU_OFFSET       0xa80
>> +
>> +typedef struct X86XSaveArea {
>> +    X86LegacyXSaveArea legacy;
>> +    X86XSaveHeader header;
>> +
>> +    /* Extended save areas: */
>> +
>> +    /* AVX State: */
>> +    XSaveAVX avx_state;
>> +
>> +    /* Ensure that XSaveBNDREG is properly aligned. */
>> +    uint8_t padding[XSAVE_BNDREG_OFFSET
>> +                    - sizeof(X86LegacyXSaveArea)
>> +                    - sizeof(X86XSaveHeader)
>> +                    - sizeof(XSaveAVX)];
>> +
>> +    /* MPX State: */
>> +    XSaveBNDREG bndreg_state;
>> +    XSaveBNDCSR bndcsr_state;
>> +    /* AVX-512 State: */
>> +    XSaveOpmask opmask_state;
>> +    XSaveZMM_Hi256 zmm_hi256_state;
>> +    XSaveHi16_ZMM hi16_zmm_state;
>> +    /* PKRU State: */
>> +    XSavePKRU pkru_state;
>> +} X86XSaveArea;
>> +
>> +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fcw) != XSAVE_FCW_FSW_OFFSET);
>> +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.ftw) != XSAVE_FTW_FOP_OFFSET);
>> +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fpip) != XSAVE_CWD_RIP_OFFSET);
>> +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fpdp) != XSAVE_CWD_RDP_OFFSET);
>> +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.mxcsr) != XSAVE_MXCSR_OFFSET);
>> +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fpregs) != XSAVE_ST_SPACE_OFFSET);
>> +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.xmm_regs) != XSAVE_XMM_SPACE_OFFSET);
>> +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, avx_state) != XSAVE_AVX_OFFSET);
>> +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, bndreg_state) != XSAVE_BNDREG_OFFSET);
>> +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, bndcsr_state) != XSAVE_BNDCSR_OFFSET);
>> +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, opmask_state) != XSAVE_OPMASK_OFFSET);
>> +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, zmm_hi256_state) != XSAVE_ZMM_HI256_OFFSET);
>> +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, hi16_zmm_state) != XSAVE_HI16_ZMM_OFFSET);
>> +QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, pkru_state) != XSAVE_PKRU_OFFSET);
>
> My only quibble is that these offsets are otherwise unused.  This just becomes validation 
> of compiler layout.

Yes.

> I presume that XSAVE_BNDREG_OFFSET is not merely ROUND_UP(offsetof(avx_state) + 
> sizeof(avx_state), some_pow2)?

The offsets were just extracted from a CPU at some point in the
past. It's likely that things are as you describe, but that is not
defined anywhere.

> Do these offsets need to be migrated?  Otherwise, how can one start a vm with kvm and then 
> migrate to tcg?  I presume the offsets above are constant for a given cpu, and that 
> whatever cpu provides different offsets is not supported by tcg?  Given the lack of avx, 
> that's trivial these days...

For TCG I think that the offsets used should be derived from the CPU
model selected, rather than being the same for all CPU models.

If that was done, then in principle it should be possible to migrate
XSAVE state between same CPU model KVM and TCG environments.

dme.
-- 
Tonight I'm gonna bury that horse in the ground.

