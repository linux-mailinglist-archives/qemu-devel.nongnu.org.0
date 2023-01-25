Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 464DC67BD35
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 21:44:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKmbn-00008x-Lp; Wed, 25 Jan 2023 15:43:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninadpalsule@us.ibm.com>)
 id 1pKj1v-0002lA-Ff; Wed, 25 Jan 2023 11:53:47 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninadpalsule@us.ibm.com>)
 id 1pKj1r-0008Df-Ky; Wed, 25 Jan 2023 11:53:46 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30PGgENm030902; Wed, 25 Jan 2023 16:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : content-type : mime-version; s=pp1;
 bh=woyDRylujW6EDEsy8UVdudahLVLPR2P0PknH7PJzF8E=;
 b=B8sCK9hz+fzfDvW2pWexm3yNW/2s5eaJhNmclo4Kwf9uh59ouAw0LYVePR7vTQlSlIql
 ExJ6w2KcpZ//UeVlN1PyzsKnjTgM4zjRnT1dQKC1UTZo+Ij8ds1mFEGGj/LzdYs/VqR5
 1yxFQSfQaq/Fk60N/Lkw/sN1+YCPIY949C5nX5pMwb83rAJe/bwEaOqQni170NVwCUDH
 4uXfGPo+86jgeCj43NLR52ZLN4ep/NpMlLHg3K+HA9kqOM/g2tQweldEpNt2TsHLgeJn
 W/HfdCL0lNkXvwOqDXLQgV5kYgcZA5Bp65R45zjR6cXRtwVK85Os9CKDyz1f2pKWxflx og== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3naaguux06-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Jan 2023 16:53:23 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30PGjIo0005422;
 Wed, 25 Jan 2023 16:53:22 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3naaguuwyk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Jan 2023 16:53:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SmCz326Qr2J9HViRblui9Syap007+d1NfnKVJW5uDaHPxr1iTKjpWkOPne3yvnRB2lmusUu64/zt5qXyQDHTtj6gUTG0FB0Jy2/lp4f2v9B8nCyRsgRRyVLHGkP6I2PBz4ZnhgSwLaSQAyeAPEzo1kmE7lN5NaAPMZ2xWVRFYcvybHdUwi4NFhgmuPm9xqv8RnwZEb/4lgB6cgMUCc0RmeWvPLK4zWIc9eRkU5mLAyb7RtuQjoh7wlocxWhBPCpx6Z9Z3/2Fg4XaJO3JxM4uR1NfNdev92v9OfAL6QlD6/EeGU+EYHE47fySeCWOwjUCFz937rPQZnY1LIZW5RxzpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=woyDRylujW6EDEsy8UVdudahLVLPR2P0PknH7PJzF8E=;
 b=MtZE3kF6TRudO5G0BDmu7/fyPNoYiBxywE+BU25TweBh9gc1ghRMe3nJdgaJQYBjCbg1VWGV3Q6CSGmfL56gk+vgivavc8RA0M305bHnb5JLDKy7xBqG74Pp8LUlbnVh1qiz+3FbISXAi+2j2wzHT4XQmAx6hOCH6NkHdIAZObAUZdAiYbz/+qvMuGMDMz43yUK+h7gspO73yY4oLSja+gtGcgeP1mcUC22OAOYRTmSk9YrraWCJ+Zh1su1e07y6N89EQKtybP8UU8o35aPPdg/zHok/de+oiieniEl7mXuqYVbO0DuO6d5bAGIz4eoOj7ypAa2TLvUvW+FnyMVEsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=us.ibm.com; dmarc=pass action=none header.from=us.ibm.com;
 dkim=pass header.d=us.ibm.com; arc=none
Received: from MN2PR15MB3502.namprd15.prod.outlook.com (2603:10b6:208:ff::26)
 by BLAPR15MB3939.namprd15.prod.outlook.com (2603:10b6:208:278::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 16:53:20 +0000
Received: from MN2PR15MB3502.namprd15.prod.outlook.com
 ([fe80::be97:8dd6:5058:a62d]) by MN2PR15MB3502.namprd15.prod.outlook.com
 ([fe80::be97:8dd6:5058:a62d%5]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 16:53:20 +0000
From: Ninad S Palsule <ninadpalsule@us.ibm.com>
To: "peter@pjd.dev" <peter@pjd.dev>
CC: "andrew@aj.id.au" <andrew@aj.id.au>, "clg@kaod.org" <clg@kaod.org>,
 "hskinnemoen@google.com" <hskinnemoen@google.com>, "joel@jms.id.au"
 <joel@jms.id.au>, "kfting@nuvoton.com" <kfting@nuvoton.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "philmd@linaro.org"
 <philmd@linaro.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Ninad S Palsule
 <ninadpalsule@us.ibm.com>
Subject: Re: [PATCH v4 3/5] hw/nvram/eeprom_at24c: Add init_rom field and
 at24c_eeprom_init_rom helper
Thread-Topic: [PATCH v4 3/5] hw/nvram/eeprom_at24c: Add init_rom field and
 at24c_eeprom_init_rom helper
Thread-Index: AQHZMN2HjTOj4RpcukKp4ueV4IqnkA==
Date: Wed, 25 Jan 2023 16:53:20 +0000
Message-ID: <3C616E21-EED8-4A17-9FC9-970939CC0926@contoso.com>
In-Reply-To: <<20230118024214.14413-4-peter@pjd.dev>>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR15MB3502:EE_|BLAPR15MB3939:EE_
x-ms-office365-filtering-correlation-id: 223c57d6-68b3-4988-8c5c-08dafef4a9df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UlyQn0x8eaTCeIrftG7zy+dxxOAtNUD19XNHLNOIs64Q5cXi+W6RDtr7VhnEU71Qle+WoPTUIks71uHsc3dwT1Qi5LhATUGu6Ai5yKYmktm9S/6njjhJiiEkvX/+oGSqLrlcKXZIxKMMPzdglEY8wDOYHB0MzHWGz9TIdodECqiuNBF6V7yuBamNKVBPZokejizuQe1Wkwh6b8Pt5VOpR7YG0+S9vp44wG8PZdghyZwvNhBQJ+IIcjCl056V5EzzqxAKWSyxiNHKj8+WlRZDEANkia2PjZQQUjhJBMspw7SwGmDMXTidUF7xbVSqJA5lli0WQDvxWEbSLKGkRO/L1uYqG8LpJQHFMVpU7sSQuAHHERPibtFqLeW5xNpereyPOFzZC85Hq8ZUV8xhNePyBFdzSWSLfLPof4l+6nTLZhX/ZKmKWe6rc4Dan0L5Ma0qqThvXR2QcpXV3oC4/WOETv7IsIX8A3WA3cKVIDWEhOynPfnOPUpQrTZjIVzrqcsP9AZoEOjfg3OtSA+yLKj7C10Vm/T+4QCcTVMzDGWOiUEZ/9NNkVl5w3w0u211cb44Mqof67dqea62s6h4ssdzKG32lieOhHxpZMU3AWd4NV1x2rNoK+mLDTRWSU5orYjuWVmf3ftw2tW4rPhQuz30GDyv1iD24drDgH48AJw4C7AkcqX97JxMZA1CVQMxZlvxzI/gSB+Vn9z43gT3jHDeZg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR15MB3502.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(396003)(346002)(366004)(376002)(136003)(451199018)(38100700002)(33656002)(122000001)(5660300002)(2906002)(7416002)(41300700001)(86362001)(4326008)(8936002)(6512007)(316002)(6506007)(186003)(8676002)(66476007)(66556008)(64756008)(54906003)(478600001)(66446008)(6916009)(66946007)(36756003)(6486002)(91956017)(71200400001)(9686003)(38070700005)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N1lyQjJ3aHlLdGlGODRjM0ZKT0dMUTU3cWdwalpqM3JOTDE3Rk5ZaVJmaGFw?=
 =?utf-8?B?V2c2MnRBanJHaVlyczVBSHQySFJsR3FWdjJVcVhEaE9vYTNVc24vZUJSdkc1?=
 =?utf-8?B?dTFvdWZGWkdtL3FiOWlkb1UyTzVkVDRKNjdoVWd6YWJBdlJlMmczQ0FkelZj?=
 =?utf-8?B?L3VucXMxQ0VDTHpTU3dGWVdXMWZLdXpValVTN3NVenQ4UjROcVhrZmsrTEVu?=
 =?utf-8?B?TUZMNUp3QnVhajgyM3NidnZNSjdkbFowazBZdHRDRDl5dysyLzQzTVR0NGpW?=
 =?utf-8?B?OStZVjF0YkswOFN5TnVEWVYrUVNPOHZzVkVSakFnNmRoaVRnWTQxRlFVWFZL?=
 =?utf-8?B?Qzh0MDZoKzlEZ2dId1lHajhEQVpTemwrSCtVb1oyWEpHY2lGZklWS0FOTXBa?=
 =?utf-8?B?TzA3SGtMNmRaaVNPanpBQTFnZnZNYVMxSmk5Zk1xRkhMVUl6M1A5b0dhdnY2?=
 =?utf-8?B?OGdHOFBaeXJnRkNvUHQ2TUhJZTVRN2xmR1pVQldaU2xqZ3hLdGdxV0xGTTB5?=
 =?utf-8?B?TDd5WkFBd0dDdVltQlNselBvemVLMVg0dDNBRE9tVXlpa2hIK3dpcG8zcDVx?=
 =?utf-8?B?REFEL3BJN1JYRWJ6bnMyVHpac2g2bUI3QmFFcWw5SEJmalBQbUxRcFdyakxx?=
 =?utf-8?B?eElJMWV5QnVFVTlsL1k4bDVOTGM3UnArRFg3MUFUODhncENWdFNvK0taSk1z?=
 =?utf-8?B?RGI5ZitwMW82aEgzT0FUS0pubUhEU1FVakd0TnBLYzZPaWp6Rlk1TDdOSGlH?=
 =?utf-8?B?Tyt0L09PYkV2dVVkNkxhMUFqUUZnck5ZTUJtTUZRVEN2UkwrSUM3M0JJcmJj?=
 =?utf-8?B?VnQ2NnJzVnN4VE9CMlFiSUEzakpHeFIyQnJLZGRrQlFQVU9QT0gvS09uUkV6?=
 =?utf-8?B?Z3Z6YVhLalVOUWFkOW9VdjFhc1lweTd0QkozZlJLRENNTmQ1OHVUbTlBcVkx?=
 =?utf-8?B?V0w0QkJCbEJVNjFKa1ZlcHR2QlR6d2o5TzdUY09zQWV6eVR1ajdkYW9lY1gw?=
 =?utf-8?B?SXdDV2ZTODE1M2JGSTR4M043MVE1cEk4aWtWZlRzVmhaVC9oa2dZeGlOUE5U?=
 =?utf-8?B?aFdCSlZhT2tCQkJ5T0ppM3MyZStmeU1BbGdsMVA0aFJaZXhWTm9rNWdwV3FR?=
 =?utf-8?B?SDlqb2ttcyt0RDdUclZzM2VUSUlvdFNGMXNxN2ZUN0ZtaEZMMzlQeFptYWNr?=
 =?utf-8?B?a0I0L2U2Z1ZOYzZScEZ2SFd0ZFFyWWU0WE81SjhJN0E0ZHJiQ2dCOG92ZXo0?=
 =?utf-8?B?VndmNDZ5d29ZZmxDUWRpUDFpRUpvcXMzNWNiMFZUVk5NRjJoNnRkZHpDV05i?=
 =?utf-8?B?eVhKZDUycVlNMG83ZjUrYkl3YlZRNksvL0pacjlVWVBpTndGRXoyWHl5ZUhQ?=
 =?utf-8?B?YjIySU93akhqbm0ybzQwbkJoTFBaWStydCtPWkNkdExoc2JEd0Fselk1d0dP?=
 =?utf-8?B?TnRGTWI2TzF3NS9Yb1pucklPazYvekIwejUvQ2tFZEZ5OHRMank1em5laXUr?=
 =?utf-8?B?MkhZSXJBT1dhQWNsK0svYytDYlRkbGxYRE5EUmdZMUNqZlYyQmQ1UDI5STlq?=
 =?utf-8?B?QW80NTFFL2wyaDFqRGp1R2JCZ3pzMTlOQmpSQ0VEemEyajFpZW5mNnJnU3Fu?=
 =?utf-8?B?d0NLMXNBMVhKNHFzSElWci94amYvZ3drZnVLRGZYcXFOZEFGVnByUnBVUGlt?=
 =?utf-8?B?UWdKSU9TNnE0T1Z2RE5RVTZITFZISkl5L0U1SWpYdnVZOXVSWFlCWkNrY1FW?=
 =?utf-8?B?NzUxTHdVVVBPazNRS0hER3BSSHluWG9JWlVZOUFvbk9YNi9UK25QcHVyM3Av?=
 =?utf-8?B?UXZ6aEp6VVhzdFVZUHZES2pTTnVFM0JjckI0VkhhYm1ER2ZoM1RkNm1kQnIv?=
 =?utf-8?B?THExU2xNNkRORnJJS2hwQ2YwT0NmUFg5MzJTYlMvRWV0YjA3YjVuVUJuYVpY?=
 =?utf-8?B?MGRteENVQUR0Zmo4Smt2dFNRdWVqZWZnQ0pzMm9aT3ZITERzWHpGYjBpK3U0?=
 =?utf-8?B?UTdQVUZ0Z1pRT1FNZTh4Tml5OFpWNGs4cTZMaml5QWtKVk0ydi9DckFSUUZ3?=
 =?utf-8?B?eVZmMjlCSmdFNmMxazRsN2xkK3YyTkY3TWNCWllONm1WVEtHdHI5bVRtZnVY?=
 =?utf-8?B?c1hMZTVuWlprYWFuVm9GVUtlTGlXSlZlRlk5QXIvWE1mYjBBM21FNjNvTi83?=
 =?utf-8?B?aGRiWk1nRVFkL29pODVIQ0pHVmJIZXdlanMzZ0tNODA4NUFLRVlFOU44b2U5?=
 =?utf-8?B?RDNGSjhzK2NMR3dFTDE1a3c5Y2FBPT0=?=
Content-Type: multipart/alternative;
 boundary="_000_3C616E21EED84A179FC9970939CC0926contosocom_"
X-OriginatorOrg: us.ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR15MB3502.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 223c57d6-68b3-4988-8c5c-08dafef4a9df
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2023 16:53:20.1353 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qj5hiqZFbInmEva7kGpwlifGBhlTWGnES1xQ7uRTcXs7vds2pxkVh08Q+SV2RSqAiUlkwNJ8Xp5xgBA+vZCoNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR15MB3939
X-Proofpoint-ORIG-GUID: p85xxTgCs6IG2USp8lv4SKPZXGNWgEIU
X-Proofpoint-GUID: K58HGhNtu2lGsj3pMviUT_GiqS7QNJD0
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-25_10,2023-01-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=865 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301250147
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=ninadpalsule@us.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 25 Jan 2023 15:43:01 -0500
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--_000_3C616E21EED84A179FC9970939CC0926contosocom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

U2lnbmVkLW9mZi1ieTogUGV0ZXIgRGVsZXZvcnlhcyBwZXRlckBwamQuZGV2PG1haWx0bzpwZXRl
ckBwamQuZGV2Pg0KUmV2aWV3ZWQtYnk6IEpvZWwgU3RhbmxleSBqb2VsQGptcy5pZC5hdTxtYWls
dG86am9lbEBqbXMuaWQuYXU+DQoNClRlc3RlZC1ieTogTmluYWQgUGFsc3VsZSBuaW5hZHBhbHN1
bGVAdXMuaWJtLmNvbTxtYWlsdG86bmluYWRwYWxzdWxlQHVzLmlibS5jb20+DQoNCkhpIFBldGVy
LA0KSSBhcHBsaWVkIHlvdXIgcGF0Y2hlcyBhbmQgbWFkZSBzdXJlIHRoYXQgZGlmZmVyZW50IEVF
UFJPTSBpbWFnZXMgY2FuIGJlIGxvYWRlZCBmcm9tDQphcHByb3ByaWF0ZSBpbWFnZSBmaWxlcyBh
bmQgaXQgaXMgd29ya2luZyBhcyBleHBlY3RlZC4NCg0KIyBVc2VkIGZvbGxvd2luZyBjb21tYW5k
IHRvIGludm9rZSB0aGUgcWVtdS4NCnFlbXUtc3lzdGVtLWFybSAtTSByYWluaWVyLWJtYyAtbm9n
cmFwaGljIFwNCiAgLWtlcm5lbCBmaXRJbWFnZS1saW51eC5iaW4gXA0KICAtZHRiIGFzcGVlZC1i
bWMtaWJtLXJhaW5pZXIuZHRiIFwNCiAgLWluaXRyZCBvYm1jLXBob3NwaG9yLWluaXRyYW1mcy5y
b290ZnMuY3Bpby54eiBcDQogIC1kcml2ZSBmaWxlPW9ibWMtcGhvc3Bob3ItaW1hZ2Uucm9vdGZz
LndpYy5xY293MixpZj1zZCxpbmRleD0yIFwNCiAgLWFwcGVuZCAicm9vdHdhaXQgY29uc29sZT10
dHlTNCwxMTUyMDBuOCByb290PVBBUlRMQUJFTD1yb2ZzLWEiIFwNCiAgLWRldmljZSBhdDI0Yy1l
ZXByb20sYnVzPWFzcGVlZC5pMmMuYnVzLjAsYWRkcmVzcz0weDUxLGRyaXZlPWEscm9tLXNpemU9
MzI3NjggLWRyaXZlIGZpbGU9dHBtLmVlcHJvbS5iaW4sZm9ybWF0PXJhdyxpZj1ub25lLGlkPWEg
XA0KICAtZGV2aWNlIGF0MjRjLWVlcHJvbSxidXM9YXNwZWVkLmkyYy5idXMuNyxhZGRyZXNzPTB4
NTAsZHJpdmU9Yixyb20tc2l6ZT02NTUzNiAtZHJpdmUgZmlsZT1vcHBhbmVsLmVlcHJvbS5iaW4s
Zm9ybWF0PXJhdyxpZj1ub25lLGlkPWIgXA0KICAtZGV2aWNlIGF0MjRjLWVlcHJvbSxidXM9YXNw
ZWVkLmkyYy5idXMuNyxhZGRyZXNzPTB4NTEsZHJpdmU9Yyxyb20tc2l6ZT02NTUzNiAtZHJpdmUg
ZmlsZT1sY2QuZWVwcm9tLmJpbixmb3JtYXQ9cmF3LGlmPW5vbmUsaWQ9YyBcDQogIC1kZXZpY2Ug
YXQyNGMtZWVwcm9tLGJ1cz1hc3BlZWQuaTJjLmJ1cy44LGFkZHJlc3M9MHg1MCxkcml2ZT1kLHJv
bS1zaXplPTY1NTM2IC1kcml2ZSBmaWxlPWJhc2Vib2FyZC5lZXByb20uYmluLGZvcm1hdD1yYXcs
aWY9bm9uZSxpZD1kIFwNCiAgLWRldmljZSBhdDI0Yy1lZXByb20sYnVzPWFzcGVlZC5pMmMuYnVz
LjgsYWRkcmVzcz0weDUxLGRyaXZlPWUscm9tLXNpemU9NjU1MzYgLWRyaXZlIGZpbGU9Ym1jLmVl
cHJvbS5iaW4sZm9ybWF0PXJhdyxpZj1ub25lLGlkPWUgXA0KICAtZGV2aWNlIGF0MjRjLWVlcHJv
bSxidXM9YXNwZWVkLmkyYy5idXMuOSxhZGRyZXNzPTB4NTAsZHJpdmU9Zixyb20tc2l6ZT0xMzEw
NzIgLWRyaXZlIGZpbGU9dnJtLmVlcHJvbS5iaW4sZm9ybWF0PXJhdyxpZj1ub25lLGlkPWYgXA0K
ICAtZGV2aWNlIGF0MjRjLWVlcHJvbSxidXM9YXNwZWVkLmkyYy5idXMuMTAsYWRkcmVzcz0weDUw
LGRyaXZlPWcscm9tLXNpemU9MTMxMDcyIC1kcml2ZSBmaWxlPXZybS5lZXByb20uYmluLGZvcm1h
dD1yYXcsaWY9bm9uZSxpZD1nIFwNCiAgLWRldmljZSBhdDI0Yy1lZXByb20sYnVzPWFzcGVlZC5p
MmMuYnVzLjEzLGFkZHJlc3M9MHg1MCxkcml2ZT1oLHJvbS1zaXplPTY1NTM2IC1kcml2ZSBmaWxl
PW52bWUuZWVwcm9tLmJpbixmb3JtYXQ9cmF3LGlmPW5vbmUsaWQ9aCBcDQogIC1kZXZpY2UgYXQy
NGMtZWVwcm9tLGJ1cz1hc3BlZWQuaTJjLmJ1cy4xNCxhZGRyZXNzPTB4NTAsZHJpdmU9aSxyb20t
c2l6ZT02NTUzNiAtZHJpdmUgZmlsZT1udm1lLmVlcHJvbS5iaW4sZm9ybWF0PXJhdyxpZj1ub25l
LGlkPWkgXA0KICAtZGV2aWNlIGF0MjRjLWVlcHJvbSxidXM9YXNwZWVkLmkyYy5idXMuMTUsYWRk
cmVzcz0weDUwLGRyaXZlPWoscm9tLXNpemU9NjU1MzYgLWRyaXZlIGZpbGU9bnZtZS5lZXByb20u
YmluLGZvcm1hdD1yYXcsaWY9bm9uZSxpZD1qDQo=

--_000_3C616E21EED84A179FC9970939CC0926contosocom_
Content-Type: text/html; charset="utf-8"
Content-ID: <DF827D3A49C94C4AB29ADE3AC4D8D8F9@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToy
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3Jt
YWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0KCWZvbnQtc2l6
ZToxMS4wcHQ7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KYTpsaW5rLCBz
cGFuLk1zb0h5cGVybGluaw0KCXttc28tc3R5bGUtcHJpb3JpdHk6OTk7DQoJY29sb3I6IzA1NjND
MTsNCgl0ZXh0LWRlY29yYXRpb246dW5kZXJsaW5lO30NCnNwYW4uRW1haWxTdHlsZTE3DQoJe21z
by1zdHlsZS10eXBlOnBlcnNvbmFsLWNvbXBvc2U7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNh
bnMtc2VyaWY7DQoJY29sb3I6d2luZG93dGV4dDt9DQouTXNvQ2hwRGVmYXVsdA0KCXttc28tc3R5
bGUtdHlwZTpleHBvcnQtb25seTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9
DQpAcGFnZSBXb3JkU2VjdGlvbjENCgl7c2l6ZTo4LjVpbiAxMS4waW47DQoJbWFyZ2luOjEuMGlu
IDEuMGluIDEuMGluIDEuMGluO30NCmRpdi5Xb3JkU2VjdGlvbjENCgl7cGFnZTpXb3JkU2VjdGlv
bjE7fQ0KLS0+PC9zdHlsZT4NCjwvaGVhZD4NCjxib2R5IGxhbmc9IkVOLVVTIiBsaW5rPSIjMDU2
M0MxIiB2bGluaz0iIzk1NEY3MiIgc3R5bGU9IndvcmQtd3JhcDpicmVhay13b3JkIj4NCjxkaXYg
Y2xhc3M9IldvcmRTZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5TaWduZWQtb2ZmLWJ5
OiBQZXRlciBEZWxldm9yeWFzIDxhIGhyZWY9Im1haWx0bzpwZXRlckBwamQuZGV2Ij4NCnBldGVy
QHBqZC5kZXY8L2E+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5SZXZpZXdl
ZC1ieTogSm9lbCBTdGFubGV5IDxhIGhyZWY9Im1haWx0bzpqb2VsQGptcy5pZC5hdSI+am9lbEBq
bXMuaWQuYXU8L2E+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZu
YnNwOzwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPlRlc3RlZC1ieTogTmluYWQgUGFs
c3VsZSA8YSBocmVmPSJtYWlsdG86bmluYWRwYWxzdWxlQHVzLmlibS5jb20iPg0KbmluYWRwYWxz
dWxlQHVzLmlibS5jb208L2E+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48
bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkhpIFBldGVyLDxvOnA+
PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+SSBhcHBsaWVkIHlvdXIgcGF0Y2hlcyBh
bmQgbWFkZSBzdXJlIHRoYXQgZGlmZmVyZW50IEVFUFJPTSBpbWFnZXMgY2FuIGJlIGxvYWRlZCBm
cm9tPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5hcHByb3ByaWF0ZSBpbWFn
ZSBmaWxlcyBhbmQgaXQgaXMgd29ya2luZyBhcyBleHBlY3RlZC48bzpwPjwvbzpwPjwvcD4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+IyBVc2VkIGZvbGxvd2luZyBjb21tYW5kIHRvIGludm9rZSB0aGUgcWVtdS48bzpwPjwv
bzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPnFlbXUtc3lzdGVtLWFybSAtTSByYWluaWVy
LWJtYyAtbm9ncmFwaGljIFw8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZu
YnNwOyAta2VybmVsIGZpdEltYWdlLWxpbnV4LmJpbiBcPG86cD48L286cD48L3A+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj4mbmJzcDsgLWR0YiBhc3BlZWQtYm1jLWlibS1yYWluaWVyLmR0YiBcPG86
cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDsgLWluaXRyZCBvYm1jLXBo
b3NwaG9yLWluaXRyYW1mcy5yb290ZnMuY3Bpby54eiBcPG86cD48L286cD48L3A+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj4mbmJzcDsgLWRyaXZlIGZpbGU9b2JtYy1waG9zcGhvci1pbWFnZS5yb290
ZnMud2ljLnFjb3cyLGlmPXNkLGluZGV4PTIgXDxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+Jm5ic3A7IC1hcHBlbmQgJnF1b3Q7cm9vdHdhaXQgY29uc29sZT10dHlTNCwxMTUy
MDBuOCByb290PVBBUlRMQUJFTD1yb2ZzLWEmcXVvdDsgXDxvOnA+PC9vOnA+PC9wPg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+Jm5ic3A7IC1kZXZpY2UgYXQyNGMtZWVwcm9tLGJ1cz1hc3BlZWQuaTJj
LmJ1cy4wLGFkZHJlc3M9MHg1MSxkcml2ZT1hLHJvbS1zaXplPTMyNzY4IC1kcml2ZSBmaWxlPXRw
bS5lZXByb20uYmluLGZvcm1hdD1yYXcsaWY9bm9uZSxpZD1hIFw8bzpwPjwvbzpwPjwvcD4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPiZuYnNwOyAtZGV2aWNlIGF0MjRjLWVlcHJvbSxidXM9YXNwZWVk
LmkyYy5idXMuNyxhZGRyZXNzPTB4NTAsZHJpdmU9Yixyb20tc2l6ZT02NTUzNiAtZHJpdmUgZmls
ZT1vcHBhbmVsLmVlcHJvbS5iaW4sZm9ybWF0PXJhdyxpZj1ub25lLGlkPWIgXDxvOnA+PC9vOnA+
PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7IC1kZXZpY2UgYXQyNGMtZWVwcm9tLGJ1
cz1hc3BlZWQuaTJjLmJ1cy43LGFkZHJlc3M9MHg1MSxkcml2ZT1jLHJvbS1zaXplPTY1NTM2IC1k
cml2ZSBmaWxlPWxjZC5lZXByb20uYmluLGZvcm1hdD1yYXcsaWY9bm9uZSxpZD1jIFw8bzpwPjwv
bzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZuYnNwOyAtZGV2aWNlIGF0MjRjLWVlcHJv
bSxidXM9YXNwZWVkLmkyYy5idXMuOCxhZGRyZXNzPTB4NTAsZHJpdmU9ZCxyb20tc2l6ZT02NTUz
NiAtZHJpdmUgZmlsZT1iYXNlYm9hcmQuZWVwcm9tLmJpbixmb3JtYXQ9cmF3LGlmPW5vbmUsaWQ9
ZCBcPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDsgLWRldmljZSBh
dDI0Yy1lZXByb20sYnVzPWFzcGVlZC5pMmMuYnVzLjgsYWRkcmVzcz0weDUxLGRyaXZlPWUscm9t
LXNpemU9NjU1MzYgLWRyaXZlIGZpbGU9Ym1jLmVlcHJvbS5iaW4sZm9ybWF0PXJhdyxpZj1ub25l
LGlkPWUgXDxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7IC1kZXZp
Y2UgYXQyNGMtZWVwcm9tLGJ1cz1hc3BlZWQuaTJjLmJ1cy45LGFkZHJlc3M9MHg1MCxkcml2ZT1m
LHJvbS1zaXplPTEzMTA3MiAtZHJpdmUgZmlsZT12cm0uZWVwcm9tLmJpbixmb3JtYXQ9cmF3LGlm
PW5vbmUsaWQ9ZiBcPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDsg
LWRldmljZSBhdDI0Yy1lZXByb20sYnVzPWFzcGVlZC5pMmMuYnVzLjEwLGFkZHJlc3M9MHg1MCxk
cml2ZT1nLHJvbS1zaXplPTEzMTA3MiAtZHJpdmUgZmlsZT12cm0uZWVwcm9tLmJpbixmb3JtYXQ9
cmF3LGlmPW5vbmUsaWQ9ZyBcPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4m
bmJzcDsgLWRldmljZSBhdDI0Yy1lZXByb20sYnVzPWFzcGVlZC5pMmMuYnVzLjEzLGFkZHJlc3M9
MHg1MCxkcml2ZT1oLHJvbS1zaXplPTY1NTM2IC1kcml2ZSBmaWxlPW52bWUuZWVwcm9tLmJpbixm
b3JtYXQ9cmF3LGlmPW5vbmUsaWQ9aCBcPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj4mbmJzcDsgLWRldmljZSBhdDI0Yy1lZXByb20sYnVzPWFzcGVlZC5pMmMuYnVzLjE0LGFk
ZHJlc3M9MHg1MCxkcml2ZT1pLHJvbS1zaXplPTY1NTM2IC1kcml2ZSBmaWxlPW52bWUuZWVwcm9t
LmJpbixmb3JtYXQ9cmF3LGlmPW5vbmUsaWQ9aSBcPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0i
TXNvTm9ybWFsIj4mbmJzcDsgLWRldmljZSBhdDI0Yy1lZXByb20sYnVzPWFzcGVlZC5pMmMuYnVz
LjE1LGFkZHJlc3M9MHg1MCxkcml2ZT1qLHJvbS1zaXplPTY1NTM2IC1kcml2ZSBmaWxlPW52bWUu
ZWVwcm9tLmJpbixmb3JtYXQ9cmF3LGlmPW5vbmUsaWQ9ajxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+
DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_3C616E21EED84A179FC9970939CC0926contosocom_--

