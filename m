Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7D03FA6A7
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Aug 2021 18:01:45 +0200 (CEST)
Received: from localhost ([::1]:57192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mK0m7-0002pc-MW
	for lists+qemu-devel@lfdr.de; Sat, 28 Aug 2021 12:01:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8874121c5c=pdel@fb.com>)
 id 1mK0jD-0001jH-Ey; Sat, 28 Aug 2021 11:58:43 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:52354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8874121c5c=pdel@fb.com>)
 id 1mK0jA-0000fC-Eq; Sat, 28 Aug 2021 11:58:43 -0400
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17SFw9M2025494; Sat, 28 Aug 2021 08:58:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=EF5SD7BwcABJsIAyNOHDY9ySjHmXQ8s32FjIQoJ2THg=;
 b=Bxw3lcPaRvs3zTQjlF1fxyOzSx2Po9BPJJ9XxAiyxnLBDLgzMsO44ClytVpIQdNI5C/s
 zW72ff11sANF774/OWnDZ7KYbt13WY4GasxqLeiz5vPFVDa9PwQgB+5vAJPgsZ0MJAAR
 qRYjed2qI1gWczDa8Da98OUeQidV5Ut63cU= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 3aqmf78wsr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Sat, 28 Aug 2021 08:58:27 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 28 Aug 2021 08:58:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mCJ6CitSy/Vw8Nh5mqf/zV9c0OTLQnexaTfGiB0zS3QJAJCVhlY9PHLvSUaPtU9txvyrgS9ZGSfpjSYFhfrV0Ey5jJABrYz2F1H/uqZjrjjoEq0SdTSWy40ZZJcHrvtDWxVF6yrfMseKU9tDDO+pr3n7v89xhbI/BzkcS2M13TbF3WHD2QZopusmz+3iK0DjNeuvTZTrbvybaNfEYKZojikjAPhCR9UVJSr4OUlGbfANHo3VH1/rNA8lP0Oh0Gamr1GmQ5sAYFh5H3lg7Du/LqE/kyD+mG/JRZP6rj+avNeSZqUi9qnZmNTYM51xGKAP9uOERHGHE0m1qHe7Lpj43A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlRpLzpAjxLeVPLSROdzHS8kzBTGRHWYL4ljTmCHk1k=;
 b=Awz2//Wn1ZHbRnepX+LQ3BAdWwUHGHFymiIpWY/CVLpcl5V5EH9nF2kOzzPA+cSElEabQCcic6UpgxvowxrXe8VIMol/nderDTOWHr6YcJws5DljneHSTfiq0s9zZlaGCIHNkGf6/koLp4Xo/THZFnMDlkfjmEV4NvCptsCrvcy6mHGpVQczMWWCjK5LxvsnJA48CcjtB8Nz2Go4GcDdBfliUYFO5AXXPIRkb7JoX/8D1waOPqQkfR8oL9qiTdFfcNnfFFQHru+cZgujlHO14DKjdxEHVa+j47wmmvdXaEjK1bf2yDrjMjSZMdEzTHY2BVTrdo0uITC0meyWdpF3qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by BYAPR15MB2504.namprd15.prod.outlook.com (2603:10b6:a02:8e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Sat, 28 Aug
 2021 15:58:24 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::39cf:cf4c:885c:9368]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::39cf:cf4c:885c:9368%7]) with mapi id 15.20.4436.024; Sat, 28 Aug 2021
 15:58:24 +0000
From: Peter Delevoryas <pdel@fb.com>
To: =?Windows-1252?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
CC: "joel@jms.id.au" <joel@jms.id.au>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: Re: [PATCH 2/5] hw/arm/aspeed: Select console UART from machine
Thread-Topic: [PATCH 2/5] hw/arm/aspeed: Select console UART from machine
Thread-Index: AQHXm4dh466/7b8SHEitTznuegJn+auIlZeAgAByzN0=
Date: Sat, 28 Aug 2021 15:58:24 +0000
Message-ID: <BYAPR15MB3032BA6C3556797AC2A3461CACC99@BYAPR15MB3032.namprd15.prod.outlook.com>
References: <20210827210417.4022054-1-pdel@fb.com>
 <20210827210417.4022054-3-pdel@fb.com>
 <7a53d5e9-52c2-a06b-1385-fd71a96d7486@kaod.org>
In-Reply-To: <7a53d5e9-52c2-a06b-1385-fd71a96d7486@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kaod.org; dkim=none (message not signed)
 header.d=none;kaod.org; dmarc=none action=none header.from=fb.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 186f95bd-690e-442d-b6d6-08d96a3caaa6
x-ms-traffictypediagnostic: BYAPR15MB2504:
x-microsoft-antispam-prvs: <BYAPR15MB2504239C052D88EC6A8F53E8ACC99@BYAPR15MB2504.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:639;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SJWM5yLS9c1MPaAAdz787v5V+xF0Ba3Rwt8A4J9gSl3+VV+G+EBDaXrx6MCN7eWnTy0/K5jsmQatN710xoDqAv/b7XO1aLFkZqmYgCRMLanGqS/fH23tSxKVWyGq3M9ynE4kDUpQ5dIA2Z+66SmM8q62nwZ3JjVFnTuhXcKcrNp469DAqM8PZmCo1tHxoteE+eImIbq69gQ85M/3Lixk1u4RoRyA8ZpUDYBgd8fiwdsBVdGZM7d9f+ZshB8KVRzlKMr1EowPQvrRju2x6xGV5JbifYF7oe4wXlR6HEqllw8xKlq6YX6LGyinzDeQlK43OMZUeyR5e8W32hD90WbGcD7IFdtQOjiImAU//2uGM6fVJ2eddJ6JmY8VnVE7dacGwaIhD0Izs4bDQ+bGCFKXNFDgcDaOCpswvZcjYUnxAu8GSJxVhhVzyH+5EAirxN5mzBLlXTmSIL/G7IIw4MPfo09NbDuksm4aPh7g+jHF1hp9R5WfipV8AgvdTesIvMG4H8DerL7g543NKwKO+qzJ+twg6uE5wNmLuU/t2MLNE5TFdUM0Bt24AeyO1Kyx+0Bq7JpRutk4xiM6E0WBCe0UD/JQ43Dc3z9IkbibT5y72e4FmrJLrkjeLqS5cuvrSd4sIHKmqDCv+oD7HNFMHF7HgXOicU2ux60FySRZpAtDhh/WV7Q/dOvccPjepdRv5EwbCwRSnvNBfSDvLnIkjZvN5qq1Psqz6CUEHP6kBjYRfD9/ZDxCa/Co4vNi+A0NdOy8AMTx5iaOMEZPNpRFWAKkhyElb1s110OJ2hk9IXlRDqK6CgHV1UVrUHz8PF02ij/Qxznl1fpgVrcWljeGcR8dRA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52536014)(8676002)(55016002)(966005)(66946007)(6506007)(38070700005)(53546011)(2906002)(316002)(66446008)(5660300002)(71200400001)(76116006)(66574015)(64756008)(508600001)(66556008)(66476007)(8936002)(7696005)(6916009)(166002)(9686003)(86362001)(54906003)(83380400001)(186003)(38100700002)(33656002)(122000001)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?vothVHWu6u6SlqHdpoAoIlVe35g31cTNCI7Q0R7kAywLntAcFGs/1mR3?=
 =?Windows-1252?Q?efUTxtsvJf10KE1+iTT2v5+t9oy7ZNX9S4DOO9CiA0nOMkgZeBIgdPNv?=
 =?Windows-1252?Q?z8b8lHYhkZzafRvlCoH7yf28DMCeavf0C/UoVxLuKjn+vy36RKy9su6I?=
 =?Windows-1252?Q?/+ZXib6yugRV8OItFybDraixV4RBayCZu646vp5Ecc3YNh63p4gshTeB?=
 =?Windows-1252?Q?GaI6vqEuDqr0phkPxN8iPCmOyGU8ME3aFMHzyHlotAQzarVZV/D+RRjK?=
 =?Windows-1252?Q?q+AbPdY4jt7/yGfCYEdj7B6Vq4/fglk49b30VqjlV4FwPN4bqQr5Z/Qq?=
 =?Windows-1252?Q?1OufseQ8AXft+IJMGJmYit1YvrUNZ39pGvbydT/hqd2tCP1LUJgLWYof?=
 =?Windows-1252?Q?CQ7CkuGzYaPRaJrSH76vVRvN8Idmr7arMnKMSxANNIfQiL7PqD/6+Kcq?=
 =?Windows-1252?Q?T6BbyNV/6FsznzzQrE9hOXFPCXsxz89FcCYnxcFK367mxi2cW3429g53?=
 =?Windows-1252?Q?hkbQfC6v7sP/Q+DLS+Kj6ogvFezi+FhpMGIvziiOAel/XliLKmyqf00p?=
 =?Windows-1252?Q?aI5gnKiFnb25zuW0Zkq1e6r1MdMbLRbR1S6qBTistUW4/2wIOnd6XN5S?=
 =?Windows-1252?Q?E6SlMNdBEAfFz1VwxIOUBkhZVtc2S1mbUy+51ok8MXq9+jvpPU/sxTIb?=
 =?Windows-1252?Q?5c7NKD/EDD4tQnEpul/a+Tgqd8pI0EQnhzUqog4t2sG3Ajt+InLhlZ0a?=
 =?Windows-1252?Q?AkOGJr321izB081Zft/2hYKDOA4s7N8/MhGFpf6u9Ok7yOHeuse8wp9p?=
 =?Windows-1252?Q?drFJZux7YP2h7Glr+6FA51RCl3o12Jwhp23A4KXPZr+qJ8nOsY8n17ix?=
 =?Windows-1252?Q?KkXF6RTnrQ+HCB8jR+PnuldrFOn9mQB0rVbi9ln4mgKHU5ZocAAZ4++4?=
 =?Windows-1252?Q?cm0L6yf6Rfn0ebqnH2Lk62U7cYuGtM/NvEWHTmbm+SLbiaxVLiELaAXn?=
 =?Windows-1252?Q?p7s81VcvAUVrBkq9IEUfBErYka60PUxfPoXdlXl54fieHKdEhpf0YIOn?=
 =?Windows-1252?Q?COF7GJQBk2EqsQfPSY5ZBlbW/4qNO4P+tMIsXBnJ1TySuz9Dg2yjG9tj?=
 =?Windows-1252?Q?DQZHSMCv12jetTSsVsf923bnq9fkiIlcESy1fY9E/nyZjHjBZoR0wVPR?=
 =?Windows-1252?Q?E0sPgJkPTlh+28zhTsqByzyR8f193uM8DIbWZrMRGFWqqrgdomeew8LK?=
 =?Windows-1252?Q?FWLlUYWa9MZoM1B7fvf5xgT/ncXRHeP0DO0dB/Zod8Nxa++yTIlOQgR1?=
 =?Windows-1252?Q?thunVh0/+TBA2GMZ0d1g+2bjNKkJsOEMOHm71IP5osyu5/JJmGiJxUr+?=
 =?Windows-1252?Q?TVeVBvu+fpmAErK+kEE3QV+1ewPV58flEyrTHiuiYJ5dNXQeFWisLxfs?=
 =?Windows-1252?Q?rWC1MzKAjYCJHVpHoBrYtlfsqkLBS4uNUOl/yE6Mhmk=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_BYAPR15MB3032BA6C3556797AC2A3461CACC99BYAPR15MB3032namp_"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 186f95bd-690e-442d-b6d6-08d96a3caaa6
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2021 15:58:24.1061 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g5EeTYsGIw3IC8G9clORjX4Hxy3ROgpjKslW6W2jsG3NEmBwNOfqDnmUL7S1w0wK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2504
X-OriginatorOrg: fb.com
X-Proofpoint-ORIG-GUID: Y5Lxb1Cs8ahmQYKyL3vMpGDrVQBd546a
X-Proofpoint-GUID: Y5Lxb1Cs8ahmQYKyL3vMpGDrVQBd546a
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-28_04:2021-08-27,
 2021-08-28 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108280103
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=8874121c5c=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_BYAPR15MB3032BA6C3556797AC2A3461CACC99BYAPR15MB3032namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

I think I=92m a little confused on this part. What I meant by =93most machi=
nes just use UART5=94 was that most DTS=92s use =93stdout-path=3D&uart5=94,=
 but fuji uses =93stdout-path=3D&uart1=94. I do see that SCU510 includes a =
bit related to UART, but it=92s for disabling booting from UART1 and UART5.=
 I just care about the console aspect, not booting.

This is the commit that changed the serial console from UART5 to UART1 in f=
uji=92s DTS: https://github.com/facebook/openbmc-uboot/commit/afeddd6e27b5f=
094bbc4805dc8c1c22b3b7fb203

I don=92t know what the platform.S AST_SCU_MFP_CTRL7 changes do (maybe sett=
ing some GPIO for UART1?), but as far as I understand, I don=92t think usin=
g UART1 should require any extra registers from the datasheet.

An alternate design I considered was UART5=3Dserial_hd(0) and UART1=3Dseria=
l_hd(1), maybe that would be more appropriate? I don=92t think anybody uses=
 both UART=92s simultaneously though, so I didn=92t pursue that design.

Some link references:
Elbert DTS uses =93stdout-path=3D&uart5=94 https://github.com/facebook/open=
bmc-uboot/blob/openbmc/helium/v2019.04/arch/arm/dts/aspeed-bmc-facebook-elb=
ert.dts#L17
Fuji DTS uses =93stdout-path=3D&uart1=94 https://github.com/facebook/openbm=
c-uboot/blob/openbmc/helium/v2019.04/arch/arm/dts/aspeed-bmc-facebook-fuji.=
dts#L17

From: C=E9dric Le Goater <clg@kaod.org>
Date: Saturday, August 28, 2021 at 1:26 AM
To: Peter Delevoryas <pdel@fb.com>
Cc: joel@jms.id.au <joel@jms.id.au>, qemu-devel@nongnu.org <qemu-devel@nong=
nu.org>, qemu-arm@nongnu.org <qemu-arm@nongnu.org>
Subject: Re: [PATCH 2/5] hw/arm/aspeed: Select console UART from machine
On 8/27/21 11:04 PM, pdel@fb.com wrote:
> From: Peter Delevoryas <pdel@fb.com>
>
> This change replaces the UART serial device initialization code with mach=
ine
> configuration data, making it so that we have a single code path for cons=
ole
> UART initialization, but allowing different machines to use different
> UART's. This is relevant because the Aspeed chips have 2 debug UART's, UA=
RT5
> and UART1, and while most machines just use UART5, some use UART1.

I think this is controlled by SCU510. If so, we should have a different HW
strapping for the new machine and check the configuration at the SoC level,
in aspeed_ast2600.c, to change the serial initialization.


Thanks,

C.

>
> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> ---
>  hw/arm/aspeed.c         | 7 +++++++
>  hw/arm/aspeed_ast2600.c | 5 -----
>  hw/arm/aspeed_soc.c     | 5 -----
>  include/hw/arm/aspeed.h | 1 +
>  4 files changed, 8 insertions(+), 10 deletions(-)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 9d43e26c51..ff53d12395 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -14,6 +14,7 @@
>  #include "hw/arm/boot.h"
>  #include "hw/arm/aspeed.h"
>  #include "hw/arm/aspeed_soc.h"
> +#include "hw/char/serial.h"
>  #include "hw/i2c/i2c_mux_pca954x.h"
>  #include "hw/i2c/smbus_eeprom.h"
>  #include "hw/misc/pca9552.h"
> @@ -21,6 +22,7 @@
>  #include "hw/misc/led.h"
>  #include "hw/qdev-properties.h"
>  #include "sysemu/block-backend.h"
> +#include "sysemu/sysemu.h"
>  #include "hw/loader.h"
>  #include "qemu/error-report.h"
>  #include "qemu/units.h"
> @@ -352,6 +354,10 @@ static void aspeed_machine_init(MachineState *machin=
e)
>      }
>      qdev_realize(DEVICE(&bmc->soc), NULL, &error_abort);
>
> +    serial_mm_init(get_system_memory(), sc->memmap[amc->serial_dev], 2,
> +                   sc->get_irq(&bmc->soc, amc->serial_dev), 38400,
> +                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
> +
>      memory_region_add_subregion(get_system_memory(),
>                                  sc->memmap[ASPEED_DEV_SDRAM],
>                                  &bmc->ram_container);
> @@ -804,6 +810,7 @@ static void aspeed_machine_class_init(ObjectClass *oc=
, void *data)
>      mc->no_parallel =3D 1;
>      mc->default_ram_id =3D "ram";
>      amc->macs_mask =3D ASPEED_MAC0_ON;
> +    amc->serial_dev =3D ASPEED_DEV_UART5;
>
>      aspeed_machine_class_props_init(oc);
>  }
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index 56e1adb343..a27b0de482 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -322,11 +322,6 @@ static void aspeed_soc_ast2600_realize(DeviceState *=
dev, Error **errp)
>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
>      }
>
> -    /* UART - attach an 8250 to the IO space as our UART5 */
> -    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
> -                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5),
> -                   38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
> -
>      /* I2C */
>      object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),
>                               &error_abort);
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index c373182299..0c09d1e5b4 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -287,11 +287,6 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
>      }
>
> -    /* UART - attach an 8250 to the IO space as our UART5 */
> -    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
> -                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5), 38400,
> -                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
> -
>      /* I2C */
>      object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),
>                               &error_abort);
> diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
> index c9747b15fc..9f5b9f04d6 100644
> --- a/include/hw/arm/aspeed.h
> +++ b/include/hw/arm/aspeed.h
> @@ -38,6 +38,7 @@ struct AspeedMachineClass {
>      uint32_t num_cs;
>      uint32_t macs_mask;
>      void (*i2c_init)(AspeedMachineState *bmc);
> +    uint32_t serial_dev;
>  };
>
>
>

--_000_BYAPR15MB3032BA6C3556797AC2A3461CACC99BYAPR15MB3032namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">I think I=92m a little confused on this part. What I=
 meant by =93most machines just use UART5=94 was that most DTS=92s use =93s=
tdout-path=3D&amp;uart5=94, but fuji uses =93stdout-path=3D&amp;uart1=94. I
<i>do</i> see that SCU510 includes a bit related to UART, but it=92s for di=
sabling booting from UART1 and UART5. I just care about the console aspect,=
 not booting.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This is the commit that changed the serial console f=
rom UART5 to UART1 in fuji=92s DTS:
<a href=3D"https://github.com/facebook/openbmc-uboot/commit/afeddd6e27b5f09=
4bbc4805dc8c1c22b3b7fb203">
https://github.com/facebook/openbmc-uboot/commit/afeddd6e27b5f094bbc4805dc8=
c1c22b3b7fb203</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I don=92t know what the platform.S AST_SCU_MFP_CTRL7=
 changes do (maybe setting some GPIO for UART1?), but as far as I understan=
d, I don=92t think using UART1 should require any extra registers from the =
datasheet.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">An alternate design I considered was UART5=3Dserial_=
hd(0) and UART1=3Dserial_hd(1), maybe that would be more appropriate? I don=
=92t think anybody uses both UART=92s simultaneously though, so I didn=92t =
pursue that design.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Some link references:<o:p></o:p></p>
<p class=3D"MsoNormal">Elbert DTS uses =93stdout-path=3D&amp;uart5=94 https=
://github.com/facebook/openbmc-uboot/blob/openbmc/helium/v2019.04/arch/arm/=
dts/aspeed-bmc-facebook-elbert.dts#L17<o:p></o:p></p>
<p class=3D"MsoNormal">Fuji DTS uses =93stdout-path=3D&amp;uart1=94 https:/=
/github.com/facebook/openbmc-uboot/blob/openbmc/helium/v2019.04/arch/arm/dt=
s/aspeed-bmc-facebook-fuji.dts#L17<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><span style=3D"fon=
t-size:12.0pt;color:black">From:
</span></b><span style=3D"font-size:12.0pt;color:black">C=E9dric Le Goater =
&lt;clg@kaod.org&gt;<br>
<b>Date: </b>Saturday, August 28, 2021 at 1:26 AM<br>
<b>To: </b>Peter Delevoryas &lt;pdel@fb.com&gt;<br>
<b>Cc: </b>joel@jms.id.au &lt;joel@jms.id.au&gt;, qemu-devel@nongnu.org &lt=
;qemu-devel@nongnu.org&gt;, qemu-arm@nongnu.org &lt;qemu-arm@nongnu.org&gt;=
<br>
<b>Subject: </b>Re: [PATCH 2/5] hw/arm/aspeed: Select console UART from mac=
hine<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">On 8/27/21 11:04 PM, =
pdel@fb.com wrote:<br>
&gt; From: Peter Delevoryas &lt;pdel@fb.com&gt;<br>
&gt; <br>
&gt; This change replaces the UART serial device initialization code with m=
achine<br>
&gt; configuration data, making it so that we have a single code path for c=
onsole<br>
&gt; UART initialization, but allowing different machines to use different<=
br>
&gt; UART's. This is relevant because the Aspeed chips have 2 debug UART's,=
 UART5<br>
&gt; and UART1, and while most machines just use UART5, some use UART1.<br>
<br>
I think this is controlled by SCU510. If so, we should have a different HW =
<br>
strapping for the new machine and check the configuration at the SoC level,=
<br>
in aspeed_ast2600.c, to change the serial initialization.<br>
<br>
<br>
Thanks,<br>
<br>
C. <br>
&nbsp;<br>
&gt; <br>
&gt; Signed-off-by: Peter Delevoryas &lt;pdel@fb.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; hw/arm/aspeed.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
| 7 +++++++<br>
&gt;&nbsp; hw/arm/aspeed_ast2600.c | 5 -----<br>
&gt;&nbsp; hw/arm/aspeed_soc.c&nbsp;&nbsp;&nbsp;&nbsp; | 5 -----<br>
&gt;&nbsp; include/hw/arm/aspeed.h | 1 +<br>
&gt;&nbsp; 4 files changed, 8 insertions(+), 10 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c<br>
&gt; index 9d43e26c51..ff53d12395 100644<br>
&gt; --- a/hw/arm/aspeed.c<br>
&gt; +++ b/hw/arm/aspeed.c<br>
&gt; @@ -14,6 +14,7 @@<br>
&gt;&nbsp; #include &quot;hw/arm/boot.h&quot;<br>
&gt;&nbsp; #include &quot;hw/arm/aspeed.h&quot;<br>
&gt;&nbsp; #include &quot;hw/arm/aspeed_soc.h&quot;<br>
&gt; +#include &quot;hw/char/serial.h&quot;<br>
&gt;&nbsp; #include &quot;hw/i2c/i2c_mux_pca954x.h&quot;<br>
&gt;&nbsp; #include &quot;hw/i2c/smbus_eeprom.h&quot;<br>
&gt;&nbsp; #include &quot;hw/misc/pca9552.h&quot;<br>
&gt; @@ -21,6 +22,7 @@<br>
&gt;&nbsp; #include &quot;hw/misc/led.h&quot;<br>
&gt;&nbsp; #include &quot;hw/qdev-properties.h&quot;<br>
&gt;&nbsp; #include &quot;sysemu/block-backend.h&quot;<br>
&gt; +#include &quot;sysemu/sysemu.h&quot;<br>
&gt;&nbsp; #include &quot;hw/loader.h&quot;<br>
&gt;&nbsp; #include &quot;qemu/error-report.h&quot;<br>
&gt;&nbsp; #include &quot;qemu/units.h&quot;<br>
&gt; @@ -352,6 +354,10 @@ static void aspeed_machine_init(MachineState *mac=
hine)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; qdev_realize(DEVICE(&amp;bmc-&gt;soc), N=
ULL, &amp;error_abort);<br>
&gt;&nbsp; <br>
&gt; +&nbsp;&nbsp;&nbsp; serial_mm_init(get_system_memory(), sc-&gt;memmap[=
amc-&gt;serial_dev], 2,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sc-&gt;get_irq(&amp;bmc-&gt;soc, am=
c-&gt;serial_dev), 38400,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; serial_hd(0), DEVICE_LITTLE_ENDIAN)=
;<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memory_region_add_subregion(get_system_m=
emory(),<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sc-&gt;memmap[ASPEED_D=
EV_SDRAM],<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;bmc-&gt;ram_conta=
iner);<br>
&gt; @@ -804,6 +810,7 @@ static void aspeed_machine_class_init(ObjectClass =
*oc, void *data)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mc-&gt;no_parallel =3D 1;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mc-&gt;default_ram_id =3D &quot;ram&quot=
;;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amc-&gt;macs_mask =3D ASPEED_MAC0_ON;<br=
>
&gt; +&nbsp;&nbsp;&nbsp; amc-&gt;serial_dev =3D ASPEED_DEV_UART5;<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aspeed_machine_class_props_init(oc);<br>
&gt;&nbsp; }<br>
&gt; diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c<br>
&gt; index 56e1adb343..a27b0de482 100644<br>
&gt; --- a/hw/arm/aspeed_ast2600.c<br>
&gt; +++ b/hw/arm/aspeed_ast2600.c<br>
&gt; @@ -322,11 +322,6 @@ static void aspeed_soc_ast2600_realize(DeviceStat=
e *dev, Error **errp)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sysbus_connect_i=
rq(SYS_BUS_DEVICE(&amp;s-&gt;timerctrl), i, irq);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp; /* UART - attach an 8250 to the IO space as our UA=
RT5 */<br>
&gt; -&nbsp;&nbsp;&nbsp; serial_mm_init(get_system_memory(), sc-&gt;memmap[=
ASPEED_DEV_UART5], 2,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aspeed_soc_get_irq(s, ASPEED_DEV_UA=
RT5),<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 38400, serial_hd(0), DEVICE_LITTLE_=
ENDIAN);<br>
&gt; -<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* I2C */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; object_property_set_link(OBJECT(&amp;s-&=
gt;i2c), &quot;dram&quot;, OBJECT(s-&gt;dram_mr),<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;error_abort);<br>
&gt; diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c<br>
&gt; index c373182299..0c09d1e5b4 100644<br>
&gt; --- a/hw/arm/aspeed_soc.c<br>
&gt; +++ b/hw/arm/aspeed_soc.c<br>
&gt; @@ -287,11 +287,6 @@ static void aspeed_soc_realize(DeviceState *dev, =
Error **errp)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sysbus_connect_i=
rq(SYS_BUS_DEVICE(&amp;s-&gt;timerctrl), i, irq);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp; /* UART - attach an 8250 to the IO space as our UA=
RT5 */<br>
&gt; -&nbsp;&nbsp;&nbsp; serial_mm_init(get_system_memory(), sc-&gt;memmap[=
ASPEED_DEV_UART5], 2,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aspeed_soc_get_irq(s, ASPEED_DEV_UA=
RT5), 38400,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; serial_hd(0), DEVICE_LITTLE_ENDIAN)=
;<br>
&gt; -<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* I2C */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; object_property_set_link(OBJECT(&amp;s-&=
gt;i2c), &quot;dram&quot;, OBJECT(s-&gt;dram_mr),<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;error_abort);<br>
&gt; diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h<br>
&gt; index c9747b15fc..9f5b9f04d6 100644<br>
&gt; --- a/include/hw/arm/aspeed.h<br>
&gt; +++ b/include/hw/arm/aspeed.h<br>
&gt; @@ -38,6 +38,7 @@ struct AspeedMachineClass {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t num_cs;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t macs_mask;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*i2c_init)(AspeedMachineState *bmc=
);<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t serial_dev;<br>
&gt;&nbsp; };<br>
&gt;&nbsp; <br>
&gt;&nbsp; <br>
&gt; <o:p></o:p></p>
</div>
</div>
</body>
</html>

--_000_BYAPR15MB3032BA6C3556797AC2A3461CACC99BYAPR15MB3032namp_--

