Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6A037159D
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 15:03:03 +0200 (CEST)
Received: from localhost ([::1]:43720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldYE2-0006iB-Ma
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 09:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1ldY9U-0004QJ-DU; Mon, 03 May 2021 08:58:20 -0400
Received: from mail-eopbgr800114.outbound.protection.outlook.com
 ([40.107.80.114]:41824 helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1ldY9R-0007fi-IT; Mon, 03 May 2021 08:58:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mRVp6MGBVj75OqGwJEyxE8zlfAmiTOZq4ezG6exTg2iSLaw3fkvDKS4oOP/g98VX+axZpq8fe9BZeVBg0VdlEYts0eYYNLaWaLBjcQPIIGpMmKnYd2K33SZ+et39ehBKmWBTVB/AfIIwEDIObyeeWO+kCK6xiaSrzZLYwjX96YyTeCcZ43pkjPJ2LIIgKSwVzSP2RMUlcS4NuR1suS8ASvcJhYmjVFXTMeTP/+QcyJkRjd0GIoyu+/6Q4tPCpukFfTpek6se3fzv8+SPJhELSpFPbwB3MGSwEQ07khrpp4WdY7LAn//VUdWZ90lwFOkeS9mKjC7cYpS/cdPyBxKYiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXxS0JI6EM0w0nbFMMBXqcN7U8XIzK0RMPn2NEr4eMM=;
 b=TUMJx4gIywmR2ZbjKEPvv283T40pH5PD8jRPVL2q3kL5EEd/EAnwUGiM5GcAQmAS60sMUllua355Bvnb7TnM/dU+bjodkZ3t9/+7750A0CeGh8I7QvVat3C13uymH51RZH+NlvDve01xyO+7QkZnZO+70cZ7dN/0RyMgerdRdiZJD6GyL9FDP0diCH7OgbTsjsOoymZ+r4WUC2aa15tQTnlYiVl6VCBrOWFYyjRl2qSXCkgkGFp5U5hVRyjNedQeqf8J1SK7abAg2Kq/2ty0WJsvuLc7/7agre7g6Huqli3peHI/R5A+T3+qBk6kBCcfboSTPT8mmIuV+obf6MBacg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXxS0JI6EM0w0nbFMMBXqcN7U8XIzK0RMPn2NEr4eMM=;
 b=YI/ZZ2K2ABxpxS604G8pita5h3XGoVtufn0BLHu8luekuLQNbaNElxvLm+nKJZYpFdkKlA4a7Iy/uUauMRSF0GUacVQXlQsXPYjI0FCjuBCF5xNkHW9ejouUwUlGcP9Qo20wzBHGwELT3dVsgOvQmlLYehncaqXf54Aul4w2oOqsTaT0qkloWmiZgMHYy/sbt0POVQe8xqpgjDQnNMfFj2aEXXBXNAZSgL114k99pAiPP1LFGanrQ54EPhq8iaNTKCWmkSNDruz0t73sFePqN9Z2LUPTIEI3asXyw967N1/UDtBVaSrTvgFAYIwb+baCCwlsRC/xl3/Z6dD6vjd8kQ==
Received: from FR1PR80MB3670.lamprd80.prod.outlook.com (2603:10d6:202:25::14)
 by FR1PR80MB4535.lamprd80.prod.outlook.com (2603:10d6:202:33::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.26; Mon, 3 May
 2021 12:58:11 +0000
Received: from FR1PR80MB3670.lamprd80.prod.outlook.com
 ([fe80::2c95:a735:2e00:5ee6]) by FR1PR80MB3670.lamprd80.prod.outlook.com
 ([fe80::2c95:a735:2e00:5ee6%6]) with mapi id 15.20.4087.043; Mon, 3 May 2021
 12:58:10 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 07/30] target/ppc: Move DISAS_NORETURN setting into
 gen_exception*
Thread-Topic: [PATCH v3 07/30] target/ppc: Move DISAS_NORETURN setting into
 gen_exception*
Thread-Index: AQHXPV5dXrzRa1ua+0SfshrgHyTu8qrRvOlw
Date: Mon, 3 May 2021 12:58:10 +0000
Message-ID: <FR1PR80MB3670E8F27AB6B1BBF1AF3153DA5B9@FR1PR80MB3670.lamprd80.prod.outlook.com>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
 <20210430011543.1017113-8-richard.henderson@linaro.org>
In-Reply-To: <20210430011543.1017113-8-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [191.205.120.173]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d6012b07-2c21-47bf-7225-08d90e331b12
x-ms-traffictypediagnostic: FR1PR80MB4535:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <FR1PR80MB453509F54B14C6641DE8203DDA5B9@FR1PR80MB4535.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qlhkiz+P+kDdiJsKQLw7H6vhL2fVeAi2Ylltlnztu4NGAdl/f+xKeQ0GfhMWiOX+mHyEpZzEB4ee5onU8hxEG/Sfzok9fa6zAPmLytX/Y2ic6BrDn4T6KG3RkKm9grl0s0zQAC4hfhcTDmEMQZ4NVF99v/7Aed5jl/E9EiRpKZWl/TBS0Qn9vTu20ruB0p9Avr07h8/pHFbvzUKQAGJIoSFSt7s9Dz3TJ2cGxurhtSe2vs7BJmfMAGjYaKBbOGjZBmFcLjZ/f+PyuPq+pt3md9VhZiU6E9dmI12ZwsE27FtAgtfis5MIf4YkiGAlPLRVMVN+DSL/4Qp3LpXUAuSDd/z+OusXyutx4IeI/Xh1BRd+i16Gi1f07qOG+5mSBW0x1jg+3+wc40IC6OKWfffk2X1iLfLx1n2Eqkt81LWU3YrjweC9h6bIt4bdFUiZtCp0wP7GfsVALqJ9HW2nGMhDCsiiXIBCgxVuKh3ET+uMsYFSB5dOjL6Gkp2mquFFAIDkjGGdTZoEVYX15PrCxY37LddmX1HtYrOt1KU4eE+4/kFLST833qxanvWEBPHd8lHyw9zg2wvsZ0Zn6+xKmZ1TWaBgQ8TpkJkXhnMW5UuBTAo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:FR1PR80MB3670.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(366004)(39840400004)(376002)(136003)(52536014)(2906002)(76116006)(66946007)(66476007)(6506007)(26005)(122000001)(66556008)(4326008)(55016002)(110136005)(54906003)(66446008)(5660300002)(64756008)(478600001)(7696005)(33656002)(38100700002)(8676002)(8936002)(9686003)(186003)(4744005)(316002)(83380400001)(86362001)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?5bEKV3dhSkgmO3HA7EMR3zLT7xiWa2W+vSVF7I3SiT9yJ9yOj0vmrKss+9lp?=
 =?us-ascii?Q?dIdBhqtkbzXO+4saDGNkSEUvmMT2Ob46zJekAi4wICamQs+ZRAzKXd2GsK+N?=
 =?us-ascii?Q?chPIhJ+FkjPbW2DDWJKcNQcGtr4CXk5p+ClZRufa6Q3lZR8OjxfiFQmJNZuL?=
 =?us-ascii?Q?paqbu2HbZSQ+hBIacwJq1V5KyrrVPnDe98LIJDrLc6dlFLO/derosx/J+O0U?=
 =?us-ascii?Q?iuR6ReTRc4QCT6XRjzzZsjkGjgZht9P3Mx1ZsN841Ltde559HL2RmMCdJ3AE?=
 =?us-ascii?Q?Ss10o+FVZ5XBqxAyvdyK7YzpjV6APPm1LmZL2Ml9VRkrexZfAdXfIhU/mtXj?=
 =?us-ascii?Q?6CahWlGUgxHsyvXVRvQeEb9R7CQsmcfo1DgKWCAuvQKcNqhO+UwPkdsY3UM9?=
 =?us-ascii?Q?mpSoG18r7lUptsmokNi92wpe3v2i2KI/D4V0YPdCMudazxItOr464Dkdsb4C?=
 =?us-ascii?Q?BG/lcrQKe9KZxROyKTd+Gzn73cbFM+t8BoZ/fNqZEtfi941Mg0f7xmijmxJ5?=
 =?us-ascii?Q?hgg8cW1kbYni3mMQb5JwIkX9rCC93nzRQpNLVl8mGSQS3zIv1dzoB4cJg9+9?=
 =?us-ascii?Q?iD6vuL68iA4AcBPmgdXoqCoRQKexoe0QDMrGldWOCrjeWZYR4JEiFtP8MTF8?=
 =?us-ascii?Q?lW3V2qNnmxk2rU69ySi5WEgYfg1rWL/NT8yT/GforS7wnF+L0UjanUfgowMl?=
 =?us-ascii?Q?0ZbClnufV4gwqoztmYPIoajMtT6JtgWEET2tYZzDmNjl223gF7sC4+XgwFHc?=
 =?us-ascii?Q?u5DynVstKXSZHa8DGwomWdtHycLVw7XnIjrCL+5JTwTTX4HSaLYJQ4WI6EYI?=
 =?us-ascii?Q?SrHG29FK3Crb+duN6n6Xf14jVJT1I1QbR5VexQKStbht1e65lOMdgmfmKKUL?=
 =?us-ascii?Q?06UXWPXrtgFcB54rzdef1uaoFQVKauAPlFAZsHlovS+Xr0SBql8ZpJ9ZxQBy?=
 =?us-ascii?Q?uuuTGxF9u0GPuoaJ5YaunhFC9jEVpRBpem2nfCLjsRZW45ZaMI/9sUm1OuRZ?=
 =?us-ascii?Q?85uOqVcepvVlYbwgoIGTNTD31iulmeLcPC2Ur0GzM/L5wjmjBe1KWFGfNMlq?=
 =?us-ascii?Q?pilGyt4H1x1o1k9J3V4xgVnX2x4vVrHY2gus4cwA55dHPU3fUaBQLlubCXBg?=
 =?us-ascii?Q?kkG9BGCD6E96U6SiUaxMWn6RWRRCsoxx3CaBYTjPADLLRtSajeoo6lLmAiWm?=
 =?us-ascii?Q?/nID4F5Yt38U9wKzCZyh8sdxC4ExC5piJKGn2j68GgRgPth/YOqv4jjNJjGx?=
 =?us-ascii?Q?eTKSWxUV+TS80yhssJQMpNtq1Jw4wpxjY+e/C5ttL6zKcFlwLGXgTY8ddYwS?=
 =?us-ascii?Q?yUlF8Ur1Xrtxh3F2h56+Mv2n?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR1PR80MB3670.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6012b07-2c21-47bf-7225-08d90e331b12
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2021 12:58:10.9506 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xj7eoRxRhNZH5CVP1OI8GUWAd2K5n1+yIuB2lg5UKp9Gdla8aKMfFhJwsc/nM0CA4YC/VPwsWlxS7qgZd9QTeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR1PR80MB4535
Received-SPF: pass client-ip=40.107.80.114;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM03-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
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
Cc: "f4bug@amsat.org" <f4bug@amsat.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "lagarcia@br.ibm.com" <lagarcia@br.ibm.com>,
 Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>
> There are other valid settings for is_jmp besides DISAS_NEXT and
> DISAS_NORETURN, so eliminating that dichotomy from ppc_tr_translate_insn =
is
> helpful.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v3: Retain an exit from translator loop for ctx->exception.
>     Do not emit code for single-step or ppc_tr_tb_stop for NORETURN.
> ---
>  target/ppc/translate.c | 26 ++++++++++++++++++--------
>  1 file changed, 18 insertions(+), 8 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>


