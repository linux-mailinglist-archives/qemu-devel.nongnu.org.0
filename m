Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 328D54355FF
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 00:40:38 +0200 (CEST)
Received: from localhost ([::1]:43420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdKGD-0008Jb-7P
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 18:40:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdK3o-0002kD-R6
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:27:48 -0400
Received: from mail-dm3nam07on2096.outbound.protection.outlook.com
 ([40.107.95.96]:15009 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdK3j-0006yZ-Gz
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:27:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gBOEPyKLhmUHcQb7xXLaO428TgEKLa3egcTq4VsnP2ke0kdCSL4GHlD65JWoyPInH7Ylzz4JFTZEnFfrcY5aQek/2ZpEW7ALhHHfKd3ZfOyLtZja0aYmCRqtTZ7UGEwK56xu1XHm2+3Ip5QBKmD19kkAP7C/8poiwdILyKTYU3V9bhNxQ/+VvwpqTUFyMxBFdmj9+6HKvCi5ImLRedOcNzrfij8ucx6VY598voJ6Hl/vvZ4ifOlcILhq1dQvg1S+RXGLdu++dB/2YXRzCtDYPRpvfc+M6P4UEtx96Dg+VZX/bKzsAiZ0oKL3CmJcKdetJCMrvsDHKFCzGhguh1hqpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c48du524aVwe5Hzz5kPZ2EwMavUojf6BpiuWSdelgWE=;
 b=l27bgaDgQiy1tkJ4T5KYRCK7Mar1yICiscqW0eOChV7J73Trj7KWuL5qYHKEeJZ4A+oBtGcuxsYnr+9+O4eY4raI/vd2nQcSc3d3tUpbwyWsSOrspZvLv9vEJORgoPaFEJpgDMuSAi7BawW1CDCqqyWsgBptD3oHYpCiuR1kcVRUIUeAK/Skjf/J1yr3+rmZaorXGLu4yaJMnph/RJh7HuTk7vSUlfJvTNtS6DZs+NsByN0eCEujBhTRqKgqiTVVsYL2jA2RjRdxIZMmbwDzoCESS2k7QgYFx4sOrvNxNQX0/YiCyE7XlRsOBKYOni1Gsm3QzPWA7PRrx4EiBzHubg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c48du524aVwe5Hzz5kPZ2EwMavUojf6BpiuWSdelgWE=;
 b=J+5iM7IKYSu2EcPLN7fVQi65oaYVsHDsL7HuoZJdUKjeLmSbuVX1U+IWToJTan8GoPBMICScvqrQ+LI9Y32fgJXWwnyeCIzC4WXOXixAg8py8H6EFU+hw6RrtmPsGKGgv783qmJXz1XHDudodXJSD2sqSLMNpfCUWBHVQE+uSaqYjBeMDpB8HvLa/1NW+wLHIY4bHLYMGeGgIk9G+OEXIPI4CIUDiHvA22JITpPAJZ7zrcHY2PeW1erSc+cZxxgnRY3/awb3NpRIT2VDtoW+Ol1O5+1TvR6mZa+dYXX7PSBBpJQ089iVeXhZ6qtgE1H9MsqEFp8eZp+CXNQMRJ3GAA==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP0PR80MB5315.lamprd80.prod.outlook.com (2603:10d6:103:58::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Wed, 20 Oct
 2021 22:27:40 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4608.019; Wed, 20 Oct 2021
 22:27:40 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 16/48] tcg/optimize: Split out fold_setcond2
Thread-Topic: [PATCH v2 16/48] tcg/optimize: Split out fold_setcond2
Thread-Index: AQHXu7cFLCw6F7YMd0KX07Dv7nhsh6vch8eg
Date: Wed, 20 Oct 2021 22:27:40 +0000
Message-ID: <CPXPR80MB5224F819305AEBAEA5CB180FDABE9@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
 <20211007195456.1168070-17-richard.henderson@linaro.org>
In-Reply-To: <20211007195456.1168070-17-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 436249c4-42d8-41bd-99b1-08d99418d429
x-ms-traffictypediagnostic: CP0PR80MB5315:
x-microsoft-antispam-prvs: <CP0PR80MB531538A31B89E277B762BFF2DABE9@CP0PR80MB5315.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u8gYmYLZv4Lj6BnksUGtoxi00i2PAIiQpnLru5X9nUgOB35ZgtrbM29o7KiDah0/S2SPLYMJrf90i0Ie7xd/PKY7D0YkTi6KsvOLntf+yTh9v6BMFQUfq24h/osHJhswGz7I5wUhy0EZ/qIzH1M4VaOZC7fwHOtOyUEmF5yeNoZYr18mwTKFixtTZ5Gznk+/aT0yzJrAc65ATkWWtmNubYLJJpTzmWZgq6oTN7b2+SBvH921hPHGYpcTVvud6H2LPYq6Y2w8GGuOCREfZ3BLDiJdpN5m7bQJYsPe+he4hso22ZChgL4GHARv2m82WxjivwumSsVYpuZ2vuww2OHVAAXPLwM8fBX9JS3Ak1N82qf34okg5bAESkOwKwofaD1Ako9BC8+yyEHAuL2lfp+8WOcTUoGIMsZAYaa26qoMej2O9qmOL4//V5k7I1kfFdTdePMCJbeREJ7IN9dJnm5Adck4qPrfxLNm1MxZmx8yO0GB3ExOhq4/qh1dP/TFP2r6f1+NRQ8pVrv7337wMRGU8FyYglONdaNBo/5vRKePltf4vvO1uRznXW9LKooe25fuf654c+3rtRKHYx87GXOAKnoHi1zDT2GxxYsV69BKqPY4l90AYioZCFNil5GxPETwaAZvUQ2/XRAnEFN7oAcF9GPjTN5NmReY9aTIVGXLxe+QzhfV0U8Rsp4HXXyi5yobfvQDAbD8D+Yx8qksQ7RiOnNN6yceLu+Ls5cmiAkPXXhCVFOO6svDlzZ6VJNKxXUUknwNEOTUbqKGf3CqE0NOOq0CiQ7MjlQyjWhmn+vKMGg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6506007)(8676002)(86362001)(7696005)(71200400001)(2906002)(5660300002)(8936002)(38070700005)(38100700002)(4744005)(83380400001)(52536014)(26005)(316002)(33656002)(508600001)(186003)(9686003)(66946007)(122000001)(66556008)(55016002)(76116006)(110136005)(66476007)(64756008)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CkyZlSabtCFuHFgVzuFJTIQLrS74lKkl5vC9ywRtEdBCUzfeFoTx+Oag73rN?=
 =?us-ascii?Q?BOludZ6cAKKcO8e+wdQn4tvh/LWE6BZoszXnMdYbNhMDCmMpKPzXjUJ0tTvj?=
 =?us-ascii?Q?T1OZUPteR+6QnoRlIJbboAHYgi+gtFxGWz9xuNSRylwiqgZB+lYFqmhuhjqT?=
 =?us-ascii?Q?RMv6OX402qvmWdHMqyPWvpepsxhL7QTYs5A1UnLwuIdPXyprCoISBYfw0j+s?=
 =?us-ascii?Q?LmEKIYX42/Yw5Q9jzmXnWmc3MXw77AGhyF/G5WcMsu9YVDkyhxaLW9RgPP6Y?=
 =?us-ascii?Q?8x6qryfHDh7p+Xg5aqS9/qniF5+0kd/4L4TbDd6hXDLVJG8EQiDC1B4EIBPL?=
 =?us-ascii?Q?ooLo4dJSneNkW2R5Xn5ejcRbQEtquRKkU5JCHzEcFL4dhXtVw0N5Drp3qawl?=
 =?us-ascii?Q?17G5gL9wBUY9+RmQnLovnKAMjflYn0yZGvh2Wcm9T+YLflZbdjpDSFZ4Jb3M?=
 =?us-ascii?Q?/T5qv9wrtGGo+j+QU6RM+dxk4S8tnw8PM4KJlRf5e6AbbIwWd5wJb2Hsx9jr?=
 =?us-ascii?Q?PKnMNAV9cygDMzIn5+k1c35nnlwnCZ1Ox2rA73tXq5CLAgc30pK4coU8SmVz?=
 =?us-ascii?Q?Rs3ycXGQ7+b54nsjXDOmBcZ2sjo8aWFQtS7eIXUaklhJf/J6SYLG/Gyzdn4X?=
 =?us-ascii?Q?VahKGzr2wStuD3sFEPRBLhBjIGC2GGWoHo2R7h2DBI8ePa+6kysxbMXSVopq?=
 =?us-ascii?Q?wBOeqYvoFLlKqBRctscLWbcwyeNYv4jqJ/TpDW3b5F4vZd103LD5QP6vItrF?=
 =?us-ascii?Q?Cx0/21aY/VbXkACe0hvT+F1VeMRr6yidtyM1hrEPIvWlLBJKIH9BY5IX873A?=
 =?us-ascii?Q?iPFJmYOMPJG4tRZ0khCviFYUyG1QNUf0vaHJFAQmzKfkbH1I1Jb0fsKjermW?=
 =?us-ascii?Q?bp5WFt7CecTYwmLMvW/F2ULAwDpDhJOqCHnc75NmS5ue6Xu8aJYrTe7ns4Ph?=
 =?us-ascii?Q?IOP3hQu7djyhf+HVXGG0UhHM+yv5s+oGfM7Yotna9chuTvhCwTJKI4I9Bip4?=
 =?us-ascii?Q?1Zx83D9PvntjvItMdYKIgEL2WOVZi/9C5QtIcddvthIstE1VfNi1FCxRlMAX?=
 =?us-ascii?Q?apQv/BTztZbvaYrlVcIaMUq0BgRGZYvQEK4d5ZoUQbjVSgBA2doO972xm09/?=
 =?us-ascii?Q?vXZG83aUtGJCXfc5YRx9/nxcrCA3gsan0zmjsAIby8O/U5eEvCp5QrmUycMA?=
 =?us-ascii?Q?6i1e6MRxb2jqSPTu8cc/UqgPp69Ay2MYlPyZPlcwZdCMJ8ls452372kPbQ1V?=
 =?us-ascii?Q?lkRYDEOB91y5iSV5x9xBvrVSM3u1iz7KLX0ZVzrXynITuV6aMA1AZcPekT81?=
 =?us-ascii?Q?lpcWbw/jRDMizSYvAild/n0X?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 436249c4-42d8-41bd-99b1-08d99418d429
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2021 22:27:40.7518 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjxb48@eldorado.org.br
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP0PR80MB5315
Received-SPF: pass client-ip=40.107.95.96;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_40=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

From: Richard Henderson <richard.henderson@linaro.org>
> Reduce some code duplication by folding the NE and EQ cases.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 145 ++++++++++++++++++++++++-------------------------
>  1 file changed, 72 insertions(+), 73 deletions(-)

> -                i =3D do_constant_folding_cond(INDEX_op_setcond_i32,
> -                                             op->args[2], op->args[4],
> -                                             TCG_COND_EQ);
> -                if (i =3D=3D 0) {
> -                    goto do_setcond_high;
                ^^^^^^^^^
> -                } else if (i < 0) {
> -                    break;
> -                }

I'll just note that the goto in the old code above is wrong - it should be =
a goto to do_setcond_const. But you fixed that in your new implementation.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

