Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 145883C72B4
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 16:58:42 +0200 (CEST)
Received: from localhost ([::1]:45404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Jrt-0002wH-5F
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 10:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3Joh-0000vS-5d
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 10:55:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3Joe-0006me-UL
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 10:55:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626188120;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=J11EyKby7Wj7RS3GYg+uVRIkByDEL7o8GEZJ94km0oE=;
 b=Rkf4Ef8Br742oHiYEEYyNShgawn8pVi/CRN6kqhlSHiUpwO4XUIN4z0CzqoCn3kAt7jv1V
 R7JIQlcFELqWHJohn7yVcoDq26sgP8ElRcP9eFup4qGf0FpKAZ40YzP9oQqO/zgtST6q4Z
 2cX2b4DeeCq2EJI4Fv3M8AOxhoiIYSk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-XiybKUeFMcGGjJuNt9r0RQ-1; Tue, 13 Jul 2021 10:55:14 -0400
X-MC-Unique: XiybKUeFMcGGjJuNt9r0RQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 955D384F20A;
 Tue, 13 Jul 2021 14:55:13 +0000 (UTC)
Received: from redhat.com (ovpn-113-1.ams2.redhat.com [10.36.113.1])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 95573710C5;
 Tue, 13 Jul 2021 14:54:57 +0000 (UTC)
Date: Tue, 13 Jul 2021 15:54:54 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Programmingkid <programmingkidx@gmail.com>
Subject: Re: usb-host device not working
Message-ID: <YO2pPp1awcCXVZUZ@redhat.com>
References: <7E422E91-63A4-4D36-B5FF-7FD2181FB845@gmail.com>
MIME-Version: 1.0
In-Reply-To: <7E422E91-63A4-4D36-B5FF-7FD2181FB845@gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Howard Spoelstra <hsp.cat7@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, QEMU devel list <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 13, 2021 at 10:49:12AM -0400, Programmingkid wrote:
> I have been having problems with using host USB devices lately. I use to be able to use host USB devices but can't currently. After doing some git bisecting I found it was this patch that causes this issue:
> 
> commit 627302afb2f85cdd4b59595361876487aef19b7a (refs/bisect/bad)
> Author: Gerd Hoffmann <kraxel@redhat.com>
> Date:   Thu Jun 24 12:38:35 2021 +0200
> 
>     usb: build usb-host as module
>     
>     Drop one more shared library dependency (libusb) from core qemu.
>     
>     Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>     Reviewed-by: Jose R. Ziviani <jziviani@suse.de>
>     Message-Id: <20210624103836.2382472-34-kraxel@redhat.com>
>     Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> I build QEMU like this:
> 
> ./configure --target-list=i386-softmmu --enable-libusb && make -j 9
> 
> This command use to work but fails now with the above commit:
> 
> qemu-system-i386 -usb -device usb-host,vendorid=0x093a,productid=0x2510
> 
> I think this is a bug with the commit. Any suggestions?

It'll be helpful to explain what kind of failure you observe, including
any exact error messages seen ? 


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


