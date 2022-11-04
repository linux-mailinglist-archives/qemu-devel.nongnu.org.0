Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AD66195B8
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 13:01:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqvMe-0007F4-2U; Fri, 04 Nov 2022 08:00:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <regressions@leemhuis.info>)
 id 1oqvMb-0007Ef-K5
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 07:59:57 -0400
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <regressions@leemhuis.info>)
 id 1oqvMZ-0003NM-PZ
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 07:59:57 -0400
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1oqvMU-0004Ta-0v; Fri, 04 Nov 2022 12:59:50 +0100
Message-ID: <db612736-1704-e2c0-0223-675f8ffacc76@leemhuis.info>
Date: Fri, 4 Nov 2022 12:59:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: Commit 'iomap: add support for dma aligned direct-io' causes
 qemu/KVM boot failures #forregzbot
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: linux-kernel@vger.kernel.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org, kvm@vger.kernel.org
References: <fb869c88bd48ea9018e1cc349918aa7cdd524931.camel@redhat.com>
 <99249078-2026-c76c-87eb-8e3ac5dde73d@leemhuis.info>
In-Reply-To: <99249078-2026-c76c-87eb-8e3ac5dde73d@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1667563195;
 05267e1a; 
X-HE-SMSGID: 1oqvMU-0004Ta-0v
Received-SPF: pass client-ip=80.237.130.52;
 envelope-from=regressions@leemhuis.info; helo=wp530.webpack.hosteurope.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

[Note: this mail is primarily send for documentation purposes and/or for
regzbot, my Linux kernel regression tracking bot. That's why I removed
most or all folks from the list of recipients, but left any that looked
like a mailing lists. These mails usually contain '#forregzbot' in the
subject, to make them easy to spot and filter out.]

On 30.09.22 13:52, Thorsten Leemhuis wrote:
> 
> Hi, this is your Linux kernel regression tracker. This might be a Qemu
> bug, but it's exposed by kernel change, so I at least want to have it in
> the tracking. I'll simply remove it in a few weeks, if it turns out that
> nobody except Maxim hits this.

There was one more report:
https://lore.kernel.org/all/20221020031725.7d01051a@xps.demsh.org/

But that's it so far. I'll put this to rest for now:

#regzbot monitor:
https://lore.kernel.org/all/20221020031725.7d01051a@xps.demsh.org/
#regzbot invalid: a kernel change exposed a bug in qemu that maybe still
needs to be fixed, *if* more people run into this



