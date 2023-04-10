Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F6C6DCA52
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 20:04:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plvqx-00078P-Pz; Mon, 10 Apr 2023 14:02:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1plvqr-00075N-Sh; Mon, 10 Apr 2023 14:02:53 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1plvqp-0004qh-R7; Mon, 10 Apr 2023 14:02:49 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 2E281400F6;
 Mon, 10 Apr 2023 21:02:45 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id D25BEDD;
 Mon, 10 Apr 2023 21:02:43 +0300 (MSK)
Message-ID: <e2d5ae5f-882b-2ec3-2055-5d1594f3bf64@msgid.tls.msk.ru>
Date: Mon, 10 Apr 2023 21:02:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1] hw/pvrdma: Protect against buggy or malicious guest
 driver
Content-Language: en-US
From: Michael Tokarev <mjt@tls.msk.ru>
To: Yuval Shaia <yuval.shaia.ml@gmail.com>, qemu-devel@nongnu.org,
 soulchen8650@gmail.com, mcascell@redhat.com, qemu-security@nongnu.org,
 marcel.apfelbaum@gmail.com
References: <20230301142926.18686-1-yuval.shaia.ml@gmail.com>
 <81e6d05f-a540-8ca5-4f0b-f8eafba4315a@msgid.tls.msk.ru>
In-Reply-To: <81e6d05f-a540-8ca5-4f0b-f8eafba4315a@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -100
X-Spam_score: -10.1
X-Spam_bar: ----------
X-Spam_report: (-10.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.246,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

10.04.2023 20:48, Michael Tokarev wrote:
> 01.03.2023 17:29, Yuval Shaia wrote:
>> Guest driver allocates and initialize page tables to be used as a ring
>> of descriptors for CQ and async events.
>> The page table that represents the ring, along with the number of pages
>> in the page table is passed to the device.
>> Currently our device supports only one page table for a ring.
>>
>> Let's make sure that the number of page table entries the driver
>> reports, do not exceeds the one page table size.
> 
> Ping? This seems to has been missing..

This is CVE-2023-1544, which can be mentioned in the subject line at
patch apply.

/mjt


