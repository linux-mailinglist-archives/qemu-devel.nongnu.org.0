Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C4339FAFE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 17:39:07 +0200 (CEST)
Received: from localhost ([::1]:42906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqdon-0006QQ-VE
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 11:39:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lqdnD-0004YT-RS
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 11:37:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lqdnB-0001el-W7
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 11:37:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623166645;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=9xUNpYb17u5/7FvPfkrG0ntJ4bS86J9PIYQRDNEFFVM=;
 b=YDWoZRTWiQ1xOPzGvtlb8e533AixRxbxjo2CHjggvfY2IVdocNVmbqTFFkH+EN9ca/X/0/
 TGZfqEp5DcBtlw9CuZYs6J6BLNXkr1PXuCYO4bfTC1TTGKcG0Lhtn9kc3sXXc6x4cLqEMV
 ez+8kN3qRyW/bF2K4lqH0Hzm7AG+uPM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-2vLV3RIBMkWegw6aGmKVmA-1; Tue, 08 Jun 2021 11:37:20 -0400
X-MC-Unique: 2vLV3RIBMkWegw6aGmKVmA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F09E48042C5;
 Tue,  8 Jun 2021 15:37:15 +0000 (UTC)
Received: from redhat.com (ovpn-115-85.ams2.redhat.com [10.36.115.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 096A560C04;
 Tue,  8 Jun 2021 15:37:13 +0000 (UTC)
Date: Tue, 8 Jun 2021 16:37:11 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: A bug of Monitor Chardev ?
Message-ID: <YL+Op6F7wFoVYum2@redhat.com>
References: <cd197959-7da0-ee50-1e65-e6b2e7107a86@huawei.com>
 <87o8cgxxel.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87o8cgxxel.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: chenjiashang@huawei.com, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, "Longpeng \(Mike,
 Cloud Infrastructure Service Product Dept.\)" <longpeng2@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 08, 2021 at 04:07:30PM +0200, Markus Armbruster wrote:
> "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
> <longpeng2@huawei.com> writes:
> 
> > We find a race during QEMU starting, which would case the QEMU process coredump.
> >
> > <main loop>                             |    <MON iothread>
> >                                         |
> > [1] create MON chardev                  |
> > qemu_create_early_backends              |
> >   chardev_init_func                     |
> >                                         |
> > [2] create MON iothread                 |
> > qemu_create_late_backends               |
> >   mon_init_func                         |
> > 	aio_bh_schedule-----------------------> monitor_qmp_setup_handlers_bh
> > [3] enter main loog                     |    tcp_chr_update_read_handler
> > (* A client come in, e.g. Libvirt *)    |      update_ioc_handlers
> > tcp_chr_new_client                      |
> >   update_ioc_handlers                   |
> >                                         |
> >     [4] create new hup_source           |
> >         s->hup_source = *PTR1*          |
> >           g_source_attach(s->hup_source)|
> >                                         |        [5] remove_hup_source(*PTR1*)
> >                                         |            (create new hup_source)
> >                                         |             s->hup_source = *PTR2*
> >         [6] g_source_attach_unlocked    |
> >               *PTR1* is freed by [5]    |
> > 			
> > Do you have any suggestion to fix this bug ? Thanks!
> 
> Do we?  We talked, but I'm not sure we reached a conclusion.

Seems like we ended up with two options.

  1. A workaround for the current  specific problem by rearranging
     the initilization code in the monitor a little.

  2. A design fix of splitting the chardev creation into two
     parts, one creation, and one activation.

The latter is significantly more work, but is a better long term bet IMHO.
But what we really is someone motivated to actually implement one of the
two options.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


