Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C28E9328D22
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 20:07:07 +0100 (CET)
Received: from localhost ([::1]:48738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGnso-0007gW-MC
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 14:07:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lGnqs-0006h5-Eq
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 14:05:06 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:40322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lGnqn-0006ec-Gi
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 14:05:05 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 121J4trS034132;
 Mon, 1 Mar 2021 19:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=RKeBAojcUJF0SILifsv8uSO84GHG7mt4axoWBQeVDQ0=;
 b=fpCNL5JA8nXwQNak/kvxGJIi/5E3tnN1v3pYzT2MpFg6NAEN33hLA0RdJ+Nvzr7s3NV5
 dU9EIYLFRDA5+T5RfZjNwVTdUnCKQqYCBu47dFIZ1ayzPcV2/c+s2kEZMC+jQ2AGMWT0
 e7qBLaVjdIyWUv9/R+NYSCLwsnE8nnbQV4F64efG9O5JCsuxoc8MjWc7NG3BDLRd0GM6
 TEa+rXMRBFdkkSPb9L4HYtylmYtF+iIIqjFi7JOTcscrvCcOwJ/M/4wNAYT45/4E979I
 v7rrEv+S2xNf1TsEId8kc0iVKwrRQGQzIGeMIn1D1oHqZESepFaOrfEjfHCQ1qLPaa+v rA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 36ye1m50bn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 01 Mar 2021 19:04:55 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 121IsTfu136556;
 Mon, 1 Mar 2021 19:04:54 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
 by userp3020.oracle.com with ESMTP id 36yyuqykhc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 01 Mar 2021 19:04:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mPH3Fkr+Z3bpPWrh1vOJwxRafqA7iboh+8BMUkPZd2XRu0G7gOZDDkmwdnYUcLDSzRqFYc7bGsMK/vzQY493NNz36Q1gpQKE2KwJcxvxw58sDrc6aVjjuf/UlzedP1Fb5g3zKbWHxNbwfszb2EDS+vbGoBojVWTKCgqG4NCrWARj0Mmff8E88aQFfHofEeUXghyi4K2lEavTlt4z1zjeYh4CF5Y6QfAySEZPkQcafJ/pGj1n/TsivMVrgawDrQNzxKvbFKSDb2rJQVdIi8vDBiCZdq2wpBHcNWnlMqUq8X0ls0JCnGE9RzcAAfdSzlgI0s1hzfShbNejZ6BsTi3tBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKeBAojcUJF0SILifsv8uSO84GHG7mt4axoWBQeVDQ0=;
 b=ePWWE7HczUOnfQSHAFTTGuh2aGG99yoJkqq4OrthUPBcluEzAMSsSpJizhJmmdkA1EZ0E/hCcvhTXPThJ2lgs3ibmwrwHy2ZLq4n30VgdInXkJSxoM6a5x3snyQHpSPGqNMbVB4DYUXVIfp+TgGI63i6iZ4AnpvtjfQ1cCJWLRTElCdaXXP6ypmFVP5haPqulzWYPcV+lqukDCjesUD7iQ4o+TfVjJ+rYpT4tAnxKTln1A9zbOd0U/K3WmmcrKc04ozd9chZGKieJisLX8KG+kcJIuTrX4vN+8I7+weL4QhlMeduO21LAcb8Nho5ATnuT7WpAEoCkqCpM7XCiTnXpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKeBAojcUJF0SILifsv8uSO84GHG7mt4axoWBQeVDQ0=;
 b=agFBcU6LBcvL+jaPMF+fTf/BnadGQTelbB4hQ1BqpyQjmTDIpGFE0rPT+fvCobjL5ZETb3J9H3jv41aechNY4R5qO2fcsCPm78ElsoSerULqwuKz4RznUPd9gyeZlD9luiCCCguGOC331wP0v5Lkspav+2E7YuJVd7q/2ThEMfE=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR1001MB2063.namprd10.prod.outlook.com (2603:10b6:301:34::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.33; Mon, 1 Mar
 2021 19:04:50 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::1193:5eb7:7993:85a2]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::1193:5eb7:7993:85a2%7]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 19:04:50 +0000
From: Eric Devolder <eric.devolder@oracle.com>
To: "mst@redhat.com" <mst@redhat.com>, "imammedo@redhat.com"
 <imammedo@redhat.com>, "marcel.apfelbaum@gmail.com"
 <marcel.apfelbaum@gmail.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "rth@twiddle.net" <rth@twiddle.net>, "ehabkost@redhat.com"
 <ehabkost@redhat.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2 0/7] acpi: Error Record Serialization Table, ERST,
 support for QEMU
Thread-Topic: [PATCH v2 0/7] acpi: Error Record Serialization Table, ERST,
 support for QEMU
Thread-Index: AQHW/l0dCVff4wgjP0Kaws/mveeFjqpvnpo8
Date: Mon, 1 Mar 2021 19:04:50 +0000
Message-ID: <CO1PR10MB45315FB0B8E0A2938DD655F4979A9@CO1PR10MB4531.namprd10.prod.outlook.com>
References: <1612817879-21511-1-git-send-email-eric.devolder@oracle.com>
In-Reply-To: <1612817879-21511-1-git-send-email-eric.devolder@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [138.3.200.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 87609c59-71e0-43c3-dd1e-08d8dce4e39d
x-ms-traffictypediagnostic: MWHPR1001MB2063:
x-ms-exchange-minimumurldomainage: uefi.org#5845
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1001MB20636D8E6F6884707BCD8ED7979A9@MWHPR1001MB2063.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iW6jf9wKeV6YYTJLHdjZSU955D7OroDBgar84MMgnb9e7ApgBGwbU6ZZ576J3c1SAqQCt/7RR8siXtNQLbLQtnrMqfOmEiupQSZ/ndFBSxqhx45pJszv4rQpHaTZWrSMAk512TKt/0eScAs1vKU4lOxEQaQ+qIDLbaqnjRUGL1sh5L4YsW+/QN4g0Hn60jtBSmp0pP/CSVZ3LRqHn4KXtLvexsTfc2v0F/9VC9wgBtqGFn1p89TOVExZK7SooWYrhWW/VYLa3jni3SfrGWYVixeMDfZd+K6k8UG3v1LYezKpD5ZWGLyfaOL0uMy1BM9e5qgWT3+OR7tSTGhqh1UJoBt5FLXCkjGkqxFNxOeXSibpY1oVGXFTlY9XRYBj/6gyLU0lQuokaSt0m+Km/VwMHbnRh5kohB0OThJSnQ1GA92LURhiuemObw4BPLXQ8E9Yt9a1jaaBt4mIh6b7P669kyGIHkBliCXPyTG/q3i+dErzAoVvWuLGPUx7hfQQRWpuY/KEIER9LPYsuj2XVUUkDDeyV7HwMe7+vX9aCeayw7gepII+nFKqWhN810xsVOSQTQTHscV7ZuimxEfh4xIZjjyhPWYWIRNHFmtkTpNiEdU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(39860400002)(396003)(346002)(366004)(186003)(66556008)(8676002)(71200400001)(86362001)(66946007)(33656002)(110136005)(66476007)(76116006)(316002)(64756008)(966005)(5660300002)(26005)(44832011)(45080400002)(166002)(4326008)(55016002)(6506007)(107886003)(2906002)(83380400001)(9686003)(8936002)(54906003)(52536014)(19627405001)(478600001)(7696005)(66446008)(53546011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?X6yyeiMWtSP+V2ThguRDOnJMieZGHU8gZRQxcJzdxPQ9yD54l+5ca5GZKj7R?=
 =?us-ascii?Q?mlQbE+Bm3Cr2gxMyaOHDaOMNHQoTY4y5DCthW/L2uiH48chICdcXUJg2p7m2?=
 =?us-ascii?Q?9afPpY6ekzLY0qsYas5s0F6ZhDbOuVrXsyO/0TiwjjnxfPgNtbWFNpVsfX1W?=
 =?us-ascii?Q?NJw2Np4x1Ow8aShSYlVUVmmAJCmlLK6EWjl4X+raoYdWEStciD9EOmXPAdxQ?=
 =?us-ascii?Q?chyHH3nb0auwcVTXwq+/i3jJ129t1Pu9egCv48GW6JBNCWWzk2NfExpnURL0?=
 =?us-ascii?Q?XDeR9IZ5Ag3QFUft6T3UBVoUBHoaBSFiaKZZ+RjM4qBA9zQSuGvFay/hbera?=
 =?us-ascii?Q?/laZf4Fj5Ia5/hKj1ukSKyPT1ZPfADNtHa+kU77IqprBv8kB3oSs5kpqPnaZ?=
 =?us-ascii?Q?ReMcYLDKfto9xVumFBthVQZHLEdTo8l3mcK8pbXJCO8NhBl1r/C0LcnMsLS3?=
 =?us-ascii?Q?zvcIYeQAsQvlauBLf7o94G4WlFn7T0ZeIxpmHQyMxem8v7TfOV31UoqTJQsT?=
 =?us-ascii?Q?PrGMrsQS6lMP1reibOz8tDR/XxPsCcPHjwFNIxTGCtqLfTGQcNe700Mb1jF+?=
 =?us-ascii?Q?e9HKSF7R0UUSmKZ3TS3SyZeOC3+p2wIOTMX+7J96Ao4ZkY4tN24mpN0kl7Up?=
 =?us-ascii?Q?+ykeH5ZgOXxaKWUc6dm+2k5zi7YEtL/4pXT8Q+oXvWYWt0nfj2BSceKnzuFH?=
 =?us-ascii?Q?nWUxWU3IdkcARgoVaUG0Bc7l3zxvDieb8snCmlGiss2cZ303Iv41NdgboyVM?=
 =?us-ascii?Q?9mECZMRZcIVxAaOZiKbj6Dp+uCrS1jzopyM7i9v8wzOBhcKDDspsK9K0GfCT?=
 =?us-ascii?Q?DQZYc9CR2BXhnMUlmvKVKK7mjxGZIlYw1+aT6Hn9wvCyNGidpkDbw7eFSInb?=
 =?us-ascii?Q?Xq8HZj6jvvAVBdgbicWA2++VqHbGvZDnuOFwily1fTKC6CqZ+NpbHypbuMJm?=
 =?us-ascii?Q?TnRE6vJxtcKiEG9GIFBxs+TJjWh8Y7wewSOvkTL1G05K0vb/Og/jns0dogai?=
 =?us-ascii?Q?4llm4KopFdvZVdQHaHYyQHVpPg4HD71KJqxTioqJNHzFuYDwj8pFXFdPQ3V8?=
 =?us-ascii?Q?pkwzxCaWbeUPgDrJ9KsYjYCpCMlj5WmmaAwNebBtc86Uc2zR8QiUv6OAzo1u?=
 =?us-ascii?Q?0vD7E027yvBE88l0xz8noJRjGWOdQZpWM1a3vR8OA4bsALo69S7tPoebED9T?=
 =?us-ascii?Q?RGBsYhet3ekDxXD+Eop9H4OyF+/Zklbc0Fiw4rjL+SHqd4WhhBo84dMfHrZO?=
 =?us-ascii?Q?JDnY8rCSttk4X9ppjx0J0tnmm0gUMKhjKmGOND3S5+bEI8djuYji2L4E+3g6?=
 =?us-ascii?Q?eXs=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CO1PR10MB45315FB0B8E0A2938DD655F4979A9CO1PR10MB4531namp_"
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87609c59-71e0-43c3-dd1e-08d8dce4e39d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2021 19:04:50.0640 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4idJCid532kjhDctvMBknICstnkbkTnsJRHpUq7yTjdiH8pCbgKGLCzoIZL76geW4YfYzpEXYSF4L4L10CJ7RFkGTC6r3AXxyUtyfKBEBYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2063
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9910
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103010150
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9910
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 priorityscore=1501
 mlxlogscore=999 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 mlxscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103010151
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=eric.devolder@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "kwilk@oracle.com" <kwilk@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_CO1PR10MB45315FB0B8E0A2938DD655F4979A9CO1PR10MB4531namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
A friendly request to review and/or provide feedback on this patchset.
Thanks,
eric
________________________________
From: Eric Devolder <eric.devolder@oracle.com>
Sent: Monday, February 8, 2021 2:58 PM
To: mst@redhat.com <mst@redhat.com>; imammedo@redhat.com <imammedo@redhat.c=
om>; marcel.apfelbaum@gmail.com <marcel.apfelbaum@gmail.com>; pbonzini@redh=
at.com <pbonzini@redhat.com>; rth@twiddle.net <rth@twiddle.net>; ehabkost@r=
edhat.com <ehabkost@redhat.com>; qemu-devel@nongnu.org <qemu-devel@nongnu.o=
rg>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>; kwilk@oracle.com <kwilk@o=
racle.com>
Subject: [PATCH v2 0/7] acpi: Error Record Serialization Table, ERST, suppo=
rt for QEMU

This patchset introduces support for the ACPI Error Record
Serialization Table, ERST.

Linux uses the persistent storage filesystem, pstore, to record
information (eg. dmesg tail) upon panics and shutdowns.  Pstore is
independent of, and runs before, kdump.  In certain scenarios (ie.
hosts/guests with root filesystems on NFS/iSCSI where networking
software and/or hardware fails), pstore may contain the only
information available for post-mortem debugging.

Two common storage backends for the pstore filesystem are ACPI ERST
and UEFI. Most BIOS implement ACPI ERST; however, ACPI ERST is not
currently supported in QEMU, and UEFI is not utilized in all guests.
By implementing ACPI ERST within QEMU, then the ACPI ERST becomes a
viable pstore storage backend for virtual machines (as it is now for
bare metal machines).

Enabling support for ACPI ERST facilitates a consistent method to
capture kernel panic information in a wide range of guests: from
resource- constrained microvms to very large guests, and in
particular, in direct-boot environments (which would lack UEFI
run-time services).

Note that Microsoft Windows also utilizes the ACPI ERST for certain
crash information, if available.

The ACPI ERST persistent storage is contained within a single backing
file, with a default size of 64KiB. The size and filename of the
backing file can be obtained from QEMU parameters.

The ACPI specification[1], in Chapter "ACPI Platform Error Interfaces
(APEI)", and specifically subsection "Error Serialization", outlines
a method for storing error records into persistent storage.

[1] "Advanced Configuration and Power Interface Specification",
    version 6.2, May 2017.
    https://www.uefi.org/sites/default/files/resources/ACPI_6_2.pdf

[2] "Unified Extensible Firmware Interface Specification",
    version 2.8, March 2019.
    https://uefi.org/sites/default/files/resources/UEFI_Spec_2_8_final.pdf

Suggested-by: Konrad Wilk <konrad.wilk@oracle.com>
Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>

---
v2: 8feb2021
 - Added qtest/smoke test per Paolo Bonzini
 - Split patch into smaller chunks, per Igo Mammedov
 - Did away with use of ACPI packed structures, per Igo Mammedov

v1: 26oct2020
 - initial post

---
Eric DeVolder (7):
  ACPI ERST: bios-tables-test.c steps 1 and 2
  ACPI ERST: header file for erst
  ACPI ERST: support for ACPI ERST feature
  ACPI ERST: build step for ACPI ERST
  ACPI ERST: support ERST for x86 guest
  ACPI ERST: qtest for ERST
  ACPI ERST: bios-tables-test.c step 5

 hw/acpi/erst.c               | 952 +++++++++++++++++++++++++++++++++++++++=
++++
 hw/acpi/meson.build          |   1 +
 hw/i386/acpi-build.c         |   4 +
 include/hw/acpi/erst.h       |  77 ++++
 tests/data/acpi/microvm/ERST |   0
 tests/data/acpi/pc/ERST      | Bin 0 -> 976 bytes
 tests/data/acpi/q35/ERST     | Bin 0 -> 976 bytes
 tests/qtest/erst-test.c      | 106 +++++
 tests/qtest/meson.build      |   2 +
 9 files changed, 1142 insertions(+)
 create mode 100644 hw/acpi/erst.c
 create mode 100644 include/hw/acpi/erst.h
 create mode 100644 tests/data/acpi/microvm/ERST
 create mode 100644 tests/data/acpi/pc/ERST
 create mode 100644 tests/data/acpi/q35/ERST
 create mode 100644 tests/qtest/erst-test.c

--
1.8.3.1


--_000_CO1PR10MB45315FB0B8E0A2938DD655F4979A9CO1PR10MB4531namp_
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
Hi,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
A friendly request to review and/or provide feedback on this patchset.</div=
>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
eric<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Eric Devolder &lt;eri=
c.devolder@oracle.com&gt;<br>
<b>Sent:</b> Monday, February 8, 2021 2:58 PM<br>
<b>To:</b> mst@redhat.com &lt;mst@redhat.com&gt;; imammedo@redhat.com &lt;i=
mammedo@redhat.com&gt;; marcel.apfelbaum@gmail.com &lt;marcel.apfelbaum@gma=
il.com&gt;; pbonzini@redhat.com &lt;pbonzini@redhat.com&gt;; rth@twiddle.ne=
t &lt;rth@twiddle.net&gt;; ehabkost@redhat.com &lt;ehabkost@redhat.com&gt;;
 qemu-devel@nongnu.org &lt;qemu-devel@nongnu.org&gt;<br>
<b>Cc:</b> Boris Ostrovsky &lt;boris.ostrovsky@oracle.com&gt;; kwilk@oracle=
.com &lt;kwilk@oracle.com&gt;<br>
<b>Subject:</b> [PATCH v2 0/7] acpi: Error Record Serialization Table, ERST=
, support for QEMU</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">This patchset introduces support for the ACPI Erro=
r Record<br>
Serialization Table, ERST.<br>
<br>
Linux uses the persistent storage filesystem, pstore, to record<br>
information (eg. dmesg tail) upon panics and shutdowns.&nbsp; Pstore is<br>
independent of, and runs before, kdump.&nbsp; In certain scenarios (ie.<br>
hosts/guests with root filesystems on NFS/iSCSI where networking<br>
software and/or hardware fails), pstore may contain the only<br>
information available for post-mortem debugging.<br>
<br>
Two common storage backends for the pstore filesystem are ACPI ERST<br>
and UEFI. Most BIOS implement ACPI ERST; however, ACPI ERST is not<br>
currently supported in QEMU, and UEFI is not utilized in all guests.<br>
By implementing ACPI ERST within QEMU, then the ACPI ERST becomes a<br>
viable pstore storage backend for virtual machines (as it is now for<br>
bare metal machines).<br>
<br>
Enabling support for ACPI ERST facilitates a consistent method to<br>
capture kernel panic information in a wide range of guests: from<br>
resource- constrained microvms to very large guests, and in<br>
particular, in direct-boot environments (which would lack UEFI<br>
run-time services).<br>
<br>
Note that Microsoft Windows also utilizes the ACPI ERST for certain<br>
crash information, if available.<br>
<br>
The ACPI ERST persistent storage is contained within a single backing<br>
file, with a default size of 64KiB. The size and filename of the<br>
backing file can be obtained from QEMU parameters.<br>
<br>
The ACPI specification[1], in Chapter &quot;ACPI Platform Error Interfaces<=
br>
(APEI)&quot;, and specifically subsection &quot;Error Serialization&quot;, =
outlines<br>
a method for storing error records into persistent storage.<br>
<br>
[1] &quot;Advanced Configuration and Power Interface Specification&quot;,<b=
r>
&nbsp;&nbsp;&nbsp; version 6.2, May 2017.<br>
&nbsp;&nbsp;&nbsp; <a href=3D"https://www.uefi.org/sites/default/files/reso=
urces/ACPI_6_2.pdf">https://www.uefi.org/sites/default/files/resources/ACPI=
_6_2.pdf</a><br>
<br>
[2] &quot;Unified Extensible Firmware Interface Specification&quot;,<br>
&nbsp;&nbsp;&nbsp; version 2.8, March 2019.<br>
&nbsp;&nbsp;&nbsp; <a href=3D"https://uefi.org/sites/default/files/resource=
s/UEFI_Spec_2_8_final.pdf">
https://uefi.org/sites/default/files/resources/UEFI_Spec_2_8_final.pdf</a><=
br>
<br>
Suggested-by: Konrad Wilk &lt;konrad.wilk@oracle.com&gt;<br>
Signed-off-by: Eric DeVolder &lt;eric.devolder@oracle.com&gt;<br>
<br>
---<br>
v2: 8feb2021<br>
&nbsp;- Added qtest/smoke test per Paolo Bonzini<br>
&nbsp;- Split patch into smaller chunks, per Igo Mammedov<br>
&nbsp;- Did away with use of ACPI packed structures, per Igo Mammedov<br>
<br>
v1: 26oct2020<br>
&nbsp;- initial post<br>
<br>
---<br>
Eric DeVolder (7):<br>
&nbsp; ACPI ERST: bios-tables-test.c steps 1 and 2<br>
&nbsp; ACPI ERST: header file for erst<br>
&nbsp; ACPI ERST: support for ACPI ERST feature<br>
&nbsp; ACPI ERST: build step for ACPI ERST<br>
&nbsp; ACPI ERST: support ERST for x86 guest<br>
&nbsp; ACPI ERST: qtest for ERST<br>
&nbsp; ACPI ERST: bios-tables-test.c step 5<br>
<br>
&nbsp;hw/acpi/erst.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 952 +++++++++++++++++++++++++++++++++++++++=
++++<br>
&nbsp;hw/acpi/meson.build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; |&nbsp;&nbsp; 1 +<br>
&nbsp;hw/i386/acpi-build.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp; 4 +<br>
&nbsp;include/hw/acpi/erst.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 77=
 ++++<br>
&nbsp;tests/data/acpi/microvm/ERST |&nbsp;&nbsp; 0<br>
&nbsp;tests/data/acpi/pc/ERST&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 0 -&gt; 9=
76 bytes<br>
&nbsp;tests/data/acpi/q35/ERST&nbsp;&nbsp;&nbsp;&nbsp; | Bin 0 -&gt; 976 by=
tes<br>
&nbsp;tests/qtest/erst-test.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 106 +++++<br>
&nbsp;tests/qtest/meson.build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2=
 +<br>
&nbsp;9 files changed, 1142 insertions(+)<br>
&nbsp;create mode 100644 hw/acpi/erst.c<br>
&nbsp;create mode 100644 include/hw/acpi/erst.h<br>
&nbsp;create mode 100644 tests/data/acpi/microvm/ERST<br>
&nbsp;create mode 100644 tests/data/acpi/pc/ERST<br>
&nbsp;create mode 100644 tests/data/acpi/q35/ERST<br>
&nbsp;create mode 100644 tests/qtest/erst-test.c<br>
<br>
-- <br>
1.8.3.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_CO1PR10MB45315FB0B8E0A2938DD655F4979A9CO1PR10MB4531namp_--

