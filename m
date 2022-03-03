Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 538C94CC25C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 17:11:56 +0100 (CET)
Received: from localhost ([::1]:36380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPo3X-0002XS-Az
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 11:11:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nPnnS-0005AK-Dl
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:55:18 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:18544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nPnnO-0005YU-8S
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:55:17 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 223F64TM007662; 
 Thu, 3 Mar 2022 15:54:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=OD5UlcaOau8ZOP2ki9axAGqEbkF2iyxZUuLrXnANWgg=;
 b=m+d1LQ7f07HYkS77vRribpWhN1TLQXUsFi8jHDaW4+kidaRKz3TFikBlhbfqc5DbB1o+
 c07n2cnkC7hrR/pA1pWl9Tg8T1F6tyS2R5UpO2YgqtjcW4gbwliy7DzusQjQICu1iCcN
 lcU4l5dRDYywz6ufVAl0tTQ5ecV8q7QJ4utNLmj9kWbpDQUbIz26ulEwTjKbZeajPtDC
 tZGfL3vUOFVIJEGLgJ5dhwDAuKnRgo7Eq2fR8qh4B3ilnzuH/g+O+zainf4Nv4wLE/cG
 JanjYlsEuf/AjGkN/BPOXOaqYUrXkyUk8gH92sstiMQyDoR/M4e4Ze3p4zpjYTXqFoeS +g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3eh15aryrt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Mar 2022 15:54:58 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 223Fq5Da072748;
 Thu, 3 Mar 2022 15:54:56 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
 by userp3030.oracle.com with ESMTP id 3ef9b3prja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Mar 2022 15:54:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DE0OkPVnj2YTYKRBYfUVwvM9cPz0mPVoFq4J+FHQYX+2wJo5w0xyUfJDSNYsLo8oDxf38rL/MZNu2mTxd3R/VzIcxMOyF/7nuH95VC9u2elyh53m1d6BZuq0U/fF2PZZk8mbBo9W8+2IHkzabU0+k4P9H7FFwq1psaoHu2Q0PWoRgsmCXTBS4lBGTTpzbZoowutDVxFfkuhwwM39TAg250v/hpsJElEnra2rWpeloorMO5lo0ayseqiJFmcGU3ynw5Tew6kLaJjuI/J/IKoPCEZzGDUkuRnZQkQU36p3mJdCVfc4KVq8YZkrhabaP8XbzgS5i0unmJ/cKXlMTniUyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OD5UlcaOau8ZOP2ki9axAGqEbkF2iyxZUuLrXnANWgg=;
 b=HJX/dyUGHBdy3jXiAVLjz7yhEWGzpkmb3kE4TFTP9yGmwPsabnKqKaXr1bvmEtGanbgEB7y1JrhL/Me2d2fikmAKRmmLxq62OzDolvldHfH57TzbngLU36vUJDvnwsPHoG5zem51I9JkXQnqJU5e3r0oShiSW+Z/ekIVsa9/blwF0mhBcKqHNFW1TC/AjakYvFWZTV2mrNobLaGkWWk0aLNnQLz/OBBZBECsW9EpPfHUE/glMEUMc64wgeDGFkiihcGuGq4StE0feLN3Co3XYP1hf9NhstafKCt4V75wrU9ZeDU+5eqhi13n2o/coyM8h//WtFGE4PYbN37h/qjcPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OD5UlcaOau8ZOP2ki9axAGqEbkF2iyxZUuLrXnANWgg=;
 b=ZqwNuUTocbeYxrOFskEqzJGHAxpfI6uROWBLlDCphkLaL1EvTrjBsZzFGOhsJd0EuE4b7dW+TGlp/ypFb7OvNaof0Jh1eo25RpY/R0qrUeKUqX9DsPbDe0fmUAquHEEYXPwVlcc4mKU2OaaBcMLXJYZ3XX0/omFqA+e6qu/+xAs=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by DM5PR1001MB2234.namprd10.prod.outlook.com (2603:10b6:4:2c::36)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Thu, 3 Mar
 2022 15:54:53 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6005:8b9:1b00:b0da]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6005:8b9:1b00:b0da%6]) with mapi id 15.20.5038.016; Thu, 3 Mar 2022
 15:54:53 +0000
Message-ID: <aa158360-be6e-ceb8-7f86-765b0fc8d371@oracle.com>
Date: Thu, 3 Mar 2022 10:54:49 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH V7 29/29] cpr: only-cpr-capable option
Content-Language: en-US
To: Guoyi Tu <tugy@chinatelecom.cn>, qemu-devel@nongnu.org
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-30-git-send-email-steven.sistare@oracle.com>
 <1be6733ab2585db50cbd98fc9930a9273520ffcd.camel@chinatelecom.cn>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <1be6733ab2585db50cbd98fc9930a9273520ffcd.camel@chinatelecom.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0100.namprd05.prod.outlook.com
 (2603:10b6:a03:334::15) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c83144c3-6e83-497d-9b5a-08d9fd2e281a
X-MS-TrafficTypeDiagnostic: DM5PR1001MB2234:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1001MB2234C2D991DD652788965E14F9049@DM5PR1001MB2234.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yyaPNZemARoycxscxH2K6WqZ2Zudlrxc4j6Vdy0DjVT2biXgcbHd3TVSrDP4wspqRCG1LocSRsAlAFVskzd4999STZGo3k2NZ4wbnp91oGw0elECvu5M3BEV8WLXcduBx2AxJGN3637tEoOTj4/QUXQJxylUiB9ztOocqEYkMRhorGDjW5MPd+PBu43ofHogq5WQ8Y/qPQVSdc1MO3Rk5qz24EZ/T5Hk3Cd264K5Y7NEBUZv5ZXYmpDLmeU1w66qCRK/3ULP/S3HGpfFQZ7LUbEye6Ys8rerr5dkKXmE7dCRbCCf0Ot3KzzVSu+6LGV+wnkVnSUyYev1S3ZmELhh9DKUv8XkY1eySQ7JOryrcID4ec9a80jc1JXTBhXAGeJ9g+ifi9T8sWQ13Lcu89JLtwgHH4GHymaooN9a117Vmvb90ePsyCkG6ooXxUMTNjJYAHzpAnkMMLcCB30xBv0AsiUqcF+38n623HpsrQUkmtHj0J18rtGtBBJGsiKCM/QkMGeRSaVX3bJMZvqrS3MNziOgfVMx+WM2Wt0rjW1wr3eTLwDRiBfF+VYLLMg4EagvGORUO/JaxcI9SSJ4/yL7vWNcTpTBO2zXa3VyjfHJfWgzCJnWgK2BES9JIYIrrx2g0+gNoFGggLgmzxEJHIauWoa1mjrzQkjdE+IEwPE+AFUyezHcagoe/EY1a7MthK02U15Pf2rsSzNjH05QirZPlsJb6R0xOyKCbROG/qBuhIiLb8lAvOMiWr+VHHORiUDK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(107886003)(186003)(508600001)(26005)(2616005)(31696002)(7416002)(8936002)(4001150100001)(5660300002)(86362001)(44832011)(66946007)(8676002)(66556008)(66476007)(54906003)(38100700002)(4326008)(31686004)(6666004)(6512007)(83380400001)(2906002)(6506007)(53546011)(316002)(36916002)(36756003)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RW5PNWtyR0VMdEZTZ1duRzBMckxXU2wraGV4WmF0czZsT2laNHdXeWNCdVVB?=
 =?utf-8?B?RnVuVWNzanJXQWx3WDhYS0dZVExUTTlmQVZNMlFYY0tUV2JyNmN3OWtKY2hl?=
 =?utf-8?B?bnp5TXhidm02VDdwT0JIb1VyMGkyQVhyN1F4YU5ydmFFN2lwQnVPODlEdWhi?=
 =?utf-8?B?cXp0TDFXMlJ1bms5WTByTDdLZjR0cFNnR1d3YVNNakdqWjFrYnJRWFAwZmdW?=
 =?utf-8?B?L09TejUxczN1REpIeERnVjhGNVpLZWZ3UEd5QWNLTVlRVTBNeTJzV2ZETVlr?=
 =?utf-8?B?MHdOeUJrZkxNZHRySG1Qb1BnbjJjT0pIc25kZnhNOFVrYVFKRWpjanZuWnd6?=
 =?utf-8?B?Rm1CeWJKeENxaFh3a09JVEgrU3JGK1UwaXZibUg2ZXU4dDIyeTNYOHlMY01U?=
 =?utf-8?B?WHZoaTRBNDQyejRqSlAwa0UvbExnMFF5ZXZWVWFjNjBwakVBbWpnbG4yN3V2?=
 =?utf-8?B?Q2sxUjg3SlJGSVNwZGhkQ3Y5bDN1bzFNVkZhTk1FNENhRzhacTQvSlM5Z3JR?=
 =?utf-8?B?LzlCeXpKdDAvdVB0clYvZVhldjFUMTg3VnZTNnM2Sjd0b2VtdUtsMnQ5NE5o?=
 =?utf-8?B?S1hWam45RjdyRHFUQU1XNFBVYWM5V1F3ZGIvQUQxejBTWFAvQURhcER3Nm1L?=
 =?utf-8?B?ekd1bGpNWC95djBTbXoycHp3MEl1N3lLN0FWNEVhR1l2S3hzK3FVVUwrdGJV?=
 =?utf-8?B?TmphTlpaT0UvR2xHczk3ZmFLUDlRUEdRckg0eENHZzFjZFQ3T0FCdDdVSTBQ?=
 =?utf-8?B?bUFRNlpUVmczZ3ByTGtBc1hPZnpBTUx0YTZqTlc2NXhPNjkyc2RFaXVadEtP?=
 =?utf-8?B?VnJzVzZRZFNDdWRIYkhiOGhhWFQ2OHZxb2t4UWxIaEY2d1VqdEh0Ums1QVFV?=
 =?utf-8?B?Wmhnbng5TzEyTWRVbTkrZ2o4WVc0c2Jyd2F1SXFhUXlJRDZPV21uMXdKSTBa?=
 =?utf-8?B?REh0YWZ2dDhoTDNxNTBqQ0FKbi83YU10Q1h3T0ZsREpzU3lwQzhLV3I3QjF4?=
 =?utf-8?B?dFJXZmFqcVgxM2RpREhsWGFaYkJoVTlLZUlKeDZYK0xpODdkMjlRQzMwa1pt?=
 =?utf-8?B?dGY4MjlhbmcwbkE5TnBXaENFZGN5T2tyM3ltZ2phQVFGM2VSTkI4TERGRDZq?=
 =?utf-8?B?UE5nZVJGREVydUlKaGg5QkdyemVEc2dTQjc2WnEzUERDRVNUSko5WS90MURL?=
 =?utf-8?B?U1pLb05SQnRhcXVCa0tHazhFL2dxOTJaNTZBTkVId1pMa2dEWVMrSFdHVW91?=
 =?utf-8?B?VWE5Yit2SmtJRzQxcThmRWtTbkpmai9SaGhVYnlpY2ZaY2xHRUhuQ3RRbEwx?=
 =?utf-8?B?OElwdjkzS2EvVUR2VjJyUWtOSmxUd2k3ZWhyNUxLVmVnSWNhSUs0VDNGb3gy?=
 =?utf-8?B?ME9KeDZWcGhTL2wrdW1kQnliRjFqN1NVVmhLejM0TFdDR0MvRzlVQ3JzWDlN?=
 =?utf-8?B?dU5TZ1ZwT1hBcHkyNHdZUzE4K3FUVTJLcExkcWxLY3pKYUlzcG05YzFydGxn?=
 =?utf-8?B?WjR6MWxMNnhwOTNpNk1wU2wzVDV3R05LK203bE1xQmhXRHlvU1VLWlFEUHZL?=
 =?utf-8?B?UEpvbmdCSVR4VCt3YmlTTUFLUUNjU3NUUHE3d2tIMzFXZ1R4ZEhUYlZxcnRw?=
 =?utf-8?B?eHA0V2Y5Ty9ZTnpZbnhPWkNraE1DQ3JSaXUvVldsVnI1aldPYnRxZlEwc0FB?=
 =?utf-8?B?V3pUcHZCYlBpRXduUlc3Z0NPc3Zkc3huczQ3WEhCRENFTlRRVDJSKzF2NkpM?=
 =?utf-8?B?SXQvQ2JmRDJNc2l3T1hSUFdQWWw2bjhsckgyV0RkYW91K3V3Y1MzYWVpZkY2?=
 =?utf-8?B?Q3ZqRlA3ZXJQMnI2ZUk1aFlQWXR3WGY4VlRBMFowemxRTjR2QnFOeHdrYW83?=
 =?utf-8?B?c2FPOHBFbWlrT0VSU2JKOFNKRjZSUTVpa2FQL2JCaGh5ZS9uTmE3dlErZTNV?=
 =?utf-8?B?SG5vNzRlcisxZHFqQ29ycEtDN0ZMNlVnOXRvL3hSZlZ0dmZUY05QOGJvNGNV?=
 =?utf-8?B?cmxZd2EyZzhEMWM2YzlvL0hjUTQwSkliT0llVzFvVFVGQ2ZReks5aEFqL3Zs?=
 =?utf-8?B?cUVNclpYRkk2QkxhbUFGVG9VZnJBeWh6V0JZQ2ZuL1BDdWk1S2dxejJLL29m?=
 =?utf-8?B?U1JZUUdlemt4U3B4MzdoNlg2UHFUYWUxVUlYdmRpWjExNWZTdnRaRXNta1R0?=
 =?utf-8?B?R0FFVm42SDJiUGRReFJQRmprVWZ4d216M0ZrVlhEMm1Yc2V4SEZKbUpLamR3?=
 =?utf-8?B?YWQrdmE2dHg2T2VCRGpRUzlPa1RBPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c83144c3-6e83-497d-9b5a-08d9fd2e281a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 15:54:53.4822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Arqb2D6oXxW6+dvTCxKCD/OGWc5Y6B/pNPSjyJhgY80vb13NO8rwAA5e4/zCTBgzlmQY3rDo9/MCCB0Dp/CYsKWcGRQP8kLS8WkEyiJoG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2234
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10275
 signatures=686983
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 malwarescore=0
 mlxscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2203030076
X-Proofpoint-ORIG-GUID: XljNO06AFcuztDRVFHa0P0XH7-irHCA2
X-Proofpoint-GUID: XljNO06AFcuztDRVFHa0P0XH7-irHCA2
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/18/2022 4:43 AM, Guoyi Tu wrote:
> On Wed, 2021-12-22 at 11:05 -0800, Steve Sistare wrote:
>> Add the only-cpr-capable option, which causes qemu to exit with an
>> error
>> if any devices that are not capable of cpr are added.  This
>> guarantees that
>> a cpr-exec operation will not fail with an unsupported device error.
>>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> ---
>>  MAINTAINERS             |  1 +
>>  chardev/char-socket.c   |  4 ++++
>>  hw/vfio/common.c        |  6 ++++++
>>  include/sysemu/sysemu.h |  1 +
>>  migration/migration.c   |  5 +++++
>>  qemu-options.hx         |  8 ++++++++
>>  softmmu/globals.c       |  1 +
>>  softmmu/physmem.c       |  5 +++++
>>  softmmu/vl.c            | 14 +++++++++++++-
>>  stubs/cpr.c             |  3 +++
>>  stubs/meson.build       |  1 +
>>  11 files changed, 48 insertions(+), 1 deletion(-)
>>  create mode 100644 stubs/cpr.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index feed239..af5abc3 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -2998,6 +2998,7 @@ F: migration/cpr.c
>>  F: qapi/cpr.json
>>  F: migration/cpr-state.c
>>  F: stubs/cpr-state.c
>> +F: stubs/cpr.c
>>  
>>  Record/replay
>>  M: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
>> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
>> index c111e17..a4513a7 100644
>> --- a/chardev/char-socket.c
>> +++ b/chardev/char-socket.c
>> @@ -34,6 +34,7 @@
>>  #include "qapi/clone-visitor.h"
>>  #include "qapi/qapi-visit-sockets.h"
>>  #include "qemu/yank.h"
>> +#include "sysemu/sysemu.h"
>>  
>>  #include "chardev/char-io.h"
>>  #include "chardev/char-socket.h"
>> @@ -1416,6 +1417,9 @@ static void qmp_chardev_open_socket(Chardev
>> *chr,
>>  
>>      if (!s->tls_creds && !s->is_websock) {
>>          qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
>> +    } else if (only_cpr_capable) {
>> +        error_setg(errp, "error: socket %s is not cpr capable due to
>> %s option",
>> +                   chr->label, (s->tls_creds ? "TLS" :
>> "websocket"));
> 
> Should the error be ignored if reopen-on-cpr is set.

Yes!  Good catch, thanks.

>>      }
>>  
>>      /* be isn't opened until we get a connection */
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index f2b4a81..605ffbb 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -38,6 +38,7 @@
>>  #include "sysemu/kvm.h"
>>  #include "sysemu/reset.h"
>>  #include "sysemu/runstate.h"
>> +#include "sysemu/sysemu.h"
>>  #include "trace.h"
>>  #include "qapi/error.h"
>>  #include "migration/migration.h"
>> @@ -1923,12 +1924,17 @@ static void
>> vfio_put_address_space(VFIOAddressSpace *space)
>>  static int vfio_get_iommu_type(VFIOContainer *container,
>>                                 Error **errp)
>>  {
>> +    ERRP_GUARD();
>>      int iommu_types[] = { VFIO_TYPE1v2_IOMMU, VFIO_TYPE1_IOMMU,
>>                            VFIO_SPAPR_TCE_v2_IOMMU,
>> VFIO_SPAPR_TCE_IOMMU };
>>      int i;
>>  
>>      for (i = 0; i < ARRAY_SIZE(iommu_types); i++) {
>>          if (ioctl(container->fd, VFIO_CHECK_EXTENSION,
>> iommu_types[i])) {
>> +            if (only_cpr_capable && !vfio_is_cpr_capable(container,
>> errp)) {
>> +                error_prepend(errp, "only-cpr-capable is specified:
>> ");
>> +                return -EINVAL;
>> +            }
>>              return iommu_types[i];
>>          }
>>      }
>> diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
>> index 8fae667..6241c20 100644
>> --- a/include/sysemu/sysemu.h
>> +++ b/include/sysemu/sysemu.h
>> @@ -9,6 +9,7 @@
>>  /* vl.c */
>>  
>>  extern int only_migratable;
>> +extern bool only_cpr_capable;
>>  extern const char *qemu_name;
>>  extern QemuUUID qemu_uuid;
>>  extern bool qemu_uuid_set;
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 3de11ae..f08db0d 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -1257,6 +1257,11 @@ static bool migrate_caps_check(bool *cap_list,
>>          return false;
>>      }
>>  
>> +    if (cap_list[MIGRATION_CAPABILITY_X_COLO] && only_cpr_capable) {
>> +        error_setg(errp, "x-colo is not compatible with -only-cpr-
>> capable");
>> +        return false;
>> +    }
>> +
>>      return true;
>>  }
>>  
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index 1859b55..0cbf2e3 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -4434,6 +4434,14 @@ SRST
>>      an unmigratable state.
>>  ERST
>>  
>> +DEF("only-cpr-capable", 0, QEMU_OPTION_only_cpr_capable, \
>> +    "-only-cpr-capable    allow only cpr capable devices\n",
>> QEMU_ARCH_ALL)
>> +SRST
>> +``-only-cpr-capable``
>> +    Only allow cpr capable devices, which guarantees that cpr-save
>> and
>> +    cpr-exec will not fail with an unsupported device error.
>> +ERST
>> +
>>  DEF("nodefaults", 0, QEMU_OPTION_nodefaults, \
>>      "-nodefaults     don't create default devices\n", QEMU_ARCH_ALL)
>>  SRST
>> diff --git a/softmmu/globals.c b/softmmu/globals.c
>> index 7d0fc81..a18fd8d 100644
>> --- a/softmmu/globals.c
>> +++ b/softmmu/globals.c
>> @@ -59,6 +59,7 @@ int boot_menu;
>>  bool boot_strict;
>>  uint8_t *boot_splash_filedata;
>>  int only_migratable; /* turn it off unless user states otherwise */
>> +bool only_cpr_capable;
>>  int icount_align_option;
>>  
>>  /* The bytes in qemu_uuid are in the order specified by RFC4122,
>> _not_ in the
>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
>> index e227195..e7869f8 100644
>> --- a/softmmu/physmem.c
>> +++ b/softmmu/physmem.c
>> @@ -47,6 +47,7 @@
>>  #include "sysemu/dma.h"
>>  #include "sysemu/hostmem.h"
>>  #include "sysemu/hw_accel.h"
>> +#include "sysemu/sysemu.h"
>>  #include "sysemu/xen-mapcache.h"
>>  #include "trace/trace-root.h"
>>  
>> @@ -2010,6 +2011,10 @@ static void ram_block_add(RAMBlock *new_block,
>> Error **errp)
>>                  addr = file_ram_alloc(new_block, maxlen, mfd,
>>                                        false, false, 0, errp);
>>                  trace_anon_memfd_alloc(name, maxlen, addr, mfd);
>> +            } else if (only_cpr_capable) {
>> +                error_setg(errp,
>> +                    "only-cpr-capable requires -machine memfd-
>> alloc=on");
>> +                return;
>>              } else {
>>                  addr = qemu_anon_ram_alloc(maxlen, &mr->align,
>>                                             shared, noreserve);
>> diff --git a/softmmu/vl.c b/softmmu/vl.c
>> index 4319e1a..f14e29e 100644
>> --- a/softmmu/vl.c
>> +++ b/softmmu/vl.c
>> @@ -2743,11 +2743,20 @@ void qmp_x_exit_preconfig(Error **errp)
>>      qemu_create_cli_devices();
>>      qemu_machine_creation_done();
>>  
>> +    if (only_cpr_capable && !qemu_chr_is_cpr_capable(errp)) {
>> +        ;    /* not reached due to error_fatal */
>> +    }
>> +
>>      if (loadvm) {
>>          load_snapshot(loadvm, NULL, false, NULL, &error_fatal);
>>      }
>>      if (replay_mode != REPLAY_MODE_NONE) {
>> -        replay_vmstate_init();
>> +        if (only_cpr_capable) {
>> +            error_setg(errp, "replay is not compatible with -only-
>> cpr-capable");
>> +            /* not reached due to error_fatal */
>> +        } else {
>> +            replay_vmstate_init();
>> +        }
>>      }
>>  
>>      if (incoming) {
>> @@ -3507,6 +3516,9 @@ void qemu_init(int argc, char **argv, char
>> **envp)
>>              case QEMU_OPTION_only_migratable:
>>                  only_migratable = 1;
>>                  break;
>> +            case QEMU_OPTION_only_cpr_capable:
>> +                only_cpr_capable = true;
>> +                break;
>>              case QEMU_OPTION_nodefaults:
>>                  has_defaults = 0;
>>                  break;
>> diff --git a/stubs/cpr.c b/stubs/cpr.c
>> new file mode 100644
>> index 0000000..aaa189e
>> --- /dev/null
>> +++ b/stubs/cpr.c
>> @@ -0,0 +1,3 @@
>> +#include "qemu/osdep.h"
>> +
>> +bool only_cpr_capable;
>> diff --git a/stubs/meson.build b/stubs/meson.build
>> index 9565c7d..4c9c4ea 100644
>> --- a/stubs/meson.build
>> +++ b/stubs/meson.build
>> @@ -4,6 +4,7 @@ stub_ss.add(files('blk-exp-close-all.c'))
>>  stub_ss.add(files('blockdev-close-all-bdrv-states.c'))
>>  stub_ss.add(files('change-state-handler.c'))
>>  stub_ss.add(files('cmos.c'))
>> +stub_ss.add(files('cpr.c'))
>>  stub_ss.add(files('cpr-state.c'))
>>  stub_ss.add(files('cpu-get-clock.c'))
>>  stub_ss.add(files('cpus-get-virtual-clock.c'))
> 
> The only-cpr-capable option is a good way to prevent qemu from starting
> if some device don't support cpr. But if this option is not provided,
> the user still can perform cpr-xxx operation even there are devices
> don't support cpr, in this case, the exec() will fail and the original
> process cannot recovery.
> 
> How about introducing a cpr blocker (as migration blocker does) to
> prevent the user from performing cpr-xxx operaton to address the
> problem

Sure.  I will add a call to qemu_chr_is_cpr_capable() in cpr_save().

Thanks very much for your careful review of the chardev patches.

- Steve


