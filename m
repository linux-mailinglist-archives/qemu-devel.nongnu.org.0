Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 942DD4D495D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 15:19:06 +0100 (CET)
Received: from localhost ([::1]:47096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSJdB-0003sF-JJ
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 09:19:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nSJHi-0000cB-4L
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 08:56:54 -0500
Received: from [2a00:1450:4864:20::435] (port=35780
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nSJHg-0001uI-Jn
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 08:56:53 -0500
Received: by mail-wr1-x435.google.com with SMTP id r6so7674130wrr.2
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 05:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=x9s7qdzztMX3MMYuJ72ZDlhJ7e6Z9JPIWu4CABsZ6gY=;
 b=kmofPtEUVTSn/wLwncLaAnzC544p9pwrGGmgYbv5NvHTwyTDxB5y9sg8XuGsBXvYXf
 0VL6dgl7ma8rTNhnBI/xKt3CoI96t7QLfCo/yXLHzRARcOR7R+8dmPl795EryOCYkrz/
 2pxn9EQfO9Jm2K575rcUSzdjwiPSWEyUIIe41LebNUIVndoFRvV+D8kR8uHGsvaWm85m
 86dVjDu+SkwqY50iJdToo226Ub3bzA10MiMRy1QW0n8/Puxz9YKMdpKMTrzlYCIlHhYQ
 g3Gb5OVQZ1afMAVg3/F5uyNgsNVBKSRPeJoU7zRHXGUPedxaQ+/rPnDQnVURRnKvS/Mm
 a9TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x9s7qdzztMX3MMYuJ72ZDlhJ7e6Z9JPIWu4CABsZ6gY=;
 b=45M5cvGk+MdJRMdsr0ukyr06nJus6gLF0ov5ipoAs2+xJhG34/iV1MoXV+t9/JH1lS
 8HH0CntO+YdqdsbUeGYvIo+h5SAZdydZQ6WETe1EcwGgbhz5OfxezJVqtpcgC6eHItVo
 1dXgornMKqzKgUcxrdFbPERnGIEXMJmDc9YlLFQZdgHnEMs0kauVaZ0WaI27VQb7Mk79
 GsUVip37xhE3iEbcR2yOUBnTx8zbxufSdx7L8VGbVXv0DcZLIWWlz3c/nBtYCMz5/B/1
 Hqn628VdpSxN9254UaZ01W785P5Jsg1DpKExWfzqea+3Du+x7E9l13LAZL/OSOrX9IT7
 yyLA==
X-Gm-Message-State: AOAM5334jLxSoaD7hdd0Y3CRcEBYt8iHeTdgnHccad7A+wjqztAUEF0h
 u2IUKXByoPpUlIWLJEwHOUE=
X-Google-Smtp-Source: ABdhPJyoalRLGhMv5xJOEni9Iwb5N0Pi1ZOcaXi3fMsuu0K5PO4Xz64W7RvLalkUHSkMc54pzbEN7w==
X-Received: by 2002:adf:d84c:0:b0:1f0:651d:c6da with SMTP id
 k12-20020adfd84c000000b001f0651dc6damr3619670wrl.665.1646920611010; 
 Thu, 10 Mar 2022 05:56:51 -0800 (PST)
Received: from [192.168.1.34] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 z3-20020a1cf403000000b0037d1f4a2201sm4648342wma.21.2022.03.10.05.56.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 05:56:50 -0800 (PST)
Message-ID: <7e7c43ee-1eb7-3392-8b36-ef8c644ae21c@gmail.com>
Date: Thu, 10 Mar 2022 14:56:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH-for-7.0] softmmu: List CPU types again
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20220310115502.3311-1-philippe.mathieu.daude@gmail.com>
 <0061fb85-fbe5-9304-6e6b-ae82bbf47482@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <0061fb85-fbe5-9304-6e6b-ae82bbf47482@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/3/22 13:23, Thomas Huth wrote:
> On 10/03/2022 12.55, Philippe Mathieu-Daudé wrote:
>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> Commit e0220bb5b2 made cpus.c target-agnostic but didn't notice
>> the cpu_list() function is only defined in target-specific code
>> in "cpu.h". Extract list_cpus() from the generic cpus.c into a
>> new target-specific unit.
>>
>> Fixes: e0220bb5b2 ("softmmu: Build target-agnostic objects once")
>> Reported-by: Max Filippov <jcmvbkbc@gmail.com>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   softmmu/cpus.c      |  8 --------
>>   softmmu/cpus_list.c | 36 ++++++++++++++++++++++++++++++++++++
>>   softmmu/meson.build |  1 +
>>   3 files changed, 37 insertions(+), 8 deletions(-)
>>   create mode 100644 softmmu/cpus_list.c
>>
>> diff --git a/softmmu/cpus.c b/softmmu/cpus.c
>> index e1d84c8ccb..7b75bb66d5 100644
>> --- a/softmmu/cpus.c
>> +++ b/softmmu/cpus.c
>> @@ -728,14 +728,6 @@ int vm_stop_force_state(RunState state)
>>       }
>>   }
>> -void list_cpus(const char *optarg)
>> -{
>> -    /* XXX: implement xxx_cpu_list for targets that still miss it */
>> -#if defined(cpu_list)
>> -    cpu_list();
>> -#endif
>> -}
>> -
>>   void qmp_memsave(int64_t addr, int64_t size, const char *filename,
>>                    bool has_cpu, int64_t cpu_index, Error **errp)
>>   {
>> diff --git a/softmmu/cpus_list.c b/softmmu/cpus_list.c
>> new file mode 100644
>> index 0000000000..59ef604423
>> --- /dev/null
>> +++ b/softmmu/cpus_list.c
> 
> The other cpu*.c files in softmmu use a "-" instead of "_", so I'd also 
> use a "-" for cpu-list.c.

I guess I used '_' copy/pasting from arch_init.c:

  specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files(
    'arch_init.c',
+  'cpus_list.c',
    'ioport.c',

I don't mind changing, but it would be better to standardize that on
a project scope / level.

