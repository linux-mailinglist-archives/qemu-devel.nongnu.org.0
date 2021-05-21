Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA4A38C6B0
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 14:41:04 +0200 (CEST)
Received: from localhost ([::1]:41764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk4Sd-0005vd-3S
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 08:41:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lk4OR-0001zo-O4
 for qemu-devel@nongnu.org; Fri, 21 May 2021 08:36:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lk4OP-0008Pw-4F
 for qemu-devel@nongnu.org; Fri, 21 May 2021 08:36:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621600599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hva8Zrz48icdwwGHDzMyMQUe1NAKXqM/C2UpuFlF6GM=;
 b=YeAoouYBT1w9NINMGVYXc9H2fy9eypAwh1WbHJLp5MK8eopRcrJ3BksHGYIAP45MOyJRqM
 nImAZFo2xi7/B9Je2oMx9mDy4OQxT7BYOUG2DyUnQq/cA7QmVeyhLCcbSXePVnTRJ+iipA
 fUHBwwgGfAagLO7LpZWbKlxw3sSMMDo=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-gXIN-YjYPvadyEdu-54Ong-1; Fri, 21 May 2021 08:36:37 -0400
X-MC-Unique: gXIN-YjYPvadyEdu-54Ong-1
Received: by mail-vs1-f72.google.com with SMTP id
 y13-20020a67d20d0000b02902354e7b1beaso6472205vsi.5
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 05:36:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hva8Zrz48icdwwGHDzMyMQUe1NAKXqM/C2UpuFlF6GM=;
 b=PxL5/39gzNPYosNmbfWHm7cnUltWX7Se2B3xeUhHihIFXWA0nyT3vGtxIczd0JLR0B
 ku8sFASH5HTFae70BPk/kwfoVUTXfqcJyZJLrknMw3CMaG72OIl6fqhE9Bzf8gTEABeU
 cIxKD39STtOlxHKsCwu0AloSbza6rzcYM8vXVnmOSg7GAvBKaUAusenHLOYCQHex6WDc
 IjY/CZyS+gWTDojemMl9W/kH4VKmtOQO9KhXUuo9Q+PR/4t5CEidvYTSNtp3/ZBJoPPb
 ddaD1QyYD6WK/+bcntJf8cK3xQ9IqqCcObUR/UmNwpDCt8cAaKop8oBOnLt/489CwPEt
 Z9Aw==
X-Gm-Message-State: AOAM531Hs4YzLBcO8vKOsX0xsvGgCsLrSoOREFrC1Y4KHKFZrxam4iTe
 AHyw4cLT3OXebG4GMw+ZHfdv1I7iJudxibjN9RTfGzQSXM2GxBr4WzRwBPtmMQjYOLgyf/ogu6C
 nSlKDe16eLiMGZivoV77Dlp8tT6FDb/k=
X-Received: by 2002:a1f:280e:: with SMTP id o14mr9974726vko.19.1621600596819; 
 Fri, 21 May 2021 05:36:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXVMeJwk+XWN/PiWxiCerIxF62c8oqDRdNrKOS+/QxzviyvYAVGscSObcImMSj6+NnkEUWPeS/jOgXRwy30/c=
X-Received: by 2002:a1f:280e:: with SMTP id o14mr9974704vko.19.1621600596635; 
 Fri, 21 May 2021 05:36:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210519184549.2192728-1-f4bug@amsat.org>
 <20210519184549.2192728-5-f4bug@amsat.org>
 <5a77ade3-1a6c-2389-4a1c-2c7c2266f298@redhat.com>
 <20c001a0-60ed-df08-b67d-884022e74d04@amsat.org>
 <396e75d2-fe22-3054-fbee-d6de02339b2a@redhat.com>
 <YKeQkqviHbxqcC6Y@redhat.com>
 <afa421f3-337a-c488-c767-b73aaf3780b8@redhat.com>
In-Reply-To: <afa421f3-337a-c488-c767-b73aaf3780b8@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 21 May 2021 09:36:10 -0300
Message-ID: <CAKJDGDYMygQYw4anr1An+TqRYehJ136M-0Yr0Qb2b5Nfff_2mA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] gitlab-ci: Add ccache in $PATH and display
 statistics
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 21, 2021 at 8:03 AM Thomas Huth <thuth@redhat.com> wrote:
>
> On 21/05/2021 12.50, Daniel P. Berrang=C3=A9 wrote:
> > On Fri, May 21, 2021 at 12:48:21PM +0200, Thomas Huth wrote:
> >> On 20/05/2021 13.27, Philippe Mathieu-Daud=C3=A9 wrote:
> >>> +Stefan/Daniel
> >>>
> >>> On 5/20/21 10:02 AM, Thomas Huth wrote:
> >>>> On 19/05/2021 20.45, Philippe Mathieu-Daud=C3=A9 wrote:
> >>>>> If a runner has ccache installed, use it and display statistics
> >>>>> at the end of the build.
> >>>>>
> >>>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >>>>> ---
> >>>>>     .gitlab-ci.d/buildtest-template.yml | 5 +++++
> >>>>>     1 file changed, 5 insertions(+)
> >>>>>
> >>>>> diff --git a/.gitlab-ci.d/buildtest-template.yml
> >>>>> b/.gitlab-ci.d/buildtest-template.yml
> >>>>> index f284d7a0eec..a625c697d3b 100644
> >>>>> --- a/.gitlab-ci.d/buildtest-template.yml
> >>>>> +++ b/.gitlab-ci.d/buildtest-template.yml
> >>>>> @@ -6,13 +6,18 @@
> >>>>>           then
> >>>>>             JOBS=3D$(sysctl -n hw.ncpu)
> >>>>>             MAKE=3Dgmake
> >>>>> +        PATH=3D/usr/local/libexec/ccache:$PATH
> >>>>>             ;
> >>>>>           else
> >>>>>             JOBS=3D$(expr $(nproc) + 1)
> >>>>>             MAKE=3Dmake
> >>>>> +        PATH=3D/usr/lib/ccache:/usr/lib64/ccache:$PATH
> >>>>
> >>>> That does not make sense for the shared runners yet. We first need
> >>>> something to enable the caching there - see my series "Use ccache in=
 the
> >>>> gitlab-CI" from April (which is currently stalled unfortunately).
> >>>
> >>> TL;DR: I don't think we should restrict our templates to shared runne=
rs.
> >>
> >> I'm certainly not voting for restricting ourselves to only use shared
> >> runners here - but my concern is that this actually *slows* down the s=
hared
> >> runners even more! (sorry, I should have elaborated on that in my prev=
ious
> >> mail already)
> >>
> >> When I was experimenting with ccache in the shared runners, I saw that=
 the
> >> jobs are running even slower with ccache enabled as long as the cache =
is not
> >> populated yet. You only get a speedup afterwards. So if you add this n=
ow
> >> without also adding the possibility to store the cache persistently, t=
he
> >> shared runners will try to populate the cache each time just to throw =
away
> >> the results afterwards again. Thus all the shared runners only get slo=
wer
> >> without any real benefit here.
> >>

I was in favor of adding the changes and benefiting custom runners
until I saw your reply. In this case, I agree we should investigate
how these changes affect shared runners.

> >> Thus we either need to get ccache working properly for the shared runn=
ers
> >> first, or you have to think of a different way of enabling ccache for =
the
> >> non-shared runners, so that it does not affect the shared runners
> >> negatively.
> >
> > Is there anything functional holding up your previous full cccache supp=
ort
> > series from last month ? Or is it just lack of reviews ?
>
> It's basically the problems mentioned in the cover letter and Stefan's
> comment here:
>
>   https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg02219.html
>
> The series needs more love and more testing, if it's feasible with the
> gitlab-CI architecture at all to use ccache in a good way ... if we don't
> get a real speedup by the patches, it's certainly not worth the effort to
> integrate this...
>
> If someone wants to have a try to improve the patch series, your help is
> certainly welcome - since at least I personally lack the time and motivat=
ion
> to improve this any further.

Do you mind if I play with your patch series? I do not promise 100% of
my time working on it, but I was thinking about dedicating some time
to ccache before your patch series.

>
>   Thomas
>


