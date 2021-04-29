Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A92536EDCF
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 18:04:10 +0200 (CEST)
Received: from localhost ([::1]:57972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc996-0001CL-Ig
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 12:04:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lc94w-0008A1-Oa
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 11:59:50 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:38953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lc94s-0002LM-HU
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 11:59:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1619711986; x=1620316786;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+N50LJhmhwbYqIJS71VswZfyY0cl3ke4M45KjIRMVlw=;
 b=e3AbdPgmdIKQF9pWFLXRk1/pN26bHEUFROKR6DlrhBZXpT639SV7N2Eg
 HaJvj94FbXP5XCTp8DJZqpoJI2Tgl8ZgDOdjE7ik8Zf4kLAJ1vVb8dflp
 4ySTz30qGw08tiHvG3ogY0RaioGQsmOxaW4CcF0m0cOhPRfmUSZrNlLKN k=;
IronPort-SDR: BBdUAW88r9neddnYg46e1uMPs1YUE+uxnDtMNA7O/er5PfDsw6Rr6XzjkNUjPxiZdwdheTxmSl
 L/wTbuw08Ra+Flg7YRftOeXzw+w3EHDEtVmPizpZrBDQwfUs/JpaH4GiY4CkzEDz8UK/OEy+Kj
 IS5fN45ApcQiE2McYfRu7F3lofRFzEcQ2Luv38jbeCOECTpnTn0djSUZDyhRpWMIgwTlBJUdCE
 keCFQa1j4l2s08GDsD0H0/oI//NEKVWTFjbr1XKoKMzAutKWnDPurmoxg0JtFjIuQ2FpE0kR/w
 kb8=
X-IronPort-RemoteIP: 104.47.51.47
X-IronPort-MID: 33536
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
Received: from mail-bn1nam07lp2047.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.47])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 15:59:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqPOKV5QOP4ZrbUZ56R3BiGGN87aX7ZkjariyRCKLTVgtN6p3UuCig17rO4Qk4qnDOcGGSvJ9PPn7FZEGYSAoC9/WHkAA6evTKMT/+2zoNwpuI7LeR6N43HiD2xNCmvAjo9Vw1rjkZkpyakOLmDMxBDAMoHaCPeT8X6Y2B5l4WiP7cGIWPeaxv7Rf2raOQRbuEHrqWc26Zzp9NAPFoBz/qI/F/431hThYrvak4IackX5V9XlqGwDRuU8hf9wN2jGgOh2vcRhXRExIZDJ9JnX53ajGmW4Y42KUeJegDiYVI77ZV8mkCfQK5apW4uwg5mm+WwZnuSilI97VoU4Mdp26w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89c/tC8j7ufvO+SI4vpVi8v0+GylP6ka7brP8sv+gvw=;
 b=nFGzw8u4UDHkRzJk3wN+il2lOX5/AEMgtb5PlbvC9Td5d8/PhOk8/I5q7WWIJHGGwMRNNTQiAwLw2hNKvcb3AvCYk/K1aJQPDOABdsnUvuQy2LSairVj/XjAKX+FdJgzf9rN/Xk5XM4H9gpa752GZ9tDZWDtqmimGDtyFCZBAPnRRhcJDiXvAqrU/uZuzAJKiBBhBX2vjLUM960tpuRNagYdGCtTU4NCq0r6gSouHsKQ2I85V7pkyheiwuA1CL/pVoX4i2YFheU5lrLkZTDykpqJjq2mArJIrFdRTkvZDISpy+/tuhsvr+wPkK6cDkL4s13jJaz+ZvsTWJ6Fvh4tMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB5925.namprd02.prod.outlook.com (2603:10b6:a03:125::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25; Thu, 29 Apr
 2021 15:59:35 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::859:d735:9964:608]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::859:d735:9964:608%6]) with mapi id 15.20.4065.027; Thu, 29 Apr 2021
 15:59:35 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Alessandro Di Federico <ale.qemu@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v4 11/12] target/hexagon: call idef-parser functions
Thread-Topic: [PATCH v4 11/12] target/hexagon: call idef-parser functions
Thread-Index: AQHXMhVWiwIRubC6iUmDCJi2H14NJ6rLuc3Q
Date: Thu, 29 Apr 2021 15:59:35 +0000
Message-ID: <BYAPR02MB48867E82FB1F97AE36D0C76ADE5F9@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210415163455.3839169-1-ale.qemu@rev.ng>
 <20210415163455.3839169-12-ale.qemu@rev.ng>
In-Reply-To: <20210415163455.3839169-12-ale.qemu@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rev.ng; dkim=none (message not signed)
 header.d=none;rev.ng; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 66817c19-24b8-4f2c-79a1-08d90b27c93d
x-ms-traffictypediagnostic: BYAPR02MB5925:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB592584C676457936C74AD9E9DE5F9@BYAPR02MB5925.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:308;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g6wQjau9rK6m2sTjh9HbX+2lWxIPR4eyPHhZCn69Ox54Y3NOdVhO2IfZOqgWuVOUbg1AbveVORP5/bTYSTj7dPG1vZgTZ6cif5J0e94TxVDT8MLyPqSkfbMmELvTrPoNHLQUFqHg/9ywCorXOqQS6s/3a/yCx3Id/mdyKb3NZ7cBNzFztxdziGVNsE1r0Zf0P86sjgsF7uq/nL4nDDPAiP689okKtFQBTeTWJs+4XIQutr8w2ywfP2Qg9UQAYgXtTB3APLSuB8YeafnBZebq20XWp1Yvv9pW39QA2G1PKD+IYdwpO1/l7r3zNCL/eT8sTa0pLcFx1bJSXoSfkM5G2BuO59JhxTHVFUz+q/W4jiGDQ0KMBwfr9QUV3ymli8OKAwLngIPaYhK110uei/6KvQjyz07hmrK1uSFd3NmAm3dtMJhuNVlPZuynzlYUlh+AgXyi7COR47zM0iXYk7bbtD9Mb+W3gGyxl2BawvcTft4PYjvUcldjJrxRNsJuAHS7IaWK0ye9zeYfacHF38tHj90pTrTXQludTeRlL3lKg/8TGTdD13uIINbJLh+fNXy7tepMQi0G65dGK43ppwLFrJCzzWCWlPPqPGXBU8BXhYU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39860400002)(346002)(366004)(376002)(71200400001)(7696005)(66556008)(478600001)(186003)(76116006)(316002)(66446008)(8936002)(4326008)(110136005)(54906003)(64756008)(66476007)(66946007)(8676002)(53546011)(6506007)(122000001)(33656002)(38100700002)(86362001)(2906002)(26005)(52536014)(9686003)(55016002)(83380400001)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?XKRjMfal0OX9u3lg7UEepLh/ef7BZIsIYkmtGQOMNQ+87o3YlsRDVXmez4rL?=
 =?us-ascii?Q?yamVfIWnjLvJOMb9rQXZ+aynLU5mvFMP5TPi0LxDH3xPgQ33tCseRnuev7On?=
 =?us-ascii?Q?PD02Bp+xBHJGuOKMOqUVA1ZdTHWECJo8KgyV3OKld7wjRS0MgTrv6dmBQS9d?=
 =?us-ascii?Q?ThSaXKabwmba7rd5TnI8XBqd0Gej/HDdxGYWihm3q74COCutjn4mG0ZpzcCK?=
 =?us-ascii?Q?PAnf7ffUHLoZv1fPbFdZQ+9KhMIm6DC2GT1fRbp2MXOZl/+rbTgwigfPcBGQ?=
 =?us-ascii?Q?y0pLxtvh9UyRWeWWnanHJJWSUx2wR28SDifyEm1TSH5cAN8+JbvuTw65+b4S?=
 =?us-ascii?Q?bv26vuS+imrxvHIDWnn1jssVKuLpZSOYmcF8ejTzlMZ1YUJo4eHfzqpUymgw?=
 =?us-ascii?Q?XurvGI3eLID0gVkebkDs9epqrAsNBshI89jeUURY3+ukDl/ak2l30oyk+F1S?=
 =?us-ascii?Q?M9XYCeuP/WdThUorvsaRaB+InRxbPOuhi4qYop23tpx1+Q7vjJnGVXtXOJ93?=
 =?us-ascii?Q?+zKmx7cXDAvhHAJH48WG+w2gZuuzYyG7zuAFGiSJ3lRZW3pz4tnLx/hh7NqP?=
 =?us-ascii?Q?MbADqFrQqklBF2KH9ngSBJMSVonfRxgsZmoMPcuDKo6311VFrzbJy5xPIFWj?=
 =?us-ascii?Q?ZprejI95Hji9LaAXV2qRwSTi9cJm0P53GqKmMUPaZqMeumu/EibsPyMc5g1y?=
 =?us-ascii?Q?Q39rVEdcH1KdLbLuMl0Eaa7aA5x0naTAGrezJw39ENV2ZCzKJXCdrZ/Q6Cac?=
 =?us-ascii?Q?QE0KMeE1/XHTzbgSUBuBq5antGwW9bUxWoPr8ZDlVavKSI/dDU1CPhr69gYg?=
 =?us-ascii?Q?J0tJO3sAPqd6TtbZSHS4/VLwoOcAWrYvOVvjK9qmwCXJLeAmVCJ93n5qgoqx?=
 =?us-ascii?Q?8ET/fKrE3aiZcvLx/rmBvT4CpROcRgdBA4mVwFqd4ycmjvmsmNPTIlFql2Vj?=
 =?us-ascii?Q?ZKtniVlOSIE6ocBUXWv20ETFNB3KLmFak8LhG9xrK+ZPtgmxvHOYD7n3ox3c?=
 =?us-ascii?Q?imoP9UBSxK9Mr9395M57+Wolq7pHAMOuIDCRIjj+XreGw7vA2poMy5zfTQTE?=
 =?us-ascii?Q?rbyISuESaV7XytE5ObzZ3Ge7D7X4YCpwcNFqfJGCav9P37EnMl4uWIfbW6Tp?=
 =?us-ascii?Q?baHN6Nbe4I+ozjib18JMO4f64YoscF02wMLRYB0BzDWGzaAk8Sxs9LaSr/0X?=
 =?us-ascii?Q?t3Wuy8fTxe4uEf6jeKoST6R+ljmXS6ZcCO17C7qGl2YEoS4dfRm39Nd7LWjg?=
 =?us-ascii?Q?1Z/PMVNQZkTf/yQVGI8nkbkTKTp701XyOnsWkp+agXsdsqF/ARrfzUh2iCXp?=
 =?us-ascii?Q?KbVNJtfaHELo9D+Yc1H6wgZ5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66817c19-24b8-4f2c-79a1-08d90b27c93d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2021 15:59:35.5296 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iLTrTkkdsoE1DH1LdVpdMVIYyjBbsCFEVnJHLhUUzRFKncNowCTITOAVCkxuwEJ+wI1ccGD3Imri5zYEnFKehg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5925
Received-SPF: pass client-ip=216.71.140.77; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Cc: Alessandro Di Federico <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "babush@rev.ng" <babush@rev.ng>, "nizzo@rev.ng" <nizzo@rev.ng>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Alessandro Di Federico <ale.qemu@rev.ng>
> Sent: Thursday, April 15, 2021 11:35 AM
> To: qemu-devel@nongnu.org
> Cc: Taylor Simpson <tsimpson@quicinc.com>; Brian Cain
> <bcain@quicinc.com>; babush@rev.ng; nizzo@rev.ng; philmd@redhat.com;
> richard.henderson@linaro.org; Alessandro Di Federico <ale@rev.ng>
> Subject: [PATCH v4 11/12] target/hexagon: call idef-parser functions
>=20
> From: Alessandro Di Federico <ale@rev.ng>
>=20
> Extend gen_tcg_funcs.py in order to emit calls to the functions emitted
> by the idef-parser, if available.
>=20
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> ---
>  target/hexagon/gen_tcg_funcs.py | 28 ++++++++++++++++++++++++++--
>  target/hexagon/hex_common.py    | 10 ++++++++++
>  target/hexagon/meson.build      | 22 +++++++++++++---------
>  3 files changed, 49 insertions(+), 11 deletions(-)
>=20
> diff --git a/target/hexagon/gen_tcg_funcs.py
> b/target/hexagon/gen_tcg_funcs.py
> index db9f663a77..5980dab8ee 100755
> --- a/target/hexagon/gen_tcg_funcs.py
> +++ b/target/hexagon/gen_tcg_funcs.py
> @@ -394,7 +394,29 @@ def gen_tcg_func(f, tag, regs, imms):
>          if (hex_common.is_read(regid)):
>              genptr_src_read_opn(f,regtype,regid,tag)
>=20
> -    if ( hex_common.skip_qemu_helper(tag) ):
> +    if hex_common.is_idef_parser_enabled(tag):
> +        declared =3D []
> +        ## Handle registers
> +        for regtype,regid,toss,numregs in regs:
> +            if (hex_common.is_pair(regid)
> +                or (hex_common.is_single(regid)
> +                    and hex_common.is_old_val(regtype, regid, tag))):
> +                declared.append("%s%sV" % (regtype, regid))
> +                if regtype =3D=3D "M":
> +                    declared.append("%s%sN" % (regtype, regid))
> +            elif hex_common.is_new_val(regtype, regid, tag):
> +                declared.append("%s%sN" % (regtype,regid))
> +            else:
> +                print("Bad register parse: ",regtype,regid,toss,numregs)
> +
> +        ## Handle immediates
> +        for immlett,bits,immshift in imms:
> +            declared.append(hex_common.imm_name(immlett))
> +
> +        arguments =3D ", ".join(["ctx", "insn", "pkt"] + declared)
> +        f.write("    emit_%s(%s);\n" % (tag, arguments))
> +
> +    elif ( hex_common.skip_qemu_helper(tag) ):
>          f.write("    fGEN_TCG_%s(%s);\n" % (tag, hex_common.semdict[tag]=
))
>      else:
>          ## Generate the call to the helper

You should add the hex_common.is_idef_parser_enabled(tag) check to gen_help=
er_protos.py and gen_helper_funcs.py.

Look for these lines in each of those files
            if ( hex_common.skip_qemu_helper(tag) ):
                continue
If you add
            if ( hex_common.is_idef_parser_enabled(tag) ):
                continue
that will greatly reduce the size of helper_protos_generated.c.inc and help=
er_funcs.c.inc.  That will reduce the build time for the Hexagon target as =
well as the size of the qemu executable.

You'll also need to modify the main function in each of those files and the=
 corresponding invocation in meson.build to do the setup so the check does =
what you expect.

Thanks,
Taylor


