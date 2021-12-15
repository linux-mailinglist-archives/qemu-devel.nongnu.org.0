Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9C3475BF5
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 16:39:28 +0100 (CET)
Received: from localhost ([::1]:43852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxWNL-00088h-0s
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 10:39:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mxWK1-0005EQ-Nz
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:36:03 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:21998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mxWJx-0008RP-3a
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:36:00 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFENbrB009133; 
 Wed, 15 Dec 2021 15:35:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2021-07-09;
 bh=f9qzjElp8E40gKe93mvPnbQUckfCAa8H3XJjTgX3gMY=;
 b=rTMIEOs+tZuBnpqxA4bfrGk0FU/mwvWeUVpdDX5EjxUdXPTAKKKH/FLbY/MQBCsBqeQ0
 YHAQHl61Im7fDAhMYg/cZfg9YT1XjXTNClikJOz4HHwVbs3S8VK/i8qSQIOCRzV22Le3
 ZJwvDDh+4r7l+coiIZhzp3AMIZftX8/VKQqGWQFqV3ZH/v2hZwPLiKRDiBLtCUi9VUZv
 SqjPAHP7vKhx0/qOSXH4GJmeAz8jHHegZ6H0YnBjWUw4SAhh3by5KTGB09DienZymp5N
 1rpjd1N0MzB7CUZxOPkBfA2zOprA2766lHUdhNrO4YjAPloA26p8fFuQP74eGoez7/qt /A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cx5akexwq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:35:52 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BFFVi0F127819;
 Wed, 15 Dec 2021 15:35:51 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
 by userp3020.oracle.com with ESMTP id 3cvnes2c6r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:35:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kWMcLKTI0Lugm1h+KXiTxmXZhDVkh61N4pPx5Q6vY44Ru3930xQPkyox9t3aZ9Gykw+FieIf2cGqsmgAlis7dP+OBsA5s8RqoFYeHYEFIhmUTGOKCR/7EWjuU24YKH/u1xfnaDIdeLKN7W0hVUwJkfMqdB0cEK/IqGBjc7J/A1OzKD+8smOPjcxOvLIRfhdirkSif+dyp3JeEZikn5spGI8obqux191dH8IbESWbYTcsKEXjvid7qm2PEnCcP9j1lrYVtjOA7Fof586Yst8u6PsyhlC1P0YWIgebk51PIxFtMJlKZeNCqFb2coBRPC0NBVJUQqb5vZfyV29wXAUsog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f9qzjElp8E40gKe93mvPnbQUckfCAa8H3XJjTgX3gMY=;
 b=Rw5b118mT5KjD64xROEvp2YSAkcoWlfchK8+zvUNvGzE9jTeHG8+K5xy/Gs4PfuGZAfKHOZu4jo+tfkiRwv7NLQ/yGMO+uIOFggEMjuZqUYsX1wKwOKi0rBB2iHY8IIt5tvaKZcNYU42zoKDFc0l3YAfWI6qfNr3r5SZBrmsiSVIE5DYFJTShC7Pz2ec6Bsb31h6DCwX+Ka6JQBoypq/A+/vgB5fPioAzFCqyQp9x4ZP7mK++9rKE+bl69CGp5fgnkpzp//NgAahidr/gHS3U/JxpNsRUM3/mFcbnbMc4uTLGSp/xz4GGRwcCaPvxzQHe1/ndt2thVEslPIrgoFr3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9qzjElp8E40gKe93mvPnbQUckfCAa8H3XJjTgX3gMY=;
 b=kyloR5jTTyL/eOaCzwHnYIoqpvtIxOwDEQptjdgLsSL1aBHbz9MIozai7x785+sWpCF+aSa9bpmEZXeSw3DcS3mlX5htIjPBlvG1wexCQnt/MvQfmRS4ZrWCHYFxIGNSw7bPk+I2wUvZntb9qTKkYbtCsiv+bMcftJWd9LXTrgc=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB4094.namprd10.prod.outlook.com (2603:10b6:208:11e::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Wed, 15 Dec
 2021 15:35:46 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d%5]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 15:35:46 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/14] vfio-user server in QEMU
Date: Wed, 15 Dec 2021 10:35:24 -0500
Message-Id: <cover.1639549843.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0105.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::46) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e8a5103-d467-4fa2-350f-08d9bfe08fe9
X-MS-TrafficTypeDiagnostic: MN2PR10MB4094:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB4094A0EB3995A687782A02FF90769@MN2PR10MB4094.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h3bIn5KKhQ9YCIjIVw5nm3mthhfBBc6QD+ikvcvVCVPMgIU1HJZMv8zNyD3mgdL8tg4sOIxUxuQsJSvk9KLrLc0nsFuhq/JIdwTFM6mFUXx4Mk3GMVazx40Drj+lbE6wQwzI2mMxZsLk+pbI4eho0TWhWEiZ9K6ZE+J/wyvLNQ1v1e+OIYYxGf/Nmc6elAyjNNUxQlMfo95jy0jc+h+bl92AsKJvODpxcpXyZDBCusZj7Xppu4d66dnAttxZE87SOdYE4vc2ib8dnnd9YmmvXI+5hvMV6Aw2SPimmM0soDsDPo5QaqxJH3L7jDJD/soCp+I7zV0M95jk9O6yOSKUMUEPEFexF2SapNezQN7yXH7GRgU80et0SaM3bgOlm+UpbM9UXU420WvRaNuz1qW5THcfCyrZhXtFEybH0LxuZRlIwyclcMQxws4Da3O9Wyg/cC0RPTjUrt8+3P0CAZfhoduMJ04WM5YHwO+DyCMAwLnGaRrRPCcJttIvjsnt8SeqQRGSgeUBj5kmpJAFu0lfQMxxCYsnjiU2++YguHlLvkJhO2V78a45kKG/Fra5aF86xQgwW+yOTxvHORXI5sJkOevgBTprmaZy3wST8EWt90NB0DpvMYfxADx2NT/dZwuLyDS8oFhFl/Rw3jX8Ncgy2Ggqm+ByaymL0/zY8Hn4Wod9T/lb40LqPoPB7bkXApxbasB2ALedZA3pn2z0JawDqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(6666004)(52116002)(4326008)(2616005)(6506007)(86362001)(8936002)(6512007)(5660300002)(6486002)(26005)(2906002)(38350700002)(6916009)(38100700002)(316002)(186003)(107886003)(66946007)(83380400001)(8676002)(66476007)(508600001)(36756003)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dG01RDdHR29EY21lOVo4Q2JJbE51UHBZWlAzZ29STEIvaUJNR1J5S2ZRcXJ4?=
 =?utf-8?B?RFFxeGwzVnlYRFB0OWRUZmZ2bFlLRU50V2JwaTVvUnpQREZBZUNWZkZHelkw?=
 =?utf-8?B?QXN5WDlGWHhaZUtsQ3pxZHh2QjRPU0NmTTVydDVVR0JUak5qaDVVaUlJYjFs?=
 =?utf-8?B?bjByQ0Faa01lWWtWNi9OUXNWSlNYOEhlYWpCZFlTQzd3WThJZ3lTL1NwUzV2?=
 =?utf-8?B?NXZ4aTViZ3lGWEJhWnpqc3FKS2Jnc1N5QjI3c3ZjQXR0b0hEbllCUFZUeVNJ?=
 =?utf-8?B?V1prOHJWVHE4SFlTMm1qRXFRN2wrQnBzMmhWbFlNM0Y0QVFHMUtrcjlZc1du?=
 =?utf-8?B?dzZIYlRJUWhLaFpqbm1XMVVoQUNubGlUNWpEdHhuWG5OTlJGenYvem9SR0F5?=
 =?utf-8?B?ak50SThqcGVmTGJhM293aTh0RGpLZys1UWhBZEsrZXJ1c2s4bHJsU1RiYlV3?=
 =?utf-8?B?cStwTTgzcldKSVdmZVBIL3lVQTRMQklqM0JaVEkxSVFqS1MrbEczcVIvQlh4?=
 =?utf-8?B?eUNmdUdETi9DMytzSk9XRmU2QWt5RVNaQjJubmdxVGVmTWRHNmFqcnpNZmV2?=
 =?utf-8?B?S1hXSEFMUDdmZ0RiWDBydmp5ZXJZVWJRMnBjbkFtRE1Fd3VIbXFiVnp5RTQ1?=
 =?utf-8?B?VTROdFlvOW1UcFZnTnJnNjFkZXluNHhkN1RjYnZOenBnQWdWOU5VaTF0YlQ5?=
 =?utf-8?B?UUZtRXlDbzY3VDdVU090MVcvalJiRE5aMmxzTHVyWDJlalBQendjN0kwdmR1?=
 =?utf-8?B?YzZFRjlyWmk2cXNtMk5Qd0NNVnN4anE0aFB5TU1LVXpNMzhKN1VoYi9xWnYz?=
 =?utf-8?B?MTltaHltYU1oNTRyWjM0SzNheGVkYllJUkU4U1NmcUVWcjFNOGI0TFpYNCt1?=
 =?utf-8?B?ODBLUWFTYWlBSzk2bThmcFRNdmdtL2RWUllLRXpSOVoxWTZQeVQydjNDMXV4?=
 =?utf-8?B?dVBRbTA1RzBhUGhqZEIzVnYyTVdlVlBJOFJGY3JvZ1A1K0hyVnBoYWtFODBP?=
 =?utf-8?B?b04vaWJhYmJEUTh2SU16S2tZdnprUmdCeTQvR0N0cmVVbjh5dEQyYXhEYTFk?=
 =?utf-8?B?d1ptNllOY2QyYjVLVkpsQk1MTjVKL3N3LzZGQ1BvU3hZK1h0RVYxVkNGSU4x?=
 =?utf-8?B?VGpYeE9EMDlVVnhhOE5KQWQzaHJ4SEphVzhuRUdtUGRXc1p6Rkd0M2NpL1Ex?=
 =?utf-8?B?YzNxY2JWSlJtZmhKbjNQV2NsMXFRNnU3blR0Z0tZdG05anZMWGpaNklMSzBE?=
 =?utf-8?B?OG1IREV1VHJOQldkMmJrQXNSTGM5RExocmJReWJQOXZ5VW5hK01OMEh6clZM?=
 =?utf-8?B?TWIzZ0dnYlpDb0w3azRBUlZzSmV0WnV5blNnK0FIWmxFOUp2TW9PYnM0M25V?=
 =?utf-8?B?N25QdVZLTGxVWG4zRG1YdE5wVWgySE5IckRjaUpYVlVLbmMyMnh3ZGpSZ21I?=
 =?utf-8?B?cU9Mb2prTW0zbkJSOEUwZ1VaaUp2N250d1l3OTFIOHBoWTRnODNGWk4rOW9y?=
 =?utf-8?B?N1JjWmgrdE5UZENpZ1k1TnJWUm5YSlBlbS9UUkc5dUlGRXpFM1J4di9LWVIw?=
 =?utf-8?B?MVRmRUo3S3NGbE52QVdWa043dnhxMXpKN3d0MUJ0QjFGTUJpQUk1eGFDSjNW?=
 =?utf-8?B?UEYrZG1NTUVIRnhQVHZ4MDRnRFJpaGFKdkRWVnJMUHozWGphUEhpcnFVWGI4?=
 =?utf-8?B?QmZKY2RqR3RMay9JUE9ROGVYblJYalJWdVZXLzlWRHZVaHRRdmFuZGtnK3VH?=
 =?utf-8?B?WXVWNitPa1FvcU9pNy9NVEIwN2dmQjY1ZG1XNGVnWE5KWEEyVklpS1dSSUl0?=
 =?utf-8?B?bnNQNWI4ZnB1UkdWdVhhRmdsWm9JMDRid1ZPUTN3dFBQQUVRRXB3dXYyaVMw?=
 =?utf-8?B?R2ZmZmozZ0NQcXRtM29GemR1ODRiQ1Q1SzRHekU0L1lRR2RJNFJSNDVZbU9j?=
 =?utf-8?B?U21ZVDNzL0JEa3lmNzlJZXhGUGxkZkRMbnN6elRabjhmNFljNnRwT2pWS0J4?=
 =?utf-8?B?RkVVNXRzaENqNTFzUE4yd1JQRzA3UHNRSVJhSXBnZUpwcTllQmxXTXQxZjNR?=
 =?utf-8?B?bHlLSlhVaWZmZ2JzcVVDS1J2bS90YnBzVkd2NGpISnpDNW94d2g2SkZXZVNO?=
 =?utf-8?B?b3dPVFpOZnhnaWJONmZpQ1RuTTJ5L3ZEdGdPcW5OWHQ1NEdZcXV0TFlsNStF?=
 =?utf-8?Q?3eTRaXUOX0+FEmwu+6EBREQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e8a5103-d467-4fa2-350f-08d9bfe08fe9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 15:35:45.9046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E72BzlA96UTsdPlQchbSYWElu4Hqr8flVw+G2VCaA9DKkESYU1sHZPaB0tns/cJm8ajS/9TcXxha4VdxxjkPPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4094
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10198
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=889 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150088
X-Proofpoint-GUID: cLoIS2quXFJmAHhfLKRnfdARHmxxzv6Q
X-Proofpoint-ORIG-GUID: cLoIS2quXFJmAHhfLKRnfdARHmxxzv6Q
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 jag.raman@oracle.com, bleal@redhat.com, swapnil.ingle@nutanix.com,
 john.levon@nutanix.com, philmd@redhat.com, wainersm@redhat.com,
 alex.williamson@redhat.com, thanos.makatos@nutanix.com,
 marcandre.lureau@gmail.com, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: <cover.1636057885.git.john.g.johnson@oracle.com>

Hi,

Thank you very much for reviewing the patches in the previous revision!

We have addressed your comments. We added the support for MSI/x and
IOMMU in this series.

Please share your feedback for the latest series - appreciate your time.

Please the list below for changes since last revision:

[PATCH v4 02/14] tests/avocado: Specify target VM argument to helper routines
  - New in this series

[PATCH v4 03/14] vfio-user: build library
 - Added VFIO_USER_SERVER Kconfig option and vfio_user_server option to
   the configure script. VFIO_USER_SERVER depends on MULTIPROCESS
 - Reverted to enabling multiprocess by default. As such, tagging distros
   in the multiprocess acceptance test for multiprocess is not
   necessary - reverted them.

[PATCH v4 04/14] vfio-user: define vfio-user-server object
 - Using qapi_free_SocketAddress to free SocketAddress
 - Changed object name to x-vfio-user-server
 - Removed max_devs class variable. This is not needed anymore as we added
   IOMMU support in this series

[PATCH v4 05/14] vfio-user: instantiate vfio-user context
 - Redesigned init code to abort QEMU during startup upon error, whereas
   synchronously report the error and continue running QEMU during hotplug
 - Added qemu_remove_machine_init_done_notifier() in object finalize
 - Removed NULL initialization of o->vfu_ctx

[PATCH v4 07/14] vfio-user: run vfio-user context
 - Addressed comment about hot plug from this patch, in patch 4
 - poll for fd to become readable instead of busy spinning alone

[PATCH v4 11/14] vfio-user: IOMMU support for remote device
 - New in this series

[PATCH v4 12/14] handle device interrupts
 - Added support for MSI/MSI-x interrupts
 - refactored INTx handling code to leverage the hash table used by
   the MSI code
 - Added a hash table to lookup vfio-user context by PCI device
   function index

[PATCH v4 13/14] vfio-user: register handlers to facilitate migration
 - Compute the size of the migration data when registering for migration
   BAR. This alleviates the need to hard code a sufficiently large value
   for the migration BAR.

[PATCH v4 14/14] vfio-user: avocado tests for vfio-user
 - Corrected the object’s name in the test
 - Added tests for hotplug and migration cases

Thank you very much!

Jagannathan Raman (14):
  configure, meson: override C compiler for cmake
  tests/avocado: Specify target VM argument to helper routines
  vfio-user: build library
  vfio-user: define vfio-user-server object
  vfio-user: instantiate vfio-user context
  vfio-user: find and init PCI device
  vfio-user: run vfio-user context
  vfio-user: handle PCI config space accesses
  vfio-user: handle DMA mappings
  vfio-user: handle PCI BAR accesses
  vfio-user: IOMMU support for remote device
  vfio-user: handle device interrupts
  vfio-user: register handlers to facilitate migration
  vfio-user: avocado tests for vfio-user

 configure                                  |  21 +-
 meson.build                                |  44 +-
 qapi/qom.json                              |  20 +-
 include/hw/pci/pci.h                       |   8 +
 include/hw/remote/iohub.h                  |   1 +
 include/hw/remote/iommu.h                  |  24 +
 include/migration/vmstate.h                |   2 +
 migration/savevm.h                         |   2 +
 hw/pci/msi.c                               |  13 +-
 hw/pci/msix.c                              |  12 +-
 hw/pci/pci.c                               |   2 +-
 hw/remote/iohub.c                          |   7 +
 hw/remote/iommu.c                          | 117 +++
 hw/remote/machine.c                        |   5 +
 hw/remote/vfio-user-obj.c                  | 957 +++++++++++++++++++++
 migration/savevm.c                         |  73 ++
 migration/vmstate.c                        |  19 +
 .gitlab-ci.d/buildtest.yml                 |   2 +
 .gitmodules                                |   3 +
 Kconfig.host                               |   4 +
 MAINTAINERS                                |   5 +
 hw/remote/Kconfig                          |   4 +
 hw/remote/meson.build                      |   4 +
 hw/remote/trace-events                     |  11 +
 meson_options.txt                          |   2 +
 subprojects/libvfio-user                   |   1 +
 tests/avocado/avocado_qemu/__init__.py     |  10 +-
 tests/avocado/vfio-user.py                 | 225 +++++
 tests/docker/dockerfiles/centos8.docker    |   2 +
 tests/docker/dockerfiles/ubuntu2004.docker |   2 +
 30 files changed, 1591 insertions(+), 11 deletions(-)
 create mode 100644 include/hw/remote/iommu.h
 create mode 100644 hw/remote/iommu.c
 create mode 100644 hw/remote/vfio-user-obj.c
 create mode 160000 subprojects/libvfio-user
 create mode 100644 tests/avocado/vfio-user.py

-- 
2.20.1


