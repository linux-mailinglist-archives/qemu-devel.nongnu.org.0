Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4833E26F6
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 11:13:16 +0200 (CEST)
Received: from localhost ([::1]:49686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBvul-0000tJ-68
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 05:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mBvtE-00009V-JB
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 05:11:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mBvtB-0000lK-An
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 05:11:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628241095;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=NrNoTdalWo8rocfNTe+cmkgBNQJTXmZf5rnKrYcfuQQ=;
 b=Q5Jv8MoqNN/SlXyEsnRsuUW43IgmBWckWOVjGqnXDFkF0ARjwT9sfiiKjLsMidvGKpKcxC
 yoJHwd3v2sk94pATEih89hhB2kh3AeFjCB3T4viADLMbCDSLboth87A5nZdYs9GlX802xx
 Ss6v65DC2+Ot87vB1790CAs4q++JSLQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-dPnd03wrO2qHDOfcGcPH-Q-1; Fri, 06 Aug 2021 05:11:32 -0400
X-MC-Unique: dPnd03wrO2qHDOfcGcPH-Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11B3B1006C80;
 Fri,  6 Aug 2021 09:11:31 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 59E2419C44;
 Fri,  6 Aug 2021 09:11:27 +0000 (UTC)
Date: Fri, 6 Aug 2021 10:11:24 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: Win32 and ACCEL macro/function
Message-ID: <YQzy/u0KdSHhkiqy@redhat.com>
References: <20210806030024.om77dfa4frxtpw7i@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20210806030024.om77dfa4frxtpw7i@habkost.net>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 05, 2021 at 11:00:24PM -0400, Eduardo Habkost wrote:
> Hello,
> 
> I'm looking for help dealing with a naming conflict when building
> QEMU for Windows hosts.
> 
> The summary is: I'm trying to replace the ACCEL() macro in
> include/qemu/accel.h with an inline function, but the ACCEL name
> conflicts with a symbol provided by winuser.h:
> 
>   In file included from /builds/ehabkost/qemu/include/exec/memory.h:28,
>                    from /builds/ehabkost/qemu/hw/ppc/mac.h:30,
>                    from ../hw/pci-host/uninorth.c:27:
>   /builds/ehabkost/qemu/include/qemu/accel.h:63:45: error: 'ACCEL' redeclared as different kind of symbol
>      63 | OBJECT_DECLARE_TYPE(AccelState, AccelClass, ACCEL)
>         |                                             ^~~~~
>   /builds/ehabkost/qemu/include/qom/object.h:178:5: note: in definition of macro 'DECLARE_INSTANCE_CHECKER'
>     178 |     OBJ_NAME(const void *obj) \
>         |     ^~~~~~~~
>   /builds/ehabkost/qemu/include/qom/object.h:240:5: note: in expansion of macro 'DECLARE_OBJ_CHECKERS'
>     240 |     DECLARE_OBJ_CHECKERS(InstanceType, ClassType, \
>         |     ^~~~~~~~~~~~~~~~~~~~
>   /builds/ehabkost/qemu/include/qemu/accel.h:63:1: note: in expansion of macro 'OBJECT_DECLARE_TYPE'
>      63 | OBJECT_DECLARE_TYPE(AccelState, AccelClass, ACCEL)
>         | ^~~~~~~~~~~~~~~~~~~
>   In file included from /usr/x86_64-w64-mingw32/sys-root/mingw/include/windows.h:72,
>                    from /usr/x86_64-w64-mingw32/sys-root/mingw/include/winsock2.h:23,
>                    from /builds/ehabkost/qemu/include/sysemu/os-win32.h:29,
>                    from /builds/ehabkost/qemu/include/qemu/osdep.h:135,
>                    from ../hw/pci-host/uninorth.c:25:
>   /usr/x86_64-w64-mingw32/sys-root/mingw/include/winuser.h:1757:5: note: previous declaration of 'ACCEL' was here
>    1757 |   } ACCEL,*LPACCEL;
>         |     ^~~~~
>   [338/4278] Compiling C object libqemuutil.a.p/meson-generated_.._trace_trace-scsi.c.obj
>   ninja: build stopped: subcommand failed.
>   make: *** [Makefile:156: run-ninja] Error 1
> 
> (Full log at https://gitlab.com/ehabkost/qemu/-/jobs/1481978645)
> 
> Does anybody more experienced with Win32 have a suggestion on how
> to deal with this?  Do we really need to include winsock2.h /
> windows.h / winuser.h from qemu/osdep.h?

Yep, they're the equivalent of the standard posix headers we would
need on non-Linux.

Windows header files are well known for having many annoyingly common
names used in macros/symbols, so you pretty much just have to rename
whatever is in your app that clashes.

I'd suggest we use  CPUACCEL / CpuAccel  or something like that in
QEMU.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


