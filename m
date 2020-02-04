Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 587F9151F68
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Feb 2020 18:27:03 +0100 (CET)
Received: from localhost ([::1]:35024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iz1yY-0001FE-CN
	for lists+qemu-devel@lfdr.de; Tue, 04 Feb 2020 12:27:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54307)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iz1it-0005iO-Fp
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 12:10:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iz1is-0006q4-A5
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 12:10:51 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:25331
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iz1is-0006oH-5o
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 12:10:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580836249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5SkhjXObjuuy/G7nNuKj07v7uDQnfJxZu+/xooNZT0g=;
 b=Rm8zhoLqj4p2N4x4lsU7DiruGNKa2ikrc4c4sqMTQ3ILLYvxD/ipzJASzXhBrR5DoChnYG
 nFtEeQfGRIpDSYuegUaMgGreu7R8ZWQcWTtj2gX5yRNPPq+CSkczz9PcseATw8ULYmr092
 rpqdOB9ZupRyxSrLI6QtePkKuObdgJ0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-mJq5s8jBPeWazFud9LRC7w-1; Tue, 04 Feb 2020 12:10:47 -0500
Received: by mail-wr1-f70.google.com with SMTP id u18so10535563wrn.11
 for <qemu-devel@nongnu.org>; Tue, 04 Feb 2020 09:10:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dFGbir/CzbHmLSxtaR+BN6yngAS/SJ+eJR6Zssjzxj4=;
 b=hxh5bFL6EHh50/8IaG1g6T8JwfReEs7uklBQZpOYI4d8AJWFqflOFkKqqtYN+ZoX3n
 x1KYbuV/dUARSxtbS46PgRGmmwi2DBj6PCs1YOYBnHMkGRXOCIr0Jqwr5IX4m9X3HcCE
 1I4yWNXpudnrIBoqkTMiBa7hjmAivY5DUTEnoUlnCRzkeMp7FnTZqtNUItZAZUqIjseZ
 SGpZ/wwc+ep1hWHt5y04ZV2F2SE2EMScFbcbraPOd2ZR05kidUT3susoC+yWQg8+pvlV
 KWMMKc1L2SrpmOoIAh6cUd4cO4eh+GPssrlcCoiQ2OtlPeb+acoMsSlstES3H1I5vhKF
 j0gw==
X-Gm-Message-State: APjAAAXpBVSUdMVG6uOYsZI1rG+CdV/k5FaVwJ5qySiL6+PJRcFZMlsW
 pZ6SxrZldVk/k+TaXPz6jVpuYEKWb3zih8UVpEmwW8Q5/lm5lP/zc3Q7tHEWCUDznmBDSgby7BD
 FfbBYgxbkVurqM98=
X-Received: by 2002:a5d:4d4a:: with SMTP id a10mr24520024wru.220.1580836246473; 
 Tue, 04 Feb 2020 09:10:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqxEWrIvSwvYPjQ53hbMJWZvF+OPml5KeIlQwt2LOh+UIshn4ljq03Gx1Dw4G3rtnu5ldHDfkA==
X-Received: by 2002:a5d:4d4a:: with SMTP id a10mr24520008wru.220.1580836246264; 
 Tue, 04 Feb 2020 09:10:46 -0800 (PST)
Received: from [192.168.178.40] ([151.20.243.54])
 by smtp.gmail.com with ESMTPSA id y185sm4747105wmg.2.2020.02.04.09.10.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2020 09:10:45 -0800 (PST)
Subject: Re: [PATCH] drop "from __future__ import print_function"
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
References: <20200204160604.19883-1-pbonzini@redhat.com>
 <86185404-c4bc-b35d-eedc-9d95d1698379@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <82c6a3aa-8143-7510-4369-c70c785b302b@redhat.com>
Date: Tue, 4 Feb 2020 18:10:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <86185404-c4bc-b35d-eedc-9d95d1698379@redhat.com>
Content-Language: en-US
X-MC-Unique: mJq5s8jBPeWazFud9LRC7w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/02/20 17:07, Philippe Mathieu-Daud=C3=A9 wrote:
> On 2/4/20 5:06 PM, Paolo Bonzini wrote:
>> This is only needed for Python 2, which we do not support anymore.
>>
>> Based-on: <20200204160028.16211-1-pbonzini@redhat.com>
>> Cc: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>> =C2=A0 scripts/analyse-9p-simpletrace.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 1 -
>> =C2=A0 scripts/analyse-locks-simpletrace.py=C2=A0=C2=A0=C2=A0=C2=A0 | 1 =
-
>> =C2=A0 scripts/device-crash-test=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 -
>> =C2=A0 scripts/dump-guest-memory.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 -
>> =C2=A0 scripts/kvm/kvm_flightrecorder=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 -
>> =C2=A0 scripts/kvm/vmxcap=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 1 -
>> =C2=A0 scripts/minikconf.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 1 -
>> =C2=A0 scripts/modules/module_block.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 1 -
>> =C2=A0 scripts/qapi-gen.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 1 -
>> =C2=A0 scripts/qapi/doc.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 1 -
>> =C2=A0 scripts/qmp/qemu-ga-client=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 -
>> =C2=A0 scripts/qmp/qmp=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 -
>> =C2=A0 scripts/qmp/qmp-shell=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
1 -
>> =C2=A0 scripts/qmp/qom-get=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 1 -
>> =C2=A0 scripts/qmp/qom-list=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 1 -
>> =C2=A0 scripts/qmp/qom-set=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 1 -
>> =C2=A0 scripts/qmp/qom-tree=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 1 -
>> =C2=A0 scripts/replay-dump.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 -
>> =C2=A0 scripts/signrom.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 1 -
>> =C2=A0 scripts/simpletrace.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 -
>> =C2=A0 scripts/vmstate-static-checker.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 1 -
>> =C2=A0 tests/docker/travis.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 -
>> =C2=A0 tests/guest-debug/test-gdbstub.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 1 -
>> =C2=A0 tests/migration/guestperf/engine.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 1 -
>> =C2=A0 tests/migration/guestperf/plot.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 1 -
>> =C2=A0 tests/migration/guestperf/shell.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 1 -
>> =C2=A0 tests/qapi-schema/test-qapi.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 -
>> =C2=A0 tests/qemu-iotests/149=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 -
>> =C2=A0 tests/qemu-iotests/165=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 -
>> =C2=A0 tests/qemu-iotests/iotests.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 -
>> =C2=A0 tests/qemu-iotests/nbd-fault-injector.py | 1 -
>> =C2=A0 tests/qemu-iotests/qcow2.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 -
>> =C2=A0 tests/qemu-iotests/qed.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 -
>> =C2=A0 tests/vm/basevm.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 1 -
>> =C2=A0 34 files changed, 34 deletions(-)
>>
>> diff --git a/scripts/analyse-9p-simpletrace.py
>> b/scripts/analyse-9p-simpletrace.py
>> index f20050fddd..7dfcb6ba2f 100755
>> --- a/scripts/analyse-9p-simpletrace.py
>> +++ b/scripts/analyse-9p-simpletrace.py
>> @@ -3,7 +3,6 @@
>> =C2=A0 # Usage: ./analyse-9p-simpletrace <trace-events> <trace-pid>
>> =C2=A0 #
>> =C2=A0 # Author: Harsh Prateek Bora
>> -from __future__ import print_function
>> =C2=A0 import os
>> =C2=A0 import simpletrace
>=20
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>=20

Are you queueing this too?


