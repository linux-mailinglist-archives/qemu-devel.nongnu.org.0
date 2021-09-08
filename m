Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 324B6404054
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 22:52:53 +0200 (CEST)
Received: from localhost ([::1]:41016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO4Ys-0007LV-AZ
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 16:52:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mO4XB-0006DX-GC
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 16:51:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mO4X6-0004Lr-9i
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 16:51:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631134257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EXLyBu/TxWPMFdRC0rFtNvHccYvWE4nvG0WwVxQ7j5I=;
 b=bxPqsFcu5bTBA0rvBauD8ER0YPR/icDFG6zHtu88oWk84BU0YLyDuwt8o192e8s5CXGKDl
 6wJBH9OuHN3QDXR9SN9xmcnnLK/ocgxBua1VJZ+kwTvwzGnmfqbA8NAkYNVJWlVU1X3osq
 EYsJqHn+I/sSk9mt0wXyhF1VqQq0Vvc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-30EBoF06MTKO5M74776_SQ-1; Wed, 08 Sep 2021 16:50:56 -0400
X-MC-Unique: 30EBoF06MTKO5M74776_SQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2CAE801A92
 for <qemu-devel@nongnu.org>; Wed,  8 Sep 2021 20:50:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89CD25D9C6;
 Wed,  8 Sep 2021 20:50:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D237818003AA; Wed,  8 Sep 2021 22:50:53 +0200 (CEST)
Date: Wed, 8 Sep 2021 22:50:53 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: Compatibility between -device sga and -machine graphics=off
Message-ID: <20210908205053.kn5o57t25qy2qbmo@sirius.home.kraxel.org>
References: <YTjf6BhpPU3aLct9@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YTjf6BhpPU3aLct9@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 08, 2021 at 05:08:08PM +0100, Daniel P. Berrangé wrote:
> Given the libvirt XML snippet
> 
>   <os>
>     ...
>     <bios useserial="yes"/>
>     ...
>   </os>
> 
> libvirt QEMU driver will always format
> 
>   -device sga
> 
> Libguestfs uses this syntax, so we need to make sure it still works
> in future even if 'sga' is disabled or removed in a QEMU build in
> favour of SeaBIOS' built-in support.

Just replacing '-device sga' with '-machine graphics=off' in case sga is
not available should work fine.

serial console support in seabios is available for quite a while
(merged in 2017, seabios 1.11 in rhel-7 has it), so switching over
unconditionally is possibly an option too.  Not sure what the libvirt
backward compatibility policy is though.

>  1. Graphical display only, no serial port, BIOS to graphical display
>  2. Serial port only, no graphics, BIOS to nowhere
>  3. Serial port only, no graphics, BIOS to serial
>  4. Graphical display, serial port, BIOS only to graphical display
>  5. Graphical display, serial port, BIOS to graphical display + serial

Should all work fine.

> If I do 'info mtree' though, I do see a different memory layout
> when changing from SGA to graphics=off

> -    00000000000cb000-00000000000cdfff (prio 1000, ram): alias kvmvapic-rom @pc.ram 00000000000cb000-00000000000cdfff
> +    00000000000ca000-00000000000ccfff (prio 1000, ram): alias kvmvapic-rom @pc.ram 00000000000ca000-00000000000ccfff

probably sgabios.bin is loaded to ca000 when enabled.

> On non-x86 emulators I see graphics=off has semantic effects beyond
> just controlling whether the firmware prints to the serial or not
> though.

It's been a while, but yes, IIRC on ppc this is passed to the linux
kernel somehow (device tree?) so it also affects the default console
device used by linux.

But sgabios is x86-only anyway so that should not be a problem here.

HTH & take care,
  Gerd


