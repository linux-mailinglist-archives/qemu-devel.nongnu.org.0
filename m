Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B18653D3C
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 10:02:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8HST-0003Yn-NM; Thu, 22 Dec 2022 04:01:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8HSN-0003Y0-UT
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 04:01:40 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8HSM-0005jj-6b
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 04:01:39 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so776497wms.2
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 01:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a/72PC+f1U3InYxCSxVUCdhrCCw5IgzyW2967poOjbs=;
 b=hYI0Pc8hvd0hne5wEmJhSaMVcA+fTh51QaPPB96JUNhgKYawANtRmlnFG06flRxnnX
 WLE78ODL3wUqs9VV+Ew35AhL5ats/0X+xvxcLjGcu6TTz06bOv67rXfqZIzJO3MaSGeQ
 v15MWIkU21LU0uiw+I+A1XQRR69tb5ABSgjFI179o+kEh0n5QwuYDjp4G8w49CcvTDan
 4ZY6O1wjD6+Zr0qPNtH0M5Ve1xen4E76+VxJk0CDs1cjWC6n5fqGErVCgM8f6hZPW4IU
 HE85x7EFo81Cl5EoMvjomFVTMVAk+PDcwCaU5Q/Und5GC1LWdwSBckZWslckNSAIb7R8
 RHeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a/72PC+f1U3InYxCSxVUCdhrCCw5IgzyW2967poOjbs=;
 b=Nm6bcUXwUCWXk35dpjr+HFUtAOElHLUfK/EeyzfbDN0Irgk/v/tnVqY9yvttkhuRKW
 X4IVH6kS2dC982G1v9wvGrqvO+CjyLzrVpjUSrd2G1Co3EMvsTVxtelJOwGAdTqooJHC
 PoeRneZ7yTHatwN3Bcwd9Zz9NZH9AYFsv6120IXidOOG3qwiyg5hxg/h7aGDYRnfiPJ5
 PDjH8XZj7U5Gphv8vpmiYzxOECedPL8KS2FPY+QFy4aV+wzr4IUZ1MMMtaSNNLxpt+Li
 hZ/bkkK0km+zNWwiIqE7yv5bk4od4uX/hJQ1IFDqh8VTqWk3PwmYlaperl/c1CTp2SQN
 SR6g==
X-Gm-Message-State: AFqh2kpKSiaC5iTd66ZSwnmRQf5W716sp5XxZ5jETL1+bImm67smXqmB
 fuNchYXDK3Fw6H9Ui+YyDRTQEA==
X-Google-Smtp-Source: AMrXdXtgb2ckPA1ssiC4mCGEAmodWlXrUnMx6+BZBsD706D38NYMoHtp5wrRLMOzWl2DuxeJU0Hz+A==
X-Received: by 2002:a05:600c:3491:b0:3d1:f16d:5848 with SMTP id
 a17-20020a05600c349100b003d1f16d5848mr3723421wmq.26.1671699696375; 
 Thu, 22 Dec 2022 01:01:36 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j30-20020a05600c1c1e00b003c71358a42dsm6912643wms.18.2022.12.22.01.01.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 01:01:35 -0800 (PST)
Message-ID: <bafaad8e-f4f7-ddeb-4fbd-cebc7b8c360e@linaro.org>
Date: Thu, 22 Dec 2022 10:01:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v2] target/i386: Remove compilation errors when
 -Werror=maybe-uninitialized
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 eric.auger.pro@gmail.com, richard.henderson@linaro.org, paul@nowt.org,
 qemu-devel@nongnu.org, stefanha@fmail.com, peter.maydell@linaro.org,
 sw@weilnetz.de
References: <20221221163652.1239362-1-eric.auger@redhat.com>
 <ed6d68f4-81aa-d9a1-3a71-628855e8a376@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ed6d68f4-81aa-d9a1-3a71-628855e8a376@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

On 22/12/22 09:18, Paolo Bonzini wrote:
> On 12/21/22 17:36, Eric Auger wrote:
>> To avoid compilation errors when -Werror=maybe-uninitialized is used,
>> replace 'case 3' by 'default'.
>>
>> Otherwise we get:
>>
>> ../target/i386/ops_sse.h: In function ‘helper_vpermdq_ymm’:
>> ../target/i386/ops_sse.h:2495:13: error: ‘r3’ may be used
>> uninitialized in this function [-Werror=maybe-uninitialized]
>>     2495 |     d->Q(3) = r3;
>>          |     ~~~~~~~~^~~~
>> ../target/i386/ops_sse.h:2494:13: error: ‘r2’ may be used
>> uninitialized in this function [-Werror=maybe-uninitialized]
>>     2494 |     d->Q(2) = r2;
>>          |     ~~~~~~~~^~~~
>> ../target/i386/ops_sse.h:2493:13: error: ‘r1’ may be used
>> uninitialized in this function [-Werror=maybe-uninitialized]
>>     2493 |     d->Q(1) = r1;
>>          |     ~~~~~~~~^~~~
>> ../target/i386/ops_sse.h:2492:13: error: ‘r0’ may be used
>> uninitialized in this function [-Werror=maybe-uninitialized]
>>     2492 |     d->Q(0) = r0;
>>          |     ~~~~~~~~^~~~

With what compiler? Is that a supported one?

>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Suggested-by: Stefan Weil <sw@weilnetz.de>
>> Fixes: 790684776861 ("target/i386: reimplement 0x0f 0x3a, add AVX")
>> ---
>>   target/i386/ops_sse.h | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
>> index 3cbc36a59d..c442c8c10c 100644
>> --- a/target/i386/ops_sse.h
>> +++ b/target/i386/ops_sse.h
>> @@ -2466,7 +2466,7 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg *s, 
>> uint32_t order)
>>           r0 = s->Q(0);
>>           r1 = s->Q(1);
>>           break;
>> -    case 3:
>> +    default:
>>           r0 = s->Q(2);
>>           r1 = s->Q(3);
>>           break;
>> @@ -2484,7 +2484,7 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg *s, 
>> uint32_t order)
>>           r2 = s->Q(0);
>>           r3 = s->Q(1);
>>           break;
>> -    case 3:
>> +    default:
>>           r2 = s->Q(2);
>>           r3 = s->Q(3);
>>           break;
> 
> Queued, but this compiler sucks. :)

Can't we simply add a dumb 'default' case? So when reviewing we don't
have to evaluate 'default' means 3 here.

-- >8 --
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2470,6 +2470,8 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg *s, 
uint32_t order)
          r0 = s->Q(2);
          r1 = s->Q(3);
          break;
+    default:
+        qemu_build_not_reached();
      }
      switch ((order >> 4) & 3) {
      case 0:
@@ -2488,6 +2490,8 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg *s, 
uint32_t order)
          r2 = s->Q(2);
          r3 = s->Q(3);
          break;
+    default:
+        qemu_build_not_reached();
      }
      d->Q(0) = r0;
      d->Q(1) = r1;
---

