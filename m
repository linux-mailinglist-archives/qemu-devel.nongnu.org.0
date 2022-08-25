Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE615A053C
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 02:41:06 +0200 (CEST)
Received: from localhost ([::1]:44826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR0vh-00057m-B5
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 20:41:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1oR0tV-0003eh-UB
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 20:38:49 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:31754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1oR0tS-0000Zd-46
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 20:38:49 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27OLGONw014590;
 Thu, 25 Aug 2022 00:38:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=HjjICva8y2eYgbRvUKKhvbTD28cyzYFbCRKfkkWTnqY=;
 b=Sle5GbT4+TyvghglybXb3qSQY04wkQF0VWoArViNTI4U5dzlfnKDPLzHOlVrymYcqRZm
 vMBiBpCQ77o7ITcYrVkXK+N75M/yhpbboTxiSGuig54f/jlk2Rr8RP4L11qfddhPV+AZ
 R7gnDOc4WK4ePjCXnADBmf7Rz/3gpKGHCrlUlRwuVkHgnPMYjKoDo0j2OmNm5XoDyfak
 xbsfXwZ9Ds3yF1XiQcDc0VXqI6TebujoHWrjK4L+k1k0Z1POSSHhaKmqyNx3g/o64NxT
 rFnQduxZykQnR5qOHrCTNYXP29u2gNy+SLt9cgN5W3iLKr0Y4/C180rBsuf8P1SuU+/r Pg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j5awvjura-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Aug 2022 00:38:20 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 27OM428c009038; Thu, 25 Aug 2022 00:38:20 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3j5n6npkwu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Aug 2022 00:38:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gykHLRtIvR7b77TsVxsrdF2RebSTPx7o+ssHR9Nc/YeEK7oyHeGseo4XvNAfATCEOfMQktKYkBdiNuHD7klZWVUSG3nKf9TXUFKA3rnl9QFM249iZd2QHrY9GaLy8a431cuWwuQrE0+TosH+F9yW01tHgreJF3j1SUGEOgeSTK/Ry0vN40JfjIPT+KXLApij6ynOS8XNiV8hDTYKYGiX6tddehtfm1UBD3/3EG2SH4COXP9gmMPROKFNTQNk89fA0Iz6oNswStikGCoYox98WeG7lhP+8DFDuSIpe6PKweO79aRzTQ1yj6z2gZeEM1/6ip8xy/7DC3MkXEj11crcPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HjjICva8y2eYgbRvUKKhvbTD28cyzYFbCRKfkkWTnqY=;
 b=Hssrk8IrMvop7zPd31bHowqDiZyIG01fR/A/1di5b98smlcLlAASJ/kR8p9ZElX99197Yqw0tNIU6appxnoi9rfdYSadJMHIMGAwiFSL+9UkBOzzma28rcsnQRFkZiJMYa1trq4XGDXckXNj67sSVAMH1PK+jlQpJ+p1C6AGeCifhVp/fEHL/wcjASPWaqqK52yZYk3z8PAmT+pkOyX+M70givg1ClQnYZWThLvATAdfn4pn4Wg7scxYHAgiepgenpG4C4hf8wlSXXJXOl7uGS5VOk7UUOfQjSjTn78Y7JCvEN0iXj4Iy7kEve7Gx1lnG3oqpUl52bqzz825dGL4yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjjICva8y2eYgbRvUKKhvbTD28cyzYFbCRKfkkWTnqY=;
 b=w4iEuNSDLx9ogZO0MzeV8lp2KV9+ITLQ17okAXK5eMyVZaU11m84nJ6qfOZj2mECUeuVKz7pnJJzDru7Us/nJKHDmHIrX4oPGMIxSm2gGLscHENPJQHwd7QpsyoBO5j6DvYdT4sn+ve/1+dM+98fDoQX4WhFQP+BmjfubmMJCmY=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by CY8PR10MB6537.namprd10.prod.outlook.com (2603:10b6:930:5b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Thu, 25 Aug
 2022 00:38:18 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::dcf7:95c3:9991:e649]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::dcf7:95c3:9991:e649%7]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 00:38:18 +0000
Message-ID: <8aafb501-a852-bc45-8989-b48644c5e1f5@oracle.com>
Date: Wed, 24 Aug 2022 17:38:11 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 4/5] virtio-net: Update virtio-net curr_queue_pairs in
 vdpa backends
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, =?UTF-8?Q?Eugenio_P=c3=a9rez?=
 <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Cindy Lu <lulu@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
References: <20220819171329.3597027-1-eperezma@redhat.com>
 <20220819171329.3597027-5-eperezma@redhat.com>
 <7debe883-819a-f083-aa72-8b9e05ca5be8@redhat.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <7debe883-819a-f083-aa72-8b9e05ca5be8@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7PR06CA0024.namprd06.prod.outlook.com (2603:10b6:8:2a::8)
 To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b51c30a1-d1b2-4e14-acb1-08da86321abc
X-MS-TrafficTypeDiagnostic: CY8PR10MB6537:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2k7gNfTgLsMwwiYD6srHm/CAjhIvUMx6s7JmZ78Nuj8wMbOc3Yia1+zJjrwllif+0CgWXrZUmq3gSD8Li8A9R1kLZlE1CvYWGxtmjSEUcLc5mdpYRORoXtdIt54G8j75PmN6eMN+W1BKizcm4Yj3OzFklWekC+ZBwic2oGzIqLmSNsMSl6sNIp+Ab8CF+oywPfqZomOZ/rzSrgsxqP5g7CX2nRzQxoKKv0YUd3OuVGoNPKdxEACkO1WqfKlG9JDdSXqRz9xn0sv2tyZPc8hu6Lt1l1he1gsMfOUPiLun/ndch1Frdn+LYJS0xB9t3lvtchCphdmHqvklUFXAav49VTEwyfkvk9SC7vz/BVX997LsFVPC0t4lgnLN4o/DPibHSj3xje1HdlzyvkKxr+Vcb1q7LYQPn4/jS+Wi77Ju9yRXfiSJuRGmVEWqRvR+JARvpyVrQfqac+FCAb4P9sTS332jOUdQ/MwBCmUVs7JuaijpeWgmVixSDxE5/MzM7xUoWFFpUCJT0DElIuc8DCanH4cu/3Wc1vW/etRnogIZJd/mR8Mtxmes4jYOSh+c5QTGHHnXiSaUcEyngRv8gT2jxQOSXw4ovlNtJOlFBUPpepmo6zhlmsYKftA4FfmtoKxwojXZyb8Q/oArebPJUJm7Pv4VzoO6sM6FtWHyjfhWXTPu3ae3EKdEpo2M2u5NOe4S9kUB/74iJdjuYqe/LndJBdWIKzh3lj1YCbpuumiYqnm4zauxEUeEpm9VAppp+eKRH4rJtOaZfbZy/69xIVG3rJlHvG0Ys0bDrUVWIB/QUQ4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(396003)(376002)(346002)(366004)(136003)(2906002)(15650500001)(36756003)(8936002)(110136005)(316002)(7416002)(54906003)(5660300002)(478600001)(53546011)(6486002)(6512007)(41300700001)(26005)(6666004)(6506007)(36916002)(31696002)(86362001)(2616005)(66574015)(8676002)(83380400001)(66946007)(38100700002)(66556008)(4326008)(66476007)(186003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTMzMTk1bU5XckxaYmF3SS9UeVZKU01qaS9ocm1jVXlGb0pqT1ZlVy94QWZQ?=
 =?utf-8?B?M1BnZmhqZXc3N0JFR0JqZ2VnSkNkMjhvbE1KRnNreTFMYm9FKzRBa2JLYmlX?=
 =?utf-8?B?WXVVY3lJaDh3cTIvdE1uWE8wSUErVFVJZzl5QmQzek9scnZWQXIwOWx0c2Yw?=
 =?utf-8?B?R2FjWk9jV2FlazNXQmwvazF4RXp5QlhCeWpTc3cvbkVuMnhadEdpM1ZpTFRV?=
 =?utf-8?B?SkZvUTdhY0NmaGVud3g5Wnh3RENiMFRtVzdGRlQzaDZ4dFVobE9SUXluNU1J?=
 =?utf-8?B?TStBdndocGhZcFNnRFJ0aGFOcjlFMjdMbDJpZTNId3lDRHEwQXRjZitxc284?=
 =?utf-8?B?RGZzUUxVQ0w0enlmOFZVOUFsYUpiZzVVV3ljalVRL0hlbVN2Vkc0R2s0Smpp?=
 =?utf-8?B?aFo0TEE3MVphTFV2U20xVVBtdEdBVDBRR1pMdE56ZEFPUG1FWUxMZWhGZ3VN?=
 =?utf-8?B?UGFHQ1dsODdRbStTTXNaWlAwZXlhb2RrRU5VNGd1QjJkcFAzUWxRKzFLNmdi?=
 =?utf-8?B?TGhCbmN2cHdnWGE0TWNlYm9FMFRqQ2tJaUZ4ZW85cU1oV2gvN0tsTzQvQTgz?=
 =?utf-8?B?b1Y2YmQra1dSWUVjNWdqUDVrSm5waG1CM3RXQmNGdHVWZk1qbkVwbTRKUTJG?=
 =?utf-8?B?QzVPbCs3dHFmNm5IWGRxN1BTbWhsVGxkaXpaZHAzWEw5azVKMWNUTVB4b2RX?=
 =?utf-8?B?R0ZHbjZKS281d0NGeVBzRG5UeTNYbldkVS9ZNDRlaU9SdUVkakJTeVU4Rk1V?=
 =?utf-8?B?bFl6SFJEQ2FjQUNsdkJjdW0xVEVtdTF5NUNUNkgvdWZhOGJqcTRuYzlMVmMx?=
 =?utf-8?B?RDE0OGJZaGx0QllSa2FuQ3J6azAyVkV0OUFWeW1mUmxrWnZFdHRoZGlLQlhw?=
 =?utf-8?B?ckJ5dStQYmorVXBEZEN6WWt5NGRkZVF3VTYyN1FsTTlWL2ZvdFN4anZBUjNX?=
 =?utf-8?B?VzFsekFZZ0tSdUE1ZjBRN21QcFBNZzlQMXN4Nk8ybTEzTEVYQXZQMWxYb2lL?=
 =?utf-8?B?Z21VbE01Y3pXREdiN3JFMk55eHhBZy9MZmh1bG92MFRSSkR1eHdwL3BJeTc5?=
 =?utf-8?B?TE9nUE5jTFRLTXptU0Fvb0Rtankyc3FJL3hLNHpMdkJKbkdOOVpzTy96N2xW?=
 =?utf-8?B?OWhhako0MVJmQUdKVEM5Y1lOZHdBRjY2MTNXZTQ5UGhad2lSTnFxNG54Q1lr?=
 =?utf-8?B?Y0RUYVdFaGZERlliamwyZ1gvWTRzT2sxbHR3YmJralpmUVhOUEF6bWdDcHla?=
 =?utf-8?B?Q3k1dDcwdnFYQ0pzOGZhMzV0dWhpcUZ0eW1mOFZyYWdFR0o0TVVSWVhEa0pi?=
 =?utf-8?B?dWowSVVaRUVOY2d3MFpaWTlGQ1dVMW9QTnFTM2RmZWg0NVI0UXRidk0veHox?=
 =?utf-8?B?MDhqTEUyam1FZFFYSXIrNXJya0tCU0U3dW5pMWg1MkQrTHE3dmhqRFZmRWlv?=
 =?utf-8?B?d1RBYXRaMG5Oc3pnNVZUTEdIbHVkVW5yVjU3QU4rTkdVYVY4VUFJcUpISWh4?=
 =?utf-8?B?bDFUdTNjUEJjVU1VT01nbitUbjZIckRoSHRpSnJEcVdmV1V4dDBLM1dYbFpQ?=
 =?utf-8?B?T1Nua2hJdGVhRlRmOVJHMXV0akdtSXlkUWZEY2o1UWFFMmJIWVpJUVNydzZ0?=
 =?utf-8?B?UlgzdHNiOUZlMmpJSjUwQi9PRWtHQmxFN2Z0ZkxTNFFrOURzZm50NmY2azNu?=
 =?utf-8?B?T2JyUGh5Z3JWMm1CYjR6V3Fwc29JNURRakpmakhETzV0MVlTS21xMXZ3RmlH?=
 =?utf-8?B?VTRPYWJ0ODFTL3dhbytLZlJ2Q1RHQS8zVmlBNzNsdnZxZm5qYVBzSGUrNTVD?=
 =?utf-8?B?QjNVZjl1MThIaU5OWU16ZGd6VERDRHR2YWwzTzZZZFE3VFNKOG1QOHpPeURV?=
 =?utf-8?B?NWlJV1cvZ2pRTG02bDMvdEpsblBHblNmSUYwTUpSUkxMQTdxakNKVkdwUGVL?=
 =?utf-8?B?L3k0REY5QjVYdUF4NzNBdDJ6Tnd2YVp0WXo5L3ozVDh5Sy9sell5UTF3TjY2?=
 =?utf-8?B?aHJrTm1LVC9CdXNJcm5lOThiZm02Zk5Sejd0RGtMT3ZVeU1meFZHeGZyaVIv?=
 =?utf-8?B?c1J1VjJsdkRXVk1sTHZZOFp5eWRhYkw2Wi91cUFJbnhHeFljc3R3enJqR3R6?=
 =?utf-8?Q?8/MoznlH+N4fH/b1BDd7ltqD4?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b51c30a1-d1b2-4e14-acb1-08da86321abc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 00:38:18.3436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 53s7nR4d1MeNPqtWUezXxK8J9jXR9d0bY6KQFjC/tURhuYIGZcauWu9HZdrW4ye19QBLhgE9JliaKjUFng/DjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6537
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-24_15,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 spamscore=0
 bulkscore=0 adultscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208250000
X-Proofpoint-ORIG-GUID: kW_a4PDsFrbAVawSuKpIIKegqKqv8ei3
X-Proofpoint-GUID: kW_a4PDsFrbAVawSuKpIIKegqKqv8ei3
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 8/23/2022 9:27 PM, Jason Wang wrote:
>
> 在 2022/8/20 01:13, Eugenio Pérez 写道:
>> It was returned as error before. Instead of it, simply update the
>> corresponding field so qemu can send it in the migration data.
>>
>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>> ---
>
>
> Looks correct.
>
> Adding Si Wei for double check.
Hmmm, I understand why this change is needed for live migration, but 
this would easily cause userspace out of sync with the kernel for other 
use cases, such as link down or userspace fallback due to vdpa ioctl 
error. Yes, these are edge cases. Not completely against it, but I 
wonder if there's a way we can limit the change scope to live migration 
case only?

-Siwei

>
> Thanks
>
>
>>   hw/net/virtio-net.c | 17 ++++++-----------
>>   1 file changed, 6 insertions(+), 11 deletions(-)
>>
>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>> index dd0d056fde..63a8332cd0 100644
>> --- a/hw/net/virtio-net.c
>> +++ b/hw/net/virtio-net.c
>> @@ -1412,19 +1412,14 @@ static int virtio_net_handle_mq(VirtIONet *n, 
>> uint8_t cmd,
>>           return VIRTIO_NET_ERR;
>>       }
>>   -    /* Avoid changing the number of queue_pairs for vdpa device in
>> -     * userspace handler. A future fix is needed to handle the mq
>> -     * change in userspace handler with vhost-vdpa. Let's disable
>> -     * the mq handling from userspace for now and only allow get
>> -     * done through the kernel. Ripples may be seen when falling
>> -     * back to userspace, but without doing it qemu process would
>> -     * crash on a recursive entry to virtio_net_set_status().
>> -     */
>> +    n->curr_queue_pairs = queue_pairs;
>>       if (nc->peer && nc->peer->info->type == 
>> NET_CLIENT_DRIVER_VHOST_VDPA) {
>> -        return VIRTIO_NET_ERR;
>> +        /*
>> +         * Avoid updating the backend for a vdpa device: We're only 
>> interested
>> +         * in updating the device model queues.
>> +         */
>> +        return VIRTIO_NET_OK;
>>       }
>> -
>> -    n->curr_queue_pairs = queue_pairs;
>>       /* stop the backend before changing the number of queue_pairs 
>> to avoid handling a
>>        * disabled queue */
>>       virtio_net_set_status(vdev, vdev->status);
>


