Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF0944B242
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 19:04:08 +0100 (CET)
Received: from localhost ([::1]:59894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkVTb-0004Ls-84
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 13:04:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <annie.li@oracle.com>)
 id 1mkVQi-0002Nh-Kp
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 13:01:10 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:37726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <annie.li@oracle.com>)
 id 1mkVQY-0002Fw-Ka
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 13:01:05 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A9H1Sgp027927; 
 Tue, 9 Nov 2021 18:00:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=hi10FOwa5qnCZycuoJwH9RTtPop1W8pijY0PM+0YKxA=;
 b=OSE7IM089qSNVlU+8t7A+WBrIhK+3gXFV6eVRwFgQGbuC38e0R8f3ofQns9S9l9HAL2X
 iUMxHyJkv5QiamJI3PCkc+1U/5a2IXAYRlmEL40aBiqJwF8qE8JrvO7HOYspIMt5cOKb
 aQOXhp3GM3RVW5c3AlpUmT5sMvkS/eE6IGJmXXOJ0QYy/la4XQEEh9OJf2xGJaOXMm8t
 qAUxFsp1CGs+aCO3xlsY7dT4fdf1HsxlyvEL8FIuzzTT1UoavGAZQde2WZLUkqLQCxCN
 Zzn8RqGQMUkv2yojESb9MvTwSdEYmkg1WnVNlmWuGa0l6osUsa97lZ+gZLk4YEk8Vx1S gg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c6st8wb55-17
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Nov 2021 18:00:44 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A9GefMd187410;
 Tue, 9 Nov 2021 17:01:38 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
 by userp3020.oracle.com with ESMTP id 3c63ft91a7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Nov 2021 17:01:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGAMeuN37WcmNV4odt/piTIRSy0yo1lugY1amX2VoK+clEt1tGlCZgi5ThK7FAV+OssbDtlqI9X7XHXGH2qVaePW1cQMMn4Q0CFfvxV9qPj5hQdLezQBIdJ8omfZGA6aTr+WS6aElG3bgQFJqTLaw7CXFVDBZ+VbQIQGNgTpwGQRXIx8ioZUj+1awYvhvlO7LJ2DXIDXl3Enmu0XkAEM//opLTZlcG/cVi8P2ofRekF+YedRwzDdW6mo5fm8693fX/LziF6RU0xeQOSD/OkTEtROxvuUth6cvhVw1nRQjKjOsxOm8DPum01DqNyNsSzE15ZrgFetEbEZcaN2766Hhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hi10FOwa5qnCZycuoJwH9RTtPop1W8pijY0PM+0YKxA=;
 b=ZiBVhT5U/iwyki2ICtqbTVZ09d8FLEVxOcIJBNgOn0Cndy9FG6LbCo0+j8DyADvDCdzOnZM1TGpNshd1IWzCBAQj2gD8dDLpedbq0A/IcR6ay4ONwIKZhL1pODXDhLQp6lGyQAhzwEfNYEnEAiujULd8hsrFr37syWaHHTbtS5CSDme66q1EBCpyrOpzWayvAMLFuGNqDCZOfc/GBWo3yF/vX7LMXClxpTr5dmQwBImLi5eh3JD2FPGSjlPJScUE8JJTpDu7dr3Ea2tZ1Ij/f1v6VH6KpmbNqS8lwxZpOVEf5Bp+bo2Z7BtoVmiivgHeJbTu4BP488SEOVXoTvicUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hi10FOwa5qnCZycuoJwH9RTtPop1W8pijY0PM+0YKxA=;
 b=dP3WFufvgw7UUZ/KmiEEVRIeYJJyqUeZlXNmpJ2YZwiQyvsvo4xaGQafJ/PGv8uEFhi0jc7Nrk1/xMlDqzd8aWWdqCv27wvZMk4hIKGkS0mCvXddCQmQXKW9ZG9LphDpUbt5BsZHqW9hwZN5z/Up9f6HwqIFczZHaFaBdrUk5E8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB2523.namprd10.prod.outlook.com (2603:10b6:5:b2::27) by
 DM6PR10MB3243.namprd10.prod.outlook.com (2603:10b6:5:1a7::32) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.13; Tue, 9 Nov 2021 17:01:34 +0000
Received: from DM6PR10MB2523.namprd10.prod.outlook.com
 ([fe80::6491:6cd2:c4d5:c1b7]) by DM6PR10MB2523.namprd10.prod.outlook.com
 ([fe80::6491:6cd2:c4d5:c1b7%3]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 17:01:33 +0000
Message-ID: <59be6397-57f8-cd0e-2762-0a3f8b9b4a05@oracle.com>
Date: Tue, 9 Nov 2021 12:01:30 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Failure of hot plugging secondary virtio_blk into q35 Windows 2019
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Ani Sinha <ani@anisinha.ca>
References: <57170d20-635b-95fd-171e-e84de0d2d84e@oracle.com>
 <31c8012c-234f-2bb8-7db2-f7fee7bd311f@oracle.com>
 <4be352af-f3fc-0ef3-1d97-cd3eafbbb98f@oracle.com>
 <alpine.DEB.2.22.394.2111091226350.133428@anisinha-lenovo>
 <YYpE8zhRR2WWFl+j@redhat.com>
 <CAARzgww63RpHB+40q5=qzy+V2ZoJs-FF1C2WAz8TL58r2dwJ7g@mail.gmail.com>
 <YYpZOeZkzOa5dB5+@redhat.com>
From: "Annie.li" <annie.li@oracle.com>
In-Reply-To: <YYpZOeZkzOa5dB5+@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR07CA0030.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::40) To DM6PR10MB2523.namprd10.prod.outlook.com
 (2603:10b6:5:b2::27)
MIME-Version: 1.0
Received: from [192.168.0.105] (73.69.1.191) by
 MN2PR07CA0030.namprd07.prod.outlook.com (2603:10b6:208:1a0::40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Tue, 9 Nov 2021 17:01:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ef2fa2e-1686-4fc7-8d5d-08d9a3a29554
X-MS-TrafficTypeDiagnostic: DM6PR10MB3243:
X-Microsoft-Antispam-PRVS: <DM6PR10MB3243869F334C3CB5D70F14A4E5929@DM6PR10MB3243.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MVW7iYZEZdt8bMMW3QZfu1tzt59LgBjr+TzHxbd8JPCNEHuKKWlteCEK84uPwg9IA67kTTxrSj4xVtwNM2qXb0Gg+CYWlidChAIxSrDLhu5pWrEAvdxN41Er15JFxP696isGgz+pzO+jtozFrOgh9goFrUCG+WWRMmBU1fM4wLCz2Anyvirywwy/5v5enkGFViQ+2EJ8QUzuXOHaWBIgPzlfUOAIZlXHeFpUzgnXlJbFQBAd2n7b0H5p2IcAfRu9pRzscuQblXJQ2G9YS9gp5hb0az7RlIq38BO0LjDkcc1G+1pACDtRT04rA0tpZ/sJDK24TC6EDif6XKxLa+bWcNSyMzZCeo83jkvKZtGiIdtlg9ehU8xSk4JNKOgLjQiashcVm5E1wnUyQiqvJM2zQ/ZwZFr/VZxAJJhvRxa0VXInWjv7BkWJHS+5PMM1ABIYziWBiTwSA3S2D4+BmJ4pw0kqFzT5ScJohgbESL6C+V5dT5aotDVhjORt3tEqmjDWt3tdcS3LKEuTZdcD+RrhRwT+t4XkPedOFhJT7oCsSHIaDimAJK85SMw9mGZ2JvfX9v4u9PpxdWWyC5uB6N69b9kb7O6T5Oq2Z/eGJzPP3Q9lGn4qFlOG7wLcGwRgdbaBUEaxytVH/nM8JwtFhSTHqTcZC9xmD4yXK41HuPYsgQ17ab4eA64AbExSa2YLNXpP3qoyZGEl+HZmoi8I6mzP08E01sfFvF4IOQ0JdDbY/tkpCd5HvqaObzOgClyL/u0u5hcVFHpJEPqxtqkolCGASejxV4Ut/AdAQM6SynPEEEPZKorCI93f42Z4/FGQmOCqh2naWb7qc++HTaphQsM32Yr0MIV5G2lxBhXnoXc4LWk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB2523.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(8936002)(26005)(36756003)(86362001)(53546011)(5660300002)(508600001)(31686004)(2906002)(66476007)(38100700002)(83380400001)(8676002)(316002)(110136005)(16576012)(186003)(4326008)(31696002)(956004)(2616005)(66946007)(6486002)(966005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGRVeXFYVW03Q3YwV0FXY01WaElPSkNsSnRQaW01b0xWQ0NYZDNmMXZzTnhH?=
 =?utf-8?B?aFpxL01ncWtLU2R4ZFg4TDcrS3ZXVER2VlRaZFdmOWoyRHlEMXZmejlnOVBD?=
 =?utf-8?B?dDgwOEVXVzdFVTdQQ1IxUFdhdGZHL09TZVM1aU56dTNwUWhHUjhESmlqbXk1?=
 =?utf-8?B?VEVHc2dpQytPdThxV3JVR3l3OXNCUzZFTXBvcWlHUVRPWDVIVkR1TGFpcjZu?=
 =?utf-8?B?L0I1ZDg0U0U0L0FCcDBsTlN1aUtKK2IvVVBWM0ZmcGZGSktxZGVUSFZ2djNR?=
 =?utf-8?B?YTNaL1dZWjY1bkRZbGVmR0d2SW5wVlZpNVNVN05KeVU5YXpHQmtQKy83SHc2?=
 =?utf-8?B?Tmc4eGhHZXlKTVlZdVVlUTVjK1lYM2NpNk9FK3BSR1ZHb21VK0EwbFcvTGZo?=
 =?utf-8?B?NTcxU0pJTWxCTEhOVFRuNVViTFdCcDkwT3J6ZWw0bGk5Z2hIbFV1STA5cTdW?=
 =?utf-8?B?SXB4SlAzajQzMG5QRHM2aXNoZFp0UStOODA4MURJSlRtLy9Ob1VrM1VaYW14?=
 =?utf-8?B?Q1RvYjZqcGpsMDAzRmtYNGtiVjVLT0NVeks3UnB6SnBnVkJPbjRkSkNJM3k0?=
 =?utf-8?B?MTNJakQvcFdYa2pjb0VKZGtVRXFnU2p3OGcrU0N0V1hvOTFaWktTQlhlK3du?=
 =?utf-8?B?T2JxSlFIbC90S0wydW1zRC9GOVlXUGo2NnFmN0dLTjYzbDZ4cTFwYzlLeHpW?=
 =?utf-8?B?TThRdHlucEsyMmg1RW9oUGw3bnZMallJTUIyVVNRaGMxaTZOZGtYRk92a2Nq?=
 =?utf-8?B?eEduSUJweFl0Y1hiV0lIaGhpZWQ1ODRGNTVQeXRDWTNlK2JlZGJBSDR5VHNi?=
 =?utf-8?B?TnRFbTFCSCtFbW1sbWhYY1h1d3AxK3FFdjBCNXdKV3c0WUUvQ1ZQMklYVTRP?=
 =?utf-8?B?TzdSVC82ZUh0U01vMjY3U2lPZE9XSVduOW11TEQrUXRINldqZzNLMHE5emNS?=
 =?utf-8?B?TEFwQXZGUFlDUW1HN054QStCY2hsWUlQSXUzelpha0JsL3RCRDRoNkorK0hF?=
 =?utf-8?B?a0ZoVVJFNHR6K1lDSCtXd1orMkJhbnNyYVFuakpITUtIUURBbmIzN2NENEs5?=
 =?utf-8?B?MUFveXp3M2FBNGh3R29veWc1RC9BMFQ5SlBVNnZjSkhBYlFKcFRWdkFwQVNT?=
 =?utf-8?B?YkVKVFpxbTlPN0lIOFJGTWozMTdld0RKd2lEdWs4aEJmck10SWFPNFAvQzNh?=
 =?utf-8?B?QjgxK0ZEUzExSWhtZDZZdk0xMzQ4U0lLN2pKQk9wOWRlRFYrYjR3NkNvS3dh?=
 =?utf-8?B?S09DaGgxMkt1aGpwRXF5d2JFTUZIT2dWRkdXcUxYUk5GaU9taDBQMEtFamYz?=
 =?utf-8?B?eHdkbTlGUzRFcnhCTklWaXpjaUNHUXZ1WUFUZENwRnVqUHgzekNPblNlMi9H?=
 =?utf-8?B?dkNlY0tveFVCelJySkJmYTh3WFFxRUYzYi91YkVabmpTOUpTY09OeXZ2TFJ3?=
 =?utf-8?B?NVg0WExLK1U2RlRSdXR3Tk5wcDY1WHZJR1VkR3dySU13UStqMjNtVy9yUFIy?=
 =?utf-8?B?alhDYWZpSEtKODhCLzZ1alQ4Vk9VbUMyTmRFTXE0bjZBc3dHUVBrbVJaWHMr?=
 =?utf-8?B?RkMxaEMwQ0d5ZTU1SG02cDcwdSs5OHRKK0djVkVhbzVqeUgra21SRWc4Vmk3?=
 =?utf-8?B?T2xCQzN4THFBdzFqWmFrQlpvY1VOK0VZaEdESTFkc1BwOFlSdWMvZWdoZmg4?=
 =?utf-8?B?V2VNNWIyOU05Y1hyMFY2QkkrU1BnWHFhK09wMmJoZHd6RVA2SXlxbWpSZTVN?=
 =?utf-8?B?aXBGdHhkaGFzNWM0REJYK2phVGZ2UmYxNzM2cmpRcEFvOUNvWFFXWUdYeklN?=
 =?utf-8?B?SlMzdmwxYjhJaXJMTnMrbnROYzlsWXFPaHpiU3g3cXlWajd1eHl0TEdNWTIv?=
 =?utf-8?B?NW80NitFZGdtVUsybldWb1VUcmZTTm5pS1A5dWxid0FLQThmSEpSRlRXRXFp?=
 =?utf-8?B?UzlEYTZEUEcwRGNwTFpDKzZxL09yMXdHbjNTNU5mNk9sNzZJcU4vQk5qUFlW?=
 =?utf-8?B?RHRkSDBQbHA1N1c5czVYM3pqZG5qK2gxNHVQbzI5L3RYRlJhZm4xODdxc1hx?=
 =?utf-8?B?Z2RJWWVLOUEwSVpvcERpSXVxLzUrMng4eGpXVGk4NGF3dFpmN1M1bTk0cERz?=
 =?utf-8?B?Ylovc0ROMyttT29sZmlCb0pqVENmN3N4OFFKOG0ydS9iRk9nT2lweEtncS83?=
 =?utf-8?Q?i3+zTRzA80pDxEkWvWd5pVQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ef2fa2e-1686-4fc7-8d5d-08d9a3a29554
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2523.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 17:01:33.6750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bne+bhXBM2aMXT0Xz1PDta1e7+sbgkJ0yqg6lxqB8JR2gMsfrYbwzT1fR3rKhf6fwyFi7EylVdcaQV29uNQNIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3243
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10163
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0 mlxscore=0
 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111090098
X-Proofpoint-ORIG-GUID: IxyTgAvsjxBFKNan9Si5EwyuTcSHtsy8
X-Proofpoint-GUID: IxyTgAvsjxBFKNan9Si5EwyuTcSHtsy8
Received-SPF: pass client-ip=205.220.165.32; envelope-from=annie.li@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-3.364, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "imammedo@redhat.com" <imammedo@redhat.com>, jusual@redhat.com,
 qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/2021 6:19 AM, Daniel P. Berrangé wrote:
> On Tue, Nov 09, 2021 at 04:40:10PM +0530, Ani Sinha wrote:
>> On Tue, Nov 9, 2021 at 3:23 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
>>> On Tue, Nov 09, 2021 at 12:41:39PM +0530, Ani Sinha wrote:
>>>> +gerd
>>>>
>>>> On Mon, 8 Nov 2021, Annie.li wrote:
>>>>
>>>>> Update:
>>>>>
>>>>> I've tested q35 guest w/o OVMF, the APCI PCI hot-plugging works well in q35
>>>>> guest. Seems this issue only happens in q35 guest w/ OVMF.
>>>>>
>>>>> Looks that there is already a bug filed against this hotplug issue in q35
>>>>> guest w/ OVMF,
>>>>>
>>>>> https://urldefense.com/v3/__https://bugzilla.redhat.com/show_bug.cgi?id=2004829__;!!ACWV5N9M2RV99hQ!bCogoVXfTRaTu03Bg6dQ8NrSINSha4iSSLuZJerOTVdIdWnu1msYwJ8E_c_jRg$
>>>>>
>>>>> In this bug, it is recommended to add "-global
>>>>> ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off \" on qemu command for 6.1.
>>>>> However, with this option for 6.1(PCIe native hotplug), there still are kinds
>>>>> of issues. For example, one of them is the deleted virtio_blk device still
>>>>> shows in the Device Manager in Windows q35 guest, the operation of re-scanning
>>>>> new hardware takes forever there. This means both PCIe native hotplug and ACPI
>>>>> hotplug all have issues in q35 guests.
>>>> This is sad.
>>>>
>>>>> Per comments in this bug, changes in both OVMF and QEMU are necessary to
>>>>> support ACPI hot plug in q35 guest. The fixes may likely be available in QEMU
>>>>> 6.2.0.
>>>> So we are in soft code freeze for 6.2:
>>>> https://urldefense.com/v3/__https://wiki.qemu.org/Planning/6.2__;!!ACWV5N9M2RV99hQ!bCogoVXfTRaTu03Bg6dQ8NrSINSha4iSSLuZJerOTVdIdWnu1msYwJ_pKO8AzA$
>>>>
>>>> I am curious about Gerd's comment #10:
>>>> "The 6.2 rebase should make hotplug work
>>>> again with the default configuration."
>>>>
>>>> Sadly I have not seen any public discussion on what we want to do
>>>> for the issues with acpi hotplug for bridges in q35.
>>> I've raised one of the problems a week ago and there's a promised
>>> fix
>>>
>>>   https://urldefense.com/v3/__https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg00558.html__;!!ACWV5N9M2RV99hQ!bCogoVXfTRaTu03Bg6dQ8NrSINSha4iSSLuZJerOTVdIdWnu1msYwJ-np8GcUA$
>> So https://urldefense.com/v3/__https://gitlab.com/qemu-project/qemu/-/issues/641__;!!ACWV5N9M2RV99hQ!bCogoVXfTRaTu03Bg6dQ8NrSINSha4iSSLuZJerOTVdIdWnu1msYwJ86xk2gtg$  is the same as
>> https://urldefense.com/v3/__https://bugzilla.redhat.com/show_bug.cgi?id=2006409__;!!ACWV5N9M2RV99hQ!bCogoVXfTRaTu03Bg6dQ8NrSINSha4iSSLuZJerOTVdIdWnu1msYwJ9crT9JKw$
>>
>> isn't it?
> Yes, one upstream, one downstream.

Thanks for the info.

So q35 guests with either OVMF or SeaBIOS have different ACPI hotplug 
issues in QEMU 6.1.

As Ani mentioned earlier, QEMU 6.2 is in soft code freeze.
Today(Nov 9) is the date of hard feature freeze.

I suppose this means the fix for the issue with SeaBIOS or the feature 
to cooperate
with the coming change in OVMF won't happen in 6.2?

Thanks

Annie

>
> Regards,
> Daniel

