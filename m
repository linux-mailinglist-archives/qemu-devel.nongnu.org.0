Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C97567A05C
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 18:46:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKNLk-0005Ad-5c; Tue, 24 Jan 2023 12:44:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <siddhi.katage@oracle.com>)
 id 1pKNLh-0005AC-L8
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 12:44:45 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <siddhi.katage@oracle.com>)
 id 1pKNLf-0002lN-Dw
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 12:44:45 -0500
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30OGNlKq027857; Tue, 24 Jan 2023 17:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=UWlfz7BEZe29kDFkphrcRd1RqrX7V6xeTz/LQujE3h0=;
 b=QEiJHzgIy6nWTA1QTfIIAeEz+uX3hBGmxnt4QzdwOpmQ3ws9KAV7uUefrn4dqsLfZAEt
 dAYnrioj9r/O3iXIvqmQYKt5QOYTL9iXe1NoF5nBRjJlGWUeAcAly2dRPt2PKTaC2LMA
 I6W/NEtP1AAMfCrs8NptYw71XEuI85JDII9FitqxyveGk7tb7q3wLTY15obCI/evAepU
 cpbeOOF9t9LfmxNHWUZjw3KhTnWj/kWyDSYrKB0s+jM6BXF8jJndzsbwEyi4B8PV5gRN
 zv4x99uY/kvO7a/Jzlfk/LA8YHK5yvjARdo8q7I0PXzTwKDXi8ESAVS8tmfbnXfjv98G MQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3n883c62b9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Jan 2023 17:44:37 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 30OH3LH5021075; Tue, 24 Jan 2023 17:44:37 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3n86gc2r6t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Jan 2023 17:44:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EPD6bzLVolLnWA39uPVNWB5r38TjDw6xmt0QtM5iUIYftasWEHmZqH57zi+y3Jc4ahRQVNhXkEzk3LyPzUrihdRQqUtfGBL3fJ+HOITj12YL6s8cFBAq5uzLewxCwaZFooyHB6t5G91RU5zvwmuk4WLWeZOamhiJ7iB6hBa3HbJuNRqgGF1OppckxKpzkWfiDAMZBQDOO/Ngm6GXsBALDpYiDNtfwk5MnkQogzFjLyd21Xh9qOCunS1UWoTsToG00HqlC6rwyocOTPsqjXV0TdKSDMJXMsIH9mCwoKDP7ZfAK18tbRWnKCc9OUpAOBKYqsWjkWPhnJO8Ge35yw/kYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UWlfz7BEZe29kDFkphrcRd1RqrX7V6xeTz/LQujE3h0=;
 b=Mt9nI0ddXy2P+BifJxhYuwuo4GbYOmog2IRR0kUENL2PIh1vQtNvbgFtDbLW7WO0l9cqDHMzCCc9Hx3w9Be+/auddzGmgN9XYO/9KEDSr1pAhifeVWarVourCyfXu4UWfuzl7SyAZJxS2RPBDxpjdbt2S11yZn0iEGDGYr2oYxK9/hdmnKeE7gpzzjMaWMNmeDGTwI9hIJdZQyR8WcdCm+l8qQKlGKI0Yj1XEP9N/vs74uh2MWPGnQStn6F/wy/cGkuxbzyhb2iXnCIgqSG5m3aX6GJGXAdyRbb0vca98wzv4iy+SuNLavtVj6IDwuxKOGKXhSopOvLnkiLt8lL4Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWlfz7BEZe29kDFkphrcRd1RqrX7V6xeTz/LQujE3h0=;
 b=lzVgdfDoE+sB/9L93lJFfOuOIDodD1fd8hvV8jxifSm9BCvSQJ2KdUfMrN7XaA9oczDNUhoD/ZUtP6Thc6pRmnzfLuat0UXcY44y0sN6cDqmQyarg4TAnCB9cv8BdjQhgzYhU5GungGAZeboVmmK9ECLrCGKMotsO+LYDoEQN6Q=
Received: from MN2PR10MB3200.namprd10.prod.outlook.com (2603:10b6:208:124::21)
 by DM4PR10MB7425.namprd10.prod.outlook.com (2603:10b6:8:180::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.12; Tue, 24 Jan
 2023 17:44:34 +0000
Received: from MN2PR10MB3200.namprd10.prod.outlook.com
 ([fe80::7cfc:3b6c:998d:b2a0]) by MN2PR10MB3200.namprd10.prod.outlook.com
 ([fe80::7cfc:3b6c:998d:b2a0%5]) with mapi id 15.20.6043.017; Tue, 24 Jan 2023
 17:44:34 +0000
From: Siddhi Katage <siddhi.katage@oracle.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Joe Jin <joe.jin@oracle.com>, Dongli Zhang <dongli.zhang@oracle.com>,
 "christian.ehrhardt@canonical.com" <christian.ehrhardt@canonical.com>,
 "berrange@redhat.com" <berrange@redhat.com>, "pbonzini@redhat.com"
 <pbonzini@redhat.com>
Subject: RE: [External] : Re: [PATCH 1/1] modules: load modules from
 /var/run/qemu/<version> directory firstly
Thread-Topic: [External] : Re: [PATCH 1/1] modules: load modules from
 /var/run/qemu/<version> directory firstly
Thread-Index: AQHZL1tBkvn8UbqIpE6bdxr0W8K2/a6tM9mAgACi5KA=
Date: Tue, 24 Jan 2023 17:44:34 +0000
Message-ID: <MN2PR10MB320053851EF8BFF512B0CB668BC99@MN2PR10MB3200.namprd10.prod.outlook.com>
References: <1674499693-9863-1-git-send-email-siddhi.katage@oracle.com>
 <27d059e1-cde6-5b5d-fc6d-9bf674ba3e02@linaro.org>
In-Reply-To: <27d059e1-cde6-5b5d-fc6d-9bf674ba3e02@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR10MB3200:EE_|DM4PR10MB7425:EE_
x-ms-office365-filtering-correlation-id: 3e80bbff-928f-410c-bd79-08dafe32a7e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zvJHxN5k1Z3XYC5JX9PIp6J5d9yeerxgsiyliwWEnWJrXTuWKYQZIpyqLhJ8udI1jWLL1ed0W9nlvsUPR/3wd831wJTSn3NUZld92AQXO11DfpK6kWgNATSAzNKegYqEa3mVW2Ua33NTPKayXsk0pWJ6DApPtIhFy2VHAcHx2okwGD4O+kIek2s/6XuUzuaMoRjiphGqA7uGAn6JaEb5f8da/t01IfLUMyGV7Vnx0GEJrlaWuajnDHI+QsxgOjjlfn7b2G3FoppovWmRkaDWe89g+h6W89fdZ4Aa0pHkLT4jyZ1YpNZ8e14HfuPjOIoOFEP7SyYgqEF9AvFAHH1CTsGpHFPjhhdEoqK2aU8vYbWmtysv7MAgpx+hZ/hUb9VfbJvj6OdnDoq3T1OWkiy0aNGWAGRiFppMVBFNwgBPOxkzMm1W85zTHbYTW4TcBP0xOfF/qC4eTMoq6aXGFF8tB81leB8SOzRNowlyfcEMFBdZ4M29Alv8ZHf0QUB5Oy9kQWmhXXZq2TooKA8sffT+D9apoj73QRkeMHhf/SMyWjtEtDQbIjq90Qn6R1/A1/RTC5wepdvopy1LS4X1lm2WfJHDhGh225MKXDVh5Lsb3OVCYiznevytargTH6pxtVIZXU20wtzyQbORTorrsqn2oZ5/gAzn90odvpEB8Q3Uz4VBhPbLCa4uQadSQfRW51VTZc2EKNplMpfpV3kzjOb02Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB3200.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(136003)(346002)(376002)(366004)(396003)(451199015)(38100700002)(122000001)(33656002)(66476007)(55016003)(52536014)(38070700005)(44832011)(8936002)(8676002)(2906002)(66556008)(66946007)(4326008)(76116006)(64756008)(66446008)(5660300002)(86362001)(6506007)(41300700001)(9686003)(53546011)(26005)(186003)(83380400001)(7696005)(54906003)(110136005)(316002)(478600001)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MTc5R1g5cEthMUdhWEpvclQ0OTBsUHhId3FKTkhaWlR1TEpIWXFGTHYzSDhw?=
 =?utf-8?B?VG9xSk1ZMnZSWXkyYXpzWjRZL3BCdjBrZFhjODg1WEpzdGxmVDU2c1hLSVpi?=
 =?utf-8?B?Y255N0RKQVlVc05BM0kreU53QitxUmpmTjc1YVNFQ1JHU244NlZoNDhweVRG?=
 =?utf-8?B?Um9YTmxDOWllMWlrTFh2em5BYm9zSDZEWkR2MzFnM0JtWjV2ZFVhK2cvSmxW?=
 =?utf-8?B?TlBMNktqTUZoSWM2U2tPeU9HazJOaDJ0NUxzNElSbkNMeGtBK0tMeG05N2Q0?=
 =?utf-8?B?N2VmNG8vUEZhMnFlaTJOM25TcnBONFN1bGF4c0R6RytOUGdPRndMMHVCWmNH?=
 =?utf-8?B?T255dE03YnNKdXo5RnF0dlc2VitzQi91N2ZCRzZZN3ROZzBtU2pSODZ3NGFQ?=
 =?utf-8?B?YnBTV3ZKaitXZjZVbTVoZlUxTnFMVUk5VmhmY0F1Z3NRNEduMVJreGV1bHRX?=
 =?utf-8?B?dzVzbENCNzVXdThFbnlDRUd1TDFvdmNtdVJaMXV1L2QwUVcrdXBZTklBSHNO?=
 =?utf-8?B?TGw2TmhvcmkxMWMyOUdURGRCbHNPZGtGVTExQUtBNDBqUDVJc3FFZFl0aDlV?=
 =?utf-8?B?a3hQUCtKeiszQ2dFVzM2L2pjVEZMK0JpU0NteTFMR3JlQXljYmdoenBlYlRS?=
 =?utf-8?B?Q1lFRXF6eUxMTDBXdVJaTUZZR1FvdnQvL0c4emExVGNDQ0xjbGhzeDZIem9G?=
 =?utf-8?B?V2E4Z0RRU2hkZGlnSHF4N3h3cVRrRUN0ZGJqTHkrd2RmWHlnYmtzWVR5RUFm?=
 =?utf-8?B?bmZqeUVNdGJ0cnZkT3JBdE1sM3FTMmFHT2VYS1BaNCtJTE95bFV6eFFXSG8v?=
 =?utf-8?B?MG9DNHZQR21hczZsMGlFUW5lbEg0dmdqZWlPZ3RqTWJwVzdoWGhZZkVHM3RO?=
 =?utf-8?B?d3lQc0Q1a1dEOHNYV01SM1JXZFd1azVmaC9xZ1BtcVdNRUROcjdrdkxQa3hs?=
 =?utf-8?B?czZ1RkFMZXZMdFVJT01TZW1RU0VHRkhkdkJ3N25jTEZUYVpFcFN2RHorZ04z?=
 =?utf-8?B?TzUrc0pZVTFLVFhuVHdRWUF1MERrSk5mWi80VnRZWHkvMjVOVFJETEE5Wi82?=
 =?utf-8?B?SFY0UVowMzh4S2tURXJIU2h4TXUyVDZxTzJRSGI2THI2TlNHcTZrY0ZDZGp2?=
 =?utf-8?B?a3crQlcrUC9JTDExMmU0UUR4cmE0VlJoODNwVkVkMWZmSVFDVXpzQ3pnTWp6?=
 =?utf-8?B?SWVKQXozV1RBbmNBOEN3TFU0S0J5QkxWME5jbEw3cE5PVmpqMlNCUWFGbFMw?=
 =?utf-8?B?Y3F2ck5KbkdaaHpnSGpMZWR6S0o5UDhLWXhIQjREYmNxU0VSUS9OcEcrZjRs?=
 =?utf-8?B?anBnUUhJbWFvaXRHMXJVaDU1UENvSG5UMmIrdmhUcWJXUFlsc1BaR1BQU3Bk?=
 =?utf-8?B?ZEZyRitmY3BhT3VoQXJmcy84bVhwRUFHeW9YR0lBeWpZa091OXdHejhEYlNY?=
 =?utf-8?B?ejJHL3hGdWpuWGhVVHI3amlwdmt1YS9NMG9QaXdQWnJZVE9vL3A3OFJ6aWYv?=
 =?utf-8?B?dFRyTzhwVWlQR0VpalB1alVIcmZEZCtlaENwSXcveU5Xbm9sZ1J1clRzM29E?=
 =?utf-8?B?akV6Y1BIWTNYTnoxVWNpeklrWHNhWDFoZU9BbVhKRXcyMWxHQTN0ZjQ3K2F3?=
 =?utf-8?B?TVJPemxVbFJVcFl5c25tc1RjZnE5OU0zakFDOFFqbGpOTzRwTXdtc2x0Sms5?=
 =?utf-8?B?U1pRbCtramg3eVdaV0ZhVTFWSHlxdnI0ZGl0d2xZaW00OGZLcEpqV0MvL0xp?=
 =?utf-8?B?dGV6a2o0OVJGOHFwd0l4MkY3a3dPUVhHMEFnMWljNjRVWVk5cXVobmNPVXV5?=
 =?utf-8?B?eHJnNS9zeE8vWmoycHBxd3pibnlmZ1NkYVpJQktlSzlZVzFPTGFFRDBqMkQy?=
 =?utf-8?B?YzhFUTJXajc4MWVGbGF2OUFhdnQyUkh5Nm5rSjJFZFB4OGFUTGxPU3hPM3RP?=
 =?utf-8?B?RDY3M1htM29wZnpPdFAvY1JyUU5WNUVsajlUZEQzVGJ2alM1MHNKdVBkZzJl?=
 =?utf-8?B?ZGdzbURHWlQrazJrblh4WnBiZXVkZ3NLaDNoWXQvUzJNQ1dzYkVNTVZUcGVK?=
 =?utf-8?B?UkJQTllDMHEwTzVoTWR1MzlLY3BIQU9HTHlnajZOdHJFYjRlTTRkQWF2OFU5?=
 =?utf-8?Q?iW34yFXeYetnIFoJtd96XOO+X?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: YYiMGUvzcYAHOC7rx3cVmEOfC6WWhN0wKdNQ1TCPT28uHMIKyCh923szEYyKShdi41ogHY3Yc1jqDw+ImHoAxzTJ4VgV+iKwWbIBD0qwgunnVNc1A4eqMiXiA/fhrw7hKwgUvl2RwZILAAfTyHYHMnQjRS7KyfUnwvt5Ui593SGy0V0WsaDmhxahJMw/tyixqfMa8jibsCkJUAX3zXmNQwpcqc23XCKBvUuQnheMs368Q4270rNqkuZclMc74mCLR024C/H0ubxcYpUx0HXptM/NE2QcaAQW+dyP43+7pHtJTXP1/8jTtepa+n4VLzMa8tGr/vrC4qdBsnh/d/hRzVlqPhqwTyhPW3QxMkvpsAMyusRm88oa/ymvFRKoj6Z87YPlIVkECj1fm8vjGVsEFpXwQRgeHSXkEF/Qpc1oPRPnPoPLWuqgX0XWr3XAzsfviOvhGzprbmWwnpiATCkxcMiK7dse1Qhdt0PgtEXzQYKFcaL7EvwLG+0w8fm2Mn2dtnmtP7XP5QTbmnIk/Feb4iAobx3vEZGtLiuAR3CvB5WPVpY3/7GeVdQA7IWo0vaBS+Ov4FrpY5RHoRtcsvRii1NDV5x02VDPeh5LXDVKeTtRpdDk/nqbX6XSBRAVdj9R4vxtgajm75l5J8Sa2eMduoAumqaF7TqxZYqh3CL1ZAsS1a8oe7Elo3WKeh1rEIzdRUBDDU4Ybu3srCkm5NNa89xhVcB6JiX09t0pL76vkZgizjJ0SpSaW0Ob9UQvPTS86T9k+C4Nb3nUk+WIAGMqu/m7F7YQ+3DMOGBsqfZxkGEnGdE74RdluXXeDZVepJgjbvZ2L3RqfxTMpEWWXurDTg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB3200.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e80bbff-928f-410c-bd79-08dafe32a7e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2023 17:44:34.4392 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3Br/ZsPmRIwFQJbSrp7M31RWsuKNJV8H3Wj2/f3fx50kfYudYPPDHp6FicHoKU25SVPvXQEfly/Dr/3R2ku6BRcHMcH3245W8tACVhVki0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7425
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-24_13,2023-01-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxscore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301240161
X-Proofpoint-ORIG-GUID: uJfhsZMHcusAkIoIo_fLWVx-VTxbczwS
X-Proofpoint-GUID: uJfhsZMHcusAkIoIo_fLWVx-VTxbczwS
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=siddhi.katage@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

SGkgLCANClBsZWFzZSBpZ25vcmUgdGhpcyBwYXRjaCBhcyBpdCBpcyBub3QgYmFzZWQgb24gdG9w
IG9mIGN1cnJlbnQgbWFzdGVyIGJyYW5jaC4NCkkgYXBvbG9naXplIGZvciBtaXN0YWtlIGFuZCB0
aGUgaW5jb252ZW5pZW5jZSBjYXVzZWQuDQoNCkkgd2lsbCByZXNlbmQgdGhlIGNvcnJlY3QgcGF0
Y2ggLg0KDQpUaGFuayB5b3UsDQpTaWRkaGkgS2F0YWdlDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQpGcm9tOiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+
IA0KU2VudDogVHVlc2RheSwgSmFudWFyeSAyNCwgMjAyMyAxOjI2IFBNDQpUbzogU2lkZGhpIEth
dGFnZSA8c2lkZGhpLmthdGFnZUBvcmFjbGUuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQpD
YzogSm9lIEppbiA8am9lLmppbkBvcmFjbGUuY29tPjsgRG9uZ2xpIFpoYW5nIDxkb25nbGkuemhh
bmdAb3JhY2xlLmNvbT47IGNocmlzdGlhbi5laHJoYXJkdEBjYW5vbmljYWwuY29tOyBiZXJyYW5n
ZUByZWRoYXQuY29tOyBwYm9uemluaUByZWRoYXQuY29tDQpTdWJqZWN0OiBbRXh0ZXJuYWxdIDog
UmU6IFtQQVRDSCAxLzFdIG1vZHVsZXM6IGxvYWQgbW9kdWxlcyBmcm9tIC92YXIvcnVuL3FlbXUv
PHZlcnNpb24+IGRpcmVjdG9yeSBmaXJzdGx5DQoNCk9uIDIzLzEvMjMgMTk6NDgsIFNpZGRoaSBL
YXRhZ2Ugd3JvdGU6DQo+IEZyb206IFNpZGRoaSBLYXRhZ2UgPHNpZGRoaS5rYXRhZ2VAb3JhY2xl
LmNvbT4NCj4gDQo+IEFuIG9sZCBydW5uaW5nIFFFTVUgd2lsbCB0cnkgdG8gbG9hZCBtb2R1bGVz
IHdpdGggbmV3IGJ1aWxkLWlkIA0KPiBmaXJzdCx0aGlzIHdpbGwgZmFpbCBhcyBleHBlY3RlZCAs
dGhlbiBRRU1VIHdpbGwgZmFsbGJhY2sgdG8gbG9hZCB0aGUgDQo+IG9sZCBtb2R1bGVzIHRoYXQg
bWF0Y2hlcyBpdHMgYnVpbGQtaWQgZnJvbSAvdmFyL3J1bi9xZW11Lzx2ZXJzaW9uPiBkaXJlY3Rv
cnkgLg0KPiBNYWtlIC92YXIvcnVuL3FlbXUvPHZlcnNpb24+IGRpcmVjdG9yeSBhcyBmaXJzdCBz
ZWFyY2ggcGF0aCB0byBsb2FkIG1vZHVsZXMuDQo+IA0KPiBGaXhlczogYmQ4M2M4NjFjMCAoIm1v
ZHVsZXM6IGxvYWQgbW9kdWxlcyBmcm9tIHZlcnNpb25lZCAvdmFyL3J1biANCj4gZGlyIikNCj4g
U2lnbmVkLW9mZi1ieTogU2lkZGhpIEthdGFnZSA8c2lkZGhpLmthdGFnZUBvcmFjbGUuY29tPg0K
PiAtLS0NCj4gICB1dGlsL21vZHVsZS5jIHwgMTIgKysrKysrLS0tLS0tDQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCg0KUmV2aWV3ZWQtYnk6IFBo
aWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4NCg0K

