Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4D33A6EFB
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 21:28:16 +0200 (CEST)
Received: from localhost ([::1]:35420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lssFr-00086R-Th
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 15:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1lssEr-0007Av-Vk; Mon, 14 Jun 2021 15:27:13 -0400
Received: from mout.gmx.net ([212.227.17.21]:47715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1lssEp-0001Wl-SV; Mon, 14 Jun 2021 15:27:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1623698823;
 bh=H1j2XMIXZnodzaW4t8yVCtuUz7nFeaKbQx6ycZPqf+k=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:References:Date:In-Reply-To;
 b=Jj2MKUJMqq3nFwbUCtoGAOvIFMJqECp8zosje0aHlT8qm0AE8D0+bnN0Vxw4aTQbo
 g7lJvjoS2kafr1i130DpOM29cdOeIlum0aJjFBYutIiIrVhk8WBC4G/TbA7KCazaw0
 +aDaziLEGutUsrxxDQFuvvdHto/QL043Ww0rk6qM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.35] ([62.143.247.63]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1ML9yc-1lanQ43CPS-00IEoi; Mon, 14
 Jun 2021 21:27:02 +0200
Subject: Re: [PATCH v2 3/3] hw/nvme: default for namespace EUI-64
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
To: Klaus Jensen <its@irrelevant.dk>
References: <20210611234631.81314-1-xypron.glpk@gmx.de>
 <20210611234631.81314-4-xypron.glpk@gmx.de>
 <YMege+mwy768d/Uk@apples.localdomain>
 <d20f88a5-9fe2-3f8f-5251-5379854afc87@gmx.de>
Message-ID: <52582a9b-a44e-ef26-e363-7850f44072a3@gmx.de>
Date: Mon, 14 Jun 2021 21:27:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d20f88a5-9fe2-3f8f-5251-5379854afc87@gmx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vN9gvByqMqQyrHf9J1IS481gElSJlzDk2wG5V5Fgjbo9PLntCc/
 ZsAA5lS641oZ3XteyxgNEiOnjKs6odk/DiRyHpDjV1wiJTD//ApKbX7C+zQNqStdbUb124+
 MZt9gmqTRhPR/cy1hQ6jrMIYkW8CsxFOOqPIfkSOhA+n7VDikEunuAFlAm3ZGCUUXuFTPhG
 INIpMmPqfKXkjKwAX87EA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:I9wT/2iAYEc=:2rDZqNw22mnk3M/CLbVyC1
 XcZBvqniuHxaufNMiBj5x7B55a9XGKqP2X2VSJ4UfTXsA5nGLgSF24bH99KvQPt9sHMPyF/b0
 8CR50i7qcnEFJgaOyOZLv/Cm+EpyanVY4ZDsj0qYbkwtS74fVrQYqgZ6l8lXhIA7khr9YU+Gd
 1lm9DjyEcC/sYMIm3QqJ4JBpne5mnHy4POvLJKL/k3ALebW469cG8NknBiITx1XNv3kOmaIWN
 aaM3oj5OZiV2WRT8ZWDV9m4p2FA56X8iCefaSWnkV4R/OI1r/m+/bsCQM/+VgM5NWZ2woPbht
 JV9mApTqTkDlgSKIl2vKtnsdPq/L0uzOIzFTIpcxe3xGmZw0N2M/gFeD1FZvN3NVL+knG5Xn/
 RMgLLvnfRvojD+JkGIotwKXpSrbvMPl6Vqm5kEdthkYnqe955uzmkudVHBeWCvUc6Ud2McdL0
 JrTRVIA1J0PFuJLtkekYp0SKuWAQpjtyIVJbs7bt5eMwIu/bRmtJcNQSDUphln/SQI0o8L5em
 QSAcPPjMhIMYqLJBF0++CH4zd4ddAyKkXJ7SENgN24cnzKF1r5vZJpFVDVtXfZagH31tXwgrB
 Ny76wXK6GLL47xdyPQJSWVyYRvmyJBx6beVi+JupQsevZqm/m1uQ0+e+ZSk5fnqjiDnvL2h1D
 2K/ZgKvtCxPY6HihJVl3FiqT87E6RGcsWbS8RwRA8auiupbph4ZsWTUACvTm1O5ZyOWqrm4E1
 PZur6EMMsAI1/r4aeysEIZf4/4oKNu2/Q8zujH5WDnAx2In7AtzOr/B2Dyfk5Gyiv4u58l7qw
 zuWlye2IvmBUlh9iEMoM2FndBxbFz9g7Yblut5XORbxwySB4b3wcTn+Zgghp48FRDdsBrcQWI
 NHxqYf8P6cVcmB1BVdKW+ic8ie6Af+I2LrcR8XfpAX+cVTypVHujn21SITLzguBhD/1jrDMra
 25MbnwdpV6co/8RMCz/5drdke6vdjsTgiOuU/JgmUM9ECKtF4NjYPZoja9neb3MnxG+hWeTPO
 vBIbVY8LX0PFTQa9VcOIhkdm0KjbBcb3wECw02N73Y3pQJTmvTW2Qb2DQcEi7y+y+REtPA5ls
 GqzpmCKUGAdzLWP9y9C0ZUdnJgEM9zNds1p
Received-SPF: pass client-ip=212.227.17.21; envelope-from=xypron.glpk@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.489,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 9:23 PM, Heinrich Schuchardt wrote:
> On 6/14/21 8:31 PM, Klaus Jensen wrote:
>> On Jun 12 01:46, Heinrich Schuchardt wrote:
>>> On machines with version > 6.0 replace a missing EUI-64 by a generated
>>> value.
>>>
>>> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
>>> ---
>>> v2:
>>> =C2=A0=C2=A0=C2=A0=C2=A0new patch
>>> ---
>>> docs/system/nvme.rst | 2 ++
>>> hw/core/machine.c=C2=A0=C2=A0=C2=A0 | 1 +
>>> hw/nvme/ns.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 9 +++++=
++++
>>> hw/nvme/nvme.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 ++
>>> 4 files changed, 14 insertions(+)
>>>
>>> diff --git a/docs/system/nvme.rst b/docs/system/nvme.rst
>>> index b5f8288d7c..33a15c7dbc 100644
>>> --- a/docs/system/nvme.rst
>>> +++ b/docs/system/nvme.rst
>>> @@ -84,6 +84,8 @@ There are a number of parameters available:
>>> ``eui64``
>>> =C2=A0 Set the EUI-64 of the namespace. This will be reported as a "IE=
EE
>>> Extended
>>> =C2=A0 Unique Identifier" descriptor in the Namespace Identification
>>> Descriptor List.
>>> +=C2=A0 Since machine type 6.1 a non-zero default value is used if the
>>> parameter
>>> +=C2=A0 is not provided. For earlier machine types the field defaults =
to 0.
>>>
>>> ``bus``
>>> =C2=A0 If there are more ``nvme`` devices defined, this parameter may =
be
>>> used to
>>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>>> index 55b9bc7817..d0e9348888 100644
>>> --- a/hw/core/machine.c
>>> +++ b/hw/core/machine.c
>>> @@ -39,6 +39,7 @@
>>> GlobalProperty hw_compat_6_0[] =3D {
>>> =C2=A0=C2=A0=C2=A0 { "gpex-pcihost", "allow-unmapped-accesses", "false=
" },
>>> =C2=A0=C2=A0=C2=A0 { "i8042", "extended-state", "false"},
>>> +=C2=A0=C2=A0=C2=A0 { "nvme-ns", "eui64-default", "off"},
>>> };
>>> const size_t hw_compat_6_0_len =3D G_N_ELEMENTS(hw_compat_6_0);
>>>
>>> diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
>>> index 45e457de6a..4275c3db63 100644
>>> --- a/hw/nvme/ns.c
>>> +++ b/hw/nvme/ns.c
>>> @@ -56,6 +56,7 @@ void nvme_ns_init_format(NvmeNamespace *ns)
>>>
>>> static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
>>> {
>>> +=C2=A0=C2=A0=C2=A0 static uint64_t ns_count;
>>> =C2=A0=C2=A0=C2=A0 NvmeIdNs *id_ns =3D &ns->id_ns;
>>> =C2=A0=C2=A0=C2=A0 uint8_t ds;
>>> =C2=A0=C2=A0=C2=A0 uint16_t ms;
>>> @@ -73,6 +74,12 @@ static int nvme_ns_init(NvmeNamespace *ns, Error
>>> **errp)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 id_ns->nmic |=3D NVME_NMIC_=
NS_SHARED;
>>> =C2=A0=C2=A0=C2=A0 }
>>>
>>> +=C2=A0=C2=A0=C2=A0 /* Substitute a missing EUI-64 by an autogenerated=
 one */
>>> +=C2=A0=C2=A0=C2=A0 ++ns_count;
>>> +=C2=A0=C2=A0=C2=A0 if (!ns->params.eui64 && ns->params.eui64_default)=
 {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ns->params.eui64 =3D ns_co=
unt + NVME_EUI64_DEFAULT;
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> =C2=A0=C2=A0=C2=A0 /* simple copy */
>>> =C2=A0=C2=A0=C2=A0 id_ns->mssrl =3D cpu_to_le16(ns->params.mssrl);
>>> =C2=A0=C2=A0=C2=A0 id_ns->mcl =3D cpu_to_le32(ns->params.mcl);
>>> @@ -533,6 +540,8 @@ static Property nvme_ns_props[] =3D {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 params.max=
_open_zones, 0),
>>> =C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT32("zoned.descr_ext_size", NvmeName=
space,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 params.zd_=
extension_size, 0),
>>> +=C2=A0=C2=A0=C2=A0 DEFINE_PROP_BOOL("eui64-default", NvmeNamespace,
>>> params.eui64_default,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 true),
>>> =C2=A0=C2=A0=C2=A0 DEFINE_PROP_END_OF_LIST(),
>>> };
>>>
>>> diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
>>> index ac90e13d7b..3fb869731d 100644
>>> --- a/hw/nvme/nvme.h
>>> +++ b/hw/nvme/nvme.h
>>> @@ -26,6 +26,7 @@
>>>
>>> #define NVME_MAX_CONTROLLERS 32
>>> #define NVME_MAX_NAMESPACES=C2=A0 256
>>> +#define NVME_EUI64_DEFAULT 0x27fed9272381cbd0UL
>>
>> Is there any significance to this value? Any particular reason it is no=
t
>> using the QEMU OUI (52:54:00)?
>
> 52:54:00 does not exist in http://standards-oui.ieee.org/oui/oui.txt
> So this seems not to be an OUI. We should not use a number that IEEE may
> sell to some other entity.
>
> Until somebody buys a 36bit OUI in the name of QEMU for 780 USD we have
> to use a locally assigned number.

I got that wrong IEEE_COMPANY_LOCALLY_ASSIGNED 0x525400 is locally
assigned and therefore not in the OUI list.

I will resubmit the patch.

Best regards

Heinrich

>
> Best regards
>
> Heinrich
>
>>
>>>
>>> typedef struct NvmeCtrl NvmeCtrl;
>>> typedef struct NvmeNamespace NvmeNamespace;
>>> @@ -84,6 +85,7 @@ typedef struct NvmeNamespaceParams {
>>> =C2=A0=C2=A0=C2=A0 uint32_t nsid;
>>> =C2=A0=C2=A0=C2=A0 QemuUUID uuid;
>>> =C2=A0=C2=A0=C2=A0 uint64_t eui64;
>>> +=C2=A0=C2=A0=C2=A0 bool=C2=A0=C2=A0=C2=A0=C2=A0 eui64_default;
>>>
>>> =C2=A0=C2=A0=C2=A0 uint16_t ms;
>>> =C2=A0=C2=A0=C2=A0 uint8_t=C2=A0 mset;
>>> --
>>> 2.30.2
>>>
>>>
>>
>


