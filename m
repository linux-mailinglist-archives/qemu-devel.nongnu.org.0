Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D8B34076C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 15:12:42 +0100 (CET)
Received: from localhost ([::1]:37900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMtOD-00028h-Cy
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 10:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lMtMw-0001h3-4D
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 10:11:22 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:1544)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lMtMo-0001wO-F4
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 10:11:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1616076673; x=1647612673;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rREipLUXNWyLSnxPr03rO/lj1wE8EYqkKOAgFmseix8=;
 b=e1K0UzqmV1hzNfESKGzO32/5cQtR0X5+5ZAkc8XxpdTw4zBfhAR2MGYC
 oq+SK0h6iOEhrKUFl/mI2tjKcAZlRMu1LjAAde3tu9GTdhQCD0x+wxDMI
 vWJ/Y8FlkABkMM0Ksj+NbBgrXBvfMmkxKmWgkDg+fwQ/U3RmIsJ45dkbw s=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 18 Mar 2021 07:11:11 -0700
X-QCInternal: smtphost
Received: from nasanexm03d.na.qualcomm.com ([10.85.0.91])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 18 Mar 2021 07:11:12 -0700
Received: from nasanexm03g.na.qualcomm.com (10.85.0.49) by
 nasanexm03d.na.qualcomm.com (10.85.0.91) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Mar 2021 07:11:11 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03g.na.qualcomm.com (10.85.0.49) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Thu, 18 Mar 2021 07:11:11 -0700
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB5158.namprd02.prod.outlook.com (2603:10b6:a03:6c::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 14:11:03 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6%4]) with mapi id 15.20.3933.033; Thu, 18 Mar 2021
 14:11:03 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v8 16/35] Hexagon (target/hexagon/conv_emu.[ch]) utility
 functions
Thread-Topic: [PATCH v8 16/35] Hexagon (target/hexagon/conv_emu.[ch]) utility
 functions
Thread-Index: AQHW/d3RWNOD5HbBV0+y+7C+tID81qpYLD8AgDEW6/CAALbMgIAACtJg
Date: Thu, 18 Mar 2021 14:11:03 +0000
Message-ID: <BYAPR02MB4886CE42E5E7E79CD9C5006FDE699@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-17-git-send-email-tsimpson@quicinc.com>
 <f0ff8663-9ea2-e8be-9123-4afffc41bad2@linaro.org>
 <BYAPR02MB4886A70EA367526D5834F501DE699@BYAPR02MB4886.namprd02.prod.outlook.com>
 <75d9fed2-ac04-846b-1426-6cd9fe657924@linaro.org>
In-Reply-To: <75d9fed2-ac04-846b-1426-6cd9fe657924@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e6757b0-6f2d-40ec-1547-08d8ea17aa19
x-ms-traffictypediagnostic: BYAPR02MB5158:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB51584A1B84310F18632748FEDE699@BYAPR02MB5158.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ms9z6rAZxh1CTWBLrn7ptc6eWS9pBccia8aiYCDPmFGdUh00wyA2jGx+P9TuU4S5aJJJ1HNsG/lGBFNR8uu9GR8q5p/TbgiE72XfsBi5a31pesSbYrw+sDAaxfDRB+HXC8K9r8bLvYEe+keAanIgTZ2XIhR6DYWXWFyhU9O59GN6xBoGUw0Qm6SAKU4BpNkp+9aXylwZENrhBWkoN4If+OKZqmsfWP9WJOKEee0FH7ngKzHwUZFrkbqiJRLL6pn0p9Anpt6iCS90TDJVnP15zxUiM8KYcRWW076dg7EggX/M1Oinlphr1i2m4INqlFDJW9yHq4IPzuPGJNmxAHftuJ21GQx1x8L4rdlrREWFOfuesT6omLbuxKNNnaOsnZi0TRF9hpNYOL8ma4yFUti4XXnoeOQ9dp8GPbRs09idIHCXLPXL7i49TkeJTMC+4vWmStfZn2qDVVf9BRHBv9Ct8uAjX6a1xb0K955El1Ztzbzs86MJ0lyrNGz3eiVei0HFYrNO24kNbYLvIbQ05A9pcLG1A9Vl26RcK7EW6pdRNldqxXO29kqNPCgFfB7IVpGJo4oEpoP9CRqB70CAgOc38MTNdK+fbvis5hGvj/cBwNA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(39860400002)(366004)(396003)(86362001)(8676002)(26005)(53546011)(8936002)(54906003)(6506007)(33656002)(2906002)(83380400001)(186003)(4326008)(5660300002)(9686003)(316002)(38100700001)(7696005)(478600001)(66946007)(71200400001)(64756008)(66476007)(66446008)(55016002)(66556008)(107886003)(76116006)(52536014)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?S1Y4VGJxTHEycHJSejdoWm9LSU9Ua2EvdTJsc21KSVNEZlIrLzBac252bm91?=
 =?utf-8?B?Tno2Ky9paXkwdmo1b09nMGhkSFdCTm8wTU1FNWRXU3ZnNXJaSTBTdEdpTUZD?=
 =?utf-8?B?d2t6ZXY3ZStkaVcwOTJCemtGNUhJMTdEUWVDSFJXSFFKcFlUbTR4UFhJWUtj?=
 =?utf-8?B?K1BnbXA0V1lyaDZPbTU2TXlaOTRTVmJONzVEQzdpVWRCVDJyMmZlSWZRRXh4?=
 =?utf-8?B?ZG5pVm12aW53ZkFIME1pbndJbW85YjNXeVdDRjhxWFJrMnpRN1ZtdzQ0L05M?=
 =?utf-8?B?eUJWWEpnQUl5ZWxXRTZSMzhyZ0ZoVUNwL3dGOXl2M3NEOElZckFGc1U2Q0tJ?=
 =?utf-8?B?QUVhaVUxMTM4Um12bUp0eUJhMjFtM3FhUER2cXl4NUQ4NThaZm1hTmVJNmJH?=
 =?utf-8?B?c0dmVjdXd0NwSDRpbUY3WEFoTnRzeFExcWJRZEtXRUI0YWJSall3SU9QdlU0?=
 =?utf-8?B?QkRjMEQ0ZFkxQ3puNE0yam1mZWVrb0NVWDJ2dVEyZExmTHUxNnl2b3hRVTEy?=
 =?utf-8?B?QjlJdWlLR2M3SUlsQTRGTXlIZmVIS2p3MnAwV3RTNUd6d2lMUllYVFFSL3B2?=
 =?utf-8?B?YjFReGNZb09FU1JnK3o5RDJUNWZ5TkRmNHZpYktQdkFlY0prMlBiWm1wNElJ?=
 =?utf-8?B?RmVOcVdmNEMyYXhwVUNISWtiRlRrbGRiekpLMEdEYUx5SEdlTnZWRVlhV293?=
 =?utf-8?B?NVcydGtWOXZqSjZmSUlGOWF2YmhzQlQxZXFsZHFnYXlQbWhhUThWMkhTcG15?=
 =?utf-8?B?Q3BuS3RJN0NEVkFYVHdwRzUxUFhWUkxQYkc1RkI5Y2NZdWhGRDgwZ0Y2Smg0?=
 =?utf-8?B?bjJPU2l0cW5iNVkxMEpGdXZsa0g2blo2VUdtSUV1WkxoZVhCQlRGQThZMzJV?=
 =?utf-8?B?OFJQU3g2K0dXMTJpcGxRTDlNMy9vVDQyL1JQZEpwc25yOGI2UHJ4bHhMVnds?=
 =?utf-8?B?VUxId1lCbXFubEdVTnlCRjRIczlhWGw5T1RZekVTVTg5blNvVDllaUNQbGVU?=
 =?utf-8?B?TTJSVzNIbFFhK3doSWd6RkcyNE9FdTlrQlQrN21USjc4aG9rMlBpc3lma0RH?=
 =?utf-8?B?WUpaWjZsSWNmWGFnVkloakQvVzk3QXhLSUFvM1pyU29lM3QyZTkxd0RuTnBw?=
 =?utf-8?B?Q1IyQUdZM2QvQU5IajJjc3NGK3J2NVpucEE2L2dMVEZFRXRxVlNMaHh0bjlW?=
 =?utf-8?B?NWJUL0xvNHZnV3g5V0JKdk4xODdoRXdyMjRJR291bHhLUmdJZkk4ZVZlWkdJ?=
 =?utf-8?B?NmtxVUNOalM0anM0bm5IUGFwekxiN3AxRC90dVpuQ0FtSHBsMTQwMzFMekY5?=
 =?utf-8?B?UWN3RzNDOGJaRWdzZ2ZLL0o1TFlVRTczRG5lbTFFSEovZkhjanBVaEN5YzFI?=
 =?utf-8?B?TXhjdGNtM2xpdmIvQTJPYmo0K3c2T0hxVWFlM04xQjc3YnQ5RHpjTXlOV1lm?=
 =?utf-8?B?Q2ErMWF6SVBKZndsTUZ0ZGdPVlU2Zm1UTDVIdmNSQU5HcjZzMVY5elk1TXZi?=
 =?utf-8?B?eWxKbGk3M2kxUTREZjdDQVVwQndlQTRTU1hVU1lxdzBMTEN2QkIvN2tQbFY2?=
 =?utf-8?B?cTQvM3dETGdWblZuTWFSdG1PZkhkMDJFWTVkRTJPOXk0dno1NHR5YTR4U0g3?=
 =?utf-8?B?dzFBeXN5RHovRk9POGcvVTVFUjVhR3R1elNkZnhmTjJvMlBxckpzRE5tS3la?=
 =?utf-8?B?S0l3NkJzbmhzd0c3SEVxOTBpUDJGcmMvcktCdEZsek1xMW9Xekx4ODB6MldW?=
 =?utf-8?Q?R1f2LGXBLlEsJmbweb6jBL8Z+hk5x+WFR/mUkb+?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmELdWX/EG99aujghj91Boh+oEYKF5CxAO73tEFpUb/PQQ46eKij4VAioAIV/mU9Qg14YbB8qd/whhMrxvA3zqpQZil8AmrELvwgTt45aQL0dUf1s2JjKdmWmV820yWR5kLQXXXk/sY5P5KJrMWU9r8DehaXROoZpFVfdUpGx3RJtjg1i30ClGzWEQs8ZX7e+2LwBPgj5ezgpm1A18q9WxL0o9A6O40q5swEEJWpJrac9jKlahDMaYMhnptM4Ev+9hgczUffw9ysOU+D4zD3RO3eblXu2uOOlodvoR3d6FoBOuCGU4lSro6G79oNDEB8308UjkLrhnv7Ur9BTv24kg==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wvuUajofsAfWWCoTV9sAUgCufQR0XgZXPgJsuF1icQ4=;
 b=cu6dwCYLdoYvXGRjNhc+hUcB/TQ0bkvTXtbQZ9rqeHkSh2WZqB9FeN9qBIUtmP0AimgVflwpQZQqsYifeWND/ZiOCbcMNlCgT0y3LVZVvRRyKvVVgQZzUov7wX5NE4Ogrnps/VESsE4a+FT0U7ojPmcKeCA7BLEqVEwYsZjPqNnLgQmxEj9p8W/rr9UoYlM+qG7HbwN1sI25e5kxS3z22ST8uZ/82d7GjwH6F6kvasiah7qHOKZJiFgWKn7JlzvDG+T08rO4wM/8IAcEQaYKhNafnrH2MoFUIZ6+nQHQPJiF9Gm3LhK3yzMZyln6SlpzEyS0C+v2Jz76deUb3eaiyQ==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 8e6757b0-6f2d-40ec-1547-08d8ea17aa19
x-ms-exchange-crosstenant-originalarrivaltime: 18 Mar 2021 14:11:03.0344 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: jcKVYRDppS47jYJUYkP1RsoOuWUZrUtl7xUTmvdVki7/4Q/9zkopwZ15qJC+osLnuX+bzwW8RjnkYXHqOTEmhQ==
x-ms-exchange-transport-crosstenantheadersstamped: BYAPR02MB5158
x-originatororg: quicinc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=199.106.114.39; envelope-from=tsimpson@quicinc.com;
 helo=alexa-out-sd-02.qualcomm.com
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
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "philmd@redhat.com" <philmd@redhat.com>,
 "laurent@vivier.eu" <laurent@vivier.eu>, Brian Cain <bcain@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBNYXJj
aCAxOCwgMjAyMSA4OjMwIEFNDQo+IFRvOiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2lu
Yy5jb20+OyBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IHBoaWxtZEByZWRoYXQuY29tOyBh
bGV4LmJlbm5lZUBsaW5hcm8ub3JnOyBsYXVyZW50QHZpdmllci5ldTsNCj4gYWxlQHJldi5uZzsg
QnJpYW4gQ2FpbiA8YmNhaW5AcXVpY2luYy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjgg
MTYvMzVdIEhleGFnb24gKHRhcmdldC9oZXhhZ29uL2NvbnZfZW11LltjaF0pDQo+IHV0aWxpdHkg
ZnVuY3Rpb25zDQo+DQo+IE9uIDMvMTcvMjEgOTo1NyBQTSwgVGF5bG9yIFNpbXBzb24gd3JvdGU6
DQo+ID4NCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBS
aWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4NCj4gPj4gU2Vu
dDogU3VuZGF5LCBGZWJydWFyeSAxNCwgMjAyMSAyOjU3IFBNDQo+ID4+IFRvOiBUYXlsb3IgU2lt
cHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+OyBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gPj4g
Q2M6IHBoaWxtZEByZWRoYXQuY29tOyBhbGV4LmJlbm5lZUBsaW5hcm8ub3JnOyBsYXVyZW50QHZp
dmllci5ldTsNCj4gPj4gYWxlQHJldi5uZzsgQnJpYW4gQ2FpbiA8YmNhaW5AcXVpY2luYy5jb20+
DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjggMTYvMzVdIEhleGFnb24gKHRhcmdldC9oZXhh
Z29uL2NvbnZfZW11LltjaF0pDQo+ID4+IHV0aWxpdHkgZnVuY3Rpb25zDQo+ID4+DQo+ID4+IE9u
IDIvNy8yMSA5OjQ2IFBNLCBUYXlsb3IgU2ltcHNvbiB3cm90ZToNCj4gPj4+ICt1aW50NjRfdCBj
b252X3NmX3RvXzh1KGZsb2F0MzIgaW4sIGZsb2F0X3N0YXR1cyAqZnBfc3RhdHVzKTsNCj4gPj4+
ICt1aW50MzJfdCBjb252X3NmX3RvXzR1KGZsb2F0MzIgaW4sIGZsb2F0X3N0YXR1cyAqZnBfc3Rh
dHVzKTsNCj4gPj4+ICtpbnQ2NF90IGNvbnZfc2ZfdG9fOHMoZmxvYXQzMiBpbiwgZmxvYXRfc3Rh
dHVzICpmcF9zdGF0dXMpOw0KPiA+Pj4gK2ludDMyX3QgY29udl9zZl90b180cyhmbG9hdDMyIGlu
LCBmbG9hdF9zdGF0dXMgKmZwX3N0YXR1cyk7DQo+ID4+PiArDQo+ID4+PiArdWludDY0X3QgY29u
dl9kZl90b184dShmbG9hdDY0IGluLCBmbG9hdF9zdGF0dXMgKmZwX3N0YXR1cyk7DQo+ID4+PiAr
dWludDMyX3QgY29udl9kZl90b180dShmbG9hdDY0IGluLCBmbG9hdF9zdGF0dXMgKmZwX3N0YXR1
cyk7DQo+ID4+PiAraW50NjRfdCBjb252X2RmX3RvXzhzKGZsb2F0NjQgaW4sIGZsb2F0X3N0YXR1
cyAqZnBfc3RhdHVzKTsNCj4gPj4+ICtpbnQzMl90IGNvbnZfZGZfdG9fNHMoZmxvYXQ2NCBpbiwg
ZmxvYXRfc3RhdHVzICpmcF9zdGF0dXMpOw0KPiA+Pg0KPiA+PiBZb3UgbmVlZCB0byBlaXRoZXIg
dXNlIHRoZSBub3JtYWwgZmxvYXQgY29udmVyc2lvbiByb3V0aW5lcywgb3IgZG9jdW1lbnQNCj4g
Pj4gd2hhdCB0aGUgZGlmZmVyZW5jZXMgYXJlLg0KPiA+DQo+ID4gVGhlcmUgYXJlIHNvbWUgZGlm
ZmVyZW5jZXMgaW4gZmxvYXRpbmcgcG9pbnQgZmxhZ3MgcmFpc2VkLCBzbyBJIGNvdWxkIHdyaXRl
DQo+IHNvbWV0aGluZyBsaWtlIHRoaXM6DQo+ID4gICAgICBpZiAoZmxvYXQzMl9pc19pbmZpbml0
eShSc1YpKSB7DQo+ID4gICAgICAgICAgZmxvYXRfcmFpc2UoZmxvYXRfZmxhZ19pbnZhbGlkLCAm
ZW52LT5mcF9zdGF0dXMpOw0KPiA+ICAgICAgICAgIGlmIChmbG9hdDMyX2lzX25lZyhSc1YpKSB7
DQo+ID4gICAgICAgICAgICAgIFJkZFYgPSAwVUxMOw0KPiA+ICAgICAgICAgIH0gZWxzZSB7DQo+
ID4gICAgICAgICAgICAgIFJkZFYgPSB+MFVMTDsNCj4gPiAgICAgICAgICB9DQo+DQo+IFRoaXMg
aXNuJ3QgZGlmZmVyZW50IGZyb20gc29mdGZsb2F0LmMuDQo+DQo+ID4gICAgICB9IGVsc2UgaWYg
KGZsb2F0MzJfaXNfYW55X25hbihSc1YpKSB7DQo+ID4gICAgICAgICAgZmxvYXRfcmFpc2UoZmxv
YXRfZmxhZ19pbnZhbGlkLCAmZW52LT5mcF9zdGF0dXMpOw0KPiA+ICAgICAgICAgIFJkZFYgPSB+
MFVMTDsNCj4NCj4gTm9yIGlzIHRoaXMuDQoNCkFjdHVhbGx5LCBzb2Z0ZmxvYXQgcmFpc2VzIGlu
ZXhhY3QgaW5zdGVhZCBvZiBpbnZhbGlkLiAgSXMgdGhlcmUgYSB3YXkgdG8gb3ZlcnJpZGU/DQoN
ClRoYW5rcywNClRheWxvcg0KDQo=

