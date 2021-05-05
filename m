Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BD337383E
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 12:00:37 +0200 (CEST)
Received: from localhost ([::1]:35280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leEKb-0001os-0E
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 06:00:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1leEIt-0000VY-2O
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:58:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1leEIr-0001Kn-5W
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:58:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620208728;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WmG8sKzjBn9wxHCfbL2YPeCWi5+Xxp9F4aGzKcFgvqk=;
 b=Ld1jO8/Zz08bC9esaihB64OdvpHoOZgsKNsBbJjPGBVTRmEVS26xV/5f6Y5Vg2qknpZSHb
 2UnHIRtWMtGujV0D0zZKC/ozvvQI7VDP6qexz+xR7HPRtF0j0OmbAg7wk7nI3HaxNVs5G0
 S8BEWTbNHyl74s46wgdEViiUzXu8SU0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-wNxBa9rUOCKeFX3D2R7N_Q-1; Wed, 05 May 2021 05:58:45 -0400
X-MC-Unique: wNxBa9rUOCKeFX3D2R7N_Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A9F66D249;
 Wed,  5 May 2021 09:58:44 +0000 (UTC)
Received: from redhat.com (ovpn-114-253.ams2.redhat.com [10.36.114.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C4F519D61;
 Wed,  5 May 2021 09:58:37 +0000 (UTC)
Date: Wed, 5 May 2021 10:58:34 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: Switching to the GitLab bug tracker
Message-ID: <YJJsSsj4Cg9DFrZU@redhat.com>
References: <a6d77040-1dba-90c7-5ebe-5778177e686e@redhat.com>
 <YJEJNBJOqry5sHiy@stefanha-x1.localdomain>
 <2953611e-8780-f2a8-6394-0a5099042eb1@redhat.com>
 <20210505095530.lvpuyunqzv422app@steredhat>
MIME-Version: 1.0
In-Reply-To: <20210505095530.lvpuyunqzv422app@steredhat>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 qemu-discuss <qemu-discuss@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 05, 2021 at 11:55:30AM +0200, Stefano Garzarella wrote:
> On Tue, May 04, 2021 at 12:20:03PM +0200, Philippe Mathieu-Daudé wrote:
> > On 5/4/21 10:43 AM, Stefan Hajnoczi wrote:
> > > On Mon, May 03, 2021 at 01:16:51PM +0200, Thomas Huth wrote:
> > > > As you might have already noticed by some other mails on the qemu-devel
> > > > mailing list, we are in progress of switching our bug tracking tool from
> > > > Launchpad to Gitlab. The new tracker can now be found here:
> > > > 
> > > >  https://gitlab.com/qemu-project/qemu/-/issues
> > > 
> > > Thank you for doing this, Thomas!
> > > 
> > > > 1) We likely won't have the possibility anymore to automatically send e-mail
> > > > notifications for new bugs to the qemu-devel mailing list. If you want to
> > > > get informed about new bugs, please use the notification mechanism from
> > > > Gitlab instead. That means, log into your gitlab account, browse to
> > > > 
> > > >  https://gitlab.com/qemu-project/qemu
> > > > 
> > > > and click on the bell icon at the top of the page to manage your
> > > > notifications, e.g. enable notifications for "New issues" there.
> > > 
> > > All maintainers and most regular contributors should follow the issue
> > > tracker so that QEMU developers are aware of new issues. Please do this!
> > > 
> > > An alternative mechanism is the RSS/Atom feed available by clicking the
> > > "Subscribe to RSS feed" button left of the "New issue" button here:
> > > 
> > >   https://gitlab.com/qemu-project/qemu/-/issues
> > 
> > You can also subscribe to labels of interest [*] going to
> > https://gitlab.com/qemu-project/qemu/-/labels
> > 
> > For example in my case I subscribed to receive notifications
> > only from these labels:
> > 
> > - kind:Bug
> > - Storage
> > - pflash
> > - Fuzzer
> > - workflow:Merged
> 
> Cool feature, I also subscribed to some labels.
> 
> I was trying to assign a label, for example "Storage" to this issue:
> https://gitlab.com/qemu-project/qemu/-/issues/96
> 
> but I can't, should I have some special permission/role?

Yes, anyone who is a QEMU maintainer needs to be added to gitlab
project with "Reporter" role to be able to do bug janitoring.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


