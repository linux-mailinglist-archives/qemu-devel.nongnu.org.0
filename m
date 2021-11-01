Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5101441DB1
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 17:06:41 +0100 (CET)
Received: from localhost ([::1]:40828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhZpY-00083Y-JV
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 12:06:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mhZlN-0001LY-K4
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 12:02:21 -0400
Received: from relay64.bu.edu ([128.197.228.104]:45703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mhZlK-00011G-T2
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 12:02:21 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 1A1G15JJ019982
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 1 Nov 2021 12:01:13 -0400
Date: Mon, 1 Nov 2021 12:01:05 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Qiuhao Li <Qiuhao.Li@outlook.com>
Subject: Re: Possible reward for fuzzer bug fixes? Secure Open Source Rewards
 Program
Message-ID: <20211101160105.j4qmgkbi6ux6heva@mozz.bu.edu>
References: <20211028144822.jjbw7ypkkman7sow@mozz.bu.edu>
 <PN0PR01MB63525F90A1E456E26D536225FC879@PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN0PR01MB63525F90A1E456E26D536225FC879@PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.562, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 211029 0853, Qiuhao Li wrote:
> Sounds great. How about mentioning this program on the Security
> Process web page [1]? Hackers who report vulnerabilities may be
> interested in fixing bugs.

Sounds like a good idea to me.

> 
> Just curious. Why didn't those bugs [2] get fixed before disclosure? It seems SD and virtio-9p are maintained now.
I'll double check that these have reports/reproducers on gitlab. For the
9p bugs, they seem to be specific to the "synth" backend which is only
used for testing AFAIK.

> 
> [1] https://www.qemu.org/contribute/security-process/
> [2] https://bugs.chromium.org/p/oss-fuzz/issues/list?sort=-reported&q=Type%3DBug-Security%20label%3ADeadline-Exceeded%20qemu&can=2
> 
> ________________________________
> From: Alexander Bulekov <alxndr@bu.edu>
> Sent: Thursday, October 28, 2021 22:48
> To: qemu-devel@nongnu.org <qemu-devel@nongnu.org>
> Cc: Paolo Bonzini <pbonzini@redhat.com>; Bandan Das <bsd@redhat.com>; Stefan Hajnoczi <stefanha@redhat.com>; Thomas Huth <thuth@redhat.com>; Darren Kenny <darren.kenny@oracle.com>; Qiuhao Li <Qiuhao.Li@outlook.com>
> Subject: Possible reward for fuzzer bug fixes? Secure Open Source Rewards Program
> 
> Recently a pilot for the Secure Open Source Rewards program was
> announced [1]. Currently this program is run by the Linux Foundation and
> sponsored by the Google Open Source Security Team.
> 
> The page mentions that patches for issues discovered by OSS-Fuzz may be
> eligible for rewards. This seems like it could be a good incentive for
> fixing fuzzer bugs.
> 
> A couple notes:
>  * The program also rewards contributions besides fuzzer-bug fixes.
>    Check out the page for full details.
>  * It seems that QEMU would qualify for this program. The page mentions
>    that the project should have a greater than 0.6 OpenSSF Criticality
>    Score [2]. This score factors in statistics collected from github
>    (sic!). QEMU's score is currently 0.81078
>  * Not limited to individual contributors. Vendors can also qualify for
>    rewards.
>  * Work completed before Oct 1, 2021 does not qualify.
>  * Individuals in some sanctioned countries are not eligible.
>  * The process seems to be:
>     1. Send a fix upstream
>     2. Get it accepted
>     3. Fill out a form to apply for a reward
> 
> Any thoughts about this? Should this be something we document/advertise
> somewhere, so developers are aware of this opportunity?
> 
> [1] https://sos.dev/
> [2] https://github.com/ossf/criticality_score
> 
> -Alex

