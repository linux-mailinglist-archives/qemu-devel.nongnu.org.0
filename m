Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CB13648BC
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 19:06:21 +0200 (CEST)
Received: from localhost ([::1]:42314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYXLo-0003x2-7F
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 13:06:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lYXIG-0001wx-36
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 13:02:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lYXID-0003dL-ET
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 13:02:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618851755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vlh2wNl4q0GnfZU1K25YvwbcmB0F2MncFAX7+4cbfgQ=;
 b=CPfRQmyxv/CWOE2QdhnAe1Ltqb2CioDI8Bu250tSOQuCgskkd8mDScsU8LAPEFXPW3P+PB
 IG7Q8ZdCwyGfpuGBMLHSFdhdw5IoQVxrSxlmXB6DjXSBX0YDrS7B2j87vEOW1j8tx0YA7U
 ACu9hm5BbChAchX1GvK5k6ePoPKHInE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-UzP5K-tzO-yH29Gnbegitg-1; Mon, 19 Apr 2021 13:02:29 -0400
X-MC-Unique: UzP5K-tzO-yH29Gnbegitg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AA906D249;
 Mon, 19 Apr 2021 17:02:28 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-200.ams2.redhat.com
 [10.36.113.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED92360843;
 Mon, 19 Apr 2021 17:02:26 +0000 (UTC)
Date: Mon, 19 Apr 2021 19:02:24 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: any remaining for-6.0 issues?
Message-ID: <20210419190224.33408d0e.cohuck@redhat.com>
In-Reply-To: <20210419090551.4a3ae4eb.cohuck@redhat.com>
References: <CAFEAcA8=qEFgvUqGFdWLJ+1ePPv2Ybisomrs2o77PyiAZA2sXg@mail.gmail.com>
 <fef000db-6562-f41c-24c0-5fb0f8fb4dd3@redhat.com>
 <c63bbf7e-2230-44b2-7671-086c7dacd787@ilande.co.uk>
 <CAFEAcA9Q7q5eoE+qBOY9LYQnnaccSfMux=fOzb3+BtRWjXm6gw@mail.gmail.com>
 <b7912545-96b8-70b7-21b2-578808051f14@ilande.co.uk>
 <20210419090551.4a3ae4eb.cohuck@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alex =?UTF-8?B?QmVu?= =?UTF-8?B?bsOpZQ==?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Apr 2021 09:05:51 +0200
Cornelia Huck <cohuck@redhat.com> wrote:

> On Sun, 18 Apr 2021 11:38:09 +0100
> Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> wrote:
> 
> > On 17/04/2021 20:46, Peter Maydell wrote:
> >   
> > >> On 14/04/2021 13:48, Thomas Huth wrote:    
> > >>> I've seen some intermittend, non-reproducible crashes with usermode QEMU in some of
> > >>> my CI runs, e.g.:
> > >>>
> > >>> https://gitlab.com/thuth/qemu/-/jobs/1178256498#L3876
> > >>>
> > >>> https://gitlab.com/thuth/qemu/-/jobs/1146276208#L3241
> > >>>
> > >>> This was only with ccache enabled, so I thought that it might be related to my
> > >>> work-in-progress ccache patches...
> > >>>
> > >>> ... but now Cornelia reported that she has seen such a crash in one of her branches,
> > >>> too (which is completely unrelated to my ccache patches):
> > >>>
> > >>> https://gitlab.com/cohuck/qemu/-/jobs/1178860927#L3867
> > >>>
> > >>> That makes me wonder whether we currently have a real problem with user-mode in the
> > >>> master branch? Did anybody else see such problems?    
> > >>
> > >> I've definitely seen the same issue as Cornelia in my Gitlab CI builds for the ESP
> > >> security fixes (first version of which appeared just before rc0). The user builds
> > >> always fail on "run-tcg-tests-s390x-linux-user" for me.    
> > > 
> > > Do we have any better understanding yet of the cause here?
> > > (I ask because I think we're going to need an rc4 for other reasons,
> > > so if there's a ready-to-go fix then we could consider it.)    
> > 
> > I don't think so. I tried a run with a possible candidate patch reverted (see 
> > https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg02345.html) but Cornelia's 
> > response indicates that the result is still inconclusive :(  
> 
> That patch seems to be our best candidate so far, but the intermittent
> nature of the failures make it hard to pin down... I don't see anything
> obviously wrong with the patch, maybe some linux-user experts have a
> better idea?

FWIW, I tried reproducing the issue on some local systems (no luck),
and on code pushed out to gitlab (where it works most of the time, and
the user builds where it fails are unpredictable.)

I fear the best we can do right now is stare at the code and try to
figure out what might be wrong :(


