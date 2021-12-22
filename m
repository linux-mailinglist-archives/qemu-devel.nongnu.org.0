Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBA147D81F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 21:05:43 +0100 (CET)
Received: from localhost ([::1]:50708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n07rq-00073N-H2
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 15:05:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07WF-0006Yt-OM
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:43:24 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:42610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07WD-0000Ek-6u
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:43:23 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJXufk014442; 
 Wed, 22 Dec 2021 19:41:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2021-07-09; bh=J1P+jW6ew1E68rH/Zq+VU4a1ggOrFDOh+Z4FjQV+XfE=;
 b=cEnX1Vh6MJs0aB4FNL9vXcJ5zPIrDiiaaH0djSgJQZXQwyCTIasZ0PLrzboqPN/2Evzd
 770A0XVgq4N40vQInWT2xmysPbMaoNp6ODaZh4YB1ZWdq3Acrhp5XM/y9kIS9N68gNQd
 Cx1PEKhqj+TOKYFYs9dGp7R1GRAI9J//xtZHZLirdADBvzy+flb3meexT2txUrZgci/X
 05mjuKwHK6fMpLI5KTsGUPxT8+eN1eRdk5dV5apU13+HpP/UTWHAf+5yiK6nH3OffL/J
 Wb41b3eH2j9OToyFauH7MS/QUDadrYgnAels4bnzSDte5MpEA0F3EAB81Mt3BD4oFY2F sw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d46qn0t13-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:41:57 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJfCeR049074;
 Wed, 22 Dec 2021 19:41:57 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by aserp3020.oracle.com with ESMTP id 3d17f5rfmu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:41:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N2vEX6DSnluIm4kuJfbAv407wQOqWAoOh3YrDPxrFrsgnSetW17KHafVbosk7sibsxNVTmJ7HEAH5JJF1bDBhTa1koFkBc4O5owyfnUPRhM6zOLZMyqczQkQv+YWtGMHxtAQdiYiSLYq4jgeViB0ZJ/ctF/rJhzwvUi61tS4imQLW6G7LjY/d/2O3oEtBGA67ycvluYnJj2CYt9jGIVNbOxrrT/MFpPC4itpb2glIjDQ0/KTrBLQ5uCbqPfFJuBdmZKc3YF9UX1UGaWHgdzjw8uA16O1twv/O62YjI7rudlCm7WPT1ca17J8xsVfdiij9bRdIFb2k5msTM6FGTiWsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1P+jW6ew1E68rH/Zq+VU4a1ggOrFDOh+Z4FjQV+XfE=;
 b=cpgtOG4fwv0KmtHtOhIBGxMlXW6cVEhu5RKGrl0ziX4teKG7IUbyFF69bd5K03kl0auHgXKvNxV0Z0okicPQtXjWM/+55kT2Jf3yysuLjfZQhiiyTw+bB4vQA/t4wW87eLQth6EBCtj58Mi97DC8iZK8ybMA6XJ/tSRh9xq1cXxcpF9dPsTxJNMcFiQ34zIfPgvngOXRxXPtyIt05igL035KQoNN5OEDD1wF/HiyNqhWSa2TfBF7ny7PuFabCnhyGj0zHL/IAf9mdJ/WaNnPTUCkUqgKPG36Z98JLcsinXDemYbp6lJVFBJJwazu7KjmaEHo9gZTD6RYSLLTmeFQPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1P+jW6ew1E68rH/Zq+VU4a1ggOrFDOh+Z4FjQV+XfE=;
 b=flH0ez0jb3iX/4jT3v2IefXRATKHNnKlGYVO2JJ57uTeaPQfCtppitUifVQby8WateEoskZxXCujlA72lDmIVnnYjwB55a9MugFP6zpUDCggmXQo7NND/Zt3yUhB98fR7hZeaLVHws2b0BydZt6n4WPTRubDBP6Is3RgNVt/Psk=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2888.namprd10.prod.outlook.com (2603:10b6:a03:88::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 19:41:54 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623%4]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 19:41:54 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V7 00/29] Live Update
Date: Wed, 22 Dec 2021 11:05:05 -0800
Message-Id: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::21) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 257661b5-6cae-40ad-bbf1-08d9c5831b3e
X-MS-TrafficTypeDiagnostic: BYAPR10MB2888:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB2888A59130F7740213CAC73FF97D9@BYAPR10MB2888.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: inP29UIcfzW6WLFgi0OIKFM1QINJjI1lBwzvR07IXJAu/f1EjPsUztgIeIgY5C3+WycL2b1abbQox5vxTk04W2iGSizsxvu5U2BS/8vE8f8pzPWf1hK0mFqisQMFuC9wYtsuu7WIqQB1mo5PY4erjzmrG6fyXAUqMhOkFgZ1ymmmai9c6RCEX0OV+7se0lPz8NO7P8aBV1ph+33htOUGtVc7jM3LEeDvZbb4g952zEOUE4haBOPeqq+ovO0BR9A7hx7ePv5L9PVV4hFEsN1EPBVGVpQuv/gNp46esdmjwBNZLneK4Oki7AttcMCXIn8yo/g3lpLByVXIh+htJ7iSNaw2nZ6QQ43Ehe9pt1Y+5Gna1S6EfpDUJ2AkdZVPW4fJfZ1tNhmnxZ7C6+RwzAVNdc96eBZpvAS9Vnqi3EBkAp5KSYXMtlgZ+pxUdve9NrTmTQYQX+EUkuPCfrmWLHDH2/vhxDxAFj++1ZgqgtZ94Bs+jFdqSIBryaFt2Z/97Ae2faErBHkdPGrSp50IZyJQxjUr5FmihYBUk1tf1PyYMjPPVV9m0uoFSivbsZta+5U/oXoyHHh5GFjbFNtwH0D59kN058ES3vcMQRTc2sZx6TIvxTMB+pPyAClvxVhAmVSiMAGbHq4LDZTolFXdLcNQzmhV61LOg543bBCxC6/hOjUbxtjMUsc3gAId2Y3EeMgd5VvVmRBBkRCvNFGccBn0xqXXaLZWx5WtSJ3hNE3KFo991IWpWgct+AwlMM7pwFt7GgmHwX8RE3FJRBzXR/Be01radFJguyvKCa322Gz7sxNb/GXNmacf9+YsUV2TuZkS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(86362001)(66946007)(6486002)(6916009)(6666004)(36756003)(4326008)(316002)(52116002)(6506007)(186003)(26005)(15650500001)(7416002)(38100700002)(66476007)(8676002)(2906002)(8936002)(38350700002)(6512007)(5660300002)(54906003)(30864003)(966005)(83380400001)(508600001)(2616005)(107886003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JIaJFkoCcRcqi+6qmwmpyeiWN9KcKu1L6XpjNQqtBNRmQB9Qn+9qdn4gXUB6?=
 =?us-ascii?Q?v2SJLsgQO9deEcECni+MOVxClIi8OeBHDlsDWIUJX3m3bBt7C31KY35vYMHE?=
 =?us-ascii?Q?xp7Ol6veDxdQC5HnSD2ZS7kM+ZIjY30zN3eq6ofnqO3D34JdSydCtqTrfU2k?=
 =?us-ascii?Q?OBwc+ylNjucTxqhF1Qd3iiC2OQzrEHuv3urUe0hFr4cFPQuvecKFbtice8cu?=
 =?us-ascii?Q?Nn2Nl4DF0mTcdHKXqQaQJp6l6UpvRYH+F7obEQ4qhy/Jk7uaiJozTQmnBHQs?=
 =?us-ascii?Q?3bYH66a8kcSnpFWauN6vG2dfsFgvHzKWFYlLyHYkZZ2t8Ca8Pd6CnSPwLugY?=
 =?us-ascii?Q?tN3dI0H43l0mhB18esvHYYODnpntPDvHBB0eI0eFujjnMVwiz7hCfCB5iJZD?=
 =?us-ascii?Q?V/VyBeSh7h3dS8+bRh/yzc/HhtVMcJI1buIQlKh7aXicZyjiWYeQefoiDj1M?=
 =?us-ascii?Q?8QqGRGfVp+52xuREntrEIZavZqr4e96Sbt5ynOPrklAF86n3WUA65wpXX93L?=
 =?us-ascii?Q?aMt4fE04QxDNjTUPU0aPmxs4CM+pBzDnCnIMU47pN0NRuJnVBE0AfOjCGWo5?=
 =?us-ascii?Q?ljRuhgcUlmzRK33CEaUS6/OkBmVjkM+E4aI2CvIB63SzpGFNxMNVhSiHKdnN?=
 =?us-ascii?Q?lzhOl1mWzaTvkmK4GupjDw7PaJ9oIb+tSvPju4PibsWAJ/aWQN8qy1NS/kdk?=
 =?us-ascii?Q?TYdbj810DWhgGaHvEza17z5vAoZJG6vkWnQrYSRJnBYrk70bxsPJdL5cI98f?=
 =?us-ascii?Q?/9TN62QaduNbwrLcz4WfWxxMJsyPVrPRzrZnUiEM+UesmKMvRfmlkUSVYBF3?=
 =?us-ascii?Q?kS0np4mVqPm3BUWRCQ+7j6tCabqVbMLjlzs5SwOuDbdIf5VTHJJGScIFRm5N?=
 =?us-ascii?Q?bXICMyYHC+gKY16ZQfIZ9OlgSmlnSUnKWzauiP4F2PsizwhaWtH34BCNFs5m?=
 =?us-ascii?Q?Kb5Y6NeWEipbw251XFiFQBG8mEg2ZbCzAAlMsmxwyV9MeRyq+5WMtLo+b0sM?=
 =?us-ascii?Q?L4jOTiqncNqXw5sO4LnKzNpYO5dZGpfPZW0YKtD1tBWZblfNcFzYcRIbekIm?=
 =?us-ascii?Q?j1+GmGd+O3cICKlfFoBX/dCCwYgRjHeuYmDy8zAg2H/wPBLaQsAGAsat9rkv?=
 =?us-ascii?Q?4zjwryibcG1iID59/q19jtqgZ0lIhLDGAE6xmwoTFEPtSqZF8UQl0tnV/B41?=
 =?us-ascii?Q?4JZXQV0EE2a3efBouBg5PEx/QNj+MHcFalNF4VL8HncK6yxcKIqB2xeQvn/5?=
 =?us-ascii?Q?4kt2SwueZQ78bFlnSdj3c0kuw43Vy5hbSMV5O57Wbvb2bqmK+UC+Cf8Sr8yW?=
 =?us-ascii?Q?LEye2fo2t78EpD6Hk4YFiS9QGymhazQnuoS4aXBtaZtnrmWxfB14QaTiF1Uw?=
 =?us-ascii?Q?L1zy+8tW3P2bmDQ2KIUMq6EzTjYRCsuTr1TYgmNaUDMHIcCePHcC/FchXDR8?=
 =?us-ascii?Q?aCIpM1AHleTbqFIbuHlfJOYVfGIB9kdC3woKvWwET4/YA4Epyvpbv0rAsuPW?=
 =?us-ascii?Q?tl7yTY6HTL+iS8PcdiiX7AP8KPCRsERj2tnK4LyWM6UODYd/3/rxHE8qzr59?=
 =?us-ascii?Q?bKmNB2Y2TPPtyZHKPIFqFs+mPxp7pzFZJMRQZTIoPBAXd91kMomy/oZfpwjg?=
 =?us-ascii?Q?Bb+JZDvUvN6zGIFUYrtW96WDdfNCIckjBWI7YPoVX7yiKRYSDfqu8GzTNl0w?=
 =?us-ascii?Q?Cfbzjg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 257661b5-6cae-40ad-bbf1-08d9c5831b3e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 19:41:54.0931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pKlou8+lyfm8gFrvGk0KscN1p7969JqdGCB+y5cgCF/4c793gDih/yP4dmBaEPB/XRhB6GCqae+7LS31ev4ZaU6kjHAzebVj6E6sjuQ4EpE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2888
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10206
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 spamscore=0 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220107
X-Proofpoint-ORIG-GUID: KdgIX2zxX3J446E5Zi6rZye_EtAAlKLU
X-Proofpoint-GUID: KdgIX2zxX3J446E5Zi6rZye_EtAAlKLU
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Provide the cpr-save, cpr-exec, and cpr-load commands for live update.
These save and restore VM state, with minimal guest pause time, so that
qemu may be updated to a new version in between.

cpr-save stops the VM and saves vmstate to an ordinary file.  It supports
any type of guest image and block device, but the caller must not modify
guest block devices between cpr-save and cpr-load.  It supports two modes:
reboot and restart.

In reboot mode, the caller invokes cpr-save and then terminates qemu.
The caller may then update the host kernel and system software and reboot.
The caller resumes the guest by running qemu with the same arguments as the
original process and invoking cpr-load.  To use this mode, guest ram must be
mapped to a persistent shared memory file such as /dev/dax0.0, or /dev/shm
PKRAM as proposed in https://lore.kernel.org/lkml/1617140178-8773-1-git-send-email-anthony.yznaga@oracle.com.

The reboot mode supports vfio devices if the caller first suspends the
guest, such as by issuing guest-suspend-ram to the qemu guest agent.  The
guest drivers' suspend methods flush outstanding requests and re-initialize
the devices, and thus there is no device state to save and restore.

Restart mode preserves the guest VM across a restart of the qemu process.
After cpr-save, the caller passes qemu command-line arguments to cpr-exec,
which directly exec's the new qemu binary.  The arguments must include -S
so new qemu starts in a paused state and waits for the cpr-load command.
The restart mode supports vfio devices by preserving the vfio container,
group, device, and event descriptors across the qemu re-exec, and by
updating DMA mapping virtual addresses using VFIO_DMA_UNMAP_FLAG_VADDR and
VFIO_DMA_MAP_FLAG_VADDR as defined in https://lore.kernel.org/kvm/1611939252-7240-1-git-send-email-steven.sistare@oracle.com/
and integrated in Linux kernel 5.12.

To use the restart mode, qemu must be started with the memfd-alloc option,
which allocates guest ram using memfd_create.  The memfd's are saved to
the environment and kept open across exec, after which they are found from
the environment and re-mmap'd.  Hence guest ram is preserved in place,
albeit with new virtual addresses in the qemu process.

The caller resumes the guest by invoking cpr-load, which loads state from
the file. If the VM was running at cpr-save time, then VM execution resumes.
If the VM was suspended at cpr-save time (reboot mode), then the caller must
issue a system_wakeup command to resume.

The first patches add reboot mode:
  - memory: qemu_check_ram_volatile
  - migration: fix populate_vfio_info
  - migration: qemu file wrappers
  - migration: simplify savevm
  - vl: start on wakeup request
  - cpr: reboot mode
  - cpr: reboot HMP interfaces

The next patches add restart mode:
  - memory: flat section iterator
  - oslib: qemu_clear_cloexec
  - machine: memfd-alloc option
  - qapi: list utility functions
  - vl: helper to request re-exec
  - cpr: preserve extra state
  - cpr: restart mode
  - cpr: restart HMP interfaces
  - hostmem-memfd: cpr for memory-backend-memfd

The next patches add vfio support for restart mode:
  - pci: export functions for cpr
  - vfio-pci: refactor for cpr
  - vfio-pci: cpr part 1 (fd and dma)
  - vfio-pci: cpr part 2 (msi)
  - vfio-pci: cpr part 3 (intx)
  - vfio-pci: recover from unmap-all-vaddr failure

The next patches preserve various descriptor-based backend devices across
cprexec:
  - loader: suppress rom_reset during cpr
  - vhost: reset vhost devices for cpr
  - chardev: cpr framework
  - chardev: cpr for simple devices
  - chardev: cpr for pty
  - chardev: cpr for sockets
  - cpr: only-cpr-capable option

Here is an example of updating qemu from v4.2.0 to v4.2.1 using
restart mode.  The software update is performed while the guest is
running to minimize downtime.

window 1                                        | window 2
                                                |
# qemu-system-x86_64 ...                        |
QEMU 4.2.0 monitor - type 'help' ...            |
(qemu) info status                              |
VM status: running                              |
                                                | # yum update qemu
(qemu) cpr-save /tmp/qemu.sav restart           |
(qemu) cpr-exec qemu-system-x86_64 -S ...       |
QEMU 4.2.1 monitor - type 'help' ...            |
(qemu) info status                              |
VM status: paused (prelaunch)                   |
(qemu) cpr-load /tmp/qemu.sav                   |
(qemu) info status                              |
VM status: running                              |


Here is an example of updating the host kernel using reboot mode.

window 1                                        | window 2
                                                |
# qemu-system-x86_64 ...mem-path=/dev/dax0.0 ...|
QEMU 4.2.1 monitor - type 'help' ...            |
(qemu) info status                              |
VM status: running                              |
                                                | # yum update kernel-uek
(qemu) cpr-save /tmp/qemu.sav reboot            |
(qemu) quit                                     |
                                                |
# systemctl kexec                               |
kexec_core: Starting new kernel                 |
...                                             |
                                                |
# qemu-system-x86_64 -S mem-path=/dev/dax0.0 ...|
QEMU 4.2.1 monitor - type 'help' ...            |
(qemu) info status                              |
VM status: paused (prelaunch)                   |
(qemu) cpr-load /tmp/qemu.sav                   |
(qemu) info status                              |
VM status: running                              |

Changes from V1 to V2:
  - revert vmstate infrastructure changes
  - refactor cpr functions into new files
  - delete MADV_DOEXEC and use memfd + VFIO_DMA_UNMAP_FLAG_SUSPEND to
    preserve memory.
  - add framework to filter chardev's that support cpr
  - save and restore vfio eventfd's
  - modify cprinfo QMP interface
  - incorporate misc review feedback
  - remove unrelated and unneeded patches
  - refactor all patches into a shorter and easier to review series

Changes from V2 to V3:
  - rebase to qemu 6.0.0
  - use final definition of vfio ioctls (VFIO_DMA_UNMAP_FLAG_VADDR etc)
  - change memfd-alloc to a machine option
  - Use qio_channel_socket_new_fd instead of adding qio_channel_socket_new_fd
  - close monitor socket during cpr
  - fix a few unreported bugs
  - support memory-backend-memfd

Changes from V3 to V4:
  - split reboot mode into separate patches
  - add cprexec command
  - delete QEMU_START_FREEZE, argv_main, and /usr/bin/qemu-exec
  - add more checks for vfio and cpr compatibility, and recover after errors
  - save vfio pci config in vmstate
  - rename {setenv,getenv}_event_fd to {save,load}_event_fd
  - use qemu_strtol
  - change 6.0 references to 6.1
  - use strerror(), use EXIT_FAILURE, remove period from error messages
  - distribute MAINTAINERS additions to each patch

Changes from V4 to V5:
  - rebase to master

Changes from V5 to V6:
  vfio:
  - delete redundant bus_master_enable_region in vfio_pci_post_load
  - delete unmap.size warning
  - fix phys_config memory leak
  - add INTX support
  - add vfio_named_notifier_init() helper
  Other:
  - 6.1 -> 6.2
  - rename file -> filename in qapi
  - delete cprinfo.  qapi introspection serves the same purpose.
  - rename cprsave, cprexec, cprload -> cpr-save, cpr-exec, cpr-load
  - improve documentation in qapi/cpr.json
  - rename qemu_ram_volatile -> qemu_ram_check_volatile, and use
    qemu_ram_foreach_block
  - rename handle -> opaque
  - use ERRP_GUARD
  - use g_autoptr and g_autofree, and glib allocation functions
  - conform to error conventions for bool and int function return values
    and function names.
  - remove word "error" in error messages
  - rename as_flat_walk and its callback, and add comments.
  - rename qemu_clr_cloexec -> qemu_clear_cloexec
  - rename close-on-cpr -> reopen-on-cpr
  - add strList utility functions
  - factor out start on wakeup request to a separate patch
  - deleted unnecessary layer (cprsave etc) and squashed QMP patches
  - conditionally compile for CONFIG_VFIO

Changes from V6 to V7:
  vfio:
  - convert all event fd's to named event fd's with the same lifecycle and
    delete vfio_pci_pre_save
  - use vfio listener callback for updating vaddr and
    defer listener registration
  - update vaddr in vfio_dma_map
  - simplify iommu_type derivation
  - refactor recovery from unmap-all-vaddr failure to a separate patch
  - add vfio_pci_pre_load to handle non-emulated config bits
  - do not call VFIO_GROUP_SET_CONTAINER if reused
  - add comments for vfio cpr
  Other:
  - suppress rom_reset during cpr
  - more robust management of cpr mode
  - delete chardev fd's iff !reopen_on_cpr

Steve Sistare (26):
  memory: qemu_check_ram_volatile
  migration: fix populate_vfio_info
  migration: qemu file wrappers
  migration: simplify savevm
  vl: start on wakeup request
  cpr: reboot mode
  memory: flat section iterator
  oslib: qemu_clear_cloexec
  machine: memfd-alloc option
  qapi: list utility functions
  vl: helper to request re-exec
  cpr: preserve extra state
  cpr: restart mode
  cpr: restart HMP interfaces
  hostmem-memfd: cpr for memory-backend-memfd
  pci: export functions for cpr
  vfio-pci: refactor for cpr
  vfio-pci: cpr part 1 (fd and dma)
  vfio-pci: cpr part 2 (msi)
  vfio-pci: cpr part 3 (intx)
  vfio-pci: recover from unmap-all-vaddr failure
  loader: suppress rom_reset during cpr
  chardev: cpr framework
  chardev: cpr for simple devices
  chardev: cpr for pty
  cpr: only-cpr-capable option

Mark Kanda, Steve Sistare (3):
  cpr: reboot HMP interfaces
  vhost: reset vhost devices for cpr
  chardev: cpr for sockets

 MAINTAINERS                   |  12 ++
 backends/hostmem-memfd.c      |  21 +--
 chardev/char-mux.c            |   1 +
 chardev/char-null.c           |   1 +
 chardev/char-pty.c            |  16 +-
 chardev/char-serial.c         |   1 +
 chardev/char-socket.c         |  39 +++++
 chardev/char-stdio.c          |   8 +
 chardev/char.c                |  45 +++++-
 gdbstub.c                     |   1 +
 hmp-commands.hx               |  50 ++++++
 hw/core/loader.c              |   4 +-
 hw/core/machine.c             |  19 +++
 hw/pci/msix.c                 |  20 ++-
 hw/pci/pci.c                  |  13 +-
 hw/vfio/common.c              | 184 ++++++++++++++++++---
 hw/vfio/cpr.c                 | 129 +++++++++++++++
 hw/vfio/meson.build           |   1 +
 hw/vfio/pci.c                 | 368 +++++++++++++++++++++++++++++++++++++-----
 hw/vfio/trace-events          |   1 +
 hw/virtio/vhost.c             |  11 ++
 include/chardev/char.h        |   6 +
 include/exec/memory.h         |  39 +++++
 include/hw/boards.h           |   1 +
 include/hw/pci/msix.h         |   5 +
 include/hw/pci/pci.h          |   2 +
 include/hw/vfio/vfio-common.h |  10 ++
 include/hw/virtio/vhost.h     |   1 +
 include/migration/cpr.h       |  31 ++++
 include/monitor/hmp.h         |   3 +
 include/qapi/util.h           |  28 ++++
 include/qemu/osdep.h          |   1 +
 include/sysemu/runstate.h     |   2 +
 include/sysemu/sysemu.h       |   1 +
 migration/cpr-state.c         | 228 ++++++++++++++++++++++++++
 migration/cpr.c               | 167 +++++++++++++++++++
 migration/meson.build         |   2 +
 migration/migration.c         |   5 +
 migration/qemu-file-channel.c |  36 +++++
 migration/qemu-file-channel.h |   6 +
 migration/savevm.c            |  21 +--
 migration/target.c            |  24 ++-
 migration/trace-events        |   5 +
 monitor/hmp-cmds.c            |  68 ++++----
 monitor/hmp.c                 |   3 +
 monitor/qmp.c                 |   3 +
 qapi/char.json                |   7 +-
 qapi/cpr.json                 |  76 +++++++++
 qapi/meson.build              |   1 +
 qapi/qapi-schema.json         |   1 +
 qapi/qapi-util.c              |  37 +++++
 qemu-options.hx               |  40 ++++-
 softmmu/globals.c             |   1 +
 softmmu/memory.c              |  46 ++++++
 softmmu/physmem.c             |  55 +++++--
 softmmu/runstate.c            |  38 ++++-
 softmmu/vl.c                  |  18 ++-
 stubs/cpr-state.c             |  15 ++
 stubs/cpr.c                   |   3 +
 stubs/meson.build             |   2 +
 trace-events                  |   1 +
 util/oslib-posix.c            |   9 ++
 util/oslib-win32.c            |   4 +
 util/qemu-config.c            |   4 +
 64 files changed, 1852 insertions(+), 149 deletions(-)
 create mode 100644 hw/vfio/cpr.c
 create mode 100644 include/migration/cpr.h
 create mode 100644 migration/cpr-state.c
 create mode 100644 migration/cpr.c
 create mode 100644 qapi/cpr.json
 create mode 100644 stubs/cpr-state.c
 create mode 100644 stubs/cpr.c

-- 
1.8.3.1


