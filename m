Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8FD3FEC10
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 12:22:29 +0200 (CEST)
Received: from localhost ([::1]:46116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLjrY-0004v7-IJ
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 06:22:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mLjpF-0003MR-IA
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 06:20:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mLjpA-0007hM-8o
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 06:20:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630577999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ddmFO6dHykKclntMJMKaH+bmXHeDCTJp+dLY9yBItXU=;
 b=JkHs+gvRiJgodKUDd1iqFHR+3e661FQee1TvasVY1WAU/zv/P8ru8WjyuCBbS4IGCGl2bO
 7CgV2dXly+tA+kvXph9/DtBq4KOhjFG+p4m3zhoviyaB356j1uAksQP738TbUz/aB3c7Gk
 AG9/0LWQV1oe8LQzUQRXr/v1dl6K1Ds=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-sdseYSVUNrSHhF2UuBos3w-1; Thu, 02 Sep 2021 06:19:49 -0400
X-MC-Unique: sdseYSVUNrSHhF2UuBos3w-1
Received: by mail-lj1-f197.google.com with SMTP id
 c16-20020a2e89d0000000b001d018ef42aaso459553ljk.23
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 03:19:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ddmFO6dHykKclntMJMKaH+bmXHeDCTJp+dLY9yBItXU=;
 b=okOJ6X/qA2p5rSiI/eis6mzWiV6Ha1GvJdSktQAyFR3FAJMl5faXA79XTmqlamOg0U
 q5Wi2PrYnj1sKbLKq4IJ3Ur/qiDXXyhPz8Qe0PAtfw0UPqAX9vbDg8denZLezvg0Erdi
 ovWo6+3v+R2HiNt33CrB+VyZyP/ReUABx1pMnJ5m2+LTWPu26rD8yZh4/sBMlr1FjxhW
 vMv/zQpqlhz4N3i0mAw2Kj4WzXEFJJlsbk3SpVOQc1HfZidWMtWzSzctrQuEwk8zWozD
 F9C1HdH8hU4/Hj4hjT4OghS21qdV8Ctr6chcc4jyj1y52tH8TnxTcZYVuP17yqlzkO2g
 uSbA==
X-Gm-Message-State: AOAM531tVlJdGcEswg18pQHI9z6JRw/wsMTIfb+B5S5dW64cES1vomNx
 Kj7h2ynGGCmdazN8nJpT7XggF3ElqbdR6N4JZIhOgsS2XSXhWK629g+bi10m0WClmnGtJZvVlpU
 iWEysXX0rdeo5OV/di8wOad+j97lmDQQ=
X-Received: by 2002:a05:6512:2291:: with SMTP id
 f17mr2056495lfu.489.1630577987657; 
 Thu, 02 Sep 2021 03:19:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcZYiYB15lAJpIOmoUCDMSRPWzT2B9pDR507D0YLKIB4PjOxxSV6VLYJSbvopvNv/iL9ry9EhKOUhDc1DwGNc=
X-Received: by 2002:a05:6512:2291:: with SMTP id
 f17mr2056474lfu.489.1630577987378; 
 Thu, 02 Sep 2021 03:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-3-leobras@redhat.com>
 <YS4nPfEBCy9IC3rd@redhat.com>
 <CAJ6HWG75NDzaRAoHvM6FkFoB+sQvTpmdR8+AdMkoY6TsP06ZhA@mail.gmail.com>
 <YTCPngNB+l70sl06@redhat.com>
 <CAJ6HWG6dd+timQM27-NTumvwDM2bFawRsnmrZumdzGZ8hCR3dQ@mail.gmail.com>
 <YTCeNCEmr3NsQEPR@redhat.com>
In-Reply-To: <YTCeNCEmr3NsQEPR@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Thu, 2 Sep 2021 07:19:58 -0300
Message-ID: <CAJ6HWG6D61K49gyvfLo2c5=cZpkYh96ciZjO5V=wiPdG+wB5zQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] io: Add zerocopy and errqueue
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 2, 2021 at 6:50 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Thu, Sep 02, 2021 at 06:34:01AM -0300, Leonardo Bras Soares Passos wro=
te:
> > On Thu, Sep 2, 2021 at 5:47 AM Daniel P. Berrang=C3=A9 <berrange@redhat=
.com> wrote:
> > >
> > > On Thu, Sep 02, 2021 at 03:38:11AM -0300, Leonardo Bras Soares Passos=
 wrote:
> > >
> > > > > I would suggest checkig in close(), but as mentioned
> > > > > earlier, I think the design is flawed because the caller
> > > > > fundamentally needs to know about completion for every
> > > > > single write they make in order to know when the buffer
> > > > > can be released / reused.
> > > >
> > > > Well, there could be a flush mechanism (maybe in io_sync_errck(),
> > > > activated with a
> > > > parameter flag, or on a different method if callback is preferred):
> > > > In the MSG_ZEROCOPY docs, we can see that the example includes usin=
g a poll()
> > > > syscall after each packet sent, and this means the fd gets a signal=
 after each
> > > > sendmsg() happens, with error or not.
> > > >
> > > > We could harness this with a poll() and a relatively high timeout:
> > > > - We stop sending packets, and then call poll().
> > > > - Whenever poll() returns 0, it means a timeout happened, and so it
> > > > took too long
> > > > without sendmsg() happening, meaning all the packets are sent.
> > > > - If it returns anything else, we go back to fixing the errors foun=
d (re-send)
> > > >
> > > > The problem may be defining the value of this timeout, but it could=
 be
> > > > called only
> > > > when zerocopy is active.
> > >
> > > Maybe we need to check completions at the end of each iteration of th=
e
> > > migration dirtypage loop ?
> >
> > Sorry, I am really new to this, and I still couldn't understand why wou=
ld we
> > need to check at the end of each iteration, instead of doing a full che=
ck at the
> > end.
>
> The end of each iteration is an implicit synchronization point in the
> current migration code.
>
> For example, we might do 2 iterations of migration pre-copy, and then
> switch to post-copy mode. If the data from those 2 iterations hasn't
> been sent at the point we switch to post-copy, that is a semantic
> change from current behaviour. I don't know if that will have an
> problematic effect on the migration process, or not. Checking the
> async completions at the end of each iteration though, would ensure
> the semantics similar to current semantics, reducing risk of unexpected
> problems.
>

What if we do the 'flush()' before we start post-copy, instead of after eac=
h
iteration? would that be enough?

>
> > > > or something like this, if we want it to stick with zerocopy if
> > > > setting it off fails.
> > > > if (ret >=3D 0) {
> > > >     sioc->zerocopy_enabled =3D enabled;
> > > > }
> > >
> > > Yes, that is a bug fix we need, but actually I was refering
> > > to the later sendmsg() call. Surely we need to clear MSG_ZEROCOPY
> > > from 'flags', if zerocopy_enabled is not set, to avoid EINVAL
> > > from sendmsg.
> >
> > Agree, something like io_writev(,, sioc->zerocopy_enabled ?
> > MSG_ZEROCOPY : 0, errp)'
> > should do, right?
> > (or an io_async_writev(), that will fall_back to io_writev() if
> > zerocopy is disabled)
>
> Something like that - depends what API we end up deciding on

Great :)

>
> > > > We could implement KTLS as io_async_writev() for Channel_TLS, and c=
hange this
> > > > flag to async_enabled. If KTLS is not available, it would fall back=
 to
> > > > using gnuTLS on io_writev, just like it would happen in zerocopy.
> > >
> > > If gnutls is going to support KTLS in a way we can use, I dont want t=
o
> > > have any of that duplicated in QEMU code. I want to be able delegate
> > > as much as possible to gnutls, at least so that QEMU isn't in the loo=
p
> > > for any crypto sensitive parts, as that complicates certification
> > > of crypto.
> >
> > Yeah, that's a very good argument :)
> > I think it's probably the case to move from the current callback implem=
entation
> > to the implementation in which we give gnuTLS the file descriptor.
>
> That would introduce a coupling  between the two QIOChannel impls
> though, which is avoided so far, because we didn't want an assuption
> that a QIOChannel =3D=3D a FD.

Interesting, QIOChannelTLS would necessarily need to have a QIOChannelSocke=
t,
is that right?

Maybe we can get a QIOChannelKTLS, which would use gnuTLS but get to
have it's own fd,
but that possibly would cause a lot of duplicated code.
On the other hand, this way the QIOChannelTLS would still be able to
accept any other
channel, if desired.

Anyway, it's a complicated decision :)

> Regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>

Thank you, I am learning a lot today :)

Best regards,
Leonardo


