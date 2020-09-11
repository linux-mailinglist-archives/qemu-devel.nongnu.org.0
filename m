Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46523266261
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Sep 2020 17:45:25 +0200 (CEST)
Received: from localhost ([::1]:44862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGlEq-0005Yb-CX
	for lists+qemu-devel@lfdr.de; Fri, 11 Sep 2020 11:45:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kGlAu-000231-IW
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 11:41:20 -0400
Received: from relay64.bu.edu ([128.197.228.104]:34171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kGlAs-00017K-SP
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 11:41:20 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 08BFet0h024855
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 11 Sep 2020 11:40:59 -0400
Date: Fri, 11 Sep 2020 11:40:55 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: P J P <ppandit@redhat.com>
Subject: Re: About 'qemu-security' mailing list
Message-ID: <20200911154055.hnh6wgqpc5pdcyjl@mozz.bu.edu>
References: <nycvar.YSQ.7.78.906.2009111910280.36374@xnncv>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nycvar.YSQ.7.78.906.2009111910280.36374@xnncv>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/11 11:41:17
X-ACL-Warn: Detected OS   = Linux 2.6.x
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Prasad,
A couple questions:
 * I'm guessing this will be a closed list with some application/vetting
   procedure for the participants? (Maybe this is what you mean by
   "moderated" ?)
 * How will the communication be encrypted?
 * Will secalert still be subscribed (for managing CVE ID assignments)?
 * Assuming PGP will be gone, will it be possible to make the "This bug
   is a security vulnerability" button work on Launchpad?
Thanks!
-Alex

On 200911 1950, P J P wrote:
>   Hello all,
> 
> Recently while conversing with DanPB this point came up
> 
>    -> https://www.qemu.org/contribute/security-process/
> 
> * Currently QEMU security team is a handful of individual contacts which
>   restricts community participation in dealing with these issues.
> 
> * The Onus also lies with the individuals to inform the community about QEMU
>   security issues, as they come in.
> 
> 
> Proposal: (to address above limitations)
> =========
> 
> * We set up a new 'qemu-security' mailing list.
> 
> * QEMU security issues are reported to this new list only.
> 
> * Representatives from various communities subscribe to this list. (List maybe
>   moderated in the beginning.)
> 
> * As QEMU issues come in, participants on the 'qemu-security' list shall
>   discuss and decide about how to triage them further.
> 
> Please kindly let us know your views about it. I'd appreciate if you have
> any suggestions/inputs/comments about the same.
> 
> 
> Thank you.
> --
> Prasad J Pandit / Red Hat Product Security Team
> 8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D
> 
> 

