Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 661B46365DC
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 17:31:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxsdm-0002cn-DC; Wed, 23 Nov 2022 11:30:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oxsdZ-0002ZK-HP; Wed, 23 Nov 2022 11:30:14 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oxsdW-0008CD-OT; Wed, 23 Nov 2022 11:30:13 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 8789274633D;
 Wed, 23 Nov 2022 17:29:27 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 3B60D74632B; Wed, 23 Nov 2022 17:29:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 37EFA746307;
 Wed, 23 Nov 2022 17:29:27 +0100 (CET)
Date: Wed, 23 Nov 2022 17:29:27 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Markus Armbruster <armbru@redhat.com>
cc: =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v2] Drop more useless casts from void * to pointer
In-Reply-To: <871qpt674n.fsf@pond.sub.org>
Message-ID: <6faedfd0-c77c-5ac5-7dfd-32a15c10dae7@eik.bme.hu>
References: <20221123133811.1398562-1-armbru@redhat.com>
 <alpine.LMD.2.03.2211231441480.26886@eik.bme.hu>
 <Y34on7NQk44e07cM@redhat.com> <871qpt674n.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1544100467-1669220967=:47673"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1544100467-1669220967=:47673
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 23 Nov 2022, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
>> On Wed, Nov 23, 2022 at 02:51:49PM +0100, BALATON Zoltan wrote:
>>> On Wed, 23 Nov 2022, Markus Armbruster wrote:
>>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>>> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>>>> ---
>>>> v2:
>>>> * PATCH 1+2 merged as commit 0a553c12c7 and 3f7febc937
>>>> * PATCH 3 change to util/coroutine-ucontext.c dropped [Laurent]
>>>>
>>>> bsd-user/elfload.c                      | 2 +-
>>>> contrib/plugins/cache.c                 | 8 ++++----
>>>> contrib/vhost-user-blk/vhost-user-blk.c | 2 +-
>>>> hw/core/qdev-clock.c                    | 2 +-
>>>> hw/hyperv/vmbus.c                       | 2 +-
>>>> hw/net/cadence_gem.c                    | 2 +-
>>>> hw/net/virtio-net.c                     | 2 +-
>>>> hw/nvme/ctrl.c                          | 4 ++--
>>>> hw/rdma/vmw/pvrdma_cmd.c                | 9 +++------
>>>> hw/rdma/vmw/pvrdma_qp_ops.c             | 6 +++---
>>>> hw/virtio/virtio-iommu.c                | 3 +--
>>>> linux-user/syscall.c                    | 2 +-
>>>> target/i386/hax/hax-all.c               | 2 +-
>>>> tests/tcg/aarch64/system/semiheap.c     | 4 ++--
>>>> util/vfio-helpers.c                     | 2 +-
>>>> 15 files changed, 24 insertions(+), 28 deletions(-)
>>>>
>>>> diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
>>>> index f8edb22f2a..fbcdc94b96 100644
>>>> --- a/bsd-user/elfload.c
>>>> +++ b/bsd-user/elfload.c
>>>> @@ -156,7 +156,7 @@ static abi_ulong copy_elf_strings(int argc, char **argv, void **page,
>>>>             --p; --tmp; --len;
>>>>             if (--offset < 0) {
>>>>                 offset = p % TARGET_PAGE_SIZE;
>>>> -                pag = (char *)page[p / TARGET_PAGE_SIZE];
>>>> +                pag = page[p / TARGET_PAGE_SIZE];
>>>
>>> I think arithmetic on void pointer was undefined at least in the past so
>>> some compilers may warn for it but not sure if this is still the case for
>>> the compilers we care about. Apparently not if this now compiles but that
>>> explains why this cast was not useless.
>
> I don't think so :)
>
> @pag is char *.
>
> @page is void **.
>
> page[p / TARGET_PAGE_SIZE] is void *.  No need to cast to char * before
> assigning to @pag.

You are right. Although I'm not sure what page[] counts as because it adds 
an offset to the pointer but [] is higher priority than (type) cast so it 
does not matter and that cast is not needed here then. Maybe I should be 
more attentive to details but I did not take the time to look at it more 
carefully. I did not say we should keep the cast anyway (considering only 
gcc and clang are targeted), I was just trying to understand why it might 
have been there in the first place.

Regards,
BALATON Zoltan

> No pointer arithmetic so far.  There's some further down: pag + offset.
> @pag is char * before and after my patch.
>
>>>                                         Found some more info on this here:
>>>
>>> https://stackoverflow.com/questions/3523145/pointer-arithmetic-for-void-pointer-in-c
>>
>> QEMU explicitly only targets GCC + Clang, so portability to other
>> compilers is not required.
>
> Correct.  We do arithmentic with void * in many places already.
>
> If we cared for portability to other compilers, we'd enable
>
> '-Wpointer-arith'
>     Warn about anything that depends on the "size of" a function type
>     or of 'void'.  GNU C assigns these types a size of 1, for
>     convenience in calculations with 'void *' pointers and pointers to
>     functions.  In C++, warn also when an arithmetic operation involves
>     'NULL'.  This warning is also enabled by '-Wpedantic'.
>
> But we don't.
>
>
--3866299591-1544100467-1669220967=:47673--

