Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0328D36D66B
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 13:27:00 +0200 (CEST)
Received: from localhost ([::1]:40644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbiLL-0000Vr-3h
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 07:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbiJl-0008Lb-Tn
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 07:25:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbiJi-0001X7-Bx
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 07:25:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619609117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SyHgPNquuAlJXovQtiGb+w+zJRfnIwoNP9RvVozbDwo=;
 b=KNMF1PS17gaMs2JUCfSrV/k+a3Hp4We+FFVsQSDohx3lS7qsCsfskXNLOD1zWzDVP4AT2W
 E90ZvhZCv1tXZTPBLB893vMefzjfSQhjhQ8FPcYfGw4w0EKfq7N2YHhqEbZzzXSrCGvYNG
 UgG4OBBUTGjKIsQLAR1bSq/yZGzFS1E=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-TPZXbqz0NrOuc-IB99oktw-1; Wed, 28 Apr 2021 07:25:15 -0400
X-MC-Unique: TPZXbqz0NrOuc-IB99oktw-1
Received: by mail-wr1-f70.google.com with SMTP id
 88-20020adf95610000b029010758d8d7e2so10540448wrs.19
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 04:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SyHgPNquuAlJXovQtiGb+w+zJRfnIwoNP9RvVozbDwo=;
 b=Mqy0+YF5ggd/KVZRbGF2S8PQFCPLiUtFRyiM2LPMH7qKuyUEyfk7GFE+N/0B7WqWFu
 /PTgi7NWzL9r/qPLBmZzQnYiufw+U+oMF8KXBLIGh7KG7VLShfMHn7NOZ3HTZCws5rzi
 yXhPxJ6GmUrTmcKXpSNEoGGXRVWqvjuI50G8XfE5ut5UDrkhqR1Bt0uxahJMBq+hNiVE
 IPLhEs6MbZUur6vU5IcPfRFsZ83d8NI02wCwq2JqKlAwroXVY0x+cAMlvzIJp1cc6oF8
 haBUfm5HlQyzEczgaF3VY/VDt9cfK1OJ52GfwCT3mZER+ByeWLhfWv/KL/tmDNFTTaLB
 fCCQ==
X-Gm-Message-State: AOAM532sUCqQnQGuEMQ8THrnNiWYdBhg1FyIwUrQRnVsP/kr5hpcZ/VW
 e1whzzzf5ggwAwhe4/81czrMIFi5kEWEg2TAsGBb0zT5AmS0ScVzH3IWtgziPvQ15sMjubAnPiW
 yIblaWvCmj5N2SKw=
X-Received: by 2002:a05:600c:210f:: with SMTP id
 u15mr4011101wml.115.1619609114557; 
 Wed, 28 Apr 2021 04:25:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbnAVVH1AqvqM9MgVLZ5C+ihrSc7igl+FM5Lsd66LV6fN9zTOHo3Zg0kPFkexN288FVmm3Sg==
X-Received: by 2002:a05:600c:210f:: with SMTP id
 u15mr4011062wml.115.1619609114220; 
 Wed, 28 Apr 2021 04:25:14 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id c2sm3417109wmr.22.2021.04.28.04.25.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 04:25:13 -0700 (PDT)
Subject: Re: [PATCH 0/4] hw/block/fdc: Allow Kconfig-selecting ISA bus/SysBus
 floppy controllers
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210415102321.3987935-1-philmd@redhat.com>
 <edae6f90-6658-0ad0-7516-74073d9be0c2@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0a713d9b-9ce2-0e9b-b515-f26ce09c0443@redhat.com>
Date: Wed, 28 Apr 2021 13:25:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <edae6f90-6658-0ad0-7516-74073d9be0c2@ilande.co.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/21 9:57 AM, Mark Cave-Ayland wrote:
> On 15/04/2021 11:23, Philippe Mathieu-Daudé wrote:
> 
>> Hi,
>>
>> The floppy disc controllers pulls in irrelevant devices (sysbus in
>> an ISA-only machine, ISA bus + isa devices on a sysbus-only machine).
>>
>> This series clean that by extracting each device in its own file,
>> adding the corresponding Kconfig symbols: FDC_ISA and FDC_SYSBUS.
>>
>> Regards,
>>
>> Phil.
>>
>> Philippe Mathieu-Daudé (4):
>>    hw/block/fdc: Replace disabled fprintf() by trace event
>>    hw/block/fdc: Declare shared prototypes in fdc-internal.h
>>    hw/block/fdc: Extract ISA floppy controllers to fdc-isa.c
>>    hw/block/fdc: Extract SysBus floppy controllers to fdc-sysbus.c
>>
>>   hw/block/fdc-internal.h | 155 ++++++++++
>>   hw/block/fdc-isa.c      | 313 +++++++++++++++++++++
>>   hw/block/fdc-sysbus.c   | 252 +++++++++++++++++
>>   hw/block/fdc.c          | 608 +---------------------------------------
>>   MAINTAINERS             |   3 +
>>   hw/block/Kconfig        |   8 +
>>   hw/block/meson.build    |   2 +
>>   hw/block/trace-events   |   3 +
>>   hw/i386/Kconfig         |   2 +-
>>   hw/isa/Kconfig          |   6 +-
>>   hw/mips/Kconfig         |   2 +-
>>   hw/sparc/Kconfig        |   2 +-
>>   hw/sparc64/Kconfig      |   2 +-
>>   13 files changed, 751 insertions(+), 607 deletions(-)
>>   create mode 100644 hw/block/fdc-internal.h
>>   create mode 100644 hw/block/fdc-isa.c
>>   create mode 100644 hw/block/fdc-sysbus.c
> 
> This basically looks good to me. You may be able to simplify this
> further by removing the global legacy init functions
> fdctrl_init_sysbus() and sun4m_fdctrl_init(): from what I can see
> fdctrl_init_sysbus() is only used in hw/mips/jazz.c and
> sun4m_fdctrl_init() is only used in hw/sparc/sun4m.c so you might as
> well inline them or move the functions to the relevant files.

But both use FDCtrlSysBus which this series makes local to
hw/block/fdc-sysbus.c, and use fdctrl_init_drives() which is declared in
hw/block/fdc-internal.h, and use FloppyBus (also declared there).

Apparently they do that to initialize the fdctrl->dma_chann field...
Which should be a property, but FDCtrl isn't QOM... So not that
easy, it requires more work.

> Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Thanks!

Phil.


