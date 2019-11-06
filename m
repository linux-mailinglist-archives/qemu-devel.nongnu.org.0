Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D20EF24EB
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Nov 2019 03:08:10 +0100 (CET)
Received: from localhost ([::1]:38484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSXDV-0005MY-7W
	for lists+qemu-devel@lfdr.de; Wed, 06 Nov 2019 21:08:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52223)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <rajaths@cs.utexas.edu>) id 1iSV9u-000788-DX
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 18:56:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rajaths@cs.utexas.edu>) id 1iSV9s-000067-Rx
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 18:56:17 -0500
Received: from newman.cs.utexas.edu ([128.83.139.110]:44523)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <rajaths@cs.utexas.edu>)
 id 1iSV9s-0008Sy-EO
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 18:56:16 -0500
Received: from [172.20.2.59] (rrcs-72-128-130-131.sw.biz.rr.com
 [72.128.130.131]) (authenticated bits=0)
 by newman.cs.utexas.edu (8.14.4/8.14.4/Debian-4.1ubuntu1.1) with ESMTP id
 xA6Noihw006291
 (version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 6 Nov 2019 17:50:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cs.utexas.edu;
 s=default; t=1573084245;
 bh=kL/b9LUmdoAI7JLdwqaqqGg1bQOqUat74KSAGzzRewI=;
 h=To:From:Subject:Date:From;
 b=VgEfTzIeojloJKsX5uexMqsbBvN0MuKrjR4k3B0KbPrbp+GuLhhaaVLOKUVBZ+fj9
 oCYfs8eYf2w19P5bF191f0t1YhL1E3QetxWvV9yJkQf50OX9NFF72ft4jDgXXpJXjv
 AxCS1Co/rUxAla4UGO/PH6ixBfbY5fMwgTqTim0U=
To: qemu-devel@nongnu.org
From: Rajath Shashidhara <rajaths@cs.utexas.edu>
Subject: Looking for issues/features for my first contribution
Message-ID: <f5a16b3c-2c17-60e4-e80b-dd20b3c088cc@cs.utexas.edu>
Date: Wed, 6 Nov 2019 17:50:44 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.3.9
 (newman.cs.utexas.edu [128.83.139.110]); Wed, 06 Nov 2019 17:50:45 -0600 (CST)
X-Virus-Scanned: clamav-milter 0.100.3 at newman
X-Virus-Status: Clean
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 128.83.139.110
X-Mailman-Approved-At: Wed, 06 Nov 2019 21:06:53 -0500
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

Hi all,

I am a Computer Science graduate student at The University of Texas at 
Austin (UT, Austin). I am looking forward to contributing to qemu !

This semester, I am taking a class in Virtualization 
(https://github.com/vijay03/cs378-f19) and contributing to a 
virtualization related open-source project is a significant part of the 
course.
I would be interested in contributing a patchset to qemu - possibly a 
self-contained feature or a reasonably complex bug fix that can be 
completed in under a month's time. I did look at both the bugtracker and 
the QEMU Google Summer of Code 2019 page 
[https://wiki.qemu.org/Google_Summer_of_Code_2019] for ideas. However, I 
would be interested in hearing from the community and I would be 
delighted if somebody can be suggest a suitable project !

I am an advanced C programmer with both professional and academic 
background in systems design & implementation - especially OS & 
Networks. Given my background, I feel fairly confident that I can pickup 
the QEMU codebase quickly.

Eagerly looking forward to hearing from the community !

Thanks,
Rajath Shashidhara


