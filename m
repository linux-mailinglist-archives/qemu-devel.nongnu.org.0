Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5641D11547D
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 16:43:50 +0100 (CET)
Received: from localhost ([::1]:39958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idFlk-0005QD-V3
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 10:43:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45427)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1idEke-0008Kw-Cr
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:38:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1idEkc-0000dS-Uy
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:38:36 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38758
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1idEkc-0000br-Mi
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:38:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575643114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=gLJWm+FQZM8dwXcRbrQ5cFeft0Qmo9puRyKkgIw70r0=;
 b=MXXJfMiYArhCatnIDVlD9clTNFoo3TdAyeqzG/QSp/orJKVMxiDdkachCuN6msk9cefu3C
 ejS0ka94tRv7UegKL1tkluYLd0i8d9Iqq2xk4j5XOgtpGbPeHTCd62WYhl4EKs228TvBqC
 h8Xyg0xS/WTsesOv8BxrKAlTJYDazqI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-eTI0jWEJM1ePjlQyF4B-AA-1; Fri, 06 Dec 2019 04:36:43 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2543E800EB9;
 Fri,  6 Dec 2019 09:36:42 +0000 (UTC)
Received: from [10.36.117.54] (ovpn-117-54.ams2.redhat.com [10.36.117.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B53A5DA32;
 Fri,  6 Dec 2019 09:36:40 +0000 (UTC)
Subject: Re: [PATCH] s390x/tcg: clear local interrupts on reset normal
To: Cornelia Huck <cohuck@redhat.com>, Richard Henderson <rth@twiddle.net>
References: <20191205103844.10404-1-cohuck@redhat.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <4939898a-99c6-2257-9f44-3d706190f331@redhat.com>
Date: Fri, 6 Dec 2019 10:36:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191205103844.10404-1-cohuck@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: eTI0jWEJM1ePjlQyF4B-AA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.12.19 11:38, Cornelia Huck wrote:
> We neglected to clean up pending interrupts and emergency signals;
> fix that.
>=20
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>=20
> Noted while looking at the fixes for the kvm reset handling.
>=20
> We now clear some fields twice in the paths for clear or initial reset;
> but (a) we already do that for other fields and (b) it does not really
> hurt. Maybe we should give the cpu structure some love in the future,
> as it's not always clear whether some fields are tcg only.
>=20
> ---
>  target/s390x/cpu.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
> index 829ce6ad5491..f2572961dc3a 100644
> --- a/target/s390x/cpu.c
> +++ b/target/s390x/cpu.c
> @@ -133,6 +133,9 @@ static void s390_cpu_reset(CPUState *s, cpu_reset_typ=
e type)
>      case S390_CPU_RESET_NORMAL:
>          env->pfault_token =3D -1UL;
>          env->bpbc =3D false;
> +        env->pending_int =3D 0;
> +        env->external_call_addr =3D 0;
> +        bitmap_zero(env->emergency_signals, S390_MAX_CPUS);
>          break;
>      default:
>          g_assert_not_reached();
>=20

I'd suggest we rework the memsetting instead, now that we always
"fall through" in this call chain, e.g, something like

diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index bd39cb54b7..492f0c766d 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -95,12 +95,14 @@ static void s390_cpu_reset(CPUState *s, cpu_reset_type =
type)
=20
     switch (type) {
     case S390_CPU_RESET_CLEAR:
-        memset(env, 0, offsetof(CPUS390XState, start_initial_reset_fields)=
);
+        memset(&env->start_clear_reset_fields, 0,
+               offsetof(CPUS390XState, end_clear_reset_fields) -
+               offsetof(CPUS390XState, start_clear_reset_fields));
         /* fall through */
     case S390_CPU_RESET_INITIAL:
         /* initial reset does not clear everything! */
         memset(&env->start_initial_reset_fields, 0,
-               offsetof(CPUS390XState, end_reset_fields) -
+               offsetof(CPUS390XState, end_initial_reset_fields) -
                offsetof(CPUS390XState, start_initial_reset_fields));
=20
         /* architectured initial value for Breaking-Event-Address register=
 */
@@ -123,8 +125,10 @@ static void s390_cpu_reset(CPUState *s, cpu_reset_type=
 type)
                                   &env->fpu_status);
        /* fall through */
     case S390_CPU_RESET_NORMAL:
+        memset(&env->start_normal_reset_fields, 0,
+               offsetof(CPUS390XState, end_normal_reset_fields) -
+               offsetof(CPUS390XState, start_normal_reset_fields));
         env->pfault_token =3D -1UL;
-        env->bpbc =3D false;
         break;
     default:
         g_assert_not_reached();
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index d2af13b345..fe2ab6b89e 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -51,6 +51,9 @@ typedef struct PSW {
 } PSW;
=20
 struct CPUS390XState {
+
+    struct {} start_clear_reset_fields;
+
     uint64_t regs[16];     /* GP registers */
     /*
      * The floating point registers are part of the vector registers.
@@ -63,12 +66,11 @@ struct CPUS390XState {
     uint64_t etoken;       /* etoken */
     uint64_t etoken_extension; /* etoken extension */
=20
-    /* Fields up to this point are not cleared by initial CPU reset */
+    struct {} end_clear_reset_fields;
     struct {} start_initial_reset_fields;
=20
     uint32_t fpc;          /* floating-point control register */
     uint32_t cc_op;
-    bool bpbc;             /* branch prediction blocking */
=20
     float_status fpu_status; /* passed to softfloat lib */
=20
@@ -99,10 +101,6 @@ struct CPUS390XState {
=20
     uint64_t cregs[16]; /* control registers */
=20
-    int pending_int;
-    uint16_t external_call_addr;
-    DECLARE_BITMAP(emergency_signals, S390_MAX_CPUS);
-
     uint64_t ckc;
     uint64_t cputm;
     uint32_t todpr;
@@ -114,8 +112,17 @@ struct CPUS390XState {
     uint64_t gbea;
     uint64_t pp;
=20
-    /* Fields up to this point are cleared by a CPU reset */
-    struct {} end_reset_fields;
+    struct {} end_initial_reset_fields;
+    struct {} start_normal_reset_fields;
+
+    /* local interrupt state */
+    int pending_int;
+    uint16_t external_call_addr;
+    DECLARE_BITMAP(emergency_signals, S390_MAX_CPUS);
+
+    bool bpbc;             /* branch prediction blocking */
+
+    struct {} end_normal_reset_fields;
=20
 #if !defined(CONFIG_USER_ONLY)
     uint32_t core_id; /* PoP "CPU address", same as cpu_index */
--=20
2.21.0


Wrapping in CONFIG_TCG requires more work.

--=20
Thanks,

David / dhildenb


