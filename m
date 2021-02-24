Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 108EC323BC0
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 13:03:30 +0100 (CET)
Received: from localhost ([::1]:58658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEst7-000248-3A
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 07:03:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <msuchanek@suse.de>) id 1lEsrT-0001A5-Da
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 07:01:47 -0500
Received: from mx2.suse.de ([195.135.220.15]:59762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <msuchanek@suse.de>) id 1lEsrS-0007iu-0W
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 07:01:47 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 62459AD57;
 Wed, 24 Feb 2021 12:01:41 +0000 (UTC)
Date: Wed, 24 Feb 2021 13:01:40 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: Problem running functional tests from China
Message-ID: <20210224120140.GO6564@kitsune.suse.cz>
References: <60118671-cd47-1900-59c6-96782dd7e26c@redhat.com>
 <20210224110605.GM6564@kitsune.suse.cz>
 <198ecefe-4d68-b43d-dfae-8a5ceeee9615@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <198ecefe-4d68-b43d-dfae-8a5ceeee9615@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Received-SPF: pass client-ip=195.135.220.15; envelope-from=msuchanek@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, avocado-devel <avocado-devel@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 24, 2021 at 12:37:53PM +0100, Philippe Mathieu-Daudé wrote:
> On 2/24/21 12:06 PM, Michal Suchánek wrote:
> > On Wed, Feb 24, 2021 at 10:29:15AM +0100, Philippe Mathieu-Daudé wrote:
> >> Just to inform the files hosted on github don't work when
> >> testing from China:
> > 
> >>
> >> raw.githubusercontent.com resolves to 127.0.0.1
> 
> Actually not even localhost but 0.0.0.0 :)
> 
> > And from where does this come from?
> > 
> > Your local system, your ISP, ... ?
> 
> Probably the ISP:
> 
...
> 
> I raised that problem not to find a way to bypass an ISP
> firewall, but to see if there is a way to use another
> storage for test artifacts so all the community can run
> the tests.

I don't think protecting from random network malfunction is something
the qemu project can do.

That said, downloading the test data during test run does indeed look
fragile.

We have the concept of git submodules which is used in qemu extensively
so the test data could possibly be included directly in the git tree.

The obvious downside is that the current and past test binaries will take
up disk space for all users that check out the repository, even those
that don't run the tests.

Thanks

Michal

