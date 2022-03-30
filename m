Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2CF4ECA67
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 19:15:42 +0200 (CEST)
Received: from localhost ([::1]:45808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZbv4-0008N5-0X
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 13:15:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nZbsY-0005hI-Ey
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 13:13:06 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:64588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nZbsR-0004Y5-OA
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 13:13:05 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22UFL5Ht029851; 
 Wed, 30 Mar 2022 17:12:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=6DHovL+OmY9jJbTbXF4Xg5y6u9hpR0iBxHxH5ACMdp8=;
 b=vsn7MlMucnicj4P1zhNNJ5f2ooHCaXYTh/C0/nPUSp4DakkB8XlQE0QIQYNdC+WRMKE8
 tsdkD6TkYVCTOjpPhcbmT3sTQx6J140feiVMYRa0ZQOTD3/D+AIDSRcXyvX4H4kvylPT
 /UhCtMZKODdgOZel2dQ8esEsqeWT9M3X96HPl1UKKIirKZZ9ski/LoFASKBdpdtaiisw
 gCUmXSGCKStlHxLbwfDWxo0TnJseam8dcIyMVoVZjYBjGzrrMUBAA7+6/vDoA+eQqrj9
 jA5LL3l+IeDDOp5CjimHoAHAZEZJMfS7TZALl+JxmbhAimnjbU2MfDpHtv2LwrdV6yA9 Sw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f1tqb9yu0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 17:12:51 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 22UHC4Mi002996; Wed, 30 Mar 2022 17:12:50 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3f1tg72218-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 17:12:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g39SfgJ1nxNNI/sA4cATP0FewRl9agDzxBtlDHolqgrDJ9ZWhG0CmO9ycwwSS3Lgo1Ug2Bykwp4jyVzC4zYivcz+f25+Gcpy2VUWqtiZeELblKBhVq1n/CsFc84QdMhn5yh8+A5pWvF10Y7AikzUngvle3M3JBcoreRZumKIhPT6Oorhi9IGz0pjS00m1hnrl4c57SvAhrOgSdACzb98qTzBFHUcpYxJzDiGYpMOc7iQPQJm2xwSn7L8lQPZcIatS86QcGO/dtjvMQAweC76zJkHA124nv7HTiWHqwrIrek8+l36X7SdG19Ayj4MIKonlm4olNKSucvbi+oXJSnYew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6DHovL+OmY9jJbTbXF4Xg5y6u9hpR0iBxHxH5ACMdp8=;
 b=nXqWIwASnNAwpC+yQdeYJUQvgMW3oQD53kjJJluDhfR19k6rf22pTeJ6kYxK06If3Y8Nna0hvcVSLTPeqfnlEqIo4/57YBHEryC3Oa+TItL6ON2BH/9FPYhozHQsPx/O4GZIfy0Z799Zqvl30p+IoJoNDJGbDwpVr/7O641ZsbTWgz24kr8aCqdLj6lv0q34PFDWI+6gGd7EoK76pyZgIg80opDyeBEUrRbL4Ttuy6KqXv7jS7FxZ07qz16A9njHPKMM60xATshSNzIzFxLT+ysGwBC22Ov60XHtfN6+JkrsczxE6uq9TyJ51xZTQrzr44PLn0gvoXzr4fBqy/f55w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6DHovL+OmY9jJbTbXF4Xg5y6u9hpR0iBxHxH5ACMdp8=;
 b=KFvqx9AWEeIezlX0D4LU1mxl5U0MuJSKGUm1T2yVqSf1z5EkBsqpSQxVHpC3Yghd4YLMxt7CyODDuo8Cihyw5L1p1Bny62IvCmeiDJ7AqteOLsbwbLc3HFwKB8QW7tMItY8keLfBsW2riKGLoql6NJtI0L/uJ0nJA5AVISRxulM=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by BYAPR10MB3575.namprd10.prod.outlook.com (2603:10b6:a03:11f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Wed, 30 Mar
 2022 17:12:47 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::e478:4b5e:50a8:7f96]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::e478:4b5e:50a8:7f96%6]) with mapi id 15.20.5102.023; Wed, 30 Mar 2022
 17:12:47 +0000
Message-ID: <eaac0521-949d-6f8e-63e0-cebecd9a33b9@oracle.com>
Date: Wed, 30 Mar 2022 10:12:42 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 7/7] vhost-vdpa: backend feature should set only once
Content-Language: en-US
To: Stefano Garzarella <sgarzare@redhat.com>
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
 <1648621997-22416-8-git-send-email-si-wei.liu@oracle.com>
 <20220330162406.62cnedwmn4zn6ars@sgarzare-redhat>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20220330162406.62cnedwmn4zn6ars@sgarzare-redhat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM5PR11CA0015.namprd11.prod.outlook.com
 (2603:10b6:3:115::25) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0feb5e16-0859-49a4-d7b2-08da127082e0
X-MS-TrafficTypeDiagnostic: BYAPR10MB3575:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB3575A85ABF71A945972C29EBB11F9@BYAPR10MB3575.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AGChloQq3jXNSH8j8zfesngyjhvGxCUwIt1o2C+UeFp6xb9Hbag2TVsrTUpjTVZvl0YCpxq4m4PPGzeQBBJ3BUvHiNOCLevYBQNEzLhrqtL5HnTDkU/RhvOB/hcMI5WuZOy3QYnKqJmIs4uYXd/36HhisFNKgAVxd6Ep5EcIquV2Q7zW+urZvevNSFJGrBcIl2Yv9AdhRUtb5t7EsWMXDpQogi/CJADTfhRcF/+8BpuZTclIyU9E5skUkooZzgVQL4EAiWLDDCcpjcYY/ALv63enJ9LEwT9c2RIcHOaJ3DyOjsetQIjWSmEd4fMWJt9r7Cb5rxrsJmk+WTykpiKKn8sfJRUsZFnUc8G4pjIaBlW+HB0abKcro16kti1VD1zNFOK8ybABEAFbI73BDRB/N4KRDLhpFDZ1rixLFvooNlr013zbP8G6Pq0AseJuwudtryAJtq3432kodC/zreq/tOtoQ7cg5/79r9YSsN470TL8Ad4MjqPlUWEV+MAEldj9YmrjIRxdhAJb7cJ5LkcvAsOM3WQpltT/n726Nk/f9V8yL1Zsr2OrguYfg4Od51QdrTjEQDgiJVSlqSCk6OvgBtdRAdTg28K/rSzmhyRu4OVJmcoRBGUPdk8nIN5bkKdO6C2JQx30WYw0dx4wp+2eEAuS9ZIVD0J+pVe8DmNEiZw6VksX2sCz07mTsUGnS2kI/wP+V+yTjF7FUmbYuZcGXhIbTMEzsVqQVLjV5rYRQyQ1VVNDy2I/45Y/ESOZcIUJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36916002)(8936002)(6486002)(8676002)(4326008)(66946007)(66556008)(31696002)(2906002)(316002)(5660300002)(508600001)(6666004)(6512007)(6506007)(53546011)(86362001)(66476007)(36756003)(26005)(186003)(6916009)(38100700002)(31686004)(2616005)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3NzTDlPQVdselFManpsM1lZbnlkMEEwWGpza290TVA5c2p4ajNVM2RMdFph?=
 =?utf-8?B?TWt5VVhLbytFanN5OGJnMjI2WS9GRTE1U0I5SFowZjJkdHJPSTh6clpOV0pt?=
 =?utf-8?B?aFgrQW84ajd2d2ZiQ3djazRwc0lzdUdzcHdQUVBENllLR2g5OUtMbU9TSzVN?=
 =?utf-8?B?SkkzSnh2VEVDMnkrYkswWkZnczgrUUQ0Q2x2TW5SSWw1a0JWd0d6YXF0TFFQ?=
 =?utf-8?B?QXNOc0JKaWlZejV0WEpKb0dveXNGVmkzckhmcFlhTlNVQmt2TFFWQUpjeGJN?=
 =?utf-8?B?UVpraDJZVXFKbFY5NW1mSnB5WjZISlR0bjJScFR4RXRyZksyL3MyVGhvNFdC?=
 =?utf-8?B?Wk1qRVM1c1hrbGpWVnJOTW5FYjBqTFd3QmttdFlZSXF4M3VsWVNRK0hlY2gx?=
 =?utf-8?B?WDBBOTJ5MDFEYkkzbTlITmE0VVlKTTI1NjNjTm9aTkQ2Zms5ZkFUV3NRVFlJ?=
 =?utf-8?B?Vm1mQkQ0Z0NLc21RWUYrWTJXYUVOd2xTM1hua3IxUnoyQTNIaGdLdFg2cU5I?=
 =?utf-8?B?bnBIUmdmNjdGQ3pzdTZPT1RPVHJUZjZtRUkwSE9TYWt1Z1l1RTMzVkdPakVS?=
 =?utf-8?B?dTZuT2QxU3FDQ1lKS3U2VDhLaVBoOVhQQ3duRWd3U3luU0xyUXk0RjQ0VG5u?=
 =?utf-8?B?TFpLc0lsK25wVVBRcHFXSFBVbUlHRG5RdXJIdXZjQU9XOUloL2tmNkJnSnZy?=
 =?utf-8?B?UU9iMnREN01RNFVTZHRNdEZtWTBQZkxmWll6cU8ycGVyMDljNVRYR0l6TjY0?=
 =?utf-8?B?VU5aMVpzUDZIYzdVWXFEUFdvV25LQ0hZend3c2IzSFFBSDB1WmZ2OGxzWjAr?=
 =?utf-8?B?ZzErSmw5ZmdJczQ2ZDN0MUFsQkJGMWpKYjltZjh0MW0zVEJkSG01cXV1NktD?=
 =?utf-8?B?VytrSTBkWWhPczB0Zlo1YXZpNml3ZEUvdEk3eHRLaDQ2dTJQZnk2SEZMcWxl?=
 =?utf-8?B?OWRRMTcvVFdJZXBrQzkzdmJwL0dMamFtaXFPWWxTN0pWYXVSdkVYZG1YZ2Rs?=
 =?utf-8?B?bzBnRGg4cG5Dbmo1MHFpdDIxOWtmWE55WUovK1h0a0Zmb3VRM3pwM1pmM09s?=
 =?utf-8?B?WDdIY1VuZmJ4RUhCczlJNFhGLzVLYmIrcjNtU2pnbEZzZHdlNEFXU3Zyc002?=
 =?utf-8?B?WDI0UXNDRllzc0Y1ZDdQa0dRQ1hZeEFyZ3pIN2hxbmU3UzlLZEUzaGlXem13?=
 =?utf-8?B?T1FZR21BQUJzRVc1TWRpOHFudWl2NFhwbE5ZdVl4Yjg4d1ZFR05WSDN0emNs?=
 =?utf-8?B?b1hqN1drUnFuWVhFOGM0YVk3dFdvLzdub0pYRTJRQVdzRStkdWpZN1pJSDQx?=
 =?utf-8?B?NGIvTWRBaGtCY3lmd09oa1l6elZCcm9TZUU1QlR0cld0a2ROS1h5aUNhb0U0?=
 =?utf-8?B?Q2xxZEIyYUUyUGxxcFZ0Sk5ZdjA1QUZQaVFsUk8yMkJYSGQ0UFBnR1hwZm1S?=
 =?utf-8?B?YllZNSs2ekVjd3Y1bWJlQzdTampQc2E0VlFNM3d3L0lLQTdIeTB3YkM2anVD?=
 =?utf-8?B?ejNaK1Ftc3l5QUxVejRaM0dFNEt3eVJDc21BTmJpZGZUVHlHeTlEN0NNUjF0?=
 =?utf-8?B?NEVKQmttYkFRTTVhK2Z1Ull3cU1lVVlhQ3E1NTlScm9OZk1UTElhTVM3MGEy?=
 =?utf-8?B?VWYyRExlblA3Nk8rdFJraFlTSUgrNThwclJqcFpiUlBGSDY0MkJEcjdQRXRi?=
 =?utf-8?B?WjYzMTVQQUJ1Qk1nd3RYZjhVaWMxczBEUW5ZcG1uaWEwdm9DeUxxclBGYXND?=
 =?utf-8?B?b28rdjBodjAzM01PN3k0eVU3OHZYeFJKYk0yTHg1UWlTR3doaGtDSDdUblF1?=
 =?utf-8?B?Zm9wNSszRXlyNzlwd1ZITnNMdlVqcHp1V2xTd25OU2RzRGF1UFFUVFJrck53?=
 =?utf-8?B?WTI4RlpVei9rWU0rbTVkWGFDRDB6aTBwYkx4cG8vblROc0Q2SS9HYVNxUUpn?=
 =?utf-8?B?SmRoUm5VQjdiWjkveEFZazhGRC9nOWRGcTVFdnczMktIaUttQ05FUFVnNC91?=
 =?utf-8?B?bEM5NGExNnljVUhwcWM3dDNkdnpXMXh4QnZZL1ROZ0ZGckQvZDg0Y29VblFy?=
 =?utf-8?B?OXZiYXdTWW1GeWdmdFJlYkp4SHF4T1JOWU5tZ3YxMnp4bWFROE5la2FJa1hs?=
 =?utf-8?B?bGY1N2lpaDZWV2kyTldmN0RSWnNCUWMycTBBNmYvaXZMVWFYNXlZTFovM2xW?=
 =?utf-8?B?Tk1QMkFpV2pQcW1ESjNyM1hob05PSTdmUG5ZTmticFdlSlRFRXdmMzFJWXdj?=
 =?utf-8?B?T1BkNndxaHVqZG85bk4zajdQOW5PdEYxWEFxU2lFNEF6SkhWVGpEN2xLdWtK?=
 =?utf-8?B?U3NTeDZOaE5UaWNXWEZkakVzMm5NZ3g1UlJnOFlnSXUrNk9Bb3FhWGJRTGI5?=
 =?utf-8?Q?zgNDigVtUUOm9ycI=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0feb5e16-0859-49a4-d7b2-08da127082e0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 17:12:46.9163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: my0vT/V+uTkau2Z6Ie74MmQ43sWdfjISYOGI492KgKGThPRN1bUR9Bve/CqYblDAb4sytjqjXMYaRR89JcDaNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3575
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-03-30_06:2022-03-29,
 2022-03-30 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 mlxscore=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203300085
X-Proofpoint-GUID: ABjoJaGgEvX1LnNy0Ea4vafR9E2qEjpT
X-Proofpoint-ORIG-GUID: ABjoJaGgEvX1LnNy0Ea4vafR9E2qEjpT
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: eperezma@redhat.com, jasowang@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, eli@mellanox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/30/2022 9:24 AM, Stefano Garzarella wrote:
> On Tue, Mar 29, 2022 at 11:33:17PM -0700, Si-Wei Liu wrote:
>> The vhost_vdpa_one_time_request() branch in
>> vhost_vdpa_set_backend_cap() incorrectly sends down
>> iotls on vhost_dev with non-zero index. This may
>
> Little typo s/iotls/ioctls
Thanks! Will correct it in v2.

>
>> end up with multiple VHOST_SET_BACKEND_FEATURES
>> ioctl calls sent down on the vhost-vdpa fd that is
>> shared between all these vhost_dev's.
>>
>> To fix it, send down ioctl only once via the first
>> vhost_dev with index 0. Toggle the polarity of the
>> vhost_vdpa_one_time_request() test would do the trick.
>>
>> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
>> ---
>> hw/virtio/vhost-vdpa.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>> index c5ed7a3..27ea706 100644
>> --- a/hw/virtio/vhost-vdpa.c
>> +++ b/hw/virtio/vhost-vdpa.c
>> @@ -665,7 +665,7 @@ static int vhost_vdpa_set_backend_cap(struct 
>> vhost_dev *dev)
>>
>>     features &= f;
>>
>> -    if (vhost_vdpa_one_time_request(dev)) {
>> +    if (!vhost_vdpa_one_time_request(dev)) {
>>         r = vhost_vdpa_call(dev, VHOST_SET_BACKEND_FEATURES, &features);
>>         if (r) {
>>             return -EFAULT;
>> -- 
>> 1.8.3.1
>>
>>
>
> With that:
>
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
>
>
>
> Unrelated to this patch, but the name vhost_vdpa_one_time_request() is 
> confusing IMHO.
Coincidentally I got the same feeling and wanted to rename it to 
something else, too.

>
> Not that I'm good with names, but how about we change it to 
> vhost_vdpa_skip_one_time_request()?
How about vhost_vdpa_request_already_applied()? seems to be more 
readable in the context.

-Siwei

>
> Thanks,
> Stefano
>


