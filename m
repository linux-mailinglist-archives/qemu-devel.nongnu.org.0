Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9809463B67
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 17:13:33 +0100 (CET)
Received: from localhost ([::1]:52254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms5l6-0008MI-JG
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 11:13:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1ms5k2-0007g4-KW
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 11:12:26 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:60234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1ms5k0-0000WC-98
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 11:12:26 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AUG41Zu012147; 
 Tue, 30 Nov 2021 16:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=rxeYS39AxI3Qph2TtZS1fwT67gHk2r04pVe9j18oqKc=;
 b=jvFRhIfWwHogg3os1l69U1h92dY0JJSpyd0LW9hKB/NaHokkPJmNb9+8QCFBUPQ3erou
 OVajoO7xDky0KIor3slNbc7+ruXIH320KKYPnNFmGVuBREdfSpBUbLKfh8PZpsT6LwHa
 6kkuoEIT+Swh3orJ3SEJaS+VfiCELJhIg3TNn+S9cBxxgZ/tfC79KUCFEDOl0Px7s3jN
 rdw/kVa15jvzLDgaJ81Zg8y0totsraB5PPb/VlHvxDuHHNAnph6aumt+i5fZrwLr5TWb
 qYSXKcwmTXXXur6PbS+/nXH6b6MSAy5uU/ks61F5W4zbkwgQ0gdTITx3hlB6s9LclDIn wg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cmu1whpqq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Nov 2021 16:12:05 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AUG1ehN114609;
 Tue, 30 Nov 2021 16:12:01 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by aserp3030.oracle.com with ESMTP id 3ckaqevu18-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Nov 2021 16:12:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bWLR3C1zZdQlCXzdfQbIMf6zTAp5f+odz6AVb0bzrGczu/bdBtEh4h/58ettPKiP1cd7YTw675lI8lc7KBN0WJ1AxL85obSzu1ZUniG7ZB1YRQUE7s1kdvKZQYsRepAinWyojih6GE0ROVeh+IRd/xWL7eOT+uc8ScihzVv9EPcuI1nsT7V8rJBYLf455ODJcZ5NiL3Hux8ZBQuR85rFQbGU8hOtR+EL/KMxzvOFz8HV51kZKs+iN+zEVTrkL+BiY8o8CUcfUb8gRKq8kENclnfhB1Z18mSpsdHEjonNIrKhue01N7Ra4sfa0QYX8Iq//UyKxXtCxIokEeBPFgpoAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxeYS39AxI3Qph2TtZS1fwT67gHk2r04pVe9j18oqKc=;
 b=gPXwAKzyIlxPrsG5mNDj6027ZdenEgRuCi5XSJFqY4h9j5hGRk6awMx55e31DtO+SZ2urW8Y2ovnsOj1nGcmfPF2U0/G7Et/a0D2e4+eP/vffuQKQ7egbKzud+VOZtOqoBmSibcH5SaD2jut3nYpZEHLTpQlpMhorqeabsIEMgwaqmPRdEUjwD3dQ/JgZyFFyBJAa/Qf6z0lw4ZBmWcC9dbGo/5mGCPudjyctE8KqzpxkqE4ydkUWXbSwn0Ux+aDlRGWMloUnUQruVYOIKHez6bYpqZsC6UrLRR1ykbsMaOIp3Kn7NM+OPATdGvGhCVC2+zfvTdurF9DiOt2NSBDdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxeYS39AxI3Qph2TtZS1fwT67gHk2r04pVe9j18oqKc=;
 b=HxpxjHnQ4p4wVml21c1doKH4ql2yXDwlDkth4uu21BIB3RaJ4XjseDQyhhi1EgaOwNTT+zVgOxgIlwuMLNUJsa9GHrpLAqlcduhaH/vY+tlruU6lgBJ55uBgrhjYntwH8OaWQrzNNwCDhqveieJLaMtyKzG+KeTkAuxxmSkTNzg=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4195.namprd10.prod.outlook.com (2603:10b6:a03:201::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Tue, 30 Nov
 2021 16:11:59 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::b8d3:402a:4d8:139e]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::b8d3:402a:4d8:139e%3]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 16:11:59 +0000
Message-ID: <59e9f793-667d-5fe1-bccf-9afef791a00e@oracle.com>
Date: Tue, 30 Nov 2021 11:11:55 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH V6 19/27] vfio-pci: cpr part 1 (fd and dma)
Content-Language: en-US
To: Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>
References: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
 <1628286241-217457-20-git-send-email-steven.sistare@oracle.com>
 <20210810110608.480af93b.alex.williamson@redhat.com>
 <803a8bee-ec82-a41b-38ad-57d7ef572019@huawei.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <803a8bee-ec82-a41b-38ad-57d7ef572019@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0085.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::26) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
Received: from [10.39.225.242] (138.3.201.50) by
 BYAPR07CA0085.namprd07.prod.outlook.com (2603:10b6:a03:12b::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Tue, 30 Nov 2021 16:11:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7be82e7b-e36a-4a85-b7f1-08d9b41c230e
X-MS-TrafficTypeDiagnostic: BY5PR10MB4195:
X-Microsoft-Antispam-PRVS: <BY5PR10MB41955F92EAEDA266A50B306FF9679@BY5PR10MB4195.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MDvM5mbT2+y7H8xxBH3zjXwzVV/1VTTM3vvQQvKos9bpKTYk5pGySHFcvV3YdKyThGJ/1KVziCJzW0p1q8jAbOQ7pGSKf+OwgvohvmaF5g8uNZdY3OxGq6hVEy9Hehu724BKX0uQEfFN2JxeLI+dcpCMAXzGx9NWXu79AmDNCXSqe7FPavMLYEsPF4U/MRMq5fkVqrKWG1XhqhOZy19d6CuryswCphahlOX6PpWrmFueGQk7i7yJrH/QCFjBtnPPRYBUrAv31o/309XDXid7XZXgpti3R+v8aHgkYOthp2D/zGFqtIrnx74huI8oBUbl/VCZzUBXpEBtd/NJCYSXkIC9eWYGwyYDTCjJo0xnXQV3psYktbYXvCYulxAkoU2FjaSn1riNA9YgDmZHgk59obBK74Hm1Hx41z01ElYcE0t77+EbI5yQIu0Nfjpt9yDP2q110Zw0rBR/+RHkuelkT4/vU8XyRm2IuotnywxWGcPUL9TsrP9s4gYwjb3OYEpMoOAugGBvukYe5l2Vic7wuXTxAmosYAK/imB6kOHW9mlR2qfOHoLkXaV8xOmDMj/tNT6Te8E0c3cboNTVFKXSyWMpuCk0MBuZrvkRAt67sTTulYn8cQgB+CgQn42Egwqjv7pWkPAPdxI/j8b9nSKYTXcbXv/0/3kVj1+6yN7Tb1/fRfHrO0gJMjO6lJ82PGw5p2iPVK6krZusspc6l25KXOHYkRypNImN/Rm2DS1dP38=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(44832011)(16576012)(31686004)(5660300002)(86362001)(186003)(2616005)(956004)(54906003)(4326008)(110136005)(38100700002)(66556008)(83380400001)(66476007)(53546011)(8936002)(2906002)(6486002)(66946007)(508600001)(7416002)(8676002)(36756003)(36916002)(31696002)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVRvb0dvZmZ2NXFMR3FtYUZ3ODg0SUVYQ01xL2FOMmpIbWxIUEVWVUZoQmRP?=
 =?utf-8?B?ZlYrNGppSW1PZ0FBdk50WjN6SlVLejJVMHVQWThraVU0RytWYlVKc3B1TFhJ?=
 =?utf-8?B?Z3J5Q2lJaXV5cDBua2gzemhhQUxDelhnNlcxek5XSVR3clNKLzcyaTZpdUtX?=
 =?utf-8?B?bFplTEgxY0p3TjRBLzlRdzBab2NyZU1YOTg1RDBkVS9GOXd5UFhyN2ZvYnZ4?=
 =?utf-8?B?YmgwNEh4V3doWmhHUjB2TExVWFIxK0drK2IvK3BWRTducmxpcFVJaEV4NFZ6?=
 =?utf-8?B?cU5RU3JpUUNXUkJocWI4b090SmYyVDhaQjhSSXRBY1V2cVhodXhsS2F0RXRz?=
 =?utf-8?B?dm11QzVLcUllOHRRM2hMY00zZVNGOU0yUXExV1VwYlFXZ0tpY2FOVFBQSVdI?=
 =?utf-8?B?dWI1Q1AxOVoxRXNOekJWQXpUL0dPTGhpQnNQL2ErVmNkMDY1Tms3NkdCbElH?=
 =?utf-8?B?TGJPVHZEaVRIR1B1KzJsTzdpd1NKNG82WUJQWllwcHZGQjduelBBUmhyUitK?=
 =?utf-8?B?eUhkaDZQc1h5bWlvZFR1ejhLUlE4WlNlZTJMdzE0ejhWWjJRTDI4RmJCZDgw?=
 =?utf-8?B?eUd3cFdvdHpGZ0p6NTA4aW8wRmxnK29ibHBydmZCT0c3QStjSVZ1Z1YzZVBF?=
 =?utf-8?B?RHpoeTRZL0ZXTlc4TERSUy9pczBUdm84aFpkOWMyS2FwYkdNT2l5UW9tV2I2?=
 =?utf-8?B?RUlia2hmRTBVL1dyZ1EyekxyUGdlcndMWWtpbE4vWW9kVGZZMzJPVDVLODNi?=
 =?utf-8?B?N0FoM01SY1cvMEZHS0s0ZnRMOVh6RDdBR2E1dTVIYlFtZWNuTDZJeWYzWGd4?=
 =?utf-8?B?QW5DbXk4cW4rT0UzVWl5TmZvZENJZXpvTnRBTm50aTg3cTBvY0w3OTRQb0Nx?=
 =?utf-8?B?VUdMWGp2RlNJbU9BNXhLelI4aUZRK0Vyd08ra0loUjlPdEQraExHNG9GcU53?=
 =?utf-8?B?MERwMG9VaVFNcFVYbFlpVGM3VlBLZDE1UjY3ZVRLS2JhaUwzRGxlbHl4ZjFM?=
 =?utf-8?B?L2hZbHQyTXVRQTlHNVdlSjMrK2VERGgwMjQrMkRCeHRIR0taeHY5T1BFYVNr?=
 =?utf-8?B?a2w0V3puTnNQbUlrVXN3NU9EMVl2dGttNkVYWGE4OTVXTUdMYytFR0pKWWho?=
 =?utf-8?B?VkZZYXBicUJxbUJOdVluemZ1QlZZZ2pWNE95MnIySmZsRUl6SnJDNEp6akpQ?=
 =?utf-8?B?QTlqVnZyS2V1dG50WDk4akNaUEpZY2g5RUJYODNEVS9JWm0zWFJCa040REJm?=
 =?utf-8?B?c2R5UTFIVERhZXFoN1Rpd1IzOW52NGxHZGttQlh4b3Bmc2VXdDZuakZDMnVW?=
 =?utf-8?B?aGtsa2lVNXVNWlNCUENvMnF3OEx0dVJkZnBDbk83ekhKazlBSTlIODVvZmwx?=
 =?utf-8?B?WmtDU2ppbm40QWU2NGkyNmdBRnJRQkNtMlNXYmtTY21wLzZ3MXd0RElIMk5m?=
 =?utf-8?B?U2RyOGZFN0JFWDN3S0xHa0JUbmFyUVV2UC9FUU8zeGpjS01aRWFmT0NZZlRq?=
 =?utf-8?B?YVd1M0ZHZk9Zd3BQTXptd3dOV29MNkFtckZxZzFiSWZKVW9jb0VKUlJVWFc5?=
 =?utf-8?B?ZlE1SWlnOFJoSlpkN1FhWXZPdktmRGFaSVhUYmFhSG1GWGRTcUJ4MXBrL1RN?=
 =?utf-8?B?S0lwZzR3Vlp0S2UzRzVDVVh0S2N4SjRzdTNkUVd2dEpsWjRTK2lIQXRuRXZT?=
 =?utf-8?B?cmhsWGFjZWs2SGd6dS9Pbm01aENRdGUrcTA0SDVFZHRXSGd5QitIWWdHNHlD?=
 =?utf-8?B?N0thTDc3OGlUWlpsdmszODl5SzdMOU5jQXMyK0M1Y1V2cGtzOEs0QnRFak9y?=
 =?utf-8?B?cmxPVDdabHR4SVBLcm5QekZIeWsxMkRRRmlYN1N4UFFzd2dFRGY1UFRzTXV3?=
 =?utf-8?B?ZkpqWlF2RStVYUdUMVd4R284ZU5UMkNFbWk5ckw1N25IWFYyYXhCYnVqcytl?=
 =?utf-8?B?T0JtUEkwemkrTmdNTUNWQUg1b1VyU2oxb05zNW1YZ3NUL3cvS0ZFTFEwM29R?=
 =?utf-8?B?VHBPQndxczArdW5VVjlwbHpvSjlaNDJXUGJydnloTlFSTWFpUjgzVFIxTGM3?=
 =?utf-8?B?ZWhJb3kwaUhpd3l0OTFZSEFxOGk3VHE5NDJ2QS9iU1lGWXppWW1vcVNIVlNm?=
 =?utf-8?B?YlkwMGR3UzdGMkcrOE1nelBwSytWRnlUUVZEVDdaT0RZSktKVm1VSkVOdmNH?=
 =?utf-8?B?YXFjWXVQM2Z3L3JLWnZudmIyOXpYYkRTWFp3dTZjMGtSc3Bnb2dPbXNMTlBF?=
 =?utf-8?B?bFY2TFdhMFJlWDFzVStvb3U1cU93PT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7be82e7b-e36a-4a85-b7f1-08d9b41c230e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 16:11:59.2785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4p2moV2BE/GY8tkbqzu/1FigWYHonA/HXz1Jzvik7j80QrgPoPENb2mAtJ390UWQejPKLKShFo4vmthwedpBG4qbkXNKJUn/+IClAWJBc+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4195
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10183
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111300084
X-Proofpoint-GUID: t0jXsBm25jvLOHy5QVoyZpipbhMm2oGN
X-Proofpoint-ORIG-GUID: t0jXsBm25jvLOHy5QVoyZpipbhMm2oGN
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.211, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Xiexiangyou <xiexiangyou@huawei.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/2021 2:48 AM, Zheng Chuan wrote:
> 
> Hi, steve
> 
> On 2021/8/11 1:06, Alex Williamson wrote:
>> On Fri,  6 Aug 2021 14:43:53 -0700
>> Steve Sistare <steven.sistare@oracle.com> wrote:
>> [...]
>>> +static int
>>> +vfio_region_remap(MemoryRegionSection *section, void *handle, Error **errp)
>>> +{
>>> +    MemoryRegion *mr = section->mr;
>>> +    VFIOContainer *container = handle;
>>> +    const char *name = memory_region_name(mr);
>>> +    ram_addr_t size = int128_get64(section->size);
>>> +    hwaddr offset, iova, roundup;
>>> +    void *vaddr;
>>> +
>>> +    if (vfio_listener_skipped_section(section) || memory_region_is_iommu(mr)) {
>>> +        return 0;
>>> +    }
>>> +
>>> +    offset = section->offset_within_address_space;
>>> +    iova = REAL_HOST_PAGE_ALIGN(offset);
> We should not do remap if it shares on host page with other structures.
> I think a judgement like int128_ge((int128_make64(iova), llend)) in vfio_listener_region_add() should be also added here to check it,
> otherwise it will remap no-exit dma which causes the live update failure.
> diff --git a/hw/vfio/cpr.c b/hw/vfio/cpr.c
> index 0981d31..d231841 100644
> --- a/hw/vfio/cpr.c
> +++ b/hw/vfio/cpr.c
> @@ -58,13 +58,21 @@ vfio_region_remap(MemoryRegionSection *section, void *handle, Error **errp)
>      ram_addr_t size = int128_get64(section->size);
>      hwaddr offset, iova, roundup;
>      void *vaddr;
> -
> +    Int128 llend;
> +
>      if (vfio_listener_skipped_section(section) || memory_region_is_iommu(mr)) {
>          return 0;
>      }
> 
>      offset = section->offset_within_address_space;
>      iova = REAL_HOST_PAGE_ALIGN(offset);
> +    llend = int128_make64(section->offset_within_address_space);
> +    llend = int128_add(llend, section->size);
> +    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask));
> +    if (int128_ge(int128_make64(iova), llend)) {
> +        return 0;
> +    }
> +
>      roundup = iova - offset;
>      size -= roundup;
>      size = REAL_HOST_PAGE_ALIGN(size);
> 
>>> +    roundup = iova - offset;
>>> +    size -= roundup;
>>> +    size = REAL_HOST_PAGE_ALIGN(size);
>>> +    vaddr = memory_region_get_ram_ptr(mr) +
>>> +            section->offset_within_region + roundup;
>>> +
>>> +    trace_vfio_region_remap(name, container->fd, iova, iova + size - 1, vaddr);
>>> +    return vfio_dma_map_vaddr(container, iova, size, vaddr, errp);
>>> +}

Thank you Zheng.  I intended to implement the logic you suggest, using 64-bit arithmetic,
but I botched it.  This should do the trick:

diff --git a/hw/vfio/cpr.c b/hw/vfio/cpr.c
index df334d9..bbdeaea 100644
--- a/hw/vfio/cpr.c
+++ b/hw/vfio/cpr.c
@@ -66,8 +66,8 @@ vfio_region_remap(MemoryRegionSection *section, void *handle,
     offset = section->offset_within_address_space;
     iova = REAL_HOST_PAGE_ALIGN(offset);
     roundup = iova - offset;
-    size -= roundup;
-    size = REAL_HOST_PAGE_ALIGN(size);
+    size -= roundup;                    /* adjust for starting alignment */
+    size &= qemu_real_host_page_mask;   /* adjust for ending alignment */
     end = iova + size;
     if (iova >= end) {
         return 0;

- Steve

