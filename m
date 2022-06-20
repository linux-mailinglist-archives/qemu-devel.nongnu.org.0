Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2112552274
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 18:44:16 +0200 (CEST)
Received: from localhost ([::1]:45816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3KVc-0007VU-2R
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 12:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o3KOJ-0007Kq-Mp
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:36:43 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:52224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o3KOG-000742-73
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:36:43 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25KDDdik013011;
 Mon, 20 Jun 2022 16:36:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=f7N/FweRsW4TIMdP5hD3ks+w6qzigRkBBYUxlmu0wU4=;
 b=QZrJWTNsHGEc4E8NPgE1WPSWdhfA1NUvWaECSmo8goRKpFe7hENP6TTpFGWcpEZDONr2
 z/+w+qL7uD+5AdEAzdJDk8ruQOZ5uY0izNZ8fUfuzsWQaSSm2iu5lscFKfYQD1fcENuE
 zuBHXqu2DJnciQiWoD6qlOwUT+OVE8z/D6jY0GeFi4X0mVubBS93NcXLjZ0/KG9ZVgO4
 KYHKSebbIDwjgLChZdE2pFXlgJ6+TmSLhoMX9jPRzURCU4xv8wWaThAR9IzKZIaFqPSm
 duNClcrorpbgpQVQ5izJmqb3XTak+WvxUJhtFFhfNfc4Zf242BIzUnnO4I84EQFVSrRb kQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gs5g1ur80-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Jun 2022 16:36:32 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25KGKWsX034335; Mon, 20 Jun 2022 16:36:31 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gtg3ubquw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Jun 2022 16:36:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DTfPxmgIEZ/khnWFI40dEnekKwkLb9O0dwaHarYH7DpEJC0ZRMEOwcbW0pOpXKCGt4wCrOG7tQ9T6oQWSX9qoZzlKMQtHRhWyrRrbae8wZnpub3ANGyXH1R0Vgbt3txZIYqyUu8yvK9GwMRb40ZkvV5TFYwbIAk8bK+NVJiLN3aFqe0FrG09yjak5UY8FavHuDjA1MLRJMcoRonGYQpZbOWASDBPcrgucl6s7v4JF9G68ZdNGdrEVL8o7G1Eh9x8LjShaPSKCFXidiCH13fqhfI4ChnXgneM+ChehJTPhaJETPBy54+DmV/Kqg8JhFUAQRMztyfyYLBG+DrL0TQ4cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f7N/FweRsW4TIMdP5hD3ks+w6qzigRkBBYUxlmu0wU4=;
 b=YLFdfXV4/KY8sNTs8ug9rCi2MqOxsFvqCaYmrUKvhxplelmtA5TylgSCGQlNFZwhBTj75hFLNso+3d74VQgREJtlDInyB/0kACs+tdPuQ/um4YJ+ykLoEcZZ6yhdgw65/VNmE2a4msKtJiJL+wniHR5u9lP8+K1a3yHSuCEzIN9jLcUY4/naRCIeheeObjKPuyt2UFsAd0xqmXA8SkfvFh1yh0mlbXDe+EwyEBC7uQdQ4ujaLkbglqJ1DG52ZqagXSDtGUzyJSOPBxw81FEY/QcSW6h9cVI73e1YM+AX3WTpowxU6OTdgiX6aDHDlxmFQ1YJnNQj87WW+ukLeiAuBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f7N/FweRsW4TIMdP5hD3ks+w6qzigRkBBYUxlmu0wU4=;
 b=w1GfgqMp2AhYgShDNNb5PTvOpHOGoob9Q06DKdOi67kAzBtQIDv/s60ux/M7eXZ3L3gJFSEgw76YJ57ioFdwCJa96i2l5Nk0hLL/nfYNVd0nQHwuCB7W325yfBApIf2biLP9KxSU/rnNwUT8uN3ROqfIOuhnmWPojJsL1PMEHiI=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by MWHPR10MB1695.namprd10.prod.outlook.com (2603:10b6:301:7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Mon, 20 Jun
 2022 16:36:29 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e%9]) with mapi id 15.20.5353.022; Mon, 20 Jun 2022
 16:36:29 +0000
Message-ID: <07368ec5-98bf-20e2-71e6-c258370970fc@oracle.com>
Date: Mon, 20 Jun 2022 17:36:19 +0100
Subject: Re: [PATCH v5 4/5] i386/pc: relocate 4g start to 1T where applicable
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
References: <20220520104532.9816-1-joao.m.martins@oracle.com>
 <20220520104532.9816-5-joao.m.martins@oracle.com>
 <20220616162328.64138d4f@redhat.com>
 <bc50bb88-5330-a839-bd50-ca49b0edec9d@oracle.com>
 <20220617143251.5f064694@redhat.com>
 <4f3e051e-fb13-5860-b39f-5ace782cdea0@oracle.com>
 <20220620162720.2ea44444@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220620162720.2ea44444@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0254.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::7) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed270cdb-9aab-4151-fc81-08da52db068f
X-MS-TrafficTypeDiagnostic: MWHPR10MB1695:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB169517DB09CF0E8FC41352EDBBB09@MWHPR10MB1695.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ObB3oCQ6gky2+zBL5t1TD6UTzV1fq8yHVwciq4nQ+QDAL66N6wRVsPoDoOC2bKiPeuYG5oPSBQX9p1uC7E750I1HaiTbtl2t+2qM35i23a1O1xqHrbpULvwQioH+2O/+BIthQEIeAJEpL0G2IJ1B6TiA/fFOFXuAsDusFisgGiF7OY22AzveLpVqghraieDLZfRfyH8sjX+1bEt9+/HZMl7VrWnK2Da5OnUdgeiNYhMPIN+Ex01UySiu5zrMVsGVSVs/jvmFNdmXfLOnz+dyZ9mth9okyJHhdjozKVHsZ26mbLjjpeW37ON121CPFkDsxubotmztw7xxXebTEV7Ty/eLr8kZXzAKjl5W7EYHHDRTorc2C/pkIVJioiEyz0z7c77vKQmahIN+OCxaQCuNTwBQ2jDDV2sQSOW0vfVBnSfwIOG3xCyseoK2APBNxiLjXXzZO/Mx+QkiPHDPDumM0Fdmye1m/qL/mSDx87KJJZoTkHhXffHoRpsMNZWI/i1x4wSo1SO8KdLPcZys/D8ti7GpRjcAGKivmCNZOEO27xC17ujsadZ+5mZq2f52r3AIbI06Jw505kC/auIO/kp1mBH2iMATWPFTN4EtBi/WyScpMxj+Zeus4HiPG9uDYG4pA5crRVIO4kLsmka3SN1M3PRspVB5tQ8PJOH2tg5LaXpOruAFdbABjGWTGmTyNqlZN1MDB0wRFsYYGbXD/e7O1w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(8936002)(6916009)(54906003)(5660300002)(7416002)(6486002)(498600001)(316002)(31696002)(86362001)(8676002)(4326008)(66946007)(66476007)(66556008)(6512007)(83380400001)(6666004)(2616005)(186003)(26005)(2906002)(38100700002)(6506007)(53546011)(36756003)(31686004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEtJcDRLU1hMQmFIUzIxNmlJRUo0ZzA4eUcycE9TZ3RJOWdlOHRwVFlPaGtp?=
 =?utf-8?B?Vmo2UmZ3U1lIbjUxQ0dxWVd2VFVlbWx3RnY5Tmxhc3ErWlZ2Z2ZOQWtWZWdM?=
 =?utf-8?B?Wmo2aVVKUlBhWmhKZjVPdXVGdDdPZTBSZkw2S1VKbWozbGkxa3dRejRRYVMx?=
 =?utf-8?B?WnhiUmE3bUk1OTZHUW1QSFR2YzU2R1puTWlmVW5ucGNuT3U1bU5zaVhMUXo4?=
 =?utf-8?B?NXdNWHFjS2k3N2lORkdzdW9UVjVUcEtaNkhodWcydWQ0MEh5Yk95dUNJUlFH?=
 =?utf-8?B?M3FkeDZDZmIyRGlSUHhyTnZiTkJvd2trQkRhR0U1ZW45ZEpxamhyUHBrRURS?=
 =?utf-8?B?N0Y4ZFFaZ2RNdzVoSHJHeTdIMC9nU0xadHNqRGt4dHBNaE5xYzFxb1Q5d0ll?=
 =?utf-8?B?aEJXRFJVRzB6cU4wcWhJN0pSWGc5UVVXZ21TM0FFeWZxeFJwa0ZrTnVJVXMv?=
 =?utf-8?B?QXpaY0NaaVVCWjBSVDJRdXVXZDZpc2Q2RDdzVUQ3bkxJZVlRVDJKMGJmcVZN?=
 =?utf-8?B?Q205ZjcxTm1wVGluT01ERVdyUkxjMEdOK3BUdmNDOWNNelFmVHlONnBvZkxo?=
 =?utf-8?B?UzNTd0FrOUlwNnJ4MG9Wd2Q2V2RjQ3ltNlM5UnY4WjUzeDRwRFhUOFZNRm0v?=
 =?utf-8?B?NE9XMXd1ZFBELzNnWXkxYVhiYkMzR1JMM0I2MXRxM1V4bis2cG5YQnhLck0x?=
 =?utf-8?B?YzBDSG8yVWFwNEFHRnJhUWZuY0hYUzgzYnBUd1NaTlhHbzFCenk4bVBZSC90?=
 =?utf-8?B?dzdaVmJ3SXZaUnhXc0MwcmJyditiQWNxdWc0ZlVxSGd3RjBlNHRsSjdLWnJM?=
 =?utf-8?B?ODBKZ1ZGTE1Cb2FqdFNhVGlEeHB2M2w1Nmh2Zkp2NXA5UjQyTE9ReXQ4NHpG?=
 =?utf-8?B?M0RFa3poaVFRYzZYUGN6dlZETTFmOTZtSnlkUjBsVVA0MGRSb3YzZzh4R1ZW?=
 =?utf-8?B?STc4S004S1RqWFRCNnRDdll6NVh3Z1FvSkdCeHF1SDh1K0JhcWhYVncyV3E4?=
 =?utf-8?B?U2ZBclRXV2srRExER2doVXEzdkw3QWJGcXBCUEhwL3Z4QVMwUGgwNVJXK1VH?=
 =?utf-8?B?OHhDNHJxdWlha1gyZUlHS1JlMU1FendYZ3JxZXB4aDU2K0JMeGVoVEtNRkx0?=
 =?utf-8?B?UFNZTUpCK2hBMzJPZGNJYXFJWVBwOGJSTHIxck4zVy9ncTZraUJmd0R3VkVN?=
 =?utf-8?B?cG95SFBwVFZsazN4dEZvZ2JsNE81MVZ6YTNmdGloZy90aldYdllVRTBMUysy?=
 =?utf-8?B?MlBFSm5WVEJZRmZodG9FMEZ5NXZPazNiSVhFQmk5WU5lbVh6cVVmVDVhTm9X?=
 =?utf-8?B?SEg4TjRNVEYzZkRqOVZqSFhZb1BTQ0x1RldJZVU5ckxHQk1lOUk3M3o3dE1q?=
 =?utf-8?B?TklFS1VoNmpKY2g4eWZSbEVkZCtjTnMzbWRTTCsyMHJmMzE0NWRTOFVXenB5?=
 =?utf-8?B?ZFJRMG5QdEhZVHJjK3VrdzVYNCtFWmtnbmtVdU41RHE2dTlEQWwzbEZEU2tT?=
 =?utf-8?B?VE15Qy9MNVk2aWQyM0Zvb2dnSlF1S01QblAzTThBNWp2cHRYYUJBbEh1NEVV?=
 =?utf-8?B?QnRmYyt6ZzMwcGNqcnV1TTV6UjJhV0lwQnB0c1QwOWc5ZXp5M1RkNWJhQ3dn?=
 =?utf-8?B?THFZM201OUdOckRGK1NmUEc4SVV4M1BGeUJNYkpNYWh1QlV2UnFpb1I1NDlu?=
 =?utf-8?B?YTEycGwzUU5Mcnk4czBsU21OQkVmU2lSVzNqVHNCWTQzQlFKZ3VhZjZMTjZP?=
 =?utf-8?B?cTd3ZmtkZFhQM0ZnbHdEOWtCa1l1MmI0Qzh2dytjM25obFp5YnJRT3hVVXZB?=
 =?utf-8?B?UDV6eG12UlZSZ242MW93aUJ4NXhhRjExVVRnbklFUnQrbGw2VGxQUWlnWk1N?=
 =?utf-8?B?SXVWN1dTWGJvQzh4T2EzeU5QTzhlVHRxN1JxNEZaOTgwYW9CSFBWcHpPNlRz?=
 =?utf-8?B?MXUyZTgvUVZnOURvTlU0YXRsMk1Ka3dFQ3B1Sys1UUNQOWcxelFiTzRJS3Z6?=
 =?utf-8?B?Mi9JYTY0TTBPNmZYZ0ErTG5IRzVBeDhtRk16Z0hZdWFQNExuSmlyZFhkeHZh?=
 =?utf-8?B?WTFvSnJMK3djMW1uZWxhL1d3MHVOakZNMEZrM3BCTE1PQUVVZ3JRZnlsODcv?=
 =?utf-8?B?RlZ2bWVLUVBqY3VLTTFWZnBqSm9DWjhlUERVQStTa2ZHNnN3UmFRaDRSYzVT?=
 =?utf-8?B?QnFid0JwR2ZEcHpETU1yRGtnNVNlRUJ3UjJTWDdjRHN0VGZncFFpU1FBOE40?=
 =?utf-8?B?WkhQTG81V2RlU2FGOGFSOVdiZHRycTFxdzg5TnU0b2p5dUQ2cUlKTkVDbDFo?=
 =?utf-8?B?RkR3d1BrdE04bisyTHF0ekpyUWNQYm4yK3I4NkFYVVYzWUF1dWlrM2wrNGkx?=
 =?utf-8?Q?MtYrCV/sDxdAVxWQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed270cdb-9aab-4151-fc81-08da52db068f
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2022 16:36:29.0119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 48Q86oXWDytm/H+vCULgT+sT/G0tl4o6VLcZzf/AreOR1Qb3R38SPvMU6rNx3RlXPh6pclhohlVYNpshtLqZYRnh4HMPXtNUEuW9S4xyChg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1695
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-06-20_04:2022-06-17,
 2022-06-20 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206200073
X-Proofpoint-GUID: uTgOOBdJ2ZGVQKwiWHeuC4W8ZWsVJmAk
X-Proofpoint-ORIG-GUID: uTgOOBdJ2ZGVQKwiWHeuC4W8ZWsVJmAk
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
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

On 6/20/22 15:27, Igor Mammedov wrote:
> On Fri, 17 Jun 2022 14:33:02 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
>> On 6/17/22 13:32, Igor Mammedov wrote:
>>> On Fri, 17 Jun 2022 13:18:38 +0100
>>> Joao Martins <joao.m.martins@oracle.com> wrote:  
>>>> On 6/16/22 15:23, Igor Mammedov wrote:  
>>>>> On Fri, 20 May 2022 11:45:31 +0100
>>>>> Joao Martins <joao.m.martins@oracle.com> wrote:  
>>>>>> +                                hwaddr above_4g_mem_start,
>>>>>> +                                uint64_t pci_hole64_size)
>>>>>> +{
>>>>>> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>>>>>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
>>>>>> +    MachineState *machine = MACHINE(pcms);
>>>>>> +    ram_addr_t device_mem_size = 0;
>>>>>> +    hwaddr base;
>>>>>> +
>>>>>> +    if (!x86ms->above_4g_mem_size) {
>>>>>> +       /*
>>>>>> +        * 32-bit pci hole goes from
>>>>>> +        * end-of-low-ram (@below_4g_mem_size) to IOAPIC.
>>>>>> +        */
>>>>>> +        return IO_APIC_DEFAULT_ADDRESS - 1;    
>>>>>
>>>>> lack of above_4g_mem, doesn't mean absence of device_mem_size or anything else
>>>>> that's located above it.
>>>>>     
>>>>
>>>> True. But the intent is to fix 32-bit boundaries as one of the qtests was failing
>>>> otherwise. We won't hit the 1T hole, hence a nop.  
>>>
>>> I don't get the reasoning, can you clarify it pls?
>>>   
>>
>> I was trying to say that what lead me here was a couple of qtests failures (from v3->v4).
>>
>> I was doing this before based on pci_hole64. phys-bits=32 was for example one
>> of the test failures, and pci-hole64 sits above what 32-bit can reference.
> 
> if user sets phys-bits=32, then nothing above 4Gb should work (be usable)
> (including above-4g-ram, hotplug region or pci64 hole or sgx or cxl)
> 
> and this doesn't look to me as AMD specific issue
> 
> perhaps do a phys-bits check as a separate patch
> that will error out if max_used_gpa is above phys-bits limit
> (maybe at machine_done time)
> (i.e. defining max_gpa and checking if compatible with configured cpu
> are 2 different things)
> 
> (it might be possible that tests need to be fixed too to account for it)
> 

My old notes (from v3) tell me with such a check these tests were exiting early thanks to
that error:

 1/56 qemu:qtest+qtest-x86_64 / qtest-x86_64/qom-test               ERROR           0.07s
  killed by signal 6 SIGABRT
 4/56 qemu:qtest+qtest-x86_64 / qtest-x86_64/test-hmp               ERROR           0.07s
  killed by signal 6 SIGABRT
 7/56 qemu:qtest+qtest-x86_64 / qtest-x86_64/boot-serial-test       ERROR           0.07s
  killed by signal 6 SIGABRT
44/56 qemu:qtest+qtest-x86_64 / qtest-x86_64/test-x86-cpuid-compat  ERROR           0.09s
  killed by signal 6 SIGABRT
45/56 qemu:qtest+qtest-x86_64 / qtest-x86_64/numa-test              ERROR           0.17s
  killed by signal 6 SIGABRT

But the real reason these fail is not at all related to CPU phys bits,
but because we just don't handle the case where no pci_hole64 is supposed to exist (which
is what that other check is trying to do) e.g. A VM with -m 1G would
observe the same thing i.e. the computations after that conditional are all for the pci
hole64, which acounts for SGX/CXL/hotplug or etc which consequently means it's *errousnly*
bigger than phys-bits=32 (by definition). So the error_report is just telling me that
pc_max_used_gpa() is just incorrect without the !x86ms->above_4g_mem_size check.

If you're not fond of:

+    if (!x86ms->above_4g_mem_size) {
+       /*
+        * 32-bit pci hole goes from
+        * end-of-low-ram (@below_4g_mem_size) to IOAPIC.
+         */
+        return IO_APIC_DEFAULT_ADDRESS - 1;
+    }

Then what should I use instead of the above?

'IO_APIC_DEFAULT_ADDRESS - 1' is the size of the 32-bit PCI hole, which is
also what is used for i440fx/q35 code. I could move it to a macro (e.g.
PCI_HOST_HOLE32_SIZE) to make it a bit readable and less hardcoded. Or
perhaps your problem is on !x86ms->above_4g_mem_size and maybe I should check
in addition for hotplug/CXL/etc existence?

>>>>  Unless we plan on using
>>>> pc_max_used_gpa() for something else other than this.  
>>>
>>> Even if '!above_4g_mem_sizem', we can still have hotpluggable memory region
>>> present and that can  hit 1Tb. The same goes for pci64_hole if it's configured
>>> large enough on CLI.
>>>   
>> So hotpluggable memory seems to assume it sits above 4g mem.
>>
>> pci_hole64 likewise as it uses similar computations as hotplug.
>>
>> Unless I am misunderstanding something here.
>>
>>> Looks like guesstimate we could use is taking pci64_hole_end as max used GPA
>>>   
>> I think this was what I had before (v3[0]) and did not work.
> 
> that had been tied to host's phys-bits directly, all in one patch
> and duplicating existing pc_pci_hole64_start().
>  

Duplicating was sort of my bad attempt in this patch for pc_max_used_gpa()

I was sort of thinking to something like extracting calls to start + size "tuple" into
functions -- e.g. for hotplug it is pc_get_device_memory_range() and for CXL it would be
maybe pc_get_cxl_range()) -- rather than assuming those values are already initialized on
the memory-region @base and its size.

See snippet below. Note I am missing CXL handling, but gives you the idea.

But it is slightly more complex than what I had in this version :( and would require
anyone doing changes in pc_memory_init() and pc_pci_hole64_start() to make sure it follows
the similar logic.

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index fd088093b5d5..016bc65fcb4b 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -885,6 +885,34 @@ static void pc_set_amd_above_4g_mem_start(PCMachineState *pcms,
     x86ms->above_4g_mem_start = start;
 }

+static void pc_get_device_memory_range(PCMachineState *pcms,
+                                       hwaddr *base,
+                                       hwaddr *device_mem_size)
+{
+    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
+    X86MachineState *x86ms = X86_MACHINE(pcms);
+    MachineState *machine = MACHINE(pcms);
+    hwaddr addr, size;
+
+    size = machine->maxram_size - machine->ram_size;
+
+    if (pcms->sgx_epc.size != 0) {
+        addr = sgx_epc_above_4g_end(&pcms->sgx_epc);
+    } else {
+        addr = x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
+    }
+
+    if (pcmc->enforce_aligned_dimm) {
+        /* size device region assuming 1G page max alignment per slot */
+        size += (1 * GiB) * machine->ram_slots;
+    }
+
+    if (base)
+        *base = addr;
+    if (device_mem_size)
+        *device_mem_size = size;
+}
+
 void pc_memory_init(PCMachineState *pcms,
                     MemoryRegion *system_memory,
                     MemoryRegion *rom_memory,
@@ -962,7 +990,7 @@ void pc_memory_init(PCMachineState *pcms,
     /* initialize device memory address space */
     if (pcmc->has_reserved_memory &&
         (machine->ram_size < machine->maxram_size)) {
-        ram_addr_t device_mem_size = machine->maxram_size - machine->ram_size;
+        ram_addr_t device_mem_size;

         if (machine->ram_slots > ACPI_MAX_RAM_SLOTS) {
             error_report("unsupported amount of memory slots: %"PRIu64,
@@ -977,20 +1005,7 @@ void pc_memory_init(PCMachineState *pcms,
             exit(EXIT_FAILURE);
         }

-        if (pcms->sgx_epc.size != 0) {
-            machine->device_memory->base = sgx_epc_above_4g_end(&pcms->sgx_epc);
-        } else {
-            machine->device_memory->base =
-                x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
-        }
-
-        machine->device_memory->base =
-            ROUND_UP(machine->device_memory->base, 1 * GiB);
-
-        if (pcmc->enforce_aligned_dimm) {
-            /* size device region assuming 1G page max alignment per slot */
-            device_mem_size += (1 * GiB) * machine->ram_slots;
-        }
+        pc_get_device_memory_range(pcms, &machine->device_memory->base, &device_mem_size);

         if ((machine->device_memory->base + device_mem_size) <
             device_mem_size) {
@@ -1053,6 +1068,27 @@ void pc_memory_init(PCMachineState *pcms,
     pcms->memhp_io_base = ACPI_MEMORY_HOTPLUG_BASE;
 }

+static uint64_t x86ms_pci_hole64_start(PCMachineState *pcms)
+{
+    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
+    X86MachineState *x86ms = X86_MACHINE(pcms);
+    MachineState *machine = MACHINE(pcms);
+    uint64_t hole64_start, size;
+
+    if (pcmc->has_reserved_memory &&
+        (machine->ram_size < machine->maxram_size)) {
+        pc_get_device_memory_range(pcms, &hole64_start, &size);
+        if (!pcmc->broken_reserved_end) {
+            hole64_start += size;
+        }
+    } else if (pcms->sgx_epc.size != 0) {
+        hole64_start = sgx_epc_above_4g_end(&pcms->sgx_epc);
+    } else {
+        hole64_start = x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
+    }
+
+    return hole64_start;
+}
 /*
  * The 64bit pci hole starts after "above 4G RAM" and
  * potentially the space reserved for memory hotplug.
@@ -1062,18 +1098,17 @@ uint64_t pc_pci_hole64_start(void)
     PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     MachineState *ms = MACHINE(pcms);
-    X86MachineState *x86ms = X86_MACHINE(pcms);
     uint64_t hole64_start = 0;

-    if (pcmc->has_reserved_memory && ms->device_memory->base) {
+    if (pcmc->has_reserved_memory &&
+        ms->device_memory && ms->device_memory->base) {
         hole64_start = ms->device_memory->base;
         if (!pcmc->broken_reserved_end) {
             hole64_start += memory_region_size(&ms->device_memory->mr);
         }
-    } else if (pcms->sgx_epc.size != 0) {
-            hole64_start = sgx_epc_above_4g_end(&pcms->sgx_epc);
     } else {
-        hole64_start = x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
+        /* handles unpopulated memory regions */
+        hole64_start = x86ms_pci_hole64_start(pcms);
     }

     return ROUND_UP(hole64_start, 1 * GiB);

