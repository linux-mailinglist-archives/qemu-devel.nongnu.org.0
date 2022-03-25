Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8844E7A63
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 20:22:41 +0100 (CET)
Received: from localhost ([::1]:51476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXpWC-0001w6-7N
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 15:22:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nXpTp-0007O5-0f
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:20:13 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:59880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nXpTm-00034F-1J
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:20:12 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22PHvbas000392; 
 Fri, 25 Mar 2022 19:19:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=TTytcwBs3sC/ZBTlu4Wy3DNcmkSqW1CaZzbotzrSEgI=;
 b=c2Ygh/uFQqXU9DtDcOG4riAjf8OCwDknPhtukSgbC/WG8pbeooAcR25KjvdBimvxjO+Y
 rCBrZ0HqWYegeCplr5bryeoDb1bcfpG/guOSgwISzPfybgXmyN4uvIyebKL1Ixz5z4i0
 IDTdgUQvumw168ZA0GzyYX+LqTcg3Rd9iskNCYcBB5gDk9jbpltrNQp7RNfMGqyKLhjL
 7duHDbJCOurxWIKqfdmR+4M97DEod0QTm8kYMKDsxuBz0LFV5UJSE/ZcYvPLqmpH08dj
 Q1fV3efQmrtUMEcRT6Jr8XYry/9+WrPIG56O62DkznrHub7uI/SJPXU/fBKrKMQaPdT/ +w== 
Received: from aserp3030.oracle.com ([141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ew72aqnq9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 19:19:58 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22PJGXYH013970;
 Fri, 25 Mar 2022 19:19:57 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2047.outbound.protection.outlook.com [104.47.56.47])
 by aserp3030.oracle.com with ESMTP id 3ew5793v07-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 19:19:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zyhbem4Vd3DAocrM3tMfSSWn3BL+4K29r87H4qR9lKP7aSTQnqAUyvrgeGkkfYVp+h0BlL0kRap3C5bUS5Y5+/LTA7rGYmML64l01JRfAzHNVK4ERa+sSRZ1aPsNuJPuCaqoaersAyMcJWQABVByTdNtfZmU4s8fdlchHgq+1qFdgDqOXkAEWDY390I2kumFRuchAmPU6K2RyO/prr7JCwpYZ8j9r4+rnobUZtRCaGvRg0jUL6zxY2nyrbd9pThcOd0htoqdYwZZg1kc1iptyiqwCGwg3mPz+cypdBnsgaElP9TN+4K0eq8A4eHC2IrLeL0SRCvQ6WgFL29zIxAbeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TTytcwBs3sC/ZBTlu4Wy3DNcmkSqW1CaZzbotzrSEgI=;
 b=S1YKyy3Xt/V8B+C9o4BLzZqjpzVcideulPVB0PA0QPv5WNlEwfEjgHU3Hg2B3Gz+Q/wye3hzhxFt+h3jp0T2DMLwo9tFQXvPCOkD+9qMR9ubQHtflGHz8Q1syivMeiHdZV2wYqT9iGkNuMz2TVliw+lGKti6w98Qjn94MeB3buRyz7DTEC8JpWe33Da/6eN3UksLSxsmBKw8jJLHTePE/RB60AHJGtNovnwXKPHKi4X84M4ZS5VekQh7QrYonHob5BDt+VXwKppQpcgHZVnoaiCBTvZNBuPdWkNipbpJWZPAmsoS9FD/UUjkvIe6XyFAW1Y5JQxROSd+9vXmpDuOyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTytcwBs3sC/ZBTlu4Wy3DNcmkSqW1CaZzbotzrSEgI=;
 b=BMNN6YW2FMfJKF1wb7KXdvoO+9T0N5Jq9fzOqECVUS9qoZuZwgmAlIkPWnwKGBdSlCd9swqep8KDbcOgsMyaHnW7luWbvAfJLSYGDsyrLituCZmyfKme1qVdJ/4Qn7552h5xqLjHhZItIWT2QrvPDdSgbOOXLmaJ1bfLBqzTUjg=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BN0PR10MB5206.namprd10.prod.outlook.com (2603:10b6:408:127::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Fri, 25 Mar
 2022 19:19:54 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a%5]) with mapi id 15.20.5102.019; Fri, 25 Mar 2022
 19:19:54 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 01/17] tests/avocado: Specify target VM argument to helper
 routines
Date: Fri, 25 Mar 2022 15:19:30 -0400
Message-Id: <a6b55b5a56150811c56ead83478ba0e4bf5c6dbd.1648234157.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1648234157.git.jag.raman@oracle.com>
References: <cover.1648234157.git.jag.raman@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN6PR2101CA0024.namprd21.prod.outlook.com
 (2603:10b6:805:106::34) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2002a54a-3859-4613-3789-08da0e94710b
X-MS-TrafficTypeDiagnostic: BN0PR10MB5206:EE_
X-Microsoft-Antispam-PRVS: <BN0PR10MB5206575F2C3E0AE7377828B4901A9@BN0PR10MB5206.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RvABJIHhK37wWXrIMQJD4mscrABqdVEsSZvvISKIDYe1xAcYjljB2J2N/C3zZWHivuben4dhWHkFE17UDKAov8b3OjgmhvEpJOgbvMNRGl+dGsfXsWd9oc88ReYTKXC3mFs7GpZB5ieDywVBZqP11cdcJWvJMrD5b+qkaaCB7Q7s2H4siE+NmwAwfxZtHVvq/bABxjq+3skWQ4bA5264GSCvsemXmdj2r96KlTNBmQUYyVV28GhOtQk1BKI91qM6p/s4sNGzCTrQw7+d3dvqiiux9gluPg2QCQh3KdxY8H4rpECMjrnsrgjUJg8tAaYu1YXu0ryzHegIp/gjjKGykwmXduwZnTMd0OcZLC5hw8WQzqrLGApcGrj5MU1tEBQraHL3hcb6veZfu5idhJPcYRtOueNQO5n7u2bp8SaU7eC65sYF4ZvMKeapzsUdGmMnzvKRdH0c7RRzY1Var6AscVmh3zWWHza6yk4czyvN2jZa2VOXwE0aSiI9UaTVX2Wxc58vwll4suPUhUmL68ZdYerUM9HKetv4kXaq9fB8b5z336wEg5gh0kbpeZ0qCOhnt4cQPSB1RKojT/hjE9tE3ke9b1gdxXz9liPEDdE1W34yTyC8r6q31gWzQVVW2NWiKnlq+apP0h2oQfuNv7I+GoKXTf4EerPz6k9STQqiBrXnaNRCmZOu6NCnJ0PkwctYDS68EKeGi4bU1WtxeQvwSQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(107886003)(316002)(2616005)(26005)(83380400001)(6486002)(36756003)(6666004)(6512007)(6506007)(52116002)(66946007)(2906002)(86362001)(508600001)(38100700002)(38350700002)(6916009)(66476007)(8936002)(7416002)(5660300002)(66556008)(8676002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rm5PWVd5U0wxQUlNZlNOTGZNMytJbmVwODVHOXQramhoV1UzSWVOSmovbTVF?=
 =?utf-8?B?eGNZZndBWi9kTXRQSGRRNC80T2dGb2liZllJSTFqL1ltOURYREQ2b3ZOVS82?=
 =?utf-8?B?TnRHcDN0UXowRkhOSVNRempTVVE5S2VQbzhRR2pQSDhlNGtFM2tPTlFiUWVR?=
 =?utf-8?B?Nlo3Slowd2EyQXhPRmlLQ3g5UnN4RUs0NktIc3NzZkRNeVBFQ25QbmJSYlZ5?=
 =?utf-8?B?elpoblh4b043VkIreUFGT2dnTkx3S2lVYVdhekV5Z1ozYU1VM0d2WU1LUitx?=
 =?utf-8?B?OGE3NmtPQm40dkQwZkRRTG9Fd3h2OU5iYjRRUjFNekZtZDZsZ2ZaMVJlcXRI?=
 =?utf-8?B?UDJuOExYcmRmKzU5bmxpeVdkTXdpbGJqOXM5Yjc1R3NOM3BkYXlORVBQallD?=
 =?utf-8?B?Zm96WHNxU0QvTVFwM0ZMT1huVDFUTVJ1UnBoNzdFb3dtK3l4aTZBZldNRm5j?=
 =?utf-8?B?WW8xcDdCa0tNVVVSdmd5cXRTRlBhNHdKKzdVMW5lR2o4bkVKNWVkZHhleDRP?=
 =?utf-8?B?TkdPYkpiVmFxNEdzMGRKVXpWWEVlQ2tzOUdYU1lyWGVYaWF2dmJwQjBhQ3lK?=
 =?utf-8?B?R0hFTmlZNmdOTnNxR1JXMi9KeFRvNjB2dnRpM1RKa081WmtNc3dOSkhScFg0?=
 =?utf-8?B?emtIUFJsQ2FxY25RV0Y3SmpGOEdvaE1tejFuL0kvS1YrY1NLT1RoNW54WUxU?=
 =?utf-8?B?MFJLK1VwZVJXazVXUnlPZllySVdTbXpVYkh3M0wwOUliUWFMQktGaHNNcFVm?=
 =?utf-8?B?SGg3b1MxZnh2VGU3NmFIYTBlS2g2S0ZnVXZtNFd2ckw3UmU5OElNTFZ3SmhT?=
 =?utf-8?B?LzBsdEovTE5Xc1poV2l2b2JxNHVicG5zRmc4ZE9YWU1XRXVGSHRFNjVWd2x1?=
 =?utf-8?B?a0F3ZFBYL2dKZldRY3dlS3g3M2ZuMGN4RVB3U1p6dEh2U3B5Y2xTSjl3NEZs?=
 =?utf-8?B?amZkeE90SkhFcGVHUjhha1RlK2RGL2ZZS1A4SjBUd2s4cVVOZUxqQVVUSEZr?=
 =?utf-8?B?MGtOQitZMzlKaHNHdkJpV0doRmhQbmNTenBJRUJKcCttWWlSUDVaNWxDSEh1?=
 =?utf-8?B?SkVhY1cvMmdJSUVRRkxzMngzdngzaGI5aUtOWTBoQk1FRENYcUtZNVRRa2Nn?=
 =?utf-8?B?NWQ2Q1JXZzdHS21tR3hWSkg5TTJRV3Exc0hBc1lKZytkSWtwMUNPVDB0Q21K?=
 =?utf-8?B?ZThoTFhxNEdta3J4OGxwL0laZk50clVlN2xYcXptL0FET2ZnZGpYMTQ4VnRE?=
 =?utf-8?B?WFk5cTA2bTE0UE1wRjZlc2lSZVJPY20xU2htYlRPbUFtNWFvY2JmK0JUYmhU?=
 =?utf-8?B?dS9PbjIrbC81NnpHWitQSFVROWN2cTBqd2NkdmY4UWN5cEZldW5oTEp2MW5R?=
 =?utf-8?B?M3FtUld0NHZ6THpKeVkxeFlQRU00bUg2d0FXNGRtS0pDSDVzMW9yTzFjUVRS?=
 =?utf-8?B?eVFpc3BIZzk5Wm9vczh5alRLNDdYOUgxQUZUK0VyQitXaTRvZ3RVdHNBSlds?=
 =?utf-8?B?clJJT1BYNUtHRHoyWGhQREFWSlhNUGVXa0YzRDV3UkJVNFJyQzY2WFhHalp4?=
 =?utf-8?B?V04xcXI0VnRPNTd3TFpFdVcveGFoRjZvTHJPcVM1T083VW5KaWxGbDkxYlVm?=
 =?utf-8?B?bC9IQ2NuWTZLZVFxcmFwRFFGQXg3TXg0SlNpMHlaOFRDT1VmU2dNZkZCRkN1?=
 =?utf-8?B?Vk4rTDVQbnFsbVhRVytwMDQxUVBnYUM2YmMzSmwrbzJxRXdxWUxwNUZtRHpa?=
 =?utf-8?B?ODBxZEUvSGkzV2ZPZ1FrRkR6cWJ2eWJxdHArU2NQUnBQWGRGVTVqdHpGVmty?=
 =?utf-8?B?RU44QXhmWmRWeGdyTFFremNScWpra09sS3FkT2pCN2xZdGRoVUNWSVpTUDFB?=
 =?utf-8?B?L2k3UEhYZ1VmSzlsYmp6cFl4U3Z3V0JOZFAxa0NtVmw1aytzQUJmU2Irck5v?=
 =?utf-8?B?eXFuV25kUG81bWhodzNWVE1SbWM1em5IMmxyeG9ESW5nZGpuVFlqYlluNzJQ?=
 =?utf-8?B?ZEdrNytPYWtvNEt1SFppenByODhHOXBJOHdyZG5NaExjYys5ZmVieDRoRFhm?=
 =?utf-8?B?TUhBRUk1eENTRmVSdTA1cysvbittTU5meEpjWk9pL2lRelNnWnZUaWtXYnlN?=
 =?utf-8?B?cjRudXdaMjJmR1NOZHczazIrWXA0Uk9uWUxSdHliTC9VcFY2bVQ4Um1ZUjNY?=
 =?utf-8?B?bktxUFBBcTRXZUR6UGdLU243cWFyQ2lmZTQvRDlIN1dZbnpBY0htenAyRkh2?=
 =?utf-8?B?blBxdE5idjkrRlhraldVdGQ4MEhVcUhzdUxsbTFCdVBPNzZTdE1DWE10WEx6?=
 =?utf-8?B?Ym1Oanlmb2tzeUwxbXg3clBJci81S2tCNjhEdHRuZ3ZCeFRnMmNIUT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2002a54a-3859-4613-3789-08da0e94710b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 19:19:54.2730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oo9F2Q63oiqUjH1t4kKmwgF/FUSTLul/XrpDWp04v7GNH0aT2dRk+m2XGFJOKL7DxDGyb6Z915DLbicExJ+CaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5206
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10297
 signatures=694973
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203250106
X-Proofpoint-GUID: _VOsBa3yrETLEEhkXjA50WcKvCKQPyu2
X-Proofpoint-ORIG-GUID: _VOsBa3yrETLEEhkXjA50WcKvCKQPyu2
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org,
 alex.williamson@redhat.com, kanth.ghatraju@oracle.com, stefanha@redhat.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, jag.raman@oracle.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Specify target VM for exec_command and
exec_command_and_wait_for_pattern routines

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/avocado/avocado_qemu/__init__.py | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index ac85e36a4d..18a34a798c 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -198,7 +198,7 @@ def wait_for_console_pattern(test, success_message, failure_message=None,
     """
     _console_interaction(test, success_message, failure_message, None, vm=vm)
 
-def exec_command(test, command):
+def exec_command(test, command, vm=None):
     """
     Send a command to a console (appending CRLF characters), while logging
     the content.
@@ -207,11 +207,14 @@ def exec_command(test, command):
     :type test: :class:`avocado_qemu.QemuSystemTest`
     :param command: the command to send
     :type command: str
+    :param vm: target vm
+    :type vm: :class:`qemu.machine.QEMUMachine`
     """
-    _console_interaction(test, None, None, command + '\r')
+    _console_interaction(test, None, None, command + '\r', vm=vm)
 
 def exec_command_and_wait_for_pattern(test, command,
-                                      success_message, failure_message=None):
+                                      success_message, failure_message=None,
+                                      vm=None):
     """
     Send a command to a console (appending CRLF characters), then wait
     for success_message to appear on the console, while logging the.
@@ -223,8 +226,11 @@ def exec_command_and_wait_for_pattern(test, command,
     :param command: the command to send
     :param success_message: if this message appears, test succeeds
     :param failure_message: if this message appears, test fails
+    :param vm: target vm
+    :type vm: :class:`qemu.machine.QEMUMachine`
     """
-    _console_interaction(test, success_message, failure_message, command + '\r')
+    _console_interaction(test, success_message, failure_message, command + '\r',
+                         vm=vm)
 
 class QemuBaseTest(avocado.Test):
     def _get_unique_tag_val(self, tag_name):
-- 
2.20.1


