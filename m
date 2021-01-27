Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8F8305F26
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 16:11:23 +0100 (CET)
Received: from localhost ([::1]:33054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4mTa-0008K3-Si
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 10:11:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l4mSL-0007cQ-8h
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 10:10:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l4mSI-0002tK-Cp
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 10:10:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611760201;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JAFFCRSdYd81FxjDSiKxz2ZYfCbZhyvwIv7ohY22JTY=;
 b=Rc5dYl2ZO/VJKX/XC3lA77DHIxX2oypwBAwG6Rnbnjy7sZlXCnynyZ9gVOIMoPFQ71FyZm
 SqwEpXFBuvyqIzSZLRILeyQtUjplGkY7xP06yAt9O2pt3l8ddJrU5NSPc6bA7RsY/Oo1Zi
 Rx7LvkpJZpuAZcYR+WELhEN22K/nTkk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-8G4cTKvlNzWSaqCzu6x4ig-1; Wed, 27 Jan 2021 10:09:56 -0500
X-MC-Unique: 8G4cTKvlNzWSaqCzu6x4ig-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DB3418C89FE;
 Wed, 27 Jan 2021 15:09:55 +0000 (UTC)
Received: from redhat.com (ovpn-115-120.ams2.redhat.com [10.36.115.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 191015D6A1;
 Wed, 27 Jan 2021 15:09:52 +0000 (UTC)
Date: Wed, 27 Jan 2021 15:09:50 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v3] machine: add missing doc for memory-backend option
Message-ID: <20210127150950.GO3653144@redhat.com>
References: <20210121161504.1007247-1-imammedo@redhat.com>
 <20210127104511.GF3653144@redhat.com>
 <20210127105436.GG3653144@redhat.com>
 <756c025a-3811-4a36-98a2-3a02bd756523@redhat.com>
MIME-Version: 1.0
In-Reply-To: <756c025a-3811-4a36-98a2-3a02bd756523@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
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
Cc: Igor Mammedov <imammedo@redhat.com>, pkrempa@redhat.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 27, 2021 at 03:24:26PM +0100, Michal Privoznik wrote:
> On 1/27/21 11:54 AM, Daniel P. Berrangé wrote:
> > On Wed, Jan 27, 2021 at 10:45:11AM +0000, Daniel P. Berrangé wrote:
> > > On Thu, Jan 21, 2021 at 11:15:04AM -0500, Igor Mammedov wrote:
> 
> 
> > > 
> > > How does a mgmt app know which machine types need to use this
> > > option ? The machine type names are opaque strings, and apps
> > > must not attempt to parse or interpret the version number
> > > inside the machine type name, as they can be changed by
> > > distros.  IOW, saying to use it for machine types 4.0 and
> > > older isn't a valid usage strategy IMHO.
> > 
> > Looking at the libvirt patch, we do indeed use his property
> > unconditionally for all machine types, precisely because parsing
> > version numbers from the machine type is not allowed.
> > 
> > https://www.redhat.com/archives/libvir-list/2021-January/msg00633.html
> > 
> > So this doc is telling apps to do something that isn't viable
> 
> The other approach that I was suggesting was, that QEMU stops reporting
> 'default-ram-id' for affected machine types. The way the switch from '-m
> XMB' to memory-backend-* was implemented in libvirt is that if libvirt sees
> 'default-ram-id' attribute for given machine type it uses memory-backend-*
> otherwise it falls back to -m.
> 
> Since we know which machine types are "broken", we can stop reporting the
> attribute and thus stop tickling this bug. I agree that it puts more burden
> on distro maintainers to backport the change, but I think it's acceptable
> risk.

IIUC That's only a burden for distros if they're creating their own
machine types, in which case they've already decided the burden is
a net win.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


