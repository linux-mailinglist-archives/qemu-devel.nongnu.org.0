Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B2D549F7E
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 22:37:31 +0200 (CEST)
Received: from localhost ([::1]:56788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0qoU-0004SC-5K
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 16:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1o0qfO-0008JC-UE
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 16:28:07 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:31760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1o0qfM-0001sk-Vo
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 16:28:06 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25DJdaXt017692;
 Mon, 13 Jun 2022 20:28:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=M0mOea4gCbBlM8Fj9z9DGIpjVUGGhsKIIdnvxnapc4A=;
 b=0EyzOmeu2hy/2ts3KRm9GQb0NWLj6HOII9eZsMARTLcnhZZrHxCPfCsdZqyG43gwp/yz
 V2ODF3HtcRT3WV4+arUSgXQcyvn/BYzNxUAfTa+rgFtL7AJsCsHEdcuuxtD0dwuNwEop
 Zz4r5Y9gUe0htzuHEXiNhwunLJBTxZgdcro56/skxH3vNDndzoDUi2yVmwTPCXFXTmbE
 rFNQ4Mlun/uIgw9qhbvJpDUsz03Q22Hxf1pKzmgosbkaTzsEVdcIYcutqeWV4DpjCTYF
 EeP8T4zCmj7aPzuo0+h4XRB9Tw4bkkH+YMjPgUinV8uHhPM1/zDwZLMJnuoZhw8D5yPg TA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhfcm3du-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 20:28:02 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25DKG5SR007030; Mon, 13 Jun 2022 20:28:01 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gpc4d09aj-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 20:28:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OVmnOFcbdWJldUyevnQcpQ7eOpL6xY8IAEz84wASpax3otG+2Lgr5DVy1BuxjR7CyHMGuwVqTu1bT/Y6NdwPpniL5vkf56hMUQAV1buyIi6eNidIA/iOP+FmoMrGMcu/vmzrynW3kmNd3I8T2d2jo8MtJIeGeTK7Sm2wdMNZ6i+v5QJGkAU3T3lhAEMDXcBGX067k/Nk1PpVNGgPSxWTXRjdCX6rgjDK4XPhTNe7Ix5L5/d7x1xUxhGQgrWdAse2Li9e+XVfkopatFqlDr6TMwATSrTq2j/XA/duZczoLUXHQ+zrfXQkNkVO45/dc9gJAytcxKGW7h3i/N2LDRYg1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M0mOea4gCbBlM8Fj9z9DGIpjVUGGhsKIIdnvxnapc4A=;
 b=hhRq3HtdpX83Tf+9yBOByzzVCcop0zGbuS2ffst3UWar9pC7xfZ/rFE9JXLKVXgvJ7RD021wSmbJRQgCljvnreq8ZUhJiBTOdh+wlHzElfdWGNPlFTMUoE9377XPA2jQcq4qIGF2KBfWPaWukWkbvROfoBaJwFk1W5f+pVWjS5Fwn6/ku4EjW9Z4qs9nEOQhjCOz+U95INf1efTzFShLFPH9KFgnNKgXhOw/84VAgq03FX8pDDbbpLRKO2L2qZ2q2fMkx+EEWLAFAHjsj0gLrWHRxZy/bptwnKsMmbiiUGaWYiAAW979ijVzCchG2motzbjIdV/C8GC6I3+lCFsDjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0mOea4gCbBlM8Fj9z9DGIpjVUGGhsKIIdnvxnapc4A=;
 b=EngZOuVtwe8ugYxTrxU+7gKUSt8qnh06WkXIQE50/obuxXSiC74/Lmi97sta8accDflvhHzcJ0hN2y73nDMFcL3CjZnoUI1KKwwfVt9DZPiopUBsMPtNenga4u6lXDuRpjWfX8StwuDN+yzJ4VTnySoRMohnCte9fC6ymgqps3w=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MWHPR10MB2045.namprd10.prod.outlook.com (2603:10b6:300:109::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.16; Mon, 13 Jun
 2022 20:27:38 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 20:27:38 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, alex.williamson@redhat.com,
 f4bug@amsat.org, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, bleal@redhat.com, berrange@redhat.com,
 peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v12 10/14] vfio-user: IOMMU support for remote device
Date: Mon, 13 Jun 2022 16:26:30 -0400
Message-Id: <afe0b0a97582cdad42b5b25636a29c523265a10a.1655151679.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1655151679.git.jag.raman@oracle.com>
References: <cover.1655151679.git.jag.raman@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0018.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::23) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e9c27bc-7e2f-4315-51aa-08da4d7b283b
X-MS-TrafficTypeDiagnostic: MWHPR10MB2045:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB204566E1B98EDDAC808851F390AB9@MWHPR10MB2045.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0RMm9z8qFseqRGsvZoIn9uoD26GZ9Lz1yW+NiwJuEJA+DvbSNOM/QKEvUplDwMhGPNp9OTCQNWBCsSyvXz4jn2SctmrgUoy4z6kUvqpq6n7JGcZ2SPqRIQlrMq1r7XSA4OlMjrqLHbo70TEZefBk3dbsX/j+QUd93zl6DfbFcIQVvI9y0zhOJxIbjYAxc6cYAV7kLzly0X2gkZV5RUyCZHT+kMLPPUZ7sIMrMzil4ZDBaWME2xGc8wVo9nkuOSg7UEoPIQwIB0Wz3Qn36RTrYGS6+Ed/w+3z8c+m8GHCQ70Sv4wYxYWn85x6eq0sfKObSLnbd3t8YjuaZS1MC1enjbJaxurHA1+bP/6hts30ze2a2UIIWtqVNEcQyTGDNLoaEpmb4yanuvEpBmpK9fQlnDlHa8HMBY5c341foFvtWTTHp+5bioEOQYq8wBuOqiiXCxLrJFCqjAogB2LcyxGq7i0Y/+5YMc9Kmg6Gp338llYcbSQOvdDRXi7XYR5Wr4QPpG/0+frqR1i5uLsm9B2HuYDryJgkhhAHjfzRhxUib1nyBqwcwVohEceo8EopPYUhBb5tD4Pdj2fBrSv8vEv/cmdqNIkndmOLszdMK5UftjEJMI3XIzyIIjkSeOZSzOPvmfA2NBcxRpK1/I+AGSBIV+rOI1QsLiuJWamqXRkdcKRZm84DW/zFZiunrKMSGGFAYpWe4r90lVcEFjEpncCUcg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(5660300002)(7416002)(508600001)(8936002)(6486002)(66946007)(66556008)(66476007)(26005)(6512007)(2906002)(2616005)(86362001)(6666004)(83380400001)(186003)(6506007)(52116002)(107886003)(38100700002)(36756003)(6916009)(38350700002)(316002)(4326008)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUVZV0g4Z3RmZjE0VWwrekJvN2NaVEpwVXFiVVNqcHlCeWdMRGFtNS9JS1E4?=
 =?utf-8?B?ZllYcUxwTmdkUkkyY3ZhUjJNVWtERUh3YTJiM3k1NTE4SG14RTc2TStjb3Vz?=
 =?utf-8?B?MUV4aVZMTHIyZmRlRGdGYStKSENSMTZjd3U3VWRSbnZCSnRuZUJoUVBDcElP?=
 =?utf-8?B?RVJHeXJEc1RPSkdjS1B4M3NpemJTVkxCZE5EaG5NZ1p2dWJhSjZ2VmxqR2Zj?=
 =?utf-8?B?L2dzbG5iVzU0YVpwZGk5M2draTVWMGpGYzgraUxKNWJQbGp0Q2pWYytKQUVU?=
 =?utf-8?B?TVdyVVhrYmM2TG1IMk1ncldhdDRCaTUybi9IOXJsd1o5aDluSnBaQ3dKSWJX?=
 =?utf-8?B?cjc1QzBCZkhyZ1duWGIwS2t1d2dPUmxvNVpzTTVUSGNydjJYNkVrNDhaMzMv?=
 =?utf-8?B?QW9wMDVxdE5yTWxJS1BMZlF3bktBYjB0R21EYW1hNEdkL0tDM1R4UDZEZXFH?=
 =?utf-8?B?RnRWMnU4Q3FHUkxZZzlQOUdlTldlQ2czWmhjQjRzS05nRkFramd3RndmWFVr?=
 =?utf-8?B?WUdBTnUrTEZzbjRma1dPSTlxWkhVWVovS21sMlQzckdmVG5SeWFIcDBsbW5V?=
 =?utf-8?B?ZWJsK24xenNMblFwbHlLZmIzUm5mQ1JQZ1FIckE0TGpsaGNxMDR6TjM0K2kx?=
 =?utf-8?B?OFM5U0gvSG9YbFBweFVmRCsveE1QUGVhUEtXcnpFdmJlaDBRZk5LdTlqeDVM?=
 =?utf-8?B?R2taZTMxZ2FyK3I2b2w0MVlYemJ6UlhnZDkrTHNta1B2N3piVzNUdlBzRmli?=
 =?utf-8?B?dUxnano1ZnRxV0ZiczRreHoxeGI1TVVRaTMzL0JqeEExRzdhbzhDcGxNWC83?=
 =?utf-8?B?SG5UaUFldHFQaUZvNzExSm1aZDFzTkljOHF6MlI2dmdhcUllbDY2Sll1TDR3?=
 =?utf-8?B?cFI4WlpadWVHYlkrUEhDVjJmMnNwenZBRzZ5R1Bva05NYWVTQlJhbW4xRXox?=
 =?utf-8?B?eGRwakZ6R2lsMlVQNVpyRitHOVBJUnAydHNuNTlZQU83bThvU2lLOHFKSm9Y?=
 =?utf-8?B?NE5GWXp5UkVqQ3ZGaXpRYy9maFV1VWI5WUhtRU9TbUtIRXNaWDVYS1lYcys3?=
 =?utf-8?B?dTJBUlR4bVRmRmNvQ2luRTlVcXV6RjhYNURHYVNHakJWS1BmZDBTOWVjbkc2?=
 =?utf-8?B?TGxKWlQ3VFl0NmlUeWFnS2hsb1Nad2c1ZFRQOWhHakxUTjluS2RWOUZsUC9G?=
 =?utf-8?B?QWRLWWYwa1FvcEpSRmsyamw5eFI1WVFqdjVaakJUMmtGY21PNThXSGFpZ0F0?=
 =?utf-8?B?QVNndVcrRTlHTERNeVdVNllNSk05VzNyS2YydTROaWVpYWRCZFZVQ2E5Tm10?=
 =?utf-8?B?OFppeVJsbjc5VDJIOWtpWUlmcjdxd2kxVmtiSFdCVk1NSUIwS1B0NVNxbTJB?=
 =?utf-8?B?b2xvT25VWEkvbzgxTlI2TEZkQmdPMjIvenFaUEEweitKQkkzaTZZQ2t2dllw?=
 =?utf-8?B?cEkxaUVNOWVzQnBUMnRETm95eHo1NitQd1EyV3hsZ2l4TndZOCtjQ2NLVWNt?=
 =?utf-8?B?YWhDa01tMkFRUkdpYm5pWjJvTDMwOTJ6aEpmRytjcW9Vc3lDT2pZL2wzTEdi?=
 =?utf-8?B?M3RpTHpvOVp5TU5WSUlGZ1BHZjg1WDJTS2NYZHVWY3dVWXltOWVEeW04eVMz?=
 =?utf-8?B?b2xhZU1tak5pVDJmNWhMOFErRktLTVdFRncveUtUTlk2aFY3SkkyWDVQdGZz?=
 =?utf-8?B?VHRmMm9ZTEMvaVBOempUYWt1YTl0a2VZNVM4NThoZllPc2RmTWY3NHM2Ym5X?=
 =?utf-8?B?cE9KeEszb29RQUlzMXdlTWdNL0lwd3RoV2pGdmlnTi9YaWdjdDZqdVpKckZw?=
 =?utf-8?B?K2NDYW56bGZ0ZHRMc3IyTFhJSllvK2dHQWtObjRGK0MyVURNL3ZydDFsbi9u?=
 =?utf-8?B?aTFLdVFqTlV6TWxZTk9JNzVnRndJQW5DdEI1Rld5UFFMeXkwRWJlUTYwUHVY?=
 =?utf-8?B?ekJURFE3bGZZTlBmMkxFMmk0aElEdVZMQXlqOXB6MWppa1FBQUNsNXFvZG90?=
 =?utf-8?B?TThoTUhsQmk1NjhyQk1LSFJnU2ZoMFozclQyTWh0c1hCYVlSSElDWWJKTEx0?=
 =?utf-8?B?ZTZtbVpqSXNxMUJJL09tUUMwUEMyeW13RkFtRU5YMEFYbjBtOEkxRHR3enV5?=
 =?utf-8?B?Wlh6Y3BVcmxpRWZDV2tGVDBOaFVlSmw0MGovZkJ5ZStuNXI3RzlBdWNoc2hN?=
 =?utf-8?B?dlgwMFVQSEd2T1hWem4rbHRlWHFEMkhVano5NGN0dHJwUzBVMnpOVXhGNFkx?=
 =?utf-8?B?MFBzcUtkM3dlY2hiWHUvWVhKcVpsRkZNQ0pObkpwTWw3N0MycXhpbGsyUmI2?=
 =?utf-8?B?ZTY1S015MnVnb09UNVNPSmtNWmtBazcwZFFrT0lwOFlEZGZqWmFqdz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e9c27bc-7e2f-4315-51aa-08da4d7b283b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 20:27:38.1388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hmDgMJzCu24FbaEi/1vQh2OYVB5clRyX1UH31TEqbUyhfVQ5faGgITFccgCrIQPaZ70RekI7E9hqW/5hIUbJIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB2045
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-13_08:2022-06-13,
 2022-06-13 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0
 malwarescore=0 spamscore=0 mlxscore=0 adultscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206130082
X-Proofpoint-ORIG-GUID: FIdIi7QeKpCfwi56pENjqnmdsuWKriGX
X-Proofpoint-GUID: FIdIi7QeKpCfwi56pENjqnmdsuWKriGX
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Assign separate address space for each device in the remote processes.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/remote/iommu.h |  40 ++++++++++++
 hw/remote/iommu.c         | 131 ++++++++++++++++++++++++++++++++++++++
 hw/remote/machine.c       |  13 +++-
 MAINTAINERS               |   2 +
 hw/remote/meson.build     |   1 +
 5 files changed, 186 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/remote/iommu.h
 create mode 100644 hw/remote/iommu.c

diff --git a/include/hw/remote/iommu.h b/include/hw/remote/iommu.h
new file mode 100644
index 0000000000..33b68a8f4b
--- /dev/null
+++ b/include/hw/remote/iommu.h
@@ -0,0 +1,40 @@
+/**
+ * Copyright © 2022 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef REMOTE_IOMMU_H
+#define REMOTE_IOMMU_H
+
+#include "hw/pci/pci_bus.h"
+#include "hw/pci/pci.h"
+
+#ifndef INT2VOIDP
+#define INT2VOIDP(i) (void *)(uintptr_t)(i)
+#endif
+
+typedef struct RemoteIommuElem {
+    MemoryRegion *mr;
+
+    AddressSpace as;
+} RemoteIommuElem;
+
+#define TYPE_REMOTE_IOMMU "x-remote-iommu"
+OBJECT_DECLARE_SIMPLE_TYPE(RemoteIommu, REMOTE_IOMMU)
+
+struct RemoteIommu {
+    Object parent;
+
+    GHashTable *elem_by_devfn;
+
+    QemuMutex lock;
+};
+
+void remote_iommu_setup(PCIBus *pci_bus);
+
+void remote_iommu_unplug_dev(PCIDevice *pci_dev);
+
+#endif
diff --git a/hw/remote/iommu.c b/hw/remote/iommu.c
new file mode 100644
index 0000000000..fd723d91f3
--- /dev/null
+++ b/hw/remote/iommu.c
@@ -0,0 +1,131 @@
+/**
+ * IOMMU for remote device
+ *
+ * Copyright © 2022 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+
+#include "hw/remote/iommu.h"
+#include "hw/pci/pci_bus.h"
+#include "hw/pci/pci.h"
+#include "exec/memory.h"
+#include "exec/address-spaces.h"
+#include "trace.h"
+
+/**
+ * IOMMU for TYPE_REMOTE_MACHINE - manages DMA address space isolation
+ *     for remote machine. It is used by TYPE_VFIO_USER_SERVER.
+ *
+ * - Each TYPE_VFIO_USER_SERVER instance handles one PCIDevice on a PCIBus.
+ *   There is one RemoteIommu per PCIBus, so the RemoteIommu tracks multiple
+ *   PCIDevices by maintaining a ->elem_by_devfn mapping.
+ *
+ * - memory_region_init_iommu() is not used because vfio-user MemoryRegions
+ *   will be added to the elem->mr container instead. This is more natural
+ *   than implementing the IOMMUMemoryRegionClass APIs since vfio-user
+ *   provides something that is close to a full-fledged MemoryRegion and
+ *   not like an IOMMU mapping.
+ *
+ * - When a device is hot unplugged, the elem->mr reference is dropped so
+ *   all vfio-user MemoryRegions associated with this vfio-user server are
+ *   destroyed.
+ */
+
+static AddressSpace *remote_iommu_find_add_as(PCIBus *pci_bus,
+                                              void *opaque, int devfn)
+{
+    RemoteIommu *iommu = opaque;
+    RemoteIommuElem *elem = NULL;
+
+    qemu_mutex_lock(&iommu->lock);
+
+    elem = g_hash_table_lookup(iommu->elem_by_devfn, INT2VOIDP(devfn));
+
+    if (!elem) {
+        elem = g_malloc0(sizeof(RemoteIommuElem));
+        g_hash_table_insert(iommu->elem_by_devfn, INT2VOIDP(devfn), elem);
+    }
+
+    if (!elem->mr) {
+        elem->mr = MEMORY_REGION(object_new(TYPE_MEMORY_REGION));
+        memory_region_set_size(elem->mr, UINT64_MAX);
+        address_space_init(&elem->as, elem->mr, NULL);
+    }
+
+    qemu_mutex_unlock(&iommu->lock);
+
+    return &elem->as;
+}
+
+void remote_iommu_unplug_dev(PCIDevice *pci_dev)
+{
+    AddressSpace *as = pci_device_iommu_address_space(pci_dev);
+    RemoteIommuElem *elem = NULL;
+
+    if (as == &address_space_memory) {
+        return;
+    }
+
+    elem = container_of(as, RemoteIommuElem, as);
+
+    address_space_destroy(&elem->as);
+
+    object_unref(elem->mr);
+
+    elem->mr = NULL;
+}
+
+static void remote_iommu_init(Object *obj)
+{
+    RemoteIommu *iommu = REMOTE_IOMMU(obj);
+
+    iommu->elem_by_devfn = g_hash_table_new_full(NULL, NULL, NULL, g_free);
+
+    qemu_mutex_init(&iommu->lock);
+}
+
+static void remote_iommu_finalize(Object *obj)
+{
+    RemoteIommu *iommu = REMOTE_IOMMU(obj);
+
+    qemu_mutex_destroy(&iommu->lock);
+
+    g_hash_table_destroy(iommu->elem_by_devfn);
+
+    iommu->elem_by_devfn = NULL;
+}
+
+void remote_iommu_setup(PCIBus *pci_bus)
+{
+    RemoteIommu *iommu = NULL;
+
+    g_assert(pci_bus);
+
+    iommu = REMOTE_IOMMU(object_new(TYPE_REMOTE_IOMMU));
+
+    pci_setup_iommu(pci_bus, remote_iommu_find_add_as, iommu);
+
+    object_property_add_child(OBJECT(pci_bus), "remote-iommu", OBJECT(iommu));
+
+    object_unref(OBJECT(iommu));
+}
+
+static const TypeInfo remote_iommu_info = {
+    .name = TYPE_REMOTE_IOMMU,
+    .parent = TYPE_OBJECT,
+    .instance_size = sizeof(RemoteIommu),
+    .instance_init = remote_iommu_init,
+    .instance_finalize = remote_iommu_finalize,
+};
+
+static void remote_iommu_register_types(void)
+{
+    type_register_static(&remote_iommu_info);
+}
+
+type_init(remote_iommu_register_types)
diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index 4d008ed721..cbb2add291 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -20,6 +20,7 @@
 #include "qapi/error.h"
 #include "hw/pci/pci_host.h"
 #include "hw/remote/iohub.h"
+#include "hw/remote/iommu.h"
 #include "hw/qdev-core.h"
 
 static void remote_machine_init(MachineState *machine)
@@ -99,6 +100,16 @@ static void remote_machine_instance_init(Object *obj)
     s->auto_shutdown = true;
 }
 
+static void remote_machine_dev_unplug_cb(HotplugHandler *hotplug_dev,
+                                         DeviceState *dev, Error **errp)
+{
+    qdev_unrealize(dev);
+
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        remote_iommu_unplug_dev(PCI_DEVICE(dev));
+    }
+}
+
 static void remote_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -107,7 +118,7 @@ static void remote_machine_class_init(ObjectClass *oc, void *data)
     mc->init = remote_machine_init;
     mc->desc = "Experimental remote machine";
 
-    hc->unplug = qdev_simple_device_unplug_cb;
+    hc->unplug = remote_machine_dev_unplug_cb;
 
     object_class_property_add_bool(oc, "vfio-user",
                                    remote_machine_get_vfio_user,
diff --git a/MAINTAINERS b/MAINTAINERS
index 6bddfe3197..64f6216379 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3634,6 +3634,8 @@ F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
 F: subprojects/libvfio-user
 F: hw/remote/vfio-user-obj.c
+F: hw/remote/iommu.c
+F: include/hw/remote/iommu.h
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index 0eb5a0f375..ab25c04906 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -6,6 +6,7 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iohub.c'))
+remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iommu.c'))
 remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: files('vfio-user-obj.c'))
 
 remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: libvfio_user_dep)
-- 
2.20.1


