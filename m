Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF0933D98D
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 17:36:43 +0100 (CET)
Received: from localhost ([::1]:38640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMCgT-0002M9-9T
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 12:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <reinoud@diablo.13thmonkey.org>)
 id 1lMCXE-0007xn-NZ
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 12:27:08 -0400
Received: from 13thmonkey.org ([80.100.255.32]:58582
 helo=diablo.13thmonkey.org) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <reinoud@diablo.13thmonkey.org>) id 1lMCXC-0005XP-UP
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 12:27:08 -0400
Received: by diablo.13thmonkey.org (Postfix, from userid 103)
 id D2AFDC13ADF; Tue, 16 Mar 2021 17:27:04 +0100 (CET)
Date: Tue, 16 Mar 2021 17:27:04 +0100
From: Reinoud Zandijk <reinoud@NetBSD.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Windows 10 won't run on default x86_64 machine anymore
Message-ID: <YFDcWFNyq7dH3ZAS@diablo.13thmonkey.org>
References: <YE+SHIG8qQFMsEJl@diablo.13thmonkey.org>
 <20210315185302.29b0d90d@redhat.com>
 <YE/fUQRiFBfrWi5W@dropje.13thmonkey.org>
 <20210316015503.GA1008366@private.email.ne.jp>
 <20210316131304.220a53b9@redhat.com>
 <9e2e1d83-29c1-053a-fd43-187f6f824b39@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e2e1d83-29c1-053a-fd43-187f6f824b39@redhat.com>
Received-SPF: none client-ip=80.100.255.32;
 envelope-from=reinoud@diablo.13thmonkey.org; helo=diablo.13thmonkey.org
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 Isaku Yamahata <isaku.yamahata@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 16, 2021 at 01:49:57PM +0100, Paolo Bonzini wrote:
> On 16/03/21 13:13, Igor Mammedov wrote:
> > > Although I don't know about nvmm case, this function also needs to be updated
> > > if smi isn't supported.
> > can you submit a patch for this please?

> nvmm is not part of upstream yet, so I guess it's up to Reinoud to fix it.
> Still, reproducing his testing conditions with KVM and -M smm=off is
> probably interesting because it also affects HAX, HVF and WHPX which are
> supported upstream.

As stated in my other mail, I think NVMM supports the SMI. We would have liked
to add NVMM in the comming 6.0 release but I see we missed the timeframe as
the soft feature freeze date is today.

It was posted here some months before but somehow it got stalled and when the
main NVMM developer left the project to persuit other things it kind of
stalled. I've now forward ported NVMM support to todays Qemu sources.

With regards,
Reinoud


