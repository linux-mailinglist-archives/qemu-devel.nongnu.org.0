Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76366387EF0
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 19:49:10 +0200 (CEST)
Received: from localhost ([::1]:36328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj3q9-0000Qa-Io
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 13:49:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lj3ih-0001E8-6H
 for qemu-devel@nongnu.org; Tue, 18 May 2021 13:41:27 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:26074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lj3ib-0000AB-Ig
 for qemu-devel@nongnu.org; Tue, 18 May 2021 13:41:26 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14IHc936020638; Tue, 18 May 2021 17:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2020-01-29; bh=akYLMV8F2qfvUEACGZuHnyTichNSwVL8YcuESx51vDc=;
 b=KX8qjLOAyMOMKiMXXyPJd8qsGzg0yYX720uqqNU7Et3vmVU5SlxrI98goRpABeru+SU1
 0nl8Gg2LAK/qVt9n7gPFRpAri/IBxJBCYPhx4k35wuXcP1yqpysaLhSgOU67MLb6ioLc
 NKpLuhr1nREyuLF27umyIfWMyHwOTsHOyr5Sk/sL4c+yjiaI9f31vNb4HkFAvOl27dq9
 owjUsD0YmN6ihhqAep+BOU39eRWmEj5r35VrEQCcvRkleuq45RzOqCBl773tM4F6u2b2
 TIXp5t17pTEOj8HOKPVu0rbwXAg72D/GEnDjNO+abXcmaIOVIswpGHEilsD33ELhucsQ 0A== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 38kfhwgsc1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 May 2021 17:41:14 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14IHfD5s175976;
 Tue, 18 May 2021 17:41:13 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2040.outbound.protection.outlook.com [104.47.51.40])
 by userp3030.oracle.com with ESMTP id 38megjpmfn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 May 2021 17:41:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oy5slVCDKVc7IfxbXDf4y8ePgV4oghfEwmHAGBokcPRKDFBJySTPWAaIVGSZ6cKE9qduAZlHrLriGFsVKM6zdWzsZQqAz+HhOL1W4cuqZK0bgPgunV6h+aAhLjqJAO9AkK2wIVGUqP6udUB+VD7PRdDtd7NTEGuEkSuGZNWfw2D8fVQ/rNHPcUKvjYxXwROfK0DUOuucrgSGsqr6JhntCvqXUwU5EpzdTftSHk8r13WNL7s7kvItx6nVE0FfJtGVxZwNbIAqZ/hjW0oW6UHOS5BOuBG3/OgX6C7AXMx6VlVxPkzZ5aJNy+kkt43lN45JQ7G0/UHwc72BLe0QWGJODw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=akYLMV8F2qfvUEACGZuHnyTichNSwVL8YcuESx51vDc=;
 b=W1Sc+r2Y/CI52C3tfiBXXuU/Lhf/z/QxWXDZBs//LASOYlCfKcejLf9Mi576g1A3sWzwKPSpgRmfyue+ixIt/pAFucUa1tVMHCoLDnSMLfoxbscIAKxioRaTe07FvFR9RPXHbHhcci/rof7yJBSqXKPIIJqlyuHMm/iUD19+wvhtz7lX9fP3wjHOr8m+ZagUHITj+aLLYySYrTu7PRxcCVjStLY1UrqifnVTTI0S3wHmXnlTh/Q50VrZ2QGvf0suIygIfea+uG5Qn5fHaQu9qsuw9r1X0+kbFBgU6GgVjYm8LfcO8a/roAio8yKucQ5cHNwFut3LHlGwNNenCztQig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=akYLMV8F2qfvUEACGZuHnyTichNSwVL8YcuESx51vDc=;
 b=Jc1Uh82kk8ODpUn0e67enhtYGx1HRwrT8Lowf3FFmfkOBxLaY+5YH17kREbElEaus2sGImboZ2vLyPWFODp/EfNRhlixlwWf5SFHbGXwM+0BFyF8TfPaF0ls4S8aJgCDiBofNYUngiLNPpnkWMcyZgfOaY3fP1hbIAv1V4r2Cdo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BY5PR10MB3812.namprd10.prod.outlook.com (2603:10b6:a03:1f7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 17:41:11 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::18a:7c1f:bf20:ba6c]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::18a:7c1f:bf20:ba6c%3]) with mapi id 15.20.4129.032; Tue, 18 May 2021
 17:41:11 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] To add HMP interface to dump PCI MSI-X table/PBA
Date: Tue, 18 May 2021 10:41:27 -0700
Message-Id: <20210518174130.9381-1-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [138.3.200.16]
X-ClientProxiedBy: BYAPR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:a03:74::23) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (138.3.200.16) by
 BYAPR05CA0046.namprd05.prod.outlook.com (2603:10b6:a03:74::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.11 via Frontend Transport; Tue, 18 May 2021 17:41:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0d69817-9209-4b82-0fb4-08d91a242014
X-MS-TrafficTypeDiagnostic: BY5PR10MB3812:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB3812F27E8A0929F601AAFA33F02C9@BY5PR10MB3812.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oCNYVpyK289vo1QvNIrXoh+b8bioAZqzTpH2I5di4q6g9dvU3C1M+0l9bLutBatBDVEKqag7gcggmOJicxJkUgSHorYzmIHVECkHAcN5bRT7MQTg29B0s842sl4EeOnDe6Q8rbKMWNN88Hu1ePTFNB7lzCj07XCI+3+5NjLTjWI2f1vRjLkb25Bu7HROZFxpd+UL153QIgviCGXXCfX7K9LqCGsyLJZ+tjUFTrIU85wecd/exAyZakwV/bxlNUl/B5vwrbzafCAOLtVnOcfJMjSU//nztAwqlFbh06f+s4xJPW+gAppEPdwaES+n089jyg5A8N5qCLbErU/M/DH+MqoKgFcl5b/UCgg+g66qVe+wqLwdYBg5pZie1drSnWqs73kVyifI9f/wv0fv7y0PdsvibxLaGIEUkd8P51g3AttIzpDOK70fgXkj7Hddrn3c11PBvJd1PM97R/sQ95jYo736tSkdTn06x4lIRmJCSzVlOWnAA7ePWWkYoWa559wpAVVVARRAnaRk60jcgkA/EfItuitbqRKmvBQe4Q0HXGFFKwRQItxv4mvacDDshmaJValnDJQZrEBEx1LjhUyGXVWX43RtZEga5VE2Hz00LzeBPED3KlJ1HvAIxwZtE0at+UVRNC+kwNA+9BivePpAQL/mcJCcEdk9xnZ25bFUUMRCuSn/5cJH9587iD2frIrlHt5gBjCfZwZ2vfJJg73o4BWsJKagy11coubTOpC9sWFsaQlEv0ZUOpBFr45LS8HSOHCO6Ha32hJlr6XxzEIhXVZ71PWXQkN25uKKc8qIOssPA7Xa2jUeVPy23qhhuf9U0O6xRgYna8wuTrNhMfJGMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(376002)(396003)(39860400002)(136003)(8676002)(5660300002)(6916009)(6512007)(186003)(38350700002)(16526019)(38100700002)(86362001)(6666004)(4326008)(6486002)(6506007)(2906002)(1076003)(107886003)(26005)(66476007)(478600001)(8936002)(52116002)(66946007)(44832011)(36756003)(966005)(66556008)(956004)(2616005)(316002)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?NpyV2VjfCJUatZJ5etwBY5jSQOfIjzkosG5rlzIXCQ0Dpso3fsk0rrqeS2oQ?=
 =?us-ascii?Q?O6ZtGnmreKmexWCtklK+wtkMqzIsYmIVbMz9wYpvit1sS7szOlv5/4PNX9dD?=
 =?us-ascii?Q?qOrry6nqEf4QB22HUer9I34ewQF1AadfocOSKVJJx4wGDQWL4eU751VvhLPZ?=
 =?us-ascii?Q?KMX2c0WUYH3ZnorqCKs/tB8f6YLYwN/Qys6gjjzARUBBGBRKhtuPF4cTx91E?=
 =?us-ascii?Q?7bEguCc9L8JaV4bAoAK1W1wPLznt/XsAY0gICovN+2I1qZhpC7Xjkht9wzez?=
 =?us-ascii?Q?BISc6mhq6loRPZTKClj+H/ymYXqCIlpBfxh05sTYf3V55Qh8YI8bIeYUFru8?=
 =?us-ascii?Q?4579M2dx/kwIvQrH3n5a8+BzFI6NFQgxEDYyUOJm+D/5blEBSdUWk5p8JHOl?=
 =?us-ascii?Q?h0MPmz3dy9yimVkTZ3Xn62kllwl14GQ1azcpXHD/Sid2CD/jr9YMzdtJfDz5?=
 =?us-ascii?Q?+0VQMBTl6xzsb8i06Akg06ar+g9KCQeiu2mR3LXbixVonP+fdHoB+3iuKWox?=
 =?us-ascii?Q?7wn+Mdck4D62ORI6smmxV/R0Xbx2rkTVhygMkG54VNCLjHG7GyJEOqxMxjOs?=
 =?us-ascii?Q?AU78W/idu3B1cP1Ffar1Clb4OJydHAdGBRyXWHb4/D8R5nkGujAFrXsXMCZg?=
 =?us-ascii?Q?q8Wx4nc1ZEGKRJuaTboZM0QKYmpJhpObw6b+tpXHBLgEl/cL+073Afnqh6L3?=
 =?us-ascii?Q?1QFqBJ32DrIialqXo+LJc0EWjjhFET9nc7XYN0tCYVxaGmAyRhl7oY7oz5we?=
 =?us-ascii?Q?jhCctwrRYjeOlk5MzYw2WA2V99kq0uKogXrgR44n9apdJ2qkoudmY+ZuGs3m?=
 =?us-ascii?Q?uFL2F3pKs0Sr2j2+qCDb1AGJbF5qvpWvH0hvxwvknQmnMQFMGamDDDOrWmch?=
 =?us-ascii?Q?AiuBWYZuJhHBui+EpFW0XBTQibYLxbwqFusuGn5tPsrLKfJ3CPMIBbbxmmaI?=
 =?us-ascii?Q?N0HyuoO4U342tRvkSWtrQJgkWbzrbRX9YswEvtI8h5cR0KY5cWXZ6mMRoGUx?=
 =?us-ascii?Q?4AF5HOTPVpDzhb6MOpda/2MQR2rspSaKW74hUhstePB1bzoddOia02u7I7q3?=
 =?us-ascii?Q?oPvk6fwI5327Yh5Pfmz+CE+YgR9cJ50BX2iDrTSzRCiNnb4z752JfqMa3gFW?=
 =?us-ascii?Q?gFSYLaukT78IXgqy0FndD0gZ+pWKK/bB2BptXnFWhN4BXQHENpT53mGFXDpa?=
 =?us-ascii?Q?94uxw+cAg53Wsy6bZcLl4gbLCoUHj2VDH8HyEZurjUkE41T5fq6yKeyhi/ig?=
 =?us-ascii?Q?iGNiI6YZuPoh/Z1BJgJLTHVlvr0vA0E0Hsbg9Z8zndRijc/Xoxzcctl8acbh?=
 =?us-ascii?Q?SqISdWV8dfkp06Zt+BjSdMCE?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0d69817-9209-4b82-0fb4-08d91a242014
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 17:41:11.0975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QAET8bEzKY/cXKHNEVQDP0TBi2jbg805L+2kfZ0decuRHSw5+dVBeOVT1Mje88Q0uwJ+Rzyhb0AVNP6FQWkeJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3812
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9988
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=808
 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105180122
X-Proofpoint-GUID: qsCMZUYzI_V3SvnURCqSokzH7CzuFu6I
X-Proofpoint-ORIG-GUID: qsCMZUYzI_V3SvnURCqSokzH7CzuFu6I
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 jasowang@redhat.com, joe.jin@oracle.com, dgilbert@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch is to introduce the new HMP command to dump the MSI-X table/PBA.

Here is the RFC v1:

https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg04673.html

The idea was inspired by below discussion:

https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg09020.html


(qemu) info msix -d /machine/peripheral/vscsi0
Msg L.Addr Msg U.Addr Msg Data   Vect Ctrl
0xfee00000 0x00000000 0x00004041 0x00000000
0xfee00000 0x00000000 0x00004051 0x00000000
0xfee00000 0x00000000 0x00004061 0x00000000
0xfee00000 0x00000000 0x00004071 0x00000000
0xfee01000 0x00000000 0x000040b1 0x00000000
0xfee02000 0x00000000 0x000040c1 0x00000000
0xfee03000 0x00000000 0x000040d1 0x00000000

MSI-X PBA
0 0 0 0 0 0 0

virtio pci vector info:
config: 0
queue 0: 1
queue 1: 2
queue 2: 3
queue 3: 4
queue 4: 5
queue 5: 6


Changed since RFC v1:
  - Add heading to MSI-X table (suggested by David Alan Gilbert)
  - Add device specific interface, e.g., to dump virtio-pci queue-to-vector
    mapping (Suggested By Jason)


 hmp-commands-info.hx       | 14 +++++++++
 hw/pci/msix.c              | 63 +++++++++++++++++++++++++++++++++++++++++
 hw/virtio/virtio-pci.c     | 22 ++++++++++++++
 hw/virtio/virtio.c         | 10 +++++++
 include/hw/pci/msix.h      |  2 ++
 include/hw/pci/pci.h       |  3 ++
 include/hw/virtio/virtio.h |  2 ++
 include/monitor/hmp.h      |  1 +
 softmmu/qdev-monitor.c     | 36 +++++++++++++++++++++++
 9 files changed, 153 insertions(+)


Thank you very much!

Dongli Zhang



