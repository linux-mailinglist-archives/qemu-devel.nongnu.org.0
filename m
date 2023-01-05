Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCF165E2C3
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 02:58:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDFVY-0007T4-0k; Wed, 04 Jan 2023 20:57:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pDFVW-0007R2-17
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 20:57:26 -0500
Received: from sonic313-21.consmr.mail.gq1.yahoo.com ([98.137.65.84])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pDFVT-0002Qh-B0
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 20:57:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1672883839; bh=r+wBx6/58Y0GMmVdloTVPnv7cslaN9V9d73StXKUUQ0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To;
 b=JmEijnJdY7xyeLtDVlvC20MAJx8IVALM9Pronf2NQS5j2l+f/wyRWYl8J7cSEL1zZ/TBkznsom4bDOkSXrw/XcvyL7owSzB6dxmFzPeJib1Zy9A0rWSoUJivzXbvtyA2RxXTPsinXKkTtu9tkl86TPOEXRc987IAoYishhEsbeiUVjoMIzHxILCKyh1w6XAlokZae5Sya9UZhJPJ3SnJmQ87DYWxjw0CWgk6dlguWRSnEGdHkZObZTA7i5SjHUhnmKH6sTzyJcGTdqV1AoWbM7W1Fmisas+fc9Qhp2pkiFaSiObE80HbloNAvyvVAS3d2dS07orDtWsHH3T/4Qn00Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1672883839; bh=qg/iaLMBO19KpWjwfX+oJMpEdkALXNVjTEsgw++ocL1=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=Jl3jLKW6kJoI4mpVi3z0GUCtoMhc80+fdQm1ekRJM9kvEsYPDFIb32xyltXBCZ9HgLYdNS/aMleLo6aqT2VpFqXLQN03CHmBs0R2x2P/NzE4eJmSs9VZeBcy6E/1dQOoJwlOE6y1TU75iAdruTlWFO8UyyMfDQeFubEC82HPzmFWhQBJFqUxRBz1Cwm8/RcA2cv9AR/C2fTgLGCS8lBbzh/XdMA5ciblp1NoXuDF7Fhq4Ow1GX+OiOvnO//g+P7+nOAErfyHDUmn+9I9zZAC4kT+U6m6utWqAe/RmcS0vXHhgg3ZoN5t2dIYjxiBE2Ei7RBd4WfigmUqYm59nI1tvw==
X-YMail-OSG: mjPnh2wVM1nYlFHG1wPD0LqgcsVvFTHn2zlCr52Dzy1RRgwnNgMIwbrqc4UBZGW
 g5ebvmD1XpHnv1qJa0ceI2rXtq7yKR4hXgB_ZH0jxMlETJLq71y3iSC0NEAPfPwwoYNlf.ldIRE_
 HLdZ7oEBSC.J1BQLzMIf9Il0dtXUjp0kZ.ASo_.KMnRvNB8L24NPVNOtcPHWcPFg_YVMx67_fmdr
 a45OA3cPlGxb86tn00WW7rkTa2Xc4FLzYpca1x.jdXUPn6NhSfTy98PGszTLbXOOSkbRTZrPf3nP
 8ovNSzyuYe_c8kPbQNx5rpSZ5Zb4Swa0.4Opn9HZyG7fP1E.kxe67v0fDYbPnlgW3u5r2XdxJoGB
 n3plPYn2GNgeI6ZaHY2yJ4v1bzYrT_cAErxOe6gRPyfJ94Yly4eODm8meQUXiAqXQo_i.oXPc5BR
 FNgZdlu10FhvSQKfUQtntd2iw7y05.CQ9BBfTrVMFmbAJES1npSRO.nD8srXa2kAKvqLtEv9Ht0e
 _8X8zCzbSUkeL7V.5cHxdaR2f_icGCM_DZmF8q.TNn3TmaMav2Yp__GgviyofishrFTMvnmIkV.F
 KKI4n6Qd9YogKRB8WsMjUAxp0FW.HWECFmPCs9ba4yn43bP_RPOCV4PH4EJWjgDhzdAB1dsVkHdb
 5kkzNdlfsbDGrLUnzXHbSfrlptw6Agzorify.3O6kAky6kVg0lY_M4Dpa.xlvp8CLZqZbKbXXOzC
 szIklmCmFFMmOZTNZ5bC0gGNOrNcMN1zK9dqkO8DkEcOuF72l.VSaM4dR1.UQBw6t_Sb_vrzkE7z
 McxI9ddM8CoqUgYru0LQMrNSqcB8TuO3kzf7SbCRd_6hfnrzEgzoqq7jVy6cA62v20HcZLAMAn9r
 euEyQSoRT6UeekL2dP.OShWP4pzepNfCAfElTVs2NpNKLtRpo1A2TUZo73dZBKjG9rjkKsbuvrI7
 ONc9_sSSQUmHcn3VSIiJXKg2OWEgre9X6WaBnG0hMShrf7lvHfW60anLl6n60e_o5OC_uMdFN2f.
 gnC2FStCvECDumMpX9KygOO5VwdjgaRd7GRiZDKsvu5.oCPikWciYNhnxlLnTkv2l4NAaUQCHyDF
 7m4otnDOios1oFtwVEWqhZnv5VYpLwTuQtZOAHb6FTNYZV1gtvX4IKac5gVNcApHRDz8srn5hqY7
 bBvYjOgJ.VMss7FmxUQjQpefvgJTREgV2wTWskEEVEbXAUu8rreb6MlmLBn5G4uE9jDTQNtXosG_
 0BJoKG3_viYet2.QkErR2MZ2fwOmAJUarluIzNzGdvdpui4Ve0eFVaHepwuNS1yu.EFkMnr5IwUY
 ooi0k4yntguWPgpANsLKjAn2_Z8SudR3lzdWgA4QDtwgJfWaRy0P4Ev0KQyGcMQLG6iNf3j1tsYR
 EgBILItCsp8mF50BaLtms10i6c0H_bwdkWUp1Qz0XzP_G1qN_FYh4SkLJ0XMxJoIldZpdZ54kp7F
 qwPoHd75eKQ4X92k_uoOpgB8bjfwmv3iiJmlSbVJp.8z87SvSUx2up9EImRQZrcSGk56_robF42B
 Cz52dSFnu7s4W3pQxdhIExa7Fpo8Byib_VsBqla9vfEqTHHXUJnbFwpa3QkjHChEYeyBz5pHrQ23
 yH7zBb8wjQ_CgT4EWXdwUEb0O8M__9OILjCX7_cU7Aphthwul1guay2suGMcY86nAeBgDon7jGjZ
 v5FP7EJvVFblYTpR_T0L.aDUmyy6ouFC8LzxjIy0h0l2jF_WoIv03g5jf8MHRfO4upQBtqIrcBic
 TWaNPYL_qdH_nofo30E1kG.7L_1x1Xx2FrBMc6Ul3bgKTefvevqpSwNr8CRiSdywV1E0j_t0LsKW
 IhXIQkosmqklw12RKKQ2SWZ2zTFOZgIQewHkekRfSrhbWfF3U4dD6Fec5s9OovQid1AUjO0IliiS
 Wk4R5y1VSX.9Q7Tv52jIk_SooNCyPt3XCFtVKm_aI7N6.jWY_y.JHDxFn4BBmD0BIhJHB8ofr6Q9
 GIAuKpRqsfMsj.KnqSXPf6cPHVR__vz7_tfhcmAycjk2HfN0KWHu_n7FV9qL.rZITE5_LPoObwZZ
 sFwKjYk_DH1k10OPdGiiNouED_leV0LDP4ZzPi6y8quR_.Cygj8nrjidYA5WfIZ3M.mflmlcn5rR
 q2wxP2G3Dc_IaYgzogP0bQZvK4vVqpZiIjRcYgLDKOo_RT28_3IKyL9D7GqGIa2n6OoJeyAI6ZQ1
 r6AhHWSu87w57eeuePB4CVSNQfHE-
X-Sonic-MF: <brchuckz@aim.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.gq1.yahoo.com with HTTP; Thu, 5 Jan 2023 01:57:19 +0000
Received: by hermes--production-ne1-7b69748c4d-pm9xv (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 5ad7388ff1f2f81a903f2d20066a3dfd; 
 Thu, 05 Jan 2023 01:57:17 +0000 (UTC)
Message-ID: <1353bd20-0edb-ed66-5c1f-9d117a76c372@aol.com>
Date: Wed, 4 Jan 2023 20:57:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 6/6] hw/isa/piix: Resolve redundant
 TYPE_PIIX3_XEN_DEVICE
Content-Language: en-US
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
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <405dc396-7b7e-842a-2b94-6b26df1aa564@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20982
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
Received-SPF: pass client-ip=98.137.65.84; envelope-from=brchuckz@aim.com;
 helo=sonic313-21.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.708,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On 1/4/23 5:35 PM, Philippe Mathieu-Daudé wrote:
> On 4/1/23 17:42, Chuck Zmudzinski wrote:
>> On 1/4/23 9:44 AM, Bernhard Beschow wrote:
>>> During the last patches, TYPE_PIIX3_XEN_DEVICE turned into a clone of
>>> TYPE_PIIX3_DEVICE. Remove this redundancy.
>>>
>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>> ---
>>>   hw/i386/pc_piix.c             |  4 +---
>>>   hw/isa/piix.c                 | 20 --------------------
>>>   include/hw/southbridge/piix.h |  1 -
>>>   3 files changed, 1 insertion(+), 24 deletions(-)
>>>
>>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>>> index 5738d9cdca..6b8de3d59d 100644
>>> --- a/hw/i386/pc_piix.c
>>> +++ b/hw/i386/pc_piix.c
>>> @@ -235,8 +235,6 @@ static void pc_init1(MachineState *machine,
>>>       if (pcmc->pci_enabled) {
>>>           DeviceState *dev;
>>>           PCIDevice *pci_dev;
>>> -        const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
>>> -                                         : TYPE_PIIX3_DEVICE;
>>>           int i;
>>>   
>>>           pci_bus = i440fx_init(pci_type,
>>> @@ -250,7 +248,7 @@ static void pc_init1(MachineState *machine,
>>>                                          : pci_slot_get_pirq);
>>>           pcms->bus = pci_bus;
>>>   
>>> -        pci_dev = pci_new_multifunction(-1, true, type);
>>> +        pci_dev = pci_new_multifunction(-1, true, TYPE_PIIX3_DEVICE);
>>>           object_property_set_bool(OBJECT(pci_dev), "has-usb",
>>>                                    machine_usb(machine), &error_abort);
>>>           object_property_set_bool(OBJECT(pci_dev), "has-acpi",
>>> diff --git a/hw/isa/piix.c b/hw/isa/piix.c
>>> index 98e9b12661..e4587352c9 100644
>>> --- a/hw/isa/piix.c
>>> +++ b/hw/isa/piix.c
>>> @@ -33,7 +33,6 @@
>>>   #include "hw/qdev-properties.h"
>>>   #include "hw/ide/piix.h"
>>>   #include "hw/isa/isa.h"
>>> -#include "hw/xen/xen.h"
>>>   #include "sysemu/runstate.h"
>>>   #include "migration/vmstate.h"
>>>   #include "hw/acpi/acpi_aml_interface.h"
>>> @@ -465,24 +464,6 @@ static const TypeInfo piix3_info = {
>>>       .class_init    = piix3_class_init,
>>>   };
>>>   
>>> -static void piix3_xen_class_init(ObjectClass *klass, void *data)
>>> -{
>>> -    DeviceClass *dc = DEVICE_CLASS(klass);
>>> -    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>>> -
>>> -    k->realize = piix3_realize;
>>> -    /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
>>> -    k->device_id = PCI_DEVICE_ID_INTEL_82371SB_0;
>>> -    dc->vmsd = &vmstate_piix3;
>>> -}
>>> -
>>> -static const TypeInfo piix3_xen_info = {
>>> -    .name          = TYPE_PIIX3_XEN_DEVICE,
>>> -    .parent        = TYPE_PIIX_PCI_DEVICE,
>>> -    .instance_init = piix3_init,
>>> -    .class_init    = piix3_xen_class_init,
>>> -};
>>> -
>>>   static void piix4_realize(PCIDevice *dev, Error **errp)
>>>   {
>>>       ERRP_GUARD();
>>> @@ -534,7 +515,6 @@ static void piix3_register_types(void)
>>>   {
>>>       type_register_static(&piix_pci_type_info);
>>>       type_register_static(&piix3_info);
>>> -    type_register_static(&piix3_xen_info);
>>>       type_register_static(&piix4_info);
>>>   }
>>>   
>>> diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
>>> index 65ad8569da..b1fc94a742 100644
>>> --- a/include/hw/southbridge/piix.h
>>> +++ b/include/hw/southbridge/piix.h
>>> @@ -77,7 +77,6 @@ struct PIIXState {
>>>   OBJECT_DECLARE_SIMPLE_TYPE(PIIXState, PIIX_PCI_DEVICE)
>>>   
>>>   #define TYPE_PIIX3_DEVICE "PIIX3"
>>> -#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
>>>   #define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
>>>   
>>>   #endif
>> 
>> 
>> This fixes the regression with the emulated usb tablet device that I reported in v1 here:
>> 
>> https://lore.kernel.org/qemu-devel/aed4f2c1-83f7-163a-fb44-f284376668dc@aol.com/
>> 
>> I tested this patch again with all the prerequisites and now with v2 there are no regressions.
>> 
>> Tested-by: Chuck Zmudzinski <brchuckz@aol.com>
> 
> (IIUC Chuck meant to send this tag to the cover letter)
> 

Yes, I tested the whole patch series, not just this individual patch.
I tagged this one because it is the last patch in the series.

