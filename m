Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B6433D417
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 13:42:23 +0100 (CET)
Received: from localhost ([::1]:52474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM91i-0007Ol-EX
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 08:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lM909-0006pF-D4
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:40:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lM906-00074G-L1
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:40:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615898440;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=QxVvmqDYkpZ08pPDTrS8KMyfVC9zVkYzgQ4wTFFKs6s=;
 b=V5C336VWar3y8l8VTbGlR7Iyg04fhyO6yh+xulBNFLXAkQegRzlkTWQnv3gZr/Ozf1LKlP
 sHnTeVO5EuxT6MRvM2NbSzh7K49ylUaNK4+x54muWWVlZtjgLsP1peBmnugX5mr6jxVJj1
 qqontuiiYziU0Od/d+92i1i1y3aNWv4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-bct8rURkOYWw3ErT8M1mSA-1; Tue, 16 Mar 2021 08:40:33 -0400
X-MC-Unique: bct8rURkOYWw3ErT8M1mSA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C17B800C78;
 Tue, 16 Mar 2021 12:40:32 +0000 (UTC)
Received: from redhat.com (ovpn-115-185.ams2.redhat.com [10.36.115.185])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E44F55C261;
 Tue, 16 Mar 2021 12:40:30 +0000 (UTC)
Date: Tue, 16 Mar 2021 12:40:28 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: Windows 10 won't run on default x86_64 machine anymore
Message-ID: <YFCnPEvCDdbHRl/o@redhat.com>
References: <YE+SHIG8qQFMsEJl@diablo.13thmonkey.org>
 <20210315220526.GB1004959@private.email.ne.jp>
 <20210316133354.20460aca@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210316133354.20460aca@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Reinoud Zandijk <reinoud@netbsd.org>, qemu-devel@nongnu.org,
 Isaku Yamahata <isaku.yamahata@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 16, 2021 at 01:33:54PM +0100, Igor Mammedov wrote:
> On Mon, 15 Mar 2021 15:05:26 -0700
> Isaku Yamahata <isaku.yamahata@gmail.com> wrote:
> 
> > On Mon, Mar 15, 2021 at 05:58:04PM +0100,
> > Reinoud Zandijk <reinoud@NetBSD.org> wrote:
> > 
> > > I think its better to revert this and fix Linux ;) or make it a selectable
> > > feature as a workaround that's by default OFF :)  
> > 
> > Anyway here is a patch to flip the default.
> > At the moment, this is compile-only tested to provide the change quickly
> > and make discussion progress.
> > 
> > From 50deeed38832ceccfb68f78dd66de5a1741b2897 Mon Sep 17 00:00:00 2001
> > Message-Id: <50deeed38832ceccfb68f78dd66de5a1741b2897.1615845421.git.isaku.yamahata@intel.com>
> > From: Isaku Yamahata <isaku.yamahata@intel.com>
> > Date: Mon, 15 Mar 2021 14:42:33 -0700
> > Subject: [PATCH] ich9, piix4: flip default value for smm-compat
> > 
> > Make default value for smm-compat of ich9, piix4 true to keep old
> > behavior.
> > To get new (and more conformance to ACPI spec) behavior, explicitly
> > set "-global ICH9-LPC.smm-compat=off" or
> > "-global PIIX4_PM.smm-compat=off".
> 
> I'm not sure we should do that,
> it's fine for non-versioned/new machine type to change in incompatible way with old images,
> it's the job of old versioned machines types to maintain compatibility.
> It's of cause pain for users if they use are unable to boot old image
> on newest machine type, but we never promised that and if we made such
> promise we would never be able to fix bugs.

If this incompatibility with Windows 10 is confirmed though, I don't
think it is viable for QEMU to ship the default machine type with
settings that break Windows 10.




Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


