Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4435E8135
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 19:59:24 +0200 (CEST)
Received: from localhost ([::1]:36546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obmxP-0007xc-SH
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 13:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1obmor-0003Kc-Lm
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 13:50:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1obmon-0002Ie-1y
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 13:50:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663955425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OF8bqN2dPgVPti9g2dBERbILRLaZ9+tI7U3soNpJlds=;
 b=iwvPEeLqq+lprPWhqfOJLfnDVixj1jIS8P7oxuhjVV5ITOlS0aMTY0NraejKt623uIn0W7
 ZuSohzhFu+Eh8IJ6NxScue6LtlNQ5zlIFxhX7vhwycYgr7NMY4/qrmtNewTUaeIPMrhiHt
 WaK4hrnEhaQftk2hHdfxRmPaGeO7jfQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-468-qkvn5b-bO02pelFyX_1wRw-1; Fri, 23 Sep 2022 13:50:24 -0400
X-MC-Unique: qkvn5b-bO02pelFyX_1wRw-1
Received: by mail-wm1-f69.google.com with SMTP id
 c3-20020a7bc843000000b003b486fc6a40so212632wml.7
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 10:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=OF8bqN2dPgVPti9g2dBERbILRLaZ9+tI7U3soNpJlds=;
 b=qh2YYaA03roIerIsVHdNqtLkMP844ufbTgBGKota5Ow5ogRx4YPj/vXEDzoXRWCqFT
 kA4+mNiR4tF8lD+3a+M1I6cWZD/9GnKip9fTEYfmgPWFFQUx9Mj7JAJiIe9XmbwOEYaP
 twVvFdPJdxRFZZCjX9X+NLWHKVnkAghbdNdlDNRfyDIXdlBW9AuNI+ZqB+Ui3L3jTPyN
 6cs6LiC/eRQlOg43LModlUVqQXDVoW88t7pKlQbkHyDfj07jwX2ECk94lNFgRGsVzfkJ
 sp92c1I/HSZbaOvQMYn8e8Wy0ehUBLJKvuqPCZNzTwUk5O6fBuTA/FX8xVtJ0IEv/eKx
 2eUw==
X-Gm-Message-State: ACrzQf077T3o3I0QYBuZgOHLCwFIE4w6ZUizL837b9G3fQIWnyHiigoQ
 gQkNjuwhdUwKwLvVs5Nl8C/p/3zcaVz8SHVVULRayYGl1l1CBpfF4o0S/gv3UUH5svp4UsFSvc7
 uRtVF3ZVNw2Jjr9A=
X-Received: by 2002:a05:600c:3c8c:b0:3b4:aaee:31dd with SMTP id
 bg12-20020a05600c3c8c00b003b4aaee31ddmr6757274wmb.162.1663955422946; 
 Fri, 23 Sep 2022 10:50:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4666lNBho3Tc7TVsWc0mjiRQN3KuS7wfEbmrhZiJ9nTE+gHb8EjBokkPsEo3ifk6g4i9wuJA==
X-Received: by 2002:a05:600c:3c8c:b0:3b4:aaee:31dd with SMTP id
 bg12-20020a05600c3c8c00b003b4aaee31ddmr6757253wmb.162.1663955422667; 
 Fri, 23 Sep 2022 10:50:22 -0700 (PDT)
Received: from [192.168.8.103] (tmo-097-189.customers.d1-online.com.
 [80.187.97.189]) by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c190600b003a5f3f5883dsm3396620wmq.17.2022.09.23.10.50.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 10:50:21 -0700 (PDT)
Message-ID: <c512daf7-1e86-625a-68f9-050c93012ad0@redhat.com>
Date: Fri, 23 Sep 2022 19:50:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 36/39] .gitlab-ci.d/windows.yml: Increase the timeout
 to 90 minutes
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Beraldo Leal <bleal@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-37-bmeng.cn@gmail.com> <87pmfmukib.fsf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87pmfmukib.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/09/2022 18.22, Alex Bennée wrote:
> 
> Bin Meng <bmeng.cn@gmail.com> writes:
> 
>> From: Bin Meng <bin.meng@windriver.com>
>>
>> commit 9f8e6cad65a6 ("gitlab-ci: Speed up the msys2-64bit job by using --without-default-devices"
>> changed to compile QEMU with the --without-default-devices switch for
>> the msys2-64bit job, due to the build could not complete within the
>> project timeout (1h), and also mentioned that a bigger timeout was
>> getting ignored on the shared Gitlab-CI Windows runners.
>>
>> However as of today it seems the shared Gitlab-CI Windows runners does
>> honor the job timeout, and the runner has the timeout limit of 2h, so
>> let's increase the timeout to 90 minutes and drop the configure switch
>> "--without-default-devices" to get a larger build coverage.
> 
> I'd like to push back lightly against increasing the time because it
> lengthens the total run time before we can merge a branch. Ideally we
> could come up with a combination of build and tests that exercises all
> the Windows code without exhaustively testing code paths that are tested
> elsewhere. For device emulation are there any host specific things we
> are testing?

The problem is rather: With "--without-default-devices", make check is not 
working anymore since a lot of qtests expect certain devices to be around...

  Thomas


