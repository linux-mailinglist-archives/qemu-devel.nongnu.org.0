Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9C26947F9
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 15:27:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRZnI-00073W-Dv; Mon, 13 Feb 2023 09:27:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1pRZnG-0006ye-DI
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:26:58 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1pRZn7-0002bO-Jf
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:26:54 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31DAUINS017746; Mon, 13 Feb 2023 14:26:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2022-7-12;
 bh=qdH+O1+oNB9UUfF9sQLSoLjVSXNgrKupS/ykx/ooTgo=;
 b=oE5RhcxsgV/ApHO2KBeH4A+rvwrT7kcixhiMPC0gSCTSenZ/1EOPdTIq0As55FynghXQ
 ZXH9pZeMWXREVwxHo2+4GXT0UDAwtm1GBEZ/m3NgpYGb5mzpCsTrYeBBCmHXj07He8QP
 797Q0OMNq0OYZfB/Df6xGaiKPlykMdo3xsNTSV5pHwjaIIsFiBz3IrCC+obbC940UUJg
 7TbEZLX69sMPCFIt8r/qnyK2M1th+GYGXikjgOmi/JqtsxZGTmrTT4s+QzkbqDFTbZMM
 zdRyGnHDFvO8+VJGlnTfv6gDZ28j72VzkDD6yTeB3YR0BPr1Pn1GIlYcCyzzk+cYTwrJ /w== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np3jttuc4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 14:26:30 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31DEBkjG028924; Mon, 13 Feb 2023 14:26:29 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3np1f3vx1y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 14:26:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FVCxVxLzmIuInwkvnDatuyvLI0pAZhAKbZR4a/Ut4qHI1q6c0onWLCRyxiNCHGojZP95pTPJR5jXzHDMR2i63k0egkQWycYKn82sO4ORAiwCS772nGpx92oP7+/fzz/pNUQrhSj4e2j3pHgxsegpHQN/V1V8mogBHajtTQTA4kQUlM8rzwbvrDi3m4W8wvx3f5EJhyFMC63d8MdYwpye3w09k19EIf3ag+I7ohI8x6fx++LT4QMLX/qswX+AbestbICKLQ4zp8bEeXlpyztl9QomnrhQlS57uw82Q/IvM3tdg22xcH4Dd9hPQoJ79H9d0FBwVKiioE4hcUEivgLJEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdH+O1+oNB9UUfF9sQLSoLjVSXNgrKupS/ykx/ooTgo=;
 b=NhMsz9yGsTa7gKxhtvawlgwdJ+tVgOkEDi4TO/FyBEF0nnytlxcblRip43GHlObvBXxVbSqOJIzoKKyfcoIQNT+ya43uP1Edb2pc2sEdNNjhqbhL/IDZ1a07CaGf767RnPLGQntTjM4u3XE+PbiocHSfw4DMIvtc5ZgQuUqJw3enpGLtFgfTyWmPbHAKdjILoFF9F/oRv6RJcF1enF5ThEt84A0N7DhLiHd6gOX41Z/zkGINAoKtGCHBD8FBNq3VPQZ7s1zUEM+m5Evp2fHfDlUXblilKQnwb8UmEuDCodvPEmmP1pK9oZz+KwUGJqPOWhxe+17rl7r70Qz8wc3Ggw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdH+O1+oNB9UUfF9sQLSoLjVSXNgrKupS/ykx/ooTgo=;
 b=Te81cv2KPj8zjRTHXo90nB9Vp8ZpbmeBwGpykIvHWbXMboH/3mBLI8PLszfUMVYkMSgJAQNjMxxJp/LgQJ/K1nn5qNCCGOnPwx9jMlApyCDpbQ1UxLtlMICEWSgGb3E8PxZeTme38VO311FVjjb0Dquv9d3vwxWtkmQktsQhiH0=
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by SJ0PR10MB5645.namprd10.prod.outlook.com (2603:10b6:a03:3e2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.10; Mon, 13 Feb
 2023 14:26:27 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::8a7d:60c:7965:98c3]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::8a7d:60c:7965:98c3%7]) with mapi id 15.20.6111.010; Mon, 13 Feb 2023
 14:26:26 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 03/10] fuzz/generic-fuzz: use reboots instead of forks
 to reset state
In-Reply-To: <20230205042951.3570008-4-alxndr@bu.edu>
References: <20230205042951.3570008-1-alxndr@bu.edu>
 <20230205042951.3570008-4-alxndr@bu.edu>
Date: Mon, 13 Feb 2023 14:26:22 +0000
Message-ID: <m2o7pxr69d.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0191.eurprd04.prod.outlook.com
 (2603:10a6:10:28d::16) To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5138:EE_|SJ0PR10MB5645:EE_
X-MS-Office365-Filtering-Correlation-Id: c8d03ab1-f736-4a82-499a-08db0dce4a66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: No2NNV9HJtwsmoDfd/yAwf4L8zNQyyPWgN/cqMMO6H9QUBUZPXfGS5pMFStQgL4gFwUQhl8yP3BSdHGFZT6m5BqNGvT1O8g5j7s5dK6KZbql5IMjuLbzII0+a3ni1jg0vV+iIZf8cYsH4W/Kku7jAOmGY55BgFxV0E25piEMUQiraQ77mytYyQ8c0KE0V0o9WdICiGtVaffpU5AJ6tWlm3+JGhPlQd5bFedvda+oP9bDZoQVatyJjSM/BHtspWNzdajhtDRnXFerUwCeVsKtfOt+RjeQXdyvMNGyhYnIct5SDWoQPWWoynm7OkY2I0FKuPkGetvuHW2UP1bQQey6As5+oDOFOlj4NBdJu5ApfgUWBYsuReZoBPxJHABiQOslfDtWRQl6HCgNqUw18dvhT5uZvHk62OH3eokJvtOTFe5l9W4HG8vDnR+x2NCAl0X+eKYuA30Yzw2AkVmTyy5QYDDgOCWPsqZr+lj9D4V5DuBm4l5eP27kn2I1hF3pDGqvsdc2c+yLoh07J+lgctqvqxkER0CKZTjf5MxWog8+GpZdVYkI/vqc0esjpxNezpAJac46SEomAdWSWGhW0mXjgndtzKdceDb3G2PsGbVkO58hyMI8z863EXzw8BOLVAqNcY2utaSrzoHcEsrbWwKH4I8BEA5AWB6XhvLR5pbNnrS6yYkGW1ArN7b8a/xiJDse
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(366004)(396003)(136003)(39860400002)(376002)(451199018)(5660300002)(83380400001)(8936002)(38100700002)(36756003)(44832011)(4326008)(8676002)(66476007)(66556008)(66946007)(41300700001)(2906002)(6512007)(26005)(186003)(86362001)(316002)(6666004)(54906003)(2616005)(6506007)(478600001)(6486002)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tsfrtT7Ol4GOqMoSy9Kttlff26aPphxS7nent3LGKwRWApnyx68EfqziVfXR?=
 =?us-ascii?Q?pN1btvbEXL85Fv5j7EFBRxOlNlMzDAa3w3J7hvgVQfR2pORtyVKlNeI5B87z?=
 =?us-ascii?Q?HZTqDL11Oi1qhqz0XXSgt4vf8mBDQSYVlsmaxLOOhMO6p9fqGK4DdTNZcQaM?=
 =?us-ascii?Q?ps2sRggcQJJKKhDr/kQynZH0wRud3O6y5k1uZU6eY/WzGekXTA/NNvx8BsOy?=
 =?us-ascii?Q?BMdPNE1Vsc95/DEWBMsFheLwhfo6+I0O5Zzt2n4vFlYUwhxloaBZeefciJjI?=
 =?us-ascii?Q?eZDO6Zk5m1mW8KN7z+dojY1dlW+imcpicvo+u/LY6V4LhWi5Mw/F0Ley8bUY?=
 =?us-ascii?Q?BTnJSY10Rx+hQ/Jw7DWVYB0tqemvuJl7BojK1aDY4uTk/DgD5Wr/XuMOr1Q5?=
 =?us-ascii?Q?mFlvdrLoXoBsSxvZf5sEUjZpBBAmDs9Xiin1fOaQ9GwLZsjz89ZwSeeP9X2p?=
 =?us-ascii?Q?svEAsPlYrMsoxfBeNBbA/bNBLjpM3bcaLYet2YFoJXQBipSONpQCaKFzPBYy?=
 =?us-ascii?Q?1h1gVfIz2bRc6JKeq8mjZE8ZMVkAXdgvQE+R44zNnu42Yw3JLgxlq1BU7+hD?=
 =?us-ascii?Q?/pXHQbEh5c+oGJt49DemUYC0kHxWtoMctcIRKKhrerscIycVeyFpfpiYeGth?=
 =?us-ascii?Q?tyU/4McTD4sp8zJssWkfGnt52GHihuw1U9WD5e+3ouuupb159ft9/1p6haZ5?=
 =?us-ascii?Q?nuAqCNd3/Pn2yHCHPcoz8NL2n07UJNIJdq+liHblMJ20xIK7XkPFuZxxRtzR?=
 =?us-ascii?Q?0cnJIxp8BTTIReWUm7Xg9+ffbym++/beRwkehs1T/8Vuy1P12aAkTPt74o+F?=
 =?us-ascii?Q?OxXw6TE79cb4OoBOxJtTS/WQopCMm9QA1YXQ2CXinrEmm5ESccvtU84i7ltg?=
 =?us-ascii?Q?QDmJcsJYYjYuAJtiztj9cAaIROXpDm8hweEetwXqB5C868SWpigDX765CvbU?=
 =?us-ascii?Q?w1bVQAc9vrCnjFZikYJsXluw/uTMJyOS3/MUI/vXxRmtZvwxvcu7o+6cbwU8?=
 =?us-ascii?Q?bW3iOdpLDUqHb75qZUZUpFQMaot3a+z00g1/oKwUZk3y3DQM9rXRE3BGurpQ?=
 =?us-ascii?Q?39xD9hfxgwUGr5azu3pF2kRnVk0mPFTuyXRrJpPse2sfjtmjioJVfpUKRAh1?=
 =?us-ascii?Q?VZNNBKXnrkwB99/PIIaytVzGFbBHx5LoZ8Fa/owSESBuUkTCwf2xKI8rIQo8?=
 =?us-ascii?Q?mb+CvtilF+ccsAUFxb336qfyBrZEpBskVL3RK0Pum/lZ/t4WjvDwm7B4g5P5?=
 =?us-ascii?Q?TB3MjR04zJk4aRFYwL0n2HfK1vFURJfpMmsMnfCgqSNzJAM0LG8qZtx3+lSz?=
 =?us-ascii?Q?UJMkV3BgG2wEQRT1j3fBS/2P0KT8uOtwj2PkTozF2kA0pW5KLPn8kFIpA20f?=
 =?us-ascii?Q?8qzOeaesjzxbNc8QDgBwbr8u61MzdyqmR5CcdF12qaYCrdud1f9VIwk8Ic11?=
 =?us-ascii?Q?h7uzIpCwzCh2pLiCDSV+/k/akXa6TnB4zWkwZTutsPm65tVJAZndMUH6VMGb?=
 =?us-ascii?Q?fEexTROwOrzXC9Rv3cAlT46KmNKdMco89PPy4SO11+rlal0vZmicNm2Lf0dI?=
 =?us-ascii?Q?kxrlzW+xZ9IDr7tKXp1VD6YCoIUiMv+lGTfXnNtMN/HGESMVQ3cA29Hq6eet?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Mhm1AhVcjIA58jrTZuQcZ/f2BgZyJy4wCYWL9O3GeibOUKWuEgLZk7bzH1dq8Y74is0bpoS1Zlrk4DsS/4iaN6l3zIOJyGuh68iy5nD8gvVHJYwAJB8iHwLezlDvsXGbr7X6eXbSCEFOfqX+qLQCizwCu1Q7zPZpRZ3Sohq28qlLiZinE/oXugsap77m0LyEsYTi0PnNbzP9Ck1sGKLysGz4aiRXtj/4yXWlUoy+/U8eRw2s7Hb5grnfycNsu7d7ZNhJvZsPJxP6x6a2txHirfox9s0O9oXcAvafYmgIh2NhyFjWhuX+vWbRjl4/e00urJyWcI4fVj4kXbyB/AcgZdbX1v7vUQhcKqT0KXN5ng3eI1V/YziWlv0BsjcE6/jC0gg8dhpunSRYYYCmfM8BzoZBG5qrBHbaIBpANaZXLqj9VTs3GjruUPwdJ3gJlp5B31uAjpy2OVpnHCuccp4ubUs2sewvzPGjAcPTOtP6tXBZZT9JVvwnkS3EtMKWQTkyeK1CMgIPGc8aieeyxsvhnXb+xT3FiabGQ6LOiKmIt1Rcvlkx2RteH6sBWkkwTvP1dUqgnwx7NS80UyzBDAmvAh4/E4w/k3YyzqWnt3WeUozgFec2b20VLpHbEXcN4tbm4q6z3eykIEQYS2j+VHTjSzgq4b82ic2dvvshJIpc71cQGou+1RbeVPXI2+rQJ1k7T0GeMmXHkiH9EX1B8BzMdu3N2x8KCa30su809Ai6JCtvhh9dCNodVM5ktIyyHO+W2gKPJByIM+WEHSbryeYjvBwTUJQvUod8lhAqOcZg3Q0rEioXAaYB1Mw7nI7Trk7v1OZNC25wIeyN5VDhT+MI7g==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d03ab1-f736-4a82-499a-08db0dce4a66
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 14:26:26.8354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ktiy1xe3bD+TK6uDQLKrRndsUpoa1T1KqM8L4pNlcu741hG51PMEKjW/mJRpfh64+3M89Co6D8Fg/Tg52SgP5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5645
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_09,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302130130
X-Proofpoint-ORIG-GUID: o_EZn3F505eR5aNV4ZNLIJhKkOEkZPVY
X-Proofpoint-GUID: o_EZn3F505eR5aNV4ZNLIJhKkOEkZPVY
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0a-00069f02.pphosted.com
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

On Saturday, 2023-02-04 at 23:29:44 -05, Alexander Bulekov wrote:
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  tests/qtest/fuzz/generic_fuzz.c | 106 +++++++-------------------------
>  1 file changed, 23 insertions(+), 83 deletions(-)
>
> diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
> index 7326f6840b..c2e5642150 100644
> --- a/tests/qtest/fuzz/generic_fuzz.c
> +++ b/tests/qtest/fuzz/generic_fuzz.c
> @@ -18,7 +18,6 @@
>  #include "tests/qtest/libqtest.h"
>  #include "tests/qtest/libqos/pci-pc.h"
>  #include "fuzz.h"
> -#include "fork_fuzz.h"
>  #include "string.h"
>  #include "exec/memory.h"
>  #include "exec/ramblock.h"
> @@ -29,6 +28,8 @@
>  #include "generic_fuzz_configs.h"
>  #include "hw/mem/sparse-mem.h"
>  
> +static void pci_enum(gpointer pcidev, gpointer bus);
> +
>  /*
>   * SEPARATOR is used to separate "operations" in the fuzz input
>   */
> @@ -589,30 +590,6 @@ static void op_disable_pci(QTestState *s, const unsigned char *data, size_t len)
>      pci_disabled = true;
>  }
>  
> -static void handle_timeout(int sig)
> -{
> -    if (qtest_log_enabled) {
> -        fprintf(stderr, "[Timeout]\n");
> -        fflush(stderr);
> -    }
> -
> -    /*
> -     * If there is a crash, libfuzzer/ASAN forks a child to run an
> -     * "llvm-symbolizer" process for printing out a pretty stacktrace. It
> -     * communicates with this child using a pipe.  If we timeout+Exit, while
> -     * libfuzzer is still communicating with the llvm-symbolizer child, we will
> -     * be left with an orphan llvm-symbolizer process. Sometimes, this appears
> -     * to lead to a deadlock in the forkserver. Use waitpid to check if there
> -     * are any waitable children. If so, exit out of the signal-handler, and
> -     * let libfuzzer finish communicating with the child, and exit, on its own.
> -     */
> -    if (waitpid(-1, NULL, WNOHANG) == 0) {
> -        return;
> -    }
> -
> -    _Exit(0);
> -}
> -
>  /*
>

I'm presuming that the timeout is being left to the fuzz orchestrator
now, rather than us managing it directly in our own way?

>   * Here, we interpret random bytes from the fuzzer, as a sequence of commands.
>   * Some commands can be variable-width, so we use a separator, SEPARATOR, to
> @@ -669,64 +646,34 @@ static void generic_fuzz(QTestState *s, const unsigned char *Data, size_t Size)
>      size_t cmd_len;
>      uint8_t op;
>  
> -    if (fork() == 0) {
> -        struct sigaction sact;
> -        struct itimerval timer;
> -        sigset_t set;
> -        /*
> -         * Sometimes the fuzzer will find inputs that take quite a long time to
> -         * process. Often times, these inputs do not result in new coverage.
> -         * Even if these inputs might be interesting, they can slow down the
> -         * fuzzer, overall. Set a timeout for each command to avoid hurting
> -         * performance, too much
> -         */
> -        if (timeout) {
> -
> -            sigemptyset(&sact.sa_mask);
> -            sact.sa_flags   = SA_NODEFER;
> -            sact.sa_handler = handle_timeout;
> -            sigaction(SIGALRM, &sact, NULL);
> -
> -            sigemptyset(&set);
> -            sigaddset(&set, SIGALRM);
> -            pthread_sigmask(SIG_UNBLOCK, &set, NULL);
> -
> -            memset(&timer, 0, sizeof(timer));
> -            timer.it_value.tv_sec = timeout / USEC_IN_SEC;
> -            timer.it_value.tv_usec = timeout % USEC_IN_SEC;
> -        }
> +    op_clear_dma_patterns(s, NULL, 0);
> +    pci_disabled = false;
>  
> -        op_clear_dma_patterns(s, NULL, 0);
> -        pci_disabled = false;
> +    QPCIBus *pcibus = qpci_new_pc(s, NULL);
> +    g_ptr_array_foreach(fuzzable_pci_devices, pci_enum, pcibus);
> +    qpci_free_pc(pcibus);
>  
> -        while (cmd && Size) {
> -            /* Reset the timeout, each time we run a new command */
> -            if (timeout) {
> -                setitimer(ITIMER_REAL, &timer, NULL);
> -            }
> +    while (cmd && Size) {
> +        /* Reset the timeout, each time we run a new command */
>  
> -            /* Get the length until the next command or end of input */
> -            nextcmd = memmem(cmd, Size, SEPARATOR, strlen(SEPARATOR));
> -            cmd_len = nextcmd ? nextcmd - cmd : Size;
> +        /* Get the length until the next command or end of input */
> +        nextcmd = memmem(cmd, Size, SEPARATOR, strlen(SEPARATOR));
> +        cmd_len = nextcmd ? nextcmd - cmd : Size;
>  
> -            if (cmd_len > 0) {
> -                /* Interpret the first byte of the command as an opcode */
> -                op = *cmd % (sizeof(ops) / sizeof((ops)[0]));
> -                ops[op](s, cmd + 1, cmd_len - 1);
> +        if (cmd_len > 0) {
> +            /* Interpret the first byte of the command as an opcode */
> +            op = *cmd % (sizeof(ops) / sizeof((ops)[0]));
> +            ops[op](s, cmd + 1, cmd_len - 1);
>  
> -                /* Run the main loop */
> -                flush_events(s);
> -            }
> -            /* Advance to the next command */
> -            cmd = nextcmd ? nextcmd + sizeof(SEPARATOR) - 1 : nextcmd;
> -            Size = Size - (cmd_len + sizeof(SEPARATOR) - 1);
> -            g_array_set_size(dma_regions, 0);
> +            /* Run the main loop */
> +            flush_events(s);
>          }
> -        _Exit(0);
> -    } else {
> -        flush_events(s);
> -        wait(0);
> +        /* Advance to the next command */
> +        cmd = nextcmd ? nextcmd + sizeof(SEPARATOR) - 1 : nextcmd;
> +        Size = Size - (cmd_len + sizeof(SEPARATOR) - 1);
> +        g_array_set_size(dma_regions, 0);
>      }
> +    fuzz_reboot(s);
>

Guess this should be changed too if the declared function is too.

These are only nits, so:

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

Thanks,

Darren.

