Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EDC50171C
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 17:58:06 +0200 (CEST)
Received: from localhost ([::1]:34180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf1rB-00077V-9p
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 11:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nf1pu-0005me-0T
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 11:56:46 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:45811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nf1pq-00014K-Eu
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 11:56:43 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 a16-20020a17090a6d9000b001c7d6c1bb13so6064063pjk.4
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 08:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Q7cOuoUwDJ74y8nMLMyyhq/Rir5Rto0XHhOlegoCavs=;
 b=OypKQcRF+HMkH2d8Z6un5cviDd9s6emp05mgFscD0jpadlmQlxQiY/ly7UXZpYKMSf
 ANwkxEPQoia/CRyGiHxfpNiBLzliCr8SZ15NRm60z96Iwd01xbaCG/ge0vg+zCW/LxV7
 wW6KYygJeTkK3T1hKyd27Y+GLDJZx9kjGssOFrLhVhIFpvK5HX/DbWY0XUVOhQWgD699
 dB+eLO2uluY/yZSxzgLk+DOzoB3hqLDBxHv5bRDq2LF425E8VJWUb5WqadNoBAkd7LC7
 2PZlk0eOnBY6bLAb025pxvDr/Suo+lZDI0dfBqFcV9vCxKnpECcnZAydBImX9t2Gvq4T
 v0bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Q7cOuoUwDJ74y8nMLMyyhq/Rir5Rto0XHhOlegoCavs=;
 b=ptGm4J97eWMeH6PmQa8B3ok7cQMQFV2RcIDZucnVmS7I8wdru68YUa8fdRBJhu+nid
 bWt0oQ57Rv5XBZXq/x2tB7gFNfEkCA4h08epAfLOUnYf01uQ6dSoGmePCaH+9tp84R9U
 EwgZuGzlX85VspG7kBOZ6jnaapkiegTSC2Jw/K/Dzuh1wp0dE76XebVwXj95G9wXKHQ+
 zY369loT+I/UHG9vmYjiLx9JLevZJFnaulVsvt3Bmj3HdaC57A5TJQoacynzhyXzci1c
 M/8utEvhuvF2WJXLLeqTagB71ppFBLvQzsuhBGkCQ2YQi6WoH+owSw2rcC+6UHVl/a5G
 MqRA==
X-Gm-Message-State: AOAM530kabmeCxMDAgfGBCvfaSS7GcQacGbxsO9kQMz3Y2ZnA5xukotx
 sobYNJ9uDoqdUipe9YCR5NENrA==
X-Google-Smtp-Source: ABdhPJzLREZvFBRklCFQ1NAk2L97tjXJLe2rsDNzD7itUnXgH1g8/Qookye3IO39ntPK1ICp2CYIWQ==
X-Received: by 2002:a17:902:cec7:b0:158:b9f0:5dad with SMTP id
 d7-20020a170902cec700b00158b9f05dadmr3560715plg.141.1649951799994; 
 Thu, 14 Apr 2022 08:56:39 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a056a0016c400b004f79504ef9csm345260pfc.3.2022.04.14.08.56.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 08:56:36 -0700 (PDT)
Message-ID: <e3990aab-e4c5-9574-291a-df2aab9c00a3@linaro.org>
Date: Thu, 14 Apr 2022 08:56:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 32/39] util/log: Rename logfilename to global_filename
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
 <20220326132534.543738-41-richard.henderson@linaro.org>
 <87sfqfu1zy.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87sfqfu1zy.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/14/22 08:18, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> Rename to emphasize this is the file-scope global variable.
>>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   util/log.c | 13 ++++++-------
>>   1 file changed, 6 insertions(+), 7 deletions(-)
>>
>> diff --git a/util/log.c b/util/log.c
>> index 491a8f97f9..b3f79deb6c 100644
>> --- a/util/log.c
>> +++ b/util/log.c
>> @@ -34,7 +34,7 @@ typedef struct QemuLogFile {
>>       FILE *fd;
>>   } QemuLogFile;
>>   
>> -static char *logfilename;
>> +static char *global_filename;
>>   static QemuMutex qemu_logfile_mutex;
>>   static QemuLogFile *qemu_logfile;
>>   int qemu_loglevel;
>> @@ -151,8 +151,8 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
>>               }
>>           }
>>   
>> -        g_free(logfilename);
>> -        logfilename = newname;
>> +        g_free(global_filename);
>> +        global_filename = newname;
>>           filename = newname;
> 
> I guess there is no conceivable failure mode in which we get a torn
> pointer without qatomic_set?

No.  Word-sized quantities like pointers will never tear.
Although what this comment has to do with a renaming, I don't know.


r~

> 
> Anyway:
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> 


