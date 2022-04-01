Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E84724EEE5A
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 15:41:26 +0200 (CEST)
Received: from localhost ([::1]:57444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naHWo-0000xJ-0f
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 09:41:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1naHGi-0002Ug-Ta; Fri, 01 Apr 2022 09:24:54 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:38700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1naHGf-0007DL-St; Fri, 01 Apr 2022 09:24:47 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 231Ctq1Z014677; 
 Fri, 1 Apr 2022 13:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=Ck99w8TyvDsvwLRXavpw0IIimQh2tYn8bmnm3w5tQfI=;
 b=uAhY0fPgnAuso82+hZ7kHoUeKHNp0Vn3Mg4ZWGyvz/kqIbXSHclXTc5Q5YeJyO5Jdvcj
 hViyi+7FL+1leOyUDWwU3mXdbPIWJGLlAI6sFkvif2bnK697iFpbd9fQhSX8WyMzxjZt
 AKqKvZl1mV5fE2Wga7xNqd5bmM3eixTLni11aYZN1nDLzbv3xCVtV78+YZiNrmX/bpAY
 erd7XUeeRyYJizHVabIgsDO1U0Y6DKKNWiu0LYISxAaoSoUNOAa4VON4jTlqvcwwRZK0
 Aat8YWzOPmsBhIeLpJ7DABKUNC7GToerLyetkXRsCnf62QsCbqlKHS4PI89iXRPO75lE ZA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f1s8cxne4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Apr 2022 13:24:23 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 231DHNLP008157; Fri, 1 Apr 2022 13:24:22 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3f1s96146s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Apr 2022 13:24:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CfJPL1Ra6swHm/QFGW240LSmOhVey50PTsURYQ7dLkcJ84QUH0SdvH21/qxiPuvea31c2RLl4hLj2sz1xlB1gAgxcbIWzpsA/0rSVMhQfv7KMZn4J6VEpI9Eco9tQxFeM/Mm0Hy+4AjXbq1/ApJK5eEKCwT58dn88U1F2hUdQI7F31pl+D0aKZco4z4uuAOg2Ojy8akCwlehRDmiNjkydKO8v1Ah9d07Zdx2fHAjW5W4d05HLlN0V8jO68nmzOvQNHWOorkFYbqdxH+aPVeWxVO+ZpI9qfsnHJhfdfWjG927Q1OvOcwDHAUcR1SxmxFP7pzFcuBbRq9Dgz84/9OF/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ck99w8TyvDsvwLRXavpw0IIimQh2tYn8bmnm3w5tQfI=;
 b=QM6+RhAQ1CTYtNl+DhyUadwY75P2RHcitXyGkjKn1onKguc5JoY/X/KgBU0vH3an+yCb6cf4cMwiQroYY7Pz4GjC/ABjEXRaATasVk6uwtUWZwaakF1kxeqIbNYJ7SYlHzZ24Zri2R+xqEU5FNNKq+DFbGgQ3fdfgPwyiQTnXz9TgYJ2eN7WXqqZxpL5Kfrf+om97TMj5Ur8xXWo1rly627A3kASepBjlhKQAhOn7nYSGmvkq4DFoAws0JzdymU8zd29JSsHkBsfsHxmMfoandbmrQIrFvN7FOLvirFhpOmKeM/bx8GBrdwAvhdMBHdZqLQec76Cta/5j71/lZ+Crw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ck99w8TyvDsvwLRXavpw0IIimQh2tYn8bmnm3w5tQfI=;
 b=FqQj6Frb+Y4O5Bq7bbXc2Vg6kokx3VPHInwEed/+B8FubnnroTd52x9BbWXUapSyYiBaawnS39c2vruuGbeJA25kd/CbBc4H20NxCV8AdDEo+91wOWHuMLBPzLdbEMvuAdZ2z9IOGOQlomgv/mqo4EpupIuRUtxbGUj+JjyZRK8=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by MN2PR10MB4302.namprd10.prod.outlook.com (2603:10b6:208:199::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.28; Fri, 1 Apr
 2022 13:24:19 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::a2:4f33:4600:80ae]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::a2:4f33:4600:80ae%2]) with mapi id 15.20.5123.025; Fri, 1 Apr 2022
 13:24:19 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v14 3/8] qmp: add QMP command x-query-virtio
Date: Fri,  1 Apr 2022 09:23:20 -0400
Message-Id: <1648819405-25696-4-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648819405-25696-1-git-send-email-jonah.palmer@oracle.com>
References: <1648819405-25696-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::24) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c1af1de-edfe-422a-6be1-08da13e2ed80
X-MS-TrafficTypeDiagnostic: MN2PR10MB4302:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB430257CE1F2E1A8464BC3698E8E09@MN2PR10MB4302.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7doysyVLrddqkk2WZKQ6s8FABSBoLUIqwhN+5L78YQ3ba8CwLR8D3nj4rOJwC6CTYxw2NfIVuz2VKdQ/nnTA0TsaOXzRqHrYe2xIkXchPLLnWoVxsJwkV3JO6I8l+AIWe0oY3+hXBqOCxNkdOWRoslx2OCG9SqFh8HB1D/c29Zd2KJzVvzF/HU3Q+z5kb1l1zmXU9QdwWd39i0SfexxHK6muoxFJAzp0XKrdVlqd6dhAy3bdBVxVZHPtBaZYjiO/mcfFPVi5g+xbbXdtANypke1q/GWMOa8EzC+eZxTSoy+V+TCGaxm/oS8Ehp+QovgTkCIK2fACW1bqz55md2FZhv8vF86Ud8j75U+n5eZSeHSEW/7TJPVBc/om6E8ZLjSGZ5mx+Su/B1E5+aJVM18dYlgd6ixv6/1v2yrIxr6Zs855zcEO/d+UB157rHVsnBnAAfQRdZulpArBpX3E+i6jtqJo2dTBvLxM40nuUF7G3Hgkf/q8HqyrtRXgt22MZmFXSyre3++PbJgaqTUIKWzs+a2SjfaeqI6DedCXA/nNI9jWoSKmtLLRf5A36d5fpTnR229txYAKYXMktPTHFSYvrW8qIQxw0e/RKXvbaq8cU0Rd7GrOrhlgpqGjUf3ZtJQUkKMVnvR8HBBbgb0mtkjNJcwrabxVIM6YL/7qc4xjfAp2vUlIJk3GNN0jIhSPQFPv+0bss060qokM9kPfy1vcTw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(4326008)(508600001)(66556008)(66476007)(2906002)(8676002)(6916009)(86362001)(36756003)(66946007)(38350700002)(38100700002)(6486002)(5660300002)(7416002)(6506007)(52116002)(8936002)(44832011)(6512007)(6666004)(26005)(186003)(83380400001)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JBHR6MKNWo8KfAbp0AbXmtXhl5yTdA10Omn5QInCLGdQ8HDVWxDJlIqCyYee?=
 =?us-ascii?Q?phpPuCgTm9ndoLOCSIgx2r/sncAoLCY9qYTLUHhOWFduADU/hdi11VTvkYA+?=
 =?us-ascii?Q?gOvBx73o/CLuL2YYc6iqI63NIRUDUqKyp8/FDkA+ptaqV5asd5zqNt07HN0b?=
 =?us-ascii?Q?nUrWnK5O/MnL/S7KT8LJiP8QrktmsEdC1Vm9ooy1iQn/2QftTMiZmWP7CHtA?=
 =?us-ascii?Q?3CcCWNnJp0Al5UVzy7/OmxUnx80XZESzLhsmkgQjjPn3LufxGcY4N2Zt2LXj?=
 =?us-ascii?Q?g6eeZ4OqBFrKejclR1paHrWX13w2uow3k71y6NSsSK4K2sSCcvV3ioDoZdUJ?=
 =?us-ascii?Q?T/1+rJnBE//DgXJte6lSjj+1oJrixIDRowsan2wx0oXMQqiB79fo6fGNUkn0?=
 =?us-ascii?Q?oqZ7uhyhHjQx+c0yB+U+GeHqqr1o7D7W3k0iKFbAYHIvyd6KUwcFhvpl8dfi?=
 =?us-ascii?Q?Ia2pf93yJ4suBj0xYT0jnmcDsv8lp3rQdZ/ouJTbXlDI2bkLLCGs2l1jrgy4?=
 =?us-ascii?Q?Hz5jegByPa+pYqJ/z3SYJpNd2vaCHfcN5n9Gpk0dKdE615QJ0UdsJw1wsn5f?=
 =?us-ascii?Q?KE2hc8ybFnhym000WsMjvH17J2rRaop3YzyRbeMJQ7bDaCC74CHppHTh6EM6?=
 =?us-ascii?Q?UqKJv9lMRcM8a+88P9Ar5J0blZF7Dxi1Iq4wNguxK0bcGQz2a3MuZLs02ZyQ?=
 =?us-ascii?Q?ZpGpRiviRkZieDIZGocjScgDNGfW1JiUSuPTMgUcZg4WlHWCtBqnvSQLxIzk?=
 =?us-ascii?Q?zQMwDsAQkGFcVhIH3HsdA7B/cjjNga5uzj3t63hWpjbyBcOclDsAQJFoLJ8H?=
 =?us-ascii?Q?iXyWzSztXdwK52ti0koVTuEt221bk1t8l/UkFbs5M4Y60J4iHGRjPoNOeraU?=
 =?us-ascii?Q?+iedhs6s1mFyDejgaj1dIBuAWK06/aYYjF3qHAbvIKMQxK0BID3XdgPqOjPN?=
 =?us-ascii?Q?KExLuYtOUvUs2EVvFuiUh2QIQ4S70SuWZt/FfzaxigvMVkUqRi4ApOcoI7k9?=
 =?us-ascii?Q?IZ4djW8GO0G8y9XvhZYeTUzy8HJytye1QAa1btiQKw4kQNB4I3TrMnZqeyPq?=
 =?us-ascii?Q?cD/p2UnZEtVbVMi2sIchYFe7xE8976hsy8ivCV4o0/ALfHMtsm9uF/dtfniz?=
 =?us-ascii?Q?/Kvclzjr6Gzl/XyLDJhx3klTKAJI8pktsPtYFXbTm2ypYY5TqL+Y2EeYgVH2?=
 =?us-ascii?Q?8fk4ZK1oko42/h+1O46gKSDh/AeNsBriVWEd4GtFvhegQ1JK0qOiIB1SRV3c?=
 =?us-ascii?Q?JJBJHrwEk4WrXzk0Ti1g/FK43hFwpjfX/zsldYqtuYiXLz/+W7uDWrZE7Pju?=
 =?us-ascii?Q?q1d6pk7we2GIch/lJwlcuYKeaz+7NiybWmq3vtEvfSKsbcWwKY9kE+DTcl0b?=
 =?us-ascii?Q?ODj6wHfw+kxvm9hj+ow5C1sdmOgCT1GYjccx8I+/bE0ZCwycmyGloS0oRT9o?=
 =?us-ascii?Q?aDDJcFA8CJ4DkRrYv4RJCdXQETCbrAB8ZQIHPOMcifvpMvrWmDk5qabkUeYo?=
 =?us-ascii?Q?CYwxPkTWuqin2j3HLyS1yuNOYqLS2sPLWcq6wR5Ur/mj2vhkQ2xfdxLfetMN?=
 =?us-ascii?Q?EHsH+QfBKCOhKofozfRhUT2Kd8qjGB9f9YxNLMJxyha7djDVtY8wVkNnog9O?=
 =?us-ascii?Q?0bEVg13KAzF8DR3XRhZPOiDNOVl8a4cIV10Wwa5VuOJgnrcSAutr+V1PKKi8?=
 =?us-ascii?Q?yoBBPSTir+SfsDlzKYKmWHc/HPxcmajmuFij63lUBC0FG8NRTfQ5IeUYkww7?=
 =?us-ascii?Q?qSyjDrEEX9Pg1uGTQ/pK/C6E9HY/m8g=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c1af1de-edfe-422a-6be1-08da13e2ed80
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 13:24:19.5749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1JUYnc3CDivY5meAV/1gPbL7uidmA8aBYryhcW7WfJ6bcQ3zAUt3Uo2aYVzON5ji64qO6M78cTToIkck0QJ63w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4302
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-04-01_04:2022-03-30,
 2022-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204010062
X-Proofpoint-GUID: xUorggwgpAilxvBbyK6Yp_McHnld_vZV
X-Proofpoint-ORIG-GUID: xUorggwgpAilxvBbyK6Yp_McHnld_vZV
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: mst@redhat.com, qemu_oss@crudebyte.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, eblake@redhat.com,
 qemu-block@nongnu.org, david@redhat.com, armbru@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

This new command lists all the instances of VirtIODevices with
their canonical QOM path and name.

[Jonah: @virtio_list duplicates information that already exists in
 the QOM composition tree. However, extracting necessary information
 from this tree seems to be a bit convoluted.

 Instead, we still create our own list of realized virtio devices
 but use @qmp_qom_get with the device's canonical QOM path to confirm
 that the device exists and is realized. If the device exists but
 is actually not realized, then we remove it from our list (for
 synchronicity to the QOM composition tree).

 Also, the QMP command @x-query-virtio is redundant as @qom-list
 and @qom-get are sufficient to search '/machine/' for realized
 virtio devices. However, @x-query-virtio is much more convenient
 in listing realized virtio devices.]

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/virtio/meson.build      |  2 ++
 hw/virtio/virtio-stub.c    | 14 ++++++++
 hw/virtio/virtio.c         | 44 ++++++++++++++++++++++++
 include/hw/virtio/virtio.h |  1 +
 qapi/meson.build           |  1 +
 qapi/qapi-schema.json      |  1 +
 qapi/virtio.json           | 68 ++++++++++++++++++++++++++++++++++++++
 tests/qtest/qmp-cmd-test.c |  1 +
 8 files changed, 132 insertions(+)
 create mode 100644 hw/virtio/virtio-stub.c
 create mode 100644 qapi/virtio.json

diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index 67dc77e00f..6fdc152780 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -6,8 +6,10 @@ softmmu_virtio_ss.add(when: 'CONFIG_VHOST', if_false: files('vhost-stub.c'))
 
 softmmu_ss.add_all(when: 'CONFIG_VIRTIO', if_true: softmmu_virtio_ss)
 softmmu_ss.add(when: 'CONFIG_VIRTIO', if_false: files('vhost-stub.c'))
+softmmu_ss.add(when: 'CONFIG_VIRTIO', if_false: files('virtio-stub.c'))
 
 softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-stub.c'))
+softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('virtio-stub.c'))
 
 virtio_ss = ss.source_set()
 virtio_ss.add(files('virtio.c'))
diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
new file mode 100644
index 0000000000..05a81edc92
--- /dev/null
+++ b/hw/virtio/virtio-stub.c
@@ -0,0 +1,14 @@
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-virtio.h"
+
+static void *qmp_virtio_unsupported(Error **errp)
+{
+    error_setg(errp, "Virtio is disabled");
+    return NULL;
+}
+
+VirtioInfoList *qmp_x_query_virtio(Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 80c7708c7e..28f25ff83a 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -13,12 +13,18 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qapi-commands-virtio.h"
+#include "qapi/qapi-commands-qom.h"
+#include "qapi/qapi-visit-virtio.h"
+#include "qapi/qmp/qjson.h"
 #include "cpu.h"
 #include "trace.h"
 #include "qemu/error-report.h"
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
+#include "qom/object_interfaces.h"
 #include "hw/virtio/virtio.h"
 #include "migration/qemu-file-types.h"
 #include "qemu/atomic.h"
@@ -29,6 +35,9 @@
 #include "sysemu/runstate.h"
 #include "standard-headers/linux/virtio_ids.h"
 
+/* QAPI list of realized VirtIODevices */
+static QTAILQ_HEAD(, VirtIODevice) virtio_list;
+
 /*
  * The alignment to use between consumer and producer parts of vring.
  * x86 pagesize again. This is the default, used by transports like PCI
@@ -3685,6 +3694,7 @@ static void virtio_device_realize(DeviceState *dev, Error **errp)
     vdev->listener.commit = virtio_memory_listener_commit;
     vdev->listener.name = "virtio";
     memory_listener_register(&vdev->listener, vdev->dma_as);
+    QTAILQ_INSERT_TAIL(&virtio_list, vdev, next);
 }
 
 static void virtio_device_unrealize(DeviceState *dev)
@@ -3699,6 +3709,7 @@ static void virtio_device_unrealize(DeviceState *dev)
         vdc->unrealize(dev);
     }
 
+    QTAILQ_REMOVE(&virtio_list, vdev, next);
     g_free(vdev->bus_name);
     vdev->bus_name = NULL;
 }
@@ -3872,6 +3883,8 @@ static void virtio_device_class_init(ObjectClass *klass, void *data)
     vdc->stop_ioeventfd = virtio_device_stop_ioeventfd_impl;
 
     vdc->legacy_features |= VIRTIO_LEGACY_FEATURES;
+
+    QTAILQ_INIT(&virtio_list);
 }
 
 bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
@@ -3882,6 +3895,37 @@ bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
     return virtio_bus_ioeventfd_enabled(vbus);
 }
 
+VirtioInfoList *qmp_x_query_virtio(Error **errp)
+{
+    VirtioInfoList *list = NULL;
+    VirtioInfoList *node;
+    VirtIODevice *vdev;
+
+    QTAILQ_FOREACH(vdev, &virtio_list, next) {
+        DeviceState *dev = DEVICE(vdev);
+        Error *err = NULL;
+        QObject *obj = qmp_qom_get(dev->canonical_path, "realized", &err);
+
+        if (err == NULL) {
+            GString *is_realized = qobject_to_json_pretty(obj, true);
+            /* virtio device is NOT realized, remove it from list */
+            if (!strncmp(is_realized->str, "false", 4)) {
+                QTAILQ_REMOVE(&virtio_list, vdev, next);
+            } else {
+                node = g_new0(VirtioInfoList, 1);
+                node->value = g_new(VirtioInfo, 1);
+                node->value->path = g_strdup(dev->canonical_path);
+                node->value->name = g_strdup(vdev->name);
+                QAPI_LIST_PREPEND(list, node->value);
+            }
+           g_string_free(is_realized, true);
+        }
+        qobject_unref(obj);
+    }
+
+    return list;
+}
+
 static const TypeInfo virtio_device_info = {
     .name = TYPE_VIRTIO_DEVICE,
     .parent = TYPE_DEVICE,
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 8e12aeebc1..ef99a626a8 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -110,6 +110,7 @@ struct VirtIODevice
     bool use_guest_notifier_mask;
     AddressSpace *dma_as;
     QLIST_HEAD(, VirtQueue) *vector_queues;
+    QTAILQ_ENTRY(VirtIODevice) next;
 };
 
 struct VirtioDeviceClass {
diff --git a/qapi/meson.build b/qapi/meson.build
index 656ef0e039..10c54d68e5 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -48,6 +48,7 @@ qapi_all_modules = [
   'sockets',
   'trace',
   'transaction',
+  'virtio',
   'yank',
 ]
 if have_system
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index 4912b9744e..1512adaf92 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -93,3 +93,4 @@
 { 'include': 'audio.json' }
 { 'include': 'acpi.json' }
 { 'include': 'pci.json' }
+{ 'include': 'virtio.json' }
diff --git a/qapi/virtio.json b/qapi/virtio.json
new file mode 100644
index 0000000000..aee0e40daa
--- /dev/null
+++ b/qapi/virtio.json
@@ -0,0 +1,68 @@
+# -*- Mode: Python -*-
+# vim: filetype=python
+#
+
+##
+# = Virtio devices
+##
+
+##
+# @VirtioInfo:
+#
+# Basic information about a given VirtIODevice
+#
+# @path: The VirtIODevice's canonical QOM path
+#
+# @name: Name of the VirtIODevice
+#
+# Since: 7.0
+#
+##
+{ 'struct': 'VirtioInfo',
+  'data': { 'path': 'str',
+            'name': 'str' } }
+
+##
+# @x-query-virtio:
+#
+# Returns a list of all realized VirtIODevices
+#
+# Features:
+# @unstable: This command is meant for debugging.
+#
+# Returns: List of gathered VirtIODevices
+#
+# Since: 7.0
+#
+# Example:
+#
+# -> { "execute": "x-query-virtio" }
+# <- { "return": [
+#        {
+#            "path": "/machine/peripheral-anon/device[4]/virtio-backend",
+#            "name": "virtio-input"
+#        },
+#        {
+#            "path": "/machine/peripheral/crypto0/virtio-backend",
+#            "name": "virtio-crypto"
+#        },
+#        {
+#            "path": "/machine/peripheral-anon/device[2]/virtio-backend",
+#            "name": "virtio-scsi"
+#        },
+#        {
+#            "path": "/machine/peripheral-anon/device[1]/virtio-backend",
+#            "name": "virtio-net"
+#        },
+#        {
+#            "path": "/machine/peripheral-anon/device[0]/virtio-backend",
+#            "name": "virtio-serial"
+#        }
+#      ]
+#    }
+#
+##
+
+{ 'command': 'x-query-virtio',
+  'returns': [ 'VirtioInfo' ],
+  'features': [ 'unstable' ] }
diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index 7f103ea3fd..fd00ee2777 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -103,6 +103,7 @@ static bool query_is_ignored(const char *cmd)
         "query-gic-capabilities", /* arm */
         /* Success depends on target-specific build configuration: */
         "query-pci",              /* CONFIG_PCI */
+        "x-query-virtio",         /* CONFIG_VIRTIO */
         /* Success depends on launching SEV guest */
         "query-sev-launch-measure",
         /* Success depends on Host or Hypervisor SEV support */
-- 
2.35.1


