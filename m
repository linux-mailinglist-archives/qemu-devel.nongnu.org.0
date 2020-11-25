Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A77EF2C4131
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 14:35:09 +0100 (CET)
Received: from localhost ([::1]:42298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khuwt-0003CA-Bp
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 08:35:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1khuus-0001zV-Uh
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 08:33:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1khuuq-0002yG-3I
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 08:33:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606311177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BMonAe3cabz8+rLp09CIpfOlD+YpM14UG/ZLjHJTNSE=;
 b=CGAUoJEmjy9lZ5hnTF2OjdOK0fHk9PqYZv7sh6KmdHfMzQ/ocItD8ukqlQWfsx64l5LH2W
 A9GhajsGfYVciHUnfbuL9MEC5Y93KLvCl0WCT/igWMhTCQeF9Ewjd8ncA990EANYY613g8
 NUVhToejFMG/jM/qoen+Tfqtl3w3J64=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-WfQ9J5EiMcecuWEG6wceEQ-1; Wed, 25 Nov 2020 08:32:53 -0500
X-MC-Unique: WfQ9J5EiMcecuWEG6wceEQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98335107ACE3;
 Wed, 25 Nov 2020 13:32:52 +0000 (UTC)
Received: from localhost (ovpn-114-98.ams2.redhat.com [10.36.114.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E5A360854;
 Wed, 25 Nov 2020 13:32:52 +0000 (UTC)
Date: Wed, 25 Nov 2020 13:32:51 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Antoine Damhet <antoine.damhet@blade-group.com>
Subject: Re: [DISCUSSION] Allow ACPI default OEM ID and OEM table ID fields
 to be set.
Message-ID: <20201125133251.GI30079@redhat.com>
References: <20201125132711.jqb7znxu5jpoanwi@tartarus>
MIME-Version: 1.0
In-Reply-To: <20201125132711.jqb7znxu5jpoanwi@tartarus>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 25, 2020 at 02:27:11PM +0100, Antoine Damhet wrote:
> Hello,
> 
> We recently found out that some softwares are effectively crashing
> when they detect qemu's `OEM ID` or `OEM table ID` in the ACPI tables.
> 
> I see no reason not to expose the setting to the user/command-line. A
> previous patch has been submitted in 2015[1] but did not get through
> because (if I understand correctly) using the IDs on the `SLIC`, `BXPC`
> and `RSDT` tables were enough at the time.
> 
> If you agree, I am willing to forward port the patches of M. Jones but I
> need to ask how it would work `Signed-Off`-wise ?

On this point, the patch I sent was actually written by
Michael Tokarev, I was only trying to get them upstream.

Rich.

> Thanks in advance for your time,
> 
> PS: the softwares will crash if the signature is found in any of the
>     exposed tables.
> 
> [1]: https://lore.kernel.org/qemu-devel/1441220618-4750-1-git-send-email-rjones@redhat.com/
> 
> -- 
> Antoine 'xdbob' Damhet

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-p2v converts physical machines to virtual machines.  Boot with a
live CD or over the network (PXE) and turn machines into KVM guests.
http://libguestfs.org/virt-v2v


