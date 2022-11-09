Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 892A1622F27
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 16:39:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osnAl-0006WA-En; Wed, 09 Nov 2022 10:39:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1osnAe-0006ER-V9
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 10:39:21 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1osnAV-0005SF-GX
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 10:39:20 -0500
Received: by mail-oi1-x22b.google.com with SMTP id l127so19172057oia.8
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 07:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FuGNQafKtIjmYyQ6dCGqMZHuyWXuGpT7BHjqJWaj2jE=;
 b=ekCu3s+MrlIDm77n10i5vUWq6yORkdEQ+ESk7YIeltDlYccut0GdpwD9LYDp6+TfOe
 nFduzHRBMXf56cPa8nkcK1QLsBuLjhLl4c86QtNlAHVIIvYRjbn/39vP9kP4FWsUp0P2
 bspitp9XjP6BJ6te+zKR9+XNsjPXy+MDYjG1cBEY/rq/D3wY6Kezy9+THyC/XWVUcQTc
 rI/xtdZU8HC2RpOUqWMDK9IejMOEOi51hHBSltl3aq8jDHlhqwPBcN9z5a2Jt8Wp5haS
 7erU0P5La2pOxWHHLVGZ7H+yXHlgcMa/Aq4TcHZcYjS+DeC7zjXcBkXxJJ58OmLbH4pm
 i4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FuGNQafKtIjmYyQ6dCGqMZHuyWXuGpT7BHjqJWaj2jE=;
 b=X4+Q1v6+e9NQ3fmKTWK0lk6ggEQbRWKvbr2wNWBOAbhLJcYvq5Ry2Ur0EdjgZgf3Xz
 /KWY4C2bzsmZZTfK7snVnswhTSqE4/p8DrgITZkJTRq9ONbtrMJ/LSGmwdXrIEBY57yH
 84LzMIE2He2e12OQIcxaUggWNU3arZbGQlo9Hm2INMW69S2TIE+PaonnqdLObvGDIeuZ
 gSMgekxodc7IntxaF5sw/Ti5tWZHX60jKx4EQSn8udG5dwtpdI7s3jsX7rPGCc8m4yHL
 n9SbbND8zgyYnSITfskLrxp3VbxCa+qkZAvvyUyMJ5rIxPoULkr9xjkZARzw0ID8M7vo
 Vu8w==
X-Gm-Message-State: ACrzQf0RpYjNcyeEQVSJPbIb/EirK3XQwP6o/iMJr9mDroZ7A95+pCfl
 Y1/TTdRuT9r5qOxqvEmLJOk=
X-Google-Smtp-Source: AMsMyM7LpA+LooS9WRzyoPfQ2xM9XsqM0UYatlKG9if3vPqZlkoTzdy8rOJPJpLXLtrtUeQ6sQxdJw==
X-Received: by 2002:a05:6808:1205:b0:354:2815:4f3c with SMTP id
 a5-20020a056808120500b0035428154f3cmr41990985oil.26.1668008350059; 
 Wed, 09 Nov 2022 07:39:10 -0800 (PST)
Received: from [192.168.10.102] ([187.34.29.120])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a4aaa02000000b0049eedb106e2sm3019832oom.15.2022.11.09.07.39.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 07:39:09 -0800 (PST)
Message-ID: <2a26f704-cfbe-8965-a7c4-24ab62c1a651@gmail.com>
Date: Wed, 9 Nov 2022 12:39:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] avocado: use sha1 for fc31 imgs to avoid first time
 re-download
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20221022170350.936685-1-danielhb413@gmail.com>
 <Y1ZUsauC6F3yDuny@redhat.com>
 <8d2d7c90-288f-387f-e474-7eefe47005e8@redhat.com>
 <Y1pI2Tg9VTNwrrEE@redhat.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <Y1pI2Tg9VTNwrrEE@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 10/27/22 06:01, Daniel P. Berrangé wrote:
> On Thu, Oct 27, 2022 at 09:46:29AM +0200, Thomas Huth wrote:
>> On 24/10/2022 11.02, Daniel P. Berrangé wrote:
>>> On Sat, Oct 22, 2022 at 02:03:50PM -0300, Daniel Henrique Barboza wrote:
>>>> 'make check-avocado' will download any images that aren't present in the
>>>> cache via 'get-vm-images' in tests/Makefile.include. The target that
>>>> downloads fedora 31 images, get-vm-image-fedora-31, will use 'avocado
>>>> vmimage get  --distro=fedora --distro-version=31 --arch=(...)' to
>>>> download the image for each arch. Note that this command does not
>>>> support any argument to set the hash algorithm used and, based on the
>>>> avocado source code [1], DEFAULT_HASH_ALGORITHM is set to "sha1". The
>>>> sha1 hash is stored in a Fedora-Cloud-Base-31-1.9.{ARCH}.qcow2-CHECKSUM
>>>> in the cache.
>>>
>>>> For now, in QEMU, let's use sha1 for all Fedora 31 images. This will
>>>> immediately spares us at least one extra download for each Fedora 31
>>>> image that we're doing in all our CI runs.
>>>>
>>>> [1] https://github.com/avocado-framework/avocado.git @ 942a5d6972906
>>>> [2] https://github.com/avocado-framework/avocado/issues/5496
>>>
>>> Can we just ask Avocado maintainers to fix this problem on their
>>> side to allow use of a modern hash alg as a priority item. We've
>>> already had this problem in QEMU for over a year AFAICT, so doesn't
>>> seem like we need to urgently do a workaround on QEMU side, so we
>>> can get Avocado devs to commit to fixing it in the next month.
>>
>> Do we have such a commitment? ... The avocado version in QEMU is completely
>> backlevel these days, it's still using version 88.1 from May 2021, i.e.
>> there hasn't been any update since more than a year. I recently tried to
>> bump it to a newer version on my own (since I'm still suffering from the
>> problem that find_free_port() does not work if you don't have a local IPv6
>> address), but it's not that straight forward since the recent versions of
>> avocado changed a lot of things (e.g. the new nrunner - do we want to run
>> tests in parallel? If so it breaks a lot of the timeout settings, I think),
>> so an update needs a lot of careful testing...
> 
> That it is so difficult to update Avocado after barely more than
> 1 year is not exactly a strong vote of confidence in our continued
> use of Avocado long term :-(


By the way, Avocado just provided a fix for the problem this patch is trying
to amend:

https://github.com/avocado-framework/avocado/pull/5515#issuecomment-1308872846


Is there an easy way to plug upstream Avocado into QEMU? I would like to test
tests/avocado/boot_linux.py:BootLinuxPPC64.test_pseries_tcg to see if the problem
is fixed by Avocado upstream.


Thanks,


Daniel


> 
> With regards,
> Daniel

