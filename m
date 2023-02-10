Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC94691B69
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 10:33:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQPmA-0006VI-Ku; Fri, 10 Feb 2023 04:33:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pQPm7-0006V0-PR; Fri, 10 Feb 2023 04:32:59 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pQPm6-0001UY-1w; Fri, 10 Feb 2023 04:32:59 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 83E03400BA;
 Fri, 10 Feb 2023 12:32:48 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id D1952F;
 Fri, 10 Feb 2023 12:32:47 +0300 (MSK)
Message-ID: <0dd85902-0071-a915-2655-8aff8d0074d1@msgid.tls.msk.ru>
Date: Fri, 10 Feb 2023 12:32:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PULL 01/30] migration: Fix migration crash when target psize
 larger than host
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, qemu-stable@nongnu.org
References: <20230207005650.1810-1-quintela@redhat.com>
 <20230207005650.1810-2-quintela@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20230207005650.1810-2-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -79
X-Spam_score: -8.0
X-Spam_bar: --------
X-Spam_report: (-8.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.148,
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

07.02.2023 03:56, Juan Quintela wrote:
> From: Peter Xu <peterx@redhat.com>
> 
> Commit d9e474ea56 overlooked the case where the target psize is even larger
> than the host psize.  One example is Alpha has 8K page size and migration
> will start to crash the source QEMU when running Alpha migration on x86.
> 
> Fix it by detecting that case and set host start/end just to cover the
> single page to be migrated.

FWIW, commit in question, which is d9e474ea56, has been applied after the
last released version to date, which is 7.2.0.  So I guess this change is
not applicable to -stable.

/mjt

