Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2877F647F9E
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 09:55:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Z9s-0001FN-Kw; Fri, 09 Dec 2022 03:55:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1p3Z9o-0001EU-El; Fri, 09 Dec 2022 03:55:00 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1p3Z9l-0006Ea-0L; Fri, 09 Dec 2022 03:55:00 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B97ntMZ007791; Fri, 9 Dec 2022 08:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=OmZVoR3/NTKOBOSBGsLT62wAdAfP4w08qo+5yRQHrKY=;
 b=uFvKb6q6hlQlTrx60K8ZIZfjcaI2cZqxvWlGxRFv2BcBrs8GuByV1GRv2fgu0ubsX1N3
 btEg2dbsafGNwjn9WCuyyckMfo/ckaF2lGyw3fy86vdoLvurPNcV5sQcD/lpaqnXSgxt
 mfO2uxuguXdoFgZXaEwuoPGpe36TDHzuJG9QvZTAl3UxDXzEp5bm0HiNxwKseHGfeAD1
 opHomoeUBOTBEVLLdt/IAzJrJhYFV12omOwpuqmEfZVGtR24gkJKaz1Cs69TnPoeMk+2
 hz+8JCRELiFlqBKkpYf1aNqlgwZxgXLb6epl/XXGyZskmg1RHEe29sc72XQYgP4DFBBT lg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3mauduvk6q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 09 Dec 2022 08:54:34 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2B96w6md032704; Fri, 9 Dec 2022 08:54:33 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3maa7fj7sj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 09 Dec 2022 08:54:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UBMpXN+unEIS/iMrUhCzND75uRndX9ZqkfKqBBkJMSGZ6IenN2hnn+8vhNfrLBpne/j4vNLttNLUkd83D/h9jAFyK4KRe4CASfUMiIPbYVMMsLPF2Hu0zJqcI9qcW3g8jMaYSVB0Cs+as7XFdM+3s+VHLsQPNOYLLHvpqML8mIlCQV5sStKEWBHEb9U87u28JalyrGM8LF3FSC+wjqcOobfCsjmK2b3UJcE8hfZ79DMQxgl78oieaIHt13xXxlJsfrx4iIILeUv+N0tEG5IFsLwm3SnttQP5S1OApZ2xjaptYbDAy3Mr3sq6Tp+shd4Z7kEyQc6GjEO6O6Dt32KwoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OmZVoR3/NTKOBOSBGsLT62wAdAfP4w08qo+5yRQHrKY=;
 b=lRi/UcXvH7Ye7KvX1UQ0OTd8C8dw9ng7o87un6XCmlC2OLyw/s0fNYXqXXIxchsDBNBSBwpJ3Ug2mR8zB6oTLo2chsjls4qd15j2zVSQ9lc3D81bKs3scQKs7TLEO0tsLCguFQjBMHnPb2oo3W5lJ6Hlb+OLVXe/73W+OWVC+9jXH2Eeq9LfFDWtdSPsPu0M8UfnpuESQtG3aRdcEp4K9EuXohr5UygopJMP5iF1I+n86bzB3/2cZkZT8l3jmb7LwdDkIlWABP9xyo9o3aduU739ZBbopXecDrkbKk4yr4eE/y62F6GtbwepCzAAWcuGl0eOKYg2OHkW/LT2SxUoKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OmZVoR3/NTKOBOSBGsLT62wAdAfP4w08qo+5yRQHrKY=;
 b=fdZCtqLOBB3BZl2ObwDZ4iljFlvADmAaFH9mo5AfNyYdwwr1p7Vn9warR/qRQ1bPRIMPiETpq6Efpyv91j4uKn6Tuup+P3/rNr4inPgbfMrsI12BBmjpd5G5MEgME7uLJ+qM7Wv6nFZ5tk/D48tUwXwz6q/8abg6lV72bM4qghs=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by DM6PR10MB4121.namprd10.prod.outlook.com (2603:10b6:5:21d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.18; Fri, 9 Dec
 2022 08:54:31 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::4c84:639a:c88b:4c89]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::4c84:639a:c88b:4c89%9]) with mapi id 15.20.5880.018; Fri, 9 Dec 2022
 08:54:30 +0000
Content-Type: multipart/alternative;
 boundary="------------y90fkS94rDj2Ly37niRolDxF"
Message-ID: <3d3a1106-3a11-36e0-7446-96c338595198@oracle.com>
Date: Fri, 9 Dec 2022 03:54:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v15 1/6] qmp: add QMP command x-query-virtio
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, lvivier@redhat.com,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, mst@redhat.com,
 qemu_oss@crudebyte.com, kraxel@redhat.com, si-wei.liu@oracle.com,
 joao.m.martins@oracle.com, eblake@redhat.com, qemu-block@nongnu.org,
 david@redhat.com, arei.gonglei@huawei.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org,
 dgilbert@redhat.com, eric.auger@redhat.com, stefanha@redhat.com,
 boris.ostrovsky@oracle.com, kwolf@redhat.com,
 mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
References: <1660220684-24909-1-git-send-email-jonah.palmer@oracle.com>
 <1660220684-24909-2-git-send-email-jonah.palmer@oracle.com>
 <6c7189cd-b6dc-e954-f39e-b90ccb6e0361@linaro.org>
 <31d76035-3b8c-c9a1-4fd3-d3cc6af5f69c@oracle.com>
 <6c917ccc-c458-3545-de73-6f9aee132b45@linaro.org>
 <87bkolrfu6.fsf@pond.sub.org>
 <fa6b712c-f785-8fc6-27a7-47f1386d51e2@oracle.com>
 <875yenmjqg.fsf@pond.sub.org>
From: Jonah Palmer <jonah.palmer@oracle.com>
In-Reply-To: <875yenmjqg.fsf@pond.sub.org>
X-ClientProxiedBy: BLAPR03CA0178.namprd03.prod.outlook.com
 (2603:10b6:208:32f::32) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4664:EE_|DM6PR10MB4121:EE_
X-MS-Office365-Filtering-Correlation-Id: 47a8cbce-989f-4221-f57d-08dad9c2fc19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rqhfbQ0guKH28iuydfMHyTKfJK5BMmDpfu1t/yuETiRb648kxstrOrcQDNA22XEyeRxjGL50uiMxrFsat95KguFQyjpX5qDaHswrs/8w62Dm8Vmthb6m4fdOVow+rEaxPQnkyhjg91Dx/uT7gXwc4K12LEQzbteG5u/bYNy1WR5sjfblwvdbUF+4zO0rjtmY0aGy9oQIu18NjLt99vjNYQ8ZKLJOgkwZmLRuxTdKUk0ERqT8ZSJKzqqpkCF+uOESZdv5ai72szZKGYMXb6bk7EceHFDl7lCvaLd5sIs2rcjUg7MRL5xPIbjx0xYysaY5kLX4iBbelU4ZlWEN16cmHsn23yBqpIe6B2egh/alndMxIQIVEdg1tHBIumjx5rCYpbd9X97WJ40TKP+9bn2m/WDLKj24yXPCCX1cSKJSB9UCgHo5ju5PdyYHhiSRivjAoDc/gKvEKIrkHD5J5v/g9RiM4egvpYDvGGV+sm+8qcHEdOaxpeJqwY3BYKc0BwK3C233xt7O+hob2WzEZM4m3/ILUA1LUUNeycwFdxnIq1P/FewQH5kXkAjatTLBEV4j6yPQn8963c5bWtQie00H95INPY8i/GfaDHRv1Z7kTvm3clmh8jbXJP/PuBGDlo3xmpElcmGx4Vuue6tLtYumvUFmJL2pWO2RAQ3tj7orYsCzaXNISqhLCAQt/NJyWgqqswk6zTb6/fgmdFA9fcy3CitWO2hkyCiOqowotzGthmXslKFp0+HCVJE+8ugmGmIP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(136003)(346002)(376002)(39860400002)(396003)(451199015)(66476007)(31686004)(4326008)(66556008)(66946007)(38100700002)(66574015)(5660300002)(7416002)(30864003)(41300700001)(44832011)(83380400001)(8676002)(54906003)(316002)(2906002)(166002)(6916009)(6666004)(36756003)(2616005)(186003)(6512007)(26005)(478600001)(6486002)(53546011)(33964004)(8936002)(966005)(6506007)(31696002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bG5DUkl2UnZ0NDBmQm45d3ZUU08va1BBSFpadVM2R1hJTEp0WVNnR0Y5R2RW?=
 =?utf-8?B?c2xya2dNNDIyRzUxRWI0WEUyc045cERoc2xFTThYM0JCL2ZxVGRDamFhWStu?=
 =?utf-8?B?aUs4RFNwcHU1N291bEYyc1JTN0wvOFExcUF1L1ZaSUFUOFdRU0pXQ0RFL2Iy?=
 =?utf-8?B?T2dISzZ6V3FSQWhmNTBZWW92S0dtdFVJSFFFbnRnNytxQ1VLWDRkUDdESjQ1?=
 =?utf-8?B?djU1ZHVralV3aWFYT2UvRkxqTDh3Q2MxOXdLSXpkeGplZzlCb0JVc1cwait0?=
 =?utf-8?B?bXVQWWlhV1JMUmNUK0NnQUFKdTRQU3lUNnV6c2dvVUtYR1h2ZDErZVovMTJx?=
 =?utf-8?B?Y0pWR3RMQVo5UmQxai9vdUpveHRtM0U1ZWMvZ2g3UXBzNy9lRnMzN3NyalJu?=
 =?utf-8?B?ZHlDeVJxNThKWFhwbTJRVm9zYmhvNmVtN0VMUHdzR1Vvai9xYzkrZTc4blF2?=
 =?utf-8?B?MzZDSHViQVBjdGwwSlZ1ekJDcTFYN0RUelNQZTd2cGwwSW83UlFGWndGVVFs?=
 =?utf-8?B?TUVJTUpyTEovOFJDZWdiUGYyZjNhaU1JellWN2tselIxcmtla2x5eHQ0ZitL?=
 =?utf-8?B?SHNkVmhRaG9ndG41WU9weS9DcnozeCt1ajdOL3hJQkk3UDRCYmEyQlRPeW9o?=
 =?utf-8?B?aHNvSFI5UVB1NVJJb2NGYWFjVjgyRXhnSmc0TGpKdC9BMHBmTlpqbThKRVJu?=
 =?utf-8?B?SDhEVDh3K2VoN2xCWER2T010TDBDWHVDd2ZJbXhyZ1E4Vy9kbk9NQis4cXdi?=
 =?utf-8?B?TXoycTRNUlRrTzZZZlY0L3FnbGpBbGhHamxLanVFcVVYNEppNHM2dXcxZHhr?=
 =?utf-8?B?Mkc3bDk5bUkvUzJpcEswbVZBMko1UDBkSFhPS255bjNJWExLNlFkSzNmc0lM?=
 =?utf-8?B?U2NFd0oxMXFCNlhMYUdSSVkyaWJabDhXejJnWnI2RzBzYzJnYy9TMEZsQkxa?=
 =?utf-8?B?MHU5RUNOQXVxVm9VN3JPYzREeXYrS3VxKzVDQ0d0VUc3Ri9NMjh2YWttZWg0?=
 =?utf-8?B?b2JMd01SVTM2L0NwdGZlcDVUWU1QdjNhVUNrdTA3VWgyVmU5MFFFWkNPVTJO?=
 =?utf-8?B?TjlreFd6a3E0TVF0c25FQUdISUFURGN2ejV2dU9nZFNxdGliN2F0RndsUVMx?=
 =?utf-8?B?Nlltd2VXeTlMem44VVJjT2dhTURVdHV5NkxwUHdDNmJtY0ZmZDFhNms5OTVk?=
 =?utf-8?B?a3hQcWExV3NCdWs5d2VFbFlGdzdBZzAxSDd3QmwycGJ0UkV0MHZ4UUlFRlhZ?=
 =?utf-8?B?bnZNZ3kzbU1ZOEowdmhJUW5kOU15TThiQmYwdUtQcHhiNGR2STE0aUhuWWlK?=
 =?utf-8?B?WVZqQnFJVGQ4TmRNV3dpT2pZdEVQdkdTWnlDUDdSeVdHRmlabk54WlNoVjIx?=
 =?utf-8?B?SXp3R2NONVc2T1lmeXVuTW9BWm5DbW01czVjcm50aldnNFN6aUE0d3k3eHl1?=
 =?utf-8?B?NnlPRVdZMFZhdjF1TFRpbkwyYWhSZTJOZWVWbityTll0V3VuTkdTNlZSdXhy?=
 =?utf-8?B?L1lGWTV4cGtSbUJvdVNsNVoyQzE0dHJ4STV6MG9CaWcwT2MxSW9HdWg2Ukgz?=
 =?utf-8?B?U1hXbUw1MU5qc1lMckNMZnNyc3pkYkpaWTJIdXNZbHJxV0ZoTWpCbXRiUVhZ?=
 =?utf-8?B?SjJBa0FhUFZZUkVuWmx6NklSMGtXYUJUSTl5UHNsOUs4SkYvWUp6Q2l5WGpl?=
 =?utf-8?B?L1FJajVhczdOdHl5OHcyVGdPM3dsaVpGZzlwbVVJNmRLNGhJT2dGOEZXYTRh?=
 =?utf-8?B?eCtBZXhxWDIrWE1zTUIvY1lJd2c3bWc2cHpxdGhueDdXT1VzVlBEMWp5VHNV?=
 =?utf-8?B?TlRFQkZrTEc5VTM2enhSSEtZb2NzZHV2czJVTVhoR0ErRVlob1I5T1NQVEhl?=
 =?utf-8?B?LzdiWnpWbEQ4M1Y1M3J4Rm1TZkRDRjRYYUs5N0hYd2dRZ3VsRmFRY3hLQ3Ey?=
 =?utf-8?B?L2phK1Q3eUJnc0lKbk04VkIwWW9sMGUzcjhOeGtOZWloTURFek9BY2thRlFl?=
 =?utf-8?B?NlMvaDRkNW1jdS9mVmNyc1ZGY2Q3aGw5bXF0VVlkcHJlMHhBQjVUb0EzMEds?=
 =?utf-8?B?VzdsL1J4aHZPZHdYZzRXUFlOUUk4dXBQeFlmSTZ2a1lpUVhvcnBIeGtBaE54?=
 =?utf-8?Q?S2cOHKS46T4vwsrgyEvlU0IG2?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47a8cbce-989f-4221-f57d-08dad9c2fc19
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2022 08:54:30.6851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3+thYt3jOMa/7VpcMd1FFmicq/tNGCGKCku+K8sTA3tuAXb7V4uOqtfQsyjZ+sC4cdICXiaGSBSQzkI/1AVTVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4121
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-09_04,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212090066
X-Proofpoint-ORIG-GUID: X3nONv-yk5bxZ4qqcBwOTR47griDzqd5
X-Proofpoint-GUID: X3nONv-yk5bxZ4qqcBwOTR47griDzqd5
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.266, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--------------y90fkS94rDj2Ly37niRolDxF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/7/22 08:22, Markus Armbruster wrote:
> Jonah Palmer<jonah.palmer@oracle.com>  writes:
>
>> On 12/2/22 10:21, Markus Armbruster wrote:
>>> Philippe Mathieu-Daudé<philmd@linaro.org>   writes:
>>>
>>>> On 2/12/22 13:23, Jonah Palmer wrote:
>>>>> On 11/30/22 11:16, Philippe Mathieu-Daudé wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 11/8/22 14:24, Jonah Palmer wrote:
>>>>>>> From: Laurent Vivier<lvivier@redhat.com>
>>>>>>>
>>>>>>> This new command lists all the instances of VirtIODevices with
>>>>>>> their canonical QOM path and name.
>>>>>>>
>>>>>>> [Jonah: @virtio_list duplicates information that already exists in
>>>>>>>     the QOM composition tree. However, extracting necessary information
>>>>>>>     from this tree seems to be a bit convoluted.
>>>>>>>
>>>>>>>     Instead, we still create our own list of realized virtio devices
>>>>>>>     but use @qmp_qom_get with the device's canonical QOM path to confirm
>>>>>>>     that the device exists and is realized. If the device exists but
>>>>>>>     is actually not realized, then we remove it from our list (for
>>>>>>>     synchronicity to the QOM composition tree).
>>> How could this happen?
>>>
>>>>>>>     Also, the QMP command @x-query-virtio is redundant as @qom-list
>>>>>>>     and @qom-get are sufficient to search '/machine/' for realized
>>>>>>>     virtio devices. However, @x-query-virtio is much more convenient
>>>>>>>     in listing realized virtio devices.]
>>>>>>>
>>>>>>> Signed-off-by: Laurent Vivier<lvivier@redhat.com>
>>>>>>> Signed-off-by: Jonah Palmer<jonah.palmer@oracle.com>
>>>>>>> ---
>>>>>>>     hw/virtio/meson.build      |  2 ++
>>>>>>>     hw/virtio/virtio-stub.c    | 14 ++++++++
>>>>>>>     hw/virtio/virtio.c         | 44 ++++++++++++++++++++++++
>>>>>>>     include/hw/virtio/virtio.h |  1 +
>>>>>>>     qapi/meson.build           |  1 +
>>>>>>>     qapi/qapi-schema.json      |  1 +
>>>>>>>     qapi/virtio.json           | 68 ++++++++++++++++++++++++++++++++++++++
>>>>>>>     tests/qtest/qmp-cmd-test.c |  1 +
>>>>>>>     8 files changed, 132 insertions(+)
>>>>>>>     create mode 100644 hw/virtio/virtio-stub.c
>>>>>>>     create mode 100644 qapi/virtio.json
>>>>>>> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
>>>>>>> index 5d607aeaa0..bdfa82e9c0 100644
>>>>>>> --- a/hw/virtio/virtio.c
>>>>>>> +++ b/hw/virtio/virtio.c
>>>>>>> @@ -13,12 +13,18 @@
>>>>>>>       #include "qemu/osdep.h"
>>>>>>>     #include "qapi/error.h"
>>>>>>> +#include "qapi/qmp/qdict.h"
>>>>>>> +#include "qapi/qapi-commands-virtio.h"
>>>>>>> +#include "qapi/qapi-commands-qom.h"
>>>>>>> +#include "qapi/qapi-visit-virtio.h"
>>>>>>> +#include "qapi/qmp/qjson.h"
>>>>>>>     #include "cpu.h"
>>>>>>>     #include "trace.h"
>>>>>>>     #include "qemu/error-report.h"
>>>>>>>     #include "qemu/log.h"
>>>>>>>     #include "qemu/main-loop.h"
>>>>>>>     #include "qemu/module.h"
>>>>>>> +#include "qom/object_interfaces.h"
>>>>>>>     #include "hw/virtio/virtio.h"
>>>>>>>     #include "migration/qemu-file-types.h"
>>>>>>>     #include "qemu/atomic.h"
>>>>>>> @@ -29,6 +35,9 @@
>>>>>>>     #include "sysemu/runstate.h"
>>>>>>>     #include "standard-headers/linux/virtio_ids.h"
>>>>>>>     +/* QAPI list of realized VirtIODevices */
>>>>>>> +static QTAILQ_HEAD(, VirtIODevice) virtio_list;
>>>>>>> +
>>>>>>>     /*
>>>>>>>      * The alignment to use between consumer and producer parts of vring.
>>>>>>>      * x86 pagesize again. This is the default, used by transports like PCI
>>>>>>> @@ -3698,6 +3707,7 @@ static void virtio_device_realize(DeviceState *dev, Error **errp)
>>>>>>>         vdev->listener.commit = virtio_memory_listener_commit;
>>>>>>>         vdev->listener.name = "virtio";
>>>>>>>         memory_listener_register(&vdev->listener, vdev->dma_as);
>>>>>>> +    QTAILQ_INSERT_TAIL(&virtio_list, vdev, next);
>>>>>>>     }
>>>>>>>       static void virtio_device_unrealize(DeviceState *dev)
>>>>>>> @@ -3712,6 +3722,7 @@ static void virtio_device_unrealize(DeviceState *dev)
>>>>>>>             vdc->unrealize(dev);
>>>>>>>         }
>>>>>>>     +    QTAILQ_REMOVE(&virtio_list, vdev, next);
>>>>>>>         g_free(vdev->bus_name);
>>>>>>>         vdev->bus_name = NULL;
>>>>>>>     }
>>>>>>> @@ -3885,6 +3896,8 @@ static void virtio_device_class_init(ObjectClass *klass, void *data)
>>>>>>>         vdc->stop_ioeventfd = virtio_device_stop_ioeventfd_impl;
>>>>>>>           vdc->legacy_features |= VIRTIO_LEGACY_FEATURES;
>>>>>>> +
>>>>>>> +    QTAILQ_INIT(&virtio_list);
>>>>>>>     }
>>>>>>>       bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
>>>>>>> @@ -3895,6 +3908,37 @@ bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
>>>>>>>         return virtio_bus_ioeventfd_enabled(vbus);
>>>>>>>     }
>>>>>>>     +VirtioInfoList *qmp_x_query_virtio(Error **errp)
>>>>>>> +{
>>>>>>> +    VirtioInfoList *list = NULL;
>>>>>>> +    VirtioInfoList *node;
>>>>>>> +    VirtIODevice *vdev;
>>>>>>> +
>>>>>>> +    QTAILQ_FOREACH(vdev, &virtio_list, next) {
>>>>>>> +        DeviceState *dev = DEVICE(vdev);
>>>>>>> +        Error *err = NULL;
>>>>>>> +        QObject *obj = qmp_qom_get(dev->canonical_path, "realized", &err);
>>>>>>> +
>>>>>>> +        if (err == NULL) {
>>>>>>> +            GString *is_realized = qobject_to_json_pretty(obj, true);
>>>>>>> +            /* virtio device is NOT realized, remove it from list */
>>>>>> Why not check dev->realized instead of calling qmp_qom_get() & qobject_to_json_pretty()?
>>>>> This check queries the QOM composition tree to check that the device actually exists and is
>>>>> realized. In other words, we just want to confirm with the QOM composition tree for the device.
>>> Again, how could this happen?
>>>
>>> If @virtio_list isn't reliable, why have it in the first place?
>> Honestly, I'm not sure how this even could happen, since the @virtio_list is managed at the realization
>> and unrealization of a virtio device. Given this, I do feel as though the list is reliable, although
>> this might just benaïve of me to say. After giving this a second look, the @virtio_list is only really needed to provide a nice list of all realized virtio devices
>> on the system, along with their full canonical paths. If the user can find the canonical path of a virtio device by searching the QOM
>> composition tree, and assuming we can get a @VirtioDevice object (in code) from this canonical path, then the rest of the QMP/HMP features of
>> these patches could be done by solely by searching the QOM composition tree. However, I think having this list of realized virtio devices as a
>> subset of the QOM composition tree is worth its weight, since the user no longer has to search the entire tree to find virtio devices and piece
>> together their canonical paths. Of course, if we're somehow able to generate a similar list in code by searching the QOM composition tree,
>> then there would be no need for this @virtio_list. However, it's really not clear how, or if, such a list could be generated by parsing the QOM
>> composition tree.
> I'm not debating whether to have the command right now.  I'm debating
> the introduction of variable @virtio_list.  Please consider...
>
>>>>> This was done to have some kind of synchronicity between @virtio_list and the QOM composition
>>>>> tree, since the list duplicates information that already exists in the tree.
>>>>> This check was recommended in v10 and added in v11 of this patch series.
>>>> Thanks, I found Markus comments:
>>>>
>>>> v10:
>>>> https://urldefense.com/v3/__https://lore.kernel.org/qemu-devel/87ee6ogbiw.fsf@dusky.pond.sub.org/__;!!ACWV5N9M2RV99hQ!LqeLFhE8PtTTg_qKRuP9Kgz5pyTNZLhYeRzp4a2oS8c3D5W8-irZoBW0L_Lf1ozm3qYidYhuVrjxjsAw$   
> ... this:
>
>>> My recommendation there was to *delete* virtio_list and search the QOM
>>> composition tree instead:
>>>
>>>       @virtio_list duplicates information that exists in the QOM composition
>>>       tree.  It needs to stay in sync.  You could search the composition tree
>>>       instead.
>>>
>>> The QOM composition tree is the source of truth.
> Let me tell you a tale of two patches.
>
> One created a niche QMP command.  It also modified core infrastructure
> to keep additional state.  State that needed to be kept consistent with
> existing state forever.  Consistency was not entirely obvious.  The
> command examined this new state.  The examination was simple.
>
> The other one created a niche QMP command, and nothing more.  The
> command examined state without changing it.  The examination was
> less simple.
>
> One of the two patches had a much easier time in review.  Which one
> could it be...
>
> Please give the other approach a serious try.

Ah, okay. I see where you're getting at.

Sure, I can give this approach a try and see what I can do with it.
Just FYI, I wont be able to get to this right away until sometime early
next year.

Jonah

>
> [...]
>
--------------y90fkS94rDj2Ly37niRolDxF
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/7/22 08:22, Markus Armbruster
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:875yenmjqg.fsf@pond.sub.org">
      <pre class="moz-quote-pre" wrap="">Jonah Palmer <a class="moz-txt-link-rfc2396E" href="mailto:jonah.palmer@oracle.com">&lt;jonah.palmer@oracle.com&gt;</a> writes:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 12/2/22 10:21, Markus Armbruster wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Philippe Mathieu-Daudé<a class="moz-txt-link-rfc2396E" href="mailto:philmd@linaro.org">&lt;philmd@linaro.org&gt;</a>  writes:

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On 2/12/22 13:23, Jonah Palmer wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">On 11/30/22 11:16, Philippe Mathieu-Daudé wrote:
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">Hi,

On 11/8/22 14:24, Jonah Palmer wrote:
</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">From: Laurent Vivier<a class="moz-txt-link-rfc2396E" href="mailto:lvivier@redhat.com">&lt;lvivier@redhat.com&gt;</a>

This new command lists all the instances of VirtIODevices with
their canonical QOM path and name.

[Jonah: @virtio_list duplicates information that already exists in
 &nbsp; the QOM composition tree. However, extracting necessary information
 &nbsp; from this tree seems to be a bit convoluted.

 &nbsp; Instead, we still create our own list of realized virtio devices
 &nbsp; but use @qmp_qom_get with the device's canonical QOM path to confirm
 &nbsp; that the device exists and is realized. If the device exists but
 &nbsp; is actually not realized, then we remove it from our list (for
 &nbsp; synchronicity to the QOM composition tree).
</pre>
                </blockquote>
              </blockquote>
            </blockquote>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
How could this happen?

</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap=""> &nbsp; Also, the QMP command @x-query-virtio is redundant as @qom-list
 &nbsp; and @qom-get are sufficient to search '/machine/' for realized
 &nbsp; virtio devices. However, @x-query-virtio is much more convenient
 &nbsp; in listing realized virtio devices.]

Signed-off-by: Laurent Vivier<a class="moz-txt-link-rfc2396E" href="mailto:lvivier@redhat.com">&lt;lvivier@redhat.com&gt;</a>
Signed-off-by: Jonah Palmer<a class="moz-txt-link-rfc2396E" href="mailto:jonah.palmer@oracle.com">&lt;jonah.palmer@oracle.com&gt;</a>
---
 &nbsp; hw/virtio/meson.build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 ++
 &nbsp; hw/virtio/virtio-stub.c&nbsp;&nbsp;&nbsp; | 14 ++++++++
 &nbsp; hw/virtio/virtio.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 44 ++++++++++++++++++++++++
 &nbsp; include/hw/virtio/virtio.h |&nbsp; 1 +
 &nbsp; qapi/meson.build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +
 &nbsp; qapi/qapi-schema.json&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +
 &nbsp; qapi/virtio.json&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 68 ++++++++++++++++++++++++++++++++++++++
 &nbsp; tests/qtest/qmp-cmd-test.c |&nbsp; 1 +
 &nbsp; 8 files changed, 132 insertions(+)
 &nbsp; create mode 100644 hw/virtio/virtio-stub.c
 &nbsp; create mode 100644 qapi/virtio.json
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 5d607aeaa0..bdfa82e9c0 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -13,12 +13,18 @@
 &nbsp; &nbsp; #include &quot;qemu/osdep.h&quot;
 &nbsp; #include &quot;qapi/error.h&quot;
+#include &quot;qapi/qmp/qdict.h&quot;
+#include &quot;qapi/qapi-commands-virtio.h&quot;
+#include &quot;qapi/qapi-commands-qom.h&quot;
+#include &quot;qapi/qapi-visit-virtio.h&quot;
+#include &quot;qapi/qmp/qjson.h&quot;
 &nbsp; #include &quot;cpu.h&quot;
 &nbsp; #include &quot;trace.h&quot;
 &nbsp; #include &quot;qemu/error-report.h&quot;
 &nbsp; #include &quot;qemu/log.h&quot;
 &nbsp; #include &quot;qemu/main-loop.h&quot;
 &nbsp; #include &quot;qemu/module.h&quot;
+#include &quot;qom/object_interfaces.h&quot;
 &nbsp; #include &quot;hw/virtio/virtio.h&quot;
 &nbsp; #include &quot;migration/qemu-file-types.h&quot;
 &nbsp; #include &quot;qemu/atomic.h&quot;
@@ -29,6 +35,9 @@
 &nbsp; #include &quot;sysemu/runstate.h&quot;
 &nbsp; #include &quot;standard-headers/linux/virtio_ids.h&quot;
 &nbsp; +/* QAPI list of realized VirtIODevices */
+static QTAILQ_HEAD(, VirtIODevice) virtio_list;
+
 &nbsp; /*
 &nbsp;&nbsp; * The alignment to use between consumer and producer parts of vring.
 &nbsp;&nbsp; * x86 pagesize again. This is the default, used by transports like PCI
@@ -3698,6 +3707,7 @@ static void virtio_device_realize(DeviceState *dev, Error **errp)
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vdev-&gt;listener.commit = virtio_memory_listener_commit;
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vdev-&gt;listener.name = &quot;virtio&quot;;
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memory_listener_register(&amp;vdev-&gt;listener, vdev-&gt;dma_as);
+&nbsp;&nbsp;&nbsp; QTAILQ_INSERT_TAIL(&amp;virtio_list, vdev, next);
 &nbsp; }
 &nbsp; &nbsp; static void virtio_device_unrealize(DeviceState *dev)
@@ -3712,6 +3722,7 @@ static void virtio_device_unrealize(DeviceState *dev)
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vdc-&gt;unrealize(dev);
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
 &nbsp; +&nbsp;&nbsp;&nbsp; QTAILQ_REMOVE(&amp;virtio_list, vdev, next);
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_free(vdev-&gt;bus_name);
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vdev-&gt;bus_name = NULL;
 &nbsp; }
@@ -3885,6 +3896,8 @@ static void virtio_device_class_init(ObjectClass *klass, void *data)
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vdc-&gt;stop_ioeventfd = virtio_device_stop_ioeventfd_impl;
 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vdc-&gt;legacy_features |= VIRTIO_LEGACY_FEATURES;
+
+&nbsp;&nbsp;&nbsp; QTAILQ_INIT(&amp;virtio_list);
 &nbsp; }
 &nbsp; &nbsp; bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
@@ -3895,6 +3908,37 @@ bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return virtio_bus_ioeventfd_enabled(vbus);
 &nbsp; }
 &nbsp; +VirtioInfoList *qmp_x_query_virtio(Error **errp)
+{
+&nbsp;&nbsp;&nbsp; VirtioInfoList *list = NULL;
+&nbsp;&nbsp;&nbsp; VirtioInfoList *node;
+&nbsp;&nbsp;&nbsp; VirtIODevice *vdev;
+
+&nbsp;&nbsp;&nbsp; QTAILQ_FOREACH(vdev, &amp;virtio_list, next) {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DeviceState *dev = DEVICE(vdev);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Error *err = NULL;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; QObject *obj = qmp_qom_get(dev-&gt;canonical_path, &quot;realized&quot;, &amp;err);
+
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (err == NULL) {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GString *is_realized = qobject_to_json_pretty(obj, true);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* virtio device is NOT realized, remove it from list */
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">
Why not check dev-&gt;realized instead of calling qmp_qom_get() &amp; qobject_to_json_pretty()?
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">
This check queries the QOM composition tree to check that the device actually exists and is
realized. In other words, we just want to confirm with the QOM composition tree for the device.
</pre>
            </blockquote>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Again, how could this happen?

If @virtio_list isn't reliable, why have it in the first place?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Honestly, I'm not sure how this even could happen, since the @virtio_list is managed at the realization
and unrealization of a virtio device. Given this, I do feel as though the list is reliable, although
this might just benaïve of me to say. After giving this a second look, the @virtio_list is only really needed to provide a nice list of all realized virtio devices 
on the system, along with their full canonical paths. If the user can find the canonical path of a virtio device by searching the QOM 
composition tree, and assuming we can get a @VirtioDevice object (in code) from this canonical path, then the rest of the QMP/HMP features of 
these patches could be done by solely by searching the QOM composition tree. However, I think having this list of realized virtio devices as a 
subset of the QOM composition tree is worth its weight, since the user no longer has to search the entire tree to find virtio devices and piece 
together their canonical paths. Of course, if we're somehow able to generate a similar list in code by searching the QOM composition tree, 
then there would be no need for this @virtio_list. However, it's really not clear how, or if, such a list could be generated by parsing the QOM 
composition tree.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I'm not debating whether to have the command right now.  I'm debating
the introduction of variable @virtio_list.  Please consider...

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">This was done to have some kind of synchronicity between @virtio_list and the QOM composition
tree, since the list duplicates information that already exists in the tree.
This check was recommended in v10 and added in v11 of this patch series.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">
Thanks, I found Markus comments:

v10:
<a class="moz-txt-link-freetext" href="https://urldefense.com/v3/__https://lore.kernel.org/qemu-devel/87ee6ogbiw.fsf@dusky.pond.sub.org/__;!!ACWV5N9M2RV99hQ!LqeLFhE8PtTTg_qKRuP9Kgz5pyTNZLhYeRzp4a2oS8c3D5W8-irZoBW0L_Lf1ozm3qYidYhuVrjxjsAw$">https://urldefense.com/v3/__https://lore.kernel.org/qemu-devel/87ee6ogbiw.fsf@dusky.pond.sub.org/__;!!ACWV5N9M2RV99hQ!LqeLFhE8PtTTg_qKRuP9Kgz5pyTNZLhYeRzp4a2oS8c3D5W8-irZoBW0L_Lf1ozm3qYidYhuVrjxjsAw$</a>  
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
... this:

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">My recommendation there was to *delete* virtio_list and search the QOM
composition tree instead:

     @virtio_list duplicates information that exists in the QOM composition
     tree.  It needs to stay in sync.  You could search the composition tree
     instead.

The QOM composition tree is the source of truth.
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Let me tell you a tale of two patches.

One created a niche QMP command.  It also modified core infrastructure
to keep additional state.  State that needed to be kept consistent with
existing state forever.  Consistency was not entirely obvious.  The
command examined this new state.  The examination was simple.

The other one created a niche QMP command, and nothing more.  The
command examined state without changing it.  The examination was
less simple.

One of the two patches had a much easier time in review.  Which one
could it be...

Please give the other approach a serious try.</pre>
    </blockquote>
    <pre>Ah, okay. I see where you're getting at.

Sure, I can give this approach a try and see what I can do with it.
Just FYI, I wont be able to get to this right away until sometime early
next year.

Jonah
</pre>
    <blockquote type="cite" cite="mid:875yenmjqg.fsf@pond.sub.org">
      <pre class="moz-quote-pre" wrap="">

[...]

</pre>
    </blockquote>
  </body>
</html>

--------------y90fkS94rDj2Ly37niRolDxF--

