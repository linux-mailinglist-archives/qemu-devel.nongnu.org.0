Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3594C01D7
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 20:12:27 +0100 (CET)
Received: from localhost ([::1]:54150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMaaI-0002SD-UT
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 14:12:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nMaUM-0006eR-Kj
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:06:18 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:38142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nMaUJ-0002JW-6I
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:06:18 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21MHwuib018150; 
 Tue, 22 Feb 2022 19:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=LwpRoVJAOiUl5GllxVMBvIJsS9lvMOFLhTCCVRcQW7I=;
 b=1NrgoW/a+OPV1yqWAIpC4IPa/39KL4ImbWmrkurF/s6wDPqbVZBZYktaiIMVD9o8XA0q
 78IrnfRl4RIEyT0nIiw08BBrc1rb2wa1la5slKEfklTF9bZ9W1PjYD/B3xuAEwolVPrL
 I+GpcQIggKrmHRKHhWGhDW0KKaHICnuOKZt35Q0QGBtiCGuXcm17Q73/w1E7yp2db2cA
 5izm4f0CjbYWJURllvt8X2EErk+K8f+9o/BIqEYZ78F4NXeAx77w3fLhfdvv+XcoND47
 VbK11ubciYIDyTgZfvb+STlDCgmeaO3nMCp5USes1DRHz4pNYs8qSqGl+8mVEDW0t6yU mQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ecvar1t0k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Feb 2022 19:05:56 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21MJ1YNW034478;
 Tue, 22 Feb 2022 19:05:55 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
 by userp3030.oracle.com with ESMTP id 3eannuu5j9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Feb 2022 19:05:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AaQG8TeSnS9QAYHhcPaGT46NL9E+1JDTz3kdgHnCx/0mXCaJdWu2PvNWkhXHRxq1D1JDFDWnXQ5yZReIMG3QQheqU6oOL+kThi+JXWo0eieVQEzKhCdLWZs4G3ko9TN7Vh5dsPU0IOlO8N66FuQ96PYtl+CRz89S1/LpYdJL2FqiqpR1+EzFIZEHRab19/hsipKilGKHcjV89dJpS9ZD+JMAVJ6NPMrD6GIQpj8vhnBYYErTNWi5yHQTQc3DEORlqLWctj/FBXbhAkJ3cNLGX6ExAhgyhRABw16pXO2k2pYz+kBH6uCia8REgh4Mcpglzyt7fI7b5t4aLN08Zry2jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LwpRoVJAOiUl5GllxVMBvIJsS9lvMOFLhTCCVRcQW7I=;
 b=APMe8TP2KI2Qppe/tYpbThUKAPjIOFOd4O1oapLcvb/b1CwAUmWqDVTTuOE9JoWlzBzyMP+Utak0Jy1FKsM/6dqJ2Cyh5CNWpYNRh9otG4QRqoipStLYzuSbVmZwvPB6ldkPAI9j1d76a1rxcHT30ft+uM+DtCeRryczKozRaaLQU9Q2KWJNYwW0Gli0u8tXilLfLahQyU8OLiH0Z4gYbOTvpFtCf7Fh9Zg3zxgaxkWHTuh0t2Cyu+BHhqxFk8TjbscA42DKAH4n7UFsr4b40Fo0k5DNfgfbZbkdHabMJV5FF3RrxQxbLgWzvm8lElvTCm5uLKwtTDFL5212uJrDTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LwpRoVJAOiUl5GllxVMBvIJsS9lvMOFLhTCCVRcQW7I=;
 b=OILhXzM1aoYsxBXzzuugKWYG9Di+y/LixfLNRksaS5JCdjdrSjTWTZr7h1ncgGw6CwP1vYig8ggerv/ffsZOlpGWCGi1rRdqZt0eFRKXU+nhBzcJryOmaicVQWUvQVggNnhitQ02s2dIdNllmhF8w+WImIPdc28nOOWEgegmSB0=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MWHPR10MB1741.namprd10.prod.outlook.com (2603:10b6:301:9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Tue, 22 Feb
 2022 19:05:52 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::58f2:8ac5:3d12:5afe]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::58f2:8ac5:3d12:5afe%5]) with mapi id 15.20.4995.027; Tue, 22 Feb 2022
 19:05:52 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v6 01/19] configure, meson: override C compiler for cmake
Thread-Topic: [PATCH v6 01/19] configure, meson: override C compiler for cmake
Thread-Index: AQHYI8rkEa0YT9oQI0CMw6V1okPM+KyXptgAgAEENACAAI9eAIAAK1gAgAK56gCAA9cogA==
Date: Tue, 22 Feb 2022 19:05:52 +0000
Message-ID: <FB3E0606-9B09-44B2-BAE0-771BB8E3B3AA@oracle.com>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <4bef7bdd7309e128eca140a2324a126346c9f1f1.1645079934.git.jag.raman@oracle.com>
 <CAFEAcA9JW0OyAyCk0zbnMMQbo=Q6vr7P4EhEHjrc=i0spCSGLw@mail.gmail.com>
 <496E5796-7071-4C9E-B2AB-3C59CB3D50B5@oracle.com>
 <fa4739f2-d6ab-9d01-6a4a-ab511bf0f89c@redhat.com>
 <43467806-DBE0-4EAB-A7D0-46F46BE45958@oracle.com>
 <054f4b14-b523-35fc-acdc-024bbb2c13fd@redhat.com>
In-Reply-To: <054f4b14-b523-35fc-acdc-024bbb2c13fd@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 621d018b-a07c-4668-828c-08d9f6365892
x-ms-traffictypediagnostic: MWHPR10MB1741:EE_
x-microsoft-antispam-prvs: <MWHPR10MB1741347531B9A3761E2FAE19903B9@MWHPR10MB1741.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cy2TSdrJ/BS0Z1odW0jgM6bm6ocjtaefgjwVeTSx2DFgF/nAGVAUfvHw19XWIevdzk3BW1vsyZWd2e4VHIzqFveRbaOe/M++iy9lEoTWVUkAMS810kQc61Lz+4cCdbdbmcfHiq3HrOEmcI3y1Hm1h+w7dooLbPxLUKHGD5JgzlbEo4Zm3c6CZlKheXxcDjhALTZc4ws1f4fDL0yx3TBQPmnXY+Sg4z8VY6CqE7qycwkpF84Ebf9ydDY6ZOpLqBta8TGoG7x/g/KQjjb0LqCzr63NsDKzetrykEaKAPO8uGJgY+ZRKf/PXDiVNpMLjV4A3vWH67fwgZ6oGz2tRCdhs/lEarDwBBSGjyfW9Two9bsAAoWQFTlRCJYKbTYUfigGPgojrCq3OYpusF1xkd/QCTXgP6l+u+6aMRXHPBvqaHEGGeeGEzjoKw6zzEHaUVaXylVTCnzi8qxqmyTPrbys8sjwhg6f0OTxBMzJFp792RU8xICIKHcONBVENALeggS7UFjfpIyesJeOt82hRKbDGA1R+eWBl/+AcS0buhZqEkE9gUoO+h4Fd98UDh2iJhW7EpCDDAGviFdFfyXUIBnm4dAuR5YcArdS7Rub90OvblEvupolLoYAHMAtlg5s0WZ5SLghwAFqKzi5Q47cfClgHn80qXs9Te/HRQW2q6yR0xJHMQ0w3MZZz18P6etrM2RiSi8/yvqDdxdDPNDZ/ekEOhhUth06vMEcYOZp1SfcfLc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(91956017)(6506007)(122000001)(53546011)(508600001)(76116006)(33656002)(6486002)(186003)(7416002)(71200400001)(86362001)(5660300002)(2616005)(66946007)(66556008)(66476007)(66446008)(64756008)(8676002)(4326008)(38070700005)(38100700002)(2906002)(54906003)(6916009)(44832011)(6512007)(316002)(36756003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGl3aUpvSWUwTnBvUlhLQUt5MkFnNXFwZ1A4M21hZHZZN0RONXMvaDFUS3hM?=
 =?utf-8?B?c2paNXNNNkF3elBWWllPQ1poRWJOL3NWVHVib3hncWFvNkgvbEh6S093R2pC?=
 =?utf-8?B?S0VRM09yTWYzOXJJQjV6c1Vtc1JLUXc1L2hTVHR6WEVxSjF3UGVlS2FGbE9O?=
 =?utf-8?B?THBsbEhvOHcvT3BtalJLYXhhcnhML25GWndsUUg5WUk5RTg0bnJvQ1JkUjJL?=
 =?utf-8?B?RWNKcExKQ1JPY1hIWTltMUdUb2s1RjhWVG42bGNTd2sxQ2VrUFg0U3craDQ3?=
 =?utf-8?B?TnVXU3JOdEJNdGRUK3JmUStzY0dFVWg2QnZSZU9ORmVFYW9tQ2ZQQnJKTmFq?=
 =?utf-8?B?dmtaSkRTQW9ZdUtlRE1qSTlsZG52NHVwd2hsZGhCdkN2SjFsNmZIRlExdEhE?=
 =?utf-8?B?d1pHK0lmclEwa2dJN1ZPd2hCSU9mM0svbU5JRnVndkt1TVJ3d2psZ21tNnFZ?=
 =?utf-8?B?bjVnN1RBVUw3ZG5wZjliamNiZklPekxCUThSMW81U1FvV3VnS1VKbEZyS1FL?=
 =?utf-8?B?OWdiaFAxQUxUdGtDRWhxbHJ0OHlSazlBSWlqQUdtKzlYd2xRSExxUThRNFNl?=
 =?utf-8?B?R01oOUkzOFhDbUk5dzVXcE02Y09NZk81T2tlVENlMW45TklOQy9NOVRZbHpS?=
 =?utf-8?B?d0Juc2Z4Q1hZcEJNUFM4OUlUTGd0dUVna1prTWNLRkxlbUQ2OWhxeTNhd0xv?=
 =?utf-8?B?bkxSNlhwN01rVU9rT3ZRUjU0U3ZzUDZuQjZYRFdHbURwNE1KeWRFbm9QZlU5?=
 =?utf-8?B?R3M4cXl0eUUweEZVL0pzL0lmSTA4YURJdkZSbEVYSCt3TnB4RVpZL0hqR29G?=
 =?utf-8?B?Z3V3TFlOUTFzRG1BU21oRkhhZVgyTStseEsyVTQ1UlQvc0FvNHVYTEVkTzVr?=
 =?utf-8?B?R3NxOUVYK1AvNTlVNjdEZmU2ME9kenZ5T1hIZy93M2NEUXZoNzV4Z1RiRDlW?=
 =?utf-8?B?RGFPQmlZU0JBRFVDRzRwTzVlczQ0WDdnVEdKNlI5T3FUdTNwUzRacUMrRnBp?=
 =?utf-8?B?TWxDOGVZTjhmV2s0Ym1FSVhjUlRXamcvaFd4YzMyZzZEZ2FuMjRwOTdKWXlH?=
 =?utf-8?B?a1FDdElBWGN1YXZWSWYwZmtnazhVTFF4NjBmYWxOYUV4cGQwdFFwdzZtQ0dV?=
 =?utf-8?B?TnhxbHE1WFZweWdCak9TcjVKcnFMM21ISUJHY3doYWJJcUtOZHJXTHJTa1J5?=
 =?utf-8?B?Y3VCdWJKSEVvNW5BeXlnTGJIaU9UTEx3NXdWbUx2VWd4bGU2MyszRnEyb092?=
 =?utf-8?B?em1Ga0RzUmsyYWJBQTdoMmg1Tm9OcVR6U2NXNEwrMFNQT0VQZE52Q3Jxa2hE?=
 =?utf-8?B?N2FMcFlrQ1FSMzBlYis0NEg4MG5FRWZaSVFLWUVQWDMyNnBOSGs5enZhNmQx?=
 =?utf-8?B?UG94VE5PakVRRmwzMEF1SHJvZXpFWkg2Yy9kVTRHaC9nUnF3bzJpSjc0MzRy?=
 =?utf-8?B?b2IySlVSc052MVhRcGl2QTVYemFhTUVrTmRtK3ZlSkNWSUlHeCsvNjhxVVNq?=
 =?utf-8?B?eEFPbkovR2dqTVFpazJkV2NBZ3lpUk9DZ3d6QVBwQVpXTTgvREpVME1kTDZZ?=
 =?utf-8?B?R3NUajJSeGtHMVBoUm9EcTBOK20yWUJHUi9XWmE2eGEzbkxncDZ0eFE1c3Zy?=
 =?utf-8?B?UUVCL0NFVjhHYmZNMmc5dkVsTmx4VUxoVkJlNnJqWGgrUlVEQ0xpMC9QY1hx?=
 =?utf-8?B?ZFMzTWlpYjRGb2hrTmVNeXUxdG5NdUJtYWZpZFhnTFdsMy9oRUc3NENvVENz?=
 =?utf-8?B?RzdWbkxMeFRsbGtnaHcrSUllOGlWbWJiZTlrZDduU2d6TlZ4c29zZEttSlUw?=
 =?utf-8?B?a0hOdWhJdnFqTU9uZ0RFRm4ySE5iVnd4VVpLMFRBSktTNDF1L1V5VnpUZTZ1?=
 =?utf-8?B?WE4yL1UzOXFaTjB5SmtlRm5iOHNSaVVKbU5VS3JJVmlETmJiMlR3VUxOSXZq?=
 =?utf-8?B?NGcxUGtyVFFkOTNKeHNka0J2c1pZTGFQUjY1WUNObnpIY1haMy9sVlBoRDBR?=
 =?utf-8?B?dEVxaGpLVEJQOFJ2bVN0VUV4UWpjaTk3UWh4WlR4Y1ZJRUdqclZEbm9sQzhm?=
 =?utf-8?B?Tm42M0V5ODZOdUhTd1YvRHQyelFWVjY0VXJKQ1R5cDQ1WGhtZEw4cTJMSndk?=
 =?utf-8?B?VzkyZ3J5Y2xnMzFUMXpHSnRBdU90YTVFYUExclcvczJRZWZRU1g0YWhRSlNa?=
 =?utf-8?B?UnFVTWMvY0RUcTZYQkpvaGhsc1ZsT0d4Uk9URnlNYzc3OHdLU2JoQkcxa3Zm?=
 =?utf-8?B?bnU1aFBsckt1TUNHNTJrVVpRSnl3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5FA00A1E26C47D4BB65D796BFDC11A06@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 621d018b-a07c-4668-828c-08d9f6365892
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2022 19:05:52.3361 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c88xhtU32HFlMH+pIb9b8PSpTyjOLLWHiTcbE/4GYh4lw7NM8XAUM+UBk24Is7NZheR9p+OFgy80LklVjy6Frw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1741
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10266
 signatures=677939
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202220117
X-Proofpoint-GUID: Yjc3tzYIwKbeF7FHihfps1gmrsVa380x
X-Proofpoint-ORIG-GUID: Yjc3tzYIwKbeF7FHihfps1gmrsVa380x
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 John Johnson <john.g.johnson@oracle.com>,
 =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, John Levon <john.levon@nutanix.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>, Eric Blake <eblake@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gRmViIDIwLCAyMDIyLCBhdCAzOjI3IEFNLCBQYW9sbyBCb256aW5pIDxwYm9uemlu
aUByZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IE9uIDIvMTgvMjIgMTU6NDksIEphZyBSYW1hbiB3
cm90ZToNCj4+IENvbmNlcm5pbmcgdGhlIGdlbmVyYXRlZCBmaWxlcywgSSBzZWUgdGhlIGZvbGxv
d2luZyBpbiBDTWFrZU1lc29uVG9vbGNoYWluRmlsZS5jbWFrZToNCj4+IFdpdGhvdXQgcGF0Y2g6
IHNldChDTUFLRV9DX0NPTVBJTEVSICIvb3B0L3JoL2RldnRvb2xzZXQtOS9yb290L3Vzci9iaW4v
Y2MiICItbTY0IiAiLW1jeDE24oCdKQ0KPj4gV2l0aCBwYXRjaDogc2V0KENNQUtFX0NfQ09NUElM
RVIgImNjIiAiLW02NCIgIi1tY3gxNiIpDQo+IA0KPiBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IGl0
IHdvcmtzIGF0IGFsbCB3aXRoIHRoZSBsYXR0ZXIsIGJ1dCB0aGUgcmlnaHQgc29sdXRpb24NCj4g
Y291bGQgYmUNCj4gDQo+IHNldChDTUFLRV9DX0NPTVBJTEVSICIvb3B0L3JoL2RldnRvb2xzZXQt
OS9yb290L3Vzci9iaW4vY2MiKQ0KPiBzZXQoQ01BS0VfQ19DT01QSUxFUl9BUkcxICItbTY0IikN
Cj4gc2V0KENNQUtFX0NfQ09NUElMRVJfQVJHMiAiLW1jeDE2IikNCj4gDQo+IFBlcmhhcHMgeW91
IGNhbiB0cnkgdGhlIGZvbGxvd2luZyBwYXRjaCB0byBtZXNvbiAocGF0Y2ggaXQgaW4gcWVtdSdz
IGJ1aWxkDQo+IGRpcmVjdG9yeSBhbmQgbWFrZSBzdXJlIHRvIHVzZSAtLW1lc29uPWludGVybmFs
KToNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXNvbmJ1aWxkL2NtYWtlL3Rvb2xjaGFpbi5weSBiL21l
c29uYnVpbGQvY21ha2UvdG9vbGNoYWluLnB5DQo+IGluZGV4IDMxNmY1N2NiNS4uOTc1Njg2NGVl
IDEwMDY0NA0KPiAtLS0gYS9tZXNvbmJ1aWxkL2NtYWtlL3Rvb2xjaGFpbi5weQ0KPiArKysgYi9t
ZXNvbmJ1aWxkL2NtYWtlL3Rvb2xjaGFpbi5weQ0KPiBAQCAtMTkxLDExICsxOTEsMTQgQEAgY2xh
c3MgQ01ha2VUb29sY2hhaW46DQo+ICAgICAgICAgICAgICAgICBjb250aW51ZQ0KPiAgICAgICAg
ICAgICAgaWYgbGVuKGV4ZV9saXN0KSA+PSAyIGFuZCBub3Qgc2VsZi5pc19jbWRsaW5lX29wdGlv
bihjb21wX29iaiwgZXhlX2xpc3RbMV0pOg0KPiAtICAgICAgICAgICAgICAgIGRlZmF1bHRzW3By
ZWZpeCArICdDT01QSUxFUl9MQVVOQ0hFUiddID0gW21ha2VfYWJzKGV4ZV9saXN0WzBdKV0NCj4g
KyAgICAgICAgICAgICAgICBkZWZhdWx0c1tmJ3twcmVmaXh9Q09NUElMRVJfTEFVTkNIRVInXSA9
IFttYWtlX2FicyhleGVfbGlzdFswXSldDQo+ICAgICAgICAgICAgICAgICBleGVfbGlzdCA9IGV4
ZV9saXN0WzE6XQ0KPiAgICAgICAgICAgICAgZXhlX2xpc3RbMF0gPSBtYWtlX2FicyhleGVfbGlz
dFswXSkNCj4gLSAgICAgICAgICAgIGRlZmF1bHRzW3ByZWZpeCArICdDT01QSUxFUiddID0gZXhl
X2xpc3QNCj4gKyAgICAgICAgICAgIGRlZmF1bHRzW2Yne3ByZWZpeH1DT01QSUxFUiddID0gW2V4
ZV9saXN0WzBdXQ0KPiArICAgICAgICAgICAgZm9yIGkgaW4gcmFuZ2UoMSwgbGVuKGV4ZV9saXN0
KSk6DQo+ICsgICAgICAgICAgICAgICAgZGVmYXVsdHNbZid7cHJlZml4fUNPTVBJTEVSX0FSR3tp
fSddID0gW2V4ZV9saXN0W2ldXQ0KPiArDQo+ICAgICAgICAgICAgIGlmIGNvbXBfb2JqLmdldF9p
ZCgpID09ICdjbGFuZy1jbCc6DQo+ICAgICAgICAgICAgICAgICBkZWZhdWx0c1snQ01BS0VfTElO
S0VSJ10gPSBjb21wX29iai5nZXRfbGlua2VyX2V4ZWxpc3QoKQ0KDQpUaGlzIGZpeCB3b3JrcyBh
dCBteSBlbmQuDQoNClRoYW5rIHlvdSENCi0tDQpKYWcNCg0KPiANCj4gDQo+IFRoYW5rcywNCj4g
DQo+IFBhb2xvDQoNCg==

