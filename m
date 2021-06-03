Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8192339A3BC
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 16:55:35 +0200 (CEST)
Received: from localhost ([::1]:57084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lookw-0008UD-GD
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 10:55:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1loohY-00035s-7I
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:52:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1loohU-0008ES-Ml
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:52:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622731919;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=sDIGk3iCwcw9+IR4hhV4VAT98bO+4qo3LJ6xMg/7w3s=;
 b=VTYZuKnuiU1Pk+R/vywf4rsTp+Tgr8TLpheJZ8oDGmR01n0APmyapMGDhmjScGpZUc/y2V
 lkq/uKmMlz5OktvDDygY/O6MmjLqvs6Ux2eGcA0HNwFJUrjkajpRFc5JxtB9ck+J6CehYQ
 XK9aaqd4AMuvUpnYmGAI0s7wmEkRVNw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-hBIIsgmLMFqXYUgO93Wp5Q-1; Thu, 03 Jun 2021 10:51:54 -0400
X-MC-Unique: hBIIsgmLMFqXYUgO93Wp5Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04BCE8030A0;
 Thu,  3 Jun 2021 14:51:53 +0000 (UTC)
Received: from redhat.com (ovpn-112-34.ams2.redhat.com [10.36.112.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24EF510016FC;
 Thu,  3 Jun 2021 14:51:47 +0000 (UTC)
Date: Thu, 3 Jun 2021 15:51:45 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Krempa <pkrempa@redhat.com>
Subject: Re: Arbitrary truncating of SCSI disk serial number
Message-ID: <YLjsgasHc3E7uSXZ@redhat.com>
References: <YLjpPbyNlC48ap9e@angien.pipo.sk>
MIME-Version: 1.0
In-Reply-To: <YLjpPbyNlC48ap9e@angien.pipo.sk>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: libvir-list@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 03, 2021 at 04:37:49PM +0200, Peter Krempa wrote:
> Hi,
> 
> recently I've got a report that an upgrade of libvirt (and qemu) caused
> a guest-visible change in the SCSI disk identification when a very long
> serial number is used.
> 
> I've traced it back to the point where libvirt started to use the
> 'device_id=' property of the SCSI disk to pass in the alias of the disk
> when the serial is not configured and the serial if it is.
> 
> https://gitlab.com/libvirt/libvirt/-/commit/a1dce96236f6d35167924fa7e6a70f58f394b23c
> 
> The change is caused by the fact that when serial is configured via the
> 'serial=' property it's being silently truncated.
> 
> Now there are two distinct VPD pages which report the serial number:
> 
> 0x83 - device identification
> 
>  This one used to report only the device alias in the beginning but
>  starting from qemu commit:
> 
>    commit fd9307912d0a2ffa0310f9e20935d96d5af0a1ca
>    Author: Paolo Bonzini <pbonzini@redhat.com>
>    Date:   Fri Mar 16 19:12:43 2012 +0100
> 
>        scsi: copy serial number into VPD page 0x83
> 
>        Currently QEMU passes the qdev device id to the guest in an ASCII-string
>        designator in page 0x83.  While this is fine, it does not match what
>        real hardware does; usually the ASCII-string designator there hosts
>        another copy of the serial number (there can be other designators,
>        for example with a world-wide name).  Do the same for QEMU SCSI
>        disks.
> 
>        ATAPI does not support VPD pages, so it does not matter there.
>        Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> 
>  it reports the serial number instead of the device alias when the
>  serial is configured. Now this historically copied the IDE(?) limit of
>  20 characters.
> 
>  Now with the change to use 'device_id' which overrides the behavior the
>  length of the reported value is limited to the technical limit of 255-8
>  which creates the problem.
> 
>  Libvirt uses 'device_id' because when -blockdev is used the disk alias
>  which was configured via the -drive is no longer configured and thus
>  would be missing.
> 
>  Libvirt also (unfortunately in this case I'd say) started to pass the
>  serial number via this property.
> 
> 0x80 - device serial (optional, only when serial is configured)
> 
>  This one started similarly to the 0x83 page to report the serial
>  truncated to 20, but later in commit:
> 
>    commit 48b6206305b8d56524ac2ee347b68e6e0a528559
>    Author: Rony Weng <ronyweng@synology.com>
>    Date:   Mon Aug 29 15:52:18 2016 +0800
> 
>        scsi-disk: change disk serial length from 20 to 36
> 
>        Openstack Cinder assigns volume a 36 characters uuid as serial.
>        QEMU will shrinks the uuid to 20 characters, which does not match
>        the original uuid.
> 
>        Note that there is no limit to the length of the serial number in
>        the SCSI spec.  20 was copy-pasted from virtio-blk which in turn was
>        copy-pasted from ATA; 36 is even more arbitrary.  However, bumping it
>        up too much might cause issues (e.g. 252 seems to make sense because
>        then the maximum amount of returned data is 256; but who knows there's
>        no off-by-one somewhere for such a nicely rounded number).
> 
>        Signed-off-by: Rony Weng <ronyweng@synology.com>
>        Message-Id: <1472457138-23386-1-git-send-email-ronyweng@synology.com>
>        Cc: qemu-stable@nongnu.org
>        Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> 
>   qemu actually changed the silent truncation to another arbitrary value
>   of 36, which is the length of the UUID.
> 
>   Thus qemu isn't inocent either in these regards.
> 
> Now based on the fact that the above mentioned libvirt commit is
> contained in libvirt-5.1 (and qemu-4.0 adds support for 'device_id')
> reverting to truncation to 20 characters would IMO also be considerable
> as regression, based on the fact that there are users who changed qemu
> to lessen the truncation.
> 
> As of such I don't think libvirt should revert to using the trucated
> serial despite an ABI change.
> 
> On the other hand QEMU should IMO:
> 1) unify the truncation to a single length; preferrably the technical
>   limit
> 2) add possibility to report error when the serial is too long (libvirt
>    can accept a new property for example)
> 
> I'm open to other suggestions though.

Feels like we're essentially doomed in every scenario from an ABI compat
POV.  The best we can do I think is to document in libvirt what the
various limits are. Then say if you provide a value below the limit,
ABI stability is ensured, but if you go above the documented limit,
behaviour is undefined.

I agree that reporting an error in QEMU is more desirable than silently
truncating. This would show the mgmt app that they were supplying a value
that was too large and then could have truncated it themselves. Then when
QEMU later raised the limit, it would not have been an ABI regression.

QEMU could start off with a deprecation warning for over-long serials,
and turn it into a hard error after 2 releases.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


