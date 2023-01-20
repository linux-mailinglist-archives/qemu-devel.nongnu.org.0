Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EA167579E
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 15:43:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIsaR-00043I-LM; Fri, 20 Jan 2023 09:41:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1pIsaJ-00042w-L4
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 09:41:39 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1pIsaH-0001aG-6K
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 09:41:39 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30KBuZRi013044; Fri, 20 Jan 2023 14:41:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2022-7-12;
 bh=tyod9HRhm+9jZsH1BFnLMgD1PFX2tuIZfj2VO44L5H8=;
 b=l0N6eNCQRXXvVEw6aJt94ij1gu3xTfYQOL8BF3vRaeb6ybTeC/Ox+HPuBXJaX4Ru4mER
 Wy7RuqU39jocdjpTccBmHCJfyGZdAejASwgmKgJyCo29ClwBBta4NlAEjqeL46fa8JsQ
 b21/QphX6S1n5LzPEnuYJ/gVQ7PR+5HYFV8L5Aci/ZIj4pMaPcy1G8ngESqOWI11L4kl
 rJYCjx9a/Dxl6QFpHzb2i5at9AywizYRvC2q0Ji5fWYmO4e6nZDvs0efPiWYPkVpS2pO
 6rWF7jBcvnTcer56zVJeIwJIiBnrRdLZK9UecVSGaKb1xNOdXfX7IcHRxkGnZjIsO9Qb nA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3n7895aejj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Jan 2023 14:41:29 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 30KDmKgq004673; Fri, 20 Jan 2023 14:41:28 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2048.outbound.protection.outlook.com [104.47.73.48])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3n6r2vvgyp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Jan 2023 14:41:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IpPakwx/EubvP8wWcJIA9+ibQdaSOLpuz4HsFbUu0FUWjVJvdXySm4j+qMeTmZUariMbXxM9iWA1V/WEPzHHexEysMOtjeXSoeVJvdHJUWBmGFRee7jGCeaQuHhqeIW1CqHHTQaYv+5xY5w5aEySI6B7l++2kRSzsK/3p8JtYOiyXh9AOTCCxhMBONIVqUGSl1FtdvEvRyyy381hUfLLMYhSkZcpu/sj91y6zh0e5PC1tIA9tLRXTclrdajGa/ZVURniT+iLgZrOWVo8GPmllPkRmWmu5FA3fxU5Yw8P4NCPP7msWc6gS440/FZoqHnEpwVig9dI0rrHSkhV2lofMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tyod9HRhm+9jZsH1BFnLMgD1PFX2tuIZfj2VO44L5H8=;
 b=UkY0UEtZNxQU169S1NefCi0Ft6CAQTtz053bnfWormc/lU2dxxcieeLDMc9IyeRDh9uxut+OGgiU00AdDCu6DTjNd84LBZB6O849/6ytrdovsGEPyRyz8VWsmYE4VKyriEQkwSblcC72p0fgin0DdPjnCWnTTu7X+JkVeHc624CP22L/tkgbWS+/QMqE5IB0opHzqtekunVJPfLoy2a7oDZWCwAd+dWsW3PgRTf0t+1NTNxZCsct78yE6d8Qr7wbEXzzDOSn2Hn49kH70i7IV8Sui7Q/2cOITvgxBH71VFNv7XHcNGwg3epU8HaPIaJvSm6oVcikRW/IMythzUMxIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tyod9HRhm+9jZsH1BFnLMgD1PFX2tuIZfj2VO44L5H8=;
 b=dmB3acANBBx5+SpKircj0J4/Riv/gV2wGv+RsYMBTyYP3/SVJ7zRVoQtAO7g4SkaJWXqOgpt7C3swLi04R9t3Cf+XqMOvW/tso4peFnLOHoyq2opdexG47iRJzdgXUKLOXsJ/cm17uikQzOg9DWLqZiQO/NGWJds5kNq9wWOQwM=
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by BY5PR10MB4339.namprd10.prod.outlook.com (2603:10b6:a03:20a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.6; Fri, 20 Jan
 2023 14:41:26 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::9be3:dae2:d059:9404]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::9be3:dae2:d059:9404%5]) with mapi id 15.20.6002.024; Fri, 20 Jan 2023
 14:41:26 +0000
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
 Siqi Chen <coc.cyqh@gmail.com>
Subject: Re: [PATCH v4 1/3] memory: prevent dma-reentracy issues
In-Reply-To: <20230119070004.321358-2-alxndr@bu.edu>
References: <20230119070004.321358-1-alxndr@bu.edu>
 <20230119070004.321358-2-alxndr@bu.edu>
Date: Fri, 20 Jan 2023 14:41:19 +0000
Message-ID: <m2cz791d68.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DB7PR02CA0027.eurprd02.prod.outlook.com
 (2603:10a6:10:52::40) To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5138:EE_|BY5PR10MB4339:EE_
X-MS-Office365-Filtering-Correlation-Id: e6a09799-140f-4218-d80e-08dafaf46846
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pFfow76wR38yXA4uAWkoq94bObLuxcckc7Jj9i9U+H2rq0BZxw0z/JMLi+OXBLfkyK7YdCf5nwOwVhRfVZfDpCXoD9m04g2f0vJ6LwZroSP8yCVg8TcDMki2b9YPvJx/h0yQ5tUqqvv4WscY8BVHhLE/hPjM4w1DrqODr/6U/jO59J/bYcxHfPusInWV5cR4yZ92YRZ0dCUL8x2+77O2fkVALc80DqfQeW4ahNI8lkRDod+aUNJ7j9cMr47usK9D5MRsY/y+EalPPnz+449hGjzJOYm7nGvPgTUs9DApLLECYHDe/EzZbo7635j95N6RNOkrqFWSdtXkm4lu80mmgOXGSgCta3+0BNR9VqbbYnaE2KubttEHNHxuELRD4kuystZUQGMsxV3LrS7C/9ETFPcTd5SfjY5PxgAC7YsKaCxG5IcvJBntVSh++65WhAEojL9KCE+1FB1Yh88ptmZDWIiGDopJZhQs1VoBuAY2u5TD+LuUqeDF9DdSHUiaJH5qbMSQiYnyneZGOHnHTTZUengeSNeNvTXvwerD/wLG9sM2H3hjq6sKUs+1sX6DVfVfKAkT4floxez0LCb0mt49vf15+sYUfogKGZS4yqLNDx6Scz+i/c9U0ke22T0ShyQg+TkL38kWdUk8cXoGcFO/8ar0c/2RrPxn/EXCf84h3fqBbNGP/BvQs0zmacuzP2qWl8IXwwGQ4BwQfLnG6wbVKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(396003)(39860400002)(366004)(376002)(136003)(451199015)(6666004)(6506007)(966005)(6486002)(478600001)(86362001)(2906002)(54906003)(66556008)(7416002)(4326008)(2616005)(5660300002)(316002)(8676002)(83380400001)(66946007)(44832011)(66476007)(41300700001)(8936002)(38100700002)(186003)(6512007)(26005)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DTPkvA93yZd8QfDW5ZTRONPxM3XkVAXCdzm2/elTq+yvtE0NhRByNmzCNKz5?=
 =?us-ascii?Q?ep+wcawZgHCzLgaxttEoiTPHfo1f6MREDnnUlPoN4IBKw161FHhUregwUAIm?=
 =?us-ascii?Q?wqj3W7Hh06KLipxSjGUyHeJU3l974CTx+rFk4agkytEv422J41JqILL2HpEi?=
 =?us-ascii?Q?xqQ+OZZwmPOpS1EJ4WjyfEJ4yBq/J8/aZ+5n86Q2LTG2+dJkUAykBEE7eE76?=
 =?us-ascii?Q?a2u1nhzRh0LcC9g66pEugfSYRTXnc1VJluZ5ZEn5OGfzuFoUSgE0lpwZuhIm?=
 =?us-ascii?Q?ZiYrJZjjNTZKdOYasOYMArkTZ/IIFcdz0CPcmS7KtvG7tVCF56eBM4S03R9S?=
 =?us-ascii?Q?ooVE8zcgCa1mkgUkNqPBydMGlsvrGowzIaw76TUGzjbeqHkOsgp4Yn644MR8?=
 =?us-ascii?Q?wPRy4OeDqN1zM+ye6sHW5ldPKsZaJyiVowee+pMLviBu6NzXIaIH+o1iPiZb?=
 =?us-ascii?Q?EV9Cji3N79F77X4tu32Ta22I2fHJTmgGuqCBe05ke/AwgSCAJ1IL/ryIqj6S?=
 =?us-ascii?Q?GMTjYSsBpXzzHpxrwSFXASH8J8GA7xqwToASlhNztOj1w6Sy2MUFkbXvmguz?=
 =?us-ascii?Q?VLEA/EfXJQkG4kAUchdgcPu/4gq7RCkmH2VgHvE112aTtKKwsl0e+smpvj+Q?=
 =?us-ascii?Q?7Bgl6okYpNu0KBtJynRXNgwehuG1WUYZF83STuFG402Wvc9e3CkRQQcqecTN?=
 =?us-ascii?Q?Q486mKGMvPyEb5dgh9Q6ql+cllVdjz3npoimzYlLQqn0RVeQy23MnIsSUuR/?=
 =?us-ascii?Q?QXwiaeKbVU8+PBLaJdGTTewVECUeMuE7hFPweCFab3lgZCQFMMKsRAjeW3wX?=
 =?us-ascii?Q?WAL2Apjuwn+ayIqetA+/9OJigObcbFWUU1YfsjS3bnj+8X05wdTd7+k5bQxf?=
 =?us-ascii?Q?hQ/p7odsV0hvWZ4/r4mt5CTv64igU7ePG6obf4NN77C3wr/Aep15zcQ6MpTj?=
 =?us-ascii?Q?cmQD90ajt/GQeThur47cDLETCpLSy2/f+/0TXuYX+xpy/zscuFW8X4AJFoxJ?=
 =?us-ascii?Q?vgJUaw0BUDyNfWF0u3GNnr/KGTIIWoq5a4tEXI8lWQqwddw+htKaj2Gl1b2E?=
 =?us-ascii?Q?tp7reno+tFWc/LZu0qTJG++UjIJ/jSfntxMwFDvZi3ICHz8SAfkyIM4UedwE?=
 =?us-ascii?Q?L3aVlgjquBh1AeaxYuNfcqGkb/GipUZ/2Oiw7SUFbYdp0+Fkhstq+LjCrkOw?=
 =?us-ascii?Q?l7IgviTXcMZwNRrDjCVfLBDwpguzhmCYMrOoNvkE0ObK81gJ1jx8cW8otm7V?=
 =?us-ascii?Q?PWGeDkj4EFZne4c+JsihIdy0TvIzUrMAyu5exXGClELpbKsWA2o4zXPUytVo?=
 =?us-ascii?Q?9BZV0esglbqmLMs1e9lOa29nzw43m/9wANPCBB8xGP4c+UEcwhzbHErYexbb?=
 =?us-ascii?Q?Od0fz8gJnWW0ArjezU7HtXvvU21LtbfJTC4JyhnzBvjzsvXy52liqwzHbxnr?=
 =?us-ascii?Q?09wYLFm4pPNuUbMQFLIGQz0zldfWp4rV37GoMInsVwQeXO3i3GkewGixLCbX?=
 =?us-ascii?Q?H5wW3nqcPI9njGbJRXg7GhGhLGjbWqRXfMiovECL87M68IomgJ+pc0JHYGFB?=
 =?us-ascii?Q?Z/QMlGJT6bRQrt2DNINxJ0lRuT5iYDX2Yo1j5ElvjZafuebO2FrmwsCEXwpG?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: iL6SBBuFBk0DYzQt9xxIixWGCABdABVuxVcPkNBQdM01wtMzHpi7TOY6ty2f3yGHnO5uysGjdIYdeVXtzTILgnLulH90AcCO+3T60TQu+nwc/CO6INg4VrSRSalfJ80RGaCFvFoLFMthmDwUKViVhV4Sq/uYk6y1bWARA9z9XlTfp7nOh2DMXhKNoCkkb+UAyXHcKA76lYO/G57PYYFYQr6ao+Y3GJ8CkZv2NaELepkbd/Y4z57jacmv8XcO7dwaI2FY4rjMW63NG7byTRD0CEU8Y49oZ6PM82MKW1AbG/SHZkmoJNooyytWrDoHG9a6RtHJt2tS5r1HozGoqt/MKAFzLhw1AC5kBEbsu6RPb+zQFuCOGU3cQbZmwpW+eSO4SUMJ24FFfJBztf/CBCBEnRXiComosS2uJNgucg+aD/StS/dd0tkIgDgSN2sObscMjVBGLdVX9+nYcN2ovrHAqBSEi4liIi6JrvQ+DzJPTKHSZx4wiAYOy2sQvOpfULCAltubaRC+1S4t4XPWT0Fe0Jay3uMMAbxZzDiYxnGiZS7pU4j1VEbLsyaF09NqkzlLbe6DoGSM3A0ZyDidxB6UnVGifssfkqVj5AyPPldIeUpjV6LkSIweHxsFX2W+Qq0ZusXbD6/luVmkKq35ca7Hu3bkpkqPZTxGcieMNtqm8rk5QUDvHetJ5GGE81iSwiLUiMnJIuXxPQMVLTS/wXsSRGz6rf1JpLZeS2TG++TCwb0Uibl2I+w93Y90kSIzlWWpLtrFuGd70bVKQgeJgL/97u+5lBLq8aCIzIpTHxMmNtk+vBmEGi2IH1gRUFareux40R3zE/wTjsTLWg4aAoeSxLbMSv9soah6ZL8Zc2ltGqtBAcsWUVWya3PAzem07Zjo1DWOIlkdSwc2qKD1o20TD+IHL2Em9+DZYOrOKeLiGb0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6a09799-140f-4218-d80e-08dafaf46846
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 14:41:26.0408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z0aXMrIqOzGYrkOzJPMW9X8UGNeRnoPhrwn5rjDCXoBvp+7mJGv4/jHvSAhA2/yPKWzBT0LCOsjK4nq2/6KYFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4339
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-20_09,2023-01-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 malwarescore=0 mlxscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301200139
X-Proofpoint-ORIG-GUID: VnOS974JSA1fI4KHjFHSuOeqhiw7eNgS
X-Proofpoint-GUID: VnOS974JSA1fI4KHjFHSuOeqhiw7eNgS
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

Hi Alex,

Generally, this looks good, but I do have a comment below...

On Thursday, 2023-01-19 at 02:00:02 -05, Alexander Bulekov wrote:
> Add a flag to the DeviceState, when a device is engaged in PIO/MMIO/DMA.
> This flag is set/checked prior to calling a device's MemoryRegion
> handlers, and set when device code initiates DMA.  The purpose of this
> flag is to prevent two types of DMA-based reentrancy issues:
>
> 1.) mmio -> dma -> mmio case
> 2.) bh -> dma write -> mmio case
>
> These issues have led to problems such as stack-exhaustion and
> use-after-frees.
>
> Summary of the problem from Peter Maydell:
> https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae5KcknhPRD5fPBZA@mail.gmail.com
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/62
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/540
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/541
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/556
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/557
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/827
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  include/hw/qdev-core.h |  7 +++++++
>  softmmu/memory.c       | 15 +++++++++++++++
>  softmmu/trace-events   |  1 +
>  3 files changed, 23 insertions(+)
>
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 35fddb19a6..8858195262 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -162,6 +162,10 @@ struct NamedClockList {
>      QLIST_ENTRY(NamedClockList) node;
>  };
>  
> +typedef struct {
> +    bool engaged_in_io;
> +} MemReentrancyGuard;
> +
>  /**
>   * DeviceState:
>   * @realized: Indicates whether the device has been fully constructed.
> @@ -194,6 +198,9 @@ struct DeviceState {
>      int alias_required_for_version;
>      ResettableState reset;
>      GSList *unplug_blockers;
> +
> +    /* Is the device currently in mmio/pio/dma? Used to prevent re-entrancy */
> +    MemReentrancyGuard mem_reentrancy_guard;
>  };
>  
>  struct DeviceListener {
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index e05332d07f..90ffaaa4f5 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -533,6 +533,7 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
>      uint64_t access_mask;
>      unsigned access_size;
>      unsigned i;
> +    DeviceState *dev = NULL;
>      MemTxResult r = MEMTX_OK;
>  
>      if (!access_size_min) {
> @@ -542,6 +543,17 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
>          access_size_max = 4;
>      }
>  
> +    /* Do not allow more than one simultanous access to a device's IO Regions */
> +    if (mr->owner &&
> +        !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {
> +        dev = (DeviceState *) object_dynamic_cast(mr->owner, TYPE_DEVICE);

I don't know how likely this is to happen, but according to:

- https://qemu-project.gitlab.io/qemu/devel/qom.html#c.object_dynamic_cast

it is possible for the object_dynamic_cast() function to return NULL,
so it might make sense to wrap the subsequent calls in a test of dev !=
NULL.

Thanks,

Darren.

> +        if (dev->mem_reentrancy_guard.engaged_in_io) {
> +            trace_memory_region_reentrant_io(get_cpu_index(), mr, addr, size);
> +            return MEMTX_ERROR;
> +        }
> +        dev->mem_reentrancy_guard.engaged_in_io = true;
> +    }
> +
>      /* FIXME: support unaligned access? */
>      access_size = MAX(MIN(size, access_size_max), access_size_min);
>      access_mask = MAKE_64BIT_MASK(0, access_size * 8);
> @@ -556,6 +568,9 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
>                          access_mask, attrs);
>          }
>      }
> +    if (dev) {
> +        dev->mem_reentrancy_guard.engaged_in_io = false;
> +    }
>      return r;
>  }
>  
> diff --git a/softmmu/trace-events b/softmmu/trace-events
> index 22606dc27b..62d04ea9a7 100644
> --- a/softmmu/trace-events
> +++ b/softmmu/trace-events
> @@ -13,6 +13,7 @@ memory_region_ops_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, u
>  memory_region_ops_write(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size, const char *name) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u name '%s'"
>  memory_region_subpage_read(int cpu_index, void *mr, uint64_t offset, uint64_t value, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" value 0x%"PRIx64" size %u"
>  memory_region_subpage_write(int cpu_index, void *mr, uint64_t offset, uint64_t value, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" value 0x%"PRIx64" size %u"
> +memory_region_reentrant_io(int cpu_index, void *mr, uint64_t offset, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" size %u"
>  memory_region_ram_device_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
>  memory_region_ram_device_write(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
>  memory_region_sync_dirty(const char *mr, const char *listener, int global) "mr '%s' listener '%s' synced (global=%d)"
> -- 
> 2.39.0

