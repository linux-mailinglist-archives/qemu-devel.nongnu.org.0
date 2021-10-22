Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 225A0437C3F
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 19:49:54 +0200 (CEST)
Received: from localhost ([::1]:41084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdyfx-0005Y0-5J
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 13:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdyQz-0004Zz-HH
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 13:34:25 -0400
Received: from mail-eopbgr820131.outbound.protection.outlook.com
 ([40.107.82.131]:33131 helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdyQx-00072E-Jw
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 13:34:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KJbExQFiIYzPMwtiFq3caCeT3vbdlEb1/OyRTHItcZhdqGlo7WPtH1PzhgvdzeonUIQZB7A40VokMiD3+cOBKbxE39GNWwNsP1Gr3NljMm+B2zUf2MZETzEaBhRs6EAAkEoAyeMk9noE+bhzFkxqPS0QY0fRR3zTKdl0Zf0qYzIfzip8O0NsHsq0irSqPEdTjQK19/2aV87I3fjKPc/oBkxoAKTULAaq93OwImBQUB3IPvFwx88INw8KgS+Dpt/vOQ2QQmrbGFxnAHwUV6sokPI823Vxi+tEp2ok8nJ3DhiDEKI38MpABD9F47X7daCvC7a8Dcbm13WaDoNx9rY6gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VdlV/ho8ukL0GnPqMpPfefvlpJHK5s/V2vU1essmpHM=;
 b=Xa69UnRaphIvXx9PVzM2t6oCxACwG7j5bt2yU9QRj7MVau3XNgWo47tN180PB0KzlkuE/PKChFVzcaixe/GNquTLaWlwCC22o+FWJ7N8DNwyQsXC79i2hUVvE3v5qNZzJxIfiQfF8DY9d6ntDtRu+humZKPR3itw+y5IG6IcvkwehaGtT75XKPOt8yE7p11VnDg+YDP48WhYGHfFWC1cyMlkyNtiWH2yR2PFAWwOhLIdMn2/vXazhkDiwNXfmhrEx+vBqnsvtOszSeQYbiLfSTXAX6CpnAm8vGC32Ff4yWUv8BRkFdnXwxgedblhgPvF+MY9c2Y1VTY+3jgqun9gNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VdlV/ho8ukL0GnPqMpPfefvlpJHK5s/V2vU1essmpHM=;
 b=qlvkyua/TpKhtHj4Af6Dnv9WkKbcyUC/qBSZcTW/z3P8qg87Z2JzSY2Y89KPBwq0+3BvV6f2CHxD169KTRYZ6oSZQ4VZo6+8K1KgTT3ed7xwZ6P16/aMoXxSR28kmLZLnpUwfLECoRHvtWqxI8cc1zz0OAM4tFrgsNtBxXlRgaCOlslXjK5td7tY1mO1DAQcnuHDClCOGwdaBqopGWCaPanYhnRnUOYGUplreTZWV0rjjejvpY32Ag5a+jgaU9Jzs+tiHlsTcaijU31XCuztSPaWuwBdTgqbmh87vcjhmozHTd7FKzDXPiVs32mpdojxClWWCzDJMFmBF3RuXhKC4Q==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB3924.lamprd80.prod.outlook.com (2603:10d6:102:38::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Fri, 22 Oct
 2021 17:34:20 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 17:34:20 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 22/48] tcg/optimize: Split out fold_movcond
Thread-Topic: [PATCH v3 22/48] tcg/optimize: Split out fold_movcond
Thread-Index: AQHXxr92gn6LE6ihO0iAAamNgNEptqvfSImA
Date: Fri, 22 Oct 2021 17:34:20 +0000
Message-ID: <CPXPR80MB5224F42D9DECB4FC88B454B0DA809@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-23-richard.henderson@linaro.org>
In-Reply-To: <20211021210539.825582-23-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 283d1d45-3c44-4316-2b89-08d995822e82
x-ms-traffictypediagnostic: CP2PR80MB3924:
x-microsoft-antispam-prvs: <CP2PR80MB392443D7282DB39FC1E05793DA809@CP2PR80MB3924.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:400;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nGRRETM0QnvV8hJcAtmMQm6AfqXLgP+1c4t9Nmu3yJjVQpFb7+qB8BTtQmyMKZo4n+8Gjh9zGGcuj+Hto5SMkqW62BEXJhKR7RsN+eHHksCdfJFxWCKBiH1guBrXywTT2xADvkYo2YglALsSfpSud9WslZeTSjB/lEnmWmPDjmyeKAFL8V+GRfjI9L5olirfrCrIHS1WR17+RTK6G+XikVTV3hxchITD0nf1q76Rsy/pakv9NBIPtl3SUCeAklg3ByPgs7E1NRtBzbONHhAZUCr+3CBavKnovCi9/LZ62jT5yfXptSBIivPYY+E5DCRETYnYXqX6bszusiq6P66oku8Cnv/P5GqpXBlgJKLqnyYoT6FAKVwU7L98s7DMYbJ4Wks7aAhrMNkjtjlQIAvqsPvCUsRZSFolJaCIj/4MJI+LYX9HftVP4OdO2g2pe+t/uoG7Q3Igta1aQfwu28BjhG+TE4+gXtkLIU2J9Tw66e20Aha2U3oVtkeVMYWeSufCmlg+NgSfyMo9wd+4wNb7rci34gJFLb2el3h3Qkjluia+AHx5rFinDqZOADB1hnsrRxpCt5YRNf9zzRguBHthLRYtvyIlIfMknjovm+upDCNBBiyx2Y1OlBF3d6r0w3p+/awZKp79pqkxyZDu6q7Q0nCJo24/4/J8I6hBtvFVVYDE4Hk9ceTBvSuM4YH2TIqjZRgbFBvmm1glZM9fczsb4UNt5CC7RwmEJKkpkntl2JWy3xcY8AbueT2acBAf49uqGKjBM/qATOu3CKXix/alFRwaH2TjxYQX0JuP2US3Wkg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38070700005)(4326008)(186003)(66476007)(52536014)(66556008)(66446008)(316002)(71200400001)(9686003)(33656002)(86362001)(83380400001)(64756008)(76116006)(55016002)(8936002)(5660300002)(2906002)(110136005)(38100700002)(66946007)(26005)(6506007)(558084003)(122000001)(508600001)(8676002)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?W0Y3zgU+BFXI3FZUx2rMmRKt2GDG8RpSmDI/0O/uAfQcsJtJuXH2bozhLKVs?=
 =?us-ascii?Q?EyKSXussFo7ss7brj9Z+XGfuewLgaLcfsvPfsWsZvdU9uux2L1cnfP+kBFcG?=
 =?us-ascii?Q?XoDp7wQ+mNGPHDVAerI9X2DGJEYgUq4ubqJTvWhX8GpawduYUs6nc2XWvUXm?=
 =?us-ascii?Q?PHMEH2M4hkq0njb1/PB6aLBprHCtwiDp286pWXpAXnef8W1alEDX5nWT9TiC?=
 =?us-ascii?Q?Nkl7D18C9TevIiEbniz/dE4ruOdoa0NNopiP+Ao6VIZQpz0/X+P/F8zPhqG1?=
 =?us-ascii?Q?/acdZU91lSFawobYQkWgYs5TBCQfqV5hboEQwJ/oytGjWeY1QrjE+dDSwmFv?=
 =?us-ascii?Q?eV9L/jrf313kXLoEyJYA6F8sVfJmX5dezGuyneYyxL7o4viZndF7mASgFA1S?=
 =?us-ascii?Q?oITtn2Mul5Ez0atpn30luoc0GOE729sYTclwqB4FdH/EnJSDEsT7UraJLKva?=
 =?us-ascii?Q?roJAv5wFqfW+cp6VbQuQz4hZETaRPgOPV19n5E/Rgwm5rpFk5ViBPP5jHiem?=
 =?us-ascii?Q?PY+Vhsiwi+Gwc238CIC65EcGdlLD+tH8o1PN9wgeyXywVxarwpidMxV6EjZc?=
 =?us-ascii?Q?tYRJeoOnyXws1Q/y0Y0XT+jAg27iZwKrcD+dlC3ncYUGETAFdsr/IutKM4AH?=
 =?us-ascii?Q?fcsfgpkLCIMoCsQJQ4txgBwVTRwYmJFiiAIB+c/AmhmYLLgJHuYemAmMSNbN?=
 =?us-ascii?Q?KyG1yHo0qfje64fvlRAuCt9rFcR/qSujAVW5u0ByHByoJJywb/E32607XIju?=
 =?us-ascii?Q?k5BJu9FXUDHtskBKLL0cYciBdkqujv50QWN8rlWQ7nmDwwwFTfSw6vmCD3/b?=
 =?us-ascii?Q?Xr4d/IVXukVjAEwKNPASwXlc0rrrYeA+J+dfxEcWhoFAS083dStIo6HL8jBE?=
 =?us-ascii?Q?3+2AjjOOtJTGZZWiUSMjA4p9H5l2GjG78F9Yk6aYSiDtlbOnZWY7XTcQdCp5?=
 =?us-ascii?Q?27ySDZDZG9u5IQeihTY+0yYF3Su0FbXulewOrBnmdq/GEiZ6AcLd4qzD7RuT?=
 =?us-ascii?Q?DtIRIAQnKvKexFlV/DMF1ClCmMQVZnIpbHaAL9SottiPI32D/m1yO0/SVENw?=
 =?us-ascii?Q?LS9o9foKwdpfEpSI3Xzz0JA3+mwS3N4b3r0LnzGVHMblnhCg0+/gHJ3eFjE3?=
 =?us-ascii?Q?LKQyqYkYKKKLIsOcFaUj2c5lMDmrbpb9yPP86MIVzz5N2k3oee3Ud7ddp7Ng?=
 =?us-ascii?Q?ecAfipn75EJnEG8/4Xglg7mA5tSFBlLMhUKhZEyDHanp85s+/s0t9qWhOkHK?=
 =?us-ascii?Q?CgSNbCssK6dQxrOlQFZEteZoV+7fZt5wo8MAC5X71K0F0jfcQJZDqweT+3Im?=
 =?us-ascii?Q?Wh+xGOH9cVVuZaniGbhIIjI0UCUofCLdm4DgOfkFXHpcnSqBIEEM0MIiw9YK?=
 =?us-ascii?Q?3FlEw/szxXa4szrtOvkaKmZzktELeoaDZelPNxeB6egTl+y4vQEP2NA9InXy?=
 =?us-ascii?Q?CCQ4YxJ6QOU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 283d1d45-3c44-4316-2b89-08d995822e82
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2021 17:34:20.7476 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjxb48@eldorado.org.br
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB3924
Received-SPF: pass client-ip=40.107.82.131;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM01-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_05=-0.5, DKIM_SIGNED=0.1,
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
Cc: "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 56 ++++++++++++++++++++++++++++----------------------
>  1 file changed, 31 insertions(+), 25 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

