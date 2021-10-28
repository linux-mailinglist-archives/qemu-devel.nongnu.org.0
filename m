Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 548F143DC83
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 09:56:23 +0200 (CEST)
Received: from localhost ([::1]:38002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg0Gr-0005o5-T4
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 03:56:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mg0F8-0004zA-VL; Thu, 28 Oct 2021 03:54:34 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:6866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mg0F6-0005K6-4x; Thu, 28 Oct 2021 03:54:34 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19S7aroX027763; 
 Thu, 28 Oct 2021 07:54:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=C4LT1kYWTzJZwr9JvY0acY+y08hwaZuLVsdPL3UPFbI=;
 b=lYn+/6DBMMWRwynAHZZqoBduKGkQf80bBfQid8iULn6AX1nhuBsJSwcK6FhSeij/akeL
 2cJftHceYtJaUOlKSplQISmKzLDLoletiKrK7mphrLi3ed53pyhMMX1edluCfMQd4hBT
 mNN0H/inw0cf84Ltb7puIljHX3sEnqarnAwPNoExeu1wSpGcablmom4/j+OHmqxBPjud
 QHwmkDLnIIp2/k03XRFmZ1+KED8c4MQ7aHVulozWe+w37SQLFFWOaTsSfVTFQqh1yFVj
 DnP+xhjCayNBzPiIozbyeZmYHus7ZQBZBcuns3ntVvXRFT3V4QWhl1Vyx1EN0Y3FVnnA Dw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3byjkf0yu7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Oct 2021 07:54:12 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19S7pgsh141710;
 Thu, 28 Oct 2021 07:54:11 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
 by aserp3020.oracle.com with ESMTP id 3bx4gdwwpf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Oct 2021 07:54:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JTQMRmHJzU5e0G6847EjjOFrem8iBildEdGFlop0++UfL830zFBWackzjE7dSN1sPtozT66TKSPZKRaMjSRFXu8vVkJ7KkP/1VdBbW/tLDVyR7Pj+QF14l0jYoks9Pu4C5l7ezm8qAAX8WoKPgt6iWj8H4ci4K30OFM3/8HMd96lKpn+V9HOsZsuL7mptB8OhVU1wQshqdcGv3eBfGihVNlgXju6x+zMMNYa333ibnt7m67MUoaBaWVp59N2hO4rkS7bu+FwRCAqIA8yeNjzx8TPfQCbh5j/381vUILF0BJUHnKMaQ7SvkuD3h5gRUYSeJExr4jMbX1iiVOQeDpE8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4LT1kYWTzJZwr9JvY0acY+y08hwaZuLVsdPL3UPFbI=;
 b=Iqnm6V5//UOEerlqKN6WqXG6cxEMi7t2AnSOt8NA7ExoNK/QFndYqogHTLdeO7E2jgU84TpShKWPNwZVxUWhfaY6WqN//eAqk+1UTxcWy8IPAhIGh7ZdLf1v6dKs33IHlOBnu/qkxua2KEK85qrlJdl9Qk6oqOIqBC/jNJLF3quhbPriPW32x/TVZQVRpbyelIoJ3dh8/RPd3ajyJXwJsW2TrFcGOJQqRkO52nuhQS2RjgTzzoX1wAc010tu3n2e5AyT2Z2AxNjfRJ27ReLHUn5FLh0lnlAcFMHalFi1xOGTwhu0gnQXz0+D8YrhBYMtxM4j7XQAXr4NZglX52L3aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4LT1kYWTzJZwr9JvY0acY+y08hwaZuLVsdPL3UPFbI=;
 b=e8BerfjCRuYRirgCc2kUFS0Jj38JH/fnmyuguWNaKtzn8p+Nv1NKUIoakzfbJZCI0H8hj0oXSN1NUBhtSgdJ4seqAehFgtjZe9lUim4ynEKFvNyLTL/fHkYSejS5hI8socYMBu/daYoEGGgmLTZ1D/zP9fwR+UrrzMkuS4OS7VM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB5896.namprd10.prod.outlook.com (2603:10b6:510:146::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Thu, 28 Oct
 2021 07:54:09 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517%6]) with mapi id 15.20.4649.015; Thu, 28 Oct 2021
 07:54:09 +0000
Content-Type: multipart/alternative;
 boundary="------------vV8HDGIpzzeaLjC1r0abzr0q"
Message-ID: <4ee63834-cc75-ca3a-6333-ebbfc77f445a@oracle.com>
Date: Thu, 28 Oct 2021 03:54:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v8 0/8] hmp, qmp: Add commands to introspect virtio devices
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <1635334909-31614-1-git-send-email-jonah.palmer@oracle.com>
 <YXk+JvPuOglFoerz@redhat.com>
From: Jonah Palmer <jonah.palmer@oracle.com>
In-Reply-To: <YXk+JvPuOglFoerz@redhat.com>
X-ClientProxiedBy: SJ0PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::16) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
Received: from [10.39.230.93] (209.17.40.47) by
 SJ0PR03CA0011.namprd03.prod.outlook.com (2603:10b6:a03:33a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13 via Frontend
 Transport; Thu, 28 Oct 2021 07:54:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f42a1c54-ed56-411c-a2ae-08d999e81f4d
X-MS-TrafficTypeDiagnostic: PH0PR10MB5896:
X-Microsoft-Antispam-PRVS: <PH0PR10MB58964382F35AD8DABE8FFF35E8869@PH0PR10MB5896.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ipfl5WLVL/eliq1shqRjUZtFNNFRQtEgKdGtreBZj6fk2jblk87HqiMDf6yywYdFS+24ut5D6AqdYV3Lxxw0+zAmp4s6r9ALZ4MhIGtSLO2twxgF/Klquy6FtVeorgEk7/nJUuOOCcQxyKJzjEY7GCfcwR7M1Fq8PHM+GjwwhZvTEw80v3YJb7z5WbjwFH1Sxq6nNdtCdvzHFG3bOEYqF264Giq2ZtUGMkZeqvC9t4vHmuOzU3LSPjpb0+hlF7b0S6XdbiCLrzM+27M8kGxI3azVCcduHzmGvNBa9g79+kTAyx8oenY3goOAgyExTkHjMz/FIxGNacQyAwb/WIspNAHFr3y5GS+NXtrpvPBJTDIAr2CmhuWmGG+fuuQwcOz3mCzxvQeC0Tlf5TaQ94tggJEyUshhTF46b/EIlTrmuJFncLgh89sFwXUqogT+kpbWZYFJN9Udx7MygS7EZsRvoDOmqFZWmVmcvNtsT2tpEzUJOKlDIOjtR7BVOGcbrgeBgs/Np4mw8TE1erYiYL+2+dRiSaGbZUS8j+DlHhWd+kxjqGB2Vf1upadOCZAiYhQydUkdeRd2T07ncsT02T1hvslqH8AVjT0w0qevm8BCEVcj6ydoConH4aIkZyGuC3/eQS10CBnMusAHybdCvpSfKDmtxzoLA8oS0u+C1emfSfiIEDzE/Dq4CAY143B+jzTuOutit88KLb78SHzFyy39vwUqpFxMlcVvh8BVD0i0E2s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(26005)(186003)(5660300002)(33964004)(16576012)(316002)(31696002)(8936002)(6916009)(6486002)(36756003)(7416002)(8676002)(956004)(53546011)(4326008)(508600001)(31686004)(2616005)(38100700002)(66476007)(44832011)(66556008)(2906002)(66946007)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a01xOFlqaW1tdXc2SGdUOU11R3I3dUV1b2orM3lWcTdITVhwZW8ybjJMeGtK?=
 =?utf-8?B?NGdFZk9mQVB2N2tNeVR4N1hib2Uwd1E0cXFTbFRPTVhYSHBrVHlCTUtmUnBh?=
 =?utf-8?B?Rno1UXdzUDB5aWRYUjk0a1c3RmNCbmY0cmZOcmc3V3FnVUZUVC9XNDM5OVZL?=
 =?utf-8?B?emR5ZFZqNXMwSUZjRC94Sm9PUldXWUhSNmNHTXhvbmQ5c1RER3FtSlVxRFlP?=
 =?utf-8?B?dmJ5eWg4azd5bEczbjdOT3I1RnduaWNZemVhRTBOdGo1eGdneU4wcjNmcHNn?=
 =?utf-8?B?ZFFNSGdrV2h2RUdybis3aUxUN1dqUFoxRDhzR2FVS3Z0OHNSNU12OW1Hb2Nw?=
 =?utf-8?B?dG5KMzAxczNHTy9SZTdPWTI1MlNONER6aDdqcDBWOHh1YVJpckJEVHorSlRq?=
 =?utf-8?B?RzJ1MG5yaGJmbUNJZG9BUUhEaUdTVzl1Y0tJTVRZY3VSNmg0TFEvNUYyRmdn?=
 =?utf-8?B?cGZCUHF2LzZqMTBhaTgvVXhXNS83Z3o1UTVlVUhnS0V4M29XdEF0S1NGZURL?=
 =?utf-8?B?bzJWaTFKZXhBSkJNNmlRQ2lFTkVBSXdMQVVBem1sZzJTSWFENmV1U1dKN21i?=
 =?utf-8?B?d1lBRWFUSTR2Z2ZtVk9sVzVXRE56czRpU2JBV2NQWjBEeFR5SW8vaHQ2YVBw?=
 =?utf-8?B?aHlCVG5qR2poRm1SV04xODRRbXRkcEQ0NStpeUNKdjVYWmRMVVgzVVhZTE8v?=
 =?utf-8?B?aDYxOVc0OU9Mc1NwLzBQdVRxaHQzdWRDdVk2U2ozUFVNMGFLRGNpdW5Daksv?=
 =?utf-8?B?SHBZRkNuK0VQR3RhWFgxWWRyRlM0RXZPZUV5a3ZHdWZjVDNVSS84Y09PYmY4?=
 =?utf-8?B?K1RYVXhET08wYUxpelpBU0VkV0QvalI5QytwZ2hnbjhibVY5TUJWYk9Ta2Vz?=
 =?utf-8?B?TzZ5UDJaV2RsMWUrVzNpQ1BlV2hZdDhabWNFS2lVeTNrVXBWRzFXc0FiV1J5?=
 =?utf-8?B?RUJ1NVoxWjU5bnM2aWx4NVpYcEJkZmI4dXNLTzhpTVdhNVZMZVplcm5Dck84?=
 =?utf-8?B?RE1XbjM1Y1QybXBhODhuaU0vNmVHT0pYMjh6dk12NFM5MU1wakVlcW5JZVUv?=
 =?utf-8?B?dUFZU2ZyWmNIdmZMeEtObUREbC9RV0EvOFdZSUJlZHRTMHk5Q3Y3TkpMaWRV?=
 =?utf-8?B?Nk4weUF1U050WXFJd0lEZWZoMmhNUC93K010czlzdlc5UWdYUC8vdEx4cndB?=
 =?utf-8?B?T2NsY2lVMEdRTmFBOVJsUVpuUkNaZEdGNnBmakF5ZmxuODRCbEZVZGlsbGNC?=
 =?utf-8?B?N0xyVVRJa29iQ3ZTUXNjZXJuWXZkMjl0VmNSWVZxQkJBUmYxVklsUFZOZWp3?=
 =?utf-8?B?QnAvMGF3VENHSGdZbTlvbFE5U0RXdzJOdThMK0s5VWY1YkFUWkFTR2NHOUY2?=
 =?utf-8?B?L2k4MnVhTE02d0RKaDJwUnVsWnZDd0l3SW5xbG40WkRCSXZDRU5LYmYyVjZK?=
 =?utf-8?B?eFI3REZjYW0yWmFGK1hnRmUwTVdOOVdVbURqemlSay9neDVDbzVaa3M0RFJr?=
 =?utf-8?B?aXpJcXZIREMvN1ZvbWlKUGZtQ01HeXpoOGF1YzEzV3ZVZnBLVTVQcUIrejQ3?=
 =?utf-8?B?S1hUMFBBcjJqRFB6Y0tRN1lzbzNKd3gxd2REbGFwa3RGajZldEN1dWZVbTcy?=
 =?utf-8?B?OGdNVW5CY3NEeUFHOERTZDBkVzNDaEtnRGlrcWxIdkdMaEdFc1FZNDVPTzVU?=
 =?utf-8?B?VzN0TnRuSmM2V3JUV3ZYMVFwR2xjM05FYkZDZ0IrOHdOaHpLSUQvMjgzY2xO?=
 =?utf-8?B?ZlVFQTFhdUF2Zk4yYnF0M3QwOHJMdkJ5R1pFc3BPU3F6d0NXa3NYUndjYlU5?=
 =?utf-8?B?M3lLb3JCR2tGVHo3T25wbTA0WnBZT1YvYSsrcWN4L3R2UXMwR2p3ck1sNHRw?=
 =?utf-8?B?UkpGZXV5aVVtd3Vnb3BoeGV4YkthNExrb2FjQmdSb0RaTExvY21zUWpwVUNV?=
 =?utf-8?B?bWFuTkZjTjdsZ2dhaXcvT05VUGZMQzVicWpQQnNyN2Zsd0dXZFBROG9yeVFr?=
 =?utf-8?B?ZWkyYnBsOEx2MlZZSno3dC9BNmt0WVQ5VFNNY2FIdGJHWGVQQ3MyOFI2ZlMw?=
 =?utf-8?B?TlgrYmVaa0lRaVErSE1GWFhCbFpBZ3JpUm5pYUJxQngvTDd6VGtOejNhOUlT?=
 =?utf-8?B?TXAyekVrdERVN2JaVXVManQyckdFUFZNaTgxSGJnMGNmWi85QzUzc2lYblNz?=
 =?utf-8?Q?f6R76rKFbWUSPc7Ne7cjZT8=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f42a1c54-ed56-411c-a2ae-08d999e81f4d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2021 07:54:08.9525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oN59fFjjp6a175jpbrunwiPGGAoSK2JlAviJk/J7lDYlqHBrtE95RtjDY07nMkkgFtgFUGepWBiCLbX8cCGDmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5896
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10150
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 bulkscore=0 phishscore=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110280040
X-Proofpoint-ORIG-GUID: r7xYyRDxjpcT7d7m1LX8TUvRrs2yr3SE
X-Proofpoint-GUID: r7xYyRDxjpcT7d7m1LX8TUvRrs2yr3SE
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.847, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: mst@redhat.com, qemu_oss@crudebyte.com, qemu-devel@nongnu.org,
 kraxel@redhat.com, si-wei.liu@oracle.com, joao.m.martins@oracle.com,
 eblake@redhat.com, qemu-block@nongnu.org, david@redhat.com, armbru@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------vV8HDGIpzzeaLjC1r0abzr0q
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/27/21 07:55, Daniel P. Berrangé wrote:
> On Wed, Oct 27, 2021 at 07:41:41AM -0400, Jonah Palmer wrote:
>> This series introduces new QMP/HMP commands to dump the status of a
>> virtio device at different levels.
>>
>> [Jonah: Rebasing previous patchset from Oct. 5 (v7). Original patches
>>   are from Laurent Vivier from May 2020.
>>
>>   Rebase from v7 to v8 includes an additional assert to make sure
>>   we're not returning NULL in virtio_id_to_name(). Rebase also
>>   includes minor additions/edits to qapi/virtio.json.]
>>
>> 1. Main command
>>
>> HMP Only:
>>
>>      virtio [subcommand]
>>
>>      Example:
>>
>>          List all sub-commands:
>>
>>          (qemu) virtio
>>          virtio query  -- List all available virtio devices
>>          virtio status path -- Display status of a given virtio device
>>          virtio queue-status path queue -- Display status of a given virtio queue
>>          virtio vhost-queue-status path queue -- Display status of a given vhost queue
>>          virtio queue-element path queue [index] -- Display element of a given virtio queue
> I don't see a compelling reason why these are setup as sub-commands
> under a new "virtio" top level. This HMP approach and the QMP 'x-debug-query'
> naming just feels needlessly different from the current QEMU practices.
>
> IMHO they should just be "info" subcommands for HMP. ie
>
>           info virtio  -- List all available virtio devices
>           info virtio-status path -- Display status of a given virtio device
>           info virtio-queue-status path queue -- Display status of a given virtio queue
>           info virtio-vhost-queue-status path queue -- Display status of a given vhost queue
>           info virtio-queue-element path queue [index] -- Display element of a given virtio queue
>
> While the corresponding QMP commands ought to be
>
>           x-query-virtio
>           x-query-virtio-status
>           x-query-virtio-queue-status
>           x-query-virtio-vhost-queue-status
>           x-query-virtio-queue-element
>
>
> Regards,
> Daniel

Sure, I don't mind changing it to this if this is what others would prefer.
If there aren't any objections, I'll switch it to this in the next revision.

Jonah

--------------vV8HDGIpzzeaLjC1r0abzr0q
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/27/21 07:55, Daniel P. Berrangé
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:YXk+JvPuOglFoerz@redhat.com">
      <pre class="moz-quote-pre" wrap="">On Wed, Oct 27, 2021 at 07:41:41AM -0400, Jonah Palmer wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">This series introduces new QMP/HMP commands to dump the status of a
virtio device at different levels.

[Jonah: Rebasing previous patchset from Oct. 5 (v7). Original patches
 are from Laurent Vivier from May 2020.

 Rebase from v7 to v8 includes an additional assert to make sure
 we're not returning NULL in virtio_id_to_name(). Rebase also
 includes minor additions/edits to qapi/virtio.json.]

1. Main command

HMP Only:

    virtio [subcommand]

    Example:

        List all sub-commands:

        (qemu) virtio
        virtio query  -- List all available virtio devices
        virtio status path -- Display status of a given virtio device
        virtio queue-status path queue -- Display status of a given virtio queue
        virtio vhost-queue-status path queue -- Display status of a given vhost queue
        virtio queue-element path queue [index] -- Display element of a given virtio queue
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I don't see a compelling reason why these are setup as sub-commands
under a new &quot;virtio&quot; top level. This HMP approach and the QMP 'x-debug-query'
naming just feels needlessly different from the current QEMU practices.

IMHO they should just be &quot;info&quot; subcommands for HMP. ie

         info virtio  -- List all available virtio devices
         info virtio-status path -- Display status of a given virtio device
         info virtio-queue-status path queue -- Display status of a given virtio queue
         info virtio-vhost-queue-status path queue -- Display status of a given vhost queue
         info virtio-queue-element path queue [index] -- Display element of a given virtio queue

While the corresponding QMP commands ought to be

         x-query-virtio
         x-query-virtio-status
         x-query-virtio-queue-status
         x-query-virtio-vhost-queue-status
         x-query-virtio-queue-element


Regards,
Daniel</pre>
    </blockquote>
    <pre>Sure, I don't mind changing it to this if this is what others would prefer.
If there aren't any objections, I'll switch it to this in the next revision.

Jonah
</pre>
    <blockquote type="cite" cite="mid:YXk+JvPuOglFoerz@redhat.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>
--------------vV8HDGIpzzeaLjC1r0abzr0q--

