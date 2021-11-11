Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD19344D550
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 11:52:00 +0100 (CET)
Received: from localhost ([::1]:38258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml7gV-0008MR-Sp
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 05:51:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1ml7fX-0007b3-0P
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 05:50:59 -0500
Received: from mail.ispras.ru ([83.149.199.84]:54696)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1ml7fV-0007mW-1E
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 05:50:58 -0500
Received: from [10.12.102.111] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id E32F840755CE;
 Thu, 11 Nov 2021 10:50:51 +0000 (UTC)
Subject: Re: [PATCH v2 0/3] Some watchpoint-related patches
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <163662450348.125458.5494710452733592356.stgit@pasha-ThinkPad-X280>
 <e8038316-d698-043e-a61f-96915d91b4ba@redhat.com>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <6652cec8-4792-e3b0-83eb-1130f3a11bf3@ispras.ru>
Date: Thu, 11 Nov 2021 13:50:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e8038316-d698-043e-a61f-96915d91b4ba@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.999,
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, alex.bennee@linaro.org,
 peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.11.2021 13:48, David Hildenbrand wrote:
> On 11.11.21 10:55, Pavel Dovgalyuk wrote:
>> The series includes several watchpoint-related patches.
>>
>> v2 changes:
>>   - added patch to fix races with interrupts
>>   - added patch to process watchpoints-on-stack
>>   - removed upstreamed patches
> 
> Out of interest, do we have any reproducer / tests for this?
> 

I guess no.


