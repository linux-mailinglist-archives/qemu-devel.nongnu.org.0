Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCEE6ADB9E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 11:18:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZUOO-0001v4-VH; Tue, 07 Mar 2023 05:18:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZUNy-0001bJ-GL
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:17:36 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZUNw-0002SL-C4
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:17:34 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32783pY9023546; Tue, 7 Mar 2023 10:17:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=w6JZBYjp7gI2PFD36NAjwJzk/nrw7M6EHInzbZIGPEM=;
 b=sWGvnANnKlmFi86/t7dtFP0RqRZairG+p6IebiCoJJR4eehC/Wdymf6yiOtZNy6SQlUT
 2+V62Yg8z0/CMfxAu3owZ9IlEBrzNz8kJO74VbPDLDdzJJnKXzIVN7x2jOW3XT5KCjRt
 Hx4Dq03CDmEWOAbBwzuY7NdafyX1u/tBiZQV9YhuLwj5xgQxIeoZDKjE4rcaOjuWAR+q
 8tuDzQDeAkIaDYoS5XM67Xava8Nj68bdbwbYJ7WjBi053sjmEGO/yH9lx5reC/XCZe5o
 Csv9g/hZMWsGxrpuuaQ/tLdFzOPEfEKGS/Z1l/V3l2Hj+LCLw8BD9FWurms9JCeDjxZJ MA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p416wn5d5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 10:17:30 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 3279mwQN025189; Tue, 7 Mar 2023 10:17:29 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2044.outbound.protection.outlook.com [104.47.73.44])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4ttjsjkw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 10:17:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jcGcBvppj+fhd/T39agkbcdYv7vp6ftv0ex+wcVP2mJLp4EMWoHC4YHlHBWVmmUcd5K93TltmPFcptCKa5OMfSCMs3oRBq4LBUpsOSqGo8Hhpza7IUViywBHRoJAEjCgEVS5LKUahwTupShEfDPw8bVTloOaKvjYbdW4w5JaMykwXtU26Rj5yi+/+WdW5r2pilqms5RnYKe2bJZizvFdypqpFEXdqGSZUUQQ5Gh8SW0cxAFTVJjqlRu5eoEER5EgBm1F6Yp82ZpUBaX+hBsIzIDlTGcq21FCq5lvXBglXctzRDKB26jfIL+b7k9gKnc+g88ufsmGW1LiWsozkb7g4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w6JZBYjp7gI2PFD36NAjwJzk/nrw7M6EHInzbZIGPEM=;
 b=GnoI9gbYblkdLHvufqjSBBUJVfLJGJIWkJjUswiUE2xzLlzmPyLGSp5QR7avECjCZ0C4K/OioeU8wlOJHvsy9KFAu/rY5H4EUc+j1G/18jSVxCUNuEZYZXOFjC2qZt4ATkDHr+tUqE+WBCVcQ/G0Q6FOVitZnJrHszV09+72vLH0WNGrvJGYExdjVdKDrckLohsKdbCMGTHmieEmdOyLidy9M4/KgQ6whulzKGX0oAT3cALO6ByhNfv/FBX5mgLwUiOtDnazOAZV4Ax89vlM3sYjCDj0DYCoN0Ab/2j7sMDPF2MnWMz569nv6x62Ss1Br3foeT7Sp93kRc0nKl0/Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6JZBYjp7gI2PFD36NAjwJzk/nrw7M6EHInzbZIGPEM=;
 b=QYcQNpV+DJZxz5etQ+/Z5dN0t8mfb3b74DRZg/2DdnqntT4/joyF9FA13zJjlIAMOyuUisyTMAV0Uhzx3QuVyh9bcsARg5AQSt+3bx5bt38RNnjgiVaiFYB+vk+y4eNc+nCeXySvIshOdpcFr5WKQfduM12wCkyAK0GdaAb5rXQ=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by CY8PR10MB6515.namprd10.prod.outlook.com (2603:10b6:930:5d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.23; Tue, 7 Mar
 2023 10:17:27 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 10:17:27 +0000
Message-ID: <b97aa802-a042-8fcf-f72f-d8012ba12219@oracle.com>
Date: Tue, 7 Mar 2023 10:17:22 +0000
Subject: Re: [PATCH v4 04/14] vfio/common: Add VFIOBitmap and alloc function
Content-Language: en-US
To: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Cedric Le Goater <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
References: <20230307020258.58215-1-joao.m.martins@oracle.com>
 <20230307020258.58215-5-joao.m.martins@oracle.com>
 <e8c79254-2c28-4311-9c75-559c2d6e33d7@nvidia.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <e8c79254-2c28-4311-9c75-559c2d6e33d7@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0390.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::18) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|CY8PR10MB6515:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b55fb2b-0627-4ef5-414f-08db1ef52704
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6NTieH+od5l7VhU/S++es88Y2HybpkYE5Gvp9/L4q0V7W/8V4BYBgsd0ySrEjbbh1fBWdhCswkbqdOeL5Ejuw0Tq6IfL7W+u6Ei6BdRzAvcxtav5Pme45JDYzkmND0WFKV6zvptgDtnYuSvIpf6Oh1Bpd15RpdNpM6EAqR4pAmkd/bw49PZpKlVSkvDLwfHAGOVJev94X9U5zoUinnTLakI2/Dol/W0rlkA5p3HvnJqzslr2h7445cXr4m1mys0B8tP0lPd6+5fx1uWuwOfXPj27/dycpju6mQzhwuQg/P8K1NEaeWpaP2KG6Tr21lFN/2d3rur0Teq8iFm2Pm6dGQyMLQ5g4138BeoVM2CJ0KruN1EXLCgnDSQD55dBr132v92+GQDJmMIr3na6DsOGq2xYSchottIghzsGv73DIpqzxtQZqZsx10JhgutXmdlsrnbdOXodJk4LXfGHZt4aU3U8pGnPld98z/u+cFMSlU5dP/4fDz1pP0lHcF3FiGPXy7bizveD8+hAsegnuX1vgPr0uWflKDIemVdpv00zXZ/QCE3JvePfAKu0fvqrawLgE7RCzMvQEIo0gG1SIkSMUsvGKNUumRnf5NkR1TC/oZwcYWoJiw2KUB7h9rjnRmpO+kthU8jKVE432CeoQ6+BuR/zAwBP+u+Gr927t5V1fVcEoTqQyamS/vQQCp/sDi1gh085ctxab+VEIXVae2TPAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(366004)(346002)(39860400002)(136003)(396003)(451199018)(38100700002)(36756003)(86362001)(31696002)(4326008)(66476007)(2906002)(8936002)(41300700001)(8676002)(5660300002)(66946007)(66556008)(26005)(478600001)(2616005)(83380400001)(54906003)(6486002)(316002)(186003)(6666004)(6512007)(6506007)(53546011)(31686004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnBsa2dsdGZBeWpTSFF5QUZMNzdWNElINVBFZHk0dHJnSHFIa1JHYnBSQ2tR?=
 =?utf-8?B?OTRBcEorOWtiejBLNmF2KytLVUVtaEE0ZTNQRTlvSXdZajh4bU40alRMZXI1?=
 =?utf-8?B?YU5WR0NIc1V1UExXYkUwUzVEVlpqQXFHTk1tWWFtNXRIZm4zbDN3dDZRT01H?=
 =?utf-8?B?d04vUkZVVnRiN3k2TjhzSDU2dWRkTlNWdExLbFdySHROOWxvMlNRRjgrVi9V?=
 =?utf-8?B?TzdaT0ZBV0lSUW1FV0tHZFQrbGFMdUNSc3RiOW1jU0RmeTg1QUVNaDB1RzN4?=
 =?utf-8?B?ZENYSWg3SjVCZjBCZkNROUNpbTNCeG5iVXpiRnNiRFc1c0V5Z1kvMHBNdDlW?=
 =?utf-8?B?YnJQRnZEamV5aXlCQTF1dG5mTVlweXF2T1ZKY3NSaDNVVVFUalZMSzlJbzM1?=
 =?utf-8?B?ZXo1UzFCcFJqRFdaQ3VDSGRQWnFpR3RxM040RDFEQzErbFp1RkUxTDNZSGJV?=
 =?utf-8?B?bGhwMEMyai9lZk1PTEdvTGhLMzlDdnNkeDhLYzBOVmxhQmdCL3BJcWJaUlNs?=
 =?utf-8?B?ai95c3RnWkpVa2JOcnNMUzFKRThVY3RqajBDT2pLQ3lPelNXZjIwR2lLNHNH?=
 =?utf-8?B?M1JFaUhkZUlWVkVEY3RNRGhabmtNa3Bjc1Q3YURDSmxMNDVVdEI5MHFDdmVC?=
 =?utf-8?B?dDJoL290R1E1UVFGQnRqTkxWNTNFZWNyaHJGelJ0UEgwMjJXU001cFY1VkdH?=
 =?utf-8?B?UGtWYXdDbEZ3bVNTNXdORXBYMU1TY2F3bWlJM1I4eXYyUXhvN2lqelZLVXA4?=
 =?utf-8?B?V1krWHJObDBqOEJabmRZQU9mQW1taU4zZHliSmRKR1cySVJtMU5hSkNQRnVX?=
 =?utf-8?B?VkhKaVNNTXRUdlpGd3dMSTV0UzdSRHBDc2RUdG9UWTY5U1dGbjQwWE1ZWW8r?=
 =?utf-8?B?SEJoNzQ4eXBrbHZMdisvMWQrM3hVeC9KdnhadjU2Rk94Zm1EQ1crdDNuZWN5?=
 =?utf-8?B?bDFQdHZuRmdnTXBSSVNuSEFGVEZBd2xxODN5bGVWcWhWWU1SQmQ2bEh2aUpG?=
 =?utf-8?B?TmRJOU1NL0lZbi8yZHR1UW1zSlgzNlZwSlJEN2dZYmVha1F3VVlCVGRjOHdC?=
 =?utf-8?B?TXhlYmY5bWtpcmFlazhmbFJCS2duNjFzUFR3a1FmMnVxMC9nV1NBMmdDSkxT?=
 =?utf-8?B?L1FRc1lVZElsS0ZxTTRRbGd5QzljRG1TbzAwZThUbXJ1SUVBNzRISXhqNFhr?=
 =?utf-8?B?czZzdUNuZVdrcGp5clFOVnVpVVJLdnVPSWxndlZDN3hPTkh0dXQ2UXc5S01k?=
 =?utf-8?B?RWpUM1FUKzA2cEN0NE12S253bDgxSzcxMWxmRkRHNy9JTDFVVEhWL24zdWw5?=
 =?utf-8?B?czROOTdlZEo0ZDZRU3hnUTJwMXVleis0a2NJUXp2WE5qMFE2SHFMUE1mcng4?=
 =?utf-8?B?MGdaaEM0bnBrOVBkZ0Q0ZXg4ekxIRFNtZGJEaDFWUk5NMDVUM2czNWp4UUll?=
 =?utf-8?B?V0twSnNYYWJHMW5uTUkyVVNEVXNZZ2pZRnRubDRqZ05FS1N1MHBKNXdDYk42?=
 =?utf-8?B?cDFaRTZ4MjZkU29KOTdiVWlmcHh6ekhVNFJ0dUpoVWs0aGwybm9GVTZOWllH?=
 =?utf-8?B?MTN5a3dOS2RIWFZWT1U5VlJuaUNlU08vZ3pzWGUycWRtQnVwQUdjQk0xekFJ?=
 =?utf-8?B?NWRDUDc4TnN3REY0NzJlcGlOdmpWcnpyOFI0a2NpbnkyN2RyRXQwdkJweFhi?=
 =?utf-8?B?OUVyalBpZzJFM2Rxd2RuMHpVV1ByK0Z6YzN3ZXd4ckJxU3p0YU5xQnJjZzZI?=
 =?utf-8?B?ZHQzcUhKM2dpWUhFbXcrRzZGZDRVVFkwQzl0ZWx0dDdlQ3RMcWROdGxqRkUz?=
 =?utf-8?B?TDlseDFsN3lmTk5VUklnOWNSRGNqc3ZIRWlDVEdzQkFvNm9GTm4wdzVFNVNP?=
 =?utf-8?B?TTdFTmJhaWZEV05LR2lFSnNnR3F5RUdYZ29lTVVaODBZcDdDYVd0OUt2VU51?=
 =?utf-8?B?UW9Oa3FEWWFTSzdHUWFEaU16RkxxZHZ6Zy9wK3A4Wm5WNndkQ3NoOUg4aWJV?=
 =?utf-8?B?dXFDWUZYZzg0NGJuUi9WUXo2cXJpeDBGZk1DbGJhYU5ZbWhSandvMTZQRWhG?=
 =?utf-8?B?MTNOQnRrL2xUTVBxTm9QWGF2R1ZVb003cEhGM3o4bDNtSlQxY3RWWVJpM3JT?=
 =?utf-8?B?dVdDU3ZKaWdheXUwelFwU3A1UzFDRFh6c21yYU1jNnE5MGpvMTgveFVqK0lW?=
 =?utf-8?B?NFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Ab1jx+ZY4SmZD0WEc4yYGW6QXc4a1WoNWZ0LsCcygZzNNocdNz/jkflGc2XqR69OHIWwoPSiRZe6vPxHNAIjqriNHMCFbm5xiKQJ17aMz/RIsKQrYgAf5FMAbZiS49XAgSxGP9qXYkNwZG4bv1BBQTUExVzvaAZI07aCDGxM+g2o0CfwZo6v9cpOOO9/Ti3mus3zhJw3xMSnyQW/KGCVQkJDhgHuLtAg4uJ9cze/i6ZdZaG88K3H80Un8LDbjmJWoPidppNQ2mEtKMR+W2BgIiAotSCY//jQK4X0ZgbVZCaXUJ4DyGNJY8jNkYGYsaNIfG5/EENNfW1EvaiBWK/YCHKiCZnWSrhUkOJkk32pSIeGhMfE7Kf8o1MWh+utaFuWrzLdYdyeWrbDEC58gw64OOw/kZ6i64guVg97nX6KZ0NZMP105JvHWGtDToYXYWBF/QNa9PZxGNfzDHkR1qaYQKMdYVEWrb4DoKjilDHIFGZmGhdcMRqCOlBIHlykK1c6XiudhvEe3Ei2TbshMHtPy8BHoF4t0IE63GD2dosxE/3A4NQjtCVVKxyDaHfd2NvAzIIF5Vvh0I5gU+wVnH+KpH2zmbI58jkn381CbH4EH18pRsdohWGIMx9Gp/V8ORdIINEbvmf+pflKvFXD+ZzXgN6Tn1vFEkjTyCE4Yw6+ablECRgqQXYtF/cTR6A24TePDpr6E006RMA1QMXxUD2S4mcpye/BY04krjwzaNF5fzbulXLYl6h4B/nNKCBL+WoaX+8yOBmeF9BnJZnXhmREBd1KOqXdhISwgedChjn8reUMF0DKJZrtCb4ibq0+oeC+
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b55fb2b-0627-4ef5-414f-08db1ef52704
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 10:17:27.4874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a8IqlWLfZj6TkrOYs8XS5JV2yPcXZhttB+mzJVCcQ7ldmRdrsGCX1DF5SlL51eesELwOFMzA9FSd5cm1nfH97VfxUCUiMdYDtZceYeG89v8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6515
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-07_04,2023-03-07_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303070093
X-Proofpoint-GUID: vKI3VlQZdBXDvko-zW08XhwbsBj4e4ri
X-Proofpoint-ORIG-GUID: vKI3VlQZdBXDvko-zW08XhwbsBj4e4ri
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
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

On 07/03/2023 08:49, Avihai Horon wrote:
> 
> On 07/03/2023 4:02, Joao Martins wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> From: Avihai Horon <avihaih@nvidia.com>
>>
>> There are already two places where dirty page bitmap allocation and
>> calculations are done in open code. With device dirty page tracking
>> being added in next patches, there are going to be even more places.
>>
>> To avoid code duplication, introduce VFIOBitmap struct and corresponding
>> alloc function and use them where applicable.
> 
> Nit, after splitting the series we still have only two places where we alloc
> dirty page bitmap.
> 
> So we can drop the second sentence:
> 
> There are two places where dirty page bitmap allocation and calculations
> are done in open code.
> 
> To avoid code duplication, introduce VFIOBitmap struct and corresponding
> alloc function and use them where applicable.
> 
Fixed, thanks!

> Thanks.
> 
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> Reviewed-by: Cédric Le Goater <clg@redhat.com>
>> ---
>>   hw/vfio/common.c | 73 +++++++++++++++++++++++++++++-------------------
>>   1 file changed, 44 insertions(+), 29 deletions(-)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 4c801513136a..cec3de08d2b4 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -320,6 +320,25 @@ const MemoryRegionOps vfio_region_ops = {
>>    * Device state interfaces
>>    */
>>
>> +typedef struct {
>> +    unsigned long *bitmap;
>> +    hwaddr size;
>> +    hwaddr pages;
>> +} VFIOBitmap;
>> +
>> +static int vfio_bitmap_alloc(VFIOBitmap *vbmap, hwaddr size)
>> +{
>> +    vbmap->pages = REAL_HOST_PAGE_ALIGN(size) / qemu_real_host_page_size();
>> +    vbmap->size = ROUND_UP(vbmap->pages, sizeof(__u64) * BITS_PER_BYTE) /
>> +                                         BITS_PER_BYTE;
>> +    vbmap->bitmap = g_try_malloc0(vbmap->size);
>> +    if (!vbmap->bitmap) {
>> +        return -ENOMEM;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   bool vfio_mig_active(void)
>>   {
>>       VFIOGroup *group;
>> @@ -468,9 +487,14 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
>>   {
>>       struct vfio_iommu_type1_dma_unmap *unmap;
>>       struct vfio_bitmap *bitmap;
>> -    uint64_t pages = REAL_HOST_PAGE_ALIGN(size) / qemu_real_host_page_size();
>> +    VFIOBitmap vbmap;
>>       int ret;
>>
>> +    ret = vfio_bitmap_alloc(&vbmap, size);
>> +    if (ret) {
>> +        return ret;
>> +    }
>> +
>>       unmap = g_malloc0(sizeof(*unmap) + sizeof(*bitmap));
>>
>>       unmap->argsz = sizeof(*unmap) + sizeof(*bitmap);
>> @@ -484,35 +508,28 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
>>        * qemu_real_host_page_size to mark those dirty. Hence set bitmap_pgsize
>>        * to qemu_real_host_page_size.
>>        */
>> -
>>       bitmap->pgsize = qemu_real_host_page_size();
>> -    bitmap->size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
>> -                   BITS_PER_BYTE;
>> +    bitmap->size = vbmap.size;
>> +    bitmap->data = (__u64 *)vbmap.bitmap;
>>
>> -    if (bitmap->size > container->max_dirty_bitmap_size) {
>> -        error_report("UNMAP: Size of bitmap too big 0x%"PRIx64,
>> -                     (uint64_t)bitmap->size);
>> +    if (vbmap.size > container->max_dirty_bitmap_size) {
>> +        error_report("UNMAP: Size of bitmap too big 0x%"PRIx64, vbmap.size);
>>           ret = -E2BIG;
>>           goto unmap_exit;
>>       }
>>
>> -    bitmap->data = g_try_malloc0(bitmap->size);
>> -    if (!bitmap->data) {
>> -        ret = -ENOMEM;
>> -        goto unmap_exit;
>> -    }
>> -
>>       ret = ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, unmap);
>>       if (!ret) {
>> -        cpu_physical_memory_set_dirty_lebitmap((unsigned long *)bitmap->data,
>> -                iotlb->translated_addr, pages);
>> +        cpu_physical_memory_set_dirty_lebitmap(vbmap.bitmap,
>> +                iotlb->translated_addr, vbmap.pages);
>>       } else {
>>           error_report("VFIO_UNMAP_DMA with DIRTY_BITMAP : %m");
>>       }
>>
>> -    g_free(bitmap->data);
>>   unmap_exit:
>>       g_free(unmap);
>> +    g_free(vbmap.bitmap);
>> +
>>       return ret;
>>   }
>>
>> @@ -1329,7 +1346,7 @@ static int vfio_get_dirty_bitmap(VFIOContainer
>> *container, uint64_t iova,
>>   {
>>       struct vfio_iommu_type1_dirty_bitmap *dbitmap;
>>       struct vfio_iommu_type1_dirty_bitmap_get *range;
>> -    uint64_t pages;
>> +    VFIOBitmap vbmap;
>>       int ret;
>>
>>       if (!container->dirty_pages_supported) {
>> @@ -1339,6 +1356,11 @@ static int vfio_get_dirty_bitmap(VFIOContainer
>> *container, uint64_t iova,
>>           return 0;
>>       }
>>
>> +    ret = vfio_bitmap_alloc(&vbmap, size);
>> +    if (ret) {
>> +        return ret;
>> +    }
>> +
>>       dbitmap = g_malloc0(sizeof(*dbitmap) + sizeof(*range));
>>
>>       dbitmap->argsz = sizeof(*dbitmap) + sizeof(*range);
>> @@ -1353,15 +1375,8 @@ static int vfio_get_dirty_bitmap(VFIOContainer
>> *container, uint64_t iova,
>>        * to qemu_real_host_page_size.
>>        */
>>       range->bitmap.pgsize = qemu_real_host_page_size();
>> -
>> -    pages = REAL_HOST_PAGE_ALIGN(range->size) / qemu_real_host_page_size();
>> -    range->bitmap.size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
>> -                                         BITS_PER_BYTE;
>> -    range->bitmap.data = g_try_malloc0(range->bitmap.size);
>> -    if (!range->bitmap.data) {
>> -        ret = -ENOMEM;
>> -        goto err_out;
>> -    }
>> +    range->bitmap.size = vbmap.size;
>> +    range->bitmap.data = (__u64 *)vbmap.bitmap;
>>
>>       ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, dbitmap);
>>       if (ret) {
>> @@ -1372,14 +1387,14 @@ static int vfio_get_dirty_bitmap(VFIOContainer
>> *container, uint64_t iova,
>>           goto err_out;
>>       }
>>
>> -    cpu_physical_memory_set_dirty_lebitmap((unsigned long *)range->bitmap.data,
>> -                                            ram_addr, pages);
>> +    cpu_physical_memory_set_dirty_lebitmap(vbmap.bitmap, ram_addr,
>> +                                           vbmap.pages);
>>
>>       trace_vfio_get_dirty_bitmap(container->fd, range->iova, range->size,
>>                                   range->bitmap.size, ram_addr);
>>   err_out:
>> -    g_free(range->bitmap.data);
>>       g_free(dbitmap);
>> +    g_free(vbmap.bitmap);
>>
>>       return ret;
>>   }
>> -- 
>> 2.17.2
>>

