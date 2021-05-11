Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BECF837AA50
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 17:11:14 +0200 (CEST)
Received: from localhost ([::1]:53318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgU2T-0007nr-Nk
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 11:11:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1lgTzk-0005bj-VO
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:08:24 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:62701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1lgTzi-0003uK-K0
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:08:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1620745702; x=1621350502;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=ZkuM70QHOJOshWqlIgAJ488qFF56pOOK4q3Evz2yFZw=;
 b=Vts0Et2IFG4bJbtw/ezuNzps8htLIJJNGpgQzkGkmyoq1ZmXPkH66O8T
 hiCP8Utb2XB4ukMIfznn0ziP0GIqRR40bkbPMQ2k2lOUr6e0+ssP6vyYA
 0ujaDm6g9pVQ8CEWVoWg62ywKIYJfh9B8GEtdasy7xSOsFyx/bC9+g++m w=;
IronPort-SDR: X0NiuKqA4gJ2KDyxezvJOOJ6K/ObxUSK1/mqMz1TJCb8f3qmu6ixwYQMavryzoTxMazUqNJ08L
 hMorSJnPPcq3k9zDoH9Jgfv4JAEMETN+O17N0yTlM8uI4GK4i7Li/5inxh/6+9quvcCkCo6pX0
 TMZ8fzJhuvu4RjIdbcPnY8yYYTIELV0TSKa8WUlJOTWgmFwo6xnsAgZ98S0h1sLsk6O5EVZq7H
 3ztyI/jDT5+vsOPbtPqZiuX4LHRCLY3WW1FnGSkdN+Tm0a5qwfWv0lipR0FTbRHHNVTr9GmgKn
 ESA=
X-IronPort-RemoteIP: 104.47.74.45
X-IronPort-MID: 78425
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
Subject: RE: [PATCH  v1 08/25] gitlab: add build-user-hexagon test
Thread-Topic: Re: [PATCH  v1 08/25] gitlab: add build-user-hexagon test
Received: from mail-bn8nam08lp2045.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.45])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 15:08:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BasjBdg2odCVSvZUiSzbMmlq4XdmAiBTl8F+3vgXSPD2lf+H5qGz53sSHLecayufmwAxQ/GbjTAIG9xoRhWztWeb4UFW0Oqm0giAne5B2nzuxo2HepvHZAIlBHfphlN1gbPlt7jBLawRSkxoMg3NmruDaH8cHhzDQ7dGSL0Hke283jU6bnOv4t8hAo8lrWUQbbpICjoK1oBhOfCcgN8frlxSQ82emjepYzUDN0JrUaVWTGtCIeQJyxD6jTPvrFToeAQYrZmkK+P8J0cMXnE80/b8tqQIC9IKUs7gppgPq3ZjlDA0ND9hlRwp+p+0WhCthwx2FEWAuWEfdsKmgwun7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkuM70QHOJOshWqlIgAJ488qFF56pOOK4q3Evz2yFZw=;
 b=kuurAklSjw4XjNzXgXf6VfGM+h9aeeF2oVMtBB67zvjNxsEk/L4d4kuOBFpwpGc0DmgdMeiIV8GDAYkoGrP1bscSGxXf6rawM+5rDyP24qx50vuxMZeF6N4nvhZZzZ+XwhMH9i3CR8YIkU7apU2Q3m7wllQdoAIUZx59lJtxThPiyx/r0AnTobSHVSqV5p6/AvpTAFVRpQbXhkyLkNLU4WEpnD7gWQTztWI2MSFj1RVSDKWv55Xmawqka3tfRnmT6T279iOzvS9//fOBNinRx7GYkSHPRoeMk+RJgnEZLnXL4hp01yk/QP3V+gtoNtFvZF1hgIi25iHwv9aXQEErgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN6PR02MB4205.namprd02.prod.outlook.com (2603:10b6:805:35::17)
 by SA0PR02MB7340.namprd02.prod.outlook.com (2603:10b6:806:ea::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24; Tue, 11 May
 2021 15:08:18 +0000
Received: from SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::5cc7:850c:8b7e:565a]) by SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::5cc7:850c:8b7e:565a%6]) with mapi id 15.20.4129.025; Tue, 11 May 2021
 15:08:18 +0000
From: Brian Cain <bcain@quicinc.com>
To: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Index: AQHXRnRw1ypMX1wl/UCjmk+HoBXf2areXQNggAAEY2A=
Date: Tue, 11 May 2021 15:08:17 +0000
Message-ID: <SN6PR02MB420515C1DC328699018F20B2B8539@SN6PR02MB4205.namprd02.prod.outlook.com>
References: <20210419145435.14083-1-alex.bennee@linaro.org>
 <20210419145435.14083-9-alex.bennee@linaro.org> <871radgwgg.fsf@linaro.org>
 <SN6PR02MB42050836329B89FA1A4C21B1B8539@SN6PR02MB4205.namprd02.prod.outlook.com>
In-Reply-To: <SN6PR02MB42050836329B89FA1A4C21B1B8539@SN6PR02MB4205.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [104.54.226.75]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e360997-1d6a-4ca5-46fc-08d9148e9bbb
x-ms-traffictypediagnostic: SA0PR02MB7340:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR02MB73402EEE97D309A941888607B8539@SA0PR02MB7340.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nC0oi0mYtuudrdtvUYmRL7fxyROgMrq4TVI/xV4x0iK+szUNb7YEGLG4sBJlsljm4BqDP17GJ1mKIh0FfVdV3SCM+uqUY8DKOtzYih463DzEs7Kc9H0BkkqD2d2fuGCKZR/gILnPzhpxjqnqCV1WVCh42pPVCmaGDgrgaUD0QjvNuEvmLIyjgePqd31V5lT2v4aK0dl8yrzEcJkW6mlQNvJ5bo3EieRsvuG0/OhP3wPTAPtxdc4Lh3YqsRQ36dUvpd8snNiCMKA6mItj0MtlQnNOXNS8+Ls1lGcMkMu91pXyOYw0vtn3dJAIS/ajeR02/0WbXogVm7a6GPtBbndfw2347pOF4fG99XApWs5UsYx9G0l2opu3ieDal+JuTbCySYZptJa0+TT+nx71aMldTKaHaFrTKt+KizJ+tUr6P0w3SsVen/WKI70QPMQhFts0eq43yGbwXw9huPE5NZ1bO8u0Q/wHLuYmhj4Qg/1nzUg1CHR+JXTrbHAXwk28NgKamhMc2+yXY9ugDHpveCTZ3rMMBwJFk9J4feJ78gTba22uAWoioG98MB95IZ4oartBT/lfcYxARfqahnXhUUssawNXd3w1nfQrryDyZ/8O4LTyaXjKW+qPPBKu2YjUtuep7OocM8suwZGqV93EnCmFcDGKvXF6cEhXCNAN9PL8PGhPyqBpRq0a0e7qkHEoDn4q
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4205.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(396003)(366004)(376002)(136003)(346002)(7416002)(186003)(7696005)(6506007)(71200400001)(107886003)(86362001)(966005)(4326008)(5660300002)(83380400001)(55016002)(52536014)(4744005)(76116006)(66476007)(2906002)(66556008)(110136005)(316002)(64756008)(66446008)(9686003)(8936002)(54906003)(26005)(122000001)(2940100002)(33656002)(8676002)(38100700002)(478600001)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VUg0QTFaYWNvdXU5ak9uZlBGY1IzbVZKMjE4eFRGTDdObE00b0crSE9uWnRG?=
 =?utf-8?B?MU4wSGxxQjlQMm5yNUs4MzBMK3ZFdE1nQW1WYUxpTno3SkRMdGFKVmNaWFVM?=
 =?utf-8?B?L2tNWjB6Y2g5ejltQndpUXhzYjY5SEdNUzg3UmQwNFRiRVVXMlEvbEQvVnB0?=
 =?utf-8?B?Q1lPcVlpR3Z1Mno0UnMzSFFtVG1yOE9UQWt3KzRTdm42OHZOcnBsc1dFbGpi?=
 =?utf-8?B?RHpobVJqSElPTVNtM2NLYXVRZmVSZHJOaVZXcGNSWHJqa3VHZGxETlBTeTM0?=
 =?utf-8?B?RjdRV3RzWldNbXRuWTYvUy8vNEl0czM2cEJFcWtzSFdKK2thL0FLZ0lSZXBZ?=
 =?utf-8?B?US94djVCU2VhaEkrVFJFeW1Mczd5UisvY3RxK212M3RMYnJwMW0zRDdhd2RL?=
 =?utf-8?B?ZElwOWlVMWsrbktXOU5kMWhKaDBCZzFlamZHRkg1TGNVZEF2SWc2RGl4SlQy?=
 =?utf-8?B?cDM2Ukh5OHJkSEU4TERYYnNqcGk0eXB2M05Tc1BleURTTXJIV1gyc0xIL1hG?=
 =?utf-8?B?OEhrZnBwaWZjdGkrY3RRcDVzbC9WK01yQzNuYTFGZ2o2QnRTTHRXaWdxZGRB?=
 =?utf-8?B?S1VqbnFZVDlUQTcvanppSy9yT24zMWQ3VzVpVlBMUzVNaDRlRXp3RXJ5dWlE?=
 =?utf-8?B?RldjZFR0SkY1L2tpdDdxcXRYdnd3cWNvZ2RoNWpmZ1FmTEcyZDJITzFFN0RF?=
 =?utf-8?B?SGNqVExodDkvQXFjdVNDcUpQWldxMFFFbEJPOUIySnR3ZEs1Sk5sRi8xbkdm?=
 =?utf-8?B?WEtuZnFjcDdjSERzdkE0ZTJoazdjOHE4VVhBV3EwODRrZXZUYVZPWVBVcXNE?=
 =?utf-8?B?ekZYNDRXRVNUVitJWk5XSzU5UC9PK2VacDUzY245UjJVWFNDNkJNUkg1NlFr?=
 =?utf-8?B?Vm5nMVJGOUNGVkg5SlJ2MHhMVmdpZjdadTRxWHgzU1VUVGI0bEcwT3FkRTZG?=
 =?utf-8?B?c2JsV0lWMmtvZkZjbUNWaVZTbWhvQjJLUXZYbG5BSUFpSDBud1NyazA3TXRT?=
 =?utf-8?B?WEd1Qm1STHdpMmQ3L01NcllseDg3M1lYaVFaWHhJK3ZVdlhSMnFqZzU4Q3Yr?=
 =?utf-8?B?ZWhUNjVjNHIzNll0dllIM1VPMUgzM0pKQnl2RXc2cERaYlZyWVIrL2JyK1FT?=
 =?utf-8?B?TitTR2RXaFQ1TThWdEZwaW1Kd3hTVC9ibjRaUkljOTRQTjRtV1AybnljYWp6?=
 =?utf-8?B?QWw4a0MyNmdwbnpKL0lRNktxckpJZFVsY05hM2VUdmRzOHJJOUtVTEhrRlBW?=
 =?utf-8?B?dEpqZDUvdUVBc0VMTE8wbVBRZmlobStuYWVGVVVVOTlpTjBnUlZ2Rlp6V2g5?=
 =?utf-8?B?ZmwvZXpYYmRyUi9kVWFkRkhXQlVjdGI2V2R5bUw2Q3pEcEw5NDdUR2R0WnlW?=
 =?utf-8?B?TXB3TWdDMUkvSERKeTFGcGJsdHRJMU5Zb2E1SzUwNmJkYUlmUG1qR0lpMk4y?=
 =?utf-8?B?cEprdkxlRUtkdVcrK0NqQ1lrd0hPQk03NCtZVlc4Um1TcEpKeGU4d1Z2aGxD?=
 =?utf-8?B?cnVsRjhTZ1JNWGJDQWQ3MHQ2T1NLSnNsYUFBd2h1SWQvcG15a1FOMGo2c2h6?=
 =?utf-8?B?eFZDZXB1dkM3bzRiNHBNZktiSWIrNDA0QUV1VGJhRXVLa05XUmNVMUdDNnVJ?=
 =?utf-8?B?STJBV3AwVlgvR3ExTTZheWY1UXhIc3pnT09xV25zcFZmNHNCTmVWZDVJUEpF?=
 =?utf-8?B?b0lLZ2F2TlhlWWxqOUNDOENPUFNuYzhHWFhzbFRhZ3lTWlJnY3RnY2dhc2hG?=
 =?utf-8?Q?dCQAXc6RIlWw3RkMl1y0Q3iuAkulZldzDAvCJx6?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4205.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e360997-1d6a-4ca5-46fc-08d9148e9bbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2021 15:08:17.8700 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8MVfoPv1EWESZbPSD6fiNlIJjtPRqcRtBperv/5w4JvZ3VP994WTcpFS+bgTfwBw8ELY0QF8spCJYuy9Z4XcmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7340
Received-SPF: pass client-ip=216.71.140.77; envelope-from=bcain@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Cc: "fam@euphon.net" <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "f4bug@amsat.org" <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "crosa@redhat.com" <crosa@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "aurelien@aurel32.net" <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCcmlhbiBDYWluDQouLi4NCj4g
PiBJIHN1c3BlY3QgdGhlIGVhc2llc3QgdGhpbmcgdG8gZG8gaXMgdG8gZHJvcCB0aGUgcGF0Y2hl
cyBhZ2FpbiBzbyBJDQo+ID4gZG9uJ3QgaG9sZCB1cCB0aGUgcmVzdCBvZiB0ZXN0aW5nL25leHQu
IEkgY2FuIGluY2x1ZGUgdGhlIGluaXRpYWwNCj4gPiBkb2NrZXIgaW1hZ2UgcGF0Y2ggYnV0IEkg
d29uJ3QgZW5hYmxlIGl0IGluIGNvbmZpZ3VyZS5zaC9naXRsYWIuDQo+IA0KPiBTb3JyeSAtLSBJ
IHNlbnQgYWxvbmcgYSBwYXRjaCB0byB1cGRhdGUgdGhlIExMVk1fU1JDX1VSTCBzbyB0aGF0IHdl
IHdvdWxkDQo+IGhhdmUgdGhlIHN1cHBvcnQgd2UgbmVlZCBmb3IgdGhpcyB0ZXN0IGNhc2UuDQo+
IA0KPiA+IFdvdWxkIG9uZSBvZiB0aGUgaGV4YWdvbiBndXlzIGJlIGFibGUgdG8gc2VuZCBhIG5l
dyBpbWFnZSBhbmQgdmVyaWZ5DQo+ID4gaXQgd29ya3Mgd2l0aCB0aGUgY3VycmVudCB0ZXN0cyBp
biBtYXN0ZXI/DQo+IA0KPiBTdXJlLCBjYW4gZG8uICBEbyBJIG5lZWQgdG8gdXBkYXRlIHRoZSBj
b250YWluZXIgcmVnaXN0cnkgaW4gZ2l0bGFiIHNvbWVob3c/DQo+IE9yIGp1c3Qgc2hhcmUgdGhl
IHBhdGNoIHRvIHVwZGF0ZSB0aGUgRG9ja2VyZmlsZT8NCg0KUmVmZXJlbmNlOg0KDQpodHRwczov
L3d3dy5tYWlsLWFyY2hpdmUuY29tL3FlbXUtZGV2ZWxAbm9uZ251Lm9yZy9tc2c3OTY4NTAuaHRt
bA0KDQpJZiB5b3Ugd2FudCwgSSBjYW4gYnVpbGQgYW5kIHB1c2ggdGhlIGNvbnRhaW5lci4gIE5v
dCBzdXJlIEkgaGF2ZSB0aGUgcmlnaHQgY3JlZGVudGlhbHMgYnV0IEkgdGhpbmsgd2UgY2FuIHNv
cnQgdGhhdCBvdXQuDQoNCi1Ccmlhbg0K

