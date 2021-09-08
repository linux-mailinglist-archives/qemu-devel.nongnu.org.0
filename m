Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A52403D62
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 18:11:19 +0200 (CEST)
Received: from localhost ([::1]:36988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO0AQ-0003Vl-88
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 12:11:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mO07h-00005Y-P2
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 12:08:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mO07e-0004UW-8v
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 12:08:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631117304;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type; bh=NZ0CujZS15jFoGgFAZTeU5wxeIqmhKCbQqBQ7kub5Io=;
 b=J+izkrxqYHTC0ly4OGQn9I+iHf9LPLAol9jkb5AbL2GoqrDhO7PL5jxJlSzMqq5Fm4dent
 KWpcJzMaAsQ3xKtL5wu2G2iisxYqnmpgZww5BIXp6mUQu8o0fUCVPhHLatEXmTDbZjOQEx
 vSpnc8RtpvMBZJcsBsXs1QT9xjOBsG4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14--2UxTdeFPZW2p_hdyfC2WQ-1; Wed, 08 Sep 2021 12:08:17 -0400
X-MC-Unique: -2UxTdeFPZW2p_hdyfC2WQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6ABAC801A92
 for <qemu-devel@nongnu.org>; Wed,  8 Sep 2021 16:08:16 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.206])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 13DD660657;
 Wed,  8 Sep 2021 16:08:10 +0000 (UTC)
Date: Wed, 8 Sep 2021 17:08:08 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: Compatibility between -device sga and -machine graphics=off
Message-ID: <YTjf6BhpPU3aLct9@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Given the libvirt XML snippet

  <os>
    ...
    <bios useserial="yes"/>
    ...
  </os>

libvirt QEMU driver will always format

  -device sga

Libguestfs uses this syntax, so we need to make sure it still works
in future even if 'sga' is disabled or removed in a QEMU build in
favour of SeaBIOS' built-in support.


There are the following combinations that matter

 1. Graphical display only, no serial port, BIOS to graphical display

     <video>
       <model type='vga'/>
     </video>

   QEMU cli

     -device VGA


 2. Serial port only, no graphics, BIOS to nowhere

     <serial type='pty'/>

   QEMU cli

     -serial pty


 3. Serial port only, no graphics, BIOS to serial

     <os>
       <bios useserial='yes'/>
     </os>
     <serial type='pty'/>

   QEMU cli

     -serial pty -device sga
     -serial pty -M graphics=off


 4. Graphical display, serial port, BIOS only to graphical display

     <video>
       <model type='vga'/>
     </video>
     <serial type='pty'/>

   QEMU cli

     -device VGA -serial pty


 5. Graphical display, serial port, BIOS to graphical display + serial

     <os>
       <bios useserial='yes'/>
     </os>
     <video>
       <model type='vga'/>
     </video>
     <serial type='pty'/>

   QEMU cli

     -device VGA -serial pty -device sga
     -device VGA -serial pty -M graphics=off



The cases 3 and 5 appear to have the same effect on output with x86
for SGA and graphics=off, which is good.

If I do 'info mtree' though, I do see a different memory layout
when changing from SGA to graphics=off


@@ -18,7 +18,7 @@
     00000000000c0000-00000000000c3fff (prio 1, ram): alias pam-rom @pc.ram 00000000000c0000-00000000000c3fff
     00000000000c4000-00000000000c7fff (prio 1, ram): alias pam-rom @pc.ram 00000000000c4000-00000000000c7fff
     00000000000c8000-00000000000cbfff (prio 1, ram): alias pam-rom @pc.ram 00000000000c8000-00000000000cbfff
-    00000000000cb000-00000000000cdfff (prio 1000, ram): alias kvmvapic-rom @pc.ram 00000000000cb000-00000000000cdfff
+    00000000000ca000-00000000000ccfff (prio 1000, ram): alias kvmvapic-rom @pc.ram 00000000000ca000-00000000000ccfff
     00000000000cc000-00000000000cffff (prio 1, ram): alias pam-rom @pc.ram 00000000000cc000-00000000000cffff
     00000000000d0000-00000000000d3fff (prio 1, ram): alias pam-rom @pc.ram 00000000000d0000-00000000000d3fff
     00000000000d4000-00000000000d7fff (prio 1, ram): alias pam-rom @pc.ram 00000000000d4000-00000000000d7fff
@@ -109,7 +109,7 @@
     00000000000c0000-00000000000c3fff (prio 1, ram): alias pam-rom @pc.ram 00000000000c0000-00000000000c3fff
     00000000000c4000-00000000000c7fff (prio 1, ram): alias pam-rom @pc.ram 00000000000c4000-00000000000c7fff
     00000000000c8000-00000000000cbfff (prio 1, ram): alias pam-rom @pc.ram 00000000000c8000-00000000000cbfff
-    00000000000cb000-00000000000cdfff (prio 1000, ram): alias kvmvapic-rom @pc.ram 00000000000cb000-00000000000cdfff
+    00000000000ca000-00000000000ccfff (prio 1000, ram): alias kvmvapic-rom @pc.ram 00000000000ca000-00000000000ccfff
     00000000000cc000-00000000000cffff (prio 1, ram): alias pam-rom @pc.ram 00000000000cc000-00000000000cffff
     00000000000d0000-00000000000d3fff (prio 1, ram): alias pam-rom @pc.ram 00000000000d0000-00000000000d3fff
     00000000000d4000-00000000000d7fff (prio 1, ram): alias pam-rom @pc.ram 00000000000d4000-00000000000d7fff
@@ -185,7 +185,7 @@
     00000000000c0000-00000000000c3fff (prio 1, ram): alias pam-rom @pc.ram 00000000000c0000-00000000000c3fff
     00000000000c4000-00000000000c7fff (prio 1, ram): alias pam-rom @pc.ram 00000000000c4000-00000000000c7fff
     00000000000c8000-00000000000cbfff (prio 1, ram): alias pam-rom @pc.ram 00000000000c8000-00000000000cbfff
-    00000000000cb000-00000000000cdfff (prio 1000, ram): alias kvmvapic-rom @pc.ram 00000000000cb000-00000000000cdfff
+    00000000000ca000-00000000000ccfff (prio 1000, ram): alias kvmvapic-rom @pc.ram 00000000000ca000-00000000000ccfff
     00000000000cc000-00000000000cffff (prio 1, ram): alias pam-rom @pc.ram 00000000000cc000-00000000000cffff
     00000000000d0000-00000000000d3fff (prio 1, ram): alias pam-rom @pc.ram 00000000000d0000-00000000000d3fff
     00000000000d4000-00000000000d7fff (prio 1, ram): alias pam-rom @pc.ram 00000000000d4000-00000000000d7fff


Despite this difference, I was able migrate from a x86 guest using SGA
to a guest using graphics=off without errors being reported. So it
doesn't seem to change the migration data sections sent on the wire
at least.

With this in mind, is the different memory layout harmless from the
POV of migration, or is it none the less going to cause subtle
problems for the guest at some point in future ?


On non-x86 emulators I see graphics=off has semantic effects beyond
just controlling whether the firmware prints to the serial or not
though. IOW it is overloaded to do multiple jobs, while -device sga
only did one specific job. This makes graphics=off somewhat undesirable
to use.  We're possibly lucky in this specific case though, because
the 'sgabios.bin' ROM is x86 asm code, so was never valid to use in
the non-x86 case.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


