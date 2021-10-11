Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CF0429919
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 23:41:46 +0200 (CEST)
Received: from localhost ([::1]:36528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma33J-0007Sd-Nq
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 17:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ma2yk-0005Z6-Tn
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 17:37:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ma2yR-0002kI-KF
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 17:37:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633988195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6LMyxC2GuTWcC1tXgnn/qMDKyg30Ohmleol8hTieHHo=;
 b=beF9IYEJHbbcRyVMljQ/dfZDLdLgM8g+i/ZrwaXdJICFuwx4OlRkyjcVZCuH6l3FFVJEFZ
 dpDJ5fBVvIaOqp+WQ6EoLKesA64QqdKu1Neep4qCO8ssaaEt9gRSMRvHhRX3SzzIwDXh/k
 P+lRJ9h2nhz3cbuBWt0QH6Lm0gQyl8k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-sZ587fIAOy6WOHU5cyWs6A-1; Mon, 11 Oct 2021 17:36:34 -0400
X-MC-Unique: sZ587fIAOy6WOHU5cyWs6A-1
Received: by mail-wr1-f69.google.com with SMTP id
 s18-20020adfbc12000000b00160b2d4d5ebso14276184wrg.7
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 14:36:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6LMyxC2GuTWcC1tXgnn/qMDKyg30Ohmleol8hTieHHo=;
 b=ewPx7+Q7WICG6uFe72juHWdCN5B+VashjBrkCeqHM43NcE61wsYEQfeScVE7UTqdTA
 ZFMpKb4DuvTxSEPEkiPIz4D+Bo+k0akIgNEtoS+x+k26X3jiVTb341hzf13Q4/tVlqkG
 VpbMKGI+3K3lJiYC9jlI4wO+NrXPFK+lsqx3i0pBMaJXe8P9pkTcooeVpmnl3txNX5Eq
 CaHPleNnvy2uRxgUt1edMvA9ukkt6D/tBnr+mqp1kzU3yFx7y7sxoT7PNSHrDzkmCtAN
 YuiAnVLN044/PW5Yh6Rd1NW5k/fuFWxvlNvoN39nbROkzL8+dPNil86iAQTpHC2RUaUD
 FISg==
X-Gm-Message-State: AOAM531BO8JF2Fh1LaZrH/WaraGw2Y27jzH97UvTAm4VNripT0yfHWxS
 jF/v4Y9BhLq6ygWfN21GhvkVf5baNabWgtuUcYyl3mrBfByWUvRgMMOXz6UTaStFSvYfMDXXbUM
 88vpM41ICR/75Y90=
X-Received: by 2002:a7b:c444:: with SMTP id l4mr1519964wmi.115.1633988193590; 
 Mon, 11 Oct 2021 14:36:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEp1b2PSe5aU4cGMddOXYXbIA3qNzeYYhotCoXtQF7DfI6vT4heUD/TBNHMTQAUsUa9BjPHQ==
X-Received: by 2002:a7b:c444:: with SMTP id l4mr1519948wmi.115.1633988193395; 
 Mon, 11 Oct 2021 14:36:33 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id p19sm590686wmg.29.2021.10.11.14.36.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 14:36:32 -0700 (PDT)
Message-ID: <016d8001-24aa-b4e3-ce1a-92f275d4bec5@redhat.com>
Date: Mon, 11 Oct 2021 20:08:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] s390x/ipl: check kernel command line size
To: Thomas Huth <thuth@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>,
 qemu-devel@nongnu.org
References: <20211006092631.20732-1-mhartmay@linux.ibm.com>
 <4683659f-1efe-7c1a-070e-21803f5c8100@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <4683659f-1efe-7c1a-070e-21803f5c8100@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, Cornelia Huck <cohuck@redhat.com>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/11/21 15:38, Thomas Huth wrote:
> On 06/10/2021 11.26, Marc Hartmayer wrote:
>> Check if the provided kernel command line exceeds the maximum size of
>> the s390x
>> Linux kernel command line size, which is 896 bytes.
>>
>> Reported-by: Sven Schnelle <svens@linux.ibm.com>
>> Signed-off-by: Marc Hartmayer <mhartmay@linux.ibm.com>
>> ---
>>   hw/s390x/ipl.c | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
>> index 1821c6faeef3..a58ea58cc736 100644
>> --- a/hw/s390x/ipl.c
>> +++ b/hw/s390x/ipl.c
>> @@ -38,6 +38,7 @@
>>   #define KERN_IMAGE_START                0x010000UL
>>   #define LINUX_MAGIC_ADDR                0x010008UL
>>   #define KERN_PARM_AREA                  0x010480UL
>> +#define KERN_PARM_AREA_SIZE             0x000380UL
>>   #define INITRD_START                    0x800000UL
>>   #define INITRD_PARM_START               0x010408UL
>>   #define PARMFILE_START                  0x001000UL
>> @@ -190,10 +191,19 @@ static void s390_ipl_realize(DeviceState *dev,
>> Error **errp)
>>            * loader) and it won't work. For this case we force it to
>> 0x10000, too.
>>            */
>>           if (pentry == KERN_IMAGE_START || pentry == 0x800) {
>> -            char *parm_area = rom_ptr(KERN_PARM_AREA,
>> strlen(ipl->cmdline) + 1);
>> +            size_t cmdline_size = strlen(ipl->cmdline) + 1;
>> +            char *parm_area = rom_ptr(KERN_PARM_AREA, cmdline_size);
>> +
>>               ipl->start_addr = KERN_IMAGE_START;
>>               /* Overwrite parameters in the kernel image, which are
>> "rom" */
>>               if (parm_area) {
>> +                if (cmdline_size > KERN_PARM_AREA_SIZE) {
>> +                    error_setg(errp,
>> +                               "kernel command line exceeds maximum
>> size: %lu > %lu",
> 
> I think the first %lu should be %zd instead?

%zu ;)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> 
> Apart from that, the patch looks fine to me... so if you agree, I can
> fix that up when picking up the patch.
> 
>  Thomas


