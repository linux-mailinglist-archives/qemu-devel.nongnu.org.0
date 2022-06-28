Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0B655EA51
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 18:55:16 +0200 (CEST)
Received: from localhost ([::1]:47034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6EUc-0005Cl-Ul
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 12:55:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1o6ETT-0004Tr-Ti
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 12:54:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1o6ETM-0003vf-Qg
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 12:54:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656435235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4ygGpPvgvfPZw8IHEZjXP4exn2WjaBxD2uJHQbTzaDw=;
 b=FX0Y5PYB1EfulOoAlEw3Z/6xJdiDq5FEwA5XhB5Y9U+lOk/ey2vKqQCFnq764rsBXBAlgS
 S8jc+nCyW6LxKsJDl/6ZW0zydFiAiMhwf0AQ5TTJAff887aqYLkpqRvQYT6otoPPt2CI07
 +1MeBhxl4q2W0gIZCFj+4vKxMCUyfps=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-Jdyiq_FhOQevMK432S1zfA-1; Tue, 28 Jun 2022 12:53:54 -0400
X-MC-Unique: Jdyiq_FhOQevMK432S1zfA-1
Received: by mail-ed1-f72.google.com with SMTP id
 m8-20020a056402430800b00435cfa7c6d1so9974443edc.9
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 09:53:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4ygGpPvgvfPZw8IHEZjXP4exn2WjaBxD2uJHQbTzaDw=;
 b=4pLCcicDTsACFcRo23wILdLOcGZMSvoUxqb3PsTGQALJVjdtR0hLRYKgTIFlbwau//
 vcvZ3m4EadM+MMN27oaU+o74RPV6y3lcddFF/QO69v4Br7NTxsNEJ5Ryj32B8IBK0aco
 qK+ZpnGAeosbZj3wFfOsgs5DXGDyY+5hvbhfvfKl4tF41wVc79Ai5MPyvONugw5/aIVC
 xIB6mg/i5Tpw5Fe3RgZ8fHOn1U+ppHUFyFa5SvitAkprq+2QonC8OYv4B5FOFx/hQdP1
 e7S9FfMNEZCIrtfekD3ta447iqrsrPGPdUBsSJjsSy1HS833px2slG0hdUxeu16sOX32
 UACA==
X-Gm-Message-State: AJIora/T3kCm4Glcvs9rI05xjPaQwKiofzx8KI9tK5UhdQfQPhlCM2lV
 nk+Rz2fuK2Mm4Ix6uN57YltnZZxhUpJOeCzcnOHaZ/CMIEBaj/hawheimn1M6JAEs7aXqSKrVsU
 JzaYWBMosECIDpf4HdgKgadXa202Na5g=
X-Received: by 2002:a17:907:7f22:b0:726:8962:d5a6 with SMTP id
 qf34-20020a1709077f2200b007268962d5a6mr16528382ejc.717.1656435233205; 
 Tue, 28 Jun 2022 09:53:53 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uNNu13dEYzA/zHnx8+lNvY97phLth7qn9nI+kUbL+4fT3L5hH59c8wOf6N5fp8vV4MwPoaMZujif4lPirUgIw=
X-Received: by 2002:a17:907:7f22:b0:726:8962:d5a6 with SMTP id
 qf34-20020a1709077f2200b007268962d5a6mr16528364ejc.717.1656435232960; Tue, 28
 Jun 2022 09:53:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220628010908.390564-1-leobras@redhat.com>
 <20220628010908.390564-3-leobras@redhat.com>
 <YrqzhFAePnnEl8A8@redhat.com>
 <CAJ6HWG5UGpgBqK-7OTA6Gxu0LKMfGq5gVvYffOaSMWO1bfyjVw@mail.gmail.com>
 <Yrr77NfKtKcXTVCr@redhat.com> <YrsHgWbhifokl6yL@work-vm>
In-Reply-To: <YrsHgWbhifokl6yL@work-vm>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Tue, 28 Jun 2022 13:53:41 -0300
Message-ID: <CAJ6HWG7hXNzuJ8rKc0NzLC_GguEOtVxGGUz8gDqizyZUy=Yieg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] migration/multifd: Warn user when zerocopy not
 working
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On Tue, Jun 28, 2022 at 10:52 AM Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Daniel P. Berrang=C3=A9 (berrange@redhat.com) wrote:
> > On Tue, Jun 28, 2022 at 09:32:04AM -0300, Leonardo Bras Soares Passos w=
rote:
> > > On Tue, Jun 28, 2022 at 4:53 AM Daniel P. Berrang=C3=A9 <berrange@red=
hat.com> wrote:
> > > >
> > > > On Mon, Jun 27, 2022 at 10:09:09PM -0300, Leonardo Bras wrote:
> > > > > Some errors, like the lack of Scatter-Gather support by the netwo=
rk
> > > > > interface(NETIF_F_SG) may cause sendmsg(...,MSG_ZEROCOPY) to fail=
 on using
> > > > > zero-copy, which causes it to fall back to the default copying me=
chanism.
> > > >
> > > > How common is this lack of SG support ? What NICs did you have that
> > > > were affected ?
> > >
> > > I am not aware of any NIC without SG available for testing, nor have
> > > any idea on how common they are.
> > > But since we can detect sendmsg() falling back to copying we should
> > > warn the user if this ever happens.
> > >
> > > There is also a case in IPv6 related to fragmentation that may cause
> > > MSG_ZEROCOPY to fall back to the copying mechanism, so it's also
> > > covered.
> > >
> > > >
> > > > > After each full dirty-bitmap scan there should be a zero-copy flu=
sh
> > > > > happening, which checks for errors each of the previous calls to
> > > > > sendmsg(...,MSG_ZEROCOPY). If all of them failed to use zero-copy=
, then
> > > > > warn the user about it.
> > > > >
> > > > > Since it happens once each full dirty-bitmap scan, even in worst =
case
> > > > > scenario it should not print a lot of warnings, and will allow tr=
acking
> > > > > how many dirty-bitmap iterations were not able to use zero-copy s=
end.
> > > >
> > > > For long running migrations which are not converging, or converging
> > > > very slowly there could be 100's of passes.
> > > >
> > >
> > > I could change it so it only warns once, if that is too much output.
> >
> > Well I'm mostly wondering what we're expecting the user todo with this
> > information.


My rationale on that:
- zero-copy-send is a feature that is supposed to improve send
throughput by reducing cpu usage.
- there is a chance the sendmsg(MSG_ZEROCOPY) fails to use zero-copy
- if this happens, there will be a potential throughput decrease on sendmsg=
()
- the user (or management app) need to know when zero-copy-send is
degrading throughput, so it can be disabled
- this is also important for performance testing, given it can be
confusing having zero-copy-send improving throughput in some cases,
and degrading in others, without any apparent reason why.

> > Generally a log file containing warnings ends up turning
> > into a bug report. If we think it is important for users and/or mgmt
> > apps to be aware of this info, then it might be better to actually
> > put a field in the query-migrate stats to report if zero-copy is
> > being honoured or not,
>
> Yeh just a counter would work there I think.

The warning idea was totally due to my inexperience on this mgmt app
interface, since I had no other idea on how to deal with that.

I think having it in query-migrate is a much better idea than a
warning, since it should be much easier to parse and disable
zero-copy-send if desired.
Even in my current qemu test script, it's much better having it in
query-migrate.

>
> > and just have a trace point in this location
> > instead.
>
> Yeh.
>

Yeap, the counter idea seems great!
Will it be always printed there, or only when zero-copy-send is enabled?

Best regards,
Leo

> Dave
>
> > With regards,
> > Daniel
> > --
> > |: https://berrange.com      -o-    https://www.flickr.com/photos/dberr=
ange :|
> > |: https://libvirt.org         -o-            https://fstop138.berrange=
.com :|
> > |: https://entangle-photo.org    -o-    https://www.instagram.com/dberr=
ange :|
> >
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>


