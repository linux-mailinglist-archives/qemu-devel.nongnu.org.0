Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A44776004B3
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 03:07:52 +0200 (CEST)
Received: from localhost ([::1]:35228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okEbf-00083Z-La
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 21:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=282f36034=Dmitry.Fomichev@wdc.com>)
 id 1okERu-0003Ed-6v; Sun, 16 Oct 2022 20:57:46 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:43987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=282f36034=Dmitry.Fomichev@wdc.com>)
 id 1okERs-0004zF-5J; Sun, 16 Oct 2022 20:57:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1665968264; x=1697504264;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Qr2a0oO7CXsNXUm+Fc5sVbS3gpaZxnOWeFOLjw67TxQ=;
 b=R91yjBxn6xwoN5l03Ep55qJTZsaF0u8ZGZA/JE9wsGvkbKgsNXJBgSrG
 TRrNTiCqik1e55PvkqWMwYCMXIED0vegqpCvf1SQ6TIuAgxSVEktSK3G2
 E4eyRKY5DhoUnQl6dBFGSLBr5iBLpyl5PsdnpvBv3a/9B+Km7y8J63t9C
 9bKQif6vNlnka0wAkJRB9uQTyFUdM69JF3ykpqLbg90KTeXK4yET1iXej
 8cm07VLJ65X/KUiu9OZ2B5SYteXP3whV/FjL6peX6opuRt2pUSGZLi41F
 wj78D59e3l/OnV2YqmEKuoKTigVD856FBXG8OkSPIT16zK68NWpWVxAm3 g==;
X-IronPort-AV: E=Sophos;i="5.95,190,1661788800"; d="scan'208";a="213963301"
Received: from mail-dm6nam04lp2041.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.41])
 by ob1.hgst.iphmx.com with ESMTP; 17 Oct 2022 08:57:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RzdchwtVfu2X4WUQ2wK4VUsIHE761EBDx1R8PAUIQyB3gHm0CFsPtCnv0l4J7QHBaIs3cO6W0vyTnkDNNbzO67q3fKvt/2YoEuNP+GpWIreTRYBouXiwa1GjDtD5jbYw7y7f9irrCpSsQJEqbhRUPk/7smQttQjS+Ur2QJcuQrGMIE7+jpxbJt/Gu0sZbHQorBAW6TIyBDddb2fC//5jGCXe0tEQzUzHAC5kerefc5MDUjVZh86PyWylL3a68bElFFsm7ivAJ6aI5UlKLgWru8WarVVM7Xd3qGxfBl34h0D/awj+bOK+cNzaw+vA1s97qCyxMBtoMtSDdepWHJA5bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qr2a0oO7CXsNXUm+Fc5sVbS3gpaZxnOWeFOLjw67TxQ=;
 b=bI5bA3L6+n0BU2XOmC4OnuKj8UObl2RJHuvDzPYP8F164sPS4rg/i6AZ8m+oefjSRPHU4lozYut6VinDOrOP+xWaLCBB3xG3uazpCFaJPqMUgInyI9bZC85qjruCEtZrCAWRQJWyb2IR0PdgLCiDjvl1/T7Ot69bfWZDgaH7spf/g5H7MpGoICLM4Sfak01rdsyjQR3IJNSRS2Q300srwzgOD3/wyODTDSftlwXI6boEA2knY5hSHofrx6hmyNFLdCzcYa6NTV6zoBEgacxRatfcjtS0k7/fgYtrbGsqMQaywAJM4t5OdT3ACULrYrn8j0iCBSrVKzh8G7IVUj2uTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qr2a0oO7CXsNXUm+Fc5sVbS3gpaZxnOWeFOLjw67TxQ=;
 b=g9iYydkUcxX+w6nckI/3wz2cg0zlY7p/YGxTsWTAzhNT++EHiR/YvNWi8X3N4q4aYNjlljU/uQC2XOvfhvE6PsBzhJG1IBEc8VP7fL59joGNFybrupHPJiPl/2g+JVSKM9iHzJHK5eH8dnzA6jQcUM7OSm/8OxyHxDcs10hfrH0=
Received: from MN2PR04MB5951.namprd04.prod.outlook.com (2603:10b6:208:3f::13)
 by MWHPR04MB0512.namprd04.prod.outlook.com (2603:10b6:300:70::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 00:57:37 +0000
Received: from MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::51df:fdd7:7c49:12ee]) by MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::51df:fdd7:7c49:12ee%5]) with mapi id 15.20.5723.032; Mon, 17 Oct 2022
 00:57:36 +0000
From: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
To: "faithilikerun@gmail.com" <faithilikerun@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "hreitz@redhat.com" <hreitz@redhat.com>, "hare@suse.de" <hare@suse.de>,
 "armbru@redhat.com" <armbru@redhat.com>, "stefanha@redhat.com"
 <stefanha@redhat.com>, "fam@euphon.net" <fam@euphon.net>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "eblake@redhat.com"
 <eblake@redhat.com>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "damien.lemoal@opensource.wdc.com" <damien.lemoal@opensource.wdc.com>
Subject: Re: [PATCH v12 6/7] qemu-iotests: test new zone operations
Thread-Topic: [PATCH v12 6/7] qemu-iotests: test new zone operations
Thread-Index: AQHY4W7crUBxZeoQsk+CnkDJ7sbaDq4RxAQA
Date: Mon, 17 Oct 2022 00:57:36 +0000
Message-ID: <0e24771f0db95ffbd2ff413f24a4dfdc4674b89e.camel@wdc.com>
References: <20221016145110.171262-1-faithilikerun@gmail.com>
 <20221016145110.171262-7-faithilikerun@gmail.com>
In-Reply-To: <20221016145110.171262-7-faithilikerun@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR04MB5951:EE_|MWHPR04MB0512:EE_
x-ms-office365-filtering-correlation-id: fbdf2fa6-bafc-4c3c-bcdb-08daafda954b
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dMk70p/1dFlNuL9PxjleHYGiU0C1FA+lxYTSvB4gkwuT87DZgQiNkhLDNfhY1Zdm6fZQngrMVwRm54DYn/SJEorQ76cnS466PB2UGZU9WYpHQM5gWjVDl4ny5OEP9gRzTKhtaNhEPL01mMsq/yaKGOLPgSDIU+ayHc4aQ4Kc83krhMiq24Aod5jli8cbljO8ePt85TT2Jt9wIHUXXgGk2euo1cSRtJYsLpgtugknWZe1XgiHOs9CNWkhybAzH2qdFd0cgtTxCUHjmLOPJCBVBPu3dE9tI1foe9VZYyeO95VGArjOppu5yPe8266/2ALtL/nHLbWt8qR/dye0mC/hRRzU9BM217PJqKzteVqsfW8JNqgbxuQYw5pzfWXeuK05RPUV0HYCDlbPQq2RuU19EmTub0cg2wGATUMxjKwhs98y7Zf0en2UgVE6gzogtFgjnJUnprdb40CVx5GswSbdT+0MG33wl6c7bioBHtow17af07J8iAqg1ZQBmECfnrou6aBVQeHdROczFL2+3laoAOSRGgAIkEg9UM/EvM4UawZ4W7YHi/3L5ummBOS5WaUqggbfNXe1T9LqRpJQTfDSdwc3OzxsXbHuZeLQl7Q+0f+ObitOhODmE2aKz4/0OAE+AVHMqMqtf+M+fXBjWTou0HipzDrKOxeyEQZDhlk7CK9UCN+hN32G1kEOlLCr/wdNZUP6s0PCx3afL9KyHycCK4DFduVnOMrkkYLz7n9H+r3oHpm19Of6WIkPGZHHyvDWIKFkfsEmAu9DULjFV1EGhQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR04MB5951.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(451199015)(6506007)(71200400001)(478600001)(110136005)(54906003)(6486002)(66446008)(26005)(64756008)(8676002)(4326008)(91956017)(76116006)(66556008)(66946007)(41300700001)(6512007)(8936002)(5660300002)(7416002)(66476007)(2616005)(316002)(83380400001)(82960400001)(38070700005)(186003)(2906002)(4001150100001)(122000001)(38100700002)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TGoveDFDMWRFbmtoLzNKT25RVzN2eEN4VlFDZi9GN1RpQTF1NzZEYmc1dnFx?=
 =?utf-8?B?Y3dQZEtpNlRpT1dNYW8xaE04MlJDT1JTZnVBWk5YNFBHZmlZdlB4Q3pWV2VY?=
 =?utf-8?B?Qmw2WXQ5blpqUGFDeFZrR1RjeTBneFo5VFFLWWFBUlRxWGhyRzFidnVVcWlj?=
 =?utf-8?B?SnlvbEdSNjM1MXIvZlYvZFFjcDVBNU1wZHFRSlY4dGU4L3JOaEVPa1h0Um85?=
 =?utf-8?B?am5mR0sxMWo0SVNVT1ljY2xNYURJOHo1RDhhTTFIejMvTzY1U2NRZG03UVdO?=
 =?utf-8?B?dU9ueTFBVnlFWVRtd3dHeTE2UXZ3bW5jZVRvekRtZkVIbDRVWTRTM0JVcXda?=
 =?utf-8?B?WEY3aG9DallMQkZOakxNdm1YUDBaUzZ5Z3gyYUttckpSb0xYV1VoTDVKTWUv?=
 =?utf-8?B?Nk1PQzFvVkd6Q0NXTmRFcUJ0MVVVZUdMdTNqaEdEaXViOFZBK2VNYVNwcm83?=
 =?utf-8?B?RXJtRmlOZU1oS1N5Rk5aTlJoakRFdEtQaTRqWi8wdXNTdkVyTkVOR0paVWkx?=
 =?utf-8?B?QTZhV0VBczlGRDlodnVialh1Wnc3MVc4cGlyOE9BYmNiWE1UazJRSVVHTTRm?=
 =?utf-8?B?d3BMMDBQeFJYamFSNkRiZHViMkwyYWRCRG16UjRvMFUwekE5QWVkZXF4Tmti?=
 =?utf-8?B?RVRBVDRqY3IvdzhRaEpQNm51R2xGM044eEFndVliSzVBK2FSYnFYZzdlNFQv?=
 =?utf-8?B?U2tMU2p5Sjl2ZlBDeFEwRXBUbGhMdndlUDNmSGU5clFQTm5yK3RFQ2ZDclZp?=
 =?utf-8?B?UUt1elowc3ZTL0hoai90c1hpaTB5MVRTV1R1MFlLSXUvOGR1QnpNbjJEeTZr?=
 =?utf-8?B?TU1IU2ZRenNrK0lDZEdXODFMTnVVZWNZV0RwQkQrMFp0Q2NjQ0U5U0laUE9i?=
 =?utf-8?B?VXd4Uk5JenlSOVR6OW1INFM0MDYyaVJ5STRUNlBVWlhzcWYrdnNoeUh6WFRn?=
 =?utf-8?B?bjdma01WVUtHSEgzOHNBeG42RlJlbzh1UEZWcklsSXVadHNYSGpUTGVuY0oy?=
 =?utf-8?B?RTdrU2NCdktzTmlmckNmQWJQVEwxYlExSlR2Ykl0bnpwR1dPYkRWUlRLcUdp?=
 =?utf-8?B?V2d2WTF4anhWcUxCQ0gvUEp2cXBjZ014Y0RKMnkrazg0WmRuZEhqNFlZV2E5?=
 =?utf-8?B?ZGovTWVoNGRFbVV4d2xuVmljWmNkKzBTQ2U3cktaVEJsYW9iclk4VG1yQXhN?=
 =?utf-8?B?SFVnck9Ia0dBUmFZclFzZWpydi9MUjhuOE9mL1ZwcUROS2cvckF3TTlxS1U1?=
 =?utf-8?B?NjU4dkVXZlZHNHc3bnhlcTZNRGFFaWZabDRYZFFCVnl0byt2dFRrSG9NRkhL?=
 =?utf-8?B?SUZrTGZ1clZIbEV5d2YzKzUwWVd0WTV6NkNvendBTFRpMjdJbVFUZWtRL0hT?=
 =?utf-8?B?NmY5dzFoNGxPeW9pQm93cGJrM3h1dUN5WTJNR0xLN0U2OFozWGl0Q29OSWdR?=
 =?utf-8?B?dGJSZUJwQnZ0UnV1cFp5eC9SMkhlQ1c5Um1jSUdEVUhIT3VZUURXNW5saE5P?=
 =?utf-8?B?dk50Rk5uc3pla2JTMDUzSk9HVXJxcTRBVFc3YXdMVVVUSE9lQWg3dHgrZTdp?=
 =?utf-8?B?TFFaREordjh0Z1I3d1EyRk91ZURFZEFSdWptZi92ZTJ2MGxRaWwvN2xXNUJl?=
 =?utf-8?B?VWFoTDVqTXZDQnVSbFVmeUliME9kaUlybFdvekZ4SnlVVGVXMlBmQUtnTmls?=
 =?utf-8?B?Q0dyOENrbVVCL2FyYjJYaXIyY0x6bFhCc0VxZkhLQzc1NTQ2a1JodDErenhY?=
 =?utf-8?B?NkVHdDJQVFlpV3BDZzhPbC9KTnV3VVFDMHVialdPL2FYR3kxSDJjRlNEWTl6?=
 =?utf-8?B?RmJWdUtSNkdHWXByWDEvRVBvaTV0YUNMNTR1cnBtR2JMQWxXRlVYaGNZV2Jy?=
 =?utf-8?B?dkhweDhrOFM4VXYzWnkxN2s5dlJUT1Bnd3JTbTNhaE8vVExBbTdHcDlKcFdC?=
 =?utf-8?B?a0dTU083UUxjcEJCeFcyeFdGRll6TUJQOEE2TWpOYXJTRGNPVG00Z3NUYnRB?=
 =?utf-8?B?M3lsUG1JZ1ZtcGN5My8wam1uaS9hRk9pYUE1dzAwRnNlcWNycVF1MXNiemxP?=
 =?utf-8?B?L09NbmJibGpDUXZIWWI1c0F5OC9QNVE0cDBjbmdsUFJlL3U1S3o4TWtvQTZS?=
 =?utf-8?B?Skt5LzhEcHh3RDFkZU80TDd4ditSamREMGJnamVmalhpNXp6MEtWT2VXS2xE?=
 =?utf-8?B?Q0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <81450B6E898EF44A8F736D51B90A7FFB@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR04MB5951.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbdf2fa6-bafc-4c3c-bcdb-08daafda954b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2022 00:57:36.8377 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +/agcXrVp4LrYEcaYY6/rzJLqMKEsZ6HTFD5TWQml1uk5nKhX4IPBrQIYVT16dBuf4UnIRFmBPU8/m6Z72O1Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0512
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=282f36034=Dmitry.Fomichev@wdc.com; helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

T24gU3VuLCAyMDIyLTEwLTE2IGF0IDIyOjUxICswODAwLCBTYW0gTGkgd3JvdGU6DQo+IFdlIGhh
dmUgYWRkZWQgbmV3IGJsb2NrIGxheWVyIEFQSXMgb2Ygem9uZWQgYmxvY2sgZGV2aWNlcy4NCj4g
VGVzdCBpdCB3aXRoOg0KPiBDcmVhdGUgYSBudWxsX2JsayBkZXZpY2UsIHJ1biBlYWNoIHpvbmUg
b3BlcmF0aW9uIG9uIGl0IGFuZCBzZWUNCj4gd2hldGhlciByZXBvcnRpbmcgcmlnaHQgem9uZSBp
bmZvcm1hdGlvbi4NCg0KY2hhbmdlIHRoaXMgdG8gIndoZXRoZXIgdGhlIGxvZ3Mgc2hvdyB0aGUg
Y29ycmVjdCB6b25lIGluZm9ybWF0aW9uIj8NCg0KPiANCg0KQ291bGQgeW91IHBsZWFzZSBkZXNj
cmliZSBob3cgdG8gcnVuIHRoaXMgc3BlY2lmaWMgc2V0IG9mIHRlc3RzDQppbiBtb3JlIGRldGFp
bD8NCiANCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNhbSBMaSA8ZmFpdGhpbGlrZXJ1bkBnbWFpbC5j
b20+DQo+IFJldmlld2VkLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+
DQo+IC0tLQ0KPiDCoHRlc3RzL3FlbXUtaW90ZXN0cy90ZXN0cy96b25lZC5vdXQgfCA1MyArKysr
KysrKysrKysrKysrKysNCj4gwqB0ZXN0cy9xZW11LWlvdGVzdHMvdGVzdHMvem9uZWQuc2jCoCB8
IDg2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiDCoDIgZmlsZXMgY2hhbmdlZCwg
MTM5IGluc2VydGlvbnMoKykNCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvcWVtdS1pb3Rl
c3RzL3Rlc3RzL3pvbmVkLm91dA0KPiDCoGNyZWF0ZSBtb2RlIDEwMDc1NSB0ZXN0cy9xZW11LWlv
dGVzdHMvdGVzdHMvem9uZWQuc2gNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9xZW11LWlvdGVz
dHMvdGVzdHMvem9uZWQub3V0IGIvdGVzdHMvcWVtdS0NCj4gaW90ZXN0cy90ZXN0cy96b25lZC5v
dXQNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMC4uMGM4Zjk2ZGVi
OQ0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL3Rlc3RzL3FlbXUtaW90ZXN0cy90ZXN0cy96b25l
ZC5vdXQNCj4gQEAgLTAsMCArMSw1MyBAQA0KPiArUUEgb3V0cHV0IGNyZWF0ZWQgYnkgem9uZWQu
c2gNCj4gK1Rlc3RpbmcgYSBudWxsX2JsayBkZXZpY2U6DQo+ICtTaW1wbGUgY2FzZXM6IGlmIHRo
ZSBvcGVyYXRpb25zIHdvcmsNCj4gKygxKSByZXBvcnQgdGhlIGZpcnN0IHpvbmU6DQo+ICtzdGFy
dDogMHgwLCBsZW4gMHg4MDAwMCwgY2FwIDB4ODAwMDAsIHdwdHIgMHgwLCB6Y29uZDoxLCBbdHlw
ZTogMl0NCj4gKw0KPiArcmVwb3J0IHRoZSBmaXJzdCAxMCB6b25lcw0KPiArc3RhcnQ6IDB4MCwg
bGVuIDB4ODAwMDAsIGNhcCAweDgwMDAwLCB3cHRyIDB4MCwgemNvbmQ6MSwgW3R5cGU6IDJdDQo+
ICtzdGFydDogMHg4MDAwMCwgbGVuIDB4ODAwMDAsIGNhcCAweDgwMDAwLCB3cHRyIDB4ODAwMDAs
IHpjb25kOjEsIFt0eXBlOiAyXQ0KPiArc3RhcnQ6IDB4MTAwMDAwLCBsZW4gMHg4MDAwMCwgY2Fw
IDB4ODAwMDAsIHdwdHIgMHgxMDAwMDAsIHpjb25kOjEsIFt0eXBlOiAyXQ0KPiArc3RhcnQ6IDB4
MTgwMDAwLCBsZW4gMHg4MDAwMCwgY2FwIDB4ODAwMDAsIHdwdHIgMHgxODAwMDAsIHpjb25kOjEs
IFt0eXBlOiAyXQ0KPiArc3RhcnQ6IDB4MjAwMDAwLCBsZW4gMHg4MDAwMCwgY2FwIDB4ODAwMDAs
IHdwdHIgMHgyMDAwMDAsIHpjb25kOjEsIFt0eXBlOiAyXQ0KPiArc3RhcnQ6IDB4MjgwMDAwLCBs
ZW4gMHg4MDAwMCwgY2FwIDB4ODAwMDAsIHdwdHIgMHgyODAwMDAsIHpjb25kOjEsIFt0eXBlOiAy
XQ0KPiArc3RhcnQ6IDB4MzAwMDAwLCBsZW4gMHg4MDAwMCwgY2FwIDB4ODAwMDAsIHdwdHIgMHgz
MDAwMDAsIHpjb25kOjEsIFt0eXBlOiAyXQ0KPiArc3RhcnQ6IDB4MzgwMDAwLCBsZW4gMHg4MDAw
MCwgY2FwIDB4ODAwMDAsIHdwdHIgMHgzODAwMDAsIHpjb25kOjEsIFt0eXBlOiAyXQ0KPiArc3Rh
cnQ6IDB4NDAwMDAwLCBsZW4gMHg4MDAwMCwgY2FwIDB4ODAwMDAsIHdwdHIgMHg0MDAwMDAsIHpj
b25kOjEsIFt0eXBlOiAyXQ0KPiArc3RhcnQ6IDB4NDgwMDAwLCBsZW4gMHg4MDAwMCwgY2FwIDB4
ODAwMDAsIHdwdHIgMHg0ODAwMDAsIHpjb25kOjEsIFt0eXBlOiAyXQ0KPiArDQo+ICtyZXBvcnQg
dGhlIGxhc3Qgem9uZToNCj4gK3N0YXJ0OiAweDFmMzgwMDAwLCBsZW4gMHg4MDAwMCwgY2FwIDB4
ODAwMDAsIHdwdHIgMHgxZjM4MDAwMCwgemNvbmQ6MSwgW3R5cGU6DQo+IDJdDQo+ICsNCj4gKw0K
PiArKDIpIG9wZW5pbmcgdGhlIGZpcnN0IHpvbmUNCj4gK3JlcG9ydCBhZnRlcjoNCj4gK3N0YXJ0
OiAweDAsIGxlbiAweDgwMDAwLCBjYXAgMHg4MDAwMCwgd3B0ciAweDAsIHpjb25kOjMsIFt0eXBl
OiAyXQ0KPiArDQo+ICtvcGVuaW5nIHRoZSBzZWNvbmQgem9uZQ0KPiArcmVwb3J0IGFmdGVyOg0K
PiArc3RhcnQ6IDB4ODAwMDAsIGxlbiAweDgwMDAwLCBjYXAgMHg4MDAwMCwgd3B0ciAweDgwMDAw
LCB6Y29uZDozLCBbdHlwZTogMl0NCj4gKw0KPiArb3BlbmluZyB0aGUgbGFzdCB6b25lDQo+ICty
ZXBvcnQgYWZ0ZXI6DQo+ICtzdGFydDogMHgxZjM4MDAwMCwgbGVuIDB4ODAwMDAsIGNhcCAweDgw
MDAwLCB3cHRyIDB4MWYzODAwMDAsIHpjb25kOjMsIFt0eXBlOg0KPiAyXQ0KPiArDQo+ICsNCj4g
KygzKSBjbG9zaW5nIHRoZSBmaXJzdCB6b25lDQo+ICtyZXBvcnQgYWZ0ZXI6DQo+ICtzdGFydDog
MHgwLCBsZW4gMHg4MDAwMCwgY2FwIDB4ODAwMDAsIHdwdHIgMHgwLCB6Y29uZDoxLCBbdHlwZTog
Ml0NCj4gKw0KPiArY2xvc2luZyB0aGUgbGFzdCB6b25lDQo+ICtyZXBvcnQgYWZ0ZXI6DQo+ICtz
dGFydDogMHgxZjM4MDAwMCwgbGVuIDB4ODAwMDAsIGNhcCAweDgwMDAwLCB3cHRyIDB4MWYzODAw
MDAsIHpjb25kOjEsIFt0eXBlOg0KPiAyXQ0KPiArDQo+ICsNCj4gKyg0KSBmaW5pc2hpbmcgdGhl
IHNlY29uZCB6b25lDQo+ICtBZnRlciBmaW5pc2hpbmcgYSB6b25lOg0KPiArc3RhcnQ6IDB4ODAw
MDAsIGxlbiAweDgwMDAwLCBjYXAgMHg4MDAwMCwgd3B0ciAweDEwMDAwMCwgemNvbmQ6MTQsIFt0
eXBlOiAyXQ0KPiArDQo+ICsNCj4gKyg1KSByZXNldHRpbmcgdGhlIHNlY29uZCB6b25lDQo+ICtB
ZnRlciByZXNldHRpbmcgYSB6b25lOg0KPiArc3RhcnQ6IDB4ODAwMDAsIGxlbiAweDgwMDAwLCBj
YXAgMHg4MDAwMCwgd3B0ciAweDgwMDAwLCB6Y29uZDoxLCBbdHlwZTogMl0NCj4gKyoqKiBkb25l
DQo+IGRpZmYgLS1naXQgYS90ZXN0cy9xZW11LWlvdGVzdHMvdGVzdHMvem9uZWQuc2ggYi90ZXN0
cy9xZW11LQ0KPiBpb3Rlc3RzL3Rlc3RzL3pvbmVkLnNoDQo+IG5ldyBmaWxlIG1vZGUgMTAwNzU1
DQo+IGluZGV4IDAwMDAwMDAwMDAuLmZjZWQwMTk0YzUNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysg
Yi90ZXN0cy9xZW11LWlvdGVzdHMvdGVzdHMvem9uZWQuc2gNCj4gQEAgLTAsMCArMSw4NiBAQA0K
PiArIyEvdXNyL2Jpbi9lbnYgYmFzaA0KPiArIw0KPiArIyBUZXN0IHpvbmUgbWFuYWdlbWVudCBv
cGVyYXRpb25zLg0KPiArIw0KPiArDQo+ICtzZXE9IiQoYmFzZW5hbWUgJDApIg0KPiArZWNobyAi
UUEgb3V0cHV0IGNyZWF0ZWQgYnkgJHNlcSINCj4gK3N0YXR1cz0xICMgZmFpbHVyZSBpcyB0aGUg
ZGVmYXVsdCENCj4gKw0KPiArX2NsZWFudXAoKQ0KPiArew0KPiArwqAgX2NsZWFudXBfdGVzdF9p
bWcNCj4gK8KgIHN1ZG8gcm1tb2QgbnVsbF9ibGsNCj4gK30NCj4gK3RyYXAgIl9jbGVhbnVwOyBl
eGl0IFwkc3RhdHVzIiAwIDEgMiAzIDE1DQo+ICsNCj4gKyMgZ2V0IHN0YW5kYXJkIGVudmlyb25t
ZW50LCBmaWx0ZXJzIGFuZCBjaGVja3MNCj4gKy4gLi9jb21tb24ucmMNCj4gKy4gLi9jb21tb24u
ZmlsdGVyDQo+ICsuIC4vY29tbW9uLnFlbXUNCj4gKw0KPiArIyBUaGlzIHRlc3Qgb25seSBydW5z
IG9uIExpbnV4IGhvc3RzIHdpdGggcmF3IGltYWdlIGZpbGVzLg0KPiArX3N1cHBvcnRlZF9mbXQg
cmF3DQo+ICtfc3VwcG9ydGVkX3Byb3RvIGZpbGUNCj4gK19zdXBwb3J0ZWRfb3MgTGludXgNCj4g
Kw0KPiArUUVNVV9JTz0iYnVpbGQvcWVtdS1pbyINCj4gK0lNRz0iLS1pbWFnZS1vcHRzIC1uIGRy
aXZlcj16b25lZF9ob3N0X2RldmljZSxmaWxlbmFtZT0vZGV2L251bGxiMCINCj4gK1FFTVVfSU9f
T1BUSU9OUz0kUUVNVV9JT19PUFRJT05TX05PX0ZNVA0KPiArDQo+ICtlY2hvICJUZXN0aW5nIGEg
bnVsbF9ibGsgZGV2aWNlOiINCj4gK2VjaG8gImNhc2UgMTogaWYgdGhlIG9wZXJhdGlvbnMgd29y
ayINCj4gK3N1ZG8gbW9kcHJvYmUgbnVsbF9ibGsgbnJfZGV2aWNlcz0xIHpvbmVkPTENCj4gKw0K
PiArZWNobyAiKDEpIHJlcG9ydCB0aGUgZmlyc3Qgem9uZToiDQo+ICtzdWRvICRRRU1VX0lPICRJ
TUcgLWMgInpycCAwIDEiDQo+ICtlY2hvDQo+ICtlY2hvICJyZXBvcnQgdGhlIGZpcnN0IDEwIHpv
bmVzIg0KPiArc3VkbyAkUUVNVV9JTyAkSU1HIC1jICJ6cnAgMCAxMCINCj4gK2VjaG8NCj4gK2Vj
aG8gInJlcG9ydCB0aGUgbGFzdCB6b25lOiINCj4gK3N1ZG8gJFFFTVVfSU8gJElNRyAtYyAienJw
IDB4M2U3MDAwMDAwMCAyIiAjIDB4M2U3MDAwMDAwMCAvIDUxMiA9IDB4MWYzODAwMDANCj4gK2Vj
aG8NCj4gK2VjaG8NCj4gK2VjaG8gIigyKSBvcGVuaW5nIHRoZSBmaXJzdCB6b25lIg0KPiArc3Vk
byAkUUVNVV9JTyAkSU1HIC1jICJ6byAwIDI2ODQzNTQ1NiLCoCAjIDI2ODQzNTQ1NiAvIDUxMiA9
IDUyNDI4OA0KPiArZWNobyAicmVwb3J0IGFmdGVyOiINCj4gK3N1ZG8gJFFFTVVfSU8gJElNRyAt
YyAienJwIDAgMSINCj4gK2VjaG8NCj4gK2VjaG8gIm9wZW5pbmcgdGhlIHNlY29uZCB6b25lIg0K
PiArc3VkbyAkUUVNVV9JTyAkSU1HIC1jICJ6byAyNjg0MzU0NTYgMjY4NDM1NDU2IiAjDQo+ICtl
Y2hvICJyZXBvcnQgYWZ0ZXI6Ig0KPiArc3VkbyAkUUVNVV9JTyAkSU1HIC1jICJ6cnAgMjY4NDM1
NDU2IDEiDQo+ICtlY2hvDQo+ICtlY2hvICJvcGVuaW5nIHRoZSBsYXN0IHpvbmUiDQo+ICtzdWRv
ICRRRU1VX0lPICRJTUcgLWMgInpvIDB4M2U3MDAwMDAwMCAyNjg0MzU0NTYiDQo+ICtlY2hvICJy
ZXBvcnQgYWZ0ZXI6Ig0KPiArc3VkbyAkUUVNVV9JTyAkSU1HIC1jICJ6cnAgMHgzZTcwMDAwMDAw
IDIiDQo+ICtlY2hvDQo+ICtlY2hvDQo+ICtlY2hvICIoMykgY2xvc2luZyB0aGUgZmlyc3Qgem9u
ZSINCj4gK3N1ZG8gJFFFTVVfSU8gJElNRyAtYyAiemMgMCAyNjg0MzU0NTYiDQo+ICtlY2hvICJy
ZXBvcnQgYWZ0ZXI6Ig0KPiArc3VkbyAkUUVNVV9JTyAkSU1HIC1jICJ6cnAgMCAxIg0KPiArZWNo
bw0KPiArZWNobyAiY2xvc2luZyB0aGUgbGFzdCB6b25lIg0KPiArc3VkbyAkUUVNVV9JTyAkSU1H
IC1jICJ6YyAweDNlNzAwMDAwMDAgMjY4NDM1NDU2Ig0KPiArZWNobyAicmVwb3J0IGFmdGVyOiIN
Cj4gK3N1ZG8gJFFFTVVfSU8gJElNRyAtYyAienJwIDB4M2U3MDAwMDAwMCAyIg0KPiArZWNobw0K
PiArZWNobw0KPiArZWNobyAiKDQpIGZpbmlzaGluZyB0aGUgc2Vjb25kIHpvbmUiDQo+ICtzdWRv
ICRRRU1VX0lPICRJTUcgLWMgInpmIDI2ODQzNTQ1NiAyNjg0MzU0NTYiDQo+ICtlY2hvICJBZnRl
ciBmaW5pc2hpbmcgYSB6b25lOiINCj4gK3N1ZG8gJFFFTVVfSU8gJElNRyAtYyAienJwIDI2ODQz
NTQ1NiAxIg0KPiArZWNobw0KPiArZWNobw0KPiArZWNobyAiKDUpIHJlc2V0dGluZyB0aGUgc2Vj
b25kIHpvbmUiDQo+ICtzdWRvICRRRU1VX0lPICRJTUcgLWMgInpycyAyNjg0MzU0NTYgMjY4NDM1
NDU2Ig0KPiArZWNobyAiQWZ0ZXIgcmVzZXR0aW5nIGEgem9uZToiDQo+ICtzdWRvICRRRU1VX0lP
ICRJTUcgLWMgInpycCAyNjg0MzU0NTYgMSINCj4gKw0KPiArIyBzdWNjZXNzLCBhbGwgZG9uZQ0K
PiArZWNobyAiKioqIGRvbmUiDQo+ICtybSAtZiAkc2VxLmZ1bGwNCj4gK3N0YXR1cz0wDQoNCg==

