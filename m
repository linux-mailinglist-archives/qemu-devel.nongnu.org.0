Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA1C565923
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 16:59:09 +0200 (CEST)
Received: from localhost ([::1]:52526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8NXY-0002JK-2x
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 10:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1o8NUJ-0008Ec-5d
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 10:55:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1o8NUG-0003uY-6y
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 10:55:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656946542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J3/7AP0Luh3Uc/OtwUcHBdtU9Lk5I90tNQJsmQ/o8+8=;
 b=EWbEwjVGaYaIG54LqTZGxltIGrion1DD0e52pT4Im0vv+r2QQ4ZGSbxgxXOKK9+tR/7eqp
 HWJ38WHB6lUQ/XIGYbtievyWbNF0CaxFGsxjj/2yrHq99+4ArPhsixpL09qnBcbs3EterI
 ixO4U12POZ/sBlmAzYhaeM7P1ZB9VHM=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-aokLmsd1Py-grrbJb0CzSw-1; Mon, 04 Jul 2022 10:55:41 -0400
X-MC-Unique: aokLmsd1Py-grrbJb0CzSw-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-10bf00f0eeaso3058005fac.19
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 07:55:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=J3/7AP0Luh3Uc/OtwUcHBdtU9Lk5I90tNQJsmQ/o8+8=;
 b=EQZjq4bVssrO7NL1TSUnER8IZKZeNJMyuXgAJjXgi0EJaNRN7Vr6NOKP7Z2zkuXkqH
 FoCoJLp1aBdoxoqA10AnxVeuJWkDnTUNE0ysFJXogPh3kU0bW6SVQ1bzp9nyJZeVvSOh
 1U45A26xMFwKGADVxSEhvARYpUDPQSGDGazpk+I/IHkYNzCjLLNK+ZMa+BaaiGdmUYHw
 2iHEasiELzU+3Zn3tSfcETI/RXj/Z5RjWKymb6BMnNP3viFAsanB0XBth0HQcrmvNk64
 /K+SrZITWp7of5/LGg+gTXBRUIf1b0T9ztGbbuztfGZeiFyVP6tYoFlNbpjrB8dC3Md5
 1Asg==
X-Gm-Message-State: AJIora9VdyDQFIXDCNquR8cx3ZNm9jVCaXGq//gE3T4vFTGxMTDtvHSv
 FHJFBG7QFGsPmj4A4LyDB2fdLP50LKgjLTVGqD51WMM8iOaFpM/72/XKc6uh5n8rmn1NdGU2zl/
 +a/D+wNi2HacNXj2TcjNeO/VFrcCpZBM=
X-Received: by 2002:a05:6870:c1c1:b0:ee:5c83:7be7 with SMTP id
 i1-20020a056870c1c100b000ee5c837be7mr17887138oad.53.1656946541067; 
 Mon, 04 Jul 2022 07:55:41 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tbFMdqWKAdlDh5G08wuBxM+6MpZv+Ihih17KKNlU35BTmCLfb6nYrup9dXM6a1ScJDvWnXWatyGeJW7MfTY/A=
X-Received: by 2002:a05:6870:c1c1:b0:ee:5c83:7be7 with SMTP id
 i1-20020a056870c1c100b000ee5c837be7mr17887126oad.53.1656946540893; Mon, 04
 Jul 2022 07:55:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220616124034.3381391-1-marcandre.lureau@redhat.com>
 <20220616124034.3381391-10-marcandre.lureau@redhat.com>
 <87h74bfqbr.fsf@pond.sub.org>
In-Reply-To: <87h74bfqbr.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 4 Jul 2022 18:55:29 +0400
Message-ID: <CAMxuvay-98qDCcprUKbRhuTqhTEMG8=1S=aH6nxiACxg6-3aMw@mail.gmail.com>
Subject: Re: [PATCH 9/9] scripts/qapi: add required system includes to visitor
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>, 
 Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Warner Losh <imp@bsdimp.com>, 
 Kyle Evans <kevans@freebsd.org>, Hanna Reitz <hreitz@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Fam Zheng <fam@euphon.net>, 
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
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

Hi

On Thu, Jun 23, 2022 at 5:43 PM Markus Armbruster <armbru@redhat.com> wrote=
:
>
> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > The generated visitor code includes abort() & assert(), we shouldn't
> > rely on the global "-i" headers to include the necessary system headers=
.
>
> Suggest ", even though the default qemu/osdep.h always does.
>
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  scripts/qapi/visit.py | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
> > index 1ff464c0360f..d686df17f4b6 100644
> > --- a/scripts/qapi/visit.py
> > +++ b/scripts/qapi/visit.py
> > @@ -326,6 +326,8 @@ def __init__(self, prefix: str, include: List[str])=
:
> >      def _begin_builtin_module(self) -> None:
> >          self._genc.preamble_add(mcgen('''
> >  %(include)s
> > +#include <assert.h>
> > +#include <stdlib.h>
> >
> >  #include "qapi/error.h"
> >  #include "qapi/qapi-builtin-visit.h"
> > @@ -342,6 +344,8 @@ def _begin_user_module(self, name: str) -> None:
> >          visit =3D self._module_basename('qapi-visit', name)
> >          self._genc.preamble_add(mcgen('''
> >  %(include)s
> > +#include <assert.h>
> > +#include <stdlib.h>
> >
> >  #include "qapi/error.h"
> >  #include "qapi/qmp/qerror.h"
>
> Mildly irritating, because we normally kill such includes as redundant
> on sight.
>
> The builtin module (qapi-builtin-visit.c) doesn't actually need these
> headers.  I guess you include them just in case that changes.

True, at least not directly. I will drop it for now, we can add it
back when/if I figure out it is necessary.


