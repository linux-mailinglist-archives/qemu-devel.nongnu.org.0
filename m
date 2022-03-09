Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8D14D2CC7
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 11:06:39 +0100 (CET)
Received: from localhost ([::1]:57680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRtDK-0005dL-Nk
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 05:06:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRtBy-0004rN-Pz
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 05:05:14 -0500
Received: from [2607:f8b0:4864:20::430] (port=35611
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRtBw-0003iv-Ba
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 05:05:14 -0500
Received: by mail-pf1-x430.google.com with SMTP id a5so1825150pfv.2
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 02:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=r6SIU1ylHMI1DE+E0nDoMBsTeMRS52iNGl3LfNgcJA8=;
 b=qeWhfqepPeugVwPvFZ2XJGzHsHrESOIj/OVp5aR0ANikLKaDN3riOgX0221RzP2Gij
 5vJ1xImimrBiT83jVY66TjHkOLcT9k2N3MfNad9XwBvNo4XH/6OhEljev43df0UsxRbs
 Fjlrj9DHI7z7K8F8bmnomu6XIBPmHXBAoS0D7PCpqAidRQS1lGtjAwiPa4UfECXuoE1Q
 5NFVKSHbkQ9CCDjf5TvvauRrrbTFuyqqxxadNZeJ7YyCfzcornCZF0evMLwfw1KE5X76
 JVioY0f/L9rNtNzWwvM8TT46cWRoUpKvyy3GleXEnDqcpMLRCzo57ZLMtHi6YD6nnzxb
 A90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=r6SIU1ylHMI1DE+E0nDoMBsTeMRS52iNGl3LfNgcJA8=;
 b=K16AvpUqZySGlstHsQ8CLs0OFgLPTYC7IWx1ZZtkX9QNZPjblcEFtbt8lyO7w+/vVI
 E46KQxfRF+4P9f65vTpe5mr8z9yboWAfytmGC8vSw1/2sQl39CH0LnGh+39g65cX07bn
 EQMbVnDxGmxYgotFTnwNMXvd2ouE10nLLAKpzgF7GAVVNpcvAba8+2KtrysbQMssmd9B
 vlybPIq00+2YEr+ZOSUL3+ad5OQrL+dSt1dFSRBx5ugEjhI0x5K7u+P/zU93FANg9NfV
 jC0g8qgVWRxOuqfp8Lp5V1UTBUg6JB+14+wYqZ9UpShRknb18AMLXuoCLtvNWWOvfpQL
 GK3A==
X-Gm-Message-State: AOAM533DAoakchZQktGoUud1CTXCIiPGxH85Wwg28I8eR4KlPhesEf0w
 McCpVpAZ7Y2yiugi3UI2Hvw=
X-Google-Smtp-Source: ABdhPJxZP49RKLw64ev8xGPO06vJ2yI83XZGFNVrbh7dcqqAVdAfuHNni4L3w1Wik2iyARQnMhSmTw==
X-Received: by 2002:a62:cdcd:0:b0:4f6:f5c2:47d9 with SMTP id
 o196-20020a62cdcd000000b004f6f5c247d9mr16103217pfg.26.1646820309328; 
 Wed, 09 Mar 2022 02:05:09 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 nn15-20020a17090b38cf00b001b90c745188sm2148641pjb.25.2022.03.09.02.05.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 02:05:09 -0800 (PST)
Message-ID: <0fcec2e8-97dc-8cf5-3f9e-285a86c0b566@gmail.com>
Date: Wed, 9 Mar 2022 11:05:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: MAINTAINERS: macOS host support (was: MAINTAINERS: take edk2)
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20220308145521.3106395-1-kraxel@redhat.com>
 <20220308145521.3106395-12-kraxel@redhat.com>
 <cd9a9fda-7187-0601-49ca-20c649ba6cfa@gmail.com>
 <20220309081607.gzoucriu7a3qxtjf@sirius.home.kraxel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220309081607.gzoucriu7a3qxtjf@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Joelle van Dyne <j@getutm.app>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/22 09:16, Gerd Hoffmann wrote:
> On Tue, Mar 08, 2022 at 04:08:40PM +0100, Philippe Mathieu-Daudé wrote:

>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 68adaac373c7..ad1c9a7ea133 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -3144,7 +3144,7 @@ F: docs/interop/firmware.json
>>>    EDK2 Firmware
>>>    M: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> -R: Gerd Hoffmann <kraxel@redhat.com>
>>> +M: Gerd Hoffmann <kraxel@redhat.com>
>>
>> Thanks :)
> 
> Any chance you can take over the macos support bits in return?

I suppose you mean the "Core Audio framework backend" section?

There is indeed a need for macOS host support maintenance, as patches
hang on the list until Peter finally takes them via the arm tree.

Not sure what you have in mind. I'm totally new to the macOS/Darwin
world, and have no choice but to use it as primary workstation and
for CI builds, so I can help with overall testing / maintenance.

Peter, since you take some macOS patches, would you like to maintain
this officially? Since I doubt you want to take yet another
responsibility, what about having a co-maintained section, including
technical expertise from Akihiko / Joelle / Christian? (Cc'ed)

Regards,

Phil.

