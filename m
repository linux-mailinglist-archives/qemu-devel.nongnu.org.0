Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D4D1F97EF
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 15:10:04 +0200 (CEST)
Received: from localhost ([::1]:50218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkosF-00011d-IM
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 09:10:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dario@ciriminna.com>)
 id 1jkkvo-0004JO-Ru
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 04:57:29 -0400
Received: from smtpcmd01-g.aruba.it ([62.149.158.217]:54359)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dario@ciriminna.com>) id 1jkkvm-0006Jv-Du
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 04:57:28 -0400
Received: from [192.168.0.2] ([93.48.24.41])
 by smtpcmd01.ad.aruba.it with bizsmtp
 id rLxF2202K0tBuBh01LxJXi; Mon, 15 Jun 2020 10:57:20 +0200
To: qemu-devel@nongnu.org
From: Dario Ciriminna <dario@ciriminna.com>
Subject: qemu win10 host winxp quest very slow
Message-ID: <ad6cf8c6-1164-294c-134f-0c958598862b@ciriminna.com>
Date: Mon, 15 Jun 2020 10:57:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: it
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aruba.it; s=a1;
 t=1592211440; bh=kYME0rTDm2FKqk/YbrghLfWuebGvLtKIjUiROO5pTBY=;
 h=To:From:Subject:Date:MIME-Version:Content-Type;
 b=VEffRxi3sY3bgRgLUdNEciZrxv7rU6XVRGgPuB+KIzTxlJbDk2ztQXKfjl2EAlRTh
 jlT2rUm+E50Am6mHSkSGSyJz3CqWIU/K+BaMwTbojbXFOKCQuUnDvostAoUA9KiZb7
 tKRoZ51sIfVi5dWDMg8ooa69OxoTIfApGMccYa15pzOKakqb8r2FsYkETERVuyDKBt
 XsNHcLKExyA8XU0mFo8C4a6HZhOkeCXoH53GdLQHIrqmJi7atl2KJJxQGWz2sVYYES
 V1o/ouUxHMWEw7OTD92v6ngCpcOMtWMaIwx8DRk6iioW/6Rx6MuNDh423KdjRh0yZq
 whADYjj5jrXoQ==
Received-SPF: pass client-ip=62.149.158.217; envelope-from=dario@ciriminna.com;
 helo=smtpcmd01-g.aruba.it
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 04:57:21
X-ACL-Warn: Detected OS   = Linux 2.6.x
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 15 Jun 2020 09:08:41 -0400
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

Hello folks,

i need to compile and run qemu under Windows 10 host (Pentium G860, very 
bad)� with a Windows XP guest.
Precompiled downloaded binary run smoothly, but my compiled version is 
very very slow (I NEED to compile it).

I start it with :

"C:\Program Files\qemu\qemu-system-x86_64w.exe" .\WindowsXP.img -m 1024M 
-usb -vga std -netdev user,id=n0 -device rtl8139,netdev=n0 -fda 
.\ZSK_DSK.img -D .\qemu.log

ah and -D .\qemu.log doesn't log nothing. 0k log file.

What can i try ? 3 min to start Windows XP is unacceptable and after 
start system run slow!

Thanks for help

Dario


