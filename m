Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4954EFBB7
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 22:39:06 +0200 (CEST)
Received: from localhost ([::1]:46226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naO2z-00006A-Dy
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 16:39:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1naO1d-0007mg-Vt
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 16:37:42 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:42560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1naO1a-0005H2-L4
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 16:37:41 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 231JOk7W014677; 
 Fri, 1 Apr 2022 20:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=oX5yi6YiwIKT85DyjDllB24U+xDSJXb3625fBYsdWUU=;
 b=TQP9SJMU3zp10w3t+fz3om92qKtBVvZ66NqILF49fKFPDwRN3qPmEQpZ1kKqA7y0g7O7
 QN3UpMPl99XZXy3Bw0WMDYT1fK5qBuEUDMeBko/8NAywsM/cxZmRFiKZ0yzb8bdIyWbd
 7joaaEO5NF9T3XmrNV+hyoD+xxMU3YQjUegrj9JCMD6JSTPnQPnjV6fPpkVH93goVk3/
 tWCeclbGeZKR2IJbtCNyRlVPv0RKKYRBcdFfxoZLORxD/nI4ugWerLAGrTXsyAXIWScI
 QFAjihurVZKgfP0noHSQ6X52DcrUcfUhyN0snXwFu6Pw6r07NExWCXmYJBAbM4SADyAi Tw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f1s8cykqf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Apr 2022 20:37:31 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 231KWBie002221; Fri, 1 Apr 2022 20:37:30 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3f1tg9kaqy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Apr 2022 20:37:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RUNUTJ0Dc47ngQh0bY2qG3p7zWGVPm62wrTobQ7oMSJPfrjZY3QkJzREidB1oELWnj8R4Swzc0j3a0B+Hhc4uDWdCES3rnFGipGT6R+YEH44Fw4v/svOXo5cu2moczVTr8f2U0N/KONII3a6xVxSsGoWal0Pzuzkqq7ywD1vMC/9++xIlbg54RL/iY6TYHQEOArq86uelaAXal/cSJ8IIRyvegRGVmPt6EACQKP+pHIivdhU+vXxeQGFgNAMhADG5e9yzt5y9Rt3NBmDR9LTspfwJyuDGisH/BnWI27RWUMKJrflDIrh98M8nWEHM5Uf261GO/ZWnasGw4dW9nc/3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oX5yi6YiwIKT85DyjDllB24U+xDSJXb3625fBYsdWUU=;
 b=XjlXIZvyN2lZ5CXm+QzJVcaSGjZ3rEfh5Nhd41UUfnhfvZNst9gD76lMQgoZTGL0PYbCwljB0JqmTBEHVJOCHOYGr+dVvKT3LSSJYgZFajGU5aJw0s2q/0n03rVGXB3x3irn+mU31YCoEhMgh6vbci++rcSvR9K7whLB/Y7DbEtmq4oUFAxsrFbadCHEAw7LJygm0eMen5O2oGNQYxSuTSNzZczxKgMdA/7EWjcDCkqDK7sH2sptzxp0lyckkI6+c8JXixOdDmXNcixnu4GvJR4xfDXfap80kcV3cR3W70KUqig192tTI0ZAIQeQEG7dVqCrepyH+kPfBDcknH9Czg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oX5yi6YiwIKT85DyjDllB24U+xDSJXb3625fBYsdWUU=;
 b=UkMKgnq/PqRhHfd67vYowE1HnuuyjBRnS7h9YEIijPyHkOGsui2w0BCGEfIcFrhuuwpy7c0oV/seMpEdRzcZk2NPSzXXrlW1TL8g3CfurVgezEeti+xiSPMfmVhi+sOA5BRpZr7XbD6qYk2BPtzx5Xm5QfkV+QzhWEfFws3yXKM=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by DM6PR10MB3594.namprd10.prod.outlook.com (2603:10b6:5:155::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.25; Fri, 1 Apr
 2022 20:37:27 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::9d4f:2df4:8bd8:f468]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::9d4f:2df4:8bd8:f468%3]) with mapi id 15.20.5123.023; Fri, 1 Apr 2022
 20:37:27 +0000
Message-ID: <b190a762-1d21-4fec-b138-e4c09a949525@oracle.com>
Date: Fri, 1 Apr 2022 13:37:23 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 4/7] virtio: don't read pending event on host notifier if
 disabled
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
 <1648621997-22416-5-git-send-email-si-wei.liu@oracle.com>
 <CACGkMEt=Bs7XPWQaMOQB5iBece1CH9HJZ69YEF_m-e2Tj95qDg@mail.gmail.com>
 <4f2acb7a-d436-9d97-80b1-3308c1b396b5@oracle.com>
 <CACGkMEtsV6e6LOYCfVZb7_-SvSAWRk1XHom+neXR=d3aQQwXmg@mail.gmail.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CACGkMEtsV6e6LOYCfVZb7_-SvSAWRk1XHom+neXR=d3aQQwXmg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::15) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f27f445-6268-44f4-bfd0-08da141f6f9a
X-MS-TrafficTypeDiagnostic: DM6PR10MB3594:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB35949A1B7D172553FFA385B9B1E09@DM6PR10MB3594.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 25ZOhMBJXP9dYE3vGQqeTai2Rn645PaiPIBYXt7Yl+750MMCJscWkrulCe6aMgiM0/y5nnd8GD3VypspEFvhwMbujuRo7PHs+OGeuDLx3kamMg887S5arIBSg1JJDo0/LCKBxIVnzelMt3jFPUfcGkcziDPU+oIthpNUrb32OVuE4cfRS027nKvL2lEN4N353NeCLVMRee4vjoUUu9oJbS66HeVxztLEGu1i7Fh+Pg+v0zsjk3AIUVeDvq52mmOqH18Xvab/y1okP4u0SQnFvrjV0SvHVdbDyAsETsTv36B2usmdo/dpmwX8S/yDgvwitIwaBKbWOVo/kaCF0dLbx6zowTDbJra4/ThE/d6fjmv47R9fg5ffN8nhZYZRu7yxS2V7M43aNF6GQuFFFXcC/XTghgVjFmMZ1D3EHYY7L76xlKO08X8grXfID/6o/mekakBXk77k3DTxmTwoQWWdjrYQTU7nQAiimbMV5VEaQ4l5VhkVB3JSd8yFllBWayobN2l7NExExWaVp1ZZAh+qPuCyJ6Fv/aoKfWdCwCaC4NPrvqIaDJr7NBfd5s085jTlyvXSirhPYLpBs0jtmCck1HQuVphldH3QWapx6iJD7IZnyQeOkFA2WQBDMtrFFMRGKrFTdDTPxAdTM6CXs4fWlz+orj/FhD3wqHRLpgwBKyN5ggbxAxsoYLS+CR0qX6ea4OQ3O6xnP9DpBfXUk25tKuppl0S5gXZjLNp8e5cJIrU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6666004)(53546011)(36916002)(186003)(26005)(316002)(31696002)(66556008)(2906002)(86362001)(83380400001)(30864003)(6916009)(6506007)(5660300002)(6512007)(66946007)(8676002)(8936002)(4326008)(2616005)(38100700002)(54906003)(66476007)(36756003)(508600001)(6486002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmQvRnJrbFYzQnFNdkVXdFhzRWZxMUJaWU9sSVlSbk00WGs3QzR2UTAwbmor?=
 =?utf-8?B?QnY3NHVIaTQ5VkppRW4xd0JpRm5ubi9aNWY4OUJKY3ZYMFAzanRkN1RyWHMx?=
 =?utf-8?B?QnF5Y29FcXdvdW5CNDJpelFiNlZnUTRqU0V0SkZwdFRRTjdDb2ZUN2piWXM5?=
 =?utf-8?B?SklxcWFnVTJuNDNldUdYM294bzhMbzJiMXFaanRreWxRYW1HdmF2VHVqZlN0?=
 =?utf-8?B?OSsyb1hqUmhVR2RSSEtsWEMxcXMrMWdrdUZyTXQzMVRESFpZanR1VklPUVF3?=
 =?utf-8?B?UUkzZlNZUHNPVnpEajAzbTZ1TmdqdXRxcXlJNTlZam9OTXpGYTE4WDU5b2to?=
 =?utf-8?B?U3VhYjJCSjh3akdpQ0JJWjlkM1E2YzNXeWIvbUh4UXNwKzAzOCtpTlNVRWpM?=
 =?utf-8?B?czlzakkzTTF3YWxocWd6U0lTYzhoWTkxcDhKY1J3NDJLdllRMDQza0tReXNR?=
 =?utf-8?B?UVBDTFJjZERhMklxbDJPR3ZpU00zem1XNDdxN2loOFBxeEJzS2pXUU1LY0to?=
 =?utf-8?B?WExHdVFhWFY5d3VkdGV5aHhtZHh4ZXlXazNuekprTVBRTG9tWVhmYW5kb0hm?=
 =?utf-8?B?NzFsT0tGa2ZCSHVQdTY0dGovdkhJei83eHljR1IwZFA1ODk5VVdMZWdJY3Q4?=
 =?utf-8?B?S0RPUjFJWlZDeTh0SGprTHlkSm5YMDJlQU1STGdIOXc4VjNMdk1TUUxKUmRa?=
 =?utf-8?B?U0p5VjlVUmxjcVVwTUo2a0RqS0tzL0dHS2FUZm9jSmNqVWhUdUVzc243NHhI?=
 =?utf-8?B?Z1BMOWRlWW96Q3ZuL2ROQzZobStjSEtWWDdxMndEcW1EUlRJQnBFbGV0R3ly?=
 =?utf-8?B?aHlxc2U4MkFwc1N3L2w0VGptUHlhZ1hCeFNMbzZTUWpMYkkvTVJiSGxQZWRJ?=
 =?utf-8?B?bDJxd0t1S0RhVExJSU5yQzYrRFJsMCtOMjA3ZTdaZWNTTW5FQ1c4cHdrRGdL?=
 =?utf-8?B?SzVMZG1tNEQvb0dZQ0hSeG9NZjlpa0dzY2lZMDM5MllDRWZrM0Y5QURJczhV?=
 =?utf-8?B?V0M1amZCeWhtOGtuNVBubVRjdFVDMUYvcFpuWGpoejZScWt0bUNIRFlzU3Uv?=
 =?utf-8?B?VUY4VkZTQWZEeTlLcmw0bjM1ZWJIaVI1aU50RFBwOXA1QVR3V1M0MCt1a3Nn?=
 =?utf-8?B?RjR1NlR4b1BPWUkrNFgxVDBvcll5YTdRRFF2QUNvWDdMVDFlL2ZRMHFObVNn?=
 =?utf-8?B?SGVNeE9Vek5oVFJ6V1NONG9vVVBQSm5jVGx6UEFzL3BadFNxcnpRS0ZhY0dV?=
 =?utf-8?B?WWNUYXBWNUJLVmZ4RHRwcDQybFRJclJSNWV2STFsZjQrVy9YV1lMSDE3b2cw?=
 =?utf-8?B?N3lqeWNscklaVS9BUm9Fc2pvTkFmN1QrZWMwZkk0Z0hhSzh1cGdyYmRUSTBH?=
 =?utf-8?B?RktZUEdrZjRnNnhVTzlER2w5ZG9Wc2FIc21jRVM3bEIzVURkcFZ2SjVMUW40?=
 =?utf-8?B?OERSQTAyRXhjN2pzMXZGUnpqbXFVRnNYNUp0MVRxVW9rc2QzUVFiZ3dhTURJ?=
 =?utf-8?B?eGtsQkZ6LzBzQ1RMRU9sNXBJNjFVUHhNdCtSOEVTdmt2bE1RT3VaUVRvZFdm?=
 =?utf-8?B?dUNhdGxKKy9XWkpUQTBwM2hKYjBqMlNFZGpiYWlGamNUZGhURjVwcU5aTkxq?=
 =?utf-8?B?cHB6RVFKVmIvamIyRU40bzFpeWx5K3R2Sy9uWHlmOEpyOUpXWTRFb1NxNUJV?=
 =?utf-8?B?ZEI2REtxWFZiblhxSXgvRmhPUVpGdHJ1Mzl4bks0WGk0OEhpckE0V3hocytm?=
 =?utf-8?B?SENBdjhWdFExNGE2cURTSkJSTWc5bDBJdzBwTXZCZ2wrdklXaHR6YS9telVY?=
 =?utf-8?B?cnBiaG5YcWZ4TVo1UDQxN0xkMUtzRWl3ZWlwT0JVb3E5dDh6bE9Ud3NjRlpq?=
 =?utf-8?B?bHB3Tm12KysyeVFkVVRIQ3B2bVI2SUl5eTRHRFhWR0paM0pYV0RWYU9ONCt3?=
 =?utf-8?B?STRwbWxwK1JrRTFWVzlnZFlMT2JxMHFSYTdEcGpuYWZqTWtObmVkOVMxNnlj?=
 =?utf-8?B?b1QrVjVBSW9BSC84R2ZjQWFwb1FENGI3KzBNZ0l3OC95SktWUkl4VjhhSWJZ?=
 =?utf-8?B?SkdMZGhLNm9mZ2hMbno0d1RuRlpnMExPQVhtbkQ0SFdabmMzT21UUXB2aERx?=
 =?utf-8?B?Q2dzR3pLY1dRNTVNM3Qwbmp0clNja0dkWVovaTFjOEpXVld6YUw4MjFJTVZM?=
 =?utf-8?B?eG1ocHdidFZTcjN2RDRSUlVQZkwvS0hoeVA0QUM0bnRGZWxxcEZta3orcFRL?=
 =?utf-8?B?bkRYTDJvZGxrSVlBcHNMbjJERUFFbktTVUlZVklIbXM4emR0Q0FESURIUnd3?=
 =?utf-8?B?cXdXTVh4NEhPME1JcWVxTTRzYkkvczJ3YUdOeHF2dTBHckZsM2xxZz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f27f445-6268-44f4-bfd0-08da141f6f9a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 20:37:27.7800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 20wflvIxMqUNHbyqjk4WfLkJYWxyg495e4NOnuz9ue6QQGpi2tpidlWnYCfvdgNxCjfFc4g1uEKWGVxae8QyHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3594
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-04-01_05:2022-03-30,
 2022-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 mlxscore=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204010098
X-Proofpoint-GUID: TrZnAf-yRUoMxqItBDanu1M44tJO1ekW
X-Proofpoint-ORIG-GUID: TrZnAf-yRUoMxqItBDanu1M44tJO1ekW
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
Cc: eperezma <eperezma@redhat.com>, Eli Cohen <eli@mellanox.com>,
 qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/31/2022 1:36 AM, Jason Wang wrote:
> On Thu, Mar 31, 2022 at 12:41 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>
>>
>> On 3/30/2022 2:14 AM, Jason Wang wrote:
>>> On Wed, Mar 30, 2022 at 2:33 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>>> Previous commit prevents vhost-user and vhost-vdpa from using
>>>> userland vq handler via disable_ioeventfd_handler. The same
>>>> needs to be done for host notifier cleanup too, as the
>>>> virtio_queue_host_notifier_read handler still tends to read
>>>> pending event left behind on ioeventfd and attempts to handle
>>>> outstanding kicks from QEMU userland vq.
>>>>
>>>> If vq handler is not disabled on cleanup, it may lead to sigsegv
>>>> with recursive virtio_net_set_status call on the control vq:
>>>>
>>>> 0  0x00007f8ce3ff3387 in raise () at /lib64/libc.so.6
>>>> 1  0x00007f8ce3ff4a78 in abort () at /lib64/libc.so.6
>>>> 2  0x00007f8ce3fec1a6 in __assert_fail_base () at /lib64/libc.so.6
>>>> 3  0x00007f8ce3fec252 in  () at /lib64/libc.so.6
>>>> 4  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=<optimized out>, idx=<optimized out>) at ../hw/virtio/vhost-vdpa.c:563
>>>> 5  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=<optimized out>, idx=<optimized out>) at ../hw/virtio/vhost-vdpa.c:558
>>>> 6  0x0000558f52d7329a in vhost_virtqueue_mask (hdev=0x558f55c01800, vdev=0x558f568f91f0, n=2, mask=<optimized out>) at ../hw/virtio/vhost.c:1557
>>> I feel it's probably a bug elsewhere e.g when we fail to start
>>> vhost-vDPA, it's the charge of the Qemu to poll host notifier and we
>>> will fallback to the userspace vq handler.
>> Apologies, an incorrect stack trace was pasted which actually came from
>> patch #1. I will post a v2 with the corresponding one as below:
>>
>> 0  0x000055f800df1780 in qdev_get_parent_bus (dev=0x0) at
>> ../hw/core/qdev.c:376
>> 1  0x000055f800c68ad8 in virtio_bus_device_iommu_enabled
>> (vdev=vdev@entry=0x0) at ../hw/virtio/virtio-bus.c:331
>> 2  0x000055f800d70d7f in vhost_memory_unmap (dev=<optimized out>) at
>> ../hw/virtio/vhost.c:318
>> 3  0x000055f800d70d7f in vhost_memory_unmap (dev=<optimized out>,
>> buffer=0x7fc19bec5240, len=2052, is_write=1, access_len=2052) at
>> ../hw/virtio/vhost.c:336
>> 4  0x000055f800d71867 in vhost_virtqueue_stop
>> (dev=dev@entry=0x55f8037ccc30, vdev=vdev@entry=0x55f8044ec590,
>> vq=0x55f8037cceb0, idx=0) at ../hw/virtio/vhost.c:1241
>> 5  0x000055f800d7406c in vhost_dev_stop (hdev=hdev@entry=0x55f8037ccc30,
>> vdev=vdev@entry=0x55f8044ec590) at ../hw/virtio/vhost.c:1839
>> 6  0x000055f800bf00a7 in vhost_net_stop_one (net=0x55f8037ccc30,
>> dev=0x55f8044ec590) at ../hw/net/vhost_net.c:315
>> 7  0x000055f800bf0678 in vhost_net_stop (dev=dev@entry=0x55f8044ec590,
>> ncs=0x55f80452bae0, data_queue_pairs=data_queue_pairs@entry=7,
>> cvq=cvq@entry=1)
>>      at ../hw/net/vhost_net.c:423
>> 8  0x000055f800d4e628 in virtio_net_set_status (status=<optimized out>,
>> n=0x55f8044ec590) at ../hw/net/virtio-net.c:296
>> 9  0x000055f800d4e628 in virtio_net_set_status
>> (vdev=vdev@entry=0x55f8044ec590, status=15 '\017') at
>> ../hw/net/virtio-net.c:370
> I don't understand why virtio_net_handle_ctrl() call virtio_net_set_stauts()...
The pending request left over on the ctrl vq was a VIRTIO_NET_CTRL_MQ 
command, i.e. in virtio_net_handle_mq():

1413     n->curr_queue_pairs = queue_pairs;
1414     /* stop the backend before changing the number of queue_pairs 
to avoid handling a
1415      * disabled queue */
1416     virtio_net_set_status(vdev, vdev->status);
1417     virtio_net_set_queue_pairs(n);

Noted before the vdpa multiqueue support, there was never a vhost_dev 
for ctrl_vq exposed, i.e. there's no host notifier set up for the 
ctrl_vq on vhost_kernel as it is emulated in QEMU software.

>
>> 10 0x000055f800d534d8 in virtio_net_handle_ctrl (iov_cnt=<optimized
>> out>, iov=<optimized out>, cmd=0 '\000', n=0x55f8044ec590) at
>> ../hw/net/virtio-net.c:1408
>> 11 0x000055f800d534d8 in virtio_net_handle_ctrl (vdev=0x55f8044ec590,
>> vq=0x7fc1a7e888d0) at ../hw/net/virtio-net.c:1452
>> 12 0x000055f800d69f37 in virtio_queue_host_notifier_read
>> (vq=0x7fc1a7e888d0) at ../hw/virtio/virtio.c:2331
>> 13 0x000055f800d69f37 in virtio_queue_host_notifier_read
>> (n=n@entry=0x7fc1a7e8894c) at ../hw/virtio/virtio.c:3575
>> 14 0x000055f800c688e6 in virtio_bus_cleanup_host_notifier
>> (bus=<optimized out>, n=n@entry=14) at ../hw/virtio/virtio-bus.c:312
>> 15 0x000055f800d73106 in vhost_dev_disable_notifiers
>> (hdev=hdev@entry=0x55f8035b51b0, vdev=vdev@entry=0x55f8044ec590)
>>      at ../../../include/hw/virtio/virtio-bus.h:35
>> 16 0x000055f800bf00b2 in vhost_net_stop_one (net=0x55f8035b51b0,
>> dev=0x55f8044ec590) at ../hw/net/vhost_net.c:316
>> 17 0x000055f800bf0678 in vhost_net_stop (dev=dev@entry=0x55f8044ec590,
>> ncs=0x55f80452bae0, data_queue_pairs=data_queue_pairs@entry=7,
>> cvq=cvq@entry=1)
>>      at ../hw/net/vhost_net.c:423
>> 18 0x000055f800d4e628 in virtio_net_set_status (status=<optimized out>,
>> n=0x55f8044ec590) at ../hw/net/virtio-net.c:296
>> 19 0x000055f800d4e628 in virtio_net_set_status (vdev=0x55f8044ec590,
>> status=15 '\017') at ../hw/net/virtio-net.c:370
>> 20 0x000055f800d6c4b2 in virtio_set_status (vdev=0x55f8044ec590,
>> val=<optimized out>) at ../hw/virtio/virtio.c:1945
>> 21 0x000055f800d11d9d in vm_state_notify (running=running@entry=false,
>> state=state@entry=RUN_STATE_SHUTDOWN) at ../softmmu/runstate.c:333
>> 22 0x000055f800d04e7a in do_vm_stop
>> (state=state@entry=RUN_STATE_SHUTDOWN, send_stop=send_stop@entry=false)
>> at ../softmmu/cpus.c:262
>> 23 0x000055f800d04e99 in vm_shutdown () at ../softmmu/cpus.c:280
>> 24 0x000055f800d126af in qemu_cleanup () at ../softmmu/runstate.c:812
>> 25 0x000055f800ad5b13 in main (argc=<optimized out>, argv=<optimized
>> out>, envp=<optimized out>) at ../softmmu/main.c:51
>>
>>   From the trace pending read only occurs in stop path. The recursive
>> virtio_net_set_status from virtio_net_handle_ctrl doesn't make sense to me.
> Yes, we need to figure this out to know the root cause.
I think it has something to do with the virtqueue unready issue that the 
vhost_reset_device() refactoring series attempt to fix. If that is fixed 
we should not see this sigsegv with mlx5_vdpa. However I guess we both 
agreed that the vq_unready support would need new uAPI (some flag) to 
define, hence this fix applies to the situation where uAPI doesn't exist 
on the kernel or the vq_unready is not supported by vdpa vendor driver.

>
> The code should work for the case when vhost-vdp fails to start.
Unlike the other datapath queues for net vdpa, the events left behind in 
the control queue can't be processed by the userspace, as unlike 
vhost-kernel we don't have a fallback path in the userspace. To ignore 
the pending event and let vhost vdpa process it on resume/start is 
perhaps the best thing to do. This is even true for datapath queues for 
other vdpa devices than of network.

>
>> Not sure I got the reason why we need to handle pending host
>> notification in userland vq, can you elaborate?
> Because vhost-vDPA fails to start, we will "fallback" to a dummy userspace.
Is the dummy userspace working or operational? What's the use case of 
this "fallback" dummy if what guest user can get is a busted NIC? I 
think this is very different from the vhost-kernel case in that once 
vhost fails, we can fallback to userspace to emulate the network through 
the tap fd in a good way. However, there's no equivalent yet for 
vhost-vdpa...

Thanks,
-Siwei

>
> Thanks
>
>> Thanks,
>> -Siwei
>>
>>> Thanks
>>>
>>>> 7  0x0000558f52c6b89a in virtio_pci_set_guest_notifier (d=d@entry=0x558f568f0f60, n=n@entry=2, assign=assign@entry=true, with_irqfd=with_irqfd@entry=false)
>>>>      at ../hw/virtio/virtio-pci.c:974
>>>> 8  0x0000558f52c6c0d8 in virtio_pci_set_guest_notifiers (d=0x558f568f0f60, nvqs=3, assign=true) at ../hw/virtio/virtio-pci.c:1019
>>>> 9  0x0000558f52bf091d in vhost_net_start (dev=dev@entry=0x558f568f91f0, ncs=0x558f56937cd0, data_queue_pairs=data_queue_pairs@entry=1, cvq=cvq@entry=1)
>>>>      at ../hw/net/vhost_net.c:361
>>>> 10 0x0000558f52d4e5e7 in virtio_net_set_status (status=<optimized out>, n=0x558f568f91f0) at ../hw/net/virtio-net.c:289
>>>> 11 0x0000558f52d4e5e7 in virtio_net_set_status (vdev=0x558f568f91f0, status=15 '\017') at ../hw/net/virtio-net.c:370
>>>> 12 0x0000558f52d6c4b2 in virtio_set_status (vdev=vdev@entry=0x558f568f91f0, val=val@entry=15 '\017') at ../hw/virtio/virtio.c:1945
>>>> 13 0x0000558f52c69eff in virtio_pci_common_write (opaque=0x558f568f0f60, addr=<optimized out>, val=<optimized out>, size=<optimized out>) at ../hw/virtio/virtio-pci.c:1292
>>>> 14 0x0000558f52d15d6e in memory_region_write_accessor (mr=0x558f568f19d0, addr=20, value=<optimized out>, size=1, shift=<optimized out>, mask=<optimized out>, attrs=...)
>>>>      at ../softmmu/memory.c:492
>>>> 15 0x0000558f52d127de in access_with_adjusted_size (addr=addr@entry=20, value=value@entry=0x7f8cdbffe748, size=size@entry=1, access_size_min=<optimized out>, access_size_max=<optimized out>, access_fn=0x558f52d15cf0 <memory_region_write_accessor>, mr=0x558f568f19d0, attrs=...) at ../softmmu/memory.c:554
>>>> 16 0x0000558f52d157ef in memory_region_dispatch_write (mr=mr@entry=0x558f568f19d0, addr=20, data=<optimized out>, op=<optimized out>, attrs=attrs@entry=...)
>>>>      at ../softmmu/memory.c:1504
>>>> 17 0x0000558f52d078e7 in flatview_write_continue (fv=fv@entry=0x7f8accbc3b90, addr=addr@entry=103079215124, attrs=..., ptr=ptr@entry=0x7f8ce6300028, len=len@entry=1, addr1=<optimized out>, l=<optimized out>, mr=0x558f568f19d0) at ../../../include/qemu/host-utils.h:165
>>>> 18 0x0000558f52d07b06 in flatview_write (fv=0x7f8accbc3b90, addr=103079215124, attrs=..., buf=0x7f8ce6300028, len=1) at ../softmmu/physmem.c:2822
>>>> 19 0x0000558f52d0b36b in address_space_write (as=<optimized out>, addr=<optimized out>, attrs=..., buf=buf@entry=0x7f8ce6300028, len=<optimized out>)
>>>>      at ../softmmu/physmem.c:2914
>>>> 20 0x0000558f52d0b3da in address_space_rw (as=<optimized out>, addr=<optimized out>, attrs=...,
>>>>      attrs@entry=..., buf=buf@entry=0x7f8ce6300028, len=<optimized out>, is_write=<optimized out>) at ../softmmu/physmem.c:2924
>>>> 21 0x0000558f52dced09 in kvm_cpu_exec (cpu=cpu@entry=0x558f55c2da60) at ../accel/kvm/kvm-all.c:2903
>>>> 22 0x0000558f52dcfabd in kvm_vcpu_thread_fn (arg=arg@entry=0x558f55c2da60) at ../accel/kvm/kvm-accel-ops.c:49
>>>> 23 0x0000558f52f9f04a in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:556
>>>> 24 0x00007f8ce4392ea5 in start_thread () at /lib64/libpthread.so.0
>>>> 25 0x00007f8ce40bb9fd in clone () at /lib64/libc.so.6
>>>>
>>>> Fixes: 4023784 ("vhost-vdpa: multiqueue support")
>>>> Cc: Jason Wang <jasowang@redhat.com>
>>>> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
>>>> ---
>>>>    hw/virtio/virtio-bus.c | 3 ++-
>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
>>>> index 0f69d1c..3159b58 100644
>>>> --- a/hw/virtio/virtio-bus.c
>>>> +++ b/hw/virtio/virtio-bus.c
>>>> @@ -311,7 +311,8 @@ void virtio_bus_cleanup_host_notifier(VirtioBusState *bus, int n)
>>>>        /* Test and clear notifier after disabling event,
>>>>         * in case poll callback didn't have time to run.
>>>>         */
>>>> -    virtio_queue_host_notifier_read(notifier);
>>>> +    if (!vdev->disable_ioeventfd_handler)
>>>> +        virtio_queue_host_notifier_read(notifier);
>>>>        event_notifier_cleanup(notifier);
>>>>    }
>>>>
>>>> --
>>>> 1.8.3.1
>>>>


