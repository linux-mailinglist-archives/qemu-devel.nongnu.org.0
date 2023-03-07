Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 960566ADBFB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 11:31:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZUbI-0004Ws-9T; Tue, 07 Mar 2023 05:31:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZUbF-0004W7-42
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:31:17 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZUbB-0004j5-JV
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:31:16 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 327842Ev017163; Tue, 7 Mar 2023 10:31:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=p65nGJLRZc7X139JLWtQLJeAhm7Chs7eH3e9Cl4d1UA=;
 b=Ff6OcZCYikx5ErMLRmiyS2HzUe1BuQHsNxEYfWPmN+q1DHmsQauVH2Q21Adn1V75CgWB
 YmdvNBXojQo4YNiVT0j7twyp5WptiaCjcC5caky6gKQ4HKgFE+VpoE6PKFUcz9VZLXTi
 4DwvTfuTqDwuzOBRX7tc4ADlysnsWjKjABZQz1Y15XfDhF7XlBj7cdz+nGm1irP47ODt
 z4GsrqSNcACzbEDgYiLRGo6uYkb9nlxE87+tM6UhldTEwQqdvFnKMFW7/b7VP74BFdi9
 sfIacOHC2nMVBs+AtIX8vl82yYzQb12kMleutvClkB8G4tBU1C8GSBC3ai9RTQfjn3xa DA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p417cd5x6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 10:31:09 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 3279jIPH025157; Tue, 7 Mar 2023 10:31:08 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4ttjt0qg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 10:31:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KljmtoCJW4SlMZsQBLqnNp3ycWXleajThCQ+gbpRxUXdW3Vm/zPYkx58lxjaY2N1rA23s3lecjvnJ8MkMZ8ks1q/kB60U8csYwtxb/qB1vExMEh8UuMMqJsvtJtjXvMP61/kaywbKACTDumNUT0p+u8XcIfarTDha5x3y0PFzd0Z0TNvqzW0GW06KQcKVDcH2wSbxPvjQa2yLhKylwJKhrL3juiSokZotT0RzQPll1BjhGWt3oGPehuS7zqpG1uNBHNrIo5EBNfKYlEc3+vQvyzYfA2yuQDhXQrGml/tQq+wMIYJWcuIDiNBlpwu7pChsceNfFXnsWkO+tQmM0dx5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p65nGJLRZc7X139JLWtQLJeAhm7Chs7eH3e9Cl4d1UA=;
 b=RBwujvUaHIiJH6tHdcdDQgxzuYX/+e6Ul9orMcVUAZ7M4V0F+ZAXCnIQJFouNnlkfVNB0ovCn3hYifxzpDLxrIsrSWGaIRGHhCP8qa56hcQZP6pNcYK66+hltd/HwC8/08MXgI3BKmsH1c6RB4LyR/YHPsVl5Z2umBmMB7D5c4OBjQcwOGhsJNjezlrhW40wEECziQJyKtwWSOTBvJBmeJ63T5UwRh7tn0xAkZDMgWFLS599fs12K2sARhnEyEe5xL//bREnhzA0mmcJDyC7WzNUUEj12L79THzHWM9TEPOjnd0CIjKiQEbJuxYhAOhnccv5iFF13/g8bqYHjq9WJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p65nGJLRZc7X139JLWtQLJeAhm7Chs7eH3e9Cl4d1UA=;
 b=vtKXteODNAwA+2rlKdwtENLiMcXNVPPqkmBn78J2D3qj1pkh7G0cDzDKBHxtb/wES/y895VVATV4qa7T4y0+0/PlDVYpi+zUuzM1DBwud8QfjgJ25U9ypRSL3WEBxhxaD16oODtVmykhQgF3yg42axGM/zn17nkTsF+X222zUmI=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by PH8PR10MB6455.namprd10.prod.outlook.com (2603:10b6:510:22d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.25; Tue, 7 Mar
 2023 10:31:06 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 10:31:06 +0000
Message-ID: <f9b8c6f4-87ad-9c3f-785c-38efb9a216ce@oracle.com>
Date: Tue, 7 Mar 2023 10:30:59 +0000
Subject: Re: [PATCH v4 08/14] vfio/common: Record DMA mapped IOVA ranges
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>
References: <20230307020258.58215-1-joao.m.martins@oracle.com>
 <20230307020258.58215-9-joao.m.martins@oracle.com>
 <20230306195736.3efc6980.alex.williamson@redhat.com>
 <8075fea3-fbd8-13b2-8afe-2db8f104ba5f@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <8075fea3-fbd8-13b2-8afe-2db8f104ba5f@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0200.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::7) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|PH8PR10MB6455:EE_
X-MS-Office365-Filtering-Correlation-Id: aecca285-535f-444d-7779-08db1ef70f06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aeq+2fNG2Dpxm/oRJkp4trDAF3+W3C4IRhApdJssESHPF7s2ru3fJHY27KyURpxqcXmYKAJcnodmm88Yj1HsZt53SBnjGuWbQd4Te2KWHQ68o9o3CNJACOKnJv4tIoXxhRZMnqX9HcilIAf8hdjW6LS1qGgnEj8sKHYt4vdAxM3JsZda3iGuOzeBSUPyepPES8ZE38JCcfQhminyn2IUhWtZM1DTxT3sd2Iq5gC3y+xlXws4UE8vckoL+ZE8FHdTN4mFMAlc7kbJ5a9gZ30g/eDT5JqtcppbX1ZA9G01QVIiOAtr0yemkIlyz4JQQaJbOqtUyHgEkZMtX3L9uSHHgE6ucS7jEPFBgvNexfRqfFS1dirkGOH9Avu/yuk7XNOYhM+tf645F6O4yxFavKdaja30yWTr4LHM4OVcJ2RywITzNbTODIM5dd51uhNp2tpIHnaQ7EHfbmkQ9ttKC8tAwRUS2ykY2II8ugK0LK2QdTEYixwq2AQ6hiSsdYKEY29hqD/j/CfPUgfPp4zVwEwl3ot9vwex25dDaNGm/Y7pVwPXAqflI6GtBV4e/DPuyVtJu4v5N3GXnjrqvlHjDXwn/jvu4mFqVT/7rJMwYec43Jt9aFIGgWvH+ZOSnS/Wlb10mGNrAdkig4/8nATDUnXDR3baPl02s2FsEeF9B53GhHSR/9OdSq0NVxepDrUXyAhx5USNgYT0paGPE9eVJIznMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(376002)(136003)(396003)(346002)(366004)(451199018)(38100700002)(31686004)(478600001)(6486002)(2906002)(4326008)(66574015)(8676002)(66556008)(66476007)(66946007)(31696002)(110136005)(41300700001)(316002)(5660300002)(186003)(6512007)(26005)(54906003)(86362001)(36756003)(6666004)(53546011)(2616005)(6506007)(8936002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0Uxa3Nia2ZXajVJalVPOGdIUmx6YXE3N2dtcldQTWk4Q241bk5naUlJeGh5?=
 =?utf-8?B?d0pIanRROVpmVllZVXBUT0xFdVRSOStvT040MW81b29zUi9BS2ExYkVMMndQ?=
 =?utf-8?B?QzhPOWtJNVE1YUpRQ2tHSkVLZkdPeEx5eVRTVmlRVHBzZk45a0oweHplQ1p5?=
 =?utf-8?B?TVhtT1RreDlXRHo4UXJyM1JkRnEvOERWdTRxYmlXOWIvelQvUytDWEhMMTU2?=
 =?utf-8?B?Sm9jRDN3STNkWUJRUEpzUVRZRktQdVl3ZXgvYlI5d2NSUGVuZFR3K0RiR0xQ?=
 =?utf-8?B?MTZsQS9LSFNjOXpzSHdTZlM5ME0ySVZySEVqazJMeTJzVXMzTENWUUI3RnI2?=
 =?utf-8?B?cHo1Z1lWRk5pZ0IreklhZGwvbnFqQ1FmZE5UcERObXRCeW11a0VKZ29pQjgz?=
 =?utf-8?B?ZGxvV1ZtRUZXTEgrUmVZWWt2MkpTRDVjMEFGVTFvMFF1cThzWFRiK3ZpZWdm?=
 =?utf-8?B?UFgzc3ZnSVMwOWlyc0hCQjJISWNGalc0VCtsK0lBK0pwU1dEUmh4Tm5Wekkz?=
 =?utf-8?B?Q2QwYWpuNE41V2N5RFoxc1NvZ2w3VTVLMDdxUEp0OXQvM2sxbXJpVnFlMnpq?=
 =?utf-8?B?YVVQNVpxT0xXWlFSYS9MTmwwa0tmejNRR3ZpaEo1UDJweitoOGFxZzRPaXF6?=
 =?utf-8?B?VHB6NUNGdjJSTWdrMzhmSkE2TnJHTkc1cjk4ZmlWc2RkbkNyYU1YYnZhSTU3?=
 =?utf-8?B?M2hhSzltU1N1Nk5IQ09TVlZhSGhiK1hwTURGUUhISGRmYlFjWjlWYndIakNS?=
 =?utf-8?B?eXRGd2dFZXIrRXh5ZkN2Vnl0bzZqZkVOWWZhL2tpSE1tZ1lkellGaE1Lck0r?=
 =?utf-8?B?dHQyVmlNUjlxelA0UjBkbGNsc05hYldlbEhkT3BGZFVNK2pWb0ZMV2F6UExJ?=
 =?utf-8?B?cFVIQkw3a2VCUjltTUxEMkU4eU9wOHg1NStmTHEvckFBYkVQUU9VS3BqWDVS?=
 =?utf-8?B?cndIQ0tkNUIrNGY1dXM3UC9oeUV6NnpYZWhsZzhNSk5OaHNhSmlHbW1kQXdX?=
 =?utf-8?B?MEpZdGtwaFhDQThlV3dUTHVXZkNWSjBnRWZqQmZLa3lMWTU3b281LzVoWnlJ?=
 =?utf-8?B?S3dhVEprWm9RQzhSaDZsMVJ1bktjaXdjQVhQMFZsakU0dGFLSWJ2RTRFaWht?=
 =?utf-8?B?V2NYd09xemU0YWw4aWVoOFFvY08wcXF5WHdjNDVRcnRORVdGYS8vMC9ONDBZ?=
 =?utf-8?B?SFh1akg3cG4vWUEwa0JNcGlXYzJGK3R5Z09ZZ2FuREk0Z3Q1WkVRWFdBb0x5?=
 =?utf-8?B?cHQ5TFhnZmVSbEM0ZC8vMzJZZVBiV1FLb0diZHdpakFXeVZ2TGFFS3lKWFdk?=
 =?utf-8?B?WjFYSkkvM3o1RmNoeDZzMW1Sa1pBNkdWdm14SHJnaW9Rb0ZyVEZwWS9Hb3BI?=
 =?utf-8?B?NGVtZDYreG5wNE9yV3RKQU0xWE5UQmI3RHI0NDdRVW5VVG9jQldSZmtzWTdh?=
 =?utf-8?B?YU9zSVFuUmFITC9nZzFGN3lSYW1WeElCbUp4RWJIajFLRURYamhlc0xYTmhp?=
 =?utf-8?B?K2dQRVFkSHNvV01uUU13SWRIN25VbGZnbjBxZHp3VzVHVXFpV09kZkQ1ZEl6?=
 =?utf-8?B?RjJNeGU2ZzZpaVFhcWRkT2REU05HZzI4TGRFbEYzOG8ySSswU0RlNWZQeVBy?=
 =?utf-8?B?QXJVZnJSNWZPV2ltZHNvU2ptY1lJWGRYVUEvWlU4L3Z4eDVwT1I1SFFYTWNQ?=
 =?utf-8?B?cVFXalROMHFSSTR4dS8xWDFWM3NOek1wVzg4YjIwdStaT3dnS0VlVnhMU1Jo?=
 =?utf-8?B?cjUza0VtRDBueWh3elBWbVEzaGp6LzZhZVQrRjg1Mzh6ZGpVeVNKbE5leDFv?=
 =?utf-8?B?aG1CZTBpNUc4Vk5yS2pPWHhSK1Y4Wm01UUplUndWYXlGWXQ4NDNIRlJiUFJC?=
 =?utf-8?B?L0xtWmNPU01ROE5nWWJYU3JZN3lBQXVsSTV2REMvRko0UEdkcDY0UnVTMHFS?=
 =?utf-8?B?dk5yUjFYTlFFUDRqNWRnQmM2KzFQVWZLSGs4bUhCZlg4Wkh5QlZOWEtJbFFJ?=
 =?utf-8?B?UXoxa2JuZ2ZPQUgrUXhSOEI5K2FjSTJVVnhleUJicVRBbUM5aVJCMXJwOGE5?=
 =?utf-8?B?dUkrT3Q5THNYTkZLUytJMFZHSFk0c2dBOVR3cFFPemtWZWpSdVFLTWloS3J1?=
 =?utf-8?B?Sm91c2Zkd2h1ZThsS05yTk5nZDBEcHhuM0NoM0lJaTZPaC9Kc3RnbXhaZk9n?=
 =?utf-8?B?c0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 6IBE8psR+MfkKD5ZZetC2/ZZiynP73P6JGkDzktRixzCNAAae6nBZ5bv7Vv1hOmb0iOC/zyQaNDnuVZZo8BkHiSsOe9EM0UALXcJjMst8tFImG+U8uYfyF9469c1+Mz9wOBninuFx8QdwY5RJe/rx4NDB3NgO2IKbNGfmQt93d/Yy+ynPlR6Xa/zN9ePUWgR12djVf46F4CHW9fOGsk1Z13/LWgvDQB9Mcbpl4oTDQO/n+27LIRBlibimX5IBs/flTFvkYjVmr8d0UqH50wqqXAMAXyEnGkAYBsUzkzMedv3XUULVRIUtE/1AcgIz7rBy1fcKbZvVQSIXkJBOKWoScK2O9m4NMwiFVgaX83UXJD0Pnd01jR4G7Dok2qTX5dLjO5/d71bPJvUt8NuDf13WRPx+1rZM51cQEKu9gqtb0H9F7K3vmopRSnDfBAGBneFiUf8qh722LvvDorV535huYXm4/DgDHAd7ifuX9tYs3rcXzUDCKB1h+HLLgxWwSGfVaulnw22B3X9M1pC7vTBeH9Hd3X/IBuy6s/1hYJRC7vFA4ZfkApFsyIa2MSXefhzwIhgK+RxZooUt+mDmSzJDlKCvw9t1CBYQ1kZ/iroY8o6LEIhEy9DZ0XfaJIrZ7p045L62fB22C2OekmfpWgOO95TW9gGHzRRZ6glu1YedYZHrdj4THWSWyF1d8BK835iMj9fZOLK5lGdrJy4U2Hc3brmgXMKc7/uLZ+QZtvrAN8JGKIJb9CdSUPd6MxnT+vn04BBUEGMrrHvr/mzabllZVPOqpvs5MLopIGQK60ymvsMxATzBstNaIO7MqQRJSAa
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aecca285-535f-444d-7779-08db1ef70f06
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 10:31:06.2769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m6+4i6OKXh33eZQOqZg61l1Za8axwmfZ4YFgnBmryxWFbvMKeUJPdk6OxsNJ/3tYk0YPLjRucYF79b7xYY9usSTqziTZry0fWuiD2V2R/nQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6455
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-07_04,2023-03-07_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303070094
X-Proofpoint-GUID: HYrqiu8b3eg_ZKVsddAp2tX3aiZXo0i9
X-Proofpoint-ORIG-GUID: HYrqiu8b3eg_ZKVsddAp2tX3aiZXo0i9
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 07/03/2023 10:08, Cédric Le Goater wrote:
> On 3/7/23 03:57, Alex Williamson wrote:
>> On Tue,  7 Mar 2023 02:02:52 +0000
>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>> +static void vfio_dirty_tracking_init(VFIOContainer *container,
>>> +                                     VFIODirtyRanges *dirty)
>>> +{
>>> +    memset(dirty, 0, sizeof(*dirty));
>>> +    dirty->ranges.min32 = UINT32_MAX;
>>> +    dirty->ranges.min64 = UINT64_MAX;
>>> +    dirty->listener = vfio_dirty_tracking_listener;
>>> +    dirty->container = container;
>>> +
>>
>> I was actually thinking the caller would just pass
>> VFIODirtyTrackingRange and VFIODirtyRanges would be allocated on the
>> stack here, perhaps both are defined private to this file, but this
>> works and we can refine later if we so decide.  
> 
> It is true that vfio_devices_dma_logging_start() only needs
> a VFIODirtyTrackingRange struct and not the VFIODirtyRanges struct
> which is a temporary structure for the dirty ranges calculation.
> That would be nicer to have if you respin a v5.
> 
I can.

> I would rename VFIODirtyRanges to VFIODirtyRangesListener and
> VFIODirtyTrackingRange to VFIODirtyRanges.
> 
Better naming indeed.

> I am not sure they need to be in include/hw/vfio/vfio-common.h but
> that seems to be the VFIO practice.
> 
I can move as Alex also suggested it. There's already have
vfio_giommu_dirty_notifier and VFIOBitmap as private structures. I don't expect
that this will be used by other files

