Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B36AA3E932A
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 16:00:20 +0200 (CEST)
Received: from localhost ([::1]:42958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDomJ-0002BS-3j
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 10:00:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mDoko-0008Op-N0
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 09:58:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mDokk-0000YM-JC
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 09:58:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628690320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qLAu7Xt9giB1JEJeaXVcKTr3zxBkgolhQiE77Rr3piU=;
 b=A5bC+bVreSLRik4i36m0MHxlfr9ZFRpSxMSn2pop5GDWOR9toqHz/IzRwQZd/msp4FLBRg
 fXUBQ9qJ/5ecSDxsmPNY7xeOEyiJXzJQi8Sk90G76pwK/GNaj6/oHN9aTIKglmrrCeYwpm
 1V7iUBgR2CU29b9/qYBxgX6MJbUMVnQ=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-GOeivZBhPL-37bw5HBgXkw-1; Wed, 11 Aug 2021 09:58:37 -0400
X-MC-Unique: GOeivZBhPL-37bw5HBgXkw-1
Received: by mail-lj1-f198.google.com with SMTP id
 r16-20020a2e97100000b02901b398e1cd20so815370lji.9
 for <qemu-devel@nongnu.org>; Wed, 11 Aug 2021 06:58:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qLAu7Xt9giB1JEJeaXVcKTr3zxBkgolhQiE77Rr3piU=;
 b=Kucx3hsaM+mvWq5tplVoPFUOqVZ8NbmZCKNrJOWZ8LmWjWgs2rxFCrbFbF7EsXWxcx
 k0EaxFrWtYjZfPp3kIUWj0QUg1rGNRXMEExcwI2LR3WHHQE02PWt2qzE9h+SXqbLRWML
 FKM0/af1xQuJtoOBPERHsRmCHEYDrPY7SsBAgTOGRuiN6rtbW6IuBD7CH9fDeHy+1xrW
 zvDLk54Aj9rs40fyzH9b9D/cqWMOwfTfARQ/KoyvxsboKOf00N9fK/3Z9SW19D3kpfTQ
 G+5UK8+VNnmW6Og6bmT+0TFixsP9bCjuLNuezDmoyJmnievClqwhnY/YC6cD8zEFNDu2
 dAuA==
X-Gm-Message-State: AOAM531eTt0ZYhJWXTxJ/UoG9G1xRrPUcJ+vXJTJmtzdf+CMuv5zT+SX
 RKZkXG7H9jKbmYNIhv0QiTiyh8a8FB8rAiSDHwaBm99+VRdtyymDaGcKdFXy+JF7FQgmVKjUiK8
 QzLgPL9UBHxZQuVX95u7gdvKSjimbyu8=
X-Received: by 2002:a2e:9355:: with SMTP id m21mr22807157ljh.445.1628690316041; 
 Wed, 11 Aug 2021 06:58:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxl12Co/rSK8sREdXG2ZIEVYWevhIt1h4k4YDs8TUY0b/cRFg4Pp78qZxQ4i6zJCMIbWVczSn9w+TKkmrFLlto=
X-Received: by 2002:a2e:9355:: with SMTP id m21mr22807128ljh.445.1628690315807; 
 Wed, 11 Aug 2021 06:58:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210728125402.2496-1-valeriy.vdovin@virtuozzo.com>
 <87eeb59vwt.fsf@dusky.pond.sub.org>
 <20210810185644.iyqt3iao2qdqd5jk@habkost.net>
 <2191952f-6989-771a-1f0a-ece58262d141@redhat.com>
 <CAOpTY_qbsqh9Tf8LB3EOOi_gkREotdpUyuF3-d_sBFsof3-9KQ@mail.gmail.com>
 <97ce9800-ff69-46cd-b6ab-c7645ee10d2c@redhat.com>
In-Reply-To: <97ce9800-ff69-46cd-b6ab-c7645ee10d2c@redhat.com>
From: Eduardo Habkost <ehabkost@redhat.com>
Date: Wed, 11 Aug 2021 09:58:19 -0400
Message-ID: <CAOpTY_rv4nZib1Eymm9ZVcLf=v=-QjpUm24U7FtS-1pUqS_6VQ@mail.gmail.com>
Subject: Re: [PATCH v12] qapi: introduce 'query-x86-cpuid' QMP command.
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, kvm@vger.kernel.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>, Denis Lunev <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 11, 2021 at 9:44 AM Thomas Huth <thuth@redhat.com> wrote:
>
> On 11/08/2021 15.40, Eduardo Habkost wrote:
> > On Wed, Aug 11, 2021 at 2:10 AM Thomas Huth <thuth@redhat.com> wrote:
> >>
> >> On 10/08/2021 20.56, Eduardo Habkost wrote:
> >>> On Sat, Aug 07, 2021 at 04:22:42PM +0200, Markus Armbruster wrote:
> >>>> Is this intended to be a stable interface?  Interfaces intended just=
 for
> >>>> debugging usually aren't.
> >>>
> >>> I don't think we need to make it a stable interface, but I won't
> >>> mind if we declare it stable.
> >>
> >> If we don't feel 100% certain yet, it's maybe better to introduce this=
 with
> >> a "x-" prefix first, isn't it? I.e. "x-query-x86-cpuid" ... then it's =
clear
> >> that this is only experimental/debugging/not-stable yet. Just my 0.02 =
=E2=82=AC.
> >
> > That would be my expectation. Is this a documented policy?
> >
>
> According to docs/interop/qmp-spec.txt :
>
>   Any command or member name beginning with "x-" is deemed
>   experimental, and may be withdrawn or changed in an incompatible
>   manner in a future release.

Thanks! I had looked at other QMP docs, but not qmp-spec.txt.

In my reply above, please read "make it a stable interface" as
"declare it as supported by not using the 'x-' prefix".

I don't think we have to make it stable, but I won't argue against it
if the current proposal is deemed acceptable by other maintainers.

Personally, I'm still frustrated by the complexity of the current
proposal, but I don't want to block it just because of my frustration.

--=20
Eduardo


