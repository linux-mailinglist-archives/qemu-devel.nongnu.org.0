Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAA4206B85
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 07:05:53 +0200 (CEST)
Received: from localhost ([::1]:55792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnxbb-0005YC-QW
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 01:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jnxah-00053l-HB
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 01:04:55 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:29527
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jnxae-0006kN-N8
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 01:04:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592975091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=Nm3hVoely4bB6s0vPRYIW6Yyzf7QEot85wRTROsVDdc=;
 b=QKkvQCJg+51D2ieWNnitXhHKjcfUYmTClqlojKM87tM9VVNRSxQfe9/6j+cUFoJeny+d5E
 79/XeZn/fIqtqCMoZ/DuGo+grBI6GjNPaDGL8+dENreuuPQX5GhETANhSaBJNJaOTNc1ON
 nE87wrNZ0zl9uLOC4q17ecendGI/bQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-NY1uV7gYPuqyTF_bFKo2wQ-1; Wed, 24 Jun 2020 01:04:47 -0400
X-MC-Unique: NY1uV7gYPuqyTF_bFKo2wQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56C4E804003;
 Wed, 24 Jun 2020 05:04:46 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-132.ams2.redhat.com [10.36.112.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C0A3C5C290;
 Wed, 24 Jun 2020 05:04:41 +0000 (UTC)
Subject: Re: [PATCH] Revert "tests/migration: Reduce autoconverge initial
 bandwidth"
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20200623145506.439100-1-mst@redhat.com>
 <3554a068-ba6f-0aa0-38b4-b6dca3069630@redhat.com>
 <5d3c4773-5aa2-e80d-68c7-a94eac8a7422@redhat.com>
 <66821238-4da7-ec35-4bb7-6dc46bcbca1d@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <99caf774-fec0-08e4-3565-228d9a0c688b@redhat.com>
Date: Wed, 24 Jun 2020 07:04:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <66821238-4da7-ec35-4bb7-6dc46bcbca1d@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 00:34:35
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

On 23/06/2020 19.35, Philippe Mathieu-Daudé wrote:
> On 6/23/20 7:07 PM, Thomas Huth wrote:
>> On 23/06/2020 17.39, Philippe Mathieu-Daudé wrote:
>>> On 6/23/20 4:56 PM, Michael S. Tsirkin wrote:
>>>> This reverts commit 6d1da867e65f ("tests/migration: Reduce autoconverge initial bandwidth")
>>>> since that change makes unit tests much slower for all developers, while it's not
>>>> a robust way to fix migration tests. Migration tests need to find
>>>> a more robust way to discover a reasonable bandwidth without slowing
>>>> things down for everyone.
>>>
>>> Please also mention we can do this since 1de8e4c4dcf which allow
>>> marked the s390x job as "unstable" and allow it to fail.
>>>
>>> But if nobody is going to look at it, instead lets disable
>>> it until someone figure out the issue:
>>>
>>> -- >8 --
>>> diff --git a/.travis.yml b/.travis.yml
>>> index 74158f741b..364e67b14b 100644
>>> --- a/.travis.yml
>>> +++ b/.travis.yml
>>> @@ -507,6 +507,7 @@ jobs:
>>>
>>>      - name: "[s390x] Clang (disable-tcg)"
>>>        arch: s390x
>>> +      if: false # Temporarily disabled due to issue testing migration
>>> (see commit 6d1da867e65).
>>>        dist: bionic
>>>        compiler: clang
>>>        addons:
>>
>> Sorry, but that looks wrong. First, the disable-tcg test does not run
>> the qtests at all. So this is certainly the wrong location here.
> 
> Indeed, this is the previous job:
> 
> -- >8 --
> diff --git a/.travis.yml b/.travis.yml
> index 74158f741b..b399e20078 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -464,6 +464,7 @@ jobs:
>          - CONFIG="--disable-containers
> --target-list=ppc64-softmmu,ppc64le-linux-user"
> 
>      - name: "[s390x] GCC check-tcg"
> +      if: false # Temporarily disabled due to issue testing migration
> (see commit 6d1da867e65).
>        arch: s390x
>        dist: bionic
>        addons:
> ---
> 
>> Second,
>> if just one of the qtests is failing, please only disable that single
>> failing qtest and not the whole test pipeline.
> 
> Last time we talked about this Dave was against that option:
> 
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg690085.html
> 

Was he? Citing his reply to the mail from your URL:

 "Before we take the hammer to it, could you try reducing it's initial
bandwidth"

So all I can see is that he first wanted to try something different than
disabling the test. And now,  instead of using a small hammer to disable
just this test, you now even use a very *big* hammer to disable *all*
tests. That's just a very bad idea. Please don't.

 Thomas


