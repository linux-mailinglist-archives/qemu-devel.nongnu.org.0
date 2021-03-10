Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAAF33410E
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 16:04:47 +0100 (CET)
Received: from localhost ([::1]:60428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK0OE-00013r-BF
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 10:04:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1lK0Lw-0008I8-Uu
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 10:02:25 -0500
Received: from hera.aquilenet.fr ([185.233.100.1]:37262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1lK0Ls-00027O-DT
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 10:02:22 -0500
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id DD826361;
 Wed, 10 Mar 2021 16:02:17 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S335BQ3U0uMM; Wed, 10 Mar 2021 16:02:16 +0100 (CET)
Received: from begin.home (unknown
 [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id A7914356;
 Wed, 10 Mar 2021 16:02:10 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.94)
 (envelope-from <samuel.thibault@gnu.org>)
 id 1lK0Lh-00DrsV-7h; Wed, 10 Mar 2021 16:02:09 +0100
Date: Wed, 10 Mar 2021 16:02:09 +0100
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2] usb: Un-deprecate -usbdevice (except for -usbdevice
 audio which gets removed)
Message-ID: <20210310150209.nie5fifqi5od3r5u@begin>
References: <20210309165035.967853-1-thuth@redhat.com>
 <87y2ev2lmr.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y2ev2lmr.fsf@dusky.pond.sub.org>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: DD826361
X-Spamd-Result: default: False [-2.50 / 15.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; RCPT_COUNT_FIVE(0.00)[6];
 HAS_ORG_HEADER(0.00)[]; RCVD_COUNT_THREE(0.00)[3];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MID_RHS_NOT_FQDN(0.50)[]; BAYES_HAM(-3.00)[100.00%]
Received-SPF: softfail client-ip=185.233.100.1;
 envelope-from=samuel.thibault@gnu.org; helo=hera.aquilenet.fr
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster, le mer. 10 mars 2021 14:17:48 +0100, a ecrit:
> Thomas Huth <thuth@redhat.com> writes:
> > When trying to remove the -usbdevice option, there were complaints that
> > "-usbdevice braille" is still a very useful shortcut for some people.
> 
> Pointer?  I missed it.

For instance
https://lists.nongnu.org/archive/html/qemu-devel/2018-01/msg00693.html

> "braille" is the only driver with a factory.  "-usbdevice braille" is
> sugar for
> 
>   -device usb-braille,chardev=braille -chardev braille,id=braille
>   -machine usb=on
> 
> It's buggy:
> 
>     $ qemu-system-x86_64 -S -usbdevice braille
>     qemu-system-x86_64: -usbdevice braille: '-usbdevice' is deprecated, please use '-device usb-...' instead
> [three seconds tick by...]
>     Segmentation fault (core dumped)

I don't have time to keep testing the usbdevice braille option of qemu
from git indeed.

But I do use the option at least weekly/monthly with releases. And some
braille users do depend on it for their daily work.

> It neglects to actually parse PARAMS:
> 
>     $ qemu-system-x86_64 -S -usbdevice braille:"I'm a Little Teapot"
>     qemu-system-x86_64: -usbdevice braille:I'm a Little Teapot: '-usbdevice' is deprecated, please use '-device usb-...' instead

I wasn't aware of the issue, thus not fixed of course.

> The only one that has something approaching a leg to stand on is
> braille.  Still, I fail to see why having to specify a backend is fine
> for any number of other devices, but not for braille.

Because people who use this option have no idea how they would be
supposed to make it work otherwise.

>   -device usb-braille,chardev=braille -chardev braille,id=braille
>   -machine usb=on

This is *way* beyond what people would work out, even if documented. For
them a braille device is just one device, there is no need for notion of
frontend/backend, this is all in just one "device" for them. Put another
way, it does not even make sense to build anything different from what
you wrote: using another chardev backend with usb-braille frontend
doesn't make sense, and exposing the braille chardev backend on another
usb frontend doesn't make sense either.

> If users need more time, we can extend the grace period.

They don't need time, they need things that are simple to use. That
three-option black magic really isn't.

Samuel

