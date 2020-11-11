Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF212AEE9B
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 11:15:34 +0100 (CET)
Received: from localhost ([::1]:38076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcnA4-0006Uq-Ux
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 05:15:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kcn8x-0005kB-12
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 05:14:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kcn8s-0008NC-A6
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 05:14:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605089655;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=unFRhn51ERtOpbkmcDvxLe3YtOz1g+aXcZBbrVPL8bg=;
 b=JmLxbU5xM2sBRsd5mIyOehfCaB/NX4FjTvLawNd1rBK+qmSdrHbEwgADAsJKuWAmQeAzT9
 Sq0gtdaW5SNbIRTlNSQjARfjUhznIo+t1P6wKA1ZhpQIltflAm5yZi4OiEvxhCP/JIhPOp
 cs4aia7bqe3vEjC8ewfo2ZU1YqP02AY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-DkozGO_sORye4KtfaLoAIA-1; Wed, 11 Nov 2020 05:14:14 -0500
X-MC-Unique: DkozGO_sORye4KtfaLoAIA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E162F10866A7
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 10:14:12 +0000 (UTC)
Received: from redhat.com (ovpn-114-221.ams2.redhat.com [10.36.114.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A4A85C1C4;
 Wed, 11 Nov 2020 10:14:10 +0000 (UTC)
Date: Wed, 11 Nov 2020 10:14:07 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: Command line QAPIfication and -readconfig
Message-ID: <20201111101407.GD906488@redhat.com>
References: <20201111092423.GA3898@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20201111092423.GA3898@merkur.fritz.box>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: pbonzini@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 11, 2020 at 10:24:40AM +0100, Kevin Wolf wrote:
> Hi,
> 
> while QAPIfying the chardev configuration, I noticed that dropping
> QemuOpts completely in vl.c would break -readconfig. So for now I'm
> stopping at the point where internal interfaces are fully QAPIfied and
> the QemuOpts interfaces are only a thin wrapper around them.
> 
> But do we already have a plan what to do with -readconfig? Should we
> just deprecate it in 5.2 so we can complete the work in 6.1 and leave
> vl.c unconverted for now? Or should we rather convert half of vl.c and
> keep both QAPI and QemuOpts around for the same option for now?

-readconfig is a little complex because we're not trying to remove the
ability to use a config file, instead we want to switch to a different
type of config file.

IOW, it is about replacement, rather than removal, of functionality.

Normally we would not mark something as deprecated unless its replacement
is ready, because telling people "stop using this but the replacement
doesn't exist yet" is not a nice message as there is no action users can
take to deal with the deprecation.

We might question whether -readconfig has any users but I would note
that our own documentation illustrates its usage, and provides several
example configs

$ git grep docs -- -readconfig
config/ich9-ehci-uhci.cfg:# You can pass this file directly to qemu using the -readconfig
config/mach-virt-graphical.cfg:#     -readconfig mach-virt-graphical.cfg \
config/mach-virt-serial.cfg:#     -readconfig mach-virt-serial.cfg \
config/q35-emulated.cfg:#     -readconfig q35-emulated.cfg
config/q35-virtio-graphical.cfg:#     -readconfig q35-virtio-graphical.cfg
config/q35-virtio-serial.cfg:#     -readconfig q35-virtio-serial.cfg \
devel/blkdebug.txt:follows the same .ini-like format used by QEMU's -readconfig option, and
system/qemu-block-drivers.rst.inc:in a configuration file provided via '-readconfig' or directly on the
system/qemu-block-drivers.rst.inc:    -readconfig iscsi.conf
usb2.txt:    qemu -readconfig docs/config/ich9-ehci-uhci.cfg


IIUC, even with just the internal interface conversion to QAPI we're able
to introduce our new config file functionality in whatever manner we like.

Thus removing QemuOpts from vl.c should not be a blocker for other work,
it is more of a "nice to have" from pov of cleaning up code.

IOW, I'd suggest we focus effort on introducing the new config file format
based on QAPI first, and once that exists, then convert these sample
config files in docs/config, and deprecate -readconfig.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


