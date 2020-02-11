Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B4F1586CC
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 01:37:28 +0100 (CET)
Received: from localhost ([::1]:41384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1JYN-00087S-07
	for lists+qemu-devel@lfdr.de; Mon, 10 Feb 2020 19:37:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49689)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1j1JXQ-0007aK-TK
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 19:36:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1j1JXP-0006tl-6i
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 19:36:28 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:47091)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>) id 1j1JXO-0006SY-WF
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 19:36:27 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 181B57475F6;
 Tue, 11 Feb 2020 01:36:22 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id EFAB074638A; Tue, 11 Feb 2020 01:36:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id EE66A74569F;
 Tue, 11 Feb 2020 01:36:21 +0100 (CET)
Date: Tue, 11 Feb 2020 01:36:21 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [RFC 0/1] ATI R300 emulated grpahics card V2
In-Reply-To: <alpine.BSF.2.21.99999.352.1911301300470.56280@zero.eik.bme.hu>
Message-ID: <alpine.BSF.2.22.395.2002110128370.67831@zero.eik.bme.hu>
References: <20191128064350.20727-1-aaron.zakhrov@gmail.com>
 <20191128113023.gdw63adoooqlider@sirius.home.kraxel.org>
 <alpine.BSF.2.21.99999.352.1911291908110.15049@zero.eik.bme.hu>
 <alpine.BSF.2.21.99999.352.1911301300470.56280@zero.eik.bme.hu>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:738:2001:2001::2001
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
Cc: qemu-devel@nongnu.org, aaron.zakhrov@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 30 Nov 2019, BALATON Zoltan wrote:
> That's all I could find out so far, any help to get further is  appreciated.

I've created a ticket at my qmiga.osdn.io page where I've summarised 
previous discussion at one place which could be used to track what we know 
about it. See here:

https://osdn.net/projects/qmiga/ticket/40018

Help getting further is still appreciated, I couldn't do much with this so 
far but if anyone knows anything about early Radeon microengine feel free 
to chime in.

Regards,
BALATON Zoltan

