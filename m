Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0E6338A4E
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:37:09 +0100 (CET)
Received: from localhost ([::1]:50144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKfAK-0007qI-Ab
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:37:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1lKexE-0004Lm-2H
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:23:36 -0500
Received: from esa20.fujitsucc.c3s2.iphmx.com ([216.71.158.65]:6523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1lKex2-00070L-My
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:23:35 -0500
IronPort-SDR: s1i2EmLE9Rb155r6Xo0Yly/yQJ+y3DJFDYUiT29388xVqw+XXk/VMPAB3rZhhmLW30XR/JHlk7
 YLzO351YttXjIOyKFNQ7wWTZczmTbu38cTUn/5EFxGNd1gEYDf9OBIEcayOwrMaLUGdUfBK8oB
 WCHxC1wiKefncKGR4wI3I1bmsNVZqbS/3MlVnVY5ZnTPBapoZAzHBGqsF5kKqAEr6v9MKzhSPG
 xcP6bvNBPDgFa2c4eAL8QGPj1bRFv3kQ9xGrkQ+q8U/6J3BaIqxPWgF7RIHcf4t0AvjDFa/l3X
 Xl4=
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="27684384"
X-IronPort-AV: E=Sophos;i="5.81,243,1610377200"; d="scan'208";a="27684384"
Received: from mail-os2jpn01lp2053.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.53])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 19:23:20 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OMqkn/OFywuxDh6zFx4Mexcf2Kl9UJpSWY23iK/ZmrAOJsU80nVBYBr5nhiRngZxhQfWiYhANiYr6iZ8rZOcub0uF9EoxAeuSeETOmzVw/sOJi2RIz3RvHzfk2FaAYwhfqKOZBJvsFFpQCh5iRG8wupVPTy31XQ9fm5lUI3uw//Z9iZXapKhnu1Rku3LHN6XUieGm1/5DcUKlkxHzH37f/CQwHa8EHqxTaYMuFNBgw8oCO7xu307eoYtdJfvIOfDUUD2T9o/pEMiPKmb68sxQ4SLj5/V3d2O0TW/W4e5qp2bmiskuZNu4eLgRvTPevF680nx+lAzoPcaj7BCsxyXBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=plEHLLqFA2/Iz8PwPbSaSL43GKJdbwWxgUFzBF1P5dc=;
 b=FU0G3rLBmGTCZA6DWUyfP+WBHhmo6Yz4yNjFZghVFJ39114YLaNdBKp4oGDEBbSKeB6aKf9CBgdrgY7uYySsX+fjXXNroldfrnIjyvXlM+lnoZqLcfhBiObhVDrPiTP8nqfXAEknPjE3R/QQpwElZ1lPzuina0jfHIlhFERja9tJfM7njhastDbIIke2LwX36wltnibG78G6AyDMaxUcVGFTK2Urd4Y+K2tZCTerChD/iTV9t7Onp7Y1PfqJj25wIJH1V4uwR5oem77OD1G9ZtgGHbtFAvNr81R8opgNUh8Ok8loHh0e25tYuc17GajkHd/So7URn8WTHsdw8L95nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=plEHLLqFA2/Iz8PwPbSaSL43GKJdbwWxgUFzBF1P5dc=;
 b=e3fDqpVLbFv0UbJq6kaO7iiUdLH0gbN5vxdaSPYTVbrm3V8fANfz2VjzaxJR91PfWgDxCvzX2+ttOxdTYRjIiU1W+7zH7OK7ZRWKhG4sskqhV7bTrOOBhxpmnd3uJ6t1BvRx8cqeOiTQtxyq7W/jyBwX0P2I0aBx93/b9CuxEm0=
Received: from TY2PR01MB2571.jpnprd01.prod.outlook.com (2603:1096:404:6b::12)
 by TYAPR01MB6010.jpnprd01.prod.outlook.com (2603:1096:402:31::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Fri, 12 Mar
 2021 10:23:17 +0000
Received: from TY2PR01MB2571.jpnprd01.prod.outlook.com
 ([fe80::d9a8:f990:73a0:c21a]) by TY2PR01MB2571.jpnprd01.prod.outlook.com
 ([fe80::d9a8:f990:73a0:c21a%3]) with mapi id 15.20.3933.031; Fri, 12 Mar 2021
 10:23:17 +0000
From: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
To: "Rao, Lei" <lei.rao@intel.com>, "Zhang, Chen" <chen.zhang@intel.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>, "quintela@redhat.com"
 <quintela@redhat.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "lukasstraub2@web.de"
 <lukasstraub2@web.de>
Subject: Re: [PATCH v2 05/10] Optimize the function of packet_new
Thread-Topic: [PATCH v2 05/10] Optimize the function of packet_new
Thread-Index: AQHXFwAvofO7yNsk1kS/2FPRlN4d4Kp/6q0AgAAzMgCAAAeIgA==
Date: Fri, 12 Mar 2021 10:23:17 +0000
Message-ID: <6f74403c-911d-722c-7b7e-00f2bce6f815@fujitsu.com>
References: <1615525383-59071-1-git-send-email-lei.rao@intel.com>
 <1615525383-59071-6-git-send-email-lei.rao@intel.com>
 <e5247376-5319-64d0-850c-5a28415c1c41@fujitsu.com>
 <SN6PR11MB31033DC95CB2E555414AA186FD6F9@SN6PR11MB3103.namprd11.prod.outlook.com>
In-Reply-To: <SN6PR11MB31033DC95CB2E555414AA186FD6F9@SN6PR11MB3103.namprd11.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d8cdcdb-8d80-431e-5d82-08d8e540da58
x-ms-traffictypediagnostic: TYAPR01MB6010:
x-microsoft-antispam-prvs: <TYAPR01MB60105853E5BF366D26B40325A56F9@TYAPR01MB6010.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TXYyfpeg9omW519hXEAh9FavxhkSCuBglYqTCPxvuPLwpEUuRibV3aJRV6bwezX9Fjx32RDtFJCCOTuXZNyP9YxpSpRP4dyhOyWnYNcnEKxXGE83/3u0/8EBzv+g42JFTBcL/iKYLCpHgiSIa5PdHWCApQ9k3OacbSyD6cG7cFrj5ZO2oOR16OzztP1jpP8045CUpYj8Iu+gtiHWeZa0ran1c02iNPLuIWcFdDr7oNIIngBN1/c+Qt3M+LCUk3T3bHOIM04dxfoIWiBIbqUa2J1POYE+8KnQHqZiU+JY+IhIIbny3aZxWkkXTfvQaAhGJ8tCjHPAh8qrTCmWglFYdaDeYO3+jF8D+ahWsdsyuwOESsvmVcA+G+MY/BrTx4ttYPOhJ+b7xJ+swgEWt3MU7738rEUngPA1DeLquaOBLj8GinnIXsmH8omSf9gUbti/uf2/UrIFNtQLWVkfgx4Bq/euwDFgG7pQ7ylb92U7QcQ8Xg2RDnSZZ7i0oCFoEJavGVshlGMAvkleiFwKj5nYn9QTLi3ST+B+N6VYxjccZlEyh96zz7A5i2qU5grA7u3XGY/l7rAJPelv06B6Arrf8ieLL3jtknxft4mLZw8lnLK+GM1qVgb+o7VOyL4Y9Lvm
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR01MB2571.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(36756003)(85182001)(83380400001)(31686004)(6506007)(31696002)(316002)(110136005)(53546011)(86362001)(2906002)(76116006)(6486002)(8676002)(8936002)(66946007)(66476007)(4744005)(5660300002)(478600001)(66446008)(66556008)(91956017)(64756008)(6512007)(26005)(4326008)(186003)(2616005)(71200400001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?NlRPZnJVVTdQUVh2V2wzV2xIaHlLS1VxTTVwN2Y1MjB4aHJFMmVDNGh4ODZL?=
 =?utf-8?B?MkxlSmNZMUZGMmNCZ200QWhzNW9oTllkbmc1OGdpM09Ca2hxdUpiQk55OStR?=
 =?utf-8?B?Vi90Y2RPVzdTMGlZM0hhV1FNU3hmK1Q1V0FJdHo4L3lmN2QreiszOEVaRndi?=
 =?utf-8?B?M0w0R1lYektZbDl5cXV1TzMrTlZKN1JKeURsWlRFM0wxMmx1RWNVVHlXeTg3?=
 =?utf-8?B?UVhBUE9ocllDVkpnQzg0S2ZycFJrNnRaK3ZLMHNnK1BoQzZybGZtc0xIQnV2?=
 =?utf-8?B?UVNkMDZSV2R5ZUtBVUVnQ0J2Wmp4SEVQKzYzdzVLeUJvMWxQUno5WFRJWld4?=
 =?utf-8?B?aXlRTnR3aDZVMkdlQUtaZmZ5Tjl1QWVYRnVBUnorTlFST0tXTkY0bkwyY2tX?=
 =?utf-8?B?WVhzRHBpcVNnd2F6VDNQSWJzbGFoWGVXbUVxNjZJZUMyUHpDY0g3Vmt6dnNr?=
 =?utf-8?B?MitOR3E3VDVrVjBSRkR2SWxoL29JL3VoelJQM0o5VnRXWnVXWnZHSzNmNEZa?=
 =?utf-8?B?dE80YjI4a2Rjbk5GRzdGTkRnNUpaNWdNd1huZTdhWHg1Y25pbldsMVljVjZS?=
 =?utf-8?B?TWdrcmY4UlVxTVZnS21JcFNXblR2bHNhSG5hcnp3eTQvUzlza1dUVkVpQnd6?=
 =?utf-8?B?Qzc1OG9kY29FUldibDdUeTRNd2orZEU1TkNIRGh4Z3hhMkpDUDRWdjVPS1JC?=
 =?utf-8?B?SlZvMkJTRS8yNVc3c0NobCtWRkZJM3pjTEZOaWxqMzJkY1NGakhiWlZXaXBj?=
 =?utf-8?B?RUU0dS9pcEhKa0htTUZWZ1c0dktBU2pmUWFxNm9HY1NQOTBRbmF5T0dXWVNT?=
 =?utf-8?B?c2tpdVE1MTI3NmhwUU16eU96VVhBSlJLbFFZZWxVNDl5YmdxTVJCY2kvRGJ1?=
 =?utf-8?B?Q2IzR3FUOW5pQXdJYnlvZkJMRWJkZkgwRkFJN2JjVm8vbTBDUDhZdTdwSUtj?=
 =?utf-8?B?VzdsamVuZVkvR3hCaFpnL3owVC93TjZBamxDNGNmdDNEUldOVWZSQlVpdkgz?=
 =?utf-8?B?bkkxZEorNU5iMTEyNzR2azJWNWpDcGJlMERNVk9SZVVLc0xZRUlUbi9HS1JS?=
 =?utf-8?B?NWVKNExUa2ttbHdmczlQREwwWTI5amF2eWdCVDNoVFRxWHBlZmJiYmVIeHhw?=
 =?utf-8?B?Z3NNdmZadEFHU1VoSkdSQkVBRGMyejhvWmliVlI4YW9uNE1kbVIrckxmMWpj?=
 =?utf-8?B?OGwwaGJEMlFBczRqVm9Rb0VQVjFuSmpMSGIwb0k0czZzN3ZiWit5MVMyeHB2?=
 =?utf-8?B?SVQwcEtwTDE2aSsrdysxR1k4NmF1VjREdDAvb3lyVjVNbTJCZk1KNzFmRzdr?=
 =?utf-8?B?bUt4Mm5FUU1YYytmaXhhMWo1QlhVWlZXL3Nta1QyamJyNGkxbVg4R2JDcWxK?=
 =?utf-8?B?bHp6YXREL3hGTHJNdEhWRjV4YWFaaDdDaXRib1NOcytDZ2xXYTV5djlDUHBL?=
 =?utf-8?B?eDZIdFhmaEVwNHlNaW5LQWk0RE1sdFlHS1AyZ2ozOFJwbWJBYVNPT3lWRWRj?=
 =?utf-8?B?T0ppVWRsbC9hczNISFUzS3IwcTIrNW5ha3ZwK2d2d3h5VXlWLys2S1N6VGVN?=
 =?utf-8?B?Q2NFR21UcHNJNUJOTnVpenc4ZGdkclFBaFgxQnkzQVJIeXNsVi9HeWtUb3Fy?=
 =?utf-8?B?TXdoeVdqQ25QSmEyUk4rNWNTanllSzFLN2pVUFZBcXJyOFd5Zm1mdGVEVXJL?=
 =?utf-8?B?ZVBWcG5JWEh2dzQ0SFlhNjZCbFErWldZaGFGZStSSUdybWdIVjlDZTZQZVZw?=
 =?utf-8?Q?w7k2vMR8eVNfLmUY5cVTVkOng+ZON8ODUCe1tGI?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <396657E72EB6CF45B08D8EE74550F996@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB2571.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d8cdcdb-8d80-431e-5d82-08d8e540da58
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2021 10:23:17.4368 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e9tBYVmLRhPmKQouejubJq1LLbaM832A6LY5kVgVtV3vofbhxjMEEFhgvsjuTrZlxrzacB9cNFM8D6q2V2e8tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6010
Received-SPF: pass client-ip=216.71.158.65; envelope-from=lizhijian@fujitsu.com;
 helo=esa20.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gKyAgICAgICAgICAgIG9mZnNldCA9IGNvbG9fYml0bWFwX2ZpbmRfZGlydHkocmFtX3N0
YXRlLCBibG9jaywgb2Zmc2V0LA0KPiArICZudW0pOw0KSUlVQywgdGhpcyByZXR1cm4gdmFsdWUg
d291bGQgcGFzcyB0byB0aGUgbmV4dCByb3VuZCBhcyBzdGFydCBpbmRleCzCoCBzbyB5b3Ugc2hv
dWxkIHNraXAgdGhlIGFscmVhZHkgY2hlY2tlZCBvbmUuDQoNCg0KVGhhbmtzDQoNCg0KT24gMy8x
Mi8yMSA1OjU2IFBNLCBSYW8sIExlaSB3cm90ZToNCj4gSG93IGFib3V0IHJlZGVmaW5lIGEgZnVu
Y3Rpb24gbmFtZWQgcGFja2V0X25ld19ub2NvcHk/DQo+IEluIGNvbW1lbnRzLCB3ZSBjYW4gdGVs
bCB0aGUgY2FsbGVyIGRvbid0IHJlbGVhc2UgdGhlIGJ1ZmZlciBhbmQgdGhlIHBhY2tldF9kZXN0
cm95IHdpbGwgcmVsZWFzZSBpdC4NCj4NCj4gVGhhbmtzLA0KPiBMZWkuDQo+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+IEZyb206bGl6aGlqaWFuQGZ1aml0c3UuY29tICA8bGl6aGlqaWFu
QGZ1aml0c3UuY29tPiAgDQo+IFNlbnQ6IEZyaWRheSwgTWFyY2ggMTIsIDIwMjEgMjo1MyBQTQ0K
PiBUbzogUmFvLCBMZWk8bGVpLnJhb0BpbnRlbC5jb20+OyBaaGFuZywgQ2hlbjxjaGVuLnpoYW5n
QGludGVsLmNvbT47amFzb3dhbmdAcmVkaGF0LmNvbTtxdWludGVsYUByZWRoYXQuY29tO2RnaWxi
ZXJ0QHJlZGhhdC5jb207cGJvbnppbmlAcmVkaGF0LmNvbTtsdWthc3N0cmF1YjJAd2ViLmRlDQo+
IENjOnFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDA1LzEw
XSBPcHRpbWl6ZSB0aGUgZnVuY3Rpb24gb2YgcGFja2V0X25ldw0KPg0KPg0K

