Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1BA344C65
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 17:55:33 +0100 (CET)
Received: from localhost ([::1]:48636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lONq0-0005X6-TH
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 12:55:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lONoc-0004EE-1c; Mon, 22 Mar 2021 12:54:06 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:55229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lONoa-0004Xw-1f; Mon, 22 Mar 2021 12:54:05 -0400
Received: by mail-wm1-x32a.google.com with SMTP id k128so7194867wmk.4;
 Mon, 22 Mar 2021 09:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NrkSANF7vVr/Qu+k6+aAbWnid3WXUwNHltpU/0logVM=;
 b=af/dwv48/h2YtZ34rbEEq5mviiHwdck0qHGIE5vTvAhQ9FDkoRam5u4CL4IczijC+M
 rsn6q505jR6WanIbNFTGASRKEU2zQ8rhD/Z7oRg0wG+IsH8ecOucqw5Wj9iGuEfbAP1j
 bSDl5d/a3Fxu8qmyfgs1dZIczo9vMIcRq3RMbl/RaaZydMRyFEuPB3brMExBoWyHWaNg
 TfwopGUh9uhsjqLJkC5rL9ciK5PuNoj9Qv/0Pqv5R0lA4UpU+qVQPz9aM+0fws02jZRk
 n3PjkrhWARzdpXOj9CvLKuEvI+Rn10lzKVNG4S3wTIvzhoqLbkO0kfH14aqtNGJwJmxL
 bEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NrkSANF7vVr/Qu+k6+aAbWnid3WXUwNHltpU/0logVM=;
 b=d46pbG/Z+/aceRKEc4z1msjMSM1tiEpkZQv09lJxp/Ao9EGyc4ImXDl7pkUPE9nYhy
 GEWptlYNIDBxdThPeY+Ywy2dOXGTz8JLQxHfgRkKLII42XGGSrZw/TJp+xbhpOQoVccH
 Y0QxktzUd4uPKXFowQuv2zbu3CEwQRnv4rPvQGEUe7fhZSWJRh9iFyjlNd8ZBewuMMUL
 GmE+XlUdF6u8/YBiAdMtnHRw6bK4kPbzoODu1ZhljMbfoG4rgheW77y3GgGlP8wotZ1r
 +d5HIKfbWv/HkpyT8wb6XDYGb+KsuEa8FKsDHEPrjQ7C+TE4yBTzi7+Ujtd3Mlp0RPgC
 kGuA==
X-Gm-Message-State: AOAM531A+M4Xt/ULeUsiJiMxI+xhE5hozTtNU2D0AHa/N1nO7NxuxBeA
 Yd9ptW8JSyhuotGm0zRayK0=
X-Google-Smtp-Source: ABdhPJyz9WcoY8Dh1xdYrByW8Rh6n8iudQVWIXy/2xFQ2V+J+A9mzf+ZgeVOxKbJgNRbI45GZtmmmA==
X-Received: by 2002:a1c:9d0e:: with SMTP id g14mr34333wme.30.1616432041836;
 Mon, 22 Mar 2021 09:54:01 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id h8sm20328543wrt.94.2021.03.22.09.54.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 09:54:01 -0700 (PDT)
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fe4d5ba3-643a-70c0-417f-73d5ccb5acda@amsat.org>
Date: Mon, 22 Mar 2021 17:53:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAKJDGDZ2yf_Z1y6qxmet=6rtH90C1BZ_cOGNW41Jk-d1EzJFwQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
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
 Daniel Berrange <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>,
 Cleber Rosa Junior <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Willian,

On 3/8/21 9:44 PM, Willian Rampazzo wrote:
> On Mon, Mar 8, 2021 at 5:41 PM Willian Rampazzo <wrampazz@redhat.com> wrote:
>>
>> On Mon, Mar 8, 2021 at 5:32 PM Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
>>>
>>> Hi Philippe, Willian,
>>>
>>> On Mon, Mar 8, 2021 at 8:52 AM Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>>>
>>>> On 3/5/21 4:16 PM, Willian Rampazzo wrote:
>>>>> On Thu, Mar 4, 2021 at 5:44 PM Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
>>>>>>
>>>>>> The image for Armbian 19.11.3 bionic has been removed from the armbian server.
>>>>>> Without the image as input the test arm_orangepi_bionic_19_11 cannot run.
>>>>>>
>>>>>> This commit removes the test completely and merges the code of the generic function
>>>>>> do_test_arm_orangepi_uboot_armbian back with the 20.08 test.
>>>>>>
>>>>>> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
>>>>>> ---
>>>>>>  tests/acceptance/boot_linux_console.py | 72 ++++++++------------------
>>>>>>  1 file changed, 23 insertions(+), 49 deletions(-)
>>>>>>
>>>>>> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
>>>>>> index eb01286799..9fadea9958 100644
>>>>>> --- a/tests/acceptance/boot_linux_console.py
>>>>>> +++ b/tests/acceptance/boot_linux_console.py
>>>>>> @@ -802,7 +802,29 @@ def test_arm_orangepi_sd(self):
>>>>>>          # Wait for VM to shut down gracefully
>>>>>>          self.vm.wait()
>>>>>>
>>>>>> -    def do_test_arm_orangepi_uboot_armbian(self, image_path):
>>>>>> +    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
>>>>>> +                'Test artifacts fetched from unreliable apt.armbian.com')
>>>>>> +    @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage limited')
>>>>>> +    def test_arm_orangepi_bionic_20_08(self):
>>>>>> +        """
>>>>>> +        :avocado: tags=arch:arm
>>>>>> +        :avocado: tags=machine:orangepi-pc
>>>>>> +        :avocado: tags=device:sd
>>>>>> +        """
>>>>>> +
>>>>>> +        # This test download a 275 MiB compressed image and expand it
>>>>>> +        # to 1036 MiB, but the underlying filesystem is 1552 MiB...
>>>>>> +        # As we expand it to 2 GiB we are safe.
>>>>>> +
>>>>>> +        image_url = ('https://dl.armbian.com/orangepipc/archive/'
>>>>>> +                     'Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz')
>>>>>
>>>>> The Armbian 20 is not available on this link anymore. I can browse just 21.
>>>>
>>>> Cat-and-mouse game *sigh*.

2021-03-22 17:18:10,701 download         L0067 INFO | Fetching
https://archive.armbian.com/orangepipc/archive/Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz
-> /home/phil/avocado/da
ta/cache/by_location/f2eb27a12b81ce15e93f340fabbced2136af1caa/Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz.nfwdzivg
2021-03-22 17:18:11,263 asset            L0136 INFO | Temporary asset
file unavailable due to failed download attempt.
2021-03-22 17:18:11,263 asset            L0368 ERROR| URLError: <urlopen
error [Errno 113] No route to host>

It might be a temporary problem, but looking long term the
current setup doesn't scale IMHO.

>>> Just to clarify here: in this patch I wanted to only make the change to remove the test for the 19.11.3 image.
>>> And in the 3rd patch (tests/acceptance/boot_linux_console: change URL for test_arm_orangepi_bionic_20_08)
>>> do the update for to correct the 20.08 link. So each patch fixes one problem at a time.
>>>
>>> Does that make sense, or do you prefer that I combine them in a single patch instead?
>>
>> Ops, I forgot about the 3rd patch in this series. That makes sense to
>> me, sorry for the mess.
>>
> 
> And, in this case,
> 
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> 
>>>
>>> Regards,
>>> Niek
>>>
>>> --
>>> Niek Linnenbank
>>>
> 


