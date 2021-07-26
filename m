Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C4C3D566C
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 11:23:21 +0200 (CEST)
Received: from localhost ([::1]:48336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7wpU-0006ta-Uh
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 05:23:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1m7woD-00061G-Lz; Mon, 26 Jul 2021 05:22:01 -0400
Received: from esa3.fujitsucc.c3s2.iphmx.com ([68.232.151.212]:61347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1m7woB-0006Ky-Dp; Mon, 26 Jul 2021 05:22:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1627291319; x=1658827319;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GVHSbC+fuXZ8dgEAyjG6w3kLjWNDhZKc9DCRdRN9q1o=;
 b=EUQgRi/rKdVV8G8jwCfB9sZkY4KfoUXOuloFsve/SBhU71gZy0JbYBZk
 QitXTROBuDiSsGPKyi2yvoptk9NYEbh6dQXU30y0lzK4eVoWDzDO6Y9uL
 o+vggHHjNC9OVPqwMTMLzs8d7vUSne/F+EWp3Efxi7ww8y6ZfZ+VnolRE
 dnqQTknbESu7ep/xicAgmivMynFFNzSrRWevF8u1E20fhU9tYpmLHOOux
 yeVw5Ymh1A+SCW605LxcEVv+C1Ktx8F3RpPmJjbmLp5O6hRk7ULRC66nk
 U+Vxuaixu1l+6aWg8nc6mysiX2p3PK0BVnXDhgyR3ktv3teUpJmAmmLa5 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10056"; a="43630267"
X-IronPort-AV: E=Sophos;i="5.84,270,1620658800"; d="scan'208";a="43630267"
Received: from mail-os2jpn01lp2054.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.54])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 18:21:55 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FnQcCRuwISuKK9LOObB28/Y+w2QrFTWXM1jFQRbkb66kGDNrI99L4GczoLFCBzvvWiQDL8vPDmcEYUp4qV0tJjZ3Py/tnA4yp1zf8EqfgCZB+8MCYNNe1+ylgPQ3P7ZOq2xuAoEQpZUn+Dowz0PEnPu2N2Ck6EqZq6SxhVfm6k6iqlN3jpuioiuYfkzlFKPL3w+ie8Hv5WsreNJ6xFMJ113+MiLfllP6Oh9lIOywax43Ez52xI1aLNskvmkCcV980VKY+F3wKW3D77Zq/m9ipcF4JOdmkt2zo+SIzdKFvH/Vq4IjHNZn1jzbf6E6ltwB3wX9/Eva+0267UJNVzDVNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DAuuVZKWL6Kmn8VnkP7hL3XFjvUxAfrdYumST2N9WDc=;
 b=FG1jBmwnv9+E6sWoUOOseaTuYWIhY2U8Iu0qvyXySS00/UxW82PBziS9+e/5reqlpoMFpyliQgI/lTreqZ1F7Lo3RNr+dYFdDv8phnQZl/1y9opz1zYSMxAaLr+GIGZXYCZ5vJDd5oWXDuAffzqO6bfhpN1RlPglAP58SCDOLRmLI8czmMjlTMH3bQZq8bhGw6TsGNUng3M0lmmkV7o693O1zCn672iL3QqNSQylMJcyLjfo8Vt9akkEDJCvFywHSixQ3LlcPrU+sIzUwXKpAxp5pSigAkg5cMkVCFVJadaJjvW9wjDR5Xtkrc055ExkehEkSU/AOiut1hiGCb1OgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DAuuVZKWL6Kmn8VnkP7hL3XFjvUxAfrdYumST2N9WDc=;
 b=azrVTfKfxL3eGjG87wsVR2alYwJUard+tDxk8W2pi8kwV8Ils4GvgntfdEIbBByozfXAT8RAaGohtMsSRNc556Wsg7BpH+5ZEwmp3dcvuwmBS/yl2exyul22faeHZcaLlYW3z3P/CcPfF+VtPdYY9Xb3b/EHvEcZcscLztM9JgM=
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com (2603:1096:400:4f::8)
 by TYCPR01MB6318.jpnprd01.prod.outlook.com (2603:1096:400:7a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Mon, 26 Jul
 2021 09:21:53 +0000
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::154e:70ee:e0c5:f482]) by TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::154e:70ee:e0c5:f482%8]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 09:21:53 +0000
From: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
To: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2] This is a test mail
Thread-Topic: [PATCH v2] This is a test mail
Thread-Index: AQHXgfchhDu0sJ7xaEysUeLESXxCSqtU+y4Q
Date: Mon, 26 Jul 2021 09:21:53 +0000
Message-ID: <TYCPR01MB6160C766EC6359064D560B59E9E89@TYCPR01MB6160.jpnprd01.prod.outlook.com>
References: <1627287631-6595-1-git-send-email-ishii.shuuichir@fujitsu.com>
In-Reply-To: <1627287631-6595-1-git-send-email-ishii.shuuichir@fujitsu.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: =?iso-2022-jp?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZl?=
 =?iso-2022-jp?B?Y2UwNTBfQWN0aW9uSWQ9ZjA2ZWM2NmUtZDQ0Yi00YTMxLTllNDAtMzVi?=
 =?iso-2022-jp?B?N2VjYjEzNWQ5O01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFi?=
 =?iso-2022-jp?B?NGQtM2IwZjRmZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9h?=
 =?iso-2022-jp?B?NzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxl?=
 =?iso-2022-jp?B?ZD10cnVlO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQt?=
 =?iso-2022-jp?B?M2IwZjRmZWNlMDUwX01ldGhvZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3?=
 =?iso-2022-jp?B?Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9OYW1lPUZV?=
 =?iso-2022-jp?B?SklUU1UtUkVTVFJJQ1RFRBskQiJMJT8lUhsoQjtNU0lQX0xhYmVsX2E3?=
 =?iso-2022-jp?B?Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9TZXREYXRl?=
 =?iso-2022-jp?B?PTIwMjEtMDctMjZUMDk6MjE6MDRaO01TSVBfTGFiZWxfYTcyOTVjYzEt?=
 =?iso-2022-jp?B?ZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?iso-2022-jp?B?ZC04MWUxLTQ4NTgtYTlkOC03MzZlMjY3ZmQ0Yzc7?=
authentication-results: fujitsu.com; dkim=none (message not signed)
 header.d=none;fujitsu.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e677e587-860b-42cd-052d-08d95016ce77
x-ms-traffictypediagnostic: TYCPR01MB6318:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYCPR01MB6318E79FE229433C6F33261CE9E89@TYCPR01MB6318.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f/I4jzFTGYscjFj58XDn9qWBrR6jVZQaGVfQCwhp1mY8dnLBlzNh5MhU51lTRFiH5FmSVGIQUNUQF89MvKWIf7wKQaIfveSKQV1o6gLBG2XPunCaPOgAo7c7ASDJJXd3+iDP9EkRk7jBDCZG+MSJPPVakdJ3IYSmIT3KXEU/c9qKofcho3ANYSEgvO85kDViTkSMGkwagX+H4Or/FwFCXb3ctC0sZLgX2J7tP/UoDqUUC/bxho9fYQSQNOYYmrU7JSsA7i4DIRDtg+VJoP+lK9yhWl/IJnJtv7a7LPxkazYj+s6oz6nJXD0XeY5yG9r2tOYWnZWSpaK/sipuPdlwJdRe02Ak2O9JGtCtchYpQW0NU+ek4GqY5XMwNJ3yUOxggV35ReNWAW6BXiS2fh/sy3BYZ+iYOHG7WMd6J41uUuyDP7of+X8dFfzwHhog+1E275P8osxhHpX/nVCNrGoUMuzHRGWWOyUvgZu3fF0EF2EdtdL7H+wTJJXTI6KoVLDIwxgFO3GOYEgYu09tk/MlP2SR3eWnYz2TZ2E8V9onTGgID0IxoC4GtyG9SE5KuJDfSZAZN9vbh2s6zfaMHr6/2sJtYc8Dt/LCytQeNBBW3Y7YBME2eTsFe7XYWIvs9BFiuiwPS5sb9/07HRx8RdmoOcw7wYFGleKbvcVjEBM28jeU8XYWjJ23Mf/7dStD2X/IP7Fa/+lr7oJhsW0bd786pQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6160.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39860400002)(366004)(396003)(346002)(6506007)(66446008)(76116006)(64756008)(7696005)(53546011)(66476007)(66556008)(66946007)(33656002)(9686003)(26005)(4744005)(52536014)(5660300002)(8676002)(450100002)(71200400001)(186003)(8936002)(110136005)(86362001)(478600001)(316002)(2906002)(122000001)(85182001)(83380400001)(38100700002)(55016002)(38070700004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?U3BCNHk1dUxzNWNYS3NJTXJIdWtTVkRhR0pmVHFQdThJZnYzVHF2Ullj?=
 =?iso-2022-jp?B?UEprQzR0MnExaXdRZVorNFBIRHdPZkIwTHcvUGszbDFKQ01ENDZjRE1v?=
 =?iso-2022-jp?B?YUxlVEhXTlc3dmdTamp1L05hbXlWblZIVmtDMU9OT0VNWERzd3pJQnZ4?=
 =?iso-2022-jp?B?NzBLaStHakRDb0d1cENSbDlIWEFyU09lL0lBejFqazJnVHZEVFE0cXZQ?=
 =?iso-2022-jp?B?UThxMGRyNU1BOVhLTVJGMElsM2RxYTBHR0V6V3loT0F6WnlTZVJzYk5i?=
 =?iso-2022-jp?B?TFRXQXJJWml6QTBOenJVNkozSzN6TWRXSkQ1Um80bmxOSzlLZ1BtUFdM?=
 =?iso-2022-jp?B?dXZRa2doVGdYa21aUzBxMDUxclpuTDAxdzhGWER0c2Z4QXUyUlBmZGVZ?=
 =?iso-2022-jp?B?RTBhbFZZRDJxQ28zQXhYVlNkNnJtdmdJRnVGT3FxYVBZUmFlWlpRQ3I5?=
 =?iso-2022-jp?B?dWRTc2NiaUlyM2doMWZpZkVLaSs4UFlBaWQwcEF4ZXBXbVhGRnNzWUNs?=
 =?iso-2022-jp?B?TmF4Y3VxZUkvUm82bFdwYitHVldWck1GSlNnTFhhNEVMWU9UcXQxOHlV?=
 =?iso-2022-jp?B?T2JVVkpmdnBLelFLU0ZpVlJmYjdwQ2pCVmpXVlVicTErVXZXeHhQWmxu?=
 =?iso-2022-jp?B?RjNQSmZZQjhPbzNMN3U1M3JkUllmb3lrRlcxUVZUclhaYkVsMDdEdThU?=
 =?iso-2022-jp?B?bUM1S2FnWEx6ektaVUtTQ01OY296U3hZbVdTTC92RU95bngxajA0VDhL?=
 =?iso-2022-jp?B?dkdaaW85M0ZPZHVqTEdYQmVVUWZPeFIwNkZvMDBUeTl0cGU3QUR2Yytr?=
 =?iso-2022-jp?B?MlBacC9vNlJLY0wyQWF1ZVI0ZlAvSHU4bWNGb2RwdzlzbUVSSXYyK2JD?=
 =?iso-2022-jp?B?dU5NQVIvY20wS2hqOGlvd2pkVTBzd3NGQlRKQUc0T3JMZEl6Ykp0UTdV?=
 =?iso-2022-jp?B?dmEyZHRpNzlKdlo5TG1hOWdIUEhjVGJuejJ6ZEtYK2Z4aXlxVmp5MGh5?=
 =?iso-2022-jp?B?LzJGYkVkZkY1S2xEejVzSXM2dVZNbE4rYVl5MnZLMTYxV0NXczJKOStG?=
 =?iso-2022-jp?B?UkxsV01vU2JJMmZxbnR6bXA0V3pUOWFYb2ZWRTBOeW5hVVBrMWNnSUhy?=
 =?iso-2022-jp?B?SHRQaWNNQkNRV1RXOU4vQzBSV0RERTAwSzF3R0E5TERDeDI5RHQ5UnFu?=
 =?iso-2022-jp?B?MWRtSzZmUEhzYTgrQ0pXekJ1UjdhR1BYSW5VRFJJTUhkTWdMa2VXamtH?=
 =?iso-2022-jp?B?TjA3dkoxMjYreG85c1FOOE9LS3BER1VOTXV3TzFMYmdOU3ZlZlFXa2Qz?=
 =?iso-2022-jp?B?SVU3MjBpaFFtdzNZM1J0Vm5hbU5IeFo0Q2Y2V0hDMUx2bXJNUkoxeUdh?=
 =?iso-2022-jp?B?ZVZVcmdDQ255dWhXV1JuK3BCY2lIREhRZSs1c2JVYmFMT3g0dlpjU29K?=
 =?iso-2022-jp?B?RmQ0bHdtWXhCNVdaRTA4TEE4blZCNktNcEMvWVBQcTdvbGRPM1VQaHJL?=
 =?iso-2022-jp?B?SlVlRnRuVGZXZHVOWURlMytMNldqMGtGWHkwaGErL0xBNm9jSXkwM2hh?=
 =?iso-2022-jp?B?aEVtNmhiYk9mVzJJckdCNXpBc3FlQWhvOWhRYVhvNWhUQ3YybzA5S0xU?=
 =?iso-2022-jp?B?NHlwL1J4R2pwY01vWlRVVUxoMGJiTHg4ZGdiamF5Rlg3dklDRDRVandL?=
 =?iso-2022-jp?B?c3o0MlZRMlVqM0lVKzNEUUZYSnZqd2pyWEQ0R0JEWmNQVWpScmVzcDFk?=
 =?iso-2022-jp?B?WHRCMzQ1QmhTdUpFdSs3RGhOZStqcnovZDd3WVlLK1Z3ZWNLbEx1amE0?=
 =?iso-2022-jp?B?ZWNFVVJPZjc1cGp1bVVrRW9aV21mbGhtYTdQT1dsWkFPZlpFdXFZWERx?=
 =?iso-2022-jp?B?ZmwycjFwU0ZPSWZCaUxUa0kzeUZWeExqL3pzT2dZQUliVnQ0NGVQVlVw?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6160.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e677e587-860b-42cd-052d-08d95016ce77
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2021 09:21:53.1840 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gcC+Z2LXTko3q0NY43gujVjSNBy6A5Pl304Mjhk20z9r5G5hOGit8N5woJRKajevMnQrtzN4mlvPbu7XEYODAnlrSHIyZARs75E25jfTwdw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6318
Received-SPF: pass client-ip=68.232.151.212;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa3.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Test reply 2.


> -----Original Message-----
> From: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> Sent: Monday, July 26, 2021 5:21 PM
> To: qemu-arm@nongnu.org; qemu-devel@nongnu.org
> Subject: [PATCH v2] This is a test mail
>=20
> This is a test mail to check the behavior of my mail because it is not li=
sted in the
> ML of qemu-devel.
> I may send several test mails.
>=20
> I apologize and thank you for your patience.
>=20
> Shuuichirou Ishii (1):
>   Test mail v2.     This is a test mail to check the behavior of my mail
>     because it is not listed in the ML of qemu-devel.     I may send
>     several test mails. I apologize and thank you for your patience.
>=20
>  test-mail.txt | 1 +
>  1 file changed, 1 insertion(+)
>=20
> --
> 1.8.3.1


