Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 741044ADF0A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 18:13:14 +0100 (CET)
Received: from localhost ([::1]:58198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHU3F-0005Vs-Ia
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 12:13:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nHSrX-0004uo-Uu
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:57:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nHSrR-0005lC-RF
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:57:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644335806;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MPPZWYDbDi8kKzohaqBl19kqo/DN/faPFX/S6tKn+DY=;
 b=Cjt1+Esvd2j2ExrhrKhSwh6J4Nu2B64nJVK1zkj3lcue+jhFfzocmlIm/YkU+zpfZ1vhuy
 9MCHdEv/xwXNzilrI+Bk7rodPE2Fe2jOwPTuAsnxwqY/7Z44nyYBZEOEG23deUFOr+mY2Z
 xQq7yvzeCWMoX+WesQqniUbEKST2OWw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-170-8vIkU0STP26HqKTUm3smTA-1; Tue, 08 Feb 2022 10:56:40 -0500
X-MC-Unique: 8vIkU0STP26HqKTUm3smTA-1
Received: by mail-wr1-f70.google.com with SMTP id
 t14-20020adfa2ce000000b001e1ad2deb3dso6242747wra.0
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 07:56:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=MPPZWYDbDi8kKzohaqBl19kqo/DN/faPFX/S6tKn+DY=;
 b=fU8wPl4/vHlP2EkcjapLtuOzBaHV2hdUJTeJkoomefFwiyxzYYYpFYMYg3gVJVmz/7
 qAoeBrnB+oV+KUxMJiiKdeDzJOo+lAG9ynyarYw1Du7MphrMQotnXtVOW32UqhYIMbLM
 8oQI9C6ZstwP76ejBivfK0Kw+O3R5GZNSSMALVIbq4b9iqm5qn5EyuOu+AsMVpUMP8or
 ifDGc4U3Gka60Pn5XhF80dGUbT874j+dKR1goHEflhHBhys1iE0jt74u3MRihyoCocAK
 PfN2U0uHWdlgm0F6ovUY8q3u1I8/K45i+jH6yVzTF1MyIXbsHBZUMu6tKx4a/g7PLMtm
 yLvQ==
X-Gm-Message-State: AOAM533XtkOgv+1RJHkJxlo0utIsc4EGJrHCPLqVlGDnCcIo4bfyGeCY
 qJFVFmg6qlMZkK6kUH4aHbYzmyqvNDELnsYAmkrTUony3IYFMVvDUtLDQt5/aBJ816KrS8TDWr/
 govL9/NrTQlBRTog=
X-Received: by 2002:a5d:610f:: with SMTP id v15mr3927726wrt.602.1644335799683; 
 Tue, 08 Feb 2022 07:56:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZBhdZaxrhsFWkjZQNGnwCFwT4iG4tlv9igUMF/whTXOQYK2YNAiwp2nnCFgETpJAWtulHvQ==
X-Received: by 2002:a5d:610f:: with SMTP id v15mr3927709wrt.602.1644335799489; 
 Tue, 08 Feb 2022 07:56:39 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id d7sm2592449wmb.18.2022.02.08.07.56.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 07:56:39 -0800 (PST)
Subject: Re: [PATCH v4 1/2] tpm: CRB: Use ram_device for "tpm-crb-cmd" region
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220208133842.112017-1-eric.auger@redhat.com>
 <20220208133842.112017-2-eric.auger@redhat.com>
 <CAFEAcA9teH-ejt3NKh1rqQPToM_S-DC2JdHUkMof4YwHXoaXtA@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <3b1f9d56-81e7-d59e-0a02-9416eae6b914@redhat.com>
Date: Tue, 8 Feb 2022 16:56:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9teH-ejt3NKh1rqQPToM_S-DC2JdHUkMof4YwHXoaXtA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: quintela@redhat.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 f4bug@amsat.org, alex.williamson@redhat.com, imammedo@redhat.com,
 stefanb@linux.vnet.ibm.com, david@gibson.dropbear.id.au, dgilbert@redhat.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 2/8/22 4:17 PM, Peter Maydell wrote:
> On Tue, 8 Feb 2022 at 15:08, Eric Auger <eric.auger@redhat.com> wrote:
>> Representing the CRB cmd/response buffer as a standard
>> RAM region causes some trouble when the device is used
>> with VFIO. Indeed VFIO attempts to DMA_MAP this region
>> as usual RAM but this latter does not have a valid page
>> size alignment causing such an error report:
>> "vfio_listener_region_add received unaligned region".
>> To allow VFIO to detect that failing dma mapping
>> this region is not an issue, let's use a ram_device
>> memory region type instead.
> This seems like VFIO's problem to me. There's nothing
> that guarantees alignment for memory regions at all,
> whether they're RAM, IO or anything else.

VFIO dma maps all the guest RAM. I understand the cmd/response buffer is
RAM but does not need to be dma mapped, all the more so it has a bad
alignment. By the way the PPI region also has the ram_device type
(tpm_ppi.c tpm_ppi_init). In that case, using the ram_device type allows
VFIO to discriminate between critical mapping errors and non critical
ones. We have no other mean atm.

Thanks

Eric
>
>> +    s->crb_cmd_buf = qemu_memalign(qemu_real_host_page_size,
>> +                                HOST_PAGE_ALIGN(CRB_CTRL_CMD_SIZE));
>> +
>>      memory_region_init_io(&s->mmio, OBJECT(s), &tpm_crb_memory_ops, s,
>>          "tpm-crb-mmio", sizeof(s->regs));
>> -    memory_region_init_ram(&s->cmdmem, OBJECT(s),
>> -        "tpm-crb-cmd", CRB_CTRL_CMD_SIZE, errp);
>> +    memory_region_init_ram_device_ptr(&s->cmdmem, OBJECT(s), "tpm-crb-cmd",
>> +                                      CRB_CTRL_CMD_SIZE, s->crb_cmd_buf);
>> +    vmstate_register_ram(&s->cmdmem, dev);
>>
>>      memory_region_add_subregion(get_system_memory(),
>>          TPM_CRB_ADDR_BASE, &s->mmio);
>> @@ -309,12 +315,25 @@ static void tpm_crb_realize(DeviceState *dev, Error **errp)
>>      qemu_register_reset(tpm_crb_reset, dev);
>>  }
> As QEMU code goes, this seems much worse than what it replaces.
> To have a memory region backed by RAM and migrated in the
> usual way, memory_region_init_ram() is the right thing.
>
> thanks
> -- PMM
>


