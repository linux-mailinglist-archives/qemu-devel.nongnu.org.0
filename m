Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B42B94C2E76
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 15:31:25 +0100 (CET)
Received: from localhost ([::1]:43104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNF9Q-00025T-Ne
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 09:31:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nNF6k-0000sU-Jr
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 09:28:38 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:59826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nNF6c-0003Lj-PF
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 09:28:35 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21OCYIaX000620; 
 Thu, 24 Feb 2022 14:28:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=0pGR0iiRaew6ERNbdJYsO8WWET0S6TF0WRidkUdvTCE=;
 b=YwkMd5HFz1X/gEWNwnZVb2l047LjApyXk5yzJ1J3eHhffVUN6N5cKuANtgWcVxTYp/SC
 +3p/Ilw10dHYi0XzfK64Nr+IIBSGTaPPI8ZwolYTS/nBuammh0L/KUFuEr/yaUYVk5v6
 2iyGMMin2iSg5QaQ/QHsQlfVTgP3/O3z1DJf+icifFbwMfyO2O1L0i+CkoViK02Oc0YB
 LRixxlHCiFDyaBlzKd/Dm0xtVto1vvLAyWDlyEzM1JwHcAGjigmBH8JZ6KjLGB/5+YiP
 DnIgmzg2z8sJfIk7XAPKTO0wVk90rKGiu1HVjsMgltQCI/+ANO/KpEGRo2VoU5M0hquj sQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ecv6eyceu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Feb 2022 14:28:11 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21OEEtBp117000;
 Thu, 24 Feb 2022 14:28:10 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
 by userp3020.oracle.com with ESMTP id 3eat0qv9ay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Feb 2022 14:28:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DqLC3RiP6i65+70oWwGNQhpw0GExGHTolBs7tQ7TPWFenNYBV+TtwQ44gdNpFoJQMPNiGYOooFxk0FSVK1EG7jbHeBdFgJ35gE/iEDyxT/H+vNVESampckAz6p8c5hZj15L8i6YKd1m6xztaXFgIe/Y4DeWJEBd6G1uZKTSS1PKHT/lOCAafbO8mkqm+PcvaXR+skFIZq6bKlNsc2T0yXRSOmGGJdi8fdDbwbTbaq4Y7NM7r5Psn8PKpBs4yGRQ/eUniZRxVLYFvuBHT1bHLFxEUCulVPjMRdf+HMo421RfHbmS2F5e4vs4iK23xidAd0eDUh26FnPVQ50YKeSBGCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0pGR0iiRaew6ERNbdJYsO8WWET0S6TF0WRidkUdvTCE=;
 b=Rbtd/HmPoaxmPhxTpf1Hto5fI/U6INcqplRGzZpo0wYKz+TE1UdeQqxOxLri0bldfnZda71Su9U7EaSqj6fcOGxtNHDBrs9M5eiJcsfo47L0BDjuedjL0kPR8aLl0JuCfYsBDb+Ku5hNspsuNNApiN2ybOD2GkhIWKHy1+YgxSiy2EkXjDfQLaHjaj/Sh42iSIWbhuXkoTHSr7MazIfZFvItpK8d8qPZXHICNDw4gKT722y9diphYeUSOjIIv2oRq6oEomPantJWm0b3ek6X5CRsw7PGbIlNctbZsFax0ELI65WjvOfvJj9vyaFH9jAS6MWoZz5fmaGj9BgBiQNv8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0pGR0iiRaew6ERNbdJYsO8WWET0S6TF0WRidkUdvTCE=;
 b=MugKpu+RAT8b+csift5dvjn4gjNVXhulRmtKto0xC2EvsjunSa1sfk85NFzASiv3MLasDShPKTvB/ejrrAb3VUZCPK6duVHNbwJ8ejhFZ+Hb2dGXCCSg9NQLYoKkIL2WDtEoX+3SM7WH3cHLOsmFGVQqgaE8Il5eR1wL3vEqj6w=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by DM5PR1001MB2361.namprd10.prod.outlook.com (2603:10b6:4:2f::38)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Thu, 24 Feb
 2022 14:28:08 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406%6]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 14:28:07 +0000
Message-ID: <38a57043-28e3-48e7-1d11-1f46f6d15e9f@oracle.com>
Date: Thu, 24 Feb 2022 14:27:54 +0000
Subject: Re: [PATCH v3 4/6] i386/pc: relocate 4g start to 1T where applicable
Content-Language: en-US
To: qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>
References: <20220223184455.9057-1-joao.m.martins@oracle.com>
 <20220223184455.9057-5-joao.m.martins@oracle.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220223184455.9057-5-joao.m.martins@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0474.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::30) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27001df7-e88d-46db-7db6-08d9f7a1e066
X-MS-TrafficTypeDiagnostic: DM5PR1001MB2361:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1001MB2361A9F1E19AAEAACC7C5F80BB3D9@DM5PR1001MB2361.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +w6r5L1dG9YYmCNFY2ca0zdVSk4MJMQ9hdW2dRUHoXieXEA+lulux8YNSgqMADWHJXLJjoiWfyPYNxaeBAOyLwgDvb5rLzjqMKEFuhwFxZJ4KLJ6INg4m34IvTvNz2OZUE1QR5IHsVnNha8xy3eILO5T8aE3Y98Wi4MpRjoGDs8SjxPeHfhlNQkt/eFY6GMnu5n4oqweTj/onKR71Kr2QseO2CXP9mEhXSOU5Srcyx803Xdf64ZVnO7n4PmH8l16q7YfD/EOm7X7Y8+z6uQRu4Idntqp9maKh6c/Lmh1+UfEfIrF0rAWUvsA8xjWTOPiNw/Sa7Vkro3zhD95Nymm38mS8BgBTiTl+Vhly8v8ESw/QKUZaUQZTmtmAfyjBkPaxJBHCu5TNPWhoGuiSqoKHqf1nu6V+cDt2U2nmCNiRqvPtR/Y65o3bq/w+PEqIG/oef6mYggg7lSn6CCk+qNVCMb0D+Npj0ard57F8tLHTpWf3keq1trBKW2YZYhxLFf4Wo8HejGDvbZWMUMgomg4tYlURbtoh1pY8nFkn7CR72WPN6vGT864eLlBRu9eyfeXed3UrxuCcRfnyTFp2NRfTSQBtiWg+7RHENE4JhjjoSIE9nQSdSaZXT+9o9MQurWoEin4EL+BYNimS5o6r79txuBEsmzeKNP32gLPneZLkZIcxD5WfWLJg7NSE8ubGcB+jmCFh9/ckiQ2AIi8rtFOWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66946007)(66556008)(66476007)(26005)(6512007)(2906002)(83380400001)(36756003)(4326008)(5660300002)(8936002)(7416002)(186003)(6486002)(2616005)(31686004)(8676002)(6506007)(53546011)(6666004)(31696002)(508600001)(86362001)(38100700002)(54906003)(6916009)(316002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VURUMHNMKzl6VE5BS1BCVXdtaHFJUkh6czJBOXcxeFJEQnJSVGhCaWdjQnRa?=
 =?utf-8?B?SDYxY0hibDRnNWtMRDdnZytveGIyUU1YVW5TOU9oWUxxOGFjRjVCWW5MSWh1?=
 =?utf-8?B?T0hGbDJWWCtuNDYwczlPTzRLZUU3V1lHVUhialNDRDB1Ymhvbk54dWEzemlK?=
 =?utf-8?B?NjcybW50TjNIZUVYa0JwTkpub0hkV0UvcCt5blQrTThnOGVudE55ZnRQd0hj?=
 =?utf-8?B?WWVnR2d2eFQzeWpzUHJoQUp4YjdaTGtlM2cyL2tMbjFWMVN6cVpZZjVxYURP?=
 =?utf-8?B?dTR3cGVBaVNxWHNNRjA3UytmaDhnNGM1OVVnQWpjd2YwYjlqSUd6N1kyc2Y2?=
 =?utf-8?B?NmpZNlpaNEZxQTBXQjNGTGVBcDRBcldFejhpYzVNeWtjMjhYeDBtSG1tMFdz?=
 =?utf-8?B?UFR4VUN1ZkJ2NE1yTXdMb1dxVjZQam9Jc3FpZWRxTFdmMU1CV3dUYnl4UnBC?=
 =?utf-8?B?NzhVaTQ1Wi9LamFyTGdOSEZiaWhkRk0xdWNEVnZVSGhGeWNBRFE5T0w4K05t?=
 =?utf-8?B?T0YrU0pDaTZDR0VFdm9UdmR5cUYvem04Yit6ZkljMTQxRWs1UmNHT3NrNW5v?=
 =?utf-8?B?cTdCcTNpTE1OSHVhS3Z1QUY3MUNHdG0yODJnSTlOUkpzWjJxcmRBMlBJbC9o?=
 =?utf-8?B?UUZxblN5S0p6VjFOK3hOQ0hoMUprRDB3bXR3TVVEZFlvZWs1SnBEYXk4UWVJ?=
 =?utf-8?B?azVBTElWNkRqbmFqdllxREdBRDFnaDJiNlVCN3VxKzVkK2lrVWQ5OXYwbEY3?=
 =?utf-8?B?c1FPRmE1NmcyTkJHeGNEZ3pqN2RKbldRRlFMTWludW5PV2VndVhRSDQvMkxS?=
 =?utf-8?B?ZzljUVN6QXBMZk10N2xQQ0Exd2tmVWtiVFpTM2R6K3VnelRrRlErb05GS0l5?=
 =?utf-8?B?aFpycEdqeHJPREhLbit5Q1RLQmNhOWdjWkFvMWphRkZSYWE3Z1oxQjc3RVg0?=
 =?utf-8?B?aWJDYVdPWGw3d0Z1TkpWMHhzRUhQaWIrdUpzUDlMT3ArRHVpYUU3MHVlWHp1?=
 =?utf-8?B?RWczM1liMklxS21oSFJzSWZvM3dzRGFNME90NjExdlRLRGxobnBaZFQzTGZ3?=
 =?utf-8?B?eGdjU2NyVDFxbjdFaENGbEtlOFJzSW1PejFSZFZNTWZyaUc3b2dKbGNBYUgv?=
 =?utf-8?B?WHpQL3YrZUtLTStBb25jRCt1QXJLREpjRkhSYitwcCtyWDdKS0V3b2tCMjlS?=
 =?utf-8?B?S0FtQjR6MGtaWFpEK0MzZGlHQi9ydG1zSUlKZEI1bTh2U0NZYzd0bHQwSmtL?=
 =?utf-8?B?THNYZlZLVUp1d0lJY0Z1czcwaHluM3ZKMzBPOERZWmRLMnBwY2xnNzRCQnBM?=
 =?utf-8?B?K1BlekdISDJZUDJkdzV3M05Eem5RZDI3TXhTNU5OdktVTWQyaWcwVjZtdmFV?=
 =?utf-8?B?ZnluU1NUNHZsV0xteHVDeUFFRW1zVmpkajY0YTQrYnZDUituSmE0OUJ3T0dl?=
 =?utf-8?B?QkRkSTdTRXZlM2toeGJzcjUxelhsQXNVUHFKM3lrWXhoTGh0VXB0TVd4d0d3?=
 =?utf-8?B?M3JLb0JMbWYvekVFck8wMUFYTUhvQ3ZNVWRtaFp6UEFwWDJTLzFPaDEzUEJ3?=
 =?utf-8?B?aUc3cUM3YUwrQ1BZWVc3UndteS81SnYxa01IRVNCb0pzL3duU1hvNVF1NUdV?=
 =?utf-8?B?R2k4eVhOTUhreHhWdTN6RGJRQ3BKczY5Y3loazY4RVM1ZEJBSVkwWWs3anpn?=
 =?utf-8?B?K0luelRWWEN1dFBldE5vOSsxMHlzSktHRS9QK0JpanBJK1gxM0kwYzFFWGN2?=
 =?utf-8?B?QzE3VGREcW4zUS9HSXBsVEhvVzNHMkJxOE1zOHhMQUllNmdwUFZvZHp6QlFp?=
 =?utf-8?B?UU9DZVV1ckRCRStqcmVuUzVCelBwY0tvS25nS3JNcS9WM3FOckVDdjJqVGpU?=
 =?utf-8?B?aWlOdmJoZHMyYjNNUVQzcmFpS2ZLMzlUb0MzazJoSUxoT29mZUZDMEJROERr?=
 =?utf-8?B?VncyQXRVS0JYQWxqY21uZk1xNEhta2t0WWdXZUdibHVKV1ZWQ1NMVzh4MERF?=
 =?utf-8?B?ZlBzQStmemRMVW1LOG5WOE0wMDhsQ0NuU1BtYm8yZ1gvWHAwd2NQWVBLWnRM?=
 =?utf-8?B?dzdYZCs5TGhNenYzWStSTzJTNE0vQnV6aTRVSTNCcjRxRUgxaUhZaHNBZXVm?=
 =?utf-8?B?ckcxQWNzbkFnNzQyM2VTTEFMclloTDZqQjdwMkZockN1SUwrMTNGbEdjYldE?=
 =?utf-8?B?V2xQVHpkN3gwb3RMejAyUWFCbVdRUG9oTUZBeDhndmE3ZEYyWXI3dGdYenNE?=
 =?utf-8?Q?tKhUj+OIi3xDcQzaSHAB/mp6Y2wJ0fsuVlcXmZrLxk=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27001df7-e88d-46db-7db6-08d9f7a1e066
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 14:28:07.8431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZmUsHib2NJ0qUL9fSNUfQUwa+1avas91xr/ylVuQMTpEttNqe+LuOsWuE2qio9xvTtLrBH1Y+QzzOK7M6YL4d5rX9X3tEYuWgTsQ+UwmjXA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2361
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10267
 signatures=681306
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 spamscore=0
 mlxscore=0 adultscore=0 mlxlogscore=923 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202240086
X-Proofpoint-GUID: F4jqR2rgOSmZTIJOY-Z556lrdr4ePKsw
X-Proofpoint-ORIG-GUID: F4jqR2rgOSmZTIJOY-Z556lrdr4ePKsw
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/23/22 18:44, Joao Martins wrote:
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 360f4e10001b..6e4f5c87a2e5 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -802,6 +802,78 @@ void xen_load_linux(PCMachineState *pcms)
>  #define PC_ROM_ALIGN       0x800
>  #define PC_ROM_SIZE        (PC_ROM_MAX - PC_ROM_MIN_VGA)
>  
> +/*
> + * AMD systems with an IOMMU have an additional hole close to the
> + * 1Tb, which are special GPAs that cannot be DMA mapped. Depending
> + * on kernel version, VFIO may or may not let you DMA map those ranges.
> + * Starting Linux v5.4 we validate it, and can't create guests on AMD machines
> + * with certain memory sizes. It's also wrong to use those IOVA ranges
> + * in detriment of leading to IOMMU INVALID_DEVICE_REQUEST or worse.
> + * The ranges reserved for Hyper-Transport are:
> + *
> + * FD_0000_0000h - FF_FFFF_FFFFh
> + *
> + * The ranges represent the following:
> + *
> + * Base Address   Top Address  Use
> + *
> + * FD_0000_0000h FD_F7FF_FFFFh Reserved interrupt address space
> + * FD_F800_0000h FD_F8FF_FFFFh Interrupt/EOI IntCtl
> + * FD_F900_0000h FD_F90F_FFFFh Legacy PIC IACK
> + * FD_F910_0000h FD_F91F_FFFFh System Management
> + * FD_F920_0000h FD_FAFF_FFFFh Reserved Page Tables
> + * FD_FB00_0000h FD_FBFF_FFFFh Address Translation
> + * FD_FC00_0000h FD_FDFF_FFFFh I/O Space
> + * FD_FE00_0000h FD_FFFF_FFFFh Configuration
> + * FE_0000_0000h FE_1FFF_FFFFh Extended Configuration/Device Messages
> + * FE_2000_0000h FF_FFFF_FFFFh Reserved
> + *
> + * See AMD IOMMU spec, section 2.1.2 "IOMMU Logical Topology",
> + * Table 3: Special Address Controls (GPA) for more information.
> + */
> +#define AMD_HT_START         0xfd00000000UL
> +#define AMD_HT_END           0xffffffffffUL
> +#define AMD_ABOVE_1TB_START  (AMD_HT_END + 1)
> +#define AMD_HT_SIZE          (AMD_ABOVE_1TB_START - AMD_HT_START)
> +
> +static hwaddr x86_max_phys_addr(PCMachineState *pcms,
> +                                uint64_t pci_hole64_size)
> +{
> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
> +    X86MachineState *x86ms = X86_MACHINE(pcms);
> +    MachineState *machine = MACHINE(pcms);
> +    ram_addr_t device_mem_size = 0;
> +    hwaddr base;
> +

I am adding this extra check for 32-bit coverage (phys-bits=32)

+    if (!x86ms->above_4g_mem_size) {
+       /*
+        * 32-bit pci hole goes from
+       * end-of-low-ram (@below_4g_mem_size) to IOAPIC.
+        */
+        return IO_APIC_DEFAULT_ADDRESS - 1;
+    }

