Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA93152B9C3
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 14:18:04 +0200 (CEST)
Received: from localhost ([::1]:49268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrIct-0005O1-Al
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 08:18:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nrIbX-0004O8-PG
 for qemu-devel@nongnu.org; Wed, 18 May 2022 08:16:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nrIbS-0003EV-Fj
 for qemu-devel@nongnu.org; Wed, 18 May 2022 08:16:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652876192;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rVQawEr73mB0JfT1PlFOVA6+J84kDMztatTt2cyaUFM=;
 b=QdJ/Rs/mqXERxtuGGM1ZGWzwRgszCaGKtLoxhWOdVR+bKlyt6ekdRE4o1zvTs+9eJMZcDu
 8kilMyI3cPkIQGVl4trFPqE0J6DxJd9yJi+EpJ1yDQTMsRSc2DrBAs1Md73ULvRRWJNVk/
 bx4NXMot6vJP0Pbeq9SJBmV23TkPUzY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-ZyJCM5wmPDKTzs3e-lXsDg-1; Wed, 18 May 2022 08:16:31 -0400
X-MC-Unique: ZyJCM5wmPDKTzs3e-lXsDg-1
Received: by mail-qt1-f197.google.com with SMTP id
 d4-20020a05622a15c400b002f3bd4b80f7so1519671qty.3
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 05:16:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rVQawEr73mB0JfT1PlFOVA6+J84kDMztatTt2cyaUFM=;
 b=b1E+/RNF8LsL+3KkrTjlA4OUnVTpX7j33nkWUDVPtwI0IH4JpVvrp4pRMJrzvQ/9LX
 nDXFb/XxfA8Fn7gXTLMFT1lc0sjT+C6S4RYgMTkFJOXPs8Gb46utm0pv374t5OYAqlpe
 VjkaF44p6+gzz/zKM5ME1mSnHH6ii0Y61dn5DjZVUONCCkCdkRHHtuXoT7O3uhYggJ+j
 CJK8XIqqNF6UUn13ZwOY5YHA34x/MQKDTSuFrEqvjNILwH+JGFYujeBdRArdIDNF3ixR
 igZqa+9Z2F/5FdvxpTZnvQKuLI5Yq9bjngj7CC4CSR64aET9OdtWNxTeTRkiOuczQRL2
 qMIQ==
X-Gm-Message-State: AOAM532sEt6XrTTRmW0PN9iGGa4pWH2PejUbXCFrUWgaiPVkoc58ZYOb
 FHvgTwv3bw/uJu9O5kmcRhGjZOCPkKZ7H1gid/6aAFloP12+4J8gszztVC9lGF4j3n5SKNI4djj
 WkLIoTByAROMXm5U=
X-Received: by 2002:a05:6214:27cc:b0:461:f13c:83cc with SMTP id
 ge12-20020a05621427cc00b00461f13c83ccmr980101qvb.84.1652876190895; 
 Wed, 18 May 2022 05:16:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOHHQVSPqHyoId/6ClqGuQ9RjxyPsUSHE6g2AbL891oo08JqEvpkEujEgXyGzMt/yj8Q1e4w==
X-Received: by 2002:a05:6214:27cc:b0:461:f13c:83cc with SMTP id
 ge12-20020a05621427cc00b00461f13c83ccmr980076qvb.84.1652876190615; 
 Wed, 18 May 2022 05:16:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 s62-20020a372c41000000b0069fc13ce1e9sm1385838qkh.26.2022.05.18.05.16.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 05:16:30 -0700 (PDT)
Message-ID: <f69d5ff2-6e04-c8c4-cf1f-5307a0804067@redhat.com>
Date: Wed, 18 May 2022 14:16:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Question about commit 1adf528ec3bd ("hw/rtc/pl031: Send
 RTC_CHANGE QMP event")
Content-Language: en-US
To: jokenzhang <zhangxinhao1@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: wanghaibin.wang@huawei.com
References: <876a4b1f-a5ca-6bdc-28a8-682a64661f4c@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <876a4b1f-a5ca-6bdc-28a8-682a64661f4c@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 5/18/22 11:55, jokenzhang via wrote:
> Hi Eric,
>
> Have you ever tested the value reported by the PL031 RTC_CHANGE when
> the qemu clock is using the virtual clock, which is not identical to
> mc146818.
>
> For instance, adding 20s to the guest RTC value, the expected value should be
> 20, but the actual value is 1652863291:
>
> {"timestamp": {"seconds": 1652863355, "microseconds": 298846}, "event": "RTC_CHANGE", "data": {"offset":
> 1652863291}}
>
> This is tested with qemu option "-rtc base=utc,clock=vm"

I did not test with clock=vm unfortunately. Those was my test setup:

"Tested with the following script run on guest:

  #!/bin/sh
  old=$(hwclock --show | cut -f1-7 -d' ')
  oldabs=$(date +%s -d "$old")
  newabs=$(expr $oldabs + $1)
  new=$(date -d @"$newabs")
  echo Old: $oldabs $old
  echo New: $newabs $new
  hwclock --set --date "$new"

This was tested with both -rtc base=2010-12-03T01:02:00 and base=utc
qemu options. As far as I can see the reported value match what
is observed on x86 (except on x86 the values are not exactly the one
used on guest, ie. 18 for instance instead of 20).
"

>
>>         s->tick_offset += value - pl031_get_count(s);
>> +
>> +        qemu_get_timedate(&tm, s->tick_offset);
>> +        qapi_event_send_rtc_change(qemu_timedate_diff(&tm));
> It may be caused by the calculation of the new reference time. The new reference
> time is calculated with s->tick_offset and rtc_ref_start_datetime, and
> s->tick_offset is initialized with rtc_ref_start_datetime, resulting that the
> rtc_ref_start_datetime is double counting.
I must aknowledge I am not really familiar with the clock framwork. If
you studied that code already, please feel free to send a patch, I will
help testing.

Thanks


Eric

>
>
> Thanks
>


