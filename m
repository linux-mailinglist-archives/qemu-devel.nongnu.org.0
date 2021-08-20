Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E10883F2F86
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 17:34:00 +0200 (CEST)
Received: from localhost ([::1]:49742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH6Wt-0006xY-8O
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 11:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mH6UP-0005WY-Gg
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 11:31:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mH6UN-0005uL-4i
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 11:31:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629473481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FILXXiWO5cOUkVJ9TND798eiI9oYRMJLevesj8EVdyk=;
 b=Zx+/koFwhszWGhedRaCp/vx06rR8vVfzTEAnHC6+vrJIi+VYpNsQrmgghui6P/7LxWSsQD
 5bORYlF6k03vo7ojOktnJSDlrvi6W9He2L+JmtaB1VXhdSylhsxkx6EF10AMnUcJKI/SxS
 son93JbtpxJbk+CTaKXPVPN3f8ObSvU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-1keBa4A1OReHuJqOmJ8xJA-1; Fri, 20 Aug 2021 11:31:20 -0400
X-MC-Unique: 1keBa4A1OReHuJqOmJ8xJA-1
Received: by mail-wm1-f69.google.com with SMTP id
 u14-20020a7bcb0e0000b0290248831d46e4so2512142wmj.6
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 08:31:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FILXXiWO5cOUkVJ9TND798eiI9oYRMJLevesj8EVdyk=;
 b=QQoRbZZLjYsGc0UYM/1rnfiHNzeyKoA5TX8jS13CLrPwkeU0KRHagUBzY+JSxh3gwj
 jWBGbrLt81Kkt/8RvJf8DTR49gWYRZ5ELWw0YC9RtHceaELC3FOCEjzjRovmhRrN9u/P
 +mfkct6CK0BJj1+O16/LFMtzGKSgB8ZiZ4PcY9MIVoTSp2pbV2/GeYj+3UiXARuSxM/r
 ByCd6FFVQ/LjcELqZCMTv/HmzfWUloJEATUsfF3cmKHYEKeZ8SADmZw178S7EfuaKnlb
 bsO3yUfUaKAVmPDHj0aQbiVnLiJgNcf9NKQPtYxRjD35rKeOjw030wwT2lBjRIDZumS9
 Fhyg==
X-Gm-Message-State: AOAM531heGLzFy/jX9EwqdMpvwjlVnWvt2NX8OM9Mpoh3HZBCucXvVvU
 ed2oYoXKnNo9RkTPq8UNFVfsxgqqhcMB3HmaDJ1PZ26sLFSwOSq7+iXcIntBRTSBlq+hXY3z/gO
 PL0L8Hojgrn9aXWo=
X-Received: by 2002:a05:6000:18b:: with SMTP id
 p11mr10837395wrx.366.1629473479093; 
 Fri, 20 Aug 2021 08:31:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2XEOqVMY4nhaHaf5od3565dlnwzpXilDixCN4EyutJ4htxcEWLTnxg+4ZfiC1mjdrpUBKXg==
X-Received: by 2002:a05:6000:18b:: with SMTP id
 p11mr10837352wrx.366.1629473478761; 
 Fri, 20 Aug 2021 08:31:18 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id z137sm11001824wmc.14.2021.08.20.08.31.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 08:31:17 -0700 (PDT)
Subject: Re: xilinx-zynq-a9: cannot set up guest memory 'zynq.ext_ram'
To: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>
References: <CAEUhbmUhKFFxSspve+t2BeppCGPegpb_Z5g-w8M5t-JMLy3Zsg@mail.gmail.com>
 <869f8be9-b76f-e315-9591-9c452bedf922@redhat.com>
 <CAEUhbmUE4fb2NewE+Cze3Le5xOeH53NDbwdnKH==dnZeKGPQeQ@mail.gmail.com>
 <e833a774-d3bf-62d5-91d8-b24cbee0bfc4@redhat.com>
 <CAFEAcA8MqYQiTJkKyWGkcKR=J2FD9SDWvHm9vxZq3g2HJ8ch3w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d0ce3c23-d1b3-0853-ef5f-defb55b441fb@redhat.com>
Date: Fri, 20 Aug 2021 17:31:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8MqYQiTJkKyWGkcKR=J2FD9SDWvHm9vxZq3g2HJ8ch3w@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.49, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Igor Mammedov <imammedo@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/20/21 4:39 PM, Peter Maydell wrote:
> On Fri, 20 Aug 2021 at 15:34, David Hildenbrand <david@redhat.com> wrote:
>>
>> On 20.08.21 16:22, Bin Meng wrote:
>>> Hi Philippe,
>>>
>>> On Fri, Aug 20, 2021 at 10:10 PM Philippe Mathieu-Daudé
>>> <philmd@redhat.com> wrote:
>>>>
>>>> Hi Bin,
>>>>
>>>> On 8/20/21 4:04 PM, Bin Meng wrote:
>>>>> Hi,
>>>>>
>>>>> The following command used to work on QEMU 4.2.0, but is now broken
>>>>> with QEMU head.
>>>>>
>>>>> $ qemu-system-arm -M xilinx-zynq-a9 -display none -m 40000000
>>>>> -nographic -serial /dev/null -serial mon:stdio -monitor null -device
>>>>> loader,file=u-boot-dtb.bin,addr=0x4000000,cpu-num=0
>>>>> qemu-system-arm: cannot set up guest memory 'zynq.ext_ram': Cannot
>>>>> allocate memory
> 
>> -m 40000000
>>
>> corresponds to 38 TB if I am not wrong. Is that really what you want?
> 
> Probably not, because the zynq board's init function does:
> 
>     if (machine->ram_size > 2 * GiB) {
>         error_report("RAM size more than 2 GiB is not supported");
>         exit(EXIT_FAILURE);
>     }
> 
> It seems a bit daft that we allocate the memory before we do
> the size check. This didn't use to be this way around...
> 
> Anyway, I think the cause of this change is commit c9800965c1be6c39
> from Igor. We used to silently cap the RAM size to 2GB; now we
> complain. Or at least we would complain if we hadn't already
> tried to allocate the memory and fallen over...

Ouch... I remember having tested -M raspi2 -m 8G etc... to verify
the error messages, but didn't noticed the memory was allocated.

static void qemu_init_board(void)
{
    MachineClass *machine_class = MACHINE_GET_CLASS(current_machine);

    if (machine_class->default_ram_id && current_machine->ram_size &&
        numa_uses_legacy_mem() && !current_machine->ram_memdev_id) {
        create_default_memdev(current_machine, mem_path); // <- alloc
    }

    /* process plugin before CPUs are created ... */
    qemu_plugin_load_list(&plugin_list, &error_fatal);

    /* From here on we enter MACHINE_PHASE_INITIALIZED.  */
    machine_run_board_init(current_machine); // <- Machine::init()
                                             //    checks RAM size

    ...

$ qemu-system-x86_64 -m 1T
qemu-system-x86_64: cannot set up guest memory 'pc.ram': Cannot allocate
memory


