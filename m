Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 667F24D01BD
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 15:48:12 +0100 (CET)
Received: from localhost ([::1]:57822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nREeh-0000Ar-H6
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 09:48:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nREZt-00028V-TS
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 09:43:13 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:62428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nREZr-0002C1-Bz
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 09:43:13 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 227ELQSN009281; 
 Mon, 7 Mar 2022 14:42:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=cShck8fFcBUOafHJDizORVxo2WoOtIcYTbZ8d2L+pNE=;
 b=kCqaxYgYFePy3PrZ1hTf3iSp6FdGsg5PzUwHoNoTs59ipmQb/NgGra5QJ1KzNYrCz6GN
 lViSkWwL9wO0k39LnQXQnzmTDtTQN2xsKBKj4YYlG8e4cMSYdjxRqK1sxkL9+MXpI1o/
 F/3n/UPLuJGPKZWZdpXnnvviPc/roJ/AdGp9RMhm1FlFoGfGalSuSGQtpVqN7+oFBtfI
 UOqhL1dA9CaZdsqDgY3nPo8IM1uYG6yAHBM4YJVWszavlfFpJo+meLMk+LSkVCCrMG9A
 ursPlb6cw7R5c5wgABZXQ6PwDu0sTmN0WxAKuip51N+fgz4hXB23oLPXnnDHUpa1CJK7 QA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ekxf0m2ft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Mar 2022 14:42:56 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 227EgIOR160320;
 Mon, 7 Mar 2022 14:42:55 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
 by userp3030.oracle.com with ESMTP id 3ekvytkats-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Mar 2022 14:42:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZT42wfHfzR1LX4F2+SYT4O68WTc7exsVVGJs2hvmKe+P/y2pBVR+7r2Xv3N5J/9diQsZhaxDba3REZHO93wHTTxdV6fn5W5CxYA3gubWSGjAH1wu3JHWsXUYat1bgZtSsAwSVRPmWfakO3GSbtc1ZhLhTW6Hy3Ym3otoJlLl1S3oD5T5w/U9iyJUdcGiy0Qx35Vams1e63h+PHGLGFTg24aHPvFTQ5Q8Bx8fWpmN6r0Ob5+LJPGdhVyq7vDepMfUAwo+NNNFXxC7bLqOGS3r1cobIGqPq4saVzGYZc2ijsa3NzMJjX20fP4QdWjeYk/Qyrtusespu5Cx0PvraneVEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cShck8fFcBUOafHJDizORVxo2WoOtIcYTbZ8d2L+pNE=;
 b=LoWTpiXrOO1HmGxPEjpDXLc90AzzSBnHrSQRGQl2gWd9KUJ+kMvNINxmon3v3wyVjAgDuxztzWc0yGInUFXzktYGBtutuXUB0Omh3mC7xQxGvse7pARDUC3dldr1CgXzpefTccMhoohIhYcge3m+Cc9N6eP/+HjWVkKwrQSzGrlPr3ndhefBmxrsegwXOoIq8mkjTOG1y45NLVrhdXWjubfnMwVg6xlNp0a0YzR1Cf2dHkkCZLoGSOg2u4WkI3demU1hs7AnGx26IhqbmtBa0Gm3x5Uy8VRPf0of/BQ5MdoFxlMyQA5CXeCjpaGbnbFUC8hJSRI4Zpp1fq3HjptCGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cShck8fFcBUOafHJDizORVxo2WoOtIcYTbZ8d2L+pNE=;
 b=OEPaz/YCRYkQxOXOftV/Ww5gq917CB5tl2rZgyKADrWB/4q0O+yQTHzEBOH6AgAQfxuB3/oNDYHW1zD1rd6OHwxzhRwd9+8jqEWovLmtPqwtnUqGWocMTsWScEZt1ddwOcbImNJnXmN5LtTTQ3i8O2wOIr5NOep3QlJBnByaJvo=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BYAPR10MB2678.namprd10.prod.outlook.com (2603:10b6:a02:a9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Mon, 7 Mar
 2022 14:42:49 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a%5]) with mapi id 15.20.5038.027; Mon, 7 Mar 2022
 14:42:49 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v6 12/19] vfio-user: IOMMU support for remote device
Thread-Topic: [PATCH v6 12/19] vfio-user: IOMMU support for remote device
Thread-Index: AQHYI8rp1f9mHlzmeEK/icjoK3hvXqyfaYEAgAoI8ICAAvEPgIABcMoAgAX0V4CAAFMDAA==
Date: Mon, 7 Mar 2022 14:42:49 +0000
Message-ID: <77385160-0409-4915-9210-EE4B115FEDA3@oracle.com>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <f6dc62f6957a6ae2d289a5810d48c717eefff861.1645079934.git.jag.raman@oracle.com>
 <YhS9gvErGeGVPcwk@stefanha-x1.localdomain>
 <208904A4-1F80-4102-8B00-C106121475A1@oracle.com>
 <Yh+gMyjTDM5GEXMT@stefanha-x1.localdomain>
 <4022DDF7-8D34-4A65-969D-B632A66E386F@oracle.com>
 <YiXURRO7kjBogt9g@stefanha-x1.localdomain>
In-Reply-To: <YiXURRO7kjBogt9g@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7a0368ab-745b-41ae-6936-08da0048c09a
x-ms-traffictypediagnostic: BYAPR10MB2678:EE_
x-microsoft-antispam-prvs: <BYAPR10MB2678DBB39C38276C38A2A10B90089@BYAPR10MB2678.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Sb1903evhrC0uY6r28/Dhw0lpsUulyWP6owl3yO3F558jUorJwjhz4TzzqVnEP9fnc61E8JCSenJdGY8rmFL7w5c9nHXGui4BrL7KRVm6w7GftL1ikD59tZRORKSJVImaC6kjfoSNYeCImX/8wjjjp852ZkksSgJPJFgw4dz0/9eOevfL7fOvo99DfsicbR6ebzHHmGgufCQPS8+xnQw9RP8kscybHPyamUZVwmcRzB7XdFjK1V1RhxcPYTXD6Mc6wK4nu5Us1C2Kicv7n3wsDYvEQJYfdFAl8zSPd+tLLbkIHlG6tI0C5CRugHFu4F4S55okoJmL8K/Epy+ttpj3EqaA53WBq91RkcwnJ6+9aLBYQIHR1j0YUTrJhDb0RaMC5CyouSV1pROyQDKAJw+Ni5vHCPTDOL4Abg3/czzqDtDGn9BAhJgZ6GLWzT5xAy2wewgDA+qiY7TBr8hljYNil6qa6M3gF/upRskaII5vXDUdFHd1BiQCWep0FOORidhpqCWsrMNYzWQktEl5l91DH35Dwd70hiBj2ghx4zfiefmLCE+xxinv7LNrfk6qqTjVsktDpEZA8Rmio5d+frItTKxsVw6CCwUcGlWQh1GpZYsAmcNv9oeZB24AgBwyG07PmtD4wRHIpReVaEgUhtAGkM3VoVIgXlV+4JM8J37b4ZuTggb2tzicgBmnehJebeJ071lpN025ZlVKNvQgmjUQG01ap24Cg1/502BY75jlw8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6916009)(316002)(53546011)(6512007)(508600001)(6486002)(54906003)(36756003)(6506007)(186003)(91956017)(8936002)(7416002)(33656002)(44832011)(71200400001)(122000001)(8676002)(4326008)(5660300002)(2906002)(38100700002)(38070700005)(107886003)(2616005)(83380400001)(66946007)(76116006)(66446008)(66476007)(66556008)(64756008)(86362001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmRUTVdKZTZQazNMSTJRcGpaYkdjeWVhd1BseVBud2JMR1VWRUw5ajJPa0dr?=
 =?utf-8?B?aXdIWEcwTDE2V3U0cTZ2elFkbSsvMFJPNkpIVlY5TUhMMm91TUg4MWh3TUJJ?=
 =?utf-8?B?b2V0NnZwTU5VckkrQkp5aEM5N2lnc1N6N1hWR1RCRzdFYWN5ckFYMStuYjlE?=
 =?utf-8?B?aWRNU0hYUFc2eTUyeGQ0b0ZYbDFlK0F1N0FldTZwTktjQ3RCOTNCL2t3YjQx?=
 =?utf-8?B?NVFYcklSTnVKUk02bmlTaVlsOUQwNTNJcnRBdGJSQmNZVE5jNkNua01VUWhZ?=
 =?utf-8?B?QU84eU5hUWVPb0F6YU50MHJjTFJ6SlY3cTJrdVQ3V2tmanJjajZ0ODRUdFVR?=
 =?utf-8?B?aE00VVhoTlhKL1UxSG1FTkZyRHFWWGdkMTIrQTZtVElYRDVoMjhpM0hvQytr?=
 =?utf-8?B?OW9BTlpuWlFkcDY4QURoM1dpRllqWG1iVTB0alZzUEhUSGhXSlRIN2RpODl6?=
 =?utf-8?B?YnpSWFNONWdCVTl2OEtWSnpTOGxkTmQ4WTNVMmpaOTdqN0xWdXBQcllIOHpa?=
 =?utf-8?B?NEo3M3hxTGVpZFh2MU1LMEgwU0dsM2ZPNTg5Nnk4SmZKUVRSOXJuWHE3c2VM?=
 =?utf-8?B?VkZrUEljbkJSUkJpYnN1ZitGVGRELzVCTVJQclJ1OUZ0YXJpcGh5ZUl4OXBJ?=
 =?utf-8?B?TGpGYUhId3FuOVp0Q1JRb0U3dkZUM1J1em03ZkZka3pwb2QvZ2JvZUUrMSta?=
 =?utf-8?B?NCtkMlZ0UDVvdjdMNU56RWVyRXE5eXFSNytRZVVwSXJ4dXFyUTRqUFBoa0l5?=
 =?utf-8?B?a3BIRW8reW54UkQ4Y28zUWdCNDgzVXJLNkdGZ1FTbmhzUFowZGo3bmZLWUVV?=
 =?utf-8?B?dFljOEc2enBIZnJweXAyNzZESXowQlVwSlZMVXlXVzdiWVFGbDF4L3ZGbTlM?=
 =?utf-8?B?ZVpraTdhamJSdHZucy8rYi9TalFScTdVcUtmYkdYY0pUQnJEL3k4ays3MWEy?=
 =?utf-8?B?VXlrMG1pVmpjbWxmQksyTUl2L3RHaGhFT3phTDZKSGlCMHBuQjh2cEp0c3F1?=
 =?utf-8?B?dmRyRm5PUWFiUUV2K0R5THVyLzVzVDJqOWEwRERMTGZ3WFJ2S2ZudHZJYktm?=
 =?utf-8?B?WW5JN0lFT3A2NjBKVUc3V2VaRW9aTTN5OGkyemNTc3RwTVcrcHQ0eVdERTRE?=
 =?utf-8?B?ZXpKa0pYYTk0cWtDcnFOV1VRZHFianQ2U0xYUGlacXhFdkI4WTUzNGRpcTFK?=
 =?utf-8?B?MzRkOWdCV21QaldEWXRoRVZNUm9Nais3U1BSN0g1VUdGOE5JL1pJVnRsUWxV?=
 =?utf-8?B?c2Vxb1VEQi9vazdOWXF2RmRQN2V0MDFuZUIyYlFJZFdwVDUvQVdsUSt6eE5q?=
 =?utf-8?B?N2pPME5wVUxKMlR0ZjRSREFzaW02UTBBa2lrS0dPRlgrR0NoZXdSM2dncGQw?=
 =?utf-8?B?dElnSm1oREZUM3F3VXNsc0hjaEQxSUVHZDJ5aVpjZ0NmUE84UGdUUFlYTlBL?=
 =?utf-8?B?SVNNd0Y5SVIxbUpHZ296WWVWL1p3MFQzUlk1MEd2Ky92MnhLTG1MQkhvamhT?=
 =?utf-8?B?a29Fa1JVaDZuZGhTK3BVQVdoS2tpRHNzRXR2SDJZdGhjaVRpeVBtazlxRGpx?=
 =?utf-8?B?WEUvR1lCdHFBeGZMNUM5cDV1eDFMMnJDQ29razZMNFNXMktSaHdaRWdEVno2?=
 =?utf-8?B?SlNRZzZkeGU5MkdhZ2Z1TkpzYk0xUmRtS3ZMMXJiZS92ek9tOUUzaFdnOWFn?=
 =?utf-8?B?dG9CUGlrVHBEMXVFcHhxOTR5bnRNSnNPQ2lIMEhSd0d2OGFOOGtRNmNqaWZh?=
 =?utf-8?B?Q0U5dFBCSldGVGExTnBlYWZjZ2U3NUh6aFd5WHN0c2VOYlZHRDRDY1RrK1la?=
 =?utf-8?B?ZDEwbXhjdE42UDM3bXFLS1VJdjZ4VkJqQlFuQkdaalVyOVlJNEtqa3poeFZo?=
 =?utf-8?B?eko3MmxWMHhYcjRKN3FYWXh1MjhuZHRxYXE3REdZSEkvNUhQU1ZWZGdMRFVB?=
 =?utf-8?B?RUVsQXQ5Sng5QUlOK0pvTlBlK042bkVXc3drcEpwajdNS1crWUJSYjE4Nmk4?=
 =?utf-8?B?aHNrQTdVd29EbThuTDdPVXBLczFvelU4NHg2bDh1RXgrTGppWTVBbk9XajlH?=
 =?utf-8?B?bzFmWXZQNVM1Ni9ibjZ4YzBhYzgweC8vNWxzN3N4K0F3ZEs4ZXlZVk5QelV6?=
 =?utf-8?B?dEFLQk9kMFZEUC9JTWxBa0VpSzZiMDVxblNtcjYyeTlmUkxmSXVxTUoxNTc1?=
 =?utf-8?B?S082Y2Y0djlibk5wTk9jVUo5SWlIUHhiUE9zNmU4TUFKb0hsdStZbEliZGp5?=
 =?utf-8?B?ZFZZZkI3UDdpNWtUMUhLWlI3SGF3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2664D0747E991C4CBE5F02AC6FD18D72@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a0368ab-745b-41ae-6936-08da0048c09a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2022 14:42:49.4868 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MjnRL1y5bdEsgT5NcHzK4qubccltxJGkdY4np9ghtWMVYBTeSub7dykPO7goNTL7LhiicfH+AmLd2O+NVcwFHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2678
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10278
 signatures=690470
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203070085
X-Proofpoint-ORIG-GUID: As6gmV0cUCI8fwpTdnqbIsh7UHjr4OMe
X-Proofpoint-GUID: As6gmV0cUCI8fwpTdnqbIsh7UHjr4OMe
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
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gTWFyIDcsIDIwMjIsIGF0IDQ6NDUgQU0sIFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFu
aGFAcmVkaGF0LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBUaHUsIE1hciAwMywgMjAyMiBhdCAwMjo0
OTo1M1BNICswMDAwLCBKYWcgUmFtYW4gd3JvdGU6DQo+PiANCj4+IA0KPj4+IE9uIE1hciAyLCAy
MDIyLCBhdCAxMTo0OSBBTSwgU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPiB3
cm90ZToNCj4+PiANCj4+PiBPbiBNb24sIEZlYiAyOCwgMjAyMiBhdCAwNzo1NDozOFBNICswMDAw
LCBKYWcgUmFtYW4gd3JvdGU6DQo+Pj4+IA0KPj4+PiANCj4+Pj4+IE9uIEZlYiAyMiwgMjAyMiwg
YXQgNTo0MCBBTSwgU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPiB3cm90ZToN
Cj4+Pj4+IA0KPj4+Pj4gT24gVGh1LCBGZWIgMTcsIDIwMjIgYXQgMDI6NDg6NTlBTSAtMDUwMCwg
SmFnYW5uYXRoYW4gUmFtYW4gd3JvdGU6DQo+Pj4+Pj4gK3N0cnVjdCBSZW1vdGVJb21tdUVsZW0g
ew0KPj4+Pj4+ICsgICAgQWRkcmVzc1NwYWNlICBhczsNCj4+Pj4+PiArICAgIE1lbW9yeVJlZ2lv
biAgbXI7DQo+Pj4+Pj4gK307DQo+Pj4+Pj4gKw0KPj4+Pj4+ICtHSGFzaFRhYmxlICpyZW1vdGVf
aW9tbXVfZWxlbV9ieV9iZGY7DQo+Pj4+PiANCj4+Pj4+IEEgbXV0YWJsZSBnbG9iYWwgaGFzaCB0
YWJsZSByZXF1aXJlcyBzeW5jaHJvbml6YXRpb24gd2hlbiBkZXZpY2UNCj4+Pj4+IGVtdWxhdGlv
biBydW5zIGluIG11bHRpcGxlIHRocmVhZHMuDQo+Pj4+PiANCj4+Pj4+IEkgc3VnZ2VzdCB1c2lu
ZyBwY2lfc2V0dXBfaW9tbXUoKSdzIGlvbW11X29wYXF1ZSBhcmd1bWVudCB0byBhdm9pZCB0aGUN
Cj4+Pj4+IGdsb2JhbC4gSWYgdGhlcmUgaXMgb25seSAxIGRldmljZSBwZXIgcmVtb3RlIFBDSSBi
dXMsIHRoZW4gdGhlcmUgYXJlIG5vDQo+Pj4+PiBmdXJ0aGVyIHN5bmNocm9uaXphdGlvbiBjb25j
ZXJucy4NCj4+Pj4gDQo+Pj4+IE9LLCB3aWxsIGF2b2lkIHRoZSBnbG9iYWwuIFdlIHdvdWxkIG5l
ZWQgdG8gYWNjZXNzIHRoZSBoYXNoIHRhYmxlDQo+Pj4+IGNvbmN1cnJlbnRseSBzaW5jZSB0aGVy
ZSBjb3VsZCBiZSBtb3JlIHRoYW4gb25lIGRldmljZSBpbiB0aGUNCj4+Pj4gc2FtZSBidXMgLSBz
byBhIG11dGV4IHdvdWxkIGJlIG5lZWRlZCBoZXJlLg0KPj4+IA0KPj4+IEkgdGhvdWdodCB0aGUg
UENJZSB0b3BvbG9neSBjYW4gYmUgc2V0IHVwIHdpdGggYSBzZXBhcmF0ZSBidWYgZm9yIGVhY2gN
Cj4+PiB4LXZmaW8tdXNlci1zZXJ2ZXI/IEkgcmVtZW1iZXIgc29tZXRoaW5nIGxpa2UgdGhhdCBp
biB0aGUgcHJldmlvdXMNCj4+PiByZXZpc2lvbiB3aGVyZSBhIHJvb3QgcG9ydCB3YXMgaW5zdGFu
dGlhdGVkIGZvciBlYWNoIHgtdmZpby11c2VyLXNlcnZlci4NCj4+IA0KPj4gWWVzLCB3ZSBjb3Vs
ZCBzZXR1cCB0aGUgUENJZSB0b3BvbG9neSB0byBiZSB0aGF0IHdheS4gQnV0IHRoZSB1c2VyIGNv
dWxkDQo+PiBhZGQgbW9yZSB0aGFuIG9uZSBkZXZpY2UgdG8gdGhlIHNhbWUgYnVzLCB1bmxlc3Mg
dGhlIGJ1cyB0eXBlIGV4cGxpY2l0bHkNCj4+IGxpbWl0cyB0aGUgbnVtYmVyIG9mIGRldmljZXMg
dG8gb25lIChCdXNDbGFzcy0+bWF4X2RldikuDQo+IA0KPiBEdWUgdG8gaG93IHRoZSBJT01NVSBp
cyB1c2VkIHRvIHJlc3RyaWN0IHRoZSBidXMgdG8gdGhlIHZmaW8tdXNlcg0KPiBjbGllbnQncyBE
TUEgbWFwcGluZ3MsIGl0IHNlZW1zIGxpa2UgaXQncyBuZWNlc3NzYXJ5IHRvIGxpbWl0IHRoZSBu
dW1iZXINCj4gb2YgZGV2aWNlcyB0byAxIHBlciBidXMgYW55d2F5Pw0KDQpIaSBTdGVmYW4sDQoN
CuKAnHJlbW90ZV9pb21tdV9lbGVtX2J5X2JkZuKAnSBoYXMgYSBzZXBhcmF0ZSBlbnRyeSBmb3Ig
ZWFjaCBvZiB0aGUgQkRGDQpjb21iaW5hdGlvbnMgLSBpdCBwcm92aWRlcyBhIHNlcGFyYXRlIERN
QSBhZGRyZXNzIHNwYWNlIHBlciBkZXZpY2UuIEFzDQpzdWNoLCB3ZSBkb27igJl0IGhhdmUgdG8g
bGltaXQgdGhlIG51bWJlciBvZiBkZXZpY2VzIHRvIDEgcGVyIGJ1cy4NCg0KVGhhbmsgeW91IQ0K
LS0NCkphZw0KDQo+IA0KPiBTdGVmYW4NCg0K

