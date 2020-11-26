Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5EE2C5430
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 13:49:04 +0100 (CET)
Received: from localhost ([::1]:35330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiGhq-0006zv-Il
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 07:49:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kiGdl-0005kU-QT
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 07:44:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kiGda-0005cy-8U
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 07:44:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606394677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EvaiV8RD9IDUo+VD6Fao/spsaL5la1D+NNnzZk2WDH8=;
 b=X9rE69tdL9ZSmV/hVPZDiZgL2AVXHXFFdG02Rld0IYfAZAKZDLRPnO+cExVmWGwZ3NjWvm
 hiUZzqJb1J6+BALUbNMg26S2oB79hzMm/5Bo8zooBUWVUaiPWN2W5odbERjv9wihkW+p6a
 qh7fW1Tr1hMTiNZsu2+HLUL/vW1lN9w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-OfjMGV0vOkGYtf7Ktg36sQ-1; Thu, 26 Nov 2020 07:44:33 -0500
X-MC-Unique: OfjMGV0vOkGYtf7Ktg36sQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A749D805BFB;
 Thu, 26 Nov 2020 12:44:32 +0000 (UTC)
Received: from gondolin (ovpn-113-125.ams2.redhat.com [10.36.113.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A633C5C1BD;
 Thu, 26 Nov 2020 12:44:27 +0000 (UTC)
Date: Thu, 26 Nov 2020 13:44:25 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH RFC] tests/acceptance: add a test for devices on s390x
Message-ID: <20201126134425.494ea4f2.cohuck@redhat.com>
In-Reply-To: <33974f91-5fe5-7c80-69b4-4e087a6fc150@redhat.com>
References: <20201125135820.1442611-1-cohuck@redhat.com>
 <148a7ef1-aae2-89ae-88f7-3c70c9f02999@redhat.com>
 <20201125163034.5a935baa.cohuck@redhat.com>
 <20201126130519.4e178309.cohuck@redhat.com>
 <33974f91-5fe5-7c80-69b4-4e087a6fc150@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-s390x@nongnu.org,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Nov 2020 13:18:38 +0100
Thomas Huth <thuth@redhat.com> wrote:

> On 26/11/2020 13.05, Cornelia Huck wrote:
> > On Wed, 25 Nov 2020 16:30:34 +0100
> > Cornelia Huck <cohuck@redhat.com> wrote:
> >   
> >> On Wed, 25 Nov 2020 16:03:13 +0100
> >> Thomas Huth <thuth@redhat.com> wrote:
> >>  
> >>> On 25/11/2020 14.58, Cornelia Huck wrote:    
> >   
> >>>> +    def test(self):
> >>>> +
> >>>> +        """
> >>>> +        :avocado: tags=arch:s390x
> >>>> +        :avocado: tags=machine:s390-ccw-virtio
> >>>> +        """
> >>>> +
> >>>> +        # XXX: switch to https when debian fixes their certificate
> >>>> +        kernel_url = ('http://archive.debian.org/debian/dists/jessie/main'
> >>>> +                      '/installer-s390x/current/images/generic/kernel.debian')
> >>>> +        kernel_hash = '5af1aa839754f4d8817fb5878b4d55dfc887f45d'
> >>>> +        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
> >>>> +
> >>>> +        initrd_url = ('http://archive.debian.org/debian/dists/jessie/main'
> >>>> +                      '/installer-s390x/current/images/generic/initrd.debian')
> >>>> +        initrd_hash = '99252b28306184b876f979585e2d4bfe96b27464'
> >>>> +        initrd_path = self.fetch_asset(initrd_url, asset_hash=initrd_hash)
> >>>> +
> >>>> +        self.vm.set_console()
> >>>> +        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
> >>>> +                              'console=sclp0 root=/dev/ram0 BOOT_DEBUG=3')
> >>>> +        self.vm.add_args('-nographic',
> >>>> +                         '-kernel', kernel_path,
> >>>> +                         '-initrd', initrd_path,
> >>>> +                         '-append', kernel_command_line,
> >>>> +                         '-device', 'virtio-net-ccw,devno=fe.1.1111',
> >>>> +                         '-device', 'virtio-net-pci')      
> >>>
> >>> Maybe use '-device', 'virtio-net-pci,addr=6' or something similar to check a
> >>> non-default PCI address, too?    
> >>
> >> Not sure if addr= will do the trick, I may need to add a zpci device.  
> > 
> > It seems I need both a zpci device (to specify the uid) and a newer
> > kernel (so that the uid is actually used to construct the address in
> > the guest). I guess I should use snapshots.debian.org to get a stable
> > link to a newer version?  
> 
> Not sure ... I assume the links to archive.debian.org are less likely to
> change? So maybe simply forget about testing a different PCI address for
> now, the default should be good enough for a simple check.

I'd expect the snapshot.debian.org links to be stable as well (we
already use them in some places). The problem is that what is currently
available at archive.debian.org is really quite ancient (3.16 based is
the newest...). If we want to test something that at least resembles
real life usage, we should use at least use a 4.x kernel. The kernels
that do something with the uid will also end up using different default
pci addresses if no uid is provided, so the 0000:00:00.0 seems quite
unrealistic to come up nowadays.

> 
>  Thomas
> 
> PS: Seems like at least "ip addr" is working there already - so you could at
> least check the MAC address setting?

I'd prefer to do this in an add-on patch :)


