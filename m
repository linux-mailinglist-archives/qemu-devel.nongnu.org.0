Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D588049B84B
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 17:13:04 +0100 (CET)
Received: from localhost ([::1]:49408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCORL-0006Dr-OL
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 11:13:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nCNQA-0001uX-AR
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 10:07:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nCNQ7-00060m-9B
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 10:07:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643123260;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=w77O1A87KqEsfSIcpSBr8YYZ20cWynooLLjMozzB1jE=;
 b=gb5vC8n8cxWm2wXCIBbKgvsVczw1B7zjZgvYlk0S5eTS5sbc+9XjqS5Gav2CHgo+97VEcb
 2bi7fZz6mlTa9kRDZipZ9iRQc7+KsuIR6xQwqSlHiFymbp2bQSed+vFYteZDhSuZ1D67K9
 ufk1TeZh8Ey1W80dhYYrKSU3oM7EVHk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-FCVHiWt4N36gym_qZC8jxg-1; Tue, 25 Jan 2022 10:07:28 -0500
X-MC-Unique: FCVHiWt4N36gym_qZC8jxg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D51283DD20;
 Tue, 25 Jan 2022 15:07:27 +0000 (UTC)
Received: from redhat.com (unknown [10.33.37.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 886FB1091EF1;
 Tue, 25 Jan 2022 15:07:02 +0000 (UTC)
Date: Tue, 25 Jan 2022 15:06:59 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v7 0/4] VNC-related HMP/QMP fixes
Message-ID: <YfASE9EieKWM7fEt@redhat.com>
References: <20211021100135.4146766-1-s.reiter@proxmox.com>
 <87ee4x8cpc.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87ee4x8cpc.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
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
Cc: Wolfgang Bumiller <w.bumiller@proxmox.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fabian Ebner <f.ebner@proxmox.com>, Eric Blake <eblake@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 24, 2022 at 02:50:39PM +0100, Markus Armbruster wrote:
> Stefan Reiter <s.reiter@proxmox.com> writes:
> 
> > Since the removal of the generic 'qmp_change' command, one can no longer replace
> > the 'default' VNC display listen address at runtime (AFAIK). For our users who
> > need to set up a secondary VNC access port, this means configuring a second VNC
> > display (in addition to our standard one for web-access), but it turns out one
> > cannot set a password on this second display at the moment, as the
> > 'set_password' call only operates on the 'default' display.
> >
> > Additionally, using secret objects, the password is only read once at startup.
> > This could be considered a bug too, but is not touched in this series and left
> > for a later date.
> 
> Related: Vladimir recently posted a patch to add a new command for
> changing VNC server listening addresses.  Daniel asked him to work it
> into display-reload instead[1].  Vladimir complied[2].
> 
> Daniel, what do you think about this one?  Should it also use
> display-reload?

I'd ultimately intend to deprecate & remove the direct setting of
passwords on the CLI, and exclusively rely on the 'secret' object
for passing in passwords. With this in mind, I'd not be enthusiastic
about adding new commands for changing passwords in QMP directly,
rather I think we should have a way to change the 'secret' object
in use.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


