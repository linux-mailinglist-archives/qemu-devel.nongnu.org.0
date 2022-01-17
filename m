Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50479490EFE
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 18:15:02 +0100 (CET)
Received: from localhost ([::1]:45814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Vau-0008U0-VC
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 12:15:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n9VZn-0007Pf-8P
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 12:13:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n9VZi-00082Y-Nt
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 12:13:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642439625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hOIwjlaCC96HlqrDhsxjvTD1rj5fmG2omVEe2iVkvXg=;
 b=eioUr4YXI3PVvcGXPwQcDz7dS0CT6BgV7TdIrcpwxqFOrIET/XKTWMA94urKTxbfZWxag4
 tGf8S7HUXLrknQ0pEJlYfC1kRyU3h/3Fah6dPXE0DXuqF4R7+pw/la3+0RFPixZq8X3TMM
 92rrj/XCvmecKqs6STv+ZgRdVNxo8Mo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-ScfuzzlAPD-Xrb0ZaTSR3A-1; Mon, 17 Jan 2022 12:13:42 -0500
X-MC-Unique: ScfuzzlAPD-Xrb0ZaTSR3A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEF06874980;
 Mon, 17 Jan 2022 17:13:40 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.223])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C9982BCD9;
 Mon, 17 Jan 2022 17:13:29 +0000 (UTC)
Date: Mon, 17 Jan 2022 18:13:27 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Mark Burton <mark.burton@greensocs.com>
Subject: Re: "Startup" meeting (was Re: Meeting today?)
Message-ID: <YeWjtxEcbb6jcbi8@redhat.com>
References: <YbeWxAn6Zw7rH+5K@redhat.com>
 <CC132B60-3F08-4F03-B328-4C33407BB944@greensocs.com>
 <87lf0nto1k.fsf@dusky.pond.sub.org> <YbiS8Zc7fcoeoSyC@redhat.com>
 <87bl1jqm1a.fsf@dusky.pond.sub.org>
 <CAJy5ezofpy09ZOtVHFofGTzt3U8MEA_ddpBHifuF50sVDFXULA@mail.gmail.com>
 <73955990-9FD1-42CD-B476-F2AD95C219E9@greensocs.com>
 <YdbRShE01esANc5h@redhat.com>
 <fb519eb4-c0c6-a0b6-585d-e708b04ed207@amsat.org>
 <BC0208B2-5ECE-4F74-9DFF-FB8959642C48@greensocs.com>
MIME-Version: 1.0
In-Reply-To: <BC0208B2-5ECE-4F74-9DFF-FB8959642C48@greensocs.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?iso-8859-1?Q?=22Daniel_P=2E_Berrang=E9=22?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 11.01.2022 um 11:22 hat Mark Burton geschrieben:
> That is my understanding… 
> See you there!

Unfortunately, I missed this whole thread until now.

If the meeting did happen, has anyone taken notes? And if so, where
could I find them?

Kevin

> > On 11 Jan 2022, at 11:20, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
> > 
> > Hi,
> > 
> > Just checking in, this call is scheduled for today, 3pm CEST, right?
> > 
> > Here is the KVM call calendar:
> > https://www.google.com/calendar/embed?src=dG9iMXRqcXAzN3Y4ZXZwNzRoMHE4a3BqcXNAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ
> > 
> > On 1/6/22 12:23, Daniel P. Berrangé wrote:
> >> No one objected, so I think we can go for the 11th.
> >> 
> >> On Thu, Jan 06, 2022 at 12:21:56PM +0100, Mark Burton wrote:
> >>> Can we confirm the 11th for this meeting?
> >>> 
> >>> Cheers
> >>> Mark.
> >>> 
> >>> 
> >>>> On 4 Jan 2022, at 10:29, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> >>>> 
> >>>> 
> >>>> 
> >>>> On Tue, Dec 14, 2021 at 3:49 PM Markus Armbruster <armbru@redhat.com <mailto:armbru@redhat.com>> wrote:
> >>>> Daniel P. Berrangé <berrange@redhat.com <mailto:berrange@redhat.com>> writes:
> >>>> 
> >>>>> On Tue, Dec 14, 2021 at 12:37:43PM +0100, Markus Armbruster wrote:
> >>>>>> Mark Burton <mark.burton@greensocs.com <mailto:mark.burton@greensocs.com>> writes:
> >>>>>> 
> >>>>>>> I realise it’s very short notice, but what about having a discussion today at 15:00 ?
> >>>>>> 
> >>>>>> I have a conflict today.  I could try to reschedule, but I'd prefer to
> >>>>>> talk next week instead.  Less stress, better prep.
> >>>>> 
> >>>>> I fear we've run out of time for this year if we want all interested
> >>>>> parties to be able to attend.  I'll be off on PTO from end of this
> >>>>> week until the new year, and I know alot of folk are doing similar.
> >>>> 
> >>>> Right.  I'll be off from Dec 23 to Jan 9.  Can we all make Jan 11?
> >>>> 
> >>>> Jan 11th works for me!
> >>>> 
> >>>> Thanks,
> >>>> Edgar
> >>> 
> >> 
> >> Regards,
> >> Daniel
> 
> 


