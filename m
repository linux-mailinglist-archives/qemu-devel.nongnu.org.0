Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6D14C9178
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 18:27:45 +0100 (CET)
Received: from localhost ([::1]:48964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP6Hn-0005Fr-NV
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 12:27:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nP6Fm-0003hr-Nw
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 12:25:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nP6Fe-0007XP-5u
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 12:25:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646155527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lO09Yff1xUJWUCpnLr8Ls8yxtWgazdV8060txVZW7i0=;
 b=AE8F/A/SxWetyITSnMvNU5p92HYORu581IwKmCkhY3k5oZDcw2HRXpA+WE2vgvAP7UU9QU
 PKIJP05W+iwh0KRy+b7gR/34cuPMz9r7m6/CEneksfm7rFTz4GnujCRGLmM/4m21e7RwEN
 6AiczIXHR1gZvzF4r28Hs5OjONA6DLc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-u___O-BBObOnHHy_EGsVQw-1; Tue, 01 Mar 2022 12:25:25 -0500
X-MC-Unique: u___O-BBObOnHHy_EGsVQw-1
Received: by mail-wr1-f69.google.com with SMTP id
 b7-20020a05600003c700b001efac398af7so2250236wrg.22
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 09:25:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lO09Yff1xUJWUCpnLr8Ls8yxtWgazdV8060txVZW7i0=;
 b=btj/imjL4EooQwwiyK1evd5dVqsHgb6KWb5sWIlX92Cevspzcnn7LN3xSUB6l/P0q7
 3inMEmUZKmJ2b0OxJVfCWVlE8lP9OxMcEjGYncF4pg9DtK1KuXedF7gkwYQF5VSdBrkf
 c5uNQb0Hf0qXGq2cozzJ+Fd9/2lX+slJVo599YIcY3FnMFy8Iu1xDqsNlLhEEkgKF4pm
 /rgV8zi0GnbtU8W5q9tNU9WSm4W6viqaR7FmFtVC3IQ6DNXnMvn8HOlvCtX2wFFH0zFt
 xWNbBsbT4U9DB58dQYKWhwRmhky+Q9rRsCzCv4MDTj4UbgMfzyoJpwVNSfzU4vErVceG
 tV7w==
X-Gm-Message-State: AOAM532n+Sgi8+52tPncWrf9+zfkOwMlxi62tRTMHLKvJBsi6Q7j+V9k
 Pctfmw/xZnVGL9Ruqi3ajnczyfXQhLUGOR91wOikvQBt5ve6zopFiyOiSFL6rqP0cz6lCMzaeH6
 jNPmuyDKoQ+cwtM4=
X-Received: by 2002:a05:600c:35c2:b0:381:6cbc:7192 with SMTP id
 r2-20020a05600c35c200b003816cbc7192mr7215157wmq.146.1646155524123; 
 Tue, 01 Mar 2022 09:25:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhyGHLqY/Mpjz/ABT88lcF6+TeskpHvnTVJahekPilkFqqy2UjyxHig+iZaDbY92GRs5KweA==
X-Received: by 2002:a05:600c:35c2:b0:381:6cbc:7192 with SMTP id
 r2-20020a05600c35c200b003816cbc7192mr7215128wmq.146.1646155523822; 
 Tue, 01 Mar 2022 09:25:23 -0800 (PST)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218]) by smtp.gmail.com with ESMTPSA id
 t15-20020adfe44f000000b001edbea974cesm14027681wrm.53.2022.03.01.09.25.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 09:25:23 -0800 (PST)
Message-ID: <64afb770-0a23-7df2-bfc9-5b50c13d3f66@redhat.com>
Date: Tue, 1 Mar 2022 18:25:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] configure: Fix building on a ppc64 host with Clang
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 qemu-devel@nongnu.org
References: <20220301132754.1483837-1-thuth@redhat.com>
 <5753847b-0269-e461-7d46-5e4f6b2090de@gmail.com>
 <fa775186-3c9f-166b-86ad-beddd2079d9a@kaod.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <fa775186-3c9f-166b-86ad-beddd2079d9a@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, matheus.ferst@eldorado.org.br,
 Miroslav Rezanina <mrezanin@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/03/2022 18.22, Cédric Le Goater wrote:
> On 3/1/22 15:59, Philippe Mathieu-Daudé wrote:
>> On 1/3/22 14:27, Thomas Huth wrote:
>>> Clang only supports the -mlittle-endian and -mbig-endian switches,
>>> and not -mlittle / -mbig. Since GCC supports both, let's use the
>>> long versions that are supported by both instead.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   configure | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/configure b/configure
>>> index c56ed53ee3..81618708e4 100755
>>> --- a/configure
>>> +++ b/configure
>>> @@ -630,10 +630,10 @@ case "$cpu" in
>>>     ppc)
>>>       CPU_CFLAGS="-m32" ;;
>>>     ppc64)
>>> -    CPU_CFLAGS="-m64 -mbig" ;;
>>> +    CPU_CFLAGS="-m64 -mbig-endian" ;;
>>>     ppc64le)
>>>       cpu="ppc64"
>>> -    CPU_CFLAGS="-m64 -mlittle" ;;
>>> +    CPU_CFLAGS="-m64 -mlittle-endian" ;;
>>>     s390)
>>>       CPU_CFLAGS="-m31" ;;
>>
>> Mirek sent a similar fix, but it was pending Matheus TCG fixes:
>>
>> https://lore.kernel.org/qemu-devel/20220131091714.4825-1-mrezanin@redhat.com/
>> https://lists.gnu.org/archive/html/qemu-ppc/2022-02/msg00116.html
> 
> Yes.
> 
> I kept it for later because I understood there were still problems
> with clang. May be I am wrong. Matheus ?

As far as I can see, there are some additional problems with the TCG tests, 
but the patch to the configure script is already required if the user only 
want to compile the main QEMU binaries. So I'd recommend to go ahead and 
queue Miroslav's patch already, the TCG tests can still be fixed on top later.

  Thomas


