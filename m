Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 441202E2DBE
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Dec 2020 10:08:17 +0100 (CET)
Received: from localhost ([::1]:39832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kt5Yd-0001dI-SC
	for lists+qemu-devel@lfdr.de; Sat, 26 Dec 2020 04:08:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1kt5Wz-0000mI-2p
 for qemu-devel@nongnu.org; Sat, 26 Dec 2020 04:06:33 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:50935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1kt5Wu-0000vc-W8
 for qemu-devel@nongnu.org; Sat, 26 Dec 2020 04:06:32 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.94) with esmtps (TLS1.2)
 tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1kt5Wo-002uLb-3F; Sat, 26 Dec 2020 10:06:21 +0100
Received: from dynamic-089-014-149-155.89.14.pool.telefonica.de
 ([89.14.149.155] helo=[192.168.1.10])
 by inpost2.zedat.fu-berlin.de (Exim 4.94) with esmtpsa (TLS1.2)
 tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1kt5Wn-000rhv-Ad; Sat, 26 Dec 2020 10:06:21 +0100
Subject: Re: Deprecation of the LM32 target
To: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
References: <49c3d04e-a94c-cf77-4df9-5ceb8c9c7f80@physik.fu-berlin.de>
 <86690c16-3bc9-9c77-f720-64db14d0cf72@redhat.com>
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Message-ID: <d8bbe81c-3446-8d83-3f34-f29156cf4f01@physik.fu-berlin.de>
Date: Sat, 26 Dec 2020 10:06:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <86690c16-3bc9-9c77-f720-64db14d0cf72@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 89.14.149.155
Received-SPF: pass client-ip=130.133.4.66;
 envelope-from=glaubitz@zedat.fu-berlin.de; helo=outpost1.zedat.fu-berlin.de
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.561,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello!

On 12/26/20 9:39 AM, Thomas Huth wrote:
> the problem is not that the target CPU is old, but rather that according to the (former?) maintainer, there are no users left:
> 
>  https://www.mail-archive.com/qemu-devel@nongnu.org/msg605024.html
> 
> So it got marked as deprecated in this commit here:
> 
>  https://git.qemu.org/?p=qemu.git;a=commitdiff;h=d84980051229fa43c96b3
> 
> Without maintainer and without users, there is no point in keeping this target, is there?

I'm not sure how you determine whether there are people using the code or not. There
is no really user tracking in QEMU, is there?

And the maintainer's claim that RISC-V takes over makes no sense either. The point of
emulators is to be able to run old and existing software. If a target had only a
justification to exist while it's commercially viable, you would have to remove 90%
of the targets in QEMU.

I mean, the whole point of an emulator is being able to run existing code on modern hardware,
usually because the old hardware is no longer available. And as long as the target is
functional, I don't see a point in taking away the functionality.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913


