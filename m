Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9875B573CBC
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 20:49:59 +0200 (CEST)
Received: from localhost ([::1]:48254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBhQs-0007HK-FB
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 14:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1oBhPY-0005mJ-Iz; Wed, 13 Jul 2022 14:48:36 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:57522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1oBhPW-0000kS-S5; Wed, 13 Jul 2022 14:48:36 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1084EB81D5E;
 Wed, 13 Jul 2022 18:48:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78FD7C34114;
 Wed, 13 Jul 2022 18:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657738109;
 bh=9Z0nDyYvjFMFoqFFEogaj4L5udBmRFKf6581MoP/m38=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E+WdMZStLPdTdWQE1GxWP5wYr1wR9OSQHu3eQAfDlfb3BZ5/dCAkYxLrGLa4T9T9t
 kkn767a3KEgOO92ZREM/T1H89jLsfo9wlyTyq+jL23qGn09SgpdRHCZQfPoZ7t/n69
 RI/f8li390KqPJCArZ7BX1o4hdEe/W3f2aumAmpxt1j/xqsV/flc5aF3PdraZ+Qvew
 V1MXUBWPXmHfJglatG3fWrsRGkTRg3oNLZojDG8R0wnEhiihi3zwOsDzoY91WJS94w
 6DdFVbXRuVT25eYvyZnh9Mf4MoLWZxJc6FN6srY3D5IhbvOTFglhkyNBQBUurFTbzP
 zpktGbPvfqf7w==
Date: Wed, 13 Jul 2022 12:48:26 -0600
From: Keith Busch <kbusch@kernel.org>
To: Mauricio Sandt <mauricio@mailbox.org>
Cc: qemu-devel@nongnu.org, Klaus Jensen <its@irrelevant.dk>,
 qemu-block@nongnu.org
Subject: Re: [PATCH] hw/nvme: Add options to override hardcoded values
Message-ID: <Ys8Tel0PFYODk8Rj@kbusch-mbp.dhcp.thefacebook.com>
References: <20220611223509.32280-1-mauricio@mailbox.org>
 <Ys76yHpwdm4eyTbs@kbusch-mbp.dhcp.thefacebook.com>
 <6d623fbd-65ee-b74f-15f8-9e35ffb3fd0d@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d623fbd-65ee-b74f-15f8-9e35ffb3fd0d@mailbox.org>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=kbusch@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 13, 2022 at 08:06:26PM +0200, Mauricio Sandt wrote:
> My specific use case that required this patch is a piece of malware that used
> several IOCTLs to read model, firmware, and nqn from the NVMe attached to the
> VM. Modifying that info at the hypervisor level was a much better approach
> than loading an (unsigned) driver into windows to intercept said IOCTLs.
> Having this patch in the official qemu version would help me a lot in my test
> lab, and I'm pretty sure it would also help other people.

I guess I'm missing the bigger picture here. You are supposed to be able to
retrieve these fields with ioctl's, so not sure what this has to do with
malware. Why does the firmware revision matter to this program?
 
> I guess there could be a warning about potential problems with drivers in the
> description for model, firmware, and nqn, but I haven't experienced any
> issues when changing the values (for all of them). If you encountered any
> problems, how did they manifest?

Older qemu nvme wasn't reliably generating unique identifiers, so linux quirks
them to ignore. They are reliable now, so the quirk can be changed to firmware
specific when the version number updates with the next release.

