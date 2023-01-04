Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 951AD65D7DD
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 17:06:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD6Hd-0001hD-Rq; Wed, 04 Jan 2023 11:06:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1pD6Hb-0001h1-Kj
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 11:06:27 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1pD6HZ-0001Pi-I5
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 11:06:27 -0500
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 304FNrkw018983; Wed, 4 Jan 2023 16:06:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2022-7-12;
 bh=THByionUq6ciTksp8j09tENNE9AKJH1719cKcWK9lzc=;
 b=t+NYCHaALZBuXpLUUTyka1BP+G5ynN2QhKLUKr37vtqDvn2FFc4yFOJz/iiS3LBe4zKT
 aUKgfzNfac/ft+lcn8D1aLScgJQ7T2wBferaUInFT0sSUPO0Nb2YCUwrKv9q/CPRmblt
 1evjkq+TqkqikDLPJ5uak5cbF0QS/8xfJnYTw6jpNMGhURzCCYZDcS1iBC0hTRpe/wwe
 01vogwoPU1SSkg3twAVhtoaNlTiBorxDnCCJJiscgowrvHaecrBDxAhTgI1yTlh9Z6gB
 7ck2G+2tl2aEgBA5cDnDLqszfV16mxowfIPNqLY/RtcjaRrZ9pi40H4MEJB3T9m3pIbn cQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3mtd4c6xsq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 04 Jan 2023 16:06:15 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 304FrmOV002613; Wed, 4 Jan 2023 16:06:14 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3mwcghgn36-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 04 Jan 2023 16:06:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U7KDb7P0FI+9GDA3bNIF/FtAzrZzmQdiAKnbzbM+nCJx/HfejwJWNJVL9eGoMHEt96Qgj70Tg8//x0dKEgNrGPQtH0E8t89+h7hm1M1iNiJN+FUa/1r3q7A/Er0RTJRz0FwrZ793hkbgBFcrMyrj9v81ZGh5uwceZofjCZq7+BY0lkTeB1ASzStz0J9zDyJSCfBFxiqiwplXffbzseUEy+xf3EVoJrz02kfZkxtbQpDl0zU0Au6y56N6y18bR+gDNvfd5PtAHnHRQgS+ivoKMhdJJUeUVi8N3jcbPUqUZou7CW6yaHDwRdgV+fzAO/vEtk0QBZ5TZftJwTt2jIVntw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=THByionUq6ciTksp8j09tENNE9AKJH1719cKcWK9lzc=;
 b=A2CBZQntcxqxVuWlC3e+Vs4Nw7Vw6Evv5hFzKXlL2bmldlWTq4YU8oxJ69YIJBmvO2T5Wqd7jDogDI1vZ2gTNVMnzN3i7hiOWtp4fjmiZKOmb6GBhYbaF7eC1yOM32AyFS9+OkSvKKJUD4xbV9uraRDUwyLgieijjyF0rPjrWJ4bnJGdtpyQjQFW1J8EmZWeQX4JVeZLHP3/04M9n7ES/PYPRnmIRmV+H8KlkR1WNHsSuANjMozU75UDH4darO5iPLlPBlHUu19hYhU24DUM/gUL/shiIRd2Fu8eslUA4+5tmbBkkUs0OAkqelXOJLpx9mKSQRsmChuESHFiIhVPFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THByionUq6ciTksp8j09tENNE9AKJH1719cKcWK9lzc=;
 b=YfyJ+loykofspqdP1pFR41Ucockx+nVuLD+X+v6HSTpMRSlJiKWSAvAhxkOlLBH740jy/pZEBDCFW8X5hCrZk81N+TxrAKq7r5RzN2912NLO+wbfe/dq9b+Wg0iNimd676g0BmjVjkKw3lpUV2YaJSP6JpYF/I00QguV6Ay+b2M=
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by DS7PR10MB5056.namprd10.prod.outlook.com (2603:10b6:5:3aa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 16:06:12 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::d868:78cd:33d4:ec7]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::d868:78cd:33d4:ec7%7]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 16:06:12 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, fam@euphon.net, mst@redhat.com, fengli@smartx.com
Subject: [PATCH 1/1] vhost-scsi: fix memleak of vsc->inflight
Date: Wed,  4 Jan 2023 08:04:33 -0800
Message-Id: <20230104160433.21353-1-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR06CA0079.namprd06.prod.outlook.com
 (2603:10b6:5:336::12) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB2663:EE_|DS7PR10MB5056:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c0ee783-82bc-42b8-a06c-08daee6d997d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7K3iERxkfTauA1OiFhBAkJvtX0xgle+gyL2hTENrmTsVMMMiMy2hormQTUX0rYSsOoiuEREXjN6IlQ7oafeo9MVrf8ben7SH2fK2YDFytZALFWJUiAdHESH8DZBNkIASWU3b4QWSw5bExdT8KjPC8WjEiayR9Hrieu4JbSI3UtFLf9OcdviWApGcIS9qDtQFU+BhsWZVCT+c3b+S3kHcZIWqCp6CO1FAwNPnLe7fM7ytXB/z5+wtT4e4Xd7DPXYzF0VnmVMn8IL+Al1+De30yzyHLY05IZJ+xOduy5gM8WM5rkQYOa3GwMS5MA9Btr7hhAKUQFsnkk7JPm/R3Vf/U816AKHDF0Bf25/Fx+tZby6LcYloI8UyyXTMsnkuGhr4e8tdIJJsCb99VRDg6D4JXksC9IGll8FD+oZW35Klqp8Hu6FDQGMLfkzPBLcci/Q0vJTTJugCykBJI13DGp/EU+IH4wBBxSgULmqwShggH/6qd/cebK0GaUFW9zht0FGizlcRpfxKkqpkrIeDUmIcxtC4PwVKCGQlh230zmnGRX+sV7vYLxL0w5V4pTLtIx32wfi3K6FAltSm/L28uhHq724Ut4P/A0CwD0U1ha5JjWtyKIHS09+AA9ksd7aVUmRd7Fnc4lqMVHVvA/hHS0LO0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(396003)(39860400002)(366004)(346002)(376002)(451199015)(41300700001)(8936002)(66946007)(5660300002)(8676002)(2906002)(6916009)(66556008)(316002)(4326008)(6486002)(6506007)(6666004)(478600001)(66476007)(2616005)(6512007)(86362001)(44832011)(26005)(186003)(83380400001)(38100700002)(36756003)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9SGnbXaFkkx/AWEaYmc28F703+MbpHa+dkKCOv01Y2DbZ0X9qr5gXxD3P+kN?=
 =?us-ascii?Q?ppu8Ch42Htg1aNNWL6iys7oGC36g0eSjJxDhAGJh6AdnUFyhcD1sSoDS/N3O?=
 =?us-ascii?Q?BDXcpwEBiWMC8Du+KCDJlER9FvgK89lunPjs9EEnYH3BR3+c3lu7k5htZLNv?=
 =?us-ascii?Q?dKARl/OAQJmvuKerUjVYshreQ9BSKzhfW0WkC97xzOpxt8L5Fj3NjS4PNDCZ?=
 =?us-ascii?Q?p00Ys9JOjTILP6sAhqkbMS9YJz7IyNzdV93Rs9m0PW7EIFtDWMJEF8UY/5y+?=
 =?us-ascii?Q?emzli0PYgOWk9l5pyvlU51ZZrBJQz4nrk9Kim+rN5oUxsVdfDzZNg1acwh51?=
 =?us-ascii?Q?lJlZc+hgzkul0mbUFR8abhfcQOO1URlH1EaSdXu3ubIZZo9Q6Yf0NuMdR6jK?=
 =?us-ascii?Q?hx9q8nqI6wo3c3An6dGevzqWx8woNw8e/aofBOoCZCB4rn3JrZmgp3fmeWP9?=
 =?us-ascii?Q?02cp117rsQ3Wgl6hZUUK5l4uY2GRVHl6rTLRJoGW2QzmIbP5HS601NQ8qMVf?=
 =?us-ascii?Q?K+govhP7j4GsOwayzqGPhVVolPesf1XqV2+B9F5ve5Xv3SqsJ9ZRFdGuzBPL?=
 =?us-ascii?Q?j0oPrFKQTFbSddzIhpWhV2IGt4XB5YwAP4FV5UJVjJFacPWvRVo9ZteUerSx?=
 =?us-ascii?Q?gUfxlhES6uvS7lZx3+ghnpU4dd7zEnXknNYf3WjBx8kWSz2divqlv3DPC3Ki?=
 =?us-ascii?Q?/QLDoHRgCQfycaNQXH1mBD00d+sGJqHLfUrmIhXtWdlUGcA0xDjqWEGptwdF?=
 =?us-ascii?Q?WKAAL0Akdf0ptOZtuwXvnEz9OcVTi9CrM6wgZS6eEyXkmAordniR1OMEzB0P?=
 =?us-ascii?Q?V4Jvc0etNb0gv1E3JQu+SnUFVqpAwjptS99Yx++zqFJFq1OQdG8yBTRswcNX?=
 =?us-ascii?Q?eX/UKF7Q2jyh8SnXV9ktIywBuv9RvUUO2mdZPwjAXXP936qpaF5BO9/SAc3I?=
 =?us-ascii?Q?BGDaLLUbCI/rVTkI96bslCy5X4Wd0O2gXHhB0XgtKGi7Lm5NgffX4y+VBw2u?=
 =?us-ascii?Q?fJ3NDBII+r9No3lhiwj0vUSJBuL3AMOfPUcDADyJfSf1V1RS5ldXk97cZ6Me?=
 =?us-ascii?Q?SSuboHBbZvrzxyYCkO3MlVoziXkZAuxrbR/5D4kbL8iTx4CeDT7FuMOAXwVe?=
 =?us-ascii?Q?tCiQ8dqrrCsKFcAqQeR+yGOiDlc6CPXU6FUm7GYZjTCiMi8ePt2kGVNwI0Ya?=
 =?us-ascii?Q?b3KrANB0kfozT8iW9vNwtRZejDZTkWXuNGEBiqWyThhWuVkgb5BIEbgkZdwE?=
 =?us-ascii?Q?0WtQ7I3q97CzFA3S0Mj/ck0nqzlsa6dngTvrc9P2Xv/C47KT+qYGHc3iKLLR?=
 =?us-ascii?Q?hnYEIOhomb3oMPiFsH7alGg864jwZ6P+fIp9x/iz3ujYxt/LVvcFAdft7phN?=
 =?us-ascii?Q?Fe1Bqk93bsCuau3TKs1IbyxBIa2M8c4ptD5QXiXUiULQdoK4V6EMhjDKbbM9?=
 =?us-ascii?Q?2x2HrZiIW4CUDAtQ+hydOhfWexIN3lJRqxogUgmgYiaYEdYSrYhKzmAZQ501?=
 =?us-ascii?Q?wGb38b0JLXAewpCEmZujfrTVyJeR/qs52sWaYO4S6zyr7Hdz8Qpokvu+yEVu?=
 =?us-ascii?Q?SpnYw/W2pKpwigkIDVr/iz3jyEgq6NFi221YevMF?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: o3QJGv7mDY8Pgt2KjxbHcXMlZbAAj6csCfBkSUh3eJuwzcw5wGOJVn391SkXchlXbS7hDygV5FzuTgdhZXXMP9rZEjLRw4eHuwJqamIwMYDVu+fifeERznIiTRFXcMpoOKiWgbdf1VFE8j6z+DHMPTMx/yZASXwCuYzg4tIkMe6oLnxpFUp524pIdEoOSxVP09LTsCmI/VmDv/epA/KTrU2a8aoo9kMnjO6ocdDOe4dZfp3HltfGJ7a68B6+F9/wgwsBSQCvGLDthDjTr/AEoIcYfvpsDm8oddwEv/WTYJ+q05qUebVWOVcNV97HSSpHRdL0AQJb5nRZnRVb0y2DUyH510FPC8pxnc/OHH8M7F9DfVsWi10mkl9LHPAFoXM3kMZ3m+vn7oBa3LlmCxWJe9h2C9rJwumjqD47oEFtouH9yBMOK0AE3KBseAB6SjkQmX0j/xMy9sp5TlTqqeH2+kV+B39tHFPXoJ8wp0GNFX8q+U6+y4G2sP4JnooMGt8drn/0r0abgyPu2bcW2Ji1O1SmwR88RRf+PpBtP2QvO+I1oeUa5Lg044bCBhylitZ+uzhbCUndKM73itXFTzFcnoqe5b7v90TqflD2HVjjpQiFAWBc2Rcntwnuj40XSraAPRYEH5yOCQFr9jzMjql91mbmsOgo/AqB4CwGlgtHZBI0CB3bxyp2YeLzxP5sOHCYHRLC8yNho1MtEWvxOjyvuFFr1g+wrf8fcSW0aHr8DuwoZojnXaCNsSX9DneKbhRo29jQxYtc/P6rLXOiUYKzpsI8c3e7p1XNzc8WOdkb91/Bu/yTqJZ5LHERAXWES2yKH6Yx7JsuFIUZr4CBxGuQQnB4bhR97NRJJoTDWsLoXmI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c0ee783-82bc-42b8-a06c-08daee6d997d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 16:06:12.2058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ERyOA+t9F0vyTRyQ0q7j+o+d50rhdk131/F+eeyo+nhxFJMQ9oFG1Zv+dellSKb4XCbTtbFA5+u5yuzWDvniQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5056
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-04_07,2023-01-04_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301040134
X-Proofpoint-GUID: 3sFT-VUw0FuKCeLIKC6Ke5g8vn3blVoV
X-Proofpoint-ORIG-GUID: 3sFT-VUw0FuKCeLIKC6Ke5g8vn3blVoV
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0b-00069f02.pphosted.com
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

This is below memleak detected when to quit the qemu-system-x86_64 (with
vhost-scsi-pci).

(qemu) quit

=================================================================
==15568==ERROR: LeakSanitizer: detected memory leaks

Direct leak of 40 byte(s) in 1 object(s) allocated from:
    #0 0x7f00aec57917 in __interceptor_calloc (/lib64/libasan.so.6+0xb4917)
    #1 0x7f00ada0d7b5 in g_malloc0 (/lib64/libglib-2.0.so.0+0x517b5)
    #2 0x5648ffd38bac in vhost_scsi_start ../hw/scsi/vhost-scsi.c:92
    #3 0x5648ffd38d52 in vhost_scsi_set_status ../hw/scsi/vhost-scsi.c:131
    #4 0x5648ffda340e in virtio_set_status ../hw/virtio/virtio.c:2036
    #5 0x5648ff8de281 in virtio_ioport_write ../hw/virtio/virtio-pci.c:431
    #6 0x5648ff8deb29 in virtio_pci_config_write ../hw/virtio/virtio-pci.c:576
    #7 0x5648ffe5c0c2 in memory_region_write_accessor ../softmmu/memory.c:493
    #8 0x5648ffe5c424 in access_with_adjusted_size ../softmmu/memory.c:555
    #9 0x5648ffe6428f in memory_region_dispatch_write ../softmmu/memory.c:1515
    #10 0x5648ffe8613d in flatview_write_continue ../softmmu/physmem.c:2825
    #11 0x5648ffe86490 in flatview_write ../softmmu/physmem.c:2867
    #12 0x5648ffe86d9f in address_space_write ../softmmu/physmem.c:2963
    #13 0x5648ffe86e57 in address_space_rw ../softmmu/physmem.c:2973
    #14 0x5648fffbfb3d in kvm_handle_io ../accel/kvm/kvm-all.c:2639
    #15 0x5648fffc0e0d in kvm_cpu_exec ../accel/kvm/kvm-all.c:2890
    #16 0x5648fffc90a7 in kvm_vcpu_thread_fn ../accel/kvm/kvm-accel-ops.c:51
    #17 0x56490042400a in qemu_thread_start ../util/qemu-thread-posix.c:505
    #18 0x7f00ac3b6ea4 in start_thread (/lib64/libpthread.so.0+0x7ea4)

Free the vsc->inflight at the 'stop' path.

Fixes: b82526c7ee ("vhost-scsi: support inflight io track")
Cc: Joe Jin <joe.jin@oracle.com>
Cc: Li Feng <fengli@smartx.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 hw/scsi/vhost-scsi-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/scsi/vhost-scsi-common.c b/hw/scsi/vhost-scsi-common.c
index 18ea5dcfa1..a06f01af26 100644
--- a/hw/scsi/vhost-scsi-common.c
+++ b/hw/scsi/vhost-scsi-common.c
@@ -113,6 +113,7 @@ void vhost_scsi_common_stop(VHostSCSICommon *vsc)
 
     if (vsc->inflight) {
         vhost_dev_free_inflight(vsc->inflight);
+        g_free(vsc->inflight);
         vsc->inflight = NULL;
     }
 
-- 
2.34.1


