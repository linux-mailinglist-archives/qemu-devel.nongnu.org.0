Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0AF51D06C
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 06:59:38 +0200 (CEST)
Received: from localhost ([::1]:36530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmq41-0002Q1-Qz
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 00:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nmpzS-0004sg-HK
 for qemu-devel@nongnu.org; Fri, 06 May 2022 00:54:54 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:54286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nmpzN-0004Qr-34
 for qemu-devel@nongnu.org; Fri, 06 May 2022 00:54:52 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245Nd6p2027626;
 Fri, 6 May 2022 04:54:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2021-07-09;
 bh=5LZoCZInA6l0702vQBI7wOxMX96ypv8DhH8wuiQi7yk=;
 b=OjlP6xyIW0EUCLxXnP0gbtQtml1h8NHQ0wWOvujabXd/jSgZrh17Nhu1or8qcRgnznei
 x8qaiy3qs4KrH1LR01K4FiEKZaUN/SITIONoWhIlQ/tfSZNncXwpb4RZUHkxg+GwsjGZ
 LAsFqEA4Stv8uSDwlU62uERCoa73gsNLFcM1ehAElI5sxtIKKVGx6XifDijiiI95Eaml
 yEBJfjvxTxzfeBlWEXsZMeeZ4YkcaKblT+/rkHMnkTNojhQ49chA4f/OPZTkom/A7v8w
 1920s54unQ8/aonI2FL1WiTGXuhPE6EBmuGe3+2NpY+oo5qvFSU0ADDjAt9VwIRm8EIy MA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fruw2n3mx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 May 2022 04:54:43 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2464oaav006680; Fri, 6 May 2022 04:54:42 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fus8ywve1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 May 2022 04:54:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W70EJrMq8uZufrzH+apMUBAjD1EaGTWlXR7tiOman2Rs6+OD7lTK1+2+jpX7QfShdCI6qbOxeZo3lr0WrNhNrZa1JEvIddZBHxWWlW6dCfRVH1K2kPpsk5PZUYCzrj9nbCjYxHPAD9f2OWhZjtM2lspug0LKgW0GlKvRSQVUAS9X262EsLOdQxJPhjk/taK+alQvJeK3vCrJW2aljsGnLDIaEAszWe+pUBZSP7TrdLzi9zeDVXVJ5F/Y93N8tIdNjVMLWB97z6okd+2ijcFosyqdp4WikOrcrplD1LHsmGLBNg9nk1+Ycyt+0jSLF+D1Qv7Sw7Ay/dadIReX3aKz3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5LZoCZInA6l0702vQBI7wOxMX96ypv8DhH8wuiQi7yk=;
 b=J8oz/Rskk0Ixr76LlzA3vMCC/LRGHwq4js214Hxyx7tuEMuE9U4/UVfS1vDOR+cV0mfVboTflHiHVx9Z/PjPpLXcpHxpDxZJq5WfLGr4RN5cZ3+JRqC6sgh68jnRwYUVCFwpIL987VLd/msEmlrMYRBOgBvvDXAPuR+EgEDTAhDNk8n2agOcvzunJkynPLvb7VTzmVSGNJGaOpN6GT0P0Zg0mmLob5eGjKotXn6Fei2VudVNiXJSCyYDQAQ6rdBW2R41QeUp6OVLA209F2GShPcP3P4fhtYCQxtPyVPN8Eqa5rygJ021Bq3UGn0VxQaSPdmYg10fqyxrw8+N3ViBlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5LZoCZInA6l0702vQBI7wOxMX96ypv8DhH8wuiQi7yk=;
 b=Rt5SyYqevlMUUpe9NFTwKFMkkbBa7SNA2krIaLdJdlW0bp3/a8nsbqpMaUC6iht2596hYlCEPxfW3lemJRiMWWedeikVrqx0opBl782LiYoQPDN2+6MjxVcmzcXfrJ9ePbO743B0UEHR765McJVYRJG0O9jX2KbNvha29o5EgS4=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by CY4PR10MB1416.namprd10.prod.outlook.com (2603:10b6:903:29::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Fri, 6 May
 2022 04:54:39 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30%2]) with mapi id 15.20.5227.018; Fri, 6 May 2022
 04:54:39 +0000
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: qemu-devel@nongnu.org
Cc: jasowang@redhat.com, mst@redhat.com, eperezma@redhat.com,
 sgarzare@redhat.com, eli@mellanox.com, si-wei.liu@oracle.com
Subject: [PATCH v3 0/6] vhost-vdpa multiqueue fixes
Date: Thu,  5 May 2022 21:54:28 -0700
Message-Id: <1651812874-31967-1-git-send-email-si-wei.liu@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0140.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::25) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f32ad2d8-df85-4994-0299-08da2f1c86e8
X-MS-TrafficTypeDiagnostic: CY4PR10MB1416:EE_
X-Microsoft-Antispam-PRVS: <CY4PR10MB141668B7240AB1651B1FB800B1C59@CY4PR10MB1416.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K7Xw9JvzK2UsROC5saMDddBQCbL/bK9nmhNEbksNYIGJDpBWMhyI82Ldk+njM9BP7nQEr/0Yn6MGxfms8tC2fT71JGVhA+yg1QXCWZgkmPTBCC+GcstcwFE7h5dlryS5FlyIbiGWeTC2KOlFzN99Ll/h/Swn0y9bxrMuEND3mnQX9nWvmM6JRRJz06GvZNY2sNWEainBd8z/q+FM8QySq2BW2WBz3CXCDL8hvY+YWrciLBeh0Lrw0Tt9g5vFCHI4ZCidYpCpDe/AxSBoe1RVfHrMJlW4UTKaYiqBi4EqSI0wAjG/6O9nPBhII9NKmJ/cm26Dbyi8/V4XZdM4Q6ol5zDLTLjGAMvE2UQVv52TT0tIjLE3VFhHL13tqYFIOedAL08k/qgbOnO8Ot8IYvs7bZneHpP+FHMGTpwzxdb9SAExUHo7ASDyOL+HTf2S+Ey8wo6AQ/WADJsX4peEailS2oOQwuYf8/gtDEt/W0+SevwzbaoO0VYmhkIH0UxpNpJWo2WBdB85UDRFqLWS1L1vEjSjHAw890nN1Qa3v9EvQ8DkbWVeYWqq6b917es+AorkjnF6hekBaOVV3nasv4TVvVciBnsilb6OpQ69zkcZwgz5dmLOEO7pJEg0rV39PIQVwzuwrAje/ZeB1s9DQiqp9DdglecFL/AWW1NQDMWl7vBLwcKuXmxkQbdZah+zTcknPXFBV4F/J9J0JbLiuUgvuWXqznR7BCKdGnhCMicUQ78OofZrJiDJTcz0zyKd0chemNZW1tfro4nfWk5Y78Hi/JYPWVGREB5ufiRPfhOiVutnw10/I/6skSNDXs2N2opgDQbEK5Z+CWBnRMOY8YAFhg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(316002)(6916009)(5660300002)(8936002)(186003)(2616005)(38350700002)(38100700002)(966005)(107886003)(6486002)(52116002)(6666004)(6506007)(36756003)(66476007)(66946007)(66556008)(83380400001)(4326008)(8676002)(508600001)(86362001)(6512007)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDdOSE9tVzV5UVAzSHY0eVpWdWJCVUZMY3VXNXVySXh2QTlLbkZ4U0lIZTFB?=
 =?utf-8?B?TWtkZTlVT2xIV0k1RU5ST29xZmhMVmNnRG4vOWRka2QwVEx2UDZUMVM4ZFNz?=
 =?utf-8?B?Vm44aVFONFNoN0luejFxalg0OU1ndzM5VjUrZk9hK1RhaUtwSWVsUkpzaC8r?=
 =?utf-8?B?QkU5a1VOQXZXMkxvMUxvNS9MMTVHRTlNc2lnRUhmeDF4YXFhK3pCRnZlMENJ?=
 =?utf-8?B?QXByT200Q2xCT2VtWjBkQVBDczhIUmRPL2Y3amh1em4vTjNOQVZ2eEtKZzZQ?=
 =?utf-8?B?Vm9uc0RkVmgwbEoxT1Q3RkpKaVplSUJ0c2Y5YXpwbDJXZktBWkJSdExTTkxR?=
 =?utf-8?B?OW90L1p2NDQyeW9MRk5qSTQ1RnJTLzlJa0wxdnNPUzd5UGw0Vm9WdktnbUk0?=
 =?utf-8?B?b2gwNFRmdGVYb05TVnh4ZklicitYbUIrUkM1b0FZUEFjSzFFVWhFTVZGRDRO?=
 =?utf-8?B?K2tHeFVJL01lM0NWSE5kMHpjeU1EdEVqTHl1R3d5aFpKWEtNNzdwd2RHU0ww?=
 =?utf-8?B?UytMcU5yRlgrcGpQaDdjUkdXZW84VEJMZHMrQXJvenlHQmdjRm11Ni9kKzJ1?=
 =?utf-8?B?NE1Zd1JTcXM4TjhSdnZzM0xtbWhzSFhCc3ZXck90R0h1ZUVuemxzdmhvc2FL?=
 =?utf-8?B?NzNiejR2dTJJWSt6TFA5YzJNVjhPcmQzempHZTBySGtudFYrTi9jT3dZMXlK?=
 =?utf-8?B?ejMzY3BYMEUvbjlHeWlVVlcyR256Q2tNTjYrN0FlOGpIL04vQkNwMkhiOXR6?=
 =?utf-8?B?VTFVcUZnU3pIbU1KQXNIZkp6U3lkbno4OFRCZnBDd1F4Tmp4dm9NbFNGNEVx?=
 =?utf-8?B?Z3laZk1kTFM0anpqR2JlckVSeDk1cExxV1JtbHRyMWZ2RVIrYVBwdVI0Z2No?=
 =?utf-8?B?N1FjVktsWUp1WUVKRXJTeEFwUnYzSmwyaTl0ZXF2TW5ieWFTekdnS1pieWE3?=
 =?utf-8?B?ck9IMFVURElWYU5BQVA5aWQ4NVk2dm9mN1ozYVZwQWE5L0RSaEJ6dmRuRlJw?=
 =?utf-8?B?ZlJyS2pEYVNsY3VFeUhyYk41TjdIYmkrK05RZFFKNnhrMGNKVWRaYy93bVV5?=
 =?utf-8?B?TVB2TWNLVlB0SGlkSzBpZHdrV0QyNzdSbWpXaGxtY3A1dVZ3dGJwTXZEcEhX?=
 =?utf-8?B?ckh0ZkJrUVNTeTJVMG1pb2t4RVYzMnoyYjdiVHdYUmhxWEs1a1NaZEVXVEd1?=
 =?utf-8?B?UE04MHR4dkhtNmF0Smo0UW42cm5BSzNHMC9RcFhPV3VWZWpYTmxKU2V1SFVH?=
 =?utf-8?B?OXdnQnBoc3NHQy9DWTBZR0N0enNsSkpocDhLSEtLK2pTd3B3Y1FzUVpHT05W?=
 =?utf-8?B?M2JUZTdpRTlYTHFkSTAxVVJiRVJkYklmdWFwQ2RIMTdrcmp5bldqSnhYTkhn?=
 =?utf-8?B?bnZpOEFXTno5RlhnUmdKVW5Ca3BhR0tXbzY0c01aVko5Tkp3TjJPRGpkWENv?=
 =?utf-8?B?Zm5vN05TaTdxWERGdHFYc0Ntd1hzb3R4Q1E1dzROUzRHT0lxWitSU1FTellm?=
 =?utf-8?B?WjBTU2MyUEhhNTRxWWEvUXFqTWRVb2V0VG1KWDhKRG1INVRoM1h0REJVamN2?=
 =?utf-8?B?bHhEb3hDY3hmTnZhd2c0ZWVPaDRiZEVKdG5IMEhHMG5hWllCZVpoLzJxQkJk?=
 =?utf-8?B?aFQwQUFUaW55TGI0UThwNzk5clJOb2VzSS83VytiNFpFNWVkSVdiMUowQjdI?=
 =?utf-8?B?Rml3cGtsai9saEN3WFFzVm9pZTY2NE1EbmlLZ0hJRm04N0NaTTlqR2VEOUlt?=
 =?utf-8?B?TVFDb1NuLzJHNHhMOHp5UWJseWFmNnNISjNUVU1zSk5lNW05ei9rZVN2ekJm?=
 =?utf-8?B?dUdJRFdRLytEOUVSWWR3dFhNekRNZ2RZYm4wUHdReWg0OG4weWJyV2l1aTJy?=
 =?utf-8?B?dVFxd3djSUhoa3ByM0Z2cEJHckJiQjRicm9taEhXZm96VWlhVEpMTjE1WVBm?=
 =?utf-8?B?M3NYejZaUGsyaXFUM0ZhWDRGSjQxTy8zd0FCa0pJL1NMaW16YVZiWEM5WmVV?=
 =?utf-8?B?QWprS2RXYURld3pxRWJBT3FtWTIvd2NYRjJxMWM0dElKbGJrYnlvNFVrdWFB?=
 =?utf-8?B?c0lWY0JvMXNXWVNtYzhkM3A1eG9VZUp2Yis3anp2Umk0ckdBMUV0N2hjdit4?=
 =?utf-8?B?ZlhjclVUK3gzK3pkcHFUNHNPV3lUdGNvZHNqalRNQlZRMW44azdlZFdaYlVS?=
 =?utf-8?B?QStaY0YyRWdRck9McmFCOW1mNVlzbjJhREV0L0Nnek9abU9nek8zSHRBQWVJ?=
 =?utf-8?B?T0E1YlVrQmR2Qk9TNlYxUDNwaUtrOHdveEJybDFPejhTOUpVcldSZ3JSbGNL?=
 =?utf-8?B?ZUt1UmFmSER1enZqOWJYT1pvZjhMa1VxeW40TVhBcVFtQnEvVFNJZz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f32ad2d8-df85-4994-0299-08da2f1c86e8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 04:54:39.7788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uLwFsFJD+fEIfY8+9YmJaWrmakJ+NvWutMzbaO1w3wQoEdohKLMULmuDnYrVUN29fhdmZO6zro7QS6WfwNckBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1416
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-06_01:2022-05-05,
 2022-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205060023
X-Proofpoint-GUID: RGcv8JiScgbtxMate-Rv3fFrZAmC1zQD
X-Proofpoint-ORIG-GUID: RGcv8JiScgbtxMate-Rv3fFrZAmC1zQD
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This patch series attempt to fix a few issues in vhost-vdpa multiqueue functionality.

Patch #1 and #2 are the formal submission for RFC patch in:
https://lore.kernel.org/qemu-devel/c3e931ee-1a1b-9c2f-2f59-cb4395c230f9@oracle.com/

Patch #3 through #5 are obviously small bug fixes. Please find the description of
each in the commit log.

Patch #6 is a workaround fix for the QEMU segfault described in:
https://lore.kernel.org/qemu-devel/4f2acb7a-d436-9d97-80b1-3308c1b396b5@oracle.com/


Thanks,
-Siwei

---
v3:
  - switch to LOG_GUEST_ERROR for guest trigger-able error
  - add temporary band-aid fix for QEMU crash due to recursive call
v2:
  - split off vhost_dev notifier patch from "align ctrl_vq index for non-mq
    guest for vhost_vdpa"
  - change assert to error message
  - rename vhost_vdpa_one_time_request to vhost_vdpa_first_dev for clarity

Si-Wei Liu (6):
  virtio-net: setup vhost_dev and notifiers for cvq only when feature is
    negotiated
  virtio-net: align ctrl_vq index for non-mq guest for vhost_vdpa
  vhost-vdpa: fix improper cleanup in net_init_vhost_vdpa
  vhost-net: fix improper cleanup in vhost_net_start
  vhost-vdpa: backend feature should set only once
  virtio-net: don't handle mq request in userspace handler for
    vhost-vdpa

 hw/net/vhost_net.c     |  4 +++-
 hw/net/virtio-net.c    | 49 ++++++++++++++++++++++++++++++++++++++++++++++---
 hw/virtio/vhost-vdpa.c | 23 +++++++++++++++--------
 net/vhost-vdpa.c       |  4 +++-
 4 files changed, 67 insertions(+), 13 deletions(-)

-- 
1.8.3.1


