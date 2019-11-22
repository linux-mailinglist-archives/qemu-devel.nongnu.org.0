Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE67107405
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Nov 2019 15:23:04 +0100 (CET)
Received: from localhost ([::1]:51640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iY9pv-00039r-M3
	for lists+qemu-devel@lfdr.de; Fri, 22 Nov 2019 09:23:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33834)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iY9os-0002X5-OW
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 09:22:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iY9or-0000sn-Kx
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 09:21:58 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:46160
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1iY9or-0000sY-Hn
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 09:21:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574432517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=no7Y78XcGUpscwWNqRnAyW68uwxu3RR3BOrRYLv7/0Y=;
 b=F/6jhFcybkC0+wgqsW8kCElzvynfwhLxM8RVaF9gOoKFZMfJvK8zmOgbgH5G/juEK7slaf
 pzFATMmwiI/34hrc0rONL5NxfkfgR+/JnGEqCexsofC06fmdsAX7leuAHptD6SQ24R6B+C
 mRNx8coDcklhH+reM2PV81b3o26LOBQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-o36Ow3mQMHiBE_62Qx8_dw-1; Fri, 22 Nov 2019 09:21:53 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AB2C593A1;
 Fri, 22 Nov 2019 14:21:52 +0000 (UTC)
Received: from [10.36.116.122] (ovpn-116-122.ams2.redhat.com [10.36.116.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E21BB18203;
 Fri, 22 Nov 2019 14:21:46 +0000 (UTC)
Subject: Re: [PATCH v2 3/5] s390x: Move initial reset
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20191122140002.42972-1-frankja@linux.ibm.com>
 <20191122140002.42972-4-frankja@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <70378a12-00a5-e465-0f60-87abea9937c5@redhat.com>
Date: Fri, 22 Nov 2019 15:21:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191122140002.42972-4-frankja@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: o36Ow3mQMHiBE_62Qx8_dw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: thuth@redhat.com, pmorel@linux.ibm.com, cohuck@redhat.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, mihajlov@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.11.19 15:00, Janosch Frank wrote:
> Let's move the intial reset into the reset handler and cleanup
> afterwards.
>=20
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>  target/s390x/cpu-qom.h |  2 +-
>  target/s390x/cpu.c     | 44 +++++++++++++++---------------------------
>  target/s390x/cpu.h     |  2 +-
>  target/s390x/sigp.c    |  2 +-
>  4 files changed, 19 insertions(+), 31 deletions(-)
>=20
> diff --git a/target/s390x/cpu-qom.h b/target/s390x/cpu-qom.h
> index f3b71bac67..6f0a12042e 100644
> --- a/target/s390x/cpu-qom.h
> +++ b/target/s390x/cpu-qom.h
> @@ -36,6 +36,7 @@ typedef struct S390CPUDef S390CPUDef;
> =20
>  typedef enum cpu_reset_type {
>      S390_CPU_RESET_NORMAL,
> +    S390_CPU_RESET_INITIAL,
>  } cpu_reset_type;
> =20
>  /**
> @@ -62,7 +63,6 @@ typedef struct S390CPUClass {
>      void (*parent_reset)(CPUState *cpu);
>      void (*load_normal)(CPUState *cpu);
>      void (*reset)(CPUState *cpu, cpu_reset_type type);
> -    void (*initial_cpu_reset)(CPUState *cpu);
>  } S390CPUClass;
> =20
>  typedef struct S390CPU S390CPU;
> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
> index cf13472472..1f423fb676 100644
> --- a/target/s390x/cpu.c
> +++ b/target/s390x/cpu.c
> @@ -94,37 +94,26 @@ static void s390_cpu_reset(CPUState *s, cpu_reset_typ=
e type)
>      s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu);
> =20
>      switch (type) {
> +    case S390_CPU_RESET_INITIAL:
> +        /* initial reset does not clear everything! */
> +        memset(&env->start_initial_reset_fields, 0,
> +               offsetof(CPUS390XState, end_reset_fields) -
> +               offsetof(CPUS390XState, start_initial_reset_fields));
> +
> +        /* architectured initial value for Breaking-Event-Address regist=
er */
> +        env->gbea =3D 1;
> +
> +        /* architectured initial values for CR 0 and 14 */
> +        env->cregs[0] =3D CR0_RESET;
> +        env->cregs[14] =3D CR14_RESET;
> +
> +        /* tininess for underflow is detected before rounding */
> +        set_float_detect_tininess(float_tininess_before_rounding,
> +                                  &env->fpu_status);

/* fall through */

>      case S390_CPU_RESET_NORMAL:
>          env->pfault_token =3D -1UL;
>          env->bpbc =3D false;
> -        break;
>      }

Removing the break here seems strange. I guess this belongs to another
patch.


Apart from that

Reviewed-by: David Hildenbrand <david@redhat.com>

--=20

Thanks,

David / dhildenb


