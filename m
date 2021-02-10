Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4BB315F3D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 07:11:39 +0100 (CET)
Received: from localhost ([::1]:33796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9iiw-00081D-7U
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 01:11:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l9ihC-0007VQ-6n
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 01:09:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l9ih8-0004Jc-AU
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 01:09:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612937385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c7EsQbo5njMljNlPE8YedfslLF/E7NI6zizZMivAQHI=;
 b=IayIxa+WurpkYgNTJiY/ClHrXnrJEjLq6qj0D2YMHItTFkEx4vz80Q5E/S9TCQ6KWZETmJ
 PHqHA6H5evz1IWLvP15sGqWy1vjGH0tqVOiShnjwzjtgXLUSsKgGiAq+3gthKmERp6B0xe
 0egv4v3KkF5OVcIKGPQ9B2R491hjZLQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-bp3Cx1kqP9iuOkCUl5FNaQ-1; Wed, 10 Feb 2021 01:09:43 -0500
X-MC-Unique: bp3Cx1kqP9iuOkCUl5FNaQ-1
Received: by mail-wm1-f70.google.com with SMTP id m25so831419wmi.6
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 22:09:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c7EsQbo5njMljNlPE8YedfslLF/E7NI6zizZMivAQHI=;
 b=gZcOS56SWnt7pGvb1LUx2OSoRC3ihEwvw1kXPdthplGXiC7pZ3ybn/16/qxT4yK38k
 QBlgNz2YBZhKSCZJLXKMRCXuHbXHHvTZa9nQmC/mFEEmCO+5wVWmxNxmXUTXkjqeJAmK
 tgJPMiHdaSsACn/+4U0GdE43jQ4kMSiQQZRL91DlfvKjJjPSsbjog0UpXBAYOU2SjLf3
 N8L/TXS0kDS7bhx/TpFgycWi/vQbkPfrdqHVJwDIQotv4D+NoHdUJF/VBz2D+di4sNLH
 AYBvPFmIGeS4qDetqxWf7ShGLWp/9EGFNGkCgDNcYApLjqnmJCVJ0+aHvrj91Bv/wiGN
 ORqw==
X-Gm-Message-State: AOAM5312agZlChaqYfDwxQnLEEhvIJbK1wa8vVLxd5x4iTdVR7PGrzYP
 dDOsaV/vQ4nhzhh6g9TDy4/STTGeih9Mbop5Ruxwr0rmsrXZhDsC7bwdgVFLhViWcM6pfaWXJwP
 YKBzkJx/tzX4aypI=
X-Received: by 2002:a1c:40d4:: with SMTP id n203mr1373856wma.46.1612937382774; 
 Tue, 09 Feb 2021 22:09:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJycqnPeR9GO/XPlbEXO6zlAf6dwgS2F84wvbAZ31e0cjuWaFcSyOdCeLf8unqivdYsXiuDyJw==
X-Received: by 2002:a1c:40d4:: with SMTP id n203mr1373829wma.46.1612937382446; 
 Tue, 09 Feb 2021 22:09:42 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id 36sm1479228wrj.97.2021.02.09.22.09.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Feb 2021 22:09:41 -0800 (PST)
Subject: Re: [PATCH] hw/block/nvme: improve invalid zasl value reporting
To: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
 "its@irrelevant.dk" <its@irrelevant.dk>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20210208082532.308435-1-its@irrelevant.dk>
 <4c6a62bf19b79eb7b770aba90425a0ebffbc9fb7.camel@wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <19475525-e1cb-e1cf-4c68-30432c31bdde@redhat.com>
Date: Wed, 10 Feb 2021 07:09:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <4c6a62bf19b79eb7b770aba90425a0ebffbc9fb7.camel@wdc.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "kwolf@redhat.com" <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "k.jensen@samsung.com" <k.jensen@samsung.com>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "kbusch@kernel.org" <kbusch@kernel.org>,
 "info@dantalion.nl" <info@dantalion.nl>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/21 8:39 PM, Dmitry Fomichev wrote:
> On Mon, 2021-02-08 at 09:25 +0100, Klaus Jensen wrote:
>> From: Klaus Jensen <k.jensen@samsung.com>
>>
>> The Zone Append Size Limit (ZASL) must be at least 4096 bytes, so
>> improve the user experience by adding an early parameter check in
>> nvme_check_constraints.
>>
>> When ZASL is still too small due to the host configuring the device for
>> an even larger page size, convert the trace point in nvme_start_ctrl to
>> an NVME_GUEST_ERR such that this is logged by QEMU instead of only
>> traced.
>>
>> Reported-by: "info@dantalion.nl" <info@dantalion.nl>

Apparently the reporter signed 'Corne'.

>> Cc: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
>> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>> ---
>>  hw/block/nvme.c | 12 ++++++++++--
>>  1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
>> index c2f0c88fbf39..d96888cd2333 100644
>> --- a/hw/block/nvme.c
>> +++ b/hw/block/nvme.c
>> @@ -3983,8 +3983,10 @@ static int nvme_start_ctrl(NvmeCtrl *n)
>>          n->zasl = n->params.mdts;
>>      } else {
>>          if (n->params.zasl_bs < n->page_size) {
>> -            trace_pci_nvme_err_startfail_zasl_too_small(n->params.zasl_bs,
>> -                                                        n->page_size);
>> +            NVME_GUEST_ERR(pci_nvme_err_startfail_zasl_too_small,
>> +                           "Zone Append Size Limit (ZASL) of %d bytes is too "
>> +                           "small; must be at least %d bytes",
>> +                           n->params.zasl_bs, n->page_size);
>>              return -1;
>>          }
>>          n->zasl = 31 - clz32(n->params.zasl_bs / n->page_size);
>> @@ -4503,6 +4505,12 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
>>              error_setg(errp, "zone append size limit has to be a power of 2");
>>              return;
>>          }
>> +
>> +        if (n->params.zasl_bs < 4096) {
>> +            error_setg(errp, "zone append size limit must be at least "
>> +                       "4096 bytes");
>> +            return;
>> +        }
>>      }
>>  }
> 
> The guest error is less confusing than simply a trace. LGTM.

Trace events are meant for the developers when debugging, they
are usually stripped out in final build.

Errors are reported to the user / operator (i.e. incorrect
configuration).

Regards,

Phil.


