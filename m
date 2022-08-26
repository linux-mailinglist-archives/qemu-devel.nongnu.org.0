Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F845A256C
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 12:06:59 +0200 (CEST)
Received: from localhost ([::1]:54702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRWEs-0006lQ-J2
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 06:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oRW52-00031n-TF
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 05:56:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oRW4z-0006Vp-Fl
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 05:56:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661507804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I8xvA6pw2LfTiM5CoUEEGJBBnkfVTMyGN9RQLB7B+JA=;
 b=BU46Fd/lx2OcxcGYwPAv8C0J/X+47l+kFDlu5V8WkdUOLWnPE9z76OIY6hI9VSz60bKvP9
 nWPmpkMtuBbn2vkQ2kvfLtK4Yh0PNMC5dqqhZk4R6FlR8X9+5Y6T5tAgq0sFP5oE/PFQwa
 /T+58v61hOeR0Z6COOmfj2m1Z0DLHAU=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-372-uxe8zRiTOQum4q0-l1Zu9A-1; Fri, 26 Aug 2022 05:56:43 -0400
X-MC-Unique: uxe8zRiTOQum4q0-l1Zu9A-1
Received: by mail-oi1-f200.google.com with SMTP id
 y11-20020aca320b000000b00345b9a36d71so453195oiy.19
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 02:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=I8xvA6pw2LfTiM5CoUEEGJBBnkfVTMyGN9RQLB7B+JA=;
 b=wryFbvmjy8WofQRaKxcJE2tjKodDdtnFDi5TAvus9LKSALGLjoeG6ztUCT8DQZ0c1e
 N1qQ209qKYklhiQqgkgZRzcAB9f7jH78I+22Owhmd8c1Tp3re4Xqb/sM9oKjTm92nr64
 pM2pMdziyVWpPYl8oDAzgaJ14xTgysVpWoAxBOos2uZAfYiXyHlqc7GhB13RDmYqXDMb
 QOdeNYZtaHOtaRZPajeIBPUAV4qjTD/pDdCSSqGKyLVW5ivOfdlFWwSbF/JKSEW4Qdj6
 XkFuMsef4UB4F6rKkZ/68r8KMSir28wT7yN005aSYstNTa+J8tfy09WatNw6fli5Ccoc
 CWhg==
X-Gm-Message-State: ACgBeo3QnYOyJAnP87tOcTiTe2BYj0h+KTxcbGXuF5Pmy5909MKDSSra
 z94/A54QdjfOPCdAZdsYi3T9x2V4mrjE5jO5jSgteGQdw12qqEu1K5gCiIvQjk6ugM2nXAYuskK
 XCbf5ysIyT3FhN5Hhpytqh0ONbrsLssw=
X-Received: by 2002:a05:6808:219a:b0:344:e94a:ec43 with SMTP id
 be26-20020a056808219a00b00344e94aec43mr1315031oib.205.1661507802359; 
 Fri, 26 Aug 2022 02:56:42 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7y43v0fGLeecJIG2oHiKJoWWLy+Tqd2zqz4j6i2MYeNeGZzvVg1DlAKFwwRVX6GVBVFcuugzx6i6nNJYp796Y=
X-Received: by 2002:a05:6808:219a:b0:344:e94a:ec43 with SMTP id
 be26-20020a056808219a00b00344e94aec43mr1315024oib.205.1661507802183; Fri, 26
 Aug 2022 02:56:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220825132110.1500330-1-marcandre.lureau@redhat.com>
 <20220825132110.1500330-2-marcandre.lureau@redhat.com>
 <b56c6030-8976-f2a1-d411-d892d362d486@redhat.com>
In-Reply-To: <b56c6030-8976-f2a1-d411-d892d362d486@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 26 Aug 2022 13:56:31 +0400
Message-ID: <CAMxuvayO8fNWOwY43dpKC9kUxsZnxo0VY3++avAesu_VBhhbjA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dump: simplify a bit kdump get_next_page()
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qiaonuohan@cn.fujitsu.com, Peter Maydell <peter.maydell@linaro.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hi

On Fri, Aug 26, 2022 at 1:45 PM David Hildenbrand <david@redhat.com> wrote:
>
> On 25.08.22 15:21, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > This should be functionally equivalent, but slightly easier to read,
> > with simplified paths and checks at the end of the function.
> >
> > The following patch is a major rewrite to get rid of the assert().
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  dump/dump.c | 30 ++++++++++++------------------
> >  1 file changed, 12 insertions(+), 18 deletions(-)
> >
> > diff --git a/dump/dump.c b/dump/dump.c
> > index 4d9658ffa2..18f06cffe2 100644
> > --- a/dump/dump.c
> > +++ b/dump/dump.c
> > @@ -1107,37 +1107,31 @@ static bool get_next_page(GuestPhysBlock **bloc=
kptr, uint64_t *pfnptr,
> >      uint8_t *buf;
> >
> >      /* block =3D=3D NULL means the start of the iteration */
> > -    if (!block) {
> > -        block =3D QTAILQ_FIRST(&s->guest_phys_blocks.head);
> > -        *blockptr =3D block;
> > -        assert((block->target_start & ~target_page_mask) =3D=3D 0);
> > -        assert((block->target_end & ~target_page_mask) =3D=3D 0);
> > -        *pfnptr =3D dump_paddr_to_pfn(s, block->target_start);
> > -        if (bufptr) {
> > -            *bufptr =3D block->host_addr;
> > -        }
> > -        return true;
>
>
> Instead of the "return true" we'll now do take the  "if ((addr >=3D
> block->target_start) &&" path below I guess, always ending up with
> essentially "buf =3D buf;" because addr =3D=3D block->target_start.
>
> I guess that's fine.
>
> > +    if (block =3D=3D NULL) {
>
> What's wrong with keeping the "if (!block) {" ? :)

That's just to be consistent with the comment above.

>
> > +        *blockptr =3D block =3D QTAILQ_FIRST(&s->guest_phys_blocks.hea=
d);
>
> Another unnecessary change.
>
> > +        addr =3D block->target_start;
> > +    } else {
> > +        addr =3D dump_pfn_to_paddr(s, *pfnptr + 1);
> >      }
> > -
> > -    *pfnptr =3D *pfnptr + 1;
> > -    addr =3D dump_pfn_to_paddr(s, *pfnptr);
> > +    assert(block !=3D NULL);
> >
> >      if ((addr >=3D block->target_start) &&
> >          (addr + s->dump_info.page_size <=3D block->target_end)) {
> >          buf =3D block->host_addr + (addr - block->target_start);
> >      } else {
> >          /* the next page is in the next block */
> > -        block =3D QTAILQ_NEXT(block, next);
> > -        *blockptr =3D block;
> > +        *blockptr =3D block =3D QTAILQ_NEXT(block, next);
>
> Another unnecessary change. (avoiding these really eases review, because
> the focus is then completely on the actual code changes)
>
> >          if (!block) {
> >              return false;
> >          }
> > -        assert((block->target_start & ~target_page_mask) =3D=3D 0);
> > -        assert((block->target_end & ~target_page_mask) =3D=3D 0);
> > -        *pfnptr =3D dump_paddr_to_pfn(s, block->target_start);
> > +        addr =3D block->target_start;
> >          buf =3D block->host_addr;
> >      }
> >
> > +    /* those checks are going away next */
>
> This comment seems to imply a story documented in code. Rather just drop
> it -- the patch description already points that out.
>
> > +    assert((block->target_start & ~target_page_mask) =3D=3D 0);
> > +    assert((block->target_end & ~target_page_mask) =3D=3D 0);
> > +    *pfnptr =3D dump_paddr_to_pfn(s, addr);
> >      if (bufptr) {
> >          *bufptr =3D buf;
> >      }
>
>
> Apart from the nits, LGTM.

We could also drop this patch, it helped me to rewrite the function next mo=
stly.


