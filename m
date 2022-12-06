Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 152086448D9
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 17:10:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2aVZ-0001XZ-An; Tue, 06 Dec 2022 11:09:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2aVV-0001WL-Nb
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 11:09:22 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2aVT-00015P-MG
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 11:09:21 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso14616354wme.5
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 08:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wVd3b3T1Cqd2OD8BjyXdwun33kX0/zvBRwDtraocXac=;
 b=ANloN+HiDw7eqlBtqsd3BYKbEAQRTPbpuFfGsoqlASszGRmkFeDR9NxwRTjNq6XCZk
 isKnmYKF0F+LRlAn/KpDjwArIR43R02ix6Eeuhw+VpfDKqBcklepiEp0YOi2vLpYmIDQ
 dJ4beC8QSJs6pb52+H/j4lFVXIyVyn4MLBXMmhCt6lsnv1kVpnRIpj7BNsj0Q9q5CGYv
 Np9MtciWn1nN8z0oyqDPSz/sazAGty1geYkflB7TETK0CdXqV8GM8m4XFxdERI0ebSZc
 ogfoWJx5wkqxYJgJyYRGIONCXnNJYRwfjoecXljKLvJzpzK6fOis7Y0vzPG2UXstwTfz
 IKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wVd3b3T1Cqd2OD8BjyXdwun33kX0/zvBRwDtraocXac=;
 b=aagLTYuw9ZRWMAuE2sdn+3vLW0WKxu2RRXQHjMDObLHcXlU4gRDRyO+ZUuejRGVywk
 wyb4ENUmd93f6YowoLfxsDSjmRXzZpfRz8ZEqqBzFB1vMn0d3+TdPYEYLjJyJWc/uCvo
 WFMOjIS9YteVUNpjMHZ9IQwRyBMOQHvmrMEJNfA7ur48C8zlAGA3dzBymZ/QUOGDmBnG
 YMzimshk3FA8YgePPeFs/o7tC2BgznBPty0iQtMzlZeZ68V1z8oa+tx0AreyLs3aI46p
 RzZq1LNA0gVPlK/SE58Kkv3B1jcQj8xooOCMOzT1bWhjYj9Kzwerj1I6sZNXMUhO/ve9
 3vng==
X-Gm-Message-State: ANoB5pk6EUxejB0dt3q0FzTbayF1QCBjQiuypV6vnxpso93HXdqZOHVG
 njphxt7ycM81LLw7iJCm/jmtkQ==
X-Google-Smtp-Source: AA0mqf7i+2Xl7TA5+2FXY6V4xgHGqFAlP6DtbzqWWmnJWqcSl0WswuvvNTsxLYn9SwkzpxD7QyYSwg==
X-Received: by 2002:a1c:4c08:0:b0:3d1:e2e9:573a with SMTP id
 z8-20020a1c4c08000000b003d1e2e9573amr4812782wmf.106.1670342957492; 
 Tue, 06 Dec 2022 08:09:17 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i21-20020a1c5415000000b003d1f2c3e571sm75270wmb.33.2022.12.06.08.09.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 08:09:17 -0800 (PST)
Message-ID: <7af39209-c4ec-2107-3fff-e927e35b2808@linaro.org>
Date: Tue, 6 Dec 2022 17:09:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: Thoughts on removing the TARGET_I386 part of
 hw/display/vga/vbe_portio_list[]
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Fabrice Bellard <fabrice@bellard.org>, Michael Tokarev <mjt@tls.msk.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bin Meng <bmeng.cn@gmail.com>, Bernhard Beschow <shentey@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, QEMU Developers <qemu-devel@nongnu.org>
References: <fb95bd97-8d5f-b0eb-008b-47a96808a74f@linaro.org>
 <20221206143858.tmq3wmbyan7offho@sirius.home.kraxel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221206143858.tmq3wmbyan7offho@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.27,
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

On 6/12/22 15:38, Gerd Hoffmann wrote:
>    Hi,
> 
>> So on x86 we can have 16-bit I/O accesses unaligned to 8-bit boundary?
> 
> Yes.
> 
>> So I _think_ today we should be good with removing the x86 line:
>>
>> -# ifdef TARGET_I386
>> -    { 1, 1, 2, .read = vbe_ioport_read_data, .write = vbe_ioport_write_data },
>> -# endif
> 
> Nope.  Breaks vgabios.  Testcase:
> 
> qemu-system-x86_64 -kernel /boot/vmlinuz-$(uname -r) -append vga=ask

Adding

  -trace memory_region_ops_\*

I get:

memory_region_ops_write cpu 0 mr 0x13eefbf60 addr 0x1ce value 0x0 size 2 
name 'vbe'
memory_region_ops_write cpu 0 mr 0x13eefbf60 addr 0x1cf value 0xb0c0 
size 2 name 'vbe'
memory_region_ops_write cpu 0 mr 0x13eefbf60 addr 0x1ce value 0x0 size 2 
name 'vbe'
memory_region_ops_read cpu 0 mr 0x13eefbf60 addr 0x1cf value 0xffff size 
2 name 'vbe'

> All graphics modes are gone.

Yeah I'll investigate, thanks for the easy test case.


