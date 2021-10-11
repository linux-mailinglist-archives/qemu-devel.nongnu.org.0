Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAFF429905
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 23:36:22 +0200 (CEST)
Received: from localhost ([::1]:60236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma2y5-0004A4-Eq
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 17:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ma2uC-0003M8-7E
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 17:32:20 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:34668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ma2uA-0006az-Ad
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 17:32:19 -0400
Received: by mail-wr1-x42e.google.com with SMTP id y3so27230819wrl.1
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 14:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=9169UWlPdU4zsZFkAFAUipXRJGzCObevMR0qK9LxxvM=;
 b=HHkcZEUEaEQGyU5BcAx94m6i/xoX9uCzwx4Q9sj+Hol1Utz+Wq4DkrKvHmtfh5NfF4
 hjKJxZ8rrMIGbD2uAq3liaFLtzmRAZFQKGRdKMXtjfenS8JPINMAazoV9XXXOWN7axsC
 6qlO+qsg0PVG+6WCN0gAijpQsgL2/YSNw7s53KRhvEGkfgSpAYAK3LmgU6hNJs0jP70b
 gzA8ekTubbWXw4Wj6uep/hFoiHBJfGFnGbb9DUr4qOiOG7GGwl56ziwopqF8DUIxQrGK
 XfbLoaiw7r2FippQ3FFP7TG8GXCA7I76DiIF86IGqY34CEw00h6ejNg0LItr7g4YWQ3F
 nFew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=9169UWlPdU4zsZFkAFAUipXRJGzCObevMR0qK9LxxvM=;
 b=tUiXGRKW1mypXNd9pYP7bgf+5hAU0HV3OlHMTcFuflx68N9c+HpDKWflUfXZqcV+QR
 iF1g4DisrqdSlGj5E26Mlnuy3Ik0miX8u+PamisZxr3Bhd86dfQPIu3dCaYDvbtHu8V4
 fp2+V27HtEYNPDA3aRnXPwfFv7l5KiJcEG23p2s0GWHg8InartQLqJdyJJtV8E+s6upR
 +HVf3HkqV/Daf7bDuwBDA+v5NjrtGPFWEj3F3GOyL3b5L/2YKxWyZWv/o04JhfUDuAfG
 sqxhUWrynzmGLBv7LezwZqjuekrOMtxyLStFoe7aWi3gfq8msoOpVRjKyHA8PXk66KFk
 jsWw==
X-Gm-Message-State: AOAM532NiQL/3okyiW0MfmyAq6xib39+NaehuacgKxMigMWb/HGjDdMK
 snnmKPVCttTPX4NuxxUpgYLgCA==
X-Google-Smtp-Source: ABdhPJxmWK11FRPOOECcSYR7CoS10xBmv1N4SG+0/He0kDEMbOZHaH+u8VW+V4Y+3RnjS7lVk30FGQ==
X-Received: by 2002:adf:9c02:: with SMTP id f2mr27821117wrc.329.1633987935224; 
 Mon, 11 Oct 2021 14:32:15 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n66sm644786wmn.2.2021.10.11.14.32.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 14:32:14 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 490371FF96;
 Mon, 11 Oct 2021 22:32:13 +0100 (BST)
References: <20211011155729.3222362-1-alex.bennee@linaro.org>
 <0a67b397-813d-b34a-22fd-ee480dc6809b@linaro.org>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [RFC PATCH] target/s390x: move tcg_gen_insn_start to
 s390x_tr_insn_start
Date: Mon, 11 Oct 2021 22:31:24 +0100
In-reply-to: <0a67b397-813d-b34a-22fd-ee480dc6809b@linaro.org>
Message-ID: <8735p7xn6q.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: "open list:S390
 TCG CPUs" <qemu-s390x@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 10/11/21 8:57 AM, Alex Benn=C3=A9e wrote:
>> We use INDEX_op_insn_start to make the start of instruction
>> boundaries. If we don't do it in the .insn_start hook things get
>> confused especially now plugins want to use that marking to identify
>> the start of instructions and will bomb out if it sees instrumented
>> ops before the first instruction boundary.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   target/s390x/tcg/translate.c | 25 ++++++++++++++++++++++---
>>   1 file changed, 22 insertions(+), 3 deletions(-)
>> diff --git a/target/s390x/tcg/translate.c
>> b/target/s390x/tcg/translate.c
>> index f284870cd2..fe145ff2eb 100644
>> --- a/target/s390x/tcg/translate.c
>> +++ b/target/s390x/tcg/translate.c
>> @@ -6380,9 +6380,6 @@ static DisasJumpType translate_one(CPUS390XState *=
env, DisasContext *s)
>>       /* Search for the insn in the table.  */
>>       insn =3D extract_insn(env, s);
>>   -    /* Emit insn_start now that we know the ILEN.  */
>> -    tcg_gen_insn_start(s->base.pc_next, s->cc_op, s->ilen);
>> -
>>       /* Not found means unimplemented/illegal opcode.  */
>>       if (insn =3D=3D NULL) {
>>           qemu_log_mask(LOG_UNIMP, "unimplemented opcode 0x%02x%02x\n",
>> @@ -6550,8 +6547,30 @@ static void s390x_tr_tb_start(DisasContextBase *d=
b, CPUState *cs)
>>   {
>>   }
>>   +/*
>> + * We just enough partial instruction decoding here to calculate the
>> + * length of the instruction so we can drop the INDEX_op_insn_start
>> + * before anything else is emitted in the TCGOp stream.
>> + *
>> + * See extract_insn for the full decode.
>> + */
>>   static void s390x_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
>>   {
>> +    CPUS390XState *env =3D cs->env_ptr;
>> +    DisasContext *s =3D container_of(dcbase, DisasContext, base);
>> +    uint64_t insn, pc =3D s->base.pc_next;
>> +    int op, ilen;
>> +
>> +    if (unlikely(s->ex_value)) {
>> +        ilen =3D s->ex_value & 0xf;
>> +    } else {
>> +        insn =3D ld_code2(env, s, pc);  /* FIXME: don't reload same pc =
twice */
>
> I think we might as well delay the set of ilen until after the normal
> load, rather than introduce a fixme.

I'd got as far as this before thinking it was getting messy:

--8<---------------cut here---------------start------------->8---
squash! target/s390x: move tcg_gen_insn_start to s390x_tr_insn_start

1 file changed, 16 insertions(+), 19 deletions(-)
target/s390x/tcg/translate.c | 35 ++++++++++++++++-------------------

modified   target/s390x/tcg/translate.c
@@ -147,6 +147,7 @@ struct DisasContext {
      */
     uint64_t pc_tmp;
     uint32_t ilen;
+    uint16_t start_of_insn; /* collected at s390x_tr_insn_start */
     enum cc_op cc_op;
     bool do_debug;
 };
@@ -388,10 +389,10 @@ static void update_cc_op(DisasContext *s)
     }
 }
=20
-static inline uint64_t ld_code2(CPUS390XState *env, DisasContext *s,
+static inline uint16_t ld_code2(CPUS390XState *env, DisasContext *s,
                                 uint64_t pc)
 {
-    return (uint64_t)translator_lduw(env, &s->base, pc);
+    return translator_lduw(env, &s->base, pc);
 }
=20
 static inline uint64_t ld_code4(CPUS390XState *env, DisasContext *s,
@@ -6261,7 +6262,7 @@ static void extract_field(DisasFields *o, const Disas=
Field *f, uint64_t insn)
 static const DisasInsn *extract_insn(CPUS390XState *env, DisasContext *s)
 {
     uint64_t insn, pc =3D s->base.pc_next;
-    int op, op2, ilen;
+    int op, op2;
     const DisasInsn *info;
=20
     if (unlikely(s->ex_value)) {
@@ -6272,28 +6273,25 @@ static const DisasInsn *extract_insn(CPUS390XState =
*env, DisasContext *s)
=20
         /* Extract the values saved by EXECUTE.  */
         insn =3D s->ex_value & 0xffffffffffff0000ull;
-        ilen =3D s->ex_value & 0xf;
+        s->ilen =3D s->ex_value & 0xf;
         op =3D insn >> 56;
     } else {
-        insn =3D ld_code2(env, s, pc);
-        op =3D (insn >> 8) & 0xff;
-        ilen =3D get_ilen(op);
-        switch (ilen) {
+        op =3D extract32(s->start_of_insn, 8, 8);
+        insn =3D deposit64(0, 48, 16, s->start_of_insn);
+        switch (s->ilen) {
         case 2:
-            insn =3D insn << 48;
             break;
         case 4:
-            insn =3D ld_code4(env, s, pc) << 32;
+            insn =3D deposit64(insn, 32, 16, ld_code2(env, s, pc + 2));
             break;
         case 6:
-            insn =3D (insn << 48) | (ld_code4(env, s, pc + 2) << 16);
+            insn =3D deposit64(insn, 16, 32, ld_code4(env, s, pc + 2));
             break;
         default:
             g_assert_not_reached();
         }
     }
-    s->pc_tmp =3D s->base.pc_next + ilen;
-    s->ilen =3D ilen;
+    s->pc_tmp =3D s->base.pc_next + s->ilen;
=20
     /* We can't actually determine the insn format until we've looked up
        the full insn opcode.  Which we can't do without locating the
@@ -6558,18 +6556,17 @@ static void s390x_tr_insn_start(DisasContextBase *d=
cbase, CPUState *cs)
 {
     CPUS390XState *env =3D cs->env_ptr;
     DisasContext *s =3D container_of(dcbase, DisasContext, base);
-    uint64_t insn, pc =3D s->base.pc_next;
-    int op, ilen;
+    uint64_t pc =3D s->base.pc_next;
+    int ilen;
=20
     if (unlikely(s->ex_value)) {
         ilen =3D s->ex_value & 0xf;
     } else {
-        insn =3D ld_code2(env, s, pc);  /* FIXME: don't reload same pc twi=
ce */
-        op =3D (insn >> 8) & 0xff;
-        ilen =3D get_ilen(op);
+        s->start_of_insn =3D ld_code2(env, s, pc);
+        ilen =3D get_ilen(extract64(s->start_of_insn, 8, 8));
     }
=20
-    /* Emit insn_start now that we know the ILEN.  */
+    s->ilen =3D ilen;
     tcg_gen_insn_start(s->base.pc_next, s->cc_op, ilen);
 }
--8<---------------cut here---------------end--------------->8---
=20

--=20
Alex Benn=C3=A9e

