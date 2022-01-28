Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 270364A0016
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 19:29:15 +0100 (CET)
Received: from localhost ([::1]:57054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDVzl-0005ON-R6
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 13:29:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nDVpm-0003zz-KY
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:18:54 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:26632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nDVpf-00073o-VW
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:18:53 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20SGBgF8032646; 
 Fri, 28 Jan 2022 18:18:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=XDToepGdV1XlHGO3u4jK1eqRgbsHTdrCPiaK3Bfbx18=;
 b=E6E2cLY8HgPSASPmwgiBLBnuvQOTjRb/TILnU0/Pl2iXBz/sNVrKoAoH3Y1vGwuoyGz1
 IOKfAYbJKh7crXAGCctSKhaYKaebGIzKpcrqEIKT5yo9d3KWmz70ztoqdr1suR3R0278
 LXg+PL1Ln3EdC7+7PfVDjTm7hORw6glzPaVINxT4NCXBoK5qWSXEhWqnU3Z2qZduVkgM
 s4t/z5WbBz6j6aL0LRUIiK2ph0bx8C5Yx7areg2YwekJmeCxtcIu/H7XybzidYrA4fMf
 4CleSPKbwVn6Ddjr986ucWqcfBzCZvXV4DRIQI1FY5N0rJ7KblrI/kzJORg3GOMIPocS lw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3duwrxm3v8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 18:18:27 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20SHVRYV137819;
 Fri, 28 Jan 2022 18:18:25 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2049.outbound.protection.outlook.com [104.47.73.49])
 by aserp3030.oracle.com with ESMTP id 3dr7yp8tst-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 18:18:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YOz3JGHeyXslCImlYdEqvRuLdA/21rtEw/HSX3WEiMbPFf0UluE7vZjxxZjX26zLa5DPbfJPw/S/2cY43lDgOtt/wM3aM71h2Crvg06fkvN/qoSExq+/XOlFPnQlIbDoh7U/d8BoDYnpzwuYhQ+MvUlxfVzPosBerta1AFv0kTqP02aXGPUHeFhrBjN2Jb2dBCtfPHpPnInpqdyw2UEaQMsxOmCCyFGTQLj11iN3pgI/RPRi0XnXQtCOYBKJpo4VNHKsP1y4oMyZO02o3pstzB17opGwPhYynWtu3Tt3p/V9t/yaoTtBuPwpfzKSJM6kHmLKlVDFnF3mqJa6c6Vj+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XDToepGdV1XlHGO3u4jK1eqRgbsHTdrCPiaK3Bfbx18=;
 b=PaaG7Ng5eUgj/TmYQf+cUfBn78orR9J2KjV0Ketg+kvhy4HNSeZx08MqP0znqzm7S1785Iy/mvVtW8DLgtnb1apQ5DZRlTYGFiLKAXymXC3WbJmijCc+hkc6d39zj8DiV4UEpm81+Lngq/h99V84C771nXFBhWG2Qhx65AAqt336ORdwrbNZuGcFhfluNc0++qPelqAoxH1G1K1Ty3UwhlHbB+U5mpHCYRMRf+sx4iU2bLJCBf1Pye1ox40qGfBTm+wblNHhe++MKNNJwpm257J+478LQjPHXO3DaqK99vLnokHWr6I8jX6Kv8w/tzPruouSlHx/k/jPdYRJbTOVMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDToepGdV1XlHGO3u4jK1eqRgbsHTdrCPiaK3Bfbx18=;
 b=kc2Azb/Mbxd7pDQdqi+LovZKZ1yu+Kn8itZg7g8k38iJaGOnMjfwxAnd7Ul5Q5Xhos5HSG5Sipa2KmDyNEllw9zXsLWqJZGwlRpzyFramBOxkw5q1SEh2qgP231fCquFvDiBxsuZO+LY4Nc1+zA1KawfOuinljb5b2pzYfitiRM=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by DM6PR10MB3802.namprd10.prod.outlook.com (2603:10b6:5:1f9::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Fri, 28 Jan
 2022 18:18:23 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c%4]) with mapi id 15.20.4930.019; Fri, 28 Jan 2022
 18:18:23 +0000
Message-ID: <5cef900d-950e-9dd9-0fe5-a88bb6a9ad9c@oracle.com>
Date: Fri, 28 Jan 2022 12:18:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v14 06/10] ACPI ERST: build the ACPI ERST table
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>
References: <1643214514-2839-1-git-send-email-eric.devolder@oracle.com>
 <1643214514-2839-7-git-send-email-eric.devolder@oracle.com>
 <alpine.OSX.2.20.2201271401250.42000@athabasca.local>
 <1f544cb3-7434-3480-63fc-ff317327ea78@oracle.com>
 <20220127193136-mutt-send-email-mst@kernel.org>
 <c5460e4e-61dd-78ad-6703-e518a8302097@oracle.com>
 <20220128105311-mutt-send-email-mst@kernel.org>
 <db012849-b7ec-eecc-bf41-a6b211c021f0@oracle.com>
 <20220128111327-mutt-send-email-mst@kernel.org>
 <CAARzgwx-5p2bvjs-4csWEo2yKkg4CSgKhhbnmESfGmojS775=g@mail.gmail.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <CAARzgwx-5p2bvjs-4csWEo2yKkg4CSgKhhbnmESfGmojS775=g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0227.namprd04.prod.outlook.com
 (2603:10b6:806:127::22) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63c4b529-8cc4-4aac-c941-08d9e28a91e7
X-MS-TrafficTypeDiagnostic: DM6PR10MB3802:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB380234181020ED5D2D71B9D097229@DM6PR10MB3802.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SGaeuvLlsY6d0yrOfZwC9xW0yOg2FVFScmR3QDyRxIHh6OC+1+owrVfos3n39jsj+uK2R5ZhcpZWEimdhN/kGaCuHqMQNCuo2xAweRbbB0blqoKkBYcuC1fVngxbLY/vmgTp009QbYMmtdi+2wbjhUXlnzipsgpoXUwLgT4y4cyePFqSOm+YiSWgeCcHe/zqAPMgI/Efe9jg2htC6EooafgDX8FbDyjmMpwARIB2BcEXVutNz8C9KIl3zS5jhx5x/OYm9RHK8Qjk/I4sqFi13Lv4kDdTcuVIEXtv5e4h268Xdfmb0jBZlnsWw+YTgEmVkiHPSEw7078kC7jowFcWqrFu2dVW7OkN2leZwEwKEPcr4PfeWWWV022jLDgNyhSCVdQdr04dwuXCt3tJSbed0b2s3YeeTGt17JaqQkXSBNam6yZT8YSYlWG5829DAhe6hFWpObNcYVFh6F8v8US1+dQHpmC3T22EIdKm3COK1EY+rVEgvqjJ9TOF05dPGszYGm8ly5r1mGvEHU7SHRrUQlScwnS+m4iVOUVvNdsotvptRpdbMmSR2V68aOQJVn+7X7l9GL6/R2qTPxl9wSXrw+yDhNVdxip6TLpGsaq5BFDakLH/HUQzLQxkvuLRTF3EUoP58hXqsYNx9xwB+AO2pawnFimwPV0lCYTWzMUi9EWKaLg8Sp4Vb4Dm36iwnnGUuqetYqFj+wxdZI2BLPQ+DWzZiW7M1QQaFHBpGCoqH2M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(83380400001)(31686004)(508600001)(38100700002)(6512007)(5660300002)(4326008)(6506007)(53546011)(2906002)(8676002)(316002)(186003)(86362001)(31696002)(6666004)(2616005)(66556008)(66946007)(8936002)(6486002)(110136005)(66476007)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkRCbFNUWkM4N2VlMjZlVzNZN2t6S1QySldFRTI2QkxmeDhLejRMR1JHNk4w?=
 =?utf-8?B?Z0crNHlBdmpRY0JKc0g3THd4VFV2MTdaTnQ4SkphUC9Nd21yMjB4bllUcHFC?=
 =?utf-8?B?VWpUWGkrRXpMSVlBanVaZnZnTWFjNGRPSnI2YkhOOWJDQ1JhRXk4RUlrUE9q?=
 =?utf-8?B?V1FUTWtlc2ludmtnZXNkaUhmbE0rUFJ2Ykc4RG1TQXlIVWwzTUw4VnZUZnhN?=
 =?utf-8?B?WWZDZ0VndW80RWNvcDJDQU5BV2o5YnV6Y3JQKzRPb0RtNDVoUDJNZUIzSW1F?=
 =?utf-8?B?MHVvd0FvZEpNR09BREJLV3BET0xMOHp5Rmh2VkpaWWJuVTZUY2NGMG5pVjhT?=
 =?utf-8?B?ZW9NS3RZT1d4SE9zL1FKZkUrbXBWYWxxMHRTWTY2ZGNKS084MDJBY3BLSUdy?=
 =?utf-8?B?SGh0NG1Db2JFQkxqeitieEFEdWpCMnhjWXZDcVZnRFZDTHVVVEJVcFZJckRP?=
 =?utf-8?B?dWtZTmVuMi9zM2lLaEFITHNNNWd2TGQ4TlYyOWlJN2k4RzJhZ2YyVFVyN1pM?=
 =?utf-8?B?YjRWMkNkWUZxdkdYcTY3K2hLWEUveTVmbXhpQlZ1dVpmYmlJR3RVR3JNalB0?=
 =?utf-8?B?ME9Vc0pIOVltdlN3c01iVCsxSzMvVjhManM2cTZsNkE1dWhNVUR1UFVSY2dr?=
 =?utf-8?B?Wmp5eU9ZL0tiRjZveXgrYTlHNGo3TGVrNkdLc0hOYU5odXgySHlIZWM4bmlk?=
 =?utf-8?B?SnRZTFpJUlBvb1FPZUYyMVVqMGlQSlk4c2NYelpMTlRvemZxU1VaZ3NuRE9r?=
 =?utf-8?B?MmxtZVFKWEQ4SHU4V1IzY0xia29PM3RlaE1TREdScmdEeHFwVk9qNHlYVk9n?=
 =?utf-8?B?UjhXVEpGdUtJblFXRFU5Ty9VNHViOUpXTnJWT1ExaTlkQWFJaEtUdGp0WUJp?=
 =?utf-8?B?Vlp0ZE55L28xVEw0TStSdGtTK3pXMFo3c3pnYk10MjFCemZPVWtlS2I2MnE3?=
 =?utf-8?B?WGMrckdZaGxROGNTQ3ZtQ2daYVJxbFZqZHNoK093RGZuSHJHckt1b015Q2ZK?=
 =?utf-8?B?NGozQm03Z0FUcFBpVjFSVHpZR1V3MWEyM3NBb3JoalQ5dXJZT2hHMldrUEZk?=
 =?utf-8?B?UVVEdDl4NjM4KzZnaDQwUTNKSldJRVJpUDFSVTFHRDJZVzdpckVzRHVFRHpY?=
 =?utf-8?B?ZDhDLzN3ZGEwU3NtdGp6cytraWVlQndHd3dYWDVKMTJwbjlkeVFrQXlYdkxI?=
 =?utf-8?B?eGoyZEF3ekpkcDNrejlFQzFWZE9vR1V5eUc0ZU9CaGtveXRMTjlJaWZTUTh0?=
 =?utf-8?B?UU1La3hrbzNPUWk0RHgvYmJOT2FwakhmbHErdnhmYXc3aHA1cjhRaDZRSFhY?=
 =?utf-8?B?WEY1VHJLZWZsYWppdEdJa09Qamw5aHJPSlBKZUNTTUEyRGpaMkRtU1BxUzFK?=
 =?utf-8?B?WktTSkIwdC9VQ0huM0VqcXpPeVErUlVuUW9keDlyTmxIL1NzYS9HSnlPQmNV?=
 =?utf-8?B?OTR2WlBmS0loYWxMclcvazBGaXdhR0Y4QmFObWp1SGhZa0dVOGNZQ3BYMksx?=
 =?utf-8?B?VDNyOHBtYWMzT1U3cFJFYU9kT0N1Y1hGdHJmYUpzQ2YxelcvMEZwRWY0dnA1?=
 =?utf-8?B?Uzhoc0pZaG1FQlVYVUkvZEUzR3VUVXN5YWVuL1M0ZXJMMjZYSFZPVmRaSzhH?=
 =?utf-8?B?SmpBQlZtNHhmcnFDMk52RVBXOTkwa0h1enh2cXBwblFvTTRwL1o1RWl1cmZz?=
 =?utf-8?B?TnBaV1plTmR2aWtzS2ZBSGV4ekEyaTZlVlY5OGUwWnR0QzFBY3lkUjg2Mjds?=
 =?utf-8?B?SFZtRjRVZEh1di9rdENFNk5rK015c3hnVGMzaHZQdHdmZ2xhbTM5RERIUzZ0?=
 =?utf-8?B?Uy9UdGUycmFIb0dXNVl6b2NGWWZYUHpiejU0NnFmVFN4dzRmazBodDZnTkpD?=
 =?utf-8?B?eHF1WFNvcmRzUmNPVmduNnBkL3B1QkRGRW1CVzlQQlNBK0xOQXhtTnVnS1ZJ?=
 =?utf-8?B?V09pbXpNMmljVmo3dWY1cUtsbTZmMVhzVkdSMDAzYkNFb25ZZFAyNUhXV21N?=
 =?utf-8?B?RmVGTUtMTlk2NDkvZmdTZlRmVnpCMnlLR3o1TUMzRHI2MXZUb2toRVMyQWRl?=
 =?utf-8?B?ZGFYM25PTDdDTjhFVS9VU0xERTJmeTBmNWVNVG1ZcW9zajNqdXNTUGhDa2RS?=
 =?utf-8?B?N2dGSUppeUQwNkd2QVpHTlpSZmJqeVA4UTRPSEhkM052a2d5VUUzcHNGL3pn?=
 =?utf-8?B?dUU2QVl4OXRmc0ljWEpKMWVUaXFjKzBjTVYwUWdkakVTQXVHVGVvSVFwakNs?=
 =?utf-8?B?Y3lvaFZISUM4NmUxSStuNFBwRFIzazQzSGtIVTA1MmhFbFhHS214NWRLaVBZ?=
 =?utf-8?Q?kfPTFuN3GgfWoiIv+q?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63c4b529-8cc4-4aac-c941-08d9e28a91e7
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 18:18:23.2917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bm5U6h/Wnt3jj3zc70L1338qzc6BEQXm2NQIdsgcW9EwnqvQvrayEb/YP8tm7Pxj+hT728V8Ng7kXkOqRp4JMHEkr2PiVOV9C5Q1c+NEMsc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3802
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10240
 signatures=669575
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxlogscore=950 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201280106
X-Proofpoint-GUID: -uXyviCJBxOs2bbeFWR8-GufPKY7j8do
X-Proofpoint-ORIG-GUID: -uXyviCJBxOs2bbeFWR8-GufPKY7j8do
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, imammedo@redhat.com,
 boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/28/22 11:25, Ani Sinha wrote:
> 
> [snip]
> On Fri, Jan 28, 2022 at 9:44 PM Michael S. Tsirkin <mst@redhat.com <mailto:mst@redhat.com>> wrote:
> 

>      > > > OK, here is the equivalent using struct assignment, is this what you were after?
>      > > >
>      > > >      BuildSerializationInstructionEntry base = {
>      > > >          .table_data = table_instruction_data,
>      > > >          .bar = bar0,
>      > > >          .instruction = INST_WRITE_REGISTER,
>      > > >          .flags = 0,
>      > > >          .register_bit_width = 32,
>      > > >          .register_offset = ERST_VALUE_OFFSET,
>      > > >      };
>      > > >      BuildSerializationInstructionEntry rd_value_32_val = base;
>      > > >      rd_value_32_val.instruction = INST_READ_REGISTER_VALUE;
>      > > >      BuildSerializationInstructionEntry rd_value_32 = base;
>      > > >      rd_value_32.instruction = INST_READ_REGISTER;
>      > > >      BuildSerializationInstructionEntry rd_value_64 = base;
>      > > >      rd_value_64.instruction = INST_READ_REGISTER;
>      > > >      rd_value_64.register_bit_width = 64;
>      > > >      BuildSerializationInstructionEntry wr_value_32_val = base;
>      > > >      wr_value_32_val.instruction = INST_WRITE_REGISTER_VALUE;
>      > > >      BuildSerializationInstructionEntry wr_value_32 = base;
>      > > >      BuildSerializationInstructionEntry wr_value_64 = base;
>      > > >      wr_value_64.register_bit_width = 64;
>      > > >      BuildSerializationInstructionEntry wr_action = base;
>      > > >      wr_action.instruction = INST_WRITE_REGISTER_VALUE;
>      > > >      wr_action.register_offset = ERST_ACTION_OFFSET;
>      > > >
>      > >
>      > > That's what I described, yes. We should have some empty lines here I
>      > > guess. I'm ok with the original one too, there's not too much
>      > > duplication.
>      >
>      > Are the blank lines referring to spacing out the setup of each of the 7 accesors?
>      > If so, I could put a one line comment between each setup? Or is a blank line also
>      > needed?
> 
>     A blank line between declarations and code is usually a good idea.
> 
> 
>      > Is it OK to post v15 with the struct assignment approach? Or would you prefer the
>      > explicit structs (which is what I think you mean by 'the original one')?
> 
> 
> I prefer the explicit structs as you had posted before.

Ok, as Michael does not have a preference, so let's go with your preference of the
explicit structs!
Thank you!
eric

> 
> 
>      >
>      > Thanks!
>      > eric
> 
>     I don't care either way.
> 
>      > >
>      > >
>      > > >
>      > > > >
>      > > > >
>      > > > > > #define SERIALIZATIONINSTRUCTIONCTX(name, \
>      > > > > >       inst, bit_width, offset) \
>      > > > > >       BuildSerializationInstructionEntry name = { \
>      > > > > >           .table_data = table_instruction_data, \
>      > > > > >           .bar = bar0, \
>      > > > > >           .instruction = inst, \
>      > > > > >           .flags = 0, \
>      > > > > >           .register_bit_width = bit_width, \
>      > > > > >           .register_offset = offset, \
>      > > > > >       }
>      > > > > >       SERIALIZATIONINSTRUCTIONCTX(rd_value_32_val,
>      > > > > >           INST_READ_REGISTER_VALUE, 32, ERST_VALUE_OFFSET);
>      > > > > >       SERIALIZATIONINSTRUCTIONCTX(rd_value_32,
>      > > > > >           INST_READ_REGISTER, 32, ERST_VALUE_OFFSET);
>      > > > > >       SERIALIZATIONINSTRUCTIONCTX(rd_value_64,
>      > > > > >           INST_READ_REGISTER, 64, ERST_VALUE_OFFSET);
>      > > > > >       SERIALIZATIONINSTRUCTIONCTX(wr_value_32_val,
>      > > > > >           INST_WRITE_REGISTER_VALUE, 32, ERST_VALUE_OFFSET);
>      > > > > >       SERIALIZATIONINSTRUCTIONCTX(wr_value_32,
>      > > > > >           INST_WRITE_REGISTER, 32, ERST_VALUE_OFFSET);
>      > > > > >       SERIALIZATIONINSTRUCTIONCTX(wr_value_64,
>      > > > > >           INST_WRITE_REGISTER, 64, ERST_VALUE_OFFSET);
>      > > > > >       SERIALIZATIONINSTRUCTIONCTX(wr_action,
>      > > > > >           INST_WRITE_REGISTER_VALUE, 32, ERST_ACTION_OFFSET);
>      > > > > >
>      > > > > > These are the 7 accessors needed.
>      > > > >
>      > > > > not at all sure this one is worth the macro mess.
>      > > >
>      > > > I'm hoping to produce a v15 with the style you want.
>      > > > eric
>      > > >
>      > > > >
>      > > > > > >
>      > > > > > > > +    unsigned action;
>      > > > > > > > +
>      > > > > > > > +    trace_acpi_erst_pci_bar_0(bar0);
>      > > > > > > > +
>      > > > > > > > +    /* Serialization Instruction Entries */
>      > > > > > > > +    action = ACTION_BEGIN_WRITE_OPERATION;
>      > > > > > > > +    build_serialization_instruction(&wr_action, action, action);
>      > > > > > > > +
>      > > > > > > > +    action = ACTION_BEGIN_READ_OPERATION;
>      > > > > > > > +    build_serialization_instruction(&wr_action, action, action);
>      > > > > > > > +
>      > > > > > > > +    action = ACTION_BEGIN_CLEAR_OPERATION;
>      > > > > > > > +    build_serialization_instruction(&wr_action, action, action);
>      > > > > > > > +
>      > > > > > > > +    action = ACTION_END_OPERATION;
>      > > > > > > > +    build_serialization_instruction(&wr_action, action, action);
>      > > > > > > > +
>      > > > > > > > +    action = ACTION_SET_RECORD_OFFSET;
>      > > > > > > > +    build_serialization_instruction(&wr_value_32, action, 0);
>      > > > > > > > +    build_serialization_instruction(&wr_action, action, action);
>      > > > > > > > +
>      > > > > > > > +    action = ACTION_EXECUTE_OPERATION;
>      > > > > > > > +    build_serialization_instruction(&wr_value_32_val, action,
>      > > > > > > > +        ERST_EXECUTE_OPERATION_MAGIC);
>      > > > > > > > +    build_serialization_instruction(&wr_action, action, action);
>      > > > > > > > +
>      > > > > > > > +    action = ACTION_CHECK_BUSY_STATUS;
>      > > > > > > > +    build_serialization_instruction(&wr_action, action, action);
>      > > > > > > > +    build_serialization_instruction(&rd_value_32_val, action, 0x01);
>      > > > > > > > +
>      > > > > > > > +    action = ACTION_GET_COMMAND_STATUS;
>      > > > > > > > +    build_serialization_instruction(&wr_action, action, action);
>      > > > > > > > +    build_serialization_instruction(&rd_value_32, action, 0);
>      > > > > > > > +
>      > > > > > > > +    action = ACTION_GET_RECORD_IDENTIFIER;
>      > > > > > > > +    build_serialization_instruction(&wr_action, action, action);
>      > > > > > > > +    build_serialization_instruction(&rd_value_64, action, 0);
>      > > > > > > > +
>      > > > > > > > +    action = ACTION_SET_RECORD_IDENTIFIER;
>      > > > > > > > +    build_serialization_instruction(&wr_value_64, action, 0);
>      > > > > > > > +    build_serialization_instruction(&wr_action, action, action);
>      > > > > > > > +
>      > > > > > > > +    action = ACTION_GET_RECORD_COUNT;
>      > > > > > > > +    build_serialization_instruction(&wr_action, action, action);
>      > > > > > > > +    build_serialization_instruction(&rd_value_32, action, 0);
>      > > > > > > > +
>      > > > > > > > +    action = ACTION_BEGIN_DUMMY_WRITE_OPERATION;
>      > > > > > > > +    build_serialization_instruction(&wr_action, action, action);
>      > > > > > > > +
>      > > > > > > > +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE;
>      > > > > > > > +    build_serialization_instruction(&wr_action, action, action);
>      > > > > > > > +    build_serialization_instruction(&rd_value_64, action, 0);
>      > > > > > > > +
>      > > > > > > > +    action = ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;
>      > > > > > > > +    build_serialization_instruction(&wr_action, action, action);
>      > > > > > > > +    build_serialization_instruction(&rd_value_64, action, 0);
>      > > > > > > > +
>      > > > > > > > +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES;
>      > > > > > > > +    build_serialization_instruction(&wr_action, action, action);
>      > > > > > > > +    build_serialization_instruction(&rd_value_32, action, 0);
>      > > > > > > > +
>      > > > > > > > +    action = ACTION_GET_EXECUTE_OPERATION_TIMINGS;
>      > > > > > > > +    build_serialization_instruction(&wr_action, action, action);
>      > > > > > > > +    build_serialization_instruction(&rd_value_64, action, 0);
>      > > > > > > > +
>      > > > > > > > +    /* Serialization Header */
>      > > > > > > > +    acpi_table_begin(&table, table_data);
>      > > > > > > > +
>      > > > > > > > +    /* Serialization Header Size */
>      > > > > > > > +    build_append_int_noprefix(table_data, 48, 4);
>      > > > > > > > +
>      > > > > > > > +    /* Reserved */
>      > > > > > > > +    build_append_int_noprefix(table_data,  0, 4);
>      > > > > > > > +
>      > > > > > > > +    /*
>      > > > > > > > +     * Instruction Entry Count
>      > > > > > > > +     * Each instruction entry is 32 bytes
>      > > > > > > > +     */
>      > > > > > > > +    g_assert((table_instruction_data->len) % 32 == 0);
>      > > > > > > > +    build_append_int_noprefix(table_data,
>      > > > > > > > +        (table_instruction_data->len / 32), 4);
>      > > > > > > > +
>      > > > > > > > +    /* Serialization Instruction Entries */
>      > > > > > > > +    g_array_append_vals(table_data, table_instruction_data->data,
>      > > > > > > > +        table_instruction_data->len);
>      > > > > > > > +    g_array_free(table_instruction_data, TRUE);
>      > > > > > > > +
>      > > > > > > > +    acpi_table_end(linker, &table);
>      > > > > > > > +}
>      > > > > > > > +
>      > > > > > > > +/*******************************************************************/
>      > > > > > > > +/*******************************************************************/
>      > > > > > > >     static uint8_t *get_nvram_ptr_by_index(ERSTDeviceState *s, unsigned index)
>      > > > > > > >     {
>      > > > > > > >         uint8_t *rc = NULL;
>      > > > > > > > --
>      > > > > > > > 1.8.3.1
>      > > > > > > >
>      > > > > > > >
>      > > > >
>      > >
> 

