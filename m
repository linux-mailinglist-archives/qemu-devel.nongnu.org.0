Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0F64DA288
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 19:40:17 +0100 (CET)
Received: from localhost ([::1]:59858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUC5g-0002T2-Hh
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 14:40:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUC1a-0000XG-1F
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 14:36:05 -0400
Received: from [2607:f8b0:4864:20::62f] (port=37641
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUC1Y-0004WU-3U
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 14:36:01 -0400
Received: by mail-pl1-x62f.google.com with SMTP id n2so16929912plf.4
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 11:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6Xsgvoqjmha2hwcMnvue8R3lfPgoVYwCT9C4bzuwC3E=;
 b=MFqBIf9QnwppGT+jCkpt+vbiinH+7AkJj32tOXJRI5sepm2d/I5NnX7YVPEZXmXN62
 +a26eB1fXUsd/cwu4Hco3YW+m6JFsDrtYYdUqyMeRuBtMqjvsOSIZhySbElMrv/Fufwn
 md4w6pXnESS9HdGqtbwvGoMxEoDRtYeRaD30G9F8kMxWhzmQagU3CPEYl+QTzl4+AAQF
 nCje7W7oacwXDX1+ZeaSoKuxOWNmWvQKCHr1p3CoAu5YggKsIzgVO0GkAQ8Ac5DUMYvX
 gDMcI6uNSKqHpGi5kWeBqEZxN7cnfXYulY8OwaiF4VziZfOvITh3nq26E9mWisIF1HSb
 w+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6Xsgvoqjmha2hwcMnvue8R3lfPgoVYwCT9C4bzuwC3E=;
 b=PVf1bqrac+A1TPEFAoCYVJHDyq4npseTOhvmLyV7ozCpwBaDdGoJTIJvJci567WC9J
 kOMcqWiQZnp2XCbxzx5VqyOT40eZa+GpX7vHIgNhqC65UI4x0AWSwcYSAoCB0gDTfFf6
 WbOJGKT1p0rXXEc3GXhdz60DSvddCtJhXPopOD+YNPTWdahrSuYWSUOOCEE4gVjLy7Y2
 Ey/yIJJcnu2Emkc2HCcyE1Jtmypelsfn7kzDrG+d3d4mXPxZqgwd4Fkl8KwkgDau7L2C
 Mm4JTKJU6rFrZZVKNnyvqOxVj8F/ZHuwfZBdNFqz934+ubfxFYQtkRQk7yfj0fvu8oj6
 57gg==
X-Gm-Message-State: AOAM5313O1dUOH9/Cmb/C1P3DGnygSDtwijMFvJv3APion8e3nQs3bYE
 GxZZUcolr8DaDpSVzJAEV6U=
X-Google-Smtp-Source: ABdhPJwOQNgzzsrPDxjtgPn5xWuh50F1VsEnnhdDB1CQaO6X9pZ2Pq62x+pU6a3GD0YNeJj1PkvIWQ==
X-Received: by 2002:a17:902:f612:b0:14c:e978:f99e with SMTP id
 n18-20020a170902f61200b0014ce978f99emr29086524plg.23.1647369358642; 
 Tue, 15 Mar 2022 11:35:58 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 2-20020a631342000000b0037487b6b018sm20269448pgt.0.2022.03.15.11.35.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 11:35:58 -0700 (PDT)
Message-ID: <7dd4fd1f-5575-70f9-c476-b3159cc5990c@gmail.com>
Date: Tue, 8 Mar 2022 14:19:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PULL v2 00/47] virtio,pc,pci: features, cleanups, fixes
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20220307100058.449628-1-mst@redhat.com>
 <CAFEAcA94Uu=kyinf+pLUT2cY05326EDX=TKUeiSJH_aEY-kPVg@mail.gmail.com>
 <CAFEAcA_wO6dkr6=HUYsOS7RxGErrAvsNnNqhKfM733Q=4v6cdw@mail.gmail.com>
 <20220307174713-mutt-send-email-mst@kernel.org>
 <CAFEAcA9qUMuDupNRCYeH5rzBY+J7D3XXN_92PJjhBYxF70kF=w@mail.gmail.com>
 <20220308055639-mutt-send-email-mst@kernel.org>
 <CAFEAcA-3iD3hz2ihSDOir6ByWztAjNUkAvCSbeeX7-osMQLTdg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <CAFEAcA-3iD3hz2ihSDOir6ByWztAjNUkAvCSbeeX7-osMQLTdg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: 27
X-Spam_score: 2.7
X-Spam_bar: ++
X-Spam_report: (2.7 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/3/22 12:18, Peter Maydell wrote:
> On Tue, 8 Mar 2022 at 11:01, Michael S. Tsirkin <mst@redhat.com> wrote:
>>
>> On Tue, Mar 08, 2022 at 09:05:27AM +0000, Peter Maydell wrote:
>>> On Mon, 7 Mar 2022 at 22:52, Michael S. Tsirkin <mst@redhat.com> wrote:

>>>> Now, I could maybe get behind this if it simply warned about a cast that
>>>> loses information (cast to a smaller integer) or integer/pointer cast
>>>> that does not go through uintptr_t without regard to size.
>>>
>>> This *is* warning about losing information. On 64-bit Windows
>>> pointers are 64 bits but 'long' is 32 bits, so the path
>>> pointer -> long -> uint64_t drops the top half of the pointer.
> 
>> Yes obviously. My point is that this:
>> (uint64_t)hdev->vqs[queue].avail
>> is always harmless but it warns on a 32 bit system.
> 
> True, I suppose. But compiler warnings are often like that: we
> take the hit of having to tweak some things we know to be OK in
> order to catch the real bugs in other cases.
> 
>> And someone trying to fix that *is* what resulted in
>> (uint64_t)(unsigned long)hdev->vqs[queue].avail
> 
> Using 'unsigned long' in a cast (or anything else) is often
> the wrong thing in QEMU...

$ git grep -F '(unsigned long)' | wc -l
      273

Ouch :/

These require cleanup:

target/i386/sev.c:170:    input.data = (__u64)(unsigned long)data;
target/i386/sev.c:188:    arg.data = (unsigned long)data;
target/i386/sev.c:243:    range.addr = (__u64)(unsigned long)host;
target/i386/sev.c:273:    range.addr = (__u64)(unsigned long)host;
target/i386/sev.c:730:    update.uaddr = (__u64)(unsigned long)addr;

And we might add a Gitlab issue to look at the hw/ ones:

$ git grep -F '(unsigned long)' hw | wc -l
       76

