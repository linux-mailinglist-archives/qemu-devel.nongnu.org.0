Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BC8148A94
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jan 2020 15:52:15 +0100 (CET)
Received: from localhost ([::1]:43342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iv0Jh-0001j8-T6
	for lists+qemu-devel@lfdr.de; Fri, 24 Jan 2020 09:52:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47085)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <graemebrett.houston@btopenworld.com>)
 id 1iv0GK-0008RG-Rt
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 09:48:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <graemebrett.houston@btopenworld.com>)
 id 1iv0GJ-00074N-Eu
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 09:48:44 -0500
Received: from mailomta17-sa.btinternet.com ([213.120.69.23]:14434
 helo=sa-prd-fep-048.btinternet.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <graemebrett.houston@btopenworld.com>)
 id 1iv0GI-00072T-Tb
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 09:48:43 -0500
Received: from sa-prd-rgout-003.btmx-prd.synchronoss.net ([10.2.38.6])
 by sa-prd-fep-048.btinternet.com with ESMTP id
 <20200124144840.BKXM8264.sa-prd-fep-048.btinternet.com@sa-prd-rgout-003.btmx-prd.synchronoss.net>
 for <qemu-devel@nongnu.org>; Fri, 24 Jan 2020 14:48:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=btopenworld.com;
 s=btmx201904; t=1579877320; 
 bh=xBZsUAPfjODqUwfi2NB8MMJhwP+8SvR4JdTYTRRd+LQ=;
 h=To:From:Subject:Message-ID:Date:MIME-Version;
 b=pjQI3RNOqTGCj2UD+DrE8cqUOuPizwz6I1i9NIXIss5iQ0+zitMKFPZ6h3AiOroGwIQ84z1BPMbVXc0EDBuZ7qAjSnpb6Xqe8PMf/uDwalrUzEJbUXoK3luT+scmPpRGGS0Vx6uKR5n0b5mNpaR9URo8T7PtrNbZRj5L9UxZBzalsmeo1LPRC9uEe1OfVWj3whDjGQ9ED80EJvvhELj3ijvybFnOcyUY6rlX5a4B7QmNl3rX/VrtWJIzu1PJnZeumrQt/Ji/q5ZhVCpZJhyNvWoWekSUFyUSAHZMnrpT+ZNfzhnLR1DZbjit3ODsTMuFpuV6yeBJAANlwY8Opt8Z0A==
Authentication-Results: btinternet.com;
 auth=pass (PLAIN) smtp.auth=graemebrett.houston@btopenworld.com
X-Originating-IP: [86.183.95.28]
X-OWM-Source-IP: 86.183.95.28 (GB)
X-OWM-Env-Sender: graemebrett.houston@btinternet.com
X-VadeSecure-score: verdict=clean score=0/300, class=clean
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedugedrvdeggdeikecutefuodetggdotefrodftvfcurfhrohhfihhlvgemuceutffkvffkuffjvffgnffgvefqofdpqfgfvfenuceurghilhhouhhtmecufedttdenucenucfjughrpefvhffukffffgggtgfgsehtjeertddtfeejnecuhfhrohhmpefirhgrvghmvgcuuehrvghtthcujfhouhhsthhonhcuoehgrhgrvghmvggsrhgvthhtrdhhohhushhtohhnsegsthhophgvnhifohhrlhgurdgtohhmqeenucfkphepkeeirddukeefrdelhedrvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehhvghloheplgduledvrdduieekrddtrdduvddtngdpihhnvghtpeekiedrudekfedrleehrddvkedpmhgrihhlfhhrohhmpeeoghhrrggvmhgvsghrvghtthdrhhhouhhsthhonhessghtihhnthgvrhhnvghtrdgtohhmqecuuefqffgjpeekuefkvffokffogfdprhgtphhtthhopeeoqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgheq
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from [192.168.0.120] (86.183.95.28) by
 sa-prd-rgout-003.btmx-prd.synchronoss.net (5.8.337) (authenticated as
 graemebrett.houston@btopenworld.com)
 id 5E1A306602030F4E for qemu-devel@nongnu.org; Fri, 24 Jan 2020 14:48:40 +0000
To: qemu-devel@nongnu.org
From: Graeme Brett Houston <graemebrett.houston@btopenworld.com>
Subject: Documentation and VFIO on SPARC
Message-ID: <1fe252e9-5c9d-a572-d3ae-76d51ef77026@btopenworld.com>
Date: Fri, 24 Jan 2020 14:48:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 213.120.69.23
X-Mailman-Approved-At: Fri, 24 Jan 2020 09:51:25 -0500
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

2 Queries:

1st is there any Good Documentation on Writing VGA devices?

2nd Can VFIO devices be successfully passed to the sparc engine & 
hopefully Solaris 9 actually bootup

I am thinking a Actual PCI SPARC Card with OpenFirmware ROM and other 
dev ices i am interested in getting a PCI trace from.


