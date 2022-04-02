Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D414F0471
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 17:32:27 +0200 (CEST)
Received: from localhost ([::1]:48510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nafjm-0005hL-Dl
	for lists+qemu-devel@lfdr.de; Sat, 02 Apr 2022 11:32:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nafid-0004ui-17
 for qemu-devel@nongnu.org; Sat, 02 Apr 2022 11:31:15 -0400
Received: from [2a00:1450:4864:20::634] (port=42837
 helo=mail-ej1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nafib-00057K-EX
 for qemu-devel@nongnu.org; Sat, 02 Apr 2022 11:31:14 -0400
Received: by mail-ej1-x634.google.com with SMTP id i27so4448308ejd.9
 for <qemu-devel@nongnu.org>; Sat, 02 Apr 2022 08:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lOhb3kJMGZ1xP9WG2zUmc9UCS5rzmeXuASIZVL7aOg8=;
 b=C4EhfamaX9mRvDvMJNItlWNctGcu4gqUpL2CfOTf/Mba36NqrBPIZQ5rK+xmVTycnr
 dqzUYEtfKblCVaQZwfqJJRc8NF7875bKAFH5iBwpjbvdC8IkQFVUMOSPvtKDroOLLI65
 +i9H/DuOgjkSixxKC7b0f6+j1qgxswl01aW1MV11EygWFZw1c1p3cEqnab6OvXBxnvPR
 +YngM8uzwZagFA8IC3haDr/uMPllSpPl8J3UjqI7rJFLY9A1fovMYa5s/A5AQOD26WSG
 Pfj8byLUpapcQMU6MLXBFkXwNaVvwPgdipM1NsrelFkAfJ8v8VocSMJHqTp6At1LN4Xe
 KiRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lOhb3kJMGZ1xP9WG2zUmc9UCS5rzmeXuASIZVL7aOg8=;
 b=WQP0d5gqK3dD/7VDYKOfRjGJ279F78vDbGufvMIqkpc3QM4SnS4udHndDDAtzf2v39
 BOh+MXPUW65MXgbzkhyGBqkT0PHGuNbVVba11UqW5WSEmQ4w2N1PWCDez3IfiEmY6Tqp
 8if3x2qQXrH2PBN/2WfDGEkBp33hPrJoKntBdxzfqxMKhivJp4BsI6IMjBAE0n7lkqaQ
 Ium7Kli8WMwEJ3MqfHOGMuYfe8Tu6n43KLoP94VaL92sVoJlFzWU62gF+VzJ0vHTELur
 flsz7CFOvME/gZwsi335CJzu81coLS9r1DBXDORWAV7wKEUGHczhnFn/I+VLa66Cv/pP
 XVSw==
X-Gm-Message-State: AOAM532AUdHR2F2/oCRobPWyVHognMLdy+gq3FlUFiCGIn3pVNS2b7aV
 bM364A8A7BvZKRXJajVJAt1GtA==
X-Google-Smtp-Source: ABdhPJyR0y8bYH+4DQVZz/zfDwPkzFKDrCAm4Dkx+Rrt0euopYevtZzeyTfJt0hn5FpPD5nPSAJLEw==
X-Received: by 2002:a17:907:7ea5:b0:6e1:13c3:e35f with SMTP id
 qb37-20020a1709077ea500b006e113c3e35fmr4194154ejc.99.1648913471161; 
 Sat, 02 Apr 2022 08:31:11 -0700 (PDT)
Received: from [192.168.31.109] ([185.81.138.21])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a1709067ac800b006e0d47d3a63sm2196234ejo.84.2022.04.02.08.31.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Apr 2022 08:31:10 -0700 (PDT)
Message-ID: <11a19b72-6115-7a41-6c5f-31bbc50df539@linaro.org>
Date: Sat, 2 Apr 2022 09:30:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] target/s390x: Fix the accumulation of ccm in op_icm
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20220401193659.332079-1-richard.henderson@linaro.org>
 <b3df0aa3-46eb-b7ed-93ab-1e5b3ec9f23f@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <b3df0aa3-46eb-b7ed-93ab-1e5b3ec9f23f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::634
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-s390x@nongnu.org, cohuck@redhat.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/2/22 02:38, Thomas Huth wrote:
> On 01/04/2022 21.36, Richard Henderson wrote:
>> Coverity rightly reports that 0xff << pos can overflow.
>> This would affect the ICMH instruction.
>>
>> Fixes: Coverity CID 1487161
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/s390x/tcg/translate.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
>> index 5acfc0ff9b..ea7baf0832 100644
>> --- a/target/s390x/tcg/translate.c
>> +++ b/target/s390x/tcg/translate.c
>> @@ -2622,7 +2622,7 @@ static DisasJumpType op_icm(DisasContext *s, DisasOps *o)
>>                   tcg_gen_qemu_ld8u(tmp, o->in2, get_mem_index(s));
>>                   tcg_gen_addi_i64(o->in2, o->in2, 1);
>>                   tcg_gen_deposit_i64(o->out, o->out, tmp, pos, 8);
>> -                ccm |= 0xff << pos;
>> +                ccm |= 0xffull << pos;
>>               }
>>               m3 = (m3 << 1) & 0xf;
>>               pos -= 8;
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> Is this still something for 7.0, or can it wait for the 7.1 cycle?

The bug has been present since 2012, affecting only the cc value of icmh.  It could wait 
for 7.1.

r~

