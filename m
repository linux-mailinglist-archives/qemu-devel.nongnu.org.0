Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B510A2AEED9
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 11:37:23 +0100 (CET)
Received: from localhost ([::1]:52902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcnVB-000615-TA
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 05:37:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kcnTu-0005Hs-3U
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 05:36:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kcnTr-0007Zx-4g
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 05:36:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605090957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bIQYm9I9yDdKEoF8ArwBIxe6rrm+x7gNtBdyJPnqYzs=;
 b=Mxt6H4ZQDXbi6zJK11o09FZxGnl4dyRl3dnDeQoKEOUKmwRk38DaZIZNCJpf+xFpv+janb
 0ngfS8qX/DT+63EFk/gYl+O2JKCYT+Eh3+yWRtu9XkPiwTw9Yj3i+x3J4+EfkAWRMKnzdB
 1djfI25VJ62LqDuYv0l7Xy3O8H9YgTM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-zUmakG9MNEWcSFlTHvV0KA-1; Wed, 11 Nov 2020 05:35:55 -0500
X-MC-Unique: zUmakG9MNEWcSFlTHvV0KA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C383A809DDB
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 10:35:54 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-124.ams2.redhat.com [10.36.114.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C8945B4A8;
 Wed, 11 Nov 2020 10:35:52 +0000 (UTC)
Date: Wed, 11 Nov 2020 11:35:50 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: Command line QAPIfication and -readconfig
Message-ID: <20201111103550.GB3898@merkur.fritz.box>
References: <20201111092423.GA3898@merkur.fritz.box>
 <20201111101407.GD906488@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201111101407.GD906488@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 11.11.2020 um 11:14 hat Daniel P. Berrangé geschrieben:
> On Wed, Nov 11, 2020 at 10:24:40AM +0100, Kevin Wolf wrote:
> > Hi,
> > 
> > while QAPIfying the chardev configuration, I noticed that dropping
> > QemuOpts completely in vl.c would break -readconfig. So for now I'm
> > stopping at the point where internal interfaces are fully QAPIfied and
> > the QemuOpts interfaces are only a thin wrapper around them.
> > 
> > But do we already have a plan what to do with -readconfig? Should we
> > just deprecate it in 5.2 so we can complete the work in 6.1 and leave
> > vl.c unconverted for now? Or should we rather convert half of vl.c and
> > keep both QAPI and QemuOpts around for the same option for now?
> 
> -readconfig is a little complex because we're not trying to remove the
> ability to use a config file, instead we want to switch to a different
> type of config file.
> 
> IOW, it is about replacement, rather than removal, of functionality.

That's the long term plan, but we can only add that different type of
config file once all options are QAPIfied and QAPIfication has the
problem of having to deal with -readconfig.

> Normally we would not mark something as deprecated unless its replacement
> is ready, because telling people "stop using this but the replacement
> doesn't exist yet" is not a nice message as there is no action users can
> take to deal with the deprecation.

But there is a replacement: Put everything back into the command line
and keep it in a shell script. Config files with -readconfig were never
complete enough to fully describe a VM, so it's not too unlikely that
you'll already have that script anyway.

> We might question whether -readconfig has any users but I would note
> that our own documentation illustrates its usage, and provides several
> example configs
> 
> $ git grep docs -- -readconfig
> config/ich9-ehci-uhci.cfg:# You can pass this file directly to qemu using the -readconfig
> config/mach-virt-graphical.cfg:#     -readconfig mach-virt-graphical.cfg \
> config/mach-virt-serial.cfg:#     -readconfig mach-virt-serial.cfg \
> config/q35-emulated.cfg:#     -readconfig q35-emulated.cfg
> config/q35-virtio-graphical.cfg:#     -readconfig q35-virtio-graphical.cfg
> config/q35-virtio-serial.cfg:#     -readconfig q35-virtio-serial.cfg \
> devel/blkdebug.txt:follows the same .ini-like format used by QEMU's -readconfig option, and
> system/qemu-block-drivers.rst.inc:in a configuration file provided via '-readconfig' or directly on the
> system/qemu-block-drivers.rst.inc:    -readconfig iscsi.conf
> usb2.txt:    qemu -readconfig docs/config/ich9-ehci-uhci.cfg
> 
> 
> IIUC, even with just the internal interface conversion to QAPI we're able
> to introduce our new config file functionality in whatever manner we like.
> 
> Thus removing QemuOpts from vl.c should not be a blocker for other work,
> it is more of a "nice to have" from pov of cleaning up code.
> 
> IOW, I'd suggest we focus effort on introducing the new config file format
> based on QAPI first, and once that exists, then convert these sample
> config files in docs/config, and deprecate -readconfig.

Fine with me. That would make introducing the new config file format a
priority, though, even if it can't support every option yet (similar to
-readconfig). I didn't have the impression so far that we are planning
to do that. Is anyone working on it?

Kevin


