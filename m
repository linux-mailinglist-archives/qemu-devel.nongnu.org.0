Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 241955EB7D6
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 04:41:50 +0200 (CEST)
Received: from localhost ([::1]:45240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od0Xc-0006jX-MD
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 22:41:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zeyuzhang07@outlook.com>)
 id 1od0Ui-0003zX-0S
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 22:38:48 -0400
Received: from mail-os0jpn01olkn2046.outbound.protection.outlook.com
 ([40.92.98.46]:61006 helo=JPN01-OS0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zeyuzhang07@outlook.com>)
 id 1od0Ue-0004lp-JJ
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 22:38:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P9SDEB3zGD+LZ5tzUlDyNpKVcR0unLKPunZoCoOUkNwfHscyeojJYrf1Yx0WqEKQIqklomL6mMKisdADaUJYCtF49ExpJECQWBUcm1EM8yoOJHxyCKPSHZTM2d/3fWFsSGdLKXmcpPYaigIKbi1ApgfUOTuwtrUt6cUwNxLVTkRx4Sgc8TJjYivD8ZxLKt0h+UPRiGpQEoKO0NObqBjhQ+B0kYKSs7xGHJRvq/wn1XlXeiznqQmn5ET3nuMDfYGhJ05ovhohdvhGL8XuGTBBv/R6WpBzjNkvyYlxlmXf+9aqXdFBvQlOcnEhEqWS6T11n/h2i0fs2oUaiFTyZN5diw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UDY4+LTi0PDN2TuCGruIoEHyLEOW7nAW2UV/QpdiK5A=;
 b=CKu/976+fwv8CmnE1ALLUXFIpCkPMhUgeW1Y96w6d4MuQ4r7c7nxmqI2SKoCbgzjI0X0e5mJQIK3FLvHAEUvAvftA9v7O5ZkyywTpnvcecF0kfIHDcawhNZPN4/dKi9QBx2nFSNZH6YSgwpvEt+5bN3jzQoX4mumfWhHHjdDnihib1f5N4+Wq7V6nukxfvT3lx+5sqmDdMz38SC0VxiDNft8piaP5LVlrEA6iHvNoCyuuEDMQ+TF3JpTPIn6Tyoqz8CT/pE9aD6Aksyc/UJBjZ+5YjkthC2U5KUHe/ewSIKA4upJhKg7vpZz9BCYqKn9ifWmv6tJEDbmo7XlvZ2vwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UDY4+LTi0PDN2TuCGruIoEHyLEOW7nAW2UV/QpdiK5A=;
 b=eUu7tuPhfUHd3wPCs0ChqcRmKhCcO1LqAXtqC6AYww8N0akaATbkf2D3RgcxqL9GcZI3sBvAlsnKdbiAp6xGCooumAGypsX5AGmj6HIAryvqkIZsqLLNU9snNp+FOQ+7KEnpFuPGJxKjrB6uIrfretO2xrq94Kr3uwZsZVm11ysw1x5Tho+ABGkCsm2m1M2s7b28blpaYAbZYBGxBPgjmoEX4llGJp8ym7hbuT0+Cqx+CVmuiHlFajyz2FzT58ltZllHThs7PED4hq6FNc3xfcUulkoh/OtyoqADtCF/hwXZyAmhnztD2K9ep+Kx/VlfcBkBGyuNDs9OOjL0HPlpzA==
Received: from OSYP286MB0103.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:83::12)
 by TYCP286MB2400.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:18d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 02:38:39 +0000
Received: from OSYP286MB0103.JPNP286.PROD.OUTLOOK.COM
 ([fe80::8b83:8fb9:2676:a925]) by OSYP286MB0103.JPNP286.PROD.OUTLOOK.COM
 ([fe80::8b83:8fb9:2676:a925%9]) with mapi id 15.20.5654.026; Tue, 27 Sep 2022
 02:38:39 +0000
From: =?gb2312?B?1cUg1PPT7g==?= <zeyuzhang07@outlook.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: 
Thread-Index: AQHY0ho7ANqZ147m7UuCBMwpegXgyQ==
Date: Tue, 27 Sep 2022 02:38:39 +0000
Message-ID: <OSYP286MB010371CD47B8CBD4D7B0CB62B2559@OSYP286MB0103.JPNP286.PROD.OUTLOOK.COM>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-tmn: [hl1Z2PRWiPfZUDLOFMYLzTzFy9bNnhPs]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSYP286MB0103:EE_|TYCP286MB2400:EE_
x-ms-office365-filtering-correlation-id: fea3c038-e4af-4217-0593-08daa03162bd
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CGjbB2YRVxget6Y7rHlWPh3800sh7YSOAXnTeEtG6N2h6vE4IMpbAIrwTSAtyB6iS9vDHgj9/QfsWcclsixZfkRzMpzkwn3KOZ7jj2ajB1ii2Re5xdxCHMWpG3V8gxzmoEAfVe6PQGrZVbR/OHMSGLRc2rXE3SKqgmApW4Iv7viFk3671LIzEvLVQS9psN5PA3qoah0CjxL9MsANRT2f7V6ISFAAoVapxNCp4qKe3n5BcO68rinuU21YzpHUKPY1yIELmziNQvHjdTHdFmRcnIfYVXjBxer5X1PWW41mc/Ws5mVl5P2BG9O9fB7Oc7kkX3LBScHCu3o7UbWvGpcqymbiXj1tU5uMcdG8b1usuIZRAFXI635DnIYp+TXDswbXYPrMLiNwlneOYmONs2iCD8Gnfm+pbzdf6aJQPYH0qDp+u2CuVL3qhuXBfrfCVxpbyACZEzw09BsDBN8jGOeoJWmJluJktqD2PpZNBZ2JDqgDWHzF9WgQcBc0dNR/JHRDiok2bM5o36PPXOj0WNTZN5qB/TonYGlWR+zq2hN90tOVGNMs6NBFgTcBCL+iu1EeXDU0onGi96tcS0iX/AWqeCGIUaI6Mib7OokCQduCNiCbfG8ZOV6EHSjZV1E4ut6YNHfgP/dHcZOB1OESrmV3zw==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?N0hzOUlGaHVnanBOajE1UVJzcGpkUlBBOGpqZWJjeExmY243eUJ1ZFIwNERq?=
 =?gb2312?B?aGxMczJGNTh6L3lYbGd1TGowUkJqWUs2QTVjVjhsM3hDNkgrTHJ6ajdLdVJN?=
 =?gb2312?B?eEMwc2VKWmJpZjg4RkcwaXlvRHp5YkdlSm5ZYzY3QmxDUnR0RmF6Q2xxYUtG?=
 =?gb2312?B?SjE5aUpxdXVHOHhnMVB5UWpuclR1akFoQVBaTC9CWDNzeWxGc0pGY2djd1hx?=
 =?gb2312?B?QTlhY1Q5MEdYN3QxTVcrUFg0WWZFQlpYY3VyV3hvTXEvbVVRb2M1NW5MdFN4?=
 =?gb2312?B?eDk0UHBlS25GelNRVTBKUUJTUjlwenE3Ym52K09VRVYyNFg1NE1qaHphZTlP?=
 =?gb2312?B?dlFGZTJZMm03c0NVUnltUXQ2eVpkQ2VVSUkvcFRWUTZ1d3RkQzZwanpOT3k4?=
 =?gb2312?B?ZmJkTVVyZ1NaZVZOK3A4V2FIdjk3QXJXbUdlZEtoUkVoQWI1SXkzc3poTU5o?=
 =?gb2312?B?QnNZNlBHVDlUenVwWFNPSlI5MU5aQ2p4VVhBNVExdzZpVXdSRVJib0ljeXBP?=
 =?gb2312?B?emdwcTlwbXBISitOVm5XaUZ2dXdwMDJhN0o5VzlrQ0lVYlNjWU4zOWw0Vy9h?=
 =?gb2312?B?eXp4aWdZY09NSVMrVUEyZG5PQlBESHFKekdSOUpjTXRRNVE3RUtxNzZZaDdH?=
 =?gb2312?B?dVRzaFozaGh2MmdrdzBrWTZyTVZ3UzJ0eFBUa05pV3J1aTJsKzYrcGlaU2ZH?=
 =?gb2312?B?aFFRaHNuK21CbEZzdnBZZzR2di8yZDhseXVrWXl5WlBpdVExd2NDUnRvOHhN?=
 =?gb2312?B?eFlTdFo5QXJVYXNtdTB1WnkybVF2ZGxCNmVwaXczOVgxaThHSkhuRDUycGRv?=
 =?gb2312?B?b2pBU1RYbkgwLytpa1d5U1M2NVFOQTAzNndGbGRxQ2drSGlJQmEyRndUOXRo?=
 =?gb2312?B?emJIdE5EQ2QrSGkzR0tiZXpzRTJMa0NWYWpDRzRMYTVSV1N3a3ZaZVlveGIr?=
 =?gb2312?B?QXdQUXNKZmlyRHpjRGxUTURxdnVVRFQyV1YrT2JoT3hEbTFSQndQYkVtWDFn?=
 =?gb2312?B?Uno5U2NxZVREV045KzNNbGE4MVBWQXFhL1lmbFNML0VFMGdKTk1meENJWGt1?=
 =?gb2312?B?WU9zbFlaUzFBRnV1ZHo5TTJNa1BUU0dDdXdVTVh6dEROQW5MMkJxVkovVE9W?=
 =?gb2312?B?OHZ0Wll4WVFDb1RuL09nQVd5a2piOG5tUlkxbUhUck1jUCs5Zlp5VHI5NVdx?=
 =?gb2312?B?QzJ6N2JlNmJuQmtrdW1SL3RqbERvK0RHZm1kbnpRYU9Ha0ZxZ1BtcEJ2SThF?=
 =?gb2312?B?RVpOVXhSYzRjaENQc25yTFlRdVZjYWtrSE1JMzNIN1lPN2d2VE42cnJkaXVs?=
 =?gb2312?B?aEhZY1hlZXg4SmJJTFhPakpvOFZMRFN6MXRCWGZDUE9jUG9vdHB1aXp5Y2Rt?=
 =?gb2312?B?UVpDM1o4bm9pQkpzYlpkQjltUllJZ3ZkRHVmeHpGRm1qa0dTdmpqUmtsNkMz?=
 =?gb2312?B?UXFsY2hRKzY5Kzg0R0dRN20vbG0yYzJ2Y2dXenFFc24wOXlQMnc1YUZnbFQr?=
 =?gb2312?B?OENoSk55SlNBOEY2WHZoalFkMEwwTUt2eXZZR0FmTG1BZ21XUTFYSDRCa0JO?=
 =?gb2312?B?cEgrK1Bjd3Q1c1NpTi82SzFxVnpJbkpyMnlVYmVpekYwMUxTbDdMYS9sQ2dt?=
 =?gb2312?B?UURMQU9IVDJweVJxZEZmekFSbUtMd3BTL3B5a1YzKzBFeit4YlQwNlphc3du?=
 =?gb2312?Q?XnHbH0Xv3IUAMbyKxxWX?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSYP286MB0103.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: fea3c038-e4af-4217-0593-08daa03162bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2022 02:38:39.6274 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB2400
Received-SPF: pass client-ip=40.92.98.46; envelope-from=zeyuzhang07@outlook.com;
 helo=JPN01-OS0-obe.outbound.protection.outlook.com
X-Spam_score_int: 46
X-Spam_score: 4.6
X-Spam_bar: ++++
X-Spam_report: (4.6 / 5.0 requ) BAYES_40=-0.001, CHARSET_FARAWAY_HEADER=3.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PYZOR_CHECK=1.392,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 TVD_SPACE_RATIO=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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

