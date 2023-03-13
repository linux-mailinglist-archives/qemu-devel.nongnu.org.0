Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E66DA6B775F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 13:24:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbhDB-0001UT-Nf; Mon, 13 Mar 2023 08:23:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1pbhDA-0001Rx-IO
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 08:23:32 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1pbhD9-0003NC-0F
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 08:23:32 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32CMt40b015673; Mon, 13 Mar 2023 12:23:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2022-7-12;
 bh=ODOBTQ7/7PiTQ70/SzsfIvcShfxIqZElnCGhj3isN7A=;
 b=Ohvlh9imbU25rNn87gnzX2ht+wBSq5Yrx2dNCQQ17qgQUI1MKdFA7yGsxeJdDzzFa79g
 lALjJ9/TYzBkaKY5pr8XJp4ihZ9dAq2UDXt77AXhuEBPXZvPmo3xXuEopest3hjBmi9s
 dqaBrTpK5sEVUvxrbLkJlFk1Ce2jRtqz1B7NgY5mDJLijRB/n8hfy41Cv+1N79Axx9+f
 /FoND/l6VBO5pGF2CO6lSSfgITKbGayldMb5y2XS7osnS/9HL5rhX/1O5zF9XPnThQ/n
 QACvJUYnlsDQ6mUw6SoH58FNCZ6BaagtK2JLAdrTvs5SC6jh1ubNIHlVmTnf4i2PIVrJ Gw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p8g2dkneh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Mar 2023 12:23:07 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 32DBdF2M008106; Mon, 13 Mar 2023 12:23:07 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3p8g3bay2w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Mar 2023 12:23:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cbfPgcNvTw8fE/KvmZkA4ugRP1xU8BpqpLdMdXVFwTVKM86gfwoDvQa7ZtTEVS6/l+MqpG3X8RhKqaEqxujHmR9+L3xpdUcvV4esvZgeFYICioIgRy/u6rvWjQKvREZFqV4nr4GOjFtjk5odFpHqSQD/mjGjwvYM2kfK2zGNE1IQyodqLXswDaWHDG83jZa98XU3br7COvA+aXimJHhN9WT9/ZFySILHb7t6qw/UOiY2m3MiYgxS7aV99Ek7DNHmj5BaGnmc3SamFzYdCHUn21dXchXPRyn9NKN8yOpWx8yOTu5v3QpA6Q7ZlJzZLQg5jC5BHwGuxVWX0fSKlyBKLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ODOBTQ7/7PiTQ70/SzsfIvcShfxIqZElnCGhj3isN7A=;
 b=c3Rj2rLo20cbAbshZbXCnV+Ol3Ds15ZYdxaZ6r6DGbmxE6ksonwOnNslj+II1s+gYfQWktWLELQAF5bnrShnTrDpevcBHQg7XH7v/CmWgilbCjOy0u0FzeTp8KAFDpDXquMzgOUelkqbEzph+fx5w6FtUAoSYOeGkMg1E6gny40x0S+fj9tl05yvX3d0sNYnT0vkDedKXaAynS3M5KOCGtijNZZf9sTgagFXB3rcU6cYi3Q7O0f6SHGapmZYRs05yv9+iAOGD+vrBfzJ1sDoM5+SQCiAoz52Lj6pJy0OQg/4h+UEvacFidsgdSM2S0r7ZRCDnEVBq6pZLmUkYlkl7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ODOBTQ7/7PiTQ70/SzsfIvcShfxIqZElnCGhj3isN7A=;
 b=lUi8UGY29J0zB6hcuNYmsFs60WjaNT/E4gD78y4LDPHAFMVZlJ8ko10vZVGlhYZN+KHrTOnuAEcN4uRrB/g2kQIFuOc0WSV3cLNBah+PP5xku9L0MgSqBKEnKzci4lAnFJM0SKj5mAFcNFwtepK2DbhX0UGiK4yU4GrT62g6HB4=
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by BN0PR10MB5254.namprd10.prod.outlook.com (2603:10b6:408:117::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 12:23:04 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::8a7d:60c:7965:98c3]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::8a7d:60c:7965:98c3%5]) with mapi id 15.20.6178.025; Mon, 13 Mar 2023
 12:23:04 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Mauro
 Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>, Jason
 Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>, Gerd
 Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>, Laurent
 Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>, "Edgar E .
 Iglesias" <edgar.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, Eduardo
 Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>, Fiona Ebner <f.ebner@proxmox.com>,
 Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH v7 6/6] lsi53c895a: disable reentrancy detection for
 script RAM
In-Reply-To: <20230313082417.827484-7-alxndr@bu.edu>
References: <20230313082417.827484-1-alxndr@bu.edu>
 <20230313082417.827484-7-alxndr@bu.edu>
Date: Mon, 13 Mar 2023 12:23:01 +0000
Message-ID: <m235687sd6.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0233.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::17) To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5138:EE_|BN0PR10MB5254:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eccacf7-21a9-4f12-8100-08db23bdb1f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Deyy4y91EkbQ6Wtu8yLyiLG7sxygS7F9AyUzpS+KNNLhDr05RTpIaLhJaaYI01OCMlzVQutrdf38vOMN3P89WUVCu/ZfEZMdlmc3NsQH6fEgLTCO6NJAgRoK4ViQPHxCpLaRMZRPsobbRYzy070Ow2mvSnngel8i9jDf7p+KRyy+fDm6msWh/vVl/Rvrx3Ufx4arqqbC1p+l3wM/mkDHmA1DM58p53mhAXPQSZ5zE4yeD8qTLb42e7gbECGQHzCgLV/2zFQ3LY9y2N3f3HwzBxktu2bMkBIDmWOtjwXuDBHMUvn9dPfduzR29grW7+T6dwYh7VRjmCv2f+xtAy2DyFjOy7cj6CCMCZlkW120Wnt2smk+bmd0IMIvqIlhMmN3joCqP37EJBYp+2oxjrYx+HvEyUIM8TOwYQJMwPqnqSWqqP0GNoZlmKnhdgiWi5WX7IGQzOLlhXAKwjBCbLGBi1liNx0FBT49sDUuEGYbSH1r+eeyEe1lSDP8MA40PENPeGGp+XGBB6evk9X7QSb3fJ5z5lu91W6meVmEk95oW32HzyLu4gKnNwiGeJpIF6gJ6BNZVX15nhargamkgspdioxfaqMmzXLwlB/q54kfkhDxvZV1kOTfsUVP3w4ro6QsiqtNvldJYG0CFYtXti+vdg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(396003)(39860400002)(376002)(346002)(136003)(451199018)(2906002)(41300700001)(83380400001)(5660300002)(36756003)(44832011)(7416002)(66556008)(8936002)(66946007)(4326008)(66476007)(38100700002)(316002)(86362001)(8676002)(54906003)(478600001)(2616005)(186003)(6486002)(6666004)(6506007)(26005)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k/DvmQKBmDTiLSEK1ZSpwr2zFHbDxa05NuM/scrsaqRGea68bHiDpMCsr8Np?=
 =?us-ascii?Q?0uhV3Pst1K59eoipADMoW8OzR4d4500QleMzoN0tTlwYpLhcMfmG7lfYdnX8?=
 =?us-ascii?Q?YO9Lt5bVfN6uBq24wTLj4B9suVCnMxWEJcQlhTebNEPKLvnEVxMll740PgC3?=
 =?us-ascii?Q?D7FWlx7pFN1fyaEwnS08hwRinn2vWmWrmNaYkNwvgLXTpp5+TQ1MMTSe3+hq?=
 =?us-ascii?Q?83On82fN7fKiC7vjjz+qRFROWYPH/jvrECSwVXpakCP8vfFxD3jIgKimhMaj?=
 =?us-ascii?Q?aBTK6TQ7s2zhWDGrsMZC0vNqcMbqsiLw/uEtkuaHJCrpR4sxLHK8OeUecoS5?=
 =?us-ascii?Q?jHmLKNoX4lNAAsbCHqHBO8aVkxEDXw7V2iZLqJ2dIvIPu/aIRZaBPTOdy3+5?=
 =?us-ascii?Q?XIs9/ClGbgXVNveqyb8C7PmeutibXEBNrVbf6OU9z80JID/h9sKpYIMQ0Bms?=
 =?us-ascii?Q?dNVtQw29SW/wLuOXxnItRYnmYhFuiVNqcOpDMc7ERypZJ2HpFKeymvr6MLQv?=
 =?us-ascii?Q?vpRpEHwMnNo+vpWn2sHWS4JTwVF6yU2k2o49UojyaqKZ9XeoC/rVYgG5Shjw?=
 =?us-ascii?Q?K/X8LMU7mt4S3Nv5J7OWc7znT0qI0YYXU0quu0fXKD2o7/FOZNz1a+zUQNFK?=
 =?us-ascii?Q?uPRSOHhTHUvKjWQDaWI5KnmeyJyeIcoBM2i9nQUcpcO9G+CGxMFDp13ryE7r?=
 =?us-ascii?Q?TXmNsADT7f10NQO5xqOjN9bKJairvO+UhHYuPxYB9qkWONIsXF7U4F0Vaohp?=
 =?us-ascii?Q?sFX9PEvIOtWFxUp8TtBsUs8sxCD1ktRyMa2B6BtdwIFpRIq9rkEixrMCRhq7?=
 =?us-ascii?Q?m+PDe+z5u2RhIuWrveQJ9P1ITU+/jXh5RJjI3MISma4CPGIH7LZKLzTphKEh?=
 =?us-ascii?Q?zIN5tAl+IIBVp5nFbBBlhQ8ZBsxYYl8MWAHZAW40dUkCJ/Yc94KmNlMJNq3s?=
 =?us-ascii?Q?8WXfGmcZoEZUzNEHIOpyiJEfxIA66GX7lammJi/zU3kODBcMk/dMsy6ewd6A?=
 =?us-ascii?Q?MozVqpKP9jxWY+/k5TVa8VrtZbSc2UYF5ybdX0607czZQBqaLokytHmQgEP+?=
 =?us-ascii?Q?dMecy3yfmqYTcNZScNJ0x593N5KYzhRJuo2NJJSMVgnWauwX0ziS7SBXRNmR?=
 =?us-ascii?Q?PVn2YTQVHYopCpKH2LSXCCZNddmyP+9xTOrx0ECJuk4GOSu4/W6E2xH4+qWb?=
 =?us-ascii?Q?/nUTAtzQBh6bYkR4K+e5ojxl6fznsqZjgi7/lXlblE1qk80tlx+urIBNJVlR?=
 =?us-ascii?Q?b1ScepPBLNta9h7spc7B0kH1prykATbZEf11nnJELqTucMPaNugrYxavv5+E?=
 =?us-ascii?Q?utffu0PWhfGajn2SVpst21aL5gYO1U0Tp0j1KnRAJxn7eGdiJtW2oyvXy2Bc?=
 =?us-ascii?Q?zXqVFKBmzgCNUAy1Ixzwo14Oqi2+XLPmbiQpnQyeMWdC9sM6qHngae7+sadl?=
 =?us-ascii?Q?tpdKjMwi4bcfIsMhfTz0XmcfjcI5gyTfiK/HCWd3KxQ2Mfs4ANg4OMtSKs4V?=
 =?us-ascii?Q?ygvv8IWMYVpTfogtDhurMH4oE91TU0L6RcCBZeHsJ/l0p1V/DDtTm2gDlOQo?=
 =?us-ascii?Q?u/OTwdsxd0VidvzGPJpl2NWc6MEU3Z8jIafWylDcZ5zbjQ2tJcEUM8B4CzgV?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?K0C9jgU3LWWN4Xq+XL0fVjnAYWGh7pDEw5sky6uOi+cDlL9WqqVmmhBhy0IY?=
 =?us-ascii?Q?g3o/Cnhrh3FsjQttu8g46NsdwzMfQwbD2sGmwaDiSSt8I+RDqc7pauJZyETo?=
 =?us-ascii?Q?L0WrGZ117gZZryWQExfestOAD3kIlEntHq0YPNQJA+VIzu3DN1G8CjJqrVkp?=
 =?us-ascii?Q?59eHywVRBOvfqtsCY2L6VgbuENe+eCXtKkFOV0OreyqHPGkS/NOlkY3A8vBP?=
 =?us-ascii?Q?X39kLlsBBunWrE4uflcwB93EyRJq6Uht4Wuft7t4PKBGYRiPmZ9rlmdkSF09?=
 =?us-ascii?Q?bqeBaE1IIOEVzch8h3NJWGImREVD/q+3BlMZHnoAcd2gVtNnMTQusbfsP+XN?=
 =?us-ascii?Q?Me3HHHfyGiTBHU69Qy9KxCBp98BkzMS38XhaEdg/lMCdYQP562rZLLqT4B8g?=
 =?us-ascii?Q?HDPqGn6yNa0yPpeUmcvPnFR2zgdhXDa7dyWMzOx8/KfITxFTzZtbFGV84yeo?=
 =?us-ascii?Q?QW+RBd5XBiOhZnFiUT7uCF45Ca+Nrv+0DAfgGDwRzJ3fC1BVlHQu27pJMoys?=
 =?us-ascii?Q?TChxp/N1YCDVbrQGUjl+F+ZVVlC3hnwyVfBxDNUNwhcSmAu/MP7F2pFsQL8q?=
 =?us-ascii?Q?e9BFNKrggt3Qx2NIAp6VptaGXdKNJ9iADnY698Lf8he3VGWuGZXaPo60Swt+?=
 =?us-ascii?Q?QVsEZIfoSWVME3uEPVEdmHj4Q7w0hMnfpV0EAIgXYWHnDv1N6H5qrTUU4Z6L?=
 =?us-ascii?Q?n06KlNgtdkLgjqjIHmrC1qfNICdob81aePNAB7oI5jpKNHGfGpsAFX1giu64?=
 =?us-ascii?Q?ZrhJYFEFtDS4qU+TKNnCfrJneO8DpimLuiEpa6zeI7cPdKWPzAq8UgMUI1fr?=
 =?us-ascii?Q?j3KdzIwpUkP7CJSCfMeIhR6qWtsg+UbTz6wL6WxwhXM/TWJKDpDHOr/hE5g+?=
 =?us-ascii?Q?UcPjvzqFW2Z9takugk36+ByBLpnwwFNLmcKEseGumxp/Ly7fSiCN9eGQXub5?=
 =?us-ascii?Q?jxtIs1OLmtg9QC/UdJAFq9qRzfJDTKoAHtFyAmIEYyI=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eccacf7-21a9-4f12-8100-08db23bdb1f7
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 12:23:04.6822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 45OwM7l3ESnI3lKUqDOuhEiustV+Lvux7GObHC1kbWpKV2cRzFmvsoULaPVo2mDRTISZI/tmjozjSFPJ9myU+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5254
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-13_05,2023-03-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303130101
X-Proofpoint-GUID: EqOnI-74CcN9866Ii33u7phVXeCuMh8q
X-Proofpoint-ORIG-GUID: EqOnI-74CcN9866Ii33u7phVXeCuMh8q
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

On Monday, 2023-03-13 at 04:24:17 -04, Alexander Bulekov wrote:
> As the code is designed to use the memory APIs to access the script ram,
> disable reentrancy checks for the pseudo-RAM ram_io MemoryRegion.
>
> In the future, ram_io may be converted from an IO to a proper RAM MemoryRegion.
>
> Reported-by: Fiona Ebner <f.ebner@proxmox.com>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

> ---
>  hw/scsi/lsi53c895a.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
> index af93557a9a..db27872963 100644
> --- a/hw/scsi/lsi53c895a.c
> +++ b/hw/scsi/lsi53c895a.c
> @@ -2302,6 +2302,12 @@ static void lsi_scsi_realize(PCIDevice *dev, Error **errp)
>      memory_region_init_io(&s->io_io, OBJECT(s), &lsi_io_ops, s,
>                            "lsi-io", 256);
>  
> +    /*
> +     * Since we use the address-space API to interact with ram_io, disable the
> +     * re-entrancy guard.
> +     */
> +    s->ram_io.disable_reentrancy_guard = true;
> +
>      address_space_init(&s->pci_io_as, pci_address_space_io(dev), "lsi-pci-io");
>      qdev_init_gpio_out(d, &s->ext_irq, 1);
>  
> -- 
> 2.39.0

