Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6013C79BC
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 00:34:17 +0200 (CEST)
Received: from localhost ([::1]:48816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Qym-00055X-MB
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 18:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m3QmB-0005yN-IF
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:21:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m3Qm8-0006aA-DK
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:21:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626214871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I6KQTaRoKv/9HTpEmP7T2IvnivkBSAaRMwxNpuvCk+Q=;
 b=WNGmSCwONnaH1CY1Mou3n2fYleKQV/hQ4HzBjPB8u94EaxKnIiDlwkCyM7ufo+eY2sttm8
 waI/OwhHGEUjFmTeOmqlWIXOA/MJAcK9mJZWPRdOpKR5/aCdxQcDENJJAGEU9gZbjlI3pC
 S4ad98wS7Y2zKMCziLoPru5zGZf7CyU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-2Ti_ZwQONJCTPi5lLZByGg-1; Tue, 13 Jul 2021 18:21:10 -0400
X-MC-Unique: 2Ti_ZwQONJCTPi5lLZByGg-1
Received: by mail-wr1-f71.google.com with SMTP id
 u13-20020a5d6dad0000b029012e76845945so332560wrs.11
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 15:21:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I6KQTaRoKv/9HTpEmP7T2IvnivkBSAaRMwxNpuvCk+Q=;
 b=kUM/y7yRp6/3GXWTVJnOJAa0ppJOW/V/sgi7N8P3ngSQwLULcjaTdrDJt03d21pJvB
 bMQo7fmD/87PEWpx/az+5TfPOUCC0c1gpoTP/sBEBcuOj6PPo7bBHJwHGzfdgSOjmkFg
 YWBWlekUzNqMuvkQ5w0mgwLHyP+41xgV3dRRUdhyBNma9b3BQPGINu6RDIl1WJ8LwOj+
 U/XFphBOB749iLac+u4EbSKkwj7J7u3CUXWo5KuIYCre9Rx4uUa3UpPcUdIVU9B8QhLu
 21sSWJwLbkOHowUW23jdxod/ooH4eS6GR5R6HSlnolSdBfdkZfiZRA1tjSq6etxLV6rG
 U/wA==
X-Gm-Message-State: AOAM531UYNLEkMWvh8mIyuWlvhb/Da+VYrDwqLVNI+rDjGVKPB01b8Tb
 xfXn93FHNZ+tPANymHR0xg/Hhs42Ejdz4hiJOPTTV+aRUYtdjXizZfJC1chK54NNQctjV4zi0TE
 E5b68E7CKFIEFb5A=
X-Received: by 2002:a7b:c30f:: with SMTP id k15mr459469wmj.128.1626214869322; 
 Tue, 13 Jul 2021 15:21:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8k/pLrZC4UjAe2zmx3ZauC6+hmuYo7Bz6SCQc1bC+wwzOvIvHGYQuatCpzQGgyLP+x2oRFA==
X-Received: by 2002:a7b:c30f:: with SMTP id k15mr459456wmj.128.1626214869134; 
 Tue, 13 Jul 2021 15:21:09 -0700 (PDT)
Received: from [192.168.1.24] (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr.
 [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id y16sm3472934wmq.1.2021.07.13.15.21.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 15:21:08 -0700 (PDT)
Subject: Re: [PATCH v2 2/5] hw/nvme: use symbolic names for registers
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
References: <20210713192428.950160-1-its@irrelevant.dk>
 <20210713192428.950160-3-its@irrelevant.dk>
 <306b8373-079f-5000-e70c-041ab18c320f@redhat.com>
Message-ID: <4864a63f-f829-91ae-3f48-428af05d2152@redhat.com>
Date: Wed, 14 Jul 2021 00:21:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <306b8373-079f-5000-e70c-041ab18c320f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.368, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier <lvivier@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/14/21 12:12 AM, Philippe Mathieu-Daudé wrote:
> On 7/13/21 9:24 PM, Klaus Jensen wrote:
>> From: Klaus Jensen <k.jensen@samsung.com>
>>
>> Add the NvmeBarRegs enum and use these instead of explicit register
>> offsets.
>>
>> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>> ---
>>  include/block/nvme.h | 27 +++++++++++++++++++++++++++
>>  hw/nvme/ctrl.c       | 44 ++++++++++++++++++++++----------------------
>>  2 files changed, 49 insertions(+), 22 deletions(-)
>>
>> diff --git a/include/block/nvme.h b/include/block/nvme.h
>> index 84053b68b987..082d4bddbf9f 100644
>> --- a/include/block/nvme.h
>> +++ b/include/block/nvme.h
>> @@ -31,6 +31,33 @@ typedef struct QEMU_PACKED NvmeBar {
>>      uint8_t     css[484];
>>  } NvmeBar;
>>  
>> +enum NvmeBarRegs {
>> +    NVME_REG_CAP     = 0x0,
>> +    NVME_REG_VS      = 0x8,
>> +    NVME_REG_INTMS   = 0xc,
>> +    NVME_REG_INTMC   = 0x10,
>> +    NVME_REG_CC      = 0x14,
>> +    NVME_REG_CSTS    = 0x1c,
>> +    NVME_REG_NSSR    = 0x20,
>> +    NVME_REG_AQA     = 0x24,
>> +    NVME_REG_ASQ     = 0x28,
>> +    NVME_REG_ACQ     = 0x30,
>> +    NVME_REG_CMBLOC  = 0x38,
>> +    NVME_REG_CMBSZ   = 0x3c,
>> +    NVME_REG_BPINFO  = 0x40,
>> +    NVME_REG_BPRSEL  = 0x44,
>> +    NVME_REG_BPMBL   = 0x48,
>> +    NVME_REG_CMBMSC  = 0x50,
>> +    NVME_REG_CMBSTS  = 0x58,
>> +    NVME_REG_PMRCAP  = 0xe00,
>> +    NVME_REG_PMRCTL  = 0xe04,
>> +    NVME_REG_PMRSTS  = 0xe08,
>> +    NVME_REG_PMREBS  = 0xe0c,
>> +    NVME_REG_PMRSWTP = 0xe10,
>> +    NVME_REG_PMRMSCL = 0xe14,
>> +    NVME_REG_PMRMSCU = 0xe18,
>> +};
>> +
>>  enum NvmeCapShift {
>>      CAP_MQES_SHIFT     = 0,
>>      CAP_CQR_SHIFT      = 16,
>> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>> index 28299c6f3764..8c305315f41c 100644
>> --- a/hw/nvme/ctrl.c
>> +++ b/hw/nvme/ctrl.c
>> @@ -5740,7 +5740,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>>      }
>>  
>>      switch (offset) {
>> -    case 0xc:   /* INTMS */
>> +    case NVME_REG_INTMS:
> 
> What about using offsetof(NvmeBar, intms) instead?

BTW I'm not suggesting this is better, I just wonder how we can avoid
to duplicate the definitions. Alternative is declaring:

enum NvmeBarRegs {
    NVME_REG_CAP     = offsetof(NvmeBar, cap),
    NVME_REG_VS      = offsetof(NvmeBar, vs),
    ...

Or keeping your patch.


