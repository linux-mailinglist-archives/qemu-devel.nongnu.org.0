Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 196C74C55A9
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 12:29:23 +0100 (CET)
Received: from localhost ([::1]:57622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNvGM-00021B-6z
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 06:29:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfb1998@web.de>)
 id 1nNvEu-0001IS-B8; Sat, 26 Feb 2022 06:27:52 -0500
Received: from mout.web.de ([212.227.15.14]:53781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfb1998@web.de>)
 id 1nNvEs-0007vq-3h; Sat, 26 Feb 2022 06:27:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1645874865;
 bh=zbR+FOIl3UqFb24iTpRfZ9VGHS5ZEt37RMyM+vbimPY=;
 h=X-UI-Sender-Class:Date:From:To:CC:Subject:In-Reply-To:References;
 b=qRtSqoIQiHHzAdQHFmzPv093PdvyBHm6dUbsJwpa+x7fZji7iIcmhg8I4Nwf9wVep
 Yzz7o211npYwG6wkERwVVaGxsf3YcaAc9Ue8IkU5xl7DY2cyaRFOWQBub4CqXZarDy
 HIREoIWEVmdiHD+FXnFgaHijqVbRYuE7NV6QBes0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [127.0.0.1] ([78.54.158.154]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N45xt-1oO2CW3EBN-00zbsa; Sat, 26
 Feb 2022 12:27:45 +0100
Date: Sat, 26 Feb 2022 11:27:42 +0000
From: BB <dfb1998@web.de>
To: =?ISO-8859-1?Q?C=E9dric_Le_Goater?= <clg@kaod.org>,
 Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_05/22=5D_hw/ppc/pnv=3A_Determi?=
 =?US-ASCII?Q?ne_ns16550=27s_IRQ_number_from_QOM_property?=
In-Reply-To: <26f8cf8c-ab48-649d-6ecb-c5e14c12d0b2@kaod.org>
References: <20220222193446.156717-1-shentey@gmail.com>
 <20220222193446.156717-6-shentey@gmail.com>
 <26f8cf8c-ab48-649d-6ecb-c5e14c12d0b2@kaod.org>
Message-ID: <7B54CEB0-7D99-466F-9DBB-9B074BDCE305@web.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:U8Ts/CYcGV1I4s9gD1pmQosjSqFQt6XCyXTF/LfGcoY51MSDsLn
 ez/RPZgJlu5OBuT6Ky3l1Q6NhXaf5eBzfLg0vveUaiY25Sokh6JfROkIRgyUQqYBpuFOUBY
 HYIp78LRl6FULv36zCgOPp0gg8qRuAx6udSVf6aDMTRX6CgUsY3MujfQOTb3ntQCAeg8K87
 mBU+MBaRtNUFdIA5dnLnA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GCKY40W7j8I=:+Y7N1iKeelrqtGPE/kJu99
 6tgBww83D3H8ZLUQfsbkk+rgGbXrZ0aeGerWwdxRP5ztZWe7TFuJlOEo5DTLVw4DcURG4lLrr
 QtbkOslXl814/TSo49NqMFZNBFM9DFSgq4YV/0YlxeAKmFstkDZlxJRURArrHVSfi+Sb2pv0R
 aJlUPAQ5GhAtbfLAxBPbvUkaoep7kdYKhwtZaI4XgAcfiIyzMS7EUhswphGfqpCjeMGiu5k0U
 8tDA6S9Uv4FBvDb5k9DeIIZva2Zuk4ffnmfLWtJCboIqIXCXLD4+EF63XSQ/cOvgcilg+d4sC
 l2RcuJp0OcHSKfvY4gG2PEJwjEdYzs1L/JzRLgze4bTAyIDiklmNCma3JppYgWYpm4Q/xvVtg
 FJUIfHhrpultxxfwftMpDlqfkk5jrCFpT6XgVv3GsZWB2TRZIv5UUEQnciRrCfwTK/dRfG5vQ
 njHjbsczde4i538Jj/vX3b5KI321yAD1U/i8AOm6lNsGR3pAcjHPmNrsPEWdWPEFCg6owBlj4
 4OdDEcm52MDmoWlBszQxWJ4cr72sSNOaqTSbI8S5TL6sQR7oJyVYp84dHLIZakz1TngGo98LH
 c8r4TjWfwxwFZ2rgQMRpc0jnaoDYTfqaBP/NY42k61ZWOj7SXt7BI0s4bd58rGSMZm0x0Ky8j
 F32/h7e5TPK/2Lk8wJUi+glgqtskmAtruZSbYvJD1yWPJznPr58iAuYG8i2OytrqJjqPlBBQc
 JrHxq5aOkleU8u+MgI/gKRLoSTI4ipABj8BfyoTCyKQ18p1KBwA0OnOFAv1HT79KNesInrYMl
 vdwwpEadhaU3pcBvgC083nzSJCEqLO4IYktYGfjQChf9vZDe2XV+Domh6KhFPd/DLY+xM51+x
 FP2UdHtJMtyjxShvjBu0xrr0yh21+E/GCPkLkPlQAvEM6XR6MrU2mayLQjwUTCtYOPr3QeSCy
 LYc7tQacZBOlnihw8vEgkRKDtpGgpPS5UBYkWVHhrx/cr4JM0h/uncqIMfMi4VC0qHPaJvHwV
 7CWqR5KmLKAHL/4LOYbjC5gn6ZIz/z7mdhvBh5iClFMRr6IgZOGvMeK7aJkEvirblYnyWusKx
 I6YOwujj0ZFYtA=
Received-SPF: pass client-ip=212.227.15.14; envelope-from=dfb1998@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi C=C3=A9dric,

Am 26=2E Februar 2022 11:24:03 UTC schrieb "C=C3=A9dric Le Goater" <clg@ka=
od=2Eorg>:
>Hello,
>
>On 2/22/22 20:34, Bernhard Beschow wrote:
>> Determine the IRQ number in the same way as for isa-ipmi-bt=2E This res=
olves
>> the last usage of ISADevice::isairq[] which allows it to be removed=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>
>I can take this patch in the ppc stream if you prefer=2E

Good idea=2E I think that's going to be faster=2E

Thanks,
Bernhard

> Anyhow,
>
>Reviewed-by: C=C3=A9dric Le Goater <clg@kaod=2Eorg>
>
>Thanks,
>
>C=2E
>
>
>> ---
>>   hw/ppc/pnv=2Ec | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/hw/ppc/pnv=2Ec b/hw/ppc/pnv=2Ec
>> index 837146a2fb=2E=2E1e9f6b0690 100644
>> --- a/hw/ppc/pnv=2Ec
>> +++ b/hw/ppc/pnv=2Ec
>> @@ -380,9 +380,12 @@ static void pnv_dt_serial(ISADevice *d, void *fdt,=
 int lpc_off)
>>           cpu_to_be32(io_base),
>>           cpu_to_be32(8)
>>       };
>> +    uint32_t irq;
>>       char *name;
>>       int node;
>>  =20
>> +    irq =3D object_property_get_int(OBJECT(d), "irq", &error_fatal);
>> +
>>       name =3D g_strdup_printf("%s@i%x", qdev_fw_name(DEVICE(d)), io_ba=
se);
>>       node =3D fdt_add_subnode(fdt, lpc_off, name);
>>       _FDT(node);
>> @@ -394,7 +397,7 @@ static void pnv_dt_serial(ISADevice *d, void *fdt, =
int lpc_off)
>>  =20
>>       _FDT((fdt_setprop_cell(fdt, node, "clock-frequency", 1843200)));
>>       _FDT((fdt_setprop_cell(fdt, node, "current-speed", 115200)));
>> -    _FDT((fdt_setprop_cell(fdt, node, "interrupts", d->isairq[0])));
>> +    _FDT((fdt_setprop_cell(fdt, node, "interrupts", irq)));
>>       _FDT((fdt_setprop_cell(fdt, node, "interrupt-parent",
>>                              fdt_get_phandle(fdt, lpc_off))));
>>  =20
>

