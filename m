Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FB833C8B6
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 22:48:10 +0100 (CET)
Received: from localhost ([::1]:42298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLv4L-0005aS-3b
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 17:48:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lLv1s-0004ab-Eo
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 17:45:36 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:21372)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lLv1m-0005ht-Ap
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 17:45:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1615844730; x=1647380730;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WzzEVSM+P+eSANST1ebe2bZQRvrgh1Fja9oUu7D0Hbs=;
 b=MUGiCy2gpKOzrdAK+3J0IyhXIeegV9gwfZ2xe0W00Fmdi+/IeDnK2Mz/
 sRbPcGXlt5FgvOiAepi7kGqg2x5XpfEqN7rM40KB3BrIBk5dMTIr1TaYY
 5c5XNqreHVt9TjX2T84NoteL/tYImJT0y8O4npAoAtJyd4WLbi8tWU170 w=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 15 Mar 2021 14:45:27 -0700
X-QCInternal: smtphost
Received: from nasanexm03h.na.qualcomm.com ([10.85.0.50])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 15 Mar 2021 14:45:23 -0700
Received: from nasanexm03f.na.qualcomm.com (10.85.0.47) by
 nasanexm03h.na.qualcomm.com (10.85.0.50) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Mar 2021 14:45:22 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03f.na.qualcomm.com (10.85.0.47) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Mon, 15 Mar 2021 14:45:22 -0700
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by SJ0PR02MB7263.namprd02.prod.outlook.com (2603:10b6:a03:2a0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 21:45:16 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6%4]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 21:45:16 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH] Hexagon (target/hexagon) TCG generation cleanup
Thread-Topic: [PATCH] Hexagon (target/hexagon) TCG generation cleanup
Thread-Index: AQHXGVdWM3KkHiOk1UiMVFqhZKhQnqqFDsAAgACCsyA=
Date: Mon, 15 Mar 2021 21:45:15 +0000
Message-ID: <BYAPR02MB4886F79B93C1D811F3A81010DE6C9@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1615784088-26384-1-git-send-email-tsimpson@quicinc.com>
 <f607fe6e-ed0e-e3a8-4b5e-378328f57557@linaro.org>
In-Reply-To: <f607fe6e-ed0e-e3a8-4b5e-378328f57557@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2dec208d-41a2-4c55-0d0a-08d8e7fb9ed3
x-ms-traffictypediagnostic: SJ0PR02MB7263:
x-microsoft-antispam-prvs: <SJ0PR02MB726329102D4BCE7DB1C3A7B5DE6C9@SJ0PR02MB7263.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:800;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W6fi8/6MNezJWRtrGALet6b7pGuJhsrJ0J1Aq46/lUSTjoEy/ZcB0AxRbs33649aXvA9tTgzWW2jTlNfPtGYUunVCw5qwUPnJQpp4vrkoeh/8dH7d3Q7eFo4SEN+zPfeMMgCcHNnsal9rvFfCVlJPlEszIlP8YhSJtWXKM9un/vcyl0mwzeQ9iLzGkI3Omi1EMSXI7YiVHHbhfNElB55efhtN7YXb+ZF0e+A/Fl0gNNWXDRETuCl43b0MnUgUjzL+Dh5SE8Ll8F9EIvT57nW/TmRlhVfk+X0wsgRypA1kdYa0hj5gqQnmwHvHLy04nOXa104pDr2hU80jJT9BiDEY95nP8pOitue+69odC3EsF56tdkyVoypq56tda56vMUN5kLMRIlbqKlNJLbP0dQ3cKazkVg/QQg+HORhWtzowdvczizf5NXguCG4ga/KDSspDbJMWcYKZwFtvUEMRmdebtg5YgDeI6y3TjQ0LXdiAJNmo+URL80qTNnClSl471fO0S5R746tkZ5Mt+E5zz4xfd/NoW9S2G9MuvPCmY3rZfddXRs1N9BmpwN1Qa/ifsZs
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(346002)(136003)(39860400002)(86362001)(110136005)(64756008)(4326008)(478600001)(66476007)(5660300002)(66556008)(26005)(2906002)(33656002)(66446008)(8936002)(6506007)(55016002)(76116006)(66946007)(52536014)(316002)(186003)(8676002)(53546011)(9686003)(83380400001)(71200400001)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?c21zMTBDUmJZaWVabHVYM25xaU96ZGFwWlNNMU5Sc3E0YitETXdVS1d0MHFR?=
 =?utf-8?B?OTQ4djRzVUZGYmtpRlkyVlc2cVNrU0dRWnRRTzBzMmprSCs1NEVHUndVM3I2?=
 =?utf-8?B?YjltcWJFWmNyNUQ4ZUIvUGFOSFdzTnJuY1Y2WnVzR1RHTUlENHZkOElUSnNK?=
 =?utf-8?B?QzNYSnVoNzEyVisxa1pKTzBITWgvMDBDc0QzY210RDcyemFud0puK3l3cXIx?=
 =?utf-8?B?b2RiSEtPcnBTN0pmU0UxRS9qdWIvYmI4M1Y5RUlBR3IyZUI2WmZ5Mmc3NmVZ?=
 =?utf-8?B?em9PdmhFcGxKTWVjNkFSZW5Cc3NrK2U1OVlnbzlJK3RiOWFJQmJlbktQRFJS?=
 =?utf-8?B?by9Xa29GTnVoNzNNa0xqZXJ3cW1yOTkvSEp2VTl5STJZNVdiRzMvdC91alhL?=
 =?utf-8?B?bGhhaC9kWnBFMCtBaHlrOU4zbWQ0bFI5amZEeUFtYWdLS2Vicm9KQTZ1QVBv?=
 =?utf-8?B?N3FBbXpIUEx1YnhHblVnTDBtbFhPbElCcVhJNFozTXR2TmVXbVZ0Wnl2anlZ?=
 =?utf-8?B?SzJPSCsrTFlwdVJpTWZVZ3BJdm9JYnJIUFRBbUdFNGtBbWhsU1VRTmE4dWU1?=
 =?utf-8?B?UFd0RFd0RFRBcDVnd3Urb2M2aUZROWtCRHc2UHkyclAvMk5VMzB6OUlXUFRI?=
 =?utf-8?B?YW1NMXBJWklGYlhxNWZ6UGFuZzRZQUpBUk1Bdi9SNUtEMDVSVEV4NklaYTgx?=
 =?utf-8?B?aVdaUlJxdVFzc241aUY1VUdSdVFJMWlIRFVjL1hhems2RFhvNkd0eGJ1ZnVo?=
 =?utf-8?B?R3MzSFBhSmNVVDZZNEVlZGQ2UWM4L0ZFdXJaNll1WGZud1ExbE5HdTZCSkpO?=
 =?utf-8?B?di9ka0lxU1hCSko5Z20yQWRsaGtXbFJOOENpRmxTYmp6NUlFMTU2S1YzNlg2?=
 =?utf-8?B?Mm9QRG1XS3kzWjRNZnIwakl4Wk1jUWgweFI5TTU2RlFoa2JlM21pOWlLNldo?=
 =?utf-8?B?eVRNTytMaCtNWVZMMXRzdERDTGRGS0labE15aVFHeUpnKzNVVGxKQ2JSZVVG?=
 =?utf-8?B?YWl2ZDhYbmJuZWhodlA4L0d6QlJFSFptQkczVmx6NS9lKzVqZzZDKzRaTHJ5?=
 =?utf-8?B?dWR0TXpHQmR6eWVoNXdDMGMzVzVmRWROVDJMRWlHVnQyY1hRcyt1M3RnRnFM?=
 =?utf-8?B?VlNRczVyTEdpTnFtMVh6azE1dkVBSVM0WElpSmxjajFZMWNnbDg3RHVsOWZn?=
 =?utf-8?B?anRPNGlYQmZ2T1ZaaG9LL0tVVzh3YWJ1ckhXRjJJT0JiYWIrYis2RmFBNGFj?=
 =?utf-8?B?dUtqY1lJbnVqaE9jTUhLVzlvR0Vqb00zWFNNdUxoNUIzditQaUdtNHdmQjQv?=
 =?utf-8?B?UTZKNmx5cWhvRjEyRXNSeFkyQWhtWStZL09CL2IyYmh0aUxzL3E3QzZKTHpx?=
 =?utf-8?B?YmVObXB2b3Y3cFJOeWVPMGg3TlpmSmEzT0FaRDVWQk9vOHhReXNGZGl5M2dR?=
 =?utf-8?B?VGcvdTdUQmowTnBUMWdKckY5bGNkKytTYnp4bDgwY1c2MDl2bEZ1cWFGZTI0?=
 =?utf-8?B?S3M0eFdpMmV5TCtjczVxMU9FZGZ6d2FlcGQzaDZjSGNVN1FMNFdoY1V4R0ZP?=
 =?utf-8?B?SjUyTXh0ZWJzcGJhclFuK2hRUytXMFRzNUo5eWo1MGlzcEs3R3VsYTBPVG1G?=
 =?utf-8?B?UEhKTlF3TzRwSnFSb0J4cWt1eXJjZDY4d2hQYVd5Yk9VNy9LZldEbEoyRlZ6?=
 =?utf-8?B?ZFFvYXZLeCtrYks2Y0k0Q3RKZ3NhYjdGOFpTQUdna28zZmVrKzZzaDUrdlZk?=
 =?utf-8?Q?4Bg7hYN1j0f8gG+Pzu5ft7bmu1iF19Uqo/0/Sm1?=
x-ms-exchange-transport-forked: True
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZagSAmiKYFykpCfBpSci2WGBxwqd45hyZpLS90YlSy7jYAOkF3FTG28gbA5k/naLNhMYUSqWovlspYDp6JTu+hGoaOORcnLBB7N8WUzgGTEHKnJIKqnKNSmafSDCHOnscDe42oshmXeA8jRPJJw62EolIzu2yqL6RJYYrnxS9xG643vlmWihK6ckA8NfLUyad9wGrjT8hHr9Jrtcu3E/YtzlE+92fbdRhzSOJbLtPHoNdoIGLpCWghcuh+6/ffyxE+uR3P6VejWDjyW6qwDMyuvBXKPOeL+f7TbEw9+vrp1lHjMncnGvliXAliaNvLofsTWJEEpaFRnDn68/SI4AbA==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMxCMFSuO1mdqBbfu/83+3e7ryuQgByNdgGl4oSpU2Y=;
 b=dhDhvRwvOCg8JA8qMrpQGpONX4vCZLe4WW5UanbLWiQcay+n0w6wfa/U6Q1vhsNXQGejjsNKRnq+MREZty9+15Hz6T9mDkoPnJcxPM7Jpgc+goTRXmxPGpj0MDO9EcF14dvFsqr8gxC+ea3QX8gQjBbb8diLOt4uLmGZDoA31Pi8BG8yJSVr2whG5f/6ifrqZQOx7kERvlkwYccemzon0mFNKV/N7dwRzAaXmofnG1UotZw1DAvPjsQVGB/wsCkQd0oBWw9Xqi2D/LP+5mzKwSGd+xUbS8SIzSYRaEcVLvg4j2kzjklDia6aZSWr3rPfdyouVDgPhQ+FdZOB0EXy1g==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 2dec208d-41a2-4c55-0d0a-08d8e7fb9ed3
x-ms-exchange-crosstenant-originalarrivaltime: 15 Mar 2021 21:45:15.8875 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: NX+tMasiUzKNHMX7ZDMSSgGLYOfQSLkCZts/7fHxsOsB4RC+iynTmAgAjETH4DG4UNux3K9ZFS7r3AdS1DTmnA==
x-ms-exchange-transport-crosstenantheadersstamped: SJ0PR02MB7263
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
Cc: "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IE1vbmRheSwgTWFyY2gg
MTUsIDIwMjEgODo0MCBBTQ0KPiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMu
Y29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBwaGlsbWRAcmVkaGF0LmNvbQ0KPiBT
dWJqZWN0OiBSZTogW1BBVENIXSBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgVENHIGdlbmVyYXRp
b24gY2xlYW51cA0KPg0KPiBPbiAzLzE0LzIxIDEwOjU0IFBNLCBUYXlsb3IgU2ltcHNvbiB3cm90
ZToNCj4gPiBTaW1wbGlmeSBUQ0cgZ2VuZXJhdGlvbiBvZiBoZXhfcmVnX3dyaXR0ZW4NCj4gPg0K
PiA+IEFkZHJlc3MgZmVlZGJhY2sgZnJvbSBSaWNoYXJkIEhlbmRlcnNvbg0KPiA8PHJpY2hhcmQu
aGVuZGVyc29uQGxpbmFyby5vcmc+DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBUYXlsb3IgU2lt
cHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+DQo+ID4gLS0tDQo+ID4gICB0YXJnZXQvaGV4YWdv
bi9nZW5wdHIuYyB8IDEyICsrKysrKysrKy0tLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDkgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS90YXJnZXQv
aGV4YWdvbi9nZW5wdHIuYyBiL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jDQo+ID4gaW5kZXggNzQ4
MWY0Yy4uMGFkNjNmZSAxMDA2NDQNCj4gPiAtLS0gYS90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYw0K
PiA+ICsrKyBiL3RhcmdldC9oZXhhZ29uL2dlbnB0ci5jDQo+ID4gQEAgLTQzLDkgKzQzLDE1IEBA
IHN0YXRpYyBpbmxpbmUgdm9pZCBnZW5fbG9nX3ByZWRpY2F0ZWRfcmVnX3dyaXRlKGludA0KPiBy
bnVtLCBUQ0d2IHZhbCwgaW50IHNsb3QpDQo+ID4gICAgICAgdGNnX2dlbl9tb3Zjb25kX3RsKFRD
R19DT05EX0VRLCBoZXhfbmV3X3ZhbHVlW3JudW1dLA0KPiBzbG90X21hc2ssIHplcm8sDQo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2YWwsIGhleF9uZXdfdmFsdWVbcm51bV0pOw0K
PiA+ICAgI2lmIEhFWF9ERUJVRw0KPiA+IC0gICAgLyogRG8gdGhpcyBzbyBIRUxQRVIoZGVidWdf
Y29tbWl0X2VuZCkgd2lsbCBrbm93ICovDQo+ID4gLSAgICB0Y2dfZ2VuX21vdmNvbmRfdGwoVENH
X0NPTkRfRVEsIGhleF9yZWdfd3JpdHRlbltybnVtXSwNCj4gc2xvdF9tYXNrLCB6ZXJvLA0KPiA+
IC0gICAgICAgICAgICAgICAgICAgICAgIG9uZSwgaGV4X3JlZ193cml0dGVuW3JudW1dKTsNCj4g
PiArICAgIC8qDQo+ID4gKyAgICAgKiBEbyB0aGlzIHNvIEhFTFBFUihkZWJ1Z19jb21taXRfZW5k
KSB3aWxsIGtub3cNCj4gPiArICAgICAqDQo+ID4gKyAgICAgKiBOb3RlIHRoYXQgc2xvdF9tYXNr
IGluZGljYXRlcyB0aGUgdmFsdWUgaXMgbm90IHdyaXR0ZW4NCj4gPiArICAgICAqIChpLmUuLCBz
bG90IHdhcyBjYW5jZWxsZWQpLCBzbyB3ZSBuZWdhdGUgdGhlIHZhbHVlIGJlZm9yZQ0KPiA+ICsg
ICAgICogb3InaW5nIHdpdGggaGV4X3JlZ193cml0dGVuW3JudW1dLg0KPiA+ICsgICAgICovDQo+
ID4gKyAgICB0Y2dfZ2VuX3hvcmlfdGwoc2xvdF9tYXNrLCBzbG90X21hc2ssIDEgPDwgc2xvdCk7
DQo+ID4gKyAgICB0Y2dfZ2VuX29yX3RsKGhleF9yZWdfd3JpdHRlbltybnVtXSwgaGV4X3JlZ193
cml0dGVuW3JudW1dLA0KPiBzbG90X21hc2spOw0KPg0KPiByZWdfd3JpdHRlbiBhcHBlYXJzIHRv
IGJlIGEgYm9vbGVhbiwgbm90IGEgbWFzayBvZiBhbnkga2luZC4NCj4gSSB0aGluayB5b3Ugd2Fu
dA0KPg0KPiAgICAgIHRjZ19nZW5fc2V0Y29uZF9pMzIoVENHX0NPTkRfRVEsIHNsb3RfbWFzaywg
c2xvdF9tYXNrLCB6ZXJvKTsNCj4NCj4gYW5kIG5vdCB0aGUgeG9yLg0KDQpJJ20gdHJlYXRpbmcg
aXQgYXMgYSB6ZXJvL25vbi16ZXJvIHZhbHVlLiAgVGhlIGNoYW5nZSB3b3JrcyBiZWNhdXNlIHRo
ZSB1c2FnZSBpbiBvcF9oZWxwZXIuYyBpcw0KICAgIGlmIChlbnYtPnJlZ193cml0dGVuW2ldKSAu
Li4NCg0KSSdsbCBjaGFuZ2UgdGhlIHhvciB0byBzZXRjb25kIHRvIG1ha2UgaXQgbW9yZSBjbGVh
ci4NCg0KDQpUaGFua3MsDQpUYXlsb3INCg0KDQo=

