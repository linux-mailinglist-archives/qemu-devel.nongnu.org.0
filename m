Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE0F694882
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 15:47:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRa76-0002A5-9b; Mon, 13 Feb 2023 09:47:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1pRa73-00029Y-R4
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:47:26 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1pRa70-0006nM-GP
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:47:25 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31DARPmx017486; Mon, 13 Feb 2023 14:47:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2022-7-12;
 bh=GyNXZUpmZC930Msf6FPcUoTy1c7j73IA6Gw7kONz9oU=;
 b=lflUZ3XAmAuU01yJTUDDM+iuafw/N6d8BSV5vtfwfAlkFvPtGOT14vntIsMwU1wFwKzT
 tH3rm1PJxIY3Qi5qcrXz9v+4gJKpRAMpoLLCatVgJTZvFkHQSzss0clizGc7seQVOZT+
 0ne9N6Vg6O52etfrfxya3AnKiubr96lMcYpJ2j9q8cftYrWC0ZrqKNQgyGtlj05H0LWf
 LJuiI3KqYRBHRqjyHCCuVErGjPjF1qg7LGY0IZQFehKq0+VBWJGtBfIWxwXPw2+/wgIY
 Y4sbLZgKuyW5ymZqN0SnGlxDdYF6ah8J5CBzeB4GnUwK1CVaTEj1cj9Ml6cp1m7sD47g 2g== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np1t3awku-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 14:47:17 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31DD5LbT013578; Mon, 13 Feb 2023 14:47:16 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3np1f474rj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 14:47:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igb289alSuBHb2vRI7/3iQ7oIP6IK66L1rGQq41zDY2pJaIS7XJCTwVOAmVNKVKqrEcoiXZ943wpsDisUJGk/Sjqq4D7rbW9NjnGy0WZKvkHh8CBgfbZp7rVAfBu8+Owetaq8I+CnRL5segZV+Qij6G7u5BPBm8W422LMCudoggh1WV5A6QyPuZaAmYewh8dLHK0yfr06ALk2u2rrZ2DBkr2pCzkpHHXpmtmCZCPxe7Tkh5JXW58ORnKnKrFU++rRAvOhZZYnTa2Qk3XXIt31OXy9ejNlXNIifrDcGuHdGo9yPuNw1nqhb2izqxXSGJbDUZqVmLI2nWg7+G1rzlmnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GyNXZUpmZC930Msf6FPcUoTy1c7j73IA6Gw7kONz9oU=;
 b=AjwJGoovVTDaqWJBDim434AFLZ8YAAJMa0QNWAiqDMSUpU/5NI+cTP+2bXRpnyIO0r8yKjSSUFBYpC5JlmdGdME7Yij1aBHwnq187zSocd/8oAg7WDWWe9+uP6cgIRpw6/27bdxK5TzGVOpxO7zEQWfD6DwRueh3Ngjk5RWjC6iAzGXdu5eOpm1OFgb8aIuaK2sHiSN+6sApvQMKKPklcXlgsHmQ+o65qyZq7ewEEIJuVW9ZSOUjyEuBiYneJPFRNIlyNJ5pb3FcIjVVtgqhOiYWtNdZSFSZ6cOBYKfjeM069Pw+siuXe3ERFm1MdMtlo4Tbxni6bQvdCmZkZx4hZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GyNXZUpmZC930Msf6FPcUoTy1c7j73IA6Gw7kONz9oU=;
 b=j3FGUxJW+99NiwI6fHMzU+5sdXXVrx5+G7PUQA9xKKKj7opx77EH4VSJX5mtsc1mReCSHAO2HL2HJGs26cjPEUEdfbnHh3eTikKCJASnCI7c1fL8HG1BIOqZRc4LzFZPJTrO3PaVkdDXvfH+XArMkwNlliwhB2zLwl7yOqoRIBA=
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by DS7PR10MB5230.namprd10.prod.outlook.com (2603:10b6:5:38e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.10; Mon, 13 Feb
 2023 14:47:12 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::8a7d:60c:7965:98c3]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::8a7d:60c:7965:98c3%7]) with mapi id 15.20.6111.010; Mon, 13 Feb 2023
 14:47:11 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 09/10] fuzz: remove fork-fuzzing scaffolding
In-Reply-To: <20230205042951.3570008-10-alxndr@bu.edu>
References: <20230205042951.3570008-1-alxndr@bu.edu>
 <20230205042951.3570008-10-alxndr@bu.edu>
Date: Mon, 13 Feb 2023 14:47:08 +0000
Message-ID: <m27cwlr5ar.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0296.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::31) To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5138:EE_|DS7PR10MB5230:EE_
X-MS-Office365-Filtering-Correlation-Id: ac2e9606-eae5-4765-628c-08db0dd13066
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mrqlldeP0tKKYyKb2sBSn05nggeXPu2zCYigsNwN+IowBVhZzUU7SSDRjPh/7pmF0A8NyaC7PDOiN9DUrxMwF2ODmKVVWf6sJK1HSn4iglj0XH59EtBmAMVlRW15+B7S1mmSMw0jgkO7hpq+J1nj2nrxyUG76TaJRBEa32JYkyQ890WwnUKkBS12j+wClhtAgHugWHhBbzArYUbOqDLCKAOmQCp2Vi5mjdIMN300MCJ1mFcqYNeXkpf5ce7hQo7dyQ3W325JZM2sFKMWvBuk8FD+cp99iwLHXHYFuxP/gN5LhRUk8hNkD3eTF82SWEAXU0UqB1QesZmErRUsoIZYcW3WW99q9IqP1j9pPVdQ6EuKEOV4PhGKGZC41taksIAHuz2gsE7MHDqOj51ySqSEC0bVD+/m+QoDYBNLgRsfn8uYrd/ioMFvxIxEMWMuW0w6Exi8JIw/vY9oCLKdrLKyHyd4kCotpw2kzp0qRcwTfvhqSM8HiG7P90qxwnDvyqH5uD5x6m6QeN/II8VvzHm+T9lSUuOEELeJVAoiahCseG8iVg+PahTYqT6SedB48Ivfnm0WIkMh7gEDaIKlRjWL7Rp8rryK8/ecOIBX7u0xvhVfqAkEBgwLWlcmOSkQCQogW71uoeqBfjphijJvjFKYbg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(376002)(136003)(39860400002)(366004)(396003)(451199018)(316002)(38100700002)(6486002)(478600001)(54906003)(86362001)(2616005)(83380400001)(6666004)(6512007)(6506007)(26005)(186003)(36756003)(2906002)(41300700001)(7416002)(8936002)(44832011)(66556008)(4326008)(66476007)(8676002)(66946007)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QHEjmQ6luS6uw0C5/wzaaBcu0YAhp2TJQ4iIbqMfbRb73YN6turRGEiKxWBX?=
 =?us-ascii?Q?twArd3XiZuXX2HYcizLYCbOMw3yvLgSzw1sHWO3Fz1myOLB+F94A4+7iMdFD?=
 =?us-ascii?Q?Jsi+/n1a9FWzmpX6cp5QYOtvWMnXL4fyNxLsfYdTmhVdIJ3BAWSUP1yL6Fsc?=
 =?us-ascii?Q?sfeM/ZfRQvC1wOGNsF+737I5VEfbR8fXfX7Pzu6ZJtdqxrjcezyIBJ6ccCUM?=
 =?us-ascii?Q?TRbqwD2BxnDAZ+LhrDv/+IdrEZJWnEe1thpxTWZ0xsFl5uv5f61ESVSpNPAA?=
 =?us-ascii?Q?/1w/X5xLMVcnq6hJmblsWrDLt8n/ll6el65HvnlsCgK8WXqQs6i9aZTliYl+?=
 =?us-ascii?Q?Cj9K5qtGtDWLSR/I1pH6g/JoP6H4Aw1/bvr/2hy5nlOnQsFSgBt2xujFSEOo?=
 =?us-ascii?Q?8b80fKaJ4W1qsfkbm44+7Osjtc6bzAYT3zh5PuIvTbunCTfV8URVgF9M8UFU?=
 =?us-ascii?Q?iqVTF0A2/dknoHb0Y39o8dS1jGFwUjjCwEPnFAXrg12QystG82yTGUIIfRol?=
 =?us-ascii?Q?60WRcqH3YSQbSPryThtEMsQ87Eq/j4C0/lkFLLdSV2s2fT0srAx2MZYMMwjl?=
 =?us-ascii?Q?O93F5+QOtoytDp4APNwZ5LDLDA3Wtc00tEgSGlTLqpdHOrYwaDI8vMftW8Qc?=
 =?us-ascii?Q?qa1RYBgN9g5QbWfLmp9tpONjP/YdlecPFN6A4g8RfSMn/v7iwn0mOAaVDFoO?=
 =?us-ascii?Q?c2WAYOAr699/JzH6kXaevvSBc4kyxLcxd28xcxEgayWuCe6myv937FXsWmWe?=
 =?us-ascii?Q?u7i5lDfpU+SoK6tY5yAH5x0lS2Vp6AWxaMFIKviRaAYfuSo1sxR+BIuAWHj2?=
 =?us-ascii?Q?2MiZXTYRboe7pcPB1ltfrj+OnPwFsPNEEMlLngNYWrHI5ASREZrvL57llkHp?=
 =?us-ascii?Q?+3q8Xl/62K9tu9bKgMwCnv6gtFtC+ZYdDWfs5DqkYMVWaoZwUKrznAczEJEf?=
 =?us-ascii?Q?wNwidCyg523/zIWzytiwjgkfdodFkkyoFBdpxKoqEgM+DZBWAz07fIqnCYiX?=
 =?us-ascii?Q?dKpAeNf9nRxbc6YtTHx7kYevz6ap2NE95648tWeDPSxdVjKJSYBRB0kzpX7U?=
 =?us-ascii?Q?CRdKUqiMR+RxL0ZVubFthlb2wdNH8awJxusW44sjXG8jdeoAzgLwDarbluFt?=
 =?us-ascii?Q?5bl6dz2KDmttXM3mN5RrGH2t4zhJwdWHEMIURaAyJ952l2MRg83pl/D51gN4?=
 =?us-ascii?Q?EQgcWepakGxhTMEpOND0PYLH7mWeWuz1LlNn8CgSAYFid04892e1RMDxJViP?=
 =?us-ascii?Q?20jXTGzPzo4PZjk/xS2fa4UJVa+pqLcM7OdJVZnjGoQuKaYIxXgqww03smFE?=
 =?us-ascii?Q?2Uf+Cq8RKV3XbbbmiaZmo34eCSzhaNYf29Xp57B/MQCxt919laXRBxZ56k1l?=
 =?us-ascii?Q?IDN2nNbT2vioL275VrLZaVbP2vlip+eL89zbwTvT3ZZuFhli/DKs/dkbbQv6?=
 =?us-ascii?Q?v9tRffAlX/DcHR8gO5MW+QT0bg+HzITaJ2NWBYd+iv3uJeGu/WTM55xXG5Mt?=
 =?us-ascii?Q?WWkiwTBGp7DSZvMB+dyPHoD0l41nG/oQmbyoi8ZniG9oiEE7rkFCSGsuwjKV?=
 =?us-ascii?Q?AaZrYVGM5DjTuxZbU8Fca8Jnro2rOpv1FvcVnV/je5x6SdwWZtFoNFXXkXmU?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: C96iLr1bAlhMfyje8Xj05K7jcCEtOphrX9ZbLmVxp9AAf9mY2o6R022ENsd2OpsCIbD7QkERWXQJe3s5ZeF4UqhWOxGwSIOGpVY+uOg4DummWVQTlUmdTf+4Icr7DJYBKF3XDhiiNq4weSx8M6u9ZehD2h90bPyVh2+7cVSd4tPM1Ckzgy25JWns4oRyhIDBSEPKDW97cTbstdTOJjlXYl4q2q+dmduarbHSWDCc2uB7/rlkMEqwFU92OtUWVmBqJ9WbFTdvFEqnSiVry5qzhcTV4h9cziwQXbTN5jc+/QLdX0v5ivv33p8MD2wDxy0btinI9MCd7UwtDVrM3QexOdBnYamo9CUOMcWxurDJRwm4t4fiOyrQ1a/MmWtF2Zf4UpvirQwyIBDye0/JIe3UUNrYf1BtxeHdwUjoPu9Pm0RYMeZRCt47hKAiHdjBV7QF4GQtqTZHGFlF1yEHmUGujfkzcuo012nanwhdK8pvFa888nuYv/V6PJHvTtt6r9BEVvQ77/CM6Uvdh+2vwFwzZP7iMFLC5rasOaiFhAtpUMt6OPYPRDoM4pdcQoXdv7QRn3SA8kg3Ero+mHOPNdQjZyeYMSFMsFa7kLrcuFphEPajb0Exrf7421RdJwVGwaoGKuQN5s8xpMgbgfrFH19T4Oq38BjNKJ3smwKSudSxGNd7NiUJ0OqFlR8N6+qfT2oxfdST/t4pD2Wdb5V+yZ5dCNBJGaW6Np51iQnqC41yJfb9EJFGVtax3pH689Ddz3ANG4DpXrbX7ba890g2BkMl+MmOV1FcOaUmrgcL3b+iVOMF87u7GFyfI48LRkre4+gdttk5hUDNTaLROvNExPi82vFPUTTS+3W05iv+if9/HLc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac2e9606-eae5-4765-628c-08db0dd13066
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 14:47:11.6742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gejkjXEsIxejjhJ3dQuXp7EDQRHSuJSSrop1mFAV9e7r1gFyPIXpzf5/dqnRHhkmcVLAo00Nf6Q82WPAh7t1fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5230
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_09,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 phishscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302130133
X-Proofpoint-GUID: OWqDDiA57qmH1DIB6zHbuHGsUHwiXO2L
X-Proofpoint-ORIG-GUID: OWqDDiA57qmH1DIB6zHbuHGsUHwiXO2L
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0b-00069f02.pphosted.com
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

On Saturday, 2023-02-04 at 23:29:50 -05, Alexander Bulekov wrote:
> Fork-fuzzing provides a few pros, but our implementation prevents us
> from using fuzzers other than libFuzzer, and may be causing issues such
> as coverage-failure builds on OSS-Fuzz. It is not a great long-term
> solution as it depends on internal implementation details of libFuzzer
> (which is no longer in active development). Remove it in favor of other
> methods of resetting state between inputs.
>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

Thanks,

Darren.

> ---
>  meson.build                   |  4 ---
>  tests/qtest/fuzz/fork_fuzz.c  | 41 -------------------------
>  tests/qtest/fuzz/fork_fuzz.h  | 23 --------------
>  tests/qtest/fuzz/fork_fuzz.ld | 56 -----------------------------------
>  tests/qtest/fuzz/meson.build  |  6 ++--
>  5 files changed, 3 insertions(+), 127 deletions(-)
>  delete mode 100644 tests/qtest/fuzz/fork_fuzz.c
>  delete mode 100644 tests/qtest/fuzz/fork_fuzz.h
>  delete mode 100644 tests/qtest/fuzz/fork_fuzz.ld
>
> diff --git a/meson.build b/meson.build
> index 6d3b665629..8be27c2408 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -215,10 +215,6 @@ endif
>  # Specify linker-script with add_project_link_arguments so that it is not placed
>  # within a linker --start-group/--end-group pair
>  if get_option('fuzzing')
> -  add_project_link_arguments(['-Wl,-T,',
> -                              (meson.current_source_dir() / 'tests/qtest/fuzz/fork_fuzz.ld')],
> -                             native: false, language: all_languages)
> -
>    # Specify a filter to only instrument code that is directly related to
>    # virtual-devices.
>    configure_file(output: 'instrumentation-filter',
> diff --git a/tests/qtest/fuzz/fork_fuzz.c b/tests/qtest/fuzz/fork_fuzz.c
> deleted file mode 100644
> index 6ffb2a7937..0000000000
> --- a/tests/qtest/fuzz/fork_fuzz.c
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -/*
> - * Fork-based fuzzing helpers
> - *
> - * Copyright Red Hat Inc., 2019
> - *
> - * Authors:
> - *  Alexander Bulekov   <alxndr@bu.edu>
> - *
> - * This work is licensed under the terms of the GNU GPL, version 2 or later.
> - * See the COPYING file in the top-level directory.
> - *
> - */
> -
> -#include "qemu/osdep.h"
> -#include "fork_fuzz.h"
> -
> -
> -void counter_shm_init(void)
> -{
> -    /* Copy what's in the counter region to a temporary buffer.. */
> -    void *copy = malloc(&__FUZZ_COUNTERS_END - &__FUZZ_COUNTERS_START);
> -    memcpy(copy,
> -           &__FUZZ_COUNTERS_START,
> -           &__FUZZ_COUNTERS_END - &__FUZZ_COUNTERS_START);
> -
> -    /* Map a shared region over the counter region */
> -    if (mmap(&__FUZZ_COUNTERS_START,
> -             &__FUZZ_COUNTERS_END - &__FUZZ_COUNTERS_START,
> -             PROT_READ | PROT_WRITE, MAP_SHARED | MAP_FIXED | MAP_ANONYMOUS,
> -             0, 0) == MAP_FAILED) {
> -        perror("Error: ");
> -        exit(1);
> -    }
> -
> -    /* Copy the original data back to the counter-region */
> -    memcpy(&__FUZZ_COUNTERS_START, copy,
> -           &__FUZZ_COUNTERS_END - &__FUZZ_COUNTERS_START);
> -    free(copy);
> -}
> -
> -
> diff --git a/tests/qtest/fuzz/fork_fuzz.h b/tests/qtest/fuzz/fork_fuzz.h
> deleted file mode 100644
> index 9ecb8b58ef..0000000000
> --- a/tests/qtest/fuzz/fork_fuzz.h
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -/*
> - * Fork-based fuzzing helpers
> - *
> - * Copyright Red Hat Inc., 2019
> - *
> - * Authors:
> - *  Alexander Bulekov   <alxndr@bu.edu>
> - *
> - * This work is licensed under the terms of the GNU GPL, version 2 or later.
> - * See the COPYING file in the top-level directory.
> - *
> - */
> -
> -#ifndef FORK_FUZZ_H
> -#define FORK_FUZZ_H
> -
> -extern uint8_t __FUZZ_COUNTERS_START;
> -extern uint8_t __FUZZ_COUNTERS_END;
> -
> -void counter_shm_init(void);
> -
> -#endif
> -
> diff --git a/tests/qtest/fuzz/fork_fuzz.ld b/tests/qtest/fuzz/fork_fuzz.ld
> deleted file mode 100644
> index cfb88b7fdb..0000000000
> --- a/tests/qtest/fuzz/fork_fuzz.ld
> +++ /dev/null
> @@ -1,56 +0,0 @@
> -/*
> - * We adjust linker script modification to place all of the stuff that needs to
> - * persist across fuzzing runs into a contiguous section of memory. Then, it is
> - * easy to re-map the counter-related memory as shared.
> - */
> -
> -SECTIONS
> -{
> -  .data.fuzz_start : ALIGN(4K)
> -  {
> -      __FUZZ_COUNTERS_START = .;
> -      __start___sancov_cntrs = .;
> -      *(_*sancov_cntrs);
> -      __stop___sancov_cntrs = .;
> -
> -      /* Lowest stack counter */
> -      *(__sancov_lowest_stack);
> -  }
> -}
> -INSERT AFTER .data;
> -
> -SECTIONS
> -{
> -  .data.fuzz_ordered :
> -  {
> -      /*
> -       * Coverage counters. They're not necessary for fuzzing, but are useful
> -       * for analyzing the fuzzing performance
> -       */
> -      __start___llvm_prf_cnts = .;
> -      *(*llvm_prf_cnts);
> -      __stop___llvm_prf_cnts = .;
> -
> -      /* Internal Libfuzzer TracePC object which contains the ValueProfileMap */
> -      FuzzerTracePC*(.bss*);
> -      /*
> -       * In case the above line fails, explicitly specify the (mangled) name of
> -       * the object we care about
> -       */
> -       *(.bss._ZN6fuzzer3TPCE);
> -  }
> -}
> -INSERT AFTER .data.fuzz_start;
> -
> -SECTIONS
> -{
> -  .data.fuzz_end : ALIGN(4K)
> -  {
> -      __FUZZ_COUNTERS_END = .;
> -  }
> -}
> -/*
> - * Don't overwrite the SECTIONS in the default linker script. Instead insert the
> - * above into the default script
> - */
> -INSERT AFTER .data.fuzz_ordered;
> diff --git a/tests/qtest/fuzz/meson.build b/tests/qtest/fuzz/meson.build
> index 189901d4a2..4d10b47b8f 100644
> --- a/tests/qtest/fuzz/meson.build
> +++ b/tests/qtest/fuzz/meson.build
> @@ -2,7 +2,7 @@ if not get_option('fuzzing')
>    subdir_done()
>  endif
>  
> -specific_fuzz_ss.add(files('fuzz.c', 'fork_fuzz.c', 'qos_fuzz.c',
> +specific_fuzz_ss.add(files('fuzz.c', 'qos_fuzz.c',
>                             'qtest_wrappers.c'), qos)
>  
>  # Targets
> @@ -12,7 +12,7 @@ specific_fuzz_ss.add(when: 'CONFIG_VIRTIO_SCSI', if_true: files('virtio_scsi_fuz
>  specific_fuzz_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio_blk_fuzz.c'))
>  specific_fuzz_ss.add(files('generic_fuzz.c'))
>  
> -fork_fuzz = declare_dependency(
> +fuzz_ld = declare_dependency(
>    link_args: fuzz_exe_ldflags +
>               ['-Wl,-wrap,qtest_inb',
>                '-Wl,-wrap,qtest_inw',
> @@ -35,4 +35,4 @@ fork_fuzz = declare_dependency(
>                '-Wl,-wrap,qtest_memset']
>  )
>  
> -specific_fuzz_ss.add(fork_fuzz)
> +specific_fuzz_ss.add(fuzz_ld)
> -- 
> 2.39.0

