Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1832F4BBAF4
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 15:52:00 +0100 (CET)
Received: from localhost ([::1]:45302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL4c2-00082A-O6
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 09:51:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nL4Zg-0005l8-I3
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 09:49:33 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:9150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nL4Zc-0006um-6k
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 09:49:30 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21IDRHoC026646; 
 Fri, 18 Feb 2022 14:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=ikRv8J5/YscEuoTIH1tCTSKIwzhk9h1FthHx9Oke/PU=;
 b=c2PtnX4gUR3dA862ExzXd1UELakyrV5rD7KJBnZl5rxMsRTj4n9KpXGrDgl2DhlWaiCK
 QSwsD+rn3V++i4dazl/WPSdO3dxgPdXudiDyDYMXPOTwO/91YLkMUxSC4KflX/1s8NK8
 CgiFTQxe+UYiX9DurZvnD2xGFwQny35Qxwl/d7cK1yqOMtBkgrmBEm5odOfc0FYQTG8d
 SaODKBkMjHwaTKUupPDqQY4dBh9zNwKq6mVCHBiqE9ZGl/rI2M5OEVhCGPvrrjV2M/C/
 Fd8SOhwWkN26HSivzZ3hR/PSJeA6raPcB+1XIIjklg923XaByC+v3pmrGKtP6hFRcMSc xw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e8nkdsv4q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 14:49:15 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21IEkdWs028859;
 Fri, 18 Feb 2022 14:49:08 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2043.outbound.protection.outlook.com [104.47.51.43])
 by aserp3030.oracle.com with ESMTP id 3e9brdxb20-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 14:49:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mtpeuI93tAkvie6JRrIf7VbciDh2MwJ2DN2dnkxssjD8bPcmTm6McO37AynFYOIJd1l3LtLZNHR/9G25F143SslLQ5xSyiqQ0TANesluMGHiQI4MKrPExh75m/iLaW7D5FCtjZO9Eft43AiL0D/OlF1ff0engr3iKMNm1wkVZ7YHBRvNLp8L2nM9pb1nP7spllYOY5AdT3U5hNBJfoNFx/Vd+fBNeD6mfT4HIO/zjkIOZqfjuLsmOgvt0KLjwRJOxRutvRuzmXqGjOICXBMSHXvFn6zOy5zqhJfTnba+7eGI6au10rXcGUt6xQp7CbbrFO63fCidykJ0DB6Jds6KmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ikRv8J5/YscEuoTIH1tCTSKIwzhk9h1FthHx9Oke/PU=;
 b=T46skR18QADK07iE4pCVNdmlNLbCYtDy3QWYnNbkgLNSgqus+pQ8ZD+pFkJ7+pa1u9cqTMjordiwTMuMm0+yfbfGh3HjHrz7Vb31HnDw8dWQbeh1K7vJbeMiTCAgUCIpmChJbI5QYMaf9Gg2jYfNhxt5/+/89ul/ottEUMF/sSKb2WVz0ZYtuojFuwBfRIiX62NpS9wrte0N6Q0XomCAsQZ5VbMCCL37la8Jm49X7lV0aybeT3pmI8Jx0hQnMWoOS/mnqJYyakFQ+rf6lisBG0PSHBcLp0gTQaYn+7zwBd7UP0T28fjBQx5KTOIS7IiwyHazkb9PmJ/mO1Unjw1jqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ikRv8J5/YscEuoTIH1tCTSKIwzhk9h1FthHx9Oke/PU=;
 b=EYLiOfjMZTEkW2akYVnA0y1fUh5A8PeN83WI31l2z4QMJnJ7JhU/RmM86kd/SVxpIe372Og+hAJSWfXfQY8phBeVxu4UsGPzWMAizhZ3Jl87bHq/rGhxfVCEND8uBVNKR3qOik5A7Jnd4s0Rxxcgfwp9IidIGWyLRnB77rBdA2o=
Received: from CH2PR10MB4008.namprd10.prod.outlook.com (2603:10b6:610:c::22)
 by PH0PR10MB4648.namprd10.prod.outlook.com (2603:10b6:510:30::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Fri, 18 Feb
 2022 14:49:06 +0000
Received: from CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe]) by CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe%6]) with mapi id 15.20.4995.016; Fri, 18 Feb 2022
 14:49:06 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v6 01/19] configure, meson: override C compiler for cmake
Thread-Topic: [PATCH v6 01/19] configure, meson: override C compiler for cmake
Thread-Index: AQHYI8rkEa0YT9oQI0CMw6V1okPM+KyXptgAgAEENACAAI9eAIAAK1gA
Date: Fri, 18 Feb 2022 14:49:06 +0000
Message-ID: <43467806-DBE0-4EAB-A7D0-46F46BE45958@oracle.com>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <4bef7bdd7309e128eca140a2324a126346c9f1f1.1645079934.git.jag.raman@oracle.com>
 <CAFEAcA9JW0OyAyCk0zbnMMQbo=Q6vr7P4EhEHjrc=i0spCSGLw@mail.gmail.com>
 <496E5796-7071-4C9E-B2AB-3C59CB3D50B5@oracle.com>
 <fa4739f2-d6ab-9d01-6a4a-ab511bf0f89c@redhat.com>
In-Reply-To: <fa4739f2-d6ab-9d01-6a4a-ab511bf0f89c@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9edf5188-7ab8-412f-4dca-08d9f2edd045
x-ms-traffictypediagnostic: PH0PR10MB4648:EE_
x-microsoft-antispam-prvs: <PH0PR10MB4648C4FF3D1F695B5C5638AF90379@PH0PR10MB4648.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u9EZyOAgynLiVw18HU1anava2qfGWOF5KmA6EjhhDT9pES+scHfUFTb0EcAqbJ73Lj9i9IvnkdwRsKighyMpN75+paxZeHbUUyqxmVR5HeLkuJaBTRiFCjj7HlrkCE9R3C4coKgt+J4J44FtK9k8w+M3zV35V50A+w75T6wJIqN3gB6t1rYl0cwDPt3VDYsaj2MIdatn0Fhb59xsEFAIPg3ePHbQE0wUKURsptHPx+rMjaJuymRdV0qNZutfUMfJyYq0A5wdiShKZUalvn7VU9Q+mDszEuqt/j1Krr6xHofs+kmke7jrRom1Bok0vEnN46/FXNiZiZ8CW7K74f2/CYwgX6w5PL7qWFyo22pqBrdMiGOtesO3ogYZvFahz0QE8aqAo0wARxoNmk1fzgw7Awc5zTBo33tFTSyX/Yh8DxEDr3XptU7c7pLE8MB1svwPAQBGnbml9wNihI+7tATtWDc3mC6499QA1JPHuJA09+1yAK76G5bB7u7MfKETJnyg/l0gS6XFwPQOWfunEv97FN98c9WREMiySbnxES/eQ7NU+EfX1a+IdN8KCk0cVKrYWLLfZqsGthQHGhim+f/IEJGqwPIFbKOAW6cTLVOQQnCkAVZSzYfidK+e+sNnyCtB2/fjLLrkn5dSIiGiyvaUQQJvAse2MuYNlsraTX66WwVHBukP9JkERRRh0Tipi1Br9I2cYsq2gN1yLmLTqlnwchkTUKK6i3zPtOzxijbIsaB3LEd9YJRukzTOa68DlFK/LB/qA1R7pcEZqjvf7TmMi9/Ni+rgHVokO04OLEAKEV6ZovT2w0fk5AL1PPNQavpA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR10MB4008.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(186003)(8936002)(122000001)(2906002)(53546011)(38100700002)(38070700005)(6916009)(54906003)(36756003)(2616005)(6486002)(6506007)(966005)(44832011)(5660300002)(8676002)(4326008)(71200400001)(66556008)(64756008)(66476007)(6512007)(66946007)(66446008)(83380400001)(86362001)(7416002)(76116006)(91956017)(508600001)(33656002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXdRSTB0U0Q1M2FxaDc0L2RLV2J4OUNnMGIxQWJxQmsvVlhjL1hPbHZVQ3k0?=
 =?utf-8?B?RHdwOVJOeUYwYXN5K2I0MkwvZStTZVNJVDQ2UE4yOTk2bVFGdUJSUSs5NGZ0?=
 =?utf-8?B?QUtsTndYOVg5czJIWkFWaHdZZXlTT0pXUTZDRkRPeWtGSlZoRCtjYXFJdFV6?=
 =?utf-8?B?T2NPM0VxR1g2OWI4cEdIYnNwdEs2Z0JhQTdJZ2dOdU9seThRcUJHRytwaFhT?=
 =?utf-8?B?MFJpc1N0K0daMng1ZGY4QXdVRVk0ZWdUVEFHbU4xVmUyNEd0bnlGaVZtampm?=
 =?utf-8?B?bjk4dXQwU01sMGFmemZUbmYzeXZuczVUaWZWVlMyeGRyQi82bTFmQ2tlS2NF?=
 =?utf-8?B?Q2phQkxBbkNIa1RHbGpGamxHemd6UVQ2V1lPaHNDUXR2SHZuV3lZa09lVE9W?=
 =?utf-8?B?QVRkY1VxRHE2bVJDQUEzUnBnYWNhb0JNQWpqNXhiUFcwM3A5alNpdW5xaUFk?=
 =?utf-8?B?Y3ZadkpWZFdRK05Da2liNXc5UWxiQzVOTjFpcW40MG82RGgwdC9pTDJLcEYx?=
 =?utf-8?B?V0x3NWQ1RlFwY3pZQ1RUd0lCTkhIM3VtOU51bFhHekROQVFiQ2NKYTdTc2Y0?=
 =?utf-8?B?RCtHZGloOGw2RDZBT3NEaFBPVVFBeHRuRlZtZmpnYVlGZWgwUmZNQitEMCtM?=
 =?utf-8?B?VWttT2RvL1p1Y0NlQjQ4YzgrRExmc2pyVW1MVDhhMW5wdDJZeGIvaXNkVlJC?=
 =?utf-8?B?SmhTeEhuN1VTSkhodW92ZWFaV1B2YVpsMTI3N2RDWFdBN2dCdmNSWXJmTHRz?=
 =?utf-8?B?U0lJc3JtU1RLZnpveU12QnhDZkJJTkl1TmFIVk9xRWR5TTd5SERUZnJYbDAz?=
 =?utf-8?B?SHpwZ0xiMm01eXRoUlhkeW1PVTJ2MzF3TTFZYkhBVEtQYUR3R2xSbXZSSExN?=
 =?utf-8?B?bEtPcUhXeWdabzgvWDBpZzJGZ1hOOWpEand3eXVYVEc1cGFZY1lRZWgrQWMv?=
 =?utf-8?B?MWxVNkRPbVhXd2hKcXFwa2wyQWQzUy8yTHg1dnVIbzVQSTd4UGR2anI4N0pS?=
 =?utf-8?B?c3FyY21aUUltNVU1bzZETmFjdFh6MlVRVS90QzJ4bDdUUWhmQ1NveFE0amw5?=
 =?utf-8?B?bzZFT1NBWEljZFFPZzQrejYrU2tIc1JUUHBncmN0bzNwb1cvYkpxQWs2YXht?=
 =?utf-8?B?YVkyT0lxRjg1cmtLaUFmVmp1OHdqbEpTRDg3WWNHNk14cyt5ZkVvS2hZSnR2?=
 =?utf-8?B?dkdsc3hnTUJHOUs2TTNHTy9INlpGcFZyc09OYjF0djRHUUpTK29Hd0lWS05w?=
 =?utf-8?B?WVZscVAxYU5KdjBsYW9VVGF1MlMrVmlGOW92MnhFbkNDbWhpeUFDWndaQzh1?=
 =?utf-8?B?Y3k4MWtlb3d4ZGdSOGYxMVNWR3BldmhoTUY1L1R5eTZqaTJUMmZHazNFZGd1?=
 =?utf-8?B?WG44SnZFdWFVUFlEVVBCTmVtaTdSWktEOWNRbUJBM2k4WkZjb3Zyckp4K1F2?=
 =?utf-8?B?aEc1QTMyMC95aWNYbkwvMTh6Q1BxUmFOQ284S21VQ3dQR1dleW5ReFpTOTQ2?=
 =?utf-8?B?YWRzV2dsZDN0RDQ1WkRTVXhQUzkzdHNYdEF1LzZhMnlhdnpqT3B0VW5FQUFl?=
 =?utf-8?B?OVZ6aHBiOUdYN2RhQTc5bVlTRnpPVzh0OFVNc2NhS0p3TnMybzkzWVJrdkdB?=
 =?utf-8?B?OWsvSGdIYWRZVW5vdDN5V0NhYXE3djFFVUwzM3lYMzM4WVRXenBTd0RXYXFW?=
 =?utf-8?B?ZWs5REJKZnhoSVAzRXdyNUNrL1RGak5lZzZQdS9pT0l6VCtBSjBoTkVqSUZl?=
 =?utf-8?B?Q2t3YjN5SnpRKzhGVUYvSTlLcEF2WkNHZFR6UWZJZUt2emxWcUl2SWJHeWZU?=
 =?utf-8?B?ZzZ0b2dMMjJsN0pUTXJxZ3Izdm92bU9QeVVPZmFSTXowdTR4Z0dsSFVBa1hm?=
 =?utf-8?B?dmJHZkdwYlFkNVdmY0IvNmd2RUVqaC9JdEZsVEpQdEs1K1U0czZJQ1VLcjZa?=
 =?utf-8?B?elNpZ09hNkVyK2RKWWdVa0hFNU1EcHpDajRZK0N4d1hWalpxM3FXQzRHR1Js?=
 =?utf-8?B?dGhacWx2MG5pcjl2QzJFTG1BS0poQkVhdDlaNVRKMmRYcEF1d3RvRnpKdzBu?=
 =?utf-8?B?SHpoaDR1OXpXWVpCQUZDUzd3a1AyMXJwNFJsNVJLWHVIaDA5S3pwdENVb3hB?=
 =?utf-8?B?ZHQxU2tVaklzOGVSUlBuN0RUbkNiY2lndVl6cVdDNjE0dGJ4RW1sckVITjNw?=
 =?utf-8?B?ZjY3MldIVlF0M2YwaWRzcFI5NnZmQ3dhaGZ4WVFtSEhhOFZGcnJEMU1hZWhs?=
 =?utf-8?B?Q0xhQmpXVlVMOGgxZC90a0hwLzVBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7B992D382B4B86448AB3D52398E4FD46@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB4008.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9edf5188-7ab8-412f-4dca-08d9f2edd045
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2022 14:49:06.3603 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /bmtuOp3lIgFkz52a6VPbgXroaC0HogUCS0aJq5eSaRu1MlJk2y/s5WGxKNATKPgr5k2Ts+d5v5mqv8obySQUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4648
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10261
 signatures=677564
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 phishscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202180095
X-Proofpoint-ORIG-GUID: 65EHAd61HygaAk665I6exbz-5Lgncqky
X-Proofpoint-GUID: 65EHAd61HygaAk665I6exbz-5Lgncqky
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

DQoNCj4gT24gRmViIDE4LCAyMDIyLCBhdCA3OjEzIEFNLCBQYW9sbyBCb256aW5pIDxwYm9uemlu
aUByZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IE9uIDIvMTgvMjIgMDQ6NDAsIEphZyBSYW1hbiB3
cm90ZToNCj4+PiBPbiBGZWIgMTcsIDIwMjIsIGF0IDc6MDkgQU0sIFBldGVyIE1heWRlbGwgPHBl
dGVyLm1heWRlbGxAbGluYXJvLm9yZz4gd3JvdGU6DQo+Pj4gDQo+Pj4gT24gVGh1LCAxNyBGZWIg
MjAyMiBhdCAwNzo1NiwgSmFnYW5uYXRoYW4gUmFtYW4gPGphZy5yYW1hbkBvcmFjbGUuY29tPiB3
cm90ZToNCj4+Pj4gDQo+Pj4+IFRoZSBjb21waWxlciBwYXRoIHRoYXQgY21ha2UgZ2V0cyBmcm9t
IG1lc29uIGlzIGNvcnJ1cHRlZC4gSXQgcmVzdWx0cyBpbg0KPj4+PiB0aGUgZm9sbG93aW5nIGVy
cm9yOg0KPj4+PiB8IC0tIFRoZSBDIGNvbXBpbGVyIGlkZW50aWZpY2F0aW9uIGlzIHVua25vd24N
Cj4+Pj4gfCBDTWFrZSBFcnJvciBhdCBDTWFrZUxpc3RzLnR4dDozNSAocHJvamVjdCk6DQo+Pj4+
IHwgVGhlIENNQUtFX0NfQ09NUElMRVI6DQo+Pj4+IHwgL29wdC9yaC9kZXZ0b29sc2V0LTkvcm9v
dC9iaW4vY2M7LW02NDstbWN4MTYNCj4+Pj4gfCBpcyBub3QgYSBmdWxsIHBhdGggdG8gYW4gZXhp
c3RpbmcgY29tcGlsZXIgdG9vbC4NCj4+Pj4gDQo+Pj4+IEV4cGxpY2l0bHkgc3BlY2lmeSB0aGUg
QyBjb21waWxlciBmb3IgY21ha2UgdG8gYXZvaWQgdGhpcyBlcnJvcg0KPj4+IA0KPj4+IFRoaXMg
c291bmRzIGxpa2UgYSBidWcgaW4gTWVzb24uIElzIHRoZXJlIGEgTWVzb24gYnVnIHJlcG9ydA0K
Pj4+IHdlIGNhbiByZWZlcmVuY2UgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIGhlcmUgPw0KPj4gSGkg
UGV0ZXIsDQo+PiBUaGlzIGlzc3VlIHJlcHJvZHVjZXMgd2l0aCB0aGUgbGF0ZXN0IG1lc29uIFsx
XSBhbHNvLg0KPiANCj4gMC42MC4wIG9yIG1vcmUgcmVjZW50IHZlcnNpb25zIHNob3VsZCBoYXZl
IGEgZml4LCB3aGljaCB3b3VsZCBkbyBleGFjdGx5IHdoYXQgdGhpcyBwYXRjaCBkb2VzOiBkbyBu
b3QgZGVmaW5lIENNQUtFX0NfQ09NUElMRVJfTEFVTkNIRVIsIGFuZCBwbGFjZSB0aGUgd2hvbGUg
YmluYXJpZXMuYyB2YXJpYWJsZSBpbiBDTUFLRV9DX0NPTVBJTEVSLiAgV2hhdCBhcmUgdGhlIGNv
bnRlbnRzIG9mIHRoZSBnZW5yYXRlZCBDTWFrZU1lc29uVG9vbGNoYWluRmlsZS5jbWFrZSBhbmQg
Q01ha2VDYWNoZS50eHQgZmlsZXMsIHdpdGhvdXQgYW5kIHdpdGggeW91ciBwYXRjaD8NCg0KSeKA
mWxsIGNoZWNrb3V0IHdoYXTigJlzIGdvaW5nIG9uIGF0IG15IGVuZC4gQnV0IHRoZSBpc3N1ZSBy
ZXByb2R1Y2VzIHdpdGgNCm1lc29uIDAuNjEgZnJvbSB3aGF0IEkgY2FuIHRlbGw6DQojIC4uL2Nv
bmZpZ3VyZSAtLXRhcmdldC1saXN0PXg4Nl82NC1zb2Z0bW11IC0tZW5hYmxlLWRlYnVnIC0tZW5h
YmxlLXZmaW8tdXNlci1zZXJ2ZXI7DQpUaGUgTWVzb24gYnVpbGQgc3lzdGVtDQpWZXJzaW9uOiAw
LjYxLjINCuKApg0K4oCmDQp8IC9vcHQvcmgvZGV2dG9vbHNldC05L3Jvb3QvdXNyL2Jpbi9jYzst
bTY0Oy1tY3gxNg0KDQp8IGlzIG5vdCBhIGZ1bGwgcGF0aCB0byBhbiBleGlzdGluZyBjb21waWxl
ciB0b29sLg0KDQoNCkNvbmNlcm5pbmcgdGhlIGdlbmVyYXRlZCBmaWxlcywgSSBzZWUgdGhlIGZv
bGxvd2luZyBpbiBDTWFrZU1lc29uVG9vbGNoYWluRmlsZS5jbWFrZToNCldpdGhvdXQgcGF0Y2g6
IHNldChDTUFLRV9DX0NPTVBJTEVSICIvb3B0L3JoL2RldnRvb2xzZXQtOS9yb290L3Vzci9iaW4v
Y2MiICItbTY0IiAiLW1jeDE24oCdKQ0KV2l0aCBwYXRjaDogc2V0KENNQUtFX0NfQ09NUElMRVIg
ImNjIiAiLW02NCIgIi1tY3gxNiIpDQoNCj4gDQo+PiBJIG5vdGljZWQgdGhlIGZvbGxvd2luZyBh
Ym91dCB0aGUg4oCcYmluYXJpZXPigJ0gc2VjdGlvbiBbMl0uIFRoZSBtYW51YWwNCj4+IHNheXMg
bWVzb24gY291bGQgcGFzcyB0aGUgdmFsdWVzIGluIHRoaXMgc2VjdGlvbiB0byBmaW5kX3Byb2dy
YW0gWzNdLg0KPj4gQXMgc3VjaCBJ4oCZbSB3b25kZXJpbmcgaWYgaXTigJlzIE9LIHRvIHNldCBj
b21waWxlciBmbGFncyBpbiB0aGlzIHNlY3Rpb24NCj4+IGJlY2F1c2UgZmluZF9wcm9ncmFtIGRv
ZXNu4oCZdCBzZWVtIHRvIGFjY2VwdCBhbnkgY29tcGlsZXIgZmxhZ3MuDQo+IA0KPiBUaGUgZnVs
bCBxdW90ZSBvZiB0aGUgbWFudWFsIGlzICJUaGVzZSBjYW4gYmUgdXNlZCBpbnRlcm5hbGx5IGJ5
IE1lc29uLCBvciBieSB0aGUgZmluZF9wcm9ncmFtIGZ1bmN0aW9uIiwgYW5kIHRoZSBDIGNvbXBp
bGVyIHZhcmlhYmxlICJjIiBpcyBpbiB0aGUgZm9ybWVyIGNhdGVnb3J5Lg0KPiANCj4gVGhlcmUg
aXMgYW4gaW1wb3J0YW50IGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgZmxhZ3MgaW4gImJpbmFyaWVz
IiBhbmQgdGhvc2UgaW4gImJ1aWx0LWluIG9wdGlvbnMiLiBXaGF0IGlzIGluICJiaW5hcmllcyIg
aXMgdXNlZCB3aGVuIHJlcXVlc3RpbmcgZS5nLiB0aGUgY29tcGlsZXIgc2VhcmNoIHBhdGgsIHdo
aWxlIHdoYXQgaXMgaW4gImJ1aWx0LWluIG9wdGlvbnMiIGlzIG5vdC4gIFNvIG9wdGlvbnMgbGlr
ZSAiLW0zMiIgYXJlIGRlZmluaXRlbHkgcGFydCBvZiAiYmluYXJpZXMiLCBub3QgImJ1aWx0LWlu
IG9wdGlvbnMiOg0KPiANCj4gICAgJCBnY2MgLS1wcmludC1tdWx0aS1vcy1kaXJlY3RvcnkNCj4g
ICAgLi4vbGliNjQNCj4gICAgJCBnY2MgLW0zMiAtLXByaW50LW11bHRpLW9zLWRpcmVjdG9yeQ0K
PiAgICAuLi9saWINCg0KRG8geW91IGtub3cgaWYgdGhlIOKAnGhvc3RfbWFjaGluZeKAnSBzZWN0
aW9uIGluIGNyb3NzIGJ1aWxkDQpkZWZpbml0aW9uIGZpbGUgWzFdIHdvdWxkIGJlIGFueSBoZWxw
IGhlcmU/DQoNClsxXTogaHR0cHM6Ly9tZXNvbmJ1aWxkLmNvbS9Dcm9zcy1jb21waWxhdGlvbi5o
dG1sI21hY2hpbmUtZW50cmllcw0KDQotLQ0KSmFnDQoNCj4gDQo+IFBhb2xvDQoNCg==

