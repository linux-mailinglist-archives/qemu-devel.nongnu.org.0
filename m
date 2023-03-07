Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD3E6ADBFC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 11:31:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZUbc-0004Xp-3F; Tue, 07 Mar 2023 05:31:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZUbR-0004XJ-Hz
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:31:30 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZUbP-0004k4-VN
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:31:29 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32783rQE007617; Tue, 7 Mar 2023 10:31:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=P7o4aFrNppChkHgJN/xDCou+Zint3xHw+Pq02fGN16w=;
 b=jl7NIaXyQGem9LdfDggjBDG7pVlKws1kKy1Wazd3SD8YJRn53mxah3R2DQDadKYICZB/
 KpUDmyGLqB08YC68lpjeup/Y4d7nhax27gHMhGocoRaCwG/j0BgO45Kz4EK8MJgHOPaZ
 I1yuVuatcTHDL94cXDvCQgbbknxH1H8phc9yFbFX20WXXNSVv4CMYYxjz0eLIBFXlIH1
 tMFBaBgXnpj5W/HBJLRFt0NFlNhIHGJaPurEsujz3EZa0kEvgbu+WklAreN9Djv7tsXh
 lBVfUMHtRRvOEU2A1xWcAuPRiYsKYB7Z5fU4DS6szDh2Jjt2eHk+DkdTv4/8W+JI97BK aw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p5nn91frr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 10:31:26 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 3279jirP011484; Tue, 7 Mar 2023 10:31:25 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4u2hjufw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 10:31:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j2/ZyrLm6w1aU6z8I5wwAa3kFaB9UhkSwF577RrFMLfKk6gmpfqAV7zbglbApO8uMBD9EGJ/jQyKQiCf7Zgl1+/qZr697+0lwIayW0s/w3oZvMmINM5SDWWDytDC3CkdWQ0cQOGmcHK/PUA/zgzxxWW0DW8qZqQ1c3NWdDnLgruRaiYxNp9zuJ11TAdree96BAwdM26IdrTQJaQziRDau/3eSSU8tZjehXB5udtaqw6PqrS8n90YMoSD80sfmppd/uouaLFa5U4QUf57ESRyP5iotESuvxcAwLY6Rq8Qhtj3fPyegtQi6VhQQKsnhKSz1MNRD0+o4DIXAP/SD31M+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7o4aFrNppChkHgJN/xDCou+Zint3xHw+Pq02fGN16w=;
 b=aSbJBR06sEnqIoIhH0ncydvLMsAdA3wpoeHpXU8sD5G7e+wtWMmAzVTVFTGVI/3GiL1sI+zy+NPkrqnKLvX52vDaQ+BnNxAp2L4f9rvPerk1O5Z5UyBA7thCUhmf9WueFOBxg6R1JLtQVjZrep1Pr0tqVHfsh58nTm23k2KWvSX5ZLoi6oLTj5Nu3lJsn4CaR685dl/PLAfIW5uDT8rjdkDSdwoR0IWZRz8AfSbi+iPbkDoxI9TDC/TffFdJcTabEG9+p8yE2Enk4l1QyYH6PfB+6/AhVy0T1dBAnSFK7uhpFOfjm6DDyv1H10kTwROVR1703jJw8G7Jqnd1UBV5DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7o4aFrNppChkHgJN/xDCou+Zint3xHw+Pq02fGN16w=;
 b=Sb1gALUCDbgqOMwtJlRHk+KTacAemHq144+m2mUEmnjkQfs0NQxvmqYRsPcU0KUQX+8dxaa+Xs1behdTWH55h6H0rDjNgQbc66qj++Bt038LqzU3a4alUqkVkkWo2Ae+xFRNs79aqm+KyETpqRYJ9WqGjFqANyW8L7GPfnj52xw=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by PH8PR10MB6455.namprd10.prod.outlook.com (2603:10b6:510:22d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.25; Tue, 7 Mar
 2023 10:31:22 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 10:31:22 +0000
Message-ID: <60588194-15be-df19-c95b-d9db2ca7a28c@oracle.com>
Date: Tue, 7 Mar 2023 10:31:15 +0000
Subject: Re: [PATCH v4 12/14] vfio/migration: Block migration with vIOMMU
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>
References: <20230307020258.58215-1-joao.m.martins@oracle.com>
 <20230307020258.58215-13-joao.m.martins@oracle.com>
 <9b2257dd-bdba-5a03-86db-49936693547a@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <9b2257dd-bdba-5a03-86db-49936693547a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0213.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::20) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|PH8PR10MB6455:EE_
X-MS-Office365-Filtering-Correlation-Id: fd245b34-2d13-4ef6-2444-08db1ef718da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ly03Z+YFIdkVWmsKIL9WIKcjT9g/5csb8EyD4+InS6tDiWfu6PVx/hCMxHDHFGPH5h3+0Fff8yzuUKBJqzpSzftPrlkuEoP6J7Goto8IinaSzaSXw/K5Qty3w6G4L8qkFSSRkNZHHmiOrLM5aOwrqvrd7hn5jsA+hNVaWiiEPk+Ll1Zay27G5Ayrnci+T8kXwnJQsU0AsTiynB2x73Cqt9DiGcEObHcDuD+Ijt1t/ZmUhLPEHH0jY5Wh5q52SEPQUFXlWkbpyEACJXxf7v7Zni1woThL6Vvaq0Zft8meoz3zJN0GiwBk5NliD8DrcWMQV5YhhzrJvMJaVYDb3bCvk5uezSJW9vHZTtJJTemhtrS/j/fOUeoVAkKl4juYeaH0uXvQVJBcliw1bYAZS3G/UNXyIXYrwUXwGLcqfOo+MhNTatDvek8oCkOGiSF+6BucKoNGLJLeLJbzaKmaChKohhuKgIMt4/A7BruSVO5a+hWmJkw+IfsLk5mznsYqDt2w86fDpNswqOfZ/KzCB0IwWMth9BLq3cR+JHVjZtejTuOQQM2JLOthubj8apaEqYZ1llArzNrfFh0b1YpSKqJdpMc16aUFoeuC4iOV40Hv0wDBiWQaBtyCLKwkXJV1qzAwMgH6aMuBUFArT8hz6U2suyGiMAtIv1NrxXqGRqLfxwKuS2jW2Q/fYiA7iUViOrXAAl15Luyu3z7NFAnOR2/cFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(376002)(136003)(396003)(346002)(366004)(451199018)(83380400001)(38100700002)(31686004)(478600001)(6486002)(2906002)(4326008)(8676002)(66556008)(66476007)(66946007)(31696002)(41300700001)(316002)(4744005)(5660300002)(186003)(6512007)(26005)(54906003)(86362001)(36756003)(6666004)(53546011)(2616005)(6506007)(8936002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWswaTRPOEhKSWVsQUhWb25iSlpDUzc2M2tRN0N6Qk9GalA3QW50MlVFS1Jm?=
 =?utf-8?B?NHR3UHlIT2VyV3cyM3AyZ2hxNHpqRGZmOEtBbTkvRzIzamdsdGFZTWtPTUhu?=
 =?utf-8?B?VzMyeGovdXFxSWlNMXpoWjZxcXJtUkdGOHRqVmsxMlpVSVF4U0RoQUhFWlZu?=
 =?utf-8?B?SG9jU29QTEdFelRqcXFSdVBjYkUzYXJIcEM5bzM5di9qMDNPSE9HQ290K3dS?=
 =?utf-8?B?VHBqR2NsUXY0d3YxWnc2Y2hIYjk3UFMrOGtua0lRWVlWQmlra3JranVtRUFP?=
 =?utf-8?B?enRXTUVZV2IrVWRTVGRMMzdPQkxUTUdJUllNQkZ3YnRWVVRHeUx4T0VmY0tK?=
 =?utf-8?B?MXNxVjBTMjF1bVQ4OWEzZnZXTkF3TUswNlMxc3g2R0Z1N2R6aDZHem5GN1ZN?=
 =?utf-8?B?UW1GcENGclF6U1BKNVhBbHVCK1EwNVZRRE9GQW5lSE9kL3d4SFNISmZjblVI?=
 =?utf-8?B?TW9xeEVxZlkrVXFKM25nb3hWZnlNQkxtMkMxeEZQVEIrc1Q3VzN4VnZoTnF4?=
 =?utf-8?B?VmxwSW1IUmxTSGJHQXZ1U0NoN2lzSmRueHN6a2pNZEdVdzJmTEQ1MlVTU21T?=
 =?utf-8?B?dEJHSW5nYmJ1ZEdzN2ZVTE9Nai9mWE5WOW50WnpTOURFTGpROGxsVitKTkRv?=
 =?utf-8?B?VGRZZnBuN3BaQ2FWbGhiTDk2STNLYnlXcndMc3JEUmdIWkU4bngvVElhM3Bz?=
 =?utf-8?B?SnY0STlWcUlZejZ4OE5pQi92NzJtWFcydU1mclVsUUlzaGtnVFZReSsvV1Ro?=
 =?utf-8?B?WklrcTQwcXVpRGg5VStnWE5EQ3J0YzlhS1ZXMDY4MWl0Tk9KUVF0T1VrMnhz?=
 =?utf-8?B?TGRBUWhma3pvSGpRbmtNdSttR3Z4Z0RqRXN0b25xamErUnp4RVNNQzJKdHFN?=
 =?utf-8?B?d3EwWFVpTHhaUk1wU2ZtYm0xSncxbThQbGh6M1lmK0YxaDd6Y09QNmcyRUZk?=
 =?utf-8?B?NnRqS2J2WlZ0UlVkYnF2bS9IMUg3NFVWRW9JZktOUXhRYjJtdkhhMzJNY2Nx?=
 =?utf-8?B?czNaZ1Vud09DY04xcUY2a0tTaTYwSHN6THFFcmxXdGxjdHRMVi94MThxNEpy?=
 =?utf-8?B?MHdTZ3FuRUEvc3Y5ZStqTEwrc2U3MStFd1RsNFVHNytNZmxiM0ZUZEdsTHBI?=
 =?utf-8?B?V1djNmxvaXQxM3dKN2ZpWXlnUTlUY01mcVNxY1pqVGFPcndFRmEwOUx5b2g0?=
 =?utf-8?B?TVU5UHhVUXBiV0hQMmoxay8zRGJUbCtXdFpwQlFYdHhDVmNzZjJsREJVb2lM?=
 =?utf-8?B?WHBpVEltL1gwbzJtd28zSlFaVVlYdHYvaG5PWUNYODluT3MzTUQwbkdvS3ZI?=
 =?utf-8?B?b29sQlFvbVlMeHdkLzllWnJrNjZtWWpsaEQyV1BFaDRSVmhCUzRTcjVMUVRO?=
 =?utf-8?B?YkN0ZjU4djVFdkxaOVhIYVNjMTk4UUFtMnBhakRvbHNITk92QjdkZHAzSERx?=
 =?utf-8?B?RlJnZW1iaTRiTDRhMTE3N0hDclVKL05KV05yQXM2NDNWL0crWlh3WWVlT0E3?=
 =?utf-8?B?TXViT01HaXBlTHNFamUybk5kSXljbE4veHFyMjdFYTJRQnVsRGhLYi9uYWZR?=
 =?utf-8?B?dTlGZUI0NDRQUjFFYURoaDdIOTlrTlBxZmF6anJnOUhPdlNGWXhYVGs4TktB?=
 =?utf-8?B?ZDZEdXRMdjJHVSsvaG5JRjFNZXZyb0Q5SGpFQ2NQSGxVRE4yYkNyRmRiNUN6?=
 =?utf-8?B?WUt2RDRKRXRabFoxMWxsMVAwQVRxMlNKcmNEZFpIeFp4ZmlodEJaMEJzSzFt?=
 =?utf-8?B?QytyQzRPdTlQSEhSZ0lGNVpmYkFFTU1pODhLTjNjY2F4dDN6cnN6TTh3TDVJ?=
 =?utf-8?B?RmNJcExLR2N1dExpWlh4K3d5SEZGRHZEeTluTDlLWWtZT2MrdkZlL2Z5NEl2?=
 =?utf-8?B?NFJqTGVWT0pJNXZKTmxxbjEyenQzakw5djRvNGk0M0s3Q3I2MWNxNWlTU2dN?=
 =?utf-8?B?bTJVV1ovZzcvOXFiRHQzNm0rSVFKbjljc0pMVU9tRVhVYjZzTmRQN3JvTUtD?=
 =?utf-8?B?Ym16RkIwZW1yeUpGN3hpQVhIK3QwY3R2M3p2VkF2RjVQdS9Xa3FkcFJhRVpk?=
 =?utf-8?B?aUJjOWxtQ1FTdXdNVjFRckV0c0xXVGdia1Fpd3d0M1N4SHM1WE1pdU5VTTdI?=
 =?utf-8?B?Z2tRSU9DUmxJVVRETGRPOGJlaVlKSUNLL3FINmtTOG54ZWhtUHgrbUZycEhX?=
 =?utf-8?B?Wnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: +VMb424cbynaTbXCQOz0akIzHC+Ga6n9Wj0bVjiS3bo4ynHd8JoaDq8Ami3mcOp2UZ9dmkJVi383trXCIuHJQyQYoJSNKqG+Uw83L0EbNQ0RKdO0vdexvPr42QM85ROrb47Q7ybGLMp21sOXZCSg3K1B5Ar4uh5Ie9uJ6BwWXK+EEU0Q6UzsNSEXsk9NR+5P/CqmcwcXKZAymZvgZXxGp5szkX3ePwJ70jIiX8g2m1lHDluu26H6sIxHp8VPEMvt3DcLCC31qVJlI5AkOkP8/2Pum10NhuIHxsLxrzklxErLXNP0yBz1pqXmFMCPOvWGTr6aMYmK17rx+FX6rqTrO+P/Z5DaFNLdMXXBOkA1F9/9XFLidPWowyjO65ainoVZlY9YBkR7xNXlw7yxo43W2+YOtrbk3WAqwYN4WjFOvJH9AkyKIZQ8VfYjdhVsiq81LrDeFlS8186L29NXP+P4xbEciqUdYV+z41Lb8TEPQKZ9P7Fp9tMpnbMz5vfV1OP0/pJGw03J1+UvyaezRGCAwZtg8jV4NKMsCdsjfpUBWHRwbm3WUUoUpjnf7FT6Wn2NlqmpTvD9a4iP5FxWOdXXqVRD3weFcgPSkLO6AUnGCSFN5FZoBpgeYdkZSozTpDm0a17qHdN3CgFZn2pWFidgcQ2ogFAOw9TpzukJoxyWvrKG2627wVYhhbFs/J96LrviLTJHx7xHiQ1iaB0ovEJGNAOnTf6WtoAPJJqLMwtyllTW/F6vYYYnjBf8xpGZ8zYWS1HClRPv0jVrGF1xCwOVLcsy3rlnWPnxOPG45OtClqBH9TxQfzJ3jAbQXtuNP4KJ
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd245b34-2d13-4ef6-2444-08db1ef718da
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 10:31:22.7168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GJGmIhBH2xUI5+Eps7DOj0wKgq4npotP+WelH8ad9VW0PnN+yODo0zaHI48Xf2Iu5qGEazH84K4bY9DvrI06nCnTk6XjeIo53i17GgRjudc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6455
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-07_04,2023-03-07_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 bulkscore=0 phishscore=0 spamscore=0 mlxlogscore=968 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303070094
X-Proofpoint-GUID: h7Mpi5fl1uMHuaJu2Yx6YdXamhVYT3cm
X-Proofpoint-ORIG-GUID: h7Mpi5fl1uMHuaJu2Yx6YdXamhVYT3cm
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



On 07/03/2023 10:22, Cédric Le Goater wrote:
> On 3/7/23 03:02, Joao Martins wrote:
>> Migrating with vIOMMU will require either tracking maximum
>> IOMMU supported address space (e.g. 39/48 address width on Intel)
>> or range-track current mappings and dirty track the new ones
>> post starting dirty tracking. This will be done as a separate
>> series, so add a live migration blocker until that is fixed.
>>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> 
> Reviewed-by: Cédric Le Goater <clg@redhat.com>
> 
Thanks!

