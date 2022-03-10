Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2B74D52B3
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 20:58:13 +0100 (CET)
Received: from localhost ([::1]:58790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSOvM-0002sI-Hg
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 14:58:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nSOtP-0001O0-Fb
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 14:56:11 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:53776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nSOtM-0002d2-GK
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 14:56:10 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22AHtT3J019320; 
 Thu, 10 Mar 2022 19:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=/s5FPf9zKUR1KLWU8xUXFGHp8QHcqpJYDIrFeokC39Q=;
 b=yRgIUqoCRNwe1k2mi9OSxUGhAojEyNG7Wvz56yhz14ga9JDNMb4Zn1GSg75Xx2XqnQQt
 zlS9lHM4fUgK7c4M2AL2uFOeZCxPTH6wmPMZqlgVZPT7OaI4gIYmqK1ljaTiSDT012nA
 r1AJC2EaOLWxraBNbA2gUvUvk0WMqFJDDCRdAqQtfscNLTuXpet09/7lr2K1n18/g93M
 erE7Pjn7Dl71B1hfyfhswgA14aLNvPaBr7ha2CHWvjSLuFMFKfv8/5ouBdeEPcZDEqFJ
 h4tKiWeL9XHkoCK5hzf7WZg3+C4J8terQDPtDSivbeV9h5BP3PNbtkcZePZy8riu2wq6 2A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ekx9cp5y6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 19:55:58 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22AJUPck111104;
 Thu, 10 Mar 2022 19:55:57 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2047.outbound.protection.outlook.com [104.47.56.47])
 by userp3020.oracle.com with ESMTP id 3envvngd60-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 19:55:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WdM/Uh4ViWLXUQlvauPSyeDuR2dmyGA6aMo1g1gqtXTkas/H5i+9/SG7fV2A7B6zyQdcQPy0TrVpm1QDB93rncon3MlaDV0CYpYgGUGTr2szPLbIFZouq+PqVyZS32Gs0xE9Hf8haOYB8f7c5ovPpUfLm48YRNwZvScwe20FkLHL8gk/OUsUYyoeHMFLtS5V+Xgi2g13baG+PidRGMrR9yEa3h9C8/vK7M9EaQaqRulhMEVppTGFiuDKLZR3liEepevC4c1jcieyw/3aHw5gk8nFadsxiNxauGyAQLzuOQiMW/wZG3T8mZ4VsLSsBiwFM8FJom8NCG6TcqyaRYcMJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/s5FPf9zKUR1KLWU8xUXFGHp8QHcqpJYDIrFeokC39Q=;
 b=XsClQwMDwApDEoDex6DA0cvVhLkmMyix535fPclIbczp9ZGUGhWcuuXsdPt8tOOQvcvU9pYR1a/0MvrYCVrMfeA6fd81ANI8Nf8OGbxqVXtmMmHbapA7aGg50X/Azrb60pr7dWwOCe7Mxh7e+rbqi+0nKIweYqtwk1re5K3ltv27ME+d1XoSNGcyK5YAPEQW1RCjAVtlf+saM66CpH1wfHwllVMIJbfNku9Vzn+O9pClz3TgzstNNc6nYo9Wtt8AdfuW0x7nAg1SoYMJ6rcySbBnhI1z2c5g1Yl5nIPg0v3zwb2p67ckrQd0/Geu59LpnG+sbFfiXXPbg+RsjD6L6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/s5FPf9zKUR1KLWU8xUXFGHp8QHcqpJYDIrFeokC39Q=;
 b=QuMdaKjREacodpgfTFToR/4FcYhgwwPK2k6s+TfyNaIdRrX8GFFqxeEMhP0ugcIu69mgN/DP9tn2s5Pb5krYPJFg0pLEFd79LY5OoUhZUN9tmkVqO4cdOlpSx5tw6R6sNE1FH0kFGNWm5Dp1iY5yKzWttLU/qwMqjMeWq20Er3E=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by DM6PR10MB3595.namprd10.prod.outlook.com (2603:10b6:5:17f::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.25; Thu, 10 Mar
 2022 19:55:55 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6005:8b9:1b00:b0da]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6005:8b9:1b00:b0da%6]) with mapi id 15.20.5038.026; Thu, 10 Mar 2022
 19:55:55 +0000
Message-ID: <588ff54d-e1df-d892-60c5-ac7c143a6e11@oracle.com>
Date: Thu, 10 Mar 2022 14:55:50 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH V7 19/29] vfio-pci: cpr part 1 (fd and dma)
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-20-git-send-email-steven.sistare@oracle.com>
 <20220307151610.0d8b2269.alex.williamson@redhat.com>
 <a8de61de-37b9-b88a-ac8c-a94d51a0dc92@oracle.com>
 <20220310113541.47edeb9b.alex.williamson@redhat.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20220310113541.47edeb9b.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0204.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::29) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d837250-9b2c-426b-bab8-08da02cffc8f
X-MS-TrafficTypeDiagnostic: DM6PR10MB3595:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB3595B3B95AF0A939B173234CF90B9@DM6PR10MB3595.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WApAtgdNSjX2oXk0Y/TCT38wwyZ5T8lZZJXNfM+BkZEMOpUtKsVVZhNPnxRwV8E1Xope/hL3seWq3HqNCMmIC0ZgBopjXSSF9sHrtIy1f4l8E6cGbUFMYw3B3UD5YK7+cQa5VHMTjCB7LaLvey9Bwc9zRDWsPYej6Zn8PLYdSD0PdfC+9TvMISaI7ZSqf60pc1t7TT8DnzodG0DvBA9AejEjCHl5Q+VNoecGigkJsHUgLRDnG5JkSMDTT/rJJRU1oM394YDdAFM86IlCUWdFbZDZUEkb0U74s3LERueatu5eKpMzmgHXF522lG9xUA2C+ylBGx1zo70BVEYUn1WC/BS/ptTEvUfJ5EqhTjTWMbuEo/dqjjkmEl4wqE2o91wTF3Dz5luRraR/ANhjQX1KU1yp79p/goCT1s2clqsp388flWmgVaS/DFYvRV9LUY/wDZuBMvj4yC+Pi5N/vRx1/zwgecHx+59C48iWlaqwCVtEGBqcyyZziQ5ruKAoU0pqgv0BQXYvbEaaz12jtL4lgWRToRmkrac5oJm+C/60AWfGbLTvmL8+GWplq+pwgWrVOlZRmT4AANvtoPCpm8MisK5ZaVpvMDzPR/LDLZTtK5qmXlFFVqf0QBUpiWrfTW2CipccALf2fHuq7c57TxhZ3z9xJHLEut1b5joSbdEshP0fhmszqw/sk0LTaoOJPE+bvvzYIK1iEcukj6SOuptBMqYx8fXcfuOOSW3lS/vitXA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(53546011)(66946007)(66476007)(66556008)(2906002)(8936002)(44832011)(8676002)(6506007)(83380400001)(316002)(31686004)(36916002)(7416002)(2616005)(6486002)(6916009)(26005)(36756003)(6512007)(186003)(54906003)(31696002)(5660300002)(86362001)(6666004)(38100700002)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0ExUFdKdnFqMFF2SlJzOVB2Nmtob3Ewd1A3cDBhVWFJWDNjK0hoUWxVWDhG?=
 =?utf-8?B?TFRGM2ViZjcyYlNDWllKcTRpdTNsREVocDZ1QXFGOGttK2NXM09SbUx2N2l1?=
 =?utf-8?B?Vmh2WTZ4bWoxWjRtNzZoaDRIZWFtdW9UWitsUDZYbklNS2FHWlorU0E1eVdx?=
 =?utf-8?B?SGo3QlZXOTdpQ3lROWg0Z0l6RGx4VU5Ia2lJQmhwV0tZZitKRFVYeVdUOC90?=
 =?utf-8?B?dDNya2l2TDdJbzNEc01yQlNJMmhwRXRjUldHRHFBOVBvSlFHTW5WK2FKK3RZ?=
 =?utf-8?B?eFp3Uy9DS3RJamEwT3pKcERpbE40SzZ6aEVJTWkvdXkwY2t1cm5YdVpBYm5S?=
 =?utf-8?B?bnhGNWJFUmdCTjh4enVXQXZXOWZtS3lOT2xiemNCY0d1ZUZ5T0gwMVVoVFl2?=
 =?utf-8?B?Zy8vMDdObDVBZXNsemlaSDQ0dGhRODRONGx5T0R5ZSs2V0poVVZZN21OMFlD?=
 =?utf-8?B?bUdjelBjZkRSS3Bsd0t2ZndZWS83Um9RNlhVYVFYZ2VPa0JGaEQwNTEwZkxG?=
 =?utf-8?B?Zm5jM2g0M2V1Ylk3ZmVmdWd0cWEwMFMzK2lhRVA4d21TeGdsZTRmelBaaTFk?=
 =?utf-8?B?cXowZjRyMFZaOHNpVUV2QUVROWJ0aUh3Z3ZWVkE0NXB2R2xZQlNoM2ZONE5v?=
 =?utf-8?B?TGRmT0wyRjhxT3dlWmZ3a2ZldXRzMmZIZVdVYlJNQzdkQncwUGxkVnVJcnhU?=
 =?utf-8?B?WXBlT3RJR3dyd1NUL01aQmMxcGJnb3c2Rk1ha0IvOER1UWUvTklUeVZ4Rzdz?=
 =?utf-8?B?ek50ZlZUY3pPYU91ZVZLTkNEakRqVlh0RkpqK1h6dHRXejI1ZGZCQjVxVnJH?=
 =?utf-8?B?RW04eEZsWWhVbUExOFV2UkVPbitjOW1RbEgxUEpLbkt0ZG1UUEZtVGhsam02?=
 =?utf-8?B?d1lOelhGRy9jbmNja3lwLytiVzBnNHFmellQdWFMM1BReWVXeGl2U1dvMWlJ?=
 =?utf-8?B?TlpFWjRQaDZNdUdxUnk5V3Bud25CK2pRRlJBWWdnUWhKRGxZSW9MY05Iemty?=
 =?utf-8?B?SDRRdGVxMGZIQ1lTWTdKTmllZlBkWjkzRkVaYXFycnFyek4zMEI0VmpZa0lL?=
 =?utf-8?B?dGNaSksrRDhnZlo4WDBwdTM5TFhTMEZEV3FwcSsxZDZMNDBZR2FORmZRODh5?=
 =?utf-8?B?R1lsSG84MjRnbEFaeG5jK1QvWVhId241MElmakJZNzEzTVhtVEFScVlvaEg5?=
 =?utf-8?B?b2FYWHJwTFl0REhDY2MxSUM5TmZWTGkxdkJpc2ZNK0xxUGpTcTdMM2ZXbmE0?=
 =?utf-8?B?YUZHQTNxZ0w4OXVZdGF4N0U4MlNwTEVSOUNFMHZVcGJTU21xQnIvYTZXZnc3?=
 =?utf-8?B?ZzVBQnVvSXNiNTlhdnNQUzNkZzdXQ0NvdnRta0pXUGZBZC9vaVRCSmJPSDI1?=
 =?utf-8?B?d2NBM0E5aFdzQXUrVGk5NjNTbWNIVWRTcmJwUStsYWlhNlpONEhRYlpvN2tR?=
 =?utf-8?B?U0lBUU5jcHk5dXd5Z1BoOFBBWWd6K1J6VlNTY1JUNU1KRy9hWHNvRnVEWldj?=
 =?utf-8?B?c1lzTWt0TDcra1lKYzA2c3Mwenp1aVlxWncwL0VtNDlmRTFBQVFXeUFsN2xa?=
 =?utf-8?B?bzJ2ekhwcUZDQ2pSTlNUcS9CR0lWU2d2MGlLWVdNTndqai9UdFVlamljWmVM?=
 =?utf-8?B?MFFwVC9CVjcrRE9rL1dqVkpqQnNDaEpwOE93Q0ZnN1FianhkMWJMNVlvNmdl?=
 =?utf-8?B?WG5WeE9Jd3B0T2FWS1dVZ1F0cmNHemw0STQ5dG12QjFidUZQS0s0bVVnWFo2?=
 =?utf-8?B?c0JYTTliVmJXZEY1dFcxWTBTMzEwWkdRQmVDaXRmd0l6MER5SUVKQkpLc3Zk?=
 =?utf-8?B?c3NTTTBtVGplYStVMWxZbmNUVDk1VnZpcGZyeUFVZUlzR1E4dktLOFpTSFo5?=
 =?utf-8?B?bG42bG9LemdZRi9kdnd1bEhtS0RQSUNMUzZXQks1OSs2UEd3SHZ6RHFHTXE0?=
 =?utf-8?B?QmsxYm92YjdXMFZmQWhObXJ3WHhPdnlGaDNrdDltdVFZQXVldys4bGU2Y1BV?=
 =?utf-8?B?TVFibmRQS2pCcVhkTGpMQ21MZXJuM0ZEYlFqSjNDMHFDd29VUEZEMk91MkFl?=
 =?utf-8?B?VFdtRzA1NXQ0N3VXb2Z2UmVqNmdNL1YzdWNuVzB2amJLeEc0ZW9HeUtlOEg3?=
 =?utf-8?B?bXYwM3BKeUc0NG5GTlFYb1VCdXFtVENRY08xWGE2TmVKR0RLUTRVTGNjSnN0?=
 =?utf-8?B?RVhDZnNvN2d6QWxVVDdGQk4vM3RBbmkxRmVTeU9GZXMvVllCQSsrMkRqVmJH?=
 =?utf-8?B?YnYrU3lOMzhxZU5CVUVmbUZoaVNnPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d837250-9b2c-426b-bab8-08da02cffc8f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 19:55:54.9016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tG36X/TxIVB07v+e4MwfQ2H/dQ9JNkjbkFHSILrh+tstL7gfROeSw6EzBWnPExSoy7xTASCf4iu5GFwpgFO5RaDY74u1mqMsTtefTbCi9O0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3595
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10282
 signatures=692556
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999 bulkscore=0
 phishscore=0 malwarescore=0 suspectscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203100100
X-Proofpoint-ORIG-GUID: _8_Ps9As_-xtDFcYONObd5M5DckKshwp
X-Proofpoint-GUID: _8_Ps9As_-xtDFcYONObd5M5DckKshwp
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zheng Chuan <zhengchuan@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/2022 1:35 PM, Alex Williamson wrote:
> On Thu, 10 Mar 2022 10:00:29 -0500
> Steven Sistare <steven.sistare@oracle.com> wrote:
> 
>> On 3/7/2022 5:16 PM, Alex Williamson wrote:
>>> On Wed, 22 Dec 2021 11:05:24 -0800
>>> Steve Sistare <steven.sistare@oracle.com> wrote:
>>>> @@ -1878,6 +1908,18 @@ static int vfio_init_container(VFIOContainer *container, int group_fd,
>>>>  {
>>>>      int iommu_type, ret;
>>>>  
>>>> +    /*
>>>> +     * If container is reused, just set its type and skip the ioctls, as the
>>>> +     * container and group are already configured in the kernel.
>>>> +     * VFIO_TYPE1v2_IOMMU is the only type that supports reuse/cpr.
>>>> +     * If you ever add new types or spapr cpr support, kind reader, please
>>>> +     * also implement VFIO_GET_IOMMU.
>>>> +     */  
>>>
>>> VFIO_CHECK_EXTENSION should be able to tell us this, right?  Maybe the
>>> problem is that vfio_iommu_type1_check_extension() should actually base
>>> some of the details on the instantiated vfio_iommu, ex.
>>>
>>> 	switch (arg) {
>>> 	case VFIO_TYPE1_IOMMU:
>>> 		return (iommu && iommu->v2) ? 0 : 1;
>>> 	case VFIO_UNMAP_ALL:
>>> 	case VFIO_UPDATE_VADDR:
>>> 	case VFIO_TYPE1v2_IOMMU:
>>> 		return (iommu && !iommu->v2) ? 0 : 1;
>>> 	case VFIO_TYPE1_NESTING_IOMMU:
>>> 		return (iommu && !iommu->nesting) ? 0 : 1;
>>> 	...
>>>
>>> We can't support v1 if we've already set a v2 container and vice versa.
>>> There are probably some corner cases and compatibility to puzzle
>>> through, but I wouldn't think we need a new ioctl to check this.  
>>
>> That change makes sense, and may be worth while on its own merits, but does not
>> solve the problem, which is that qemu will not be able to infer iommu_type in
>> the future if new types are added.  Given:
>>   * a new kernel supporting shiny new TYPE1v3
>>   * old qemu starts and selects TYPE1v2 in vfio_get_iommu_type because it has no
>>     knowledge of v3
>>   * live update to qemu which supports v3, which will be listed first in vfio_get_iommu_type.
>>
>> Then the new qemu has no way to infer iommu_type.  If it has code that makes 
>> decisions based on iommu_type (eg, VFIO_SPAPR_TCE_v2_IOMMU in vfio_container_region_add,
>> or vfio_ram_block_discard_disable, or ...), then new qemu cannot function correctly.
>>
>> For that, VFIO_GET_IOMMU would be the cleanest solution, to be added the same time our
>> hypothetical future developer adds TYPE1v3.  The current inability to ask the kernel
>> "what are you" about a container feels like a bug to me.
> 
> Hmm, I don't think the kernel has an innate responsibility to remind
> the user of a configuration that they've already made.  

No, but it can make userland cleaner.  For example, CRIU checkpoint/restart queries
the kernel to save process state, and later makes syscalls to restore it.  Where the
kernel does not export sufficient information, CRIU must provide interpose libraries
so it can remember state internally on its way to the kernel.  And applications must
link against the interpose libraries.

> But I also
> don't follow your TYPE1v3 example.  If we added such a type, I imagine
> the switch would change to:
> 
> 	switch (arg)
> 	case VFIO_TYPE1_IOMMU:
> 		return (iommu && (iommu->v2 || iommu->v3) ? 0 : 1;
> 	case VFIO_UNMAP_ALL:
> 	case VFIO_UPDATE_VADDR:
> 		return (iommu && !(iommu-v2 || iommu->v3) ? 0 : 1;
> 	case VFIO_TYPE1v2_IOMMU:
> 		return (iommu && !iommu-v2) ? 0 : 1;
> 	case VFIO_TYPE1v3_IOMMU:
> 		return (iommu && !iommu->v3) ? 0 : 1;
> 	...
> 
> How would that not allow exactly the scenario described, ie. new QEMU
> can see that old QEMU left it a v2 IOMMU.

OK, that works as long as the switch returns true for all options before
VFIO_SET_IOMMU is called.  I guess your test for "iommu" above does that,
which I missed before.  If we are on the same page now, I will modify my
comment "please also implement VFIO_GET_IOMMU".

> ...
>>>> +
>>>> +bool vfio_is_cpr_capable(VFIOContainer *container, Error **errp)
>>>> +{
>>>> +    if (!ioctl(container->fd, VFIO_CHECK_EXTENSION, VFIO_UPDATE_VADDR) ||
>>>> +        !ioctl(container->fd, VFIO_CHECK_EXTENSION, VFIO_UNMAP_ALL)) {
>>>> +        error_setg(errp, "VFIO container does not support VFIO_UPDATE_VADDR "
>>>> +                         "or VFIO_UNMAP_ALL");
>>>> +        return false;
>>>> +    } else {
>>>> +        return true;
>>>> +    }
>>>> +}  
>>>
>>> We could have minimally used this where we assumed a TYPE1v2 container.  
>>
>> Are you referring to vfio_init_container (discussed above)?
>> Are you suggesting that, if reused is true, we validate those extensions are
>> present, before setting iommu_type = VFIO_TYPE1v2_IOMMU?
> 
> Yeah, though maybe it's not sufficiently precise to be worthwhile given
> the current kernel behavior.
> 
>>>> +
>>>> +/*
>>>> + * Verify that all containers support CPR, and unmap all dma vaddr's.
>>>> + */
>>>> +int vfio_cpr_save(Error **errp)
>>>> +{
>>>> +    ERRP_GUARD();
>>>> +    VFIOAddressSpace *space;
>>>> +    VFIOContainer *container;
>>>> +
>>>> +    QLIST_FOREACH(space, &vfio_address_spaces, list) {
>>>> +        QLIST_FOREACH(container, &space->containers, next) {
>>>> +            if (!vfio_is_cpr_capable(container, errp)) {
>>>> +                return -1;
>>>> +            }
>>>> +            if (vfio_dma_unmap_vaddr_all(container, errp)) {
>>>> +                return -1;
>>>> +            }
>>>> +        }
>>>> +    }  
>>>
>>> Seems like we ought to validate all containers support CPR before we
>>> start blasting vaddrs.  It looks like qmp_cpr_exec() simply returns if
>>> this fails with no attempt to unwind!  Yikes!  Wouldn't we need to
>>> replay the listeners to remap the vaddrs in case of an error?  
>>
>> Already done.  I refactored that code into a separate patch to tease out some
>> of the complexity:
>>   vfio-pci: recover from unmap-all-vaddr failure
> 
> Sorry, didn't get to that one til after I'd sent comments here.
> 
> ...
>>>> diff --git a/include/migration/cpr.h b/include/migration/cpr.h
>>>> index a4da24e..a4007cf 100644
>>>> --- a/include/migration/cpr.h
>>>> +++ b/include/migration/cpr.h
>>>> @@ -25,4 +25,7 @@ int cpr_state_save(Error **errp);
>>>>  int cpr_state_load(Error **errp);
>>>>  void cpr_state_print(void);
>>>>  
>>>> +int cpr_vfio_save(Error **errp);
>>>> +int cpr_vfio_load(Error **errp);
>>>> +
>>>>  #endif
>>>> diff --git a/migration/cpr.c b/migration/cpr.c
>>>> index 37eca66..cee82cf 100644
>>>> --- a/migration/cpr.c
>>>> +++ b/migration/cpr.c
>>>> @@ -7,6 +7,7 @@
>>>>  
>>>>  #include "qemu/osdep.h"
>>>>  #include "exec/memory.h"
>>>> +#include "hw/vfio/vfio-common.h"
>>>>  #include "io/channel-buffer.h"
>>>>  #include "io/channel-file.h"
>>>>  #include "migration.h"
>>>> @@ -101,7 +102,9 @@ void qmp_cpr_exec(strList *args, Error **errp)
>>>>          error_setg(errp, "cpr-exec requires cpr-save with restart mode");
>>>>          return;
>>>>      }
>>>> -
>>>> +    if (cpr_vfio_save(errp)) {
>>>> +        return;
>>>> +    }  
>>>
>>> Why is vfio so unique that it needs separate handlers versus other
>>> devices?  Thanks,  
>>
>> In earlier patches these functions fiddled with more objects, but at this point
>> they are simple enough to convert to pre_save and post_load vmstate handlers for
>> the container and group objects.  However, we would still need to call special 
>> functons for vfio from qmp_cpr_exec:
>>
>>   * validate all containers support CPR before we start blasting vaddrs
>>     However, I could validate all, in every call to pre_save for each container.
>>     That would be less efficient, but fits the vmstate model.
> 
> Would it be a better option to mirror the migration blocker support, ie.
> any device that doesn't support cpr registers a blocker and generic
> code only needs to keep track of whether any blockers are registered.

We cannot specifically use migrate_add_blocker(), because it is checked in
the migration specific function migrate_prepare(), in a layer of functions 
above the simpler qemu_save_device_state() used in cpr.  But yes, we could
do something similar for vfio.  Increment a global counter in vfio_realize
if the container does not support cpr, and decrement it when the container is
destroyed.  pre_save could just check the counter.

>>   * restore all vaddr's if qemu_save_device_state fails.
>>     However, I could recover for all containers inside pre_save when one container fails.
>>     Feels strange touching all objects in a function for one, but there is no real
>>     downside.
> 
> I'm not as familiar as I should be with migration callbacks, thanks to
> mostly not supporting it for vfio devices, but it seems strange to me
> that there's no existing callback or notifier per device to propagate
> save failure.  Do we not at least get some sort of resume callback in
> that case?

We do not:
    struct VMStateDescription {
        int (*pre_load)(void *opaque);
        int (*post_load)(void *opaque, int version_id);
        int (*pre_save)(void *opaque);
        int (*post_save)(void *opaque);

The handler returns an error, which stops further saves and is propagated back
to the top level caller qemu_save_device_state().

The vast majority of handlers do not have side effects, with no need to unwind 
anything on failure.

This raises another point.  If pre_save succeeds for all the containers,
but fails for some non-vfio object, then the overall operation is abandoned,
but we do not restore the vaddr's.  To plug that hole, we need to call the
unwind code from qmp_cpr_save, or implement your alternative below.

> As an alternative, maybe each container could register a vm change
> handler that would trigger reloading vaddrs if we move to a running
> state and a flag on the container indicates vaddrs were invalidated?
> Thanks,

That works and is modular, but I dislike that it adds checks on the
happy path for a case that will rarely happen, and it pushes recovery from
failure further away from the original failure, which would make debugging
cascading failures more difficult.

- Steve


 

