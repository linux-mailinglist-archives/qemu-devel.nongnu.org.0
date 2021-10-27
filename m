Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E440743C351
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 08:52:12 +0200 (CEST)
Received: from localhost ([::1]:49910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfcnC-0004pX-TM
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 02:52:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mfcib-0000TA-He
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 02:47:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mfciZ-0006e5-NM
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 02:47:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635317243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hV78AeCEl9H0llMltOlu8xg80NOtAzSaMBU8fdgwst0=;
 b=FIrH0uGFzRWV/MJhYbUD5on2Cdn+lHh/DXtS02LJEjOv+V1DeeKgWw0uvWy3me9AxaOQnw
 PFEVAyrifKAnPWw/DAxI86zu/P8fO4R8rOmvhi5mTgQC2JmkIwkpk8pM5lk/9sbxHxnjz/
 dEKidplBXRPSFUzTWU9psky/KnXvnQs=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-vyI7q3fFNqiHuuRCqDv52g-1; Wed, 27 Oct 2021 02:47:19 -0400
X-MC-Unique: vyI7q3fFNqiHuuRCqDv52g-1
Received: by mail-lf1-f69.google.com with SMTP id
 k18-20020a05651210d200b003fd86616d39so957781lfg.2
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 23:47:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hV78AeCEl9H0llMltOlu8xg80NOtAzSaMBU8fdgwst0=;
 b=MVtCIF7QBmhAPMm5maKXJ5ecOrKKw4ioxxMXC/ymItJ2yQylmOr4bJ7U+aQ1drYIU8
 K5BeniNOYQPPwJbnT1+h3pJfmp5R3VSBGZHrnWkrWjOgw6o66ublzkWBI1v1orQ2dRLm
 LDEsiB6lm1tCjWHu6IBi+X9yoG8sXpEJbVI+7eT2NT+prxRZTYjqw3+hmqLlZMbNJE89
 NMpMy9WaoiRRXDmeBWMzH4QnTNhGNJPnH7/IrWTnBXFs4ksJqeX6hBUcF3+rIfl+tjJ4
 KRuxFnVLk3PJj+OiXKwozqbXEHEmw8FYL2Nj3ixLMqic4AxCadcyDkWIam1DGe5pwZ9z
 PpTg==
X-Gm-Message-State: AOAM532SrANN+lvMrQdE6Bs2Fl/BPlo5XSpTpXtUKxmQezQRjNyoWJNH
 htSSCYARrIUct32Xe7ej9ogDPdkYDkP7fEGFcgqHDN9T9UjRjEArl/L5cSv9JQGgWAgttsmFAN1
 NkEtPKxFYt0HYlaiGj7waJwaZM6N3zl8=
X-Received: by 2002:ac2:54b4:: with SMTP id w20mr19217399lfk.669.1635317238008; 
 Tue, 26 Oct 2021 23:47:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8hyEM7mC/Ku5WiP0MgtFXZs/Ya8e2f65lpwTKSdZbwB0TUYElHtSpMi4CNmM7mAQzzh6rW4uZJIaXU8m/0Qw=
X-Received: by 2002:ac2:54b4:: with SMTP id w20mr19217378lfk.669.1635317237843; 
 Tue, 26 Oct 2021 23:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <20211009075612.230283-1-leobras@redhat.com>
 <20211009075612.230283-4-leobras@redhat.com>
 <YWZ7coem6iklY0ZC@t490s>
In-Reply-To: <YWZ7coem6iklY0ZC@t490s>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 27 Oct 2021 03:47:18 -0300
Message-ID: <CAJ6HWG7Ep_yCKvw35n647+CRmh=W3EKFtxSHU16AxxKuz=rnrw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] multifd: Implement zerocopy write in multifd
 migration (multifd-zerocopy)
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 13, 2021 at 3:24 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Sat, Oct 09, 2021 at 04:56:13AM -0300, Leonardo Bras wrote:
> > diff --git a/qapi/migration.json b/qapi/migration.json
> > index 88f07baedd..c4890cbb54 100644
> > --- a/qapi/migration.json
> > +++ b/qapi/migration.json
> > @@ -724,6 +724,11 @@
> >  #                      will consume more CPU.
> >  #                      Defaults to 1. (Since 5.0)
> >  #
> > +# @multifd-zerocopy: Controls behavior on sending memory pages on multifd migration.
> > +#                    When true, enables a zerocopy mechanism for sending memory
> > +#                    pages, if host does support it.
> > +#                    Defaults to false. (Since 6.2)
> > +#
>
> Shall we keep it named "@zerocopy"?  Yes we have that dependency with multifd,
> but it's fine to just fail the configuration if multifd not set. The thing is
> we don't know whether that dependency will last forever, and we probably don't
> want to introduce yet another feature bit when we can remove the dependency..
> as we can't remove the old one to be compatible.

It makes sense not wanting to create a new future bit in the future,
but if we just add a
"@zerocopy' , wouldn't we need to fail every migration setup that
don't support zerocopy?

(Thinking back, to stay as it is, it would also be necessary that I
find a way to fail other multifd setups that don't support zerocopy,
for v5)

>
> --
> Peter Xu
>


