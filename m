Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 303192F5E13
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 10:53:40 +0100 (CET)
Received: from localhost ([::1]:59066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzzJz-0006sk-93
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 04:53:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1kzzIA-0005CG-6B
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 04:51:46 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:43675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1kzzI7-0002zv-7D
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 04:51:45 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.94) with esmtps (TLS1.2)
 tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1kzzI0-000KNB-8L; Thu, 14 Jan 2021 10:51:35 +0100
Received: from ipservice-092-214-205-060.092.214.pools.vodafone-ip.de
 ([92.214.205.60] helo=[192.168.178.45])
 by inpost2.zedat.fu-berlin.de (Exim 4.94) with esmtpsa (TLS1.2)
 tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1kzzHz-0028Pa-FM; Thu, 14 Jan 2021 10:51:35 +0100
Subject: Re: [PATCH 1/8] build-system: clean up TCG/TCI configury
To: Helge Deller <deller@gmx.de>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20210107140039.467969-1-pbonzini@redhat.com>
 <20210107140039.467969-2-pbonzini@redhat.com>
 <CAFEAcA9yyUUmd+hj6kgAV8KWtCC41Q55JRfE0q1zTaDaOofgOQ@mail.gmail.com>
 <a5cd4c43-2f12-2dbf-8db7-21acc7abc73d@redhat.com>
 <20210107160653.GD1029501@redhat.com>
 <d1b5a493-0658-3bba-b1b4-0116f337031d@amsat.org>
 <46e79fb0-2ce1-35a8-3ce8-44699508a1d1@gmx.de>
 <20210113135705.GC1568240@redhat.com>
 <4d81fdad-6b76-d7b7-ba44-e3d7cf545dba@gmx.de>
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Message-ID: <16bba859-c7a2-1121-6819-9e2be08d5691@physik.fu-berlin.de>
Date: Thu, 14 Jan 2021 10:51:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <4d81fdad-6b76-d7b7-ba44-e3d7cf545dba@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 92.214.205.60
Received-SPF: pass client-ip=130.133.4.66;
 envelope-from=glaubitz@zedat.fu-berlin.de; helo=outpost1.zedat.fu-berlin.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, debian-superh@lists.debian.org,
 Stefan Hajnoczi <stefanha@redhat.com>, debian-hppa@lists.debian.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello!

On 1/13/21 3:23 PM, Helge Deller wrote:
>> This is what that TCG interpreter provides for. eg would anyone
>> really want to emulate aarch64 guest when runing on a hppa host ?
>
> In debian many packages directly and indirectly depend on the qemu
> source package, because it provides - beside the emulator - various
> userspace tools which are necessary natively, like e.g. qemu-img.

I agree, that this a problem and it would be great if QEMU could be fixed
that it builds on all targets, not necessarily with all features available.

Currently, it looks like this:

> https://buildd.debian.org/status/package.php?p=qemu&suite=sid

Note: The build failure on sparc64 is a bug in the device-tree-compiler
package which has not been fixed in Debian yet, see:

> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=977031

> In the past building those tools failed on hppa because the configure script
> detected that neither native TCG nor TCG interpreter support was possible.
> As such the configuration aborted and no tools were built.
> So, the change should still make it possible to enable building the userspace
> tools.

I agree.

> On the other side, sometimes even a slow TCG-interpreter enabled qemu
> for other arches can be useful. It's not about speed, but about the
> *possibility* to emulate small pieces of different code, e.g.
> cross-compilers, bios-tools and such. It's not used often, but it
> can be handy.

I also agree here.

> That said, if it doesn't hurt I think we should not disable something
> which can be useful (this applies to all architectures).

True.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913


