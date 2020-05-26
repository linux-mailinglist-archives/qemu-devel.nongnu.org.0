Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E55211A15AF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Apr 2020 21:19:11 +0200 (CEST)
Received: from localhost ([::1]:52298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLtkc-0007iZ-Ur
	for lists+qemu-devel@lfdr.de; Tue, 07 Apr 2020 15:19:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47189)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vr_qemu@t-online.de>) id 1jLtjD-0006Uv-Io
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 15:17:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vr_qemu@t-online.de>) id 1jLtjB-0006KF-P8
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 15:17:43 -0400
Received: from mailout08.t-online.de ([194.25.134.20]:45178)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vr_qemu@t-online.de>) id 1jLtjB-0006JP-IA
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 15:17:41 -0400
Received: from fwd17.aul.t-online.de (fwd17.aul.t-online.de [172.20.27.64])
 by mailout08.t-online.de (Postfix) with SMTP id 9E4F041E0A0F;
 Tue,  7 Apr 2020 21:17:38 +0200 (CEST)
Received: from [192.168.211.200]
 (SaX2QYZvrheaL3ElGoDwhrU97mUSblV97kslVR4zMXvmb5I6bNEoCE-N0ziQSyfQI9@[46.86.48.198])
 by fwd17.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1jLtj8-1XdAXY0; Tue, 7 Apr 2020 21:17:38 +0200
Subject: Re: [Bug 1871250] Failed to create HAX VM
To: Bug 1871250 <1871250@bugs.launchpad.net>,
 Russell Morris <ubuntu@rkmorris.us>
References: <158621521246.22866.8297146941622716788.malonedeb@wampee.canonical.com>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Message-ID: <0cf58bb6-c3f0-45d7-d37f-561dddf5f457@t-online.de>
Date: Tue, 7 Apr 2020 21:17:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <158621521246.22866.8297146941622716788.malonedeb@wampee.canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ID: SaX2QYZvrheaL3ElGoDwhrU97mUSblV97kslVR4zMXvmb5I6bNEoCE-N0ziQSyfQI9
X-TOI-MSGID: ab5cd388-a963-419d-a7c7-6c5e20b95add
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 194.25.134.20
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Hi,
>
> I'm running the latest (master) of QEMU, though the version doesn't seem
> to matter - I also checked back to v4.2.0, exactly the same issue. And
> this isn't about the VM (guest), if I even just try to run,
>
>> "c:\Program Files\qemu\qemu-system-x86_64.exe" -accel hax

Hi Russell,

at the moment you need this patch at
https://lists.nongnu.org/archive/html/qemu-devel/2020-03/msg06831.html

But I can't see why v4.2.0 doesn't work on your system. The bug was introduced later.

> Basically, just get a window to open, with acceleration enabled ... I get,
> Open the vm device error:/dev/hax_vm/vm00, ec:3
> Failed to open vm 0
> Failed to create HAX VM
> No accelerator found.
>

ec:3 is ERROR_PATH_NOT_FOUND

With best regards,
Volker



