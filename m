Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 160B9510BA6
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 00:02:39 +0200 (CEST)
Received: from localhost ([::1]:50550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njTGY-0003lj-IW
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 18:02:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1njTDz-0002p7-UL
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 18:00:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1njTDw-0006xA-LU
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 17:59:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651010394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QuCGT20pdrEHxS9Vpx5vOkUvui9Ney2ypJWANff9OOM=;
 b=JGBpJcaPjySTqbuQtYg+GG49YcTYTGSyGFlAwzh5dN776MsEOEn+OlTYT5GKtNya4O4X4j
 TwzYUDWx+GA2KsDBaWsgTpnzLXhP+/jTCNqbW7gNcWGlQ6Q+EUnYK6gotIu2gDxzCsuXG0
 4gBH/Ohd3G7C7LD4VEHOJCngjwBgF1Q=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-TrGiq4sHP-SwaugWjZq7sw-1; Tue, 26 Apr 2022 17:59:53 -0400
X-MC-Unique: TrGiq4sHP-SwaugWjZq7sw-1
Received: by mail-lj1-f197.google.com with SMTP id
 z15-20020a2e8e8f000000b0024f13acbbf1so59470ljk.13
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 14:59:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QuCGT20pdrEHxS9Vpx5vOkUvui9Ney2ypJWANff9OOM=;
 b=8BHa1kLhTuLrQRd9d7HJkrR9mNlt3i/t79bA2O0BX6aUHbC+ulhEiU9pOz6UY+NId/
 sKzLS+F1UqIooxXmwZDSsgzWy/IhN3yjiuH2pLn6mQVBJ+1viHkUS0MHH4OIbku6KA3l
 igJSvCu9B3Jzxd5IOwl2yFSAjbN2yiobNNyAO3Zj0sdZGX4MzEd6cUdszYzyzUBUsUdb
 JEDRmh3+jqcf+iranlSG9cpJwHRsJnKRXdVMF9ChkK5fAxL8nzSHCtmYoOGwrtA7Y+5Z
 iQdgSVzBWIKS/SgTb4IvZDEzrl7L2SJwvWqmolyLC2yBCwgB/CDt75ZOqyg1Qv0v4jTc
 k9cA==
X-Gm-Message-State: AOAM530t+x8DlkYI+A7dxKkE04cnUSFCz52LxJwBzLVi6GVurTg3RnrA
 snqfKfIAtzz33maZ+t72omrnVAPyaYvEDqrLovlPDR/BfTxqONZB5AhsH5EcVwVyGChd256UhSK
 En/Rp2rvKwdH1fv3R0RQxkBz8XRtJolg=
X-Received: by 2002:a05:651c:1a22:b0:24d:bb92:502e with SMTP id
 by34-20020a05651c1a2200b0024dbb92502emr16211724ljb.10.1651010391888; 
 Tue, 26 Apr 2022 14:59:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsouTaE8qxVAc91XEGynrbFLYkjIxxK+tagaExg7rqRyIep1nsl2elj1dCWNF1TY9Re69lVxTN3jd/jq/Kqgc=
X-Received: by 2002:a05:651c:1a22:b0:24d:bb92:502e with SMTP id
 by34-20020a05651c1a2200b0024dbb92502emr16211695ljb.10.1651010391472; Tue, 26
 Apr 2022 14:59:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220425215055.611825-1-leobras@redhat.com>
 <20220425215055.611825-7-leobras@redhat.com>
 <Ymeo74XfWOwe2Nob@redhat.com>
In-Reply-To: <Ymeo74XfWOwe2Nob@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Tue, 26 Apr 2022 18:59:40 -0300
Message-ID: <CAJ6HWG4KhvrrTN4b_nE1HtAYrCGLH=ibqn30ZP=Cwuc6ykoSJw@mail.gmail.com>
Subject: Re: [PATCH v9 6/7] multifd: Send header packet without flags if
 zero-copy-send is enabled
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Daniel, thank you for the feedback!

On Tue, Apr 26, 2022 at 5:11 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Mon, Apr 25, 2022 at 06:50:55PM -0300, Leonardo Bras wrote:
> > Since d48c3a0445 ("multifd: Use a single writev on the send side"),
> > sending the header packet and the memory pages happens in the same
> > writev, which can potentially make the migration faster.
> >
> > Using channel-socket as example, this works well with the default copyi=
ng
> > mechanism of sendmsg(), but with zero-copy-send=3Dtrue, it will cause
> > the migration to often break.
> >
> > This happens because the header packet buffer gets reused quite often,
> > and there is a high chance that by the time the MSG_ZEROCOPY mechanism =
get
> > to send the buffer, it has already changed, sending the wrong data and
> > causing the migration to abort.
> >
> > It means that, as it is, the buffer for the header packet is not suitab=
le
> > for sending with MSG_ZEROCOPY.
> >
> > In order to enable zero copy for multifd, send the header packet on an
> > individual write(), without any flags, and the remanining pages with a
> > writev(), as it was happening before. This only changes how a migration
> > with zero-copy-send=3Dtrue works, not changing any current behavior for
> > migrations with zero-copy-send=3Dfalse.
> >
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > ---
> >  migration/multifd.c | 29 ++++++++++++++++++++++++++---
> >  1 file changed, 26 insertions(+), 3 deletions(-)
> >
> > diff --git a/migration/multifd.c b/migration/multifd.c
> > index 15fb668e64..6c940aaa98 100644
> > --- a/migration/multifd.c
> > +++ b/migration/multifd.c
> > @@ -639,6 +639,8 @@ static void *multifd_send_thread(void *opaque)
> >          if (p->pending_job) {
> >              uint64_t packet_num =3D p->packet_num;
> >              uint32_t flags =3D p->flags;
> > +            int iov_offset =3D 0;
> > +
>
> No need for this if you change:
>
> >              p->iovs_num =3D 1;
>
>    if (!migrate_use_zero_copy_send()) {
>       p->iovs_num =3D 1;
>    }
>

I understand the point now: setting p->iovs_num =3D 0 before
multifd_send_state->ops->send_prepare() causes p->iov[0] to be used for
pages instead of the header. I was not aware, so thanks for pointing that o=
ut!

But it's also necessary to have an else clause with p->iovs_num =3D 0, righ=
t?
It seems like the variable is not set anywhere else, and it would keep grow=
ing
after the second loop iteration, causing prepare() to access p->iov[]
outside bounds.

Am I missing something here?

>
> >              p->normal_num =3D 0;
> >
> > @@ -665,15 +667,36 @@ static void *multifd_send_thread(void *opaque)
> >              trace_multifd_send(p->id, packet_num, p->normal_num, flags=
,
> >                                 p->next_packet_size);
> >
> > -            p->iov[0].iov_len =3D p->packet_len;
> > -            p->iov[0].iov_base =3D p->packet;
> > +            if (migrate_use_zero_copy_send()) {
> > +                /* Send header without zerocopy */
> > +                ret =3D qio_channel_write_all(p->c, (void *)p->packet,
> > +                                            p->packet_len, &local_err)=
;
> > +                if (ret !=3D 0) {
> > +                    break;
> > +                }
> > +
> > +                if (!p->normal_num) {
> > +                    /* No pages will be sent */
> > +                    goto skip_send;
> > +                }
>
> Don't need this AFAIK, because the qio_channel_writev_all
> call will be a no-op if  iovs_num is zero
>

Oh, I see:
qio_channel_writev_all() will call qio_channel_writev_full_all() where
niov =3D=3D 0 and thus nlocal_iov =3D=3D 0, avoiding the loop that calls
qio_channel_writev_full().

I will remove that in v10


> >
> > -            ret =3D qio_channel_writev_all(p->c, p->iov, p->iovs_num,
> > +                /* Skip first iov : header */
> > +                iov_offset =3D 1;
>
> Don't need to set this

Agree, that makes sense since the offset part is discontinued.

>
> > +            } else {
> > +                /* Send header using the same writev call */
> > +                p->iov[0].iov_len =3D p->packet_len;
> > +                p->iov[0].iov_base =3D p->packet;
> > +            }
> > +
> > +            ret =3D qio_channel_writev_all(p->c, p->iov + iov_offset,
> > +                                         p->iovs_num - iov_offset,
> >                                           &local_err);
>
> This wouldn't need changing if we don't reserve iovs[0] when
> not required.

Agree.

>
> > +
> >              if (ret !=3D 0) {
> >                  break;
> >              }
> >
> > +skip_send:
> >              qemu_mutex_lock(&p->mutex);
> >              p->pending_job--;
> >              qemu_mutex_unlock(&p->mutex);
> > --
> > 2.36.0
> >
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>

I will probably send a v10 shortly.

Thanks for reviewing!

Best regards,
Leo


