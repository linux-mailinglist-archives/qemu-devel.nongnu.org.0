Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DF161F4F9
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 15:09:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os2nf-0006z0-9I; Mon, 07 Nov 2022 09:08:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1os2nW-0006um-8W
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 09:08:25 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1os2nS-0000sv-5j
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 09:08:21 -0500
Received: by mail-wm1-x329.google.com with SMTP id t1so6943065wmi.4
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 06:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0pEsKtTcmK6Ge/i5EQBQ6LfASf28dXHI1IPLk/HalPo=;
 b=sBV/FN+Pq/5l4vCp+iGbbnJpyW7zw+rEetyTd5hBTnob0XdvqgIJZhLr3tfgYH0yaH
 SejTUv3OOu4KIn9wyK7mZ0YBgBKpDUGzXGvHa8frsQE8EF1Xc7QgtOKNdEOy34mhGhpv
 ZS6JBueJ9VmUTKZ3I/KBkt8vPj1uQrhbetW887Iuvk1t3rJfjkbCsOf+vfWJIJfOJP3A
 fjEtR9LXme++xdFnsyZb4O1TkCiJz+FzL1S/XOUji1O2JAygCPfujKmCS+k0X1YkzQdc
 ZzQoZGFr+y7Hkz7Ov+qoOceQhSAC1YjPiZdQvjYSQ52LR3Tm5yQVuGppFM682wXrJ2YF
 yzPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0pEsKtTcmK6Ge/i5EQBQ6LfASf28dXHI1IPLk/HalPo=;
 b=JyBGm/YuFaFb4P95P0j7WvJOGMov4gG1Y1U0eGFlMDkee03k9ibOAFw5a4j9WvF4C2
 TMV1PRykbQjjZpo0yHEUr6u4yMdsd5a2wd0vaMFI6SRHs3kpy59M8Cc2EiQv+CVZK2lf
 KtrxaEMiusnf8c62sSnlFrVLURwVHIFFMoJH1CwpXsMJS9nCN1iD64OeDbf86/pJX3C6
 H/NYwXpZ5Zj7qgLljkG3p8cN62Gs6c09CPCnHnyBNlAdU9y34T1yo8eKJw0JtlPuVBYb
 BEVok6ydBYVLNZoVoJK13JMgFVaOFpJHZDKOIVVHJoCWQAL+L37XNouwA7H0xzal+uNY
 ePXA==
X-Gm-Message-State: ACrzQf3T1DPSyoTHIPbiynn0iF2w15yKQGTwRbrc/bVsbxWBFj+FLNp7
 kc1+hVuvgz9LKi5a6usiFu5YUg==
X-Google-Smtp-Source: AMsMyM48c5G4Zf6qxAQhzdhZEm5+6P01MPokmYhExFsdKmZGTgu2hjFS+CYWpaq8usiMrMbmJH8dQw==
X-Received: by 2002:a05:600c:15c9:b0:3cf:6054:3b3b with SMTP id
 v9-20020a05600c15c900b003cf60543b3bmr36236680wmf.167.1667830095900; 
 Mon, 07 Nov 2022 06:08:15 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 hn3-20020a05600ca38300b003cf78aafdd7sm8142716wmb.39.2022.11.07.06.08.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Nov 2022 06:08:15 -0800 (PST)
Message-ID: <93096c36-fd3a-2e2f-4ae9-3bf9e4287204@linaro.org>
Date: Mon, 7 Nov 2022 15:08:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH V2] hw/riscv: virt: Remove size restriction for pflash
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Sunil V L <sunilvl@ventanamicro.com>, Markus Armbruster <armbru@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20221107130217.2243815-1-sunilvl@ventanamicro.com>
 <CAFEAcA8X3Q7s6qZ=ojE9fTLG464rrZw+FX=4hmMOhwR-Q4n2sA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA8X3Q7s6qZ=ojE9fTLG464rrZw+FX=4hmMOhwR-Q4n2sA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 7/11/22 14:06, Peter Maydell wrote:
> On Mon, 7 Nov 2022 at 13:03, Sunil V L <sunilvl@ventanamicro.com> wrote:
>>
>> The pflash implementation currently assumes fixed size of the
>> backend storage. Due to this, the backend storage file needs to be
>> exactly of size 32M. Otherwise, there will be an error like below.
>>
>> "device requires 33554432 bytes, block backend provides 4194304 bytes"
>>
>> Fix this issue by using the actual size of the backing store.
>>
>> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
>> ---
> 
> Do you really want the flash device size presented to the guest
> to be variable depending on what the user passed as a block backend?
> I don't think this is how we handle flash devices on other boards...

Ideally handling smaller/bigger backend size should be transparent for
machine frontend, but we never agreed on what are user expectations and
how to deal with such cases.

Long term I'd go for:

- if flash is read-only

   a/ bigger backend: display a warning and ignore extra backend data.

   b/ smaller backend: assume flash block is in erased state and fill
      missing gap with -1 (the default erase value), displaying a warning
      on startup.

- if flash is read-write

   a/ bigger backend: display a warning and ignore extra backend data.

   b/ smaller backend: add a property to pflash device to handle missing
      gap as erased data. If this flag is not set, display a hint and
      exit with an error.

In Sunil particular case, I suppose the issue comes from commit
334c388f25 ("hw/block/pflash_cfi0{1, 2}: Error out if device length
isn't a power of two") which I'm going to revert because the code
base is not ready for such check:

https://lore.kernel.org/qemu-devel/78b914c5-ce7e-1d4a-0a67-450f286eb869@linaro.org/

Regards,

Phil.

