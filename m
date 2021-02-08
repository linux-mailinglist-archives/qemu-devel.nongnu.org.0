Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F97314507
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 01:43:46 +0100 (CET)
Received: from localhost ([::1]:42298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9H83-0004vP-AW
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 19:43:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1l9Dlo-0003K6-FK
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 16:08:33 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:34562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1l9Dlj-0007Ep-JD
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 16:08:32 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 118L05RW062105;
 Mon, 8 Feb 2021 21:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=zIe8yaZU2XWw0tpfSbBhDqSn8ImZ86YgOJfVWgIQqf4=;
 b=ODaHWA8wM96tXQI7rNNyNeZ8C3mIgbR/DPQOiLchAl8J34SP0EeOxN7E9UtW+7x7Y6lP
 zx9JSj0ITllt/UztbiWjpxx7YSZCIRFQ1W9Lix7HBRV3NoPyVjVjvUZSfhMg+HHw72wF
 LeaISMaYLDh2Ieoi+JI4sjy/vq0gYWPEacIIMbvOuy76LA4jGkdaIapyV1eojMtcvjzK
 DYFf4wuMWCmwP0/ugo3ubyJ0e+/eJ94jSWJV7IG6lefjW2BJpixRZy7q6Covi0nd0cpZ
 +t27s/pPYmHfDby4hFSShOKK5xHV3gIXJ1GGdxbx/GlD0xC0dKHdN7BknrKQaeKvDGVZ 0g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 36hgmadh8g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Feb 2021 21:08:24 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 118L1ZSS006708;
 Mon, 8 Feb 2021 21:08:24 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
 by aserp3020.oracle.com with ESMTP id 36j510beaw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Feb 2021 21:08:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gTPyovWlRUk2FxC9o+Fofv+jrstBhE8wF69wsgmI8yqqmJm6jjlRa8boFhBDnWpIxlTf4tCqIWQK/twyAiUgURGMDP6LuWJ/U7aqI/D6iQ3fcou6eFMXcxpTe8jV74GhRatCuSu8386uQ7gD4Z8f+u9PU2dLmqyyqP1kAHr7QNVo9YH8bwZj50Bxg3fZNy1Uas2Cf5sRrQjQ0l0E4LaoAO0TlpF1x+M6M7TGlWs28bJrVnNs/j18gFjltoial28qO1RJk5713veDIFhmQoKeRUJTrtNuQoD86UgGbZO2WgH8FurdNmYYz73GYuOx5gw/w5DpAoY6TD9NYkeeF+UB2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zIe8yaZU2XWw0tpfSbBhDqSn8ImZ86YgOJfVWgIQqf4=;
 b=OXe2zDanPFD8zXTf+jVu14damP93krk2Jqb5hPTV5MSsjgzouX0V4gWz0qwSxJQGPN7UtttsEwjHzakUEoK4svnYAEijzzbhWi2S2K5q5RR56Br/18ZFISj06v2yy3n+GLfOO+sAw+mGTOYIidKLBVob8RgCVWo6yGXMNmnMfiiZa7hSxRVFaK3d3DM+rm9mPGMitVT6uITH2aBFttLRbj2++4mVU3lHKJN3ypiTql2Arx3Vi/viJiYkYLpce5BCLo24kYKm5Nep9EP91X79iWvc7qpSJ2vConW7dWwW3feYjaz1UI2u/VonVl0vGTspAfKO8CxsP0MacBGTbDgoVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zIe8yaZU2XWw0tpfSbBhDqSn8ImZ86YgOJfVWgIQqf4=;
 b=PSTaZjObZkddafsWoR/qxkf6vFz5ZrNaqVbnI2g+habk7JXxAHSiVpVWjiNowTYOlhfdLdnAzs38TJk/qRgG/4mS9joOM+e9v9VoJuElyAeW9COOgDy8aZsZa/KYsGu09yszGbIe5nSS+7nsAfoeBeO9UC92stNjKTXtwGUAl9Y=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB4562.namprd10.prod.outlook.com (2603:10b6:303:93::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.24; Mon, 8 Feb
 2021 21:08:22 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::1193:5eb7:7993:85a2]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::1193:5eb7:7993:85a2%7]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 21:08:21 +0000
From: Eric Devolder <eric.devolder@oracle.com>
To: Paolo Bonzini <pbonzini@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH 1/1] acpi: Implement ACPI ERST support for guests
Thread-Topic: [PATCH 1/1] acpi: Implement ACPI ERST support for guests
Thread-Index: AQHWyWtwObTZgXXj1U2d2bZrgo5YbKpPKgHA
Date: Mon, 8 Feb 2021 21:08:21 +0000
Message-ID: <CO1PR10MB4531F2F149E16CEA6EFB1A9F978F9@CO1PR10MB4531.namprd10.prod.outlook.com>
References: <1603743573-9870-1-git-send-email-eric.devolder@oracle.com>
 <1603743573-9870-2-git-send-email-eric.devolder@oracle.com>,9833186.69653
In-Reply-To: 9833186.69653
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [138.3.200.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 21d28a02-e49f-46b1-06eb-08d8cc75aab2
x-ms-traffictypediagnostic: CO1PR10MB4562:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR10MB45621E530A6646AED20F0280978F9@CO1PR10MB4562.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rIcghYu8Q68+dKZZbTHeEofnZ4RsKiUZVxHmoqqY6wIhXWmgFtvaT4qSEAbvNV9X96E9gAVML5tqYq0pvhvExGC6h8u53RloE1z4JM/vUMIPn7NxrMnqloUglUeyJgnzrO1+d0+shJNp0DVg+JTBMPTRPG8FPAqN1kOGzYfQNAPBR/utYCRXn1/4spMt1vYa1pxnYsEYhjfXj2Y6qmxXbJu2j/+jE7MMB5JyGattlOAKk5u6Nat5q3c8LdAO7G1PpoWQgr6MsnCGYgf6Typr2jqT+nikQPtyuSas5q/xgA24sZ+YMYaJTYs+hV/J2GVi2f7M/t7KqdvxxqHwK4BPAdGeAUVp1mpOAVHXxzxcr2lxJwR8L5MsG6FE8eSajxTFkG/oCFd9NGzuq5c1HhqKSqHPYjbG1eqCVwFMADIq/K9WjCUm1TFhXMLLGUNGF7EuxRDMz2KtfQgwn34l6Cm5IcIxKAyTBtaP03qpSNVu/oqJLA9DP545HcYvxESTEm9eQBO1u8JrlQB/G6HpEeN6LXZJOrzF88By1zIg51rHMxEMObFBGc8/Pvhds33j8d4b58lmYQWdB9hQ4vI3MDUkbexInnAyAVKVDflu3xkWyIM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(376002)(396003)(136003)(366004)(52536014)(478600001)(76116006)(7696005)(2906002)(4326008)(86362001)(55016002)(966005)(19627405001)(186003)(66556008)(166002)(66946007)(8936002)(91956017)(33656002)(6506007)(9686003)(53546011)(26005)(44832011)(107886003)(54906003)(110136005)(66446008)(71200400001)(8676002)(66476007)(64756008)(5660300002)(83380400001)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?/y1lb4DMFseKd5e8Vwuafdda9/lA6NH0JVEoF1gSGpg825Z1OsTVtdX3RJrk?=
 =?us-ascii?Q?ix7Uv9lFi3a0Xrh4BH7awLEjg0zjOOex/K/JOm64aOAB6ONLEqbXpwVk524P?=
 =?us-ascii?Q?ICGLEEBAGoeptribBQQfhgQw6QepgzYtjSj2dCP14HOH0xDGbJzQiATWutZc?=
 =?us-ascii?Q?8ajuyYCE7e7C770aFoP0KcVADO1v6htlTc5f0byGBw0E0fgirLnRHCTd2bOr?=
 =?us-ascii?Q?p6tex2L8BHslY/BizgxEhxHMj8CygcsXiHBFjW0DEnLTqYezrWKvgHeW/28A?=
 =?us-ascii?Q?cttgjIlgvCprkWYkCXO+gDTGuES7Z2t3pbSx68oM41/jFRwm+gnvSZYJX8mQ?=
 =?us-ascii?Q?k92NzkB8km5vfw/qlPEHIi9cKLx8cDVRoqavzg8JuHcfkzaB+xMfx6RcrBmL?=
 =?us-ascii?Q?R95Q6ue157Q4+LgUbhYjCIA/6t4LHVIj+m9+YXR+8OUEWEvcNJxfnsWIBarq?=
 =?us-ascii?Q?JkF98iT8iPKLzS3E913q7x98e0hZPZpllXAHzmUh8X16gq8vbjPxQ4RHOjPV?=
 =?us-ascii?Q?pzIchEhKv7YgfaELaaidOem2gPe0nsCtxgAOw0faqfAhApgwwvH7xcp3oRDr?=
 =?us-ascii?Q?Cr/a2ykQXfMz5GMrtixa2eFzTyrIC6s5P2CKORrMhRO4BRmIsr491N/mcYSy?=
 =?us-ascii?Q?gc4JcCuLrAzIDvK4ZEqxWEqnELZF5tbgk0zBzu2OP1Ww4g+klrkS6wzd+cim?=
 =?us-ascii?Q?q10A+uYjugSXaduuViPsG6C53QR8B84KC94dfg6cfr1YsdDb2HOfnHWrDWps?=
 =?us-ascii?Q?KZk09vJNyGPorFHD3JgqnmtZPo52duoszXYSz7KYVSvzK8HVqUQk9jvUe9Ny?=
 =?us-ascii?Q?lXICvjxERBKpZ42rFJtHSHkvC1VDbooKdrLISnfQzEBIEdnN1U8nqLZ5BeN3?=
 =?us-ascii?Q?zi56ZEX7IDXXyAwCFlMlFqiT+4YKzXkBPfTeJVcgwczJW2wED3a75rL8WRkd?=
 =?us-ascii?Q?CREkxNhUCO7j2M+yljg/BPM/CBtiHjLb5RguV+8dfQYVRYwwsItE20Iznif+?=
 =?us-ascii?Q?Cv9OsqaRGfqUvDNsRYi4QFDx3s9fwtIRCcCwA6j2Ryuoa8YEtnML+B+YXr0v?=
 =?us-ascii?Q?EAZ/WovgzcSEiNfQc/x3Mm+oKgFmyuVQsVlyfMvjBszaWi3PkXIcE88zR9Is?=
 =?us-ascii?Q?TGLDlITPbDXjmfoIgFma0QRp2S7Cii+4HFDqRBLbPsAgSy7HNv/Oos0RBcMR?=
 =?us-ascii?Q?fE+JuJTWRN3SG7sI4uE+y/lNhKC6g6tfv3yceaihDv24s4Sk3Lvxrpf6BU5W?=
 =?us-ascii?Q?zz07oBC1UaqOpvUi6+YPK95DOyJtu4WWW6CdyuWvOUFCLCeG2M9VwT7r//zP?=
 =?us-ascii?Q?ua0=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CO1PR10MB4531F2F149E16CEA6EFB1A9F978F9CO1PR10MB4531namp_"
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21d28a02-e49f-46b1-06eb-08d8cc75aab2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2021 21:08:21.8604 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JENYahMp3n1Y5ezDukYsnqAQP3FxgGlSTRnmtahhLzxW2fY+dWBg8OzDNM+VF668gPqEqprH1js6l6aDUckB9vlDeTZam6UzE8yklrKlKXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4562
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102080120
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102080120
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=eric.devolder@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
 Konrad Wilk <konrad.wilk@oracle.com>, "mst@redhat.com" <mst@redhat.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_CO1PR10MB4531F2F149E16CEA6EFB1A9F978F9CO1PR10MB4531namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Paolo,
Thanks for the feedback. I've posted v2 with changes based on Igor's feedba=
ck.
I've also included a qtest per your feedback.
Eric

________________________________
From: Paolo Bonzini <pbonzini@redhat.com>
Sent: Tuesday, November 3, 2020 3:16 PM
To: Eric DeVolder <eric.devolder@oracle.com>; qemu-devel@nongnu.org <qemu-d=
evel@nongnu.org>
Cc: mst@redhat.com <mst@redhat.com>; imammedo@redhat.com <imammedo@redhat.c=
om>; marcel.apfelbaum@gmail.com <marcel.apfelbaum@gmail.com>; rth@twiddle.n=
et <rth@twiddle.net>; ehabkost@redhat.com <ehabkost@redhat.com>; konrad.wil=
k@oracle.com <konrad.wilk@oracle.com>; boris.ostrovsky@oracle.com <boris.os=
trovsky@oracle.com>
Subject: Re: [PATCH 1/1] acpi: Implement ACPI ERST support for guests

On 26/10/20 21:19, Eric DeVolder wrote:
> This changeset introduces support for the ACPI Error Record
> Serialization Table, ERST.
>
> ERST is defined in [1], and the error records are defined
> according to [2].
>
> This changeset generates the ACPI ERST table, which OSPM
> follows to program the associated ERST device. The ERST
> device occupies 8KiB of address space, with the first 8 bytes
> containing registers, and the remainder being an exchange
> buffer for reading/writing error records.
>
> The ERST device contains two registers, ACTION and VALUE
> registers, following closely the ERST operations.
>
> The ERST device only examines the record for the signature 'CPER',
> its record identifier, and bounds-checks the length against the size
> of the the CPER record header; otherwise all other record fields
> and payload are ignored.
>
> There are two options for this device:
>   -global acpi-erst.size=3DX
>   -global acpi-erst.filename=3DY
> The size X, if not specified, defaults to 64KiB, and must be within
> 64KiB and 1MiB.
> The filename Y, if not specified, defaults to "acpi-erst.backing".
> The ERST backing storage is not mapped into the guest address space,
> just the 8KiB programming area is mapped into the guest.
>
> This has been utilized as a backend for the Linux pstore feature.
>
> [1] ACPI 6.3 Specification, 18.3 Error Serialization
>      https://uefi.org/sites/default/files/resources/ACPI_6_3_final_Jan30.=
pdf
>
> [2] UEFI 2.8 Specification, Appendix N Common Platform Error Record
>      https://uefi.org/sites/default/files/resources/UEFI_Spec_2_8_final.p=
df

In addition to what Igor said, this really needs a test for the device
(using qtest).  It doesn't have to be super fine-grained, but at least a
smoke test that the action and value registers do what they mean for a
sample error recording operation.

Paolo


--_000_CO1PR10MB4531F2F149E16CEA6EFB1A9F978F9CO1PR10MB4531namp_
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
Paolo,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks for the feedback. I've posted v2 with changes based on Igor's feedba=
ck.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I've also included a qtest per your feedback.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Eric</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Paolo Bonzini &lt;pbo=
nzini@redhat.com&gt;<br>
<b>Sent:</b> Tuesday, November 3, 2020 3:16 PM<br>
<b>To:</b> Eric DeVolder &lt;eric.devolder@oracle.com&gt;; qemu-devel@nongn=
u.org &lt;qemu-devel@nongnu.org&gt;<br>
<b>Cc:</b> mst@redhat.com &lt;mst@redhat.com&gt;; imammedo@redhat.com &lt;i=
mammedo@redhat.com&gt;; marcel.apfelbaum@gmail.com &lt;marcel.apfelbaum@gma=
il.com&gt;; rth@twiddle.net &lt;rth@twiddle.net&gt;; ehabkost@redhat.com &l=
t;ehabkost@redhat.com&gt;; konrad.wilk@oracle.com &lt;konrad.wilk@oracle.co=
m&gt;;
 boris.ostrovsky@oracle.com &lt;boris.ostrovsky@oracle.com&gt;<br>
<b>Subject:</b> Re: [PATCH 1/1] acpi: Implement ACPI ERST support for guest=
s</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 26/10/20 21:19, Eric DeVolder wrote:<br>
&gt; This changeset introduces support for the ACPI Error Record<br>
&gt; Serialization Table, ERST.<br>
&gt; <br>
&gt; ERST is defined in [1], and the error records are defined<br>
&gt; according to [2].<br>
&gt; <br>
&gt; This changeset generates the ACPI ERST table, which OSPM<br>
&gt; follows to program the associated ERST device. The ERST<br>
&gt; device occupies 8KiB of address space, with the first 8 bytes<br>
&gt; containing registers, and the remainder being an exchange<br>
&gt; buffer for reading/writing error records.<br>
&gt; <br>
&gt; The ERST device contains two registers, ACTION and VALUE<br>
&gt; registers, following closely the ERST operations.<br>
&gt; <br>
&gt; The ERST device only examines the record for the signature 'CPER',<br>
&gt; its record identifier, and bounds-checks the length against the size<b=
r>
&gt; of the the CPER record header; otherwise all other record fields<br>
&gt; and payload are ignored.<br>
&gt; <br>
&gt; There are two options for this device:<br>
&gt;&nbsp;&nbsp; -global acpi-erst.size=3DX<br>
&gt;&nbsp;&nbsp; -global acpi-erst.filename=3DY<br>
&gt; The size X, if not specified, defaults to 64KiB, and must be within<br=
>
&gt; 64KiB and 1MiB.<br>
&gt; The filename Y, if not specified, defaults to &quot;acpi-erst.backing&=
quot;.<br>
&gt; The ERST backing storage is not mapped into the guest address space,<b=
r>
&gt; just the 8KiB programming area is mapped into the guest.<br>
&gt; <br>
&gt; This has been utilized as a backend for the Linux pstore feature.<br>
&gt; <br>
&gt; [1] ACPI 6.3 Specification, 18.3 Error Serialization<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"https://uefi.org/sites/defaul=
t/files/resources/ACPI_6_3_final_Jan30.pdf">
https://uefi.org/sites/default/files/resources/ACPI_6_3_final_Jan30.pdf</a>=
<br>
&gt; <br>
&gt; [2] UEFI 2.8 Specification, Appendix N Common Platform Error Record<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"https://uefi.org/sites/defaul=
t/files/resources/UEFI_Spec_2_8_final.pdf">
https://uefi.org/sites/default/files/resources/UEFI_Spec_2_8_final.pdf</a><=
br>
<br>
In addition to what Igor said, this really needs a test for the device <br>
(using qtest).&nbsp; It doesn't have to be super fine-grained, but at least=
 a <br>
smoke test that the action and value registers do what they mean for a <br>
sample error recording operation.<br>
<br>
Paolo<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_CO1PR10MB4531F2F149E16CEA6EFB1A9F978F9CO1PR10MB4531namp_--

