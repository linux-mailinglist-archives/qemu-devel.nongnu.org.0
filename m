Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A034B74C2
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 20:44:08 +0100 (CET)
Received: from localhost ([::1]:33974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK3k7-0006Gy-AB
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 14:44:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nK3eT-0001m4-1g
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:38:18 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:54798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nK3eO-0007qt-KU
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:38:15 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21FJUV1B010578; 
 Tue, 15 Feb 2022 19:37:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=jr3Xb7xYsvB3XpLMNW3NXTpsnX+9cFL6T0aOSG9X0KI=;
 b=VI/je6YpLy5z7LdVLE3xJxCSKAkzPEzOf8KZOCrwH/nltJTiCjHqZhat7ROT29/0w4zh
 5LzJ/S85PQwMo2K4axHbO3MRb3+ZARFlLAraUesMfp2AFFSITYBW4T4YUoT2f7TMIQ/V
 W8cLhqS3IuKN82/guTbu3aSQZTDxHf83E9ESfxHqVxf8CJh+Cz1rye9VgwBx+zBR9sAp
 XXeOAakX0EGNpdHV0XiTtnSpkiEKqub3OLOs8hRRLUCk9rD8c+zFDpi3BKKgLkG8GXqf
 ZZ0PZ4U5qM9qAcuXt3drRXty0dy9JWgcCy6SsL2ebeyyachlXl2N76QYEvruvNWx4+EU vg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e820njxm4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 19:37:53 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21FJW6I2102019;
 Tue, 15 Feb 2022 19:37:52 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
 by aserp3020.oracle.com with ESMTP id 3e6qkypq6c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 19:37:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bWT0cZW79P8gm82wZ5HcWjJiVCK3QgP3oj41A4DckCIaZZZjrZmIqB5fWeovfXqgAIYCfGLQo58x5T20VifmN9lQJnNACewxnxv7xDubC9CkH0YusWHU22Cwn5+ZzQ+7UMT7vkWpsxrkqF8ZGWCaSOI5iKVv/FC5kAaNeh0k0bHSqxfc8ue8S3VXsG+JxTie25u9WuODC/jyOUqDt94nd1s7pXctoPoQbPHPbXAFm3ua84nIeq6kzxqlwZ5HprE47127iKc8KUnoxZylTgYEOOuhHDcekjI72B7xMsWCzzZTlryYBuLni/dV9HJrem8rjHRKNlg15c7Qel1OIW+1mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jr3Xb7xYsvB3XpLMNW3NXTpsnX+9cFL6T0aOSG9X0KI=;
 b=h3llU4h9CYUGZ28U04qPXazl42DqH827fxyTSWqru3ajPfV3PDHB80pG57uKi3MZ/7x+tfwMi9rdJ1v2eAc6oXAWwppZVdrqk7MazFq6HgONExs6RoAc8j4072jOaoyRU6UvaYdRyF2KSSyOfzxU9TJPkCMHZI3vDdkSrck+/WifXQlOvd5IlezjurIle4eE5m4lM/Rc5llJe4ALeoTizJazgoFiQop28odjfJGyCePF8l7z9hKT4SEBV4AvX5t0H5fSAhgwBv8MQU7zKQy/ODp2nmi5lDBa+CVfCcVNheqIR/5Z8h+Y7TScf6BGXbt4T4yxzAaask+ZmZyyTPsPpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jr3Xb7xYsvB3XpLMNW3NXTpsnX+9cFL6T0aOSG9X0KI=;
 b=r/GwqdbVS9TTN6GecoVEuaKtlq6L3ujpUH4C0N4bJ8kpeG7JEP1EK7a4iZRTS1WdG8x6GW4Dq7Zfots5dhQ+IKsR3ggqyPiWc6M8rIBaDtYZ3bEUckjttlkhPlnpn//yVA1IF7AtA81Tc/mqV0y6uamylrxLMJB+yVYjvOfuDxU=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by CH2PR10MB4166.namprd10.prod.outlook.com (2603:10b6:610:78::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Tue, 15 Feb
 2022 19:37:50 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406%4]) with mapi id 15.20.4995.015; Tue, 15 Feb 2022
 19:37:50 +0000
Message-ID: <8a0bcebf-117e-fe41-a477-4769ca94472c@oracle.com>
Date: Tue, 15 Feb 2022 19:37:40 +0000
Subject: Re: [PATCH RFCv2 2/4] i386/pc: relocate 4g start to 1T where
 applicable
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20220207202422.31582-1-joao.m.martins@oracle.com>
 <20220207202422.31582-3-joao.m.martins@oracle.com>
 <20220214155318.3ce80da0@redhat.com>
 <fa172a19-5db6-a844-27d7-8497d306024e@oracle.com>
 <20220214163158.4c4b210b@redhat.com>
 <20220215095358.5qcrgwlasheu63uj@sirius.home.kraxel.org>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220215095358.5qcrgwlasheu63uj@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0091.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::6) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15dc80a6-bc36-410e-4381-08d9f0baa683
X-MS-TrafficTypeDiagnostic: CH2PR10MB4166:EE_
X-Microsoft-Antispam-PRVS: <CH2PR10MB4166CD1E3AFDE80FE5F73B31BB349@CH2PR10MB4166.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KgpkRiUZAvSGCoSD0SCpdNB8OkZe6vGSlzh0SCOWKnsx2RfNGHs462v9bYPpisXC6FGzT849r6LKfwsMM6/CPs9HGqLhyhLJMeQ2bpEhw5I1OR+URKXdKXHqQxMGcfrogNtpNB6ZVLAE5Qi4LK828U48+VrvY1wW8Y9tle0WSCrlmcVjZL6p0zmEdHs4oa7Wajwd7pfgSNnf/UneYeZXBlDMyNZ86J75wx/qmG17QbbAUIjomqWF5rcaiXQ+iiMppD7UTDl+HxJk+KVn7ZAAdlRRm3UdnFJe/RUNTXBgg1PeDHWfKqn2P5+uwAurYmvF8WyYCiWCi8mtotNqz8A5KdeDIVe7f3uTDwF9+c+USZJEgyqAPDOFX4VJVkwNxxjSGGwxcYQhYg3i/W1/ihoOE2FScxJOXGBjgj9nXRdSa3uk1dslmV+kh7BdQONtvJrEHLHnk+8PKJbn4964C2bT6e/AmVF0MZ++WMprxApsi36Jr6E8WCiGKYHqlabJ8A0fipxIIKmkyz2hRFXe2cxcMU0gkfoQeY5hds6x8H59LDXU7XE8+VJpiHu2iJMJ1X0nSQSXsLX9bJQadojSavUbhYaBTAdtxvzk9G7Nb8MjLBg1MAdtYTDeM0sWZ1XXiHDUsVyUMASLWZaFBivP1clWd5HPznRL2woZ+TB2CJvXaZf2B7+8HA4HkzBpzib8RY8SVKZFdyXZqfNV6PyyPloRYw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(53546011)(4744005)(2906002)(6506007)(2616005)(26005)(186003)(508600001)(31696002)(110136005)(7416002)(6486002)(8676002)(36756003)(31686004)(86362001)(8936002)(4326008)(66556008)(6666004)(316002)(66476007)(5660300002)(38100700002)(66946007)(54906003)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjNmV0NlTS9QTFdscHRCUzdmTW9vYlhNd3RPd2xsNXJJQ2tGL2hMY0dzTFRu?=
 =?utf-8?B?eXRWOFhra3RKNEJnMDVGdnRVTFFWaFFOeVQzUnl5WmNsVDI3aXJRMHFvV3hj?=
 =?utf-8?B?bXNCTFpWRitaU0dBaWZLZlJybTJZT1RtVFg4WjZUQ2hsMkg2blUvYURlOUlB?=
 =?utf-8?B?VHhpcjd5U2ZhWEV1bVNLbGM4R3JJT1I1OSs0K2hpaFFIbTFPRUg3QVY1bGYv?=
 =?utf-8?B?cTlMMG5qUitsU2pJWlpOV1FOeVdsV2NTQkZyYXBqdUUxMlNUUEdxc2c5SkI5?=
 =?utf-8?B?ZVBidUIyTzFJSFJZeWl1bUxGc2NXS25aWFpiUjdqZFBQN0JRZmlsNk9rZ0c2?=
 =?utf-8?B?OSt6SWRGQTNjQnFuYmJScVNYaE9nUXJVVkNtQVlxSzB2Q2RGUGF6TWRYSWll?=
 =?utf-8?B?NWJjWi9UdVA4OWRXWDRoNlI3RWxaQTJmUE13cExmbnNFWkVQUUZFbkVMZ0R0?=
 =?utf-8?B?R0FrOGNES1gzTDVnNkZ6bzZ1ckVncCtIcldPaU1PczhzNktIQUNPa1NVSkRN?=
 =?utf-8?B?aEhTRVltWFdiYTllSzVpL1J6SjdSdnNMNWF2R0JUckdIR09nMGV2R3oxbWFB?=
 =?utf-8?B?N1ExYkk2S2FFQWdleW9YZE55ZEV2cko4WjUrZWpMT2Q2eUlTamxEOCsrR0Fh?=
 =?utf-8?B?eDFFL1RETFpEUmx1ZTQ4L2RPdEVWTkRuUmErODkxSDArZFlkVTN2N01BYmlw?=
 =?utf-8?B?d3VpenB5dmRsQmZkSXBGQUpTdjVJR1o0cEZhNW1VejVYWjRjU0FlL0ZoTEha?=
 =?utf-8?B?MGpiZzFiN0tlREx0RTFGR0NqUkVuSXpNVTlYcHUrUXJEK2J6aXNXejc0WUV5?=
 =?utf-8?B?OUlBeDBpQysxN2twaFpLdUVpdlFBaTBtY1NOdHFUcEQveTRQVW9aRkdnYzQz?=
 =?utf-8?B?ZFBpZjRsNUxxeG9LRjdRMi9Ja1VJTEEycWtTa2F6Nlc3Mmw3S3NlNDJyU25x?=
 =?utf-8?B?c0JzSE1XMXJ4NUdtVmtoalJEODIwYUI2TWNFRVJzUmJrdzJ0a0NsV1hkM3B0?=
 =?utf-8?B?Rk5jYXZPWXZSQmxIRW9LVkd0S0h3TzFxM3E4cTlHVDdlT3BtdDB5QXlVMjkz?=
 =?utf-8?B?NFllQlhkVXY0RnoxcmxFSTAxZXlFYkMyTmVMYnhydUluQXJKL3ZLRUJORks1?=
 =?utf-8?B?bStYcnVPbFRIZHMvTjNuQk5HTFV3ZDE4UzRHMlc5Uy9IejE5L080MTJ5LzlY?=
 =?utf-8?B?RkJKa1VaRTVteSs1M2NLVFRjVG1NdG5kOE44OW9INUtkZkxwMHJuaUNEdUlP?=
 =?utf-8?B?UTB6WHgwY1hzQW9nbXFJNVI3cWRGM0kyVVdFSEpXTGh2R2xPQ3ZSend6SkVp?=
 =?utf-8?B?V0FGMmFuN0pGYUthVUxlRWF0dnBSR0Y1NGU5UjFGc05FczRwYTM5L3Q3M0xG?=
 =?utf-8?B?SHYzbEVXckI1WnlwemhZcnQxelh6QUgxVkMwQllyWTNEOXdJWmhJbmt4c25a?=
 =?utf-8?B?UTZWRGtjY1hkWmd6aDA3SE1LT05tQVhUUUNTMzF1RXVpc2FRaDRKV1ZZRUdt?=
 =?utf-8?B?Z09tcGxHVmJKQi9ET0ZMd3cyYWVCSVkxVmExWENTelNBVHFRcnJGWlVSM2ls?=
 =?utf-8?B?NzQ4Yk0yL2pPYklxeUdkdURQQ2kvc3pQb3BiY2pwZWx5K0x1RENwOHdVcXU5?=
 =?utf-8?B?OVlNSm4zeVhmdFo4S0RsSlJ3Y1VWWW5xT3dwTmxvS0lUSGVGTXpNdVNvRWNY?=
 =?utf-8?B?UDJyVGJRSDNaUjd0MjlrUVhlY1hmZFFzTjE5d1FDaXlBQ094dG53V3NSRmNp?=
 =?utf-8?B?NmlXVnFIVlBkSWM1bU9JR2IxK0FLekF6cXk2enk1Y3E4RGdibkxBQjhTYU5y?=
 =?utf-8?B?TWQ2THcrRHdjM2ViamJ3RVpnNURBaENLVGIxVEVDZXpZTWtscEduUHJQR3R1?=
 =?utf-8?B?RFFQNC9wSk8vanNzUmdCUnFsZkhaNGpJWWl5elFGNVJDS0p1OEI1ZnpBdGxu?=
 =?utf-8?B?TStRRmFvRGdrbEs5clRXT0ovaVRsVHhxdlNiWjNneWFpYmgzSlBGMjRJSGVX?=
 =?utf-8?B?ek1CU081eUpETW9aaEQ4QlRNUlJ0VGZVUHk4cndneUxsVmdCUEpFdm9oY0xD?=
 =?utf-8?B?N3NzS1c2bFl0c2dWOFRpRVU2MzZpTDlvdE9PdllDUXovSkp2MlEzZmtwdE5F?=
 =?utf-8?B?TUpSL1ZpbURESDhHQWMxVGtWRlhCYm5LVEZUcUhoSFdIdGtIaHRrMGd0b2lh?=
 =?utf-8?B?SS8wQ1pZZ3MyMElZd0dxRlEyZXZGNUMrOVB3c2hkVGQ3Rld2QnVsZGJsYmlD?=
 =?utf-8?B?ZXNRcytkdHJLdEgrekFkdnpUSFNBPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15dc80a6-bc36-410e-4381-08d9f0baa683
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 19:37:50.1588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5cr9G5g4CCJwxlXrWimEoP3V5L1eZXbIsugqKYnsiLRGsB/1kloAFg44qAX01j/5S0banRCnrk+j84ZsM5mkKjN9Wd8yRT9/nEhyODvwi+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4166
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10259
 signatures=675924
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 suspectscore=0
 phishscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202150113
X-Proofpoint-ORIG-GUID: HHSRDOPD5EU4FrDQgq5JeA9rkEFN4CnB
X-Proofpoint-GUID: HHSRDOPD5EU4FrDQgq5JeA9rkEFN4CnB
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/22 09:53, Gerd Hoffmann wrote:
> What is missing:
> 
>  * Some way for the firmware to get a phys-bits value it can actually
>    use.  One possible way would be to have a paravirtual bit somewhere
>    telling whenever host-phys-bits is enabled or not.
> 
If we are not talking about *very old* processors... isn't what already
advertised in CPUID.80000008 EAX enough? That's the maxphysaddr width
on x86, which on qemu we do set it with the phys-bits value;

	Joao

