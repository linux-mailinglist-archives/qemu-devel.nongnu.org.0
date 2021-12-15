Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDEF475866
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 13:07:15 +0100 (CET)
Received: from localhost ([::1]:52650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxT3y-0002CG-Qb
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 07:07:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxSzY-0007LZ-71
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 07:02:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxSzV-0007fb-Bs
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 07:02:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639569755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ELExsZkkG8gvV5UXN3QwBWtKuNLEskVOjRJtgwxtgCw=;
 b=AYe9i0Y/9wuMOHp9JKpfFkLdz4taWAXTkUNlU+FwfEfXACoci88CS4Kxi2OkZ1RnaDoUGJ
 3gDyQrvfxH1waDkVV6Aw+Xar1UqLBOiw7epBUcoqRB7AMDRQRVMOtOIJ/jSZRUab7t50s/
 V+ZE46T8TYleCKEm5rk74g1Vr7ZZLzc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-VV1Zli2bMcmrlq7oOCQZ2w-1; Wed, 15 Dec 2021 07:02:34 -0500
X-MC-Unique: VV1Zli2bMcmrlq7oOCQZ2w-1
Received: by mail-wr1-f71.google.com with SMTP id
 p3-20020a056000018300b00186b195d4ddso5854877wrx.15
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 04:02:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ELExsZkkG8gvV5UXN3QwBWtKuNLEskVOjRJtgwxtgCw=;
 b=NSlf4nnJgPiIiJFyXbqllYGBTprMCBm8fP8py/gPabI6AdNTefPd5unwTYqDxohk8j
 7IPiVPOlclosIdoeftxJ1BnmizjmO18FzqO3VHJ+mL9RtwBhuFiBBsOu8Ae9Xgt8E4lP
 ZsG7N8443cEkMCS4ajNDmJ8lkF6GGVTv1GAQf1UeQZFg1rbG5AUwr3ioBSOZk55m/Fbv
 df6SjMTPRLORMNpOzYUxAUpO54g/JvTmgK2g5FeqfljnDmY9ZqMlVcsfmp0GotgQKsMH
 xRjFm1B7jKNRgDsJLJUvOrxF0FzEy9iiFDoGg21kGSWQ4ER8bnpkTelK8ygiNTzUFRMq
 Woyw==
X-Gm-Message-State: AOAM533HZwNux827uuwEfadik8SLdWigf+ryPs72xUvcq9w0SwIiFk77
 aAonfNOzAyWdx/PJuFpvC7j71yPFMNfXFyU8BKkAV25ovRsojORWfU9Mv5dygmAwwa+olxIgvNs
 3oY1koLUJOibPTkM=
X-Received: by 2002:a05:6000:1848:: with SMTP id
 c8mr4008388wri.265.1639569752893; 
 Wed, 15 Dec 2021 04:02:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzRUdXtkqVQEA/2Cmeg1nZpBk66ukpK9SQ+qFI4SNKqXYrUTVAqGXBoLvJZMEBdMtRkO5zTnw==
X-Received: by 2002:a05:6000:1848:: with SMTP id
 c8mr4008368wri.265.1639569752673; 
 Wed, 15 Dec 2021 04:02:32 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id 12sm105223wmi.35.2021.12.15.04.02.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 04:02:32 -0800 (PST)
Message-ID: <75644656-e02d-e487-0c7a-ec03dfdb4663@redhat.com>
Date: Wed, 15 Dec 2021 13:02:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 05/18] ci: explicitly skip I/O tests on alpine
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20211124130150.268230-1-berrange@redhat.com>
 <20211124130150.268230-6-berrange@redhat.com>
 <fb749701-0dee-8ae6-da2d-f7ed2c09004f@redhat.com>
 <YZ5CPNSZ1YPfCXLT@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <YZ5CPNSZ1YPfCXLT@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/21 14:46, Daniel P. Berrangé wrote:
> On Wed, Nov 24, 2021 at 02:36:59PM +0100, Thomas Huth wrote:
>> On 24/11/2021 14.01, Daniel P. Berrangé wrote:
>>> The block I/O tests don't work on Alpine because their alternative libc
>>> impl emits different strings for errnos, which breaks the expected
>>> output matching. e.g.
>>>
>>> === IO: pattern 102
>>>   wrote 512/512 bytes at offset 512
>>>   512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>>> -qemu-img: Error while reading offset 0 of blkdebug:TEST_DIR/blkdebug.conf:TEST_DIR/t.IMGFMT: Input/output error
>>> +qemu-img: Error while reading offset 0 of blkdebug:TEST_DIR/blkdebug.conf:TEST_DIR/t.IMGFMT: I/O error
>>>   4
>>>   Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
>>>   Formatting 'TEST_DIR/t.IMGFMT.2', fmt=IMGFMT size=0
>>>
>>> Currently the I/O tests are skipped as a side effect of the Alpine image
>>> containing a minimal busybox 'sed' binary, rather than GNU Sed. This is
>>> a fragile assumption that will be invalidated when the dockerfile is
>>> changed to be autogenerated from a standardized package list that
>>> includes GNU Sed.

"GNU sed" in lowercase? ("stream editor", 2 occurrences in description).

>>>
>>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>>> ---
>>>   .gitlab-ci.d/buildtest.yml | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
>>> index 71d0f407ad..e1fe37e563 100644
>>> --- a/.gitlab-ci.d/buildtest.yml
>>> +++ b/.gitlab-ci.d/buildtest.yml
>>> @@ -24,7 +24,7 @@ check-system-alpine:
>>>         artifacts: true
>>>     variables:
>>>       IMAGE: alpine
>>> -    MAKE_CHECK_ARGS: check
>>> +    MAKE_CHECK_ARGS: check-unit check-qtest
>>
>> Hmm, that's just a work-around ... what if some user wants to run "make
>> check" on an Alpine installation that has the real GNU sed installed? ... I
>> think this rather requires some fixing in the iotests instead - or maybe the
>> related tests should simply not be in the "auto" group anymore?
> 
> Of course, the I/o tests should be fixed, but that's a big job that on
> one has volunteered for.
> 
> Taking the tests in question out of the "auto" group would be very
> detrimental for test coverage on other platforms. There are many
> affected tests so that is not desirable.
> 
> As explained above, the CI job is already skipping the I/O tests today
> as a side effect of only having Busybox sed. This change just makes
> that explicit in the CI config so it is clear that we're missing this
> coverage and won't accidentally break when GNU Sed appears in the
> dockerfile.

This sounds reasonable.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


