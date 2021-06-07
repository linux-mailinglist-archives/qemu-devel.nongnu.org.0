Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB3E39E8D8
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 23:04:35 +0200 (CEST)
Received: from localhost ([::1]:52440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqMQD-0006U5-WA
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 17:04:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lqMP1-0005mx-KY
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 17:03:19 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:23802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lqMOw-0007ia-OW
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 17:03:19 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 157KvdkI012778; Mon, 7 Jun 2021 21:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=382xO1BJM5URGSiPbwmIfmmjfhrN3W7xjsTrXNxPOww=;
 b=QfquPGO42Q9z1jTVamH82dhQ+vAHj3FAVTnYgWdmJwLTbz12MkqP1LjMm8N8xz+PKPu3
 4+gker9lsWYNlof4d0cAAdGKFqZsyu2HId4YrrjZw2D3AdMyv0bVtXXyi3dlRCk+FvTc
 Ztgf/rBnmqjOdWdJx8iMSewBS3TtFkq3UouhOyb0WrBUXEUxouqXzM7+3A+RyqNCSHWE
 thusnMD5UHZ8ETW6FI5gchq0707qBbdNdnZCq+PDSm4V/D6uKm0WewX12Qn89Of4rYD1
 EIkufuEBjdTfktAL/1G1u0ZBN2T6QE0JTD7f5n3wRm/FVAUvBuOJv9WvUuX5vq/kFSjw hw== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3917pwgcph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Jun 2021 21:03:10 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 157KwS7Y041425;
 Mon, 7 Jun 2021 21:03:09 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
 by userp3030.oracle.com with ESMTP id 38yxcu5rn4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Jun 2021 21:03:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NcsEiCyk4qf6rnnUhaO/64YuN7wThQRopm4XFqY/exjAkZOkli5n7/sYzx1KdA/kZchBDMh2DSMhqWp6zVKQb1Sa5WSRyG8HBdiccKcKozw8KMWgD6de41Fz/a2FNATRJENC6t4wTwOIsD6Ukk/EAL8dTI9ldK3HbPV9MIea24ekxIEW3H0VE4c0Pg+YO+edYgB/xWgZocs1M/l51YnQvFG3Zpw0HUFvESLYOj2CeLhNiq3YQrpggGGraK+3q/WoHpibEHqzvGiptodmdyNZ1iworoyEMjuzytt+qw8dDypDQbLTAeJw83CRbHQwZ1ZfVnqu5IdzqKXC4y5KgJ+NQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=382xO1BJM5URGSiPbwmIfmmjfhrN3W7xjsTrXNxPOww=;
 b=VdAreI2BrQnHDQlU8HiCpmGR4AUMX6qegDs5byCr2b9QAIka+ctv2phndj3ti7D6goiu2viSD2kWzcJ8ZaUbppM7jM1/94E0NeByB/lVpNCWAJhE69Wc8O1nlOi7P0FTC86h2xG8kAqGupj2n0IFprCztO+k34rzxraR+58FTbzfJ1CpVWo99FsUbp6uaqD8ZOrO3b/PwaMUHAmYbBAulmldJrHWSLdlb+UUTgyJxk3MRk6u/uGt5up2oCoJ1nk3LFVN95iwMUvhhuN+gniCvZqUO4hlQg83HAVdZlVSaWWe8GGFoDXfI1lfAtQAfvh6UJzhHWKuQPprsJPQ3R9o4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=382xO1BJM5URGSiPbwmIfmmjfhrN3W7xjsTrXNxPOww=;
 b=po0JhLBHi4U8GmeJA2oJuyaRekK55ZolZXDKsEbcH4dCh1qF5WA44+mkeOT7uaMurE3dvDtVjBfvlNUUcsfiqL9OY1eHd5LHYBZNAihsj1U9r+si7/dJj0NWrodpeQEGBhVG/JYdSbqBA4n0FhqwVHEBwp8l3bj8Z6r9h/LxM3I=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR1001MB2063.namprd10.prod.outlook.com (2603:10b6:301:34::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.30; Mon, 7 Jun
 2021 21:03:06 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc%7]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 21:03:06 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v3 0/7] acpi: Error Record Serialization Table, ERST,
 support for QEMU
Thread-Topic: [PATCH v3 0/7] acpi: Error Record Serialization Table, ERST,
 support for QEMU
Thread-Index: AQHXU+1K1MWO0uUa1UaYo1SgFby41KsIj2WAgACI24Q=
Date: Mon, 7 Jun 2021 21:03:06 +0000
Message-ID: <CO1PR10MB4531BD9AC25B8A64611702E997389@CO1PR10MB4531.namprd10.prod.outlook.com>
References: <1622225659-16847-1-git-send-email-eric.devolder@oracle.com>,
 <20210607144959.65b4c5a6@redhat.com>
In-Reply-To: <20210607144959.65b4c5a6@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [138.3.201.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d8bd7b7-e712-41b0-2c60-08d929f7a5ee
x-ms-traffictypediagnostic: MWHPR1001MB2063:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1001MB2063E1ECC6F6AE554816264397389@MWHPR1001MB2063.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fcJdaNtEu0Jbsf+R8Kw2V/urxsbSkJwqdTc1gojQ0PYM261VdoKPw+auazTc2SyWSV1/cxJz4CEmBNf0V87o3Ok21CBT7zKc9dckpwO9dJh8P27bMYUU35+j9oeTBxF8sgopzZDNpe04cu6WoIt7wFCLlacrSMLRbT+JMAk3UR82h14mXK+EKDOuH2vTkJ8R/ZkvGsRWkkv4v48MU4anLqLUUiUQls5lZdTzB8U4/SNDwGsc/2nYjDvES+PKEQ6at0cUVz+iJriLk6V6FHHAS5cd/3OG77HUlq5E3/dCzQNdiCxyNetlN24/j+x8Yr1kpVp/L83CgpCDOznrHOQAZO9prbYqXsOscKU6r+ia4cpEb0cnlkb3TJCzPNHczyqd/40p1nnWqgKz3RA1i4DItuAIGz4/jBL0CWJDVuzTUYaxF3YvRR09wsa40bz5fB+5XMwdhOxs0jbjuLsz0PB3iWX5Ko22n7USMrWySf3K3Tq1nW28rjItS7GnH9FYrL7YcjeNo7SdOj2azuZ8qEAov5JaoKZk/EruyJT9Os8H0I91EI05gRaKCpEY/DiJZK7knudva71pqxGUv7mh7T5ZR2K0viYuEoy8EZiszRmFSmtxkpOwEVzFfbgT0KQ3rsX1GcM4y1rL/RA4eKXHAU+qxXGh+laAelY8dKGWklN5A9vyZqZy7EjOndrOHNsOmwgrgrVOJmPsDKczQOSuIqffSOSydhxN+HxpH2OQpCqOpOAY2tx8T7bYiTgI8JkjU08y
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(39860400002)(136003)(346002)(366004)(45080400002)(66556008)(83380400001)(5660300002)(55016002)(64756008)(54906003)(66446008)(2906002)(33656002)(86362001)(7696005)(53546011)(122000001)(186003)(26005)(52536014)(4326008)(38100700002)(6506007)(66476007)(71200400001)(9686003)(8676002)(107886003)(8936002)(76116006)(66946007)(478600001)(19627405001)(166002)(316002)(966005)(6916009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?t4t2kV3cBzLFc9F85RU0fOtKQQ76KbHG8+YK2RfWVdJTecXxc0+PfbaNri?=
 =?iso-8859-1?Q?yqpO2tyBDMJ0jQlfKSjzGOwJ+9idbLoTKqEuedTgX7lRCzM4CMcQjVb1bg?=
 =?iso-8859-1?Q?Dw9RvcARuLmV7p/v7uIHb64NlnQei6Z7zwYeyRKUaqnZ4xp6oTHnX3XHCo?=
 =?iso-8859-1?Q?20oFJqi8NH/OjzwHQGhRZ/PUz48fsdhpXiSaArGoKFyQbpeyihjCUDNyMX?=
 =?iso-8859-1?Q?oKktzvRQYcWSlQFeUHTIfXQqIPwypHsOzD1NCNJa14niNGzWMubkMYkWQL?=
 =?iso-8859-1?Q?TxoNRugIsrJeR5PnD3cRnJKuDwBA8HuwN5q1NrKv9SGxLv+BefPyLakTfO?=
 =?iso-8859-1?Q?4ml9yw/t+rxx/iuvAOhNEDKie4d+HP94IIsdv7+PHSR2z79av//UuyHkeB?=
 =?iso-8859-1?Q?3l4uPXKL7FvDIO+nyeOF9FuyhIb1Ixi4+7J6o/diH/hLURBRpGflBMfKa0?=
 =?iso-8859-1?Q?vBx6+q2Uh9CmphnrABE3uWhRuwWfnJxzq/DFXLCkLgdd1Bj5qsQcFp03mf?=
 =?iso-8859-1?Q?C6zqThmguzQb1btteSXydQjY8RqQ4vjLAT4X28F7INW2RK1u16sKdHOI0x?=
 =?iso-8859-1?Q?GhIxeTaqm1P/48uhBb9fdtU7elERqpde0OiVO34runNfQ6iGLDvhkw+R3H?=
 =?iso-8859-1?Q?XOdujIvMbgYbv5m16Jp6sCx4HrHoRsPuGkw6AJnwqpyciygmQuETr7Wvlm?=
 =?iso-8859-1?Q?fWGbSkZTVfA3cf9s/MJqMG4kN5CEu3SJ/KuYektcmZ1ahCCUbl8sln9P3w?=
 =?iso-8859-1?Q?lJPgaftO0ry1d2iDsDaijMw7R8Qz62LPPyADPYAFCWUqBNo/9fFyQl4a2P?=
 =?iso-8859-1?Q?savORj+IAfozdD3lOTDgzAmTIu3og7ITICkXluoJUB5l2gl3qTt+76H4H5?=
 =?iso-8859-1?Q?6Z0jKThN/QlK3RmtmOYAez63J69CbuOnwaKZJO3mvZESYyqu6aRbQIsu1n?=
 =?iso-8859-1?Q?pJiVvJT+3XUmxUJI/tc+SfPaNvU0DY0K1a0ap16JqHmsNEjMNTCptzOIkI?=
 =?iso-8859-1?Q?1llsWh/JPrHraq8avKyUu4eju6lf7y+3JAO/t8u3y5ufbep92b8vtSk6YJ?=
 =?iso-8859-1?Q?jHyiEtV3nI24BND97EGv5BoIhxl8EC2UpXOMoIVJFAJbjNdYgh1Mge+BKf?=
 =?iso-8859-1?Q?P8UHuf4eMxnrGFvvJG+6dM4PjFFbSFg5oBeVzr1plVv6x3UqpbauirVQZs?=
 =?iso-8859-1?Q?pc5G0FuvJw5b1202Db0YfFD2sZXF/MV2HBRVCYVhTUXwJHpwgkzp+KWQA1?=
 =?iso-8859-1?Q?grCY/q65eWvs5T6xRCpKGqh3fk2vjpPJMUYQKj15G27wkEbge01V83M5K4?=
 =?iso-8859-1?Q?eFzXv/8ToSG2VuRr30ceh1Nvto1KmK9gacUtbd/heDgzAQs=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CO1PR10MB4531BD9AC25B8A64611702E997389CO1PR10MB4531namp_"
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d8bd7b7-e712-41b0-2c60-08d929f7a5ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2021 21:03:06.5413 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qDzkyiRoASrqOUHATYOYQizuR1yYEvXu6PuNB+dD8UXcXW3h31+fqnDG8QDTggOYbT7hwidjwXkjcFhEtMkYCYM53xnPQ+WsDokX1JP1sGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2063
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10008
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 mlxscore=0
 spamscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106070141
X-Proofpoint-ORIG-GUID: XML-2UnGkFj5BaKlvSErHJK6kp9W6BHL
X-Proofpoint-GUID: XML-2UnGkFj5BaKlvSErHJK6kp9W6BHL
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_CO1PR10MB4531BD9AC25B8A64611702E997389CO1PR10MB4531namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Igor,
Thanks for the information/feedback. I am working to implement all your sug=
gestions; from my perspective, there were two big changes requested, and th=
e use of hostmem-file was the first, and the conversion to PCI the second. =
V3 was the hostmem-file, and hopefully all changes then in v4.
Regards,
eric

________________________________
From: Igor Mammedov <imammedo@redhat.com>
Sent: Monday, June 7, 2021 7:49 AM
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: qemu-devel@nongnu.org <qemu-devel@nongnu.org>; mst@redhat.com <mst@redh=
at.com>; marcel.apfelbaum@gmail.com <marcel.apfelbaum@gmail.com>; pbonzini@=
redhat.com <pbonzini@redhat.com>; rth@twiddle.net <rth@twiddle.net>; ehabko=
st@redhat.com <ehabkost@redhat.com>; Konrad Wilk <konrad.wilk@oracle.com>; =
Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v3 0/7] acpi: Error Record Serialization Table, ERST, s=
upport for QEMU

On Fri, 28 May 2021 14:14:12 -0400
Eric DeVolder <eric.devolder@oracle.com> wrote:

> NOTE: Also, I wanted to push this v3 for review while alerting
> that I will be on holiday through June 8 (possibly a few days
> later).
this version addressed only the way the host storage is accessed
(and even that is only partially and needs more work to put into it)
The rest of the comments on v2 are still not addressed.

> NOTE: The patches are arranged such that each can be applied
> in order and not break the build (except the 0001 patch). Igor
> has hinted at changing this, but I'm unsure how else to
> re-arrange these patches accordingly.
as minimum, see suggestion for splitting #4 in 5/7

> NOTE: With the conversion to TYPE_MEMORY_BACKEND_FILE, live
> migration to a completely different host does not behave
> properly (it loses the ERST contents because the file is not
> present on the new host). This still needs to be worked out.
> Other than live migration, this patchset fully works.

see: vmstate_register_ram_global()

> This patchset introduces support for the ACPI Error Record
> Serialization Table, ERST.
>
> Linux uses the persistent storage filesystem, pstore, to record
> information (eg. dmesg tail) upon panics and shutdowns.  Pstore is
> independent of, and runs before, kdump.  In certain scenarios (ie.
> hosts/guests with root filesystems on NFS/iSCSI where networking
> software and/or hardware fails), pstore may contain the only
> information available for post-mortem debugging.
>
> Two common storage backends for the pstore filesystem are ACPI ERST
> and UEFI. Most BIOS implement ACPI ERST; however, ACPI ERST is not
> currently supported in QEMU, and UEFI is not utilized in all guests.
> By implementing ACPI ERST within QEMU, then the ACPI ERST becomes a
> viable pstore storage backend for virtual machines (as it is now for
> bare metal machines).
>
> Enabling support for ACPI ERST facilitates a consistent method to
> capture kernel panic information in a wide range of guests: from
> resource-constrained microvms to very large guests, and in
> particular, in direct-boot environments (which would lack UEFI
> run-time services).
>
> Note that Microsoft Windows also utilizes the ACPI ERST for certain
> crash information, if available.
>
> The ACPI ERST persistent storage is contained within a single backing
> file, with a default size of 64KiB. The size and filename of the
> backing file can be obtained from QEMU parameters.
>
> The ACPI specification[1], in Chapter "ACPI Platform Error Interfaces
> (APEI)", and specifically subsection "Error Serialization", outlines
> a method for storing error records into persistent storage.
>
> [1] "Advanced Configuration and Power Interface Specification",
>     version 6.2, May 2017.
>     https://www.uefi.org/sites/default/files/resources/ACPI_6_2.pdf
>
> [2] "Unified Extensible Firmware Interface Specification",
>     version 2.8, March 2019.
>     https://uefi.org/sites/default/files/resources/UEFI_Spec_2_8_final.pd=
f
>
> Suggested-by: Konrad Wilk <konrad.wilk@oracle.com>
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>
> ---
> v3: 28may2021
>  - Converted to using a TYPE_MEMORY_BACKEND_FILE object rather than
>    internal array with explicit file operations, per Igor.
good start but it's not complete yet.

>  - Changed the way the qdev and base address are handled, allowing
>    ERST to be disabled at run-time. Also aligns better with other
>    existing code.
it aligns with ancient code template and the way it used to plumb
into board (it's fine for pre-existing devices but not for new ones
(unless there is no other way )).
v2 had suggestions how to proceed (you asked some questions back then,
but result is not reflected in this series, which still has the old
code as it was in v2).


> v2: 8feb2021
>  - Added qtest/smoke test per Paolo Bonzini
>  - Split patch into smaller chunks, per Igo Mammedov
>  - Did away with use of ACPI packed structures, per Igo Mammedov
>
> v1: 26oct2020
>  - initial post
>
> ---
>  hw/acpi/erst.c         | 909 +++++++++++++++++++++++++++++++++++++++++++=
++++++
>  hw/acpi/meson.build    |   1 +
>  hw/i386/acpi-build.c   |   4 +
>  include/hw/acpi/erst.h |  97 ++++++
>  4 files changed, 1011 insertions(+)
>  create mode 100644 hw/acpi/erst.c
>  create mode 100644 include/hw/acpi/erst.h
>
>
> Eric DeVolder (7):
>   ACPI ERST: bios-tables-test.c steps 1 and 2
>   ACPI ERST: header file for ERST
>   ACPI ERST: support for ACPI ERST feature
>   ACPI ERST: include ERST feature in build of ACPI support
>   ACPI ERST: create ERST device for pc/x86 machines.
>   ACPI ERST: qtest for ERST
>   ACPI ERST: step 6 of bios-tables-test.c
>
>  hw/acpi/erst.c               | 902 +++++++++++++++++++++++++++++++++++++=
++++++
>  hw/acpi/meson.build          |   1 +
>  hw/i386/acpi-build.c         |   7 +
>  hw/i386/pc.c                 |  31 ++
>  include/hw/acpi/erst.h       |  82 ++++
>  include/hw/i386/pc.h         |   1 +
>  tests/data/acpi/microvm/ERST |   0
>  tests/data/acpi/pc/ERST      | Bin 0 -> 976 bytes
>  tests/data/acpi/q35/ERST     | Bin 0 -> 976 bytes
>  tests/qtest/erst-test.c      | 106 +++++
>  tests/qtest/meson.build      |   2 +
>  11 files changed, 1132 insertions(+)
>  create mode 100644 hw/acpi/erst.c
>  create mode 100644 include/hw/acpi/erst.h
>  create mode 100644 tests/data/acpi/microvm/ERST
>  create mode 100644 tests/data/acpi/pc/ERST
>  create mode 100644 tests/data/acpi/q35/ERST
>  create mode 100644 tests/qtest/erst-test.c
>


--_000_CO1PR10MB4531BD9AC25B8A64611702E997389CO1PR10MB4531namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div id=3D"appendonsend" style=3D"font-family: Calibri, Arial, Helvetica, s=
ans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Igor,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Thanks for the information/feedback. I am working to implement all your sug=
gestions; from my perspective, there were two big changes requested, and th=
e use of hostmem-file was the first, and the conversion to PCI the second. =
V3 was the hostmem-file, and hopefully
 all changes then in v4.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Regards,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
eric</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> Igor Mammedov &lt;i=
mammedo@redhat.com&gt;<br>
<b>Sent:</b> Monday, June 7, 2021 7:49 AM<br>
<b>To:</b> Eric DeVolder &lt;eric.devolder@oracle.com&gt;<br>
<b>Cc:</b> qemu-devel@nongnu.org &lt;qemu-devel@nongnu.org&gt;; mst@redhat.=
com &lt;mst@redhat.com&gt;; marcel.apfelbaum@gmail.com &lt;marcel.apfelbaum=
@gmail.com&gt;; pbonzini@redhat.com &lt;pbonzini@redhat.com&gt;; rth@twiddl=
e.net &lt;rth@twiddle.net&gt;; ehabkost@redhat.com &lt;ehabkost@redhat.com&=
gt;;
 Konrad Wilk &lt;konrad.wilk@oracle.com&gt;; Boris Ostrovsky &lt;boris.ostr=
ovsky@oracle.com&gt;<br>
<b>Subject:</b> Re: [PATCH v3 0/7] acpi: Error Record Serialization Table, =
ERST, support for QEMU</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">On Fri, 28 May 2021 14:14:12 -0400<br>
Eric DeVolder &lt;eric.devolder@oracle.com&gt; wrote:<br>
<br>
&gt; NOTE: Also, I wanted to push this v3 for review while alerting<br>
&gt; that I will be on holiday through June 8 (possibly a few days<br>
&gt; later).<br>
this version addressed only the way the host storage is accessed<br>
(and even that is only partially and needs more work to put into it)<br>
The rest of the comments on v2 are still not addressed.<br>
<br>
&gt; NOTE: The patches are arranged such that each can be applied<br>
&gt; in order and not break the build (except the 0001 patch). Igor<br>
&gt; has hinted at changing this, but I'm unsure how else to<br>
&gt; re-arrange these patches accordingly.<br>
as minimum, see suggestion for splitting #4 in 5/7<br>
<br>
&gt; NOTE: With the conversion to TYPE_MEMORY_BACKEND_FILE, live<br>
&gt; migration to a completely different host does not behave <br>
&gt; properly (it loses the ERST contents because the file is not<br>
&gt; present on the new host). This still needs to be worked out.<br>
&gt; Other than live migration, this patchset fully works.<br>
<br>
see: vmstate_register_ram_global()<br>
<br>
&gt; This patchset introduces support for the ACPI Error Record<br>
&gt; Serialization Table, ERST.<br>
&gt; <br>
&gt; Linux uses the persistent storage filesystem, pstore, to record<br>
&gt; information (eg. dmesg tail) upon panics and shutdowns.&nbsp; Pstore i=
s<br>
&gt; independent of, and runs before, kdump.&nbsp; In certain scenarios (ie=
.<br>
&gt; hosts/guests with root filesystems on NFS/iSCSI where networking<br>
&gt; software and/or hardware fails), pstore may contain the only<br>
&gt; information available for post-mortem debugging.<br>
&gt; <br>
&gt; Two common storage backends for the pstore filesystem are ACPI ERST<br=
>
&gt; and UEFI. Most BIOS implement ACPI ERST; however, ACPI ERST is not<br>
&gt; currently supported in QEMU, and UEFI is not utilized in all guests.<b=
r>
&gt; By implementing ACPI ERST within QEMU, then the ACPI ERST becomes a<br=
>
&gt; viable pstore storage backend for virtual machines (as it is now for<b=
r>
&gt; bare metal machines).<br>
&gt; <br>
&gt; Enabling support for ACPI ERST facilitates a consistent method to<br>
&gt; capture kernel panic information in a wide range of guests: from<br>
&gt; resource-constrained microvms to very large guests, and in<br>
&gt; particular, in direct-boot environments (which would lack UEFI<br>
&gt; run-time services).<br>
&gt; <br>
&gt; Note that Microsoft Windows also utilizes the ACPI ERST for certain<br=
>
&gt; crash information, if available.<br>
&gt; <br>
&gt; The ACPI ERST persistent storage is contained within a single backing<=
br>
&gt; file, with a default size of 64KiB. The size and filename of the<br>
&gt; backing file can be obtained from QEMU parameters.<br>
&gt; <br>
&gt; The ACPI specification[1], in Chapter &quot;ACPI Platform Error Interf=
aces<br>
&gt; (APEI)&quot;, and specifically subsection &quot;Error Serialization&qu=
ot;, outlines<br>
&gt; a method for storing error records into persistent storage.<br>
&gt; <br>
&gt; [1] &quot;Advanced Configuration and Power Interface Specification&quo=
t;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; version 6.2, May 2017.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"https://www.uefi.org/sites/default/=
files/resources/ACPI_6_2.pdf">https://www.uefi.org/sites/default/files/reso=
urces/ACPI_6_2.pdf</a><br>
&gt; <br>
&gt; [2] &quot;Unified Extensible Firmware Interface Specification&quot;,<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; version 2.8, March 2019.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"https://uefi.org/sites/default/file=
s/resources/UEFI_Spec_2_8_final.pdf">
https://uefi.org/sites/default/files/resources/UEFI_Spec_2_8_final.pdf</a><=
br>
&gt; <br>
&gt; Suggested-by: Konrad Wilk &lt;konrad.wilk@oracle.com&gt;<br>
&gt; Signed-off-by: Eric DeVolder &lt;eric.devolder@oracle.com&gt;<br>
&gt; <br>
&gt; ---<br>
&gt; v3: 28may2021<br>
&gt;&nbsp; - Converted to using a TYPE_MEMORY_BACKEND_FILE object rather th=
an<br>
&gt;&nbsp;&nbsp;&nbsp; internal array with explicit file operations, per Ig=
or.<br>
good start but it's not complete yet.<br>
<br>
&gt;&nbsp; - Changed the way the qdev and base address are handled, allowin=
g<br>
&gt;&nbsp;&nbsp;&nbsp; ERST to be disabled at run-time. Also aligns better =
with other<br>
&gt;&nbsp;&nbsp;&nbsp; existing code.<br>
it aligns with ancient code template and the way it used to plumb<br>
into board (it's fine for pre-existing devices but not for new ones<br>
(unless there is no other way )).<br>
v2 had suggestions how to proceed (you asked some questions back then,<br>
but result is not reflected in this series, which still has the old<br>
code as it was in v2).<br>
<br>
&nbsp;<br>
&gt; v2: 8feb2021<br>
&gt;&nbsp; - Added qtest/smoke test per Paolo Bonzini<br>
&gt;&nbsp; - Split patch into smaller chunks, per Igo Mammedov<br>
&gt;&nbsp; - Did away with use of ACPI packed structures, per Igo Mammedov<=
br>
&gt; <br>
&gt; v1: 26oct2020<br>
&gt;&nbsp; - initial post<br>
&gt; <br>
&gt; ---<br>
&gt;&nbsp; hw/acpi/erst.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |=
 909 +++++++++++++++++++++++++++++++++++++++++++++++++<br>
&gt;&nbsp; hw/acpi/meson.build&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +<br>
&gt;&nbsp; hw/i386/acpi-build.c&nbsp;&nbsp; |&nbsp;&nbsp; 4 +<br>
&gt;&nbsp; include/hw/acpi/erst.h |&nbsp; 97 ++++++<br>
&gt;&nbsp; 4 files changed, 1011 insertions(+)<br>
&gt;&nbsp; create mode 100644 hw/acpi/erst.c<br>
&gt;&nbsp; create mode 100644 include/hw/acpi/erst.h<br>
&gt; <br>
&gt; <br>
&gt; Eric DeVolder (7):<br>
&gt;&nbsp;&nbsp; ACPI ERST: bios-tables-test.c steps 1 and 2<br>
&gt;&nbsp;&nbsp; ACPI ERST: header file for ERST<br>
&gt;&nbsp;&nbsp; ACPI ERST: support for ACPI ERST feature<br>
&gt;&nbsp;&nbsp; ACPI ERST: include ERST feature in build of ACPI support<b=
r>
&gt;&nbsp;&nbsp; ACPI ERST: create ERST device for pc/x86 machines.<br>
&gt;&nbsp;&nbsp; ACPI ERST: qtest for ERST<br>
&gt;&nbsp;&nbsp; ACPI ERST: step 6 of bios-tables-test.c<br>
&gt; <br>
&gt;&nbsp; hw/acpi/erst.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 902 ++++++++++++++++++++++++++++++++++=
+++++++++<br>
&gt;&nbsp; hw/acpi/meson.build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |&nbsp;&nbsp; 1 +<br>
&gt;&nbsp; hw/i386/acpi-build.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; |&nbsp;&nbsp; 7 +<br>
&gt;&nbsp; hw/i386/pc.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 31 ++<br>
&gt;&nbsp; include/hw/acpi/erst.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbs=
p; 82 ++++<br>
&gt;&nbsp; include/hw/i386/pc.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; |&nbsp;&nbsp; 1 +<br>
&gt;&nbsp; tests/data/acpi/microvm/ERST |&nbsp;&nbsp; 0<br>
&gt;&nbsp; tests/data/acpi/pc/ERST&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 0 -&=
gt; 976 bytes<br>
&gt;&nbsp; tests/data/acpi/q35/ERST&nbsp;&nbsp;&nbsp;&nbsp; | Bin 0 -&gt; 9=
76 bytes<br>
&gt;&nbsp; tests/qtest/erst-test.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 106 ++++=
+<br>
&gt;&nbsp; tests/qtest/meson.build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nb=
sp; 2 +<br>
&gt;&nbsp; 11 files changed, 1132 insertions(+)<br>
&gt;&nbsp; create mode 100644 hw/acpi/erst.c<br>
&gt;&nbsp; create mode 100644 include/hw/acpi/erst.h<br>
&gt;&nbsp; create mode 100644 tests/data/acpi/microvm/ERST<br>
&gt;&nbsp; create mode 100644 tests/data/acpi/pc/ERST<br>
&gt;&nbsp; create mode 100644 tests/data/acpi/q35/ERST<br>
&gt;&nbsp; create mode 100644 tests/qtest/erst-test.c<br>
&gt; <br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_CO1PR10MB4531BD9AC25B8A64611702E997389CO1PR10MB4531namp_--

