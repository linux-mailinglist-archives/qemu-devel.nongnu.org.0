Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 030D740188B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 11:02:33 +0200 (CEST)
Received: from localhost ([::1]:54858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNAWN-0008A3-17
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 05:02:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mNATh-0006t3-IR
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 04:59:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mNATc-0001FO-Si
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 04:59:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630918778;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=a3EFf1422wPC0oLRbj140g6TKZM1qfUqg70QCFEyYi8=;
 b=FecwTjbGs63uaTHSF87M4yn2LYOjIh7kt4WOizJBxO74Kvm77xW4xJsCC5G3h+KQe7zSdW
 mCLUTEbIbxn4xj4cqmYzc4pU6uao0AGLRhN01fLOHK5meXM+L4GsI2lz09gi0DMtUcGjDM
 7NU+UxJ61OEPoI+iuJ3NKMHo6RZa3SM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-_LLxoeYGNeaEKKwTSfebbw-1; Mon, 06 Sep 2021 04:59:33 -0400
X-MC-Unique: _LLxoeYGNeaEKKwTSfebbw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C4F9835DE3;
 Mon,  6 Sep 2021 08:59:32 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.238])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BBC11001281;
 Mon,  6 Sep 2021 08:59:30 +0000 (UTC)
Date: Mon, 6 Sep 2021 09:59:27 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alexander von Gluck IV <kallisti5@unixzen.com>
Subject: Re: virtio "transitional devices"?
Message-ID: <YTXYb3teRZa+2nUs@redhat.com>
References: <16fad6ffd7af05706571453114a8c173@unixzen.com>
MIME-Version: 1.0
In-Reply-To: <16fad6ffd7af05706571453114a8c173@unixzen.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Sep 05, 2021 at 01:47:48PM +0000, Alexander von Gluck IV wrote:
> Could someone explain to me what virtio "transitional devices" are?
> 
> https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.html#x1-1020002
> 
> Are "Transitional devices" pre-1.0 specification?

virtio devices can be exposed in upto three ways

 - Legacy - follows virtio 0.9 specification. always uses PCI
            ID range 0x1000-0x103F
 - Transitional - follows virtio 0.9 specification by default, but
                  can auto-negotiate with guest for 1.0 spce. Always
		  uses PCI ID range 0x1000-0x103F
 - Modern - follows virtio 1.0 specification. always uses PCI
            ID range 0x1040-0x107F

With QEMU, historically devices placed on a PCI bus will always default
to being in transitional mode, while devices placed on a PCI-E bus will
always dfault to being in modern mode.

The params disable_legacy=on|off and disable_modern=on|off can be used
to fine tune things. 

> Haiku's virtio driver (PCI) is looking for PCIID Devices 0x1000-0x103F

Makes sense if you're expecting legacy or transitional devices, only
in 0.9 spec mode. 

> I've noticed qemu-6.1.0 has begun to offer PCI DeviceID  0x1040-0x107F to
> the operating system breaking our virtio drivers.
> 
> Expanding our search range to 0x1040+ seems to solve the issues and gives
> us a working virtio driver, but I feel like we should be checking for
> other differences.

Only use 0x1040-0x107F range if you support virtio 1.0.

> Has something changed in recent qemu's around virtio?  I don't see anything
> documented in the release notes.

There shouldn't be changes in this regard afaik. Are you confident that
you have had no changes in the QEMU command line you are testing with
since previous working versions of QEMU were tested ?


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


