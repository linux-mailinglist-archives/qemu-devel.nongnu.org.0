Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1CF32A4BD
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 16:46:42 +0100 (CET)
Received: from localhost ([::1]:51530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH7EP-00085m-7W
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 10:46:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lH7Cz-0007Dq-FO
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 10:45:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lH7Cx-0002cz-2H
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 10:45:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614699910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dRYci0YTJg1XRUYrcoUCR8JjlQP5V6DMrPCPNNEFioA=;
 b=fsFwrnwX2+K9eTEcUzV73/p9cHhCr1f6NcijV7TlJB/5S0vWkpVfBThnn80h9/7U2Q+ykB
 vKymDCRk8UWvSlMTJsapQaziZorN1F/xghD67vhyDuEAOTtD7BmrUXweJCyoyjxDhchywV
 oa7fWowzxh7NZIzNU4x3bec4eRIkk1o=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-WhuCaQNvMUu1lJ0e1hLuMQ-1; Tue, 02 Mar 2021 10:45:06 -0500
X-MC-Unique: WhuCaQNvMUu1lJ0e1hLuMQ-1
Received: by mail-ej1-f72.google.com with SMTP id au15so3263301ejc.8
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 07:45:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dRYci0YTJg1XRUYrcoUCR8JjlQP5V6DMrPCPNNEFioA=;
 b=a9i7k/Dr3ZasZzOhI2kxCHPLSbhnpk63OPyZ8ms6D9+ClcACBNSmQsvOAhVjchoNIe
 7XMfiSztggwAFHUUYOy129pmE7sh7ycwKxQF+WLQv15bum6lnqhUXsYJInkaA91udrjn
 YIDVYXq/BSNNoi6OMAW2cv5fqQpvpHdK6SqnfQYYXjgMoRdioDE2LDtqa8SGArtQAqn3
 qNGY7/S/KwcYOrAIZqQcBamJn4nydvMVSplJliYYDALU/lPzjSrIkP9J9T8quGb4KYHC
 QGqM459hMmS9OqBQhz44n+72d3ARpTjAmAVLCwai6CuZTewHVVqGGxlFTTwrGJYvOxn0
 b2oA==
X-Gm-Message-State: AOAM5302+gtB+jRscdzvfYd+1Ay/tGnyaRP+ljAyCfzLMP0z7UqiiCB5
 7PLxq9b1cFpTM2qX2jesn+gwHh9OItlJXNHntESaj5kRUk4J4IT+isFPCdcxibO5ONgApj4wmux
 2kQPbPGzGKufQ0oA=
X-Received: by 2002:a17:907:2112:: with SMTP id
 qn18mr12712374ejb.220.1614699904660; 
 Tue, 02 Mar 2021 07:45:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPag/o5OQN8ZRgFHLMDaXdjAPGaC0uqY6ZtYpLr+kqWWAmjxnXCUYkkWaFbExPLwqxYSi35g==
X-Received: by 2002:a17:907:2112:: with SMTP id
 qn18mr12712288ejb.220.1614699903396; 
 Tue, 02 Mar 2021 07:45:03 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b18sm17757667ejb.77.2021.03.02.07.45.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 07:45:02 -0800 (PST)
Subject: Re: [PATCH] tests/acceptance: Use imgtec.com URL for Fedora 22
 artifacts
To: Willian Rampazzo <wrampazz@redhat.com>
References: <20210228224343.310677-1-f4bug@amsat.org>
 <c11afdea-2faf-b445-cb35-05fed0c99a35@redhat.com>
 <b0dc999b-ddd1-fc4b-cd7d-56905c85616b@amsat.org>
 <CAKJDGDZzWKYrDiBPmDFBihEH=hOCymHuXZ8cNP4ZTSdLisAefA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f48c7cd7-27e5-da53-adbf-849c094a88f5@redhat.com>
Date: Tue, 2 Mar 2021 16:45:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAKJDGDZzWKYrDiBPmDFBihEH=hOCymHuXZ8cNP4ZTSdLisAefA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/21 4:27 PM, Willian Rampazzo wrote:
> Hi Phil,
> 
> On Mon, Mar 1, 2021 at 11:11 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> On 3/1/21 2:30 PM, Wainer dos Santos Moschetta wrote:
>>> Hi,
>>>
>>> On 2/28/21 7:43 PM, Philippe Mathieu-Daudé wrote:
>>>> Having artifacts stored in personal namespace is not ideal,
>>>> as these might get closed and disappear. Use the original URL
>>>> where these artifacts could be found.
>>>>
>>>> For more references:
>>>> https://fedoraproject.org/wiki/Architectures/MIPS/2015Bootstrap/mips64el
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>> ---
>>>>   tests/acceptance/boot_linux_console.py | 4 ++--
>>>>   tests/acceptance/replay_kernel.py      | 4 ++--
>>>>   2 files changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/tests/acceptance/boot_linux_console.py
>>>> b/tests/acceptance/boot_linux_console.py
>>>> index eb012867997..138bd8cb7d3 100644
>>>> --- a/tests/acceptance/boot_linux_console.py
>>>> +++ b/tests/acceptance/boot_linux_console.py
>>>> @@ -239,8 +239,8 @@ def test_mips64el_malta_5KEc_cpio(self):
>>>>           :avocado: tags=machine:malta
>>>>           :avocado: tags=endian:little
>>>>           """
>>>> -        kernel_url = ('https://github.com/philmd/qemu-testing-blob/'
>>>> -                      'raw/9ad2df38/mips/malta/mips64el/'
>>>> +        kernel_url = ('http://mipsfedora.imgtec.com/development/22/'
>>>> +                      'mips64el/images/20150601/'
>>>>                         'vmlinux-3.19.3.mtoman.20150408')
>>>
>>> http://mipsfedora.imgtec.com/development/22/mips64el/images/20150601/vmlinux-3.19.3.mtoman.20150408
>>> did not get resolve here. Could you please double-check the url is correct?
>>
>> Yes it is correct, the domain is dead. It was working when I wrote
>> the test. Should I remove the test instead?
>>
> 
> This test is already skipped by default because of the
> AVOCADO_ALLOW_UNTRUSTED_CODE flag.

QEMU's .gitlab-ci.yml does (see acceptance_definition):

  before_script:
    - mkdir -p ~/.config/avocado
    - echo "[datadir.paths]" > ~/.config/avocado/avocado.conf
    - echo "cache_dirs = ['${CI_PROJECT_DIR}/avocado-cache']"
           >> ~/.config/avocado/avocado.conf
    - echo -e '[job.output.testlogs]\nstatuses = ["FAIL", "INTERRUPT"]'
           >> ~/.config/avocado/avocado.conf
    - if [ -d ${CI_PROJECT_DIR}/avocado-cache ]; then
        du -chs ${CI_PROJECT_DIR}/avocado-cache ;
      fi
    - export AVOCADO_ALLOW_UNTRUSTED_CODE=1

> Even if the flag is set to allow
> the test to run, it will be skipped because the cache lacks the asset.

Same file, we save the cache between runs:

  cache:
    key: "${CI_JOB_NAME}-cache"
    paths:
      - ${CI_PROJECT_DIR}/avocado-cache

> Instead of removing the test, my suggestion is to add information to
> allow people to run it locally, like:
> 
> diff --git a/tests/acceptance/boot_linux_console.py
> b/tests/acceptance/boot_linux_console.py
> index eb01286799..23efc18a99 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -239,11 +239,13 @@ def test_mips64el_malta_5KEc_cpio(self):
>          :avocado: tags=machine:malta
>          :avocado: tags=endian:little
>          """
> -        kernel_url = ('https://github.com/philmd/qemu-testing-blob/'
> -                      'raw/9ad2df38/mips/malta/mips64el/'
> -                      'vmlinux-3.19.3.mtoman.20150408')
> +        # to run this test locally, download the following asset and register
> +        # it manually to the avocado cache with:
> +        #   $(BUILD_DIR)/tests/venv/bin/avocado assets register \
> +        #   vmlinux-3.19.3.mtoman.20150408 <path to the file>
> +        kernel_name = 'vmlinux-3.19.3.mtoman.20150408'

In this particular case it could work because the name is not generic,
but what about the generic names ("vmlinux" for example)?

Can't we register assets using any string to hash?

>          kernel_hash = '00d1d268fb9f7d8beda1de6bebcc46e884d71754'
> -        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
> +        kernel_path = self.fetch_asset(kernel_name, asset_hash=kernel_hash)
>          initrd_url = ('https://github.com/groeck/linux-build-test/'
>                        'raw/8584a59e/rootfs/'
>                        'mipsel64/rootfs.mipsel64r1.cpio.gz')
> diff --git a/tests/acceptance/replay_kernel.py
> b/tests/acceptance/replay_kernel.py
> index c1cb862468..180e915264 100644
> --- a/tests/acceptance/replay_kernel.py
> +++ b/tests/acceptance/replay_kernel.py
> @@ -397,11 +397,13 @@ def test_mips64el_malta_5KEc_cpio(self):
>          :avocado: tags=endian:little
>          :avocado: tags=slowness:high
>          """
> -        kernel_url = ('https://github.com/philmd/qemu-testing-blob/'
> -                      'raw/9ad2df38/mips/malta/mips64el/'
> -                      'vmlinux-3.19.3.mtoman.20150408')
> +        # to run this test locally, download the following asset and register
> +        # it manually to the avocado cache with:
> +        #   $(BUILD_DIR)/tests/venv/bin/avocado assets register \
> +        #   vmlinux-3.19.3.mtoman.20150408 <path to the file>
> +        kernel_name = 'vmlinux-3.19.3.mtoman.20150408'
>          kernel_hash = '00d1d268fb9f7d8beda1de6bebcc46e884d71754'
> -        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
> +        kernel_path = self.fetch_asset(kernel_name, asset_hash=kernel_hash)
>          initrd_url = ('https://github.com/groeck/linux-build-test/'
>                        'raw/8584a59e/rootfs/'
>                        'mipsel64/rootfs.mipsel64r1.cpio.gz')
> 
> What do you think?
> 
> ps. WARNING, above code not tested.
> 
>>>>           kernel_hash = '00d1d268fb9f7d8beda1de6bebcc46e884d71754'
>>>>           kernel_path = self.fetch_asset(kernel_url,
>>>> asset_hash=kernel_hash)
>>>> diff --git a/tests/acceptance/replay_kernel.py
>>>> b/tests/acceptance/replay_kernel.py
>>>> index c1cb8624683..efdd4233bc2 100644
>>>> --- a/tests/acceptance/replay_kernel.py
>>>> +++ b/tests/acceptance/replay_kernel.py
>>>> @@ -397,8 +397,8 @@ def test_mips64el_malta_5KEc_cpio(self):
>>>>           :avocado: tags=endian:little
>>>>           :avocado: tags=slowness:high
>>>>           """
>>>> -        kernel_url = ('https://github.com/philmd/qemu-testing-blob/'
>>>> -                      'raw/9ad2df38/mips/malta/mips64el/'
>>>> +        kernel_url = ('http://mipsfedora.imgtec.com/development/22/'
>>>> +                      'mips64el/images/20150601/'
>>>>                         'vmlinux-3.19.3.mtoman.20150408')
>>>>           kernel_hash = '00d1d268fb9f7d8beda1de6bebcc46e884d71754'
>>>>           kernel_path = self.fetch_asset(kernel_url,
>>>> asset_hash=kernel_hash)
>>>
>>
> 


