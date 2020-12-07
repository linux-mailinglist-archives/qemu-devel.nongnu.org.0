Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5D62D0E07
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 11:32:12 +0100 (CET)
Received: from localhost ([::1]:48142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmDoR-0004dj-U9
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 05:32:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmDjW-0001Kc-ML
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 05:27:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmDjV-0004La-3v
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 05:27:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607336824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MYK9SCRGoM7soozgWZPnpW4pQBMVhd9wGe6LkNWKsP0=;
 b=W4qQL0pWHNkRDJrBvw2tHO0v3F8KmAeSNN8x1T7xcYd0ypEmBX0EFc4QMcLUu+n15XHRlp
 xK+VInoiB3qnCQOmfYmIfnBtjfRb7f0iO1MEZc09fy1H1MI+utq8ZHaeT20hQNVtX+hr1B
 9HtN2Ysq85kXjIEf6DJdMmc4zfBOjwg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-0ol5GoO5N4WTMfHd7r77pA-1; Mon, 07 Dec 2020 05:27:03 -0500
X-MC-Unique: 0ol5GoO5N4WTMfHd7r77pA-1
Received: by mail-wr1-f72.google.com with SMTP id e6so4656950wrx.13
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 02:27:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MYK9SCRGoM7soozgWZPnpW4pQBMVhd9wGe6LkNWKsP0=;
 b=aWcj5LMf7MhDehf1KwmPKLOQJ6yxHgc7hgVtPovQURWouobZgESkKHUT/pbVK//Xxz
 HTGIAs6HC9S1D4f2MM3iZo0ZGV6PBuZiLEJWL3qUO85QMhHHTVsa/A8ME1O7XlDI5ozh
 Z7r9ihTgs/AN+6RvppV1f/k5JNt9UbJLK8h0PQh3jNzyuivS/c0s4sYbBcY9hvje7zUT
 aWzWKDVshBaSw3MrfwvtFoNomXkq1A5zm2dTlELdCkBrLqotWfdzJrnxWqd0dRrl+M2B
 jTwoC5TgkENnrdGA84bNidYRDNMwiYTFZ/ZIIyEQaUwhmIjqmKO53kVEH0osOKb1UmPN
 2XRw==
X-Gm-Message-State: AOAM530HlziGrEgRzKjtEtI3c6Co+fY/hT3dRBSb87VWaElXB1Cbsg3o
 4dEduS9U2mQrxPkoKWsqtdB2wgoR4ZnL4DFGFKWz9Dhj3jM0x6H82HdjmBWwC/Lk9ytnf04ivth
 ONkL0SecjCPA02n4=
X-Received: by 2002:a5d:5505:: with SMTP id b5mr18809761wrv.410.1607336821230; 
 Mon, 07 Dec 2020 02:27:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwpxS69KnKku3sO4CNJaJdpGJkosGMLT7HJYybqboCJTmJrWpUYm5nXWA06aq36q3aIAua9Hw==
X-Received: by 2002:a5d:5505:: with SMTP id b5mr18809725wrv.410.1607336821045; 
 Mon, 07 Dec 2020 02:27:01 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id o203sm14297391wmb.0.2020.12.07.02.26.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 02:27:00 -0800 (PST)
Subject: Re: [PATCH 5/8] gitlab-ci: Add KVM s390x cross-build jobs
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20201206185508.3545711-1-philmd@redhat.com>
 <20201206185508.3545711-6-philmd@redhat.com>
 <66d4d0ab-2bb5-1284-b08a-43c6c30f30dc@redhat.com>
 <20201207102450.GG3102898@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9233fe7f-8d56-e1ad-b67e-40b3ce5fcabb@redhat.com>
Date: Mon, 7 Dec 2020 11:26:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201207102450.GG3102898@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, Paul Durrant <paul@xen.org>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Willian Rampazzo <wrampazz@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 11:25 AM, Daniel P. Berrangé wrote:
> On Mon, Dec 07, 2020 at 06:46:01AM +0100, Thomas Huth wrote:
>> On 06/12/2020 19.55, Philippe Mathieu-Daudé wrote:
>>> Cross-build s390x target with only KVM accelerator enabled.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>>  .gitlab-ci.d/crossbuilds-kvm-s390x.yml | 6 ++++++
>>>  .gitlab-ci.yml                         | 1 +
>>>  MAINTAINERS                            | 1 +
>>>  3 files changed, 8 insertions(+)
>>>  create mode 100644 .gitlab-ci.d/crossbuilds-kvm-s390x.yml
>>>
>>> diff --git a/.gitlab-ci.d/crossbuilds-kvm-s390x.yml b/.gitlab-ci.d/crossbuilds-kvm-s390x.yml
>>> new file mode 100644
>>> index 00000000000..1731af62056
>>> --- /dev/null
>>> +++ b/.gitlab-ci.d/crossbuilds-kvm-s390x.yml
>>> @@ -0,0 +1,6 @@
>>> +cross-s390x-kvm:
>>> +  extends: .cross_accel_build_job
>>> +  variables:
>>> +    IMAGE: debian-s390x-cross
>>> +    TARGETS: s390x-softmmu
>>> +    ACCEL_CONFIGURE_OPTS: --disable-tcg
>>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>>> index 573afceb3c7..a69619d7319 100644
>>> --- a/.gitlab-ci.yml
>>> +++ b/.gitlab-ci.yml
>>> @@ -14,6 +14,7 @@ include:
>>>    - local: '/.gitlab-ci.d/crossbuilds.yml'
>>>    - local: '/.gitlab-ci.d/crossbuilds-kvm-x86.yml'
>>>    - local: '/.gitlab-ci.d/crossbuilds-kvm-arm.yml'
>>> +  - local: '/.gitlab-ci.d/crossbuilds-kvm-s390x.yml'
>>
>> KVM code is already covered by the "cross-s390x-system" job, but an
>> additional compilation test with --disable-tcg makes sense here. I'd then
>> rather name it "cross-s390x-no-tcg" or so instead of "cross-s390x-kvm".
>>
>> And while you're at it, I'd maybe rather name the new file just
>> crossbuilds-s390x.yml and also move the other s390x related jobs into it?
> 
> I don't think we really should split it up so much - just put these
> jobs in the existing crosbuilds.yml file.

Don't we want to leverage MAINTAINERS file?


