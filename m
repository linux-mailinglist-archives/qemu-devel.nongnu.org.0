Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA12F105152
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Nov 2019 12:22:47 +0100 (CET)
Received: from localhost ([::1]:38888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXkXu-0000vO-Pg
	for lists+qemu-devel@lfdr.de; Thu, 21 Nov 2019 06:22:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53088)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iXkWe-0000Rg-Dj
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 06:21:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iXkWc-0007Db-Lh
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 06:21:27 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:50639
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1iXkWc-0007DF-Hw
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 06:21:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574335285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YAvSNhWc8lrjRCvwfzOND2uoYIa/Upr42JwEo7roJoU=;
 b=WNAfzT0DtdvX1b23xgPcl2lLLljLxvXD01QWsi71lgrbCDYS6DXueZxGI99noM3SEeNbE/
 nKq89FN0byGQMrgyCpSut4FOJPPXQ4cKXmiWsBrhjZ1RWFQ9UBTJlgDdoy/q3CFW+Bq55i
 lJ2HlEhr3TFew4ChpELXGiW+wqd/WBQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-ze7zzMfuMS6UnVNXoLFRwg-1; Thu, 21 Nov 2019 06:21:22 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45AED8024E3;
 Thu, 21 Nov 2019 11:21:21 +0000 (UTC)
Received: from [10.36.116.214] (ovpn-116-214.ams2.redhat.com [10.36.116.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F8845ED46;
 Thu, 21 Nov 2019 11:21:19 +0000 (UTC)
Subject: Re: [PATCH 02/15] s390x: Beautify diag308 handling
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20191120114334.2287-1-frankja@linux.ibm.com>
 <20191120114334.2287-3-frankja@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <f4eca3d1-f5ac-8d5a-5b30-4a15a5987358@redhat.com>
Date: Thu, 21 Nov 2019 12:21:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191120114334.2287-3-frankja@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: ze7zzMfuMS6UnVNXoLFRwg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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

On 20.11.19 12:43, Janosch Frank wrote:
> Let's improve readability by:
> * Using constants for the subcodes
> * Moving parameter checking into a function
> * Removing subcode > 6 check as the default case catches that
>=20
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>   target/s390x/diag.c | 54 +++++++++++++++++++++++++++------------------
>   1 file changed, 32 insertions(+), 22 deletions(-)
>=20
> diff --git a/target/s390x/diag.c b/target/s390x/diag.c
> index 53c2f81f2a..067c667ba7 100644
> --- a/target/s390x/diag.c
> +++ b/target/s390x/diag.c
> @@ -53,6 +53,29 @@ int handle_diag_288(CPUS390XState *env, uint64_t r1, u=
int64_t r3)
>   #define DIAG_308_RC_NO_CONF         0x0102
>   #define DIAG_308_RC_INVALID         0x0402
>  =20
> +#define DIAG308_RES_MOD_CLR=09=090
> +#define DIAG308_RES_LOAD_NORM=09=091
> +#define DIAG308_LOAD_CLEAR=09=093
> +#define DIAG308_LOAD_NORMAL_DUMP=094
> +#define DIAG308_SET=09=09=095
> +#define DIAG308_STORE=09=09=096
> +
> +static int diag308_parm_check(CPUS390XState *env, uint64_t r1, uint64_t =
addr,
> +                              uintptr_t ra, bool write)
> +{
> +    if ((r1 & 1) || (addr & ~TARGET_PAGE_MASK)) {
> +        s390_program_interrupt(env, PGM_SPECIFICATION, ra);
> +        return -EINVAL;
> +    }
> +    if (!address_space_access_valid(&address_space_memory, addr,
> +                                    sizeof(IplParameterBlock), write,
> +                                    MEMTXATTRS_UNSPECIFIED)) {
> +        s390_program_interrupt(env, PGM_ADDRESSING, ra);
> +        return -EINVAL;
> +    }
> +    return 0;
> +}
> +
>   void handle_diag_308(CPUS390XState *env, uint64_t r1, uint64_t r3, uint=
ptr_t ra)
>   {
>       CPUState *cs =3D env_cpu(env);
> @@ -65,30 +88,24 @@ void handle_diag_308(CPUS390XState *env, uint64_t r1,=
 uint64_t r3, uintptr_t ra)
>           return;
>       }
>  =20
> -    if ((subcode & ~0x0ffffULL) || (subcode > 6)) {
> +    if (subcode & ~0x0ffffULL) {

Strange, the default case in the switch was basically dead code.

>           s390_program_interrupt(env, PGM_SPECIFICATION, ra);
>           return;
>       }
>  =20
>       switch (subcode) {
> -    case 0:
> +    case DIAG308_RES_MOD_CLR:
>           s390_ipl_reset_request(cs, S390_RESET_MODIFIED_CLEAR);
>           break;
> -    case 1:
> +    case DIAG308_RES_LOAD_NORM:
>           s390_ipl_reset_request(cs, S390_RESET_LOAD_NORMAL);
>           break;
> -    case 3:
> +    case DIAG308_LOAD_CLEAR:
> +        /* Well we still lack the clearing bit... */
>           s390_ipl_reset_request(cs, S390_RESET_REIPL);
>           break;
> -    case 5:
> -        if ((r1 & 1) || (addr & 0x0fffULL)) {
> -            s390_program_interrupt(env, PGM_SPECIFICATION, ra);
> -            return;
> -        }
> -        if (!address_space_access_valid(&address_space_memory, addr,
> -                                        sizeof(IplParameterBlock), false=
,
> -                                        MEMTXATTRS_UNSPECIFIED)) {
> -            s390_program_interrupt(env, PGM_ADDRESSING, ra);
> +    case DIAG308_SET:
> +        if (diag308_parm_check(env, r1, addr, ra, false)) {
>               return;
>           }
>           iplb =3D g_new0(IplParameterBlock, 1);
> @@ -110,15 +127,8 @@ void handle_diag_308(CPUS390XState *env, uint64_t r1=
, uint64_t r3, uintptr_t ra)
>   out:
>           g_free(iplb);
>           return;
> -    case 6:
> -        if ((r1 & 1) || (addr & 0x0fffULL)) {
> -            s390_program_interrupt(env, PGM_SPECIFICATION, ra);
> -            return;
> -        }
> -        if (!address_space_access_valid(&address_space_memory, addr,
> -                                        sizeof(IplParameterBlock), true,
> -                                        MEMTXATTRS_UNSPECIFIED)) {
> -            s390_program_interrupt(env, PGM_ADDRESSING, ra);
> +    case DIAG308_STORE:
> +        if (diag308_parm_check(env, r1, addr, ra, true)) {
>               return;
>           }
>           iplb =3D s390_ipl_get_iplb();
>=20

Reviewed-by: David Hildenbrand <david@redhat.com>

--=20

Thanks,

David / dhildenb


