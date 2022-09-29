Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3958B5EF068
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 10:27:25 +0200 (CEST)
Received: from localhost ([::1]:51228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odotA-0001w2-BP
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 04:27:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1odoNw-0007S4-Pl
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 03:55:10 -0400
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231]:43538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1odoNt-000118-8x
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 03:55:08 -0400
Received: by mail-lj1-x231.google.com with SMTP id b6so639926ljr.10
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 00:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=gLRomvxv5v6qBRyzZhhhIP6glTOoTDPOdh5BwqfIfg4=;
 b=peQLtPq+aiMCFlUCgx7XPeMm9Hiyuf3g8ZrTpku+ewWymQeZznzCn3PrHsI8cKLN3t
 1sGJjZz4u3KuuDb/lydlNRrVrS1XjXvnhKwqffeuaRYPXc3x/JhkibEEcty6G1SI5z1I
 kpg1EDTK/My5kTBLf3TRrBv175L9YWoJwtevhWmWETshvLBKyuMbgzChNud+65ub2X1G
 zb5HHMTGPP/F8yKioD6q/LRv1opzLWgMKqrw8MZG7EtygykxAgnnRf4pFnaOgTi8q/ce
 iFFct2ZzKlej+Cg21v1PzsN7II4ZyiFsSc2d3mNprN5hRPKJb+2frYm/dDJf2cCq2XHY
 HyNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=gLRomvxv5v6qBRyzZhhhIP6glTOoTDPOdh5BwqfIfg4=;
 b=BTZaJ6f0CqLP6m5y4kViGKrEwBEStxdH3IMGTsUMYoideX3p5/GIaxOEdClOmFedWU
 Qy5pPr15IXpKqFip08QjvdZpkOtJi/63birzFwtDe8RGxUEfuCZwX/2QDQDDe9P8247H
 HC+fRVKeOmC6VSxj8vuVm4LxV0PgxlTyVnu9Uhx+L53K4OZYfOwwBLAnttrU91QYUvif
 dEXhq6xChXreXegymVtRJpLWUszczZJjKixHbXygc6x8LN5vK/IjIJBhyT95OLQWpBcL
 Ttt0xB6EdyFF5p1lJbAcn8MMIK4Z1CNQX67mHaYzKBBiILpQG3J3iw0hM8khumL2y3Mq
 PhCg==
X-Gm-Message-State: ACrzQf3sT3p21qFU1yTS701dhuln5nsq2T2UocgIt45OPxpXnOF+BIB4
 ufe58U552HqcgJLv2DRMZRgajyTDLTlCbI5yfT+TvHi5JiE=
X-Google-Smtp-Source: AMsMyM5ieYECYDjt7kwzNCR1bCzuA9Bs3lrEWnermQ+qunOGLqrZZIVZrS9lGs5pyNE0EKYTasOKPc8kcI/HtuTCq0Y=
X-Received: by 2002:a2e:9b17:0:b0:26c:4ede:512c with SMTP id
 u23-20020a2e9b17000000b0026c4ede512cmr676362lji.529.1664438102367; Thu, 29
 Sep 2022 00:55:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220905125741.95516-1-marcandre.lureau@redhat.com>
 <20220905125741.95516-3-marcandre.lureau@redhat.com>
In-Reply-To: <20220905125741.95516-3-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 29 Sep 2022 11:54:50 +0400
Message-ID: <CAJ+F1CKi776GYg30XHGdEc650fjBAy3KhvjbdFUf=6CukY=n4A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dump: fix kdump to work over non-aligned blocks
To: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qiaonuohan@cn.fujitsu.com, 
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000d7a55405e9cc3193"
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000d7a55405e9cc3193
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Sep 5, 2022 at 5:13 PM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Rewrite get_next_page() to work over non-aligned blocks. When it
> encounters non aligned addresses, it will try to fill a page provided by
> the caller.
>
> This solves a kdump crash with "tpm-crb-cmd" RAM memory region,
> qemu-kvm: ../dump/dump.c:1162: _Bool get_next_page(GuestPhysBlock **,
> uint64_t *, uint8_t **, DumpState *): Assertion `(block->target_start &
> ~target_page_mask) =3D=3D 0' failed.
>
> because:
> guest_phys_block_add_section: target_start=3D00000000fed40080
> target_end=3D00000000fed41000: added (count: 4)
>
> Fixes:
> https://bugzilla.redhat.com/show_bug.cgi?id=3D2120480
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>

ping: someone to review/ack this patch?


> ---
>  dump/dump.c | 79 +++++++++++++++++++++++++++++++++++++----------------
>  1 file changed, 56 insertions(+), 23 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index f465830371..500357bafe 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -1094,50 +1094,81 @@ static uint64_t dump_pfn_to_paddr(DumpState *s,
> uint64_t pfn)
>  }
>
>  /*
> - * exam every page and return the page frame number and the address of
> the page.
> - * bufptr can be NULL. note: the blocks here is supposed to reflect
> guest-phys
> - * blocks, so block->target_start and block->target_end should be intera=
l
> - * multiples of the target page size.
> + * Return the page frame number and the page content in *bufptr. bufptr
> can be
> + * NULL. If not NULL, *bufptr must contains a target page size of
> pre-allocated
> + * memory. This is not necessarily the memory returned.
>   */
>  static bool get_next_page(GuestPhysBlock **blockptr, uint64_t *pfnptr,
>                            uint8_t **bufptr, DumpState *s)
>  {
>      GuestPhysBlock *block =3D *blockptr;
> -    hwaddr addr, target_page_mask =3D ~((hwaddr)s->dump_info.page_size -=
 1);
> -    uint8_t *buf;
> +    uint32_t page_size =3D s->dump_info.page_size;
> +    uint8_t *buf =3D NULL, *hbuf;
> +    hwaddr addr;
>
>      /* block =3D=3D NULL means the start of the iteration */
>      if (!block) {
>          block =3D QTAILQ_FIRST(&s->guest_phys_blocks.head);
>          *blockptr =3D block;
>          addr =3D block->target_start;
> +        *pfnptr =3D dump_paddr_to_pfn(s, addr);
>      } else {
> -        addr =3D dump_pfn_to_paddr(s, *pfnptr + 1);
> +        *pfnptr +=3D 1;
> +        addr =3D dump_pfn_to_paddr(s, *pfnptr);
>      }
>      assert(block !=3D NULL);
>
> -    if ((addr >=3D block->target_start) &&
> -        (addr + s->dump_info.page_size <=3D block->target_end)) {
> -        buf =3D block->host_addr + (addr - block->target_start);
> -    } else {
> -        /* the next page is in the next block */
> -        block =3D QTAILQ_NEXT(block, next);
> -        *blockptr =3D block;
> -        if (!block) {
> -            return false;
> +    while (1) {
> +        if (addr >=3D block->target_start && addr < block->target_end) {
> +            size_t n =3D MIN(block->target_end - addr, page_size - addr =
%
> page_size);
> +            hbuf =3D block->host_addr + (addr - block->target_start);
> +            if (!buf) {
> +                if (n =3D=3D page_size) {
> +                    /* this is a whole target page, go for it */
> +                    assert(addr % page_size =3D=3D 0);
> +                    buf =3D hbuf;
> +                    break;
> +                } else if (bufptr) {
> +                    assert(*bufptr);
> +                    buf =3D *bufptr;
> +                    memset(buf, 0, page_size);
> +                } else {
> +                    return true;
> +                }
> +            }
> +
> +            memcpy(buf + addr % page_size, hbuf, n);
> +            addr +=3D n;
> +            if (addr % page_size =3D=3D 0) {
> +                /* we filled up the page */
> +                break;
> +            }
> +        } else {
> +            /* the next page is in the next block */
> +            *blockptr =3D block =3D QTAILQ_NEXT(block, next);
> +            if (!block) {
> +                break;
> +            }
> +
> +            addr =3D block->target_start;
> +            /* are we still in the same page? */
> +            if (dump_paddr_to_pfn(s, addr) !=3D *pfnptr) {
> +                if (buf) {
> +                    /* no, but we already filled something earlier,
> return it */
> +                    break;
> +                } else {
> +                    /* else continue from there */
> +                    *pfnptr =3D dump_paddr_to_pfn(s, addr);
> +                }
> +            }
>          }
> -        addr =3D block->target_start;
> -        buf =3D block->host_addr;
>      }
>
> -    assert((block->target_start & ~target_page_mask) =3D=3D 0);
> -    assert((block->target_end & ~target_page_mask) =3D=3D 0);
> -    *pfnptr =3D dump_paddr_to_pfn(s, addr);
>      if (bufptr) {
>          *bufptr =3D buf;
>      }
>
> -    return true;
> +    return buf !=3D NULL;
>  }
>
>  static void write_dump_bitmap(DumpState *s, Error **errp)
> @@ -1275,6 +1306,7 @@ static void write_dump_pages(DumpState *s, Error
> **errp)
>      uint8_t *buf;
>      GuestPhysBlock *block_iter =3D NULL;
>      uint64_t pfn_iter;
> +    g_autofree uint8_t *page =3D NULL;
>
>      /* get offset of page_desc and page_data in dump file */
>      offset_desc =3D s->offset_page;
> @@ -1310,12 +1342,13 @@ static void write_dump_pages(DumpState *s, Error
> **errp)
>      }
>
>      offset_data +=3D s->dump_info.page_size;
> +    page =3D g_malloc(s->dump_info.page_size);
>
>      /*
>       * dump memory to vmcore page by page. zero page will all be resided
> in the
>       * first page of page section
>       */
> -    while (get_next_page(&block_iter, &pfn_iter, &buf, s)) {
> +    for (buf =3D page; get_next_page(&block_iter, &pfn_iter, &buf, s); b=
uf
> =3D page) {
>          /* check zero page */
>          if (buffer_is_zero(buf, s->dump_info.page_size)) {
>              ret =3D write_cache(&page_desc, &pd_zero,
> sizeof(PageDescriptor),
> --
> 2.37.2
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000d7a55405e9cc3193
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 5, 2022 at 5:13 PM &lt;=
<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">F=
rom: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.c=
om" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
Rewrite get_next_page() to work over non-aligned blocks. When it<br>
encounters non aligned addresses, it will try to fill a page provided by<br=
>
the caller.<br>
<br>
This solves a kdump crash with &quot;tpm-crb-cmd&quot; RAM memory region,<b=
r>
qemu-kvm: ../dump/dump.c:1162: _Bool get_next_page(GuestPhysBlock **,<br>
uint64_t *, uint8_t **, DumpState *): Assertion `(block-&gt;target_start &a=
mp;<br>
~target_page_mask) =3D=3D 0&#39; failed.<br>
<br>
because:<br>
guest_phys_block_add_section: target_start=3D00000000fed40080 target_end=3D=
00000000fed41000: added (count: 4)<br>
<br>
Fixes:<br>
<a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D2120480" rel=3D"no=
referrer" target=3D"_blank">https://bugzilla.redhat.com/show_bug.cgi?id=3D2=
120480</a><br>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br></bl=
ockquote><div><br></div><div>ping: someone to review/ack this patch?</div><=
div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0dump/dump.c | 79 +++++++++++++++++++++++++++++++++++++---------------=
-<br>
=C2=A01 file changed, 56 insertions(+), 23 deletions(-)<br>
<br>
diff --git a/dump/dump.c b/dump/dump.c<br>
index f465830371..500357bafe 100644<br>
--- a/dump/dump.c<br>
+++ b/dump/dump.c<br>
@@ -1094,50 +1094,81 @@ static uint64_t dump_pfn_to_paddr(DumpState *s, uin=
t64_t pfn)<br>
=C2=A0}<br>
<br>
=C2=A0/*<br>
- * exam every page and return the page frame number and the address of the=
 page.<br>
- * bufptr can be NULL. note: the blocks here is supposed to reflect guest-=
phys<br>
- * blocks, so block-&gt;target_start and block-&gt;target_end should be in=
teral<br>
- * multiples of the target page size.<br>
+ * Return the page frame number and the page content in *bufptr. bufptr ca=
n be<br>
+ * NULL. If not NULL, *bufptr must contains a target page size of pre-allo=
cated<br>
+ * memory. This is not necessarily the memory returned.<br>
=C2=A0 */<br>
=C2=A0static bool get_next_page(GuestPhysBlock **blockptr, uint64_t *pfnptr=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0uint8_t **bufptr, DumpState *s)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0GuestPhysBlock *block =3D *blockptr;<br>
-=C2=A0 =C2=A0 hwaddr addr, target_page_mask =3D ~((hwaddr)s-&gt;dump_info.=
page_size - 1);<br>
-=C2=A0 =C2=A0 uint8_t *buf;<br>
+=C2=A0 =C2=A0 uint32_t page_size =3D s-&gt;dump_info.page_size;<br>
+=C2=A0 =C2=A0 uint8_t *buf =3D NULL, *hbuf;<br>
+=C2=A0 =C2=A0 hwaddr addr;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* block =3D=3D NULL means the start of the iteration *=
/<br>
=C2=A0 =C2=A0 =C2=A0if (!block) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0block =3D QTAILQ_FIRST(&amp;s-&gt;guest_p=
hys_blocks.head);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*blockptr =3D block;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr =3D block-&gt;target_start;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *pfnptr =3D dump_paddr_to_pfn(s, addr);<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 addr =3D dump_pfn_to_paddr(s, *pfnptr + 1);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *pfnptr +=3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 addr =3D dump_pfn_to_paddr(s, *pfnptr);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0assert(block !=3D NULL);<br>
<br>
-=C2=A0 =C2=A0 if ((addr &gt;=3D block-&gt;target_start) &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 (addr + s-&gt;dump_info.page_size &lt;=3D bloc=
k-&gt;target_end)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 buf =3D block-&gt;host_addr + (addr - block-&g=
t;target_start);<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* the next page is in the next block */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 block =3D QTAILQ_NEXT(block, next);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *blockptr =3D block;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!block) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 while (1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (addr &gt;=3D block-&gt;target_start &amp;&=
amp; addr &lt; block-&gt;target_end) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t n =3D MIN(block-&gt;targe=
t_end - addr, page_size - addr % page_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hbuf =3D block-&gt;host_addr + (=
addr - block-&gt;target_start);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!buf) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (n =3D=3D page_=
size) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* t=
his is a whole target page, go for it */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 asse=
rt(addr % page_size =3D=3D 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf =
=3D hbuf;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brea=
k;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (bufptr)=
 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 asse=
rt(*bufptr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf =
=3D *bufptr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mems=
et(buf, 0, page_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retu=
rn true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(buf + addr % page_size, h=
buf, n);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr +=3D n;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (addr % page_size =3D=3D 0) {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* we filled up th=
e page */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* the next page is in the next =
block */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *blockptr =3D block =3D QTAILQ_N=
EXT(block, next);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!block) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr =3D block-&gt;target_start;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* are we still in the same page=
? */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dump_paddr_to_pfn(s, addr) !=
=3D *pfnptr) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (buf) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* n=
o, but we already filled something earlier, return it */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brea=
k;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* e=
lse continue from there */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *pfn=
ptr =3D dump_paddr_to_pfn(s, addr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 addr =3D block-&gt;target_start;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 buf =3D block-&gt;host_addr;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 assert((block-&gt;target_start &amp; ~target_page_mask) =3D=
=3D 0);<br>
-=C2=A0 =C2=A0 assert((block-&gt;target_end &amp; ~target_page_mask) =3D=3D=
 0);<br>
-=C2=A0 =C2=A0 *pfnptr =3D dump_paddr_to_pfn(s, addr);<br>
=C2=A0 =C2=A0 =C2=A0if (bufptr) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*bufptr =3D buf;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 return buf !=3D NULL;<br>
=C2=A0}<br>
<br>
=C2=A0static void write_dump_bitmap(DumpState *s, Error **errp)<br>
@@ -1275,6 +1306,7 @@ static void write_dump_pages(DumpState *s, Error **er=
rp)<br>
=C2=A0 =C2=A0 =C2=A0uint8_t *buf;<br>
=C2=A0 =C2=A0 =C2=A0GuestPhysBlock *block_iter =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t pfn_iter;<br>
+=C2=A0 =C2=A0 g_autofree uint8_t *page =3D NULL;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* get offset of page_desc and page_data in dump file *=
/<br>
=C2=A0 =C2=A0 =C2=A0offset_desc =3D s-&gt;offset_page;<br>
@@ -1310,12 +1342,13 @@ static void write_dump_pages(DumpState *s, Error **=
errp)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0offset_data +=3D s-&gt;dump_info.page_size;<br>
+=C2=A0 =C2=A0 page =3D g_malloc(s-&gt;dump_info.page_size);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 * dump memory to vmcore page by page. zero page will a=
ll be resided in the<br>
=C2=A0 =C2=A0 =C2=A0 * first page of page section<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 while (get_next_page(&amp;block_iter, &amp;pfn_iter, &amp;bu=
f, s)) {<br>
+=C2=A0 =C2=A0 for (buf =3D page; get_next_page(&amp;block_iter, &amp;pfn_i=
ter, &amp;buf, s); buf =3D page) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* check zero page */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (buffer_is_zero(buf, s-&gt;dump_info.p=
age_size)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D write_cache(&amp;pa=
ge_desc, &amp;pd_zero, sizeof(PageDescriptor),<br>
-- <br>
2.37.2<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000d7a55405e9cc3193--

