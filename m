Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0CB5ED805
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 10:39:48 +0200 (CEST)
Received: from localhost ([::1]:48800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odSba-0007J8-Dq
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 04:39:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1odR9R-00039W-AS
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:06:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1odR9O-0006oY-BO
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:06:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664348786;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=iuUH6dGzZC0fTiJUlMHanKpqQFKMLL4EIO39d56VULk=;
 b=U2Mwsn8EQzoj7eqoxVCAFg2thNW0Thr6ZaAKmc6vslftvDjahy1vJFKyph4GGqEYi021U5
 pGSRxXdyTDwheuOvp35aehRo8s1YUP6L7fY2KDpRH3SCiXd/yPhNBbkfe9tjLz0+DXVdXC
 OOczffSAdtgo7ScOskAySMoAuj4DIQY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-MjFHZx0IOe--SagPtSGZUA-1; Wed, 28 Sep 2022 03:06:22 -0400
X-MC-Unique: MjFHZx0IOe--SagPtSGZUA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A4FD81172A;
 Wed, 28 Sep 2022 07:06:22 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A27740CA40D;
 Wed, 28 Sep 2022 07:06:21 +0000 (UTC)
Date: Wed, 28 Sep 2022 08:06:18 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 qemu-devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 "Maydell, Peter" <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 "Mammedov, Igor" <imammedo@redhat.com>
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
Message-ID: <YzPyasEmJcKLJNvX@redhat.com>
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220710170014.1673480-8-ani@anisinha.ca>
 <CABgObfYW8O-JGhjLm47HmHG7WRhOQDO1EhUCTP59TZo4DnkQVg@mail.gmail.com>
 <20220927175440-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220927175440-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 27, 2022 at 06:09:22PM -0400, Michael S. Tsirkin wrote:
> On Tue, Sep 27, 2022 at 11:44:56PM +0200, Paolo Bonzini wrote:
> > I also second the idea of using avocado instead of pytest, by the way.

snip

> Problem is I don't think avocado is yet at the level where I can
> ask random developers to use it to check their ACPI patches.
> 
> I just went ahead and rechecked and the situation isn't much better
> yet. I think the focus of avocado is system testing of full guests with
> KVM, not unit testing of ACPI.
> 
> Let's start with installation on a clean box:

...snip...

Do not do any of this stuff, it is irrelevant to QEMU's needs.
A developer using Avocado with QEMU does nothing more than:

    make check-avocado

The avocado framework itself is setup in a virtual env on first
run by the makefile. Thus the developers don't need to install
nor interact with avocado at all, merely write a test script
and put it in tests/avocado/ in QEMU git.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


