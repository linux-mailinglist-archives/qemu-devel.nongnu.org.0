Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FBD3BED1E
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 19:32:43 +0200 (CEST)
Received: from localhost ([::1]:50244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1BPe-0002c6-N3
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 13:32:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKR-0000B4-Tp
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:19 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:43568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKP-0006j5-1T
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:19 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 167HCNF3029345; Wed, 7 Jul 2021 17:27:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2020-01-29; bh=gqJEOtzQhb0zID+QzvL1yT1m7C2kUC6hOvwidjt1ZgI=;
 b=qCWCDd1xRIMxfr8h0Inyg1vyL0HT0WP209lCScZ6v0nVudwRJH+2SvJKvu+Zu9x6b263
 Ar76kzBiNGjXXOD6WaRBdxZLepBhpOy5uSWz3n0gxyyb3uJJiIlp3j0E4Lzo+CkmDWmz
 0nHiSVzK83FqH2i93YIX3NLFcCOU35+1BBz5cAa9U8tqAIy4YwOSoUD3frfnaBhLIwQb
 ZKtn975yR1hzU3R1Hq8q2UCVw5XFpokjV1C3p+eYZTy6PVHDZnIn1llHzjDdgiWSOWF9
 g40A6l6NIjPbfcsd4hQ/J6nOwdeg/S1XvSHrBIVPvVjJsQMaQFUDZGmbfnADBCK5gsfz Ww== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39m2aacpak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:11 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 167HAWiv053104;
 Wed, 7 Jul 2021 17:27:10 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
 by aserp3030.oracle.com with ESMTP id 39nbg2jdua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJ2ZvesLmwkV6wrtnojUdk8OVQUY9hY0y2lKwjhlyz0tt7MkhaaPDH3CSMXYcggtX4rj0ETSQ/ak40587ywLMM1EPXD5m6PO2uy+NfqnCZ5TgOf/a0wSD0E7xPqfNmG+tjFMD6Gp6mu8WdvVswQZZ9slIRYSreYERy66gDhHQCvXN94mpdLogb1m8B/S8Y5mwpfIX7BInpvhzW5PaoDL8WYA6IPx/awzoBuH0hMHaVIb/M+87QnL8bqjVR+WO5sal7ocoQF2DmKebtcmL12TRbIIEaox602HAkfYkrZJABxvXjqIOvLznLuHXscFtQbR4JuY+mqx2DiQ9z32QpUDEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqJEOtzQhb0zID+QzvL1yT1m7C2kUC6hOvwidjt1ZgI=;
 b=dWY0iz5bv1n8JqYW2DrDxtrXm8BWLv4c+657UjiRBgajVcG73RLiTtoXi3uhgZcRus0dbAqQjws0HudRROnIwTTI7WP7JPIeca/WpYJvD5yDAZkCZ+TEp8Kx/4j4u6a8ctzPwq6SsC5nJCQe558vFs5wIkKKMmhWWsJFaWO+kIimZO3Cj02EVQgdRCQYV4tshrcVbB/L4mSU4GLESsDADMuFEPS7/SrvSRV+zD6YJsF+1Lhx5IIWYwsCF5OfybMQaHuV+atBmuAQzYMGP7TNKEhbaRu8xaOKAK0yr8wttD4IHmOYfyRTjk3Rl1ENlodXiR7yQLL6Pw/LHiUfP9y4Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqJEOtzQhb0zID+QzvL1yT1m7C2kUC6hOvwidjt1ZgI=;
 b=iwvom5OLUr1awO+x+4Rl9UcD/K07Q5Tbu33QYRuT1G6iqEbxj90LDjAYKbWTPdwVqkfWNdIXPpIvxt+TnzzelHarhFPBLBflRrXaza+9Dl/NUa/nHF7MbPDZlAYV1Z9q2VdI5PzeI9Big2wjAxH/xguMubcmhsau9AkJdMvS9yg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB3892.namprd10.prod.outlook.com (2603:10b6:a03:1fb::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Wed, 7 Jul
 2021 17:27:07 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 17:27:07 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V5 00/25] Live Update
Date: Wed,  7 Jul 2021 10:20:09 -0700
Message-Id: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:a03:333::19) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.13) by
 SJ0PR03CA0104.namprd03.prod.outlook.com (2603:10b6:a03:333::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21 via Frontend
 Transport; Wed, 7 Jul 2021 17:27:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 382c610a-e8e2-41e9-f82c-08d9416c71e0
X-MS-TrafficTypeDiagnostic: BY5PR10MB3892:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB3892B7352658464B25BB12A2F91A9@BY5PR10MB3892.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D7FWNz2XSy7LBmHctspxK8WzNUO1wcuskzYX6hGlkLFIYt/tkiKBuh9beMzHtuXEW8GnSNI6CLr33/EFK33J2HbKbXHbtwGT3hi7hK5pfOAxiwsT64P3IS8hGDTXZRe4fo4/MHD05afNNfakdz+FCeJHyUrcW1qvofrXRBci6ViLhik75wmUVqyxSYO7njOMD12K40pMpy6rhWzw/phyQ1nM1E0EwijwfT7zi4q6H80wUkAjByanaVuFxmNg5aIvrf38OSNU5yKRrPi6rdgGLk/ZOV8Fcu1Fq1hzXgpPJQwEgVWpx2QIR6nfHOokCeP2bLhWDkO1tMIctCUdQM89Rx5MRCr4fRdch5opcEbdHszoHFRQyh2lz6tmr30+J5EgVqgnFM7hfiDGtqY9APoKHoi4+wmncSzkN+4dpG8sX08RStLVf+vOrywH41q7WNZeVWEMtPSOnauPLv18qRGbPpB4yuRUhOIcBn0TQiUje3NQM2aY+w0j07p1zHMs/cm6n4ywz7BW+hhJitiKEhpNk71Xca5YekmDsltBtJ5/GLxEK+hS1DBYRPR7YfaMbaEt9ogsNHAEDmx2/dSpPB2oonsyBtIqlk3k6Ncxmjk9RRyyaYQIRklfWG9QBDfF0zHbt47p2yPk4DZEbuExLtv7pBpqd/REoP701gr8ePgbZUhjTrHRsYyXpUO/IVZPlBhj3Tsx8h2bkIe6tio4Z98jYFMnW+ASTOTM2Iyo/WQdaRSn32lY8+1bW0pp+sTQwQy0B7wRqHErir6+lSlSx/Htt6jlfht/CuFYFkbq2DGsy3s0Kmts7aHWahkLaw4a0GMD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(396003)(346002)(39860400002)(136003)(7416002)(4326008)(7696005)(8936002)(107886003)(52116002)(316002)(186003)(6916009)(26005)(15650500001)(2616005)(54906003)(86362001)(83380400001)(956004)(8676002)(38350700002)(6486002)(66946007)(66556008)(966005)(5660300002)(66476007)(2906002)(38100700002)(36756003)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wSwUMpY4v3F6OeMAHILbjcf5lSnOyyKb+JYkTCRWVz/cIknacKMFGB+2xzxp?=
 =?us-ascii?Q?y0HvVVPHJTp5KR5M+huoA9t3riiGmDr+slO1tKwTLnqHO1I8dD8oamTPOSPS?=
 =?us-ascii?Q?i0sCa9qVOyvBvrTFqt3QTEI5EeJ/UqlT/a1eP9FNKAIHmckahpgcZFKk6NBK?=
 =?us-ascii?Q?dFjspAwnJB9PsKyvSZqXV72LyFkQUP6/jGnrCK8h9Np2xTdhq6XWNWvJHK//?=
 =?us-ascii?Q?Bygb5OqJTbDTN4cfrrVIhH0EzGeI5RiA4Pq0F06Dz3P8dh+/3V7q1+fOmY57?=
 =?us-ascii?Q?yAkWfyQH7Y0bZBqHNjcaCxGJ+jYtK0n3NRYpg+nQObhBv2lD4t4VpKmpQ0Ve?=
 =?us-ascii?Q?K3lEDvAvXOJl3lArFNn/fbCbhr8c6/27xTDG6ipYoX9uacdbhDlHIBLEdqy4?=
 =?us-ascii?Q?C/L474UYOlKepIlYD+vQEYzoz4vEHDw2z+ZsA4G84qPmY645MtcfE7ngbqDR?=
 =?us-ascii?Q?huzE9H9pi2GyUQavbgV3zi730ZbCaFV7XFSMyNgM1qLUIBWlc3rs74/sJbZf?=
 =?us-ascii?Q?Bj/RZcosLgTNmxTvswK14DVLmshC0jqT8a7sNpKLGmcOG1ZmkysQiyvDd2d5?=
 =?us-ascii?Q?e59bb6YAZZw5HBAp9d1rt1xvuc87YYK1CXWeJ6W/a3/X/rnZfX9FXXUNGABF?=
 =?us-ascii?Q?Eyma9WopzkBg5TsdJb6n1STIJ4lP+5wkT1ZnJKR6Cf72ixH89kBy/kq/SB8g?=
 =?us-ascii?Q?QVd3nSf16U3iZnEdjEps5aFROmIBu4/3kKQFUW/SF/umV8CLHBrICRVIxc9n?=
 =?us-ascii?Q?/IotgOmYfz1hU7zhxUDAowWTMrPZtqzyDi/THVbHj9yQPSnKnhTGoblBVb7g?=
 =?us-ascii?Q?qmSE+luxpihGk+xvSyp5EKHql3V38JhW8drKPPfL+VRZkV92UnWtplYzmaz+?=
 =?us-ascii?Q?ij/x/zyJUxQdPc0J17OmNgds12aj3DzWmAA39KzfiKFbzgd8pRSze0k94MKb?=
 =?us-ascii?Q?BUeVgGe+t9jJTaxoSwQINUFWvzr6hXdf9wrCdrsd35L2xRnHDUXgeZkV7EGG?=
 =?us-ascii?Q?D17lwgTA5Hc47FuEzrKfaqe0lvoMnDipSJTTmaKumhoj4EuHDoskoQqDCgnY?=
 =?us-ascii?Q?gSPwn0c6feILetzChVdofb39Ef+OwdFIwlSou+41ClTW/ycW97HdzW+aVBOF?=
 =?us-ascii?Q?FTKE0azkDt0NpyIduF+GQDkI/bQXlCkeTaqchH3J508NTGXIfh36FvbMMhDF?=
 =?us-ascii?Q?w1NcNsAELCirzKQW/o5kkO4/MBAD6emSxKfyx6620iJPCs2dmUBFJv80EK6j?=
 =?us-ascii?Q?Kd/iSrF+G5s53CaC9wvkkbGnswWeRDx+IF6+h87NkmthGOL+KLyyBp1dfLda?=
 =?us-ascii?Q?H28mA71sHERhAZJmEHfp78VI?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 382c610a-e8e2-41e9-f82c-08d9416c71e0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 17:27:07.3637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YA7krnRmEyp9T2dMET9PMGMyNwEsXQwDJTIlpUJotZyGwcFE1stSrUBRXO6alG8hpE/9oVpxW9Y2+n6Z8hmHzu84HFnv5X+accGAQiTeGZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3892
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 phishscore=0 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107070100
X-Proofpoint-ORIG-GUID: yMSiIvVdQZ-EeDj4b3XqZcNoMHe6fSpP
X-Proofpoint-GUID: yMSiIvVdQZ-EeDj4b3XqZcNoMHe6fSpP
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Provide the cprsave, cprexec, and cprload commands for live update.  These
save and restore VM state, with minimal guest pause time, so that qemu may
be updated to a new version in between.

cprsave stops the VM and saves vmstate to an ordinary file.  It supports any
type of guest image and block device, but the caller must not modify guest
block devices between cprsave and cprload.  It supports two modes: reboot
and restart.

In reboot mode, the caller invokes cprsave and then terminates qemu.
The caller may then update the host kernel and system software and reboot.
The caller resumes the guest by running qemu with the same arguments as the
original process and invoking cprload.  To use this mode, guest ram must be
mapped to a persistent shared memory file such as /dev/dax0.0, or /dev/shm
PKRAM as proposed in https://lore.kernel.org/lkml/1617140178-8773-1-git-send-email-anthony.yznaga@oracle.com.

The reboot mode supports vfio devices if the caller first suspends the
guest, such as by issuing guest-suspend-ram to the qemu guest agent.  The
guest drivers' suspend methods flush outstanding requests and re-initialize
the devices, and thus there is no device state to save and restore.

Restart mode preserves the guest VM across a restart of the qemu process.
After cprsave, the caller passes qemu command-line arguments to cprexec,
which directly exec's the new qemu binary.  The arguments must include -S
so new qemu starts in a paused state and waits for the cprload command.
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

The caller resumes the guest by invoking cprload, which loads state from
the file.  If the VM was running at cprsave time, then VM execution resumes.
If the VM was suspended at cprsave time (reboot mode), then the caller must
issue a system_wakeup command to resume.

The first patches add reboot mode:
  - qemu_ram_volatile
  - cpr: reboot mode
  - cpr: QMP interfaces for reboot
  - cpr: HMP interfaces for reboot

The next patches add restart mode:
  - as_flat_walk
  - oslib: qemu_clr_cloexec
  - machine: memfd-alloc option
  - vl: add helper to request re-exec
  - string to strList
  - util: env var helpers
  - cpr: restart mode
  - cpr: QMP interfaces for restart
  - cpr: HMP interfaces for restart

The next patches add vfio support for restart mode:
  - pci: export functions for cpr
  - vfio-pci: refactor for cpr
  - vfio-pci: cpr part 1
  - vfio-pci: cpr part 2

The next patches preserve various descriptor-based backend devices across
cprexec:
  - vhost: reset vhost devices upon cprsave
  - hostmem-memfd: cpr support
  - chardev: cpr framework
  - chardev: cpr for simple devices
  - chardev: cpr for pty
  - chardev: cpr for sockets
  - cpr: only-cpr-capable option
  - simplify savevm

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
(qemu) cprsave /tmp/qemu.sav restart            |
(qemu) cprexec qemu-system-x86_64 -S ...        |
QEMU 4.2.1 monitor - type 'help' ...            |
(qemu) info status                              |
VM status: paused (prelaunch)                   |
(qemu) cprload /tmp/qemu.sav                    |
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
(qemu) cprsave /tmp/qemu.sav restart            |
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
(qemu) cprload /tmp/qemu.sav                    |
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

Steve Sistare (21):
  qemu_ram_volatile
  cpr: reboot mode
  as_flat_walk
  oslib: qemu_clr_cloexec
  machine: memfd-alloc option
  vl: add helper to request re-exec
  string to strList
  util: env var helpers
  cpr: restart mode
  cpr: QMP interfaces for restart
  cpr: HMP interfaces for restart
  pci: export functions for cpr
  vfio-pci: refactor for cpr
  vfio-pci: cpr part 1
  vfio-pci: cpr part 2
  hostmem-memfd: cpr support
  chardev: cpr framework
  chardev: cpr for simple devices
  chardev: cpr for pty
  cpr: only-cpr-capable option
  simplify savevm

Mark Kanda, Steve Sistare (4):
  cpr: QMP interfaces for reboot
  cpr: HMP interfaces for reboot
  vhost: reset vhost devices upon cprsave
  chardev: cpr for sockets

 MAINTAINERS                   |  12 +++
 backends/hostmem-memfd.c      |  21 ++--
 chardev/char-mux.c            |   1 +
 chardev/char-null.c           |   1 +
 chardev/char-pty.c            |  15 ++-
 chardev/char-serial.c         |   1 +
 chardev/char-socket.c         |  35 +++++++
 chardev/char-stdio.c          |   8 ++
 chardev/char.c                |  41 +++++++-
 gdbstub.c                     |   1 +
 hmp-commands.hx               |  62 ++++++++++++
 hw/core/machine.c             |  19 ++++
 hw/pci/msix.c                 |  20 ++--
 hw/pci/pci.c                  |   7 +-
 hw/vfio/common.c              |  78 ++++++++++++--
 hw/vfio/cpr.c                 | 154 ++++++++++++++++++++++++++++
 hw/vfio/meson.build           |   1 +
 hw/vfio/pci.c                 | 230 +++++++++++++++++++++++++++++++++++++++---
 hw/vfio/trace-events          |   1 +
 hw/virtio/vhost.c             |  11 ++
 include/chardev/char.h        |   6 ++
 include/exec/memory.h         |  25 +++++
 include/hw/boards.h           |   1 +
 include/hw/pci/msix.h         |   5 +
 include/hw/pci/pci.h          |   2 +
 include/hw/vfio/vfio-common.h |   8 ++
 include/hw/virtio/vhost.h     |   1 +
 include/migration/cpr.h       |  20 ++++
 include/monitor/hmp.h         |   4 +
 include/qemu/env.h            |  23 +++++
 include/qemu/osdep.h          |   1 +
 include/sysemu/runstate.h     |   2 +
 include/sysemu/sysemu.h       |   1 +
 linux-headers/linux/vfio.h    |   6 ++
 migration/cpr.c               | 195 +++++++++++++++++++++++++++++++++++
 migration/meson.build         |   1 +
 migration/migration.c         |   5 +
 migration/savevm.c            |  21 ++--
 migration/savevm.h            |   2 +
 monitor/hmp-cmds.c            |  75 ++++++++++++--
 monitor/hmp.c                 |   3 +
 monitor/qmp-cmds.c            |  36 +++++++
 monitor/qmp.c                 |   3 +
 qapi/char.json                |   5 +-
 qapi/cpr.json                 |  88 ++++++++++++++++
 qapi/meson.build              |   1 +
 qapi/qapi-schema.json         |   1 +
 qemu-options.hx               |  39 ++++++-
 softmmu/globals.c             |   1 +
 softmmu/memory.c              |  48 +++++++++
 softmmu/physmem.c             |  51 ++++++++--
 softmmu/runstate.c            |  58 ++++++++++-
 softmmu/vl.c                  |  14 ++-
 stubs/cpr.c                   |   3 +
 stubs/meson.build             |   1 +
 trace-events                  |   1 +
 util/env.c                    |  95 +++++++++++++++++
 util/meson.build              |   1 +
 util/oslib-posix.c            |   9 ++
 util/oslib-win32.c            |   4 +
 util/qemu-config.c            |   4 +
 61 files changed, 1506 insertions(+), 83 deletions(-)
 create mode 100644 hw/vfio/cpr.c
 create mode 100644 include/migration/cpr.h
 create mode 100644 include/qemu/env.h
 create mode 100644 migration/cpr.c
 create mode 100644 qapi/cpr.json
 create mode 100644 stubs/cpr.c
 create mode 100644 util/env.c

-- 
1.8.3.1


