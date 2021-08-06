Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E57DB3E31B7
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 00:24:33 +0200 (CEST)
Received: from localhost ([::1]:56858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC8GW-0000Ck-St
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 18:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC85p-0007OJ-Fu
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:29 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:35294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mC85n-0004Ew-7o
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:13:29 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 176MC34p023309; Fri, 6 Aug 2021 22:13:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=HtPJgQ3FM5PygFIityiYckiHpJusSRipyU6Efojp/Po=;
 b=YcdvHRcHYXRrrDx9J0r8toTheOgGZKwoTpwjTWsxky3h8Wq6CL71MTi6nG8FVgAXndoV
 NEUTItz5nIqBS3N1MdC9zNy7WYN6BbDZk6pJ1g5cGaaB+LUuP2dNdPP2xDY3AXlhP9sa
 Gnn6U9LXRD9XCypMMEVD5uzux4awLYC/KcHAv1P5Q6hFtRRApLzaNgPt7vcwC8yQPsen
 WTJBYhXfTyrA8l/ILa1Av3X3e3DbhmVyRurYz4QM7k1GxKxiqjLO6y6XWTVhX/Xp+2nW
 uZxNNCyfJkegMf2T7aYm/1r67CkMDNsQDOobrzb9H1LWvmCrWc0M1xcCJOaWW8d2Dwg6 ig== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=HtPJgQ3FM5PygFIityiYckiHpJusSRipyU6Efojp/Po=;
 b=O/qluE/gchZqt3s1Vj5hQUWSDJk0SO98X4DgebuJhoLgZL+ybUijgMoUaAEtLBg7BRH0
 hpA+HseANgryy/XNWMy1BDwzsdJvM2+c73Swn2ii9ieVx0ns+ZYUa8yznSgCxlZfWqUL
 P+1vIsxAlSMDf67bG/TItgvOx4v4Baffbuo3MdjlMw/JIzDxRUWgus8CNtw6gK0fxHDf
 LGvWEFtoQxNcH/u8HCJVAfcTrPDHbcVIc6gOufRK+fXL0VY1qt2wb1aK+EKNNjM32vMi
 gpZQZzo5JYoflcTQHGYVRq56fy5EPSAU+hr4AzSIGnbf83shNYIJU8SQk6kU9n7IlulH 0Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a8vy3t4xv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:21 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 176MAC88083053;
 Fri, 6 Aug 2021 22:13:20 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
 by aserp3020.oracle.com with ESMTP id 3a7r4cay2k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 22:13:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KBezYn0FPOeIDEvyoJaXF+G1CeuuFbOAfaNDjktuLa3BBKc4d2QZ30y94mIL8otpi42jH6uN1boR3jQDavWf7iQsgAEDlO4VCIvdsyp1VB5TlOEhByAHc8TIObxeESJhUbnmt4l7n5jzx3tqKWTgMlA56ZYWluXya5bACxvYDjr8etyxPQ4DQkB1bsj0N9olR0dvJ0r/87vE/TpKSOdo+j/a9+CP1xGSDPFsh75fXa1qQ4tisucO7MRU7mdRQnDMx0jP1pTvsM7/qp0K8RkRncpgUDTX/BMX+ioO2HR47hTMHoax4bHSo7Qlandm33726TwrY6Ro9LZE+yLNjvR6Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtPJgQ3FM5PygFIityiYckiHpJusSRipyU6Efojp/Po=;
 b=RIYjW0r6PkAo6twjLfGRp26wtAfa3OCqQiUTJV27ATXUCw8KOn8L3e7RhT6Y5V/vWF584g28+rL+dx2aFFVP9Z7UV0udghL0Z3IFPI8y4zKSGOPMgUjLAZXwnDbpLY+QDUoJ4/J2CUl7D8XIoh9TEasRlCyVSozTS5C8ICWa2nCyCcTTN/nwq7+uu4/1eJKJXrNgNCl+PI5u6LDkdCuEM8NJLYNOC2t/oUbOXuYy8GrDoUBIPlMp8dhXv0HGRK0NffbujhdTVRCNeuGJQf4135Z5uZ1f6X2IDDXFzW0cOhypflpyeCdOZ+dM3/pp/f0DlpDsSGL0Mb5RMYcMNdrc4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtPJgQ3FM5PygFIityiYckiHpJusSRipyU6Efojp/Po=;
 b=zo/KRn839Ie/MzzrFjvWLImcZlqwJeEA6Bv33EBzDtOZvqYZjuNtlUgYmNh01PRUvS5tCakjtiBZthU4XLOb+OYMa340WRxab6CUzeKb8dbt/W3OwEvS4M6EdXbUg0YuHplstgwJ7uijwXqyhRfa8IVtDxr0baYT0KNWPlVNVNY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4129.namprd10.prod.outlook.com (2603:10b6:a03:210::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Fri, 6 Aug
 2021 22:13:19 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::99fe:4091:351d:11e3%5]) with mapi id 15.20.4373.028; Fri, 6 Aug 2021
 22:13:19 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V6 14/27] cpr: restart mode
Date: Fri,  6 Aug 2021 14:43:48 -0700
Message-Id: <1628286241-217457-15-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
References: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:806:20::7) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.7) by
 SA9PR03CA0002.namprd03.prod.outlook.com (2603:10b6:806:20::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.16 via Frontend Transport; Fri, 6 Aug 2021 22:13:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63e54238-d7e4-4262-500f-08d95927654b
X-MS-TrafficTypeDiagnostic: BY5PR10MB4129:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB412996AB00D9B0A145EA9332F9F39@BY5PR10MB4129.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n6bsG4o3PHe+57ufsiHi0Z2SXL2ARtDDC0KDG+ORlV4qBaB5DyHmbmCYpfSXdGV35IrwUVqwVFPsw8EqRTCfjAS7n7lbKrbdDQBnDG8t8D6QdYwoaIUr47kxNOvLAT4/nKoh6TjldCFx4sr22gODbqF08IV+vh14KYjElQVFN334tBu9pPj7Ocq84XjTSR9G6vJJYXVVKtyGdWUYPpAycmlwx4b4RcO5ZhICUmAouMwgRHjKxY2QtAvnvTiZPrtp8aRS4Kmb0QWLqTXYgac0TQJn8U1EfQ/NYrOzu+jVx2qyOriSpjrG+4h33LAfis3CiptFuM9L0XaemcpCG3IJYAlO6dJeDuwo/4LsaBmA1WtNRE491MG6gu77wZ7dOAGNZGT26SBXW/jxjwVJhwbwp0TgK51GlCOAXbv5IfDLbp8gM9mHKYgceRH8CnfGdLQieFrYb+oahzO+oXetb6eNVFac8U9ANZjIMcUdqNIxP5drjRduEdbrOX6r3VafRx7AHmytlmNl7oi0q7Tug7DKNIL2sWFuR2xCl+Tl9W0abQb0/lYve324A7eEVXZj/BSBCkx3bf+JcO37QCzJpjrXDxj8bJHLu+pE/kj5UBdMja8OooJW0GXBQRE/ZcWsXSK7RSLtFhrhPJ6Gz6Xb9z1UAXBdO1bzLrd7HDqU78OhqHb/3QPylFC+VmcM70qu3QRZ27QGhNDMxfo7veMngxkzKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(39860400002)(366004)(346002)(376002)(66946007)(66556008)(956004)(2616005)(316002)(7416002)(38350700002)(8936002)(478600001)(66476007)(36756003)(86362001)(38100700002)(5660300002)(54906003)(8676002)(4326008)(6486002)(7696005)(52116002)(186003)(2906002)(6666004)(107886003)(6916009)(26005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tThxw+tTpwfyMdNwK1Xvme7a82ete1ZAihJVexUjAoqXdNX/oMcaHNIYDE3N?=
 =?us-ascii?Q?OuhshJulCYLuiLzu5o9LRv17kK1JMl4AgVSW6c7khrVZqdJ1uLuPzRZfIgUK?=
 =?us-ascii?Q?g2Jrxr4NTxyXeKmeeEw+2UqC4CZSmBZ7bQGq2aqgZgosrMG96t8PZmxG03bh?=
 =?us-ascii?Q?Hw7Ent9LByTmOo+UKv7kp/hYgGuAMxu3nnopd+XnGpNkUQpyJ4aoacl7ao91?=
 =?us-ascii?Q?dMcr+caAwCTbEg/zrarTzfOloGBwojTVMO4vrFWL4ZupbnVCXEt1jlV6jtY3?=
 =?us-ascii?Q?nkRseiO8DBdWAJEZWVPRrXvzmf0ylYaou9yVKtHH4ZwVoNIh86fwv+8LTq88?=
 =?us-ascii?Q?/8pQ4GvEuvRu9e3QN4rhUU11EBMT43zJpZstOInbOzGVvoK6CGtI/M35W7EJ?=
 =?us-ascii?Q?JaBd7BNMjfDVkTK6xWQrdMRW7b6gyw++/kahcblpZLstttawmrMyA54WICrQ?=
 =?us-ascii?Q?A4fEZKqnwc7OPzgkEktAY043fugH0hLFPWPegAvLbG9kRPW83ywukr9WTz04?=
 =?us-ascii?Q?Hi1QkbhgU7xW4pjBvI2x/x7JO1kN0bxVtkXIbpzgR/CKVchd0bicb1T4Dn1W?=
 =?us-ascii?Q?Vz2dbNRIgHlYXYznPSzH6XBARNisRVKVHJ3EE7PW9qWd84xxdEN2rGozxAH1?=
 =?us-ascii?Q?WGIfShQ5J4eo+0GdQSlvgOe8ks41iEgI9O9hCmKP2S0DdRGIpeJ4abivnX3e?=
 =?us-ascii?Q?pUyu7/isleP6Tz+eF3v18nb2jouMbBZ/HLzTqzCHYZdvTzlFrVybZuqjZud+?=
 =?us-ascii?Q?pQ36U490v5mCWlYsGv+cpsr+6/b+cETDycH9KKK8FdCscIDHrJWLQzN3O50E?=
 =?us-ascii?Q?WlTXUtv5wOdCAQYVDCQ/J8goyvtDimkELW4wQ7h6D+jQnP4MvCY0G1V/E6ub?=
 =?us-ascii?Q?mLmRWX7FY6Qdv2VU0WKC+nDgz2EKGETpChISSx/hbcV20g/xGizHF7zADfv7?=
 =?us-ascii?Q?R5N0E9u4kh1IlIeTtn2VcUAirnVi82up7V2PuCqFNiwtrBvflH8GhxGjd4ye?=
 =?us-ascii?Q?wxEcL1lmHtfhCpbELkR7rrAU8cdRUG7EI4PjB1ymQ6oCe/6bAM1TsY0YQfwZ?=
 =?us-ascii?Q?WLXfmuvadyL0N5TzMJqwTF2fOpgXkVcPKUr72XgdmjVqcBqhRtCpr7LBxfnr?=
 =?us-ascii?Q?ga9ckEjCgV+FRkDpreHH5GAaVj2hrz4mSKNA8igU3/1YteSEZBdBu7L/SDFL?=
 =?us-ascii?Q?6/J5bqlM9AA/fhBc/O33LrulZfhmOm9mhNOwbSKREthDZGNBZt6+lB+PWjbP?=
 =?us-ascii?Q?jAT0/+oScInZO1CmYQ9aBjINbvd1tdIi3bMDnPe52N3+B9mmKEOogOKUIQIx?=
 =?us-ascii?Q?96pIrHx6LidAeD9jaepS5rGa?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63e54238-d7e4-4262-500f-08d95927654b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 22:13:18.9296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oolj5C1h2NrY7K4SZi0bh449hFg5UTmRbVYoA6tpvvyeYT8a/4k2zeIBFV6MlWevh8HlFgv4h1Gt4MgrIgLGJ/c71YuD4oddEHtO4B2sjPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4129
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10068
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108060145
X-Proofpoint-GUID: kGLwqOz0exBIOMa4Dg5INsLxUQopPTzw
X-Proofpoint-ORIG-GUID: kGLwqOz0exBIOMa4Dg5INsLxUQopPTzw
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
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
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Provide the cpr-save restart mode, which preserves the guest VM across a
restart of the qemu process.  After cpr-save, the caller passes qemu
command-line arguments to cpr-exec, which directly exec's the new qemu
binary.  The arguments must include -S so new qemu starts in a paused state.
The caller resumes the guest by calling cpr-load.

To use the restart mode, all guest RAM objects must be shared.  The
share=on property is required for memory created with an explicit -object
option.  The memfd-alloc machine property is required for memory that is
implicitly created.  The memfd values are saved in special cpr state which
is retrieved after exec, and are kept open across exec, after which they
are retrieved and re-mmap'd.  Hence guest RAM is preserved in place,
albeit with new virtual addresses in the qemu process.

The restart mode supports vfio devices and explicit memory-backend-memfd
objects in subsequent patches.

cpr-exec syntax:
  { 'command': 'cpr-exec', 'data': { 'argv': [ 'str' ] } }

Add the restart mode:
  { 'enum': 'CprMode', 'data': [ 'reboot', 'restart' ] }

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 migration/cpr.c   | 30 +++++++++++++++++++++++++++++-
 qapi/cpr.json     | 22 +++++++++++++++++++++-
 softmmu/physmem.c |  5 ++++-
 softmmu/vl.c      |  3 +++
 4 files changed, 57 insertions(+), 3 deletions(-)

diff --git a/migration/cpr.c b/migration/cpr.c
index 1ec903f..72a5f4b 100644
--- a/migration/cpr.c
+++ b/migration/cpr.c
@@ -88,6 +88,34 @@ err:
     cpr_active_mode = CPR_MODE_NONE;
 }
 
+static int preserve_fd(const char *name, int id, int fd, void *opaque)
+{
+    qemu_clear_cloexec(fd);
+    return 0;
+}
+
+void qmp_cpr_exec(strList *args, Error **errp)
+{
+    if (xen_enabled()) {
+        error_setg(errp, "xen does not support cpr-exec");
+        return;
+    }
+    if (!runstate_check(RUN_STATE_SAVE_VM)) {
+        error_setg(errp, "runstate is not save-vm");
+        return;
+    }
+    if (cpr_active_mode != CPR_MODE_RESTART) {
+        error_setg(errp, "cpr-exec requires cpr-save with restart mode");
+        return;
+    }
+
+    cpr_walk_fd(preserve_fd, 0);
+    if (cpr_state_save(errp)) {
+        return;
+    }
+    qemu_system_exec_request(args);
+}
+
 void qmp_cpr_load(const char *filename, Error **errp)
 {
     QEMUFile *f;
@@ -111,7 +139,7 @@ void qmp_cpr_load(const char *filename, Error **errp)
         return;
     }
 
-    cpr_active_mode = CPR_MODE_REBOOT;  /* generalized in a later patch */
+    cpr_active_mode = cpr_state_mode();
 
     ret = qemu_load_device_state(f);
     qemu_fclose(f);
diff --git a/qapi/cpr.json b/qapi/cpr.json
index 2edd08e..56be0e5 100644
--- a/qapi/cpr.json
+++ b/qapi/cpr.json
@@ -15,11 +15,12 @@
 # @CprMode:
 #
 # @reboot: checkpoint can be cpr-load'ed after a host kexec reboot.
+# @restart: checkpoint can be cpr-load'ed after restarting qemu.
 #
 # Since: 6.2
 ##
 { 'enum': 'CprMode',
-  'data': [ 'reboot' ] }
+  'data': [ 'reboot', 'restart' ] }
 
 ##
 # @cpr-save:
@@ -33,6 +34,11 @@
 # For reboot mode, all guest RAM objects must be non-volatile across reboot,
 # and created with the share=on parameter.
 #
+# For restart mode, all guest RAM objects must be shared.  The share=on
+# property is required for memory created with an explicit -object option,
+# and the memfd-alloc machine property is required for memory that is
+# implicitly created.
+#
 # @filename: name of checkpoint file
 # @mode: @CprMode mode
 #
@@ -43,6 +49,20 @@
             'mode': 'CprMode' } }
 
 ##
+# @cpr-exec:
+#
+# exec() a command and replace the qemu process.  The PID remains the same.
+# @argv[0] should be the path of a new qemu binary, or a prefix command that
+# in turn exec's the new qemu binary.  Must be called after cpr-save restart.
+#
+# @argv: arguments to be passed to exec().
+#
+# Since: 6.2
+##
+{ 'command': 'cpr-exec',
+  'data': { 'argv': [ 'str' ] } }
+
+##
 # @cpr-load:
 #
 # Start virtual machine from checkpoint file that was created earlier using
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index d11455f..2e14314 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -65,6 +65,7 @@
 
 #include "qemu/pmem.h"
 
+#include "migration/cpr.h"
 #include "migration/vmstate.h"
 
 #include "qemu/range.h"
@@ -1987,7 +1988,7 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
             name = memory_region_name(mr);
             if (ms->memfd_alloc) {
                 Object *parent = &mr->parent_obj;
-                int mfd = -1;          /* placeholder until next patch */
+                int mfd = cpr_find_fd(name, 0);
                 mr->align = QEMU_VMALLOC_ALIGN;
                 if (mfd < 0) {
                     mfd = qemu_memfd_create(name, maxlen + mr->align,
@@ -1995,6 +1996,7 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
                     if (mfd < 0) {
                         return;
                     }
+                    cpr_save_fd(name, 0, mfd);
                 }
                 qemu_set_cloexec(mfd);
                 /* The memory backend already set its desired flags. */
@@ -2251,6 +2253,7 @@ void qemu_ram_free(RAMBlock *block)
     }
 
     qemu_mutex_lock_ramlist();
+    cpr_delete_fd(memory_region_name(block->mr), 0);
     QLIST_REMOVE_RCU(block, next);
     ram_list.mru_block = NULL;
     /* Write list before version */
diff --git a/softmmu/vl.c b/softmmu/vl.c
index cb72ca2..924e8f9 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -76,6 +76,7 @@
 #include "hw/i386/pc.h"
 #include "migration/misc.h"
 #include "migration/snapshot.h"
+#include "migration/cpr.h"
 #include "sysemu/tpm.h"
 #include "sysemu/dma.h"
 #include "hw/audio/soundhw.h"
@@ -3614,6 +3615,8 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_validate_options(machine_opts_dict);
     qemu_process_sugar_options();
 
+    cpr_state_load(&error_fatal);
+
     /*
      * These options affect everything else and should be processed
      * before daemonizing.
-- 
1.8.3.1


