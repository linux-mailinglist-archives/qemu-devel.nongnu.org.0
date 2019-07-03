Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D455EA05
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 19:07:20 +0200 (CEST)
Received: from localhost ([::1]:37778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiij1-0002KB-8D
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 13:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42583)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <th.huth@gmail.com>) id 1hiicF-0007E9-JX
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 13:00:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <th.huth@gmail.com>) id 1hiicE-0002f9-NF
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 13:00:19 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36172)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <th.huth@gmail.com>) id 1hiicE-0002dv-H8
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 13:00:18 -0400
Received: by mail-wr1-f68.google.com with SMTP id n4so3663109wrs.3
 for <qemu-devel@nongnu.org>; Wed, 03 Jul 2019 10:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GgFc/R0vMxDmtFfIdnhpDhlIyRzGh8dJ3zuv7sxaNUk=;
 b=Kf79QJPiSTUTc+h8Zz/43HMori4s1AnhOmq0gHbZayiTX6mRQW7evy/nxlSUB58/8r
 AwibAOs4NVkz7LjIxY6BD64RU8/BMCOMk68FIkmFs3eTXuxrLaoCzZRJTWVyVXq+/1e8
 6nphDiIaiQw9m/JMgilVZEpQa14R9WVQXV5MFoW6uHeisuoj2zoOxNAxDQH7MsyHj9ug
 fG5REeRgcf6HBCcVOJQ683y+S0ucY8zzPAh44pifLzhDRPOdigbClMJ3VbV3PRqDW6ew
 d5oCATcvkEd8cB2MwQbk/6Y8ZkBV6JEz/ThxGd1MqpeRns0IWmBhaD/Mf5weXlhvU2d8
 +0Jw==
X-Gm-Message-State: APjAAAVoudCNLwDW41ypRJcNb68DkG6U5Gy69hmNKdv447tBlusqA9lm
 HXxJRabYf7V4ewvUKJaaIZA=
X-Google-Smtp-Source: APXvYqwnV3vkhelhyEyM8ws39i+NU+zvfw3EOdnpb2r0SQPpo2wKZXcTCjoYlZgGS3yBhhKQLQnSAQ==
X-Received: by 2002:a5d:4908:: with SMTP id x8mr28958283wrq.290.1562173216988; 
 Wed, 03 Jul 2019 10:00:16 -0700 (PDT)
Received: from thuth.remote.csb (pD9E83FB2.dip0.t-ipconnect.de.
 [217.232.63.178])
 by smtp.gmail.com with ESMTPSA id n14sm6757995wra.75.2019.07.03.10.00.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jul 2019 10:00:16 -0700 (PDT)
From: Thomas Huth <huth@tuxfamily.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20190628181536.13729-1-huth@tuxfamily.org>
 <20190628181536.13729-4-huth@tuxfamily.org>
 <074eb5c6-8a7f-1018-47f9-9801e0aba704@redhat.com>
 <9b4187dd-9079-b511-aea7-2b8c992a3067@posteo.de>
Message-ID: <6242593f-9472-8bc5-c65e-bea3aa0149c8@tuxfamily.org>
Date: Wed, 3 Jul 2019 19:00:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <9b4187dd-9079-b511-aea7-2b8c992a3067@posteo.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-devel] [PATCH v2 3/4] m68k: Add NeXTcube machine
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/07/2019 19.43, Thomas Huth wrote:
> On 29/06/2019 14.26, Philippe Mathieu-Daudé wrote:
>> On 6/28/19 8:15 PM, Thomas Huth wrote:
[...]
>>> +static uint32_t mmio_readb(NeXTState *s, hwaddr addr)
>>> +{
>>> +    switch (addr) {
>>> +    case 0xc000:
>>> +        return (s->scr1 >> 24) & 0xFF;
>>> +    case 0xc001:
>>> +        return (s->scr1 >> 16) & 0xFF;
>>> +    case 0xc002:
>>> +        return (s->scr1 >> 8)  & 0xFF;
>>> +    case 0xc003:
>>> +        return (s->scr1 >> 0)  & 0xFF;
>>
>> So you have a 32-bit implementation (DMA accessed device?).
>>
>> memory::access_with_adjusted_size() already does this work
>> for you if you use:
>>
>>    .impl.min_access_size = 4,
>>    .valid.min_access_size = 1,
>>    .valid.max_access_size = 4,
> 
> Yeah, it's old code from 2011 ... I'll try to rework it as you suggested.

That does not really seem to work. I'm then still seeing accesses to
0xc002 in my "readl" handler. Looks like access_with_adjusted_size() is
not really ready for that yet (see the FIXME in that function - it does
not take care of unaligned accesses yet).

 Thomas

