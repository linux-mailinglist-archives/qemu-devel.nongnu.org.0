Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C74324A00
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 06:24:31 +0100 (CET)
Received: from localhost ([::1]:57718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF98X-0003tA-K4
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 00:24:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lF97S-0003MX-PJ
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 00:23:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lF97P-00009u-9K
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 00:23:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614230597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pwBcXHb9E686y+CIs2UBzvu2ZE1D11zfSRqUS/HZL3I=;
 b=GOyKM5VhQAwD8gtcHTDit10YaLMMvMDh0ro3aST07TMmxqEpZhssWISH1BxeFYAlLT+hmg
 6HItD+yiszYtmYutjzO6ecHFXGxnIGo3ZZv+05f3oUPVRBXjx2kWBhktcjSfgA5USnl8uz
 79xVSW8s2ZejAv8COSVNuTrGEbbsRjQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-z4wusYZJPI6PLOAVPELIxg-1; Thu, 25 Feb 2021 00:23:06 -0500
X-MC-Unique: z4wusYZJPI6PLOAVPELIxg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99B12801976;
 Thu, 25 Feb 2021 05:23:04 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-58.ams2.redhat.com [10.36.112.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A5DF60C5F;
 Thu, 25 Feb 2021 05:22:54 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20210223225327.26700-1-nieklinnenbank@gmail.com>
 <20210223225327.26700-2-nieklinnenbank@gmail.com>
 <5556626c-0b4f-0de3-9cb8-d174cd210b5c@amsat.org>
 <20210224191341.GC1074102@amachine.somewhere>
 <CAPan3WqXre=Rau4-jOSE2u=GGRO8hSKzuuWFSN4xP3wbpvQ-Dg@mail.gmail.com>
 <6309e75e-2aa4-5bc1-66be-0b29f408f179@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 1/2] tests/acceptance: replace unstable apt.armbian.com
 URLs for orangepi-pc, cubieboard
Message-ID: <5cd02aba-b76f-d12d-9ea1-ec6b84107f16@redhat.com>
Date: Thu, 25 Feb 2021 06:22:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <6309e75e-2aa4-5bc1-66be-0b29f408f179@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Pavel.Dovgaluk@ispras.ru, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/02/2021 00.10, Philippe Mathieu-Daudé wrote:
> +Thomas/Daniel/Alex/Peter/Paolo/Stefan/Markus
> 
> On 2/24/21 9:02 PM, Niek Linnenbank wrote:
>> Hi Philippe, Cleber,
[...]
>> Indeed. Just this morning I received an e-mail from github with the
>> following text:
>>
>> "[GitHub] Git LFS disabled for nieklinnenbank
>>
>> Git LFS has been disabled on your personal account nieklinnenbank
>> because you’ve exceeded your data plan by at least 150%.
>> Please purchase additional data packs to cover your bandwidth and
>> storage usage:
>>
>>    https://github.com/account/billing/data/upgrade
>>
>> Current usage as of 24 Feb 2021 09:49AM UTC:
>>
>>    Bandwidth: 1.55 GB / 1 GB (155%)
>>    Storage: 0.48 GB / 1 GB (48%)"
>>   
>> I wasn't aware of it but it appears that Github has these quota's for
>> the Large File Storage (LFS). I uploaded the files in the git LFS
>> because single files are also limited to 100MiB each on the regular Git
>> repositories.
>>
>> With those strict limits, in my opinion Github isn't really a solution
>> since the bandwidth limit will be reached very quickly. At least for the
>> LFS part that is. I don't know yet if there is any limit for regular access.
>>
>> My current ideas:
>>    - we can try to splitup the larger files into sizes < 100MiB in order
>> to use github regular storage. and then download each part to combine
>> into the final image.
>>      im not really in favour of this but it can work, if github doesnt
>> have any other limit/quota. the cost is that we have to add more
>> complexity to the acceptance test code.

Well, if you want to go down that road (which I don't really like), you 
could also host the binaries on gitlab instead, where our CI is running, so 
the binaries would be hosted in the same network as the CI.

>>    - we can try to just update the URLs to armbian that are working now
>> (with the risk of breaking again in the near future). Ive also found
>> this link, which may be more stable:
>>       https://archive.armbian.com/orangepipc/archive/

I'd give this a try! If we then later have to discover that the links are 
still not stable, we can still reconsider something else.

>>    - or use the server that im hosting - and i don't mind to add the
>> license files on it if needed (should be GPLv2 right?)

You know that you also have to be ready to provide all the source codes to 
the binaries that you host to adhere the conditions of the GPL? That should 
be doable if you originally downloaded them along with the binaries, but 
otherwise finding the sources to such binaries can be hard...

>> I'd be interested to hear your opinion and suggestions.
>>
>> Kind regards,
>> Niek
> 
> Some of the unpractical options I can think of...:
> 
> - do not contribute tests using binary blob

That would be a huge step backward to the times when we did not have the 
"acceptance" tests yet.

> - do not allow test image >100 MiB

Test images should not be too huge anyway, but I don't think we should 
introduce such an artificial limit.

> - contribute tests with sha1 of (big) image but say "if you want
>    the test image contact me off-list" then when the contributor
>    stop responding we remove the test

That does not really scale. And how do you add such a test to the CI? That'd 
mean that everybody has to contribute gitlab runners? I don't think that's 
feasible either.

> - have anyone setup its servers with tests source and images,
>    without committing anything to the repository. Interested
>    maintainers/testers are on their own.
> - testing done behind the scene

That's maybe an option for these tests where the binaries cannot be found in 
the internet anymore.

> TBH I'm a bit hopeless.

C'mon, most of the "acceptance" test are just working fine (from the 
"download" perspective), it's just some few tests that are troubled. I'd say 
let's give it another try with archive.armbian.com and if that does not 
work, we can still consider to simply remove those troubled tests.

  Thomas


