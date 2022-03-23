Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D974E5BFE
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 00:42:26 +0100 (CET)
Received: from localhost ([::1]:43180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXAcT-0007pr-G1
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 19:42:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nXAXs-0005kE-Rp; Wed, 23 Mar 2022 19:37:40 -0400
Received: from [2a00:1450:4864:20::535] (port=43607
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nXAXr-0000Tw-88; Wed, 23 Mar 2022 19:37:40 -0400
Received: by mail-ed1-x535.google.com with SMTP id b24so3672784edu.10;
 Wed, 23 Mar 2022 16:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=XTfui0DxGyTQzGceNUFfGNAD3wX6/gYrtnVfLts+vFs=;
 b=NczP0OhElljgxL4rvA9QMRtuR+LUbLrdjpA1icaDlAKCkpehpzR1GXD8UDOFbROPxo
 Y9dkwx1A0VwwxXVp+WzYxe6LcQTlv+jmPsUpi3fuzvxGxc5tw8BS34loYZ4vL5oeu5gF
 eKNSevgLLMq3Wf2qnDyT8liTNuTEePu9Yx7HiC75RSTncmOStTi/7cX3FPqJhgXxfv5H
 fnVK54ZLOQOnGgz/bRWJYFjtwLIF+KE/eogDJqAokNLV9EamYeH8T28wS64BYRqRppOh
 B6Y63qWdw2ZhvHyo8AIPDEdhgnVRVXnFdhGYA0rcgJTn8knnnGO4ODRS8/CEGS2A2w6H
 iNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=XTfui0DxGyTQzGceNUFfGNAD3wX6/gYrtnVfLts+vFs=;
 b=shOjXSCba7nfT/5XDUktfv1HsMJNOzYS4aSp9fc1EOEpfSSkx7J0pL7kFXeSUn2xth
 lWLap7GzHwC61eAKQcyLnk+aI22QkrMuwcRzeluUpUBtokJhREX4OQGrkyVYZxxrbk8d
 MlevnHJ5vVw2ybyaOTYf32KR3TeEfrq5uusDMEtjv7TNqfcspTpEjYvYCG/vmoTYSrLs
 vWQ1bxWVc3EiSZRrwzm5Nwbr2dVDfde3fRrTKmbWhsollWoVbKoSOxXSXzeqxIhICfX+
 BZPFLAX0pBciXhqq43bz0t+FYTFZM9BOvmwuL3+0AMrKghjRPgRHdUN4wniy3N6MrYlO
 UXsA==
X-Gm-Message-State: AOAM532L+v2dffVD8asSC6ZS+CzQqrmGbfNSIvv3yWI2oA/oO9n6po4/
 OTfOk7bcPTdbN8EDa6sMLTU=
X-Google-Smtp-Source: ABdhPJyjlSAkAXzqJik78RL61BqaOnMVVqHHEBBS010wNp7RX3PD3aBIjP8IvFGgH2Glif78aXQ4vg==
X-Received: by 2002:a05:6402:350d:b0:419:547f:134a with SMTP id
 b13-20020a056402350d00b00419547f134amr3309178edd.405.1648078657431; 
 Wed, 23 Mar 2022 16:37:37 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-011-006-205.77.11.pool.telefonica.de.
 [77.11.6.205]) by smtp.gmail.com with ESMTPSA id
 ga42-20020a1709070c2a00b006df76956b53sm449237ejc.212.2022.03.23.16.37.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Mar 2022 16:37:36 -0700 (PDT)
Date: Wed, 23 Mar 2022 23:37:35 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_RESEND_1/2=5D_hw/vfio/pci-qui?=
 =?US-ASCII?Q?rks=3A_Resolve_redundant_property_getters?=
In-Reply-To: <a35794be-1e41-82a0-f6b0-c9541d2373c5@gmail.com>
References: <20220301225220.239065-1-shentey@gmail.com>
 <20220301225220.239065-2-shentey@gmail.com>
 <5F510D6C-37E7-46A1-AEB8-E7D060B4ED0B@gmail.com>
 <a35794be-1e41-82a0-f6b0-c9541d2373c5@gmail.com>
Message-ID: <8FE68ABB-CE4D-446F-8785-313C9CFB1DE9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 21=2E M=C3=A4rz 2022 13:06:29 UTC schrieb "Philippe Mathieu-Daud=C3=A9" =
<philippe=2Emathieu=2Edaude@gmail=2Ecom>:
>On 21/3/22 11:57, Bernhard Beschow wrote:
>> Am 1=2E M=C3=A4rz 2022 22:52:19 UTC schrieb Bernhard Beschow <shentey@g=
mail=2Ecom>:
>>> The QOM API already provides getters for uint64 and uint32 values, so =
reuse
>>> them=2E
>>>
>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=2Eorg>
>>> ---
>>> hw/vfio/pci-quirks=2Ec | 34 +++++++++-------------------------
>>> 1 file changed, 9 insertions(+), 25 deletions(-)
>>>
>>> diff --git a/hw/vfio/pci-quirks=2Ec b/hw/vfio/pci-quirks=2Ec
>>> index 0cf69a8c6d=2E=2Ef0147a050a 100644
>>> --- a/hw/vfio/pci-quirks=2Ec
>>> +++ b/hw/vfio/pci-quirks=2Ec
>>> @@ -1565,22 +1565,6 @@ static int vfio_add_nv_gpudirect_cap(VFIOPCIDev=
ice *vdev, Error **errp)
>>>      return 0;
>>> }
>>>
>>> -static void vfio_pci_nvlink2_get_tgt(Object *obj, Visitor *v,
>>> -                                     const char *name,
>>> -                                     void *opaque, Error **errp)
>>> -{
>>> -    uint64_t tgt =3D (uintptr_t) opaque;
>>> -    visit_type_uint64(v, name, &tgt, errp);
>>> -}
>>> -
>>> -static void vfio_pci_nvlink2_get_link_speed(Object *obj, Visitor *v,
>>> -                                                 const char *name,
>>> -                                                 void *opaque, Error =
**errp)
>>> -{
>>> -    uint32_t link_speed =3D (uint32_t)(uintptr_t) opaque;
>>> -    visit_type_uint32(v, name, &link_speed, errp);
>>> -}
>>> -
>>> int vfio_pci_nvidia_v100_ram_init(VFIOPCIDevice *vdev, Error **errp)
>>> {
>>>      int ret;
>>> @@ -1618,9 +1602,9 @@ int vfio_pci_nvidia_v100_ram_init(VFIOPCIDevice =
*vdev, Error **errp)
>>>                                 nv2reg->size, p);
>>>      QLIST_INSERT_HEAD(&vdev->bars[0]=2Equirks, quirk, next);
>>>
>>> -    object_property_add(OBJECT(vdev), "nvlink2-tgt", "uint64",
>>> -                        vfio_pci_nvlink2_get_tgt, NULL, NULL,
>>> -                        (void *) (uintptr_t) cap->tgt);
>>> +    object_property_add_uint64_ptr(OBJECT(vdev), "nvlink2-tgt",
>>> +                                   (uint64_t *) &cap->tgt,
>>> +                                   OBJ_PROP_FLAG_READ);
>>>      trace_vfio_pci_nvidia_gpu_setup_quirk(vdev->vbasedev=2Ename, cap-=
>tgt,
>>>                                            nv2reg->size);
>>> free_exit:
>>> @@ -1679,15 +1663,15 @@ int vfio_pci_nvlink2_init(VFIOPCIDevice *vdev,=
 Error **errp)
>>>          QLIST_INSERT_HEAD(&vdev->bars[0]=2Equirks, quirk, next);
>>>      }
>>>
>>> -    object_property_add(OBJECT(vdev), "nvlink2-tgt", "uint64",
>>> -                        vfio_pci_nvlink2_get_tgt, NULL, NULL,
>>> -                        (void *) (uintptr_t) captgt->tgt);
>>> +    object_property_add_uint64_ptr(OBJECT(vdev), "nvlink2-tgt",
>>> +                                   (uint64_t *) &captgt->tgt,
>>> +                                   OBJ_PROP_FLAG_READ);
>>>      trace_vfio_pci_nvlink2_setup_quirk_ssatgt(vdev->vbasedev=2Ename, =
captgt->tgt,
>>>                                                atsdreg->size);
>>>
>>> -    object_property_add(OBJECT(vdev), "nvlink2-link-speed", "uint32",
>>> -                        vfio_pci_nvlink2_get_link_speed, NULL, NULL,
>>> -                        (void *) (uintptr_t) capspeed->link_speed);
>>> +    object_property_add_uint32_ptr(OBJECT(vdev), "nvlink2-link-speed"=
,
>>> +                                   &capspeed->link_speed,
>>> +                                   OBJ_PROP_FLAG_READ);
>>>      trace_vfio_pci_nvlink2_setup_quirk_lnkspd(vdev->vbasedev=2Ename,
>>>                                                capspeed->link_speed);
>>> free_exit:
>>=20
>> Ping
>>=20
>> @Alistair: When resending, I accidently added a Reviewed-by with your n=
ame here which I asked to be ignored *after* you re-acked patch 2/2=2E In c=
ase you intended to ack this patch as well your voice would be needed again=
=2E
>
>FWIW I expect these patches to get merged via the qemu-trivial@ tree
>once the 7=2E1 development window opens=2E

Excellent!

Best regards,
Bernhard


