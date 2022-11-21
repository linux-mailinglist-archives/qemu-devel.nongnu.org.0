Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C6A632071
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 12:25:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox4uu-0004mV-F5; Mon, 21 Nov 2022 06:24:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1ox4ur-0004m0-VH; Mon, 21 Nov 2022 06:24:46 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1ox4uo-0003Zo-Rt; Mon, 21 Nov 2022 06:24:45 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ALBNkv7028788; Mon, 21 Nov 2022 11:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=8n5lPSgOjNhex3WRuSSzvYmTzwFd4EvrTzTf+V30Xmg=;
 b=EihHj/ZBQz8Ie1Eqz/eni+VPrEfVnYeltT9o58GWr3u/x2NLms4wsHjyXQtNJMaL7jsC
 EOyu7TvrHuKSrHaMA3ZuAu6V29QjNcaqLN1EyMjzmSlZR5WVFCw0kDMKZpFgmos1i0T2
 I/IlIHHKd3lzq/dpt07sLg5QgBoNGHclRoWB1U/LCrRVaP9giTo8fvsWUL54iueZx2rY
 f5k0x5Wsu+0Dr+BcnBUOOgEGXf7an6uAz1XYc0ITCL6tizm8hV3C0NyPfKzNGfll8D0c
 UX9/1c1AOa7M8hBhyXjOxgMpvF6tBcHzzZRfKWfKHG6jdMCKF/ZkSf2KiTRnZ+gwWldr tw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kxrfauwtj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Nov 2022 11:24:40 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2ALABC7Y022370; Mon, 21 Nov 2022 11:24:40 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3kxnkabaav-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Nov 2022 11:24:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kr5lty8ZXDZM4w3J23KRbN1AnM+sOa6JyGRHkQ9+JG0dq1SKI+TGnPdj8dgysQ2JWGF3qXPYE+CO/fkOI/PJ3mop+QFIei1s9t4L6SeDdZtykyCk3EmT7Dx3u3/rkf4dXQdop6VDK/KoA/9nDxoie9lOKejemJZGQ4U3JTjv3qm936vC5WsIQpoZ6xyojS97a02eDI5rQN9cN+UM7JSMGX3qp5zwuXPr6cTKR9mMKgv3Mjk5lEb86qcDKt280Njo6fsMEig9DpnI8qi49C+Vo84inNKPBzW98/p8bmahizUNX+wK72iEDK34zMMR7DeCguACV6gvIxu7yKSV9sLd7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8n5lPSgOjNhex3WRuSSzvYmTzwFd4EvrTzTf+V30Xmg=;
 b=Gvf0sXaeWM4tdjRHcHakbP6Wr0EbOSAgmlcJI6mFCE1ZphSGdsxn8V4dxV/5VdNe120EPMKoiX+u8mUyGBxxpRCrv081E4cTMop//C0pqzywc+6btpuIOeiUnaYJYdIUE5obSKoPwlCexmnoe3RVCSJUCMncthhoXwKkAshU37CP2PCntSH9EEx+W9nQRmnLmfVx+qRuLgTuk5eUP8gajHgRyQKD5l4uP0mzpKMbiCx3tUqDMSifaxpLDF+N+UOrUuCXZ1dFceVaRJJq3JV66ePSo48XFiMQ9QNn2d+IcMD/Vw/qM+qOSyJ3uqScmp9bD0f2WqXLXs0ojHvuZ0Q4Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8n5lPSgOjNhex3WRuSSzvYmTzwFd4EvrTzTf+V30Xmg=;
 b=gNTiFLs/9AufYdSNVL8WItreY2TFh57INiDs7oDCbQCXxL1jQugGBe3Zt6Dd6KemUzYg596BgUVpCd+vKXP39n+SIpeUwnqF6FHlYIOpWVLMGK919rwEg/kVApdT9D0O7JN6NPgg4oJCFjJ7thfp/yhW9Kn9wgqUnWDHINW5/2U=
Received: from PH0PR10MB5894.namprd10.prod.outlook.com (2603:10b6:510:14b::22)
 by DS0PR10MB6726.namprd10.prod.outlook.com (2603:10b6:8:139::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Mon, 21 Nov
 2022 11:24:37 +0000
Received: from PH0PR10MB5894.namprd10.prod.outlook.com
 ([fe80::6d72:4f59:e5d5:1de5]) by PH0PR10MB5894.namprd10.prod.outlook.com
 ([fe80::6d72:4f59:e5d5:1de5%9]) with mapi id 15.20.5834.009; Mon, 21 Nov 2022
 11:24:37 +0000
Message-ID: <4b4ea622-871f-749a-1de3-b260e1d64b1f@oracle.com>
Date: Mon, 21 Nov 2022 13:24:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] target/arm: build smbios 19 table
Content-Language: ro
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <1668789029-5432-1-git-send-email-mihai.carabas@oracle.com>
 <CAFEAcA_H8UEcp4HNFe1CwaheLxg7453QQBjTa9wSnsW6TgsRKA@mail.gmail.com>
 <eea06d91-492b-3c1a-6e0d-5e52507b3b1a@oracle.com>
 <CAFEAcA8isy4_0iYHWX+3RksCNQwT3U_SH14xg6t-KUPx4b9d=Q@mail.gmail.com>
From: Mihai Carabas <mihai.carabas@oracle.com>
In-Reply-To: <CAFEAcA8isy4_0iYHWX+3RksCNQwT3U_SH14xg6t-KUPx4b9d=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0086.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::19) To PH0PR10MB5894.namprd10.prod.outlook.com
 (2603:10b6:510:14b::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5894:EE_|DS0PR10MB6726:EE_
X-MS-Office365-Filtering-Correlation-Id: d253bfab-f70a-4664-9293-08dacbb2f96b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RAB7HRHEloUf+cfUL0tGQqRneAny20wxskUIngwHtKubbzFqdQLtSvCEPJNYKAvtEs9HA112nl5uTMHyjkqQ2kEA5s8ekq1dSN2hvahIdCVco/hMxXfw95nynlUpemW+CwBKuL2/1Ws8zCpG9/EZpOkcJCMGrNNQBexfUYnXxz9O9hdE02nN6vE7Q6pSk9FD35tkfrzz2t1J1LycNZVtNYuRW7lefysXpZxajYxLJGDkEhtbVLR4RAWjXOSyY9xWUVhnHK/XoVKDJyWTvwlOdMfXagO3O52Fy3KEXYXQY8c85Tw5i4UoebTMpkaEq0u7tO/g6wnoakC87xpC6aRkOF17mwHshxAb9Swpd1BRa6SHQUyXwKeIsF7Hw5VYSmuEKCp//p4oJIZGOx2NwqKij50GKikQEWuW4KEhSrnUz69Lvwz3PaI1WM7InXB8/PereKXv0g3gyMowtweyo/XA3av66I7Js77Sr9QywAG5f5jz6+O6vMF8i4oT/FcD7YRBNqIcWtCRFCUCrujMx1Lra7G78TxFSYenKRd2V86rC/PdAARxNf+FDeaGK9m2XQSu1AxRtGSFkjALVF9+WgLACADQT5qLkI1RGiDJkqrqsnudHiD88FAkIeuAAaArEBNML/9HLCxm8t38zYWejIyKiXiClQD9pCeI4cNE6xqlFSlixars5Q8UEEBd1BtOqjeAKLwt8eOEyhmj1+squjlsgZwp31+iYVx5KqutTxiC2hlIC3nUzZO92RtR6TTQBX1n
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB5894.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(346002)(136003)(396003)(376002)(39860400002)(451199015)(38100700002)(31696002)(86362001)(2906002)(8676002)(4326008)(8936002)(66476007)(41300700001)(44832011)(6506007)(6666004)(6512007)(26005)(5660300002)(316002)(186003)(2616005)(6916009)(6486002)(478600001)(66946007)(66556008)(966005)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blBxTGpMY3dCK0xKTjZSTEdpUFJ4YzJxcktwM2MxWFlGSmhLMElxSDdNVVB5?=
 =?utf-8?B?UXB5cjN2MHJJRkczZXFhWTdscXVvbktuTTZTcEM1Nk9pbk4vKzRkQXlkZDZT?=
 =?utf-8?B?cUE5b2NDV0hCdWpxbWEzdlJWR0dtdnd5eGt6MnI2WEpTMTRpa2VFalFQMDhV?=
 =?utf-8?B?VU94S1djWUlBUm5iVkxhNU1DUXpic3UyRXYxTnpxWXVhbVZjbEc0eVFCRlBw?=
 =?utf-8?B?dSs1VjkrcHFRdUVrZ2hGV3ZFQjh6d0t3R256VkRaQ3E0cTBBdTYybFNmcG16?=
 =?utf-8?B?NHluUmZESU9jV0QxQXA1aytZN2pDVzd4dWNORE10ZWdhWXZTYWZLeHY4SW44?=
 =?utf-8?B?NFZEa0xaUGpJOUt6aHFBMFowMDBXWmlIVEtzdXJ1YlR4bXBtY3IzazVvSnJk?=
 =?utf-8?B?SGc4NHpuWWdhQ3VNdnBhaWE2QXpnZnpBRGtYTWJLWFJyczBDYTFicVBJeHlF?=
 =?utf-8?B?cUhsUXhmc1FMVVBpbFRHN0UzaHRQd0lVdkhEQURtczNuWXVlSmUvdUdZS0ZV?=
 =?utf-8?B?Njg3RlR0aHc3bVM3cHIwSGJjcE1tdXFsTkVvQ1lvQzdoT0E3TnVQNWZnRnRJ?=
 =?utf-8?B?bnpVL3JSRnBKSEZudE8rZTZzeW5mQXM5OHZKTVl3cEt5R1duSUlBTXF2OCt0?=
 =?utf-8?B?d2gxcmRlZkt6WCtsUzFHblphYmpmY2x1cFdXcmQ4T0ZZQVlxS1JQMzUzb0VL?=
 =?utf-8?B?M2sxQ3ZxanYzcXJiWFpmQXU0VWxQeFRHcG5qd3ZqemxYMlVCQXVJOFBEQnNN?=
 =?utf-8?B?cjZDK00vQTh0aTVZTlBxZDlJOE5oRWYwalQ2L2RHQ2VkOVpyajJKSTZkYThh?=
 =?utf-8?B?VlRsSVk3SXFVYnc2bVhudDRucjIzSitTQ0Q3dkFqZDEvNmdEYmc5OHVmdDJE?=
 =?utf-8?B?VzJkVEwrc1kxVkFtNUZucEdKWXRoTk40MTdKc3VuV1hRcUhxZjF0RFQyc0ps?=
 =?utf-8?B?Yy9ERnpzU0gvbnlocnRoWk1KVXFDS3dQWkdyUUFWWUt0dks2akxnK0RTYWsz?=
 =?utf-8?B?UmgzaWZpNlBiWkM3VG1uS2Y0UGc3VnFHWjdUeFRYTE1sSS9QbkRvdkhaTE90?=
 =?utf-8?B?NzBiaE1BM0VzOUU3dVBNV1NzQk5SMzJxQUVRaVkrL3ZUVkhHTGx4Z1N1RlFr?=
 =?utf-8?B?ZWNLZGQ5RDBkNWw4ckNzelBSZ1Z1U1BFN1doRTlzUTlCV2pNT1NLN21ZRVhz?=
 =?utf-8?B?UHNlaVZZTlBadjZvZFBWeTlSN3hweStQK1Bncnl0dHp0dDBHSXFRbHZZazlw?=
 =?utf-8?B?dThTUmNha2dDY01wQis2L2VJRm5uTVJzNnNNUUY3bkVVbW9keDBLeHpVNlRi?=
 =?utf-8?B?OXNpQVdaNGdiWnJQQXhIWWExME1zZG5JVG40NkJCcXBKTFZZMlM3VlpTeko3?=
 =?utf-8?B?U2pVTEJDWFV5K0lRdGNpeTg3SnV0VEJncEFsRnhpbDNrRW8rUlNSNnJuc3FR?=
 =?utf-8?B?ZjI5cFBnZDV1aWV2cC9mSmUvQXVpYjkzU0lSUUQreWV2ay9GbWVDaGJXUWFP?=
 =?utf-8?B?em1JTEo4SkRyS2RmaitmTjgvVFdwZzRjbFRDVm9wdW1lQmUxMU5hWEtvMTMr?=
 =?utf-8?B?RWNnT3hTQzZnbHdjRy82TXVZcUdIVU15Z0RMM0tCVG5VYWVoUmZvYmJRMTly?=
 =?utf-8?B?WFRDTXM5N05GSnAzK094Tmh0MGgxU2ZqWitvQngxZXgvYmJFRkhEUDZBU3B2?=
 =?utf-8?B?Z1YzTlBrbmJEczl5ckloamJUMTd1Q3pYZnVoUXBpSlo5THk5T29ITjMvY3cw?=
 =?utf-8?B?a3BZTEZGM2hNQ1hvYmVSRG5kVjkzV1RMN0g2VVZQVkhRa3NiU1d0WXhuVWtD?=
 =?utf-8?B?Qi9SbVd2cjBmUDN2ZnRPdU9mMzhnSEc1TVpLc2RMWlJiYlc5RjFHUEsvcjkw?=
 =?utf-8?B?RHI2MVZ5UUdNeWRsSXRLMlVUWmVYeFduN0xZcFoyTTRBREJBM012dFdHME5T?=
 =?utf-8?B?Mk4wbzZoaXVNT24xTERFcGxmQThucnNiYVAwM1huVVZIREhEbCsxNGhSZUNI?=
 =?utf-8?B?blE2UWFjbWxSZnJHWFEwdmJ3U1BnZUw3NW9WazA0VFpvQW9nL3lyTTdVcWJa?=
 =?utf-8?B?Q25qTTQyZ0RkZ2JJM1FlYmJNbVc1V1NDS0tYZjR5clpQVldMdnZLTXdLZEhX?=
 =?utf-8?B?NjcxbGxvSllBUXVldXhwaG9ZWklQQ2cza3p5QWVnUnpBak5JSlpPdGd3TDY4?=
 =?utf-8?B?V0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: HfSYKmOIAmIyat9ukF4GJGLoAgS2q11NzHvW86piqY0qhBNJtGD9fe7p9/BLnNMWh9M50fBrNMEKSsn1ZgQVwNlz3MHj40FjdHJX1YFJ28Npk9jcEB8Cjt7I/90mjX8zqsy4FYv6w11ubdRv2We5Ah3Hk5IYne9GT3/d5/hh7lQ26kjIAA6eADbkhdpZ1ZqEQxe8AUAS9NLkOtw45sRqEmCzmaG6wN19fFs8YGHN4G8KT558nauhFuRWy0e+6JNwllnMma4d9vLMF7HjomuAVMSosGuy0qQBz1xsxq2qDxwJP0boIqrqiS3SoEyWY1vBth3CH9cj0X30vyMbLc9V3nqrzTCsseP2zJrkRCiOUlR94LrOoy4055NXjhckiPQPK0Co+eAL+cr7q0DB6lhhcxsV1TfaD23QMfj2o+DYwSU+1TFnpr0dxtPome7QAa10M00S+AMpaIAHplTnYJFl2JtyEGu2nfKNDR1xFZBe0gYCw0ob/lfy3EH/hFQf8CiZ+OXkBNxs1LZiBB152+D11DC5lZXnSgXPVoS1UTRxKtrvOj9TUwP4ih0NePvAcYU5FlohHsxxmM7m/PzpNlnE1XpVLwJ/jf8ZX3wLL2rrQ64Nr55yes9mRgDohs06IlEcaBShTWSinYM26EK9GXN5SLrIH5nqnnU68Dh+RrUXJtj7/7iy9j1We3SLw6mtCZ2R/H5jg/wZ46k9YAOoWyNYNsDeo+16K0ZN8Q6jGgTdLHpiKoxZZ8SucsuCxg68zFI6y8kqundY7EN0r6RGBZczepEihwNlFNuxNBxOayKWPVRFD47ity0W5xgeoIX5y+7x
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d253bfab-f70a-4664-9293-08dacbb2f96b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5894.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 11:24:37.8039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: czQ13C1zDsYzYQ5YLPkzec75UwporjdESI1T42Iyns5I4at/RqIy2aM0R8ivuBAVNA9uS35rEUbeE8u41ZzNRi6yIMHdtseyp9drRQKfe/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6726
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-21_06,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 mlxscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211210089
X-Proofpoint-GUID: GwRhZhpXM-sOT4nMcTtEWuoS8v98G2D4
X-Proofpoint-ORIG-GUID: GwRhZhpXM-sOT4nMcTtEWuoS8v98G2D4
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=mihai.carabas@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

La 21.11.2022 13:02, Peter Maydell a scris:
> On Sun, 20 Nov 2022 at 17:53, Mihai Carabas <mihai.carabas@oracle.com> wrote:
>> La 18.11.2022 21:11, Peter Maydell a scris:
>>> On Fri, 18 Nov 2022 at 17:37, Mihai Carabas <mihai.carabas@oracle.com> wrote:
>>>> Use the base_memmap to build the SMBIOS 19 table which provides the address
>>>> mapping for a Physical Memory Array (from spec [1] chapter 7.20).
>>>>
>>>> This was present on i386 from commit c97294ec1b9e36887e119589d456557d72ab37b5
>>>> ("SMBIOS: Build aggregate smbios tables and entry point").
>>>>
>>>> [1] https://urldefense.com/v3/__https://www.dmtf.org/sites/default/files/standards/documents/DSP0134_3.5.0.pdf__;!!ACWV5N9M2RV99hQ!KF2xmQw9nxPvqvNCgDleyVHv4MoZseoZFHmR1veww7O2BmRxSH1spOCNWX-c-FvzcaR_o8PunXSWWH2ECvFqlR4E7vw$
>>>>
>>>> Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
>>> Is this a bug fix, or a new feature? What are the consequences
>>> of it being missing? Is this important enough to go into the 7.2
>>> release? (My default position would be "no", given this has been
>>> like this on the virt board for a very long time.)
>>
>> This is required by ARM SystemReady Virtual Environment [1]. As
>> described in the Arm SystemReady Requirements Specification v2.0
>>    [2] page 9, 2.5.1 SystemReady Virtual Environment (VE) v1.0
>> requirements,: "FirmwareTestSuite (FWTS) must still be used" -> fwts
>> checks for the presence of SMBIOS type 19 table and fails the test in
>> this case.
> OK, so it's a spec requirement. Are there any actual realworld
> guests that don't work because we get this wrong ?

We do not have a clear example. The thing we hit was the ARM SystemReady 
certification based on fwts.


