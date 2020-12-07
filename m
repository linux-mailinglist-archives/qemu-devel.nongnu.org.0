Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2FB2D0FEC
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 13:00:51 +0100 (CET)
Received: from localhost ([::1]:44386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmFCE-0006no-UP
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 07:00:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmEeo-0004lx-PZ
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:26:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmEei-0005Fp-Jc
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:26:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607340372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E8SnAm7lBjFJY33tSzEd+s5+QBCNZ6+uVzsTHaYTIOw=;
 b=YKL1nPQ9xqIt5sftPOA/a5eihZDdOLy/ceA/ASnm7PXtVyUlWFwaT+KHLGAMlinrB/sZY+
 1pyEJoHNy4mRoxskP8aYLwHi32bJHsYKJdwXVo7IQ34A+F8vyOVyL6xWzjOa/oopmLfQkx
 W1keZZE94yhKzkOfRA1Km0o+N69u3n4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-X-7M63n1Mc63ArW-XJzaNQ-1; Mon, 07 Dec 2020 06:26:10 -0500
X-MC-Unique: X-7M63n1Mc63ArW-XJzaNQ-1
Received: by mail-wm1-f70.google.com with SMTP id z12so5211383wmf.9
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 03:26:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E8SnAm7lBjFJY33tSzEd+s5+QBCNZ6+uVzsTHaYTIOw=;
 b=UPqaigZH1JWnYcLNgkVGU5dSjDFgpWi9wHgevoEpL7rkuI7zdhyWLoFhLjat9xUt7M
 WJ3B34+PFYTfiguUbcwAQji/PtEk/i1a3uG1G1UGUgHZ5A8nJQ+bi72yEAUteq7weIb2
 G+Tqk2/1/jn6XzzWv0ZBzHy4ABHdTRDAci3+Skc7X0NqemMceqpyAwocz6V3i4hYYtTX
 DnZtiyVE8yz9kqI6/H8ZIWWoYbRkWRh98flCW493+H8IusoiOvELDhfXoYGAeAw+IMC8
 LupOukX2E8QFQx3SGHfYb+cKDswuDnJOOBRmyjvz4LmWfESXr5laQE8wbv0385gS7NOg
 N2KA==
X-Gm-Message-State: AOAM533m4VFHoBaCqiloeSMJ47Jsaw4P9SRUrkhfz4Nrfu9qdbbzTC8v
 qav5/fcjb7IlitvAu7y1Hfe32E7q/KEvu0JOf+o7kEeQaYDLtoEOnD9bma2Ves3Z9NunO9HXfOV
 s3S1VQ8DUTTCYSQE=
X-Received: by 2002:a5d:4c4e:: with SMTP id n14mr9412262wrt.209.1607340368499; 
 Mon, 07 Dec 2020 03:26:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwcLG0ly5fRNXTnumnXcvmnqbciuOeraAOT2K0u9vBpVFo7cpgUmtymDQM92D6CgbpOtloTWw==
X-Received: by 2002:a5d:4c4e:: with SMTP id n14mr9412242wrt.209.1607340368301; 
 Mon, 07 Dec 2020 03:26:08 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id s4sm14921932wra.91.2020.12.07.03.26.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 03:26:07 -0800 (PST)
Subject: Re: [PATCH 5/8] gitlab-ci: Add KVM s390x cross-build jobs
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20201206185508.3545711-1-philmd@redhat.com>
 <20201206185508.3545711-6-philmd@redhat.com>
 <66d4d0ab-2bb5-1284-b08a-43c6c30f30dc@redhat.com>
 <20201207102450.GG3102898@redhat.com>
 <9233fe7f-8d56-e1ad-b67e-40b3ce5fcabb@redhat.com>
 <20201207103430.GI3102898@redhat.com>
 <3bb741d3-aaf7-8d73-1990-efc01e3e8977@redhat.com>
Message-ID: <6c7ef8e8-f2ab-9388-0058-4740bdcfd69a@redhat.com>
Date: Mon, 7 Dec 2020 12:26:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <3bb741d3-aaf7-8d73-1990-efc01e3e8977@redhat.com>
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
 Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 12:14 PM, Philippe Mathieu-Daudé wrote:
> On 12/7/20 11:34 AM, Daniel P. Berrangé wrote:
>> On Mon, Dec 07, 2020 at 11:26:58AM +0100, Philippe Mathieu-Daudé wrote:
>>> On 12/7/20 11:25 AM, Daniel P. Berrangé wrote:
>>>> On Mon, Dec 07, 2020 at 06:46:01AM +0100, Thomas Huth wrote:
>>>>> On 06/12/2020 19.55, Philippe Mathieu-Daudé wrote:
>>>>>> Cross-build s390x target with only KVM accelerator enabled.
>>>>>>
>>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>>>> ---
>>>>>>  .gitlab-ci.d/crossbuilds-kvm-s390x.yml | 6 ++++++
>>>>>>  .gitlab-ci.yml                         | 1 +
>>>>>>  MAINTAINERS                            | 1 +
>>>>>>  3 files changed, 8 insertions(+)
>>>>>>  create mode 100644 .gitlab-ci.d/crossbuilds-kvm-s390x.yml
>>>>>>
>>>>>> diff --git a/.gitlab-ci.d/crossbuilds-kvm-s390x.yml b/.gitlab-ci.d/crossbuilds-kvm-s390x.yml
>>>>>> new file mode 100644
>>>>>> index 00000000000..1731af62056
>>>>>> --- /dev/null
>>>>>> +++ b/.gitlab-ci.d/crossbuilds-kvm-s390x.yml
>>>>>> @@ -0,0 +1,6 @@
>>>>>> +cross-s390x-kvm:
>>>>>> +  extends: .cross_accel_build_job
>>>>>> +  variables:
>>>>>> +    IMAGE: debian-s390x-cross
>>>>>> +    TARGETS: s390x-softmmu
>>>>>> +    ACCEL_CONFIGURE_OPTS: --disable-tcg
>>>>>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>>>>>> index 573afceb3c7..a69619d7319 100644
>>>>>> --- a/.gitlab-ci.yml
>>>>>> +++ b/.gitlab-ci.yml
>>>>>> @@ -14,6 +14,7 @@ include:
>>>>>>    - local: '/.gitlab-ci.d/crossbuilds.yml'
>>>>>>    - local: '/.gitlab-ci.d/crossbuilds-kvm-x86.yml'
>>>>>>    - local: '/.gitlab-ci.d/crossbuilds-kvm-arm.yml'
>>>>>> +  - local: '/.gitlab-ci.d/crossbuilds-kvm-s390x.yml'
>>>>>
>>>>> KVM code is already covered by the "cross-s390x-system" job, but an
>>>>> additional compilation test with --disable-tcg makes sense here. I'd then
>>>>> rather name it "cross-s390x-no-tcg" or so instead of "cross-s390x-kvm".
>>>>>
>>>>> And while you're at it, I'd maybe rather name the new file just
>>>>> crossbuilds-s390x.yml and also move the other s390x related jobs into it?
>>>>
>>>> I don't think we really should split it up so much - just put these
>>>> jobs in the existing crosbuilds.yml file.
>>>
>>> Don't we want to leverage MAINTAINERS file?
>>
>> As mentioned in the cover letter, I think this is mis-using the MAINTAINERS
>> file to try to represent something different.
>>
>> The MAINTAINERS file says who is responsible for the contents of the .yml
>> file, which is the CI maintainers, because we want a consistent gitlab
>> configuration as a whole, not everyone doing their own thing.
>>
>> MAINTAINERS doesn't say who is responsible for making sure the actual
>> jobs that run are passing, which is potentially a completely different
>> person. If we want to track that, it is not the MAINTAINERS file.
> 
> Thanks, I was expecting subsystem maintainers would worry about the
> CI jobs, but you made it clear this should be different persons who
> look after CI. I understand it is better to have no maintainer than
> to have incorrect maintainer.

MAINTAINERS and scripts/get_maintainer.pl doesn't scale well with
YAML / JSON... While this files are maintained by the Gitlab
subsystem maintainers, how can we had job-specific reviewers?


