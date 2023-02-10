Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6285A692230
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 16:29:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQVKV-00059D-NI; Fri, 10 Feb 2023 10:28:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pQVKM-00057v-Ez; Fri, 10 Feb 2023 10:28:42 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pQVKK-0003qm-Gr; Fri, 10 Feb 2023 10:28:42 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 3E78A400BA;
 Fri, 10 Feb 2023 18:28:37 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 1F960F;
 Fri, 10 Feb 2023 18:28:36 +0300 (MSK)
Message-ID: <357699ba-2949-2c4e-fd65-1ff078718792@msgid.tls.msk.ru>
Date: Fri, 10 Feb 2023 18:28:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PULL 01/30] migration: Fix migration crash when target psize
 larger than host
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org
References: <20230207005650.1810-1-quintela@redhat.com>
 <20230207005650.1810-2-quintela@redhat.com>
 <0dd85902-0071-a915-2655-8aff8d0074d1@msgid.tls.msk.ru>
 <87ilg9iutl.fsf@secure.mitica> <Y+ZcVkhRr8rYU6Az@x1n>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <Y+ZcVkhRr8rYU6Az@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -79
X-Spam_score: -8.0
X-Spam_bar: --------
X-Spam_report: (-8.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.149,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

10.02.2023 18:01, Peter Xu пишет:

> Thanks, Juan.
> 
> I think Michael was correct that d9e474ea56 is only merged after our most
> recent release (which is v7.2.0).  So it doesn't need to have stable copied
> (aka, it doesn't need to be applied to any QEMU's stable tree).
> 
> Juan, could you help drop the "cc: stable" line if the pull is going to
> have a new version?

It has been applied to master already, - this is where I picked it from.

> Side note: I think in the case where we have wrongly have the cc:stable it
> shouldn't hurt either, because when the stable tree tries to pick it up
> it'll find it doesn't apply at all, then a downstream-only patch will be
> needed, then we'll also figure all things out, just later.

There's absolutely nothing wrong with that.  I was just not sure about my
own sanity here, and decided to ask.  Maybe the problem was deeper and a
more careful backport is needed.

Speaking of -stable, on my view, it is better if "too many" things will be
tagged for it and filtered out, than some important things will not be
tagged.

Thank you!

/mjt

