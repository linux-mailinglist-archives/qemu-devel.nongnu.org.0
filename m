Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3911BC0F8
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Apr 2020 16:16:30 +0200 (CEST)
Received: from localhost ([::1]:60028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTR2D-00052S-4t
	for lists+qemu-devel@lfdr.de; Tue, 28 Apr 2020 10:16:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36670)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <artur@puzio.waw.pl>) id 1jTMlZ-0005WH-OL
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 05:44:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <artur@puzio.waw.pl>) id 1jTMjK-0007p6-Nj
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 05:43:01 -0400
Received: from puzio.waw.pl ([2001:41d0:401:3100::3f29]:45319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <artur@puzio.waw.pl>)
 id 1jTMjJ-0007mA-RB
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 05:40:42 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by puzio.waw.pl (Postfix) with ESMTP id E4B4F1C492;
 Tue, 28 Apr 2020 11:40:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=puzio.waw.pl;
 s=default; t=1588066846;
 bh=JkOniP87jULWq0LQ3Z7u0q7SiZfMusLTsWD8rZJuaqs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To;
 b=vSNw6kM11+eO/ZFLrZw/9SUpJepaNyK2VBwUFEBG5g5Pm7I+TZPVYuyfyGRW7pWpi
 CkIv0StlHxScBGYAJbx2FQq4o9jGRGVPciTiU6pw+u/vrnAzegj2y4rnmSwQr0ri8w
 W0Pgi3HWdn6c48E/q093H8spQ3hjf/weanLIUubkKj6FcOfmdcohRHO6FFNjA+DgQG
 oSWhjVvP2JQsWjBG20Ftba4JOHTiP8IGeHmMjyjFXxN9JptIrXO3wi87xCsjM1J0dP
 4UL1aJcJyWrxPeIbR5hb3ld2ph9rMDX+22yv7/nFAeKsyuNWqlV/jrO8kWx5LE1WM1
 6Fz6iuHRwCxmA==
X-Fuglu-Suspect: b4cc723c9a65426cad6da44d8fdc13c1
X-Fuglu-Spamstatus: NO
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: artur@puzio.waw.pl)
 by puzio.waw.pl (Postfix) with ESMTPSA;
 Tue, 28 Apr 2020 11:40:41 +0200 (CEST)
Subject: Re: [PATCH 1/2] Fix undefined behaviour
To: paul@xen.org, 'Grzegorz Uriasz' <gorbak25@gmail.com>, qemu-devel@nongnu.org
Cc: marmarek@invisiblethingslab.com, jakub@bartmin.ski,
 j.nowak26@student.uw.edu.pl, 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Anthony Perard' <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20200428062847.7764-1-gorbak25@gmail.com>
 <20200428062847.7764-2-gorbak25@gmail.com>
 <000001d61d34$6c0218f0$44064ad0$@xen.org>
From: Artur Puzio <artur@puzio.waw.pl>
Message-ID: <90a8b709-c506-92e2-800c-e1558f18df94@puzio.waw.pl>
Date: Tue, 28 Apr 2020 11:40:46 +0200
MIME-Version: 1.0
In-Reply-To: <000001d61d34$6c0218f0$44064ad0$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US-large
Received-SPF: pass client-ip=2001:41d0:401:3100::3f29;
 envelope-from=artur@puzio.waw.pl; helo=puzio.waw.pl
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2001:41d0:401:3100::3f29
X-Mailman-Approved-At: Tue, 28 Apr 2020 10:14:35 -0400
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

On 28.04.2020 10:10, Paul Durrant wrote:
>> -----Original Message-----
>> From: Grzegorz Uriasz <gorbak25@gmail.com>
>> Sent: 28 April 2020 07:29
>> To: qemu-devel@nongnu.org
>> Cc: Grzegorz Uriasz <gorbak25@gmail.com>; marmarek@invisiblethingslab.com; artur@puzio.waw.pl;
>> jakub@bartmin.ski; j.nowak26@student.uw.edu.pl; Stefano Stabellini <sstabellini@kernel.org>; Anthony
>> Perard <anthony.perard@citrix.com>; Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
>> Subject: [PATCH 1/2] Fix undefined behaviour
>>
>> Signed-off-by: Grzegorz Uriasz <gorbak25@gmail.com>
> I think we need more of a commit comment for both this and patch #2 to explain why you are making the changes.
>
>   Paul 

I agree Grzegorz should improve the commit messages. In the mean time
see email with subject "[PATCH 0/2] Fix QEMU crashes when passing IGD to
a guest VM under XEN", it contains quite detailed explanation for both
"Fix undefined behaviour" and "Improve legacy vbios handling" patches.

Artur Puzio


