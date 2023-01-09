Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3620662999
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 16:15:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEtrG-0001Wi-Mk; Mon, 09 Jan 2023 10:14:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEtrD-0001OI-Ui
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 10:14:39 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEtrB-0007vW-0a
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 10:14:38 -0500
Received: by mail-wr1-x42c.google.com with SMTP id bs20so8504595wrb.3
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 07:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/bXbPMNxJI/reIh3sDfCJwx3V/Krxn/udRJEoqHAjPs=;
 b=Sii8GQgrEUNqfwelKMQY2ono8J4+HkaTYHSws/5EiIqToQmzKv0/qQWizyIR8y81Ic
 YE4TMSIavn5ftOtA8njbh9ZamqS4eXeS7KCrrRRllyvScVaxEisff0zIZK5LCd+6qLzw
 ULLex2WDrujluNvE6dsoqR4jhlXJ6kBLm8IbEYufncYlre+bR96+rEA9z0yP54pV3gm4
 w5qA9G2aE6MCRTXg5kAI3aqB2fxs64IXPTjrXwo0V8HdFzNhEhG+mXemR8IpFmM0q2L2
 J3UTfY6bIyNRkPdiF9/TK2XTX5SuU6AK0W2Cf12aCfBsv3UJLP1en/us5Sv6PusWmheI
 a/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/bXbPMNxJI/reIh3sDfCJwx3V/Krxn/udRJEoqHAjPs=;
 b=iEk7nrpxktaYmUD+P4azkek/fha3AgZelBvAMpedzFUbUgPK41YW5UvCB/pBFCplne
 25yD/0TXbIYEUGtnkOllkUg0RNQKn8aqYs95MXNf5uqgOCpW9yKN08w/jpGIBtTPeYxS
 LTYx2/0DLPfg/5Cf3sUTRdQDRPxxFrP30AkB0S30XChfkW2ElE3h4qyuN5ZVwAb1VqZm
 y44bh1zvASPKHfujAkDMH7+OBo+G+s6DyIeIQRkufxiYxxV9p5dozGrqk942l6r5rglt
 blYoVMvJOjqRr34co/RzOlGQeS8VJHgnVBQUeAYViy6F3v5iFmvy/vqnwKZ/p6hBUtqz
 bqRA==
X-Gm-Message-State: AFqh2ko/9KCFXrs39+EaT+e2cLQF+Y8PbP3ank1j4T0rVxbFX3V1AgMT
 O3rYphtHD5uabSsiURm1BFrR4g==
X-Google-Smtp-Source: AMrXdXvwsD/4L5PFYIbQBFopSZhVZ52mcyTE8z74aqSO2JF0xBf0gpnuufrvpGEOTzR+Pm2pzGx1sA==
X-Received: by 2002:a05:6000:80b:b0:29a:c631:e3ff with SMTP id
 bt11-20020a056000080b00b0029ac631e3ffmr18320649wrb.53.1673277275596; 
 Mon, 09 Jan 2023 07:14:35 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e35-20020a5d5963000000b00276d8c2332fsm9818009wri.108.2023.01.09.07.14.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 07:14:35 -0800 (PST)
Message-ID: <370e707a-452c-6a2b-eef5-46605ac048d4@linaro.org>
Date: Mon, 9 Jan 2023 16:14:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 01/21] hw/block: Rename TYPE_PFLASH_CFI02 'width'
 property as 'device-width'
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20230109120833.3330-1-philmd@linaro.org>
 <20230109120833.3330-2-philmd@linaro.org>
 <791cd783-4f27-dd18-c6bd-b9a316bb42cd@eik.bme.hu>
 <8507ed0d-fc90-8ce3-2d7d-82c106b20231@linaro.org>
 <477d20c7-4973-9290-09db-e3877b76c806@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <477d20c7-4973-9290-09db-e3877b76c806@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 9/1/23 15:18, BALATON Zoltan wrote:
> On Mon, 9 Jan 2023, Philippe Mathieu-Daudé wrote:
>> On 9/1/23 14:33, BALATON Zoltan wrote:
>>> On Mon, 9 Jan 2023, Philippe Mathieu-Daudé wrote:
>>>> Use the same property name than the TYPE_PFLASH_CFI01 model.
>>>
>>> Nothing uses it? Can this break command lines and if so do we need 
>>> deprecation or some compatibility function until everybody changed 
>>> their usage?
>>
>> Good point... I missed that :/
>>
>> How deprecation works in that case, can I simply add an extra
>> property with DEFINE_PROP_UINT8()? I'm worried about an user
>> doing:
>>
>> -device cfi.pflash02,device-width=4,width=2,...
> 
> Or maybe just leave it alone to avoid further problems. Cfi02 only has 
> width and 4 sector lengths with corresponding sizes, while cfi01 has 
> width, device-width and max-device-width so these just seem to be 
> describing geometry differently so maybe no need to try to use same 
> property names. Width is also shorter than device-width so I'd keep that 
> for brevity.
I don't mind for this particular model, but I'd like to understand
how to fix this generically, because I have other models to modify...


Back to our pflash models, the multiple '*width' properties are a way
to implement interleaved parallel flashes. For previous discussions
see:
https://lore.kernel.org/qemu-devel/20190426162624.55977-5-stephen.checkoway@oberlin.edu/
and a way to unify:
https://lore.kernel.org/qemu-devel/20200817161853.593247-5-f4bug@amsat.org/

