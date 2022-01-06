Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F904863BB
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 12:28:29 +0100 (CET)
Received: from localhost ([::1]:53000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5QwW-0003JJ-4P
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 06:28:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n5Qsd-0001tc-6K
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 06:24:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n5QsY-0003rP-Hl
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 06:24:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641468253;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+VA1P3qRosnIsrpjrQLkr3Fcc73msLzbcXQxsVJ7TOY=;
 b=eXFUwWCdhC1B/a8amJPNYRdNicGl5I3+AvYSGnHlIq8aQEUhWaE8K4/qhd/MhSg6WRQQKy
 ruUHC7fu/4vH63Kzv7bDCeTYtFx7/S1I6poFVHAjVuTM+qnmpOGP0qbId1jOqX7bV0e5Fh
 SPIJj1GbOm8Q6iuvN8DAvu4KPWlEETs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-sgOWZXRDOqmloaTy8zaBHw-1; Thu, 06 Jan 2022 06:24:05 -0500
X-MC-Unique: sgOWZXRDOqmloaTy8zaBHw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A75C61083F60;
 Thu,  6 Jan 2022 11:24:04 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.204])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 43441752AD;
 Thu,  6 Jan 2022 11:23:57 +0000 (UTC)
Date: Thu, 6 Jan 2022 11:23:54 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Mark Burton <mark.burton@greensocs.com>
Subject: Re: "Startup" meeting (was Re: Meeting today?)
Message-ID: <YdbRShE01esANc5h@redhat.com>
References: <16cd5683-4f97-d24c-dd19-24febcab7ba8@redhat.com>
 <YbeL7EjoTtrUrGa2@redhat.com>
 <e33c3d09-b507-798c-b18e-df684ec797e2@redhat.com>
 <YbeWxAn6Zw7rH+5K@redhat.com>
 <CC132B60-3F08-4F03-B328-4C33407BB944@greensocs.com>
 <87lf0nto1k.fsf@dusky.pond.sub.org> <YbiS8Zc7fcoeoSyC@redhat.com>
 <87bl1jqm1a.fsf@dusky.pond.sub.org>
 <CAJy5ezofpy09ZOtVHFofGTzt3U8MEA_ddpBHifuF50sVDFXULA@mail.gmail.com>
 <73955990-9FD1-42CD-B476-F2AD95C219E9@greensocs.com>
MIME-Version: 1.0
In-Reply-To: <73955990-9FD1-42CD-B476-F2AD95C219E9@greensocs.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No one objected, so I think we can go for the 11th.

On Thu, Jan 06, 2022 at 12:21:56PM +0100, Mark Burton wrote:
> Can we confirm the 11th for this meeting?
> 
> Cheers
> Mark.
> 
> 
> > On 4 Jan 2022, at 10:29, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> > 
> > 
> > 
> > On Tue, Dec 14, 2021 at 3:49 PM Markus Armbruster <armbru@redhat.com <mailto:armbru@redhat.com>> wrote:
> > Daniel P. Berrangé <berrange@redhat.com <mailto:berrange@redhat.com>> writes:
> > 
> > > On Tue, Dec 14, 2021 at 12:37:43PM +0100, Markus Armbruster wrote:
> > >> Mark Burton <mark.burton@greensocs.com <mailto:mark.burton@greensocs.com>> writes:
> > >> 
> > >> > I realise it’s very short notice, but what about having a discussion today at 15:00 ?
> > >> 
> > >> I have a conflict today.  I could try to reschedule, but I'd prefer to
> > >> talk next week instead.  Less stress, better prep.
> > >
> > > I fear we've run out of time for this year if we want all interested
> > > parties to be able to attend.  I'll be off on PTO from end of this
> > > week until the new year, and I know alot of folk are doing similar.
> > 
> > Right.  I'll be off from Dec 23 to Jan 9.  Can we all make Jan 11?
> > 
> > Jan 11th works for me!
> > 
> > Thanks,
> > Edgar
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


