Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 310214A5011
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 21:24:31 +0100 (CET)
Received: from localhost ([::1]:54580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEdDy-0007ft-8D
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 15:24:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nEcaQ-0007OZ-EJ
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:43:38 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:27382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nEcaH-0008Jr-DG
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:43:31 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20VIBIiO010608; 
 Mon, 31 Jan 2022 19:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=zAJd99SwuHBDF2MCqDB4gZk86du8AOOG2uACFkeqn2w=;
 b=E9Sh7K+5YQWHhQ9OQRlLWPDauZlz8vSNPnfwlfa5pX3ZEnJGhzc/beQARW26Eq7lXbmb
 jJJFYz11FfBwn1Ef9hwIdgNm+n8aPcW1B95RHKjY5n9uxHVnS3x/XBbtb2YcVhrBIicg
 YHn+LlJaNTVnev3jDMMX2VESmlxt+52AcKElXoqAdpKJ5UADY3Jn1j7L0YjDwQnYgIPz
 xNlkX5vgyocrQ6KUqiaka6JRwp72WwAwehWJdfD5A4TLoTyrnLoudbCo5lb/hnuM8zBY
 1/lfGXS33yXfNu0q3gLB4f3VTp3wJfN6WQI6490XVnF9+MOgkcQiotNGEsJ0akWyJ0lx Zw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dxjatru6q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Jan 2022 19:43:24 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20VJQEx3005659;
 Mon, 31 Jan 2022 19:43:22 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2169.outbound.protection.outlook.com [104.47.73.169])
 by userp3020.oracle.com with ESMTP id 3dvy1nd025-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Jan 2022 19:43:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VmfyOK7dMNDuGSWGXC81F3y9AKuXo8vORMJqYJ1GQ1xz7rOrdfXQgYlA6Poyt1vVSxiMxESkVN6K+HIZbTCsLWblaAdpoh0kx4qcVpYN53gZvo01hyCC2ns+BYOl6T2JKXtYFCUqZt+a1+UXjXUTvF4J5P4qd8wMPG9JKwIo06PmnBemNm+LQbiXTLIEPR3JOzDGkDt1LJs/RTPtUPJvytb5QzIbhf9Zr44EW8NNw3/o6VCtSI9vp9m+uWPKhVoP4hS5VTinDoKqdxYSgMb2NyAjgXK7+Sw9iCkV9L32vheirg9y7UZsL88y/R9728BnvJjN0f6M7iK8caqyincm6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zAJd99SwuHBDF2MCqDB4gZk86du8AOOG2uACFkeqn2w=;
 b=U3ndlpX83LIbEcsoIStuh+LoJqLoTko2vyqUkNIMet5j6YKuqCSDzq/WluCpNuG4w0pE2nIEuS4bHBJfBWag59/rvEtSPqlQg6GalNuAVeHLA6fb0WDE6YbgHPbQs3SnV5YTBOFdFCVLcRGK9SZCYlPDkjlt9s3kX8mQ3xMSDUqrilcqmLQNLcC99Alwefj9ec1yrYh1j7TjsKPJI9exWDms90Zlfo3J/Gru0WkuWxvReHlsQln99EyYYMWOkxynT5MJxyNGjEfn1YdYIJjMoV7xkbTYXr9yEjwkFjAO0Alg92zwf60XgcII/SF+U9cO94EWZe/rRa91hWFzO/yjtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zAJd99SwuHBDF2MCqDB4gZk86du8AOOG2uACFkeqn2w=;
 b=JFHb9w+lkGZTbzX6U55zZNppeKIEcAxJGoTVdLVVM9WVqnAAnH0Bd53CGmB/H1Q00/0qPCgULQmJszgtuaxOZ1G6vz3lrEp154GJagcfprqG7JQJDUNlqNpdz5tLg/xMo0bdsfU6ufiiBAqJk88rwTEK0JsgXM1B2wxN2RyJbaI=
Received: from SA1PR10MB5841.namprd10.prod.outlook.com (2603:10b6:806:22b::16)
 by BLAPR10MB5362.namprd10.prod.outlook.com (2603:10b6:208:333::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.19; Mon, 31 Jan
 2022 19:43:20 +0000
Received: from SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::58ef:3181:b9d4:b716]) by SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::58ef:3181:b9d4:b716%5]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 19:43:19 +0000
From: Mark Kanda <mark.kanda@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] qmp: Support for querying stats
Date: Mon, 31 Jan 2022 13:43:10 -0600
Message-Id: <20220131194312.1192626-2-mark.kanda@oracle.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220131194312.1192626-1-mark.kanda@oracle.com>
References: <20220131194312.1192626-1-mark.kanda@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9P221CA0008.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::13) To SA1PR10MB5841.namprd10.prod.outlook.com
 (2603:10b6:806:22b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49d9d3ef-fd82-4a72-51c3-08d9e4f1eef3
X-MS-TrafficTypeDiagnostic: BLAPR10MB5362:EE_
X-Microsoft-Antispam-PRVS: <BLAPR10MB5362DDB76603A06F066695D8F9259@BLAPR10MB5362.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CJ2Jg1rnkcQrSB4dsonobpoN25Rm9b9lgxz4MDqZ+Wbt+HONuAW6iWk7YtDQm6cbs1rztsNNJP2czTAFNeQ+p5QGAx2TlBdwc1CgcuFlktRQNAYgzIOixt3pNiDLiAE4wIJsN0d7FuB/zVGhjoyKzbcifV4qLyTiaPb+wT0jHKZxq3hARKmyAqkQ/kT7UjJWm2FIQpv3deNb2WXdl9cGAI3XQJhdbZNRsBKL9RQ7RkInK9NwUDhRJU4t4lnhvNEyn76Z4heRjZ58UrT4DWDhTng97yYv7vYEihkEzXc4cHwtP9WxkEU+MBdPNbw4m6/X1Hzux5alEWfjCrvWscoJ44Ez3q4C/MKgM0H5YhtQgXJxgdhJT5+IU1WVbxOFVDD4n4IsZKCoXnSmwG5A7bM/asko7rGMV/ub7r3gp3lBL4wxEcwRLi7u9eL1KDgLOwXayM7MU5Xzspo6WhSgk6rTDzGfd803aQrp0kkj+9PM3wA3E6jDilo1FGYUUJ0leG14TJRQG71deve1QjImP6m9JgRbycDLWzq2Gd3GxxItX+rLBgSlAw4/yRQ276oN2bekFhKvnwrQ5pJCvW9B6cSM4cHIKqBbykYn0thOBqZAaW+lr3SOCzCiLtJkwEvR2ZuO7D2XBkYffv6SPUPHjkj1T+OJLB0qw9rAeSxyXIxg2DguXxNKwHAQkJIC5N8gPGIDR0a3jFDfRVT0qpCM0xbz3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR10MB5841.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(508600001)(83380400001)(186003)(36756003)(107886003)(1076003)(2616005)(316002)(6916009)(52116002)(6506007)(6666004)(6486002)(2906002)(86362001)(4326008)(8936002)(8676002)(30864003)(6512007)(44832011)(5660300002)(66556008)(66476007)(38350700002)(38100700002)(66946007)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PV+6d3L/kIDCc1SeZS4JZqYNJoiOiek0KqhKA/TdIyrpWBVVzpIVNN3ZIj7e?=
 =?us-ascii?Q?uRPwkmNec5eiO4y718/bECUPjc5yPqKRMsM2dEYjjcWGoscsVRlzSHpUFR8p?=
 =?us-ascii?Q?8o6XWAZ5I9IKhIposII5Hey/z7V3dp5ptgwahrWJB8XIMbIliSbZ4ybdxPji?=
 =?us-ascii?Q?W0J5512KAmHLHnkRDWIxEr9CvFHrwrAKc3yxMkmI3Qm+XWCF7oE5KpolTZQz?=
 =?us-ascii?Q?LJe2dWF3p+Bo4wOi/75AE2xvP04d64hx8UfeIjvu4Q5sqgqbeEYIAFI/CAt/?=
 =?us-ascii?Q?2hWMBPRI7v4jA3thr/9mN4sv8kokyxZU9COeRILZ1DztTkWzTMnt3z+9Vwj/?=
 =?us-ascii?Q?NKduqJhwMoAY4rEU3XxqLPoz3h5sc0/r8xbAveJE1t+QIZuaYMf1uLwouAtm?=
 =?us-ascii?Q?x9bjMDjgItPyyhXLfxm3Psi5JAvwQcSGzpnfd0k4ffJXDcjdCXt26G+uxNaC?=
 =?us-ascii?Q?0+u6TKu8rpeOZicvFW+MhOtncECNyO6lGl6AaFH0Ammj1/+NGQH6tpr4dCoN?=
 =?us-ascii?Q?Ni4AXMaWOBoLJl6Q9biEmqwhdO68Xq3rIDZc9D+/UNY4ognhleoeltnvLOSc?=
 =?us-ascii?Q?qFUGxab7Nl3Im8uFQl0kbD9sbeGkNRx7XVEymrrE4AIQc0XeR2jkl6tXP5sH?=
 =?us-ascii?Q?L/Zjnm8gU0prieC8wdcr6HgVxYqkdBgFGJyd5ijvTB5xThVldWCLdkI+bv0f?=
 =?us-ascii?Q?ct8+XoxyWbNEkstkH0MFymUldCISSuesRz/FihKOUDx3ki6No0QuyA9mIoD0?=
 =?us-ascii?Q?K8viWHvazhczsaWpiCia/hDYJQePteetlDrXBHC/nntWjeqHS96E4Gl58fUg?=
 =?us-ascii?Q?oQYaMYCMzmeoPY8N02DJWEIVdhgOhIbbEnYN1KWd92OE3ydEo0hcaEx52m42?=
 =?us-ascii?Q?oPb/tbYThxFyztxZL8ARmubvsQIFYjRxTAhD6ChPxEH7jhNrU2TVXcJ5PstC?=
 =?us-ascii?Q?T/RODpOxtqD3AY1vQ8XJ3SsBqKEFb3OWIKTwsigQONYaO9+X/gC1XDz5RzNY?=
 =?us-ascii?Q?wf6hE+JMUmuuFnq1SJfuFAN7FiYlrIQSkaAE3G/NfeDCEjHR8EH+556fCYKx?=
 =?us-ascii?Q?Y0sK1NBlsIWIY0yO5CT8D6U+ClWEeotwInHjyWejXbelCXq7LX0T3Z4UtKAi?=
 =?us-ascii?Q?CVwraD4Xkn8E5zw3bcVDP/JmLg7/BPS2EF45GPUl26Jj+Q8sthFNMOstHu97?=
 =?us-ascii?Q?sXivLzeAVcZYJZ04iMLt4Aw1Mj8fA+fmdCKHc0EfwMzeoYcmjBhIlEaEUm5G?=
 =?us-ascii?Q?Kk724i7iGnn76TK0dpKMOqSjAaJGgCE+J7WEf5c4x2hUdifW0RkwEHgwYXy3?=
 =?us-ascii?Q?JmrA3XeOFxXjrhwED74HvpcSkA2AuI6gqCqTKHsOzdh8eQnEQIiY/pJxTY1j?=
 =?us-ascii?Q?vU0YsxwBEa3+sfwGQ1H+YD7aqK936WWrETXY9RwoTXyazUNaxul5JskQX/dh?=
 =?us-ascii?Q?MfPq3Xq57WVilE4jfe4pA/DTjEsV9cZ/YY83Qhfs2uv4yyjemTRkCxLRujMC?=
 =?us-ascii?Q?Y8+usfpFs6U98mDnKrSLH0G/eTtp9zUpBJIV18V35WXBRhf/H6ywsvhemMPV?=
 =?us-ascii?Q?rueP7uSehZeQz0UAQSxwQe7vvY6ytiUVteZpAt2Ec4C8IiPYTTY5rMTXR/Ce?=
 =?us-ascii?Q?ayBbvTSltafz+W1U0nQ1ZP8=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49d9d3ef-fd82-4a72-51c3-08d9e4f1eef3
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB5841.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 19:43:19.8853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HlSf2P4Xu+hmMbGuQnbw/aiYwi+uziY7rNY3hXWsy8OCndNQrkecm/mQ83xkONd8qhVy59T0B3HmsmySe+wweQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5362
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10244
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 spamscore=0
 bulkscore=0 adultscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201310125
X-Proofpoint-GUID: AP2tTLC2I5GOoFV140f_dySwpXiOWYkP
X-Proofpoint-ORIG-GUID: AP2tTLC2I5GOoFV140f_dySwpXiOWYkP
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=mark.kanda@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce QMP support for querying stats. Provide a framework for adding new
stats and support for the following commands:

- query-stats
Returns a list of all stats per target type (only VM and VCPU for now), with
additional options for specifying stat names, VCPU qom paths, and stat provider.

- query-stats-schemas
Returns a list of stats included in each schema type, with an option for
specifying the stat provider.

The framework provides a method to register callbacks for these QMP commands.

The first usecase will be for fd-based KVM stats (in an upcoming patch).

Examples (with fd-based KVM stats):

- Display all VM stats:

{ "execute": "query-stats", "arguments" : { "target": "vm" } }
{ "return": {
    "list": [
      { "provider": "kvm",
        "stats": [
          { "name": "max_mmu_page_hash_collisions", "value": 0 },
          { "name": "max_mmu_rmap_size", "value": 0 },
          { "name": "nx_lpage_splits", "value": 131 },
         ...
        ] }
      { "provider": "provider XYZ",
      ...
    ],
    "target": "vm"
  }
}

- Display all VCPU stats:

{ "execute": "query-stats", "arguments" : { "target": "vcpu" } }
{ "return": {
    "list": [
      { "list": [
          { "provider": "kvm",
            "stats": [
              { "name": "guest_mode", "value": 0 },
              { "name": "directed_yield_successful", "value": 0  },
              { "name": "directed_yield_attempted", "value": 76 },
              ...
            ] }
	  { "provider": "provider XYZ",
	  ...
        ],
        "path": "/machine/unattached/device[0]"
      },
      { "list": [
          { "provider": "kvm",
            "stats": [
              { "name": "guest_mode", "value": 0 },
              { "name": "directed_yield_successful", "value": 0 },
              { "name": "directed_yield_attempted", "value": 51 },
              ...
      }
    ],
    "target": "vcpu"
  }
}

- Display 'exits' and 'l1d_flush' KVM stats for VCPUs at '/machine/unattached/device[2]'
and '/machine/unattached/device[4]':

{ "execute": "query-stats",
  "arguments" : { "target": "vcpu",
                  "fields": [ "exits", "l1d_flush" ],
	          "paths": [ "/machine/unattached/device[2]",
	                      "/machine/unattached/device[4]" ]
                  "provider": "kvm" } }

{ "return": {
    "list": [
      { "list": [
          { "provider": "kvm",
            "stats": [
              { "name": "l1d_flush", "value": 14690 },
              { "name": "exits", "value": 50898 }
            ] }
        ],
        "path": "/machine/unattached/device[2]"
      },
      { "list": [
          { "provider": "kvm",
            "stats": [
              { "name": "l1d_flush", "value": 24902 },
              { "name": "exits", "value": 74374 }
            ] }
	 ],
        "path": "/machine/unattached/device[4]"
      }
    ],
    "target": "vcpu"
  }
}

- Query stats schemas:

{ "execute": "query-stats-schemas" }
{ "return": {
    "vcpu": [
      { "provider": "kvm",
        "stats": [
           { "name": "guest_mode",
             "unit": "none",
             "base": 10,
             "exponent": 0,
             "type": "instant" },
	   { "name": "directed_yield_successful",
             "unit": "none",
             "base": 10,
             "exponent": 0,
             "type": "cumulative" },
             ...
	"provider": "provider XYZ",
...
   "vm": [
      { "provider": "kvm",
        "stats": [
           { "name": "max_mmu_page_hash_collisions",
             "unit": "none",
             "base": 10,
             "exponent": 0,
             "type": "peak" },
	"provider": "provider XYZ",
...

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
---
 include/monitor/stats.h |  36 ++++++
 monitor/qmp-cmds.c      | 183 +++++++++++++++++++++++++++++
 qapi/misc.json          | 253 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 472 insertions(+)
 create mode 100644 include/monitor/stats.h

diff --git a/include/monitor/stats.h b/include/monitor/stats.h
new file mode 100644
index 0000000000..d4b57322eb
--- /dev/null
+++ b/include/monitor/stats.h
@@ -0,0 +1,36 @@
+/*
+ * Copyright (c) 2022 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef STATS_H
+#define STATS_H
+
+/*
+ * Add qmp stats callbacks to the stats_callbacks list.
+ *
+ * @provider: stats provider
+ *
+ * @stats_fn: routine to query stats:
+ *    void (*stats_fn)(StatsResults *results, StatsFilter *filter, Error **errp)
+ *
+ * @schema_fn: routine to query stat schemas:
+ *    void (*schemas_fn)(StatsSchemaResult *results, Error **errp)
+ */
+void add_stats_callbacks(StatsProvider provider,
+                         void (*stats_fn)(StatsResults *, StatsFilter *,
+                                          Error **),
+                         void (*schemas_fn)(StatsSchemaResult *, Error **));
+
+/* Stats helpers routines */
+StatsResultsEntry *add_vm_stats_entry(StatsResults *, StatsProvider);
+StatsResultsEntry *add_vcpu_stats_entry(StatsResults *, StatsProvider, char *);
+StatsSchemaProvider *add_vm_stats_schema(StatsSchemaResult *, StatsProvider);
+StatsSchemaProvider *add_vcpu_stats_schema(StatsSchemaResult *, StatsProvider);
+
+bool stat_name_filter(StatsFilter *, StatsTarget, char *);
+bool stat_cpu_filter(StatsFilter *, char *);
+
+#endif /* STATS_H */
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index db4d186448..bd562edfb8 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -18,6 +18,7 @@
 #include "qemu/cutils.h"
 #include "qemu/option.h"
 #include "monitor/monitor.h"
+#include "monitor/stats.h"
 #include "sysemu/sysemu.h"
 #include "qemu/config-file.h"
 #include "qemu/uuid.h"
@@ -448,3 +449,185 @@ HumanReadableText *qmp_x_query_irq(Error **errp)
 
     return human_readable_text_from_str(buf);
 }
+
+typedef struct StatsCallbacks {
+    StatsProvider provider;
+    void (*stats_cb)(StatsResults *, StatsFilter *, Error **);
+    void (*schemas_cb)(StatsSchemaResult *, Error **);
+    QTAILQ_ENTRY(StatsCallbacks) next;
+} StatsCallbacks;
+
+static QTAILQ_HEAD(, StatsCallbacks) stats_callbacks =
+    QTAILQ_HEAD_INITIALIZER(stats_callbacks);
+
+void add_stats_callbacks(StatsProvider provider,
+                         void (*stats_fn)(StatsResults *, StatsFilter*,
+                                          Error **),
+                         void (*schemas_fn)(StatsSchemaResult *, Error **))
+{
+    StatsCallbacks *entry = g_malloc0(sizeof(*entry));
+    entry->provider = provider;
+    entry->stats_cb = stats_fn;
+    entry->schemas_cb = schemas_fn;
+
+    QTAILQ_INSERT_TAIL(&stats_callbacks, entry, next);
+}
+
+StatsResults *qmp_query_stats(StatsFilter *filter, Error **errp)
+{
+    StatsResults *stats_results = g_malloc0(sizeof(*stats_results));
+    StatsCallbacks *entry;
+    StatsProvider provider = STATS_PROVIDER__MAX;
+
+    if (filter->target == STATS_TARGET_VM &&
+        filter->u.vm.has_provider) {
+        provider = filter->u.vm.provider;
+    } else if (filter->target == STATS_TARGET_VCPU &&
+               filter->u.vcpu.has_provider) {
+        provider = filter->u.vcpu.provider;
+    }
+
+    QTAILQ_FOREACH(entry, &stats_callbacks, next) {
+        if (provider != STATS_PROVIDER__MAX && (provider != entry->provider)) {
+            continue;
+        }
+        entry->stats_cb(stats_results, filter, errp);
+    }
+
+    return stats_results;
+}
+
+StatsSchemaResult *qmp_query_stats_schemas(bool has_provider,
+                                           StatsProvider provider,
+                                           Error **errp)
+{
+    StatsSchemaResult *stats_results = g_malloc0(sizeof(*stats_results));
+    StatsCallbacks *entry;
+
+    QTAILQ_FOREACH(entry, &stats_callbacks, next) {
+        if (has_provider && (provider != entry->provider)) {
+            continue;
+        }
+        entry->schemas_cb(stats_results, errp);
+    }
+
+    return stats_results;
+}
+
+StatsResultsEntry *add_vm_stats_entry(StatsResults *stats_results,
+                                      StatsProvider provider)
+{
+    StatsResultsEntry *entry = g_malloc0(sizeof(*entry));
+    stats_results->target = STATS_TARGET_VM;
+    entry->provider = provider;
+    QAPI_LIST_PREPEND(stats_results->u.vm.list, entry);
+
+    return entry;
+}
+
+StatsResultsEntry *add_vcpu_stats_entry(StatsResults *stats_results,
+                                        StatsProvider provider,
+                                        char *path)
+{
+    StatsResultsEntry *entry = g_malloc0(sizeof(*entry));
+    stats_results->target = STATS_TARGET_VCPU;
+    entry->provider = provider;
+
+    /*
+     * Find the corresponding vCPU entry and add to its list. Else, create it.
+     */
+    VCPUResultsEntryList **tailp = &stats_results->u.vcpu.list;
+    VCPUResultsEntryList *tail;
+
+    for (tail = *tailp; tail; tail = tail->next) {
+        if (g_str_equal(tail->value->path, path)) {
+            /* Add to the existing vCPU list */
+            QAPI_LIST_PREPEND(tail->value->list, entry);
+            goto done;
+        }
+        tailp = &tail->next;
+    }
+    /* Create and populate a new entry for the vCPU */
+    VCPUResultsEntry *value = g_malloc0(sizeof(*value));
+    value->path = g_strdup(path);
+    value->list = g_malloc0(sizeof(*value->list));
+    value->list->value = entry;
+    QAPI_LIST_APPEND(tailp, value);
+
+done:
+    return entry;
+}
+
+StatsSchemaProvider *add_vm_stats_schema(StatsSchemaResult *schema_results,
+                                         StatsProvider provider)
+{
+    StatsSchemaProvider *entry = g_malloc0(sizeof(*entry));
+    schema_results->has_vm = true;
+    entry->provider = provider;
+    QAPI_LIST_PREPEND(schema_results->vm, entry);
+
+    return entry;
+}
+
+StatsSchemaProvider *add_vcpu_stats_schema(StatsSchemaResult *schema_results,
+                                           StatsProvider provider)
+{
+    StatsSchemaProvider *entry = g_malloc0(sizeof(*entry));
+    schema_results->has_vcpu = true;
+    entry->provider = provider;
+    QAPI_LIST_PREPEND(schema_results->vcpu, entry);
+
+    return entry;
+}
+
+/* True if stat doesn't match a requested name */
+bool stat_name_filter(StatsFilter *filter, StatsTarget type, char *name)
+{
+    strList *str_list = NULL;
+
+    if (type == STATS_TARGET_VM) {
+        if (filter->target != STATS_TARGET_VM) {
+            return false;
+        }
+        if (!filter->u.vm.has_fields) {
+            return false;
+        }
+        str_list = filter->u.vm.fields;
+    } else if (type == STATS_TARGET_VCPU) {
+        if (filter->target != STATS_TARGET_VCPU) {
+            return false;
+        }
+        if (!filter->u.vcpu.has_fields) {
+            return false;
+        }
+        str_list = filter->u.vcpu.fields;
+    }
+
+    for (; str_list; str_list = str_list->next) {
+        if (g_str_equal(name, str_list->value)) {
+            return false;
+        }
+    }
+    return true;
+}
+
+/* True if cpu qom path doesn't match a requested path */
+bool stat_cpu_filter(StatsFilter *filter, char *path)
+{
+    strList *list;
+
+    if (filter->target != STATS_TARGET_VCPU) {
+        return false;
+    }
+
+    if (!filter->u.vcpu.has_paths) {
+        return false;
+    }
+
+    for (list = filter->u.vcpu.paths; list; list = list->next) {
+        if (g_str_equal(list->value, path)) {
+            return false;
+        }
+    }
+    return true;
+}
diff --git a/qapi/misc.json b/qapi/misc.json
index e8054f415b..8d326464f0 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -527,3 +527,256 @@
  'data': { '*option': 'str' },
  'returns': ['CommandLineOptionInfo'],
  'allow-preconfig': true }
+
+##
+# @StatType:
+#
+# Enumeration of stat types
+# @cumulative: stat is cumulative; value can only increase.
+# @instant: stat is instantaneous; value can increase or decrease.
+# @peak: stat is the peak value; value can only increase.
+#
+# Since: 7.0
+##
+{ 'enum' : 'StatType',
+  'data' : [ 'cumulative', 'instant', 'peak',
+             'linear-hist', 'log-hist', 'unknown' ] }
+
+##
+# @StatUnit:
+#
+# Enumeration of stat units
+# @bytes: stat reported in bytes.
+# @seconds: stat reported in seconds.
+# @cycles: stat reported in clock cycles.
+# @none: no unit for this stat.
+#
+# Since: 7.0
+##
+{ 'enum' : 'StatUnit',
+  'data' : [ 'none', 'bytes', 'seconds', 'cycles', 'unknown' ] }
+
+##
+# @StatBase:
+#
+# Enumeration of stat base
+#
+# Since: 7.0
+##
+{ 'enum' : 'StatBase',
+  'data' : [ 'pow10', 'pow2', 'unknown' ] }
+
+##
+# @StatsProvider:
+#
+# Enumeration of stat providers.
+#
+# Since: 7.0
+##
+{ 'enum': 'StatsProvider',
+  'data': [ ] }
+
+##
+# @StatsTarget:
+#
+# Enumeration of stat targets.
+# @vm: stat is per vm.
+# @vcpu: stat is per vcpu.
+#
+# Since: 7.0
+##
+{ 'enum': 'StatsTarget',
+  'data': [ 'vm', 'vcpu' ] }
+
+##
+# @StatsVCPURequest:
+#
+# vcpu specific filter element.
+# @paths: list of qom paths.
+#
+# Since: 7.0
+##
+{ 'struct': 'StatsVCPURequest',
+  'base': 'StatsRequest',
+  'data': { '*paths': [ 'str' ] } }
+
+##
+# @StatsRequest:
+#
+# Stats filter element.
+# @provider: stat provider.
+# @fields: list of stat names.
+#
+# Since: 7.0
+##
+{ 'struct': 'StatsRequest',
+  'data': { '*provider': 'StatsProvider',
+            '*fields': [ 'str' ] } }
+
+##
+# @StatsFilter:
+#
+# Target specific filter.
+#
+# Since: 7.0
+##
+{ 'union': 'StatsFilter',
+  'base': { 'target': 'StatsTarget' },
+  'discriminator': 'target',
+  'data': { 'vcpu': 'StatsVCPURequest',
+            'vm': 'StatsRequest' } }
+
+##
+# @StatsValueArray:
+#
+# uint64 list for StatsValue.
+#
+# Since: 7.0
+##
+{ 'struct': 'StatsValueArray',
+  'data': { 'list' : [ 'uint64' ] } }
+
+##
+# @StatsValue:
+#
+# @scalar: stat is single uint64.
+# @list: stat is a list of uint64.
+#
+# Since: 7.0
+##
+{ 'alternate': 'StatsValue',
+  'data': { 'scalar': 'uint64',
+            'list': 'StatsValueArray' } }
+
+##
+# @Stats:
+#
+# @name: name of stat.
+# @value: stat value.
+#
+# Since: 7.0
+##
+{ 'struct': 'Stats',
+  'data': { 'name': 'str',
+            'value' : 'StatsValue' } }
+
+##
+# @StatsResultsEntry:
+#
+# @provider: stat provider.
+# @stats: list of stats.
+#
+# Since: 7.0
+##
+{ 'struct': 'StatsResultsEntry',
+  'data': { 'provider': 'StatsProvider',
+            'stats': [ 'Stats' ] } }
+
+##
+# @VCPUResultsEntry:
+#
+# @path: qom path.
+# @list: per provider @StatsResultEntry list.
+#
+# Since: 7.0
+##
+{ 'struct': 'VCPUResultsEntry',
+  'data': { 'path': 'str',
+            'list': [ 'StatsResultsEntry' ] } }
+
+##
+# @VMStatsResults:
+#
+# Since: 7.0
+##
+{ 'struct': 'VMStatsResults',
+  'data': { 'list' : [ 'StatsResultsEntry' ] } }
+
+##
+# @VCPUStatsResults:
+#
+# Since: 7.0
+##
+{ 'struct': 'VCPUStatsResults',
+  'data': { 'list': [ 'VCPUResultsEntry' ] } }
+
+##
+# @StatsResults:
+#
+# Target specific results.
+#
+# Since: 7.0
+##
+{ 'union': 'StatsResults',
+  'base': { 'target': 'StatsTarget' },
+  'discriminator': 'target',
+  'data': { 'vcpu': 'VCPUStatsResults',
+            'vm': 'VMStatsResults' } }
+
+##
+# @query-stats:
+#
+# data: @StatsFilter
+# Returns: @StatsResults
+#
+# Since: 7.0
+##
+{ 'command': 'query-stats',
+  'data': 'StatsFilter',
+  'boxed': true,
+  'returns': 'StatsResults' }
+
+##
+# @StatsSchemaValue:
+#
+# Individual stat schema.
+# @name: stat name.
+# @type: @StatType
+# @unit: @StatUnit
+# @base: @StatBase
+# @exponent: Used together with @base.
+#
+# Since: 7.0
+##
+{ 'struct': 'StatsSchemaValue',
+  'data': { 'name': 'str',
+            'type': 'StatType',
+            'unit': 'StatUnit',
+            'base': 'StatBase',
+            'exponent': 'int16' } }
+
+##
+# @StatsSchemaProvider:
+#
+# @provider: @StatsProvider.
+# @stats: list of stats.
+#
+# Since: 7.0
+##
+{ 'struct': 'StatsSchemaProvider',
+  'data': { 'provider': 'StatsProvider',
+            'stats': [ 'StatsSchemaValue' ] } }
+
+##
+# @StatsSchemaResult:
+#
+# @vm: vm stats schemas.
+# @vcpu: vcpu stats schemas.
+#
+# Since: 7.0
+##
+{ 'struct': 'StatsSchemaResult',
+  'data': { '*vm': [ 'StatsSchemaProvider' ],
+            '*vcpu': [ 'StatsSchemaProvider' ] } }
+
+##
+# @query-stats-schemas:
+#
+# Query Stats schemas.
+# Returns @StatsSchemaResult
+#
+# Since: 7.0
+##
+{ 'command': 'query-stats-schemas',
+  'data': { '*provider': 'StatsProvider' },
+  'returns': 'StatsSchemaResult' }
-- 
2.27.0


