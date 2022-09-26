Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 088105EA550
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 14:00:39 +0200 (CEST)
Received: from localhost ([::1]:47286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocmmr-0006zk-RG
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 08:00:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zeyuzhang07@outlook.com>)
 id 1ocmT4-0006cC-Np
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 07:40:10 -0400
Received: from mail-os0jpn01acsn20805.outbound.protection.outlook.com
 ([2a01:111:f403:700c::805]:29120
 helo=JPN01-OS0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zeyuzhang07@outlook.com>)
 id 1ocmT1-0003Fn-3Q
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 07:40:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ISQkXCPiJV8czrqtSEduNftaclnuz1RJ9VFFy7ioNbISHjtP7iHTWZYgwWoA2DoCH1CB5xtdr7W7J+kYhAjnkDYTXzarNcSq2QHANzunGY9BkycKw5o2JBNGr/QwEnGyOmfc5O/VZne4snORoeppgsQ4dZRpxF80BTxS9AUnq4qLEb7oBNno8Kq5vRYhN87dZU8WhR2AlZGzuYhuvEqUzPl7Ab4e3eAWsq57mnxMB06XIJR0v0ZHcn/A/Z6COI3+dVPKOC1aXeswPrxVa23Q6z8QBOcfg01RuLQUQU6b7QZRXCCE1UwJKp+ynCa2Q/NNXDubrdX32ncixYnAxTk2bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UDY4+LTi0PDN2TuCGruIoEHyLEOW7nAW2UV/QpdiK5A=;
 b=EMh1z45T9xxkUrjhCTmbJ33+BxDwenlxXk4o3OS4Q/8JGz/st890KGnUuoR9u8YnC9oPoeKDkqYlCzaGRprVMdnMkzgsva86A6wGkGwkxuF6LRZxNeaUkWb/EqUQEA709LKWGRrInZ4yT0wIeESJc+DofFK7z/I67a6Bp47Y4m5bX0k9UYlYTPxKo4DceHj0sIZTpNUNyi3eoHVPH3QiS7EN1/rzThL7bu7OlHZMD9g5RkLjE9bXW1c0owi3+FOoxl9bxS36H6iqQ7GPK96L8irsP/lBH5hmhlPHATtI1ogWMuqrDbJYU6c7ML9xtRTVx8t6QwGhG19hPFSWAt35BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UDY4+LTi0PDN2TuCGruIoEHyLEOW7nAW2UV/QpdiK5A=;
 b=GJ5LSVa7JR+dBwBJFAxCvu3wgV2NTkc3uOLfYuj0YhiRkcwF/I1+nZzV656uiGkCqhD7BeGdnVWPkTQ1FUCteMzU301YKV7nvZErNnTRuf1VAmGUEji+fCrSpcvUidtpJmhRQpmDQNILJSOaW4cWHe+Th75vOVRp+Q2LHW87H68izQTBhyox+FTFanJP4DgOYoQdH/xWb3u0nTuzJNyJilwzDdx4QXea9ZINZrXsnOfRhwLEBMMCUN1KBX0Z47xLfmUUpma/qawmrDpH4mbMub1FwZMn7vPtYYmP/Jysy/tYFJEXT56Px97lVl3e3LXxlpOxP6M8Eo5Zs1hR5igZpQ==
Received: from OSYP286MB0103.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:83::12)
 by TYYP286MB1738.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:fc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17; Mon, 26 Sep
 2022 11:34:54 +0000
Received: from OSYP286MB0103.JPNP286.PROD.OUTLOOK.COM
 ([fe80::8b83:8fb9:2676:a925]) by OSYP286MB0103.JPNP286.PROD.OUTLOOK.COM
 ([fe80::8b83:8fb9:2676:a925%9]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 11:34:54 +0000
From: =?gb2312?B?1cUg1PPT7g==?= <zeyuzhang07@outlook.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: 
Thread-Index: AQHY0Zv62fxKRx5z0EGECBgCINT2Ig==
Date: Mon, 26 Sep 2022 11:34:54 +0000
Message-ID: <OSYP286MB0103174EFAE86D16498EE9E1B2529@OSYP286MB0103.JPNP286.PROD.OUTLOOK.COM>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-tmn: [HlWW+0X/3DwkZ5NNScxNuXJEcx8wqBf2]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSYP286MB0103:EE_|TYYP286MB1738:EE_
x-ms-office365-filtering-correlation-id: 4602a28f-0bb9-4fd8-2c92-08da9fb3221f
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wLez9BiM9me62Ez1m2Jh7gXG4wegEoecdjW9KmgZjxP4RwLKN2qaivQst9BV4Ctc7C7cIXhLEIn6j4uCqHGgUtXKFRYhKxaFmab3tGrTu+A5IoyfYC4hPjG9kAnfmGPdp6rBZWiOPi8YyzFmIpMzWfVBT5egRiEz09+y3+KKzf6WTvcGApr64fqzCvE4JCa4NQphY886FRsf54FDwep4gX9nde8EmeFo49/X64nqP9JYA5gDma8MFMUApbJW2u9gAFf55W0AhShBPScRNTb7pMphFXPk0wqLoqXzpOjudnFLQNOurh5CsHHIb5Z4tmFrsPt8nVt3d9v5IcVNAtXvYYJfVSmtrz6pe/Bz8Ro5hTrgtoOBw3sWBtYU+kLOi5C67nf+ku8rI3TkOnzFE+JnSoUelGoHvRbOrHtEQ080LP92EHzdfmK2KBTKCrvQFO6wMDgidYAikJ3zIl8uhZOpH54cZc2D3uWNDwhRA7P2+5eZCc456x+XUVqz1kk7sjOPFZ0hfdl7WXA9UW4+rm2ibgpOofyPeIkBpH0ZrbLfV72dwiV4gxf/wFqobY8jU5smnv8zJfhPaZ5ggAjlOy3aaWg4yutnWM6biOZnC+Po2EAu/AsABEo4bNZ83Saw3HfT205GRoqneA+wr4iI4cc5rA==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?UEJHbmhOV1Iva1hETlFVUGlXNkVnbDdJOEhiaGQvOUdWNEtRN2VuRXFCbTlu?=
 =?gb2312?B?RkpLdHVjWVhIaGxRS3haWkxabmlLS01RZ2l4TTRnRGFtN1JJL3dCUEk2ZEIz?=
 =?gb2312?B?aWd1M0hWRXRQRnF6NldocjhBdGNVU2ZsOTNOYTFPTVJZRWg1V2FOSElPVkZ4?=
 =?gb2312?B?dUVGTTc1SWI2djd0SEhIRHk1WWRaelNTWStFUW5XdEU5c0xWeVQ4dnNtOFJP?=
 =?gb2312?B?VGRVM2x2eENyTVE1WFpWTkZ3SlhtNkJzRy9oejB3dDc4Tm4va3BRL1Bqdjdz?=
 =?gb2312?B?ZnQzRmowYzZIbUZZemhiUVYrN0NhOS9namNaTTY2U1ZWUGhCcVBWdnVFM0JN?=
 =?gb2312?B?WmtzQXhyZ0FsbkQ4c0lYc0RDWDQ4RG9KekU0Z2pqVGIzTnM2bHVybG0vUlFv?=
 =?gb2312?B?enE1UGRUbitlNmdJM21xa21LTVoxSjJqUVAyZ3QrbUMxQkE3N2ZsYkZoMHhW?=
 =?gb2312?B?R2dpa2V5RUhIUGh4NjEyM1FVWEJzN214OSt0d0Uwak8xWElRcWNyQ1JzaUdj?=
 =?gb2312?B?bXUwd3U3UjhWTzVIRU9UUlhZK29WTEJiMGcwQXcvanNaUVdvWFcrZ3FVVHh0?=
 =?gb2312?B?ZG5TU2pOYTBCTllTRFg5d2dtTUhuOGcxaVNkekdoTmpMR253Rm5mOEc3SXBm?=
 =?gb2312?B?dHRvWUJnVjdBaTA4b1VRQkZRR3RMcE9vQk9Fb0ZocDF3VDNXTkZ5ejNkNDJZ?=
 =?gb2312?B?V0JselJTMFNmMkRFVTYwVm5idDlFU0loYWRmU2VKWVRrT1QvMjVYVE5WQ001?=
 =?gb2312?B?SFVrYlJqOEhjRU55eDJZaXVCOXpibG5KeDV5WmpSMjRPNmJyVDdlMHdEK3dC?=
 =?gb2312?B?TnoyNTdNa3djQmc0ZWNZcVVaNWhuWGl1Nkd6WHZqYjlPcHh3QjRJZnFsZEMz?=
 =?gb2312?B?WjBQck5PWDVrVzlPZ1Rad1Z4bU84WmV6YnBRN01iV2trbjNQVmluMGpLWFVV?=
 =?gb2312?B?S01EYzlyWmdYS1h4dzJiVUhYWXNlRVY0elh2bGdURkdhOWhZcENGTGFza2JR?=
 =?gb2312?B?eFZYSlIxcGNlMUhXZWFIUmlPRWxYand2ZGdmWVBjKzEyUllaME9GZ0JFNjN1?=
 =?gb2312?B?UWJoakRsYi8rSVFSazNBVUlta05Qb25RaHZhWkJISmNSblVsZUtQQWFvL3lY?=
 =?gb2312?B?R3JyM1hlUjJXMWw0bHNiR3ZVaDNrOVd6VzYzUGtwK3pGWHpGdEZ4VHM5emlZ?=
 =?gb2312?B?c3BaWmdrcEJVTHVWbUhKazRTUUlJZmkySW1hK0dxUkpOUjVRT0tqcnZmUUN1?=
 =?gb2312?B?YjFPcHFndStKQk8wVHNRc1ozQjVWRFFyeFg1RHQwdXgyYXQrK2lvL3FjdXhT?=
 =?gb2312?B?akd1ZmhQRkZ4blJ2MVcrdWZKcWJMTzYvNEhjNmdSNG1HcmxqeCtOZEdXSVVU?=
 =?gb2312?B?WVFoekxVanZpNEpqem0welVnTDFQRW43cG9YSHQ1L1lTMTRVZ2RTV1NTcGZV?=
 =?gb2312?B?NEpzZ2RmZ1dXN2NiWGFOTkkyRzBGMHlPYTNzRURZR21abGZqS2ZLTDd5Ni9K?=
 =?gb2312?B?TzNjWUQwNU95bGNLbDBlelgzdG5obzBsRDEwZHFYZ0JpN3RRZ2tILzJEY21N?=
 =?gb2312?B?Y0dvV2RjZndiV3JYWkV2K2NRWTRlWnFTSlFlNnBTNEk3aXJnN1daemwvYXhT?=
 =?gb2312?B?cDhuY0tndi8vUTUxRkVHWldRWC9Gcjl5QWNldUtsRHJuOUVXSkFFVFdQdkJH?=
 =?gb2312?B?OFpWaldIMmgwWFFXUjRpQm5nUUpudWJEQWtTb3RXaFNlOERXLzJHMzB3PT0=?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSYP286MB0103.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 4602a28f-0bb9-4fd8-2c92-08da9fb3221f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2022 11:34:54.6152 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB1738
Received-SPF: pass client-ip=2a01:111:f403:700c::805;
 envelope-from=zeyuzhang07@outlook.com;
 helo=JPN01-OS0-obe.outbound.protection.outlook.com
X-Spam_score_int: 54
X-Spam_score: 5.4
X-Spam_bar: +++++
X-Spam_report: (5.4 / 5.0 requ) BAYES_50=0.8, CHARSET_FARAWAY_HEADER=3.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PYZOR_CHECK=1.392,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 TVD_SPACE_RATIO=0.001 autolearn=no autolearn_force=no
X-Spam_action: reject
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

dW5zdWJzY3JpYmU=

