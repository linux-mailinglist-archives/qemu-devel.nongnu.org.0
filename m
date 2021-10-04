Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0AB421923
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 23:19:54 +0200 (CEST)
Received: from localhost ([::1]:35278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXVNJ-0007cm-On
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 17:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mXVH6-0008Jg-KE
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:13:28 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:28738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mXVGz-0005Ki-DZ
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:13:27 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 194KXq8D023902; 
 Mon, 4 Oct 2021 21:13:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=q7VGJwCvu9XesO15G7s2DtuMsQQCr040ePjRkkB30ps=;
 b=KHJcnE5nE1n7G9BI+Z7c7sNoWihdpBU7sZqix3KM8/qSnpVdZp3w2ZsTXuwX52/dCtz4
 ijLm1dcDwT8Uv0dLG6U6XrLbcIgJVbzzo7ZsH2RjHoYPKtWkaPiIH6LopM6piGsV47fQ
 BhLOey5IcgU2F95JrZgHBrJ/Zcix2gkoO60QFrYFeI9jDrZ0QqgfFfQfsUh5BXOJTJPz
 Kzv4ICnRqAzBACJVzJgvROdg/O00j4iXj5urC+cZyD1O/lQYOpG+jL2jIpfnyClcZaxF
 9nJNcGE5dFX1vmC9wiG7DgbwC1udfNyL7BWSVUx68oJXuH9+1LZOYmPKVL3pnxQ/XRyY tg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bg43gjggb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Oct 2021 21:13:18 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 194L4cqk039733;
 Mon, 4 Oct 2021 21:13:17 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
 by userp3020.oracle.com with ESMTP id 3bf16s1n7k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Oct 2021 21:13:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dL8qtWuETYVBMrzcZEdSusMQIW5HP/F7DY6KlmasadqMs2cQdKGzCvu/HBBGznarEdVknpcsTPxT4dSCLblE2aWR/GR66VdlVy/c9SSirABM3uS+3/WVfDe1pXZOsKBH9MDteLH5J7UMjzp1w/Q5hdqlRsMGfqNHDRipqnN1xO/U4VKljxrmEt7WEP7tFzrM1q0YwjqEYEhj2WfkNDZfkwiBYPAP67eo+lG9uIwImfl/4B0wYyszCDGr/jD7QT3lQ8mUSKRFjrPB5OHDsaBisA4cLvMwMzuLfK654c5j55pl028bnOn3xxSz3cyXa3UqPP9yP8CM63xQrWQyhevdtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7VGJwCvu9XesO15G7s2DtuMsQQCr040ePjRkkB30ps=;
 b=mYumbIXsiQXLmS7zIVk+iT5UC44Qm7n3ML8865e5/c4WNQKeYHbs/5HlLdwIItDhbVgGuxKLNOBxGPQTxmnBXENEfOpZQE4nRLU4ddsrCHhD66f7fvfcaqX3xJYHJawdVSzFBZfY+aX92DHlD29jl0ftaM2LRZpIgqR5Z8VO0KjCckjoAXFcJy5beTgdpjRYLLmyv737zgxzFC43HIWjynurVUb3em9Z/pHX40XBxH2PCv6SjiRHgvEO/nxyrIgJCPfbxCmh2/tgffH4CgrRA3moo887WGghyKRAIQjdiB8CpH2QftC71ZUO/5NCiH4B3X0Exju6Ya8e0HEyDw4S9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7VGJwCvu9XesO15G7s2DtuMsQQCr040ePjRkkB30ps=;
 b=Ep/XvkuJUtcD/lwN6z1XmjFIjbhlu6F7ONj3E9Z4bjU4OrOUAOmLcxbYzmirbXgVTj3JjKpbE6q/sKQyrLvdx5zoY757uXvj2hF7ae+FIkMuSnw/Lz7mYeVfsqNgp0nC9rx0cLaXgLURcnESk72R+bhdnLMfAw1mqoC+R/NjF6M=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB4401.namprd10.prod.outlook.com (2603:10b6:303:6d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17; Mon, 4 Oct
 2021 21:13:14 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6%7]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 21:13:14 +0000
Subject: Re: [PATCH v6 05/10] ACPI ERST: support for ACPI ERST feature
To: Igor Mammedov <imammedo@redhat.com>
References: <1628202639-16361-1-git-send-email-eric.devolder@oracle.com>
 <1628202639-16361-6-git-send-email-eric.devolder@oracle.com>
 <20210921173022.7b80f484@redhat.com>
From: Eric DeVolder <eric.devolder@oracle.com>
Message-ID: <a32d9433-3cc1-8bf5-7082-fe603968476a@oracle.com>
Date: Mon, 4 Oct 2021 16:13:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210921173022.7b80f484@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0092.namprd04.prod.outlook.com
 (2603:10b6:806:122::7) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from [IPv6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by SN7PR04CA0092.namprd04.prod.outlook.com
 (2603:10b6:806:122::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Mon, 4 Oct 2021 21:13:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4bec1c6b-293f-474a-bdec-08d9877bc6b2
X-MS-TrafficTypeDiagnostic: CO1PR10MB4401:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB4401E41FD2FC647842733E1F97AE9@CO1PR10MB4401.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VQffw67ePFEG+HA8nIOao0euhcBsZurCS/PtFTPLK4E3+lqxSTdJblNmYRd+rcPBisaOWb97PRoJXecodVFVX9wiW6R9CJmUjysUySNN9KLpLihzg1muB1hLOhkDhJ0n/BFQJI+FwTbwyyNbB5nwsIgEbHFwVTJTyHnPLtxOyXkR67SwbZJJPO5ERCm6yYWLq0ynK5lL5VvK7ADE+J+bN/tBojNREJJgWQS7VWGPbC+1LgPKoYhGShh4NZmg1hm3ch8iwHl7xXG//WGk0T/bjeGxZvBt2mNMHcF25Z8PFtEpzX6sk6w9cii60zopcfGNRyCrWd/IPtc82Bon88oOeuL0srDO1x+hytORybwTHQIMbInkl8fboOKcqfe1z+aMp5DMjXCE6U7RvuSde7kXSEEK8HIUVPRamjrYo2J9ihWjVj3bXXrWT60PwbFSRGC/eia+MA5uJFVb0fPz3l+AFbWxa3qmMNFTOl64+DMANDy6T+PpKKZMxzF+CUZqrq+iZPhQoWXYkosgm0vjv3NK3/DJryscm4VXcVsLiqXL6yBx+77oNdSCVh1g9hDdAF7bPb6jk6ZyxhzAHni/PQG9+2CyGXVdfPaqpzcI1eMJsgknWAJC7/5hm/9FA8kDLeqAiSHxKsisajTVnSTe2gQ0KmOur1HZeDpNNIo2+9FywkTrrpeYSJX24FbDuquyQiei18GqiLa5Wqm/qS1lClLWC0IK1hWAD5cKfcjDWRyDKkw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(53546011)(36756003)(4326008)(6916009)(6486002)(316002)(31686004)(38100700002)(86362001)(66946007)(8676002)(107886003)(186003)(66556008)(66476007)(508600001)(5660300002)(6666004)(30864003)(8936002)(83380400001)(2906002)(2616005)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkxXd2N0SmhYVDQ5UW5ZbGZhcEZxOW9tYXhCK2VRUzdzTnlFRkl0U3RUMnRP?=
 =?utf-8?B?bXNHVXFiUXFEdEc5V01nZ2pBTzh4MHRWMzM4KzJwMXZrZml1K21TTzFRQnln?=
 =?utf-8?B?dkdhZHN6RFJOMnh4L1dWbTQxUGhVSCt5NDF0b3FHZllObHNtSkNjakk4NmxK?=
 =?utf-8?B?MUlxblpkUVgwSkw4SGhZRnRUUE1SSUthaFZPaXV6cmJSS3UwMkM2TldnNWpP?=
 =?utf-8?B?cHl4NG9zUVZSa2pRbFBTQW5GTE1zZEFwYkRrQWtJdTdNS3BOMHQrRkh2NER5?=
 =?utf-8?B?WWZYMnNCNHhKTTRWZFEwNjJzR25Xa1hOOWRHdC85SzBsQm9ueVhRWnhWelBu?=
 =?utf-8?B?MzBQNis3SDJIS04xMVVJOUZMSjlXamkzYTkvNy9HdFlldTBZbjAxbjFTckZ4?=
 =?utf-8?B?QmhMa3pPVDBCbVhjb3lhdkRlU0h1ckF1THViekpFb3lyUE1jVzN4R1RFdWRK?=
 =?utf-8?B?RUVNWENNL2Nqc3B1d3B0RGhueEZCUGRtd0VoV0o1NnBhanlaQUpoSytnQmZJ?=
 =?utf-8?B?RkNpK2pBNXQ3cmsrMC84b0dtczJKclZLYVVaVnByTlNLTmc5T3ZIdjdaaThF?=
 =?utf-8?B?NUlkM0VwRjRVMzNURkdldWltNnRQT3h4TkpWRk1ER2xhUVd6bGttQkRRRndH?=
 =?utf-8?B?UDdETkg2M3hqTjFqcGpPbFpyaHk2ZFMySmMvMEFwOFhlVng5aDRheWNVZm1w?=
 =?utf-8?B?WStBZ3NzNkwrZ2VxOGhkb284YTF0aHlsc2Z0NlVzV3BHZ2h3VzVSM05HTnlh?=
 =?utf-8?B?dGZ2Rml3UzhUL3c2Y3RzV09sV2VKdEg0NmtxVnNkc3UvZDFRNWJ0MFo3bUE3?=
 =?utf-8?B?ODFMRVBTRnkxaEljelQ5MFBXbTV2N2xqQXRBd1hycVFyUDJSaUZ5K0JlUzJa?=
 =?utf-8?B?Vm10VWZjMWlOMWw1aEhCb1djVXZkSHdUdmlxSDU2WlBUUkJpenEvdmRvemlq?=
 =?utf-8?B?T3I3bTh2Y3JzRFRYaWJQMWpJajFzVEcybE4wMlhoZnZ1dWRLU1FEL2kycmZy?=
 =?utf-8?B?TFBYK0pZRnFFWEhlYUp0ZFFZTGYxb0pDNkl6RUIwVW1WMUhEVE0yZGpBbHNE?=
 =?utf-8?B?Y0JaLzNMZmk1blFjanJZa01wYVg0NmpUNGg0eEd0SmJXZGV6cmg3SlY1VDNy?=
 =?utf-8?B?VTRabThqMUJ1L3lGOHc3QkdFanI0Q0pUWGdNbGdmd2RKNjlJZlEyVEJsNlNB?=
 =?utf-8?B?cEc4VkxpcXNWMFdaTmM2Y3I4MWkwbnlQYWlwd2cvR0hGeDdlbTRhbmtMUDFi?=
 =?utf-8?B?RXVURElIa205aXRQS3llWHJmeFBkcGhRRnB4K3B1MFRVRWhVUG85Y3dBQTFw?=
 =?utf-8?B?bGQ1cmdmUnByYm44ZUR5blRmQkRnczBLSElWMXhNZXhKUTJYSDhBaDNVRXZi?=
 =?utf-8?B?cExtU1UvZm5IMHV0ZUNwcFN2TEE1eHBObStNVW5DdUZmOVM1OHprZTdkYzkw?=
 =?utf-8?B?eFRvTThuSm9zK1JzdzkxZ2ZOeFpGSVZUNVpyTFFjSmFSTFpjcG5hcWZ4S2x5?=
 =?utf-8?B?b0VvUEFwSitJMFBpcDAyRFFHeXIwcmx6Q2xMeXIvcDVXVTQ1WVUwcEUyVnN4?=
 =?utf-8?B?SlRNS0hHajFzMStGc2FnSk1vVjJadmkxR0VzZUdqWHZmdldhWUdvYk5CNFp3?=
 =?utf-8?B?UE9zWGVDa3U3Z2VPZnNNa2pBQ0lEYzFDeEtLWG5VMmpOdjdESTJPd1pWNmd1?=
 =?utf-8?B?c3BxWGh6T0tWdDV3Wng3V0NUOFN4UTkvelRaWHVIN0hpTFRXemR4S0pBeGh2?=
 =?utf-8?B?ckxRdnRQdnZ4YUk1MTVFb1hpaGFHNmN4QjlqV05KajkyMmZUdllsZUNTbWNY?=
 =?utf-8?Q?bTDz7J4IZBoeSkO4frXwJudA9aAivGeVcBsmM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bec1c6b-293f-474a-bdec-08d9877bc6b2
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2021 21:13:13.6614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g34+3WJUeYoehJ3vU0IUJDSuiTilDglgbvED7MYr2MfBaiA9OACIP+I6m/XeokmLJU/nx2RbQtvvarcltDnzFVy1qpIMayK08HCekofxLGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4401
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10127
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110040141
X-Proofpoint-GUID: G0Pe_vAZTCspSjzxJ7NhEuFx38f_QysQ
X-Proofpoint-ORIG-GUID: G0Pe_vAZTCspSjzxJ7NhEuFx38f_QysQ
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Igor, thanks for the close examination. Inline responses below.
eric

On 9/21/21 10:30 AM, Igor Mammedov wrote:
> On Thu,  5 Aug 2021 18:30:34 -0400
> Eric DeVolder <eric.devolder@oracle.com> wrote:
> 
>> This implements a PCI device for ACPI ERST. This implements the
>> non-NVRAM "mode" of operation for ERST as it is supported by
>> Linux and Windows.
>>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>> ---
>>   hw/acpi/erst.c       | 750 +++++++++++++++++++++++++++++++++++++++++++++++++++
>>   hw/acpi/meson.build  |   1 +
>>   hw/acpi/trace-events |  15 ++
>>   3 files changed, 766 insertions(+)
>>   create mode 100644 hw/acpi/erst.c
>>
>> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
>> new file mode 100644
>> index 0000000..eb4ab34
>> --- /dev/null
>> +++ b/hw/acpi/erst.c
>> @@ -0,0 +1,750 @@
>> +/*
>> + * ACPI Error Record Serialization Table, ERST, Implementation
>> + *
>> + * ACPI ERST introduced in ACPI 4.0, June 16, 2009.
>> + * ACPI Platform Error Interfaces : Error Serialization
>> + *
>> + * Copyright (c) 2021 Oracle and/or its affiliates.
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + */
>> +
>> +#include <sys/types.h>
>> +#include <sys/stat.h>
>> +#include <unistd.h>
>> +
>> +#include "qemu/osdep.h"
>> +#include "qapi/error.h"
>> +#include "hw/qdev-core.h"
>> +#include "exec/memory.h"
>> +#include "qom/object.h"
>> +#include "hw/pci/pci.h"
>> +#include "qom/object_interfaces.h"
>> +#include "qemu/error-report.h"
>> +#include "migration/vmstate.h"
>> +#include "hw/qdev-properties.h"
>> +#include "hw/acpi/acpi.h"
>> +#include "hw/acpi/acpi-defs.h"
>> +#include "hw/acpi/aml-build.h"
>> +#include "hw/acpi/bios-linker-loader.h"
>> +#include "exec/address-spaces.h"
>> +#include "sysemu/hostmem.h"
>> +#include "hw/acpi/erst.h"
>> +#include "trace.h"
>> +
>> +/* ACPI 4.0: Table 17-16 Serialization Actions */
>> +#define ACTION_BEGIN_WRITE_OPERATION         0x0
>> +#define ACTION_BEGIN_READ_OPERATION          0x1
>> +#define ACTION_BEGIN_CLEAR_OPERATION         0x2
>> +#define ACTION_END_OPERATION                 0x3
>> +#define ACTION_SET_RECORD_OFFSET             0x4
>> +#define ACTION_EXECUTE_OPERATION             0x5
>> +#define ACTION_CHECK_BUSY_STATUS             0x6
>> +#define ACTION_GET_COMMAND_STATUS            0x7
>> +#define ACTION_GET_RECORD_IDENTIFIER         0x8
>> +#define ACTION_SET_RECORD_IDENTIFIER         0x9
>> +#define ACTION_GET_RECORD_COUNT              0xA
>> +#define ACTION_BEGIN_DUMMY_WRITE_OPERATION   0xB
>> +#define ACTION_RESERVED                      0xC
>> +#define ACTION_GET_ERROR_LOG_ADDRESS_RANGE   0xD
>> +#define ACTION_GET_ERROR_LOG_ADDRESS_LENGTH  0xE
>> +#define ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES 0xF
>> +#define ACTION_GET_EXECUTE_OPERATION_TIMINGS 0x10
>> +
>> +/* ACPI 4.0: Table 17-17 Command Status Definitions */
>> +#define STATUS_SUCCESS                0x00
>> +#define STATUS_NOT_ENOUGH_SPACE       0x01
>> +#define STATUS_HARDWARE_NOT_AVAILABLE 0x02
>> +#define STATUS_FAILED                 0x03
>> +#define STATUS_RECORD_STORE_EMPTY     0x04
>> +#define STATUS_RECORD_NOT_FOUND       0x05
>> +
>> +
>> +/* UEFI 2.1: Appendix N Common Platform Error Record */
>> +#define UEFI_CPER_RECORD_MIN_SIZE 128U
>> +#define UEFI_CPER_RECORD_LENGTH_OFFSET 20U
>> +#define UEFI_CPER_RECORD_ID_OFFSET 96U
>> +#define IS_UEFI_CPER_RECORD(ptr) \
>> +    (((ptr)[0] == 'C') && \
>> +     ((ptr)[1] == 'P') && \
>> +     ((ptr)[2] == 'E') && \
>> +     ((ptr)[3] == 'R'))
>> +#define THE_UEFI_CPER_RECORD_ID(ptr) \
>> +    (*(uint64_t *)(&(ptr)[UEFI_CPER_RECORD_ID_OFFSET]))
>> +
>> +/*
>> + * This implementation is an ACTION (cmd) and VALUE (data)
>> + * interface consisting of just two 64-bit registers.
>> + */
>> +#define ERST_REG_SIZE (16UL)
>> +#define ERST_ACTION_OFFSET (0UL) /* action (cmd) */
>> +#define ERST_VALUE_OFFSET  (8UL) /* argument/value (data) */
>> +
>> +/*
>> + * ERST_RECORD_SIZE is the buffer size for exchanging ERST
>> + * record contents. Thus, it defines the maximum record size.
>> + * As this is mapped through a PCI BAR, it must be a power of
>> + * two and larger than UEFI_CPER_RECORD_MIN_SIZE.
>> + * The backing storage is divided into fixed size "slots",
>> + * each ERST_RECORD_SIZE in length, and each "slot"
>> + * storing a single record. No attempt at optimizing storage
>> + * through compression, compaction, etc is attempted.
>> + * NOTE that slot 0 is reserved for the backing storage header.
>> + * Depending upon the size of the backing storage, additional
>> + * slots will be part of the slot 0 header in order to account
>> + * for a record_id for each available remaining slot.
>> + */
>> +/* 8KiB records, not too small, not too big */
>> +#define ERST_RECORD_SIZE (8192UL)
>> +
>> +#define ACPI_ERST_MEMDEV_PROP "memdev"
>> +
>> +/*
>> + * From the ACPI ERST spec sections:
>> + * A record id of all 0s is used to indicate
>> + * 'unspecified' record id.
>> + * A record id of all 1s is used to indicate
>> + * empty or end.
>> + */
>> +#define ERST_UNSPECIFIED_RECORD_ID (0UL)
>> +#define ERST_EMPTY_END_RECORD_ID (~0UL)
>> +#define ERST_EXECUTE_OPERATION_MAGIC 0x9CUL
>> +#define ERST_IS_VALID_RECORD_ID(rid) \
>> +    ((rid != ERST_UNSPECIFIED_RECORD_ID) && \
>> +     (rid != ERST_EMPTY_END_RECORD_ID))
>> +
>> +typedef struct erst_storage_header_s {
> 
>> +#define ERST_STORE_MAGIC 0x524F545354535245UL
> 
> move it out of structure definition,
> also where value comes from? (perhaps something starting
> with ERST... would be more self-describing)
done; this value is 'ERSTSTOR', which I've left as a comment in v7.

> 
>> +    uint64_t magic;
>> +    uint32_t record_size;
>> +    uint32_t record_offset; /* offset to record storage beyond header */
>> +    uint16_t version;
>> +    uint16_t reserved;
>> +    uint32_t record_count;
>> +    uint64_t map[]; /* contains record_ids, and position indicates index */
>> +} erst_storage_header_t;
> docs/devel/style.rst: Typedefs
done; thanks

> 
> also give it's used as header layout in storage,
> set packed attribute for structure
done

> 
>> +
>> +/*
>> + * Object cast macro
>> + */
>> +#define ACPIERST(obj) \
>> +    OBJECT_CHECK(ERSTDeviceState, (obj), TYPE_ACPI_ERST)
>> +
>> +/*
>> + * Main ERST device state structure
>> + */
>> +typedef struct {
>> +    PCIDevice parent_obj;
>> +
>> +    /* Backend storage */
>> +    HostMemoryBackend *hostmem;
>> +    MemoryRegion *hostmem_mr;
>> +
>> +    /* Programming registers */
>> +    MemoryRegion iomem;
>> +
>> +    /* Exchange buffer */
>> +    Object *exchange_obj;
>> +    HostMemoryBackend *exchange;
>> +    MemoryRegion *exchange_mr;
>> +    uint32_t storage_size;
>> +
>> +    /* Interface state */
>> +    uint8_t operation;
>> +    uint8_t busy_status;
>> +    uint8_t command_status;
>> +    uint32_t record_offset;
>> +    uint64_t reg_action;
>> +    uint64_t reg_value;
>> +    uint64_t record_identifier;
>> +    erst_storage_header_t *header;
>> +    unsigned next_record_index;
>> +    unsigned first_record_index;
>> +    unsigned last_record_index;
>> +
>> +} ERSTDeviceState;
>> +
>> +/*******************************************************************/
>> +/*******************************************************************/
>> +
>> +static uint8_t *get_nvram_ptr_by_index(ERSTDeviceState *s, unsigned index)
>> +{
>> +    uint8_t *rc = NULL;
>> +    off_t offset = (index * ERST_RECORD_SIZE);
> 
>> +    if ((offset + ERST_RECORD_SIZE) <= s->storage_size) {
> 
> it looks like 'index' passed by caller is always valid, if it's the case
> convert  this to
>          g_assert((offset + ERST_RECORD_SIZE) <= s->storage_size))
done

> 
> also shouldn't <= be just <
yes, done

> 
> 
>> +        if (s->hostmem_mr) {
> can hostmem_mr be NULL, when this function is called?
> if not I'd drop condition.
no, so dropped. done

> 
>> +            uint8_t *p = (uint8_t *)memory_region_get_ram_ptr(s->hostmem_mr);
>> +            rc = p + offset;
>> +        }
>> +    }
>> +    return rc;
>> +}
>> +
>> +static void make_erst_storage_header(ERSTDeviceState *s)
>> +{
>> +    erst_storage_header_t *header = s->header;
>> +    unsigned mapsz, headersz;
>> +
>> +    header->magic = ERST_STORE_MAGIC;
>> +    header->record_size = ERST_RECORD_SIZE;
>> +    header->version = 0x0101;
> 
> maybe 0 or 1 to avoid question about what previous versions are
changed to simply 0x0100 (ie 1.0)
> 
>> +    header->reserved = 0x0000;
> s/0x.../0/
done

> 
>> +
>> +    /* Compute mapsize */
>> +    mapsz = s->storage_size / ERST_RECORD_SIZE;
>> +    mapsz *= sizeof(uint64_t);
>> +    /* Compute header+map size */
>> +    headersz = sizeof(erst_storage_header_t) + mapsz;
> 
>> +    /* Round up to nearest integer multiple of ERST_RECORD_SIZE */
>> +    headersz += (ERST_RECORD_SIZE - 1);
>> +    headersz /= ERST_RECORD_SIZE;
>> +    headersz *= ERST_RECORD_SIZE;
> git grep ROUND_UP
> may be of help here
yes, thanks. I'm using that now, done.

> 
>> +    header->record_offset = headersz;
>> +
>> +    /*
>> +     * The HostMemoryBackend initializes contents to zero,
>> +     * so all record_ids stashed in the map are zero'd.
>> +     * As well the record_count is zero. Properly initialized.
>> +     */
>> +}
>> +
>> +static void check_erst_backend_storage(ERSTDeviceState *s, Error **errp)
>> +{
>> +    erst_storage_header_t *header;
>> +
>> +    header = (erst_storage_header_t *)get_nvram_ptr_by_index(s, 0);
> optionally check/assert if it's not 64bit aligned,
> if it's not you risk getting killed by SIGBUG on some hosts,
> since you're accessing fields directly.
done!

> 
>> +    s->header = header;
>> +
>> +    /* Check if header is uninitialized */
>> +    if (header->magic == 0UL) { /* HostMemoryBackend inits to 0 */
>> +        make_erst_storage_header(s);
>> +    }
>> +
>> +    if (!(
>> +        (header->magic == ERST_STORE_MAGIC) &&
>> +        (header->record_size == ERST_RECORD_SIZE) &&
>> +        ((header->record_offset % ERST_RECORD_SIZE) == 0) &&
>> +        (header->version == 0x0101) &&
>> +        (header->reserved == 0x0000)
>> +        )) {
>> +        error_setg(errp, "ERST backend storage header is invalid");
>> +    }
>> +
>> +    /* Compute offset of first and last record storage slot */
>> +    s->first_record_index = header->record_offset / ERST_RECORD_SIZE;
>> +    s->last_record_index = (s->storage_size / ERST_RECORD_SIZE);
> 
> applies to whole patch/series,
> if mmaped header values are interpreted as integers you shall
> take care of endianness, i.e. use cpu_to_foo/foo_to_cpu for access
done; I'm using cpu_to_leX() and leX_to_cpu() for any access to the header.

> 
> and document file endianness in doc (2/10)
done

> 
>> +}
>> +
>> +static void set_erst_map_by_index(ERSTDeviceState *s, unsigned index,
>> +    uint64_t record_id)
> 
> update_[cache|map]_[entry|record_id]() or something like this might be
> a better description erst and index don't really add much here as it's
> clear from context.
done; now update_map_entry()

> 
> 
>> +{
>> +    if (index < s->last_record_index) {
>> +        s->header->map[index] = record_id;
>> +    }
>> +}
>> +
>> +static unsigned lookup_erst_record(ERSTDeviceState *s,
>> +    uint64_t record_identifier)
>> +{
>> +    unsigned rc = 0; /* 0 not a valid index */
>> +    unsigned index = s->first_record_index;
>> +
>> +    /* Find the record_identifier in the map */
>> +    if (record_identifier != ERST_UNSPECIFIED_RECORD_ID) {
>> +        /*
>> +         * Count number of valid records encountered, and
>> +         * short-circuit the loop if identifier not found
>> +         */
>> +        unsigned count = 0;
>> +        for (; index < s->last_record_index &&
>> +                count < s->header->record_count; ++index) {
>> +            uint64_t map_record_identifier = s->header->map[index];
> I'd drop map_record_identifier and use s->header->map[index] directly,
> i.e
>     if (s->header->map[index] ...
done

> 
>> +            if (map_record_identifier != ERST_UNSPECIFIED_RECORD_ID) {
>> +                ++count;
>> +            }
>> +            if (map_record_identifier == record_identifier) {
>> +                rc = index;
>> +                break;
>> +            }
>> +        }
>> +    } else {
>> +        /* Find first available unoccupied slot */
>> +        for (; index < s->last_record_index; ++index) {
>> +            if (s->header->map[index] == ERST_UNSPECIFIED_RECORD_ID) {
>> +                rc = index;
>> +                break;
>> +            }
>> +        }
>> +    }
>> +
>> +    return rc;
>> +}
> 
> what's the reason for combining lookup and allocate ops,
> if they where separated it' would be easier to follow code.
done; at one point it made sense; no longer.

> 
>> +
>> +/* ACPI 4.0: 17.4.2.3 Operations - Clearing */
>> +static unsigned clear_erst_record(ERSTDeviceState *s)
>> +{
>> +    unsigned rc = STATUS_RECORD_NOT_FOUND;
>> +    unsigned index;
>> +
>> +    /* Check for valid record identifier */
>> +    if (!ERST_IS_VALID_RECORD_ID(s->record_identifier)) {
>> +        return STATUS_FAILED;
>> +    }
>> +
>> +    index = lookup_erst_record(s, s->record_identifier);
>> +    if (index) {
>> +        /* No need to wipe record, just invalidate its map entry */
>> +        set_erst_map_by_index(s, index, ERST_UNSPECIFIED_RECORD_ID);
>> +        s->header->record_count -= 1;
>> +        rc = STATUS_SUCCESS;
>> +    }
>> +
>> +    return rc;
>> +}
>> +
>> +/* ACPI 4.0: 17.4.2.2 Operations - Reading */
>> +static unsigned read_erst_record(ERSTDeviceState *s)
>> +{
>> +    unsigned rc = STATUS_RECORD_NOT_FOUND;
>> +    unsigned index;
>> +
>> +    /* Check record boundary wihin exchange buffer */
>                                  ^^^ typo
done

> 
>> +    if (s->record_offset >= (ERST_RECORD_SIZE - UEFI_CPER_RECORD_MIN_SIZE)) {
>> +        return STATUS_FAILED;
>> +    }
>> +
>> +    /* Check for valid record identifier */
>> +    if (!ERST_IS_VALID_RECORD_ID(s->record_identifier)) {
>> +        return STATUS_FAILED;
>> +    }
>> +
>> +    index = lookup_erst_record(s, s->record_identifier);
>> +    if (index) {
>> +        uint8_t *ptr;
>> +        uint8_t *record = ((uint8_t *)
>> +            memory_region_get_ram_ptr(s->exchange_mr) +
>> +            s->record_offset);
>> +        ptr = get_nvram_ptr_by_index(s, index);
>> +        memcpy(record, ptr, ERST_RECORD_SIZE - s->record_offset);
> 
> if record_offset is large enough that record won't fit,
> this will copy truncated record into the exchange buffer.
> 
> Maybe it's better to fail whole op?
The first check within this function checks for this very condition, and does fail.
I believe the code does as you are asking.

> 
>> +        rc = STATUS_SUCCESS;
>> +    }
>> +
>> +    return rc;
>> +}
>> +
>> +/* ACPI 4.0: 17.4.2.1 Operations - Writing */
>> +static unsigned write_erst_record(ERSTDeviceState *s)
>> +{
>> +    unsigned rc = STATUS_FAILED;
>> +    unsigned index;
>> +    uint64_t record_identifier;
>> +    uint8_t *record;
>> +    uint8_t *ptr = NULL;
>> +    bool record_found = false;
>> +
>> +    /* Check record boundary wihin exchange buffer */
> ditto, typo
done

> 
>> +    if (s->record_offset >= (ERST_RECORD_SIZE - UEFI_CPER_RECORD_MIN_SIZE)) {
>> +        return STATUS_FAILED;
>> +    }
>> +
>> +    /* Extract record identifier */
>> +    record = ((uint8_t *)memory_region_get_ram_ptr(s->exchange_mr)
>> +        + s->record_offset);
>> +    record_identifier = THE_UEFI_CPER_RECORD_ID(record);
> potentially unaligned access to int, should use memcpy()
done

> 
>> +
>> +    /* Check for valid record identifier */
>> +    if (!ERST_IS_VALID_RECORD_ID(record_identifier)) {
>> +        return STATUS_FAILED;
>> +    }
>> +
>> +    index = lookup_erst_record(s, record_identifier);
>> +    if (index) {
>> +        /* Record found, overwrite existing record */
>> +        ptr = get_nvram_ptr_by_index(s, index);
>> +        record_found = true;
>> +    } else {
>> +        /* Record not found, not an overwrite, allocate for write */
>> +        index = lookup_erst_record(s, ERST_UNSPECIFIED_RECORD_ID);
>> +        if (index) {
>> +            ptr = get_nvram_ptr_by_index(s, index);
>> +        } else {
>> +            rc = STATUS_NOT_ENOUGH_SPACE;
>> +        }
>> +    }
>> +    if (ptr) {
>> +        memcpy(ptr, record, ERST_RECORD_SIZE - s->record_offset);
> 
>> +        if (0 != s->record_offset) {
>> +            memset(&ptr[ERST_RECORD_SIZE - s->record_offset],
>> +                0xFF, s->record_offset);
>> +        }
> you've lost me here, care to explain what's going on here?
If the record_offset is not 0, then there can be bytes following the record within the slot that 
were not written. This simply sets them to 0xFF (so bytes from a previously written record that 
happened to occupy this slot do not "bleed" through).
I've left a comment in v7.

> 
>> +        if (!record_found) {
>> +            s->header->record_count += 1; /* writing new record */
>> +        }
>> +        set_erst_map_by_index(s, index, record_identifier);
>> +        rc = STATUS_SUCCESS;
>> +    }
>> +
>> +    return rc;
>> +}
>> +
>> +/* ACPI 4.0: 17.4.2.2 Operations - Reading "During boot..." */
>> +static unsigned next_erst_record(ERSTDeviceState *s,
>> +    uint64_t *record_identifier)
> s/record_identifier/found.../
done

> 
>> +{
>> +    unsigned rc = STATUS_RECORD_NOT_FOUND;
>> +    unsigned index = s->next_record_index;
>> +
>> +    *record_identifier = ERST_EMPTY_END_RECORD_ID;
>> +
>> +    if (s->header->record_count) {
>> +        for (; index < s->last_record_index; ++index) {
>> +            uint64_t map_record_identifier;
> and then s/map_record_identifier/record_identifier/
done

> 
> the same applies to other occurrences within patch
> (map_record_identifier is a bit confusing) or drop it
> and use s->header->map[index] directly
done

> 
>> +            map_record_identifier = s->header->map[index];
>> +            if (map_record_identifier != ERST_UNSPECIFIED_RECORD_ID) {
>> +                    /* where to start next time */
>> +                    s->next_record_index = index + 1;
>> +                    *record_identifier = map_record_identifier;
>> +                    rc = STATUS_SUCCESS;
>> +                    break;
>> +            }
>> +        }
>> +    }
>> +    if (rc != STATUS_SUCCESS) {
>> +        if (s->next_record_index == s->first_record_index) {
>> +            /*
>> +             * next_record_identifier is unchanged, no records found
>> +             * and *record_identifier contains EMPTY_END id
>> +             */
>> +            rc = STATUS_RECORD_STORE_EMPTY;
>> +        }
>> +        /* at end/scan complete, reset */
>> +        s->next_record_index = s->first_record_index;
>> +    }
> 
> Table 17-16, says return existing error or ERST_EMPTY_END_RECORD_ID
> but nothing about op returning a error, so I'd assume status
> should always be STATUS_SUCCESS for GET_RECORD_IDENTIFIER.
done

> 
> Advancing to the next record is part of record READ op and
> not the part of GET_RECORD_IDENTIFIER as it's done here.
well...

>    "The steps performed by the platform to carry out ...
>       2. ..
>          c. If the specified error record does not exist,
>             ... update the status register’s Identifier field with the identifier of the
> ‘first’ error record
>       4. Record the Identifier of the ‘next’ valid error record ...
>    "

I used ACPI spec v6 and I was asked to locate the first occurrence of ERST in the spec, which was 
v4. So the above spec quotes are accurate, however, spec v6 deviates in an important way from the 
above, which reads:

   "c. If the status is Record Not Found (0x05), indicating that the specified error record does not 
exist, OSPM retrieves a valid identifier by a GET_RECORD_IDENTIFIER action. The platform will return 
a valid record identifier."

So GET_RECORD_IDENTIFIER is essentially a factory that pumps out record identifiers for records 
stored. I kind of think of it as the old DOS 'find_first/find_next'. And yes v4 of the spec states 
that the READ operation should initiate the first record_identifer. However v6 clearly states this 
is now the responsibility of OSPM, not the READ op.

I am thinking that the best way to handle this contradiction is to change the ACPI spec citation 
from v4 to v5, as the wording in v5 matches what I cite from v6, and implemented. Furthermore, this 
approach of OSPM obtaining the next valid record_id via GET_RECORD_IDENTIFIER is consistent with 
what I observed in BIOS and with how Linux is coded.

Thoughts?

> 
> 
>> +
>> +    return rc;
>> +}
>> +
>> +/*******************************************************************/
>> +
>> +static uint64_t erst_rd_reg64(hwaddr addr,
>> +    uint64_t reg, unsigned size)
>> +{
>> +    uint64_t rdval;
>> +    uint64_t mask;
>> +    unsigned shift;
>> +
>> +    if (size == sizeof(uint64_t)) {
>> +        /* 64b access */
>> +        mask = 0xFFFFFFFFFFFFFFFFUL;
>> +        shift = 0;
>> +    } else {
>> +        /* 32b access */
>> +        mask = 0x00000000FFFFFFFFUL;
>> +        shift = ((addr & 0x4) == 0x4) ? 32 : 0;
>> +    }
>> +
>> +    rdval = reg;
>> +    rdval >>= shift;
>> +    rdval &= mask;
>> +
>> +    return rdval;
>> +}
>> +
>> +static uint64_t erst_wr_reg64(hwaddr addr,
>> +    uint64_t reg, uint64_t val, unsigned size)
>> +{
>> +    uint64_t wrval;
>> +    uint64_t mask;
>> +    unsigned shift;
>> +    if (size == sizeof(uint64_t)) {
>> +        /* 64b access */
>> +        mask = 0xFFFFFFFFFFFFFFFFUL;
>> +        shift = 0;
>> +    } else {
>> +        /* 32b access */
>> +        mask = 0x00000000FFFFFFFFUL;
>> +        shift = ((addr & 0x4) == 0x4) ? 32 : 0;
>> +    }
>> +
>> +    val &= mask;
>> +    val <<= shift;
>> +    mask <<= shift;
>> +    wrval = reg;
>> +    wrval &= ~mask;
>> +    wrval |= val;
>> +
>> +    return wrval;
>> +}
>> +
>> +static void erst_reg_write(void *opaque, hwaddr addr,
>> +    uint64_t val, unsigned size)
>> +{
>> +    ERSTDeviceState *s = (ERSTDeviceState *)opaque;
>> +
>> +    /*
>> +     * NOTE: All actions/operations/side effects happen on the WRITE,
>> +     * by design. The READs simply return the reg_value contents.
> 
> point to spec, pls.
This was an implementation design choice, so no spec reference applicable, I left a comment.


> 
>> +     */
>> +    trace_acpi_erst_reg_write(addr, val, size);
>> +
>> +    switch (addr) {
>> +    case ERST_VALUE_OFFSET + 0:
>> +    case ERST_VALUE_OFFSET + 4:
>> +        s->reg_value = erst_wr_reg64(addr, s->reg_value, val, size);
>> +        break;
>> +    case ERST_ACTION_OFFSET + 0:
> 
>> +/*  case ERST_ACTION_OFFSET+4: as coded, not really a 64b register */
> 
> what does this mean?
In short, all values written to this register are just the ACTION ops, so there wasn't a need to 
implement this as a 64-bit register, especially since Linux seems to issue two 32-bit accesses for 
64-bit; in this case the upper access is utterly useless.
I placed a comment in code.

> 
>> +        switch (val) {
>> +        case ACTION_BEGIN_WRITE_OPERATION:
>> +        case ACTION_BEGIN_READ_OPERATION:
>> +        case ACTION_BEGIN_CLEAR_OPERATION:
>> +        case ACTION_BEGIN_DUMMY_WRITE_OPERATION:
>> +        case ACTION_END_OPERATION:
>> +            s->operation = val;
>> +            break;
>> +        case ACTION_SET_RECORD_OFFSET:
>> +            s->record_offset = s->reg_value;
>> +            break;
>> +        case ACTION_EXECUTE_OPERATION:
>> +            if ((uint8_t)s->reg_value == ERST_EXECUTE_OPERATION_MAGIC) {
>> +                s->busy_status = 1;
>> +                switch (s->operation) {
>> +                case ACTION_BEGIN_WRITE_OPERATION:
>> +                    s->command_status = write_erst_record(s);
>> +                    break;
>> +                case ACTION_BEGIN_READ_OPERATION:
>> +                    s->command_status = read_erst_record(s);
>> +                    break;
>> +                case ACTION_BEGIN_CLEAR_OPERATION:
>> +                    s->command_status = clear_erst_record(s);
>> +                    break;
>> +                case ACTION_BEGIN_DUMMY_WRITE_OPERATION:
>> +                    s->command_status = STATUS_SUCCESS;
>> +                    break;
>> +                case ACTION_END_OPERATION:
>> +                    s->command_status = STATUS_SUCCESS;
>> +                    break;
>> +                default:
>> +                    s->command_status = STATUS_FAILED;
>> +                    break;
>> +                }
>> +                s->record_identifier = ERST_UNSPECIFIED_RECORD_ID;
>                     shouldn't happen in case of Read op
correct, removed as not needed at all now.

> 
> "
> 17.4.2.2
> 4. Record the Identifier of the ‘next’ valid error record that resides on the persistent store. This
> allows OSPM to retrieve a valid record identifier by executing a GET_RECORD_IDENTIFIER
> operation.
> "
> 
>> +                s->busy_status = 0;
>> +            }
>> +            break;
>> +        case ACTION_CHECK_BUSY_STATUS:
>> +            s->reg_value = s->busy_status;
>> +            break;
>> +        case ACTION_GET_COMMAND_STATUS:
>> +            s->reg_value = s->command_status;
>> +            break;
>> +        case ACTION_GET_RECORD_IDENTIFIER:
>> +            s->command_status = next_erst_record(s, &s->reg_value);
>> +            break;
>> +        case ACTION_SET_RECORD_IDENTIFIER:
>> +            s->record_identifier = s->reg_value;
>> +            break;
>> +        case ACTION_GET_RECORD_COUNT:
>> +            s->reg_value = s->header->record_count;
>> +            break;
>> +        case ACTION_GET_ERROR_LOG_ADDRESS_RANGE:
>> +            s->reg_value = (hwaddr)pci_get_bar_addr(PCI_DEVICE(s), 1);
>> +            break;
>> +        case ACTION_GET_ERROR_LOG_ADDRESS_LENGTH:
>> +            s->reg_value = ERST_RECORD_SIZE;
>> +            break;
>> +        case ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES:
>> +            s->reg_value = 0x0; /* intentional, not NVRAM mode */
>> +            break;
>> +        case ACTION_GET_EXECUTE_OPERATION_TIMINGS:
>> +            s->reg_value =
>> +                (100ULL << 32) | /* 100us max time */
>> +                (10ULL  <<  0) ; /*  10us min time */
>> +            break;
>> +        default:
>> +            /* Unknown action/command, NOP */
>> +            break;
>> +        }
>> +        break;
>> +    default:
>> +        /* This should not happen, but if it does, NOP */
>> +        break;
>> +    }
>> +}
>> +
>> +static uint64_t erst_reg_read(void *opaque, hwaddr addr,
>> +                                unsigned size)
>> +{
>> +    ERSTDeviceState *s = (ERSTDeviceState *)opaque;
>> +    uint64_t val = 0;
>> +
>> +    switch (addr) {
>> +    case ERST_ACTION_OFFSET + 0:
>> +    case ERST_ACTION_OFFSET + 4:
>> +        val = erst_rd_reg64(addr, s->reg_action, size);
>> +        break;
>> +    case ERST_VALUE_OFFSET + 0:
>> +    case ERST_VALUE_OFFSET + 4:
>> +        val = erst_rd_reg64(addr, s->reg_value, size);
>> +        break;
>> +    default:
>> +        break;
>> +    }
>> +    trace_acpi_erst_reg_read(addr, val, size);
>> +    return val;
>> +}
>> +
>> +static const MemoryRegionOps erst_reg_ops = {
>> +    .read = erst_reg_read,
>> +    .write = erst_reg_write,
>> +    .endianness = DEVICE_NATIVE_ENDIAN,
>> +};
>> +
>> +/*******************************************************************/
>> +/*******************************************************************/
>> +static int erst_post_load(void *opaque, int version_id)
>> +{
>> +    ERSTDeviceState *s = opaque;
>> +
>> +    /* Recompute pointer to header */
>> +    s->header = (erst_storage_header_t *)get_nvram_ptr_by_index(s, 0);
>> +    trace_acpi_erst_post_load(s->header);
>> +
>> +    return 0;
>> +}
>> +
>> +static const VMStateDescription erst_vmstate  = {
>> +    .name = "acpi-erst",
>> +    .version_id = 1,
>> +    .minimum_version_id = 1,
>> +    .post_load = erst_post_load,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_UINT32(storage_size, ERSTDeviceState),
>   1)
>> +        VMSTATE_UINT8(operation, ERSTDeviceState),
>> +        VMSTATE_UINT8(busy_status, ERSTDeviceState),
>> +        VMSTATE_UINT8(command_status, ERSTDeviceState),
>> +        VMSTATE_UINT32(record_offset, ERSTDeviceState),
>> +        VMSTATE_UINT64(reg_action, ERSTDeviceState),
>> +        VMSTATE_UINT64(reg_value, ERSTDeviceState),
>> +        VMSTATE_UINT64(record_identifier, ERSTDeviceState),
>> +        VMSTATE_UINT32(next_record_index, ERSTDeviceState),
> 
>> +        VMSTATE_UINT32(first_record_index, ERSTDeviceState),
>> +        VMSTATE_UINT32(last_record_index, ERSTDeviceState),
>   2)
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
> 
>   1 and 2 aren't runtime state, so why they are in migration stream?
done; removed storage_size, first_record_index and last_record_index from the migration stream.


> 
> I'd imagine size could be used to check that backend on target is of the same size
> to avoid buffer overrun if target side has smaller backend, and fail migration if
> it's not the same. But it aren't used this way here.
I decided to not do this check as that memory object is migrated automatically, so I dont think my 
check adds any value.

> 
> the rest could be calculated at realize time.
and in fact they are.

> 
>> +
>> +static void erst_realizefn(PCIDevice *pci_dev, Error **errp)
>> +{
>> +    ERSTDeviceState *s = ACPIERST(pci_dev);
>> +
>> +    trace_acpi_erst_realizefn_in();
>> +
>> +    if (!s->hostmem) {
>> +        error_setg(errp, "'" ACPI_ERST_MEMDEV_PROP "' property is not set");
>> +        return;
>> +    } else if (host_memory_backend_is_mapped(s->hostmem)) {
>> +        error_setg(errp, "can't use already busy memdev: %s",
>> +                   object_get_canonical_path_component(OBJECT(s->hostmem)));
>> +        return;
>> +    }
>> +
>> +    s->hostmem_mr = host_memory_backend_get_memory(s->hostmem);
>> +
>> +    /* HostMemoryBackend size will be multiple of PAGE_SIZE */
>> +    s->storage_size = object_property_get_int(OBJECT(s->hostmem), "size", errp);
>> +
>> +    /* Check storage_size against ERST_RECORD_SIZE */
>> +    if (((s->storage_size % ERST_RECORD_SIZE) != 0) ||
>> +         (ERST_RECORD_SIZE > s->storage_size)) {
>> +        error_setg(errp, "ACPI ERST requires size be multiple of "
>> +            "record size (%luKiB)", ERST_RECORD_SIZE);
>> +    }
>> +
>> +    /* Initialize backend storage and record_count */
>> +    check_erst_backend_storage(s, errp);
>> +
>> +    /* BAR 0: Programming registers */
>> +    memory_region_init_io(&s->iomem, OBJECT(pci_dev), &erst_reg_ops, s,
>> +                          TYPE_ACPI_ERST, ERST_REG_SIZE);
>> +    pci_register_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->iomem);
>> +
>> +    /* BAR 1: Exchange buffer memory */
> 
> 
>> +    /* Create a hostmem object to use as the exchange buffer */
>> +    s->exchange_obj = object_new(TYPE_MEMORY_BACKEND_RAM);
>> +    object_property_set_int(s->exchange_obj, "size", ERST_RECORD_SIZE, errp);
>> +    user_creatable_complete(USER_CREATABLE(s->exchange_obj), errp);
>> +    s->exchange = MEMORY_BACKEND(s->exchange_obj);
>> +    host_memory_backend_set_mapped(s->exchange, true);
>> +    s->exchange_mr = host_memory_backend_get_memory(s->exchange);
> replace this block with single memory_region_init_ram()
done!

> 
> 
>> +    memory_region_init_resizeable_ram(s->exchange_mr, OBJECT(pci_dev),
>> +        TYPE_ACPI_ERST, ERST_RECORD_SIZE, ERST_RECORD_SIZE, NULL, errp);
> have ho idea why it's necessary, seems just wrong, it basically leaks
> previous memory region and creates a new one.
done!

> 
>> +    pci_register_bar(pci_dev, 1, PCI_BASE_ADDRESS_SPACE_MEMORY, s->exchange_mr);
> 
>> +    /* Include the exchange buffer in the migration stream */
>> +    vmstate_register_ram_global(s->exchange_mr);
> not necessary if memory_region_init_ram() is used directly
done!

> 
>> +
>> +    /* Include the backend storage in the migration stream */
>> +    vmstate_register_ram_global(s->hostmem_mr);
>> +
>> +    trace_acpi_erst_realizefn_out(s->storage_size);
>> +}
>> +
>> +static void erst_reset(DeviceState *dev)
>> +{
>> +    ERSTDeviceState *s = ACPIERST(dev);
>> +
>> +    trace_acpi_erst_reset_in(s->header->record_count);
>> +    s->operation = 0;
>> +    s->busy_status = 0;
>> +    s->command_status = STATUS_SUCCESS;
>> +    s->record_identifier = ERST_UNSPECIFIED_RECORD_ID;
>> +    s->record_offset = 0;
>> +    s->next_record_index = s->first_record_index;
>> +    /* NOTE: first/last_record_index are computed only once */
>> +    trace_acpi_erst_reset_out(s->header->record_count);
>> +}
>> +
>> +static Property erst_properties[] = {
>> +    DEFINE_PROP_LINK(ACPI_ERST_MEMDEV_PROP, ERSTDeviceState, hostmem,
>> +                     TYPE_MEMORY_BACKEND, HostMemoryBackend *),
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>> +static void erst_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>> +    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>> +
>> +    trace_acpi_erst_class_init_in();
>> +    k->realize = erst_realizefn;
>> +    k->vendor_id = PCI_VENDOR_ID_REDHAT;
>> +    k->device_id = PCI_DEVICE_ID_REDHAT_ACPI_ERST;
>> +    k->revision = 0x00;
>> +    k->class_id = PCI_CLASS_OTHERS;
>> +    dc->reset = erst_reset;
>> +    dc->vmsd = &erst_vmstate;
>> +    dc->user_creatable = true;
> 
> can't be hotplugged, add:
>         dc->hotpluggable = false;
done

> 
>> +    device_class_set_props(dc, erst_properties);
>> +    dc->desc = "ACPI Error Record Serialization Table (ERST) device";
>> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>> +    trace_acpi_erst_class_init_out();
>> +}
>> +
>> +static const TypeInfo erst_type_info = {
>> +    .name          = TYPE_ACPI_ERST,
>> +    .parent        = TYPE_PCI_DEVICE,
>> +    .class_init    = erst_class_init,
>> +    .instance_size = sizeof(ERSTDeviceState),
>> +    .interfaces = (InterfaceInfo[]) {
>> +        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
>> +        { }
>> +    }
>> +};
>> +
>> +static void erst_register_types(void)
>> +{
>> +    type_register_static(&erst_type_info);
>> +}
>> +
>> +type_init(erst_register_types)
>> diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
>> index 29f804d..401d0e5 100644
>> --- a/hw/acpi/meson.build
>> +++ b/hw/acpi/meson.build
>> @@ -5,6 +5,7 @@ acpi_ss.add(files(
>>     'bios-linker-loader.c',
>>     'core.c',
>>     'utils.c',
>> +  'erst.c',
>>   ))
>>   acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu.c'))
>>   acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu_hotplug.c'))
>> diff --git a/hw/acpi/trace-events b/hw/acpi/trace-events
>> index 974d770..3579768 100644
>> --- a/hw/acpi/trace-events
>> +++ b/hw/acpi/trace-events
>> @@ -55,3 +55,18 @@ piix4_gpe_writeb(uint64_t addr, unsigned width, uint64_t val) "addr: 0x%" PRIx64
>>   # tco.c
>>   tco_timer_reload(int ticks, int msec) "ticks=%d (%d ms)"
>>   tco_timer_expired(int timeouts_no, bool strap, bool no_reboot) "timeouts_no=%d no_reboot=%d/%d"
>> +
>> +# erst.c
>> +acpi_erst_reg_write(uint64_t addr, uint64_t val, unsigned size) "addr: 0x%04" PRIx64 " <== 0x%016" PRIx64 " (size: %u)"
>> +acpi_erst_reg_read(uint64_t addr, uint64_t val, unsigned size) " addr: 0x%04" PRIx64 " ==> 0x%016" PRIx64 " (size: %u)"
>> +acpi_erst_mem_write(uint64_t addr, uint64_t val, unsigned size) "addr: 0x%06" PRIx64 " <== 0x%016" PRIx64 " (size: %u)"
>> +acpi_erst_mem_read(uint64_t addr, uint64_t val, unsigned size) " addr: 0x%06" PRIx64 " ==> 0x%016" PRIx64 " (size: %u)"
>> +acpi_erst_pci_bar_0(uint64_t addr) "BAR0: 0x%016" PRIx64
>> +acpi_erst_pci_bar_1(uint64_t addr) "BAR1: 0x%016" PRIx64
>> +acpi_erst_realizefn_in(void)
>> +acpi_erst_realizefn_out(unsigned size) "total nvram size %u bytes"
>> +acpi_erst_reset_in(unsigned record_count) "record_count %u"
>> +acpi_erst_reset_out(unsigned record_count) "record_count %u"
>> +acpi_erst_post_load(void *header) "header: 0x%p"
>> +acpi_erst_class_init_in(void)
>> +acpi_erst_class_init_out(void)
> 

