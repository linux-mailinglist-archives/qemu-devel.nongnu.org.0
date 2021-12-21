Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E3B47BF74
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 13:13:02 +0100 (CET)
Received: from localhost ([::1]:44570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mze0r-0002K6-At
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 07:13:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1mzdzK-0000UH-JW; Tue, 21 Dec 2021 07:11:26 -0500
Received: from kerio.kamp.de ([195.62.97.192]:55184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1mzdzI-0006GB-R2; Tue, 21 Dec 2021 07:11:26 -0500
X-Footer: a2FtcC5kZQ==
Received: from [172.20.250.59] ([172.20.250.59])
 (authenticated user pl@kamp.de) by kerio.kamp.de with ESMTPSA
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits));
 Tue, 21 Dec 2021 13:11:14 +0100
Subject: Re: [PATCH v2 0/2] qemu-img convert: Fix sparseness detection
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211217164654.1184218-1-vsementsov@virtuozzo.com>
From: Peter Lieven <pl@kamp.de>
Message-ID: <5dc007a6-7d77-8bb7-e87d-3823343aee5d@kamp.de>
Date: Tue, 21 Dec 2021 13:11:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20211217164654.1184218-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.012,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, hreitz@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.12.21 um 17:46 schrieb Vladimir Sementsov-Ogievskiy:
> Hi all!
>
> 01: only update test output rebasing on master
> 02: replaced with my proposed solution.
>
> Kevin Wolf (1):
>   iotests: Test qemu-img convert of zeroed data cluster
>
> Vladimir Sementsov-Ogievskiy (1):
>   qemu-img: make is_allocated_sectors() more efficient
>
>  qemu-img.c                 | 23 +++++++++++++++++++----
>  tests/qemu-iotests/122     |  1 +
>  tests/qemu-iotests/122.out |  2 ++
>  3 files changed, 22 insertions(+), 4 deletions(-)
>
Tested-by: Peter Lieven <pl@kamp.de>



