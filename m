Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 059F1141A18
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Jan 2020 23:42:12 +0100 (CET)
Received: from localhost ([::1]:45498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iswnD-00030A-4b
	for lists+qemu-devel@lfdr.de; Sat, 18 Jan 2020 17:42:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38089)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1iswmO-0002aw-Do
 for qemu-devel@nongnu.org; Sat, 18 Jan 2020 17:41:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1iswmM-00028V-UF
 for qemu-devel@nongnu.org; Sat, 18 Jan 2020 17:41:19 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:48308)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>) id 1iswmM-00022D-ON
 for qemu-devel@nongnu.org; Sat, 18 Jan 2020 17:41:18 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 67AB97482CC;
 Sat, 18 Jan 2020 23:41:09 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 4F1AB7482CB; Sat, 18 Jan 2020 23:41:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 4D9CD7475F6;
 Sat, 18 Jan 2020 23:41:09 +0100 (CET)
Date: Sat, 18 Jan 2020 23:41:09 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org
Subject: Commit 3e7fb5811b or something in that series breaks build?
Message-ID: <alpine.BSF.2.21.99999.352.2001182314430.68247@zero.eik.bme.hu>
User-Agent: Alpine 2.21.99999 (BSF 352 2019-06-22)
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
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
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

I'm getting errors about missing headers in qapi/* and build fails on 
current master.

I've tried bisecting it which lead to commit 3e7fb5811b where I get:

   CC      qapi/qapi-types-audio.o
cc: error: qapi/qapi-types-audio.c: No such file or directory
cc: fatal error: no input files

(This is with --audio-drv-list=alsa configure option and in-tree build in 
case that matters.)

Reverting that commit alone does not fix build on master I had to revert 
both 3bef3aaec9 and 3e7fb5811b

Regards,
BALATON Zoltan

