Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9742769FA82
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 18:53:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUtHz-0007NG-9y; Wed, 22 Feb 2023 12:52:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pUtHw-0006wk-5A; Wed, 22 Feb 2023 12:52:20 -0500
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pUtHu-0004uA-4M; Wed, 22 Feb 2023 12:52:19 -0500
Received: by mail-vs1-xe2f.google.com with SMTP id f13so6341909vsg.6;
 Wed, 22 Feb 2023 09:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677088336;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=me3UIR0sK1moLH1sZyokjw0GBI9l2ymza/VsH1oTDyw=;
 b=pdd1Ns2Jzy/Ttmqf6G6KBlt94R+sxOO06GDL+k6ZmSWThQ1GCco+Q3heoWzmvNFqxs
 BRc7DDIHqxi2IVo9tWvBCQfGsAFY8Guq3YoRTS64E7Cmf7AjcEBMlUhAlsJ2HQFcyEHU
 gvTeAa68TnkvqRYotHqaApUbDq72joKLzOdtJUQjJOoDaEezt2whQ5k5J0eJ+N4ohnDa
 kTcs5rkLeXAA68sGStlyaskHtgGn2s+2+76mJluZunzky9GfCdv7tu2BUyA2ZD/1Jc5d
 nUwvEecXKe2RcKB42IavgcOqAoH2/n8tkD6/pNrsJGfjqruDMtUjEqnvWmpVT1QkA7jY
 JHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677088336;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=me3UIR0sK1moLH1sZyokjw0GBI9l2ymza/VsH1oTDyw=;
 b=JFsgmEOvwgzcDxEvUSRV7xZjlwFKEnNTdpB5vh8sJY51nZC2jML7aj5SCT620qwJ8E
 w36sp6c/fLY43GkWZXxMKH0irzZggRu/wMqrlvFy9AlGoyB2U3Pv5jW2qnf7lYq2A3By
 jyGy9pGKQ1UIgBmf4bpt09CKGcnmakFoy52CsxKs9duKUInwIt6s9tos+x3N4ftzdlFd
 Vd1dphK5TDCj10BEn0MlO2qoDNglJQ9Cqe+NBke/P4p2UJs0EezlMl1hfaoJf5cb8gnT
 7NXKKk2HGRO0MNh+R/2dmyJvZSIVd1oltLzW7jp6gxHjx2QY4hRaGJkyfeyx5zswWZ4u
 zOiQ==
X-Gm-Message-State: AO0yUKUQCCmeB7A3oErv3ddlfKUVhCUs3iH2cgdX+kCk1Gn8if1aq8Pk
 QwYglZaCoOr9x0YvvGDIL52OWEUBw7m7xDulCn8=
X-Google-Smtp-Source: AK7set+bBWLhK9kLsR2WoDVYdtT2RFNyx/tBv+WMJXgrq9+c719TyNfQ05CfcLITizSqnKdBqaoSDRelsUAHhY8siz4=
X-Received: by 2002:a05:6122:84a:b0:411:b190:fe5b with SMTP id
 10-20020a056122084a00b00411b190fe5bmr72010vkk.39.1677088336597; Wed, 22 Feb
 2023 09:52:16 -0800 (PST)
MIME-Version: 1.0
References: <20230213162004.2797-1-shentey@gmail.com>
 <20230213162004.2797-4-shentey@gmail.com>
 <9f80bb33-40e7-fc57-1515-c3764f57da46@linaro.org>
In-Reply-To: <9f80bb33-40e7-fc57-1515-c3764f57da46@linaro.org>
From: Bernhard Beschow <shentey@gmail.com>
Date: Wed, 22 Feb 2023 18:52:02 +0100
Message-ID: <CAG4p6K6JSkv3VqwUc3CYhfq0EbR7feKLBquduP_p4143DnaGig@mail.gmail.com>
Subject: Re: [PATCH v4 3/9] hw/i386/pc_q35: Reuse machine parameter
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Ani Sinha <ani@anisinha.ca>, Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=shentey@gmail.com; helo=mail-vs1-xe2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Am 22. Februar 2023 11:03:38 UTC schrieb "Philippe Mathieu-Daud=C3=A9"
<philmd@linaro.org>:
>On 13/2/23 17:19, Bernhard Beschow wrote:
>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   hw/i386/pc_q35.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
>> index 66cd718b70..dee2b38474 100644
>> --- a/hw/i386/pc_q35.c
>> +++ b/hw/i386/pc_q35.c
>> @@ -218,7 +218,7 @@ static void pc_q35_init(MachineState *machine)
>>       pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory,
>>                      pci_hole64_size);
>>   -    object_property_add_child(qdev_get_machine(), "q35", OBJECT(q35_h=
ost));
>> +    object_property_add_child(OBJECT(machine), "q35", OBJECT(q35_host))=
;
>>       object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
>>                                OBJECT(ram_memory), NULL);
>>       object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_PCI_MEM,
>
>Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
>Long term we should duplicate/extract Q35MachineState from
>PCMachineState and add a Q35PCIHost field, then use object_initialize_chil=
d; removing this object_property_add_child()
>call.

The Q35 and PC machines duplicate a lot of code indeed. So I was
thinking more along the lines of consolidating with pc_piix ;) The
idea would be to get a peek preview into a configuration-driven future
where the PCI host bridges (Q35 or I440FX) are dynamically
instantiated based on configuration data. They would also be
configured through their QOM interfaces only.

I've submitted a series where the Q35 host bridge gets a QOM cleanup
[1] and I've got a series locally resolving i440fx_init(). Both series
combined bring these two device models close together regarding their
QOM interface. I've not submitted the i440fx series yet since it is
blocked by this series.

One further step for pc_q35 and pc_piix consolidation would be to
factor ICH9 PCI devices (not functions!) into self-contained models,
like is underway with PIIX(3). I've started with ICH9 cleanup already
[2] and I'm waiting for the PIIX consolidation to land in order to be
able to make more progress here.

Note that pc_q35 and pc_piix consolidation is just an idea for now
which could also turn out to be a bad one. If the two machines just
ended up sharing more code that could IMO be considered a success as
well.

Best regards,
Bernhard

[1] https://patchew.org/QEMU/20230214131441.101760-1-shentey@gmail.com/
[2] https://patchew.org/QEMU/20230213173033.98762-1-shentey@gmail.com/

