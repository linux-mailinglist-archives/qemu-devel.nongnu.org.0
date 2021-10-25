Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D39043989E
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 16:32:08 +0200 (CEST)
Received: from localhost ([::1]:46878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf11B-0003Xr-MM
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 10:32:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mf0ve-0007Bx-S4
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 10:26:22 -0400
Received: from mail-eopbgr790127.outbound.protection.outlook.com
 ([40.107.79.127]:14004 helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mf0vc-0002B0-PY
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 10:26:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hAPJGj83s8g9q486MkxBDjTsFf+Gskvh1/ECy8zdeTJibzkHpxv22Rztb+E7IQHjSaS+P8TOjlSPD0p+YTD9quK9XpslYmj/aHAIZCm2HHk1t6LPEKGFRX0VxTpqzEvnOwylG14ETiVzjTjueWuzdZnvMNEB6U1dzWajmxf3ujHXdLWbdC8yOZHhCHO549w4O+TENrGOvXxXXrttk+sXW8IbTOVeGT5QxZl7VsvQFhv37WthHtsu+97wNqZKSsA6gbS2gByCE/1b63ILVEt1tdmxRtgej5AJseT4jNl1JgWAhiPoQyz0Z5Raa7P2qGK0FvZUqCO8nO4BabqipyGRBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v3f8gNRuAJcbdZFIkKHrWuOWIBrimA7MehCC+KvH5gA=;
 b=djsCe0oPt7XAlun7g7Cb8uninRebtBHYD6Jhma6gbRxLvxQISj00jHrnlPNNMofvQoibsSAKr7c2ZyWM9+HLPlhdNkwp8l+Re4QAaef5fqf+hPwjc600bzbLZuq73RWdIm3rVL5c5nGNUyDQ6pfdn74Vy6y+ccDNCWSqZLxlTWfjH3nNjTklYKFhrH3Bxr/lDeSQ++e6wxMbW2jrk3mqdR3s+ylNESQyaVRny1bCDhPNtkyX3Xd5dDxm1y66OCidiksegCpoFAO3J8eef4dR2v1b9VfQ2CdTayblLK9WC82Hoz/Tw9KiK/iZ3ay/wWj4eKoz57/aAJd9apxGyKPJZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v3f8gNRuAJcbdZFIkKHrWuOWIBrimA7MehCC+KvH5gA=;
 b=mbC3h867Yy+SXBv4EZODqrlIRkl7or0kP6uAnN+UCYIWScv05HHFKI2djIppCrumiI/s/HQFD13vmL7QrG5sSD74RUzrBfTe/vvVZKhyTtZmZ1iTjzm9GLD21dhUpJT/KG439xpS5bRH1ucrdp4M++Vzl0LVs/FAjCBbnHq4PjonrqsdNuz7eo448SFsnNJUSPywf5ep08PnINXDQuIaN8Bjw+PVabCS5NUsnqumC+JVwDjA12Rp2Mt6vaBPwymz5EeiVm1+WiwhLG/jrWtUeOS04Qf2LG8sJ6CaHwCWHCKJdZVQGduumMHgQEBhO+L2Qyt80R8Rkh0fLrRBQ75z4Q==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CPXPR80MB5142.lamprd80.prod.outlook.com (2603:10d6:103:c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Mon, 25 Oct
 2021 14:26:19 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4628.020; Mon, 25 Oct 2021
 14:26:18 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 37/48] tcg/optimize: Split out fold_ix_to_i
Thread-Topic: [PATCH v3 37/48] tcg/optimize: Split out fold_ix_to_i
Thread-Index: AQHXxr996nj5oeGlnkeqjPdoWSjPK6vjy6NQ
Date: Mon, 25 Oct 2021 14:26:18 +0000
Message-ID: <CPXPR80MB5224F7D428F692188D3878BADA839@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-38-richard.henderson@linaro.org>
In-Reply-To: <20211021210539.825582-38-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 71fbef32-9c00-400b-1332-08d997c368da
x-ms-traffictypediagnostic: CPXPR80MB5142:
x-microsoft-antispam-prvs: <CPXPR80MB51429E73FBE07C4ACEC75F59DA839@CPXPR80MB5142.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3CSsumEqoSoTfm/b5t/w6c7Bm6kIY4j9vRZAjMGxPcengypzUDjRmf64DDZMPwUBoKmDqKJJeR86eeEwxay2ggH3KTtbytWkTFyt00lWHKsC3MvjXVSQElulyVznoo+ywboArs71/pvbF9mkSx0fEyGSarDC+lQcXTnHJ/cGXVRpEhOJ/9L+wsqQH/zI306Hn3r1EAWognay18hMCraUp6+i75ZkN7o6Dbq3hGUeYteSlMPtLuBx0GFxBhQSpo5M/ToIIKnGqCNYePAUw5ONheqiUTj+m0y5dXZqgQ4jQ5tWIIW52r3I+Seh2aS698jOMwsPPSQWSS9DFHXxPwFb0rVqNx6e6r+hapdfpMZR+LCcE6Fa4ZiJvskSJaGE3Fd3QAE70a71K8Iya4/8QR7w07/ZyTOfw16LixEXJTwoLGrgQGGmzQiFpH5eqG59LInIhgM0///c4tX7QbEmX3trloqJVpEldHJ3EjwxdlKwfpiI2WueYCSnGdY4K1eB8mUtSPFINWAnAU6uBZcdo4l9jrUNYBoJmGwJDPfJ+AZF4n8T4nF9P8tNEO6snZhXUZgkRi8HzWVjl2YYsfSXhbUDmVSNzGotsxmJwz0IFrV82Dfk7Hl6Bv7VKAqNdzZRMgwyrSbBr06X64vSrjc0ycUcalGCj/BS3HSTkfsr0rci0On70J+nRso6ODkQBOIeC7KUd80vI1sxv8+XrUCDg4L31NTC8Tc87gKkvSGqVr/yqiKpq5cxvQk6VHRWB/kp7drg4i35GPYc6itPH4SIhcAITg21CwGq51IbiLvU4moO+pw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(55016002)(9686003)(33656002)(7696005)(71200400001)(508600001)(8676002)(64756008)(8936002)(26005)(186003)(316002)(83380400001)(38100700002)(4326008)(76116006)(6506007)(86362001)(52536014)(122000001)(5660300002)(110136005)(2906002)(66446008)(66556008)(38070700005)(66476007)(4744005)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7YXqZ/bAsej8nn55Gxcoezpe7vi5t4OyHs3uB6Dd4dpGDmqBzhvFz9YVm/45?=
 =?us-ascii?Q?c/0CApqyCuSSOUhZqS+FF4/lY7zGz6VmC6RejT4gqjLqY0lmtdDPhI90hwJ6?=
 =?us-ascii?Q?w4tsYVBG4jIIRYFyOw87KgcvotpExrNAh+q5r3bHC31iZ1605/yKqAKfZBfM?=
 =?us-ascii?Q?x3ptagx1XRf7e5DcdXiGMotryfHVbH6AZmf54migFd6m7TEUoMbpK2/+cpHH?=
 =?us-ascii?Q?2/P3WD4PVEKfwsxh+g+a+FIOs2MZ69zE5cEQDmfKlTn7DqF+i24YtMrhEtgo?=
 =?us-ascii?Q?OAdd8BTD70lFBA6Lyv2KdfbzAoTqZkSLUCKawGOr96S/+e/o50xbTe7AK1cc?=
 =?us-ascii?Q?BGca7c3hB8Eje4iAE6yPUJfuyCg6VCwqQ4dqgjwOLbJio5uYYBPMoyetZuca?=
 =?us-ascii?Q?ub5ClHNYZX08LX6Zv8vwmvoCqX2JtdyKpR0y+OrNNBFs8J942k0QfQAIDFof?=
 =?us-ascii?Q?BeE0v3sqxehKTduNapN/hHw2HWBqWkPMKG0iM8HgDhx57DvNeixPwzLmJGKc?=
 =?us-ascii?Q?A8+IovYLN8zOiYovWb3rBH0EI7W1DPMFjmO/j9XowS5TNPQU15crz+237xO0?=
 =?us-ascii?Q?CQ4RPQwzFzVUOUGT6Sk3V0wBvzOdq3d9bjcuwA9JvunBuATqZAtCvsTIZIMP?=
 =?us-ascii?Q?PM86GNOWYBEQNs5d+KbZADDrYX1HEsCD4B7szUt2HXgAWFlSzcZt/dD7s/Xf?=
 =?us-ascii?Q?E5VYE05ZY0uf1Ej3zrTymZsYkgbhSskazO33M+YELz9XkjglbDK5IN1XQshy?=
 =?us-ascii?Q?R0zE7uO//FKIXrTChxs1tGCZh4jLW9YoW4ADLBdQ5A8xTmGWqDUHNSKgPw6y?=
 =?us-ascii?Q?Jsf5bfqM3TvaGQiq7dA5Ve0dhsjN49FJ2vSZabRFU36QLIeI9x3PEhAQP7Kw?=
 =?us-ascii?Q?tv8jPpHlIvkUGyQ2Nj1G2RZ9ao19J55j8HawZSjavTxcxPNRszDuVtRnk9QK?=
 =?us-ascii?Q?sGABuvqgEWquD12XCB9NBpVJJ+4VrVH9KSKlFLpmA7UUT3cn+/+2KpEPxlkF?=
 =?us-ascii?Q?UHk7KyuPE7QwfbbW705bXrrxMqT1sCHA7EsId5Sq5Prf93MJyIiUejM3DTUS?=
 =?us-ascii?Q?5jfVsroObk7H3IUmVDGMospW5ab8uDzrfVc6F+5YcZxwM4bIWVqMBu/UBeUI?=
 =?us-ascii?Q?0B/An9n16Z9Zzio///AtjIfxPNDOPDJzJS2IM7juaRYh7pYhdN3BGWQvcHxD?=
 =?us-ascii?Q?Bo/Wkakei7zwaOy/I4JCmb/y9vyZXHrFzNDhHCUSyh81zCfFt7kGUENxcsIR?=
 =?us-ascii?Q?IMVjfhsE6i9VTtQT6+4EzVPzgs3eCposyXouy8VwjvyW2sss8DhGhyu+8q1h?=
 =?us-ascii?Q?vlLsNJwd22PfBOpmkPh/amn250zQOEjotOJ7Y8T2aOLxRfGwDRJ8GnPfHTAp?=
 =?us-ascii?Q?mQJbQ9+6DspRK89MpiidDQOXMWW7STO039Ij7HPZE4IqIwEGcf2YsC1OjnK2?=
 =?us-ascii?Q?jZeQXNaNtEjrWCc4v1a8rnzk9OPiSyKTjzyz8iteTr9+KUl2IJhUGAedvNeC?=
 =?us-ascii?Q?Os7Qk8wTei9t55OCq4Q2rTrCEzoljTJpZ7E+FzOhLwtY+JFV0SNyI/5S94Ca?=
 =?us-ascii?Q?QKWslRUeZUyEbtSh/qUiA0f3nEBj5/KF/6TiWQ4EKfJxDr8VIFVWbr92rFI/?=
 =?us-ascii?Q?gA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71fbef32-9c00-400b-1332-08d997c368da
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2021 14:26:18.1016 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h5L+ehS/dLVCq0ri7CKqg3XvIUpNeMj9DnYkw4EtP3s96TNBDdRNzP/F0NNwB9VyTqlEAqVx1gwWeqY497mODQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPXPR80MB5142
Received-SPF: pass client-ip=40.107.79.127;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM03-CO1-obe.outbound.protection.outlook.com
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
> Pull the "op r, 0, b =3D> movi r, 0" optimization into a function, and us=
e it in
> fold_shift.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 28 ++++++++++------------------
>  1 file changed, 10 insertions(+), 18 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

