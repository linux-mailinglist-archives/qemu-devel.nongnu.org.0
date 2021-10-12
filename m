Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F34429F6A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 10:09:50 +0200 (CEST)
Received: from localhost ([::1]:44470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maCr7-0004dv-6z
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 04:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1maCVe-00038q-FC; Tue, 12 Oct 2021 03:47:38 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:41882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1maCVY-0001Ei-6T; Tue, 12 Oct 2021 03:47:37 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19C7WpuE030208; 
 Tue, 12 Oct 2021 07:47:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=corp-2021-07-09;
 bh=gQLxA75hR59rBMw4WO9tNvg/bTKHQ9QGPV94xDfPxF4=;
 b=lZWC8OlYCiqNPzeWXER59AcHmELzS6ddXAvOu0918aFLW135ofNiSCmONPf4XptHxMjl
 p8RplBpgbZv8QBhCU8YFXi+9gGK+VY8KUB3sHC16g2wi3NWcB7QYSpGvg2hzW84Q4i8l
 bDYrZZjX0KiGwLNPca5yAOAszoVqXtNDwRhic0GCNeiJvOk5dVLpM7M9hvAKNaJdqXoV
 toNVptRjAUPR0vQc5IF5lFPZsBtQ+eCVjb7gcN03QY48cm+1dhs+b3W36Iw6GnhcCu6k
 iYrtiJ7tyq4u8OZgHHP1cPQZz+F6WYty6lSrOeEc18tITDLH6LpiG4HkaP55o+Oweaov IQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bmv41kact-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Oct 2021 07:47:21 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19C7kTj8049961;
 Tue, 12 Oct 2021 07:47:20 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
 by aserp3030.oracle.com with ESMTP id 3bkyxr8ua1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Oct 2021 07:47:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VFR6fjDaDwAxWL3XBWH1/qS/8gU3wQxAGd9R444rubLBXN98ShXQjli+vmBoQXOHY28oc5/iYBU31DR3M2t3z63PVPpQJm0TvkLe/LNmnPfLF5GH3IAsCU1zWgs/FumrMl8efivXnbLMhhF/WHQ4hOMvor2ipieID59lgKg0htjrhjRUO/eMRB0Udwv/b0sXNv+UsqfGHE6mcyVGEkOIvrhNCuVRVC+Up7yX6mU6iFUSAgcbhrjD916KP3tLCVlbuVyb+LmEYBrZtU7yrF2uRHeFbiEspbyDYxEKHRF+IrbiEYeKpv2Mxo1DJpRweo/AQELRP1VYFWkp2J3ykgmlaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQLxA75hR59rBMw4WO9tNvg/bTKHQ9QGPV94xDfPxF4=;
 b=hKXM28jG2yuo41RrdpQc9wFnQZiSDtgFlpHd+u2lZxc3ANNYmL2Bmpga70AFRsmWOC+RbWZzfY0cPsQwEyNwcttQ2byR6c7ezD47KwQoyi0iUrZFzJuQ/M2eHQtxDxb20G8M1zu390kaINzcWRhBMqggbtyA1GMi+GUJ9OVlpJsKILdBn6v2wA0dulLHfAIqKttm+nKnYvH+ZYHCW1QGWjN0eQPdJNv1Ra8oILumAx5NB+7RUsBD1O8VGJ+qY+5amvgmfSojr6/KcT1CYkfNIie7qnXq1lbuRBWyNxVE1zg7jATIl5T7NQfHRSb+9RFvTOKCfqcoPPDrV7Sw5F0a2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQLxA75hR59rBMw4WO9tNvg/bTKHQ9QGPV94xDfPxF4=;
 b=q28k8tFpPO942jDtA5qkTBtVfszvKux/aRXCEafsOaPXQZL7lUUky6TJpFnCSMlCXkvw62oYehEm78A2iksFvSuxU+P+NHA49+fjKlZJkRdV598VOF5E2nYWbStbir4E2rFPi09ehXdGUelj1I1o+tUxK9ED9QW8iIK7DxTiwWw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4727.namprd10.prod.outlook.com (2603:10b6:510:3f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Tue, 12 Oct
 2021 07:47:18 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517%5]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 07:47:18 +0000
Subject: Re: [PATCH v7 7/8] qmp: add QMP command x-debug-virtio-queue-element
To: Eric Blake <eblake@redhat.com>
References: <1633452353-7169-1-git-send-email-jonah.palmer@oracle.com>
 <1633452353-7169-8-git-send-email-jonah.palmer@oracle.com>
 <20211007132507.ldq27vwqmpym2sgs@redhat.com>
From: Jonah Palmer <jonah.palmer@oracle.com>
Message-ID: <887adbf9-eda6-e8b1-8c88-e8067c8354c0@oracle.com>
Date: Tue, 12 Oct 2021 03:47:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211007132507.ldq27vwqmpym2sgs@redhat.com>
Content-Type: multipart/alternative;
 boundary="------------C899CFFD467E5FECB5AA4401"
Content-Language: en-US
X-ClientProxiedBy: SJ0PR13CA0138.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::23) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
Received: from jonpalme-lnx.us.oracle.com (209.17.40.42) by
 SJ0PR13CA0138.namprd13.prod.outlook.com (2603:10b6:a03:2c6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.5 via Frontend
 Transport; Tue, 12 Oct 2021 07:47:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 917c7b70-794c-4cb0-8d69-08d98d5483b3
X-MS-TrafficTypeDiagnostic: PH0PR10MB4727:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB4727EF08785DF94E6F56E846E8B69@PH0PR10MB4727.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YnV2KWEU4KIzrpF4fDqpqfMarXdl0HhmhBofA1buQS5yiKaJfQXv6GeLunBDFm8Lmk+Zul8X7BCdzhcGW4VdJ5GJjXnX1brSbyXiRRNyS5uxNC7TKdQwTSPaLawAPZvH6ZzaPl42bA2byNTkHT/SC7+ezw5P+/sBQb24BpTJ8vVqqtQmqEekKA65cN7araFfol+E/c2znQRAlPaCT4mMJvKqhjtxnx14NGnUbHDUpA684MPqd0laCU8wFxHG0FmaVPzdJs+Oam+m5JivTs8wOusG/AcTaST0mrKa2JgICJROgYB86M54E+OZELXcTGv3sMydaLQuFsUqp3nBTA6/B9Ox/PnQJsTZ82Ii4dU3fvDbYUS8e8QTDtqUksVag5Vw+fzWbIEv+bGSCj5soCNaLzUgmAJOTuK/BwHxGPZFlV4Ut6JZ2FDimmyxkS2NVgA6LxC2hM3l0K5Zb4YjEt4OcgsnCQceQ0DsIzi+v0MuOGeWlCMelrjEPdC75XsdErvVugGBnAj5D/nESftvUMtZ+piMuQJwi0FjSsq9Tz0fP37joOR2wtdS+/jFcDNv2PJqMr/4/Acn4pOHK3/uMbf+LBXW0JyaLjAychDm6zL14pq/19kTLnllWfAQLEXMNx+M2qfVBQOJGCYybzbb6HboQamd9xC0urDaUn1HkrB1/N/6tTsd55LnKSGqH/TXZwsikiPAAtcVdZhtZrc+3dRWLTbZrNqZGzqY/aniJF5SyIM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6916009)(956004)(26005)(66556008)(5660300002)(2616005)(38100700002)(31686004)(53546011)(33964004)(66476007)(7696005)(186003)(6486002)(36756003)(86362001)(66946007)(31696002)(8676002)(316002)(8936002)(2906002)(7416002)(44832011)(508600001)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SCtnNDN6aE04WnZjUVdLdFI4N0xocnNIejNNWms0WTRsQ3I1Ukk5dXdQeWtq?=
 =?utf-8?B?M3U0RnZPOEZib3dDZzVxTUJaV1R4eXhiVDRZenJaNmxCRnBETXBNUkJ5UGVG?=
 =?utf-8?B?NDI5cURuV3hoc01UTmxKY1RGY3FqdTVNeWk4WGt5VlNDdzNRQ3B6bWVhRFpl?=
 =?utf-8?B?VUhGWEZONEl0OTFaZnk1UHV1RHZXcGtrU3FuQTk0ZlJ6TUx5V0R0a1RKSXpw?=
 =?utf-8?B?c2JubXcvOE1PeUNQeTNXSXQ3cVZCazVuSjFtT0pDUE1JR0RDOTY2WjVHZ3VB?=
 =?utf-8?B?cjdkRG9vQnpzMk1PVUJjU3JPc01CUEVxQWZrcnhOY0dxbThEeVhMVFFUb0k1?=
 =?utf-8?B?L1hpbGJZQW0xSGcwdHMxbXhzK0xFZStPakNreWVkM0NORXVUbzRId0ZRdXl0?=
 =?utf-8?B?VUxkdFFxTHNNL0c5YVdCK3JYQjRxRUZwSHovVFRsSWI5QUlpL010dFlBQVV1?=
 =?utf-8?B?VDdzNXVZUkh1ajdjanhIY05rQ0NxQis2Nm1mWWd1UWdtbGlGTlAyM0NjRlBx?=
 =?utf-8?B?VGJhVjFXNkJIbHROb3RTQ0ZRa282UUM0emxzRTlqTm5tc1EzelR5ZDcvWFhj?=
 =?utf-8?B?UGJ1Zk1BMkhuZGtwdkRxb1Bmbmo0NzRtbkt6Z2UwbkZUUy9nZlpZQm82M0cy?=
 =?utf-8?B?em5sTkRZbmJhbjZLN1FZZDFGL1dKVHVBYzNLODRBSTQvc2ptc3dia09XdzBX?=
 =?utf-8?B?MGUrN2JvY21wRFZxLzlLMVZoN3dRc2s1TnhSR2ZtcEw4TFFxWTIybnhvNm1k?=
 =?utf-8?B?dTVYdGgyV3hXZ3ZvaVAyNHk5SUZFc290c1lDRVJTN21WTUI2K1o1TDZ3L3Rj?=
 =?utf-8?B?YTRJMnptQnZ1bS90aFBCc2dqK3pZRm50M3hHTFIyOUpuRDRJbHU0U1pqREp2?=
 =?utf-8?B?Q3hiRHU2aVU3VS9YbUsyOE1qdmtzekllUVI5VDNNd0ZWbHQzV3ViVk03WCtE?=
 =?utf-8?B?K3d2S3Z1bEFNTzhML1czV3MzYyt0T3FhVmZFTVlaTG1MUlNVbG50cVlHZG5R?=
 =?utf-8?B?TTgxYzhIeHRJMGtRbUdWZEhmcjRTQTR3ME1vZ3NQRy9qbXM4ZGUxaTFqaGR6?=
 =?utf-8?B?SytVTFNEOXBackppUVpzS0VUY0d0dFRSS1NNTEdteXV6Y1F2bnZBcVdTd1Jt?=
 =?utf-8?B?T0UzQkcyUVE5U2dkbkJFZSthTnRJQjhxM0k0NTJJcGdzdUpLZjErOEVObXcv?=
 =?utf-8?B?dVE3aEJDdURyUUFVMVllQU5ud29yV05VWXMwNGttdENYZGMyUzZ2VXZZRkxW?=
 =?utf-8?B?SE9KY2pYUWtwTnpvYnA5VTYrMDZNam5peGYvRnJVNytqQjhhUWlvTnRKZ0JO?=
 =?utf-8?B?MWY5SmpQb1pnWmVpZlZ1OWhUY2pBUVN2V2ZLcWgzVkV2TjVkMTVlUTI4MFQy?=
 =?utf-8?B?UkRpanA5MHM2ODQ0Rm00Wm9vWTV1cngwb3VFUVhhaFg2TUVyTzgydVc2SXd1?=
 =?utf-8?B?M3VLVTRGVWhUS2FHbmVDN1BOdkZkbWZzWGt4N2RNdW1pMzByUHRwMXpVLzB1?=
 =?utf-8?B?cysveExyV1JmMkdwNHVCRVNhVXJVZjd1VUpMemJGakorYTZHcTZoZHd3WDgv?=
 =?utf-8?B?RjZEWXlrUXhCSi94ZTRYNS9GNVpFNlBHUDV4dkJkT2dhWlgzay9SNmJLVmdu?=
 =?utf-8?B?SVQ3NEgwY3FVaDVpZkhnaW93QlR4QTJpTWR3ZzRnNHFna0k5TW5YRG9qYzI2?=
 =?utf-8?B?T0NCdDNBd3dnaUo0OHI3SzU2NWVmMnczam9FOUVtVVJYSERNbGY1b21FNzVh?=
 =?utf-8?Q?K1vvLApfsWQuVDYmK9GVJvMRVrP4Zyemsg3orkI?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 917c7b70-794c-4cb0-8d69-08d98d5483b3
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 07:47:17.8416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yTZpeDgTSgkgkkhH2JDYiaFtVZJHE+Cl4EGstCqpaPJbhrZV+IF5jMVJilL64PNnfwUzm8Jn0RDCXsOkA9ZVUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4727
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10134
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110120042
X-Proofpoint-ORIG-GUID: i-QErU-Rm2om65oMBnrWBAd0sOjQPExC
X-Proofpoint-GUID: i-QErU-Rm2om65oMBnrWBAd0sOjQPExC
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, MSGID_FROM_MTA_HEADER=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, thuth@redhat.com, qemu-block@nongnu.org,
 mst@redhat.com, michael.roth@amd.com, david@redhat.com, qemu-devel@nongnu.org,
 amit@kernel.org, armbru@redhat.com, eric.auger@redhat.com, kraxel@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, si-wei.liu@oracle.com,
 marcandre.lureau@redhat.com, joao.m.martins@oracle.com, mreitz@redhat.com,
 boris.ostrovsky@oracle.com, dgilbert@redhat.com, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------C899CFFD467E5FECB5AA4401
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/7/21 9:27 AM, Eric Blake wrote:
> On Tue, Oct 05, 2021 at 12:45:52PM -0400, Jonah Palmer wrote:
>> From: Laurent Vivier <lvivier@redhat.com>
>>
>> This new command shows the information of a VirtQueue element.
>>
>> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
>> ---
>> +++ b/qapi/virtio.json
>> +##
>> +# @VirtioRingAvail:
>> +#
>> +# @flags: VRingAvail flags
>> +#
>> +# @idx: VRingAvail idx
> Is it worth being consistent...
>
>> +##
>> +# @VirtioQueueElement:
>> +#
>> +# @device-name: VirtIODevice name (for reference)
>> +#
>> +# @index: index of the element in the queue
> ...and spelling things 'index' everywhere instead of sometimes
> abbreviating?
>
> But overall, it looks like you did a nice job of making the command
> machine-parseable, while still leaving the flexibility to alter it as
> needed since it is only for developers under the x-debug- namespace.

I think I'll elaborate a bit more with these definitions (for all patches).
After attending the QAPI sync last Thursday, I realized developers would
like to see more thorough documentation in these files. For something like
virtio, this is probably worth expanding on.

Jonah

>

--------------C899CFFD467E5FECB5AA4401
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/7/21 9:27 AM, Eric Blake wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20211007132507.ldq27vwqmpym2sgs@redhat.com">
      <pre class="moz-quote-pre" wrap="">On Tue, Oct 05, 2021 at 12:45:52PM -0400, Jonah Palmer wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Laurent Vivier <a class="moz-txt-link-rfc2396E" href="mailto:lvivier@redhat.com">&lt;lvivier@redhat.com&gt;</a>

This new command shows the information of a VirtQueue element.

Signed-off-by: Jonah Palmer <a class="moz-txt-link-rfc2396E" href="mailto:jonah.palmer@oracle.com">&lt;jonah.palmer@oracle.com&gt;</a>
---
+++ b/qapi/virtio.json
+##
+# @VirtioRingAvail:
+#
+# @flags: VRingAvail flags
+#
+# @idx: VRingAvail idx
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Is it worth being consistent...

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+##
+# @VirtioQueueElement:
+#
+# @device-name: VirtIODevice name (for reference)
+#
+# @index: index of the element in the queue
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
...and spelling things 'index' everywhere instead of sometimes
abbreviating?

But overall, it looks like you did a nice job of making the command
machine-parseable, while still leaving the flexibility to alter it as
needed since it is only for developers under the x-debug- namespace.</pre>
    </blockquote>
    <pre>I think I'll elaborate a bit more with these definitions (for all patches).
After attending the QAPI sync last Thursday, I realized developers would
like to see more thorough documentation in these files. For something like
virtio, this is probably worth expanding on.

Jonah

</pre>
    <blockquote type="cite" cite="mid:20211007132507.ldq27vwqmpym2sgs@redhat.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
    </blockquote>
  </body>
</html>

--------------C899CFFD467E5FECB5AA4401--

