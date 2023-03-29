Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF42B6CDB74
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 16:03:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phWOE-0008AO-Gw; Wed, 29 Mar 2023 10:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phWOD-00089s-12
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 10:03:01 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phWO7-0001bj-1T
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 10:03:00 -0400
Received: by mail-wr1-x429.google.com with SMTP id h17so15828507wrt.8
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 07:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680098573;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/d8JcgdnzaCOJS/UJ0Kdvwztg/5uDgs84zLYtJeJdxg=;
 b=pkCf+on6bJ4oOMGejITlkFFdC4It3NAnyGfzPKVtDHJurnLbsXOEWoIKKNwSslynhr
 wPLIdMqQEaqBTHHzAq/ZtpBRnbdbfWrvgLys2sZQNxO+RvTeK2bPu++GN0vJwztuoBJt
 MEoYffrZPC6vlpFrPkonkoAzivr55eWEtJlLmQURPqt6Bd23xHot29vYa2dAfo0JjeH2
 r2Qwjn8jRohxo9D/u4r9p+MTw0+uGmaxaeoHPSJeZQq+1WlXFah9DpDzqnRlu/OjeAtD
 BTgRe87fyxDCj4LzPhtWcfABZX2iX+d0cU4KG7C+RPmQH0D9rxzp/VOHaMCrUuM+2gcX
 F/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680098573;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/d8JcgdnzaCOJS/UJ0Kdvwztg/5uDgs84zLYtJeJdxg=;
 b=i5Z+Z4d5arlJGg5VSpMuvPtOw8sd0cQ4BZUzXZrj+shZkmyhn8TzfaSeHKD8sr2OFz
 CJIV+4l8Ivd1Mhn+W9WzPgEUAD634iCUNT6hhpQdiGv2rrRImnIJqPUBsyraZ4uelPwp
 Aznz5PR9QfVdXjpCF1/x/HFWGopk0v7HXpkxagZJHAU8pwmoXaHrLLJ9WNzjOmn/74zI
 PtTDzj/pewq8mpX71umA/9n+QZyV1MtAFetDji6kHnK09QdK0AD8EuM1MrTUy4zbRS5+
 WbwxnHh85r7KfPWk1OHxpnp+Nng10TUnLG2R+0GRVUwfixtFSQzjuXSfG1yGtZ8FKWHV
 0CWw==
X-Gm-Message-State: AAQBX9cPN2CtDUzTLswEDPlWl54xS7ROWaubsu+PBLVQdxAwErLVrZLW
 cHy3WDzcClJokjFhEiqVUHd6rQ==
X-Google-Smtp-Source: AKy350bp5nFMkad5k8S7dTdpXyf8B2QIQjE6VxalyijV3MyqV8dG+TwK5JcU4pfrYXjEePuIDhxcTw==
X-Received: by 2002:a5d:4943:0:b0:2cf:f061:4927 with SMTP id
 r3-20020a5d4943000000b002cff0614927mr15349164wrs.42.1680098573520; 
 Wed, 29 Mar 2023 07:02:53 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l3-20020a1c7903000000b003ed1ff06faasm2344296wme.19.2023.03.29.07.02.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 07:02:53 -0700 (PDT)
Message-ID: <9e0612a6-cfad-bcb3-8699-faa7e8588349@linaro.org>
Date: Wed, 29 Mar 2023 16:02:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH v2] linux-user: preserve incoming order of environment
 variables in the target
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Andreas Schwab <schwab@suse.de>
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <mvmy1nfslvi.fsf@suse.de> <ZCREaEiPyzYogkFj@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ZCREaEiPyzYogkFj@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

On 29/3/23 16:00, Daniel P. Berrangé wrote:
> On Wed, Mar 29, 2023 at 03:55:13PM +0200, Andreas Schwab wrote:
>> Do not reverse the order of environment variables in the target environ
>> array relative to the incoming environ order.  Some testsuites depend on a
>> specific order, even though it is not defined by any standard.
>>
>> Signed-off-by: Andreas Schwab <schwab@suse.de>
>> ---
>>   linux-user/main.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
> 
> bsd-user/main.c appears to have an identical code pattern that
> will need the same fix
> 
>>
>> diff --git a/linux-user/main.c b/linux-user/main.c
>> index 4b18461969..dbfd3ee8f1 100644
>> --- a/linux-user/main.c
>> +++ b/linux-user/main.c
>> @@ -691,7 +691,13 @@ int main(int argc, char **argv, char **envp)
>>       envlist = envlist_create();
>>   
>>       /* add current environment into the list */
>> +    /* envlist_setenv adds to the front of the list; to preserve environ
>> +       order add from back to front */

Also, QEMU coding style now requires:

   /*
    * this comment form.
    */

;)

>>       for (wrk = environ; *wrk != NULL; wrk++) {
>> +        continue;
>> +    }
>> +    while (wrk != environ) {
>> +        wrk--;
>>           (void) envlist_setenv(envlist, *wrk);
>>       }
>>   
>> -- 
>> 2.40.0
>>
>>
>> -- 
>> Andreas Schwab, SUSE Labs, schwab@suse.de
>> GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
>> "And now for something completely different."
>>
> 
> With regards,
> Daniel


