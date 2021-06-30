Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4EE3B8923
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 21:27:56 +0200 (CEST)
Received: from localhost ([::1]:46298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfsI-000598-R6
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 15:27:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lyfrG-0004Ty-Nj
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 15:26:50 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:48082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lyfrD-0008CB-QW
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 15:26:50 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15UJMs5s030382; Wed, 30 Jun 2021 19:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=NtlB4ZG4sVAmzK1l0/L7u+pPZgWPQkzNmm6n+1j/iy8=;
 b=kQb0BtDcLES7ips7tZGO8aQvMZt7CnhLM8cs32Z8qnRq8Xals1TF63kaeuD9RCuPjyic
 Cp/6EHDoQ3c88v8F/lTRz8wvD0v7ATg055N6Vegy43DRlK7IJctryBGpjDw3y7Pj/0lB
 hfyfINkT+Z2GWGkDFdJOEZ7jCqMBKGXKIg0+ka7AtyuR0JKlf2+46vf9i08uUfpqE4Sx
 CcOnxm6sZbUEtlsOHAfZD6nc/67o+nU7u/U2caQD8SvYASDLGdR9T2HjNZZTYnzCSyhc
 ivbtfuVCVBOade8hzXCJV2K1J1jDUsMsjdCnxiIfbOc84c2kj+W8GdeBcYGA9do9mkQL qw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39gguq1s6v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 19:26:44 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15UJQCNC182695;
 Wed, 30 Jun 2021 19:26:42 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2049.outbound.protection.outlook.com [104.47.73.49])
 by aserp3020.oracle.com with ESMTP id 39dv28n6ys-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 19:26:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RPnw0svMiam1Bj8V3NpQsjHqhrCjjxroAag+Otk3OMkTSoDx7N690l1PPMTJ3vnkIdSQYqX7FTA4FAsd+AV5VvDWSrgeIgOAwsDD4oRLf3uEGWQe25xlv+r2/lVYMCxFdu5tkX97qNIaL87+v6WbXROGXnXHiqGwLu4wrZn2RFb/OO8YNNsUHcciow/56lrocmEAxezDgLEakI92bJo2bxvC3bgDZwGryBCHf5vude1Kl1ekZuZvk5Y84vm4yMKv6BtHnwRccQTAk1GowVUkWW26gOrmefQUAvzpwS0Ujl4r/apymGGPaeXV7HlzxmuPjZ+OqaDyGAvVjDmWaLNUrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NtlB4ZG4sVAmzK1l0/L7u+pPZgWPQkzNmm6n+1j/iy8=;
 b=Wbin0wiU/NLjW5yG4Bf5+R9aKRUpA0+DTYW0ccjBdVmuc4AH2oWOZMV0Xam7e6uWg4VKz5LgdhxofFF6c6EwB0LT87sQ1Fm9aUuXth0+pI3CyKLL5kx2dJ/KfPeDUAEZtCKWWzcKs8nluKswJixwWjf75KhM7CpOXRTQMaeWewe5NP58k6YqsJHiD4WW4hed3YtLXYZ1CqWA+aZaa8CBvbqwlNRqgbPtNhc/qHB0OC7PaP6CFxPCrqb6btYJIRtx5x84+mui8XLOH09kqiNtz0GqmkwY6HjsJV4i/KlHFDpqU7E1vcFOi3xGOaL2CLgAirKujiq9mciC8PHkpiJYCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NtlB4ZG4sVAmzK1l0/L7u+pPZgWPQkzNmm6n+1j/iy8=;
 b=dgBSYMI4eR6xjVnSveWzfECOWEKnLXkt30jandZUGeu/UWuQI1KxayGiBODmqWBh9hdaEtOcVIu6NfzkStVMKT9lTneiR0F66kZI7Xm0LUtUC5v3q5svjV0C+T3Rg0eEOYyYLZnDlk/wcuQGl0L7CnA4U5zLqpOqvuo2fIbYLG4=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR1001MB2238.namprd10.prod.outlook.com (2603:10b6:301:2d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Wed, 30 Jun
 2021 19:26:39 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc%7]) with mapi id 15.20.4287.023; Wed, 30 Jun 2021
 19:26:39 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v5 02/10] ACPI ERST: specification for ERST support
Thread-Topic: [PATCH v5 02/10] ACPI ERST: specification for ERST support
Thread-Index: AQHXbeM6XC24aDczrE2yUx1nGS4w7ass756L
Date: Wed, 30 Jun 2021 19:26:39 +0000
Message-ID: <CO1PR10MB453117598D1ED99EB0A7AA3B97019@CO1PR10MB4531.namprd10.prod.outlook.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>,
 <1625080041-29010-3-git-send-email-eric.devolder@oracle.com>
In-Reply-To: <1625080041-29010-3-git-send-email-eric.devolder@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [138.3.201.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 355b0d25-dffa-4ce5-87b9-08d93bfcfbf8
x-ms-traffictypediagnostic: MWHPR1001MB2238:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1001MB2238223C706B87E32F26654197019@MWHPR1001MB2238.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PsUTbfeg5KXVcn/9VmKp3vAUCBP5WIOWiENoomttKQ9X2xZeXuGiCQBLBTkkGx0UPHIb0um4IuKWhqXt4JdY1meAQKzdxgJu+1QdMWhmYQ0XOP7OkvPzCkxxdwcwcn03qGqrARW0/KzaqgTyrkugIkzadbheNphlKKlz5GflzB1MNKOdalxMrjxAvceJTMn56LhUvnHD5wG0oPEUhYI3Q3Es70yfR0q3GpzJDzN3qbFilmYHZrDYj8sxA3swlGQLG8RISBqOsRy5aSOdL5vo/LVTRfGUSEOtCJCwY8IEMhNaMADIuTpnBQhwaT1RdnNhxwjzPrBDo8T5PYw5/UiT3xbKF/J8y3PE0IrDXrlTPkl7cIj9JOiuldVzXzdvS9KqWpw9Bq+aag6SS3j/vUbsi0Op2reCHX4nhRxc7h2Zuq3lOTgCjLwwlv+bV3eEgUx+hpv6Z9LU6ogNUeKTG8qbzPz1Sek3RpE3Dg8wa/TAP2Be9YU58nGigo3vPXrhpDala1vmQjZK0jV9CuWrSV2VzxhwF+gYIuK1d2se6aS+VCStHeW15RASyLnpOmk3P+cqTfI7ftGuEzREg3Qyg17UgiFRPLi1DX7gQNVBzMNsW4FmRgDV1JTMlzdqEpzXwS1xhcHviOkGt4xhgldSXb/C4Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(366004)(376002)(39860400002)(136003)(19627405001)(5660300002)(6506007)(33656002)(8936002)(8676002)(71200400001)(6916009)(26005)(186003)(4326008)(86362001)(66446008)(76116006)(2906002)(64756008)(52536014)(122000001)(316002)(55016002)(9686003)(66556008)(66946007)(91956017)(45080400002)(107886003)(66476007)(54906003)(83380400001)(38100700002)(478600001)(7696005)(53546011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uZaiMwGOgWiZ4BFZjy/ZbAj52/hTt3vdo5DrLk9PAzYFGuHLcxpT5Ibjq9LX?=
 =?us-ascii?Q?OMZnjX+OgUhkyNmLmogmmtdmgCde+Ac1U1gA9tWxVhwXtUBdX6ztdLZCgT3Y?=
 =?us-ascii?Q?be6yhFb1swVk3kHwf1XAB4R4zhK3DBPjt/YuBFzHHN4k8YAmBSwvwvPAmCE+?=
 =?us-ascii?Q?rELwKJmRNbHYHpRUxsFL1VRQCwQ5WyFt+HWQAXTsEypMY9gLD3I2mnOM1c/J?=
 =?us-ascii?Q?m9X/u7MJ/oBoZQGVzq6cjl+yMY7xyP2GU+j+ZUKZVlYng41HvHEiRvgxPzaT?=
 =?us-ascii?Q?Q/7ttYMKfvKwrQKfW/cNd86tx9QZ5EhjN9pUMA532AgLThc69YFz9yGJN4q3?=
 =?us-ascii?Q?1vJjaSU1vSTLPeDZxRwHJxkyaED/Aa6Tpnu1v01SYqM0fLWWs2wAVq2JlRnN?=
 =?us-ascii?Q?vAl+cXW4sX5cHktoxMNJMr7F9rSjMORB7S3PHJaIIjf0ADMxQCAu54Q8M4UV?=
 =?us-ascii?Q?1datGQ6iS1+eXGp/xFeC3s1CbMBRHo37/w095nUN/tTfBuvQwufVP2ow5SN/?=
 =?us-ascii?Q?ZnsKbqgY836EDf6zQlHz1zHajtUOWraAw0WmlE6tCpZ8ADqOwUm9mAR0t6q9?=
 =?us-ascii?Q?8zGYCAlSlGU82ThTCdVPinrsGnDHuZeDkPaJ+dqMNQ+bPL/B1UPzm1bl8sRr?=
 =?us-ascii?Q?bbDlErOEUUDG6ZHJVXhoNuKcmA1cQbKuk+aaDfd1VHqirYDITVIct0kPpFn8?=
 =?us-ascii?Q?CiRAiUG/ar3gBjYve6EmKOQi/P3P2hzYlvtxQIaL5HRYywHnzjUHFt9JVrHb?=
 =?us-ascii?Q?zdvz4OpSNkbUoX0ZK8FKPkuIM4uB87uPf9/kgGGIlExmjmnQ/n4sR2Yb01xy?=
 =?us-ascii?Q?LankU3x9pX1SAGK/z9t0FeYhSeJOq8m9l/XCir6NnREdDn+PHm/Hn6XN2n04?=
 =?us-ascii?Q?21pcMnO0ehdsLVGFJuvdNHcd2LW5CjdkNpsuH3SzLtdI8/A1x8APMxwmpgC2?=
 =?us-ascii?Q?DYUR/k3zQ8r1lYibJdsC62L16BdpCl9oKPzUmPx/LyHqn+wDJWGVIdz4zBVK?=
 =?us-ascii?Q?D1tQ28DwWW76QmykNpfriTw296MoEN9PKxvDwlRLApTEPRLbIoliH56BPlr6?=
 =?us-ascii?Q?qlUHci8JuguWJdn+v3qA3ttVJ5ei+pJc0bwkX2KXxIrpNh+x3H0Vj2DN3QoK?=
 =?us-ascii?Q?d8RJuDoBpX70xvlAF+JbX+5uBAGw9CCT4y2vOyhnuVQbmO7XI+t9Q5Jn/qN9?=
 =?us-ascii?Q?8HdZ7SfeQ/9c2QEc2lw8/dAQZQeS6fO6y8ETSGDwtMMZTVD2purnI9mEz82X?=
 =?us-ascii?Q?0F03Rl1RQWbJpyTOjEgU50Sk474dGWVCI+EQ/uk0FoSn05kb7aKGY1/CNw9k?=
 =?us-ascii?Q?mss=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CO1PR10MB453117598D1ED99EB0A7AA3B97019CO1PR10MB4531namp_"
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 355b0d25-dffa-4ce5-87b9-08d93bfcfbf8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2021 19:26:39.3547 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RNQRDYfzjvhEmo6DdqUuKqMVF9IGv82K/NBVj55lIYHg6UbnSLxzbpJM9cM76viUevKUNFa4BKZ1+MiIh9SKxAfDjKoQa1NzfGNzMhxOOYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2238
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10031
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 adultscore=0
 malwarescore=0 mlxlogscore=993 suspectscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106300107
X-Proofpoint-ORIG-GUID: lBKvR7IKQsfoH2ouBzBfgZEulEYYMs5d
X-Proofpoint-GUID: lBKvR7IKQsfoH2ouBzBfgZEulEYYMs5d
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "mst@redhat.com" <mst@redhat.com>, Konrad Wilk <konrad.wilk@oracle.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_CO1PR10MB453117598D1ED99EB0A7AA3B97019CO1PR10MB4531namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Oops, at the end of the 4th paragraph, I meant to state that "Linux does no=
t support the NVRAM mode."
rather than "non-NVRAM mode", which contradicts everything I stated prior.
Eric.
________________________________
From: Eric DeVolder <eric.devolder@oracle.com>
Sent: Wednesday, June 30, 2021 2:07 PM
To: qemu-devel@nongnu.org <qemu-devel@nongnu.org>
Cc: mst@redhat.com <mst@redhat.com>; imammedo@redhat.com <imammedo@redhat.c=
om>; marcel.apfelbaum@gmail.com <marcel.apfelbaum@gmail.com>; pbonzini@redh=
at.com <pbonzini@redhat.com>; rth@twiddle.net <rth@twiddle.net>; ehabkost@r=
edhat.com <ehabkost@redhat.com>; Konrad Wilk <konrad.wilk@oracle.com>; Bori=
s Ostrovsky <boris.ostrovsky@oracle.com>
Subject: [PATCH v5 02/10] ACPI ERST: specification for ERST support

Information on the implementation of the ACPI ERST support.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 docs/specs/acpi_erst.txt | 152 +++++++++++++++++++++++++++++++++++++++++++=
++++
 1 file changed, 152 insertions(+)
 create mode 100644 docs/specs/acpi_erst.txt

diff --git a/docs/specs/acpi_erst.txt b/docs/specs/acpi_erst.txt
new file mode 100644
index 0000000..79f8eb9
--- /dev/null
+++ b/docs/specs/acpi_erst.txt
@@ -0,0 +1,152 @@
+ACPI ERST DEVICE
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+The ACPI ERST device is utilized to support the ACPI Error Record
+Serialization Table, ERST, functionality. The functionality is
+designed for storing error records in persistent storage for
+future reference/debugging.
+
+The ACPI specification[1], in Chapter "ACPI Platform Error Interfaces
+(APEI)", and specifically subsection "Error Serialization", outlines
+a method for storing error records into persistent storage.
+
+The format of error records is described in the UEFI specification[2],
+in Appendix N "Common Platform Error Record".
+
+While the ACPI specification allows for an NVRAM "mode" (see
+GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES) where non-volatile RAM is
+directly exposed for direct access by the OS/guest, this implements
+the non-NVRAM "mode". This non-NVRAM "mode" is what is implemented
+by most BIOS (since flash memory requires programming operations
+in order to update its contents). Furthermore, as of the time of this
+writing, Linux does not support the non-NVRAM "mode".
+
+
+Background/Motivation
+---------------------
+Linux uses the persistent storage filesystem, pstore, to record
+information (eg. dmesg tail) upon panics and shutdowns.  Pstore is
+independent of, and runs before, kdump.  In certain scenarios (ie.
+hosts/guests with root filesystems on NFS/iSCSI where networking
+software and/or hardware fails), pstore may contain the only
+information available for post-mortem debugging.
+
+Two common storage backends for the pstore filesystem are ACPI ERST
+and UEFI. Most BIOS implement ACPI ERST.  UEFI is not utilized in
+all guests. With QEMU supporting ACPI ERST, it becomes a viable
+pstore storage backend for virtual machines (as it is now for
+bare metal machines).
+
+Enabling support for ACPI ERST facilitates a consistent method to
+capture kernel panic information in a wide range of guests: from
+resource-constrained microvms to very large guests, and in
+particular, in direct-boot environments (which would lack UEFI
+run-time services).
+
+Note that Microsoft Windows also utilizes the ACPI ERST for certain
+crash information, if available.
+
+
+Invocation
+----------
+
+To utilize ACPI ERST, a memory-backend-file object and acpi-erst
+device must be created, for example:
+
+ qemu ...
+ -object memory-backend-file,id=3Derstnvram,mem-path=3Dacpi-erst.backing,
+  size=3D0x10000,share=3Don
+ -device acpi-erst,memdev=3Derstnvram
+
+For proper operation, the ACPI ERST device needs a memory-backend-file
+object with the following parameters:
+
+ - id: The id of the memory-backend-file object is used to associate
+   this memory with the acpi-erst device.
+ - size: The size of the ACPI ERST backing storage. This parameter is
+   required.
+ - mem-path: The location of the ACPI ERST backing storage file. This
+   parameter is also required.
+ - share: The share=3Don parameter is required so that updates to the
+   ERST back store are written to the file immediately as well. Without
+   it, updates the the backing file are unpredictable and may not
+   properly persist (eg. if qemu should crash).
+
+The ACPI ERST device is a simple PCI device, and requires this one
+parameter:
+
+ - memdev: Is the object id of the memory-backend-file.
+
+
+PCI Interface
+-------------
+
+The ERST device is a PCI device with two BARs, one for accessing
+the programming registers, and the other for accessing the
+record exchange buffer.
+
+BAR0 contains the programming interface consisting of just two
+64-bit registers. The two registers are an ACTION (cmd) and a
+VALUE (data). All ERST actions/operations/side effects happen
+on the write to the ACTION, by design. Thus any data needed
+by the action must be placed into VALUE prior to writing
+ACTION. Reading the VALUE simply returns the register contents,
+which can be updated by a previous ACTION. This behavior is
+encoded in the ACPI ERST table generated by QEMU.
+
+BAR1 contains the record exchange buffer, and the size of this
+buffer sets the maximum record size. This record exchange
+buffer size is 8KiB.
+
+Backing File
+------------
+
+The ACPI ERST persistent storage is contained within a single backing
+file. The size and location of the backing file is specified upon
+QEMU startup of the ACPI ERST device.
+
+Records are stored in the backing file in a simple fashion.
+The backing file is essentially divided into fixed size
+"slots", ERST_RECORD_SIZE in length, with each "slot"
+storing a single record. No attempt at optimizing storage
+through compression, compaction, etc is attempted.
+NOTE that any change to this value will make any pre-
+existing backing files, not of the same ERST_RECORD_SIZE,
+unusable to the guest.
+
+Below is an example layout of the backing store file.
+The size of the file is a multiple of ERST_RECORD_SIZE,
+and contains N number of "slots" to store records. The
+example below shows two records (in CPER format) in the
+backing file, while the remaining slots are empty/
+available.
+
+ Slot   Record
+        +--------------------------------------------+
+    0   | empty/available                            |
+        +--------------------------------------------+
+    1   | CPER                                       |
+        +--------------------------------------------+
+    2   | CPER                                       |
+        +--------------------------------------------+
+  ...   |                                            |
+        +--------------------------------------------+
+    N   | empty/available                            |
+        +--------------------------------------------+
+        <-------------- ERST_RECORD_SIZE ------------>
+
+Not all slots need to be occupied, and they need not be
+occupied in a contiguous fashion. The ability to clear/erase
+specific records allows for the formation of unoccupied
+slots.
+
+
+References
+----------
+
+[1] "Advanced Configuration and Power Interface Specification",
+    version 4.0, June 2009.
+
+[2] "Unified Extensible Firmware Interface Specification",
+    version 2.1, October 2008.
+
--
1.8.3.1


--_000_CO1PR10MB453117598D1ED99EB0A7AA3B97019CO1PR10MB4531namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Oops, at the end of the 4th paragraph, I meant to state that &quot;Linux do=
es not support the NVRAM mode.&quot;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
rather than &quot;non-NVRAM mode&quot;, which contradicts everything I stat=
ed prior.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Eric.</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Eric DeVolder &lt;eri=
c.devolder@oracle.com&gt;<br>
<b>Sent:</b> Wednesday, June 30, 2021 2:07 PM<br>
<b>To:</b> qemu-devel@nongnu.org &lt;qemu-devel@nongnu.org&gt;<br>
<b>Cc:</b> mst@redhat.com &lt;mst@redhat.com&gt;; imammedo@redhat.com &lt;i=
mammedo@redhat.com&gt;; marcel.apfelbaum@gmail.com &lt;marcel.apfelbaum@gma=
il.com&gt;; pbonzini@redhat.com &lt;pbonzini@redhat.com&gt;; rth@twiddle.ne=
t &lt;rth@twiddle.net&gt;; ehabkost@redhat.com &lt;ehabkost@redhat.com&gt;;
 Konrad Wilk &lt;konrad.wilk@oracle.com&gt;; Boris Ostrovsky &lt;boris.ostr=
ovsky@oracle.com&gt;<br>
<b>Subject:</b> [PATCH v5 02/10] ACPI ERST: specification for ERST support<=
/font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Information on the implementation of the ACPI ERST=
 support.<br>
<br>
Signed-off-by: Eric DeVolder &lt;eric.devolder@oracle.com&gt;<br>
---<br>
&nbsp;docs/specs/acpi_erst.txt | 152 ++++++++++++++++++++++++++++++++++++++=
+++++++++<br>
&nbsp;1 file changed, 152 insertions(+)<br>
&nbsp;create mode 100644 docs/specs/acpi_erst.txt<br>
<br>
diff --git a/docs/specs/acpi_erst.txt b/docs/specs/acpi_erst.txt<br>
new file mode 100644<br>
index 0000000..79f8eb9<br>
--- /dev/null<br>
+++ b/docs/specs/acpi_erst.txt<br>
@@ -0,0 +1,152 @@<br>
+ACPI ERST DEVICE<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+<br>
+The ACPI ERST device is utilized to support the ACPI Error Record<br>
+Serialization Table, ERST, functionality. The functionality is<br>
+designed for storing error records in persistent storage for<br>
+future reference/debugging.<br>
+<br>
+The ACPI specification[1], in Chapter &quot;ACPI Platform Error Interfaces=
<br>
+(APEI)&quot;, and specifically subsection &quot;Error Serialization&quot;,=
 outlines<br>
+a method for storing error records into persistent storage.<br>
+<br>
+The format of error records is described in the UEFI specification[2],<br>
+in Appendix N &quot;Common Platform Error Record&quot;.<br>
+<br>
+While the ACPI specification allows for an NVRAM &quot;mode&quot; (see<br>
+GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES) where non-volatile RAM is<br>
+directly exposed for direct access by the OS/guest, this implements<br>
+the non-NVRAM &quot;mode&quot;. This non-NVRAM &quot;mode&quot; is what is=
 implemented<br>
+by most BIOS (since flash memory requires programming operations<br>
+in order to update its contents). Furthermore, as of the time of this<br>
+writing, Linux does not support the non-NVRAM &quot;mode&quot;.<br>
+<br>
+<br>
+Background/Motivation<br>
+---------------------<br>
+Linux uses the persistent storage filesystem, pstore, to record<br>
+information (eg. dmesg tail) upon panics and shutdowns.&nbsp; Pstore is<br=
>
+independent of, and runs before, kdump.&nbsp; In certain scenarios (ie.<br=
>
+hosts/guests with root filesystems on NFS/iSCSI where networking<br>
+software and/or hardware fails), pstore may contain the only<br>
+information available for post-mortem debugging.<br>
+<br>
+Two common storage backends for the pstore filesystem are ACPI ERST<br>
+and UEFI. Most BIOS implement ACPI ERST.&nbsp; UEFI is not utilized in<br>
+all guests. With QEMU supporting ACPI ERST, it becomes a viable<br>
+pstore storage backend for virtual machines (as it is now for<br>
+bare metal machines).<br>
+<br>
+Enabling support for ACPI ERST facilitates a consistent method to<br>
+capture kernel panic information in a wide range of guests: from<br>
+resource-constrained microvms to very large guests, and in<br>
+particular, in direct-boot environments (which would lack UEFI<br>
+run-time services).<br>
+<br>
+Note that Microsoft Windows also utilizes the ACPI ERST for certain<br>
+crash information, if available.<br>
+<br>
+<br>
+Invocation<br>
+----------<br>
+<br>
+To utilize ACPI ERST, a memory-backend-file object and acpi-erst<br>
+device must be created, for example:<br>
+<br>
+ qemu ...<br>
+ -object memory-backend-file,id=3Derstnvram,mem-path=3Dacpi-erst.backing,<=
br>
+&nbsp; size=3D0x10000,share=3Don<br>
+ -device acpi-erst,memdev=3Derstnvram<br>
+<br>
+For proper operation, the ACPI ERST device needs a memory-backend-file<br>
+object with the following parameters:<br>
+<br>
+ - id: The id of the memory-backend-file object is used to associate<br>
+&nbsp;&nbsp; this memory with the acpi-erst device.<br>
+ - size: The size of the ACPI ERST backing storage. This parameter is<br>
+&nbsp;&nbsp; required.<br>
+ - mem-path: The location of the ACPI ERST backing storage file. This<br>
+&nbsp;&nbsp; parameter is also required.<br>
+ - share: The share=3Don parameter is required so that updates to the<br>
+&nbsp;&nbsp; ERST back store are written to the file immediately as well. =
Without<br>
+&nbsp;&nbsp; it, updates the the backing file are unpredictable and may no=
t<br>
+&nbsp;&nbsp; properly persist (eg. if qemu should crash).<br>
+<br>
+The ACPI ERST device is a simple PCI device, and requires this one<br>
+parameter:<br>
+<br>
+ - memdev: Is the object id of the memory-backend-file.<br>
+<br>
+<br>
+PCI Interface<br>
+-------------<br>
+<br>
+The ERST device is a PCI device with two BARs, one for accessing<br>
+the programming registers, and the other for accessing the<br>
+record exchange buffer.<br>
+<br>
+BAR0 contains the programming interface consisting of just two<br>
+64-bit registers. The two registers are an ACTION (cmd) and a<br>
+VALUE (data). All ERST actions/operations/side effects happen<br>
+on the write to the ACTION, by design. Thus any data needed<br>
+by the action must be placed into VALUE prior to writing<br>
+ACTION. Reading the VALUE simply returns the register contents,<br>
+which can be updated by a previous ACTION. This behavior is<br>
+encoded in the ACPI ERST table generated by QEMU.<br>
+<br>
+BAR1 contains the record exchange buffer, and the size of this<br>
+buffer sets the maximum record size. This record exchange<br>
+buffer size is 8KiB.<br>
+<br>
+Backing File<br>
+------------<br>
+<br>
+The ACPI ERST persistent storage is contained within a single backing<br>
+file. The size and location of the backing file is specified upon<br>
+QEMU startup of the ACPI ERST device.<br>
+<br>
+Records are stored in the backing file in a simple fashion.<br>
+The backing file is essentially divided into fixed size<br>
+&quot;slots&quot;, ERST_RECORD_SIZE in length, with each &quot;slot&quot;<=
br>
+storing a single record. No attempt at optimizing storage<br>
+through compression, compaction, etc is attempted.<br>
+NOTE that any change to this value will make any pre-<br>
+existing backing files, not of the same ERST_RECORD_SIZE,<br>
+unusable to the guest.<br>
+<br>
+Below is an example layout of the backing store file.<br>
+The size of the file is a multiple of ERST_RECORD_SIZE,<br>
+and contains N number of &quot;slots&quot; to store records. The<br>
+example below shows two records (in CPER format) in the<br>
+backing file, while the remaining slots are empty/<br>
+available.<br>
+<br>
+ Slot&nbsp;&nbsp; Record<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +------------------------------=
--------------+<br>
+&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp; | empty/available&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +------------------------------=
--------------+<br>
+&nbsp;&nbsp;&nbsp; 1&nbsp;&nbsp; | CPER&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +------------------------------=
--------------+<br>
+&nbsp;&nbsp;&nbsp; 2&nbsp;&nbsp; | CPER&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +------------------------------=
--------------+<br>
+&nbsp; ...&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +------------------------------=
--------------+<br>
+&nbsp;&nbsp;&nbsp; N&nbsp;&nbsp; | empty/available&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +------------------------------=
--------------+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;-------------- ERST_RECORD_=
SIZE ------------&gt;<br>
+<br>
+Not all slots need to be occupied, and they need not be<br>
+occupied in a contiguous fashion. The ability to clear/erase<br>
+specific records allows for the formation of unoccupied<br>
+slots.<br>
+<br>
+<br>
+References<br>
+----------<br>
+<br>
+[1] &quot;Advanced Configuration and Power Interface Specification&quot;,<=
br>
+&nbsp;&nbsp;&nbsp; version 4.0, June 2009.<br>
+<br>
+[2] &quot;Unified Extensible Firmware Interface Specification&quot;,<br>
+&nbsp;&nbsp;&nbsp; version 2.1, October 2008.<br>
+<br>
-- <br>
1.8.3.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_CO1PR10MB453117598D1ED99EB0A7AA3B97019CO1PR10MB4531namp_--

