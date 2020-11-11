Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C14542AF57F
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 16:53:06 +0100 (CET)
Received: from localhost ([::1]:57244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcsQj-0006Ws-Si
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 10:53:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kcsNN-0003lQ-8t
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 10:49:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kcsNI-0006An-SA
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 10:49:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605109771;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=O6VHqNOjp/yKejJclGuoE4Go0Ycb4Kprr0fExWFIOJQ=;
 b=awJ0hUzdLmmEVbe7MnNmo5DFzFys/ZfG7DtkUCJKmsM7/cSPL7bSaU62PjL3pXIN+/2iyq
 QEgECnq/2Y+ukOJuPtPpCU7SIFODqIwKMEIgf/9j0dRr6dOvw+Iv/AZ+UtPGDfoe9bbKdM
 s5GgQ/Le8f68sWcKIIyWCH6zN0/G72A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-S9cH9oNxO5ir7XAgdwlyWA-1; Wed, 11 Nov 2020 10:49:18 -0500
X-MC-Unique: S9cH9oNxO5ir7XAgdwlyWA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2A06CEC66;
 Wed, 11 Nov 2020 15:49:16 +0000 (UTC)
Received: from redhat.com (ovpn-114-221.ams2.redhat.com [10.36.114.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 623965DA79;
 Wed, 11 Nov 2020 15:48:55 +0000 (UTC)
Date: Wed, 11 Nov 2020 15:48:50 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC v3] VFIO Migration
Message-ID: <20201111154850.GG906488@redhat.com>
References: <20201110095349.GA1082456@stefanha-x1.localdomain>
 <64fb6a41-fbfa-994c-9619-4df41ac97fde@redhat.com>
 <20201111143615.GA1421166@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20201111143615.GA1421166@stefanha-x1.localdomain>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John G Johnson <john.g.johnson@oracle.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, mtsirkin@redhat.com,
 Yan Zhao <yan.y.zhao@intel.com>, quintela@redhat.com,
 Jason Wang <jasowang@redhat.com>, "Zeng, Xin" <xin.zeng@intel.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Felipe Franciosi <felipe@nutanix.com>,
 Christophe de Dinechin <dinechin@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 11, 2020 at 02:36:15PM +0000, Stefan Hajnoczi wrote:
> On Tue, Nov 10, 2020 at 12:12:31PM +0100, Paolo Bonzini wrote:
> > On 10/11/20 10:53, Stefan Hajnoczi wrote:
> > > "allowed_values"
> > >    The list all values that the device implementation accepts for this migration
> > >    parameter. Integer ranges can be described using "<min>-<max>" strings.
> > > 
> > >    Examples: ['a', 'b', 'c'], [1, 5, 7], ['0-255', 512, '1024-2048'], [true]
> > > 
> > >    This member is optional. When absent, any value suitable for the type may be
> > >    given but the device implementation may refuse certain values.
> > 
> > I'd rather make this simpler:
> > 
> > - remove allowed_values for strings.  Effect: discourages using strings as
> > enums, leaving them only for free-form values such as vendor name or model
> > name.
> 
> And introduce an enum type?
> 
> > - remove allowed_values for bools.  If off_value is absent the only allowed
> > value is init_value.  If off_value is present, both true and false are
> > allowed (and !off_value is the "on_value", so to speak).
> 
> Makes sense.
> 
> > - change allowed_values into allowed_min and allowed_max for int values.
> > Advantage: avoids having to parse strings as ranges.  Disadvantage: removes
> > expressiveness (cannot say "x must be a power of two"), but I'm not sure
> > it's worth the extra complication.
> 
> Yes, the current syntax supports sparse ranges and multiple ranges.
> 
> The trade-off is that a tool cannot validate inputs beforehand. You need
> to instantiate the device to see if it accepts your inputs. This is not
> great for management tools because they cannot select a destination
> device if they don't know which exact values are supported.
> 
> Daniel Berrange raised this requirement in a previous revision, so I
> wonder what his thoughts are?

In terms of validation I can't help but feel the whole proposal is
really very complicated.

In validating QEMU migration compatibility we merely compare the
versioned machine type.

IIUC, in this proposal, it would be more like exploding the machine
type into all its 100's of properties and then comparing each one
individually.

I really prefer the simpler model of QEMU versioned machine types
where compatibility is a simple string comparison, hiding the
100's of individual config parameters.  

Of course there are scenarios where this will lead a mgmt app to
refuse a migration, when it could in fact have permitted it.

eg  consider   pc-i440fx-4.0  and pc-i440fx-5.0 machine types,
which only differ in the value  "foo=7" and "foo=8" respectively.

Now if the target only supported machine type pc-i440fx-5.0, then
with a basic string comparison of machine type versin, we can't
migrate from a host uing pc-i440fx-4.0

If we exploded the machine type into its params, we could see that
we can migrate from pc-i440fx-4.0 to pc-i440fx-5.0, simply by
overriding the value of "foo".

So, yes, dealing with individual params is more flexible, but it
comes at an enourmous cost in complexity to process all the
parameters. I'm not convinced this is a good tradeoff. 


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


