Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 181D42DFC6C
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 14:52:03 +0100 (CET)
Received: from localhost ([::1]:33740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krLbW-0004CJ-4G
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 08:52:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1krLYe-0001Lf-TB
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 08:49:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1krLYd-0004n9-5D
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 08:49:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608558542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AQxDwiLeXAPoX8F4RAiKKXojCTLi0PQ1ZCn5Q/QkEKw=;
 b=Ft89IY64pdRdXUAut9oyL3Lu5+0tgVKoKZV51+mJ1W9aHEdiRHG0rEW81EI6ozOOujSmFg
 rKul6kSAXhZUjWqx1eKnLOTs6+wnw7Dwsinakk/c/CjRSIQvBTprpERPnRWHOz6uXNqnLm
 gzLxfV9ELGimQ3o2vjrV6bNLuKGcZTM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-_rbt99P6M32Zr9QUM6FCiA-1; Mon, 21 Dec 2020 08:49:00 -0500
X-MC-Unique: _rbt99P6M32Zr9QUM6FCiA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A48D3180A095;
 Mon, 21 Dec 2020 13:48:59 +0000 (UTC)
Received: from gondolin (ovpn-113-49.ams2.redhat.com [10.36.113.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCDAB60C0F;
 Mon, 21 Dec 2020 13:48:51 +0000 (UTC)
Date: Mon, 21 Dec 2020 14:48:49 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3] tests/acceptance: Add a test with the Fedora 31
 kernel and initrd
Message-ID: <20201221144849.0f4d7aa7.cohuck@redhat.com>
In-Reply-To: <ae5bafc3-b9b0-a07a-7d54-4956bdde345f@redhat.com>
References: <20201221133254.4178703-1-thuth@redhat.com>
 <20201221144450.3e5fce49.cohuck@redhat.com>
 <ae5bafc3-b9b0-a07a-7d54-4956bdde345f@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Willian Rampazzo <willianr@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Dec 2020 14:46:47 +0100
Thomas Huth <thuth@redhat.com> wrote:

> On 21/12/2020 14.44, Cornelia Huck wrote:
> > On Mon, 21 Dec 2020 14:32:54 +0100
> > Thomas Huth <thuth@redhat.com> wrote:
> >   
> >> This initrd contains a virtio-net and a virtio-gpu kernel module,
> >> so we can check that we can set a MAC address for the network device
> >> and whether we can hot-plug and -unplug a virtio-crypto device.
> >> But the most interesting part is maybe that we can also successfully
> >> write some stuff into the emulated framebuffer of the virtio-gpu
> >> device and make sure that we can read back that data from a screenshot.
> >>
> >> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com> 
> >> Signed-off-by: Thomas Huth <thuth@redhat.com>
> >> ---
> >>  v3:
> >>  - Remove unused "import re"
> >>  - Use lscss to test for devnos
> >>  - Improve tmpfile handling (thanks Wainer!)
> >>
> >>  tests/acceptance/machine_s390_ccw_virtio.py | 110 ++++++++++++++++++++
> >>  1 file changed, 110 insertions(+)  
> > 
> > (...)
> >   
> >> +        # Some tests to see whether the CLI options have been considered:
> >> +        self.log.info("Test whether QEMU CLI options have been considered")
> >> +        exec_command_and_wait_for_pattern(self, 'lspci',
> >> +                             '0007:00:00.0 Class 0200: Device 1af4:1000')
> >> +        exec_command_and_wait_for_pattern(self,
> >> +                             'cat /sys/class/net/enP7p0s0/address',
> >> +                             '02:ca:fe:fa:ce:12')
> >> +        exec_command_and_wait_for_pattern(self, 'lscss', '0.1.9876')
> >> +        self.wait_for_console_pattern('0.2.5432')  
> > 
> > This looks a bit odd... maybe do 'lscss -d 0.1.9876' and 'lscss -d
> > 0.2.5432' and wait for the respective devnos to be printed?
> > 
> > (I'm not entirely sure about the wait_for_console_pattern semantics
> > here... can the 0.2.5432 line have been printed already before we start
> > waiting, and would that be a problem? Might be better to play it safe.)  
> 
> Fine for me. Could you fix it up when picking up the patch? Or do you want
> me to send a v4 ?

If you could do it a quick respin, it would be easier for me :)


