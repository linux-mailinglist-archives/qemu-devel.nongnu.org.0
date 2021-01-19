Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 735492FB516
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 11:02:19 +0100 (CET)
Received: from localhost ([::1]:56476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1nq6-0005Ux-GE
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 05:02:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l1nnm-0004e9-1h
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 04:59:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l1nnk-0001ia-Gs
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 04:59:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611050391;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=uJE0F33cZMQfWxlJld0rtbaTxrpyNj2SkPYOONCRxug=;
 b=WLWZSsCVogvXVWUnJACYGa2/qBbJZXiczI7iQ35vAQBHJmWWyX28I2vOB9af2/nfJN5uaZ
 bV4i+2y5lPfs3V0arFWE7g/IzsTVAgyMFYXhmqS4o3EYUespUXIvE2HgpeG56djWIY6VLK
 aalJeGe12+4zMUDFBFGGJ/gyqp7bJxA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-r1dRp5oVNaOO9PjcuK64uA-1; Tue, 19 Jan 2021 04:59:47 -0500
X-MC-Unique: r1dRp5oVNaOO9PjcuK64uA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EC581842140;
 Tue, 19 Jan 2021 09:59:45 +0000 (UTC)
Received: from redhat.com (ovpn-112-84.ams2.redhat.com [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 80B556A90C;
 Tue, 19 Jan 2021 09:59:30 +0000 (UTC)
Date: Tue, 19 Jan 2021 09:59:27 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Ram Pai <linuxram@us.ibm.com>
Subject: Re: Re: [for-6.0 v5 11/13] spapr: PEF: prevent migration
Message-ID: <20210119095927.GB1830870@redhat.com>
References: <20210104134629.49997b53.pasic@linux.ibm.com>
 <20210104184026.GD4102@ram-ibm-com.ibm.com>
 <20210105115614.7daaadd6.pasic@linux.ibm.com>
 <20210105204125.GE4102@ram-ibm-com.ibm.com>
 <20210111175914.13adfa2e.cohuck@redhat.com>
 <20210111195830.GA23898@ram-ibm-com.ibm.com>
 <20210112091943.095c3b29.cohuck@redhat.com>
 <20210112185511.GB23898@ram-ibm-com.ibm.com>
 <20210113090629.2f41a9d3.cohuck@redhat.com>
 <20210115185514.GB24076@ram-ibm-com.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210115185514.GB24076@ram-ibm-com.ibm.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: pair@us.ibm.com, Cornelia Huck <cohuck@redhat.com>, brijesh.singh@amd.com,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, frankja@linux.ibm.com, david@redhat.com,
 mdroth@linux.vnet.ibm.com, Halil Pasic <pasic@linux.ibm.com>,
 borntraeger@de.ibm.com, David Gibson <david@gibson.dropbear.id.au>,
 thuth@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 dgilbert@redhat.com, qemu-s390x@nongnu.org, rth@twiddle.net,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-ppc@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 15, 2021 at 10:55:14AM -0800, Ram Pai wrote:
> On Wed, Jan 13, 2021 at 09:06:29AM +0100, Cornelia Huck wrote:
> > On Tue, 12 Jan 2021 10:55:11 -0800
> > Ram Pai <linuxram@us.ibm.com> wrote:
> > 
> > > On Tue, Jan 12, 2021 at 09:19:43AM +0100, Cornelia Huck wrote:
> > > Actually the two options are inherently NOT incompatible.  Halil also
> > > mentioned this in one of his replies.
> > > 
> > > Its just that the current implementation is lacking, which will be fixed
> > > in the near future. 
> > > 
> > > We can design it upfront, with the assumption that they both are compatible.
> > > In the short term  disable one; preferrably the secure-object, if both 
> > > options are specified. In the long term, remove the restriction, when
> > > the implemetation is complete.
> > 
> > Can't we simply mark the object as non-migratable now, and then remove
> > that later? I don't see what is so special about it.
> 
> This is fine too. 
> 
> However I am told that libvirt has some assumptions, where it assumes
> that the VM is guaranteed to be migratable if '--only-migratable' is
> specified. Silently turning off that option can be bad.

TO be clear libvirt does *not* currently use --only-migratable.

What you're describing here is QEMU's own definition of this flag

 $ qemu-system-x86_64 | grep migratable
 -only-migratable     allow only migratable devices


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


