Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEC21508E9
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 15:59:32 +0100 (CET)
Received: from localhost ([::1]:42710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iydCF-0003n0-4x
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 09:59:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47576)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iydAu-0002Sy-A9
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 09:58:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iydAr-0005IZ-R8
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 09:58:07 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:26452
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iydAr-0005H9-JG
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 09:58:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580741884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=W+gjqQnI9kUpgMCKGC/8vCxlQu5hdZ3F+y5y9o4LZAs=;
 b=Tt5ksPk6/NTLnrZw2OpxS2H/c1FgkbYLLWxd8A0QWEg7WlJyaJkLwtRtHqS6RyFeYDT4re
 nPgMZtt50NTZfGdLQJMuDT9Ug1drOlw+Dj6coH5cBNTx2CJn3VEnP5qIO9QHFezLKTtuTJ
 Hv9TvMpdujioVIfHplhNN5yV0HDFeQc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-juRkoRywPsKYOJ739_Wetw-1; Mon, 03 Feb 2020 09:58:03 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7C6C1413;
 Mon,  3 Feb 2020 14:58:01 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-129.ams2.redhat.com [10.36.116.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 13D421000322;
 Mon,  3 Feb 2020 14:58:00 +0000 (UTC)
Subject: Re: [PULL 00/13] qtests, kconfig and misc patches
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200203123811.8651-1-thuth@redhat.com>
 <CAFEAcA_1KYRA=87k34zCRLqCf1tWHrULGZPcHeKwJZhDUx0=kw@mail.gmail.com>
 <2fd63018-b9f9-ab88-2d65-009c54bb6cf2@redhat.com>
 <CAFEAcA_XKAeT10p+XNRjQeOjoGYX1Q-D+kj9E0kFx2AxtktACg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <276a50ab-3e63-1542-5715-d61e238fd2d5@redhat.com>
Date: Mon, 3 Feb 2020 15:57:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_XKAeT10p+XNRjQeOjoGYX1Q-D+kj9E0kFx2AxtktACg@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: juRkoRywPsKYOJ739_Wetw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/02/2020 15.50, Peter Maydell wrote:
> On Mon, 3 Feb 2020 at 14:30, Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 03/02/2020 15.04, Peter Maydell wrote:
>>> On Mon, 3 Feb 2020 at 12:38, Thomas Huth <thuth@redhat.com> wrote:
>>>>
>>>>  Hi Peter,
>>>>
>>>> the following changes since commit 28db64fce555a03b4ca256d5b6f4290abdfbd9e8:
>>>>
>>>>   Merge remote-tracking branch 'remotes/stefanha/tags/tracing-pull-request' into staging (2020-01-31 17:37:00 +0000)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>   https://gitlab.com/huth/qemu.git tags/pull-request-2020-02-03
>>>>
>>>> for you to fetch changes up to 585c138628bbf22ea8e740b2f4f1a3ed0274ebe8:
>>>>
>>>>   trivial: Remove xenfb_enabled from sysemu.h (2020-02-03 10:33:57 +0100)
>>>>
>>>> ----------------------------------------------------------------
>>>> * Current qtests queue
>>>> * Some Kconfig updates
>>>> * Some trivial clean-ups here and there
>>>> ----------------------------------------------------------------
>>>
>>> All the incremental rebuilds failed:
>>>
>>> Linux cam-vm-266 4.15.0-70-generic x86_64
>>> From git://git-us.linaro.org/people/pmaydell/qemu-arm
>>>    f31160c7d1..f9e931a1d9  staging    -> pmaydell/staging
>>> make: Entering directory '/home/petmay01/qemu-for-merges/build/w64'
>>> make[1]: Entering directory '/home/petmay01/qemu-for-merges/slirp'
>>> make[1]: Nothing to be done for 'all'.
>>> make[1]: Leaving directory '/home/petmay01/qemu-for-merges/slirp'
>>>   CC      qga/main.o
>>>   CC      stubs/machine-init-done.o
>>>   CC      stubs/replay-user.o
>>>   CC      stubs/semihost.o
>>>   CC      qemu-img.o
>>>   CC      qemu-io.o
>>>   CC      chardev/char.o
>>> make: *** No rule to make target
>>> '/home/petmay01/qemu-for-merges/hw/bt/Kconfig', needed by
>>> 'aarch64-softmmu/config-devices.mak'.  Stop.
>>> make: *** Waiting for unfinished jobs....
>>>   CC      chardev/char-mux.o
>>> make: Leaving directory '/home/petmay01/qemu-for-merges/build/w64'
>>
>> Oh, they are still failing??? Why are there still references to
>> hw/bt/Kconfig in these config-devices.mak files, I'd expect that they
>> would have been regenerated at least once during the past week?
> 
> build/all/aarch64-softmmu/config-devices.mak.d was most recently
> touched this morning, and it still includes hw/bt/Kconfig in its
> dependency list. I think this is because minikconf will still put
> a Kconfig file into the .d file it generates even if the Kconfig
> file happens to be empty.

Oh, that's very weird. minikconf should only do that if the file is
included somewhere, but the inclusion of hw/bt/Kconfig has been removed
in 1d4ffe8dc77cbc9aafe8bcf514ca0e43f85aaae3 already, so this really
should not happen anymore...

 Thomas


