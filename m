Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC86C3311B7
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 16:11:01 +0100 (CET)
Received: from localhost ([::1]:55282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJHXA-0002pO-Tw
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 10:11:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lJHUY-0007h9-HA
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 10:08:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lJHUW-0001og-J5
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 10:08:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615216095;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ip22LIulL7cfpYRmgInQtd06xux74/FmmMY7ytkfBpY=;
 b=J2lYsqqe1dVpcweplRKTufnyuj4/1K45ieSaS3tXsoU3kCXcF1qasXYJSxyC64M01hxr+f
 Qas+LdBDf1DTW999gH24Q+NfmscAHM2lkP9xO8/AGbf3cT55DvK1gucCXu0VV+OUTXpBLh
 +tdsq1hP3qtp/b+9hv8Y3I2cqcynK68=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-V6rQOMtqNmq3raAVc3Bozg-1; Mon, 08 Mar 2021 10:07:58 -0500
X-MC-Unique: V6rQOMtqNmq3raAVc3Bozg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B38751084D6E;
 Mon,  8 Mar 2021 15:07:56 +0000 (UTC)
Received: from redhat.com (ovpn-114-69.ams2.redhat.com [10.36.114.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BE0C5C27C;
 Mon,  8 Mar 2021 15:07:54 +0000 (UTC)
Date: Mon, 8 Mar 2021 15:07:51 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v26 00/20] i386 cleanup PART 2
Message-ID: <YEY9x0+2KZFHrm6A@redhat.com>
References: <20210301085450.1732-1-cfontana@suse.de>
 <cfeead83-4890-bdd8-c5cb-9bdb2ca24abb@suse.de>
 <6230ef40-c0ec-875e-dbd3-46fb5925322e@amsat.org>
 <81208ea0-f389-14d0-c366-0579dee3376d@suse.de>
 <f3700214-baed-e03a-d4e1-028758b07054@amsat.org>
MIME-Version: 1.0
In-Reply-To: <f3700214-baed-e03a-d4e1-028758b07054@amsat.org>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 08, 2021 at 03:57:29PM +0100, Philippe Mathieu-Daudé wrote:
> On 3/8/21 2:52 PM, Claudio Fontana wrote:
> > On 3/8/21 2:27 PM, Philippe Mathieu-Daudé wrote:
> >> Hi Claudio,
> >>
> >> On 3/8/21 1:57 PM, Claudio Fontana wrote:
> >>> Hi,
> >>>
> >>> anything else for me to do here?
> >>>
> >>> The latest rebased state of this series should be always available here:
> >>>
> >>> https://gitlab.com/hw-claudio/qemu/-/tree/i386_cleanup_8
> >>>
> >>> When it comes to the ARM cleanup series,
> >>> I would like to have the tests pass for ARM, before doing even more changes, could you help me there Philippe?
> >>>
> >>> Maybe applying some of your changes on top would fix the failures? I tried, for example with the arm-cpu-features ones, but it didn't work for me..
> >>
> >> TBH I wrote these patches during my personal spare time and this
> >> became a real Pandora box that drained too much energy. I prefer
> >> to step back and focus on finishing smaller tasks before burning
> >> out. That said I appreciate your effort and am interested in
> >> following / reviewing your work.
> >>
> >> Regards,
> >>
> >> Phil.
> >>
> > 
> > Thanks Philippe for sharing this, and I agree completely, it is very draining.
> > 
> > The effort of making tests happy that run in artificial environments in particular often feels to me
> > as too disconnected from actually ensuring that there is no real run time regression.
> > 
> > qtest_enabled() (implicitly, or explicitly via open-ended else statements) is another painful variable to keep in mind in cpu and machine code, so it is not helpful in my view.
> > 
> > I'll try to push more to get the tests running again, if you have any comment or idea, feel free to just point me in the right direction,
> > that is very valuable to me, even without working code.
> 
> Basically I gave up after realizing from Daniel reviews that we need
> QMP commands to query QEMU at runtime its built-in features, so we
> have build-agnostic tests easier to maintain. I agree this is the
> best way to resolve this particular case, but also scale for various
> other cases.

Which patch / review are you referring to here ?


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


