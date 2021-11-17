Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7698E4542D3
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 09:41:28 +0100 (CET)
Received: from localhost ([::1]:36838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnGVT-00026D-Az
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 03:41:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnGTw-0000Xx-4z
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 03:39:52 -0500
Received: from [2a00:1450:4864:20::42d] (port=45673
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnGTu-0003fS-Fl
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 03:39:51 -0500
Received: by mail-wr1-x42d.google.com with SMTP id w29so3015793wra.12
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 00:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nUFIJbxHtKA20IeSBj6fyAGVIDf0mwZfD78kBvfOoNU=;
 b=ZIdbmTGnKvVOAADbRiizz0JVZceEJY4YZHXfbn+p/1jlKmBtaH+to0+SXqymho7CWs
 WPOlXRiU9pxHkl1eZssNhNaE59RyOV9AVqFRXusXvfpYuWD8kIQxZo4TZLILbd+e2KjY
 V6g1QLJ7E4ZreTN0dB2ywFWwz7oAuUtQi6kW6zFNBKI46YNidthmMESd9zh1ttbtrala
 wIvo97z21hriVFISRTIcuvJwwfHQo0NX4NBBUVxMh8LDGnHWR8vYS1oGvaHRKxB+a5NM
 b5tRmiqpTnsPfvUAoDWdeLeb11yDx517UOBDIVgE/1jLbKVGINSu7uktlAePsQJbrerH
 a5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nUFIJbxHtKA20IeSBj6fyAGVIDf0mwZfD78kBvfOoNU=;
 b=JwzuhPJe9eushdZPHScN6H3DzI/Fr/ha3ZgcBJJBQp+LfBip7OtjyoawrJcXdBwB0k
 uq3TIT/4ZsiA13AGUWB4n7XNIQdVqFXf3ySRvJDCidBbgFzAVViRwn15K58hKO106iko
 J8Lp4JIbcMMSabl8DG4z6rGO5J3HPVoQ6XWARrYxbegQzhPuhqTIhGSm+64ebhNgVH/M
 HGPBcSvJBWLCxe1Kzo0s0jOm712MMSKfRJngiDGLO51olMmZ0zWH1fz3qsjKTg/G+94P
 Jt9hN5tkLwwiI0cLGPzderJ88RsuoXOWP1J4TBajFqQQjYPmwy0iCaPUv34MraYpPkkk
 b2BA==
X-Gm-Message-State: AOAM531RJE4v+DPn3TQqa3HYwwihZfb36zT5TQKvAShT8l1zygPgOPEX
 Wt7tOvXyqMRkG8gFkT8/CiSFOsyhZ45uaIPbWyw=
X-Google-Smtp-Source: ABdhPJyjCbW6RVuawzSP0K2LqFgQtxXnJZY3xPZsEMPA+uTpruQ66RSW90Fc/o7IClOuC6DMEcu6OA==
X-Received: by 2002:a05:6000:110a:: with SMTP id
 z10mr18431945wrw.396.1637138388817; 
 Wed, 17 Nov 2021 00:39:48 -0800 (PST)
Received: from [192.168.8.105] (101.red-176-80-44.dynamicip.rima-tde.net.
 [176.80.44.101])
 by smtp.gmail.com with ESMTPSA id e8sm15732238wrr.26.2021.11.17.00.39.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 00:39:48 -0800 (PST)
Subject: Re: [PULL SUBSYSTEM qemu-pseries] pseries: Update SLOF firmware image
To: Alexey Kardashevskiy <aik@ozlabs.ru>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20211114005111.515543-1-aik@ozlabs.ru>
 <735870db-c919-5f85-859a-eddbf507005b@kaod.org>
 <e0d2a9bd-1c63-7033-7daf-271fea702d66@redhat.com>
 <5ac387fa-8b6e-7d77-d425-a26f453bcc94@linaro.org>
 <cf010ee6-0a8c-c18b-4c3b-3b4761d2ed69@ozlabs.ru>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fe6d8599-49d6-779d-cfe9-7f5a7a48cd60@linaro.org>
Date: Wed, 17 Nov 2021 09:39:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <cf010ee6-0a8c-c18b-4c3b-3b4761d2ed69@ozlabs.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.009,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/21 11:48 PM, Alexey Kardashevskiy wrote:
> Yup. I am doing SLOF updates this way for ages after diifs became quite huge to make 
> mailman barfing on the size, and the "subsystem" in the subj was the way to reduce the 
> noise Peter had to respond to :)
> 
> btw should I be signing those? I am not now.

You could if you and Cedric want to do so (is it really Alexey sending the sub pr and not 
an impostor with access to the same github account?), but it will not leave a permanent 
record in the mainline history, because the merge object with the signature will be 
removed by any rebase.


r~

