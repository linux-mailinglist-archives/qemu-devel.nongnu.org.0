Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C4A47B8D1
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 04:06:25 +0100 (CET)
Received: from localhost ([::1]:36730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzVTr-0000yM-Mf
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 22:06:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mzVSJ-0000CZ-3q
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 22:04:47 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:40992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mzVSG-0001cD-BM
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 22:04:46 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BKLnPYN002419; 
 Tue, 21 Dec 2021 03:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=g08SJ+pT78cYssjD95WjuLu/UfjliiXHSficVPMnYhs=;
 b=0dqH7f7Mz/91VouDZU3CegSrgp7YHCvdBIv0SPDnQVqDPUjvwiqKA6c9xbjDA9uOAXDy
 VN2Zsjk40xMgnOsd5S+4L5CF4GghQ36JbKsOjRGN/qKHSZqbeeewSNwC9T+cP+tr2Bfy
 OnbMj/z7fl8oi/KMMP3xoicA8pbijD/lk7SV9gUBJcsusgWJ1tcw/PRhe8zI5eIvzMep
 ofmU3Bbsi0KJg5hVl15sKJNFZlS9vOhbH0AdM5t7yXZ2OIIczK70AYv/CHcCcqMBLUy1
 NcrbesCru0vI5m12SfX7fhF34aUf5Iz/uK8S35rVa41/+gWkdIpZR2yNTE7Mg+nCrqia jA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d2qbqt60b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Dec 2021 03:04:34 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BL30ubw113676;
 Tue, 21 Dec 2021 03:04:33 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by userp3030.oracle.com with ESMTP id 3d14ruvfgr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Dec 2021 03:04:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kx2a5BCd4jwAvsR4ah6WsKCR3C2tE1lzS738kF0gunlV58brAcF9qjnrkwMqze4sJxqTiOluBUztEHfjMsi7oCv/zRe/cJlcI9M2pbOS2mMnq/qdTeRl87hXIoTRcEL/nD2FO5eFjuWAlrZXW+9U/XU0+8/0WKnGsUmfMCnVU5YSlM+2N4eqEP/0wxFd2hXOPyn0Z1FNaEw2uYwbhJxeEtwtD1lHplVYmgM+dt9seBouj1TJFl4hBWlMtv1IvL5WrC80tjNUU7x25Hna9baCbgDmoPHoeeQO0hcsCfJwuy/i2M5EXckNOoKbYWR2cpXshSwE5uOwvoubjftpbmC1uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g08SJ+pT78cYssjD95WjuLu/UfjliiXHSficVPMnYhs=;
 b=i8UogaR9TRxaU8eX75e6VSPgoUtfnmXD6MvSmW/2lu2NT/5eNRk3MFgzIiFKKipKp1+ywOjB9QlsXEpDiUvZSGsWSIa+dRLV+OuOeB9Sp/9pyCdXW9UCkv1dxMzJ7Q2LpVRFJFn5Gm3O1rJwu22WMEPyPQkHKy0ZjgwSBoof2CfnETPjWtswANRoCi+1E9WZKt53NO0S8oXAvjMTqKXLhtDgElpM45vcuk4cgfdG/+POPNYH57syXlVn8LM75p5c92YILLKM1DpPKlEkvhYtUWcpHXwBEXcQeF3ocu04xJ8Ka6rvZjXjGbNbtEenjYHiz4dyhix9N2Oxiz7e8/mXcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g08SJ+pT78cYssjD95WjuLu/UfjliiXHSficVPMnYhs=;
 b=FJ3OSKBtNxku5B/C4ADeixnXUyXTOKlEC1sJAAt4SSE5QPUai2drRrkRnGBLTnQzycCfOqIitXnW72qQ2q3DHuq80tSICvcd3kTT/pbUpy1Dx5fV4stmV+JnOarpvsCPiGdxJMPjSuOy7XTg5FVSyutTnPI7zyqcb+3BW7N1bNo=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3968.namprd10.prod.outlook.com (2603:10b6:208:1ba::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Tue, 21 Dec
 2021 03:04:30 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d%6]) with mapi id 15.20.4801.020; Tue, 21 Dec 2021
 03:04:30 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v4 07/14] vfio-user: run vfio-user context
Thread-Topic: [PATCH v4 07/14] vfio-user: run vfio-user context
Thread-Index: AQHX8YApP455uSlkD0+QKeZz8trhfaw0+iYAgAICnACABBeRgIABN5sA
Date: Tue, 21 Dec 2021 03:04:30 +0000
Message-ID: <1EFED294-2511-4C06-9EF4-4881AEEDDDD0@oracle.com>
References: <cover.1639549843.git.jag.raman@oracle.com>
 <f7fdee9b5cde0f8ee8e99702f113ab22dc4167ea.1639549843.git.jag.raman@oracle.com>
 <YbsgZDU06gcanadE@stefanha-x1.localdomain>
 <6EB1EAC5-14BF-46CB-A7CD-C45DE7116B44@oracle.com>
 <YcA+1/1sJbrHKdon@stefanha-x1.localdomain>
In-Reply-To: <YcA+1/1sJbrHKdon@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bfd3b80d-bad0-4e5d-73de-08d9c42e9b40
x-ms-traffictypediagnostic: MN2PR10MB3968:EE_
x-microsoft-antispam-prvs: <MN2PR10MB396871C3A643EB5333F128DE907C9@MN2PR10MB3968.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zhhI6U7Sy6HYVXnDcO87i2Z9jR9jC8zMSZaZlfMlVCwobLejBijNaEo0Z3dKbeC+stvQG6w+q70Wz/kSpASVjXWJFvbPh4XyjwlUDtFmfrpvLQLWhZH44V+muW1i8x1nd+xQe049MmnyrfjikzBh9tPaantDxEUNenTRZQl0VLQhqK+v4MLFJQPz4RGzO36tmIHeAEFuQkGpRSaZApQxdFV2tfEiG0UO8gjdIILDDU94PT9ulXRI+NFGKRGXA8AUH8yHu34KsSUJ+g3bkbtUUNkU+9GHeXvG0Buc/z/AflA8YlvCS+evzdozEh2O6fFlG5gG7yHIufzXLcd8Idq3r0IaMgK/JyEPxwHIEEBU6a2q0fTdgQ2Po6otlM6/seXq160AKl/Y+8CoNDVRf0lz9BvseAlnFHRq1sox9sIduPEXyDqLh7Svp3pV2dh3W7f53Lz/XWgMzrn4ZjoDhT/5mh58vOqM0R9Sa1KmSi0xQOqBYGdJ2SbqFZwAl3SGKCr6JwyOf97c1qf871t5sWTL/ixhOPOA8m3bIhKPJRiMBDHPeq2HgZhlGsI3Y/JY7Qzv/N7vFf0qyS+VuyaBvbKpMbeMBrZ+c2k7xXPh/S8HYF4H9kEK+V/oZ6t2Nr9BMh2DvROdDG/Pr0tBhFWkGRE6jRkZgMgXuB2qyQDIAA2j35iO4nfQEqWsA5Yy6lilP9hqtvZSNtWm7kATJnj1DNNzofGpAygITmf97L/RKcodRIQ9fhJzSD08ZVRdxCJFwsTA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(33656002)(53546011)(5660300002)(64756008)(186003)(91956017)(66446008)(6506007)(66556008)(66476007)(38070700005)(4326008)(316002)(76116006)(83380400001)(6916009)(71200400001)(8676002)(66946007)(122000001)(6512007)(2906002)(7416002)(86362001)(36756003)(44832011)(38100700002)(54906003)(6486002)(508600001)(2616005)(8936002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WG4yaTBEN0k2MWp0YVZ2TEVKWDB0YmRwcWl3TXpjMjdscDFBRm1aQ0ZITlBR?=
 =?utf-8?B?UU1aK2xMQXNhYmloSzViYjJTQklDVitXeEJsUmhpRVNGWlpHUytTYkJUYmlK?=
 =?utf-8?B?d0xwQ0NJa3JPb212M29NWjh4VFFEeHFhQ1JZd2JhR3BuUHRnRFRINGdReFhr?=
 =?utf-8?B?QlhUNmU1ZXgrZTRlbEpkdXJHbkFsQ1gxd3cra255Qk1wb2ZTaGIvZU9iOEI4?=
 =?utf-8?B?b0YrY3dBZWFKRUo1Q1RiajF6K2ZKb3kxcmZDTzhvYnR4dklSMTRuc3NzWWtk?=
 =?utf-8?B?TVB5Tm9OMGZIa3RYcE5CUWZZQ241bWRPbU13Vmc1aEFPVjV1eHcyZ3dWT0p4?=
 =?utf-8?B?VE0rOXJ2VnAxR0lMOVNHaDRQd2hob3VBVzI2UVFHcEhGL0sxUWE5YkhrbUdz?=
 =?utf-8?B?Tm9TN1NHbjdhYzRVNU9ZdXR6ZE9jd1dIZjFhMGZFT2t3ZXpZekxTRk9ZRjRn?=
 =?utf-8?B?ZnJFQ2xlbmFHYUJRcGJDR3BUOTZJVytmYXptQ040b1VCL1p6VGo4VURiRjhq?=
 =?utf-8?B?RlozUGNuelJCNllCR3FjelpQMlhkQkRKeWxxMHQ0TGd5dHJQRzVyNjhjV3F4?=
 =?utf-8?B?SmhNUG56MmdnRzcrb0dUSW1PRnIyMHZMc0tGNDBEallpNGp4dEpCcFlYQ21m?=
 =?utf-8?B?Vnk4OFUrOFZxOVUxRGFmK2NYQWs2QlJMcjdRM2R2ODYzRmU1L3d2TmpybWc3?=
 =?utf-8?B?TitpcWh0VEpNOENDVWE1czlMUklMcTRZcGkvVnBzZk1PckVVTDU2THFvQmRi?=
 =?utf-8?B?aDdPVDhaRW1ic3hJYzZRWTNWT09JTjd4VFNrQWhhLzdzQTZuZk9hWFllU0RG?=
 =?utf-8?B?L1djSVNna3JVb2sxYXBYTTBzbm5wMDkwSGpyaVNFd2F3aC9XY2hlMHpSUURu?=
 =?utf-8?B?dDVIbFFSOWpneG9UWnVMUlV4MHZVVFdDUkRTOG1UcW1JbG5pOGVVV21KNWpn?=
 =?utf-8?B?RVl3TmRTclAvVzJMblE0UjR6RUJ4NmZnWFNGMitQR0hIYXZjeW8zdTYzOHYw?=
 =?utf-8?B?TDNGZUdxODMzRis4anAwNks5c05naEZHRUFZbzE3bHZwK3lza3ZLVUM0aHlD?=
 =?utf-8?B?VUFnd3FJcXRUcVhmTUxNSERqVmZGdU92ZGsxTGxCZndBNG9MbWlZOXBBNGU3?=
 =?utf-8?B?V21yNU5IWFlHenJleDlYNnNFczB4UXBxczFEV2trSWIrcWtqbTJYZ1RQQ3BP?=
 =?utf-8?B?b2Rmd3BXb1J5S2pqR1ZhRDE5TEh6UExsTjlQSUdMZ3loTEVwVmxlK3RkRzg0?=
 =?utf-8?B?c2dPN25HS1BZUU1WMGpwam1FQVppMFYwVmY2YmRmWlBiR2RicG9IRzgrVStv?=
 =?utf-8?B?a1p2NUxtV1hLUEQzc2xOVUJhcWg0bEUvSnBreTRYUDlmVDAyanNQbDAxNjZY?=
 =?utf-8?B?eXZCOTlGb3pmWi9VNGhsdUtoL05yOHh2WUxUNjdRSmEraVJHWm9TTXpQWDBx?=
 =?utf-8?B?bndUZDF5S1JiZHhYZFY0WDlHaGM0U2EvVHJ3c0FWaDFWQ0NRQmtLYzBNZGtF?=
 =?utf-8?B?RVNzU2RRRFgvdUkyaHBCRUtFbGhSRTdHUENLeUZPUFdGNHBkMWFuNlBLVEcz?=
 =?utf-8?B?bkp6MllJY3l0SlAzU1VSM0Z0WWhWdTlRZkU4K2RYUVNoOVptSG5uWXlya29V?=
 =?utf-8?B?S1RyUFBZNXNlV0h1N0JXbzRCdENoTlA2a1gyMlRBWlZPd3BLSDZYQ0hERC9l?=
 =?utf-8?B?MFBOTDZtMnFicEpvOWVSL3lVaFVmVjN4N2dOZHhNbXl1MzZZZXN2ZEMxb0M4?=
 =?utf-8?B?YXNKS200THhzS1hCY3IzcDNEaVJtQ2lGbkpNNFpDSEFqYkZHc1kzWXJZQWFM?=
 =?utf-8?B?M1Zrd3RMNUhmS3M0MVVwZ0VNakQ5Z3hIcXVRdWlZZU5Ea20zTHo1WEp4Njl0?=
 =?utf-8?B?eFhyVTA2ckN3Zjk5VG1tYW5hcnpGTGdjK29Nd1U1ejljVldkKzArbTFJblRz?=
 =?utf-8?B?aDQ5OFRnQjM1YThmWHFKSFJ4bXRtdUJOcytwdFNoK0swZEtidFNCRXA4dkRo?=
 =?utf-8?B?U3ZVS1AxQmxQNTFzTDluakJiR2hNaU5DQXVoSnVuN21QWFFnUVp1aXZicEww?=
 =?utf-8?B?ZTc1RXVyaFlqY1BvL1RJSU03ak1HRU1YSzdmMlg2d0xEQjRDMkJzTWpIM1Ji?=
 =?utf-8?B?Zmw4T09iVXlSZ0t0QmFHQ05RN2s2QUFWbWdXZkgxdDBUKzlpOElBTkZ0OXJJ?=
 =?utf-8?B?Tm9xcEFteEF4OTBLMmJsY25qSERGRi8rU3BUZ09LRHV4NDh5MUU0Vm1rZE9j?=
 =?utf-8?B?RTFpY21QMElOdXVVS3ZKeHB0K0p3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B38CE89C93F00848B3914ADD7CDE9DB0@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfd3b80d-bad0-4e5d-73de-08d9c42e9b40
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2021 03:04:30.0461 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MnJIO1V+q/XcfK/7zcEuBNBgfc2qvbqoYml7kIdUtjLr9frPNUCu2LC6DNcdSCmtVeEOLDOTvZaQEH0b3SIHnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3968
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10204
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112210011
X-Proofpoint-ORIG-GUID: Mw4MQPKzapJDbOt4LFcwmT7XkEvtZ2FF
X-Proofpoint-GUID: Mw4MQPKzapJDbOt4LFcwmT7XkEvtZ2FF
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>, "bleal@redhat.com" <bleal@redhat.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 John Levon <john.levon@nutanix.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "crosa@redhat.com" <crosa@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "wainersm@redhat.com" <wainersm@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gRGVjIDIwLCAyMDIxLCBhdCAzOjI5IEFNLCBTdGVmYW4gSGFqbm9jemkgPHN0ZWZh
bmhhQHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gRnJpLCBEZWMgMTcsIDIwMjEgYXQgMDU6
NTk6NDhQTSArMDAwMCwgSmFnIFJhbWFuIHdyb3RlOg0KPj4gDQo+PiANCj4+PiBPbiBEZWMgMTYs
IDIwMjEsIGF0IDY6MTcgQU0sIFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4g
d3JvdGU6DQo+Pj4gDQo+Pj4gT24gV2VkLCBEZWMgMTUsIDIwMjEgYXQgMTA6MzU6MzFBTSAtMDUw
MCwgSmFnYW5uYXRoYW4gUmFtYW4gd3JvdGU6DQo+Pj4+IEBAIC0xMTQsNiArMTE4LDYyIEBAIHN0
YXRpYyB2b2lkIHZmdV9vYmplY3Rfc2V0X2RldmljZShPYmplY3QgKm9iaiwgY29uc3QgY2hhciAq
c3RyLCBFcnJvciAqKmVycnApDQo+Pj4+ICAgIHZmdV9vYmplY3RfaW5pdF9jdHgobywgZXJycCk7
DQo+Pj4+IH0NCj4+Pj4gDQo+Pj4+ICtzdGF0aWMgdm9pZCB2ZnVfb2JqZWN0X2N0eF9ydW4odm9p
ZCAqb3BhcXVlKQ0KPj4+PiArew0KPj4+PiArICAgIFZmdU9iamVjdCAqbyA9IG9wYXF1ZTsNCj4+
Pj4gKyAgICBpbnQgcmV0ID0gLTE7DQo+Pj4+ICsNCj4+Pj4gKyAgICB3aGlsZSAocmV0ICE9IDAp
IHsNCj4+Pj4gKyAgICAgICAgcmV0ID0gdmZ1X3J1bl9jdHgoby0+dmZ1X2N0eCk7DQo+Pj4+ICsg
ICAgICAgIGlmIChyZXQgPCAwKSB7DQo+Pj4+ICsgICAgICAgICAgICBpZiAoZXJybm8gPT0gRUlO
VFIpIHsNCj4+Pj4gKyAgICAgICAgICAgICAgICBjb250aW51ZTsNCj4+Pj4gKyAgICAgICAgICAg
IH0gZWxzZSBpZiAoZXJybm8gPT0gRU5PVENPTk4pIHsNCj4+Pj4gKyAgICAgICAgICAgICAgICBx
ZW11X3NldF9mZF9oYW5kbGVyKG8tPnZmdV9wb2xsX2ZkLCBOVUxMLCBOVUxMLCBOVUxMKTsNCj4+
Pj4gKyAgICAgICAgICAgICAgICBvLT52ZnVfcG9sbF9mZCA9IC0xOw0KPj4+PiArICAgICAgICAg
ICAgICAgIG9iamVjdF91bnBhcmVudChPQkpFQ1QobykpOw0KPj4+PiArICAgICAgICAgICAgICAg
IGJyZWFrOw0KPj4+IA0KPj4+IElmIG5vdGhpbmcgZWxzZSBsb2dzIGEgbWVzc2FnZSB0aGVuIEkg
dGhpbmsgdGhhdCBzaG91bGQgYmUgZG9uZSBoZXJlIHNvDQo+Pj4gdXNlcnMga25vdyB3aHkgdGhl
aXIgdmZpby11c2VyIHNlcnZlciBvYmplY3QgZGlzYXBwZWFyZWQuDQo+PiANCj4+IFN1cmUgd2ls
bCBkby4NCj4+IA0KPj4gRG8geW91IHByZWZlciBhIHRyYWNlLCBvciBhIG1lc3NhZ2UgdG8gdGhl
IGNvbnNvbGU/IFRyYWNlIG1ha2VzIHNlbnNlIHRvIG1lLg0KPj4gUHJlc2VudGx5LCB0aGUgY2xp
ZW50IGNvdWxkIHVucGx1ZyB0aGUgdmZpby11c2VyIGRldmljZSB3aGljaCB3b3VsZCB0cmlnZ2Vy
IHRoZQ0KPj4gZGVsZXRpb24gb2YgdGhpcyBvYmplY3QuIFRoaXMgcHJvY2VzcyBjb3VsZCBoYXBw
ZW4gcXVpZXRseS4NCj4gDQo+IElmIHRoZXJlIGlzIG5vIHdheSB0byBkaWZmZXJlbnRpYXRlIGdy
YWNlZnVsIGRpc2Nvbm5lY3QgZnJvbSB1bmV4cGVjdGVkDQo+IGRpc2Nvbm5lY3QgdGhlbiBsb2dn
aW5nIG1pZ2h0IGJlIHRvbyBub2lzeS4NCg0KSSB0aGluayB0aGF04oCZcyB3aGF0IGhhcHBlbnMg
aW4gdGhlIHJlZ3VsYXIgVkZJTyBjYXNlIGFsc28uDQp2ZmlvX3B1dF9iYXNlX2RldmljZSgpIGNs
b3NlcyB0aGUgRkQgdXNlZCBmb3IgaW9jdGxzLg0KDQo+IA0KPiBSZWdhcmRpbmcgdGhlIGF1dG9t
YXRpYyBkZWxldGlvbiBvZiB0aGUgb2JqZWN0LCB0aGF0IG1pZ2h0IG5vdCBiZQ0KPiBkZXNpcmFi
bGUgZm9yIHR3byByZWFzb25zOg0KPiAxLiBJdCBwcmV2ZW50cyByZWNvbm5lY3Rpb24gb3IgYW5v
dGhlciBjbGllbnQgY29ubmVjdGluZy4NCj4gMi4gTWFuYWdlbWVudCB0b29scyBhcmUgaW4gdGhl
IGRhcmsgYWJvdXQgaXQuDQo+IA0KPiBGb3IgIzIgdGhlcmUgYXJlIG1vbml0b3IgZXZlbnRzIHRo
YXQgUUVNVSBlbWl0cyB0byBub3RpZnkgbWFuYWdlbWVudA0KPiB0b29scyBhYm91dCBzdGF0ZSBj
aGFuZ2VzIGxpa2UgZGlzY29ubmVjdGlvbnMuDQoNClRoaXMgaXMgdmVyeSBpbnRlcmVzdGluZy4g
SSBzdXBwb3NlIHlvdeKAmXJlIHJlZmVycmluZyB0byBzb21ldGhpbmcgbGlrZQ0K4oCYQkxPQ0tf
Sk9CX0NPTVBMRVRFROKAmSBldmVudC4NCg0KSXTigJlkIGJlIGdvb2QgdG8gaW5mb3JtIHRoZSBt
YW5hZ2VtZW50IHRvb2xzIGFib3V0IGRpc2Nvbm5lY3Rpb24uIE5vdA0KdXNlZCB0aGlzIGJlZm9y
ZSwgd2lsbCBjaGVjayBpdCBvdXQgdG8gZ2F0aGVyIGlkZWFzIG9uIGhvdyB0byB1c2UgaXQuDQoN
Cj4gDQo+IEl0J3Mgd29ydGggdGhpbmtpbmcgYWJvdXQgY3VycmVudCBhbmQgZnV0dXJlIHVzZSBj
YXNlcyBiZWZvcmUgYmFraW5nIGluDQo+IGEgcG9saWN5IGxpa2UgYXV0b21hdGljYWxseSBkZWxl
dGluZyBWZnVPYmplY3Qgb24gZGlzY29ubmVjdCBiZWNhdXNlDQo+IGl0J3MgaW5mbGV4aWJsZSBh
bmQgd291bGQgcmVxdWlyZSBhIFFFTVUgdXBkYXRlIGluIHRoZSBmdXR1cmUgdG8gc3VwcG9ydA0K
PiBhIGRpZmZlcmVudCBwb2xpY3kuDQo+IA0KPiBPbmUgYXBwcm9hY2ggaXMgdG8gZW1pdCBhIGRp
c2Nvbm5lY3QgZXZlbnQgYnV0IGxlYXZlIHRoZSBWZnVPYmplY3QgaW4gYQ0KPiBkaXNjb25uZWN0
ZWQgc3RhdGUuIFRoZSBtYW5hZ2VtZW50IHRvb2wgY2FuIHRoZW4gcmVzdGFydCBvciBjbGVhbiB1
cCwNCj4gZGVwZW5kaW5nIG9uIGl0cyBwb2xpY3kuDQo+IA0KPiBJJ20gbm90IHN1cmUgd2hhdCdz
IGJlc3QgYmVjYXVzZSBpdCBkZXBlbmRzIG9uIHRoZSB1c2UgY2FzZXMsIGJ1dCBtYXliZQ0KPiB5
b3UgYW5kIG90aGVycyBoYXZlIGlkZWFzIGhlcmUuDQo+IA0KPj4+PiBAQCAtMjA4LDYgKzI4NCw4
IEBAIHN0YXRpYyB2b2lkIHZmdV9vYmplY3RfaW5pdChPYmplY3QgKm9iaikNCj4+Pj4gICAgICAg
ICAgICAgICAgICAgVFlQRV9WRlVfT0JKRUNULCBUWVBFX1JFTU9URV9NQUNISU5FKTsNCj4+Pj4g
ICAgICAgIHJldHVybjsNCj4+Pj4gICAgfQ0KPj4+PiArDQo+Pj4+ICsgICAgby0+dmZ1X3BvbGxf
ZmQgPSAtMTsNCj4+Pj4gfQ0KPj4+IA0KPj4+IFRoaXMgbXVzdCBjYWxsIHFlbXVfc2V0X2ZkX2hh
bmRsZXIoby0+dmZ1X3BvbGxfZmQsIE5VTEwsIE5VTEwsIE5VTEwpDQo+Pj4gd2hlbiBvLT52ZnVf
cG9sbF9mZCAhPSAtMSB0byBhdm9pZCBsZWF2aW5nIGEgZGFuZ2xpbmcgZmQgaGFuZGxlcg0KPj4+
IGNhbGxiYWNrIHJlZ2lzdGVyZWQuDQo+PiANCj4+IFRoaXMgaXMgZHVyaW5nIHRoZSBpbml0IHBo
YXNlLCBhbmQgdGhlIEZEIGhhbmRsZXJzIGFyZSBub3Qgc2V0LiBEbyB5b3UgbWVhbg0KPj4gdG8g
YWRkIHRoaXMgYXQgZmluYWxpemU/DQo+PiANCj4+IEkgYWdyZWUgaXTigJlzIGdvb2QgdG8gZXhw
bGljaXRseSBhZGQgdGhpcyBhdCBmaW5hbGl6ZS4gQnV0IHZmdV9kZXN0cm95X2N0eCgpIHNob3Vs
ZA0KPj4gdHJpZ2dlciBhIEVOT1RDT05OLCB3aGljaCB3b3VsZCBkbyBpdCBhbnl3YXkuDQo+IA0K
PiBJJ20gbm90IHN1cmUgbXkgY29tbWVudCBtYWtlcyBzZW5zZSBzaW5jZSB0aGlzIGlzIHRoZSBp
bml0IGZ1bmN0aW9uLCBub3QNCj4gZmluYWxpemUuDQo+IA0KPiBIb3dldmVyLCBpdCdzIG5vdCBj
bGVhciB0byBtZSB0aGF0IHRoZSBvLT52ZnVfcG9sbF9mZCBmZCBoYW5kbGVyIGlzDQo+IHVucmVn
aXN0ZXJlZCBmcm9tIHRoZSBldmVudCBsb29wIHdoZW4gVmZ1T2JqZWN0IGlzIGZpbmFsaXplZCAo
ZS5nLiBieQ0KPiB0aGUgb2JqZWN0LWRlbCBtb25pdG9yIGNvbW1hbmQpLiBZb3Ugc2F5IHZmdV9k
ZXN0cm95X2N0eCgpIHRyaWdnZXJzDQo+IEVOT1RDT05OLCBidXQgdGhlIFZmdU9iamVjdCBpcyBm
cmVlZCBhZnRlciBmaW5hbGl6ZSByZXR1cm5zIHNvIHdoZW4gaXMNCj4gdGhlIGZkIGhhbmRsZXIg
ZGVyZWdpc3RlcmVkPw0KDQpUaGF0IGlzIGNvcnJlY3QgLSB3aWxsIHJlbW92ZSB0aGUgRkQgaGFu
ZGxlciBpbiBmaW5hbGl6ZSBhbHNvLg0KDQpUaGFuayB5b3UhDQotLQ0KSmFnDQoNCj4gDQo+IFN0
ZWZhbg0KDQo=

