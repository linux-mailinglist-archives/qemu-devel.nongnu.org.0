Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D742418EC7
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 07:50:18 +0200 (CEST)
Received: from localhost ([::1]:44872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUjWr-0003Do-91
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 01:50:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUj7i-0000GC-7Z; Mon, 27 Sep 2021 01:24:18 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:33485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUj7f-0004qF-IZ; Mon, 27 Sep 2021 01:24:17 -0400
Received: by mail-wr1-x429.google.com with SMTP id t18so48755094wrb.0;
 Sun, 26 Sep 2021 22:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gcqOGByHD1fejyM8OLA41Kyf7vWFLkAG3g5lIQc4ezM=;
 b=bbx8LbfokWg3M/GD8BnDO4Kr59Nt3XxwellR6K5KHnIzgrXcTNh8NWSE+BcW9xmP7J
 l5ofgUPvpvcQsB6+958JUwLay9JuIQZoS/w+/Xlm0v3RYjurjlUExPfdn2QPBTg9Rw2w
 sBT5SozIqL9wt+pAqaEoJ4+6Ya8XE+n72GqhGhdB+VaxRXxW4zjvxvxBC+EIWQ17Fl95
 v63YdNkdxDVX8gTA6FQjihPIlvtipKbF29F7sk7nmp1Hsn2cq41BzIg1Wvk0Wo0Ork0l
 h3NVPahVRflGBcEI/lEYc6yFhi2/TzglTuxrU4JwGalwgVzaPxOlbLhgFJaPVTdaBPFs
 PiXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gcqOGByHD1fejyM8OLA41Kyf7vWFLkAG3g5lIQc4ezM=;
 b=ODR3FmD9jIF4dmL9/hZmdpyxoj377/v5zLiiKrUAupYn3RGsaFBIxPvZxkaN5bRE+O
 LqWNxAmyWahZFb1vT4KRYBDqiLG4WQQfmBKY2s/ZgDnZb/v+riIkOl8uHwdH9nQLz//2
 oPOezHCB8OWJosGNPS11fYV0bZ2GoICTqbvU1iskDTX5pKA+GV/Du6VgcZ+s9BYlMOGG
 1fWoWTWMHXB6irNh94hCDD6ui7lecKDXm1U0uH7zMEnUcFN55iqduCOVnnVfW5WWIND4
 +JwHKXwLU1kvfaw71pxzv7728NQ7LM3bb3ZHLoSTktHTqX46KYyZggbCDguuPgxE16VG
 SQWw==
X-Gm-Message-State: AOAM530WK9UHPzPBmiRuJlmNAl+6GFLWV+byR2Xw9fAxXKDXMn8CmhvI
 buh+OSUMGSGawXBAKcWN1TE=
X-Google-Smtp-Source: ABdhPJwTrvfP6glAgXnQL0iRSSC9splLEah1p0vhnAhpZQ/o7ZApEiBGFtL8YaazC1jO2v0Zurz5ZQ==
X-Received: by 2002:a1c:1c7:: with SMTP id 190mr13583155wmb.158.1632720253160; 
 Sun, 26 Sep 2021 22:24:13 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id s85sm5244800wme.20.2021.09.26.22.24.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 22:24:12 -0700 (PDT)
Message-ID: <4dcb518e-dd69-ed75-1d57-7fcf76c5cb69@amsat.org>
Date: Mon, 27 Sep 2021 07:24:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/2] bsd-user: Only process meson rules on BSD host
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210926220103.1721355-1-f4bug@amsat.org>
 <20210926220103.1721355-2-f4bug@amsat.org>
 <e43cf822-c23d-1ddf-398e-71f78ea05b43@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <e43cf822-c23d-1ddf-398e-71f78ea05b43@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.478,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/27/21 01:08, Richard Henderson wrote:
> On 9/26/21 6:01 PM, Philippe Mathieu-Daudé wrote:
>> Reported-by: Warner Losh <imp@bsdimp.com>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   bsd-user/meson.build | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/bsd-user/meson.build b/bsd-user/meson.build
>> index 03695493408..a7607e1c884 100644
>> --- a/bsd-user/meson.build
>> +++ b/bsd-user/meson.build
>> @@ -1,3 +1,7 @@
>> +if not config_host.has_key('CONFIG_BSD')
>> +  subdir_done()
>> +endif
> 
> Why here and not in the parent meson.build?

This is what Paolo recommended me to do last time I added a
conditional inclusion.

Personally I prefer having it in the call site rather than
the callee (no need to read the callee to notice it isn't
called). I guess this is for readability, to not clutter
meson.build files more...

Paolo, what is your preference?

