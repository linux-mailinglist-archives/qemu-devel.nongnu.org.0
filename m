Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 877F6694873
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 15:46:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRa66-0001Ch-DH; Mon, 13 Feb 2023 09:46:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1pRa5u-00016h-VK
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:46:20 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1pRa5t-0006WV-9K
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:46:14 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31DAT5a2023948; Mon, 13 Feb 2023 14:46:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2022-7-12;
 bh=xAyW3YjbQbE31lSA/UdawEppQW2sM3JbEpGxIhlVTLE=;
 b=K98ULlejFanhhlA4sjNH84IvZbp+1ddREzckTgIY7/wfItWneDMbt3KIt2DDaTnNW9de
 eRpRj1nZakzwMn2GCjWKdBgiqQyek2T9sDaEt2C8gOfdnsWIWxUpcTs9YSd0HnDOuG/a
 95x+9X+2Ot1nRCJO8uI1EGTVrRlM4KgZBzdCXuLYj0ppDPvnWIBMWvTiek44QVPzDEis
 T35AGgYV+nZYKXbDlburZcwJQWYjSAuI8kVhBvL1SpOMnSrQQXGYutBfgAVq1XbL8Cxo
 F4tQsBXM6v/mopOc2hmwF3evVtFld+1iyS1ux5fniaVISgHw5G+khYbfbXRWSrXy+9uD 1w== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np1edaxhu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 14:46:10 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31DDWB6g011524; Mon, 13 Feb 2023 14:46:09 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3np1f46u2q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 14:46:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XbhpBMVkqEzeSgZo6ZCtI8Bkae/slytd59b0614u5KhddowbOn/OgGf0VCnShM6/i1raRBxPo0jwXVRdeSGSe72o6O6a6oBff/LiQx541y+D+Gb3tnlsxeLcuZPU93C5ZNYQw+JD8zZKC0+VKAOdm2QCLK4rXGqKesXTTbVS69auH247uPtD0gK+e+5PXR/67EHEuwBkJW86UL+66SryLUpaUQU862DtmoBKYL1nzlRhIaZnoPzTY2rV0wGLlY+xTd6Mav2AH2l5cvRDwi48q68NBpsUocnYhCe+GKC/za9RiqBLDJSTMnxU8RTEzgnD1XQXhuxGUXPBY3UWcLj+vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xAyW3YjbQbE31lSA/UdawEppQW2sM3JbEpGxIhlVTLE=;
 b=Ydy9UZ8BcjRy86TiBZ52IxALKetsgOUvj9LN8vPSP+4DY441aCOX4RAjj/IALRvzCOm6WcZ7LqcGLuoAYwG/ZKX6GneXnB36qMhFwUHNUnd42v+toEZvYic6w0NJmiGDrfaVXAezUoK+Ao23NGXeLkcwUewvhra96zjIc0FSLtINY1GPb6oapKEi3kOjCVazlssv6DL2mqYdUANtxFaX5eOyGf6HCXSfzsQWVv9bAPW08mxwLXCn1FO7GfkpyUmPn7HCt+s14JNPqb8dmNdpDHTFibWLjYMUzMVZ1fzRalrztYdrUHhCKm6lZeMOtFKDGz01BewP496UpkhL4UiJIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xAyW3YjbQbE31lSA/UdawEppQW2sM3JbEpGxIhlVTLE=;
 b=OzM/FT1oh9fqqucd05yhAUe66Hs8yQBYKhL9Ia8IM1taG6VieoJ4hfCAKP4QMFDArsClbl59grrIflYrRT19YIhbZ43g2nLJemweOaT42/30QIMZQMTsxHgxsEFjptw4zftaUsLf/m4M+Z+BORBWs23EZwd72vLnYIk2uBaSv2Y=
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by CH0PR10MB4988.namprd10.prod.outlook.com (2603:10b6:610:c8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.10; Mon, 13 Feb
 2023 14:46:07 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::8a7d:60c:7965:98c3]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::8a7d:60c:7965:98c3%7]) with mapi id 15.20.6111.010; Mon, 13 Feb 2023
 14:46:07 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 08/10] fuzz/i440fx: remove fork-based fuzzer
In-Reply-To: <20230205042951.3570008-9-alxndr@bu.edu>
References: <20230205042951.3570008-1-alxndr@bu.edu>
 <20230205042951.3570008-9-alxndr@bu.edu>
Date: Mon, 13 Feb 2023 14:46:03 +0000
Message-ID: <m2a61hr5ck.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DB6PR07CA0158.eurprd07.prod.outlook.com
 (2603:10a6:6:43::12) To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5138:EE_|CH0PR10MB4988:EE_
X-MS-Office365-Filtering-Correlation-Id: bb032834-2471-47cb-3f9c-08db0dd109ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KMKd3biTQPHU+DIqrJ+qx4aUuLwGjtSJCxmwlHRGQCZnCJ3CYc/8RTV2lF3GOYCtIuVn7QAnGSSkoTYax8ESZgVoJKxKpjEvbvY8DuiOFS/DjQa+jS0IoVo13EKK7JCZkUBYWQzyfX3Jm7sBTW+rU5HoJs7rNqXPbQW/NWLKjD5148PqoiJQn8QNw25qZUFUa1eBlslRK9Rmtd/l31jQw3lOHsj8UsXIM7Tx6CGIv+HLosk+TaIEtimO0ZuQsRM2D1yZ7OmAPvMMxGcdToaBDQw81JldTjEUSI413NSfglPO7yj6UoQaprF6sHvQIXTN17ssAFPjDUaxmZMYqxjKTvoQEUq0d3Xuhni+viND5vZnhebFP5KhgXCi9WOTmgzbwZOb9NPQ0UgJsyTIpNBk1EAJHwuLyHPqPyjx9MRLGErmbsj9leStsmtRDfcKN8iGLxrv+wd21Pi/bwXdEf9d6qujYYsndnLatxly7zlrBQkSGcMrEnJ/d0xJPA2OaHphbkgXnb9hbGZxQ9ctwFRQFJ50eD6vV7C8y8DKwoZO+2Mjal+9ryk/EqAwOgJDzwNHhj8Jew1kTn2EDfYvRvo77gMs0id+bdNfHNKfE91qNr2J3G29/yUD4wpDKhMIwH6VOYfht6TwXxpUFCrwHIps9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(396003)(39860400002)(346002)(376002)(136003)(451199018)(36756003)(2616005)(83380400001)(38100700002)(44832011)(8936002)(41300700001)(5660300002)(6666004)(2906002)(26005)(6506007)(6512007)(186003)(4326008)(6486002)(86362001)(54906003)(316002)(66946007)(66476007)(66556008)(8676002)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rByerUf5ql8KgBB6D135upjoTUa8ZVG4Xnu9f9N9gzqYu6MeETBKwlBac+gq?=
 =?us-ascii?Q?qZiV2RkrzyR8wrRrlnaNhJwpg0fo7bx4yMddlPiWOvVrwbR8j236KaecfbDI?=
 =?us-ascii?Q?n0cioopdC5KiJfEWfJafjuJUDqEjWcEQYRCKrJWldpic0jkUEG4rqpnUfyeJ?=
 =?us-ascii?Q?79d9J6Yeg47TgJkvz0uGs5rZ/afdgHTalx2uxJxxjqrdTJExTB8fI2UF8RgD?=
 =?us-ascii?Q?8DTnPV5m4lH4KNfN3NDD4P6bBb3lcXiClFrfu88f+usznJLOWTgcIXIQbWE2?=
 =?us-ascii?Q?oYM8JZ4TcwxaP/EqLVZwb4yeozvvjTELCOtlnRZL3DjN0NWTSKkC1RL98Ui2?=
 =?us-ascii?Q?7oc/efqJmPhe7wUSrJPrEUDL5in2O2pEwB1MqASBTui8b3DcYr3jFj76RZML?=
 =?us-ascii?Q?tGcP6rnWyn5jDFjwsnW00vypNtkCL0NHDyMqH6z0MOHXq6xTYUVB8Qbzlm2O?=
 =?us-ascii?Q?ix3COeQHopbv1h1yy5/NX6lN7ENs1iZpw8a+tYqIY309Sn2mp4+eGtap3rmP?=
 =?us-ascii?Q?BdLOA09dTjRweUimo/YWfWM/MOuvnDAdIxYqMp6AtRJg5Wuh/3s9XDQGo70E?=
 =?us-ascii?Q?JtzN1U0eQiKrls7u1kLDFjjn9deqc4h68bFxn3ilXyHrkxdcxPf7EXDNNT+e?=
 =?us-ascii?Q?qZIPsK3Koo9bSF4AilUgZK9pwofT/QcAyVTHF1hLX0mrcRUO9vSMsih6/MiE?=
 =?us-ascii?Q?l5yW9nhEl9iSpMrFJqswkKYUjLgGjv03z1Rh7iZFJTyTNMix2GqiCb7w7OMm?=
 =?us-ascii?Q?GM9HD+kUrFm+A/KVvfY9ySPxf2OBYfaPqKd3FMY2M/VbgwloAuLZwWq07/Dv?=
 =?us-ascii?Q?H/+C48zcUH9uuQx24PjFwp02KpGFJNA0LRDY5ixRFbhj6iKmNZuzoIzE2LHy?=
 =?us-ascii?Q?wOvS/mz8QkoIVuyktsL2JQfOvaBv1okV3ssaiJfe4wdta+lWAj2fFhHvtsAG?=
 =?us-ascii?Q?8LiP8uf0PBBi0NuRUumykfo0/ogfTvuOXMeQBz3ldh7+Zli6peu9N8irvdq8?=
 =?us-ascii?Q?c7ry8Pwe7EqoeKgJDlGww3CJ+mUlV5ScxS14iUqidKKxW9v0Yo6RjhAlj0nt?=
 =?us-ascii?Q?ary7EZCTCfiSOZqE7lUNUrT03+WoGjjWAfeEe0+r3v6P2G3f7o0PzKFmBGSk?=
 =?us-ascii?Q?bX2+SApR/EQjBTr9VlD47nl92uIDrzosZ90BNimKlJZ1xfpImRSmhAU82CDl?=
 =?us-ascii?Q?XVevv8XXR2SUYREkgIDEB5zd5DIm5MHwyhjo8be3PeOE8NBLHY3aXPBq6nJL?=
 =?us-ascii?Q?4Uuov/rnZoVjJcb1hU2MXOduV+hKkCFCui7mmBgb034BdCTQfGTwYVXi8cpb?=
 =?us-ascii?Q?um0hGw3T+l4lsbDzwvkVWwV1XrI8zixxmZqpQ2NeuqxvBZzRO801MbOgJbYL?=
 =?us-ascii?Q?CtSvsy13iZQMcvKsvNDFIsvveR86dzCmrWEX8YYhS8ftF7QDcVq3KKO8vv05?=
 =?us-ascii?Q?p1VHGYkWkKvLPFl+2AXw8BTinoQdHx6xDXyPwz7qVyxh87ynvPEklibJX388?=
 =?us-ascii?Q?zWvzVpveh73GProcDessQFku8FSi+JfZ8gHu8hb78q2wh+NajTIrIi7Z4JPX?=
 =?us-ascii?Q?2ftGd8j0F/onY/5WT+lsZxziaQp+AZWY1FniyE5pQsuea3zETbz/bXtXnJ3B?=
 =?us-ascii?Q?Og=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Frp6mS/j3/820eTQoSnmj65BlqDDqc6DhahPnAGv5kIug4wLTiAFZ+ubtWKC8hgjBQE9RUQuL3qQ8IlIJa7uYevcX2PkXSrGCIUPg1L5yTLrhNqu86cr+jzcdEx5aw4TpWMZlXtdzoBV9YhovZcDPkCAEwkrMydLknbVMGbf/cj4rMuipJSRSdB5oWDkOWxUSzwbd80xbLWul+5CAfvlcLtIn9hVB3p8OP3JMzZV7hgw9/N7asrHjGK0XCpAIgElCPKgHKax6mJqvqore3ZUVpWrKnx4jMcCce3nEwrDA8IwqYTk91GLG17HttiB49y/im7i/Lq6Jm82pLnwYSMJ5NIdBKpGSa1QQfvutX4wLCEahy0n+/mw+WzwpeCmHWP/iHUppJkOlHE5RHZ1yUVcR8LCei8rYvOrN71acBo/0D0gweVUuh0AAJnYtdHPNWW5SlSGHkhSH74+RJQNhlj4wga+8dkwxtnEbEA2euVnrBQLIoxSRlzjkyoKoQ1uTAwGooEUaT2KOjLB7NEPvR4GX7L+sOSMzKguWpR9yzDkrVoSv6Ue2o9IHuNQiblriC1uO2ut2feZN3Ypp6N8P04ueiOp8dD+r+CWL6O0z6RrJeSjtyWpucmp+IW6KERh7FAGuuj41ODcUZCLzvlRf7Y9tYC6vIH44tKdTZYq8KbW12cuZmmupSKPjjL4bp6FeDULsM1zB/Lvs6iY00Ov0sfMk2fGtzTdbRpnBt85++BuTvf/9e2wpHpdh2A+r4d3toEcJgo3Lhh72Oa5JqPqbvAvqXbI/e2NWbJOQw1sOfcGAsfZoUTmGfmHbamVi56CCcAH6lw7QBKL8yQe7SKdxAcq0w==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb032834-2471-47cb-3f9c-08db0dd109ff
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 14:46:07.2917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VFVWPtdrNktjLGJHMCL0bri5z7jBoiQiKnRNXOXbHzH/tkEZGrtpv2css2p5JHa+8zIm+/cOaNhpAs085BsNkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4988
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_09,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0
 suspectscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302130133
X-Proofpoint-GUID: Y-0a_SfxprjILJ_1fE0UHaKoD00SzXge
X-Proofpoint-ORIG-GUID: Y-0a_SfxprjILJ_1fE0UHaKoD00SzXge
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

On Saturday, 2023-02-04 at 23:29:49 -05, Alexander Bulekov wrote:
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

Thanks,

Darren.

> ---
>  tests/qtest/fuzz/i440fx_fuzz.c | 27 +--------------------------
>  1 file changed, 1 insertion(+), 26 deletions(-)
>
> diff --git a/tests/qtest/fuzz/i440fx_fuzz.c b/tests/qtest/fuzz/i440fx_fuzz.c
> index b17fc725df..5d6a703481 100644
> --- a/tests/qtest/fuzz/i440fx_fuzz.c
> +++ b/tests/qtest/fuzz/i440fx_fuzz.c
> @@ -18,7 +18,6 @@
>  #include "tests/qtest/libqos/pci-pc.h"
>  #include "fuzz.h"
>  #include "qos_fuzz.h"
> -#include "fork_fuzz.h"
>  
>  
>  #define I440FX_PCI_HOST_BRIDGE_CFG 0xcf8
> @@ -89,6 +88,7 @@ static void i440fx_fuzz_qtest(QTestState *s,
>                                size_t Size)
>  {
>      ioport_fuzz_qtest(s, Data, Size);
> +    fuzz_reboot(s);
>  }
>  
>  static void pciconfig_fuzz_qos(QTestState *s, QPCIBus *bus,
> @@ -145,17 +145,6 @@ static void i440fx_fuzz_qos(QTestState *s,
>      pciconfig_fuzz_qos(s, bus, Data, Size);
>  }
>  
> -static void i440fx_fuzz_qos_fork(QTestState *s,
> -        const unsigned char *Data, size_t Size) {
> -    if (fork() == 0) {
> -        i440fx_fuzz_qos(s, Data, Size);
> -        _Exit(0);
> -    } else {
> -        flush_events(s);
> -        wait(NULL);
> -    }
> -}
> -
>  static const char *i440fx_qtest_argv = TARGET_NAME " -machine accel=qtest"
>                                         " -m 0 -display none";
>  static GString *i440fx_argv(FuzzTarget *t)
> @@ -163,10 +152,6 @@ static GString *i440fx_argv(FuzzTarget *t)
>      return g_string_new(i440fx_qtest_argv);
>  }
>  
> -static void fork_init(void)
> -{
> -    counter_shm_init();
> -}
>  
>  static void register_pci_fuzz_targets(void)
>  {
> @@ -178,16 +163,6 @@ static void register_pci_fuzz_targets(void)
>                  .get_init_cmdline = i440fx_argv,
>                  .fuzz = i440fx_fuzz_qtest});
>  
> -    /* Uses libqos and forks to prevent state leakage */
> -    fuzz_add_qos_target(&(FuzzTarget){
> -                .name = "i440fx-qos-fork-fuzz",
> -                .description = "Fuzz the i440fx using raw qtest commands and "
> -                               "rebooting after each run",
> -                .pre_vm_init = &fork_init,
> -                .fuzz = i440fx_fuzz_qos_fork,},
> -                "i440FX-pcihost",
> -                &(QOSGraphTestOptions){}
> -                );
>  
>      /*
>       * Uses libqos. Doesn't do anything to reset state. Note that if we were to
> -- 
> 2.39.0

