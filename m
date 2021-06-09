Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEE53A1914
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:18:36 +0200 (CEST)
Received: from localhost ([::1]:55424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqzyV-0003OU-Oi
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:18:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzfC-0006UC-EU
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:58:38 -0400
Received: from mail-eopbgr800091.outbound.protection.outlook.com
 ([40.107.80.91]:59712 helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzfA-00059a-Tb
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:58:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dTzYLzrmP1NY8aO1zc13cnCuKGd/6uFgMtnaM3VQmkYFP1w2hW7o/yYOCLg28QbeIfmm+3MDAyC1NkBRKCye3Od51w30ieuBNMCYT6fC0BDOTXAGjUDOdcOXjApl3Yfvfi3cgbnAJnWIA9okOJYTBOuhUHkPEkhCFrB29aTtbV3q9ZnSP7OKcpxxuh7OcBcqpzxDLwSgLcH6diKiDOESYT4QhEO7J9BJdiiQaOJVrV0jCV0VopCwTnND37TicMrs0pN2FkU4awFMntC1yyEREcxZ7kpT7uvGkOp62CkUbuhUElqKGNYvzlRIfBCR7O48HOAOgJTJidEezw3/MiykNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fANp5MfJvi4aOQJRoHtHIn6xP6bZINsAo88CRt2PqdM=;
 b=oCd8TWMuTSnzRo2/AyOXMUbwsmsuwyW/CacQxfcIB0R0JrWOqKVQdl07smy6Ce7ftpoHvDpz5dUUTAl0oWS+LftoXfSUx321WJToiVISgTHHLVzj4BZiLwQZ2FPmrnBhBdPVocIZASxYNvRCAoZpMwN2JGXSDqhSxElBlwFPmA3XImbLLTNCdCZ3Ql3WR5OZUhU9idDeAioJl2JJCYdH8pMNHnl2rIkPwELH9klom2037VMhTgYpT1i33vt1JCMlEfWZm8DLmKM+50GSgeceJQNAcZ3Uugj/QdbcmO5aQh9xcyvDkmhKpI56nE0AYZGs8/e4yirzwVK7psjLJHPcDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fANp5MfJvi4aOQJRoHtHIn6xP6bZINsAo88CRt2PqdM=;
 b=HvM4FrqC4pxpwHGjZ2/lN9xVnPO+0G2Bn2J5vSJ74iETmRA+24i7ccFy/d8esz94dZQB7A1Ao2i3eckslnHytlFBxdHO2t9UXEyoiBjFThg6wlaOadJkFZlOR2C5glJh1cLHsDYImbTrieOClgMdXrm3fkND3P6aQ3tUhNfv5K5hiUrDKKC07RsG6CzzPrzqwHD2D2a5ruognw2oWNNoZcTYNb8oVTjzShIr0Xq1d/tT2owMzjjBiSJcKBgugjCff14PZ80ccyFmsIzQoDPsxHDkheaLEjyB2Jz8IrLlWnO6lcxp2t7TcSu9iJfNBUTVt0kSwSZaaGdPoEja54Xm8A==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB4484.lamprd80.prod.outlook.com (2603:10d6:102:48::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.29; Wed, 9 Jun
 2021 14:58:34 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 14:58:34 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 16/28] tcg: Replace region.end with region.total_size
Thread-Topic: [PATCH v3 16/28] tcg: Replace region.end with region.total_size
Thread-Index: AQHXP6wCPiCKX4JZd0G7u7SpxUhWfKsL/DUg
Date: Wed, 9 Jun 2021 14:58:34 +0000
Message-ID: <CP2PR80MB3668B0600F37ECA7B87F66A0DA369@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-17-richard.henderson@linaro.org>
In-Reply-To: <20210502231844.1977630-17-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [177.102.146.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3b3f8b7a-d11f-40e9-f5bd-08d92b570df2
x-ms-traffictypediagnostic: CP2PR80MB4484:
x-microsoft-antispam-prvs: <CP2PR80MB44844BB2EB27C3DC28CD248CDA369@CP2PR80MB4484.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:287;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mgrdSVBcoizYABIbreXWShkTZO4UkT3LK+rd3IsYaCotysdwLB91dxpF+yqFq4GVr0mKUHqhwgNdsJ+HZUQmxi6lQ1clr0adSZOf7zZHVyLw4j+p58b97HfJXomOJCioiVmybj2YwoQxsdRQ5rz/nFtprniSag+1wrczewoyS/ZNzXeZa9x9kfBmPaK7GETYP3hAdMIDEwqRgTa4cTtjdkeSgJTNHJuyw/lDWir11RS4bZXu0Sy00fi2X3lMt3f0AEUM3OGBBdQ8cGifNua8K1X2QJBGcSFFsid8kcrcJ9J9gA4JEJZUV/3NgUDVp1Kv4jFBYQCol1JrWnq+6RuFF0aCTAOkOFQtNnD1/efA34P8Xsk/5nQYvqJDYLl3hGFAuIPBgLTdd83nW2DAIlgrZYtZvYNQeIa1fBk+36lWdS/08ga8D1i1SJC+I5FuviOxYw/lV8h1P2WSr/W/W5i6FB/TIDYlIc90x0k92fowNL2CBmluGlocxqeRO5MIds8HM4NSUp9ikIWW9Eak5cWiHHDE9AbeXw32Gc07NS0GpmgdJpJ58NavotZKZ/W4qB1wDBF4jgEaUpxMIgkNaWBMWR7LQZOpvrz6NW5wVcbYkdbit1cnMBjwODNYUPRIKgfdMI4gOtUytSu08vT5SqxI3QRXHwFXJsGB0G04DMNYvAitxmdCU0Zf7kvcRcWDvpRW5QVLkdjNKYfezhNuDMUZwd1L11G+1Z+WqTETFfH1WTg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(366004)(136003)(376002)(39840400004)(6506007)(7696005)(110136005)(26005)(2906002)(186003)(316002)(38100700002)(76116006)(478600001)(9686003)(64756008)(66476007)(122000001)(55016002)(66556008)(71200400001)(66946007)(8936002)(8676002)(52536014)(5660300002)(83380400001)(33656002)(66446008)(4744005)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?4zdwpGXN/MS3DrWWwEs0urgUI8YvX+VKqWbbCdLpRLbyotYrQt4aPcJgPE0P?=
 =?us-ascii?Q?22SkbNdEks/sA8L/gCqeIjjZxJjPdhRgqXWt6/SY9b/CVfuV2EgbAB4VeGuE?=
 =?us-ascii?Q?xUnH0MZoWrj8ek0T9DTbynDyIU5UMA4rBGiASdrnpuNxw4yLUZJUgXccnN26?=
 =?us-ascii?Q?UWAX+v+2mIBPZPWC2UEbk7MaoAQynZT0k4A0zw4+zZXgiUb1aC1cQ0izHep9?=
 =?us-ascii?Q?27xzAJEHpBSeoyIjQCIBrvjiuK2gTxZB8XwKt72MVG8f2011AYOJt7XTkgb6?=
 =?us-ascii?Q?GjFyM1TGlKVq/5fy/iUvZ7u/QanJyEZBa43aYkgMZdbyenVFidbs/0MVokgm?=
 =?us-ascii?Q?MAftLTKSn8QHaoy0lSCRCUTXVWa4NHlh0lmg7QXrD404YoAvWf2aVn8rYfOg?=
 =?us-ascii?Q?KwIu85HdCMZPk8pjUHvBqgbtmHrcPf0obvzlRWTNgrcGlG58dj6l+5v9C11Z?=
 =?us-ascii?Q?ql55vh3z73B9fqMXzVnTbIhWY43hwXKraQBXUWn9VlznWmiYWRFP6p/Il3zh?=
 =?us-ascii?Q?2OaJWyoTureVJGIcpHlBdCwhoO5UCi+0ltiejqmsBWGFiDjGo8ITUjR8o8JT?=
 =?us-ascii?Q?qdiCybnr3mTTZJ+ip4QZvzQVtlHNVgRknGD3+Xuyix/X6eE8FfJt1tw0DInY?=
 =?us-ascii?Q?kVws3m3a5qWw/Z7JY9PBWAwLd1u5sd3D1tIaUepWJB/HqDTB+RIqv8c69isZ?=
 =?us-ascii?Q?OyhfB4h/OXcygpBhxvJ7N3M0BVWZRImLQXk5cEQtL/SRtGSm4sjIdCbWqL3K?=
 =?us-ascii?Q?nFCGZGnBxSadWHy9pkV5Be6OqHjLVLttX4m1NwmoMMvOz/Ii7hCu95b4lYCA?=
 =?us-ascii?Q?kTTOcU9fd/08MH768sMUC7yY8Ac9AC6G8yIrtw3PyoOvbGPraBcXDCD50oTr?=
 =?us-ascii?Q?WwKH2Nn4DjUSfuyxHH2FOkCYV7EDu51vw4WrJCXhpcmkKLyO2hLd1lq4yLig?=
 =?us-ascii?Q?YJKDIcvIcNnBJ5KIokrCG4G7x6/NB3+cmuf7hPcWRs8rsSOglUrueQinbkGl?=
 =?us-ascii?Q?Hj9pl/A6r8eWwKFJpxsRolv1ZrabVkIAviITsF/cp2KS00kRYAYK9atL0vq9?=
 =?us-ascii?Q?tl42+fDMSfH0FTOJWXqmulsVfmz2+Qrnx3TvvjEfu/6km/AppSMvRjTFWzb1?=
 =?us-ascii?Q?x6rLy5xNUzxKuefGMUuHPYamDyeOqjdK0wZajiDVT0iXPuZQBKEYiz318QPb?=
 =?us-ascii?Q?gvQ08qr9kOoIa/j7OjfmcAw2HUvHKcozcTtsIH7Jj3acbieNtxaLcQLdITiG?=
 =?us-ascii?Q?MMoXUkOHGBJ1IQjwPTfKnCNE5vzwhkzKtDP2SizIwYWYDR6SMyMfVOB9YCYQ?=
 =?us-ascii?Q?6enPsXQx2N7Epr8lP8oRALGf?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b3f8b7a-d11f-40e9-f5bd-08d92b570df2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2021 14:58:34.3962 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BdKHi/k4ygEEpyP5FEc5/MFFdVOwfSwvX17zTZ4I3xoJ4BWjxkH3Movmj2N7eRoUWqImEyUexto/8Qqlci7O6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4484
Received-SPF: pass client-ip=40.107.80.91;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>
> A size is easier to work with than an end point, particularly during init=
ial buffer
> allocation.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/region.c | 29 +++++++++++++++++------------
>  1 file changed, 17 insertions(+), 12 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

