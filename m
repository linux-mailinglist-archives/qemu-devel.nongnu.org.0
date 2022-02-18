Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E24CD4BBBFE
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 16:19:44 +0100 (CET)
Received: from localhost ([::1]:44542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL52t-0002xT-Q2
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 10:19:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nL50S-0001XF-CN
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 10:17:12 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:63552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nL50N-000361-Vc
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 10:17:10 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21IF6Hgp025680; 
 Fri, 18 Feb 2022 15:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=mVuhx9UAsXl/EQMr+5CjmM1pfb4X+eQiANWe1Uq7tfw=;
 b=aBOmrFZw3eL9A9NcMY27p3BG4xowl4vYrcOf6L14t5Vzykf7kNAOQvIgYQVIk7VZruVv
 twZF1wn2CmMr4IQ2xt55TowodYNhDV79MLaZVvYiuGvYcmoZBdSywgV+7DeRah9/CYMr
 EHwt7tRfRHOErT9VW2I7a82p0fEIlGlBtXinRNO/ZM9aGB1Tnqie/dWKnMn4NYmWXpoK
 dFLQjFj4akfqEBnAHY26zE7q7lSF0o37DSgEdQrtCKwHMASmlHVuIWiptyiSfjgrKCpo
 52DLcBFSNn6zrArOgcF1+87bLHw3iTvdMXAjLoMxpcrLD6yfcLmRjen/4sGF5TasADu0 Qg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e8n3fh3d6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 15:16:59 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21IFBMtA151851;
 Fri, 18 Feb 2022 15:16:57 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
 by userp3030.oracle.com with ESMTP id 3e8nm16fex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 15:16:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGVtBquadpmLXYZVL+j6sbkrQ3+ucE32ZctK4OEFeq00nFWS9ivE96QwI6iX7erR5pn7dUFDQWPf6pb7jj0R0033qgj97LofmxEWornIG796zM4tUqHMYe6TqVfGdmKI8RgGCIVkvDUB6hMX/5/qFPEiy1WBbIGgFGEEc51PFPyXC2ETRePv9yJHgXgEe9fxIo5Z9Y1sbPM2/9LFD7+HTIrS81UD/1n+kLHGMJiXUZyKPtYiLfWJzYNIL+6IYkIadCRNVRHLoweiWu0m6Sp2jalqfF9s9flkY2jsCzRhf5j7aemXr5kg6CJa1hLJRoiMGOQYR9Kg8W+i2UuHf+sO0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mVuhx9UAsXl/EQMr+5CjmM1pfb4X+eQiANWe1Uq7tfw=;
 b=K8KA4z6wPukbV6TRfvf2SmvjLcuXgoOXG8JHMPUJd5zcDjGHnvTRasw/kxX14ofKEFF9w637y0lTR/BZh0umqnlTFiDQ0T8DkpHJMXgNqPKPz7aPM2ryAa9QDJ4HbfHxHAZcKePVfbsNmcwG4ejsCfANjjj3YiOBKo/SAy4qMsMibUeVw/t6MafGqNEREMCz7VpF9qGcy2yu596xdLdSJ6JPtTpkl+PEDRfJ6shD/AGDmo79eDj8snTibDEmH1jdGaV3F/jsMAn55f4AV2HKF2aMAj434ZbaalRniqEPStdDQ3O3hRKI0tfOLFxGE+asjL3mVZlA4TfjKL5KYTK+ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mVuhx9UAsXl/EQMr+5CjmM1pfb4X+eQiANWe1Uq7tfw=;
 b=N1IF8ws4lfN6a/07UFnHAC2+4FGMlkY87UWLOFh1EFYHhHLElG9sI9ZVygeP5zYr4zMtDqhis82rVOUbzwnGTEFQZI5ER/aSx1gl8RuZx/oQlExeUtNfvrar3P8B9uPO+3h/TzQFr2t7OrjK1Y9yhrm6Xi4RbWHQOisOuBUYlzY=
Received: from CH2PR10MB4008.namprd10.prod.outlook.com (2603:10b6:610:c::22)
 by DM6PR10MB2585.namprd10.prod.outlook.com (2603:10b6:5:ad::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Fri, 18 Feb
 2022 15:16:55 +0000
Received: from CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe]) by CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe%6]) with mapi id 15.20.4995.016; Fri, 18 Feb 2022
 15:16:55 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v6 01/19] configure, meson: override C compiler for cmake
Thread-Topic: [PATCH v6 01/19] configure, meson: override C compiler for cmake
Thread-Index: AQHYI8rkEa0YT9oQI0CMw6V1okPM+KyXptgAgAEENACAAI9eAIAAK1gAgAAHxwA=
Date: Fri, 18 Feb 2022 15:16:55 +0000
Message-ID: <09FBC0BA-DBFE-4E73-BFB7-94A796B206A7@oracle.com>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <4bef7bdd7309e128eca140a2324a126346c9f1f1.1645079934.git.jag.raman@oracle.com>
 <CAFEAcA9JW0OyAyCk0zbnMMQbo=Q6vr7P4EhEHjrc=i0spCSGLw@mail.gmail.com>
 <496E5796-7071-4C9E-B2AB-3C59CB3D50B5@oracle.com>
 <fa4739f2-d6ab-9d01-6a4a-ab511bf0f89c@redhat.com>
 <43467806-DBE0-4EAB-A7D0-46F46BE45958@oracle.com>
In-Reply-To: <43467806-DBE0-4EAB-A7D0-46F46BE45958@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d83d6050-ef77-4d77-e635-08d9f2f1b302
x-ms-traffictypediagnostic: DM6PR10MB2585:EE_
x-microsoft-antispam-prvs: <DM6PR10MB2585DA6E36361314C4B0189590379@DM6PR10MB2585.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j2S6arcMyqY6XnwjlKSWkatcr2s4L/Iy/+2XmNQRt7OxuMCfcJleF5vW3FRnaNg+6ONgf39mqhKyiLq4cDehb4VeSxa9vSmr2t1xzGPI9iGnohLZIulYiNnHnTdpU9/r3nrqPOGzCuq08IWrLO3CiPsWJJFDaIHWk2wsgsJzJXWh0k7JwPsWAXv6h6ztDJ5d+fvBc8rtX0Rp0DHVc0QBLb6ztIJRZeIxkw0u1Z0uTBNXy4IfZcXgaPqrasZHXiQnmZKj9B1YIVzY2trJE5Ml22NQrDRwu2VZxtoZcSa6uN3LVL13IBh/RNVP5wf6ZlqFFy3BfvOjSqm5I8JoaqQ1J5NxpPKPNxfq5CGB08b+td7KkVlJb9saJEBLJnHn/wh/95XlVR3BkhiAxlAT3KyeJZ0drT6Tg1XbHinRV6Yk178nA9OJhZ4iTPRHrWwM6qCB+xc0pUaz3yvLJPDqrAZqZrvsFWjAU4WYGD8wdkKDNCSk5kI/Wy8V0ZN8Bjk5CEwVjD9dPzFfp2IJQQDFDwW7hZQLtQP5s9H1t6t+iyfT9KcrR89TUo5tUDThJuuF/VwRfq83ahWwNpCPur4N8kF/i4xvg/11PjVVbfAV5rKblo+qFhFvqMG0wSiX4j/ccpPgu8Jx9NoME9gvMZAIaf09UzMhFWUlO8bujUTo2JdaQZihomzxCa3ztDSHnbtWE2JWVnK7c/dNE9E+yKq1t54oBc5mzUqTCLexCxh0j1kBFzEtzUPynTzgvIp1iC3ERnSsq5b1aLll0gKeb9DNnX0aYyJTkhtFEZF40kW8GR85mmBkEQOjKVyYcHlFq1xnPisaXGHchk2L7IzprabTf7jSYS0H9IqKwDqtIwZ1iU6Rq/A=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR10MB4008.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66946007)(122000001)(64756008)(2906002)(316002)(66556008)(2616005)(6916009)(66446008)(91956017)(8676002)(38100700002)(4326008)(44832011)(38070700005)(7416002)(8936002)(5660300002)(66476007)(6486002)(76116006)(966005)(508600001)(86362001)(54906003)(36756003)(33656002)(53546011)(6506007)(6512007)(186003)(71200400001)(83380400001)(10126625002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RUhFVkpJK3VTTG94ODZ5cVJ0T3hWYnZvVGdMeFEvOWxhV0ZQQkRJK1RTZ05h?=
 =?utf-8?B?b3I1RjY2NnhNYUMwSzhMVkpSK0NkL29vbmRpT2lTQXFuUFF0NEU4TTREMTlr?=
 =?utf-8?B?cENidWNyWlVQNmhySDlGa21zSVVqRmRvSHI5QWZZWHZGdzJxSkJCWTVvcUEv?=
 =?utf-8?B?U3oyM3pIbm1hM1ZPUTljV2xBV2FKRk9ybURPVWxGV01TUXRMeWNIZkNjUDQw?=
 =?utf-8?B?YWI0QjdoT1llaDR3L3BJei9lakVLN05aSzBNWi9LbDhxZmRYTHBkT3NOQ2E5?=
 =?utf-8?B?TGlCY2xhMHRHV1lXbEhML1NRRmhZeEc3S3QyakF4YitONG5VbUVKT1VHbGQw?=
 =?utf-8?B?VVdHWlFjTklNUzBWOUFOQmprcHkxUFVVamcwUHE2N0xjMDNQczM0d2J4YVZh?=
 =?utf-8?B?SG9qcGdXL2tEaW5vRWUySnZJUlJBUjFjS1BaK0Y2RVB5eVB3aDFMeEo4N0NI?=
 =?utf-8?B?eHBIeXdOZXB0UFBNT3Iwa2FIbkdvemVVc2VMNGRsVS9GYnZIS2N6YUNNOGpn?=
 =?utf-8?B?dDBocFk3UldhTmttUEZoMWg3V0I2RUJTZmM3bENaZEZRTWNjUWVPUEhDREVi?=
 =?utf-8?B?ZTJmQllDREhUSkhmWGt6b0FuS29lRzMxTW55dk42SnpsL3A1c3Z1WjJYK1Z5?=
 =?utf-8?B?RlNCMEVmYkMwbWt6cmpneEE1a3VQLy9sMjVCRlFsdXN3MXRwRURkaVBKWGov?=
 =?utf-8?B?bWF3aG9kdGoyWUVFZ0V2akcrY0dmYTBRNzNsZGt5c1lzR3FpZ2o5ZnpMbHBU?=
 =?utf-8?B?RlI5UWtWSHJTRFFVWkFUWHMzdjFCU24rclNRNDhkejVTL1ZoTlE4OFplSDdO?=
 =?utf-8?B?VmFobkRLNUZlNkFEbUFmN25na004NEgza2hTVU5qWEpZSUFUNDJqM1VWcmZ0?=
 =?utf-8?B?Q3E2anRYQ05FNUNxY3hXS0IyQzArZHIrM3JNYlBCQ1p2N0Y0THp1cE1RU0Nl?=
 =?utf-8?B?OVZyR0pXU3l4YVBpb2RET1Q5RmhsclhhZU1CamdwUEMzM2ZMdDVrekF1Qm1w?=
 =?utf-8?B?UHY3VkNnRXRCOFkyZlpJb0pQTFdXRU9Ma3dVRFB5STl2RTBlMTAyaEo2ajRv?=
 =?utf-8?B?bHRjRlBiNWxrYU9ZaUk0b2JKL2piYlNSWHNtZEEwK3JiZHRWcnJPRkJHd3Vx?=
 =?utf-8?B?MTlucEJic25TRC9ZUEdJUHJQN05pZ25KY1NpZEdic0tXbDg1QXNOTVJHL3hB?=
 =?utf-8?B?ZDA4M3VzTUdqWkNhRXFiMmR4c2xDVU5RNUI1Nkh4a2hEK0FaSytvU2c5bzlr?=
 =?utf-8?B?U3MxSXF2Z1ZxOXB3cGZ2VmI3WEpKRW1WUnJxSW5oN0t6YUkrWlVRUlRzTjBM?=
 =?utf-8?B?MGh2d05tZlB1TUdqdXV3VjFqT29vbmtBcmVrRkVEUzBwcXJxeWEzd0hBTW9a?=
 =?utf-8?B?YkNIOVZrcll5d0RMcWRCRlpJSUNreTZCWWppS1gzd01za3pHaGJScE0vNG1y?=
 =?utf-8?B?TS9yMDh5OTFkVWMxdDR2Y2RtQXRnQVYvd1dOOGE1UExPckJrNUFzNWpqcXJj?=
 =?utf-8?B?bXlLY1c2R0ZzK1IwYmlCU3ZadzhPYlJMdThSY1h6WTlHSWhqdlhGMDlmVlFx?=
 =?utf-8?B?Y3BweDQ1dnA1eUJkcGxaOU9PQVVTY2k4ZXpuL1FxWmJ5SHRFOG1ZMjVHK01H?=
 =?utf-8?B?eTB1WUpGUlNNeGlDNUl4SmZXa1ZBWHVxT2NRRS83QW1uSXZrZ2V1cG5FZzVv?=
 =?utf-8?B?WHVQeDJ5VSt5UU1CUFEwRmFFUEd5L0ROSDlBdHVWSzVzdWRleXFkejFIYmJ5?=
 =?utf-8?B?dTBYN1BjdU5ZcWtaeW5ESkY2YTM0dUtPRkpjcFlraDJwLzVpSWZaeTFrdFo2?=
 =?utf-8?B?alJJZWVZL2cybUl4elo3a0Y5MXlsVnhLcXhrQWwzdTMxbk05SlpiOFFlL25X?=
 =?utf-8?B?cmlZZ1hQWlhDN3RaekFkSHNPRE45U2grY01scWhKMDgyV2hLRmNZZklRL1ha?=
 =?utf-8?B?cTFXc29iemFaS0xzUE5OalJ2SGVhMmhpd1hEZkUzRkVoelZlVUlINjFoS3hF?=
 =?utf-8?B?MVhNejUyY2R4KzZ5U1hYKzNjczRNTE1IeTlkaUMrWUhhMUVKbXV3djZVb2hy?=
 =?utf-8?B?aW1mbnZhWDBuQzFOYU1yR2Q5cFFsTUdvR3Vnd2NqZ25pbGIwVTZlam1kVGx6?=
 =?utf-8?B?eUNXOWlUT3owTngxVnFPU25xd01YdmYwaW1hYStBSXRTNHFUVkV1VmIrdnJv?=
 =?utf-8?B?UWVsVVI5UzYzaHRGRldsV1U0dW1FbHdNelhoZG5rT1M0VDhzYUh6SzZTbnp2?=
 =?utf-8?B?WEJ1L3QwZVpHbndhbElsakxQQXl3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <96ABCB6BA7AC8443B479CA7BE17D82A8@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB4008.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d83d6050-ef77-4d77-e635-08d9f2f1b302
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2022 15:16:55.3206 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v13nFO+hqWXFloyExxSZ+GqinTsgLjbtD1D+cIKCMI9e2v7WuphLCpLIUxxRz3+GHT0Np3g38pmfDlD9Ud7tqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB2585
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10261
 signatures=677564
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202180099
X-Proofpoint-GUID: 0Ne-EG7eEa53zhEtg5PVj1HZJxlHTiSZ
X-Proofpoint-ORIG-GUID: 0Ne-EG7eEa53zhEtg5PVj1HZJxlHTiSZ
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
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
 =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, John Johnson <john.g.johnson@oracle.com>,
 John Levon <john.levon@nutanix.com>, qemu-devel <qemu-devel@nongnu.org>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Markus Armbruster <armbru@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>, Eric Blake <eblake@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gRmViIDE4LCAyMDIyLCBhdCA5OjQ5IEFNLCBKYWcgUmFtYW4gPGphZy5yYW1hbkBv
cmFjbGUuY29tPiB3cm90ZToNCj4gDQo+IA0KPiANCj4+IE9uIEZlYiAxOCwgMjAyMiwgYXQgNzox
MyBBTSwgUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4gd3JvdGU6DQo+PiANCj4+
IE9uIDIvMTgvMjIgMDQ6NDAsIEphZyBSYW1hbiB3cm90ZToNCj4+Pj4gT24gRmViIDE3LCAyMDIy
LCBhdCA3OjA5IEFNLCBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+IHdy
b3RlOg0KPj4+PiANCj4+Pj4gT24gVGh1LCAxNyBGZWIgMjAyMiBhdCAwNzo1NiwgSmFnYW5uYXRo
YW4gUmFtYW4gPGphZy5yYW1hbkBvcmFjbGUuY29tPiB3cm90ZToNCj4+Pj4+IA0KPj4+Pj4gVGhl
IGNvbXBpbGVyIHBhdGggdGhhdCBjbWFrZSBnZXRzIGZyb20gbWVzb24gaXMgY29ycnVwdGVkLiBJ
dCByZXN1bHRzIGluDQo+Pj4+PiB0aGUgZm9sbG93aW5nIGVycm9yOg0KPj4+Pj4gfCAtLSBUaGUg
QyBjb21waWxlciBpZGVudGlmaWNhdGlvbiBpcyB1bmtub3duDQo+Pj4+PiB8IENNYWtlIEVycm9y
IGF0IENNYWtlTGlzdHMudHh0OjM1IChwcm9qZWN0KToNCj4+Pj4+IHwgVGhlIENNQUtFX0NfQ09N
UElMRVI6DQo+Pj4+PiB8IC9vcHQvcmgvZGV2dG9vbHNldC05L3Jvb3QvYmluL2NjOy1tNjQ7LW1j
eDE2DQo+Pj4+PiB8IGlzIG5vdCBhIGZ1bGwgcGF0aCB0byBhbiBleGlzdGluZyBjb21waWxlciB0
b29sLg0KPj4+Pj4gDQo+Pj4+PiBFeHBsaWNpdGx5IHNwZWNpZnkgdGhlIEMgY29tcGlsZXIgZm9y
IGNtYWtlIHRvIGF2b2lkIHRoaXMgZXJyb3INCj4+Pj4gDQo+Pj4+IFRoaXMgc291bmRzIGxpa2Ug
YSBidWcgaW4gTWVzb24uIElzIHRoZXJlIGEgTWVzb24gYnVnIHJlcG9ydA0KPj4+PiB3ZSBjYW4g
cmVmZXJlbmNlIGluIHRoZSBjb21taXQgbWVzc2FnZSBoZXJlID8NCj4+PiBIaSBQZXRlciwNCj4+
PiBUaGlzIGlzc3VlIHJlcHJvZHVjZXMgd2l0aCB0aGUgbGF0ZXN0IG1lc29uIFsxXSBhbHNvLg0K
Pj4gDQo+PiAwLjYwLjAgb3IgbW9yZSByZWNlbnQgdmVyc2lvbnMgc2hvdWxkIGhhdmUgYSBmaXgs
IHdoaWNoIHdvdWxkIGRvIGV4YWN0bHkgd2hhdCB0aGlzIHBhdGNoIGRvZXM6IGRvIG5vdCBkZWZp
bmUgQ01BS0VfQ19DT01QSUxFUl9MQVVOQ0hFUiwgYW5kIHBsYWNlIHRoZSB3aG9sZSBiaW5hcmll
cy5jIHZhcmlhYmxlIGluIENNQUtFX0NfQ09NUElMRVIuIFdoYXQgYXJlIHRoZSBjb250ZW50cyBv
ZiB0aGUgZ2VucmF0ZWQgQ01ha2VNZXNvblRvb2xjaGFpbkZpbGUuY21ha2UgYW5kIENNYWtlQ2Fj
aGUudHh0IGZpbGVzLCB3aXRob3V0IGFuZCB3aXRoIHlvdXIgcGF0Y2g/DQo+IA0KPiBJ4oCZbGwg
Y2hlY2tvdXQgd2hhdOKAmXMgZ29pbmcgb24gYXQgbXkgZW5kLiBCdXQgdGhlIGlzc3VlIHJlcHJv
ZHVjZXMgd2l0aA0KPiBtZXNvbiAwLjYxIGZyb20gd2hhdCBJIGNhbiB0ZWxsOg0KPiAjIC4uL2Nv
bmZpZ3VyZSAtLXRhcmdldC1saXN0PXg4Nl82NC1zb2Z0bW11IC0tZW5hYmxlLWRlYnVnIC0tZW5h
YmxlLXZmaW8tdXNlci1zZXJ2ZXI7DQo+IFRoZSBNZXNvbiBidWlsZCBzeXN0ZW0NCj4gVmVyc2lv
bjogMC42MS4yDQo+IOKApg0KPiDigKYNCj4gfCAvb3B0L3JoL2RldnRvb2xzZXQtOS9yb290L3Vz
ci9iaW4vY2M7LW02NDstbWN4MTYNCj4gDQo+IHwgaXMgbm90IGEgZnVsbCBwYXRoIHRvIGFuIGV4
aXN0aW5nIGNvbXBpbGVyIHRvb2wuDQo+IA0KPiANCj4gQ29uY2VybmluZyB0aGUgZ2VuZXJhdGVk
IGZpbGVzLCBJIHNlZSB0aGUgZm9sbG93aW5nIGluIENNYWtlTWVzb25Ub29sY2hhaW5GaWxlLmNt
YWtlOg0KPiBXaXRob3V0IHBhdGNoOiBzZXQoQ01BS0VfQ19DT01QSUxFUiAiL29wdC9yaC9kZXZ0
b29sc2V0LTkvcm9vdC91c3IvYmluL2NjIiAiLW02NCIgIi1tY3gxNuKAnSkNCj4gV2l0aCBwYXRj
aDogc2V0KENNQUtFX0NfQ09NUElMRVIgImNjIiAiLW02NCIgIi1tY3gxNiIpDQoNCknigJltIG5v
dCBzdXJlIGlmIHlvdeKAmXJlIGludGVyZXN0ZWQgaW4gdGhlIGNvbnRlbnRzIG9mIHRoZSB3aG9s
ZSBmaWxlLiBCdXQgdGhleeKAmXJlIGhlcmU6DQoNCldpdGhvdXQgcGF0Y2g6IGh0dHBzOi8vcGFz
dGViaW4uY29tL3Nid3R2SHkwIChhbHNvIGhhcyBlcnJvciBsb2cgYXQgdGhlIGVuZCkNCldpdGgg
cGF0Y2g6IGh0dHBzOi8vcGFzdGViaW4uY29tL2J1UllTcDJSDQoNClRoYW5rIHlvdSENCi0tDQpK
YWcNCg0KPiANCj4+IA0KPj4+IEkgbm90aWNlZCB0aGUgZm9sbG93aW5nIGFib3V0IHRoZSDigJxi
aW5hcmllc+KAnSBzZWN0aW9uIFsyXS4gVGhlIG1hbnVhbA0KPj4+IHNheXMgbWVzb24gY291bGQg
cGFzcyB0aGUgdmFsdWVzIGluIHRoaXMgc2VjdGlvbiB0byBmaW5kX3Byb2dyYW0gWzNdLg0KPj4+
IEFzIHN1Y2ggSeKAmW0gd29uZGVyaW5nIGlmIGl04oCZcyBPSyB0byBzZXQgY29tcGlsZXIgZmxh
Z3MgaW4gdGhpcyBzZWN0aW9uDQo+Pj4gYmVjYXVzZSBmaW5kX3Byb2dyYW0gZG9lc27igJl0IHNl
ZW0gdG8gYWNjZXB0IGFueSBjb21waWxlciBmbGFncy4NCj4+IA0KPj4gVGhlIGZ1bGwgcXVvdGUg
b2YgdGhlIG1hbnVhbCBpcyAiVGhlc2UgY2FuIGJlIHVzZWQgaW50ZXJuYWxseSBieSBNZXNvbiwg
b3IgYnkgdGhlIGZpbmRfcHJvZ3JhbSBmdW5jdGlvbiIsIGFuZCB0aGUgQyBjb21waWxlciB2YXJp
YWJsZSAiYyIgaXMgaW4gdGhlIGZvcm1lciBjYXRlZ29yeS4NCj4+IA0KPj4gVGhlcmUgaXMgYW4g
aW1wb3J0YW50IGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgZmxhZ3MgaW4gImJpbmFyaWVzIiBhbmQg
dGhvc2UgaW4gImJ1aWx0LWluIG9wdGlvbnMiLiBXaGF0IGlzIGluICJiaW5hcmllcyIgaXMgdXNl
ZCB3aGVuIHJlcXVlc3RpbmcgZS5nLiB0aGUgY29tcGlsZXIgc2VhcmNoIHBhdGgsIHdoaWxlIHdo
YXQgaXMgaW4gImJ1aWx0LWluIG9wdGlvbnMiIGlzIG5vdC4gIFNvIG9wdGlvbnMgbGlrZSAiLW0z
MiIgYXJlIGRlZmluaXRlbHkgcGFydCBvZiAiYmluYXJpZXMiLCBub3QgImJ1aWx0LWluIG9wdGlv
bnMiOg0KPj4gDQo+PiAgICQgZ2NjIC0tcHJpbnQtbXVsdGktb3MtZGlyZWN0b3J5DQo+PiAgIC4u
L2xpYjY0DQo+PiAgICQgZ2NjIC1tMzIgLS1wcmludC1tdWx0aS1vcy1kaXJlY3RvcnkNCj4+ICAg
Li4vbGliDQo+IA0KPiBEbyB5b3Uga25vdyBpZiB0aGUg4oCcaG9zdF9tYWNoaW5l4oCdIHNlY3Rp
b24gaW4gY3Jvc3MgYnVpbGQNCj4gZGVmaW5pdGlvbiBmaWxlIFsxXSB3b3VsZCBiZSBhbnkgaGVs
cCBoZXJlPw0KPiANCj4gWzFdOiBodHRwczovL21lc29uYnVpbGQuY29tL0Nyb3NzLWNvbXBpbGF0
aW9uLmh0bWwjbWFjaGluZS1lbnRyaWVzDQo+IA0KPiAtLQ0KPiBKYWcNCj4gDQo+PiANCj4+IFBh
b2xvDQoNCg==

