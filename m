Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C49AB8F65
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Sep 2019 14:01:05 +0200 (CEST)
Received: from localhost ([::1]:58184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBHay-0001uN-6l
	for lists+qemu-devel@lfdr.de; Fri, 20 Sep 2019 08:01:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41370)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iBHZF-0001Q1-58
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 07:59:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iBHZD-0000fx-Cm
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 07:59:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42048)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1iBHZD-0000fE-5q; Fri, 20 Sep 2019 07:59:15 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 309F7883825;
 Fri, 20 Sep 2019 11:59:14 +0000 (UTC)
Received: from [10.36.117.96] (ovpn-117-96.ams2.redhat.com [10.36.117.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10E9A5D6B0;
 Fri, 20 Sep 2019 11:59:12 +0000 (UTC)
Subject: Re: [PULL 00/34] s390x update
From: David Hildenbrand <david@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
References: <20190919124115.11510-1-cohuck@redhat.com>
 <CAFEAcA-WLayY+jL9mKV6zrstSZOynja7=k6Cjx4wR9g33jFPQA@mail.gmail.com>
 <20190920130038.4eaad8f0.cohuck@redhat.com>
 <2b470747-b881-d7e6-1c8c-0a446b044fb9@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <8050fccb-e39f-1745-0728-129e42222ef1@redhat.com>
Date: Fri, 20 Sep 2019 13:59:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2b470747-b881-d7e6-1c8c-0a446b044fb9@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Fri, 20 Sep 2019 11:59:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-s390x <qemu-s390x@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.09.19 13:51, David Hildenbrand wrote:
> On 20.09.19 13:00, Cornelia Huck wrote:
>> On Fri, 20 Sep 2019 11:45:18 +0100
>> Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>>> On Thu, 19 Sep 2019 at 13:41, Cornelia Huck <cohuck@redhat.com> wrote:
>>>>
>>>> The following changes since commit f8c3db33a5e863291182f8862ddf81618a7c6194:
>>>>
>>>>   target/sparc: Switch to do_transaction_failed() hook (2019-09-17 12:01:00 +0100)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>   https://github.com/cohuck/qemu tags/s390x-20190919
>>>>
>>>> for you to fetch changes up to 37105adebeb28e60da3cb1ef82231d7ed8d23589:
>>>>
>>>>   Merge tag 'tags/s390-ccw-bios-2019-09-18' into s390-next-staging (2019-09-19 12:04:01 +0200)
>>>>
>>>> ----------------------------------------------------------------
>>>> - bugfixes in tcg and the ccw bios
>>>> - gen15a is called z15
>>>> - officially require a 3.15 kernel or later for kvm
>>>>
>>>> ----------------------------------------------------------------  
>>>
>>> Hi -- I'm afraid this pullreq results in new warnings from
>>> the runtime-sanitizer build when 'make check' is run:
>>> MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
>>> QTEST_QEMU_BINARY=s390x-softmmu/qemu-system-s390x
>>> QTEST_QEMU_IMG=qemu-img tests
>>> /boot-serial-test -m=quick -k --tap < /dev/null |
>>> ./scripts/tap-driver.pl --test-name="boot-serial-test"
>>> /home/petmay01/linaro/qemu-for-merges/target/s390x/mem_helper.c:293:17:
>>> runtime error: null pointer passed as argument 1, which is declared to
>>> never be null
>>> /usr/include/string.h:47:14: note: nonnull attribute specified here
>>> /home/petmay01/linaro/qemu-for-merges/target/s390x/mem_helper.c:293:32:
>>> runtime error: null pointer passed as argument 2, which is declared to
>>> never be null
>>>
>>> (and the same warnings for a few other tests).
>>>
>>> Looks like you sometimes can pass NULL pointers to the source
>>> and destination of memmove(). This isn't permitted by the
>>> standard even in the case where the size argument is zero.
>>>
>>> thanks
>>> -- PMM
>>
>> David, can you take a look?
>>
> 
> I would have assumed these pointers are ignored in case the length is
> zero, too (the only way this can happen). Easy to fix.
> 


diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index e50cec9263..ef8e0c20a7 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -290,17 +290,23 @@ static void access_memmove(CPUS390XState *env, S390Access *desta,
 
     if (srca->size1 == desta->size1) {
         memmove(desta->haddr1, srca->haddr1, srca->size1);
-        memmove(desta->haddr2, srca->haddr2, srca->size2);
+        if (likely(srca->size2)) {
+            memmove(desta->haddr2, srca->haddr2, srca->size2);
+        }
     } else if (srca->size1 < desta->size1) {
         diff = desta->size1 - srca->size1;
         memmove(desta->haddr1, srca->haddr1, srca->size1);
         memmove(desta->haddr1 + srca->size1, srca->haddr2, diff);
-        memmove(desta->haddr2, srca->haddr2 + diff, desta->size2);
+        if (likely(desta->size2)) {
+            memmove(desta->haddr2, srca->haddr2 + diff, desta->size2);
+        }
     } else {
         diff = srca->size1 - desta->size1;
         memmove(desta->haddr1, srca->haddr1, desta->size1);
         memmove(desta->haddr2, srca->haddr1 + desta->size1, diff);
-        memmove(desta->haddr2 + diff, srca->haddr2, srca->size2);
+        if (likely(srca->size2)) {
+            memmove(desta->haddr2 + diff, srca->haddr2, srca->size2);
+        }
     }
 }

For "s390x/tcg: Fault-safe memmove" should do the trick. Will test.

-- 

Thanks,

David / dhildenb

