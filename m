Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 410CB344D66
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 18:33:38 +0100 (CET)
Received: from localhost ([::1]:41984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOOQq-0007CL-QW
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 13:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOOI5-00085k-IG; Mon, 22 Mar 2021 13:24:33 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:36489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOOI2-00047E-6q; Mon, 22 Mar 2021 13:24:31 -0400
Received: by mail-wr1-x42d.google.com with SMTP id k8so17984319wrc.3;
 Mon, 22 Mar 2021 10:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=79Y4L14IAt50OsTVwjnz9W3HPh82gJScb9Nsga8N2Kc=;
 b=NxFchQ9Cf/7iPoIoZQTF3fcuCi5XninUiXr9blF+OhA8vcg6RqgiM+befi8RwxS8mX
 qtPa88xrcbNTMi8JRXtRWfElNyCmWcgfJov0zqb80CH0WRryQ9qclsd2u3i1cS/oG12H
 oRMdW2qcCRBLF8ooeweisyDvf3zB9FNn4bFYwQmxMEpjNgQUSAqFveLJsrvnYtTOxYQW
 j/nz1PtwBZe+XyzS4uRMYEzs649M24TWwd8hCSaHJByzJAc2YESPFm2JszLSsC707+5p
 JB7xd8ajmqq3RZ3jR8QXePFuQASpHbnbLU9XTBDtjFhlGAF9v1tfDpqZpmUMfWRtWudR
 UdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=79Y4L14IAt50OsTVwjnz9W3HPh82gJScb9Nsga8N2Kc=;
 b=jRvYk77+tVM0uJQNSB/aY9v9iqLRkULoGckJz+sLMrISeugLr4u0j9w/ibDGBbafY0
 CoLFX4tNhsPIFgpzSCcuQTx+4MUrgrv7Y6aYpK/ave/iNn279TjquoSw5pzmc3mOZbHc
 AD7s3nEY8MQPo3zG3EBkk3zHir+/AQuYJK/fxMexqe4ercL02dYDgcaWg5Hx0Hyd/L7y
 jkL7eHnsONiCs8okidwqgyGfDhbmskRAoW5w26khi7zYOYggbGPte5qTcshBZBgrsE9t
 VfI5qL0nj+roVppgvrs4CyGfsE6rHYH0+EQpv+7k7pf7VMMzqrTKz/SRkh6J203lMilW
 yjqA==
X-Gm-Message-State: AOAM532rTMSgkY3EnU58X41lpknwmQRih92Jbty7frYaxQlS7rp58bqL
 /+2wWDVGNJZoFP9HT2kxVWQ=
X-Google-Smtp-Source: ABdhPJzDofEpHoq/mVJQBbDgkhsePFie3r2CkQ/yjK7O1rj+u/WPjh/k9hXHp3/d+wF389rHNnVnxw==
X-Received: by 2002:adf:fe01:: with SMTP id n1mr567269wrr.341.1616433868030;
 Mon, 22 Mar 2021 10:24:28 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id c16sm24782189wrs.81.2021.03.22.10.24.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 10:24:27 -0700 (PDT)
Subject: Re: [PATCH v3 2/5] tests/acceptance/boot_linux_console: remove
 Armbian 19.11.3 bionic test for orangepi-pc machine
To: Willian Rampazzo <wrampazz@redhat.com>
References: <20210304203540.41614-1-nieklinnenbank@gmail.com>
 <20210304203540.41614-3-nieklinnenbank@gmail.com>
 <CAKJDGDZq_ioF91BUWRo_y0GKYGbjgZa46Pt83wp7t3b_ZC=ixw@mail.gmail.com>
 <4d6d2e89-1152-249b-fe55-d1b611fd77e8@redhat.com>
 <CAPan3WqJHFy=GKVXFHgDbTimmZsBueUUhxvs4L+D58J-JQF3ew@mail.gmail.com>
 <CAKJDGDaUrbVpmNRvJvc+psWXzNUk6s=u8NxsR6E727UjiwsjeQ@mail.gmail.com>
 <CAKJDGDZ2yf_Z1y6qxmet=6rtH90C1BZ_cOGNW41Jk-d1EzJFwQ@mail.gmail.com>
 <fe4d5ba3-643a-70c0-417f-73d5ccb5acda@amsat.org>
 <CAAdtpL6vejm+ud+dJ8s4sQ-29P6-zP8LeZ4Hk92KKFrcA_TYhw@mail.gmail.com>
 <CAKJDGDaB1x1_6tb1Xh-NSs-Xu6iRp6W4oJC6Nkb2SqSg-E-8HA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f41851ea-b696-d3a7-9753-a1a1cc5fa6d6@amsat.org>
Date: Mon, 22 Mar 2021 18:24:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAKJDGDaB1x1_6tb1Xh-NSs-Xu6iRp6W4oJC6Nkb2SqSg-E-8HA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>,
 Cleber Rosa Junior <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/21 6:12 PM, Willian Rampazzo wrote:
> Hi Philippe,
> 
> On Mon, Mar 22, 2021 at 1:59 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> On Mon, Mar 22, 2021 at 5:54 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>
>>> Hi Willian,
>>>
>>> On 3/8/21 9:44 PM, Willian Rampazzo wrote:
>>>> On Mon, Mar 8, 2021 at 5:41 PM Willian Rampazzo <wrampazz@redhat.com> wrote:
>>>>>
>>
>>>>>>>>> -    def do_test_arm_orangepi_uboot_armbian(self, image_path):
>>>>>>>>> +    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
>>>>>>>>> +                'Test artifacts fetched from unreliable apt.armbian.com')
>>>>>>>>> +    @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage limited')
>>>>>>>>> +    def test_arm_orangepi_bionic_20_08(self):
>>>>>>>>> +        """
>>>>>>>>> +        :avocado: tags=arch:arm
>>>>>>>>> +        :avocado: tags=machine:orangepi-pc
>>>>>>>>> +        :avocado: tags=device:sd
>>>>>>>>> +        """
>>>>>>>>> +
>>>>>>>>> +        # This test download a 275 MiB compressed image and expand it
>>>>>>>>> +        # to 1036 MiB, but the underlying filesystem is 1552 MiB...
>>>>>>>>> +        # As we expand it to 2 GiB we are safe.
>>>>>>>>> +
>>>>>>>>> +        image_url = ('https://dl.armbian.com/orangepipc/archive/'
>>>>>>>>> +                     'Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz')
>>>>>>>>
>>>>>>>> The Armbian 20 is not available on this link anymore. I can browse just 21.
>>>>>>>
>>>>>>> Cat-and-mouse game *sigh*.
>>>
>>> 2021-03-22 17:18:10,701 download         L0067 INFO | Fetching
>>> https://archive.armbian.com/orangepipc/archive/Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz
>>> -> /home/phil/avocado/da
>>> ta/cache/by_location/f2eb27a12b81ce15e93f340fabbced2136af1caa/Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz.nfwdzivg
>>> 2021-03-22 17:18:11,263 asset            L0136 INFO | Temporary asset
>>> file unavailable due to failed download attempt.
>>> 2021-03-22 17:18:11,263 asset            L0368 ERROR| URLError: <urlopen
>>> error [Errno 113] No route to host>
>>>
>>> It might be a temporary problem, but looking long term the
>>> current setup doesn't scale IMHO.
>>
>> Also I just noticed I *do* have the image cached, even twice:
>>
>> $ find /home/phil/avocado/data/cache/by_location/ -name
>> Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz -ls
>>   131661 280768 -rw-rw-r--   1 phil     phil     287501560 Oct 23
>> 12:45 /home/phil/avocado/data/cache/by_location/cac379e6a4480624b000dfde1b5d935454254ce2/Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz
>>   131761 280776 -rw-rw-r--   1 phil     phil     287501560 Feb 20
>> 00:39 /home/phil/avocado/data/cache/by_location/aac619d9e7ea3726ebc86c159fddfb9d3f6274a5/Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz
>>
>> But the hash is different.
>>
> 
> You have 2 images because you fetched them from different locations.
> When you fetch by location, the assets go to the directory
> representing the hash of the location, This allows, for example, the
> fetch of multiple initrd or vmlinuz files from different locations,
> representing different files, but with the same name. Also, this was
> one of your requests some time ago :)

My request because we were fetching different artifacts for different
tests but all files had the same filename, i.e.:

url1://path1/to/vmlinux
url2://path2/to/vmlinux
url3://yet/another/path/to/vmlinux

I was obviously short sighted.

> What Beraldo worked on in the last week was a way to remove "unused"
> files. Your cache is a good example of files that are not necessary
> anymore because now you are using a different location to fetch them.

OK, I'll watch closely how you decide a cached file is "unused"...

> 
>> Cleber, why not use the blob hash as a cache key? It is supposed to be
>> constant...
>>
> 
> You can do that by setting the test to download the file by name, and
> not by location.

How so? Isn't it what I just described earlier we wanted to avoid?

> 
>> Cc'ing Beraldo because I guess remember he worked on improving Avocado cache.
>>
>>>>>> Just to clarify here: in this patch I wanted to only make the change to remove the test for the 19.11.3 image.
>>>>>> And in the 3rd patch (tests/acceptance/boot_linux_console: change URL for test_arm_orangepi_bionic_20_08)
>>>>>> do the update for to correct the 20.08 link. So each patch fixes one problem at a time.
>>
> 
> 

