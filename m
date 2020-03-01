Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB4F174A64
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Mar 2020 01:16:08 +0100 (CET)
Received: from localhost ([::1]:36966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8CH9-0000JS-62
	for lists+qemu-devel@lfdr.de; Sat, 29 Feb 2020 19:16:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42021)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1j8CGG-0008Hc-5d
 for qemu-devel@nongnu.org; Sat, 29 Feb 2020 19:15:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1j8CGE-0000tg-Hs
 for qemu-devel@nongnu.org; Sat, 29 Feb 2020 19:15:11 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:48167)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>) id 1j8CGE-0000ro-AZ
 for qemu-devel@nongnu.org; Sat, 29 Feb 2020 19:15:10 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7BA4F747DCF;
 Sun,  1 Mar 2020 01:15:06 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0580E74637E; Sun,  1 Mar 2020 01:15:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 0216674569F;
 Sun,  1 Mar 2020 01:15:06 +0100 (CET)
Date: Sun, 1 Mar 2020 01:15:05 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: jasper.lowell@bt.com
Subject: RE: Emulating Solaris 10 on SPARC64 sun4u
In-Reply-To: <alpine.BSF.2.22.395.2002282148540.17122@zero.eik.bme.hu>
Message-ID: <alpine.BSF.2.22.395.2003010110210.88562@zero.eik.bme.hu>
References: <CWXP123MB2262B6F3159B7AA7AB010F4183020@CWXP123MB2262.GBRP123.PROD.OUTLOOK.COM>
 <f0f00ecd-1989-9bc1-02e0-8a9b4819f051@ilande.co.uk>
 <LO2P123MB2271B1493AD1B4DC8DDCB97783100@LO2P123MB2271.GBRP123.PROD.OUTLOOK.COM>
 <alpine.BSF.2.22.395.2002191904370.88848@zero.eik.bme.hu>
 <alpine.BSF.2.22.395.2002192059340.88848@zero.eik.bme.hu>
 <alpine.BSF.2.22.395.2002282148540.17122@zero.eik.bme.hu>
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
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 28 Feb 2020, BALATON Zoltan wrote:
> I think I now understand the problem with via-ide at least and the following

FYI, I came up with this patch:

http://patchwork.ozlabs.org/project/qemu-devel/list/?series=161714

that fixes my problem with via-ide. The first patch also touches CMD646 to 
allow reusing a field in PCIIDEState for flags but I did not change 
anything else for CMD646.

Regards,
BALATON Zoltan

