Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F965380B4D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 16:14:20 +0200 (CEST)
Received: from localhost ([::1]:37592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhYa3-00012m-Jl
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 10:14:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lhYYR-0007Hq-9L
 for qemu-devel@nongnu.org; Fri, 14 May 2021 10:12:39 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:20454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lhYYN-0002W0-NY
 for qemu-devel@nongnu.org; Fri, 14 May 2021 10:12:39 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14EE82Ma029368; Fri, 14 May 2021 14:12:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=S6+aS7rlXvm5QhS0C+XFfhvGZpTAAspYW13nZeC1hTQ=;
 b=ORhDn479bZa60Eumldf35LeOqeVHenJS6hALJR6rfo+fq9yYO2lZmSvHOsuwTzi+WGz1
 RRM5C1c+IHtNPJC68PCdsNPFolwsCIt8Xfs+WNxSkyEwnI6vDOB2q2RZX4V8N3ykv5/J
 ssEeUeVSaEl2dFIteV/uX0SaByXERfhHQYdgSYv0gstseHTYNgu4f3+GqzXnwkuUjsgN
 +r/62igh6ZtZtyReAKT7D6azh2zTlQvIeQ5DeeHNNDbiC+PuCwyvy1joJ8vFEZSxmyqw
 OMHekGbAgufVA2y5rkLfAIhq/It0Te04IBBcCswzFefSuxeMNmKUJtw1Phne2uDPuGUW kw== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 38gpqmgpx0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 May 2021 14:12:29 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14EE7wsw104085;
 Fri, 14 May 2021 14:12:28 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 by userp3030.oracle.com with ESMTP id 38gpq34kcx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 May 2021 14:12:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G4aQoAbL7MeCrUc6LWhTgq/vLmoy7TI/Ey9jKuiAhVH2jm4AabTC8ly79a6/mVjlui2qUQ4DRS2QIJfhjHmOBoJhgLyl9N7Y59DaA0X/30WSrP8EtLVA8thW5JTjHXOJQSdlAX2W519OBgZd+G1t8ow/Bq3uGnMF5SOAdemsAdcHKHmzFRs8XKzzOA2R+rhZH9Gj0Par38Lto3ITTSlRURJgnquPwhFrIiyu+kbTs+/LjMUXA3f6AdaWjbahS+VEoQ6JMq67ZTVzlihTmm2tRfUpgcb/stwG84RfbRg8u1/9LjQti8oWOnErOmkicRWMfcWInl8NMXZDIq34xSCY/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S6+aS7rlXvm5QhS0C+XFfhvGZpTAAspYW13nZeC1hTQ=;
 b=oDRln/Du5+a41SfYfCzhZXXmH3WOfxEJeg1tmEq6QOM/wWfEJq7rawi41qqYJOrSYvZpeKDQB/+lm2hlvgD+C6BryeXfNvQl0KPK9nE3uENczdGzHgBYgW7KJaEYdXTJxJM0X1nigGCzXkeM/ytlPzARV5NzoQ7moUXhLawRLl8C88vFMwClG70zAUlFblllzmz0CeJfRo90AqcZyG8GN1TeYe9v2BolwCHIvh3/DN3GYr1USk7zJ6KnmF+nPnNElyecjcB2P1O4H0GE3CfTqICzOC9pupLI17Qp4D0XQF6BWdGiIRya6YiFYmIWvf5bclKjvbdroe9oD0GrvOA61w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S6+aS7rlXvm5QhS0C+XFfhvGZpTAAspYW13nZeC1hTQ=;
 b=Zn02enP3ArdkQZ5Ra4z8EMGYhAKLMXgjMX/LFUIeX5tDkB7eJYCkxr6Vjtsps5MaOSfF5AlvPpOYMojnn6rESbu2Q8JQ+kZxkbBq05dSKErPRhzem8Y85s5UBqiy4K9+k+PdSleizWUzXD5dpK8nrFEKxvM8JIa6bCNiN2R0w8A=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR1001MB2174.namprd10.prod.outlook.com (2603:10b6:301:33::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Fri, 14 May
 2021 14:12:25 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::2c38:cf0c:fee8:d429]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::2c38:cf0c:fee8:d429%4]) with mapi id 15.20.4129.026; Fri, 14 May 2021
 14:12:25 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 0/7] acpi: Error Record Serialization Table, ERST,
 support for QEMU
Thread-Topic: [PATCH v2 0/7] acpi: Error Record Serialization Table, ERST,
 support for QEMU
Thread-Index: AQHW/l0dCVff4wgjP0Kaws/mveeFjqrjlXoAgAAD2W4=
Date: Fri, 14 May 2021 14:12:25 +0000
Message-ID: <CO1PR10MB4531202E3233581364F9AC7997509@CO1PR10MB4531.namprd10.prod.outlook.com>
References: <1612817879-21511-1-git-send-email-eric.devolder@oracle.com>,
 <20210514095729-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210514095729-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [138.3.201.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ca7a3fee-5247-4e60-7bfe-08d916e24ca4
x-ms-traffictypediagnostic: MWHPR1001MB2174:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1001MB2174B22FFACCB4CC8EAFBC5497509@MWHPR1001MB2174.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BRf072oQBejyEIEnSaFGhHk9z4fXiLU3ZJxn5RMu16cDCKk1xJHYeXwf3SBcCjXjLLUj39PtrNJlcyjBRefIhhlqOFsoXI0Vk3BZLG6sfH7Snmz65pGAb4ngdq5QlmI2YSjz3O3gsaKFoP23/gAktfKvmtI/SzzcKDfhTh+V8i6EiLr9S7dkJQFinwjXzlYTQQa5Xwn1FHlLekMkflZoph4SDsEpoN0HTbqZQZZP9NZBEThnx8pnEbFCj2QgpmbKUQrwwNAYHK2w15j0Q5+M4QMjF1MDq4wLyTrlGcqTBlf/RX7OJ9Uq8lOt7j+Gnk3o5YHt0ygfsCcyVbTYgpePEH/eFX/iPwO/HwIOVpZ9YuzkgSw8MSocoSnl3C74uG5tOpdUbQlYfCprJt49wbu8g//XuzSn0C8yrsHRrWQrk2tomI0kPsAt8uBKjOHZVdfeLKMwHWUy7CW3ThrvBr4iesFerUOsLQoFMRMQj8K4r+ZFtQf5adJ5Nx6os5rgew4gOxYlgo8y6DpyzJNxADmUMI+ZovZ365PjfKrD3Ut4eV1uBof6u9ARY+jEWds6II5aYmJYyzY5T0RkeoBVwW148G2k14K/d8D/bWdSv6H1jBO9p/idX3vg4QUzyKmLLhsyCeK97SZNHBfoZBszNgrW89F8a3QScLtA2t4bAYqEu2WoVSMrr7ow5h53NeELFn28OfXnkgm8RikwqkVi6aVF5Of9frkKhe+xkgmdNSwPbLQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(376002)(396003)(39860400002)(346002)(8676002)(38100700002)(83380400001)(122000001)(6916009)(52536014)(7696005)(966005)(66446008)(2906002)(107886003)(86362001)(478600001)(186003)(53546011)(64756008)(4326008)(5660300002)(166002)(66946007)(316002)(26005)(54906003)(9686003)(66476007)(33656002)(71200400001)(66556008)(8936002)(55016002)(76116006)(19627405001)(6506007)(45080400002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?rYSstpLjpKzp/KFzoMM9znGKivlal1iM3k9ubFBbv29rMLps834yTL3+yxBv?=
 =?us-ascii?Q?aLM1iwEGxngzHr0AipG/orWODWYUMrnJGSlWXzOnEJDX8Yck7t8RCc5uUXZU?=
 =?us-ascii?Q?5hFYmCWNVBwLKvMx/5WGu2Qk562rjTUWHLVCNR3/KsUkkaSK0JMPZUpbYazs?=
 =?us-ascii?Q?uuxc+lSsfR0WlTvQbmxqOq2g+Mj82i56tisJN/O/Aj2ghU1zAnon9/xRG5uE?=
 =?us-ascii?Q?6SKcdEvRSD3FYdoPTr8SoYnFI/xbTgLK5W6AvJHEUgZ0iPPU7TYltTYEQmlN?=
 =?us-ascii?Q?JAzvOeKD0hRENu+kloUMzOCGV4vtSF76nYGyQjH+6qwoll0TOVGM3KWrZVKf?=
 =?us-ascii?Q?3Je6oes7PL6mynl+AYHeDmJ6P5oBhnXuSxkHC2FW/pa050Mtc2V7QgwKKJn1?=
 =?us-ascii?Q?6KR8/0udumLpWoNt81erFfBrKVEgyRoItu5cOnSk1iFaw86PdWNkVdursF5f?=
 =?us-ascii?Q?LSg+6CVnw+tWEsZvBuWnP+12Jr4Dp1YHECH2HbAC7aWdMCdH6u9Rhlg6BG4Y?=
 =?us-ascii?Q?6MADyZGuTH7xnqgR7VecpXnnxwmxVRD+o/11sVKP9R/bu/Ek2Ls7/ww94Tfe?=
 =?us-ascii?Q?uvNsZM9mu4ej1ZOSEKkAw/cPLyBAN10dnOgKVQTUmU0dRBP7teonfq1bl/QV?=
 =?us-ascii?Q?BUj6fvOZhIQEWBVNiyLa8o2Js38G0cuIUETLwmqch5mVqFsQGS/gLsrsI8SG?=
 =?us-ascii?Q?WKdygHhaYJkqQteBfsZG+0PwoSQGydTHNTD9sSZPpQ0krRfYG95X4i5W9HFg?=
 =?us-ascii?Q?7QO8Bk78UXzNRFpsX2r4X4xELUL4a6Law2vsInZ3+Lwr27yoaMqLymSLQhVT?=
 =?us-ascii?Q?WmoOkdNOZYzxcCs2qNiyIlWaSCvLYPTT82OwjvE8U7YDgc9XBqgY98BuG78V?=
 =?us-ascii?Q?QQ5qgTRdJE7tGTYcCqNqEIyAnWbZOPipnnNZfbsvz39G0BwWrXHGhI14mUE7?=
 =?us-ascii?Q?NppVQxHNiJ35b9NsUwe8NKhvRgLSB7BeDM9qlnUmzDhoMpPRe++BRtTwfs7Q?=
 =?us-ascii?Q?mKkH21A8A2pUJprvMQu9JQb3s7J3cTOVPs2uBLQek1ZDB0XeBC0TZwxQRYDv?=
 =?us-ascii?Q?/JwolyeCJ0Wytm343aJKvnpmyW/8aqFBgA0PuWWcGv7RZ3x15Tm/FgrKDnIc?=
 =?us-ascii?Q?UhouBFNXedgk2XLak6Kh+n+tqwQU0W39qGDE+pE+rx8IG+lc0IGmluGN2r+M?=
 =?us-ascii?Q?M+XiQewLLiIKcs8scXPPBULj0w+ClVW1PH3dm0QqVlvy4EVpoQFT0rJR9O11?=
 =?us-ascii?Q?SlgpveQTyA5P5N12QXnihf9L5SyZStmQTxTOMMxFH7TFUgjcM7R6hS/l//j6?=
 =?us-ascii?Q?AFA=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CO1PR10MB4531202E3233581364F9AC7997509CO1PR10MB4531namp_"
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca7a3fee-5247-4e60-7bfe-08d916e24ca4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2021 14:12:25.2818 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 37k5KNeNMQgjBYl3MIACKgnVrjicvxbzRkZqEKUr2S/T/5WjrFlFGgVMAVlcCNq3yOLNW+KiFvpbciimqSlOqT2UJ2zGbrrIRVA7tTd3S/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2174
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9984
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 malwarescore=0 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105140114
X-Proofpoint-GUID: O7w4JN6Kzy7VwFABzSqDQ3ySmnFHxW_e
X-Proofpoint-ORIG-GUID: O7w4JN6Kzy7VwFABzSqDQ3ySmnFHxW_e
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kwilk@oracle.com" <kwilk@oracle.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_CO1PR10MB4531202E3233581364F9AC7997509CO1PR10MB4531namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Michael,
Yes, I'm working on a v3 to accommodate items Igor has requested.
eric
________________________________
From: Michael S. Tsirkin <mst@redhat.com>
Sent: Friday, May 14, 2021 8:57 AM
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: imammedo@redhat.com <imammedo@redhat.com>; marcel.apfelbaum@gmail.com <=
marcel.apfelbaum@gmail.com>; pbonzini@redhat.com <pbonzini@redhat.com>; rth=
@twiddle.net <rth@twiddle.net>; ehabkost@redhat.com <ehabkost@redhat.com>; =
qemu-devel@nongnu.org <qemu-devel@nongnu.org>; Boris Ostrovsky <boris.ostro=
vsky@oracle.com>; kwilk@oracle.com <kwilk@oracle.com>
Subject: Re: [PATCH v2 0/7] acpi: Error Record Serialization Table, ERST, s=
upport for QEMU

On Mon, Feb 08, 2021 at 03:57:52PM -0500, Eric DeVolder wrote:
> This patchset introduces support for the ACPI Error Record
> Serialization Table, ERST.

OK I'm expecting v3 I guess?


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
> resource- constrained microvms to very large guests, and in
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
> v2: 8feb2021
>  - Added qtest/smoke test per Paolo Bonzini
>  - Split patch into smaller chunks, per Igo Mammedov
>  - Did away with use of ACPI packed structures, per Igo Mammedov
>
> v1: 26oct2020
>  - initial post
>
> ---
> Eric DeVolder (7):
>   ACPI ERST: bios-tables-test.c steps 1 and 2
>   ACPI ERST: header file for erst
>   ACPI ERST: support for ACPI ERST feature
>   ACPI ERST: build step for ACPI ERST
>   ACPI ERST: support ERST for x86 guest
>   ACPI ERST: qtest for ERST
>   ACPI ERST: bios-tables-test.c step 5
>
>  hw/acpi/erst.c               | 952 +++++++++++++++++++++++++++++++++++++=
++++++
>  hw/acpi/meson.build          |   1 +
>  hw/i386/acpi-build.c         |   4 +
>  include/hw/acpi/erst.h       |  77 ++++
>  tests/data/acpi/microvm/ERST |   0
>  tests/data/acpi/pc/ERST      | Bin 0 -> 976 bytes
>  tests/data/acpi/q35/ERST     | Bin 0 -> 976 bytes
>  tests/qtest/erst-test.c      | 106 +++++
>  tests/qtest/meson.build      |   2 +
>  9 files changed, 1142 insertions(+)
>  create mode 100644 hw/acpi/erst.c
>  create mode 100644 include/hw/acpi/erst.h
>  create mode 100644 tests/data/acpi/microvm/ERST
>  create mode 100644 tests/data/acpi/pc/ERST
>  create mode 100644 tests/data/acpi/q35/ERST
>  create mode 100644 tests/qtest/erst-test.c
>
> --
> 1.8.3.1


--_000_CO1PR10MB4531202E3233581364F9AC7997509CO1PR10MB4531namp_
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
Michael,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Yes, I'm working on a v3 to accommodate items Igor has requested.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
eric<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Michael S. Tsirkin &l=
t;mst@redhat.com&gt;<br>
<b>Sent:</b> Friday, May 14, 2021 8:57 AM<br>
<b>To:</b> Eric DeVolder &lt;eric.devolder@oracle.com&gt;<br>
<b>Cc:</b> imammedo@redhat.com &lt;imammedo@redhat.com&gt;; marcel.apfelbau=
m@gmail.com &lt;marcel.apfelbaum@gmail.com&gt;; pbonzini@redhat.com &lt;pbo=
nzini@redhat.com&gt;; rth@twiddle.net &lt;rth@twiddle.net&gt;; ehabkost@red=
hat.com &lt;ehabkost@redhat.com&gt;; qemu-devel@nongnu.org &lt;qemu-devel@n=
ongnu.org&gt;;
 Boris Ostrovsky &lt;boris.ostrovsky@oracle.com&gt;; kwilk@oracle.com &lt;k=
wilk@oracle.com&gt;<br>
<b>Subject:</b> Re: [PATCH v2 0/7] acpi: Error Record Serialization Table, =
ERST, support for QEMU</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Mon, Feb 08, 2021 at 03:57:52PM -0500, Eric DeV=
older wrote:<br>
&gt; This patchset introduces support for the ACPI Error Record<br>
&gt; Serialization Table, ERST.<br>
<br>
OK I'm expecting v3 I guess?<br>
<br>
<br>
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
&gt; resource- constrained microvms to very large guests, and in<br>
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
&gt; Eric DeVolder (7):<br>
&gt;&nbsp;&nbsp; ACPI ERST: bios-tables-test.c steps 1 and 2<br>
&gt;&nbsp;&nbsp; ACPI ERST: header file for erst<br>
&gt;&nbsp;&nbsp; ACPI ERST: support for ACPI ERST feature<br>
&gt;&nbsp;&nbsp; ACPI ERST: build step for ACPI ERST<br>
&gt;&nbsp;&nbsp; ACPI ERST: support ERST for x86 guest<br>
&gt;&nbsp;&nbsp; ACPI ERST: qtest for ERST<br>
&gt;&nbsp;&nbsp; ACPI ERST: bios-tables-test.c step 5<br>
&gt; <br>
&gt;&nbsp; hw/acpi/erst.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 952 ++++++++++++++++++++++++++++++++++=
+++++++++<br>
&gt;&nbsp; hw/acpi/meson.build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |&nbsp;&nbsp; 1 +<br>
&gt;&nbsp; hw/i386/acpi-build.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; |&nbsp;&nbsp; 4 +<br>
&gt;&nbsp; include/hw/acpi/erst.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbs=
p; 77 ++++<br>
&gt;&nbsp; tests/data/acpi/microvm/ERST |&nbsp;&nbsp; 0<br>
&gt;&nbsp; tests/data/acpi/pc/ERST&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 0 -&=
gt; 976 bytes<br>
&gt;&nbsp; tests/data/acpi/q35/ERST&nbsp;&nbsp;&nbsp;&nbsp; | Bin 0 -&gt; 9=
76 bytes<br>
&gt;&nbsp; tests/qtest/erst-test.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 106 ++++=
+<br>
&gt;&nbsp; tests/qtest/meson.build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nb=
sp; 2 +<br>
&gt;&nbsp; 9 files changed, 1142 insertions(+)<br>
&gt;&nbsp; create mode 100644 hw/acpi/erst.c<br>
&gt;&nbsp; create mode 100644 include/hw/acpi/erst.h<br>
&gt;&nbsp; create mode 100644 tests/data/acpi/microvm/ERST<br>
&gt;&nbsp; create mode 100644 tests/data/acpi/pc/ERST<br>
&gt;&nbsp; create mode 100644 tests/data/acpi/q35/ERST<br>
&gt;&nbsp; create mode 100644 tests/qtest/erst-test.c<br>
&gt; <br>
&gt; -- <br>
&gt; 1.8.3.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_CO1PR10MB4531202E3233581364F9AC7997509CO1PR10MB4531namp_--

