Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 323A933C03E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 16:45:23 +0100 (CET)
Received: from localhost ([::1]:60444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLpPG-0008QP-2J
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 11:45:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lLpN1-0006xr-Fo
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 11:43:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lLpMz-0007O7-41
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 11:43:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615822978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=22UBB0cjGk0cJOQ2+iJkJn8fjA7jPdyqddIJWQE2dsY=;
 b=WOgMsaBBVXKABOL4sMsWsI59O8OrscCB+t8yO1HMQxsdAl9lu0Eoa2OQYB9ZnDTAucHf5z
 w/t7TG4I73Fl5RPcF8DePCmsvGr36iXeIMJ1HMkTfeUxGyjANW4xsctpiA6sA+IZtwv+tm
 jFR2Wfw8HYV8wtpuEpntF2FaXNvNl9U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-F503cGrkMca9Df_JZkJNQg-1; Mon, 15 Mar 2021 11:42:55 -0400
X-MC-Unique: F503cGrkMca9Df_JZkJNQg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E8641015C85;
 Mon, 15 Mar 2021 15:42:54 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-72.ams2.redhat.com [10.36.112.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B380C5D745;
 Mon, 15 Mar 2021 15:42:53 +0000 (UTC)
Subject: Re: compile warning in i8259.c
To: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org,
 qemu-s390x <qemu-s390x@nongnu.org>
References: <cc283705-a0ee-5ee4-4f9a-b69afce65d8c@de.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <75aed565-c9a6-6ee1-ab92-d2771df83ff0@redhat.com>
Date: Mon, 15 Mar 2021 16:42:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <cc283705-a0ee-5ee4-4f9a-b69afce65d8c@de.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/03/2021 16.14, Christian Borntraeger wrote:
> For some time now I do see the following, when I compile x86-softmmu on s390:
> 
> FAILED: libcommon.fa.p/hw_intc_i8259.c.o
> cc -Ilibcommon.fa.p -I. -I.. -Iqapi -Itrace -Iui -Iui/shader 
> -I/usr/include/capstone -I/usr/include/glib-2.0 
> -I/usr/lib64/glib-2.0/include -I/usr/include/libmount -I/usr/include/blkid 
> -I/usr/include/gio-unix-2.0 -I/usr/include/libusb-1.0 
> -I/usr/include/vte-2.91 -I/usr/include/pango-1.0 -I/usr/include/harfbuzz 
> -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/fribidi 
> -I/usr/include/libxml2 -I/usr/include/cairo -I/usr/include/pixman-1 
> -I/usr/include/gtk-3.0 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/atk-1.0 
> -I/usr/include/at-spi2-atk/2.0 -I/usr/include/dbus-1.0 
> -I/usr/lib64/dbus-1.0/include -I/usr/include/at-spi-2.0 -I/usr/include/virgl 
> -I/usr/include/p11-kit-1 -I/usr/include/SDL2 -I/usr/include/cacard 
> -I/usr/include/nss3 -I/usr/include/nspr4 -I/usr/include/slirp 
> -fdiagnostics-color=auto -pipe -Wall -Winvalid-pch -Werror -std=gnu99 -O2 -g 
> -isystem /home/cborntra/REPOS/qemu/linux-headers -isystem linux-headers 
> -iquote . -iquote /home/cborntra/REPOS/qemu -iquote 
> /home/cborntra/REPOS/qemu/include -iquote 
> /home/cborntra/REPOS/qemu/disas/libvixl -iquote 
> /home/cborntra/REPOS/qemu/tcg/s390 -iquote 
> /home/cborntra/REPOS/qemu/accel/tcg -pthread -U_FORTIFY_SOURCE 
> -D_FORTIFY_SOURCE=2 -m64 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 
> -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef 
> -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common 
> -fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits 
> -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body 
> -Wnested-externs -Wendif-labels -Wexpansion-to-defined 
> -Wimplicit-fallthrough=2 -Wno-missing-include-dirs -Wno-shift-negative-value 
> -Wno-psabi -fstack-protector-strong -fPIC -DSTRUCT_IOVEC_DEFINED 
> -D_REENTRANT -Wno-undef -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600 
> -DNCURSES_WIDECHAR -MD -MQ libcommon.fa.p/hw_intc_i8259.c.o -MF 
> libcommon.fa.p/hw_intc_i8259.c.o.d -o libcommon.fa.p/hw_intc_i8259.c.o -c 
> ../hw/intc/i8259.c
> ../hw/intc/i8259.c: In function ‘pic_read_irq’:
> ../hw/intc/i8259.c:203:13: error: ‘irq2’ may be used uninitialized in this 
> function [-Werror=maybe-uninitialized]
>    203 |         irq = irq2 + 8;
>        |         ~~~~^~~~~~~~~~
> cc1: all warnings being treated as errors
> 
> Due to other compile warnings I find this hard to bisect. Has anyone seen 
> this as well?

I've never seen this warnings so far... which compiler version is this? 
Looking at the code, it seems to be a false positive to me.

  Thomas


