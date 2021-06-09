Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5350B3A143C
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 14:23:12 +0200 (CEST)
Received: from localhost ([::1]:43688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqxEl-0008H8-Du
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 08:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1lqxD5-00066P-Ez
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:21:27 -0400
Received: from mout.gmx.net ([212.227.17.21]:35545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1lqxD2-0002kA-CL
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:21:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1623241266;
 bh=YN8G/tSfiN+Ae2kYbDHfzpNvmz21N3j+BMmFqT0Smto=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=aH80WOeZfCMZ5fQb/rMwrMZ7cR+ma7AZkTIJvwwrwFz2mqxR6XUtZ1JeHZp3MnkN1
 l5qsfq3oh2EK/H+9AmMc0YaUEyakltqXdaZymJrkiyLxIsGIyuhAqrSKshM8sIXObm
 IztNmPajnBWEsCUtBvgYy5N0YKsnLZA7WPDukyD4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.35] ([62.143.247.63]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8QS8-1lvKuv434i-004WIV; Wed, 09
 Jun 2021 14:21:06 +0200
Subject: Re: [PATCH 1/1] hw/nvme: namespace parameter for EUI64
To: Klaus Jensen <its@irrelevant.dk>
References: <20210609114657.33301-1-xypron.glpk@gmx.de>
 <YMCwjV7Vpbk5au/U@apples.localdomain>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Message-ID: <f5f15ac1-0876-331e-7433-a6ca551b9e10@gmx.de>
Date: Wed, 9 Jun 2021 14:21:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YMCwjV7Vpbk5au/U@apples.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sZbhyjweTEMULYmL4s7b5qO1zKho79vZOah6DQGnCFosKXCUuID
 duFwvmwTeDepTK8M2XjjY5um9sgSCUEgjXqAE8ScPEY6sgk/Obz2dPXkti8rBLZwhR3INT4
 aIzW5NGAh+RMl7gPLjS/KT9u7KUkk7FLmoBCcwhHhb4Ip+Gy6zu9zCSJPqeqmm7vsR00s/7
 ORqtOnFKkF2OSBl/Y3NgA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4iH/9QNG1oA=:TgowdK8rW6STzYyEppVgeE
 1xnrlrv9OvVKjtNz3MQDEbFGyxyeINgFMZJI280nC2BNPIxUvK3Lfyf4v9Tee5TJJaIz+qKo0
 yCKAL2wpH34v6rqd1rL4nEMk006GEmeJbfXzwEDCWnsNbrL4SavfyC07Pc20Q4jqPaVal6Xe9
 0ddQzmLaJphVsNvHqsh4Z9EyMVXPFVwkI3P9qrlUfZMmqngsefjq+MSwuELMtXJvD8Hn3n8KX
 6CyLPR5J1nP71wxCJ+dDAazUC4kdOeqlgsbnTJyZYnSEZMd9CIeXFdAhO5fr/jcKUivyToAnt
 SDgJfAqWJkorSZvInotq4HoepAfsuMDIn6RNRlLdaVU8Kgk0myKsRZ6XUsf5JAJw/SQQ8YAYi
 NEBYlFsoDSUCngaD0zmgX7dyf1lzsEu1yhn5R8lhnpTUbkl0uxfOFnAd8JQII+0vtgx/sFl8J
 1Kf7G6ZEuxodcneYuNH1c+pPHc7A32ac6UWoWBFJoHmOGjwZg9YuPGlxJK5+GHgN9Z3ciZdc0
 07bmhKdvXRiHYJS+CF5jFJTd7K627Ga5eXXqmi0N4kEp2M/etVBSXywb7T7J5qZtBLa68tPB4
 6qsRUYjajDBjOKHBoGwhPfEkIOqPWg31G0C1KLITTh+w8IQWqB95wamaKzLu7JIFVoMK8zLXt
 AfaoxNws1LSnAGcHUjllP62vBPuyIS/6yBkzF2MoFASCYv2gQLNtB9bWKXLn2/hrhIuVFAypu
 /ZpAqs6f2F/pc7pvHSaT3dTBNYG2fGbC6+G/HcpR0ibHwzKbvDBe5cye3BXWq73EJJR4BAedn
 y3lHintkNQiakkZD7MW3jjj7nZrXD/0S9kfiy5i4Jal4SdYTVAc1VlDe0pzyip3qsj6pskPMI
 fqaUl4Kcydm+ubZrZNdGjn2dvSdnnefszt7nqbQCsycmIgm127pppTbLnVJSOaa2U3SsH44T4
 gr1g0esF2AKkPToESN37US1YyHlLdsX2GAszjsr2A+x27UWDUeY10jppwQB6grzIOEf+kcJS1
 183sVgYFzeAb6C7BiC53WeuLnvLz0oVNqRMWZFhLijTM4FLioB5spqdqRgmiDqlMc/0BKrSBP
 YD3W0bt86hieNmOUKcCva7MT9auIXGY+yF+
Received-SPF: pass client-ip=212.227.17.21; envelope-from=xypron.glpk@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/9/21 2:14 PM, Klaus Jensen wrote:
> On Jun=C2=A0 9 13:46, Heinrich Schuchardt wrote:
>> The EUI64 field is the only identifier for NVMe namespaces in UEFI devi=
ce
>> paths. Add a new namespace property "eui64", that provides the user the
>> option to specify the EUI64.
>>
>> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
>> ---
>> docs/system/nvme.rst |=C2=A0 4 +++
>> hw/nvme/ctrl.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 58 +++++++++++++++=
+++++++++++------------------
>> hw/nvme/ns.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 =
++
>> hw/nvme/nvme.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>> 4 files changed, 42 insertions(+), 23 deletions(-)
>>
>> diff --git a/docs/system/nvme.rst b/docs/system/nvme.rst
>> index f7f63d6bf6..a6042f942a 100644
>> --- a/docs/system/nvme.rst
>> +++ b/docs/system/nvme.rst
>> @@ -81,6 +81,10 @@ There are a number of parameters available:
>> =C2=A0 Set the UUID of the namespace. This will be reported as a "Names=
pace
>> UUID"
>> =C2=A0 descriptor in the Namespace Identification Descriptor List.
>>
>> +``eui64``
>> +=C2=A0 Set the EUI64 of the namespace. This will be reported as a "IEE=
E
>> Extended
>> +=C2=A0 Unique Identifier" descriptor in the Namespace Identification
>> Descriptor List.
>> +
>> ``bus``
>> =C2=A0 If there are more ``nvme`` devices defined, this parameter may b=
e
>> used to
>> =C2=A0 attach the namespace to a specific ``nvme`` device (identified b=
y an
>> ``id``
>> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>> index 0bcaf7192f..21f2d6843b 100644
>> --- a/hw/nvme/ctrl.c
>> +++ b/hw/nvme/ctrl.c
>> @@ -4426,19 +4426,19 @@ static uint16_t
>> nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
>> =C2=A0=C2=A0=C2=A0 NvmeIdentify *c =3D (NvmeIdentify *)&req->cmd;
>> =C2=A0=C2=A0=C2=A0 uint32_t nsid =3D le32_to_cpu(c->nsid);
>> =C2=A0=C2=A0=C2=A0 uint8_t list[NVME_IDENTIFY_DATA_SIZE] =3D {};
>> -
>> -=C2=A0=C2=A0=C2=A0 struct data {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Nvm=
eIdNsDescr hdr;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uin=
t8_t v[NVME_NIDL_UUID];
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } uuid;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Nvm=
eIdNsDescr hdr;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uin=
t8_t v;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } csi;
>> -=C2=A0=C2=A0=C2=A0 };
>> -
>> -=C2=A0=C2=A0=C2=A0 struct data *ns_descrs =3D (struct data *)list;
>> +=C2=A0=C2=A0=C2=A0 uint8_t *pos =3D list;
>> +=C2=A0=C2=A0=C2=A0 struct {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NvmeIdNsDescr hdr;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t v[NVME_NIDL_UUID];
>> +=C2=A0=C2=A0=C2=A0 } QEMU_PACKED uuid;
>> +=C2=A0=C2=A0=C2=A0 struct {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NvmeIdNsDescr hdr;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t v;
>> +=C2=A0=C2=A0=C2=A0 } QEMU_PACKED eui64;
>> +=C2=A0=C2=A0=C2=A0 struct {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NvmeIdNsDescr hdr;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t v;
>> +=C2=A0=C2=A0=C2=A0 } QEMU_PACKED csi;
>>
>> =C2=A0=C2=A0=C2=A0 trace_pci_nvme_identify_ns_descr_list(nsid);
>>
>> @@ -4452,17 +4452,29 @@ static uint16_t
>> nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
>> =C2=A0=C2=A0=C2=A0 }
>>
>> =C2=A0=C2=A0=C2=A0 /*
>> -=C2=A0=C2=A0=C2=A0=C2=A0 * Because the NGUID and EUI64 fields are 0 in=
 the Identify
>> Namespace data
>> -=C2=A0=C2=A0=C2=A0=C2=A0 * structure, a Namespace UUID (nidt =3D 3h) m=
ust be reported in the
>> -=C2=A0=C2=A0=C2=A0=C2=A0 * Namespace Identification Descriptor. Add th=
e namespace UUID here.
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * If the EUI64 field is 0 and the NGUID field=
 is 0, the
>> namespace must
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * provide a valid Namespace UUID in the Names=
pace Identification
>> Descriptor
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * data structure. QEMU does not yet support s=
etting NGUID.
>> =C2=A0=C2=A0=C2=A0=C2=A0 */
>> -=C2=A0=C2=A0=C2=A0 ns_descrs->uuid.hdr.nidt =3D NVME_NIDT_UUID;
>> -=C2=A0=C2=A0=C2=A0 ns_descrs->uuid.hdr.nidl =3D NVME_NIDL_UUID;
>> -=C2=A0=C2=A0=C2=A0 memcpy(&ns_descrs->uuid.v, ns->params.uuid.data, NV=
ME_NIDL_UUID);
>> -
>> -=C2=A0=C2=A0=C2=A0 ns_descrs->csi.hdr.nidt =3D NVME_NIDT_CSI;
>> -=C2=A0=C2=A0=C2=A0 ns_descrs->csi.hdr.nidl =3D NVME_NIDL_CSI;
>> -=C2=A0=C2=A0=C2=A0 ns_descrs->csi.v =3D ns->csi;
>> +=C2=A0=C2=A0=C2=A0 uuid.hdr.nidt =3D NVME_NIDT_UUID;
>> +=C2=A0=C2=A0=C2=A0 uuid.hdr.nidl =3D NVME_NIDL_UUID;
>> +=C2=A0=C2=A0=C2=A0 memcpy(uuid.v, ns->params.uuid.data, NVME_NIDL_UUID=
);
>> +=C2=A0=C2=A0=C2=A0 memcpy(pos, &uuid, sizeof(uuid));
>> +=C2=A0=C2=A0=C2=A0 pos +=3D sizeof(uuid);
>> +
>> +=C2=A0=C2=A0=C2=A0 if (ns->params.eui64) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 eui64.hdr.nidt =3D NVME_NID=
T_EUI64;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 eui64.hdr.nidl =3D NVME_NID=
L_EUI64;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 eui64.v =3D cpu_to_be64(ns-=
>params.eui64);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memcpy(pos, &eui64, sizeof(=
eui64));
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pos +=3D sizeof(eui64);
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 csi.hdr.nidt =3D NVME_NIDT_CSI;
>> +=C2=A0=C2=A0=C2=A0 csi.hdr.nidl =3D NVME_NIDL_CSI;
>> +=C2=A0=C2=A0=C2=A0 csi.v =3D ns->csi;
>> +=C2=A0=C2=A0=C2=A0 memcpy(pos, &csi, sizeof(csi));
>> +=C2=A0=C2=A0=C2=A0 pos +=3D sizeof(csi);
>>
>> =C2=A0=C2=A0=C2=A0 return nvme_c2h(n, list, sizeof(list), req);
>> }
>> diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
>> index 992e5a13f5..ddf395d60e 100644
>> --- a/hw/nvme/ns.c
>> +++ b/hw/nvme/ns.c
>> @@ -77,6 +77,7 @@ static int nvme_ns_init(NvmeNamespace *ns, Error
>> **errp)
>> =C2=A0=C2=A0=C2=A0 id_ns->mssrl =3D cpu_to_le16(ns->params.mssrl);
>> =C2=A0=C2=A0=C2=A0 id_ns->mcl =3D cpu_to_le32(ns->params.mcl);
>> =C2=A0=C2=A0=C2=A0 id_ns->msrc =3D ns->params.msrc;
>> +=C2=A0=C2=A0=C2=A0 id_ns->eui64 =3D cpu_to_be64(ns->params.eui64);
>>
>> =C2=A0=C2=A0=C2=A0 ds =3D 31 - clz32(ns->blkconf.logical_block_size);
>> =C2=A0=C2=A0=C2=A0 ms =3D ns->params.ms;
>> @@ -518,6 +519,7 @@ static Property nvme_ns_props[] =3D {
>> =C2=A0=C2=A0=C2=A0 DEFINE_PROP_BOOL("shared", NvmeNamespace, params.sha=
red, false),
>> =C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT32("nsid", NvmeNamespace, params.nsi=
d, 0),
>> =C2=A0=C2=A0=C2=A0 DEFINE_PROP_UUID("uuid", NvmeNamespace, params.uuid)=
,
>> +=C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT64("eui64", NvmeNamespace, params.e=
ui64, 0),
>> =C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT16("ms", NvmeNamespace, params.ms, 0=
),
>> =C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT8("mset", NvmeNamespace, params.mset=
, 0),
>> =C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT8("pi", NvmeNamespace, params.pi, 0)=
,
>> diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
>> index 81a35cda14..abe7fab21c 100644
>> --- a/hw/nvme/nvme.h
>> +++ b/hw/nvme/nvme.h
>> @@ -83,6 +83,7 @@ typedef struct NvmeNamespaceParams {
>> =C2=A0=C2=A0=C2=A0 bool=C2=A0=C2=A0=C2=A0=C2=A0 shared;
>> =C2=A0=C2=A0=C2=A0 uint32_t nsid;
>> =C2=A0=C2=A0=C2=A0 QemuUUID uuid;
>> +=C2=A0=C2=A0=C2=A0 uint64_t eui64;
>>
>> =C2=A0=C2=A0=C2=A0 uint16_t ms;
>> =C2=A0=C2=A0=C2=A0 uint8_t=C2=A0 mset;
>> --
>> 2.30.2
>>
>>
>
> Would it make sense to provide a sensible default for EUI64 such that it
> is always there? That is, using the same IEEE OUI as we already report
> in the IEEE field and add an extension identifier by grabbing 5 bytes
> from the UUID?

According to the NVMe 1.4 specification it is allowable to have a NVMe
device that does not support EUI64. As the EUI64 is used to define boot
options in UEFI using a non-zero default may break existing installations.

Best regards

Heinrich

