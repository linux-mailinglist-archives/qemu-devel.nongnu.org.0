Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FBC6A12A5
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 23:12:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVJo6-0007GN-2i; Thu, 23 Feb 2023 17:11:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eldon-qemu@eldondev.com>)
 id 1pVJo4-0007Fy-9h
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 17:11:16 -0500
Received: from [209.195.0.149] (helo=npcomp.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eldon-qemu@eldondev.com>)
 id 1pVJo2-0005Pz-Jx
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 17:11:16 -0500
Received: by npcomp.net (Postfix, from userid 1000)
 id 8D4AFF677; Thu, 23 Feb 2023 22:11:11 +0000 ()
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=eldondev.com;
 s=eldondev; t=1677190271;
 bh=5AZKYgD8qFxwEpxk9foKEG0NhmAFSI45aaJhTK9dmyQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=tOyV0JjDG5wPx4INcmMCPCGD0m0i9tcaWNGyd11MBn6v1vE4emDYKPxbaladYxTVX
 0Wzz0Y5HCLylR4VbnQV0OsjQ4fwvNuZzX0ivqU8z3DiCzIxSy08UZ3hUp/5uRZbG5z
 x9fM2uZWCDmEyIL1vFHFiB6yUIKRppn90GGahrkk=
Date: Thu, 23 Feb 2023 22:11:11 +0000
From: Eldon Stegall <eldon-qemu@eldondev.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Ben Dooks <qemu@ben.fluff.org>, Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: out of CI pipeline minutes again
Message-ID: <Y/fkf3Cya1NOopQA@invalid>
References: <CAFEAcA83u_ENxDj3GJKa-xv6eLJGJPr_9FRDKAqm3qACyhrTgg@mail.gmail.com>
 <20230223152836.dpn4z5fy6jg44wqi@hetzy.fluff.org>
 <Y/eHLCKcdYk0V4Tt@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y/eHLCKcdYk0V4Tt@redhat.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 209.195.0.149 (failed)
Received-SPF: pass client-ip=209.195.0.149;
 envelope-from=eldon-qemu@eldondev.com; helo=npcomp.net
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Feb 23, 2023 at 03:33:00PM +0000, Daniel P. Berrangé wrote:
> IIUC, we already have available compute resources from a couple of
> sources we could put into service. The main issue is someone to
> actually configure them to act as runners *and* maintain their
> operation indefinitely going forward. The sysadmin problem is
> what made/makes gitlab's shared runners so incredibly appealing.

Hello,

I would like to do this, but the path to contribute in this way isn't clear to
me at this moment. I made it as far as creating a GitLab fork of QEMU, and then
attempting to create a merge request from my branch in order to test the GitLab
runner I have provisioned. Not having previously tried to contribute via
GitLab, I was a bit stymied that it is not even possibly to create a merge
request unless I am a member of the project? I clicked a button to request
access.  

Alex's plan from last month sounds feasible:
 
 - provisioning scripts in scripts/ci/setup (if existing not already 
 good enough) 
 - tweak to handle multiple runner instances (or more -j on the build) 
 - changes to .gitlab-ci.d/ so we can use those machines while keeping 
 ability to run on shared runners for those outside the project 

Daniel, you pointed out the importance of reproducibility, and thus the
use of the two-step process, build-docker, and then test-in-docker, so it
seems that only docker and the gitlab agent would be strong requirements for
running the jobs?

I feel like the greatest win for this would be to at least host the
cirrus-run jobs on a dedicated runner because the machine seems to
simply be burning double minutes until the cirrus job is complete, so I
would expect the GitLab runner requirements for those jobs to be low?

If there are some other steps that I should take to contribute in this
capacity, please let me know.

Maybe I could send a patch to tag cirrus jobs in the same way that the
s390x jobs are currently tagged, so that we could run those separately?

Thanks,
Eldon

