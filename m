Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E50B4B6F84
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 16:09:06 +0100 (CET)
Received: from localhost ([::1]:51052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJzRx-0002Ef-NI
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 10:09:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nJzOT-0006Qy-Ts
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 10:05:29 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:63156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nJzOQ-0005IW-H7
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 10:05:29 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21FEi0nX014259; 
 Tue, 15 Feb 2022 15:04:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=PeJeZryTyh+YMT5JKhiOsCF37KPMosRotEs9y3XKHy4=;
 b=gl3wsc881IncDonOFzQfXZkdbbramOZHWRzkMn2Cg5EfvAoyG7DLFfQ06Uya5A/xqZcP
 u7Iu+cw9ySPchPoVg0itq8V38aOJjSU7Qe72YzDoOq6vEc2JggH0LDKNkGqIWvKKWYed
 HXaVNWOm2jivBAt+zw6AFWyD9QzBxpb1+3o9jdWkYtfSrtUJgheiMbN2Frm8otnIPJZ/
 UX7Eo79b+sVVKo0ZZV9NbhSQ+7vFj29XYz2vWlGIxNJo0m9A6Kxc6g79Nm/rji0dNYWf
 zpKXCiH/H8NUJpmt7hIlWJTuUGPkB251Mmk0AnE6mvm7rwwT7JJeMzIerXM6roNx5330 Gw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e8570skqc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 15:04:44 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21FF0UMw008531;
 Tue, 15 Feb 2022 15:04:43 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
 by aserp3030.oracle.com with ESMTP id 3e62xerfe0-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 15:04:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VEyKQ+34YqVJPEKjZfBhDH0pO/bdA92i/EJcOIU2+GHra9x3drfrcsMZUWtz86KI8k4mWVFZXhTaBLBkH7FQVW1Wlwv7hhbkdwiLOjAzDbA/nwJwk9fawt4J9PviaNjFf3Y22OeuyD3l2sllJ/R0vArVC0uEdgLs1yWXQT6Bd74kPRxaKyWP6cKKdUamN/1k3nzlccmaR6OjA4yiB8dY3R2CJoyvUHq7kgtSjwk9TtWlyTlOROFeo5zzvbcW9jj6Ikkfj5Ib7/m5u8lxMOmZU1VsbpsjYCmN8yoVdvVr1rmerVtRxrLTf3i/Yhhh2PFXuM2HKgjuV1O608cjA+BwpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PeJeZryTyh+YMT5JKhiOsCF37KPMosRotEs9y3XKHy4=;
 b=nIAtMIqF0aAa/G/wiOD1HyTojqcHFmyzfemIiokNWYABYzJgxSzojEkhd+MnC4saVaROXPj8U9ZTcetZnCen4NqHL6yzl9VlDkeU6LYRX0r3HOXsGRwMp67FLGorplO05p4dB6msnPFnxW2nvDWAhBnfW/O8Y1SUYbFklCpsiwauyFB4XhAFxVnsWtvpn38tfx8cm5NKliAnUnV9OWRZFGO0MmJavHGdCEu4KTB+OQ8nyORWf2Miv6fXtLG74HRexL+6ACrM+XPAaK6SwNtuEpdZbKED7RjulFHANSZSXp7zEzriMWgYWCRPjAc09vMIq/rH2r1jNGfcIEWz2XzpRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PeJeZryTyh+YMT5JKhiOsCF37KPMosRotEs9y3XKHy4=;
 b=Dvb7/9oyBZLTB79nf9dTv28mDHGmiErlZXuWBjLwi60q78xmbcD1MoU913bLA9WFwV62rf/aiWyx0TW9WoqqX5GJR88Mb7HybgDG1TsKrUz85wewCLfucCVw4iaNLofgHvcx3JrlaUHkRn0HfNtRXzuKKylfmk8cLEweCBzMNOw=
Received: from SA1PR10MB5841.namprd10.prod.outlook.com (2603:10b6:806:22b::16)
 by DM6PR10MB3865.namprd10.prod.outlook.com (2603:10b6:5:1d3::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12; Tue, 15 Feb
 2022 15:04:41 +0000
Received: from SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::58ef:3181:b9d4:b716]) by SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::58ef:3181:b9d4:b716%5]) with mapi id 15.20.4951.016; Tue, 15 Feb 2022
 15:04:41 +0000
From: Mark Kanda <mark.kanda@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/3] qmp: Support for querying stats
Date: Tue, 15 Feb 2022 09:04:31 -0600
Message-Id: <20220215150433.2310711-2-mark.kanda@oracle.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220215150433.2310711-1-mark.kanda@oracle.com>
References: <20220215150433.2310711-1-mark.kanda@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0038.namprd04.prod.outlook.com
 (2603:10b6:806:120::13) To SA1PR10MB5841.namprd10.prod.outlook.com
 (2603:10b6:806:22b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47949303-f584-43a9-36b5-08d9f0947e3d
X-MS-TrafficTypeDiagnostic: DM6PR10MB3865:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB386559D400E5FDCA320A49BCF9349@DM6PR10MB3865.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gtYrs60yPub2GDIYHJL8UYNgBH1L9p2vjuB9vAfmPHab0BQy5DJ3LI2nLupItDvscSGW58WpZ6Tsx/Df0MNIrbO8lvyXHR+HMZIgQQLJrNnXgW0IJyQhsfrelT0xl9M48zzrWRDysXdu7mOqkr/ZbSvaru2un2qG4Fe6ZCCpMUhboBoLn+BSLG4O7f5eltzCAygaifx19etySmFl21syM8eyTAeQwoXP/eTLMcc1c57+U6YzWDXBFrQcN1etW/Ennm6dx3LI8fN/zndRk0jGdk0QxKRe0EzfVu/aDH3vp1aWJM0KuCSQHadrJMAhUuxLu5+wsL5kiXCywall1IlSQAJKaHmlrPR5x0vFxCTbdnztrt4Pb55joLvtbupHV6yEajiNy0Psnd32IBmZqxAh3yYM182oYX9rUNKQqbtQA2w5arMKf8XqcTlj0Sk5A60aOyykCHvTdiHvZtA5XZV3wVivZgdHGbD7n3ACo9OXpxpkMSDePIqHnn6D0jR4WRMMM6OcfdOQC5Yih9cN3F9lxSfD5QmOn00rPVC3bYqGmQzSXxiTWimnv1K/IhcyEpyi44KiwCk/gBVQC3TSrciRVt2xZ4m/25biV1jKiSPu233AQArLXB6Env3HQR9q7/tIvpHLwYQHwEZdMU+W8jV7NRYWWjYNwOqmpSOUKyUekLowk5XJueJLDA7t0+qtv6ub6Kt1YZFGzBKtJyVYJv85WA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR10MB5841.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(107886003)(2616005)(8676002)(1076003)(66476007)(26005)(6512007)(66556008)(86362001)(6916009)(52116002)(66946007)(6486002)(316002)(6666004)(508600001)(36756003)(83380400001)(44832011)(38350700002)(38100700002)(4326008)(5660300002)(186003)(8936002)(2906002)(30864003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z5PyvCIGY3xMmqzAceDvczsVuQQhCLv2W0YOxsImUm2SP61M3GGYWjAbKD9F?=
 =?us-ascii?Q?2qWI6aVcTrEiDG0LTH9aihgzPn8Hi58TnasZYNaIsVUbsY3DgWE8aPHOiPBb?=
 =?us-ascii?Q?RZt9ZLBkOo6IZXP9BSKUXMz215m0XXO8u9Da1OrMderw0Y9Tus4Wae7iX5jm?=
 =?us-ascii?Q?14H/mpM31LkVOOIItHVnI/ZhalVgb+bQDB2rDq783B2RSJXs0Wotip5aBn5g?=
 =?us-ascii?Q?MnygoS87TRimPtm0VXL6mB6B3GdPL9Kr5ioa10Q6VLYDnMqzjahH3JidtdrB?=
 =?us-ascii?Q?rI38H5p8ZxUaHhQVkAuVwMGCkfu3O4lmP7SerjxHm5hMx0rhPeM/eXcMfM8N?=
 =?us-ascii?Q?fzLjxor216x2DwEVcKlVx/DnRlLuiFl3uIbH56eNQV15cTXnQdPOXvK0YCXN?=
 =?us-ascii?Q?cdeE9uFKQr6frCrNDvISnMUrVSZiHP7UnYdQYXEoR5aWTYE2NjTOnyx+p1t4?=
 =?us-ascii?Q?oDAgo15BudS5gtSTa1WMTJG0UAH8dkbEaLK+QF4Nh7I6IXP4VgnMrdrXDgBD?=
 =?us-ascii?Q?cgqeP/ZHe+2EqNTwnKOExvvBNrnOMMm9as0R/oxNtBF0ScqMMYTtsWcfXbKG?=
 =?us-ascii?Q?OeqwKu+533QQANwod1ioYKHaxjeIXVxFZ8au7zFSrbTT9yRyebjjaIi2Sdn5?=
 =?us-ascii?Q?VCq1FXfPg08IghSBzLrRSq81cGoDLktoOWjU5Pvg88NwTHmhsAbYkB2QMU8O?=
 =?us-ascii?Q?gvOKFlbpuIyU/11fOP+dx49s4i8c070A8hSI1WQOOmc6pZIsdnEYgJ0YONzi?=
 =?us-ascii?Q?pM1mo/X9UBCZK6aDgnjhyr4xOMsDZbiWtYxZ3Qz5iVgtRy8qtrYleXgGKiWw?=
 =?us-ascii?Q?KPh7tdq88aVBXcCL+pzkHenNQapmjZvZVlAl+pGRS5CA+1d53qeDkvypXb1l?=
 =?us-ascii?Q?dwbne4hAXbXBcr7xpC+WBH+xvJ1nXN4fo5qVWHwhHIj8PPrLdlibLOaiuHFW?=
 =?us-ascii?Q?mb/vvyLNXkQkaYdUG2SfqbMZmSTfF9ADY9SAbwj6KwpWKmaCAj6SC05uAlxG?=
 =?us-ascii?Q?7YKhfe6G4sx7NLOZtSnSFaXeUhMT1LPEkbQF8KDdOZWihxq1gu1j4DV2lnne?=
 =?us-ascii?Q?vwYX6qYu/pSG9yW5Z0MOhuSrCJ9xghQyP6i+IYssU5iI20bVrcbnKizQdpyR?=
 =?us-ascii?Q?Nrgbxu8sdS98yltVYJ+Xlhe/AJucnTXzLeB5TrrZs6eNqw2R+5QaiyZSFepn?=
 =?us-ascii?Q?kjjkBf/jQuo2e2pTAis734mPKws5R1gkuu7DlTgTvRPUaiuj1OGdB9ZFwRVN?=
 =?us-ascii?Q?A4NVbPHckf+jU3i5e74ez8OsvhX4J294NNEXDURJFjwoMww2vSD1nOrII4v+?=
 =?us-ascii?Q?quwxYCNrwKa2BFkI5ZFOtmxGkk9CWClaSM7JY/zM2bTooB+seowWC6smUHKP?=
 =?us-ascii?Q?f/s5c4LkH+Etm8v3mQ48oJycqbEIK17rqf3VaYuETsHxHlJUOYKil1jlqZRC?=
 =?us-ascii?Q?/7G3BEk42/NKKomi1g5YedSABAQ5kvV11ITIxniY00Q0uuL8tSceZxh+Vz7u?=
 =?us-ascii?Q?Eip3+Yb7fCXeVTtkE0rkrs8TDWHHgy2BOIptH4Bv9ITDuw+P0ybhszHQHSMS?=
 =?us-ascii?Q?pIXtucpMGHaQiYrLlmE5mPpHgkB1Vf93fC9OcsggU5uPc4Q1FJ+PmSjy+Ads?=
 =?us-ascii?Q?MB0yXflBvgLtqbTFU23qHag=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47949303-f584-43a9-36b5-08d9f0947e3d
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB5841.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 15:04:41.6578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kyjxKxBp7PHAqT017lO9yfP3czHUZGBnFmlMPUgOClymI5KvA1wdbuvQKMC9QYcqVxv6v/TJp4VHL1Y4kQaTEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3865
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10258
 signatures=673431
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202150088
X-Proofpoint-ORIG-GUID: OVSvtA7nANtr0UoV1BvrzFbUmKmMcj3H
X-Proofpoint-GUID: OVSvtA7nANtr0UoV1BvrzFbUmKmMcj3H
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
Returns a list of all stats per target type (only VM and vCPU to start), with
additional options for specifying stat names, vCPU qom paths, and providers.

- query-stats-schemas
Returns a list of stats included in each target type, with an option for
specifying the provider.

The framework provides a method to register callbacks for these QMP commands.

The first use-case will be for fd-based KVM stats (in an upcoming patch).

Examples (with fd-based KVM stats):

- Query all VM stats:

{ "execute": "query-stats", "arguments" : { "target": "vm" } }

{ "return": {
  "vm": [
     { "provider": "kvm",
       "stats": [
          { "name": "max_mmu_page_hash_collisions", "value": 0 },
          { "name": "max_mmu_rmap_size", "value": 0 },
          { "name": "nx_lpage_splits", "value": 148 },
          ...
     { "provider": "xyz",
       "stats": [ ...
     ...
] } }

- Query all vCPU stats:

{ "execute": "query-stats", "arguments" : { "target": "vcpu" } }

{ "return": {
    "vcpus": [
      { "path": "/machine/unattached/device[0]"
        "providers": [
          { "provider": "kvm",
            "stats": [
              { "name": "guest_mode", "value": 0 },
              { "name": "directed_yield_successful", "value": 0 },
              { "name": "directed_yield_attempted", "value": 106 },
              ...
          { "provider": "xyz",
            "stats": [ ...
           ...
      { "path": "/machine/unattached/device[1]"
        "providers": [
          { "provider": "kvm",
            "stats": [...
          ...
} ] } }

- Query 'exits' and 'l1d_flush' KVM stats, and 'somestat' from provider 'xyz'
for vCPUs '/machine/unattached/device[2]' and '/machine/unattached/device[4]':

{ "execute": "query-stats",
  "arguments": {
    "target": "vcpu",
    "vcpus": [ "/machine/unattached/device[2]",
               "/machine/unattached/device[4]" ],
    "filters": [
      { "provider": "kvm",
        "fields": [ "l1d_flush", "exits" ] },
      { "provider": "xyz",
        "fields": [ "somestat" ] } ] } }

{ "return": {
    "vcpus": [
      { "path": "/machine/unattached/device[2]"
        "providers": [
          { "provider": "kvm",
            "stats": [ { "name": "l1d_flush", "value": 41213 },
                       { "name": "exits", "value": 74291 } ] },
          { "provider": "xyz",
            "stats": [ ... ] } ] },
      { "path": "/machine/unattached/device[4]"
        "providers": [
          { "provider": "kvm",
            "stats": [ { "name": "l1d_flush", "value": 16132 },
                       { "name": "exits", "value": 57922 } ] },
          { "provider": "xyz",
            "stats": [ ... ] } ] } ] } }

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
      { "provider": "xyz",
        ...
   "vm": [
      { "provider": "kvm",
        "stats": [
           { "name": "max_mmu_page_hash_collisions",
             "unit": "none",
             "base": 10,
             "exponent": 0,
             "type": "peak" },
      { "provider": "xyz",
      ...

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
---
 include/monitor/stats.h |  51 ++++++++
 monitor/qmp-cmds.c      | 219 +++++++++++++++++++++++++++++++++
 qapi/meson.build        |   1 +
 qapi/qapi-schema.json   |   1 +
 qapi/stats.json         | 259 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 531 insertions(+)
 create mode 100644 include/monitor/stats.h
 create mode 100644 qapi/stats.json

diff --git a/include/monitor/stats.h b/include/monitor/stats.h
new file mode 100644
index 0000000000..172dc01a4d
--- /dev/null
+++ b/include/monitor/stats.h
@@ -0,0 +1,51 @@
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
+#include "qapi/qapi-types-stats.h"
+
+/*
+ * Add QMP stats callbacks to the stats_callbacks list.
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
+                         void (*schemas_fn)(StatsSchemaResults *, Error **));
+
+/*
+ * Helper routines for adding stats entries to the results lists.
+ */
+void add_vm_stats_entry(StatsList *, StatsResults *, StatsProvider);
+void add_vcpu_stats_entry(StatsList *, StatsResults *, StatsProvider, char *);
+void add_vm_stats_schema(StatsSchemaValueList *, StatsSchemaResults *,
+                         StatsProvider);
+void add_vcpu_stats_schema(StatsSchemaValueList *, StatsSchemaResults *,
+                           StatsProvider);
+
+/*
+ * True if a stat name and provider match a filter or if no corresponding
+ * filters are defined. False otherwise.
+ */
+bool stats_requested_name(const char *, StatsProvider, StatsFilter *);
+
+/*
+ * True if a vcpu qom path and provider match a filter or if no corresponding
+ * filters are defined. False otherwise.
+ */
+bool stats_requested_vcpu(const char *, StatsProvider, StatsFilter *);
+
+#endif /* STATS_H */
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index db4d186448..07f1e683be 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -36,6 +36,7 @@
 #include "qapi/qapi-commands-control.h"
 #include "qapi/qapi-commands-machine.h"
 #include "qapi/qapi-commands-misc.h"
+#include "qapi/qapi-commands-stats.h"
 #include "qapi/qapi-commands-ui.h"
 #include "qapi/type-helpers.h"
 #include "qapi/qmp/qerror.h"
@@ -44,6 +45,7 @@
 #include "hw/acpi/acpi_dev_interface.h"
 #include "hw/intc/intc.h"
 #include "hw/rdma/rdma.h"
+#include "monitor/stats.h"
 
 NameInfo *qmp_query_name(Error **errp)
 {
@@ -448,3 +450,220 @@ HumanReadableText *qmp_x_query_irq(Error **errp)
 
     return human_readable_text_from_str(buf);
 }
+
+typedef struct StatsCallbacks {
+    StatsProvider provider;
+    void (*stats_cb)(StatsResults *, StatsFilter *, Error **);
+    void (*schemas_cb)(StatsSchemaResults *, Error **);
+    QTAILQ_ENTRY(StatsCallbacks) next;
+} StatsCallbacks;
+
+static QTAILQ_HEAD(, StatsCallbacks) stats_callbacks =
+    QTAILQ_HEAD_INITIALIZER(stats_callbacks);
+
+void add_stats_callbacks(StatsProvider provider,
+                         void (*stats_fn)(StatsResults *, StatsFilter*,
+                                          Error **),
+                         void (*schemas_fn)(StatsSchemaResults *, Error **))
+{
+    StatsCallbacks *entry = g_malloc0(sizeof(*entry));
+    entry->provider = provider;
+    entry->stats_cb = stats_fn;
+    entry->schemas_cb = schemas_fn;
+
+    QTAILQ_INSERT_TAIL(&stats_callbacks, entry, next);
+}
+
+static StatsRequestList *stats_target_filter(StatsFilter *filter)
+{
+    switch (filter->target) {
+    case STATS_TARGET_VM:
+        if (!filter->u.vm.has_filters) {
+            return NULL;
+        }
+        return filter->u.vm.filters;
+    case STATS_TARGET_VCPU:
+        if (!filter->u.vcpu.has_filters) {
+            return NULL;
+        }
+        return filter->u.vcpu.filters;
+        break;
+    default:
+        return NULL;
+    }
+}
+
+static bool stats_provider_match(StatsProvider provider,
+                                 StatsRequestList *request)
+{
+    return (!request->value->has_provider ||
+            (request->value->provider == provider));
+}
+
+static bool stats_requested_provider(StatsProvider provider,
+                                     StatsFilter *filter)
+{
+    StatsRequestList *request = stats_target_filter(filter);
+
+    if (!request) {
+        return true;
+    }
+    for (; request; request = request->next) {
+        if (stats_provider_match(provider, request)) {
+            return true;
+        }
+    }
+    return false;
+}
+
+StatsResults *qmp_query_stats(StatsFilter *filter, Error **errp)
+{
+    StatsResults *stats_results = g_malloc0(sizeof(*stats_results));
+    StatsCallbacks *entry;
+
+    QTAILQ_FOREACH(entry, &stats_callbacks, next) {
+        if (stats_requested_provider(entry->provider, filter)) {
+            entry->stats_cb(stats_results, filter, errp);
+        }
+    }
+
+    return stats_results;
+}
+
+StatsSchemaResults *qmp_query_stats_schemas(bool has_provider,
+                                           StatsProvider provider,
+                                           Error **errp)
+{
+    StatsSchemaResults *stats_results = g_malloc0(sizeof(*stats_results));
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
+void add_vm_stats_entry(StatsList *stats_list, StatsResults *stats_results,
+                        StatsProvider provider)
+{
+    StatsResultsEntry *entry = g_malloc0(sizeof(*entry));
+    entry->provider = provider;
+    entry->stats = stats_list;
+
+    QAPI_LIST_PREPEND(stats_results->vm, entry);
+    stats_results->has_vm = true;
+}
+
+void add_vcpu_stats_entry(StatsList *stats_list, StatsResults *stats_results,
+                          StatsProvider provider, char *path)
+{
+    StatsResultsVCPUEntry *value;
+    StatsResultsEntry *entry;
+    StatsResultsVCPUEntryList **tailp, *tail;
+
+    entry = g_malloc0(sizeof(*entry));
+    entry->provider = provider;
+    entry->stats = stats_list;
+
+    /* Find the vCPU entry and add to its list; else create it */
+    tailp = &stats_results->vcpus;
+
+    for (tail = *tailp; tail; tail = tail->next) {
+        if (g_str_equal(tail->value->path, path)) {
+            /* Add to the existing vCPU list */
+            QAPI_LIST_PREPEND(tail->value->providers, entry);
+            return;
+        }
+        tailp = &tail->next;
+    }
+
+    /* Create and populate a new vCPU entry */
+    value = g_malloc0(sizeof(*value));
+    value->path = g_strdup(path);
+    value->providers = g_malloc0(sizeof(*value->providers));
+    value->providers->value = entry;
+    QAPI_LIST_APPEND(tailp, value);
+    stats_results->has_vcpus = true;
+}
+
+void add_vm_stats_schema(StatsSchemaValueList *stats_list,
+                         StatsSchemaResults *schema_results,
+                         StatsProvider provider)
+{
+    StatsSchemaProvider *entry = g_malloc0(sizeof(*entry));
+
+    entry->provider = provider;
+    entry->stats = stats_list;
+    QAPI_LIST_PREPEND(schema_results->vm, entry);
+    schema_results->has_vm = true;
+}
+
+void add_vcpu_stats_schema(StatsSchemaValueList *stats_list,
+                           StatsSchemaResults *schema_results,
+                           StatsProvider provider)
+{
+    StatsSchemaProvider *entry = g_malloc0(sizeof(*entry));
+
+    entry->provider = provider;
+    entry->stats = stats_list;
+    QAPI_LIST_PREPEND(schema_results->vcpu, entry);
+    schema_results->has_vcpu = true;
+}
+
+static bool str_in_list(const char *name, strList *list)
+{
+    strList *str_list = NULL;
+
+    for (str_list = list; str_list; str_list = str_list->next) {
+        if (g_str_equal(name, str_list->value)) {
+            return true;
+        }
+    }
+    return false;
+}
+
+bool stats_requested_name(const char *name, StatsProvider provider,
+                          StatsFilter *filter)
+{
+    StatsRequestList *request = stats_target_filter(filter);
+
+    if (!request) {
+        return true;
+    }
+    for (; request; request = request->next) {
+        if (!stats_provider_match(provider, request)) {
+            continue;
+        }
+        if (!request->value->has_fields ||
+            str_in_list(name, request->value->fields)) {
+            return true;
+        }
+    }
+    return false;
+}
+
+bool stats_requested_vcpu(const char *path, StatsProvider provider,
+                          StatsFilter *filter)
+{
+    StatsRequestList *request = stats_target_filter(filter);
+
+    if (!request) {
+        return true;
+    }
+    if (!filter->u.vcpu.has_filters) {
+        return true;
+    }
+    if (filter->u.vcpu.has_vcpus && !str_in_list(path, filter->u.vcpu.vcpus)) {
+        return false;
+    }
+    for (; request; request = request->next) {
+        if (stats_provider_match(provider, request)) {
+            return true;
+        }
+    }
+    return false;
+}
diff --git a/qapi/meson.build b/qapi/meson.build
index 656ef0e039..fd5c93d643 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -46,6 +46,7 @@ qapi_all_modules = [
   'replay',
   'run-state',
   'sockets',
+  'stats',
   'trace',
   'transaction',
   'yank',
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index 4912b9744e..92d7ecc52c 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -93,3 +93,4 @@
 { 'include': 'audio.json' }
 { 'include': 'acpi.json' }
 { 'include': 'pci.json' }
+{ 'include': 'stats.json' }
diff --git a/qapi/stats.json b/qapi/stats.json
new file mode 100644
index 0000000000..ae5dc3ee2c
--- /dev/null
+++ b/qapi/stats.json
@@ -0,0 +1,259 @@
+# -*- Mode: Python -*-
+# vim: filetype=python
+#
+# Copyright (c) 2022 Oracle and/or its affiliates.
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or later.
+# See the COPYING file in the top-level directory.
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+##
+# = Stats
+##
+
+##
+# @StatsType:
+#
+# Enumeration of stats types
+# @cumulative: stat is cumulative; value can only increase.
+# @instant: stat is instantaneous; value can increase or decrease.
+# @peak: stat is the peak value; value can only increase.
+# @linear-hist: stat is a linear histogram.
+# @log-hist: stat is a logarithmic histogram.
+#
+# Since: 7.0
+##
+{ 'enum' : 'StatsType',
+  'data' : [ 'cumulative', 'instant', 'peak', 'linear-hist', 'log-hist' ] }
+
+##
+# @StatsUnit:
+#
+# Enumeration of stats units
+# @bytes: stat reported in bytes.
+# @seconds: stat reported in seconds.
+# @cycles: stat reported in clock cycles.
+# @none: no unit for this stat.
+#
+# Since: 7.0
+##
+{ 'enum' : 'StatsUnit',
+  'data' : [ 'bytes', 'seconds', 'cycles', 'none' ] }
+
+##
+# @StatsBase:
+#
+# Enumeration of stats base
+# @pow10: scale is based on power of 10.
+# @pow2: scale is based on power of 2.
+#
+# Since: 7.0
+##
+{ 'enum' : 'StatsBase',
+  'data' : [ 'pow10', 'pow2' ] }
+
+##
+# @StatsProvider:
+#
+# Enumeration of stats providers.
+#
+# Since: 7.0
+##
+{ 'enum': 'StatsProvider',
+  'data': [ ] }
+
+##
+# @StatsTarget:
+#
+# Enumeration of stats targets.
+# @vm: stat is per vm.
+# @vcpu: stat is per vcpu.
+#
+# Since: 7.0
+##
+{ 'enum': 'StatsTarget',
+  'data': [ 'vm', 'vcpu' ] }
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
+# @StatsRequestArray:
+#
+# @filters: filters for this request.
+##
+{ 'struct': 'StatsRequestArray',
+  'data': { '*filters': [ 'StatsRequest' ] } }
+
+##
+# @StatsVCPURequestArray:
+#
+# @vcpus: list of qom paths.
+##
+{ 'struct': 'StatsVCPURequestArray',
+  'base': 'StatsRequestArray',
+  'data': { '*vcpus': [ 'str' ] } }
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
+  'data': { 'vcpu': 'StatsVCPURequestArray',
+            'vm': 'StatsRequestArray' } }
+
+##
+# @StatsValueArray:
+#
+# @values: uint64 list.
+#
+# Since: 7.0
+##
+{ 'struct': 'StatsValueArray',
+  'data': { 'values' : [ 'uint64' ] } }
+
+##
+# @StatsValue:
+#
+# @scalar: single uint64.
+# @list: list of uint64.
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
+# @StatsResultsVCPUEntry:
+#
+# @path: vCPU qom path.
+# @providers: per provider results.
+#
+# Since: 7.0
+##
+{ 'struct': 'StatsResultsVCPUEntry',
+  'data': { 'path': 'str',
+            'providers': [ 'StatsResultsEntry' ] } }
+
+##
+# @StatsResults:
+#
+# Target specific results.
+#
+# Since: 7.0
+##
+{ 'struct': 'StatsResults',
+  'data': {
+      '*vcpus': [ 'StatsResultsVCPUEntry' ],
+      '*vm': [ 'StatsResultsEntry' ] } }
+
+##
+# @query-stats:
+#
+# data: @StatsFilter.
+# Returns: @StatsResults.
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
+# @type: @StatType.
+# @unit: @StatUnit.
+# @base: @StatBase.
+# @exponent: Used together with @base.
+# @bucket-size: Used with linear-hist to report bucket size
+#
+# Since: 7.0
+##
+{ 'struct': 'StatsSchemaValue',
+  'data': { 'name': 'str',
+            'type': 'StatsType',
+            'unit': 'StatsUnit',
+            'base': 'StatsBase',
+            'exponent': 'int16',
+            '*bucket-size': 'uint32' } }
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
+# @StatsSchemaResults:
+#
+# @vm: vm stats schemas.
+# @vcpu: vcpu stats schemas.
+#
+# Since: 7.0
+##
+{ 'struct': 'StatsSchemaResults',
+  'data': { '*vm': [ 'StatsSchemaProvider' ],
+            '*vcpu': [ 'StatsSchemaProvider' ] } }
+
+##
+# @query-stats-schemas:
+#
+# Query Stats schemas.
+# Returns @StatsSchemaResult.
+#
+# Since: 7.0
+##
+{ 'command': 'query-stats-schemas',
+  'data': { '*provider': 'StatsProvider' },
+  'returns': 'StatsSchemaResults' }
-- 
2.27.0


