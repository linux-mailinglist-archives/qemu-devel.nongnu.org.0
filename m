Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 487C049B8F7
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 17:48:02 +0100 (CET)
Received: from localhost ([::1]:41752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCOzB-0007io-E6
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 11:48:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nCOu7-0004yu-Bg
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 11:42:49 -0500
Received: from [2607:f8b0:4864:20::531] (port=44895
 helo=mail-pg1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nCOu5-0008AS-6W
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 11:42:46 -0500
Received: by mail-pg1-x531.google.com with SMTP id h23so18675770pgk.11
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 08:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Fe5Frex5F9qhKyeczM1uiiIIUViquqjIs4vha32Vn+U=;
 b=IFhUkK5zhjB/3ZpVSjkQPBf3ZR/YNIIvZAEdqCubNe8G6IRzY4l36jM8pE0+cZCVbe
 zaefomdrOSEZj7BnXgebyoc2qGPFb0GJXEqoCc0O1umTnWMHGH0LuafU//4thLFYfYLu
 qutuOdS4jMxCLx+VhfuLOXBjnh/aTlAd8en48LDxT+Sv0jkQTb7b5bJwdBqasEKHtFcP
 XPxSCXri/KTiqME3A1B06jywbHtdericVwdDAYp+/4Rm66eAQwNZx0gN3ogQzfX2Ywz9
 Z6T7+Ab1i06poPkAKvnNJOHA8N9ovKKaE9uHehbIKgdqeE9TMF2BKHlQ3Rla7Yi9NXO6
 Dmkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Fe5Frex5F9qhKyeczM1uiiIIUViquqjIs4vha32Vn+U=;
 b=HYS+VrXPwKHS/m0xvaWK4nrwRYPxPAxgsZfjlXHUNvCHvWQASqJrfPTKRxIsbBCS6I
 ptMRBs2BrXjYf1pzoJXpJj6Ph8Etf4XpRF2pWLjFU3leUUZ4ew5VbbYXXFwSSXEWVZre
 k4sBZng5UPbFzYo6+QvMhFz6iOyeg5iis7vHb2QFOsowaWZhd14GslD9DINJ5H/57M8J
 mj/cKRt/lgwSvssyYxZ5M15ptZlbVcUqwtbjLPTpOpU5TtG9l/NzunnzCoyXQKYFAzUz
 qxCvotH8Tpp/Jn8bP7opUIOYVJ8F3Zjps4LZjpT4ZdhmMPZBKrjkoQsGTPP5Dbbo537y
 3vqQ==
X-Gm-Message-State: AOAM532zRTJ46E3IUkbcYykCTpmQAkqVKIjW3XGO+YVcrPpj1fjjVAQe
 OSmk8qi0V8BaHt/oxGcELJg=
X-Google-Smtp-Source: ABdhPJwBYNdpbgg4JoKg5iAbSSEIU2CbUZeZyMJ7mfYsH+dezL6ygYmoHV4QKqYR9jQCia3MRs28EA==
X-Received: by 2002:a05:6a00:174c:b0:4c9:e7ee:87b8 with SMTP id
 j12-20020a056a00174c00b004c9e7ee87b8mr7785962pfc.28.1643128961357; 
 Tue, 25 Jan 2022 08:42:41 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id h13sm21747117pfv.16.2022.01.25.08.42.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 08:42:41 -0800 (PST)
Message-ID: <daa1cb44-e089-7aa3-b34c-52090076f840@amsat.org>
Date: Tue, 25 Jan 2022 17:42:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH qemu] s390x: sck: load into a temporary not into in1
Content-Language: en-US
To: Nico Boehr <nrb@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org
Cc: linux-s390@vger.kernel.org, thuth@redhat.com, richard.henderson@linaro.org
References: <20220125122914.567599-1-nrb@linux.ibm.com>
 <9a888391-1020-89b0-65ed-5c93f2cc8642@redhat.com>
 <c0b5e6151a330f58f6794ee4fac19e6319810613.camel@linux.ibm.com>
In-Reply-To: <c0b5e6151a330f58f6794ee4fac19e6319810613.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::531
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 25/1/22 15:54, Nico Boehr wrote:
> On Tue, 2022-01-25 at 14:13 +0100, David Hildenbrand wrote:
>> I think you can actually just reuse in2_m2_64a, similar as we handle
>> SCKC
> 
> I tried my SCK tests with your patch, it works just as well and seems
> much cleaner, thanks.
> 
> Do you want to send this or should I make a v2 and add you as
> Suggested-by?

v2 ;)


