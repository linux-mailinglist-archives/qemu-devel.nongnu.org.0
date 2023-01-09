Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 596496629AA
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 16:18:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEtu8-0003H2-MD; Mon, 09 Jan 2023 10:17:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEtu6-0003Gk-I0
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 10:17:38 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEtu5-00014r-3i
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 10:17:38 -0500
Received: by mail-wr1-x436.google.com with SMTP id co23so8513690wrb.4
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 07:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l/G1AvuM34wWoPbSWCK9nzUURANsLw24EItiFUk3Ew8=;
 b=iJzM929zNLRQP4OjYIFx+C2RLPOrQphgNW6gMUqs8VCFNxB4KeA7mCfpkyhHQxXRxv
 1FCVYHek1MuEeIQz+6lwpLlO0i7jjZfu8RmckKNj+AWKxRD3mqKHsEDkaupyK5GJqwjm
 Ogg/yy7m8LkZb6Bq6gOk1yeKmpXrx0sumUAgQTxF1bWwTN9iDFum0vq/qIateKXaHyAU
 zEfcrrCaoPQeCHz7l+kGM+9sdP8IxbGhtHhMu/OuGaQDsWwAU5nQg3ueH+4YXdIYsZxd
 nm2Ka0B+ViYJEpryjnk3xdtUdCNT5/13NMxZeCh6WzpNMKf+W5Jrskx4NvEcpP9OaTRE
 bsjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l/G1AvuM34wWoPbSWCK9nzUURANsLw24EItiFUk3Ew8=;
 b=Rh2bpou55b01MQFzsA8szfUOfuJCFWoedyE8cedyXn21LOWaR0lSp5Bf71PbVdv5+G
 JROpgSvHlX3qU46K7IE9a7Beofotuo2aC8T57afLAK6Xzt0WZRWe3etG68atPV2juPPz
 XJFcuxaYMhzIbly8wbgMjx+dsIZxIP6ke5+2KLLR9MU2wWQnWbyKkVzN5cyXGLuY1MQu
 RnSftsxw5JoQHxYkfun+MaF8C8swU97K/j4keBEB6TKmPPYhyTB83dKQDJ5UYeltAZQo
 p02R7HaNgvW+ya/qlUukzZsqwA7JSUliZmPN+JnXC3Ux+Qsstml7xnQd9e4itXNXVbC2
 F1pw==
X-Gm-Message-State: AFqh2koxFMr+L3VCbrqFgKqEaIoiRueubki7rm/YQOt3CJdKpvZRcYn/
 cFYR49CnRfJwOkWAm4bUYUh/Vo/6LWAT+GOu
X-Google-Smtp-Source: AMrXdXtL96kNTKPEdD7FEiRY0qNUKYiht6ElYWkalVXLi6JebePNIYl6CZEVR2vuOSEy6SOKL+KR2A==
X-Received: by 2002:a05:6000:1c05:b0:261:d8be:3046 with SMTP id
 ba5-20020a0560001c0500b00261d8be3046mr43994782wrb.0.1673277455712; 
 Mon, 09 Jan 2023 07:17:35 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n4-20020a5d6b84000000b00282194eaf7bsm8511766wrx.71.2023.01.09.07.17.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 07:17:35 -0800 (PST)
Message-ID: <a209bcf3-275b-a824-3995-337cc5a9d7a8@linaro.org>
Date: Mon, 9 Jan 2023 16:17:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 01/21] hw/block: Rename TYPE_PFLASH_CFI02 'width'
 property as 'device-width'
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: BALATON Zoltan <balaton@eik.bme.hu>, Markus Armbruster
 <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20230109120833.3330-1-philmd@linaro.org>
 <20230109120833.3330-2-philmd@linaro.org>
 <791cd783-4f27-dd18-c6bd-b9a316bb42cd@eik.bme.hu>
 <8507ed0d-fc90-8ce3-2d7d-82c106b20231@linaro.org>
 <Y7wlnqwU+/auE0Jj@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y7wlnqwU+/auE0Jj@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

On 9/1/23 15:33, Daniel P. Berrangé wrote:
> On Mon, Jan 09, 2023 at 02:56:13PM +0100, Philippe Mathieu-Daudé wrote:
>> On 9/1/23 14:33, BALATON Zoltan wrote:
>>> On Mon, 9 Jan 2023, Philippe Mathieu-Daudé wrote:
>>>> Use the same property name than the TYPE_PFLASH_CFI01 model.
>>>
>>> Nothing uses it? Can this break command lines and if so do we need
>>> deprecation or some compatibility function until everybody changed their
>>> usage?
>>
>> Good point... I missed that :/
>>
>> How deprecation works in that case, can I simply add an extra
>> property with DEFINE_PROP_UINT8()? I'm worried about an user
>> doing:
>>
>>   -device cfi.pflash02,device-width=4,width=2,...
>>
>> and the processing order of the properties, besides property
>> overwritten isn't warned to the user.
> 
> Correct nothing warns.
> 
> Something would need to issue a warning when the deprecated
> property is set.

For a one-shot change we could use object_property_add(), having the
setter() displaying the warning.

If this is recurrent, we could add a 
object_property_add_deprecated_alias() helper.

