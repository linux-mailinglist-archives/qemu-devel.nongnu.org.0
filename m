Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F6A6C66BC
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 12:36:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfJD9-0006MW-Jn; Thu, 23 Mar 2023 07:34:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pfJD5-0006M5-6C
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 07:34:23 -0400
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pfJD3-0004oJ-4Y
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 07:34:22 -0400
Received: from [78.40.148.178] (helo=webmail.codethink.co.uk)
 by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1pfJCs-006ci6-7c; Thu, 23 Mar 2023 11:34:10 +0000
MIME-Version: 1.0
Date: Thu, 23 Mar 2023 11:34:09 +0000
From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
To: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Cc: qemu-devel@nongnu.org, dickon.hood@codethink.co.uk,
 nazar.kazakov@codethink.co.uk, kiran.ostrolenk@codethink.co.uk,
 frank.chang@sifive.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, pbonzini@redhat.com, philipp.tomsich@vrull.eu,
 kvm@vger.kernel.org
Subject: Re: [PATCH 02/45] target/riscv: Refactor some of the generic vector
 functionality
In-Reply-To: <CAEg0e7j=yGrz6uSCZirthZB7FEF-BtB73e+D-UB_hXQTJEtmyw@mail.gmail.com>
References: <20230310160346.1193597-1-lawrence.hunter@codethink.co.uk>
 <20230310160346.1193597-3-lawrence.hunter@codethink.co.uk>
 <CAEg0e7j=yGrz6uSCZirthZB7FEF-BtB73e+D-UB_hXQTJEtmyw@mail.gmail.com>
Message-ID: <494bdf70499cc02f4e03135e4eee45f6@codethink.co.uk>
X-Sender: lawrence.hunter@codethink.co.uk
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=78.40.148.171;
 envelope-from=lawrence.hunter@codethink.co.uk; helo=imap5.colo.codethink.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 21/03/2023 12:02, Christoph Müllner wrote:
> On Fri, Mar 10, 2023 at 5:06 PM Lawrence Hunter
> <lawrence.hunter@codethink.co.uk> wrote:
>> 
>> From: Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>
>> 
>> Summary of refactoring:
>> 
>> * take some functions/macros out of `vector_helper` and put them in a
>> new module called `vector_internals`
>> 
>> * factor the non SEW-specific stuff out of `GEN_OPIVV_TRANS` into
>> function `opivv_trans` (similar to `opivi_trans`)
> 
> I think splitting this commit into two changes would be better.
> Besides that the two changes look reasonable and correct.

Makes sense, we can do this

Best,
Lawrence

