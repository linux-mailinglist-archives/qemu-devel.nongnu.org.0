Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7383A6ADBFF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 11:32:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZUc1-0005eT-Qz; Tue, 07 Mar 2023 05:32:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZUbz-0005Vf-Qw
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:32:03 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZUbx-0004nb-Dw
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:32:03 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32783mF6016262; Tue, 7 Mar 2023 10:32:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=14jVXzOfimRrtPZN4eDVuC/QoqgdZS8zkSik+xEhHIY=;
 b=XL07D6Pu3/BZmkgX0c/KZz20+9tQ++qOFkt0ZACWEI/R0Wmenq5eYEkJdD9YVms1dIZ3
 9UTdG8e3dFjc2ZjUaZJs06b+FXkVsleSrP5HB7No3QWfA++9xdLDwALP4flLB1ePPHM8
 m+H/usYJehwoHZ7PLA5seoAuUCpDFkZaCZ8VVVn1pWG1sz59f+XXljq2Lv8uRsgcWlRX
 y9xtdFRpemQk1/XzTwZUVLWOebNH6PBqqJpiHsOvGKrGTXHszVjR+vn9EEiLeItMZeSR
 M1IinFiQWEsh0yqDNqBnnVO2ir6s5ru3aqByx1FW/BIhv1ufWkcboBD/wApF5+18WWLw XA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p417cd5y0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 10:32:00 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 3279hCMl015924; Tue, 7 Mar 2023 10:31:59 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4tur347c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 10:31:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LOX3ERL/0NJqBphoGWEZgwmBzh/7UGxfU6lu+Ok9uGYYh39ivjrzKj6D3eXRVwozVh2JvVO2DPthX9WL0JNDBq8ZCq5UlD1oWQ8YyXrb2neVWVD76qeNS7LPqAYi6HbjvCtikjGKDBiciDDwgYH73tmYBiSVWTSqzSQ3Wzm+3vru93wfymQrSh+hrgnduXqh+H3m4oIkDd/0NubOmeKR0bTafg/7O44SZFlV199rE1cxtwBk9YIiSN6CY6Q6evt2PF94QamIlR16XBxyCWZtfXtyvgT7+wrtTC1ET+sQNkj6Yh4gsg7LyhR0X28N7aGUFR/6AqiH2Psr1iZDenuvKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14jVXzOfimRrtPZN4eDVuC/QoqgdZS8zkSik+xEhHIY=;
 b=oaReflkrfy5aTPDu4c/y4NFoZJycnxn+BXoB8/PFrC6S/ZdcCBJtoBnigIQkVQ8qj9yD9rMUBjpaL8iaHp0yHy5MR83l+g5Cm6BZ4QhkQXB4BckY3nTcm/nOxKSE+PvnHR0pDL3GlsPKxeqcjMIa6AmzF+1pzqUyqp5nszKIAtZaocuvFqPKGKtymcjR7Tsjm1IEfy+HH1QfJ/xhFLHcJu3hBSsdZ1dk0ajpNgZAo3ae5QCWVf1w4iaK8n3JupAcMA//WNOaYvPjErU8yDdcH+PsJseulgTMuCG7tiDMEVeQ4PtLyKFwRfqYAX8hSaV2XbbIBQ1Fxy2lKnxnWetI0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=14jVXzOfimRrtPZN4eDVuC/QoqgdZS8zkSik+xEhHIY=;
 b=BHc//ms1kogmPegmEOn3NA3l2VGR+JwbKZmZkAQ4/XvBcGGXbdn2yG59LLY52YpcjMQmPywP6YcKreLWIHu7chAjhf6QOrtR//ODYbYAjyWWjChfwlmaYv9GRnZjW6sfGNX83nGx1agKuOxPLMHgilFEwTI1YvJrOiep6dtJHEc=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by PH8PR10MB6455.namprd10.prod.outlook.com (2603:10b6:510:22d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.25; Tue, 7 Mar
 2023 10:31:57 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 10:31:57 +0000
Message-ID: <b0b4e721-ad85-9fac-de89-a5209e22117e@oracle.com>
Date: Tue, 7 Mar 2023 10:31:51 +0000
Subject: Re: [PATCH v4 09/14] vfio/common: Add device dirty page tracking
 start/stop
Content-Language: en-US
To: Avihai Horon <avihaih@nvidia.com>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Cedric Le Goater <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, qemu-devel@nongnu.org
References: <20230307020258.58215-1-joao.m.martins@oracle.com>
 <20230307020258.58215-10-joao.m.martins@oracle.com>
 <ce61ce16-a171-a418-b634-96eeb3fc3004@nvidia.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <ce61ce16-a171-a418-b634-96eeb3fc3004@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0211.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::18) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|PH8PR10MB6455:EE_
X-MS-Office365-Filtering-Correlation-Id: d4fcbcb5-ab78-454a-24a4-08db1ef72d73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SQhcm3l4IF/nzCVPLDM+mUq0S38dKKRDhTSENnvhdkG4w0TJ3Ku3HL+I7IimlkHaiaBQ2wTmZhIOFtPIR9MBBiNnydy05tHFUyOwz9/Nw3gZGYoYkSvQj0GddntCrxQT+nq3VSKP5kOOHdDUO/fzEBqxsi2eZoWISTfiE5GouUIlzRPMGjBwnqc2yTF3aG3JHy6F0f7W+cEkfHJYaIrl7R+bdbVj2iQ5MvefsnSG7888QIhC/HoLIYmOT7h7SgljJapsTdtcSbE1Xl1aRMqYSQqZoDh7haroGw7ourlnMP6Dd/yJTj3mLgF3kzb5uDrFN4Pr+pz9KdM2BSpMWEz9fxSnYojJ8dHOA5gx0t6VmATpxs8FLjfkjlLu9GM73JatG0YFwE/7sf9bjmPEluxA3r2IUaBU9Z7C0dqh7rz+8r3Ilhkb2qQpYHr/sPdzZZQSWsnOF72Cj6Jje2QSAvty9c37JkbFeIy7uQl9EOUB0898+GqcgeTz4crbKXrdTvx0lYm/llBhLIY3S5Mtdz/mR2NUQ4V7f7GcaFaYDS8/voxwjHV3MAvgnhAoDY+cG9VZjAbasYypAQ7Hj7S2+7LOu5rNDVhBvXa/3muk1clruFW37uotZPte9XmQH/Pz5Hw9n4rVUZ1Awf4sRpzqBSHuuftlEz9YsM9qA8J9ZFuD4dXke9IUqLO2sMMsZPKpAFO4iMOHtwV41tlYILi94yfrv8x9EsyXTS7bExIqGKaM4IbV8kKMPH8bAfrogYFsB+Hv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(376002)(136003)(396003)(346002)(366004)(451199018)(83380400001)(38100700002)(31686004)(478600001)(6486002)(2906002)(4326008)(6916009)(8676002)(66556008)(66476007)(66946007)(31696002)(41300700001)(316002)(5660300002)(186003)(6512007)(26005)(54906003)(86362001)(36756003)(6666004)(53546011)(2616005)(6506007)(8936002)(14143004)(45980500001)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWFDWW5HMXB0UDVDamh3YXFxRlpjdU1MVUdQY3dDVFpQTUNTMFlaT3o1a1dC?=
 =?utf-8?B?VytHYzhGK1R1YXhkTDl1cjhjd2RqcGNEeTBoZGdtd1lCLzV6VjNubXBrM0lR?=
 =?utf-8?B?UkFKdmVJOW5kRjZFTlJVdjZDTWVTM0YxYjNGZjNyQ0ZsTTlNU01aVVBCcmFk?=
 =?utf-8?B?akhVdlBqeGFxanJvc0MwWUJDL2JDL0pVSHZYc1VqN2dTUk92N25QNFpHd2Nt?=
 =?utf-8?B?cU5oSkdKTHE2eHdmbXd4bmRjSFdhVUw4RkFwMUpLQlRFTis3bGVyb3VBdm5m?=
 =?utf-8?B?R1BKQnNBV213Ryt0U1h0bE14bHorNWk0U3pMTGtwa3RYL2plREQ2TWN2aVRE?=
 =?utf-8?B?KzZSZFlKclE2TUMrcVhGMXhQVGd6WTk0cUFvU0plQmVyVCtHaUE0WWxxRVh0?=
 =?utf-8?B?Yy9SVVU3K2N2dVVncE9HbUJwWlp1WW8wN2o1M0hZeFJOWXFFV1pCUnlsNVJC?=
 =?utf-8?B?U1FWc2FHRnBYZ1AxK2t6VWVOcElpeFdIVkVhN3pqSjRSS3NuWXhReXFhVzlM?=
 =?utf-8?B?bkNUV0FxZnBlZzJWYTJCNmt0dzR2eE1XbWRKS0EwVmV5Q2R5L0pCaFo3SzFj?=
 =?utf-8?B?cnpmTVBYOGVzWXhTZ0ZXb3pDczg5dG84WG5PT1BEaVhMTTlxclJTbTlUcndr?=
 =?utf-8?B?d0ZrelI0Z2p1VVgzTGE1RFlwNCtpR084TStibG1pWjJUaUNUODN1akFaVUE0?=
 =?utf-8?B?NmNvbzFJOWE3cjRtWlJxWjA0YUtFZVo1TWpNSFU4K00yUnlzV0lRV09EWndZ?=
 =?utf-8?B?YmwrNnBhQnFtNWNsOEdJczk3KzZOS2RjYmRTL3FMSVhhU3ZnTUZieUh4Rllm?=
 =?utf-8?B?SVkxa0trYzlhM0h2VHhCd2h2eDQyYmQ2L1BjK3hCbHNHNGIvNzhwYnh1REli?=
 =?utf-8?B?ZXBzRU5scEJzNWVyVXlNTFZCMzM2SmtXOFNzTGwxdzU1K2JzL3F2bjgrNmxp?=
 =?utf-8?B?bEVtd0pDVFlKSlR0c3ZhSC9NYXpsZzRKUEhSZHhBSkFlSW80Nnl6dEFyb1hC?=
 =?utf-8?B?dTFkcGF5TlhLbElLVHlhdnNtYVBBdWdyRm5EeTFjREQ0cWFMTFl2SkEzSms5?=
 =?utf-8?B?OWkyVHR4aUxjZ1ZZUGNsa0VkRkJkeDlzNzEwOXkyTG5sZ0p5UW50c0dvZkdJ?=
 =?utf-8?B?ald5eTJjNmdsc0xUY2RBczNMWUthajAwWFQ2TDlxOFFyTzdxWFpjKzR2VXF2?=
 =?utf-8?B?b0s0aWpkeldCTTR4YUhlTUJPYlhDYSsvcGJNNjRKYzFiN29WdFVycVVBR2dZ?=
 =?utf-8?B?RTVQQkl1czNPQ1BZVU9lSHFQODdZbDdiS0wxcHM1K3Z1QWM0eTYzdG9aZ2F4?=
 =?utf-8?B?OWhyaHhFZExIQVJWWlUvcVQ4S2VRempEOVo0Wm1BVWNGSm5JRTNJdGd6ZzRx?=
 =?utf-8?B?UllLSEtHMVZBaTQ1RUcrb0ljemRsYTUwTkxIV0ErVTlBNEQrN0RHY3VkRlNh?=
 =?utf-8?B?Y0JKT1ZUcS8rZ1pTdEcybTJsM2NCNkN0TlBSTmZKejFLeGJnOEFybHl2T2RN?=
 =?utf-8?B?MExsUkg2TGFVNWpiMTkrRHAwQy9weUEzUkNYU25Rcmw0WDROamsrdUg3dFQ0?=
 =?utf-8?B?RE1aYlNydWJ2RzZ3azdBa3RwNEdsREM0TXJZQ0JVeEJpd1pQakZvV1U2R0xn?=
 =?utf-8?B?TnVTbkNIR3pxc2N1Z1kzUm9ZK3JldU5VbmhYYnVsa0Q5b0ZRUWkzTEZQZXhx?=
 =?utf-8?B?UXRqeUNvR0Yrek1kQ28xZmc5QUYrV0lYdjFiaGtjZWdQUUZPVVlpUTFlenRV?=
 =?utf-8?B?Snc2a3ZyWE5qS0p4dHpUYUwwZGdnQytVcy84aW1HZXY0Rld0N1hOZEhTaUdh?=
 =?utf-8?B?SXFlZVZhbjN5WWszOVRGQjZpdTZBYVQ1Zjk1TldxMmtSbmtHTTNEKzB4b0tk?=
 =?utf-8?B?cUM0aHFERVFHYXZwUUVaNFpEYW0xZDhiNVJaTjdJWng3eFdjVEtCc0c3VVpl?=
 =?utf-8?B?UDRZaGVHdkt5NjhoenJOenRmbGQ0bjE1NW11OHAwYjF1eEN1cWVMaWJUQk05?=
 =?utf-8?B?WFZZWE5XWVVIUzhOVUpHQ050Zms3NzBCR3ZWeGcvdE90aWZlTmNEWXJkZmdx?=
 =?utf-8?B?bVFZMkdiVUh3RkE4MENQekQ4VGtmSThFQkhsSG1JeHQvL3dDak45NkxwZXRt?=
 =?utf-8?B?aXNVK3ZFRE1SNU9vUTNmY3FmTS84am1VUlNreHhDYjV6WnZSWVNaS0gzd3JB?=
 =?utf-8?B?RGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: YtrxSmPdHtfcIzBXU5NAKgOy8prRf6cVkjOCS9/BSkTpVjeLuwA6G23kUbjbr5atAJg4RRohRDob2/+64RUwjNTLar8HWDJVO79zTbXHoQgFeRcm6ZaGqrS7a9/7fgokDh3ig0sX1qJiPVfFm3u8WG/7Xp/97a45ee1ZaXkfy5FxaATwLSiRg0SzgLbKxIsQ18NxwrJAzc7EeHbsrlG61/bkQIkJHWk4F30ENu3jkI4EQQW4yTQXVaW22SUBX1ihsAkDHpsNpGnzULx1OtHUeX+cgnpTut9dEopWHRNYaFbCwGVjEhqcEoqzz1NN+wRSykrEqvfTcPIpvo2PQqjYuyba0UxSZKuLoMcLr4kxTbsCYrGKJgV25UPowAnnYjHB4t6ZqMYLtLjFGnutj6XX9933lKMj+S533iNCCa+1LpDU5nN/EM/dnvsWmmAFsIOCCIiPusKsg4uA4cBPuhmIPfNzOeyzT89/A5E9wB+Os4nMBLvQJuo5540/t4O/2T6Eqv7w1+JfgOaYLfrpvezWhvcYUwYUbgDJIvtmB059ZmPaYxiSZIrtbm72oOkzDKjz+X+PskgyRa1oCGJdYzhVHapEF69lQv34V7TQ7qu4mGkpLdZN85GiY/JQQU88nr+UgtVsUv9wfqC8FMiVtWwucU9hnvsHUuWibjLepL/NC5vjvKu6cbmyO51IuXKSh9qiJTiMIHeEdDD8xQmCYIYJO0cN8o4GXJDrAYeGVtHuC8mvwgp72TcLbzIX726FIitdcW2k7j8wwV8yujeNrblEdPkQlQMpE14URs9R+NmYLJBUlg949Lji0N4JZWup5p/1
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4fcbcb5-ab78-454a-24a4-08db1ef72d73
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 10:31:57.3207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XckFpiYLq5Ik3t95g/YOI9LBzOH1DmcVt31fGLfzoOtB0zTUdNEhWLhPYWwmuaw6Doc7SEJ/a+eaUbTJMWsontgy/6upPAu7/rw+AR6eTnw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6455
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-07_04,2023-03-07_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=987
 bulkscore=0
 malwarescore=0 spamscore=0 mlxscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303070094
X-Proofpoint-GUID: BznvMYxzD7yFfgzdUbv8Z2_-PoOWndSO
X-Proofpoint-ORIG-GUID: BznvMYxzD7yFfgzdUbv8Z2_-PoOWndSO
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

On 07/03/2023 10:14, Avihai Horon wrote:
> On 07/03/2023 4:02, Joao Martins wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> Add device dirty page tracking start/stop functionality. This uses the
>> device DMA logging uAPI to start and stop dirty page tracking by device.
>>
>> Device dirty page tracking is used only if all devices within a
>> container support device dirty page tracking.
>>
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> ---
>>   hw/vfio/common.c              | 175 +++++++++++++++++++++++++++++++++-
>>   hw/vfio/trace-events          |   1 +
>>   include/hw/vfio/vfio-common.h |   2 +
>>   3 files changed, 173 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index a9b1fc999121..a42f5f1e7ffe 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -450,6 +450,22 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer
>> *container)
>>       return true;
>>   }
>>
>> +static bool vfio_devices_all_device_dirty_tracking(VFIOContainer *container)
>> +{
>> +    VFIOGroup *group;
>> +    VFIODevice *vbasedev;
>> +
>> +    QLIST_FOREACH(group, &container->group_list, container_next) {
>> +        QLIST_FOREACH(vbasedev, &group->device_list, next) {
>> +            if (!vbasedev->dirty_pages_supported) {
>> +                return false;
>> +            }
>> +        }
>> +    }
>> +
>> +    return true;
>> +}
>> +
>>   /*
>>    * Check if all VFIO devices are running and migration is active, which is
>>    * essentially equivalent to the migration being in pre-copy phase.
>> @@ -1407,16 +1423,158 @@ static void vfio_dirty_tracking_init(VFIOContainer
>> *container,
>>       memory_listener_unregister(&dirty->listener);
>>   }
>>
>> +static void vfio_devices_dma_logging_stop(VFIOContainer *container)
>> +{
>> +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature),
>> +                              sizeof(uint64_t))] = {};
>> +    struct vfio_device_feature *feature = (struct vfio_device_feature *)buf;
>> +    VFIODevice *vbasedev;
>> +    VFIOGroup *group;
>> +    int ret = 0;
>> +
>> +    feature->argsz = sizeof(buf);
>> +    feature->flags = VFIO_DEVICE_FEATURE_SET |
>> +                     VFIO_DEVICE_FEATURE_DMA_LOGGING_STOP;
>> +
>> +    QLIST_FOREACH(group, &container->group_list, container_next) {
>> +        QLIST_FOREACH(vbasedev, &group->device_list, next) {
>> +            if (!vbasedev->dirty_tracking) {
>> +                continue;
>> +            }
>> +
>> +            ret = ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature);
>> +            if (ret) {
>> +                warn_report("%s: Failed to stop DMA logging, err %d (%s)",
>> +                             vbasedev->name, ret, strerror(errno));
>> +            }
> 
> Nit, no need for ret:
> 
> if (ioctl(...)) {
> }
> 
> And regardless, need to replace ret with -errno in warn_report:
> 
> warn_report("%s: Failed to stop DMA logging, err %d (%s)",
>             vbasedev->name, -errno, strerror(errno));
> 

I'll clean it up, thanks for the suggestion

> Thanks.
> 
>> +            vbasedev->dirty_tracking = false;
>> +        }
>> +    }
>> +}
>> +
>> +static struct vfio_device_feature *
>> +vfio_device_feature_dma_logging_start_create(VFIOContainer *container,
>> +                                             VFIODirtyTrackingRange *tracking)
>> +{
>> +    struct vfio_device_feature *feature;
>> +    size_t feature_size;
>> +    struct vfio_device_feature_dma_logging_control *control;
>> +    struct vfio_device_feature_dma_logging_range *ranges;
>> +
>> +    feature_size = sizeof(struct vfio_device_feature) +
>> +                   sizeof(struct vfio_device_feature_dma_logging_control);
>> +    feature = g_try_malloc0(feature_size);
>> +    if (!feature) {
>> +        errno = ENOMEM;
>> +        return NULL;
>> +    }
>> +    feature->argsz = feature_size;
>> +    feature->flags = VFIO_DEVICE_FEATURE_SET |
>> +                     VFIO_DEVICE_FEATURE_DMA_LOGGING_START;
>> +
>> +    control = (struct vfio_device_feature_dma_logging_control *)feature->data;
>> +    control->page_size = qemu_real_host_page_size();
>> +
>> +    /*
>> +     * DMA logging uAPI guarantees to support at least a number of ranges that
>> +     * fits into a single host kernel base page.
>> +     */
>> +    control->num_ranges = !!tracking->max32 + !!tracking->max64;
>> +    ranges = g_try_new0(struct vfio_device_feature_dma_logging_range,
>> +                        control->num_ranges);
>> +    if (!ranges) {
>> +        g_free(feature);
>> +        errno = ENOMEM;
>> +
>> +        return NULL;
>> +    }
>> +
>> +    control->ranges = (__u64)(uintptr_t)ranges;
>> +    if (tracking->max32) {
>> +        ranges->iova = tracking->min32;
>> +        ranges->length = (tracking->max32 - tracking->min32) + 1;
>> +        ranges++;
>> +    }
>> +    if (tracking->max64) {
>> +        ranges->iova = tracking->min64;
>> +        ranges->length = (tracking->max64 - tracking->min64) + 1;
>> +    }
>> +
>> +    trace_vfio_device_dirty_tracking_start(control->num_ranges,
>> +                                           tracking->min32, tracking->max32,
>> +                                           tracking->min64, tracking->max64);
>> +
>> +    return feature;
>> +}
>> +
>> +static void vfio_device_feature_dma_logging_start_destroy(
>> +    struct vfio_device_feature *feature)
>> +{
>> +    struct vfio_device_feature_dma_logging_control *control =
>> +        (struct vfio_device_feature_dma_logging_control *)feature->data;
>> +    struct vfio_device_feature_dma_logging_range *ranges =
>> +        (struct vfio_device_feature_dma_logging_range *)(uintptr_t)
>> control->ranges;
>> +
>> +    g_free(ranges);
>> +    g_free(feature);
>> +}
>> +
>> +static int vfio_devices_dma_logging_start(VFIOContainer *container)
>> +{
>> +    struct vfio_device_feature *feature;
>> +    VFIODirtyRanges dirty;
>> +    VFIODevice *vbasedev;
>> +    VFIOGroup *group;
>> +    int ret = 0;
>> +
>> +    vfio_dirty_tracking_init(container, &dirty);
>> +    feature = vfio_device_feature_dma_logging_start_create(container,
>> +                                                           &dirty.ranges);
>> +    if (!feature) {
>> +        return -errno;
>> +    }
>> +
>> +    QLIST_FOREACH(group, &container->group_list, container_next) {
>> +        QLIST_FOREACH(vbasedev, &group->device_list, next) {
>> +            if (vbasedev->dirty_tracking) {
>> +                continue;
>> +            }
>> +
>> +            ret = ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature);
>> +            if (ret) {
>> +                ret = -errno;
>> +                error_report("%s: Failed to start DMA logging, err %d (%s)",
>> +                             vbasedev->name, ret, strerror(errno));
>> +                goto out;
>> +            }
>> +            vbasedev->dirty_tracking = true;
>> +        }
>> +    }
>> +
>> +out:
>> +    if (ret) {
>> +        vfio_devices_dma_logging_stop(container);
>> +    }
>> +
>> +    vfio_device_feature_dma_logging_start_destroy(feature);
>> +
>> +    return ret;
>> +}
>> +
>>   static void vfio_listener_log_global_start(MemoryListener *listener)
>>   {
>>       VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>> -    VFIODirtyRanges dirty;
>>       int ret;
>>
>> -    vfio_dirty_tracking_init(container, &dirty);
>> +    if (vfio_devices_all_device_dirty_tracking(container)) {
>> +        ret = vfio_devices_dma_logging_start(container);
>> +    } else {
>> +        ret = vfio_set_dirty_page_tracking(container, true);
>> +    }
>>
>> -    ret = vfio_set_dirty_page_tracking(container, true);
>>       if (ret) {
>> +        error_report("vfio: Could not start dirty page tracking, err: %d (%s)",
>> +                     ret, strerror(-ret));
>>           vfio_set_migration_error(ret);
>>       }
>>   }
>> @@ -1424,10 +1582,17 @@ static void
>> vfio_listener_log_global_start(MemoryListener *listener)
>>   static void vfio_listener_log_global_stop(MemoryListener *listener)
>>   {
>>       VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>> -    int ret;
>> +    int ret = 0;
>> +
>> +    if (vfio_devices_all_device_dirty_tracking(container)) {
>> +        vfio_devices_dma_logging_stop(container);
>> +    } else {
>> +        ret = vfio_set_dirty_page_tracking(container, false);
>> +    }
>>
>> -    ret = vfio_set_dirty_page_tracking(container, false);
>>       if (ret) {
>> +        error_report("vfio: Could not stop dirty page tracking, err: %d (%s)",
>> +                     ret, strerror(-ret));
>>           vfio_set_migration_error(ret);
>>       }
>>   }
>> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
>> index d97a6de17921..7a7e0cfe5b23 100644
>> --- a/hw/vfio/trace-events
>> +++ b/hw/vfio/trace-events
>> @@ -105,6 +105,7 @@ vfio_listener_region_add_no_dma_map(const char *name,
>> uint64_t iova, uint64_t si
>>   vfio_listener_region_del_skip(uint64_t start, uint64_t end) "SKIPPING
>> region_del 0x%"PRIx64" - 0x%"PRIx64
>>   vfio_listener_region_del(uint64_t start, uint64_t end) "region_del
>> 0x%"PRIx64" - 0x%"PRIx64
>>   vfio_device_dirty_tracking_update(uint64_t start, uint64_t end, uint64_t
>> min, uint64_t max) "section 0x%"PRIx64" - 0x%"PRIx64" -> update [0x%"PRIx64" -
>> 0x%"PRIx64"]"
>> +vfio_device_dirty_tracking_start(int nr_ranges, uint64_t min32, uint64_t
>> max32, uint64_t min64, uint64_t max64) "nr_ranges %d 32:[0x%"PRIx64" -
>> 0x%"PRIx64"], 64:[0x%"PRIx64" - 0x%"PRIx64"]"
>>   vfio_disconnect_container(int fd) "close container->fd=%d"
>>   vfio_put_group(int fd) "close group->fd=%d"
>>   vfio_get_device(const char * name, unsigned int flags, unsigned int
>> num_regions, unsigned int num_irqs) "Device %s flags: %u, regions: %u, irqs: %u"
>> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
>> index 0f84136cceb5..7817ca7d8706 100644
>> --- a/include/hw/vfio/vfio-common.h
>> +++ b/include/hw/vfio/vfio-common.h
>> @@ -156,6 +156,8 @@ typedef struct VFIODevice {
>>       VFIOMigration *migration;
>>       Error *migration_blocker;
>>       OnOffAuto pre_copy_dirty_page_tracking;
>> +    bool dirty_pages_supported;
>> +    bool dirty_tracking;
>>   } VFIODevice;
>>
>>   struct VFIODeviceOps {
>> -- 
>> 2.17.2
>>

