Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBE5354825
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 23:28:29 +0200 (CEST)
Received: from localhost ([::1]:44366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTWln-0002fS-MD
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 17:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lTWkJ-0002FI-Ow
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 17:26:55 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:33876)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lTWkF-0000Vz-LJ
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 17:26:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1617658011; x=1649194011;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=u81RbkNBbznEB4obmMNthXxUZTnfhwDAI6XuvzjCT2U=;
 b=rZgBplGS0+GjBRS9jLV4lOdRueTCw0EtXq13Te76vxvUZiDYrJskzFge
 +q9mT6pd6Y3CDYCPifEZH6W1yEbsufPjeZZGeCfS44UhQROqJow1ivThZ
 BijNOE2Rag0paVn446Q0OAqcUwAW/0dKT6TGuJm3CAE7ULh5+4HjTAke1 8=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 05 Apr 2021 14:26:43 -0700
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 05 Apr 2021 14:26:43 -0700
Received: from nasanexm03a.na.qualcomm.com (10.85.0.103) by
 nasanexm03e.na.qualcomm.com (10.85.0.48) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Apr 2021 14:26:43 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03a.na.qualcomm.com (10.85.0.103) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Mon, 5 Apr 2021 14:26:42 -0700
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB4230.namprd02.prod.outlook.com (2603:10b6:a02:f0::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Mon, 5 Apr
 2021 21:26:40 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::859:d735:9964:608]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::859:d735:9964:608%6]) with mapi id 15.20.3999.032; Mon, 5 Apr 2021
 21:26:40 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Alessandro Di Federico <ale.qemu@rev.ng>
Subject: RE: [PATCH v2 02/10] target/hexagon: import README for idef-parser
Thread-Topic: [PATCH v2 02/10] target/hexagon: import README for idef-parser
Thread-Index: AQHXC4mjuaOWuxsbB0iWwss/LlfwH6ppUFqAgBQhwzCADK6BAIAciuQg
Date: Mon, 5 Apr 2021 21:26:40 +0000
Message-ID: <BYAPR02MB4886DCA8AF99414D8F7D86FFDE779@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210225151856.3284701-1-ale.qemu@rev.ng>
 <20210225151856.3284701-3-ale.qemu@rev.ng>
 <3b3c6088-0ff2-beeb-e9fe-29c2dec012ca@linaro.org>
 <BYAPR02MB48867812389A9AE6031D7215DE919@BYAPR02MB4886.namprd02.prod.outlook.com>
 <20210318182636.17c75866@orange>
In-Reply-To: <20210318182636.17c75866@orange>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rev.ng; dkim=none (message not signed)
 header.d=none;rev.ng; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [2603:8080:2704:8f00:b0ec:f6d4:b80d:779d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5bd671ef-beb4-4d69-ccb9-08d8f87980a3
x-ms-traffictypediagnostic: BYAPR02MB4230:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB423095418AEDEBE8BA9F832EDE779@BYAPR02MB4230.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2Bp2mG7Xepcx/USeTctj4DZ2/eRIAkML/Z0CTgOaZRaSzOHfhUOIvE9LgvuTKyWRKyZp+ZsWP8GOMaAk5a9UtFoWN20DA4MSlTFFRaWdwlw5MyUyIlteRPY/d8PZYrDGXhjcOieTlA09pYtF7lxg2J0JLYaXK8xon+wa1OkKVOmYAXeeOxlWWBbH8bqOTjRPfPl8HSRJjotFl6IoKH4z0BggxRvjgv31D6IinkCQu2F1DjL1FteDFG50D19cBcD5icM4AKscAe9xUOtH2ymH16sICWhPF00hS/Hivm5vCZ1vnya70SFMGqLIVJ4Z/eAcgGl/SMnr9YZXK5i5V2vSDbDnjsjmHbyt59gRKXxHllT8hZ4TF0QGMido9bhIi5RvRN+PR4W66SPlol0rT+chjD4u7AJdVSFMtzwGoGBT8cSg23HazESr3S/p57cXuYC08pb0dZu5jG3C0gLG4APigEUw19pHckkR14KBxt0ZWZxyCQhtP1qgA0mEcuWal5VZ22eZD3EeTA78DK8MjoIqcwJIxNyZqQfZn1xwNiynbz+qzpDFW0AAlomBI3jCI+11Kviz5+1TTyjiOi7uj31QtF/lyNLyRsThA6T1R7AvX7zI4DDG6QL3Nd8hRcy/JvhUZfftsAE1VEPA0u79hPflr7VOzSkOIY8RC95999d8FvU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(86362001)(53546011)(55016002)(66476007)(6506007)(64756008)(9686003)(54906003)(76116006)(2906002)(83380400001)(8936002)(186003)(4326008)(66446008)(33656002)(8676002)(52536014)(38100700001)(316002)(478600001)(6916009)(7696005)(66946007)(66556008)(71200400001)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?WHgn7V0kwxqeGsFrBa+S1HQej++uN+mp5RjoP80PLDH2QIflmJFuyJonWzzO?=
 =?us-ascii?Q?umhcr54tDIkf5pLXIV/EAyMXfmQV4Y5xIHwKyzxbR+vCZKnSj3bHgYONttLp?=
 =?us-ascii?Q?OJT/OZDgaMEr67hka6d9EpXXB9LUfVKZVuacQ954vsPPo1hNHHbHerr2ujev?=
 =?us-ascii?Q?geriQFnnAw/yTE9bN3obFai/d4jjlNNeujqz1UMhf2oeVaskhqjaPRAxYGnW?=
 =?us-ascii?Q?VObVD4lqjNAIc0vjqTR3kooUSzIfUQ+JL4dLs/QnVCRetDY17s0r7aEmLBH6?=
 =?us-ascii?Q?AxC+bf/Li8vMnie7KRhBTjqi2jaPo1kmLUjqeHXUcfo+7T6brPu2yu6Cfj8g?=
 =?us-ascii?Q?n+vhXwvL+npyJmu6oyL2sAVWHtGUb35qJHSZeft/JUWRKI3okcDe7GXDrjwU?=
 =?us-ascii?Q?b7CUfa37NtKYyXZZ2zCXMZgyoFHfVFEWI2rti08edUZCUk5BdRz9FEP1SXjN?=
 =?us-ascii?Q?hPj/+/TxlWTfha5BE7XHo4ZRrG/XjF8sQ30LbslLfs2b7y8NuphmqtpXNYpP?=
 =?us-ascii?Q?cZeAfbFmmICMj+S2xeUyp7XRu5768YMwe7PgtseGUfRMROzgMK5uWEFuhcVZ?=
 =?us-ascii?Q?heO2ybqjBE34m4sAcuGItG0wer1ONRt7HCA3sQFfzvPGWNCBl5P9EemQTqMb?=
 =?us-ascii?Q?yeut4SLFeSjcu+j/kMV6PKpaNWD1+wGK3EWPIwBndLcPzszSp8vO4lRntb49?=
 =?us-ascii?Q?MroJfvAfy5XKxKZVdFt9XDEsR5l8D9MayzSzO6cnvVgpUWfV0b6/TmO/dcFV?=
 =?us-ascii?Q?8R6nY+oLcBrqvAqBWZQFmoSutB1ffafa8MkAWq/IH2BP34QFa42alTtiAH9I?=
 =?us-ascii?Q?+ZZBxYeGcU2BFA7cnphto+xQgX4A+3i02Ll2oZsyd7zHgRIOb3FMqaD7nRUn?=
 =?us-ascii?Q?IUXM55TpeE6fUHrnlx2ssE6nJBRJBYOpSsg3i+1EZjLzIO8RGAc6OZCYmKdX?=
 =?us-ascii?Q?9N8c6QqnorNUgrprfT6mSZriB8krawJeS2Lins5AsE+VxpAif9P9M6hqLu5a?=
 =?us-ascii?Q?F1IfyqdEUavGhxP1zHZ+g7OjTu7hlncMXam74+gOW6rT+qdnddt6QB+yDoDb?=
 =?us-ascii?Q?8/eitvlAeAZeo8FzY/5iZmoCpcf7HZ8Vg5Kgx8FSDDr7JlY70UPkB6em3cqD?=
 =?us-ascii?Q?xFrMknku4QzI73uTOqcqrKGRLR6Bf80Qel5TpJrStrdDP1qTgaYJoktDoNeb?=
 =?us-ascii?Q?Ly1chLjtqa+25j393Zpdf2OYibkgYu1TRyJoPH+6D6AhECxA9FbZMxYitfE0?=
 =?us-ascii?Q?msJILcP86Ij5TF6TQeXqsil9eYTa6oyGF4Qlvi4P6JfoljIOdnStZDtk7ADZ?=
 =?us-ascii?Q?T/ok4HIeKjmxr/3VsVqP6fl2Thol+AZv0eQGC4c9SdFRnpxdZrumJtiKsSxD?=
 =?us-ascii?Q?493Udw7oPLcsMNes2fZoKT9607l2?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vd5iKpJMk0X8YoShFVvplNW5i9KLTPXLkKhcI69LqXQPkz3ptMZUOtqgOtw6V6QfVFIrCui1LRJCLm3HGFYZSejK1+zxy78DV0UXwVHtUs88tq5njqr4u46c590DNVlxkQEEX6NV+qtBZkSjxKF7yxB2nohevqY1sNxMw2olcf52lYTeg+fHCzqHft3EYB0isd89sojQrLjFD8tqhXxf/9Up668X+NI/WwS5KdNevxVuZA6wzSFMtlv2nBVl6Ih35jHr1BcIIAYH29tJ4PFvwon2ojeVWfY98S2IhXBXByBsM2xNq9ZvBVxlOivUe7vOvoh82Gx/9yGvefurysVW0A==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xc0qQg/3HJtu74vxSNTRbFEllVCqERCzGZW+ERaxYdA=;
 b=eojeqipUkplZUDOXOQ9mxryO/WGdG89FveXovrl+xZDX5u2mBy4F4X1BJ7dzgMg/Jt++4wGDI0Z1Sqozycjq33aOFg5GhKUj3jRJA9fizjQ+ASZevFqpJzn3L1xVsw/lK1VopqycjSZuhhT3Di4e1GYic9X6eC8AVQfwVdpOl25qPlXL0H8ICVaniONVDTpjloDKsey8SAKDY2ClA14PNN+soN3x072WjkigS/xsOSk1xXy0LmxCh4vPJemi121TSXvSafbINwv0CCAp53mjrBBP4pgkPLTpwXpLr+NQ92iFX48ICqChSEiwTvzbYDxKMaXwgB0TTeA2e8rWUNSEyA==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 5bd671ef-beb4-4d69-ccb9-08d8f87980a3
x-ms-exchange-crosstenant-originalarrivaltime: 05 Apr 2021 21:26:40.4495 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: u4kyfE1rbWA32ERP85EqNQLAzi4tWmXUG2E7mOATDZ1DoVrH8SNKqDezL5J8KFK3yktLUrJ2qviQIXUgzHAMWA==
x-ms-exchange-transport-crosstenantheadersstamped: BYAPR02MB4230
x-originatororg: quicinc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=199.106.114.39; envelope-from=tsimpson@quicinc.com;
 helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Brian Cain <bcain@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "babush@rev.ng" <babush@rev.ng>, "nizzo@rev.ng" <nizzo@rev.ng>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Alessandro Di Federico <ale.qemu@rev.ng>
> Sent: Thursday, March 18, 2021 12:27 PM
> To: Taylor Simpson <tsimpson@quicinc.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>; qemu-
> devel@nongnu.org; Brian Cain <bcain@quicinc.com>; babush@rev.ng;
> nizzo@rev.ng; philmd@redhat.com
> Subject: Re: [PATCH v2 02/10] target/hexagon: import README for idef-
> parser
>
> On Wed, 10 Mar 2021 15:48:14 +0000
> Taylor Simpson <tsimpson@quicinc.com> wrote:
>
> > Which instructions require this?  There must be an attribute that we
> > could check to see if it is needed before emitting the TCG.
>
> The following should be an example of an instruction that requires
> zero-initialization:
>
>     /* S2_vsplatrh */
>     void emit_S2_vsplatrh(DisasContext *ctx, Insn *insn, Packet *pkt,
>                           TCGv_i64 RddV, TCGv_i32 RsV)
>     /*  for (i=3D0;i<4;i++) { fSETHALF(i,RddV, fGETHALF(0,RsV)); } } */
>     {
>       tcg_gen_movi_i64(RddV, 0);
>       for (int i =3D ((int64_t)0ULL); i < ((int64_t)4ULL); i++) {
>         TCGv_i32 tmp_0 =3D tcg_temp_new_i32();
>         tcg_gen_sextract_i32(tmp_0, RsV, ((int64_t)0ULL) * 16, 16);
>         TCGv_i64 tmp_1 =3D tcg_temp_new_i64();
>         tcg_gen_ext_i32_i64(tmp_1, tmp_0);
>         tcg_temp_free_i32(tmp_0);
>         tcg_gen_deposit_i64(RddV, RddV, tmp_1, i * 16, 16);
>         tcg_temp_free_i64(tmp_1);
>       }
>     }
>
> If we don't zero-initialize RddV, the deposit instruction will read
> uninitialized data.
>
> Note that, IIRC, `RddV` is not always a global variable, which could be
> safely read, but it might be an uninitialized TCGv that will be
> written to the CPU state in the commit phase.

Correct, in fact you should assume it is *always* uninitialized.

For instructions like vsplatrh, the original C semantics are OK because all=
 parts of the result are eventually written.  So, you could detect this in =
the parser or manually add an attribute.  If you want to add an attribute:
1) add a line to attribs_def.h.inc
2) Figure out which macros lead to a problem and add them to calculate_attr=
ibs in hex_common.py


Thanks,
Taylor


