Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F6736BD16
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 04:04:51 +0200 (CEST)
Received: from localhost ([::1]:54924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbD5m-0003P5-2g
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 22:04:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lbD2S-0001Jn-CE
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 22:01:24 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:7294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lbD2O-0002ms-Ad
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 22:01:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1619488880; x=1620093680;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1CXAgeo+tUPvnAgUFNwmOWJtBOWn4T7YKU5Y1VO9XJY=;
 b=QTRxyBs2i1/2dgZpib4ooZbFhSUq9k9cmNq/2KCK0MASXnB4cBwubKP7
 6lGq5A2SbzxPlE02uxS9kAFBMqByPNnmLUZxT6LrvhYTQ9p4SdFQJ2uIX
 ZpmyLSFUSJ3N3CA9r2K93QaiB7d3ifEkalU1LRCL5FHZe1IUVCbMzvW83 c=;
IronPort-SDR: VDaOgWutzLhSnCLYI4HuUIoZ+7C2y3iNnI4xc5A5uuUErILTc4V6z7zW9wOHD9tOaYL3mgEREd
 7QehXMVXvNuOffmC+g8vPafX3U+61iJsx1hFznjnHaWGIe+6yqkd2BtEkP/va4iy84rcZNBcWE
 +m1fcXqZ10aIFnuDFqU5O19D4uoDEEpgBKxnpkn4To+JY4Xx/Jr8dDut/kWlVWnlqMqn5LFmbg
 XT/NS+ECNp8nWzthL1pQpV8tTkTg8TO4lja9/enIVYMBpw6tr4hNhePkofnWgESfeX2YQEqbnO
 9us=
X-IronPort-RemoteIP: 104.47.73.41
X-IronPort-MID: 23874
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
Received: from mail-dm6nam08lp2041.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.41])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2021 02:01:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbIP/qRjUsoIzOfl9y5+vM4JhXRcg+q+Rk/QaweGBg4bX7lE8CZmt0ndTQ55G42YsPdLqy0fT4WfkTs/QSpNBy9hTvCx7DqVPQjhc3Rvy4N2UNQspb36jXqUdj475+21NvIy9Vv4JeXf9icbLNwRDsJDh93IqFl6hGryNvXEneOHy9nr5tkjTNOd0Kilk6WNrgVpEPYgK871JHb7BYvOA4KIIHZAWgJvH5mmYwwR+R8vwRAS8adfNfc5AF5U+CYah8ZlVv2mWYAEFEv7hvUDBxYSjn6dMiTY2OwOTDx6xwt4GQNhmc7sZTxKHPnTzIDo+38ro0b63o6vMAdRZXQGFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Be9yyyq4nWgnPi4yUEIbe05O0vrZVHx6tEk8eInKNxc=;
 b=I2FamfwkGOYcvnQsniD2f09h8LZqUDoiE2LeuD/Xa21muusZOAY5yXAHZolUZoYE5G70c/lBpWpxerQg7mNW5eYyyNuZ0N6/3tQ4OB3GGCVtKa3artmP676hwPWTS9tBim1CwrUEMTXpNoKNhgJw1BI420hOHsYV+Dd4/rSRvNDZEHtvjnT/y5SV7e+FR/bnnbRInw3QOHZDHdM4k421oJJ8pRtAhvMBRSxEEfbWEwtBjIwALSLuj69ib505BsHAX2sjlcvAXeGEoy3FTUPUQ9l3wibGTDNBm0O1cd5JOmPH1CrzdV4Cef1GLqMz4HqvwRaWOd8HV8TfryM+6xl1HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by SJ0PR02MB7821.namprd02.prod.outlook.com (2603:10b6:a03:32e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Tue, 27 Apr
 2021 02:01:13 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::859:d735:9964:608]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::859:d735:9964:608%6]) with mapi id 15.20.4065.027; Tue, 27 Apr 2021
 02:01:13 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Alessandro Di Federico <ale.qemu@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v4 09/12] target/hexagon: import lexer for idef-parser
Thread-Topic: [PATCH v4 09/12] target/hexagon: import lexer for idef-parser
Thread-Index: AQHXMhVUV9KEy4ZSP0mnsJKBU0naZarHrM5w
Date: Tue, 27 Apr 2021 02:01:13 +0000
Message-ID: <BYAPR02MB488654E65A2BFCEEC3D8AD16DE419@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210415163455.3839169-1-ale.qemu@rev.ng>
 <20210415163455.3839169-10-ale.qemu@rev.ng>
In-Reply-To: <20210415163455.3839169-10-ale.qemu@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rev.ng; dkim=none (message not signed)
 header.d=none;rev.ng; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ce4016dc-af7f-49d4-ed90-08d9092055e6
x-ms-traffictypediagnostic: SJ0PR02MB7821:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR02MB782161528C74482C4E46DA2FDE419@SJ0PR02MB7821.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WVLM0Ctp7lzCRloO4DO5nsmaZpI9efXveo5/3SjQA/cljjC7PnFDP/LB5unnL+Zj0kLV+hgmTys/XAVhbPN0sPgrtKeXf1ShEReNR/vFfF2AaqyehQzykjA50/HTBzpeniYqVq/3ZDxKyiqxFWvSpTLmx6WX8tTm6PmdteVJPli1SY6LSpq74Kf11Cx4KP29sgebi71v9XCZJ7mJ5zY1MBAXr2aDDhmQEaQmB+P3kEOzPHobDfod+QuGooJZoH9UnpZJRBFBENqXwSy0dlXhwTE+yOE9QSfNfpl5jAs+9beTwYwf9+1j0ILZtgDiWo2Bt1kRqXZrVA1juShncXDXT0pjk0+0WbauBipMuf95lo2LDS2ebjnOWRTzy2Tu9IdK1dBJuvk5Azb+QRNc85GEb42wOdDOGs8gMrj0R6nx1b/Zvhb3y7e23kx1DCANIASd6t+SyFFDNsZftxt8isgEYcmWuCaFR7Ot5DDEhaxoCW39pBjZNkjZBBHxdOT0gt7VfHq0r83TIiPfFM0h4vtW9XT+L1E7QUQs23U7Dz40LsBgrzADYneVt/JrhtNAbMt+jRHs/6KkYt9/V6RP70fBE8V584JD195N/WPMH3Gokgs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(396003)(366004)(136003)(376002)(86362001)(52536014)(26005)(54906003)(66946007)(33656002)(186003)(55016002)(110136005)(316002)(5660300002)(8676002)(2906002)(76116006)(66476007)(478600001)(66446008)(9686003)(122000001)(64756008)(6506007)(38100700002)(7696005)(8936002)(71200400001)(66556008)(83380400001)(4326008)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?KKWqrKdUYs+4lomaoG+r7+3U6vb0v1WnenFROnpKQ3jiLZpGd8bf+3hwH0Cr?=
 =?us-ascii?Q?sK9al8cbd83qZBcKfh3qJEu21GfQlpM2/iUVNZgpvJSkvUqrZWPvqcOIyow0?=
 =?us-ascii?Q?BWobRjGZOHh+j7uaKUncP8gBSmyWbqyUgxGwHatF+Zd2px0KVoWGU6GkV7B3?=
 =?us-ascii?Q?RcSGBWSElBEFbqzM4yWJtPSvJezLKTxaXbrc1XPqfsdBJB508+9ztKtajCfg?=
 =?us-ascii?Q?agNTI15a7Jx8XtCymqKl/koOZ65sjFfMRT2lgGQ2TB5iDw27HhZmPfcLp/P1?=
 =?us-ascii?Q?oOrq5PGOJr3sV8nS2qpol4mwSXisSfS3xXKkUYj45kDRDuJu/hSNBMNWcSxl?=
 =?us-ascii?Q?SnTM8I3pDqxicwzpN8Crfre1N74JLW702zQQeOQl6HOyeRN423dS+vXm1Jy+?=
 =?us-ascii?Q?ck9YgKFzlcPHKubgCTPrFVP7YMn0HAuCk4KoEHWXeLJDUt0LcGX4UKfoTNJN?=
 =?us-ascii?Q?Jp/W4WUvVCb/C1qodBiBJFYRzdcVFSS9yIbykHNZD9jgBpGzlGUI0NxOxXgu?=
 =?us-ascii?Q?98Unpcphf7d4hHEomIoq4cRNGlnNp/nLPZQSmGtGg2sdnVdxK8hxkhh0/QCq?=
 =?us-ascii?Q?rgYTEfDvd2JrzjdoUIFBRudweN7oOCHa5OzqflJiuhRhphH6GYL2zG7DMzir?=
 =?us-ascii?Q?lqMhLMX5v5KAQX9PTbdTSQUjGrYDdx4MEoXudQckX9s6eeWxcsZxyfpHJ2vU?=
 =?us-ascii?Q?Z3MqdluS5OASsZnX5KOzmDILgUGxO5Oz0bAIEfsR4RErdoRxpJEAcc2JB3R4?=
 =?us-ascii?Q?m/kbrJWovnImnfQLXpnbtcZ2ISSzU4SVRv5IqPK/oNBwmPWA/hpVZpieTdYq?=
 =?us-ascii?Q?rgy3UzTqLha2dzNAr4BBV5nxp5MB3AE+sXCwo3CmGqZolpgkR2eVjVcIzCgK?=
 =?us-ascii?Q?km4qJIO6AN05dgZap815RcuJ8ENaUbwbMbid94enJA9GDWHspakQqrM7iLKh?=
 =?us-ascii?Q?V1yt7CoNnuuSI0rlJDU7tDQsyiWqaQFXSa7zvRldnyhJKrCvCOZ1SRSJsQ9o?=
 =?us-ascii?Q?DaRJpxjdS/ScU5C8eCYEsUKO/A6qvY5C3sCv4NiOzvKXlOsPdKEEloqp3uzE?=
 =?us-ascii?Q?cmDzdkY+ehIzZP94yZStZ5o5kquxqp/rldUNV3ykJAfM9b6xKvmUkc37p/Kj?=
 =?us-ascii?Q?GBKeMdxt3yEHdKLRQVd4Xyhnuey0Gl9y9hDU5HXwrxaaMttcMwbdhMat0qXH?=
 =?us-ascii?Q?AKrFaDFk3JMrgkVGYc5HGDXzjM8F4gj+3Mr7UIIGvJxTU88xErYzwK6zZ4CL?=
 =?us-ascii?Q?l/gLEbfhxI8OqNY1VfvXfZnyIGLHgvjf2s4mFDhwYAAlanUO+eNx22mO2/lc?=
 =?us-ascii?Q?qOqR2KkLYG/Vcn1yS5oY7UvS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce4016dc-af7f-49d4-ed90-08d9092055e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2021 02:01:13.2467 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /B3BbRbbvpj7tV4a6KeOjd0slvQOfq0u24dTeiPN9TSfhkxSzQSmKWv6jRnf6J8B/jwj5JhDFmNoOu4iis5QRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7821
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsimpson@quicinc.com;
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
> Subject: [PATCH v4 09/12] target/hexagon: import lexer for idef-parser

> +/**
> + * Semantic record of the IMM token, identifying an immediate constant
> + */
> +typedef struct HexImm {
> +    union {
> +        char id;            /**< Identifier of the immediate            =
     */
> +        uint64_t value;     /**< Immediate value (for VALUE type immedia=
tes) */

Most immediates are 32 bits.  Since you treat them as 64 bits, you end up w=
ith unnecessary extends and truncates in the TCG.

Here's an example from idef-generated-emitter.c
void emit_J2_jump(DisasContext *ctx, Insn *insn, Packet *pkt, int riV)
/* fIMMEXT(riV); (riV =3D riV & ~3); (PC =3D fREAD_PC()+riV);} */
{
int64_t qemu_tmp_0 =3D ~((int64_t)3ULL);
int32_t qemu_tmp_1 =3D riV & qemu_tmp_0;
riV =3D qemu_tmp_1;
TCGv_i32 tmp_0 =3D tcg_temp_local_new_i32();
tcg_gen_movi_i32(tmp_0, ctx->base.pc_next);
TCGv_i64 tmp_1 =3D tcg_temp_local_new_i64();
tcg_gen_ext_i32_i64(tmp_1, tmp_0);                                         =
 <- Don't need this extension
tcg_temp_free_i32(tmp_0);
TCGv_i64 tmp_2 =3D tcg_temp_local_new_i64();
tcg_gen_addi_i64(tmp_2, tmp_1, (int64_t)riV);                        <- Thi=
s should be 32 bits
tcg_temp_free_i64(tmp_1);
TCGv_i32 tmp_3 =3D tcg_temp_local_new_i32();
tcg_gen_trunc_i64_tl(tmp_3, tmp_2);                                        =
 <- Don't need this truncation
tcg_temp_free_i64(tmp_2);
gen_write_new_pc(tmp_3);
tcg_temp_free_i32(tmp_3);
}

> +        uint64_t index;     /**< Index of the immediate (for int temp va=
rs)  */
> +    };

