Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8736C4E6E3C
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 07:37:25 +0100 (CET)
Received: from localhost ([::1]:47798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXdZb-0004wM-9F
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 02:37:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nXdVN-0003l9-Aq
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 02:33:01 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:54572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nXdV5-0003z8-02
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 02:32:45 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22P0xDBP007577; 
 Fri, 25 Mar 2022 06:32:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=12WLk2pUVfHtIUeJPi33EQXprkYThFD41IG9rHbbLA4=;
 b=qkz/G9sfZXvyPRMcxzKJV1Oj+1z3Rzp1b0aqhJtfuoFPlOGVk3aV/ctrS+UpgRHKwaG6
 1mQaEba+2YtR4IJLuk6heswVxZZ4Wkp/SoBiPCKZlFJRRiStLjNdww0yzORPxOOjR3EW
 /gmycbK614NAeQjWXC6HpbwD5cdhvwbaBqLxn+mlKiUV8csLsKZa/YHojHAECYlJYeUs
 LgNKhZxKKSCNwIL9CgtFLfa2CfE86wBqRvSX5SMshsr0sj3qXDtj1m48gVpXYLAFRHFu
 LIkgETQnE4b6B33cbxP7iNU2l+2aqTTp2QD5ltnd3O1W86UvTEUn83mBQEOITo9y6Gkm ew== 
Received: from aserp3030.oracle.com ([141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ew5kcx3ec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 06:32:19 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22P6WJNL054218;
 Fri, 25 Mar 2022 06:32:19 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
 by aserp3030.oracle.com with ESMTP id 3ew5792eda-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 06:32:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g2Jd/yjDd/YvRXmatiN/iJ6npeROnJ8kCbExs2Eg6Jm72kMj5YshYaEb9K7wIW4td26ClpkiywJmKSwNNUVB5soW+hyCkEXEpdK8KP7yXfMnns+C/VfgfxQI/MoWZcEGnwosJuvBYgsGX5ra3dXzUI9XNUe9pvcfvK3me6I8EAMGGWioTKrnVQ8rR4j65fpXla51jClF/SF1qtQG/iAXik+lpwKByEOuaGot0fUdY5Ww9UnnWhuUNMawW7RTPUbUVc+sP4cza9sodWYiZW87vbv8RDz8MP/2F217l9OampQ0yTdkCgVE0EUnSn9/MAhlX1ZwmkXTRBcF87MXTvtogQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12WLk2pUVfHtIUeJPi33EQXprkYThFD41IG9rHbbLA4=;
 b=iY1oNbLyowIaRkjBRnPU7zAeBHbmvlQewTL0TkuZxHSr9YhSUAxAxanOs3UhaAML9pm5kOM1N8VX+OxunLwpaLEps5an3P6J78OCYgblGL5EkvUKnP2c/qWDHeTpLFKLESxcDrhcvl7WB0XYQJzObBJTqSBzDb5uW7c03s2/xkuvcL42nw5B7zag4kdcRYD1UKjXgERYq7yHPG3nShlL1hTDnbtk32CCFG+CMuHcFznFjV5BYzyKEOTI6Hhk7QwGtnFZgDAmZYvbTbJZo7Ev5lw4TpU6yTQt6IGUwi+fRRDymSB7WB1Vefe580wKMtc0vSTGtmuB9oZgN1fKfn1JUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=12WLk2pUVfHtIUeJPi33EQXprkYThFD41IG9rHbbLA4=;
 b=C36XyFh0jaXibhE24mKQ7AG0H3ZReFLGHb2YZtiwC4UK8dvjp2Xtym3ye2+sMUohIEUCnRXw241e+Nfm6QLK6cUQl3KsAPOXfCNYGFEYcvRVuapj0gXpuUXa5o6oP0lnTG0JiYffkSRXNSPp4czZWTi5Z4IbndFN7e4RXDHUbj8=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by CY4PR1001MB2053.namprd10.prod.outlook.com (2603:10b6:910:3f::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Fri, 25 Mar
 2022 06:32:17 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::e478:4b5e:50a8:7f96]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::e478:4b5e:50a8:7f96%6]) with mapi id 15.20.5102.018; Fri, 25 Mar 2022
 06:32:16 +0000
Message-ID: <df7c9a87-b2bd-7758-a6b6-bd834a7336fe@oracle.com>
Date: Thu, 24 Mar 2022 23:32:10 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] vdpa: Avoid reset when stop device
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, 08005325@163.com,
 Eugenio Perez Martin <eperezma@redhat.com>
References: <1648024966-5170-1-git-send-email-08005325@163.com>
 <CACGkMEsjQp+gjHV23ntJ2oTBCdt-1TT0GGn-PFDjOvETz6sQ7A@mail.gmail.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CACGkMEsjQp+gjHV23ntJ2oTBCdt-1TT0GGn-PFDjOvETz6sQ7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:5:3b8::26) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a27bfbb-66fc-43fd-45e8-08da0e2934ae
X-MS-TrafficTypeDiagnostic: CY4PR1001MB2053:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1001MB2053EFFF68702389758632EFB11A9@CY4PR1001MB2053.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mq/kFAW3G5n/1AJjyR/TTUN0v+eM53p/GoHk9Lr5jKYyI21PWikNJq0hhiFGLA6VdWslbOG0V8rMhoT8PUa3GNIthUnNDCvrMU9SzL8UnzDjExRs9I04XOVA8pemR7qRyGjMUFB+YJCFG2Vbks2wHJ3H/8y3Cl33fSHyr9moIJffgQQRItVNNgYQp8iDGWLBo7Xywxiyaa4q0A052ROoLX5daFQw7WE0y+dMubbeq6j+ZoslSJBu1eE2Nle9fLdXd78wYNKRuVPpIdcmTDLcOR9ZrqNPYzIoAUZw+WAMoLpl5nSoAtCASuQz47V6V+rXAGMBC0sEJnYSSN1aI6v2b4PgMh4uNuCgp2i0OVb3qJb9jWzftSszV8zVWoZ3lGH2s8heeubqxcbKZI20zYq4zl+E8N511RLNOnZXBCif/Abbwy1h3kBT4wxRUhVrn7QJukDWauuN1XbjZlkFBxG8hAwX89TnLBZYhP+tOCeOwYSGgYHpQKqcE0hzY6l8lwDxDs84/3ihqUF4JFafwwQxmbbah9OC9dzaorNHblHeKA/UI1UlIlQcN2xO5Ky7aN+1jISw3OwRty0VT6eSnTzdK6ZPkHOm0gR7DPqnXXqIWLwVDdzuIdZwiRza1KlIWfF/i6dJus/Yto4yo/8OvmkjkAHScyy4kjWk+BWfl8j2hES/9JGVfJBlJ9lhfCfQ9nK4YqGmf5DZI7E5niQrPfnR/G57Qc7YzEVeP2oVRi9YwX0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(110136005)(8936002)(5660300002)(66556008)(83380400001)(54906003)(66946007)(316002)(8676002)(2906002)(66476007)(86362001)(6506007)(31696002)(4326008)(36756003)(38100700002)(6666004)(36916002)(53546011)(6486002)(6512007)(26005)(186003)(31686004)(508600001)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blEwN0FuQ2N3R1JIdmtJaU5keTJ1QlVEaU5FeWpxeHJaVE1oYytsUkJ6ZDIr?=
 =?utf-8?B?SFdiVFhoRkxudXFnNlFjeDgzdURkNFF3WE9kM0lvbnhHbTBQR2pEQ1JxVUFp?=
 =?utf-8?B?YXNNczJJZlVyWDlmVHZnbFlOaHFqTTAyTGd6T256UnA3S1ZldUhmeWh6Y3lE?=
 =?utf-8?B?REUzTEFsUnZFWUF3OERuYTRoYS9CQ2MwYmk5Z09rdld2a0pVMW1IRElJenps?=
 =?utf-8?B?K2tOVk1aYzNFM3cyVEtOV1JHYlF5WnkvNzFWNVBjSldTdHVVTXhNSDZ5a0RJ?=
 =?utf-8?B?RUhnUExudnZFTVZNM01FZzc4OHduWW9lWld0d3d5aVk3dlpLcE5UNHRVUWM2?=
 =?utf-8?B?RVFraWhWYXRoMHF4MmJlMGdra2RVUkJCQjI1UHFSa3BONTY4OEdVZy9ZWk5X?=
 =?utf-8?B?Y2x3eDRETGpmYmFpa1dxbEZCSWI5T0czRGVGR0Y3R0ZhYlYyNFYzTFQwOTlP?=
 =?utf-8?B?dUkwdm9uOU5hRnFBVGkvY09VdHNMb2l1TTdkbjYzREpZanFrN1hDL1hHL0No?=
 =?utf-8?B?Z29pMTRKeHJRa2NHSHpnTFByM2V6UlRCM1V3ZGxpSFdvNFpmNG1VK1ByNlF2?=
 =?utf-8?B?YUNKb3JOVHpPSnRCYVZxeE5nWGdXV0lYQ3U3L01HZHpRbUZzSzNydkp5N2Q5?=
 =?utf-8?B?ZWtBM1BtSGp0VUk3akxVZjdZVUNoRlhubmNoSlNlVWZtZ3Y5cEcvRURuaTl3?=
 =?utf-8?B?TFJ3a2RXZERoTGpMTmtDY0thMGJjREFVd0MvT3BaMDNIZ2xZY3pGTHQ5YTFM?=
 =?utf-8?B?R1JwWlFmWElFTU5YcjZEeVBjTUJIVk04OS9QQWxDSC9hU1A5NkpwQThKWitk?=
 =?utf-8?B?SUxSR0hyajlkSXhFRjlhdFdnTVFNT2dJNDhYbis3TnZqTnlvU0trNDBlNmlh?=
 =?utf-8?B?U2RRUTRNdzNYdnZnT1RwUXMrOVE1UC9xdldtdkgwem1hZUd4S1RBVW1DQjVm?=
 =?utf-8?B?YVpVQXRmM0ZuNXlsY2xwYTlKK2RlYnFWRk1lMTd1RnJyTHk0WDRvNFd0bk5M?=
 =?utf-8?B?V1FUemxUNzNORFY5Rkw3SnY5WWNqNEJaUkx2U0w4UVpVZ0ZrVGJmaE9JVDNs?=
 =?utf-8?B?aDEwQ010amttdVlBZlMyYldtTlpMcDcxYmk2QlVUNm5qVXFnNlBkYkdVWE5S?=
 =?utf-8?B?WXlBYTIzYzRUS1gwWW5YU3hGcmpjYUlIRXRrRXRqb2lVay9UTTA3bzNGbjM2?=
 =?utf-8?B?WUF6bTVLRWo1ekNZVUlvNWN2U2V2Z0ZPNmJFUFdSdEF0dUhneDJsM2dJWmZG?=
 =?utf-8?B?K0t0VUM1M0MzSnBCUkR2a2lrNTIxTnVONDBadEQ3OXY0MldhV0x5Sm1MRndI?=
 =?utf-8?B?Rk5COXRJR2JHZ1pEUVc4elNseXZXWEdZTjkxWHhsb2xlR0VDRmgwcjdaZU0y?=
 =?utf-8?B?VHhTaFdqSlRiWDVZZ1BLRmpLOWNoaHd4SklEdTZxeFVSaHJUTXprMGltdWl2?=
 =?utf-8?B?ZUhrM0JCaU9FaWtha3JpeVp2QzEzZ25ySzhVZU1iTWdXeWlhUkJSVWZGM3dF?=
 =?utf-8?B?T3NVZDJzbVdYeFRKQytpTFh6aHgvYlYvR2lzRDh6UXNlUzBSdTJBVTFoZ1FB?=
 =?utf-8?B?bkJuWE02akd3V3RxNWN6Wk9vNTNaK0VGaGkzUjl6ZG04U0loUzhFWkUwK0xP?=
 =?utf-8?B?T3kzN3NjQjIrOGlsL2lkbU4yS0wvaDJjTWRiY0E1dU9kbzFvdFNQMGZMYjlX?=
 =?utf-8?B?T0J1QXIrQnU5d05WVjNpL2NmdTBqTTdmUkZ6ZWFHcjR1U1ZqRXBEOVQycSs3?=
 =?utf-8?B?djVxc0NyL3BjeUtobFBqTWkzeHFhVE5rdmpGcVNjTGp2M0NOeTE5QnpQUUFo?=
 =?utf-8?B?TU5MdUNIL1d0b0ErN3E1NFB5U0tKZDJXMWcxbEhhRkVvV2FGMnNWZkNiSUh4?=
 =?utf-8?B?OVp4Q1VTbTJQUHA4S1lNd1ZSSHMxTGFaTDdSeWhublJpRXdpREh5eVYxd3Ev?=
 =?utf-8?Q?ULR9x28um4uDdyMkbHjjhx09/1bdDCPV?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a27bfbb-66fc-43fd-45e8-08da0e2934ae
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 06:32:16.8974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OooNQIr5itxSX9qEeuoAq3V2uzY8vLnTgRvJOh538xMb7sBOpXgeurhIDH2NhvWUl7mDgmPPLyQzjbDCudqR0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1001MB2053
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10296
 signatures=694973
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203250034
X-Proofpoint-GUID: IgMqLHOOUr5Uu3kttc1VdHGlhxpHBkBk
X-Proofpoint-ORIG-GUID: IgMqLHOOUr5Uu3kttc1VdHGlhxpHBkBk
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Zhu Lingshan <lingshan.zhu@intel.com>, Michael Qiu <qiudayu@archeros.com>,
 Cindy Lu <lulu@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/23/2022 2:20 AM, Jason Wang wrote:
> Adding Eugenio,  and Ling Shan.
>
> On Wed, Mar 23, 2022 at 4:58 PM <08005325@163.com> wrote:
>> From: Michael Qiu <qiudayu@archeros.com>
>>
>> Currently, when VM poweroff, it will trigger vdpa
>> device(such as mlx bluefield2 VF) reset twice, this leads
>> to below issue:
>>
>> vhost VQ 2 ring restore failed: -22: Invalid argument (22)
>>
>> This because in vhost_dev_stop(), qemu tries to stop the device,
>> then stop the queue: vhost_virtqueue_stop().
>> In vhost_dev_stop(), it resets the device, which clear some flags
>> in low level driver, and the driver finds
>> that the VQ is invalied, this is the root cause.
>>
>> Actually, device reset will be called within func release()
>>
>> To solve the issue, vdpa should set vring unready, and
>> remove reset ops in device stop: vhost_dev_start(hdev, false).
> This is an interesting issue. Do you see a real issue except for the
> above warnings.
>
> The reason we "abuse" reset is that we don't have a stop uAPI for
> vhost. We plan to add a status bit to stop the whole device in the
> virtio spec, but considering it may take a while maybe we can first
> introduce a new uAPI/ioctl for that.
Yep. What was missing here is a vdpa specific uAPI for per-virtqueue 
stop/suspend rather than spec level amendment to stop the whole device 
(including both vq and config space). For now we can have vDPA specific 
means to control the vq, something vDPA hardware vendor must support for 
live migration, e.g. datapath switching to shadow vq. I believe the spec 
amendment may follow to define a bit for virtio feature negotiation 
later on if needed (FWIW virtio-vdpa already does set_vq_ready(..., 0) 
to stop the vq).

However, there's a flaw in this patch, see below.
>
> Note that the stop doesn't just work for virtqueue but others like,
> e.g config space. But considering we don't have config interrupt
> support right now, we're probably fine.
>
> Checking the driver, it looks to me only the IFCVF's set_vq_ready() is
> problematic, Ling Shan, please have a check. And we probably need a
> workaround for vp_vdpa as well.
>
> Anyhow, this seems to be better than reset. So for 7.1:
>
> Acked-by: Jason Wang <jasowang@redhat.com>
>
>> Signed-off-by: Michael Qiu<qiudayu@archeros.com>
>> ---
>>   hw/virtio/vhost-vdpa.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>> index c5ed7a3..d858b4f 100644
>> --- a/hw/virtio/vhost-vdpa.c
>> +++ b/hw/virtio/vhost-vdpa.c
>> @@ -719,14 +719,14 @@ static int vhost_vdpa_get_vq_index(struct vhost_dev *dev, int idx)
>>       return idx;
>>   }
>>
>> -static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
>> +static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev, unsigned int ready)
>>   {
>>       int i;
>>       trace_vhost_vdpa_set_vring_ready(dev);
>>       for (i = 0; i < dev->nvqs; ++i) {
>>           struct vhost_vring_state state = {
>>               .index = dev->vq_index + i,
>> -            .num = 1,
>> +            .num = ready,
>>           };
>>           vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
>>       }
>> @@ -1088,8 +1088,9 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>>           if (unlikely(!ok)) {
>>               return -1;
>>           }
>> -        vhost_vdpa_set_vring_ready(dev);
>> +        vhost_vdpa_set_vring_ready(dev, 1);
>>       } else {
>> +        vhost_vdpa_set_vring_ready(dev, 0);
>>           ok = vhost_vdpa_svqs_stop(dev);
>>           if (unlikely(!ok)) {
>>               return -1;
>> @@ -1105,7 +1106,6 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>>           memory_listener_register(&v->listener, &address_space_memory);
>>           return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
>>       } else {
>> -        vhost_vdpa_reset_device(dev);
Unfortunately, the reset can't be be removed from here as this code path 
usually involves virtio reset or status change for e.g. invoked via 
virtio_net_set_status(... , 0). Ideally we should use the 
VhostOps.vhost_reset_device() to reset the vhost-vdpa device where 
status change is involved after vhost_dev_stop() is done, but this 
distinction is not there yet as of today in all of the virtio devices 
except vhost_user_scsi.

Alternatively we may be able to do something like below, stop the 
virtqueue in vhost_vdpa_get_vring_base() in the vhost_virtqueue_stop() 
context. Only until the hardware vq is stopped, svq can stop and unmap 
then vhost-vdpa would reset the device status. It kinda works, but not 
in a perfect way...

--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -564,14 +564,14 @@ static int vhost_vdpa_get_vq_index(struct 
vhost_dev *dev, int idx)
      return idx;
  }

-static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
+static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev, int enable)
  {
      int i;
      trace_vhost_vdpa_set_vring_ready(dev);
      for (i = 0; i < dev->nvqs; ++i) {
          struct vhost_vring_state state = {
              .index = dev->vq_index + i,
-            .num = 1,
+            .num = enable,
          };
          vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
      }
@@ -641,7 +641,7 @@ static int vhost_vdpa_dev_start(struct vhost_dev 
*dev, bool started)

      if (started) {
          vhost_vdpa_host_notifiers_init(dev);
-        vhost_vdpa_set_vring_ready(dev);
+        vhost_vdpa_set_vring_ready(dev, 1);
      } else {
          vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
      }
@@ -708,6 +708,9 @@ static int vhost_vdpa_get_vring_base(struct 
vhost_dev *dev,
  {
      int ret;

+    /* Deactivate the queue (best effort) */
+    vhost_vdpa_set_vring_ready(dev, 0);
+
      ret = vhost_vdpa_call(dev, VHOST_GET_VRING_BASE, ring);
      trace_vhost_vdpa_get_vring_base(dev, ring->index, ring->num);
      return ret;
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 437347a..2e917d8 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1832,15 +1832,15 @@ void vhost_dev_stop(struct vhost_dev *hdev, 
VirtIODevice *vdev)
      /* should only be called after backend is connected */
      assert(hdev->vhost_ops);

-    if (hdev->vhost_ops->vhost_dev_start) {
-        hdev->vhost_ops->vhost_dev_start(hdev, false);
-    }
      for (i = 0; i < hdev->nvqs; ++i) {
          vhost_virtqueue_stop(hdev,
                               vdev,
                               hdev->vqs + i,
                               hdev->vq_index + i);
      }
+    if (hdev->vhost_ops->vhost_dev_start) {
+        hdev->vhost_ops->vhost_dev_start(hdev, false);
+    }

      if (vhost_dev_has_iommu(hdev)) {
          if (hdev->vhost_ops->vhost_set_iotlb_callback) {

Regards,
-Siwei

>>           vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>>                                      VIRTIO_CONFIG_S_DRIVER);
>>           memory_listener_unregister(&v->listener);
>> --
>> 1.8.3.1
>>
>


