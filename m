Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC2C55BFB1
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 11:06:57 +0200 (CEST)
Received: from localhost ([::1]:41816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o67BP-0002uj-Jz
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 05:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o66a2-0007ax-KH
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 04:28:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o66Zy-0004MO-OF
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 04:28:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656404888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mLdYyJtnwlDFU+3FqmctDPipdZsLSXppqwzB56jA3xI=;
 b=LfF9yTkt87QspAL1juhys59Q8k7NqAlENgwCfy3Xzid/x1t+4s86yfsJFFpfOMrlnn59HD
 yIc4oWqEi0VO0CCCGa8uyaSIClFNU9l50BTbY2+g5sSJux2cDfRBV5oYpmDsNMGjnUmP4L
 w0Xy6h7pQyGKFdgN8Gj8WJfKaqrGSXo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-392-yMSSL0pJPcqWD-4oim5ySQ-1; Tue, 28 Jun 2022 04:28:06 -0400
X-MC-Unique: yMSSL0pJPcqWD-4oim5ySQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 t20-20020a1c7714000000b003a032360873so7917247wmi.0
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 01:28:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mLdYyJtnwlDFU+3FqmctDPipdZsLSXppqwzB56jA3xI=;
 b=mD8Dpzu5Z+dOPIzAnk2s2RzrTmDPRfUJNSYYPW2wxqXXb11XLssGyCH4xJXg3NUHJe
 TvAAK9OKn7rSJwOY37dcN5IZa/igFYKLxqj+YqY+QyXvjQNqw+KV3yVT1GLH98PFqN2s
 GNh7qzLE3vcRKYcrCQekLZ2yY7WVErOxAzmO/6rrTi+ax9xUoSiaMbPcUWnuG+DUfA82
 uQ5VcKdQG/mDrcJYaUfRuSeaZknLj6JRaWZjIc2HJ2jGjFEEdRQRv9U4c/AZQ1YrDjaU
 Jc9W06IdsG7blOUAFttUIXIksIl1ubtgCTmqSjLLJFR6R/OOrOij7/6T0SdW5t3Tpu1i
 MhOw==
X-Gm-Message-State: AJIora+SbbVwLMakUEx1RG70NxXf6QQPbeVrMmDLU0FkgzhwKF/JJ74r
 zIZ2UwSyMXMkMi//gB3hO0DLmTz4xe1LNjCD1Oivda0abgc5i4mLehPpc2m6hxMwz/6rVgoDc0p
 Tg5v78qcXq1y9Kk4=
X-Received: by 2002:a05:6000:1f8d:b0:21b:aaec:ebae with SMTP id
 bw13-20020a0560001f8d00b0021baaecebaemr17183689wrb.274.1656404885443; 
 Tue, 28 Jun 2022 01:28:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sDOYcqQz0GbkjrNamhe7oTHW0oNW90EMNrddp4K6YlRkjSsWDVBNkSe2VHMMG06V5Ek2rthA==
X-Received: by 2002:a05:6000:1f8d:b0:21b:aaec:ebae with SMTP id
 bw13-20020a0560001f8d00b0021baaecebaemr17183664wrb.274.1656404885206; 
 Tue, 28 Jun 2022 01:28:05 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a5d6b8c000000b0020c5253d8fcsm15389129wrx.72.2022.06.28.01.28.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jun 2022 01:28:04 -0700 (PDT)
Message-ID: <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
Date: Tue, 28 Jun 2022 10:28:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Ani Sinha <ani@anisinha.ca>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com
References: <CAARzgwwf_WRWzbwPorpa-4XN7T6f6D7CRo70+07Z8LgZO+5Spg@mail.gmail.com>
 <20220628021757-mutt-send-email-mst@kernel.org>
 <CAARzgwyWK2HNbz=9=uoA+DDTpnn2q3CRmYVyjLwfMs1wi24-LA@mail.gmail.com>
 <20220628024810-mutt-send-email-mst@kernel.org>
 <CAARzgww9KKx7fTw7WMMTb3PCQgdwJwS34X0jHhQ+41OrMWZazg@mail.gmail.com>
 <4e1c2a45-eb53-e210-1ce1-05837bf1e7c3@redhat.com>
 <20220628030749-mutt-send-email-mst@kernel.org>
 <7bf5976e-8277-7c78-f412-44f7be8754f4@redhat.com>
 <YrqyWhu8ThAcUGI4@redhat.com>
 <CAARzgwyZNAYK3p16wjeykoCB9C+tmznY+OZAM-vw+Pn_4CdMqQ@mail.gmail.com>
 <Yrq6anPW60FkjmK6@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <Yrq6anPW60FkjmK6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/06/2022 10.23, Daniel P. Berrangé wrote:
> On Tue, Jun 28, 2022 at 01:21:35PM +0530, Ani Sinha wrote:
>> On Tue, Jun 28, 2022 at 1:19 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>
>>> On Tue, Jun 28, 2022 at 09:25:35AM +0200, Thomas Huth wrote:
>>>> On 28/06/2022 09.10, Michael S. Tsirkin wrote:
>>>>> On Tue, Jun 28, 2022 at 09:03:33AM +0200, Thomas Huth wrote:
>>>>>>>>>>>> No problem with that. So that's venv. But do we need pip and pulling
>>>>>>>>>>>> packages from the net during testing?
>>>>>>>>>>>
>>>>>>>>>>> We do that too. See requirements.txt in tests/
>>>>>>>>>>> Following two are downloaded:
>>>>>>>>>>> avocado-framework==88.1
>>>>>>>>>>> pycdlib==1.11.0
>>>>>>>>>>>
>>>>>>>>>>> Also see this line in Makefie.include:
>>>>>>>>>>>
>>>>>>>>>>> $(call quiet-venv-pip,install -r $(TESTS_VENV_REQ))
>>>>>>>>>>
>>>>>>>>>> Right but that's avocado since it pulls lots of stuff from
>>>>>>>>>> the net anyway.
>>>>>>>>>> Are the libraries in question not packaged on major distros?
>>>>>>>>>
>>>>>>>>> Currently I only need this:
>>>>>>>>> https://github.com/python-tap/tappy
>>>>>>>>> which is the basic TAP processing library for python.
>>>>>>>>>
>>>>>>>>> It seems its only installed through pip:
>>>>>>>>> https://tappy.readthedocs.io/en/latest/
>>>>>>>>>
>>>>>>>>> I do not think this is packaged by default. It's such a basic library
>>>>>>>>> for parsing test output that maybe we can keep this somewhere within
>>>>>>>>> the python src tree? Not sure ...
>>>>>>>>
>>>>>>>> It's pretty small for sure. Another submodule?
>>>>>>>
>>>>>>> Unlike BITS, this one is likely going to be maintained for a while and
>>>>>>> will receive new releases through
>>>>>>> https://pypi.org/project/tap.py/
>>>>>>> so forking is OK but someone has to keep this updated.
>>>>>>>
>>>>>>> I am open to anything. Whatever feels right is fine to me.
>>>>>>
>>>>>> John Snow is currently working on the "Pythonification" of various QEMU
>>>>>> bits, I think you should loop him into this discussion, too.
>>>>>>
>>>>>>    Thomas
>>>>>
>>>>> submodule does not mean we fork necessarily. We could have
>>>>> all options: check for the module and use it if there, if not
>>>>> use one from system if not there install with pip ..
>>>>> But yea, I'm not sure what's best either.
>>>>
>>>> submodules create a dependency on an internet connection, too. So before you
>>>> add yet another submodule (which have a couple of other disadvantages), I
>>>> think you could also directly use the venv here.
>>>
>>> Definitely not submodules.
>>>
>>> We need to get out of the mindset that submodules are needed for every new
>>> dependancy we add. Submodules are only appropriate if the external project
>>> is designed to be used as a copylib (eg the keycodemapdb tool), or if we
>>> need to bundle in order to prevent a regression for previously deployed
>>> QEMU installs where the dependancy is known not to exist on all our
>>> supported platforms.
>>>
>>> This does not apply in this case, because the proposed use of tappy is
>>> merely for a test case. Meson just needs to check if tappy exists and if
>>> it does, then use it, otherwise skip the tests that need it. The user can
>>> arrange to install tappy, as they do with the majority of other deps.
>>>
>>> If John's venv stuff is relevant, then we don't even need the meson checks,
>>> just delegate to the venv setup.
>>>
>>> Regardless, no submodules are needed or desirable.
>>
>> What about keeping biosbits stuff? Source or pre-built.
> 
> Shipping them as pre-built binaries in QEMU is not a viable option
> IMHO, especially for grub as a GPL'd project we need to be extremely
> clear about the exact corresponding source and build process for any
> binary.
> 
> For this kind of thing I would generally expect the distro to provide
> packages that we consume. Looking at biosbits I see it is itself
> bundling a bunch more 3rd party projects, libffi, grub2, and including
> even an ancient version of python as a submodule.
> 
> So bundling a pre-built biosbits in QEMU appears to mean that we're in
> turn going to unexpectedly bundle a bunch of other 3rd party projects
> too, all with dubious license compliance. I don't think this looks like
> something we should have in qemu.git or qemu tarballs. It will also
> make it challenging for the distro to take biosbits at all, unless
> those 3rd party bundles can be eliminated in favour of using existing
> builds their have packaged for grub, python, libffi, etc.

So if this depends on some third party binary bits, I think this is pretty 
similar to the tests in the avocado directory ... there we download third 
party binaries, too... Wouldn't it make sense to adapt your tests to that 
framework?

  Thomas


