Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B4068E88A
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 07:57:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPeNA-0000nn-1g; Wed, 08 Feb 2023 01:56:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPeN7-0000n2-4f
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 01:56:01 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPeN5-0000P1-C9
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 01:56:00 -0500
Received: by mail-wr1-x433.google.com with SMTP id z11so1728906wrl.8
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 22:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T05J2ydYc4ct9xrMrBDr6NJwPAvHr0EZegfvuKm8eK4=;
 b=sRaVLPYGW1FcJ+m+2cMVe19ZY3c0DLKbRjxXkii+xIWvnXhDmvDt4vIwjRVzBntEwb
 d+B6BwhtT9Z/Bj/oq5yKEARpDvAqijGMxri2cvWQIShX8EfJZFv1LExabTWcDMW6ZmyB
 qwvuUohakEyRQ5s7xpB5PiQE3nB0QwUSpmoLeAqgXJ4EMHaVntAiM72MWcGleWO6oaho
 iyqyEsJ/FkCSJ4LBD4t3PkJeMkxYWkKneimdFKzI25zFIZdveSrb8iG1ly6DEwCtS1SM
 qx71BhnrDtxchttIXfDBcQCSeiccfkb9xAHNXtXqctz3Fd+wCr2gzzetOcWcwBY2KgIY
 aLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T05J2ydYc4ct9xrMrBDr6NJwPAvHr0EZegfvuKm8eK4=;
 b=juLu/qKYBnhsxOSa//mnDEyRQoj4tMyVdTzSBI+5CY3LFPpYgD5T52kLFWN9lhmbjt
 3R8BMPBUY3xy8CwjN0hlvYdVtR+ySy98gMidAt0OTOhU75W4GesCwlxKeeibd+5GWlOI
 gYcP9sTuX2s94oQOWV5ZAjabReK9tVU/0WWs/MTIMGMFTN1dmu/gfb3KnJyGKWyAR5c6
 M690askr2ziF7p2smaoWylH8egvStiU26ONUoozjTJn2LFKzbS3aBoW9/X9jahGM6eu1
 Ef159+lNpk5VXjDGe1vOkEGBVzNRiUTXQROuE4VR8tnT4oHd3d1n2+bZucYfV1v5m+y4
 jTxw==
X-Gm-Message-State: AO0yUKV7c4aU9/AX9IeF+KRDk21Jmfp+eF8IDn+uRhYmsUsKZ2bQcXz1
 Xtz5gP7dLsaZ41Zt4F1SN00xEg==
X-Google-Smtp-Source: AK7set+ilC7OugVfZj/cp9fhisPqdwFe1lhvHHxfyXBY7Mn/jknxkxaq7sTLCbYvbR6dfFfSco0bsQ==
X-Received: by 2002:a5d:4b08:0:b0:2c4:35d:f838 with SMTP id
 v8-20020a5d4b08000000b002c4035df838mr1259783wrq.17.1675839357100; 
 Tue, 07 Feb 2023 22:55:57 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h12-20020adff4cc000000b002c3d814cc63sm11938978wrp.76.2023.02.07.22.55.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 22:55:55 -0800 (PST)
Message-ID: <b3de26d8-4992-df8a-8b31-4c7a07704195@linaro.org>
Date: Wed, 8 Feb 2023 07:55:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: Porting the QEMU build architecture to Visual Studio
Content-Language: en-US
To: Andrew Numrich <anumrich@hotmail.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <BLAPR05MB73459DB71B55CA0ACBD88304C8D89@BLAPR05MB7345.namprd05.prod.outlook.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "qemu-discuss@nongnu.org" <qemu-discuss@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <BLAPR05MB73459DB71B55CA0ACBD88304C8D89@BLAPR05MB7345.namprd05.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

Hi Andrew,

On 8/2/23 05:56, Andrew Numrich wrote:
> Hello, I’m looking to experiment with QEMU in a Windows specific 
> environment. For that I’ll need to build QEMU’s source code in Visual 
> Studio 2017.
> 
> I’m seeing that QEMU’s sources calls for a `config-host.h` file 
> generated by a `create_config` script. I don’t see said script anywhere 
> in the source tree.
> 
> By googling I can see various creations of both these files in random 
> forks of QEMU around the internet, but I couldn’t be sure to use any of 
> them.
> 
> I’m guessing these are somehow created by meson or ninja, but I don’t 
> have those easily on hand, being on Windows.
> 
> Is there anyone that can point me in the right direction

Paolo posted a patch to adapt QEMU build system to VSCode few
years ago:
https://lore.kernel.org/qemu-devel/20210512100906.621504-1-pbonzini@redhat.com/

> or explain how 
> this is generated?
> 
> Thanks
> 
>   * Andrew Numrich
> 
> http://github.com/toastmod
> 


