Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D33C12D8E46
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 16:29:38 +0100 (CET)
Received: from localhost ([::1]:36394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koTJZ-0003bu-M3
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 10:29:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koTHx-0002fo-5f; Sun, 13 Dec 2020 10:27:58 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:40541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koTHv-0004DF-8r; Sun, 13 Dec 2020 10:27:56 -0500
Received: from [192.168.100.1] ([82.252.152.214]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mdf3x-1kFgdA2hrF-00ZcdW; Sun, 13 Dec 2020 16:27:41 +0100
Subject: Re: [PATCH] target/i386: tracing: format length values as hex
To: Dov Murik <dovmurik@linux.vnet.ibm.com>, qemu-devel@nongnu.org
References: <20201103100745.160409-1-dovmurik@linux.vnet.ibm.com>
 <15956748-ce3b-1ff8-ba68-66d441b7b981@linux.vnet.ibm.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <db4631ee-8748-e7fd-8c19-7d2654fe00e3@vivier.eu>
Date: Sun, 13 Dec 2020 16:27:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <15956748-ce3b-1ff8-ba68-66d441b7b981@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6JWgvJjOKHJWCD1+T+ew4t9mVk1uFYcyTrOxJPL5DJpuXT3SF1X
 R6TPFb5UomcsxdceG3W8MB3FVHNl9tcvEEmbfvjdxT/ZxPwo7gUNPc7SRBCSbJZ2Ia9iAkU
 CNtkMzyGBO8PJFrKdwJoN+DZkNouy0jETrY0WngsUBJwwBPE2SiWK69r+UZEoC8e69qYeXT
 przP1vEGA74uyu06uwm6g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TqnMl3ORGsU=:tClY+4SkoKTRT9jBSpGtsj
 P2eNyCmw4sddKXcuSbmmYWfaZhkaZ2mFo91+8dL/G/zGic3KVNA/tkS0nqpbZBH/C0Ht7T+v3
 DFhMfuupd2cpdReBedBtlOO5v8rXlXxN1FStDyYtGKSNhs9HASqJNve5FU3aK4m7SNbEoghkS
 2t+fRved10VH+Uz4wFbfsEr+LAL2eqoD4Le4QdA/FuOyjFY+r4+CYPUzQPOwfbxPvocX/NPvX
 Osunv1SFW/RZeH+LSGngvsXpoCNYgCxy859EPrkDkGYCWrQ55c/OQbEWGeeeui/3CVBympNuA
 RPXsSjqQNlPjWNT7mP8NM2ac6iIKMy0RdoljwQiGzLlm1flcIszWa7TKtc+fweMFuj/t5R36c
 mRF/6dekWLZlRe2qdpwdMLXF88qTlNdunePxLmGICncwx+ig/Ve4+wjF3hM5JXT/ToGeEmlb0
 QNj2cJ/pGQ==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Le 09/12/2020 à 18:58, Dov Murik a écrit :
> ping
> 
> Adding CC qemu-trivial.
> 
> This already got one R-b:
> https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg00525.html
> 
> -Dov
> 
> 
> On 03/11/2020 12:07, Dov Murik wrote:
>> Three trace events had a literal "0x" prefix but the 'len' values were
>> formatted in decimal base.  Keep the prefix and format the numbers as
>> hex, as is usually the case for length of memory regions.
>>
>> Signed-off-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
>> ---
>>   target/i386/trace-events | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/i386/trace-events b/target/i386/trace-events
>> index 789c700d4a..65c9b0fdda 100644
>> --- a/target/i386/trace-events
>> +++ b/target/i386/trace-events
>> @@ -8,10 +8,10 @@ kvm_x86_update_msi_routes(int num) "Updated %d MSI routes"
>>
>>   # sev.c
>>   kvm_sev_init(void) ""
>> -kvm_memcrypt_register_region(void *addr, size_t len) "addr %p len 0x%zu"
>> -kvm_memcrypt_unregister_region(void *addr, size_t len) "addr %p len 0x%zu"
>> +kvm_memcrypt_register_region(void *addr, size_t len) "addr %p len 0x%zx"
>> +kvm_memcrypt_unregister_region(void *addr, size_t len) "addr %p len 0x%zx"
>>   kvm_sev_change_state(const char *old, const char *new) "%s -> %s"
>>   kvm_sev_launch_start(int policy, void *session, void *pdh) "policy 0x%x session %p pdh %p"
>> -kvm_sev_launch_update_data(void *addr, uint64_t len) "addr %p len 0x%" PRIu64
>> +kvm_sev_launch_update_data(void *addr, uint64_t len) "addr %p len 0x%" PRIx64
>>   kvm_sev_launch_measurement(const char *value) "data %s"
>>   kvm_sev_launch_finish(void) ""
>>
> 

Applied to my linux-user-for-6.0 branch.

Thanks,
Laurent


