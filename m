Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F304D2058EB
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 19:37:00 +0200 (CEST)
Received: from localhost ([::1]:47396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnmqx-0007T7-KH
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 13:36:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jnmpr-0006wu-E5
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 13:35:52 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:40576
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jnmpo-0007h7-Cm
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 13:35:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592933744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DTrrLW7InN6onwXpFpj8QzHC7rYEKVpxB/VM+lrn5bg=;
 b=UQGTBmln/gw5CnkzPo8AbOEdBgTvvR4TwDTJ1ngNMf3gZJ9lheZNmCcvyXc7FoA6qpJqq6
 gEeKCy+5mroEGEmNiEMnF/WYy+Bi84auR+nTMo+hgQl/uaGQHP7MHWRJcrhvqPKZg2dNKN
 o0xp5B4B5CNGd/YzUt/s4yuAlYkZdO0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-TmGiJwWWPL2RoCcH11BnTw-1; Tue, 23 Jun 2020 13:35:38 -0400
X-MC-Unique: TmGiJwWWPL2RoCcH11BnTw-1
Received: by mail-wr1-f71.google.com with SMTP id p9so16384968wrx.10
 for <qemu-devel@nongnu.org>; Tue, 23 Jun 2020 10:35:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=DTrrLW7InN6onwXpFpj8QzHC7rYEKVpxB/VM+lrn5bg=;
 b=BIBj6PJwHvfN8xWR7HNVarfkXGA3v1oiqL48DSYAWjYZ60Fgi9KTpmLRUMKcr2E42c
 H4rvYFZtDmW3pc272xCavKxRm2YnqmziOiIq1wOC8inZ0z+Pu+AP7+QegbTOFlJwzSdw
 8WSFATk5iy2URjAzHSxWCzIdpZp+mtsteifDHRN4xaeaxbh8R9VBD19+w8JZGbM5/lSE
 2I2jdBxfex58AFNCfNE5AdnYVzVW54DpzfRPTdrTW5ohMuqFVXDwKRN51arKK5Qo7PgT
 N6WVYcu455DET4Nv0qJ2aTQijoJ6Fp/YiPmRtEnGFSCRPXJHEPb9StMiFq1M+7LKFPUz
 yDHQ==
X-Gm-Message-State: AOAM531gOnMbyltO4Er8be1eB7IWTveS6nNCF3FC5tTug3Lta34Ei1rp
 UpHcxSdIVJRaCuxGj7fSww6RP++5LxwroPvauPTeLakrIx9I9ByJse7bwkD0bnBzHsZkjVfYgjj
 IjEjg7MK0jA/Hpfk=
X-Received: by 2002:a05:6000:10d2:: with SMTP id
 b18mr26305694wrx.366.1592933736897; 
 Tue, 23 Jun 2020 10:35:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNgHwnrh9FoCkowyrACA4dDjx6Tk/neQXyy36If0ivP++iCyCEV29LBG2opUVvXMqwdFCd3g==
X-Received: by 2002:a05:6000:10d2:: with SMTP id
 b18mr26305673wrx.366.1592933736657; 
 Tue, 23 Jun 2020 10:35:36 -0700 (PDT)
Received: from [192.168.1.40] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id v7sm3227758wmj.11.2020.06.23.10.35.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2020 10:35:36 -0700 (PDT)
Subject: Re: [PATCH] Revert "tests/migration: Reduce autoconverge initial
 bandwidth"
To: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20200623145506.439100-1-mst@redhat.com>
 <3554a068-ba6f-0aa0-38b4-b6dca3069630@redhat.com>
 <5d3c4773-5aa2-e80d-68c7-a94eac8a7422@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <66821238-4da7-ec35-4bb7-6dc46bcbca1d@redhat.com>
Date: Tue, 23 Jun 2020 19:35:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <5d3c4773-5aa2-e80d-68c7-a94eac8a7422@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 01:55:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/23/20 7:07 PM, Thomas Huth wrote:
> On 23/06/2020 17.39, Philippe Mathieu-Daudé wrote:
>> On 6/23/20 4:56 PM, Michael S. Tsirkin wrote:
>>> This reverts commit 6d1da867e65f ("tests/migration: Reduce autoconverge initial bandwidth")
>>> since that change makes unit tests much slower for all developers, while it's not
>>> a robust way to fix migration tests. Migration tests need to find
>>> a more robust way to discover a reasonable bandwidth without slowing
>>> things down for everyone.
>>
>> Please also mention we can do this since 1de8e4c4dcf which allow
>> marked the s390x job as "unstable" and allow it to fail.
>>
>> But if nobody is going to look at it, instead lets disable
>> it until someone figure out the issue:
>>
>> -- >8 --
>> diff --git a/.travis.yml b/.travis.yml
>> index 74158f741b..364e67b14b 100644
>> --- a/.travis.yml
>> +++ b/.travis.yml
>> @@ -507,6 +507,7 @@ jobs:
>>
>>      - name: "[s390x] Clang (disable-tcg)"
>>        arch: s390x
>> +      if: false # Temporarily disabled due to issue testing migration
>> (see commit 6d1da867e65).
>>        dist: bionic
>>        compiler: clang
>>        addons:
> 
> Sorry, but that looks wrong. First, the disable-tcg test does not run
> the qtests at all. So this is certainly the wrong location here.

Indeed, this is the previous job:

-- >8 --
diff --git a/.travis.yml b/.travis.yml
index 74158f741b..b399e20078 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -464,6 +464,7 @@ jobs:
         - CONFIG="--disable-containers
--target-list=ppc64-softmmu,ppc64le-linux-user"

     - name: "[s390x] GCC check-tcg"
+      if: false # Temporarily disabled due to issue testing migration
(see commit 6d1da867e65).
       arch: s390x
       dist: bionic
       addons:
---

> Second,
> if just one of the qtests is failing, please only disable that single
> failing qtest and not the whole test pipeline.

Last time we talked about this Dave was against that option:

https://www.mail-archive.com/qemu-devel@nongnu.org/msg690085.html


