Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0750E529CE7
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 10:49:11 +0200 (CEST)
Received: from localhost ([::1]:56484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqstB-0007RN-Gm
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 04:49:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nqsoT-0005cd-TE
 for qemu-devel@nongnu.org; Tue, 17 May 2022 04:44:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nqsoR-0004ZS-1t
 for qemu-devel@nongnu.org; Tue, 17 May 2022 04:44:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652777050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r8LhaYwWO2JwzOg3pILkoeFZU7uLoaHeAQnRbHakc+Y=;
 b=C8e6SxBaRszdRv75ecUD6ADIuSixzr6wRGan84DjV7q/yK2f1Nl6CPrP5bvFug0kKfU8ym
 BXP3w4iAol9SuAxi2Pn96GAZCzoEipekQSLrAGKYNBMF0ZpZD4vwV0vka3rbgNOd6k4J7I
 W/iHhahQgK5ettm0UVJnS2R3TGsa8ZI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-511-ST4gJyijNWeUQWiSW5Qg5g-1; Tue, 17 May 2022 04:44:09 -0400
X-MC-Unique: ST4gJyijNWeUQWiSW5Qg5g-1
Received: by mail-wr1-f69.google.com with SMTP id
 f17-20020adff451000000b0020d076c19a5so1022961wrp.0
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 01:44:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=r8LhaYwWO2JwzOg3pILkoeFZU7uLoaHeAQnRbHakc+Y=;
 b=HLeGhjFBmok9fH7N0hhu+xUa9kF6nnPhoNChogFP5uxVGKJafJ/BLUG+DStgK89FH0
 azTGO434X5g1QID2zP/m9nBnyI/319pGcOr4C6iujBmDCnH8XgZl5/CQBDdouON8sGYO
 fzdviM3bnbM66HU/atMLuojo6WOH2LgiYgQdiKx7g1zBkn13hQzUtdPLohnuLItc0v3r
 VXvifMq0oihe/gtXR5Jan67SNEUE8YIQtR6FKQV2qQGey+OzBdToTLFA799Jd4R4O/xi
 k8pDVMjlXUEQRXojhSrAKqFL4c9ucA65wUrKD8OTpd3JSRQP02TiisZeYyzgnPpIDBhG
 zTUA==
X-Gm-Message-State: AOAM530NbxgCwA/ViAkOlbG/j+tneBp/9GYe2e6zEGm7v0NaWdHVLb9X
 TsDehI5jXRWm1P8VJjnu0FQTu+mW3TSWMI2NOb4EZfE5+0SPHj/SFezXc290H8NIw817XOnsb6p
 eqCLKP5VIoc3pWIY=
X-Received: by 2002:a05:6000:228:b0:20d:6eb:e778 with SMTP id
 l8-20020a056000022800b0020d06ebe778mr8523217wrz.311.1652777047522; 
 Tue, 17 May 2022 01:44:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5tgm886bFV6YqwQhe/0B3RioRweGJf4WkPCHHYFHHshgszi0nkHxZA6rjOAJvFBzDZfnG9A==
X-Received: by 2002:a05:6000:228:b0:20d:6eb:e778 with SMTP id
 l8-20020a056000022800b0020d06ebe778mr8523199wrz.311.1652777047274; 
 Tue, 17 May 2022 01:44:07 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 6-20020a056000154600b0020d0b2de858sm4910928wry.33.2022.05.17.01.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 01:44:06 -0700 (PDT)
Date: Tue, 17 May 2022 09:44:04 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Peter Xu <peterx@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Leonardo Bras <leobras@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH v6 02/13] multifd: Create page_size fields into both
 MultiFD{Recv,Send}Params
Message-ID: <YoNgVHf4frHI05m8@work-vm>
References: <20220510224220.5912-1-quintela@redhat.com>
 <20220510224220.5912-3-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220510224220.5912-3-quintela@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> We were calling qemu_target_page_size() left and right.
>=20
> Signed-off-by: Juan Quintela <quintela@redhat.com>

(Copying in Peter Maydell)
Your problem here is most of these files are target independent
so you end up calling the qemu_target_page_size functions, which I guess
you're seeing popup in some perf trace?
I mean they're trivial functions but I guess you do get the function
call.

I wonder about the following patch instead
(Note i've removed the const on the structure here); I wonder how this
does performance wise for everyone:


=46rom abc7da46736b18b6138868ccc0b11901169e1dfd Mon Sep 17 00:00:00 2001
=46rom: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Date: Mon, 16 May 2022 19:54:31 +0100
Subject: [PATCH] target-page: Maintain target_page variable even for
 non-variable
Content-type: text/plain

On architectures that define TARGET_PAGE_BITS_VARY, the 'target_page'
structure gets filled in at run time by the number of bits and the
TARGET_PAGE_BITS and TARGET_PAGE macros use that rather than being
constant.

On non-variable pagesize systems target_page is not filled in, and we
rely on TARGET_PAGE_SIZE being compile time defined.

The problem is that for source files that are target-independent
they end up calling qemu_target_page_size to read the size, and that
function call is annoying.

Improve this by always filling in 'target_page' even for non-variable
size CPUs, and inlining the functions that previously returned
the macro values (that may have been constant) to return the
values read from target_page.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 include/exec/cpu-all.h     |  4 ++--
 include/exec/page-vary.h   |  2 ++
 include/exec/target_page.h | 11 +++++++++--
 page-vary.c                |  2 --
 softmmu/physmem.c          | 10 ----------
 5 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 5d5290deb5..6a498fa033 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -214,9 +214,9 @@ static inline void stl_phys_notdirty(AddressSpace *as, =
hwaddr addr, uint32_t val
=20
 /* page related stuff */
=20
+#include "exec/page-vary.h"
+
 #ifdef TARGET_PAGE_BITS_VARY
-# include "exec/page-vary.h"
-extern const TargetPageBits target_page;
 #ifdef CONFIG_DEBUG_TCG
 #define TARGET_PAGE_BITS   ({ assert(target_page.decided); target_page.bit=
s; })
 #define TARGET_PAGE_MASK   ({ assert(target_page.decided); \
diff --git a/include/exec/page-vary.h b/include/exec/page-vary.h
index ebbe9b169b..31cb9dd9dd 100644
--- a/include/exec/page-vary.h
+++ b/include/exec/page-vary.h
@@ -26,6 +26,8 @@ typedef struct {
     uint64_t mask;
 } TargetPageBits;
=20
+extern TargetPageBits target_page;
+
 #ifdef IN_PAGE_VARY
 extern bool set_preferred_target_page_bits_common(int bits);
 extern void finalize_target_page_bits_common(int min);
diff --git a/include/exec/target_page.h b/include/exec/target_page.h
index 96726c36a4..e718b145b3 100644
--- a/include/exec/target_page.h
+++ b/include/exec/target_page.h
@@ -13,9 +13,16 @@
=20
 #ifndef EXEC_TARGET_PAGE_H
 #define EXEC_TARGET_PAGE_H
+#include "exec/page-vary.h"
+
+inline int qemu_target_page_bits(void) {
+    return target_page.bits;
+}
+
+inline size_t qemu_target_page_size(void) {
+    return 1 << target_page.bits;
+}
=20
-size_t qemu_target_page_size(void);
-int qemu_target_page_bits(void);
 int qemu_target_page_bits_min(void);
=20
 #endif
diff --git a/page-vary.c b/page-vary.c
index 343b4adb95..3f81144cda 100644
--- a/page-vary.c
+++ b/page-vary.c
@@ -35,7 +35,5 @@ bool set_preferred_target_page_bits(int bits)
=20
 void finalize_target_page_bits(void)
 {
-#ifdef TARGET_PAGE_BITS_VARY
     finalize_target_page_bits_common(TARGET_PAGE_BITS_MIN);
-#endif
 }
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 657841eed0..2117476081 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -3515,16 +3515,6 @@ int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
  * Allows code that needs to deal with migration bitmaps etc to still be b=
uilt
  * target independent.
  */
-size_t qemu_target_page_size(void)
-{
-    return TARGET_PAGE_SIZE;
-}
-
-int qemu_target_page_bits(void)
-{
-    return TARGET_PAGE_BITS;
-}
-
 int qemu_target_page_bits_min(void)
 {
     return TARGET_PAGE_BITS_MIN;
--=20
2.36.1

> ---
>  migration/multifd.h      |  4 ++++
>  migration/multifd-zlib.c | 12 +++++-------
>  migration/multifd-zstd.c | 12 +++++-------
>  migration/multifd.c      | 18 ++++++++----------
>  4 files changed, 22 insertions(+), 24 deletions(-)
>=20
> diff --git a/migration/multifd.h b/migration/multifd.h
> index f1f88c6737..4de80d9e53 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -80,6 +80,8 @@ typedef struct {
>      bool registered_yank;
>      /* packet allocated len */
>      uint32_t packet_len;
> +    /* guest page size */
> +    uint32_t page_size;
> =20
>      /* sem where to wait for more work */
>      QemuSemaphore sem;
> @@ -141,6 +143,8 @@ typedef struct {
>      QIOChannel *c;
>      /* packet allocated len */
>      uint32_t packet_len;
> +    /* guest page size */
> +    uint32_t page_size;
> =20
>      /* syncs main thread and channels */
>      QemuSemaphore sem_sync;
> diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
> index 3a7ae44485..28349ff2e0 100644
> --- a/migration/multifd-zlib.c
> +++ b/migration/multifd-zlib.c
> @@ -100,7 +100,6 @@ static void zlib_send_cleanup(MultiFDSendParams *p, E=
rror **errp)
>  static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
>  {
>      struct zlib_data *z =3D p->data;
> -    size_t page_size =3D qemu_target_page_size();
>      z_stream *zs =3D &z->zs;
>      uint32_t out_size =3D 0;
>      int ret;
> @@ -114,7 +113,7 @@ static int zlib_send_prepare(MultiFDSendParams *p, Er=
ror **errp)
>              flush =3D Z_SYNC_FLUSH;
>          }
> =20
> -        zs->avail_in =3D page_size;
> +        zs->avail_in =3D p->page_size;
>          zs->next_in =3D p->pages->block->host + p->normal[i];
> =20
>          zs->avail_out =3D available;
> @@ -220,12 +219,11 @@ static void zlib_recv_cleanup(MultiFDRecvParams *p)
>  static int zlib_recv_pages(MultiFDRecvParams *p, Error **errp)
>  {
>      struct zlib_data *z =3D p->data;
> -    size_t page_size =3D qemu_target_page_size();
>      z_stream *zs =3D &z->zs;
>      uint32_t in_size =3D p->next_packet_size;
>      /* we measure the change of total_out */
>      uint32_t out_size =3D zs->total_out;
> -    uint32_t expected_size =3D p->normal_num * page_size;
> +    uint32_t expected_size =3D p->normal_num * p->page_size;
>      uint32_t flags =3D p->flags & MULTIFD_FLAG_COMPRESSION_MASK;
>      int ret;
>      int i;
> @@ -252,7 +250,7 @@ static int zlib_recv_pages(MultiFDRecvParams *p, Erro=
r **errp)
>              flush =3D Z_SYNC_FLUSH;
>          }
> =20
> -        zs->avail_out =3D page_size;
> +        zs->avail_out =3D p->page_size;
>          zs->next_out =3D p->host + p->normal[i];
> =20
>          /*
> @@ -266,8 +264,8 @@ static int zlib_recv_pages(MultiFDRecvParams *p, Erro=
r **errp)
>          do {
>              ret =3D inflate(zs, flush);
>          } while (ret =3D=3D Z_OK && zs->avail_in
> -                             && (zs->total_out - start) < page_size);
> -        if (ret =3D=3D Z_OK && (zs->total_out - start) < page_size) {
> +                             && (zs->total_out - start) < p->page_size);
> +        if (ret =3D=3D Z_OK && (zs->total_out - start) < p->page_size) {
>              error_setg(errp, "multifd %u: inflate generated too few outp=
ut",
>                         p->id);
>              return -1;
> diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
> index d788d309f2..f4a8e1ed1f 100644
> --- a/migration/multifd-zstd.c
> +++ b/migration/multifd-zstd.c
> @@ -113,7 +113,6 @@ static void zstd_send_cleanup(MultiFDSendParams *p, E=
rror **errp)
>  static int zstd_send_prepare(MultiFDSendParams *p, Error **errp)
>  {
>      struct zstd_data *z =3D p->data;
> -    size_t page_size =3D qemu_target_page_size();
>      int ret;
>      uint32_t i;
> =20
> @@ -128,7 +127,7 @@ static int zstd_send_prepare(MultiFDSendParams *p, Er=
ror **errp)
>              flush =3D ZSTD_e_flush;
>          }
>          z->in.src =3D p->pages->block->host + p->normal[i];
> -        z->in.size =3D page_size;
> +        z->in.size =3D p->page_size;
>          z->in.pos =3D 0;
> =20
>          /*
> @@ -241,8 +240,7 @@ static int zstd_recv_pages(MultiFDRecvParams *p, Erro=
r **errp)
>  {
>      uint32_t in_size =3D p->next_packet_size;
>      uint32_t out_size =3D 0;
> -    size_t page_size =3D qemu_target_page_size();
> -    uint32_t expected_size =3D p->normal_num * page_size;
> +    uint32_t expected_size =3D p->normal_num * p->page_size;
>      uint32_t flags =3D p->flags & MULTIFD_FLAG_COMPRESSION_MASK;
>      struct zstd_data *z =3D p->data;
>      int ret;
> @@ -265,7 +263,7 @@ static int zstd_recv_pages(MultiFDRecvParams *p, Erro=
r **errp)
> =20
>      for (i =3D 0; i < p->normal_num; i++) {
>          z->out.dst =3D p->host + p->normal[i];
> -        z->out.size =3D page_size;
> +        z->out.size =3D p->page_size;
>          z->out.pos =3D 0;
> =20
>          /*
> @@ -279,8 +277,8 @@ static int zstd_recv_pages(MultiFDRecvParams *p, Erro=
r **errp)
>          do {
>              ret =3D ZSTD_decompressStream(z->zds, &z->out, &z->in);
>          } while (ret > 0 && (z->in.size - z->in.pos > 0)
> -                         && (z->out.pos < page_size));
> -        if (ret > 0 && (z->out.pos < page_size)) {
> +                         && (z->out.pos < p->page_size));
> +        if (ret > 0 && (z->out.pos < p->page_size)) {
>              error_setg(errp, "multifd %u: decompressStream buffer too sm=
all",
>                         p->id);
>              return -1;
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 9ea4f581e2..f15fed5f1f 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -87,15 +87,14 @@ static void nocomp_send_cleanup(MultiFDSendParams *p,=
 Error **errp)
>  static int nocomp_send_prepare(MultiFDSendParams *p, Error **errp)
>  {
>      MultiFDPages_t *pages =3D p->pages;
> -    size_t page_size =3D qemu_target_page_size();
> =20
>      for (int i =3D 0; i < p->normal_num; i++) {
>          p->iov[p->iovs_num].iov_base =3D pages->block->host + p->normal[=
i];
> -        p->iov[p->iovs_num].iov_len =3D page_size;
> +        p->iov[p->iovs_num].iov_len =3D p->page_size;
>          p->iovs_num++;
>      }
> =20
> -    p->next_packet_size =3D p->normal_num * page_size;
> +    p->next_packet_size =3D p->normal_num * p->page_size;
>      p->flags |=3D MULTIFD_FLAG_NOCOMP;
>      return 0;
>  }
> @@ -139,7 +138,6 @@ static void nocomp_recv_cleanup(MultiFDRecvParams *p)
>  static int nocomp_recv_pages(MultiFDRecvParams *p, Error **errp)
>  {
>      uint32_t flags =3D p->flags & MULTIFD_FLAG_COMPRESSION_MASK;
> -    size_t page_size =3D qemu_target_page_size();
> =20
>      if (flags !=3D MULTIFD_FLAG_NOCOMP) {
>          error_setg(errp, "multifd %u: flags received %x flags expected %=
x",
> @@ -148,7 +146,7 @@ static int nocomp_recv_pages(MultiFDRecvParams *p, Er=
ror **errp)
>      }
>      for (int i =3D 0; i < p->normal_num; i++) {
>          p->iov[i].iov_base =3D p->host + p->normal[i];
> -        p->iov[i].iov_len =3D page_size;
> +        p->iov[i].iov_len =3D p->page_size;
>      }
>      return qio_channel_readv_all(p->c, p->iov, p->normal_num, errp);
>  }
> @@ -281,8 +279,7 @@ static void multifd_send_fill_packet(MultiFDSendParam=
s *p)
>  static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
>  {
>      MultiFDPacket_t *packet =3D p->packet;
> -    size_t page_size =3D qemu_target_page_size();
> -    uint32_t page_count =3D MULTIFD_PACKET_SIZE / page_size;
> +    uint32_t page_count =3D MULTIFD_PACKET_SIZE / p->page_size;
>      RAMBlock *block;
>      int i;
> =20
> @@ -344,7 +341,7 @@ static int multifd_recv_unfill_packet(MultiFDRecvPara=
ms *p, Error **errp)
>      for (i =3D 0; i < p->normal_num; i++) {
>          uint64_t offset =3D be64_to_cpu(packet->offset[i]);
> =20
> -        if (offset > (block->used_length - page_size)) {
> +        if (offset > (block->used_length - p->page_size)) {
>              error_setg(errp, "multifd: offset too long %" PRIu64
>                         " (max " RAM_ADDR_FMT ")",
>                         offset, block->used_length);
> @@ -433,8 +430,7 @@ static int multifd_send_pages(QEMUFile *f)
>      p->packet_num =3D multifd_send_state->packet_num++;
>      multifd_send_state->pages =3D p->pages;
>      p->pages =3D pages;
> -    transferred =3D ((uint64_t) pages->num) * qemu_target_page_size()
> -                + p->packet_len;
> +    transferred =3D ((uint64_t) pages->num) * p->page_size + p->packet_l=
en;
>      qemu_file_update_transfer(f, transferred);
>      ram_counters.multifd_bytes +=3D transferred;
>      ram_counters.transferred +=3D transferred;
> @@ -898,6 +894,7 @@ int multifd_save_setup(Error **errp)
>          /* We need one extra place for the packet header */
>          p->iov =3D g_new0(struct iovec, page_count + 1);
>          p->normal =3D g_new0(ram_addr_t, page_count);
> +        p->page_size =3D qemu_target_page_size();
>          socket_send_channel_create(multifd_new_send_channel_async, p);
>      }
> =20
> @@ -1138,6 +1135,7 @@ int multifd_load_setup(Error **errp)
>          p->name =3D g_strdup_printf("multifdrecv_%d", i);
>          p->iov =3D g_new0(struct iovec, page_count);
>          p->normal =3D g_new0(ram_addr_t, page_count);
> +        p->page_size =3D qemu_target_page_size();
>      }
> =20
>      for (i =3D 0; i < thread_count; i++) {
> --=20
> 2.35.1
>=20
--=20
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


