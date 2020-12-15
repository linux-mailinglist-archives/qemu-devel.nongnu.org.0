Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 187422DB291
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 18:29:23 +0100 (CET)
Received: from localhost ([::1]:57806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpE8Y-0000pY-5R
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 12:29:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kpE75-000897-TV
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:27:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kpE73-0005rX-9M
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:27:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608053268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pF7l43fIb8DRyrxQUrh82mGHDHq233zmwheERQRsWK8=;
 b=EDo8YFauqCSICPqbxWAxuCzEV40/Xm1k5uB+kdMegpw9ZexwKySsmiOgLRPdlipAXovgW7
 32OQ0aIxCL8dsEQ+Srp7S+H7BUUS6/KXSLK0ifaqbPu7Bwwr6XiezLf4O9JcIIkjMTawRp
 Ve37ZFuFJ0jqYTDJWfp8wyqxOxWdj5U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-hA76IMW_NOuliiqH_BfENQ-1; Tue, 15 Dec 2020 12:27:44 -0500
X-MC-Unique: hA76IMW_NOuliiqH_BfENQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5A901034B0D;
 Tue, 15 Dec 2020 17:27:29 +0000 (UTC)
Received: from gondolin (ovpn-114-220.ams2.redhat.com [10.36.114.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 17BEE60C0F;
 Tue, 15 Dec 2020 17:27:27 +0000 (UTC)
Date: Tue, 15 Dec 2020 18:27:25 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH 1/1] virtio-blk-ccw: tweak the default for num_queues
Message-ID: <20201215182725.54c475d9.cohuck@redhat.com>
In-Reply-To: <20201215123334.3778358e.pasic@linux.ibm.com>
References: <20201109154831.20779-1-pasic@linux.ibm.com>
 <20201109170616.6875f610.cohuck@redhat.com>
 <20201109195303.459f6fba.pasic@linux.ibm.com>
 <0a6d17ce-ed7f-98e8-2937-f266bb4f0f5a@de.ibm.com>
 <20201110114015.1ba4cdac.pasic@linux.ibm.com>
 <f8c4f54b-3439-1c35-2b2e-c9dae0f5241c@de.ibm.com>
 <20201215092656.1b95e030.cohuck@redhat.com>
 <20201215123334.3778358e.pasic@linux.ibm.com>
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
Cc: Thomas Huth <thuth@redhat.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x@nongnu.org, Michael Mueller <mimu@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Dec 2020 12:33:34 +0100
Halil Pasic <pasic@linux.ibm.com> wrote:

> On Tue, 15 Dec 2020 09:26:56 +0100
> Cornelia Huck <cohuck@redhat.com> wrote:

> > Do we have a better idea now about which values would make sense here?
> >   
> 
> Hi Conny!
> 
> I have nothing new since then. Capping at 4 queues still looks like a
> reasonable compromise to me.  @Mimu: anything new since then?
> 
> If you like I can spin a new version (we need compat handling now).
> 
> Halil
> 

If your tests show that 4 queues are a reasonable value, this is fine
by me (with an explanatory comment in the code.)

Feel free to respin.


