Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7842D8E7F
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 17:06:16 +0100 (CET)
Received: from localhost ([::1]:40402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koTt1-0002tQ-Q6
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 11:06:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koTr0-0001Mo-TY; Sun, 13 Dec 2020 11:04:10 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:59173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koTqw-0008FC-Uq; Sun, 13 Dec 2020 11:04:10 -0500
Received: from [192.168.100.1] ([82.252.152.214]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Ml6i4-1kPHV90kCC-00lW9R; Sun, 13 Dec 2020 17:03:55 +0100
Subject: Re: [PATCH] target/i386: tracing: format length values as hex
From: Laurent Vivier <laurent@vivier.eu>
To: Dov Murik <dovmurik@linux.vnet.ibm.com>, qemu-devel@nongnu.org
References: <20201103100745.160409-1-dovmurik@linux.vnet.ibm.com>
 <15956748-ce3b-1ff8-ba68-66d441b7b981@linux.vnet.ibm.com>
 <db4631ee-8748-e7fd-8c19-7d2654fe00e3@vivier.eu>
Message-ID: <a788d82d-a9c2-7b65-176f-7f9e0cb65283@vivier.eu>
Date: Sun, 13 Dec 2020 17:03:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <db4631ee-8748-e7fd-8c19-7d2654fe00e3@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8XhBWyp2QFN2IoRCNEqdTGYtm2ViC+cKfL7ccIPXWJQNFhrFP+0
 fmuSjaHVz+04yADdRdeA8K6/2xJqmOEZUt2h+/y3mOEa6ETC6LfovmX/g+XcNoAYFubaT7f
 Z4yLy2wZNzk7XHL/ZuwW9Pi2eQlBjI6gK+VEBRjI7myG54DylyKiMgxE9I37RCFhPhPnijD
 3KRnkep9eJCDRqoNgt8Ug==
X-UI-Out-Filterresults: notjunk:1;V03:K0:t44hNjzd3fo=:qO2sp6cyTrO78iw3wOr6o8
 zCOfSRJfTfEdbYl6k/v0C2n1/Az470FQZw2qlhOZ0mPVS0NrlE7MQUhLJQxDadiZxgY5T+3tv
 cTqKoEWr/hgx8I2Exn9naw6eq7RW28GrAS0TT5RoFiw2gVEIJfkXAVww/6a46Ll21547KI2dw
 +J7RWFJSuEGgtMvs/8zVpp2asf6XMjpvt57Nwl/L23+o9tFyc0nZ6HVU/wjoi2LvLdqsSGdpa
 ST48ZynPQ6n7mIN5Twhzw1ZLejxIzI0m6seKFCRcxdbe82fPCsUUnhGAZy+YdncwcKY7wK/Uw
 65WxtZdNTjqbDrE6zwxUptPykT+2aVuqlybwl+M3uyt2xO0lYi3AOO+UeqW60mVHS3HgfuziR
 SVwh8bHc6VLRAuXSTQlAUMgYFJm16amD/Urj2z9VZPpKS/QBD+CpWTGCfKAiyrhyYc1sjIyn3
 89S5AqcUiA==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 13/12/2020 à 16:27, Laurent Vivier a écrit :
> Le 09/12/2020 à 18:58, Dov Murik a écrit :
>> ping
>>
>> Adding CC qemu-trivial.
>>
>> This already got one R-b:
>> https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg00525.html
>>
>> -Dov
>>
>>
>> On 03/11/2020 12:07, Dov Murik wrote:
>>> Three trace events had a literal "0x" prefix but the 'len' values were
>>> formatted in decimal base.  Keep the prefix and format the numbers as
>>> hex, as is usually the case for length of memory regions.
>>>
>>> Signed-off-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
>>> ---
>>>   target/i386/trace-events | 6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/target/i386/trace-events b/target/i386/trace-events
>>> index 789c700d4a..65c9b0fdda 100644
>>> --- a/target/i386/trace-events
>>> +++ b/target/i386/trace-events
>>> @@ -8,10 +8,10 @@ kvm_x86_update_msi_routes(int num) "Updated %d MSI routes"
>>>
>>>   # sev.c
>>>   kvm_sev_init(void) ""
>>> -kvm_memcrypt_register_region(void *addr, size_t len) "addr %p len 0x%zu"
>>> -kvm_memcrypt_unregister_region(void *addr, size_t len) "addr %p len 0x%zu"
>>> +kvm_memcrypt_register_region(void *addr, size_t len) "addr %p len 0x%zx"
>>> +kvm_memcrypt_unregister_region(void *addr, size_t len) "addr %p len 0x%zx"
>>>   kvm_sev_change_state(const char *old, const char *new) "%s -> %s"
>>>   kvm_sev_launch_start(int policy, void *session, void *pdh) "policy 0x%x session %p pdh %p"
>>> -kvm_sev_launch_update_data(void *addr, uint64_t len) "addr %p len 0x%" PRIu64
>>> +kvm_sev_launch_update_data(void *addr, uint64_t len) "addr %p len 0x%" PRIx64
>>>   kvm_sev_launch_measurement(const char *value) "data %s"
>>>   kvm_sev_launch_finish(void) ""
>>>
>>
> 
> Applied to my linux-user-for-6.0 branch.

s/linux-user-for-6.0/trivial-patches/


