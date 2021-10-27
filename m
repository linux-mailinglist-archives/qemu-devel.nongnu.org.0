Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 794AB43D301
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 22:38:53 +0200 (CEST)
Received: from localhost ([::1]:33872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfphE-0007Rj-Gk
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 16:38:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mfpav-0004My-Q1
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 16:32:21 -0400
Received: from mail-eopbgr800115.outbound.protection.outlook.com
 ([40.107.80.115]:6167 helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mfpat-0006zG-E5
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 16:32:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n29gP18BUC4fnWpuWnE3lRAVYxImqtc110vEeI58PeTtp/MbeAQbQ+QiTNFQisrV67LLqF0ymzW2GRzPlxEd0xQJ1gvFEx6U+pPKXcmoO52feO7MNs7DpyTg+x2tNr7+kfDx8xTEGiBm3GsTe32BxtTXk3Fq2M8h84Lbj+PxlNsXdRkzcgYUzX3fNLSnY1Z6iiisgSwpQ8OiDXr0H0hbITyIlsiPVQa4jGoMBpHGm6AOuSArGjAXo6zp5GCyHgct70NqHYV9gyhWguDQgtWJjZTqqo8jQllDnj8n6I1Wq9/7q3m13lDChLXd3Jcljd2F5aDVzmDgCBNDY4DiRFA3RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wvHyIT/oicgX4EJvm7ifqh7IA4mHgGZInIr2nJren9s=;
 b=JHKxj10l60e+GWObU9v+zyVQTzpoFkklxYvniiMjLwjfhsBVIS0uFXWPtpOotqt/9t5gg3lCA/eT8xTIj3Z+k5V0n82neY1WKXyh1hFq7xYeJammpdPGGZuamubN9HMnlrremlj/IyAn6a8oN6mh/3hae/C4HPY9YHP1ld71Qr0SEgQvr6woYHpbzWHdBYVYOIay2O1xd7i/wgnNDW+9j9ddFNaLATE28J8FPZM70O6Ftr58bbrDwqvxFHTHBdjWfpTvUIWMK71YrdcgF4xTGfSuPHPvZU/egiNJaShlTSR5BJW7RJ9dcRLMit2Ee0N0plPY/vz0nTiL+71YsCvxgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wvHyIT/oicgX4EJvm7ifqh7IA4mHgGZInIr2nJren9s=;
 b=pXMapOB3MaugAGrWaUgkayaM3QbkS3NQHN2bzLoKSFtktENV17DwITa21t1sZzLejeS+jZegSp29r/XQvGZnLkUPFhQBO4YZpWowpHFzplom1mdG1GOt5R4VgSCEaFFAaNQa+zaJtJamCXTAxd3xBaTK4ZSQNe3bWkOuddZ4OPvGdAPVjAiWc1hhoXwhzgOWZ0RhI7Dk7GAUR4wHnW9kWEViD2lAkcIkLY6ctMrF9hw4c3MQNsrgNQARU5cYLVGY5ZrcXIWxFIFpIn6BCRW1FnGC7aodiE70bXLPT1dRI/hx1PPq9Ev87hbszcLt/0prZeFJGV2wSWefz1iFcAWXnA==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB3841.lamprd80.prod.outlook.com (2603:10d6:102:36::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Wed, 27 Oct
 2021 20:32:15 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4628.020; Wed, 27 Oct 2021
 20:32:15 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v4 41/51] tcg/optimize: Sink commutative operand swapping
 into fold functions
Thread-Topic: [PATCH v4 41/51] tcg/optimize: Sink commutative operand swapping
 into fold functions
Thread-Index: AQHXyr8VsZR4oAD4mkKTgykUDt8ewKvnTQpg
Date: Wed, 27 Oct 2021 20:32:15 +0000
Message-ID: <CPXPR80MB5224A60FE8542531211B3D2ADA859@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
 <20211026230943.1225890-42-richard.henderson@linaro.org>
In-Reply-To: <20211026230943.1225890-42-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6e9f3184-5e79-47c9-3a2c-08d99988dd57
x-ms-traffictypediagnostic: CP2PR80MB3841:
x-microsoft-antispam-prvs: <CP2PR80MB3841752EAC6EFA09058FAFE5DA859@CP2PR80MB3841.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8mpag1Bo716lw5/t89qFigRU8iyCDA01h3DTxgZAncu5uVEmme1RXyx3h0Wblony/Ertm99zAfyj73RQX4X7rEFKg6xeXjUV8xs3BvbGKSF1uxOA5wJR3kpjxJEtQoSHiIDNX79w0o72yQCp5ocnuFjxhvjCFu+HIzNF4ApHXYY1lSAbFGCMMtfugRQ9YSsjyaNQyUlrtXHTzl6MZ/L51wyPG7hmH2ej4yrwSh3ur83Atxxk8BNd4A6Ij8oKk8sguDZ41vxfgjmNizRxIKAl7rsBXi7hXt7tYqzVQvHno9MTwxrTkA7IJhP0SHiwfvLZbj/ggHOi4FFhGFRF0zIKcBNNh3Ut0IA1Den3DCN/RjyalWoSe5dgCrP075tP5HRtX9aw9m2wZUEUZArGgAkpDxuX86KsClS3IusPcs1tP0sPMXNxqSjEV2yOJ6lOjPjsR2+obLcw2UbpEtR3/9YhpYj2xxPw5QcwAMYfy8E1UHGVpnJ0UONm3eSlSeJ0Z8yc4qBLOGI9DpXTZ3cT/+Te1RKivN9qWZBnBRjITJiG1q96UWf4rKQr2tGcc7j+WKK77lWvshrxcdDt2Uf2x3Xu6KC6wzTv75o6Vr+LcjiVLsiby9MzUvNy0yA9ionRg+NwzOAmHoW4XxPAJh6zBqW5TNLWPdcR5Q4YR4mHL8z77K1D7P9/67e9uDIw1GCMt2MfcSgDgk6rfAQv0MRmXsW5CpSTFuJZt+OKryXTPzG3yPCjBQaFEspbZ49vPXeDnZ3Hrc84obpUoo70AIC0ZwWF7SPI6aXPPpGr4S1i1ewaJsc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38070700005)(2906002)(5660300002)(110136005)(66946007)(66556008)(4326008)(66476007)(8936002)(6506007)(76116006)(7696005)(38100700002)(33656002)(122000001)(8676002)(52536014)(55016002)(64756008)(186003)(4744005)(66446008)(9686003)(86362001)(508600001)(26005)(71200400001)(316002)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DrWKFWcKoJ8KwHTCOJsQFZh29lxZZ+VV1WgrKbX/3aaR9LOGgPmZTvu7xKf+?=
 =?us-ascii?Q?ENsyp4sQP66kOOOljwa/rUaDv0O1T+c0Nw4j1TROs2YAuBGQVdLl8RQuzRXA?=
 =?us-ascii?Q?JeS7qNZLsLt38QAgL4Yam9fqPYM0deMC9A/Tp84mlmovkbi9/8ifOXPKv1QZ?=
 =?us-ascii?Q?uroTpq6JLGD45FYkeTggvXMBmkX4wJDKZif7Q0tsjSJyUdLoosj328Bjng1Y?=
 =?us-ascii?Q?QxAiF+mbeHNVIyX++dUk+XxDyaKGdj4H+y2XIqIJc6SLTXa5LwPuUtayICYI?=
 =?us-ascii?Q?8sdcmgjxABH901SOR69+cZtPF2GZCeVpPqiDOjJD+/bQTSghhnYpdYRNvvyv?=
 =?us-ascii?Q?Kg2LFtDc1ShcJ/1M9bXxCJqSHhj9vs5149ul5R7igLrTgw8OZ8VRwmCwEsBA?=
 =?us-ascii?Q?gBuGecVqQTEY9S0fO1u2VOPfui7k6PBbiG4LYUXkmr188xaV+cbUE3HgVnIy?=
 =?us-ascii?Q?kE0xZEhYYmkJ3DWUw1jY/CDAbBH9JexxchhZZLZdxFWh4jHcxLB/mO/TYrZ9?=
 =?us-ascii?Q?pLkc4Ou+SPoKGf0mAZIkrGn7/NblDfOm66qs9EOK+9jNxWqbbfJc7sXQGEDV?=
 =?us-ascii?Q?f02Lc0Ebm7sZkOYarSWHBvOP0a6g2pRJIqcuBtd27/CHWIkZQTI7KeOpF1Ue?=
 =?us-ascii?Q?lb0/TAIut56cCmFggdvRROrpzca/XKwCroqfIQ/mefGMTu1mFcte0oi4RXoc?=
 =?us-ascii?Q?8yjsTnnTsS7rcpj99p7GFaT1AXNDWfELXDPnDqFae+WrAn+TgS/kqAgAvo6u?=
 =?us-ascii?Q?/X3yijQW2AwiOU8qNSl+BA0hXPJKvMgLiSHJMV9MFoHz6AS01vHeiQNEjoxj?=
 =?us-ascii?Q?G1neP3m5birr7CCmdMoeqY/ao5F19UoEht7pW7kOhFLfZDou5/yDtmeNvqzP?=
 =?us-ascii?Q?3T1AYJwOn86BOZWc4FcH89tqrgnjjmffZVMGWb3i7LMN29uIite2/dBhrnos?=
 =?us-ascii?Q?KLD4gFMFlrXU9IuNzQRoqL/hS4YlLibWpHFotI/XsiXJ5lfDVBh2cJP+Jbio?=
 =?us-ascii?Q?8rSs1dkLu31ySfPGn01xf3FNeYBCdTTAHfWCnkAe34rSUsbvxFPuI2XTf1Qc?=
 =?us-ascii?Q?C9PnArCgI1ILoDLHFfR/F8ufYO/9YbmCroiv0K+RlddFdh9lPf97dtcQTwvK?=
 =?us-ascii?Q?ZJVN1NBQ9PnGO2F2JXg9qYlB0vmlbwlcAyysNnPc7I79o9YIFAjk9ZLGPrH3?=
 =?us-ascii?Q?W6qUa9TgrqipTf2+nn8ygAyT3nIg2o50beXLAPJORIxfZeF0vn7wE7c4v1ww?=
 =?us-ascii?Q?8fHOhjTvP2T52oRvH9WOFXGWfdTj+3JPg4i1dIuKwrrgdL0D2FtHohovHqRu?=
 =?us-ascii?Q?G1y3a4I6ThpI9B7hzBboyJI7Mz4HpiDl2M59XPKw99+WIXZb2RF7wQE3nf07?=
 =?us-ascii?Q?bycGBeUP2WO6rZYgnrd3sRvK8eOgD5uVu3a80tfyNWFFcy6weBRCdHmHsHlV?=
 =?us-ascii?Q?+UkVls5Ap95oSRryI5TEtJHiT8POwwZSSGOS11C/Fc4jxLzyYugpnZhkhFim?=
 =?us-ascii?Q?boJtKqD/Nv2vN+f+eze9Ed1YiUgcCl0l9xGt2p6HBGFLTUxjBEvMPoo4WEIX?=
 =?us-ascii?Q?TWmJgW7wOialD2a3V/5263bniUQGp17Lviek0hmbF2UTmo+tg3rnY9DynsL0?=
 =?us-ascii?Q?Mw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e9f3184-5e79-47c9-3a2c-08d99988dd57
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2021 20:32:15.5810 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sbYTgaUajnvfqYGJQAMeIBsTCdLBOGbobUMFGCbRiywcNXF1a4ajw7G22uOGdzHJlGa4jLuanwtFk3EZAMDQ9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB3841
Received-SPF: pass client-ip=40.107.80.115;
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
Cc: "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

>  static bool fold_add2(OptContext *ctx, TCGOp *op)  {
> +    swap_commutative(op->args[0], &op->args[2], &op->args[4]);
> +    swap_commutative(op->args[1], &op->args[3], &op->args[5]);

This was existing code, but I would've understood it easier if it had a com=
ment noting that, even though it would be possible for this code to swap ar=
gs[2] <-> args[4] and not args[3] <-> arg5 (and vice-versa), this would be =
okay for an add. :)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

