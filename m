Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 180B62D9909
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 14:41:18 +0100 (CET)
Received: from localhost ([::1]:51002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koo6H-0000nq-6i
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 08:41:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koo4W-0008B5-9n
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 08:39:28 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:41696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koo4U-0000h9-QQ
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 08:39:27 -0500
Received: by mail-wr1-x441.google.com with SMTP id a12so16432222wrv.8
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 05:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UgcEUr5QIiY5LQvPVy63UDVxZlikA79PjH7B+01H7SE=;
 b=Hvk+bhnjXoSDB9sgZCnIzCt4oBOw+UN9MCgX9Hfm/lU3f5AhQzRiXKuqJt0zrBY6UT
 Rov0QEoFV00MNkX4S/Y2cuAJaNjW6gyts0/W+2jb8bG/DO3zgTz4upwX39mK+CCmbk0z
 GAUglUgfR7R0dCSjF6qCfY9tF7JkizwDg+hVIKG2G2eO3O6R7KunNC9Bi/oRSvYZFDvO
 IByZf7lOzfOadK0uR6nSogdzhmnEwC4tZiHoZVaMJamJQMtLHudFHScaZtJN34dzGvAv
 x9cXxqkzQVugtJ+u3U/D37lW6oHe9zDpve5ViXzqO8/xnBOIZ247j01Z84nuKP6XHz1s
 NLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UgcEUr5QIiY5LQvPVy63UDVxZlikA79PjH7B+01H7SE=;
 b=Eb3XwHn0NwL8kqhzAybF2b3rTPTLZkn7hEJ+aXleFaa+gDsxLC+x92OioDx5glB55D
 JERFt/2ArOCJ0CZjh+/QwFslnbpl9R1Z3eNHFhfx5uSUDjpRRhgfXQGcMemTwxnJavNu
 R78A8IOmEXN39KiRhvF60/Rwa12HPUTpuKa/UuxnAZx2y3NfoxvtRriX1pBrBFqyCcu0
 aF7auULWHgNKo54rIoxukRq31gwkRpGB0moqBnKm0EfEYWxstGONe7AumfWGzJAY6kg5
 PHHQYarELu/+S8LAxedl4zTuaPjanUwXrFKLfolTcjWl1O8+11aPmic524n6+Xhyv6qH
 Cf9A==
X-Gm-Message-State: AOAM532uSCnv+tMV5rw5bElDO3CLBj+zsqu5umSt6WzlmsnLaaW1TXUc
 YrGjs+YVMYnpcuN8Q76bUgA=
X-Google-Smtp-Source: ABdhPJzejvEUHJCzvm/EBbZy1D6VHFogBQKAwZK93C+r2HyyVFtEKOBBgSULq+w843sun2wiEJWMUg==
X-Received: by 2002:adf:9dc4:: with SMTP id q4mr28723544wre.367.1607953165303; 
 Mon, 14 Dec 2020 05:39:25 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id l8sm30856939wmf.35.2020.12.14.05.39.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 05:39:24 -0800 (PST)
Subject: Re: [PATCH] tests/docker: Include 'ccache' in Debian base image
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20201213211601.253530-1-f4bug@amsat.org>
 <21650cc2-8e1e-067c-fc89-ec7904dc87eb@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5b4bca2e-366a-fd5a-f334-39c0f342e284@amsat.org>
Date: Mon, 14 Dec 2020 14:39:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <21650cc2-8e1e-067c-fc89-ec7904dc87eb@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Hi Thomas,

On 12/14/20 6:44 AM, Thomas Huth wrote:
> On 13/12/2020 22.16, Philippe Mathieu-Daudé wrote:
>> Include the 'ccache' package to speed up compilation.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  tests/docker/dockerfiles/debian10.docker | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dockerfiles/debian10.docker
>> index 73a3caac9cd..9d42b5a4b81 100644
>> --- a/tests/docker/dockerfiles/debian10.docker
>> +++ b/tests/docker/dockerfiles/debian10.docker
>> @@ -20,6 +20,7 @@ RUN apt update && \
>>          bc \
>>          build-essential \
>>          ca-certificates \
>> +        ccache \
>>          clang \
>>          dbus \
>>          gdb-multiarch \
> 
> Don't you need some additional setup for this? Like caching the
> corresponding directory during CI runs?

I hadn't looked at CI (too many CI series in fly).

w.r.t. Docker this is in use since 4 years, see:
324027c24cd ("Makefile: Rules for docker testing")
36ac78e65a0 ("docker: Don't mount ccache db if NOUSER=1")

I suppose we forgot the package when introducing debian10
base image in commit d6db2a1cdf6 ("docker: add
debian-buster-arm64-cross").

Regards,

Phil.

