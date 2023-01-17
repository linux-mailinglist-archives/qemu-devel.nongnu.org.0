Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDFB66D7A6
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 09:12:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHh4j-0000Wv-3J; Tue, 17 Jan 2023 03:12:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pHh4e-0000WV-3h
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 03:12:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pHh4c-00018B-7W
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 03:12:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673943121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zsvZNx/gTiD57FqJ5NVzLmRDU8R8IDnzNRFy0dBO7Wc=;
 b=ZbcaKdxeyEgk/oTYIu6YQRlZ2/XHvR4EkFfmlxhyeYmNiyXHnru2BsTWcyyHVeur7qA6W5
 D5izvkg0YUUSxlaAKdJQVslTwJOY9f9R7Wd3KJAQX8JRZz3E/sMsPnU4cUVDsMaELAT4X6
 Vf1nT6dVaiY2hIIRnjRGoz+Q3PCK2Bk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-r2o3o5Y6PB6oih4_Rildjw-1; Tue, 17 Jan 2023 03:11:59 -0500
X-MC-Unique: r2o3o5Y6PB6oih4_Rildjw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 543FD811E6E;
 Tue, 17 Jan 2023 08:11:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EE6F40C2064;
 Tue, 17 Jan 2023 08:11:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 984BA21E6A28; Tue, 17 Jan 2023 09:11:57 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,  BALATON Zoltan
 <balaton@eik.bme.hu>,  Thomas Huth <thuth@redhat.com>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  qemu-devel@nongnu.org
Subject: Re: [PATCH v2 01/21] hw/block: Rename TYPE_PFLASH_CFI02 'width'
 property as 'device-width'
References: <20230109120833.3330-1-philmd@linaro.org>
 <20230109120833.3330-2-philmd@linaro.org>
 <791cd783-4f27-dd18-c6bd-b9a316bb42cd@eik.bme.hu>
 <8507ed0d-fc90-8ce3-2d7d-82c106b20231@linaro.org>
 <CAFEAcA-h49eXgS63LARX0aMgBknNcaURGxqammQh5U9OZQ7v4A@mail.gmail.com>
 <875yd7vv6o.fsf@pond.sub.org>
 <20148a60-bc97-5c66-06f8-81cace4027a7@linaro.org>
Date: Tue, 17 Jan 2023 09:11:57 +0100
In-Reply-To: <20148a60-bc97-5c66-06f8-81cace4027a7@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 16 Jan 2023 09:41:46
 +0100")
Message-ID: <87h6wp60mq.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 16/1/23 07:40, Markus Armbruster wrote:
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>=20
>>> On Mon, 9 Jan 2023 at 14:19, Philippe Mathieu-Daud=C3=A9 <philmd@linaro=
.org> wrote:
>>>>
>>>> On 9/1/23 14:33, BALATON Zoltan wrote:
>>>>> On Mon, 9 Jan 2023, Philippe Mathieu-Daud=C3=A9 wrote:
>>>>>> Use the same property name than the TYPE_PFLASH_CFI01 model.
>>>>>
>>>>> Nothing uses it? Can this break command lines and if so do we need
>>>>> deprecation or some compatibility function until everybody changed th=
eir
>>>>> usage?
>>>>
>>>> Good point... I missed that :/
>>>
>>> That should not be possible, because the cfi02 device
>>> is a sysbus device that must be mapped into memory. There's
>>> no useful way to use it on the QEMU commandline; the only
>>> users are those creating it from C code within QEMU.
>>
>> I'd say beware of -global, but "fortunately" cfi.pflash01 cannot work
>> with it, since its '.' sabotages the -global's syntax.
>
> But we use it in tests...:
>
> $ git grep global.*cfi.pflash
> tests/qtest/pflash-cfi02-test.c:266:    " -global driver=3Dcfi.pflash02,"
> tests/qtest/pflash-cfi02-test.c:268:    " -global driver=3Dcfi.pflash02,"
> ...

Ah, I forgot the alternate syntax!

commit 3751d7c43f795b45ffdb9429cfb09c6beea55c68
Author: Paolo Bonzini <pbonzini@redhat.com>
Date:   Thu Apr 9 14:16:19 2015 +0200

    vl: allow full-blown QemuOpts syntax for -global
=20=20=20=20
    -global does not work for drivers that have a dot in their name, such as
    cfi.pflash01.  This is just a parsing limitation, because such globals
    can be declared easily inside a -readconfig file.
=20=20=20=20
    To allow this usage, support the full QemuOpts key/value syntax for -gl=
obal
    too, for example "-global driver=3Dcfi.pflash01,property=3Dsecure,value=
=3Don".
    The two formats do not conflict, because the key/value syntax does not =
have
    a period before the first equal sign.
=20=20=20=20
    Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

So we aren't "fortunate" after all.

>> Related prior discussion in the cover letter of "[PATCH RFC 0/1] QOM
>> type names and QAPI" and the replies to it:
>>      Message-Id: <20210129081519.3848145-1-armbru@redhat.com>
>>      https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg07541.html
>> The patch there became commit e178113ff6 "hw: Replace anti-social QOM
>> type names".
>> [...]
>>=20


