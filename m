Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA9C65E2ED
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 03:27:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDFwg-0004eN-S5; Wed, 04 Jan 2023 21:25:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pDFwf-0004e9-6d
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 21:25:29 -0500
Received: from sonic315-55.consmr.mail.gq1.yahoo.com ([98.137.65.31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pDFwc-00029T-Cg
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 21:25:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1672885523; bh=9/D7me0E4of8lPWTP1WaFa8eMBIgzfn0nOyeytivp40=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To;
 b=RTy8KAQq4Zw4/69W08n3xkrG3E08Z+y1eboEZBZRR9yKIz1FTqCFNyXWHafN9KSYzRofahHXPiBLQWYDhYo3EAO79pKAc+giesAILPO/E5eH0aVTOQJqNleOJADkxJUID5vwporLLHurAopOn9Y3PTjMo2Iq3iNoI5uAnD4OCdNcp5aQ0NSpDdjMeOQH6JcXPJzKVor9I2bhS5t1dydDhSVt4d9UImxyaEjyxcP57sgvgwrqicVHVl8L5qP8QzK7MnnqPLJVxTWey5k5ro6Rlncdhbe2EFzBRjAjKStyHH7ZB5Af9iQJ+NgD5zUiztVKdO2HjTRDq8eirqLSgeIYLA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1672885523; bh=bN+9ECMIMdaEvR4AWB7Sp8ghwy8CXF4zhl6GI6si8jq=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=PTm4dMsLtVuKTYjVRDQ8L8PZIRqFpGGYrPtfMgY85YL4VLzAjnsDyEdehEjJqs6JLlQEKfqNf8fmpF+NJ3Y4ooLGjTgL5XfeN9QjyEa/AaF8fW1dLJuBT3IJwgF/cfzTMOlb4CcJI+ym/vppY6nAYZTZZMmhY7LmQm/9nqwyb+ruKcv9FGcVXHWDsoDdHL6+oCtalYYRUIF0RlMiLqi2rJUXOzC8hWfcatsB7tlt3npiVeytAyTRWfdg9/f4k1dNpWaCGRkToOXTpAOcsyrqND/KrTLu4JTboEqN0RO5vvU/6MZslVZB9vcfsPN8QhbwucEt351+TmBLbXeTQHD0Ig==
X-YMail-OSG: IIJ1B6MVM1mlYeRXcKKGEFPddTrnCAMqj5pADwY0bEqgUR70H56Pm5q6EpfPkfH
 7ZW4sL0HJRgcACVZXjC9.I6MjX_EP7jgxST4q89YqdETjq8hI6bmpJ.s6slAky6dnPTYsnAX9_E7
 okPq1ECgp9pWWEHqqlzLwuCiUXhGA78tK6AgMTyb2Od5j4z.0tp6pT.feezrHyc6b.Rv.5uL.NP_
 oS2GDCpbkowUsd4d7dsKXoYMwlkuD2oCueY82Q9gk0keevyMNoBYmK9O3jlIzD5aakmSuBifNtfl
 5t.2.2U1SPJZSeAERLb2KbpAydRSSXwtHXN3dHmlBjyueknJgChTxp_CKu7Ya4HHEl0QErCjBHEs
 VI1SPSAg82vQJZlcm86KNpjgWkKNJlTAVDOhlc3cD_Wq2pRqMUb.oTbEJPZtDjJb5yv5_hmmLai5
 zHHDNHNXf7YtVgRUpTEw15MFWwsJUwDPbj3wKfN3IcWDmJVrpDYf8jslM.cNCDBmIxYEnnf1TXr.
 XoSPfajAdTiBJn67aEInJjlJP7L.XkPoc62yFvgPsajDzILnNdNLtOAnKzV63nHTszW.0WQJ9Dhk
 f._26dFXuuOnBV48QQwVyuXCfrgRrvBBkk.ynAdkoUIygD21uoBsc9DxmHqbE9ktVrwqHWJeKxjB
 Jp7ywLJTt80RRz8Yag6a5hFf185oNGRYipehfFCjnaOli8YSwD7kC85c73tjvxwnpKr34HoUoR9E
 VuuQsfcI8LsdsYTPe5NILLGgPBKzWa_V.qm2TWenR1hhyAdVJeOot_4ozu_n3uO1l.UUzgPvYKah
 Wj49y7tQYSglT5XrX.rxbPVZuSD9p8DyzoRvj9FCwDzSyNDfsgo22XTaTA98nEsxHB2rO16L.m3G
 vbw6Vd7D29ZxcHEEnRe8aON7Ir0a6wdn5tSk8khgvvCmemPcqNkpez_2Jltmcqabiagw3rBHv7u5
 CnZUit6edZJ6ZkLRr9RMVgfNgkETaG1PyppTFBjK4JiOGbCNV9dxDM4_P1WftBVqVukOecErZXrR
 PUFj4m800SBR0zuqLM02ZpQUrRxzTVCq1y8TyiriYJKfnxr78_zLjuy4_B506eM3wDipxz_Qweiq
 toZpS5H3g2w34b3iegJ8L52zBL9M2SOMBJqT0YGOIUaSlF3RNa76T.7k7IWieXHIxyF.B1kmW4t9
 3tfujjuVi0mbx8FEZRJK8mmOAROl826X6n9MmM4.bAsxUEw.qWtcEdtqhq4VZvjZIzatRkMn1TL8
 Xl88RAHz0_SCK83Pl9NqYT6VwAJthLtbxmlXw4YI1rt6qPTHPoPVxb_e9_Pn_Tp2KSdUAmkkXAA.
 .5so.hW0SbqBKeUm2zKzYdZNnnnfIaLEbUFfvE.1DtvkeqD7_ecnpSaC7r_PfacyCdamgkeyV6_c
 2mE_OcgOmJvEx_wePCe3ooN1JtaUeqMgFExYEmJVa5C7MQPFmp9OkR8_UepneNHOWV7wF8XQqvq_
 QqRdPwncq3sLDFuT5TiNGmybWmKAfJW5rVncS4fv4a9Gip0bOOybGFZhixxFPeGQlmnyLW2c_Fiq
 N5HPACbickUmImnquX7XUAE77CewA77qZfb5mqaNDlj_K3M7KQpmgyBHSF1uTFwRtHekC_o_77k1
 CXV3C.wDbVO7UG4iv8k.6ndC6nqf1hUZfXkvAnemdt0woSHGOptarg0p_X3ZVyE_Vb2nKDyZiQxK
 4Q8yUo2LHQEKa5J1hBxzWRSn.mCUG7Atkb5KU9uKXhgB10bf3eG52qYHbr0zqIf0JXN3cpQbCg.E
 h0LN_3pru0oIG_5Zk_y7PQJaRaheUBahOnk6FG4fuQR2hZR58FZN_u_7EHGsMMQ.eaCVsr4Y_1d_
 iXsCsC_kmEG_ocOSe1H9Xu0QgzEloiRSHVH5EaL9_PYSQlnlmIsvJq2fh9lIKy89XOp8641KA6tA
 ZqxUNpq8yKGQk6wgBnIzdG4S5oCO893TBr_uyaMdzzMdNSBTFp_0DszYm4BFTBxyjJWNNHmVoO9J
 vyduPpZ1lbNyECQpdmKZ2LlKOhDiLbHaajeLAXaIylLZe.RZhlpHRevP6v0Bb3N4rVdG5MGLw5FD
 jf6KVlcdt4tzGNbkykOVqYEIjN9GFLww5OdEvmkMOIwsrX8fPxXxJYYEPgQFVniHQIX44CwSAqUU
 J4ewkRh8aaVuAIF.9VcZTtnQ7vQyphqe.pSTJ1ZZwhaC3N58JCP_y9eezDAuk8XDjTLdFLuCoDn8
 xNjDx6c1Z1lHki6mCVjvKNqnXAw--
X-Sonic-MF: <brchuckz@aim.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic315.consmr.mail.gq1.yahoo.com with HTTP; Thu, 5 Jan 2023 02:25:23 +0000
Received: by hermes--production-ne1-7b69748c4d-bmdl9 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID b445f58ecae7df5da904de2ba90d4713; 
 Thu, 05 Jan 2023 02:25:20 +0000 (UTC)
Message-ID: <91a05e98-1b1b-94a2-248c-8fe7ff0b5f4e@aol.com>
Date: Wed, 4 Jan 2023 21:25:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 6/6] hw/isa/piix: Resolve redundant
 TYPE_PIIX3_XEN_DEVICE
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20230104144437.27479-1-shentey@gmail.com>
 <20230104144437.27479-7-shentey@gmail.com>
 <30ed41ab-f7c9-15fb-8f4b-b2742b1d4188@aol.com>
 <405dc396-7b7e-842a-2b94-6b26df1aa564@linaro.org>
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <405dc396-7b7e-842a-2b94-6b26df1aa564@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20982
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
Received-SPF: pass client-ip=98.137.65.31; envelope-from=brchuckz@aim.com;
 helo=sonic315-55.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.708,
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

On 1/4/2023 5:35 PM, Philippe Mathieu-Daudé wrote:
> On 4/1/23 17:42, Chuck Zmudzinski wrote:
> > On 1/4/23 9:44 AM, Bernhard Beschow wrote:
> >> During the last patches, TYPE_PIIX3_XEN_DEVICE turned into a clone of
> >> TYPE_PIIX3_DEVICE. Remove this redundancy.
> >>
> >> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> >> ---
> >>   hw/i386/pc_piix.c             |  4 +---
> >>   hw/isa/piix.c                 | 20 --------------------
> >>   include/hw/southbridge/piix.h |  1 -
> >>   3 files changed, 1 insertion(+), 24 deletions(-)
> >>
> >> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> >> index 5738d9cdca..6b8de3d59d 100644
> >> --- a/hw/i386/pc_piix.c
> >> +++ b/hw/i386/pc_piix.c
> >> @@ -235,8 +235,6 @@ static void pc_init1(MachineState *machine,
> >>       if (pcmc->pci_enabled) {
> >>           DeviceState *dev;
> >>           PCIDevice *pci_dev;
> >> -        const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
> >> -                                         : TYPE_PIIX3_DEVICE;
> >>           int i;
> >>   
> >>           pci_bus = i440fx_init(pci_type,
> >> @@ -250,7 +248,7 @@ static void pc_init1(MachineState *machine,
> >>                                          : pci_slot_get_pirq);
> >>           pcms->bus = pci_bus;
> >>   
> >> -        pci_dev = pci_new_multifunction(-1, true, type);
> >> +        pci_dev = pci_new_multifunction(-1, true, TYPE_PIIX3_DEVICE);
> >>           object_property_set_bool(OBJECT(pci_dev), "has-usb",
> >>                                    machine_usb(machine), &error_abort);
> >>           object_property_set_bool(OBJECT(pci_dev), "has-acpi",
> >> diff --git a/hw/isa/piix.c b/hw/isa/piix.c
> >> index 98e9b12661..e4587352c9 100644
> >> --- a/hw/isa/piix.c
> >> +++ b/hw/isa/piix.c
> >> @@ -33,7 +33,6 @@
> >>   #include "hw/qdev-properties.h"
> >>   #include "hw/ide/piix.h"
> >>   #include "hw/isa/isa.h"
> >> -#include "hw/xen/xen.h"
> >>   #include "sysemu/runstate.h"
> >>   #include "migration/vmstate.h"
> >>   #include "hw/acpi/acpi_aml_interface.h"
> >> @@ -465,24 +464,6 @@ static const TypeInfo piix3_info = {
> >>       .class_init    = piix3_class_init,
> >>   };
> >>   
> >> -static void piix3_xen_class_init(ObjectClass *klass, void *data)
> >> -{
> >> -    DeviceClass *dc = DEVICE_CLASS(klass);
> >> -    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> >> -
> >> -    k->realize = piix3_realize;
> >> -    /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
> >> -    k->device_id = PCI_DEVICE_ID_INTEL_82371SB_0;
> >> -    dc->vmsd = &vmstate_piix3;
> >> -}
> >> -
> >> -static const TypeInfo piix3_xen_info = {
> >> -    .name          = TYPE_PIIX3_XEN_DEVICE,
> >> -    .parent        = TYPE_PIIX_PCI_DEVICE,
> >> -    .instance_init = piix3_init,
> >> -    .class_init    = piix3_xen_class_init,
> >> -};
> >> -
> >>   static void piix4_realize(PCIDevice *dev, Error **errp)
> >>   {
> >>       ERRP_GUARD();
> >> @@ -534,7 +515,6 @@ static void piix3_register_types(void)
> >>   {
> >>       type_register_static(&piix_pci_type_info);
> >>       type_register_static(&piix3_info);
> >> -    type_register_static(&piix3_xen_info);
> >>       type_register_static(&piix4_info);
> >>   }
> >>   
> >> diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
> >> index 65ad8569da..b1fc94a742 100644
> >> --- a/include/hw/southbridge/piix.h
> >> +++ b/include/hw/southbridge/piix.h
> >> @@ -77,7 +77,6 @@ struct PIIXState {
> >>   OBJECT_DECLARE_SIMPLE_TYPE(PIIXState, PIIX_PCI_DEVICE)
> >>   
> >>   #define TYPE_PIIX3_DEVICE "PIIX3"
> >> -#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
> >>   #define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
> >>   
> >>   #endif
> > 
> > 
> > This fixes the regression with the emulated usb tablet device that I reported in v1 here:
> > 
> > https://lore.kernel.org/qemu-devel/aed4f2c1-83f7-163a-fb44-f284376668dc@aol.com/
> > 
> > I tested this patch again with all the prerequisites and now with v2 there are no regressions.
> > 
> > Tested-by: Chuck Zmudzinski <brchuckz@aol.com>
>
> (IIUC Chuck meant to send this tag to the cover letter)
>

Is it customary to tag the cover letter instead? I thought it appropriate
to tag the last commit in the series because it best represents the actual
commit on which tests were carried out. Also, the cover letter does not
actually represent a real commit that can be tested, except maybe the
last commit in the series. I did read the document on submitting patches,
but I don't remember if it specifies how to tag a series of patches with
the Tested-by tag.

Kind regards,

Chuck

