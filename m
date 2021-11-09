Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D849D44A00E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 01:56:46 +0100 (CET)
Received: from localhost ([::1]:50274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkFRN-0005NE-Vy
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 19:56:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mkFAe-0005fw-Tt
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 19:39:29 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:40398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mkFAX-00046u-0T
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 19:39:27 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A90AULk025572
 for <qemu-devel@nongnu.org>; Tue, 9 Nov 2021 00:39:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=xTBOhpu1nBNdVqwUkCL0pXF+ZxexWuXAQHuTdxKwJmg=;
 b=W1Yi5gwG3+Vth7vTU2fSV+P1FBv7jDUjxUlos/vK0X6Qc25i2HI73Ey1vB25Jm31dhd4
 xJE1ko9jttQX7Blc5MXK6rgJlZb6MWNI0paWJzfdLOn76KMwfEBKFprAjZIEmwB30r6u
 G2OARFwvIkfMP2JuC8I+E4oeGEwjrV6k1+BBx37VaozafauW+ggb85zW16Hy3nJQt3ni
 xpo6vEn39ZSvWkFGWgkzXHduG4MYZzYuU21A5TJ91st2OxMfdJUTkgZ+KOXPV1CX/2Fg
 mTy36H6HcfDnlyirN73eF6DGiaZItiy0ktxhaYeboTtzxJbNzZu50vKhoq5a+k9sk9OW Ag== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c6t7077j9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:39:19 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A90ZLN4129193
 for <qemu-devel@nongnu.org>; Tue, 9 Nov 2021 00:39:18 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by userp3030.oracle.com with ESMTP id 3c5etuvb6n-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:39:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dHXNWbtOS43ox0HQgnVqwga7Ks8tQUBzqnvYO8xmcmCw38XBsne3NaF6zmnKX8DEdvPYX1YcIN8RKiPM+foXh4IXNSHIGrYUY+SF3f47jZGBUtdjABZkXp5Ax5VLrFun7wTuj0UwjuoUPEPxyWcZm/uaIy350AgOZbY+jBe8jeA2F8FXgTtK4g4yLdvpM50RoSAS5hlFGCMMor0JXMvlVUbAPhJicHXyf33yJHAJwqrAQpqpUy6FKihGM51TByTYMibYQFapzlfPzRTWGK3g73Nq6mvlph9LEh0tdmInQcOQwCX2B/iqXL55QHzjbOpApYw6JNmIi7uPg22AlnA/sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTBOhpu1nBNdVqwUkCL0pXF+ZxexWuXAQHuTdxKwJmg=;
 b=OegplyZYWpLnfAGuxaga/VOgnMHmXDnBmsTLEvqpAhQFmp8R//JphPCFNaB/MUkpZPgSw0j2q8OYfZsjamDLJJsH/7H/f0zKIzYdxWWFyo3R31WOtwc0QyltDRRBW+jSLxgTp0jF8dSi2dC6pFmALulTW75FaNlRIXI8nU83xjGKDIIg/2j5+R8CdFeNszN5ZHvotUVN2IBtcZu3+6BeZ32bk7VIm6UTDTRAMm5SnqzS/v9EszAbFOtP1MN3vrhza+qsWm7Oy6zYO+IUF/9T4kCDRRfiyuSvc1G8gTSEFEW7fKCNSgDVYXEnPoT/KPvuib5DsndWrM2Z3kbiJUSGug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTBOhpu1nBNdVqwUkCL0pXF+ZxexWuXAQHuTdxKwJmg=;
 b=JiWumBEN0AK6DzxjOU6xFjCkz4M46I/NRdUPSKb7zvpnYhq69ruXkVBRo3vstbtL0svkvZWb524OeIZpcMr/A/OIqs6qvOv1pcytCssQf3S2MjJ4BTy6EIZZ1xg1m5bmLVdHLLH9vrVZoUB5gTqWmrAdG9tq4nqlPjq+wr3G/Zg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23)
 by BY5PR10MB4068.namprd10.prod.outlook.com (2603:10b6:a03:1b2::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Tue, 9 Nov
 2021 00:39:14 +0000
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::1551:92ba:9eb8:a093]) by SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::1551:92ba:9eb8:a093%7]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 00:39:14 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 08/19] vfio-user: define socket receive functions
Date: Mon,  8 Nov 2021 16:46:36 -0800
Message-Id: <bddfd99bea5d80a7bc4bb57290256b530aabb896.1636057885.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1636057885.git.john.g.johnson@oracle.com>
References: <cover.1636057885.git.john.g.johnson@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0194.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::19) To SJ0PR10MB4686.namprd10.prod.outlook.com
 (2603:10b6:a03:2d7::23)
MIME-Version: 1.0
Received: from bruckner.us.oracle.com (73.71.20.66) by
 SJ0PR03CA0194.namprd03.prod.outlook.com (2603:10b6:a03:2ef::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Tue, 9 Nov 2021 00:39:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a99357b6-842c-4ce3-4ad5-08d9a3195992
X-MS-TrafficTypeDiagnostic: BY5PR10MB4068:
X-Microsoft-Antispam-PRVS: <BY5PR10MB40681E06C633120151734A17B6929@BY5PR10MB4068.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:597;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wz3f5bcVfF2QlG4Its0KHFx4aTxWjku9eGvBqaIn3sVBkX7A3s/KGyhlCMoDSXZP+usLomTTixQ6oxi2YTGnSM+tovJRBOxuCD0ZN9g33+hGsBuW9Ej7LOAaNP//BzIc7jgiDW3maLauF3FIFLWROb+FoEYuIUW7VrfVcBskuvf/t0N5k99h+UR/o4rNQns8BCldJDuHTMgAR8RIEI4uHswLxWtCvXXcahimJS3e+9Im+KtKA8qfv+A0/HQr1gEdDf6cFPLE9YatDzq3uVfqm/Vva2fh5zE4SR8Otc5xwHubBvwU5lVDGzwAaISPPtGNTpvliWy00zkFB6kr7cy+iAmKq6z9gkQkqkEdO80G1Lhshwlp0pN4d/FqzyjLt08u/557oxkeoryVQta4LIhWstAr7wG2U1lxATAFLqcD0+7uaZMTZEVO6MPH4gBS8dzbSNO7Vr0k+C6+R7yB+meB9JGqB35CVG0B5DB6XYLF8+oquN6dNQZAUMtBlvY2UCLeGoRDsSPi0FtJFWKRLGK4FGE+elW4jcQhlbEPfeYLIqQK1KOOJfWKtUkrHkI3E2VIYZOIFRkueU2eqrfDOmMTAXSPtIEoulKg80kl77eiJu44fMhp8qnFVkqpPhy/XIxs+KJ/JnEjU4JFqepgdRvIpnAwIz6p6Wp6RfI8gLRMhHumBxf3DfoCUuceMzfYsRtY7AcBOlMih6kkSFLHsTodHw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4686.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(316002)(186003)(66556008)(508600001)(8936002)(8676002)(66946007)(6486002)(26005)(2906002)(6916009)(5660300002)(36756003)(7696005)(52116002)(86362001)(83380400001)(956004)(38100700002)(6666004)(2616005)(30864003)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0dNMTRkd1VTK29mZS90RlBXUURxNDg5TmRPMlBIZ3J2ZFVuRUs2Q1VURFhQ?=
 =?utf-8?B?b3BQd1ZTbW42MEhCRGRQQ2JZdXpnSUxiQmpDelFjOXRHWnpqSFNSS1BhU2JY?=
 =?utf-8?B?bXpqK3JCSGQvQkpmRjRROG53OTloMXIxMEFjK2JzQUJuODlETDlKb2c0YmVx?=
 =?utf-8?B?UE9ka1Z4bW1OcGhQejJxWk5GTjFEQ1hKNTJIM1hBT24rb2I5Rkk2RElDc0Va?=
 =?utf-8?B?K0FxNkhCVElwcHZ2Mnptb2FVV3dkWU1LUy96V01LSHhyQmg3ZTJrdjg2T09D?=
 =?utf-8?B?VTcrYlZaZmp6S1NVS1pKSndHT2o3OXAxNjdMRm1od1pIdHZRdjV0N01EanUw?=
 =?utf-8?B?Q1NpVlZFOWJFM3ExWlJ1d2RGZmd6c3dBN29WdzFMek42NFdlZklvbmVLMjgw?=
 =?utf-8?B?aFh4VGFiekpIcVVIY3lqTVhFQ0lVVmRKTW5TcmZTMHF2aGV3ZDBPbm12NCs1?=
 =?utf-8?B?UzdKTHJpd2orWnVNbEk2VVYxKzI2c2hYbk44RmdUMFVNWXBXR1RIOEMra3R1?=
 =?utf-8?B?dDROcUlKa0VjZWNROVp3REZNMEozOUhnTWR4UG5zanhKNmdMZm9TUThodnhG?=
 =?utf-8?B?NkJJVmtrYjZLVGVCcjUvMmFwY1F4SGYrUloya3ZZMVJhOTV6S2tRenZSNzA5?=
 =?utf-8?B?U2dUMmw0Vm9hdHpkQ0YwZ1YrWDVDbXhRajV4akpRVzUxZDk1Ly93QkRYV2NQ?=
 =?utf-8?B?RXR5SXAzYmtlc3ovMFdmQ3pDcjJ3MkJaeXhmcUZtQko2ZzF3THNMQ01nNXh2?=
 =?utf-8?B?ZFlocTQrK0dPRTE4U0RETW1HZHhLYVYxcDVjdUVTTlN5SHZQaitNSDkrQnVa?=
 =?utf-8?B?WERkQ3luREdLM1IyUk52RUgzOHN2L0EzZ1U2RXAycHZOVlo2eWtobHRPaDR6?=
 =?utf-8?B?eG56bmQ2KzU4L3JydC8weE91QzF6QlNVR0U0a0NBMlozZWowMWprZFJvRTFo?=
 =?utf-8?B?MTkzTzNrTTFlYVJSajMzNnJQZXVmcnlEMkdCM0VvVithYUxXbGdKS1diMFBx?=
 =?utf-8?B?cnkxMmxFVDUvYWtzZ1NZZEptS3poR1YraWY5YjQxcllJS1NGU2RhY042Vk5z?=
 =?utf-8?B?VTRVN05ENUVlRGpNalh1TkxCbmUrSDVCMHgrSnkxNVpNSXdScnNKUHNLLzFx?=
 =?utf-8?B?b2JIZHhWUGFCc2ExTE9RMFllYklDOGd3TThRRUN4NVFaZWplZXE2RHYrdnNZ?=
 =?utf-8?B?R0JCVmdVNTRtN1RPMHVXWFBudDBsdnlOOEM5Q0xFT3k3c003UlowWVZYa3Fp?=
 =?utf-8?B?QU5mMlphZU9lZHJuOFBLQ1ArSC9oTlpyeTlpTjhtUGxMWEsvK0pWSmhCWXlY?=
 =?utf-8?B?ZXNDd1MxWk03WklDbm1GdzVVQzg0RmkvMDMzejUwekZFdE1jQ3BJQTNZdlMz?=
 =?utf-8?B?QU9qeER5UStQeFZkUlFrQnZXYm1US0ZsdnIwdlhLME9JVWVDTEFFYzNKNTBX?=
 =?utf-8?B?VElqb2dKM3U5SXJMS3k0MW0xcjVHbXlJMUdKQmNvdS9EWHVYeWpBYnpqNG4v?=
 =?utf-8?B?NmJjNE1hMG13MUxuUFJpbGtsaHpRZFNnOVBGQnBqdm1vQS96dk9jTG9uSmtG?=
 =?utf-8?B?RXQ5RHF2TEpkdlNnMlF4d29RLysrdkZrRVhDV1hqbjE2RFYxTXRFcUpkZENH?=
 =?utf-8?B?QzZoS3g1VHE4djhjcXVqSHF2RFN3VkdQbWhlaEN6eEdLMkxZSkFLZXRnMXcr?=
 =?utf-8?B?Y0diWnFtdC9RRStINWpwMWZ6dnU4OWgxbUtCekRaUlQyMTNZNHNTNmVWalMx?=
 =?utf-8?B?cGlrM08xRFN4ZmlLaHVEd0tKL3g3SEZIZGhOamhiNjY4dFp2SnZHOGtUdFZK?=
 =?utf-8?B?NHArRWtyVXZhNjhSUlU1OHRaMVRwVW45bTBaZEJlTGJjR09JVCtRMG5jUEJW?=
 =?utf-8?B?ckVSTnhGRWJESEpWSitUbzZTUXlubjVKRWREb1gvTzMvdWZ4emFZLzlYdno3?=
 =?utf-8?B?SEV1QnJ0OUlONTR6M3JiYlRVOFhveHc0ZHVyZHQwZERzSE5ENXg0WG1mUlFE?=
 =?utf-8?B?cGl6MkhPSzJvbUVCZnR2bis3NE9iWkQ1VjdkMjdyWnJGYWxHMVNhSFk3dmR5?=
 =?utf-8?B?RVhtTXpRRmI4a3VjYWxaRDZIOVhqZnhIejBVejc0TFE2b1dBR2Y2bWRLeTIw?=
 =?utf-8?B?UVc0UjhZekFEN2FoTTllWU5OTG1pZm1pblk4cW1mRVZKN2c3SUsxejNYcTlj?=
 =?utf-8?B?RmpxcjlvdytuZGRZWk9UaHVKV0hFR1Vpb09aYWFqdnZVemJ2YkdzTFkrTHg3?=
 =?utf-8?B?WmQ1ZU54OEp1V2s5MTgxZ3NuclRnPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a99357b6-842c-4ce3-4ad5-08d9a3195992
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4686.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 00:39:12.2851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pche2sUhw19fYKX/ACEWBK7JcfaiS/ortWfjV7vJIW71t3R+g7fF9efwNlktUkrDGneTvWc17tWxLQjU/zLBMb+pWZfQrbsLMTZKtyFIpo8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4068
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10162
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111090001
X-Proofpoint-GUID: hLGMa-SOfAoFQlDfX_B1KdohoI5Q2pLK
X-Proofpoint-ORIG-GUID: hLGMa-SOfAoFQlDfX_B1KdohoI5Q2pLK
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add infrastructure needed to receive incoming messages

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/pci.h           |   2 +-
 hw/vfio/user-protocol.h |  62 +++++++++
 hw/vfio/user.h          |   9 +-
 hw/vfio/pci.c           |  12 +-
 hw/vfio/user.c          | 326 ++++++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS             |   1 +
 6 files changed, 409 insertions(+), 3 deletions(-)
 create mode 100644 hw/vfio/user-protocol.h

diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 08ac647..ec9f345 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -193,7 +193,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(VFIOUserPCIDevice, VFIO_USER_PCI)
 struct VFIOUserPCIDevice {
     VFIOPCIDevice device;
     char *sock_name;
-    bool secure_dma; /* disable shared mem for DMA */
+    bool send_queued;   /* all sends are queued */
 };
 
 /* Use uin32_t for vendor & device so PCI_ANY_ID expands and cannot match hw */
diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
new file mode 100644
index 0000000..27062cb
--- /dev/null
+++ b/hw/vfio/user-protocol.h
@@ -0,0 +1,62 @@
+#ifndef VFIO_USER_PROTOCOL_H
+#define VFIO_USER_PROTOCOL_H
+
+/*
+ * vfio protocol over a UNIX socket.
+ *
+ * Copyright © 2018, 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Each message has a standard header that describes the command
+ * being sent, which is almost always a VFIO ioctl().
+ *
+ * The header may be followed by command-specific data, such as the
+ * region and offset info for read and write commands.
+ */
+
+typedef struct {
+    uint16_t id;
+    uint16_t command;
+    uint32_t size;
+    uint32_t flags;
+    uint32_t error_reply;
+} VFIOUserHdr;
+
+/* VFIOUserHdr commands */
+enum vfio_user_command {
+    VFIO_USER_VERSION                   = 1,
+    VFIO_USER_DMA_MAP                   = 2,
+    VFIO_USER_DMA_UNMAP                 = 3,
+    VFIO_USER_DEVICE_GET_INFO           = 4,
+    VFIO_USER_DEVICE_GET_REGION_INFO    = 5,
+    VFIO_USER_DEVICE_GET_REGION_IO_FDS  = 6,
+    VFIO_USER_DEVICE_GET_IRQ_INFO       = 7,
+    VFIO_USER_DEVICE_SET_IRQS           = 8,
+    VFIO_USER_REGION_READ               = 9,
+    VFIO_USER_REGION_WRITE              = 10,
+    VFIO_USER_DMA_READ                  = 11,
+    VFIO_USER_DMA_WRITE                 = 12,
+    VFIO_USER_DEVICE_RESET              = 13,
+    VFIO_USER_DIRTY_PAGES               = 14,
+    VFIO_USER_MAX,
+};
+
+/* VFIOUserHdr flags */
+#define VFIO_USER_REQUEST       0x0
+#define VFIO_USER_REPLY         0x1
+#define VFIO_USER_TYPE          0xF
+
+#define VFIO_USER_NO_REPLY      0x10
+#define VFIO_USER_ERROR         0x20
+
+
+#define VFIO_USER_DEF_MAX_FDS   8
+#define VFIO_USER_MAX_MAX_FDS   16
+
+#define VFIO_USER_DEF_MAX_XFER  (1024 * 1024)
+#define VFIO_USER_MAX_MAX_XFER  (64 * 1024 * 1024)
+
+
+#endif /* VFIO_USER_PROTOCOL_H */
diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index 301ef6a..bd3717f 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -11,6 +11,8 @@
  *
  */
 
+#include "user-protocol.h"
+
 typedef struct {
     int send_fds;
     int recv_fds;
@@ -27,6 +29,7 @@ enum msg_type {
 
 typedef struct VFIOUserMsg {
     QTAILQ_ENTRY(VFIOUserMsg) next;
+    VFIOUserHdr *hdr;
     VFIOUserFDs *fds;
     uint32_t rsize;
     uint32_t id;
@@ -70,9 +73,13 @@ typedef struct VFIOProxy {
 } VFIOProxy;
 
 /* VFIOProxy flags */
-#define VFIO_PROXY_CLIENT       0x1
+#define VFIO_PROXY_CLIENT        0x1
+#define VFIO_PROXY_FORCE_QUEUED  0x4
 
 VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp);
 void vfio_user_disconnect(VFIOProxy *proxy);
+void vfio_user_set_handler(VFIODevice *vbasedev,
+                           void (*handler)(void *opaque, VFIOUserMsg *msg),
+                           void *reqarg);
 
 #endif /* VFIO_USER_H */
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index ebfabb1..db45179 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3448,6 +3448,11 @@ struct VFIOValidOps vfio_pci_valid_ops = {
  * vfio-user routines.
  */
 
+static void vfio_user_pci_process_req(void *opaque, VFIOUserMsg *msg)
+{
+
+}
+
 /*
  * Emulated devices don't use host hot reset
  */
@@ -3501,6 +3506,11 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
         return;
     }
     vbasedev->proxy = proxy;
+    vfio_user_set_handler(vbasedev, vfio_user_pci_process_req, vdev);
+
+    if (udev->send_queued) {
+        proxy->flags |= VFIO_PROXY_FORCE_QUEUED;
+    }
 
     vbasedev->name = g_strdup_printf("VFIO user <%s>", udev->sock_name);
     vbasedev->dev = DEVICE(vdev);
@@ -3524,7 +3534,7 @@ static void vfio_user_instance_finalize(Object *obj)
 
 static Property vfio_user_pci_dev_properties[] = {
     DEFINE_PROP_STRING("socket", VFIOUserPCIDevice, sock_name),
-    DEFINE_PROP_BOOL("secure-dma", VFIOUserPCIDevice, secure_dma, false),
+    DEFINE_PROP_BOOL("x-send-queued", VFIOUserPCIDevice, send_queued, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 92d4e03..f662ae0 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -25,9 +25,27 @@
 #include "sysemu/iothread.h"
 #include "user.h"
 
+static uint64_t max_xfer_size = VFIO_USER_DEF_MAX_XFER;
 static IOThread *vfio_user_iothread;
+
 static void vfio_user_shutdown(VFIOProxy *proxy);
+static VFIOUserMsg *vfio_user_getmsg(VFIOProxy *proxy, VFIOUserHdr *hdr,
+                                     VFIOUserFDs *fds);
+static VFIOUserFDs *vfio_user_getfds(int numfds);
+static void vfio_user_recycle(VFIOProxy *proxy, VFIOUserMsg *msg);
+
+static void vfio_user_recv(void *opaque);
+static int vfio_user_recv_one(VFIOProxy *proxy);
+static void vfio_user_cb(void *opaque);
 
+static void vfio_user_request(void *opaque);
+
+
+static inline void vfio_user_set_error(VFIOUserHdr *hdr, uint32_t err)
+{
+    hdr->flags |= VFIO_USER_ERROR;
+    hdr->error_reply = err;
+}
 
 /*
  * Functions called by main, CPU, or iothread threads
@@ -39,11 +57,259 @@ static void vfio_user_shutdown(VFIOProxy *proxy)
     qio_channel_set_aio_fd_handler(proxy->ioc, proxy->ctx, NULL, NULL, NULL);
 }
 
+static VFIOUserMsg *vfio_user_getmsg(VFIOProxy *proxy, VFIOUserHdr *hdr,
+                                     VFIOUserFDs *fds)
+{
+    VFIOUserMsg *msg;
+
+    msg = QTAILQ_FIRST(&proxy->free);
+    if (msg != NULL) {
+        QTAILQ_REMOVE(&proxy->free, msg, next);
+    } else {
+        msg = g_malloc0(sizeof(*msg));
+        qemu_cond_init(&msg->cv);
+    }
+
+    msg->hdr = hdr;
+    msg->fds = fds;
+    return msg;
+}
+
+/*
+ * Recycle a message list entry to the free list.
+ */
+static void vfio_user_recycle(VFIOProxy *proxy, VFIOUserMsg *msg)
+{
+    if (msg->type == VFIO_MSG_NONE) {
+        error_printf("vfio_user_recycle - freeing free msg\n");
+        return;
+    }
+
+    /* free msg buffer if no one is waiting to consume the reply */
+    if (msg->type == VFIO_MSG_NOWAIT || msg->type == VFIO_MSG_ASYNC) {
+        g_free(msg->hdr);
+    }
+
+    msg->type = VFIO_MSG_NONE;
+    msg->hdr = NULL;
+    msg->fds = NULL;
+    msg->complete = false;
+    QTAILQ_INSERT_HEAD(&proxy->free, msg, next);
+}
+
+static VFIOUserFDs *vfio_user_getfds(int numfds)
+{
+    VFIOUserFDs *fds = g_malloc0(sizeof(*fds) + (numfds * sizeof(int)));
+
+    fds->fds = (int *)((char *)fds + sizeof(*fds));
+
+    return fds;
+}
 
 /*
  * Functions only called by iothread
  */
 
+static void vfio_user_recv(void *opaque)
+{
+    VFIOProxy *proxy = opaque;
+
+
+    QEMU_LOCK_GUARD(&proxy->lock);
+
+    if (proxy->state == VFIO_PROXY_CONNECTED) {
+        while (vfio_user_recv_one(proxy) == 0) {
+            ;
+        }
+    }
+}
+
+/*
+ * Receive and process one incoming message.
+ *
+ * For replies, find matching outgoing request and wake any waiters.
+ * For requests, queue in incoming list and run request BH.
+ */
+static int vfio_user_recv_one(VFIOProxy *proxy)
+{
+    VFIOUserMsg *msg = NULL;
+    g_autofree int *fdp = NULL;
+    VFIOUserFDs *reqfds;
+    VFIOUserHdr hdr;
+    struct iovec iov = {
+        .iov_base = &hdr,
+        .iov_len = sizeof(hdr),
+    };
+    bool isreply = false;
+    int i, ret;
+    size_t msgleft, numfds = 0;
+    char *data = NULL;
+    char *buf = NULL;
+    Error *local_err = NULL;
+
+    /*
+     * Read header
+     */
+    ret = qio_channel_readv_full(proxy->ioc, &iov, 1, &fdp, &numfds,
+                                 &local_err);
+    if (ret == QIO_CHANNEL_ERR_BLOCK) {
+        return ret;
+    }
+    if (ret <= 0) {
+        /* read error or other side closed connection */
+        if (ret == 0) {
+            error_setg(&local_err, "vfio_user_recv server closed socket");
+        } else {
+            error_prepend(&local_err, "vfio_user_recv");
+        }
+        goto fatal;
+    }
+    if (ret < sizeof(msg)) {
+        error_setg(&local_err, "vfio_user_recv short read of header");
+        goto fatal;
+    }
+
+    /*
+     * Validate header
+     */
+    if (hdr.size < sizeof(VFIOUserHdr)) {
+        error_setg(&local_err, "vfio_user_recv bad header size");
+        goto fatal;
+    }
+    switch (hdr.flags & VFIO_USER_TYPE) {
+    case VFIO_USER_REQUEST:
+        isreply = false;
+        break;
+    case VFIO_USER_REPLY:
+        isreply = true;
+        break;
+    default:
+        error_setg(&local_err, "vfio_user_recv unknown message type");
+        goto fatal;
+    }
+
+    /*
+     * For replies, find the matching pending request.
+     * For requests, reap incoming FDs.
+     */
+    if (isreply) {
+        QTAILQ_FOREACH(msg, &proxy->pending, next) {
+            if (hdr.id == msg->id) {
+                break;
+            }
+        }
+        if (msg == NULL) {
+            error_setg(&local_err, "vfio_user_recv unexpected reply");
+            goto err;
+        }
+        QTAILQ_REMOVE(&proxy->pending, msg, next);
+
+        /*
+         * Process any received FDs
+         */
+        if (numfds != 0) {
+            if (msg->fds == NULL || msg->fds->recv_fds < numfds) {
+                error_setg(&local_err, "vfio_user_recv unexpected FDs");
+                goto err;
+            }
+            msg->fds->recv_fds = numfds;
+            memcpy(msg->fds->fds, fdp, numfds * sizeof(int));
+        }
+    } else {
+        if (numfds != 0) {
+            reqfds = vfio_user_getfds(numfds);
+            memcpy(reqfds->fds, fdp, numfds * sizeof(int));
+        } else {
+            reqfds = NULL;
+        }
+    }
+
+    /*
+     * Put the whole message into a single buffer.
+     */
+    if (isreply) {
+        if (hdr.size > msg->rsize) {
+            error_setg(&local_err,
+                       "vfio_user_recv reply larger than recv buffer");
+            goto err;
+        }
+        *msg->hdr = hdr;
+        data = (char *)msg->hdr + sizeof(hdr);
+    } else {
+        if (hdr.size > max_xfer_size) {
+            error_setg(&local_err, "vfio_user_recv request larger than max");
+            goto err;
+        }
+        buf = g_malloc0(hdr.size);
+        memcpy(buf, &hdr, sizeof(hdr));
+        data = buf + sizeof(hdr);
+        msg = vfio_user_getmsg(proxy, (VFIOUserHdr *)buf, reqfds);
+        msg->type = VFIO_MSG_REQ;
+    }
+
+    msgleft = hdr.size - sizeof(hdr);
+    if (msgleft != 0) {
+        ret = qio_channel_read(proxy->ioc, data, msgleft, &local_err);
+        /* error or would block */
+        if (ret < 0) {
+            goto fatal;
+        }
+        if (ret != msgleft) {
+            error_setg(&local_err, "vfio_user_recv short read of msg body");
+            goto fatal;
+        }
+    }
+
+    /*
+     * Replies signal a waiter, if none just check for errors
+     * and free the message buffer.
+     *
+     * Requests get queued for the BH.
+     */
+    if (isreply) {
+        msg->complete = true;
+        if (msg->type == VFIO_MSG_WAIT) {
+            qemu_cond_signal(&msg->cv);
+        } else {
+            if (hdr.flags & VFIO_USER_ERROR) {
+                error_printf("vfio_user_rcv error reply on async request ");
+                error_printf("command %x error %s\n", hdr.command,
+                             strerror(hdr.error_reply));
+            }
+            /* youngest nowait msg has been ack'd */
+            if (proxy->last_nowait == msg) {
+                proxy->last_nowait = NULL;
+            }
+            vfio_user_recycle(proxy, msg);
+        }
+    } else {
+        QTAILQ_INSERT_TAIL(&proxy->incoming, msg, next);
+        qemu_bh_schedule(proxy->req_bh);
+    }
+    return 0;
+
+    /*
+     * fatal means the other side closed or we don't trust the stream
+     * err means this message is corrupt
+     */
+fatal:
+    vfio_user_shutdown(proxy);
+    proxy->state = VFIO_PROXY_ERROR;
+
+err:
+    for (i = 0; i < numfds; i++) {
+        close(fdp[i]);
+    }
+    if (isreply && msg != NULL) {
+        /* force an error to keep sending thread from hanging */
+        vfio_user_set_error(msg->hdr, EINVAL);
+        msg->complete = true;
+        qemu_cond_signal(&msg->cv);
+    }
+    error_report_err(local_err);
+    return -1;
+}
+
 static void vfio_user_cb(void *opaque)
 {
     VFIOProxy *proxy = opaque;
@@ -59,6 +325,51 @@ static void vfio_user_cb(void *opaque)
  * Functions called by main or CPU threads
  */
 
+/*
+ * Process incoming requests.
+ *
+ * The bus-specific callback has the form:
+ *    request(opaque, msg)
+ * where 'opaque' was specified in vfio_user_set_handler
+ * and 'msg' is the inbound message.
+ *
+ * The callback is responsible for disposing of the message buffer,
+ * usually by re-using it when calling vfio_send_reply or vfio_send_error,
+ * both of which free their message buffer when the reply is sent.
+ *
+ * If the callback uses a new buffer, it needs to free the old one.
+ */
+static void vfio_user_request(void *opaque)
+{
+    VFIOProxy *proxy = opaque;
+    VFIOUserMsgQ new, free;
+    VFIOUserMsg *msg;
+
+    /* reap all incoming */
+    WITH_QEMU_LOCK_GUARD(&proxy->lock) {
+        new = proxy->incoming;
+        QTAILQ_INIT(&proxy->incoming);
+    }
+    QTAILQ_INIT(&free);
+
+    /* process list */
+    while (!QTAILQ_EMPTY(&new)) {
+        msg = QTAILQ_FIRST(&new);
+        QTAILQ_REMOVE(&new, msg, next);
+        proxy->request(proxy->req_arg, msg);
+        QTAILQ_INSERT_HEAD(&free, msg, next);
+    }
+
+    /* free list */
+    WITH_QEMU_LOCK_GUARD(&proxy->lock) {
+        while (!QTAILQ_EMPTY(&free)) {
+            msg = QTAILQ_FIRST(&free);
+            QTAILQ_REMOVE(&free, msg, next);
+            vfio_user_recycle(proxy, msg);
+        }
+    }
+}
+
 static QLIST_HEAD(, VFIOProxy) vfio_user_sockets =
     QLIST_HEAD_INITIALIZER(vfio_user_sockets);
 
@@ -97,6 +408,7 @@ VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp)
     }
 
     proxy->ctx = iothread_get_aio_context(vfio_user_iothread);
+    proxy->req_bh = qemu_bh_new(vfio_user_request, proxy);
 
     QTAILQ_INIT(&proxy->outgoing);
     QTAILQ_INIT(&proxy->incoming);
@@ -107,6 +419,18 @@ VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp)
     return proxy;
 }
 
+void vfio_user_set_handler(VFIODevice *vbasedev,
+                           void (*handler)(void *opaque, VFIOUserMsg *msg),
+                           void *req_arg)
+{
+    VFIOProxy *proxy = vbasedev->proxy;
+
+    proxy->request = handler;
+    proxy->req_arg = req_arg;
+    qio_channel_set_aio_fd_handler(proxy->ioc, proxy->ctx,
+                                   vfio_user_recv, NULL, proxy);
+}
+
 void vfio_user_disconnect(VFIOProxy *proxy)
 {
     VFIOUserMsg *r1, *r2;
@@ -122,6 +446,8 @@ void vfio_user_disconnect(VFIOProxy *proxy)
     }
     object_unref(OBJECT(proxy->ioc));
     proxy->ioc = NULL;
+    qemu_bh_delete(proxy->req_bh);
+    proxy->req_bh = NULL;
 
     proxy->state = VFIO_PROXY_CLOSING;
     QTAILQ_FOREACH_SAFE(r1, &proxy->outgoing, next, r2) {
diff --git a/MAINTAINERS b/MAINTAINERS
index f429bab..52d37dd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1888,6 +1888,7 @@ S: Supported
 F: docs/devel/vfio-user.rst
 F: hw/vfio/user.c
 F: hw/vfio/user.h
+F: hw/vfio/user-protocol.h
 
 vhost
 M: Michael S. Tsirkin <mst@redhat.com>
-- 
1.8.3.1


