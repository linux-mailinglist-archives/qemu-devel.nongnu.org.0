Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7803127482
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 05:22:31 +0100 (CET)
Received: from localhost ([::1]:50494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ii9o5-0008LC-RG
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 23:22:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48710)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fthain@telegraphics.com.au>) id 1ii9mx-0007md-Ib
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 23:21:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>) id 1ii9mw-0007sc-Hc
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 23:21:19 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:34378)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>)
 id 1ii9mw-0007fr-CV; Thu, 19 Dec 2019 23:21:18 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id B84422290B;
 Thu, 19 Dec 2019 23:21:10 -0500 (EST)
Date: Fri, 20 Dec 2019 15:21:11 +1100 (AEDT)
From: Finn Thain <fthain@telegraphics.com.au>
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>, 
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>
Subject: Re: [PATCH 00/10] Fixes for DP8393X SONIC device emulation
In-Reply-To: <alpine.LNX.2.21.1.1912160906420.11@nippy.intranet>
Message-ID: <alpine.LNX.2.21.1.1912200911550.8@nippy.intranet>
References: <cover.1576286757.git.fthain@telegraphics.com.au>
 <CAL1e-=gwxSDa1NSevcCbjG1r5vg6A49Kg_FP2EL1jW+BMn7Ghw@mail.gmail.com>
 <alpine.LNX.2.21.1.1912150915460.8@nippy.intranet>
 <alpine.LNX.2.21.1.1912160906420.11@nippy.intranet>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 98.124.60.144
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
Cc: Jason Wang <jasowang@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 Dec 2019, Finn Thain wrote:

> 00:15:29.341601 IP truncated-ip - 52 bytes missing! 192.168.66.1 > 192.168.66.111: ICMP echo request, id 23957, seq 12, length 64

...

> 
> Sniffing br0 on the host shows no sign of the truncated packet at all 
> which leaves a gap in the packet sequence numbers captured on the host. 

I've fixed some bugs and I don't see these problems any more. I'll send v2.

