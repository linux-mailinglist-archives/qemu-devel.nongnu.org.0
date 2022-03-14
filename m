Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5004D87D9
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 16:13:13 +0100 (CET)
Received: from localhost ([::1]:48792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTmNj-0003IE-Kf
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 11:13:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nTmK0-0000Di-0R; Mon, 14 Mar 2022 11:09:20 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:9232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nTmJx-0001RF-0x; Mon, 14 Mar 2022 11:09:19 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22EEsts9001379; 
 Mon, 14 Mar 2022 15:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=ESEMfxEs772yRt2qPccz89kUodtTgfiLR1z/1y4SPsg=;
 b=qx1KhxPyoFT0cLNrOR0MguMhedH1ck3VshUo1fhYlQOOy6UipN5M+/hGCdA8fnA1HK8b
 mH6GHmsbLdWGWfZrAIH5bU1g4GZDdCfAcbvTA9zFkUp+PTRfTqaIpfFR/g6023cPR1hK
 K3pAxolN3ASnT10UrD8rcW+l8XBmSaKNBmUvrZyJxcnYJq0MLe7wO4umlqhaD2Dg7/+9
 YfIDaWaYttdtY59pLTp3GwWzhjlVHgbPSFz4LwrK8pRkjRd9UD9tMsESND+/y6GhnbSk
 D9VXSBvhGabA8ODV92t50m5j5iIj2ydF3ifVbPa8fYNEBw/rGV49UHC46JtPsjtYgfrU ag== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3et52prk1n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Mar 2022 15:08:48 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22EF5f8w037729;
 Mon, 14 Mar 2022 15:08:46 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by userp3020.oracle.com with ESMTP id 3et656tt9u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Mar 2022 15:08:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U7ciEqCnD3xp2bqd7xN0G1PRIP1N8YBHECR20TH+tHjChkvwzwAGWBA0Xw2ckDX2z76rlpieWR9ZEOCir7yz0/FMNRXRimVEsMDThRxp2EXAKug7R8Frxx3UJ07ODZbybIILYl5Dzjj1Y8AdXDP8EvthyZ7Htm9ltPXG6nijLilqrMY5J04g9c9tkwT7/OU073BlPWPTimMkXWeQl3JgUuFiPxA7eJMU3TL/++rWa6VfuFXSPVMzpz2K27zXYl/jhKsNHqT5bCeyFBUYLY0MIBCbDnRuyGpQdobAiW+FYjwEk4vWkDZjI+c6q8PQnE7xSpDe6OWeJ4n68zO1Hs+fHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ESEMfxEs772yRt2qPccz89kUodtTgfiLR1z/1y4SPsg=;
 b=Lfg9/JpnADPaHApMobNQ035pbwpprZox3385oEBsaWs2x8robyu1Abo3wG9XVFtqFmUqKvzqjfXXt0qLXhVuRbvbUuVlH1fEqMiAfGHo8x3Y19LY0/o5CA0YrtYTLSoLl1dIVy3bDBBpWiHJal6/ve4kdwXq7/r8MiRcl3XyaPHC8UPdayUSBQHEjx09niAwO0fXkRgry+0e2s59tYF/enCCOOSkmvoytpnfOyWwSXdiCZI/OP2neN5OGZsRa8hpNpUGPZkYG3h9r0wMSC8KAQ6MP/o7Es8DNGfLjVm04qpbYmTsb3bfbICGaVA/27fLN8iOPqleYuVMsm8fAH8K5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESEMfxEs772yRt2qPccz89kUodtTgfiLR1z/1y4SPsg=;
 b=W07IoaOna+3W4VxqQsgsmCME4gPf9vUO077d7ABD3nSvy8BnbJn/800daq/dkXeIyfYfNvxSdJ/QfUebCHk3kOxJ0CeDwmdBc4Ru9TQ8dMRsdOfVdkT+wi2p+v/nye/To2N/z1w3H2CwqYTatowEXstrhcnHKnp7FAiR2Jiz+9c=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by CH0PR10MB5147.namprd10.prod.outlook.com (2603:10b6:610:c2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.21; Mon, 14 Mar
 2022 15:08:43 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::a917:aeda:6ebd:56de]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::a917:aeda:6ebd:56de%3]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 15:08:43 +0000
Content-Type: multipart/alternative;
 boundary="------------UzXr6BnaEIRjfvcNZqYX5K2x"
Message-ID: <8be5ad07-4e27-5b59-e567-1cc8d88aa54a@oracle.com>
Date: Mon, 14 Mar 2022 11:08:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v13 0/8] hmp,qmp: Add commands to introspect virtio devices
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1646658521-31652-1-git-send-email-jonah.palmer@oracle.com>
 <20220307174606-mutt-send-email-mst@kernel.org>
From: Jonah Palmer <jonah.palmer@oracle.com>
In-Reply-To: <20220307174606-mutt-send-email-mst@kernel.org>
X-ClientProxiedBy: BY5PR16CA0032.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::45) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18ac8a41-eae9-4400-3e08-08da05cc879e
X-MS-TrafficTypeDiagnostic: CH0PR10MB5147:EE_
X-Microsoft-Antispam-PRVS: <CH0PR10MB5147164F3C4E9D0BA3367FE9E80F9@CH0PR10MB5147.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PfiVhYPchGjFBq2xGX0+TKpPBVh+YV4tzB/P+Aaob1ILN2qIWqPgr1/2LOVEButdKm9bym6nCRF+gXjPMeKRwz6DSle5QMd8t/ZLq7v1RJIeuTnJexh+AqiCJILELPmea2q02nDwReman1mPGGuCgGQOR6NUANwE2c4dj4qyr0zTZs9ox7S28RXt5ysHnqBmFhAVIy0hPyPXUnIh0nKcXmKSpNXfMOwueU6KDstaAme3zrSRJid1lI2oUKMt9V5mryRHPxYCntPciI4EghWzSUPW6+I5Q2jcfZC3H6gACeHwkgvjIzICikqt9uplxdgURtsi5bDBUvIYCR3q/HZASEia9Ra4F8QameiZYR7DCqCjlxICFrEcrQuVX41bYEL7qMTA4aWGbm1H8wdlRCfsM/XPFjfiwW02Z+xexRjnocMsGI4Af9/dTrU+37hdO6OzCWOzYsIdXmamQEiOm4bVXHBTnFMkKAQGhVjqh3yCa/KOvo8c6ZCTgt1gVq4YtGQ0YXqjzDD49qLjWp/t3YAgLgjYp7lZkIEtxxWzvRZMkgEbt4sOeSHz5oORfk4AQCCQU/z8iOsEMvmtn+lyvVH33Z1SXsWsBB1OtI7/8q62SCMQyV6LWEKSjV1/tMIZx7jlFS6JTb3XY0h7gwhFELRW2FXo7+3Fbeqs/9d/A5S+OiwGNqEEwNIpA03Bn2KoPAWBFAxkPx2jNs4hYsDDzjgdoIlXK0uUJeg5Kzzwfzo3i7Q9td1FK2U9JveLIuazlS/zMWqAnPmh83KfmZ2HfZYsoNDl4EIEjWAm7Q7LZsdqWttdJxNEr2IVVKla5t+ZjapxoDzAmXgHaMe+3OXvqO+pRqqiiO7VSwvV+u1Ub6qRPuY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2616005)(31696002)(5660300002)(6512007)(31686004)(2906002)(83380400001)(44832011)(36756003)(7416002)(8936002)(6666004)(33964004)(66556008)(4326008)(66476007)(26005)(186003)(8676002)(38100700002)(66946007)(53546011)(6506007)(86362001)(316002)(6916009)(6486002)(966005)(508600001)(166002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2NDY3hWd3JqWlhSTzJzZFcvc0JyRnhoVGlhYzFHaVZPcGN0L1pWWWp5KzlT?=
 =?utf-8?B?a2lqRVRRNjZSS3FjT0R3NUtmNDlwd1JMUDUrS01tZ0EwV0RBUmh5ZnRRREMz?=
 =?utf-8?B?VjJBMnord1Q3MXE3OE9zRlZWU3h3UlNEcmxiaU1NM255MnVKa1lJRkRpbXh6?=
 =?utf-8?B?N0dlRDNIN24yNGtxTHhhVHlZaHlMalRSQlE0VnpFOXJRcG1vUkN0VWNSVWpW?=
 =?utf-8?B?d2F5RDA3YjZpVE50MTV3TnJ6UWdXL3VLSUthRXdSTlZNSWxXQWt3dXFEUnZY?=
 =?utf-8?B?M2VXNnZudnAveSt3M2RXdCtMamFmYjBDL2E0VW5CbkNlRnEydFpBSDV1Mkt5?=
 =?utf-8?B?cjdhUlVMNEtpbDBWN3hxbE55L21keWlValZaVmNtbWVsN0RnTEZTM3crNTE2?=
 =?utf-8?B?cWZDUWI2NENDaVJFVytoeWxsZHcwakQrcHlEVi9zSVJTN3RnRG1aNWZwZTRD?=
 =?utf-8?B?U0tiQUhkRzhDNVlwVVROd2JKSm1IN3VLd2lVdFJjMG9kaWxHNVRsSU1JYUlr?=
 =?utf-8?B?R2dDbkxhNUFMVUNkUklXT3BPaDluR1JZclJzdjdpZWd6TFNGU1F2SVZ1NEVF?=
 =?utf-8?B?Q243bnlESWFkQW9YM3pwSlhPcUE1MWpTWkJrQ1RqQ1ptV2YreEhYZk1MWEI1?=
 =?utf-8?B?TXpYd2M1QlB4VkZ0MDY3SlRFazFreEZSMHVHcXdoQ2QwcDlUTFFmWG12Z2V1?=
 =?utf-8?B?M00rZDVVN08vRUxFcitjdS9rM3g4bUpVSmVKU2s0VDU1eFVpd1ZDRGJmOWVM?=
 =?utf-8?B?QW5kZmFROFFtNlRGbFFUcUt2dUFNTkt6VldXR2gwSFRlcUZ2RmZzaTBtWHAv?=
 =?utf-8?B?cnBzbGZjOUR2eTcvRlhGUDFLVVhHMjZLbVdIWk12ZVIvSTk3T0J6SlRSMjc1?=
 =?utf-8?B?bWlQNi9FaG9iRmVFQ2pvcTdJcG5LSUNJdW85REpZcENpSmdtdCtkN3JGNkwx?=
 =?utf-8?B?czFYUENOUld3U3BscG13dTlBby9VMkN5cHdtNzg5TXlxcEJpR3J2bWV1U2lt?=
 =?utf-8?B?T3FGalkyb29FUDJ3Z1I4RlgyYzJPcThyYnYzQnd2aDRiZDd5T0ttYVFXYmNQ?=
 =?utf-8?B?ZjdoQU5TMWxaVzhGYVptaGJrekxvWTVlTFZjQUw4WjVNWE5TWEpXRHZKYlhs?=
 =?utf-8?B?ZkdVWnI3Vks3QmNCbWdCSGM4R0RSTTdQZjlIeHJhY2l3UkphQ20xNkN5dnRF?=
 =?utf-8?B?ZkVnczZTRnIrL05rdWNaOTFTeGxOeldZLzcrY0tZZW5UWTd4eXJ6aVNabEIv?=
 =?utf-8?B?VnBjVnBYY3QzQjAwTVg4ZjA3aXZQbE9VZDY4NkErRW00Tk9iYWVFMlRIMzF0?=
 =?utf-8?B?SzRJWllFL09sM1RiNHBoeUpXUTBQRGxPRDJxY1RnSEZtT0xtT1J1LzkyVzdw?=
 =?utf-8?B?Nk90N0RkRmN1OEdydFVKZSs0cVFQQ0t2Y3Eyek1RUGgxeHVxTWNkWFFGYWZV?=
 =?utf-8?B?MXJTOExmYlA2Z3h0U041aXBETzZyQTljVm9SYk9qOGM4ZTlTYS9KNkp2Nzc2?=
 =?utf-8?B?RW5lVmN2bTU5Y2lJSDlqaXM2YUpDdHVlcGU4bG5RN2lLbkNkMmNyT1VHWkdv?=
 =?utf-8?B?a2IzQmRzT20wT3l0TlQ3NWVVNVoxQ0dRdUNjbFJib0ZhVlJRYVNjSGJWZTNr?=
 =?utf-8?B?ZjV3S25MN09ldEowLys1RFlRWXMvS1p5QmFSWnNIK3ZCNllvUy9LbnBKZStB?=
 =?utf-8?B?WVFhaENheHI0ZVVjNUk3UzZzbE50eWFxZmVoM1ZnRGVyKzdwMHdUTzdpcVRJ?=
 =?utf-8?B?bk53TCtwbFlHQ0tWTmkxVHF0dDNHMlNOMUE2MHZ2L0ZsUW1yQ2sveGZmTlpH?=
 =?utf-8?B?WXpnL3FvUTRqQjdxZllKQlZGQUpRWDB2WFVYOEVrazlnSG1vUlJKaDM5K1NQ?=
 =?utf-8?B?cE1VaWV3RVpIcVpQMUp1WTgrMWxUQzFPYTRXVVRYNmdlR1FVVmRpMHRjQW1I?=
 =?utf-8?B?K254TDFoUlRFTXpCUisxQkU2VkxhYVN3R2RKUk1NTUNQYk1CUE4zT0c0T0Rr?=
 =?utf-8?B?L3dBQWZ5Vll3PT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18ac8a41-eae9-4400-3e08-08da05cc879e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 15:08:43.6559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l4oceRoJc5YyMG6oXVzPOOu4l1xUW86hb7bLCzGRpI7lP9py8Fgv+72XSTC3qDTjhx47IObbp8+gN7FaXB5TLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5147
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10285
 signatures=693139
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203140096
X-Proofpoint-GUID: AQILgLo82ME37D8DOOHI857A4a6lnJ_i
X-Proofpoint-ORIG-GUID: AQILgLo82ME37D8DOOHI857A4a6lnJ_i
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: david@redhat.com, qemu_oss@crudebyte.com, qemu-devel@nongnu.org,
 kraxel@redhat.com, si-wei.liu@oracle.com, joao.m.martins@oracle.com,
 eblake@redhat.com, qemu-block@nongnu.org, armbru@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------UzXr6BnaEIRjfvcNZqYX5K2x
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

My apologies for not notifying earlier but I have been looking into these errors.
Hopefully should be able to get a fix sent out within the week.

Thanks

Jonah

On 3/7/22 17:46, Michael S. Tsirkin wrote:
> On Mon, Mar 07, 2022 at 08:08:33AM -0500, Jonah Palmer wrote:
>> This series introduces new QMP/HMP commands to dump the status of a
>> virtio device at different levels.
>
> Fails to build on the build-system-centos job:
>
> libqemu-ppc64-softmmu.fa.p/hw_virtio_virtio.c.o: In function
> `qmp_decode_features':
> /builds/qemu-project/qemu/build/../hw/virtio/virtio.c:4155: undefined
> reference to `gpu_map'
> /builds/qemu-project/qemu/build/../hw/virtio/virtio.c:4155: undefined
> reference to `gpu_map'
> collect2: error: ld returned 1 exit status
>
> https://urldefense.com/v3/__https://gitlab.com/qemu-project/qemu/-/jobs/2172339948__;!!ACWV5N9M2RV99hQ!ZPeXmrNXRd6OoQ9bNTk4ZQc7M6z034ydisUDv08HJw6UfvaH4RJLGTDYM-LvRcOTaQ$  
>
>
> Also fails on cross-win64-system:
>
> https://urldefense.com/v3/__https://gitlab.com/qemu-project/qemu/-/jobs/2172339938__;!!ACWV5N9M2RV99hQ!ZPeXmrNXRd6OoQ9bNTk4ZQc7M6z034ydisUDv08HJw6UfvaH4RJLGTDYM-J3npED0A$  
>
> ../hw/virtio/virtio.c: In function 'qmp_x_query_virtio_vhost_queue_status':
> ../hw/virtio/virtio.c:4358:30: error: cast from pointer to integer of
> different size [-Werror=pointer-to-int-cast]
> 4358 | status->desc = (uint64_t)(unsigned long)hdev->vqs[queue].desc;
> | ^
> ../hw/virtio/virtio.c:4359:31: error: cast from pointer to integer of
> different size [-Werror=pointer-to-int-cast]
> 4359 | status->avail = (uint64_t)(unsigned long)hdev->vqs[queue].avail;
> | ^
> ../hw/virtio/virtio.c:4360:30: error: cast from pointer to integer of
> different size [-Werror=pointer-to-int-cast]
> 4360 | status->used = (uint64_t)(unsigned long)hdev->vqs[queue].used;
> | ^
> cc1: all warnings being treated as errors
>
> Reported-by: PMM
>
--------------UzXr6BnaEIRjfvcNZqYX5K2x
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <pre>My apologies for not notifying earlier but I have been looking into these errors.
Hopefully should be able to get a fix sent out within the week.

Thanks

Jonah
</pre>
    <div class="moz-cite-prefix">On 3/7/22 17:46, Michael S. Tsirkin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20220307174606-mutt-send-email-mst@kernel.org">
      <pre class="moz-quote-pre" wrap="">On Mon, Mar 07, 2022 at 08:08:33AM -0500, Jonah Palmer wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">This series introduces new QMP/HMP commands to dump the status of a
virtio device at different levels.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">

Fails to build on the build-system-centos job:

libqemu-ppc64-softmmu.fa.p/hw_virtio_virtio.c.o: In function
`qmp_decode_features':
/builds/qemu-project/qemu/build/../hw/virtio/virtio.c:4155: undefined
reference to `gpu_map'
/builds/qemu-project/qemu/build/../hw/virtio/virtio.c:4155: undefined
reference to `gpu_map'
collect2: error: ld returned 1 exit status

<a class="moz-txt-link-freetext" href="https://urldefense.com/v3/__https://gitlab.com/qemu-project/qemu/-/jobs/2172339948__;!!ACWV5N9M2RV99hQ!ZPeXmrNXRd6OoQ9bNTk4ZQc7M6z034ydisUDv08HJw6UfvaH4RJLGTDYM-LvRcOTaQ$">https://urldefense.com/v3/__https://gitlab.com/qemu-project/qemu/-/jobs/2172339948__;!!ACWV5N9M2RV99hQ!ZPeXmrNXRd6OoQ9bNTk4ZQc7M6z034ydisUDv08HJw6UfvaH4RJLGTDYM-LvRcOTaQ$</a> 


Also fails on cross-win64-system:

<a class="moz-txt-link-freetext" href="https://urldefense.com/v3/__https://gitlab.com/qemu-project/qemu/-/jobs/2172339938__;!!ACWV5N9M2RV99hQ!ZPeXmrNXRd6OoQ9bNTk4ZQc7M6z034ydisUDv08HJw6UfvaH4RJLGTDYM-J3npED0A$">https://urldefense.com/v3/__https://gitlab.com/qemu-project/qemu/-/jobs/2172339938__;!!ACWV5N9M2RV99hQ!ZPeXmrNXRd6OoQ9bNTk4ZQc7M6z034ydisUDv08HJw6UfvaH4RJLGTDYM-J3npED0A$</a> 

../hw/virtio/virtio.c: In function 'qmp_x_query_virtio_vhost_queue_status':
../hw/virtio/virtio.c:4358:30: error: cast from pointer to integer of
different size [-Werror=pointer-to-int-cast]
4358 | status-&gt;desc = (uint64_t)(unsigned long)hdev-&gt;vqs[queue].desc;
| ^
../hw/virtio/virtio.c:4359:31: error: cast from pointer to integer of
different size [-Werror=pointer-to-int-cast]
4359 | status-&gt;avail = (uint64_t)(unsigned long)hdev-&gt;vqs[queue].avail;
| ^
../hw/virtio/virtio.c:4360:30: error: cast from pointer to integer of
different size [-Werror=pointer-to-int-cast]
4360 | status-&gt;used = (uint64_t)(unsigned long)hdev-&gt;vqs[queue].used;
| ^
cc1: all warnings being treated as errors

Reported-by: PMM

</pre>
    </blockquote>
  </body>
</html>

--------------UzXr6BnaEIRjfvcNZqYX5K2x--

