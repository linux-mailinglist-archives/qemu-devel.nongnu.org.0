Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA8A493F17
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 18:32:56 +0100 (CET)
Received: from localhost ([::1]:39866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAEpL-0004cJ-Jv
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 12:32:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAEkj-0007cx-T4
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 12:28:09 -0500
Received: from [2a00:1450:4864:20::335] (port=51125
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAEki-0001h5-BW
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 12:28:09 -0500
Received: by mail-wm1-x335.google.com with SMTP id w26so6644552wmi.0
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 09:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xBAV1IZOKR8EJzQ7z4YlJl8lIiFIn3TZTyCVwxgCbKA=;
 b=OJGmQ+5nvK8BJGsNMBUuFHv8rcPTIrwm8Nfsl1iT2dDLpUw2BxFiUDen6FNII5eaKY
 QKTW4NB8Qna+0WCgXxi4ZJEB0/8aiR/yeBKS7kuUvCFsDupNraELnsr/lOkTkKKrJKZ6
 tm9sdtDefkLT1VcP2Te3EFbP+s1omVWaNPbiMSf8rXhutlQOUotbCXQbMPu4ZGoAWrS8
 u7ut0JWjWWWg401cWSotDt3fdL6KQeU5eRCEVIq8MwBTI0PA6WOI5XVdAhaB2rOlK3vj
 myLkrc8ZKkYg7Sgy8x9ktD5XRYtrYKEoPFjRxY98Brvxrlx3YSWRnnxGPIFTKYRO1q5i
 KkhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xBAV1IZOKR8EJzQ7z4YlJl8lIiFIn3TZTyCVwxgCbKA=;
 b=VK3RZUGnMz+bv7gZAf4Lr9CYR96U36KyGG28nk9QOFaPP96KvqFPzxj3NZL0vZeX89
 C4cDaMutODNdjQzgQu7/YL8CtBFkLV7fIHNBiq54EBMbG5W5WpxyeAIjLoSWtcAhSo8y
 IZTUsTM29w0COXR/R/5QWi6ZiLowvhXh9Vntlk+D/y8Y0Z1ds01miw8Wx2ijgxWUElky
 /XfAAjMB3OdxuKelIwg6PJ27daN2wVuYCQrNz6oeu3bm591BbudJ7KMnKTsmd9brI7ED
 vOqfx6T0lXgbxl58RxCQPpUuXq4GfePFEa7p2QHApSmiaOMGznWUbsgT7Ny91hLY1a1p
 cYAg==
X-Gm-Message-State: AOAM530eDj9n8mCV8TysrOG+oea/dpaThGjqxScFJNENiTkDDDXgqy0E
 xneTLrupW+f/vVNzmdON7Ts=
X-Google-Smtp-Source: ABdhPJxK3rVkKBPsoLde411FmqBrFo5v7DvfoVujFN7OIeRgLW9fdH7QhvodcCWLLNYZkTPek8+y8Q==
X-Received: by 2002:a5d:4a07:: with SMTP id m7mr8869904wrq.535.1642613281571; 
 Wed, 19 Jan 2022 09:28:01 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id i19sm144754wml.29.2022.01.19.09.28.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 09:28:01 -0800 (PST)
Message-ID: <19b6286c-0588-4102-5917-3d673bffd5ee@amsat.org>
Date: Wed, 19 Jan 2022 18:28:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] configure: Use -mlittle-endian instead of -mlittle for
 ppc64
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, mrezanin@redhat.com,
 qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
References: <20220119095641.6729-1-mrezanin@redhat.com>
 <04f36e62-1a66-1268-859b-e3ffdb520fd6@redhat.com>
In-Reply-To: <04f36e62-1a66-1268-859b-e3ffdb520fd6@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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

On 1/19/22 12:13, Paolo Bonzini wrote:
> On 1/19/22 10:56, mrezanin@redhat.com wrote:
>> From: Miroslav Rezanina <mrezanin@redhat.com>
>>
>> GCC options -mlittle and -mlittle-endian are equivalent on ppc64
>> architecture. However, clang supports only -mlittle-endian option.
>>
>> Use longer form in configure to properly support both GCC and clang
>> compiler.
>>
>> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
>> ---
>>   configure | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/configure b/configure
>> index e1a31fb332..e63c78ca67 100755
>> --- a/configure
>> +++ b/configure
>> @@ -658,7 +658,7 @@ case "$cpu" in
>>       CPU_CFLAGS="-m64 -mbig" ;;
>>     ppc64le)
>>       cpu="ppc64"
>> -    CPU_CFLAGS="-m64 -mlittle" ;;
>> +    CPU_CFLAGS="-m64 -mlittle-endian" ;;
>>       s390)
>>       CPU_CFLAGS="-m31" ;;
> 
> Does -mbig need the same one line above?

Yes, and tests/tcg/configure.sh needs that change too.

