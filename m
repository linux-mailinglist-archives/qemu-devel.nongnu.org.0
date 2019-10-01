Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA3DC2CB8
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 06:55:54 +0200 (CEST)
Received: from localhost ([::1]:59052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFACX-0005BZ-48
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 00:55:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36858)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iFABN-0004eW-Ur
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 00:54:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iFABL-0004CC-6P
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 00:54:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53000)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1iFABK-0004Bk-Up; Tue, 01 Oct 2019 00:54:39 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 83CAAC0568FA;
 Tue,  1 Oct 2019 04:54:37 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-70.ams2.redhat.com [10.36.116.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB3CF10013D9;
 Tue,  1 Oct 2019 04:54:32 +0000 (UTC)
Subject: Re: [PATCH v3 6/7] s390x/mmu: DAT table definition overhaul
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20190927095831.23543-1-david@redhat.com>
 <20190927095831.23543-7-david@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat
Message-ID: <dccde1e6-f91f-2e65-bf04-220764d4fa2c@redhat.com>
Date: Tue, 1 Oct 2019 06:54:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190927095831.23543-7-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Tue, 01 Oct 2019 04:54:37 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/09/2019 11.58, David Hildenbrand wrote:
> Let's use consitent names for the region/section/page table entries and
> for the macros to extract relevant parts from virtual address. Make the=
m
> match the definitions in the PoP - e.g., how the relevant bits are actu=
ally
> called.
>=20
> Introduce defines for all bits declared in the PoP. This will come in
> handy in follow-up patches.
>=20
> Add a note where additional information about s390x and the used
> definitions can be found.
>=20
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/cpu.h        | 81 +++++++++++++++++++++++++++++----------
>  target/s390x/mem_helper.c | 12 +++---
>  target/s390x/mmu_helper.c | 37 ++++++++++--------
>  3 files changed, 87 insertions(+), 43 deletions(-)
>=20
> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
> index 163dae13d7..690b94c8ea 100644
> --- a/target/s390x/cpu.h
> +++ b/target/s390x/cpu.h
> @@ -1,6 +1,10 @@
>  /*
>   * S/390 virtual CPU header
>   *
> + * For details on the s390x architecture and used definitions (e.g.,
> + * PSW, PER and DAT (Dynamic Address Translation)), please refer to
> + * the "z/Architecture Principles of Operations" - a.k.a. PoP.
> + *
>   *  Copyright (c) 2009 Ulrich Hecht
>   *  Copyright IBM Corp. 2012, 2018
>   *
> @@ -558,26 +562,63 @@ QEMU_BUILD_BUG_ON(sizeof(SysIB) !=3D 4096);
>  #define ASCE_TYPE_SEGMENT     0x00        /* segment table type       =
        */
>  #define ASCE_TABLE_LENGTH     0x03        /* region table length      =
        */
> =20
> -#define REGION_ENTRY_ORIGIN   (~0xfffULL) /* region/segment table orig=
in    */
> -#define REGION_ENTRY_RO       0x200       /* region/segment protection=
 bit  */
> -#define REGION_ENTRY_TF       0xc0        /* region/segment table offs=
et    */
> -#define REGION_ENTRY_INV      0x20        /* invalid region table entr=
y     */
> -#define REGION_ENTRY_TYPE_MASK 0x0c       /* region/segment table type=
 mask */
> -#define REGION_ENTRY_TYPE_R1  0x0c        /* region first table type  =
      */
> -#define REGION_ENTRY_TYPE_R2  0x08        /* region second table type =
      */
> -#define REGION_ENTRY_TYPE_R3  0x04        /* region third table type  =
      */
> -#define REGION_ENTRY_LENGTH   0x03        /* region third length      =
      */
> -
> -#define SEGMENT_ENTRY_ORIGIN  (~0x7ffULL) /* segment table origin     =
   */
> -#define SEGMENT_ENTRY_FC      0x400       /* format control           =
   */
> -#define SEGMENT_ENTRY_RO      0x200       /* page protection bit      =
   */
> -#define SEGMENT_ENTRY_INV     0x20        /* invalid segment table ent=
ry */
> -
> -#define VADDR_PX              0xff000     /* page index bits   */
> -
> -#define PAGE_RO               0x200       /* HW read-only bit  */
> -#define PAGE_INVALID          0x400       /* HW invalid bit    */
> -#define PAGE_RES0             0x800       /* bit must be zero  */
> +#define REGION_ENTRY_ORIGIN         0xfffffffffffff000ULL
> +#define REGION_ENTRY_P              0x0000000000000200ULL
> +#define REGION_ENTRY_TF             0x00000000000000c0ULL
> +#define REGION_ENTRY_I              0x0000000000000020ULL
> +#define REGION_ENTRY_TT             0x000000000000000cULL
> +#define REGION_ENTRY_TL             0x0000000000000003ULL
> +
> +#define REGION_ENTRY_TT_REGION1     0x000000000000000cULL
> +#define REGION_ENTRY_TT_REGION2     0x0000000000000008ULL
> +#define REGION_ENTRY_TT_REGION3     0x0000000000000004ULL
> +
> +#define REGION3_ENTRY_RFAA          0xffffffff80000000ULL
> +#define REGION3_ENTRY_AV            0x0000000000010000ULL
> +#define REGION3_ENTRY_ACC           0x000000000000f000ULL
> +#define REGION3_ENTRY_F             0x0000000000000800ULL
> +#define REGION3_ENTRY_FC            0x0000000000000400ULL
> +#define REGION3_ENTRY_IEP           0x0000000000000100ULL
> +#define REGION3_ENTRY_CR            0x0000000000000010ULL
> +
> +#define SEGMENT_ENTRY_ORIGIN        0xfffffffffffff800ULL
> +#define SEGMENT_ENTRY_SFAA          0xfffffffffff80000ULL

I think SFAA should be 0xfffffffffff00000ULL instead?

> +#define SEGMENT_ENTRY_AV            0x0000000000010000ULL
> +#define SEGMENT_ENTRY_ACC           0x000000000000f000ULL
> +#define SEGMENT_ENTRY_F             0x0000000000000800ULL
> +#define SEGMENT_ENTRY_FC            0x0000000000000400ULL
> +#define SEGMENT_ENTRY_P             0x0000000000000200ULL
> +#define SEGMENT_ENTRY_IEP           0x0000000000000100ULL
> +#define SEGMENT_ENTRY_I             0x0000000000000020ULL
> +#define SEGMENT_ENTRY_CS            0x0000000000000010ULL
> +#define SEGMENT_ENTRY_TT            0x000000000000000cULL
> +
> +#define SEGMENT_ENTRY_TT_REGION1    0x000000000000000cULL
> +#define SEGMENT_ENTRY_TT_REGION2    0x0000000000000008ULL
> +#define SEGMENT_ENTRY_TT_REGION3    0x0000000000000004ULL

The above three definitions do not make much sense. TT should always be
00 for segment table entries.

> +#define SEGMENT_ENTRY_TT_SEGMENT    0x0000000000000000ULL
> +
> +#define PAGE_ENTRY_0                0x0000000000000800ULL
> +#define PAGE_ENTRY_I                0x0000000000000400ULL
> +#define PAGE_ENTRY_P                0x0000000000000200ULL
> +#define PAGE_ENTRY_IEP              0x0000000000000100ULL
> +
> +#define VADDR_REGION1_TX_MASK       0xffe0000000000000ULL
> +#define VADDR_REGION2_TX_MASK       0x001ffc0000000000ULL
> +#define VADDR_REGION3_TX_MASK       0x000003ff80000000ULL
> +#define VADDR_SEGMENT_TX_MASK       0x000000007ff00000ULL
> +#define VADDR_PAGE_TX_MASK          0x00000000000ff000ULL
> +
> +#define VADDR_REGION1_TX(vaddr)     (((vaddr) & VADDR_REGION1_TX_MASK)=
 >> 53)
> +#define VADDR_REGION2_TX(vaddr)     (((vaddr) & VADDR_REGION2_TX_MASK)=
 >> 42)
> +#define VADDR_REGION3_TX(vaddr)     (((vaddr) & VADDR_REGION3_TX_MASK)=
 >> 31)
> +#define VADDR_SEGMENT_TX(vaddr)     (((vaddr) & VADDR_SEGMENT_TX_MASK)=
 >> 20)
> +#define VADDR_PAGE_TX(vaddr)        (((vaddr) & VADDR_PAGE_TX_MASK) >>=
 12)
> +
> +#define VADDR_REGION1_TL(vaddr)     (((vaddr) & 0xc000000000000000ULL)=
 >> 62)
> +#define VADDR_REGION2_TL(vaddr)     (((vaddr) & 0x0018000000000000ULL)=
 >> 51)
> +#define VADDR_REGION3_TL(vaddr)     (((vaddr) & 0x0000030000000000ULL)=
 >> 40)
> +#define VADDR_SEGMENT_TL(vaddr)     (((vaddr) & 0x0000000060000000ULL)=
 >> 29)
> =20
>  #define SK_C                    (0x1 << 1)
>  #define SK_R                    (0x1 << 2)
> diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
> index 44e535856d..08c5cc6a99 100644
> --- a/target/s390x/mem_helper.c
> +++ b/target/s390x/mem_helper.c

The rest of the patch looks fine to me.

 Thomas

