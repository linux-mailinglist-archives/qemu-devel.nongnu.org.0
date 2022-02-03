Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B6F4A834E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 12:49:07 +0100 (CET)
Received: from localhost ([::1]:55966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFabq-0004lT-A3
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 06:49:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1nFaWk-0002z7-Ls; Thu, 03 Feb 2022 06:43:50 -0500
Received: from kerio.kamp.de ([195.62.97.192]:41704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1nFaWd-0003HU-Co; Thu, 03 Feb 2022 06:43:45 -0500
X-Footer: a2FtcC5kZQ==
Received: from [172.20.250.34] ([172.20.250.34])
 (authenticated user pl@kamp.de) by kerio.kamp.de with ESMTPSA
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits));
 Thu, 3 Feb 2022 12:42:30 +0100
Subject: Re: [PATCH V2 for-6.2 0/2] fixes for bdrv_co_block_status
To: Kevin Wolf <kwolf@redhat.com>
References: <20220113144426.4036493-1-pl@kamp.de> <YflB4LKDdf8ay1PU@redhat.com>
From: Peter Lieven <pl@kamp.de>
Message-ID: <98d5f022-e1c7-83b4-a043-ce63e8b6f38e@kamp.de>
Date: Thu, 3 Feb 2022 12:42:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YflB4LKDdf8ay1PU@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: idryomov@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 ct@flyingcircus.io, qemu-devel@nongnu.org, idryomov@gmail.coms,
 pbonzini@redhat.com, mreitz@redhat.com, dillaman@redhat.com,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 01.02.22 um 15:39 schrieb Kevin Wolf:
> Am 13.01.2022 um 15:44 hat Peter Lieven geschrieben:
>> V1->V2:
>>  Patch 1: Treat a hole just like an unallocated area. [Ilya]
>>  Patch 2: Apply workaround only for pre-Quincy librbd versions and
>>           ensure default striping and non child images. [Ilya]
>>
>> Peter Lieven (2):
>>   block/rbd: fix handling of holes in .bdrv_co_block_status
>>   block/rbd: workaround for ceph issue #53784
> Thanks, applied to the block branch.
>
> Kevin
>
Hi Kevin,


thanks for taking care of this. I was a few days out of office.

@Stefano: it seems Kevin addresses your comments that should have gone into a V3.


Best,

Peter



