Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2C234FBB4
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 10:34:35 +0200 (CEST)
Received: from localhost ([::1]:56444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRWJ7-00084P-Sn
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 04:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lRWHv-0007PA-0s
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 04:33:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lRWHs-0003wk-HD
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 04:33:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617179595;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cy3RbWw9t6TGmdXdWYkIXQ8Sy+Ewn9sc5NVjqLSuXRU=;
 b=KyPnYphh2f8jVI1I557PKTwusisPhXT7Ebr83MO5RqL3qrlJHcte2YTploiAqfqxfpr0VP
 +gWYfTjUh6BFk+7ic+yc9QkxhH8sMv42dUL88ulJY0wzhIBzenRn5qbM2Y6IcpC0oCT5Ep
 jTo3sHA+HzFR9KPIfo8gBoh7O1fYAUo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-MdMsSUsgOh264od5PPWI2A-1; Wed, 31 Mar 2021 04:33:11 -0400
X-MC-Unique: MdMsSUsgOh264od5PPWI2A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6EBC814337;
 Wed, 31 Mar 2021 08:33:09 +0000 (UTC)
Received: from redhat.com (ovpn-114-96.ams2.redhat.com [10.36.114.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 45DC510190AA;
 Wed, 31 Mar 2021 08:33:03 +0000 (UTC)
Date: Wed, 31 Mar 2021 09:33:00 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2] docs: Add a QEMU Code of Conduct and Conflict
 Resolution Policy document
Message-ID: <YGQzvKt0OyhL+k4G@redhat.com>
References: <20210330090806.2802667-1-thuth@redhat.com>
 <c8cc80d5-51f8-9c35-ad98-1eac0d164be6@redhat.com>
 <YGMhUTUXJBM3BcW5@redhat.com>
 <c9ae35d4-65c3-980a-aaf3-e4be58b68d24@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c9ae35d4-65c3-980a-aaf3-e4be58b68d24@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Alexander Graf <agraf@csgraf.de>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 30, 2021 at 04:07:06PM +0200, Paolo Bonzini wrote:
> On 30/03/21 15:02, Daniel P. Berrangé wrote:
> > Consider someone is kicked out from another project for violation
> > of that project's CoC, that would also be considered a violation
> > under QEMU's CoC. This qualifier is explicitly stating that the CoC
> > violation in the other project has no bearing on whether that
> > person can now start participating in QEMU. I think that's a bad
> > mixed message we're sending there. It is especially poor if the
> > victim from the other project is also a QEMU contributor.
> 
> My wording is actually already broader than what is in the contributor
> covenant:
> 
>   This Code of Conduct applies within all project spaces, and it also
>   applies when an individual is representing the project or its
>   community in public spaces. Examples of representing a project or
>   community include using an official project e-mail address, posting
>   via an official social media account, or acting as an appointed
>   representative at an online or offline event.
> 
> That is, the Code of Conduct would not apply to someone saying "the QEMU
> SCSI maintainer rejected my patches, he is an idiot" on Twitter.  My
> proposal sought to find a middle ground, where that person could be
> reasonably considered to be "acting as a member of the project or its
> community".
> 
> > The wording Thomas' draft has
> > 
> >   In addition, violations of this code outside these spaces may
> >   affect a person's ability to participate within them.
> > 
> > doesn't require QEMU to take action. It just set a statement
> > of intent that gives QEMU the freedom to evaluate whether it is
> > reasonable to take action to protect its contributors, should a
> > contributor wish to raise an issue that occurred outside QEMU.
> 
> There have been in the past cases of external people asking projects to ban
> contributors because of views they held on social media.  The Contributor
> Covenant initially included no limit to the application of the CoC and only
> added a limitation after the author herself was involved in such an
> episode[1][2].
> 
> I would prefer to avoid putting QEMU in that situation, and limit the
> applicability code of conduct as much as possible to conflicts within the
> community.
> 
> The Mozilla participation guidelines (2165 words :)) acknowledge that "it is
> possible for actions taken outside of Mozilla's online or in person spaces
> to have a deep impact on community health" but also admit that "this is an
> active topic in the diversity and inclusion realm"[3].
> 
> The Django code of conduct seems to be in the minority in having such a
> broad applicability, while the wording in the Contributor Covenant seems to
> be more informed by actual experience.

Fair enough, as I mentioned previously, I think it is better to go with
commonly accepted approach, than to have something unique to QEMU. So on
that basis, I'm fine with your suggestion


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


