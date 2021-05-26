Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D553A392266
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 23:59:00 +0200 (CEST)
Received: from localhost ([::1]:48008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm1YJ-0005ma-UR
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 17:59:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lm1Bj-0003CW-0i; Wed, 26 May 2021 17:35:39 -0400
Received: from mail-eopbgr800103.outbound.protection.outlook.com
 ([40.107.80.103]:7491 helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lm1Bg-00009y-Qb; Wed, 26 May 2021 17:35:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f3H9tpMsHPosGiXqSWarrVc5VySGsrE+//NsfoveBgB9AUkWvBLxJdFMkC8zW0ZwZEun5u+rwkhSctdthZffjmtIFgPEGUiVvM5ZeuyDY6lXubS3JANfUbqeyenUM9MYQUaDHsTJFHKlurx1St8rzMyRpQzfgNtf37lNLrJsMw0RISSBfOkPWI+bBwMZShAyn9myKSmQ6WPhnjJYObhUnR6tMKP6WrtTWjl2w2RkYQdGdooO77zGA/wvcc2ji9o8e1q6Efnkb19tx42VAobgMokpaFMyj8GBLTyV/q4Kc4jAPgIOv3QKOgavxvnh7xzJB+mfEBx6efmZI20AuNYLGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eovLX3mT9Js7/rVFYdx3Sjd2yni44+BCJfEdA1GEKzY=;
 b=XAsI6gIkYQd/jv5GJ9T47fpZgFM5dXe/ASYbhJf3J5yVyQTFkDmM65rBDc3/7DUhCuhWdPi9OCGCEWMMfR0WVL35QwpCaxcItC8tOwzgLASTRd+aEth/Z+49MEZfuktjnPvQxc4WRpAXzWvrEFLs+seH9FZ/uIiw+FAsEHpFZmsscIrTgZLVphyEaHZHGd3M79KXDbGkisEskPp+yCvWigKVoflIdKCPszFbImq04k58qZhRfFX7t9aCCNIEH9bZeTT6fiXixUNkRYJ2O995mq4r85VDDMm8UfiNDEvfPl1NR+dXYwbNukiZhxWbMC48vfXcY21Q0uIZV9JuFULz5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eovLX3mT9Js7/rVFYdx3Sjd2yni44+BCJfEdA1GEKzY=;
 b=j607Ss98v5j/Ok6E8sCNvwewmKxg+9ReUa8bxVmzzMX8EqH545KSgVz13anKA2Grp9dGD7j2BWnIVE8rpXDw538XB0LtRhzb91Z4dVSfSQw8jEZpFn7KaNvyPiMsAsTDxcCF07PniHYl/06c2UmbwcZ5XAe1IeoBX3zfjAzQXvgXj0Bf0/KxA/wLCEIeyshTq+2no/kzKa8MuQrtPFbhg/GW89ZTG6gGRnfJTczNXd2SP2pbJry60DigbZf0vNlOCIAZzW8rvVCq1WXXicXtz6DUW8PuP3kcpDgyIdCFelKDsZ6TQ7SH6Crg31Rzsws6Etx7rW9KrdnNYigdY4s34g==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB4370.lamprd80.prod.outlook.com (2603:10d6:102:49::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Wed, 26 May
 2021 21:35:31 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4173.020; Wed, 26 May 2021
 21:35:31 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH 5/5] hw/core/cpu: removed cpu_dump_statistics function
Thread-Topic: [PATCH 5/5] hw/core/cpu: removed cpu_dump_statistics function
Thread-Index: AQHXUmzcUDlb3DiyrEiJas1hXndvsar2SOEA
Date: Wed, 26 May 2021 21:35:31 +0000
Message-ID: <CP2PR80MB3668A1A6E41BD2A78BB8585EDA249@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
 <20210526202104.127910-6-bruno.larsen@eldorado.org.br>
In-Reply-To: <20210526202104.127910-6-bruno.larsen@eldorado.org.br>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: eldorado.org.br; dkim=none (message not signed)
 header.d=none;eldorado.org.br; dmarc=none action=none
 header.from=eldorado.org.br;
x-originating-ip: [177.9.76.236]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 485a3bb6-c9f4-4e2e-f4ee-08d9208e3054
x-ms-traffictypediagnostic: CP2PR80MB4370:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CP2PR80MB4370862D660C69BAE92CDCDBDA249@CP2PR80MB4370.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i3rPjAD2Za77QpkiXzAK2G97CYY2iWsbPoZQt+2rdZHVQJU3Ak2ohsh1lzliwIM4+RQEtp/0dgidHKLgkFKQxraFvrTpot3SK/q1WN8gkwtgi68SxWDA6dI09ZiNydQsBIy3PhUBJemfvqB9TvYLUVu9jx2mVrz/weD69AVltoN6e6UbaGm0iEq+JHlZqsky4qHOFnqemV/LOUCP/V4tArTj6PGamE0NYarhoW0a3aZDCrrhAgrY0Q8G6RqMhb311+OrVFgY9VAo8HZfpNE8ccNIs5RcX/B62Ix02qFFJtDJfuoB7fmxkVcCFg7bSj3H/ttEgYGGC1EmtnTqqvARNp0jdtyTo5Ud6r8LVFvYu/S4e0ND4R9pvsSx0wFg1ozksgWM6Gdwalaf2u5sPzX9gUY8/APYDZo08Kbch1oBYOAX5YaJfMWvYqlleSaU9kSeH5G7D1YoNvihX+GrftXdD6XqyaNfBGyTSYS3qoOSwMtPpti8DkxDsxr+lIuI6srdYTgwLpPUALORwORzEXqY15DrzSkpK8rNV9YzzitFbFwJO216s9BvtjmdHOWbziyeQCVlKKeh0V/7Obu7et/PWOO2lRUZ6ZJeuVZq+mzjY1mM94um/sKKqkIkINf4n4lDV5e5ZB5za5cal9puyO6Gl6xtm0Py7Ohz9rybkAj5UzWwCZdTz8LlkARfsL9LCsfqaFbkd37IuqsRdqOZDmFANE6C/BomAkwpj7BJoQ1OH+A=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(366004)(396003)(136003)(39850400004)(4326008)(9686003)(2906002)(83380400001)(8936002)(33656002)(5660300002)(52536014)(122000001)(478600001)(55016002)(186003)(316002)(26005)(54906003)(86362001)(110136005)(4744005)(8676002)(38100700002)(66946007)(76116006)(71200400001)(7696005)(6506007)(66446008)(66476007)(64756008)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?irG+XbVjtAx3ThH/zx1S5iY4vESz5e8RUhxPRjDgh1ttcmS4xS4eVChbcm?=
 =?iso-8859-1?Q?r1vA0RjOrYc7fUT8D5zCT12Swia/hOXSc/sLYJEkiHqWFXufmF+yfDXmgz?=
 =?iso-8859-1?Q?FiC0t8/Oup5TRP7W2F8U+bF3SL/mq7upQya7dvQX7YlNQ9zt6YfhrV/TnO?=
 =?iso-8859-1?Q?LHe5ckCIgqvKVp6SB26YneyrhzES0BVTRNOFYtgx9/NOo4ZAk3D3PNJWWT?=
 =?iso-8859-1?Q?6yhkjgdeGw7ehIp2hUdNf8P+7+gtEVYtMqFptnYseVzmillVR6lkI/HR4h?=
 =?iso-8859-1?Q?Wlnl4yzrGWGw88R4k2n2UMFl9p3/BiuT4SOfEVwtmTRIIV6cppldXxy+QD?=
 =?iso-8859-1?Q?uULWHI7Yo1Rnx5D9DqIvEfX5Ld4QvaxSElic3EiSkrU2wP+5BZANYr0pul?=
 =?iso-8859-1?Q?cLwd6z1aT/tW+fwvIk+cQcenKEYPDIVMx8IJ6SoV2hKYnVX3pdfg/MqWhi?=
 =?iso-8859-1?Q?yfa5MZPNdIYg/Inc5dJwrJ29Ccs/kGnNqk9Liuqeq16ctjVEcafu8IR3Wv?=
 =?iso-8859-1?Q?pNXthjyiLuioi1Cr5hDf28LHMiKRd3xEW1Vyd1WSYYoHc56acZWiHw332M?=
 =?iso-8859-1?Q?qCDsu7HzCjqxOvBXBfHqtlaeUmPuEErO2px/HSMPt/kSRXmpGms4nu0BaY?=
 =?iso-8859-1?Q?eICtd99yD6wRjSCEG5TTH1AWSyhTIVAMnHzlSb7GRx3imjyXacdjX41H49?=
 =?iso-8859-1?Q?MBtmKcMpSy/gS5dNdhJHz9thRh/YL+3m7agOQZvgny2AxoONRIXImR7Krf?=
 =?iso-8859-1?Q?MHhPMieaQd8R+bd1pmLp5/JhnvcxWGT2/aYCkKVnp/F7RK2cxenpQb/XB0?=
 =?iso-8859-1?Q?YQcsnOqX6Smn9j0Wc5NXFqS9unrxMVU2xuY+iRnD2inseyJVcmRqRrW85g?=
 =?iso-8859-1?Q?p8iFXbBjK1h10QGCZqcIFL67jWubo939IJU0rMnxLR9l/0xjBZ4QeHXLe5?=
 =?iso-8859-1?Q?uRt6g3HxiBhe1j9diIVBr4unltWQeX3OGtJso55JHlxLwMxaV9/N9kUxnh?=
 =?iso-8859-1?Q?lhbOoxwKL5kuvvFGUlHXU0Kp633i4Xfo0wPB/mREG9bll7T00cziJJFXB4?=
 =?iso-8859-1?Q?1V5WGLTzfgr8oT8cjl02SmRcgkztnM2WddZvxIaLC5DWhFnWwxfcPRAlYO?=
 =?iso-8859-1?Q?WmO19Ji913oAUTXFn20OQXUd0p/Us1Y9uB/AAvQzkU7AmeurXQCe5AkY+o?=
 =?iso-8859-1?Q?eg+RMtdMBWgM9UJKil6MjsRuxKx4hoGr1GvDNve2EBabXTo2GWwq23IyhW?=
 =?iso-8859-1?Q?m80kdineKKPGLr08Eyo/6WynvTRJxWSuIUQw1eiC6xrKs5xHAU3B4o/RTT?=
 =?iso-8859-1?Q?Nm3Tf64qyq20R4j+5EpwmBWMJIe1j8i/Ub89/I8JCPQE+T8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 485a3bb6-c9f4-4e2e-f4ee-08d9208e3054
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2021 21:35:31.5236 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u2aF4Bw61BXA+WSv0NFuCHnu3UzTU4/KZWZNDiG30ILj3LO/Z/a5jZ9vdYrI/jNKcSG3rxvI/vxoZ4LcEYH5yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4370
Received-SPF: pass client-ip=40.107.80.103;
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "farosas@linux.ibm.com" <farosas@linux.ibm.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> No more architectures set the pointer to dump_statistics, so there's no p=
oint in
> keeping it, or the related cpu_dump_statistics function.
>=20
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> ---
>  hw/core/cpu.c         |  9 ---------
>  include/hw/core/cpu.h | 12 ------------
>  2 files changed, 21 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br>
Departamento de Computa=E7=E3o Embarcada
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

