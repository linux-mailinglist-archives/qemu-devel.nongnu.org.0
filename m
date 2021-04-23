Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B01E368C5D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 06:48:44 +0200 (CEST)
Received: from localhost ([::1]:41716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZnkA-0000M5-QP
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 00:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lZniw-00085u-Hd
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 00:47:26 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:32338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lZnit-0005uC-Vc
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 00:47:26 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13N4lKCL014593; Fri, 23 Apr 2021 04:47:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2020-01-29; bh=loFXw8WKXXoJToLBhno9CIG9yg6vxLTPaAGJKrmOu3E=;
 b=RhO+qwiJTzdgP1E4iObO7EAFrGBwOe1dtF75qg7KLrDbUfMvji2c3zUfWqsog0NKQL9D
 MCpBdTgvdm+hBnvTJvnO3mlLbv84Gub7lrFjg3CQaLScVYTGT1bCFNutiyl4oiZ+bNfB
 f3Gdptq6El9hv6+P60Dr3Q5c05vrvTTlLICELlAUju66M4lnYaCNLWBB7XATerVIfNjs
 m1wmGuMYyhYJFB6Tl84IZ+IPO7pu7h/1SZ5acwg20Woevgjnyi+UcSNoxjcfMJT9cGDg
 v7+38MA7MHYBbTJiTNb2hv9My/Uq4HpODDSYU8R+mmhhY2cG8StiZP+x8tEwAXrJhh4+ dg== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 382yqs8gph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Apr 2021 04:47:20 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 13N4lJUQ155492;
 Fri, 23 Apr 2021 04:47:19 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2040.outbound.protection.outlook.com [104.47.56.40])
 by userp3030.oracle.com with ESMTP id 383cdsfecr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Apr 2021 04:47:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q9lXF6RqReU8CgjM67UVnd8ja9gKswXbKWha4U7mFkMTp6KIxO81A1gbyZJ72g4GucA1NVnX8BKijvnsDUmy5Tsl5DkJkPXjTqBnOQWJ7YkfL1NQNVaq1E//uTlUxLntyPWmctqJwsoEJKFKlJeNx2cxGY9ZwLZZ5gDidGyJHgGz0hM6gsutUApfX17owqSUIf9gtJKTeQX5sqffA64fBy+w/9GgXSSo3sJiKFxpxPf+xPFy+GPYIZM40noWwflj5TlguoOJVIKK4p42087/mbESmzng6LqzleYcRigQNWsTQigWNfuKca4D5xP7CeFbr5HTxvEtclrwf7lqoSeWsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=loFXw8WKXXoJToLBhno9CIG9yg6vxLTPaAGJKrmOu3E=;
 b=A8gPFVcXpvHvShrwhLvsqgdzJ4U9YdVhbPwy28uu5eOfYDqKM9GD7AJBJn4QVvYAPz/QKA5S3A44J36cSFroFIKcmD5yFc9BuDEAuJf0yOPumiiCfWgySTjqPq2Qmiwbo9Pdn3GmxKemdf0ARinyGmzOpzpP1EaUbtwflc9tG3wXNmPO088ZALHst4YZvrF0Qhe1seKAm9HHyW1STfu7izlKjluY1ifGN0PuN1+gz/a5Xy6hXlJ03c5VxFejoN529v+Fw6cWq43nUIgG/iM4Ab8xnLiKvEGKoiFQykBpOPalfzJIOJlRhTvfN12IWRy133Trgp6e1B4VecBGLnaJYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=loFXw8WKXXoJToLBhno9CIG9yg6vxLTPaAGJKrmOu3E=;
 b=ZDc9vlMg31f9BrrVB9yy4w/5jUvi+qv1UaRPmW6KHmH/WrZWS/wPfP83/9cdZFjEIWofAenWLD45g4YLKeFC8WRAwjP/emjnCSM2JEI5LLihDuKusEgHudmflffI+7u5p3muu0PN9isIidDAiGyBN2+Rn7sW/uyQ4XD9rwOm7Ik=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB2668.namprd10.prod.outlook.com (2603:10b6:5:b2::25) by
 DM6PR10MB2668.namprd10.prod.outlook.com (2603:10b6:5:b2::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.20; Fri, 23 Apr 2021 04:47:16 +0000
Received: from DM6PR10MB2668.namprd10.prod.outlook.com
 ([fe80::b8e3:3780:cf04:4957]) by DM6PR10MB2668.namprd10.prod.outlook.com
 ([fe80::b8e3:3780:cf04:4957%7]) with mapi id 15.20.4065.020; Fri, 23 Apr 2021
 04:47:16 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 0/1] To add HMP interface to dump PCI MSI-X table/PBA
Date: Thu, 22 Apr 2021 21:47:12 -0700
Message-Id: <20210423044713.3403-1-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [138.3.200.16]
X-ClientProxiedBy: BYAPR02CA0055.namprd02.prod.outlook.com
 (2603:10b6:a03:54::32) To DM6PR10MB2668.namprd10.prod.outlook.com
 (2603:10b6:5:b2::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (138.3.200.16) by
 BYAPR02CA0055.namprd02.prod.outlook.com (2603:10b6:a03:54::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.22 via Frontend Transport; Fri, 23 Apr 2021 04:47:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7276667-fb46-42a4-b95b-08d90612deb1
X-MS-TrafficTypeDiagnostic: DM6PR10MB2668:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR10MB2668462BC3EE1277CEB76C6DF0459@DM6PR10MB2668.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qcVDi3TrTI7LZFt7S1GZtmSHA59Rn9O2DskDElATIXn6k19MarpLMiuMVoWheIpSMOG6Co1gdpqEdsvGgn3mysyPmD1Rhl6VBo3sebyioCgG5lKP29+Y6QH4H8IH8z/hXNrN6o0ynBwx9cKb89HBnReqdrn5VbUQRzrVQURYv6YYbXSPD344JzBf/dL+D8PVdtdDFezJH9+0GDl6cvc8L0a8N6qbYemui9ac1VasmriwVUYc8VMqVICIdaggVlSMRxKZmut03oeRr8X5/Yv3h/hNze9G9T7qWe9oU72Q9p3zFPgvY1vhgDt22WNZOPfQiHk80s8FXQvAyZHrLK7Thph5a+Wt5O+jfs4Wx9DUu/sDzRGVl21d8kAcciBnw0d1Y2cRh/pstrFgN9BAg1PJQTnYcZKNgPdIRMUJV01rlgrylLSILaoPBo3j1Ii/1NbGtJgORy4oGGcyEjRB9J122qUmU4y4uNb80r61L4jbZukriplqasE3UNOyFbdCoH99zh6Rv5GIjfmcVaiF2ENLesFTBC0VLB0Aaxjzb15sEyLe8ruMImf8oDNrI+IGafZYZwqKJTE1nUDB2aA19uOWlPvykXjfJYSNSO7u7W9taO2MBityPu8F4sSTAm0PMfZn1y9AAHRHWCSeShRP7qP225VCi9sBCH0x/ekJInU64sgQEciUc5JUUijw5/vr5XKharkzS73wSDTdVvtuGTkqlGZTuNNJ4t14EVAhEnq+927ItsaiGWgNTbR4hez3ZTeGsdJ7ixOsxT5vOACObYwatA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB2668.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(136003)(366004)(346002)(39860400002)(38350700002)(66556008)(316002)(38100700002)(6512007)(8936002)(2616005)(107886003)(4326008)(478600001)(4744005)(36756003)(966005)(186003)(16526019)(8676002)(6666004)(2906002)(52116002)(5660300002)(26005)(66946007)(6506007)(6486002)(6916009)(1076003)(66476007)(44832011)(86362001)(956004)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Hiy4Tl60XKDCv3rBpQXM2kXM2HbI2spEgjG9sp4ZPYdwtnsrZ4zLecsQLKeP?=
 =?us-ascii?Q?QXVFaQz4IiSpgyd0ZiS+9zeSQm5snU3ZVcgOikVOc0Al0Qf3zzabEmVqx/kx?=
 =?us-ascii?Q?A1ELhKuDSxtzFvL9d898PrommoXDs7Z1B5hr+p9DiJsCxMKs/7OukhGqTnhY?=
 =?us-ascii?Q?cWHYuWDf57OON2qyhuJkDlcDVQ/3XuUqlBHQ4Q103VD6YBfzoJbr430rkN1i?=
 =?us-ascii?Q?XgDyxjBE/vsdtxq5qCodSmeIg8VEW8E2ibfUWbNM3i9OGy3Xy5JW3b4AeGCq?=
 =?us-ascii?Q?uWd7tBzt9M64YcEri/tt6Mavidby3bO2cFTsRwnUd6CEi1XMR7+ZMiD/VnlA?=
 =?us-ascii?Q?Z3bYCIdy7z1EglkNadFXtVOlrez934g23DU2vsf25YE//9Oqo/zrfy4WaWKV?=
 =?us-ascii?Q?IsHxkiJsA6l1l4V2FbeSMfChQ/JkJfw1JEFn6TUBNkfGxTqn25p8NwPs1re4?=
 =?us-ascii?Q?wJlhWCrWKv4mzoOUKMlSvWGYEumq0Mqbd0jZMQl+2atXvaN7oN8sHGC/ZaVZ?=
 =?us-ascii?Q?lJoE2iAoRuLuoOWyAqPezKAgXHARvJ7kFN0qfMbCLXlDZgkRr6EyEGVXpvyK?=
 =?us-ascii?Q?30C0MX8QUR4nXXvxPONxmgpPiKZxMxsatPzMxi9t0X0sC3UK0sCmFTiGyAmC?=
 =?us-ascii?Q?U+ddPZPDZtnBrHUqv0FAeC0OLVBlAy119ZMHjbLBtKobEejk5DkVRAAiBUZi?=
 =?us-ascii?Q?fvMBoaX5q9658SNxRwbMz8Rh2AUMVi8Ty83ZGZH/kGfvPCBdOfaLM5HAT8ID?=
 =?us-ascii?Q?o+22/LRDHKxQdE+ec0b/+FtmxvqsIPrmv27W3dbaeDpjr9Y6PwIuMDwzORN9?=
 =?us-ascii?Q?M8t416/JlGocCQz7QICWDX2jiQPmbgZPT2/VW+ruMnZA/FcNCp629P3NEJiZ?=
 =?us-ascii?Q?XP8KOVlcd1s/7wkSEyVGqnw7SY8wvSOarOx9pVto7fv2lUEz7FUMhlX1HfbE?=
 =?us-ascii?Q?VAZw8mQqp5h2t6nwuBQ3jTIrB93qdNJsv1Q9E88XOr7kRirqZ9xBm9G3c7De?=
 =?us-ascii?Q?LS5Z2BcHZSbnxWhLjD6RY169yi0h59SUFLIvUg1Cgmtfq0tw9dGUdy6HKSDX?=
 =?us-ascii?Q?sSNpkZxyGKp6a24tVkaBVpUF58mzm0AVn2dC5QX8kEZ43Q914K+9pfnf8E7x?=
 =?us-ascii?Q?/m97bvZ8tnSAPMei7F6lgNVja+Cuhvgq0lMnTR6SWiUWWWnAIBjd8p6VlgAQ?=
 =?us-ascii?Q?ksK/i5pjcHcoTiyF88G6HEIYr8RUb1j/D1t0ofNjhmDdZrBRo8jD8ssGZChf?=
 =?us-ascii?Q?JPBN87qV0RLHDFbM3BnV0Fycx5SqJF312gFN17Esox0MVFTsHhwZuRqQsQo6?=
 =?us-ascii?Q?eB8vY73IkGHZzUK0qYzE2CF6?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7276667-fb46-42a4-b95b-08d90612deb1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2668.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 04:47:16.6991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ta09pxODnviBhq0Yni14Yi/EoRP0gJiFiWBJMubR5lkHIt8e1Nbaxtc9sKgCzoEOTyUQmwPst7BVeTqp3Pq7Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB2668
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9962
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104230029
X-Proofpoint-ORIG-GUID: qM9ljKGBwqQJb7G8_FbPiv_CgyaGcrH9
X-Proofpoint-GUID: qM9ljKGBwqQJb7G8_FbPiv_CgyaGcrH9
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, SPF_HELO_NONE=0.001,
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 jasowang@redhat.com, joe.jin@oracle.com, dgilbert@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is inspired by the discussion with Jason on below patchset.

https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg09020.html

The new HMP command is introduced to dump the MSI-X table and PBA.

Initially, I was going to add new option to "info pci". However, as the
number of entries is not determined and the output of MSI-X table is much
more similar to the output of hmp_info_tlb()/hmp_info_mem(), this patch
adds interface for only HMP.

The patch is tagged with RFC because I am looking for suggestions on:

1. Is it fine to add new "info msix <dev>" command?

2. Is there any issue with output format?

3. Is it fine to add only for HMP, but not QMP?

Thank you very much!

Dongli Zhang



