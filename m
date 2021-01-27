Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 029D230637D
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 19:44:49 +0100 (CET)
Received: from localhost ([::1]:44114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4po8-0005F4-2l
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 13:44:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l4plQ-0003vR-DM
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 13:42:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l4plO-0007lZ-He
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 13:42:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611772915;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vbBl4ZNiMKEeDDzGQMNl8lzU/gHb7LBdvpTujTjbWt4=;
 b=FtqISmh01uNoPxWyIdhjxnIZLOyyNEUXN1BgMlXDW36UYdV89WDnqD+DFh7v4gDjSnGNnM
 xbKuLow0r0UElqwD3QFIFjqYRqC22aqmqlKACCQTimhtCjUQqgptN4C7oz5GR7mgu6G61s
 eXsqJMwNyqUZoTZ3nui0iQduCQ+33iw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-1xBb3ytYOzC4tzWkJ7pwcw-1; Wed, 27 Jan 2021 13:41:51 -0500
X-MC-Unique: 1xBb3ytYOzC4tzWkJ7pwcw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F9081005504;
 Wed, 27 Jan 2021 18:41:50 +0000 (UTC)
Received: from redhat.com (ovpn-115-120.ams2.redhat.com [10.36.115.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EFAC517C5F;
 Wed, 27 Jan 2021 18:41:48 +0000 (UTC)
Date: Wed, 27 Jan 2021 18:41:46 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v3] machine: add missing doc for memory-backend option
Message-ID: <20210127184146.GA3653144@redhat.com>
References: <20210121161504.1007247-1-imammedo@redhat.com>
 <20210127104511.GF3653144@redhat.com>
 <20210127105436.GG3653144@redhat.com>
 <756c025a-3811-4a36-98a2-3a02bd756523@redhat.com>
 <20210127163522.5a8db09a@redhat.com>
 <20210127175645.GW3653144@redhat.com>
 <2714b6bd-00f5-6232-a602-f12ea2a4ede0@redhat.com>
MIME-Version: 1.0
In-Reply-To: <2714b6bd-00f5-6232-a602-f12ea2a4ede0@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
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
Cc: Igor Mammedov <imammedo@redhat.com>, pkrempa@redhat.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 27, 2021 at 07:30:24PM +0100, Michal Privoznik wrote:
> On 1/27/21 6:56 PM, Daniel P. Berrangé wrote:
> > On Wed, Jan 27, 2021 at 04:35:22PM +0100, Igor Mammedov wrote:
> > > On Wed, 27 Jan 2021 15:24:26 +0100
> > > Michal Privoznik <mprivozn@redhat.com> wrote:
> > > 
> > > > On 1/27/21 11:54 AM, Daniel P. Berrangé wrote:
> > > > > On Wed, Jan 27, 2021 at 10:45:11AM +0000, Daniel P. Berrangé wrote:
> > > > > > On Thu, Jan 21, 2021 at 11:15:04AM -0500, Igor Mammedov wrote:
> > > > 
> > > > 
> > > > > > 
> > > > > > How does a mgmt app know which machine types need to use this
> > > > > > option ? The machine type names are opaque strings, and apps
> > > > > > must not attempt to parse or interpret the version number
> > > > > > inside the machine type name, as they can be changed by
> > > > > > distros.  IOW, saying to use it for machine types 4.0 and
> > > > > > older isn't a valid usage strategy IMHO.
> > > it's possible (but no necessary) to use knob with new machine types
> > > (defaults for these match suggested property value).
> > 
> > IIUC, this means that setting the property has no impact on
> > migration ABI for new machine types > 4.0....
> > 
> > > Limiting knob usage to 4.0 and older would allow us to drop
> > > without extra efforts once 4.0 is deprecated/removed.
> > 
> > ...so, even if we set the property unconditionally for *all*
> > machine types, then we can still remove it in future, becuase
> > its removal won't affect ABI of the 5.x, 6.x machine types.
> 
> Alright, so after all you agree with proposed patch? I'm a bit confused.

+        b) for machine types 4.0 and older, user shall
+        use ``x-use-canonical-path-for-ramblock-id=off`` backend option
+        if migration to/from old QEMU (<5.0) is expected.

instead of refering to machine type versions, I think it
could say something more like


      b) if the ``x-use-canonical-path-for-ramblock-id`` property
         exists, it should be set to ``off``, 
         if migration to/from old QEMU (<5.0) is expected.

Assuming it genuinely does not have any ABI impact on new machine
types.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


