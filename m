Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 679ED616C23
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 19:31:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqIVU-0008SL-Vz; Wed, 02 Nov 2022 14:30:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqIVJ-0008RD-Rr; Wed, 02 Nov 2022 14:30:23 -0400
Received: from mout.kundenserver.de ([217.72.192.74])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqIVD-0002Dr-PS; Wed, 02 Nov 2022 14:30:21 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MWBC8-1oVyM82RXW-00XbPE; Wed, 02 Nov 2022 19:30:07 +0100
Message-ID: <66ca0d8c-79d5-c1a4-01a9-f7b16d430dee@vivier.eu>
Date: Wed, 2 Nov 2022 19:30:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 2/3] target/s390x: Rename insn-data/format.def ->
 insn-data/format.h.inc
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, qemu-trivial@nongnu.org
References: <20221025235006.7215-1-philmd@linaro.org>
 <20221025235006.7215-3-philmd@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221025235006.7215-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jhfuL8p/8mfiB2Wptx+iGVo+8Fe7egkk50B4puH26xp8Iujjv3B
 hHtoE390ntk6eJ7Bqe1Ulc4vsyl4O9B1xaZNm0W3fHMK315fAHbjPZNLfkXyzDWOCy15EwF
 Xt/LAYrWz+LVIGqmufjvqbbtNVaR2e9I919hr8u05+9b0nN/XUqe7gxte5L8iZiVFUHEFFZ
 bdCleJLm4e4ezvMB2IRKA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rAnLA7PzzsE=:hSca/ZjZBgGCNgQUeePfQx
 l5Z6yG9KL0PL/Q+DtgYbF8P5oJ3xrBWt0GFbUzg5PPCBHmMOmemKTw/6KcTQMMPh0u1VimrJa
 +2Bff+WSJWu3iIbA430CP8PR9hIzfST/kXVEiuOf0wCgd89FSflajyshqGAIP95Pv7Fq71zhh
 IRnMT3B0CB0aqp9mIV38ll994cWnuomjPVEZ9HtFlNxXJucN6v6gur7/5rC2FNRrdfGAoLkq5
 +YH2F4ZJT/+chBzEyS7OxuD4Jsct4laFh00HT31piNy0ZrzML1eubU11UXsFLPpfqONW2VKqP
 YBDXO2FgZoaA7kkusgVseTJOUcHTp5daJ+RCj6DJKc9TfD88K0ewy4E6geUEBRkXfETpke+qu
 zZ01UEU7dEDn7uveo3gB8eNqQOBpijHBef8IlZs7/0a7NOdVVG5uBJ70hw3fQZm8s1KVSVf7N
 1rHhM6RjIgzoPMw+Dq5xj5wI90/sTxB1AbGxCqtDKMEVIaAOGLnwpViMLSRYbLdsozdP8JqSy
 Yb7a3wtQAWu3mFKlgAflFl6oNldrXug9dw7QK1hGQria9ZdYKApwOFCeGlbz0Baw1DK4g/ouv
 pR6NAbeFNgcm4NHk22P3U0DvmMMA1lXWC+FAW9O2+ctSipw5lFjg3ofT5sUrX9SZlDosPRcWG
 tPLkIEIntgyTDFrzyNu3yolhC6UBrZgx1/hbQdDIsFwidD5VSvjcLZjXMULved5JtyoTfQyS4
 WkPoQb5IQz52GpKDRVNrFcFk14EOI4Y4y7c0Tnpb9XlyKbtvzJ0S1ZijsvcL9LLekoWf5PDAN
 o8p9t0a
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 26/10/2022 à 01:50, Philippe Mathieu-Daudé a écrit :
> We use the .h.inc extension to include C headers. To be consistent
> with the rest of the codebase, rename the C headers using the .def
> extension.
> 
> IDE/tools using our .editorconfig / .gitattributes will leverage
> this consistency.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/s390x/tcg/{insn-data.def => insn-data.h.inc}    |  2 +-
>   .../s390x/tcg/{insn-format.def => insn-format.h.inc}   |  0
>   target/s390x/tcg/translate.c                           | 10 +++++-----
>   3 files changed, 6 insertions(+), 6 deletions(-)
>   rename target/s390x/tcg/{insn-data.def => insn-data.h.inc} (99%)
>   rename target/s390x/tcg/{insn-format.def => insn-format.h.inc} (100%)
> 
> diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.h.inc
> similarity index 99%
> rename from target/s390x/tcg/insn-data.def
> rename to target/s390x/tcg/insn-data.h.inc
> index 6382ceabfc..7e952bdfc8 100644
> --- a/target/s390x/tcg/insn-data.def
> +++ b/target/s390x/tcg/insn-data.h.inc
> @@ -8,7 +8,7 @@
>    *
>    *  OPC  = (op << 8) | op2 where op is the major, op2 the minor opcode
>    *  NAME = name of the opcode, used internally
> - *  FMT  = format of the opcode (defined in insn-format.def)
> + *  FMT  = format of the opcode (defined in insn-format.h.inc)
>    *  FAC  = facility the opcode is available in (defined in DisasFacility)
>    *  I1   = func in1_xx fills o->in1
>    *  I2   = func in2_xx fills o->in2
> diff --git a/target/s390x/tcg/insn-format.def b/target/s390x/tcg/insn-format.h.inc
> similarity index 100%
> rename from target/s390x/tcg/insn-format.def
> rename to target/s390x/tcg/insn-format.h.inc
> diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
> index 1d2dddab1c..f378e1a633 100644
> --- a/target/s390x/tcg/translate.c
> +++ b/target/s390x/tcg/translate.c
> @@ -1011,7 +1011,7 @@ static void free_compare(DisasCompare *c)
>   #define F6(N, X1, X2, X3, X4, X5, X6) F0(N)
>   
>   typedef enum {
> -#include "insn-format.def"
> +#include "insn-format.h.inc"
>   } DisasFormat;
>   
>   #undef F0
> @@ -1076,7 +1076,7 @@ typedef struct DisasFormatInfo {
>   #define F6(N, X1, X2, X3, X4, X5, X6)       { { X1, X2, X3, X4, X5, X6 } },
>   
>   static const DisasFormatInfo format_info[] = {
> -#include "insn-format.def"
> +#include "insn-format.h.inc"
>   };
>   
>   #undef F0
> @@ -6143,7 +6143,7 @@ static void in2_insn(DisasContext *s, DisasOps *o)
>   #define E(OPC, NM, FT, FC, I1, I2, P, W, OP, CC, D, FL) insn_ ## NM,
>   
>   enum DisasInsnEnum {
> -#include "insn-data.def"
> +#include "insn-data.h.inc"
>   };
>   
>   #undef E
> @@ -6223,7 +6223,7 @@ enum DisasInsnEnum {
>   #define FAC_MIE3        S390_FEAT_MISC_INSTRUCTION_EXT3 /* miscellaneous-instruction-extensions facility 3 */
>   
>   static const DisasInsn insn_info[] = {
> -#include "insn-data.def"
> +#include "insn-data.h.inc"
>   };
>   
>   #undef E
> @@ -6233,7 +6233,7 @@ static const DisasInsn insn_info[] = {
>   static const DisasInsn *lookup_opc(uint16_t opc)
>   {
>       switch (opc) {
> -#include "insn-data.def"
> +#include "insn-data.h.inc"
>       default:
>           return NULL;
>       }

Applied to my trivial-patches branch.

Thanks,
Laurent



