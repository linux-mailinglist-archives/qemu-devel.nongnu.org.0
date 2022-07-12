Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D90DC57219F
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 19:17:55 +0200 (CEST)
Received: from localhost ([::1]:40248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBJWE-0008WA-IS
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 13:17:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1oBJSl-0006O2-Pj; Tue, 12 Jul 2022 13:14:20 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:14722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1oBJSf-00066B-9g; Tue, 12 Jul 2022 13:14:17 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26CGcuWr020745;
 Tue, 12 Jul 2022 17:13:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=uEhfJ0eCeTipUZD0q+z6W6iDZ1ID7C8gcSwIJgezod8=;
 b=LeBJ5WRVgOIYNIvsMjTh3b4hUNPowqvrkMrATFS5K5e6r5Fl2PEAWmufsPqfJraj713Z
 cq4grR4dH+EPlMsbqejRqg2eEbe094ujFfWy2eYcPLjAyN7xecHWNZUJ+8557BgMF199
 Mv2ATeSsUad53FUVPNCi5AQSoOX1Dih+dEEuM0Io7yQw6PGn3+i5rSqEWtsXOfjXFhJ3
 6r9+F4NY2udIkIAPfcEA1ySVsjd1MmapD9HWfnueyujs0WlZEIwlF8FRxBwzLTvLec+v
 nU2myn+ZnrZKAG/CHin0F5mevKbVc3NHZIAUJ63OKKU5Ne0oxKRELByyQVjuTc4huU/Q cA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h71sgqam5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Jul 2022 17:13:54 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 26CHBZN7036806; Tue, 12 Jul 2022 17:13:54 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3h7043rnvc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Jul 2022 17:13:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJfPN09x8tm7dCPYJm40PuYhVA61uVDYzFLrWfOSGDCi8OiAh4n+shFdRvX7Jd76GANwnrPXvEFNyOxay+5xxagWKYoOMc/Ab9XPtAVwd2bj5I113E8/7myz3hObJHGNvCTMktAONv9wGlejzHnTjQGWa6kuFnwevwKs7mMUCCyORBC4Jf3pp2SzSNf3PbUW+THFV+u9cvZJ8Bgm9zXJiJVKQuVSqIJpwLkIKHItSbGWgpAHjyH+HNpKr7mfvzPNyaF2odmZINXyDNbgRtfTuChhKtGTUMO+hyMdIN7VPCzRpKYZtWQaJmnUTnTsGM/dVqsQAmUOeWHy7dsuJQetZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uEhfJ0eCeTipUZD0q+z6W6iDZ1ID7C8gcSwIJgezod8=;
 b=kLGunHgw9Gw4cjt/HqbvAwQEA6MUsvgPfxzZ61/Ua94dwRoNjrpKjXYsSQma9BKKRu9bglgwsTBDneL/NjztaFFbUEFx7cuRikn40mOw4sZr3hsjweAKOQUNhW6Yjiuz8tP8TPVdoccnaCY9LDl23/sw2hsbY7eHrmkmHXjrfhKDLXotkLuQL4B2ElTyyGQQcgo5PcuPbwsZmoaWAh287ipw2xT0VmLm0Ryppn+vsnHRmiI5WEYXBr8rwpmspSZyhuiKdpZ7jtxQ/Lz3HyGEHfyDuoHuCexEM/s9lM2n6vlRCILisC0sb8nQw+fcSko6rqkQTPk20YBW9a3i1WI3zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uEhfJ0eCeTipUZD0q+z6W6iDZ1ID7C8gcSwIJgezod8=;
 b=LU05l+pHcdDQdesECdpQ8R7lH0ZeOtlG4XprWhWUmNvGSfAUY8qGwJo5negDgvJYmJH8QNKbn7UdgsfRI5BgEoLHTXbnswaQAjfVGXwLs0SfqBs0uUPsSUhOK67i8VMJu5gJHt8NknMJEkIvWP7UcTAe9iG+NorHnlXCyOCK6Ys=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by PH7PR10MB5723.namprd10.prod.outlook.com (2603:10b6:510:127::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Tue, 12 Jul
 2022 17:13:51 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::5931:4a28:ccfe:7b68]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::5931:4a28:ccfe:7b68%7]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 17:13:51 +0000
From: Jag Raman <jag.raman@oracle.com>
To: =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>
CC: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Thomas Huth <thuth@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>, Elena
 Ufimtseva <elena.ufimtseva@oracle.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 "virtio-fs@redhat.com" <virtio-fs@redhat.com>, Hanna Reitz
 <hreitz@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, Eric Blake
 <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Beraldo Leal
 <bleal@redhat.com>, Peter Xu <peterx@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Qiuhao Li <Qiuhao.Li@outlook.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>, Bandan Das
 <bsd@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Stefano Garzarella
 <sgarzare@redhat.com>, Alexander Bulekov <alxndr@bu.edu>, Julia Suvorova
 <jusual@redhat.com>, Darren Kenny <darren.kenny@oracle.com>, Wainer dos
 Santos Moschetta <wainersm@redhat.com>, John Johnson
 <john.g.johnson@oracle.com>
Subject: Re: [PULL 06/18] vfio-user: build library
Thread-Topic: [PULL 06/18] vfio-user: build library
Thread-Index: AQHYgNAzPAHg/fw6+UmvwSew+l/3da16lC0AgABx44CAAATRgIAAGP+A
Date: Tue, 12 Jul 2022 17:13:51 +0000
Message-ID: <31B45203-DEF9-4D9A-88C2-B047BBA87E92@oracle.com>
References: <20220615155129.1025811-1-stefanha@redhat.com>
 <20220615155129.1025811-7-stefanha@redhat.com> <Ys0zQiFvsLozii7U@redhat.com>
 <5CF345CD-94BE-452C-A817-4A8AD3CD734A@oracle.com>
 <Ys2W1bm7LQVk7ifa@redhat.com>
In-Reply-To: <Ys2W1bm7LQVk7ifa@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0b69045-0ac2-4880-ca3c-08da6429e46c
x-ms-traffictypediagnostic: PH7PR10MB5723:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iP2sFTzKMy8kiR9DFBJFRNld7IhkuOm2flZoRcBAwNtnH4EROGIXklDAtmA3M2hqXIl0PXa7UVibSuGfPO/GwdKFAnUbxt1w9RNdPZcQw23v773YnGfrMRqrAsTioszLtO6/4yg2jOrvmWC/3+BCJJSpqEM0FGpyLelO5ayrgvtITtrd6a/S3Q9m1CSbmebA4oHwVb+f3vypgXJ/MawQSek1Z4r1MefDdJqLOC36TSzGyDzIGHZtAbb0o6zUz+hBUUSsiBvCYV4oX/4FzFBB8xOTO/o4BYlSF+NgY24JWrO2+tMQK3pLy6/SAWoAJ7unoe2Cnjl3CpVRClAI8DclVorQEOZtJPDTwUBIk2FJ5yaYIrRUTldqEG96PlqDhOrNR3bqEx3J+AS5YH8FatCtOF2UBTtdjUxM06nBDG0PvLeTg0b2Wo6UTFKwcQKbk00487DNGdrBqCbQdqnlJsi6enhrC/oNfXzH+az4+1ypu1sqKcY4P6nddK+n4NEG94c2GP56wrjVlauRUm9CpSEWaYe23zjVP7UyhUi3u0HPVAo0NyUHl6EEpL/5+ceX4BmrW5N2x57FBsYZaIwhWr9XXSvZ8/FVYab+Unnm2n4BiEeSrSSDQflAN5RiSOkau947tegsfqmCmcUrDQ1VCXS4YyxAvvPGmO7L+1BQtBiQ2drkCcafOjG4b3YkAO+M3YAZjLEhp62Va+ZRysvDQU1CRssEH7JLeG5zdQmtcKfl+JuiBpFr1m00C0WprB5tb3S4XGmsMDSu9NeVOM+UagvxdrWt1LipArTX/Wh4SKWhDZAkRt4xbkC9usmIrhzWIGp95aBqHOrP9Hq/XC40WNBFcwucWn1Szof5OFsWmGh1h2dTJM3fmtRN6uBg5kCIMKzenv+pC/pqxlT27/gbDwV6EfkNuM30ARPLPaRXu4tI6qE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(39860400002)(136003)(396003)(366004)(346002)(5660300002)(44832011)(8936002)(2906002)(6506007)(7416002)(6512007)(38070700005)(83380400001)(6916009)(76116006)(53546011)(38100700002)(36756003)(8676002)(41300700001)(122000001)(71200400001)(6486002)(91956017)(966005)(54906003)(186003)(33656002)(86362001)(66556008)(316002)(66476007)(66446008)(107886003)(478600001)(2616005)(4326008)(66946007)(64756008)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d21ibzZNRE03ZnY2ckZnTVY2NHJTTnFOYU5zMW5MVkVtWnhmU1FhYjlQTjRI?=
 =?utf-8?B?QVFUN3hLUjRSYVN3SjRsWEpiZDlKUXQycTE0U2xzS1lkRllPWXYveWpKTGdm?=
 =?utf-8?B?ZGViaTJ0RTFwd0d4bis1c2dtbEFNdklWM1ltQjllcW9YZ2lZMTF0WmxwUnFr?=
 =?utf-8?B?SkhkZndlOHpnYy9rMDNiVlFLVG9yTFBhcnBaMTF6UzJvZ2pLaGRCRGtTbWFO?=
 =?utf-8?B?ckxxTjV0K055K1d1djhMbFVpSFd6UUNwbUxTWVVTQVdldVBtQTNKWnVlcEx2?=
 =?utf-8?B?eHVkVHFVemRSOFJrSmxwd1dBMDI4QnNnSzAxYVk2a09UNURyeWJtdmNZTXRy?=
 =?utf-8?B?M3QyWmp5Vjh0dDdJWU5vVVc2VUN4VU8yME1kbWpIZTNLT0lwWXBUWEMxVE83?=
 =?utf-8?B?WHdvK2NJdmV3SEkvOFIxdkYzakZVbEIxR0x6ajZlUzhDVmpTejFkaEgzMGRY?=
 =?utf-8?B?emNvMU1sNDZubVV1ZVFMQzBwdEo4UGNvWW9ncmVORjBvMGxMeDVTNE9lNWhS?=
 =?utf-8?B?SFJSRFovTkZwQ2lzQ09Rc2NNMUtGemtkZHVmOFE5SC9hK3FkTnRWRDBkR1c4?=
 =?utf-8?B?N01hdVIyUTVXcDlZYVVmOWRjbDhRM1VqSjk1OWNuVm1BSkJNZ3ZqSnJNcnEv?=
 =?utf-8?B?SHNaUXUrbjVZUzZReS91UVpFR2d2RlMvMEJLK0NJeDd3aXgvcERRUzZkWFZ6?=
 =?utf-8?B?bnpDWkhVaHROSkl4NmFYT1pSQWR3amJVbDRRSUgza1JlSW51WW1rbTg3aGxK?=
 =?utf-8?B?TWdTTi9PQTN0LzNEMmZFOUJnOW93Qm9qYTZXL0EwV3U1YnlDY25yTUFwSDcz?=
 =?utf-8?B?OHBaeU5oanBkVW93bFNQRkptbkorVE0xOU9PRjVCMEp5VkxYOE9IanROQXN0?=
 =?utf-8?B?QmNSRzJCTDFhNnBJU3Nxd2dwd0Y1WW1aNnZOTWpVanlka0NRMlBJck52UXl5?=
 =?utf-8?B?SjhHUm5RRHgwcjlKSURiTlFjT3Z4bW1OdjNFUWxBZmFDai9IeFZyK3MwanVi?=
 =?utf-8?B?RXFmaHNOaFdFZC9iMG0wVjJQYlFDbUZBdkZCM3FUMEtVT2JtV1JlZmNybXVF?=
 =?utf-8?B?blNVVlZFVFpzVFVyelBkSDJmZ1ZQTkwvQzFqay9tYURHVmpCZmEyZGhPSmxo?=
 =?utf-8?B?cS9jc1FMdUNOV0xuVEhLR0JkK2VzbVNpYkkvMCtPeFdINXlWdnNmMlpaTWVj?=
 =?utf-8?B?S0loRjkzTGFCZjU4UjFnM1VtenB3NkErMjdsY3J2dzJwVFI0UVdtMVlqM0dr?=
 =?utf-8?B?U1hGYkZMMUlpRHk4OENJYStJRXB4c2xUZTd1SEV4c2lobHZiR2MrUDhsRWQz?=
 =?utf-8?B?d2NRK0M5OExiaUxhN1R0OFdsSVRLZkMwZTRRWTJPVmF4OFBjT1FKbWtuY1pv?=
 =?utf-8?B?ZU80RnRkeXpBNVBOYklQc2VIWGNucDUxai9US2hCQUlpNDkyaXh1d3hmSXNZ?=
 =?utf-8?B?S3RPZXRZZ1ZnU2VHL1dHK3FzSkQ0bXBIL25YdzBZdnpYNTJES2FQQnkxL3pt?=
 =?utf-8?B?L2UzUjduTDkrdXdPcldyQUdISVZxOTJEeCtYV2pBcnAvbEltaHRmY2o4c0VB?=
 =?utf-8?B?VVY0OC9UWWFuUDF0YVdrMVJTRlNmV1RmQllrelNxTkt5Y2svTEtzckJkaWdF?=
 =?utf-8?B?NWFnTzhoaUllLzdkSUZxbUkwa0VZVmRoZWhjNWNWV0pFTFFaYkRpbGFCNEJi?=
 =?utf-8?B?MVlmWmFVdVRRaUhoa3FocnNicXo1ei9Ebk1qYTBSOTFHQzVCd0VndXRHT1Uz?=
 =?utf-8?B?bkZNMSt5OEdGSGtsSWJqclVDcnkzWEYwWkE1b2RZK1V4VHlXV3hseVV4VFJ3?=
 =?utf-8?B?RnplN3NMZmhNOEhtYlUzMTY1T0cxSHVDeVp4d3YrVzhhSFFOTlZKWjlORTFC?=
 =?utf-8?B?VzhrTVZHZ29NMTZjeVp5TnRoOHJyV3Y1Z0lJeE9wbE1ybzVRejZlSnJ3UU9K?=
 =?utf-8?B?MVpUT3JBdjgvalhYbDZ3UmpDY0ZMdG91eUpxY1FUdVo0R3A2QzFWWEJXaWNE?=
 =?utf-8?B?OFpwNys4SU1SMkVMTTRicjFNR1FvbWxnMFFkeEM4cVRuSVRpVklkckI2MnUx?=
 =?utf-8?B?K1BCOXMwSGZlOWk1eEJEeTdrN29zN1FKOTRiS011VndZa0ZicDFwQkRvZnFZ?=
 =?utf-8?B?NXlrQXFFK21ReUlzU3B1YmVJVEljTlFEWFBlZlFaWmVaME5zaE1jSDQ2VnFy?=
 =?utf-8?Q?Hm6GeVXOTRkueKzbpCkDL+w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C91E2DC66F5817468A2C6D72CBABFF1C@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0b69045-0ac2-4880-ca3c-08da6429e46c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2022 17:13:51.4649 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vMqT6SuKQkwTKSqOBgDiquUzvWmOT90ikzKRG1FTkp64vph1H2k3/U90jtDm3apBD9C/vo4hSDcULLHf2xOOpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5723
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-12_12:2022-07-12,
 2022-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207120069
X-Proofpoint-GUID: 6bDvaYl6pyJsW6lvqUKQ8gSCo9uCmRia
X-Proofpoint-ORIG-GUID: 6bDvaYl6pyJsW6lvqUKQ8gSCo9uCmRia
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

DQoNCj4gT24gSnVsIDEyLCAyMDIyLCBhdCAxMTo0NCBBTSwgRGFuaWVsIFAuIEJlcnJhbmfDqSA8
YmVycmFuZ2VAcmVkaGF0LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBUdWUsIEp1bCAxMiwgMjAyMiBh
dCAwMzoyNzowOVBNICswMDAwLCBKYWcgUmFtYW4gd3JvdGU6DQo+PiANCj4+IA0KPj4gT24gSnVs
IDEyLCAyMDIyLCBhdCA0OjM5IEFNLCBEYW5pZWwgUC4gQmVycmFuZ8OpIDxiZXJyYW5nZUByZWRo
YXQuY29tPG1haWx0bzpiZXJyYW5nZUByZWRoYXQuY29tPj4gd3JvdGU6DQo+PiANCj4+IE9uIFdl
ZCwgSnVuIDE1LCAyMDIyIGF0IDA0OjUxOjE3UE0gKzAxMDAsIFN0ZWZhbiBIYWpub2N6aSB3cm90
ZToNCj4+IEZyb206IEphZ2FubmF0aGFuIFJhbWFuIDxqYWcucmFtYW5Ab3JhY2xlLmNvbTxtYWls
dG86amFnLnJhbWFuQG9yYWNsZS5jb20+Pg0KPj4gDQo+PiBhZGQgdGhlIGxpYnZmaW8tdXNlciBs
aWJyYXJ5IGFzIGEgc3VibW9kdWxlLiBidWlsZCBpdCBhcyBhIG1lc29uDQo+PiBzdWJwcm9qZWN0
Lg0KPj4gDQo+PiBsaWJ2ZmlvLXVzZXIgaXMgZGlzdHJpYnV0ZWQgd2l0aCBCU0QgMy1DbGF1c2Ug
bGljZW5zZSBhbmQNCj4+IGpzb24tYyB3aXRoIE1JVCAoRXhwYXQpIGxpY2Vuc2UNCj4+IA0KPj4g
U2lnbmVkLW9mZi1ieTogRWxlbmEgVWZpbXRzZXZhIDxlbGVuYS51ZmltdHNldmFAb3JhY2xlLmNv
bTxtYWlsdG86ZWxlbmEudWZpbXRzZXZhQG9yYWNsZS5jb20+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
Sm9obiBHIEpvaG5zb24gPGpvaG4uZy5qb2huc29uQG9yYWNsZS5jb208bWFpbHRvOmpvaG4uZy5q
b2huc29uQG9yYWNsZS5jb20+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSmFnYW5uYXRoYW4gUmFtYW4g
PGphZy5yYW1hbkBvcmFjbGUuY29tPG1haWx0bzpqYWcucmFtYW5Ab3JhY2xlLmNvbT4+DQo+PiBS
ZXZpZXdlZC1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPG1haWx0bzpz
dGVmYW5oYUByZWRoYXQuY29tPj4NCj4+IE1lc3NhZ2UtaWQ6IGMyYWRlYzg3OTU4YjA4MWQxZGM4
Nzc1ZDRhYTA1Yzg5NzkxMmYwMjUuMTY1NTE1MTY3OS5naXQuamFnLnJhbWFuQG9yYWNsZS5jb208
bWFpbHRvOmMyYWRlYzg3OTU4YjA4MWQxZGM4Nzc1ZDRhYTA1Yzg5NzkxMmYwMjUuMTY1NTE1MTY3
OS5naXQuamFnLnJhbWFuQG9yYWNsZS5jb20+DQo+PiANCj4+IFtDaGFuZ2VkIHN1Ym1vZHVsZSBV
UkwgdG8gUUVNVSdzIGxpYnZmaW8tdXNlciBtaXJyb3Igb24gR2l0TGFiLiBUaGUgUUVNVQ0KPj4g
cHJvamVjdCBtaXJyb3JzIGl0cyBkZXBlbmRlbmNpZXMgc28gdGhhdCBpdCBjYW4gcHJvdmlkZSBm
dWxsIHNvdXJjZSBjb2RlDQo+PiBldmVuIGluIHRoZSBldmVudCB0aGF0IGl0cyBkZXBlbmRlbmNp
ZXMgYmVjb21lIHVuYXZhaWxhYmxlLiBOb3RlIHRoYXQNCj4+IHRoZSBtaXJyb3IgcmVwbyBpcyBt
YW51YWxseSB1cGRhdGVkLCBzbyBwbGVhc2UgY29udGFjdCBtZSB0byBtYWtlIG5ld2VyDQo+PiBs
aWJ2ZmlvLXVzZXIgY29tbWl0cyBhdmFpbGFibGUuIElmIEkgYmVjb21lIGEgYm90dGxlbmVjayB3
ZSBjYW4gc2V0IHVwIGENCj4+IGNyb25qb2IuDQo+PiANCj4+IFVwZGF0ZWQgc2NyaXB0cy9tZXNv
bi1idWlsZG9wdGlvbnMuc2ggdG8gbWF0Y2ggdGhlIG1lc29uX29wdGlvbnMudHh0DQo+PiBjaGFu
Z2UuIEZhaWx1cmUgdG8gZG8gc28gY2FuIHJlc3VsdCBpbiBzY3JpcHRzL21lc29uLWJ1aWxkb3B0
aW9ucy5zaA0KPj4gYmVpbmcgbW9kaWZpZWQgYnkgdGhlIGJ1aWxkIHN5c3RlbSBsYXRlciBvbiBh
bmQgeW91IGVuZCB1cCB3aXRoIGEgZGlydHkNCj4+IHdvcmtpbmcgdHJlZS4NCj4+IC0tU3RlZmFu
XQ0KPj4gDQo+PiBzbmlwDQo+PiANCj4+IGRpZmYgLS1naXQgYS90ZXN0cy9kb2NrZXIvZG9ja2Vy
ZmlsZXMvY2VudG9zOC5kb2NrZXIgYi90ZXN0cy9kb2NrZXIvZG9ja2VyZmlsZXMvY2VudG9zOC5k
b2NrZXINCj4+IGluZGV4IDRiMjA5MjViYmYuLjEwNjE4YmZhODMgMTAwNjQ0DQo+PiAtLS0gYS90
ZXN0cy9kb2NrZXIvZG9ja2VyZmlsZXMvY2VudG9zOC5kb2NrZXINCj4+ICsrKyBiL3Rlc3RzL2Rv
Y2tlci9kb2NrZXJmaWxlcy9jZW50b3M4LmRvY2tlcg0KPj4gQEAgLTUxLDYgKzUxLDcgQEAgUlVO
IGRuZiB1cGRhdGUgLXkgJiYgXA0KPj4gbGliYnBmLWRldmVsIFwNCj4+IGxpYmNhY2FyZC1kZXZl
bCBcDQo+PiBsaWJjYXAtbmctZGV2ZWwgXA0KPj4gKyBsaWJjbW9ja2EtZGV2ZWwgXA0KPj4gbGli
Y3VybC1kZXZlbCBcDQo+PiBsaWJkcm0tZGV2ZWwgXA0KPj4gbGliZXBveHktZGV2ZWwgXA0KPj4g
QEAgLTU5LDYgKzYwLDcgQEAgUlVOIGRuZiB1cGRhdGUgLXkgJiYgXA0KPj4gbGliZ2NyeXB0LWRl
dmVsIFwNCj4+IGxpYmlzY3NpLWRldmVsIFwNCj4+IGxpYmpwZWctZGV2ZWwgXA0KPj4gKyBqc29u
LWMtZGV2ZWwgXA0KPj4gbGlibmZzLWRldmVsIFwNCj4+IGxpYnBtZW0tZGV2ZWwgXA0KPj4gbGli
cG5nLWRldmVsIFwNCj4+IA0KPj4gUGVyIHRoZSBiaWcgd2FybmluZyBtZXNzYWdlIGF0IHRoZSB0
b3Agb2YgdGhpcyBmaWxlLCB0aGlzIHBhY2thZ2UgbGlzdGluZw0KPj4gaXMgZW50aXJlbHkgYXV0
by1nZW5lcmF0ZWQgc28gc2hvdWxkIG5vdCBiZSBoYW5kIGVkaXR0ZWQgbGlrZSB0aGlzLiBJdHMN
Cj4+IGNvbnRlbnQgaXMgYWxsIGRyaXZlbiBieSBtYXBwaW5ncyBpbiB0aGUgdGVzdHMvbGNpdG9v
bC9saWJ2aXJ0LWNpIHN1Ym1vZHVsZSwNCj4+IHdoaWNoIGlzIHdoYXQgc2hvdWxkIGhhdmUgYmVl
biB1cGRhdGVkLiBJdCB3b3VsZCBoYXZlIHRoZW4gZW5zdXJlZCB0aGVzZQ0KPj4gbmV3IHBhY2th
Z2VzIHdlcmUgYWRkZWQgdG8gYWxsIHRoZSBkb2NrZXJmaWxlcywgYW5kIHRoYXQgdGhlIGNoYW5n
ZXMgYXJlDQo+PiBub3QgbG9zdGVkIHdoZW4gdGhlIGRvY2tlcmZpbGUgaXMgcmUtZ2VuZXJhdGVk
Lg0KPj4gDQo+PiBUaGFua3MgZm9yIHBvaW50aW5nIHRoaXMgb3V0LCBEYW5pZWwhDQo+PiANCj4+
IFdpbGwgdXBkYXRlIHRoZSBsaWJ2aXJ0LWNpIHByb2plY3Qgd2l0aCB0aGlzLCBhbmQgdXBkYXRl
IFFFTVUNCj4+IG9uY2UgdGhhdCBjaGFuZ2UgaXMgcHVsbGVkIGludG8gbGlidmlydC1jaS4NCj4g
DQo+IERvbid0IHdvcnJ5LCBJJ3ZlIGp1c3QgZ290IGEgbGlidmlydC1jaSB1cGRhdGUgbWVyZ2Vk
Og0KPiANCj4gIGh0dHBzOi8vZ2l0bGFiLmNvbS9saWJ2aXJ0L2xpYnZpcnQtY2kvLS9tZXJnZV9y
ZXF1ZXN0cy8yOTMNCj4gDQo+IGFzIEkgbmVlZCB0byBmaXggUUVNVSBDSSBmb3IgRnJlZUJTRCBh
bHJlYWR5Lg0KDQpUaGFuayB5b3UhDQrigJQNCkphZw0KDQo+IA0KPiBXaXRoIHJlZ2FyZHMsDQo+
IERhbmllbA0KPiAtLSANCj4gfDogaHR0cHM6Ly9iZXJyYW5nZS5jb20gICAgICAtby0gICAgaHR0
cHM6Ly93d3cuZmxpY2tyLmNvbS9waG90b3MvZGJlcnJhbmdlIDp8DQo+IHw6IGh0dHBzOi8vbGli
dmlydC5vcmcgICAgICAgICAtby0gICAgICAgICAgICBodHRwczovL2ZzdG9wMTM4LmJlcnJhbmdl
LmNvbSA6fA0KPiB8OiBodHRwczovL2VudGFuZ2xlLXBob3RvLm9yZyAgICAtby0gICAgaHR0cHM6
Ly93d3cuaW5zdGFncmFtLmNvbS9kYmVycmFuZ2UgOnwNCj4gDQoNCg==

