Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B55723063EE
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 20:19:25 +0100 (CET)
Received: from localhost ([::1]:44390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4qLc-0002Hq-GF
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 14:19:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1l4qJQ-0001TH-Sz
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 14:17:10 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:43940)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1l4qJM-0003Nr-DH
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 14:17:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1611775024; x=1643311024;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Y4v79DnYPFJ8UxS3VWC8a83XTixIh990iSya9HwB0iY=;
 b=Xdyz7/BGdBXiYHdro62Gr9/siBcJAMx8eK5e+L98TjI9W0e5YdVDvUJx
 /Vkc6BJ7fj66lVdweyop1IcxkSOoE8WEBKD6FJNLu5V40/ntnOFq/k6Jy
 dQ5SGjFqoYsd+roKQ0R4+mI61AFYrEaqOwPON1nk8N9CSzNcOHdXdroHR c=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 27 Jan 2021 11:16:59 -0800
X-QCInternal: smtphost
Received: from nasanexm03g.na.qualcomm.com ([10.85.0.49])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 27 Jan 2021 11:16:59 -0800
Received: from nasanexm03c.na.qualcomm.com (10.85.0.106) by
 nasanexm03g.na.qualcomm.com (10.85.0.49) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Jan 2021 11:16:58 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03c.na.qualcomm.com (10.85.0.106) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Wed, 27 Jan 2021 11:16:58 -0800
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB4248.namprd02.prod.outlook.com (2603:10b6:a02:fe::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Wed, 27 Jan
 2021 19:16:57 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::41f5:1c20:959e:559e]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::41f5:1c20:959e:559e%7]) with mapi id 15.20.3784.019; Wed, 27 Jan 2021
 19:16:57 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Paolo Bonzini
 <pbonzini@redhat.com>
Subject: RE: [PATCH v7 34/35] Hexagon build infrastructure
Thread-Topic: [PATCH v7 34/35] Hexagon build infrastructure
Thread-Index: AQHW7tyJHqJKhPkrvUekKvhDGjVNfao0P88AgAAB8gCAB5/xwA==
Date: Wed, 27 Jan 2021 19:16:57 +0000
Message-ID: <BYAPR02MB4886849FD7DF3EE79C49D787DEBB9@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1611113349-24906-1-git-send-email-tsimpson@quicinc.com>
 <1611113349-24906-35-git-send-email-tsimpson@quicinc.com>
 <0cd4a077-9358-4216-1dd2-d7212f5d082f@amsat.org>
 <a7ae2794-c445-f550-dd42-5f6456aa640b@amsat.org>
In-Reply-To: <a7ae2794-c445-f550-dd42-5f6456aa640b@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [76.120.51.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 258657c1-ce1e-4961-274f-08d8c2f81d47
x-ms-traffictypediagnostic: BYAPR02MB4248:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB424897D1AA939FB6A06C92CFDEBB9@BYAPR02MB4248.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ev075MWWdMToF1NU4KUrAhlrRm4N9b5e7VwWL99dW8RKGEmbpZMxamxE8CloY1/FVdmuyzrpuWrTlkhPHRMVqHsUhdf/FDnDK7brooPEOHPnWpe7VGqdfvwnfIgvvB4/BIzabE55qaN/fILxDbGbhTiYSNeD0rJCNCaEDuaHZE2R4220GLlRFqgIGKXRixUj6RKSYAiSUIgFOfCNqCPL7mBVy00/wIw/ebIebaRw5ZPGsohJEIqgBYyztMvd739sdscw7C0LKqTd4NjZikMqHy1eFiMjW+52OFwHABU6dhRJtwb/chR0lEhUrpK0Qz8S7gwIqu8BeEjjpheB8P0zJVWKlauUZn5pIV7E10enzaMFBqi1Qpwq0TVzIfFBd07DNv1cApN/Q3lB498Iww4ZSfEac4PED9gN8/Wlhr73Onq+s5Exc+p0Aj1Fg9Ej5+WxkGiawRbFz8NeGzS+Tl78QJQJXqsW5AxqEnavPlHpMIhWB7v7u5yvnTYTK56zX8aGlAZe6WLMrEVR9tgm6FSV6w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(366004)(39860400002)(376002)(83380400001)(6506007)(4326008)(5660300002)(2906002)(8936002)(66476007)(53546011)(66556008)(54906003)(478600001)(33656002)(55016002)(186003)(66946007)(66446008)(8676002)(316002)(86362001)(9686003)(26005)(107886003)(64756008)(71200400001)(76116006)(7696005)(110136005)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?VzZsZS9CZlU1MFdlOW5rZWNlcW1wdjh0eExweWVIV1RqQmdkT2JvU2haUVlN?=
 =?utf-8?B?SERwbnpIOTNjdHFBL3lMbHYraTZlUTcrWUJudVBmNGVoYmxGRjhyTkZxZDdk?=
 =?utf-8?B?OUQ5OTlCUGREWkVrdy9ZWHg0RVNGMVY1QVRKZFVMTnpkbS9DZUxxZkdaSFJl?=
 =?utf-8?B?RVBzeitVek9adGx2KzhpN3owZmxMZWQ0S1ZDZVlkbXZWNWxqTFdhdDlnL2dD?=
 =?utf-8?B?eFZEZndNMmR3SUlxMkJNdFVyRFZFQzBNOFlSWU9nN2hqbGh5UnVjTEpybXRT?=
 =?utf-8?B?Z3hERnp3eUV6N2JIZ3pKZE8zeTJvYnNSZVJsNW1ZTkpvYTlKN1RVeXgyRFZJ?=
 =?utf-8?B?Q0d6dk8wOCtDMkY2QXpWd0RXek1KTTJjN3R4Y3c4SlhLV0F6SHI1WlJabENO?=
 =?utf-8?B?blJ3Snk3bThMVm5WUDBTWGo3NzJXdUIxSHNlVERKWnZXTzdqV090NWROVEFI?=
 =?utf-8?B?SzVGMTdMSUdPb2QyYkpXTExxVEtObytqb1lEeDZ2THVCOVNvRTd1OUp1MTJQ?=
 =?utf-8?B?aTN4djR0WklDVXRvU1duaXEzYTBVWHMvYjZpazF1RE5VczJheE5iZlZNZlIy?=
 =?utf-8?B?TmZ3UlR3bU54Ty9PSmJPb1pCTkZKVWlMTlg1bUFPUWhLanJzNnlnVGdTRUVK?=
 =?utf-8?B?K1RhUGVweEtDWm9UUFNxeDNMZHRISm0wa2k0Nk4yRDM0NGkzREhIQlErL08x?=
 =?utf-8?B?ajJnTlFQY09hWlpGYzcvYjJjTVNmUmd6a2hYVkRGWnFvL283WWtIc0hVeUFi?=
 =?utf-8?B?bllQV0R1U2t3MGZkY3RlSkRxcS9lVDhhcWxHbTUzQ2FIVUJneHArODAzbzlN?=
 =?utf-8?B?bVVreGp3TTdHc2dqWHJnWVMvb2RnY0MyblZsVXZmRWRaQkxRZEVUUzVGNmtM?=
 =?utf-8?B?Uk43Y0cwUU9qZUtaT0FFcjYvTzZLWktXTXVlSEZVN3NZbUx0VnRVWUZYanpU?=
 =?utf-8?B?aDBqLyt4bi9scVlkaHBGZmhDdkwyV0ZxSTU4dlNxRmhYOGFnTDgweUZGQlpB?=
 =?utf-8?B?Y3l5bittQXZET0xqVTg2cndPdFNmc1g4YVhVeWxzQSt6WHZHMzhKanZ1ZVlH?=
 =?utf-8?B?aGp3R0k4UkRqdVViN1JxUVNSQTFkK0RDSHIweHErbDI4OGFidlAzSk90SWNG?=
 =?utf-8?B?RWdyK2I3SGtoazhEN0E2WDhIV0J4Q212OHR1NzhwTWZmNTRqRlVpbGxJeGhu?=
 =?utf-8?B?eVFueWhjb2Rvcm9SZXpuSVNiamZSTHBLblNNdm9xVU5tWlI0TEgrc08zb3Uz?=
 =?utf-8?B?dGUraWQ3K2J2NXVlNFQ3M2lBUHFobmk1WFRSVzk3VEZ6dlFZekdrMjh2Q3ZX?=
 =?utf-8?B?dHdKU1czSXBSTll0QkhhWDdCQmdIYnNjcTZvSjZnc0s1NUJkL1VFcEtIWVA4?=
 =?utf-8?B?YmsyR24rZXUrZnlNcnQwaS9tV0Z6ZXVIZHBrZG9CS3p2bTVmNkJ4ZzRIakFs?=
 =?utf-8?Q?dnq5KS28?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R8M+25TSanc9Fwn9lZLRLH/GavBsbjswr28/WsujFc6J9drL9WhukFAPAWuVEHwym7Jg1qo2i8acy9Wdru5i8RQoAIsNMMPN/mTe8gy02g6iVsgW08lP7cukVWE+ne/eUrJxwu3wicpVBqiH5bD4PvdrP+hvUHdezoSKVB5FlHYpzr0OOYi5Lqeg/yHjpH5rBoLDu268SrWJk/3JHR1Q1rcBauja7CQMZJ7jLVQWoXck7Oc+64bhkLy3Au14V+ltjoF5SPo2OEUI74gsS2G/Ju9Xw6GOmIsEafPXoQXdGjIRGMiapnttoFcvFFJHbbpwo6yA1CqPSmHq3bSa2vlNbA==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rm6ErHliKRUWA+IGlwonCYqxlX0siUFGTcmvv7P9t1o=;
 b=jpmOY9B1CnZhFvMbwknPSYvhkCV2SQuJGqfvFjQvBpgrhAHdOcJYpiHFp8sN9GIq/huiKrldqvDeE0mVbQR6h3mChJnT8xsVmgt9B6XSH+WULHfs1T983l57pWLA2KIUUdYAsi2evYwEiij8he25e0TKFKlCqmFPd/k2tmyIRb4oXItmxZcA/she1oifkBj/8Gb34Vt1aATUrWzj342M0dByzeKquIj9hP2oDAISZo9n8JOPF25IXunn6M4QsxRnaJTbi+hrd703lRTvadltmnxfvUYq48GZ2HE5HgAo/TVrnvSCCjL0FzJuGxb3Jr1XWuTDNzvhOf659JgKAnupkQ==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
dkim-signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.onmicrosoft.com; s=selector1-qualcomm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rm6ErHliKRUWA+IGlwonCYqxlX0siUFGTcmvv7P9t1o=;
 b=IXUQYINBxup4TLHeDcZkktDJhyPg1IY5s+CXHEMiFV9Eito8raqLliEwftYzocs2TpMnkg/K2H6uWAHqKUySnawu5EpO7P2KUHkkL8gnpCcCV/jlrULdy7CHy7e/qrSxtS2g9VsUyOASf+iXd0Nmeb1obGf+zKd7yAfAGXpcCSg=
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 258657c1-ce1e-4961-274f-08d8c2f81d47
x-ms-exchange-crosstenant-originalarrivaltime: 27 Jan 2021 19:16:57.0506 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: bKmgqpkMaCu+NqtoRgpTIq1vT4MMr1DcrcMWuwOb0hv2ZS7x9OFfuLt/BGfEwaniGiXeeVUPUCa+bM5b3DUwwA==
x-ms-exchange-transport-crosstenantheadersstamped: BYAPR02MB4248
x-originatororg: quicinc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=199.106.114.38; envelope-from=tsimpson@quicinc.com;
 helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: "ale@rev.ng" <ale@rev.ng>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "laurent@vivier.eu" <laurent@vivier.eu>, Brian Cain <bcain@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgPHBoaWxpcHBlLm1hdGhpZXUuZGF1ZGVAZ21haWwuY29tPiBPbg0KPiBCZWhhbGYg
T2YgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kNCj4gU2VudDogRnJpZGF5LCBKYW51YXJ5IDIyLCAy
MDIxIDQ6NDIgUE0NCj4gVG86IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT47
IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsNCj4gUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0
LmNvbT4NCj4gQ2M6IGFsZUByZXYubmc7IGFsZXguYmVubmVlQGxpbmFyby5vcmc7IHJpY2hhcmQu
aGVuZGVyc29uQGxpbmFyby5vcmc7DQo+IGxhdXJlbnRAdml2aWVyLmV1OyBCcmlhbiBDYWluIDxi
Y2FpbkBxdWljaW5jLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NyAzNC8zNV0gSGV4YWdv
biBidWlsZCBpbmZyYXN0cnVjdHVyZQ0KPg0KPiBPbiAxLzIyLzIxIDExOjM0IFBNLCBQaGlsaXBw
ZSBNYXRoaWV1LURhdWTDqSB3cm90ZToNCj4gPiBPbiAxLzIwLzIxIDQ6MjkgQU0sIFRheWxvciBT
aW1wc29uIHdyb3RlOg0KPiA+PiBBZGQgZmlsZSB0byBkZWZhdWx0LWNvbmZpZ3MNCj4gPj4gQWRk
IGhleGFnb24gdG8gbWVzb24uYnVpbGQNCj4gPj4gQWRkIGhleGFnb24gdG8gdGFyZ2V0L21lc29u
LmJ1aWxkDQo+ID4+IEFkZCB0YXJnZXQvaGV4YWdvbi9tZXNvbi5idWlsZA0KPiA+PiBDaGFuZ2Ug
c2NyaXB0cy9xZW11LWJpbmZtdC1jb25mLnNoDQo+ID4+DQo+ID4+IFdlIGNhbiBidWlsZCBhIGhl
eGFnb24tbGludXgtdXNlciB0YXJnZXQgYW5kIHJ1biBwcm9ncmFtcyBvbiB0aGUNCj4gSGV4YWdv
bg0KPiA+PiBzY2FsYXIgY29yZS4gIFdpdGggaGV4YWdvbi1saW51eC1jbGFuZyBpbnN0YWxsZWQs
ICJtYWtlIGNoZWNrLXRjZyIgd2lsbA0KPiA+PiBwYXNzLg0KPiA+Pg0KPiA+PiBTaWduZWQtb2Zm
LWJ5OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+DQo+ID4+IC0tLQ0KPiA+
PiAgZGVmYXVsdC1jb25maWdzL3RhcmdldHMvaGV4YWdvbi1saW51eC11c2VyLm1hayB8ICAgMSAr
DQo+ID4+ICBtZXNvbi5idWlsZCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
ICAxICsNCj4gPj4gIHNjcmlwdHMvcWVtdS1iaW5mbXQtY29uZi5zaCAgICAgICAgICAgICAgICAg
ICAgfCAgIDYgKy0NCj4gPj4gIHRhcmdldC9oZXhhZ29uL21lc29uLmJ1aWxkICAgICAgICAgICAg
ICAgICAgICAgfCAxODcNCj4gKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+PiAgdGFyZ2V0
L21lc29uLmJ1aWxkICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArDQo+ID4+ICA1
IGZpbGVzIGNoYW5nZWQsIDE5NSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgZGVmYXVsdC1jb25maWdzL3RhcmdldHMvaGV4YWdvbi1saW51eC11
c2VyLm1haw0KPiA+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRhcmdldC9oZXhhZ29uL21lc29uLmJ1
aWxkDQo+ID4gLi4uDQo+ID4NCj4gPj4gKysrIGIvdGFyZ2V0L2hleGFnb24vbWVzb24uYnVpbGQN
Cj4gPj4gK2hleGFnb25fc3MgPSBzcy5zb3VyY2Vfc2V0KCkNCj4gPj4gKw0KPiA+PiArcHJvZ19w
eXRob24gPSBpbXBvcnQoJ3B5dGhvbicpLmZpbmRfaW5zdGFsbGF0aW9uKCdweXRob24zJykNCj4g
Pj4gKw0KPiA+PiAraGV4X2NvbW1vbl9weSA9ICdoZXhfY29tbW9uLnB5Jw0KPiA+PiArYXR0cmli
c19kZWZfaCA9IG1lc29uLmN1cnJlbnRfc291cmNlX2RpcigpIC8gJ2F0dHJpYnNfZGVmLmgnDQo+
ID4+ICtnZW5fdGNnX2ggPSBtZXNvbi5jdXJyZW50X3NvdXJjZV9kaXIoKSAvICdnZW5fdGNnLmgn
DQo+ID4+ICsNCj4gPj4gKyMNCj4gPj4gKyMgIFN0ZXAgMQ0KPiA+PiArIyAgV2UgdXNlIGEgQyBw
cm9ncmFtIHRvIGNyZWF0ZSBzZW1hbnRpY3NfZ2VuZXJhdGVkLnB5aW5jDQo+ID4+ICsjDQo+ID4+
ICtnZW5fc2VtYW50aWNzID0gZXhlY3V0YWJsZSgnZ2VuX3NlbWFudGljcycsICdnZW5fc2VtYW50
aWNzLmMnKQ0KPiA+PiArDQo+ID4+ICtzZW1hbnRpY3MgPSBjdXN0b21fdGFyZ2V0KA0KPiA+PiAr
ICAgICdzZW1hbnRpY3NfZ2VuZXJhdGVkLnB5aW5jJywNCj4gPj4gKyAgICBvdXRwdXQ6ICdzZW1h
bnRpY3NfZ2VuZXJhdGVkLnB5aW5jJywNCj4gPj4gKyAgICBpbnB1dDogZ2VuX3NlbWFudGljcywN
Cj4gPj4gKyAgICBjb21tYW5kOiBbJ0BJTlBVVEAnLCAnQE9VVFBVVEAnXSwNCj4gPj4gKykNCj4g
Pj4gK2hleGFnb25fc3MuYWRkKHNlbWFudGljcykNCj4gPg0KPiA+IElzIHNvbWV0aGluZyBtaXNz
aW5nIGhlcmU/DQo+ID4NCj4gPiAkIG1ha2UgLWo4DQo+ID4gWzMxNi8xMDQ4XSBHZW5lcmF0aW5n
IHNlbWFudGljc19nZW5lcmF0ZWQucHlpbmMgd2l0aCBhIGN1c3RvbQ0KPiBjb21tYW5kDQo+ID4g
RkFJTEVEOiB0YXJnZXQvaGV4YWdvbi9zZW1hbnRpY3NfZ2VuZXJhdGVkLnB5aW5jDQo+ID4gdGFy
Z2V0L2hleGFnb24vZ2VuX3NlbWFudGljcw0KPiB0YXJnZXQvaGV4YWdvbi9zZW1hbnRpY3NfZ2Vu
ZXJhdGVkLnB5aW5jDQo+ID4gL2Jpbi9zaDogMTogdGFyZ2V0L2hleGFnb24vZ2VuX3NlbWFudGlj
czogbm90IGZvdW5kDQo+ID4gbmluamE6IGJ1aWxkIHN0b3BwZWQ6IHN1YmNvbW1hbmQgZmFpbGVk
Lg0KPiA+DQo+ID4gJCBtYWtlIHRhcmdldC9oZXhhZ29uL3NlbWFudGljc19nZW5lcmF0ZWQucHlp
bmMgVj0xDQo+ID4gL3Vzci9iaW4vbmluamEgLXYgICAtajEgIHRhcmdldC9oZXhhZ29uL3NlbWFu
dGljc19nZW5lcmF0ZWQucHlpbmMgfCBjYXQNCj4gPiBbMS8xXSB0YXJnZXQvaGV4YWdvbi9nZW5f
c2VtYW50aWNzDQo+IHRhcmdldC9oZXhhZ29uL3NlbWFudGljc19nZW5lcmF0ZWQucHlpbmMNCj4g
PiBGQUlMRUQ6IHRhcmdldC9oZXhhZ29uL3NlbWFudGljc19nZW5lcmF0ZWQucHlpbmMNCj4gPiB0
YXJnZXQvaGV4YWdvbi9nZW5fc2VtYW50aWNzDQo+IHRhcmdldC9oZXhhZ29uL3NlbWFudGljc19n
ZW5lcmF0ZWQucHlpbmMNCj4gPiAvYmluL3NoOiAxOiB0YXJnZXQvaGV4YWdvbi9nZW5fc2VtYW50
aWNzOiBub3QgZm91bmQNCj4gPiBuaW5qYTogYnVpbGQgc3RvcHBlZDogc3ViY29tbWFuZCBmYWls
ZWQuDQo+ID4gbWFrZTogKioqIFtNYWtlZmlsZToxNzI6IHJ1bi1uaW5qYV0gRXJyb3IgMQ0KPiA+
DQo+ID4gT0ssIEknbSBjcm9zcy1jb21waWxpbmcsIHRhcmdldC9oZXhhZ29uL2dlbl9zZW1hbnRp
Y3MgaGFzIGJlZW4NCj4gZ2VuZXJhdGVkDQo+ID4gYnV0IHdpdGggYXMgdGFyZ2V0LCBhbmQgd2Ug
d2FudCBpdCBsaW5rZWQgZm9yIHRoZSBob3N0Li4uDQo+DQo+IFNvIEkgY29tcGlsZWQgaXQgbWFu
dWFsbHkgdXNpbmc6DQo+DQo+ICQgZ2NjIC1vIHRhcmdldC9oZXhhZ29uL2dlbl9zZW1hbnRpY3MN
Cj4gfi9zb3VyY2UvcWVtdS90YXJnZXQvaGV4YWdvbi9nZW5fc2VtYW50aWNzLmMNCj4NCj4gVGhl
biBzYW1lIHN0b3J5Og0KPg0KPiBbMTQvNjhdIEdlbmVyYXRpbmcgaXNldC5weSB3aXRoIGEgY3Vz
dG9tIGNvbW1hbmQNCj4gRkFJTEVEOiB0YXJnZXQvaGV4YWdvbi9pc2V0LnB5DQo+IHRhcmdldC9o
ZXhhZ29uL2dlbl9kZWN0cmVlX2ltcG9ydCB0YXJnZXQvaGV4YWdvbi9pc2V0LnB5DQo+IC9iaW4v
c2g6IDE6IHRhcmdldC9oZXhhZ29uL2dlbl9kZWN0cmVlX2ltcG9ydDogbm90IGZvdW5kDQo+IG5p
bmphOiBidWlsZCBzdG9wcGVkOiBzdWJjb21tYW5kIGZhaWxlZC4NCj4NCj4gJCBnY2MgLW8gdGFy
Z2V0L2hleGFnb24vZ2VuX2RlY3RyZWVfaW1wb3J0DQo+IH4vc291cmNlL3FlbXUvdGFyZ2V0L2hl
eGFnb24vZ2VuX2RlY3RyZWVfaW1wb3J0LmMNCj4gdGFyZ2V0L2hleGFnb24vZ2VuX2RlY3RyZWVf
aW1wb3J0LmM6MjQ6MTA6IGZhdGFsIGVycm9yOiBxZW11L29zZGVwLmg6IE5vDQo+IHN1Y2ggZmls
ZSBvciBkaXJlY3RvcnkNCj4gICNpbmNsdWRlICJxZW11L29zZGVwLmgiDQo+ICAgICAgICAgICBe
fn5+fn5+fn5+fn5+fg0KDQpJJ20gYWJsZSB0byByZXByb2R1Y2UgYW5kIGZpeCB0aGVzZSBwcm9i
bGVtcyBieSBidWlsZGluZyB3aXRoIGRlYmlhbi1hcm1lbC1jcm9zcy4gIFRoZSBzb2x1dGlvbiBp
cw0KLSBBZGQgIm5hdGl2ZTogdHJ1ZSIgdG8gdGhlIGV4ZWN1dGFibGUgZnVuY3Rpb25zDQotIERv
bid0IGluY2x1ZGUgInFlbXUvb3NkZXAuaCIsIHVzZSB0aGUgc3RkIGhlYWRlciBmaWxlcyBpbnN0
ZWFkLg0KDQpJIGFsc28gc2VlIHRoZSAzMi1iaXQgcHJpbnRmIGZvcm1hdHRpbmcgZXJyb3JzIHlv
dSBtZW50aW9uZWQgaW4gdGhpcyBidWlsZC4NCg0KVGhlc2UgZml4ZXMgd2lsbCBiZSBpbmNsdWRl
ZCBpbiB0aGUgbmV4dCBpdGVyYXRpb24gb2YgdGhlIHNlcmllcy4NCg0KPiBCVFcgeW91IHNob3Vs
ZCB0ZXN0IHlvdXIgYnJhbmNoIG9uIGdpdGxhYi1jaSwgSSdtIHByZXR0eSBzdXJlDQo+IHZhcmlv
dXMgam9icyBmYWlsLg0KDQpJJ2xsIGxvb2sgaW50byB0aGF0IGFzIHdlbGwuDQoNClRoYW5rcywN
ClRheWxvcg0KDQo=

