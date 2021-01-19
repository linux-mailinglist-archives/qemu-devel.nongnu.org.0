Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 165DE2FBC3A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 17:19:12 +0100 (CET)
Received: from localhost ([::1]:33516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1tip-0001FN-47
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 11:19:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l1tfn-00087F-Kr
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:16:03 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:33133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l1tfk-0004CQ-PA
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:16:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=hbMG/F2JlZO1zQc/Rf5Dnicp/KR2+RoT4A1PES/HDU4=; b=EQAU1P156QBI7oLxGutBCUbSoc
 ETvMILJUG0oO+7SI+m1PEHX7d4dZBgvdEI6FjNyBt5vPJpQAN9w97EfbY4t+LYnspOvB5lg0TfWUC
 c4vgfkwaq4Qy/nFbQQOK6QhQZwPSFTt56RvW5A+dIjq+3YWbUr6Q2Y8RlLB76pldvqjGEvG+fZX3E
 V7aIrhuENYhrKzBHKbh0z19ri3afdNwGw/zYc5X+fJoN+nebFOHlY16sbiBL5x88dFeUpJ2wl8Aol
 HbiGtgRGJRRN+lbjodDJB/EzOxhACoWoeIdpyYdUErsPODBCy3bjdt596chyf1W/+BHk+tCvSa3pQ
 RVtWgd3+/KHDe6oOdFdNQhotWNyDFBsE04bYRa4ydH1pc+ArLPJah0LijgDLqddIhl0ZUe0U/Nnz1
 ocnyAoyFdBPTRDs+/0HVOk9Zlaohbv7ABJos6Eqp6hvl3nXHT+ZKQEASFCH18SGIPqoEoOgjUM851
 L4JWLhZ7Yqb6PdL32bQtWn8LdMe6gKnqG+G1JXPHyaZciSqjzfKHxvxB9VKywvG7IJtPWLuqrJKzt
 K5G49nJ7K2VBgQ+xo6cBU8fsb2OE0HlIkmr2zMr1krTT2zzhx8QqgHwYXl5ejm19LZfiWcEQ4ElQi
 KvFIScOLUASIxpWiAX9Yg3p18+ymwl01oGoNodWrk=;
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 3/3] fuzz: add virtio-9p configurations for fuzzing
Date: Tue, 19 Jan 2021 17:15:56 +0100
Message-ID: <12994439.qYkiaS4ZXl@silver>
In-Reply-To: <m27do9nd7k.fsf@oracle.com>
References: <20210117230924.449676-1-alxndr@bu.edu>
 <20210119151229.2xnmks65g6xxe6ey@mozz.bu.edu> <m27do9nd7k.fsf@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Greg Kurz <groug@kaod.org>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Christian Schoenebeck <qemu_oss@crudebyte.com>
From: qemu_oss--- via <qemu-devel@nongnu.org>

On Dienstag, 19. Januar 2021 16:44:31 CET Darren Kenny wrote:
> On Tuesday, 2021-01-19 at 10:12:29 -05, Alexander Bulekov wrote:
> > On 210118 1540, Darren Kenny wrote:
> >> On Monday, 2021-01-18 at 10:30:33 -05, Alexander Bulekov wrote:
> >> > On 210118 1334, Christian Schoenebeck wrote:
> >> >> On Montag, 18. Januar 2021 00:09:24 CET Alexander Bulekov wrote:
> >> >> > virtio-9p devices are often used to expose a virtual-filesystem to
> >> >> > the
> >> >> > guest. There have been some bugs reported in this device, such as
> >> >> > CVE-2018-19364, and CVE-2021-20181. We should fuzz this device
> >> >> > 
> >> >> > This patch adds two virtio-9p configurations:
> >> >> >  * One with the widely used -fsdev local driver. This driver leaks
> >> >> >  some
> >> >> >  
> >> >> >    state in the form of files/directories created in the shared dir.
> >> >> >  
> >> >> >  * One with the synth driver. While it is not used in the real
> >> >> >  world, this
> >> >> >  
> >> >> >    driver won't leak leak state between fuzz inputs.
> >> >> > 
> >> >> > Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> >> >> > ---
> >> >> > CC: Christian Schoenebeck <qemu_oss@crudebyte.com>
> >> >> > CC: Greg Kurz <groug@kaod.org>
> >> >> > 
> >> >> > I considered adding an atexit handler to remove the temp directory,
> >> >> > however I am worried that there might be some error that results in
> >> >> > a
> >> >> > call to exit(), rather than abort(), which will cause problems for
> >> >> > future fork()-ed fuzzers. I don't think there are such calls in the
> >> >> > 9p
> >> >> > code, however there might be something in the APIs used by 9p. As
> >> >> > this
> >> >> > code is primarily for ephemeral OSS-Fuzz conainers, this shouldn't
> >> >> > be
> >> >> > too much of an issue.
> >> >> 
> >> >> Yes, dealing with signal handlers for that is probably a bit
> >> >> intransparent and would leave a questionable feeling about its
> >> >> reliability.
> >> >> 
> >> >> What about __attribute__((destructor)) to auto delete the fuzzer
> >> >> directory,
> >> >> like virtio-9p-test.c does for the same task?
> >> > 
> >> > My worry is that we will end up deleting it while it is still in use.
> >> > The scenario I am worried about:
> >> > [parent process ] set up temp directory for virtio-9p
> >> > [parent process ] initialize QEMU
> >> > [parent process ] fork() and wait()
> >> > [child process 1] Run the fuzzing input.
> >> > [child process 1] Once the input has been executed, call _Exit(). This
> >> > should skip the atexit()/__attribute((destructor)) handlers. For
> >> > reasons
> >> > related to libfuzzer, we need to do this so that libfuzzer doesn't
> >> > treat
> >> > each child exit()-ing as a crash.
> >> > [parent process ] wait() returns.
> >> > [parent process ] generate a new input.. fork() and wait()
> >> > [child process 2] Run the fuzzing input.
> >> > [child process 2] Somewhere we hit an abort(). libfuzzer hooks the
> >> > abort
> >> > and dumps the crashing input and stack trace. Since abort() doesn't
> >> > call
> >> > exit handlers, it will skip over atexit()/__attribute((destructor))
> >> > handlers [parent process ] wait() returns.
> >> > [parent process ] generate a new input.. fork() and wait()
> >> > [child process 3] Run the fuzzing input.
> >> > [child process 3] Somewhere we hit an exit(). This will dump the
> >> > input/stacktrace and it will run the exit handlers (removing the shared
> >> > 9p directory)
> >> > [parent process ] wait() returns. generate a new input.. fork() and
> >> > wait()
> >> > [child process 4] ...
> >> 
> >> OK, that answer's my question :)
> >> 
> >> > Now all the subsequent forked children will refer to a shared directory
> >> > that we already removed. Ideally, we would run the cleanup handler only
> >> > after the parent process exit()s. I think there are some ways to do
> >> > this, by placing the atexit() call in a place only reachable by the
> >> > parent. However, on OSS-Fuzz this shouldn't be a problem as everything
> >> > is cleaned up automatically anyway..
> >> 
> >> Yep, agreed.
> >> 
> >> > I am more worried about the fact that files/directories/links that are
> >> > created by 9p in the child processes, persist across inputs. I think
> >> > Thomas suggested a way to work-around this for PATCH 1/3. We could have
> >> > a function that runs in the parent after each wait() returns, that
> >> > would
> >> > remove all the files in the temp directory and scrub the extended
> >> > attributes applied by 9p to the shared dir.
> >> 
> >> Hmm, that sounds like something to consider, but it may also end up
> >> slowing down the execution during the turn-around - guess it depends on
> >> how much noise is being generated.
> > 
> > I've ben running the fuzzer for a couple days, and I haven't noticed any
> > issues with unreproducible inputs (yet). Is this something we can add
> > later, if it becomes a problem?
> 
> Sure, I'm good with that:
> 
> Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
> 
> Thanks,
> 
> Darren.

Same with me:

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

Best regards,
Christian Schoenebeck



