Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C8E582539
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 13:15:12 +0200 (CEST)
Received: from localhost ([::1]:48216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGf0Q-0007I0-KM
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 07:15:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@fluff.org>)
 id 1oGeyn-0005n2-Ud; Wed, 27 Jul 2022 07:13:30 -0400
Received: from test-v6.fluff.org ([2a01:4f8:222:2004::3]:59394
 helo=hetzy.fluff.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@fluff.org>)
 id 1oGeyl-0004Uv-OP; Wed, 27 Jul 2022 07:13:29 -0400
Received: from ben by hetzy.fluff.org with local (Exim 4.89)
 (envelope-from <ben@fluff.org>)
 id 1oGeye-0005I4-Bf; Wed, 27 Jul 2022 12:13:20 +0100
Date: Wed, 27 Jul 2022 12:13:20 +0100
From: Ben Dooks <qemu@ben.fluff.org>
To: Ben Dooks <ben.dooks@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Jude Onyenegecha <jude.onyenegecha@sifive.com>,
 Sudip Mukherjee <sudip.mukherjee@sifive.com>,
 William Salmon <william.salmon@sifive.com>,
 Adnan Chowdhury <adnan.chowdhury@sifive.com>
Subject: Re: updates for designware pci-host
Message-ID: <20220727111320.5b7qobwx5bbwh65d@hetzy.fluff.org>
References: <20220713165449.37433-1-ben.dooks@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220713165449.37433-1-ben.dooks@sifive.com>
X-Disclaimer: These are my views alone.
X-URL: http://www.fluff.org/
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: ben@fluff.org
X-SA-Exim-Scanned: No (on hetzy.fluff.org); SAEximRunCond expanded to false
Received-SPF: pass client-ip=2a01:4f8:222:2004::3; envelope-from=ben@fluff.org;
 helo=hetzy.fluff.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Jul 13, 2022 at 05:54:42PM +0100, Ben Dooks wrote:
> As part of a project we have been looking at using the DesignWare
> PCIe host. We found a few issues of missing features or small bugs
> when using this with a recent Linux kernel (v5.17.x)
> 
> Whilst doing this we also made a start on some tracing events.

Hi, has anyone had a chance to review these. If so can this series
get applied? If not should anyone else be added to the review list?

If it would be easier I can try and find a git tree to publish this
branch on if a pull request would be easier.

-- 
Ben Dooks, ben@fluff.org, http://www.fluff.org/ben/

Large Hadron Colada: A large Pina Colada that makes the universe disappear.


