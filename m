Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9304865E043
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 23:54:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDCbe-0000aG-Ar; Wed, 04 Jan 2023 17:51:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDCbb-0000Yy-Ha
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 17:51:31 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDCbZ-0008BH-Ou
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 17:51:31 -0500
Received: by mail-ej1-x633.google.com with SMTP id tz12so86198413ejc.9
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 14:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mDiM/k4vuauW5Rg+aB6ryu2EoPf+F4/4/PIdB/AfDAk=;
 b=vjqEqV6g7nOXWoL8+mBJJfL/tGWy+BNkVg0d3XAdnzX2B676t1YfDSsWPTMHVbn/iy
 L1A1ojKZgNgtfYb0KEJB1gpYg8FgAxRB8TIZlOApyieyz8QcwLXbUiWaPbLKxu4UYhld
 Tq0H14huJx5kLR2CRMDlRcd1tWBk3Yg4bl6+KdbfwDqQuhW7I8GH53S109BJD2oXX3NC
 n5B8xXj9KnniNQukefeFApOS4Yhw218WPH4BraT40Ikr1do0d/syZPWGo6bitolr8KGA
 joQ+9i48ngj9qbivTA1uGAmkoU25xAu4hAJnz6vzZ7eeDpNSVNXAe5Dm2OZxIrENXNSe
 5glA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mDiM/k4vuauW5Rg+aB6ryu2EoPf+F4/4/PIdB/AfDAk=;
 b=rwVjgkfFzRXqsh7h50neKoSU1Y5DWMwCIQEJNtQhB5gAgnqSoEuEoiGy87xz14d9ja
 2QT+vZvpAxJgclTmhIwhpy/NGisQN3R+j1YhPEmJzE0kTbWdatJ2iEOC/EQluootoAGV
 5lXzbTTQfiDjXdoZql+5Bm7vSJh31zQFMEa3XlCBbx4X+0+sDJ73C+DOWPb3/FeUJoAQ
 ol8xLovihe11uu5f0kvPTnAJpcoGBgRweNI94rdMEfYqtFbKpfdF/ZQ0rpt2XOMdmbmR
 91VGY2fcioFlqeHgF4rhcGFhSxwbu4+0LrNQqtAdBehRu/LH8vBK+nq9OYfxD20rhO7K
 LrRA==
X-Gm-Message-State: AFqh2kr0P/I1JtQiMqnbxi38ufFhAG1IRXJp3Z+n3RLnu0vHsqEpKIMJ
 tCqQkMMyo4qr0bGnYQU0QOx7SA==
X-Google-Smtp-Source: AMrXdXuIBQvcQU16qcqQdQgyuTS7kzrMRgjyoz8lorJ4WcrG9RccLU1z81xFmfZNDbaSxSBMd/hTSQ==
X-Received: by 2002:a17:906:85d9:b0:842:1627:77b4 with SMTP id
 i25-20020a17090685d900b00842162777b4mr43013712ejy.3.1672872687805; 
 Wed, 04 Jan 2023 14:51:27 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 gf3-20020a170906e20300b007bff9fb211fsm15782151ejb.57.2023.01.04.14.51.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 14:51:27 -0800 (PST)
Message-ID: <702ee742-70c0-d92d-353d-1eb976d7d422@linaro.org>
Date: Wed, 4 Jan 2023 23:51:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 0/6] hw/arm: Fix smpboot[] on big-endian hosts and remove
 tswap32()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Tyrone Ting <kfting@nuvoton.com>
References: <20221222215549.86872-1-philmd@linaro.org>
 <CAFEAcA8Exn0VMzM1h048q4Nm7toxkpaOv4B-ZE4FEXKgHoqy7A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA8Exn0VMzM1h048q4Nm7toxkpaOv4B-ZE4FEXKgHoqy7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
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

On 3/1/23 18:43, Peter Maydell wrote:
> On Thu, 22 Dec 2022 at 21:55, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> ARM CPUs fetch instructions in little-endian.
>>
>> smpboot[] encoded instructions are written in little-endian.
>>
>> We call tswap32() on the array. tswap32 function swap a 32-bit
>> value if the target endianness doesn't match the host one.
>> Otherwise it is a NOP.
>>
>> * On a little-endian host, the array is stored as it. tswap32()
>>    is a NOP, and the vCPU fetches the instructions as it, in
>>    little-endian.
>>
>> * On a big-endian host, the array is stored as it. tswap32()
>>    swap the instructions to little-endian, and the vCPU fetches
>>    the instructions as it, in little-endian.
>>
>> Using tswap() on system emulation is a bit odd: while the target
>> particularities might change the system emulation, the host ones
>> (such its endianness) shouldn't interfere.
>>
>> We can simplify by using const_le32() to always store the
>> instructions in the array in little-endian, removing the need
>> for the dubious tswap().
> 
> The tswap() in boot.c is not dubious at all. We start
> with a 32-bit value in host order (i.e. a C constant),
> and we want a value in guest order so we can write it
> into memory as a byte array. The correct function for that
> task is tswap()...

Maybe 'dubious' is a strong word inappropriate here. What I meant
is tswap() forces extra reasoning "oh, on what endianness will I
run this, what will happens then, is tswap() a NOP?". When using
the const_le32() macro we knows the 32-bit values are already in
little-endian order in the host memory, regardless of its
endianness. This is convenient with ARM guests which load their
instructions in this endianness, not need to tswap() at all.

I'll try to reword the commit descriptions in some clearer way.

Thanks,

Phil.

