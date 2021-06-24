Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C4D3B361E
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 20:52:32 +0200 (CEST)
Received: from localhost ([::1]:53096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwUSk-0004qJ-Q3
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 14:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lwUQ1-0003QX-9K
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 14:49:41 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:41722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lwUPy-0002XF-0C
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 14:49:41 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15OIl2jc012465; Thu, 24 Jun 2021 18:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=a0zUJVAatt8ZR21o+vEcWuxRMNGbbu94TI4wkWDlQ9w=;
 b=MoHvJQHyatlv9XQzR0Kg9BRxDDhpNF6nhCgmU0isHJ72QLI/WyQkJPgGXsZsIsoqEbpu
 mcBhHNX0L0q2m7TnwuHUDnWir9b019SvJHKQp7yAcDXUslQbhDSOplYjMcr1W04NmpwN
 TPsS0El83lAAkk+UAizsC/5opu81mIMyFpgQ2rY7QM9cmRh/rFJqXQ/n0Y3Hb1CVpEU5
 Q+KlYcKx4xL+DTRMnwRTvOGRHfJ0hVMY9aAeMYeMdwSqVpJp4IyLuaL/HUNud3mgxjKu
 hJR0mbjtznOoWCTHULg/a4h3S9BRvj0SBdnl5cSuCMBjXAF0czwVG56edCSguL2xlE02 ug== 
Received: from oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39cmpxhna4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Jun 2021 18:49:33 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 15OImGpj110666;
 Thu, 24 Jun 2021 18:49:32 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 by userp3020.oracle.com with ESMTP id 399tbwe5y0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Jun 2021 18:49:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l+St6T2Y1b7VNfKAbqnk0m2vu9I4RCHf3YFFC+qBBQ88tSJkbtGeZDvhJUuwEZGcAeJOsKY7l6YpXW77b1CFGsb2ojBE/7FHaIeIdD0B5M2O0dPb6l5QpnL0qgUjFxKZQfVxZPf1kl3GtxbC3fm7cRRQf42tveQbwmGUhLSLryInHaYq2Z5XViK/hJ0nmdXeYO9jpehlIshUFrD4SLQUQT0YoGHmf7EhMvdpN71W0fYoZ6yMzsAUZdY3hVuPFyN1we6runUPO0CX0BsYqkaFhw9v3AfYqjsLrqk5d/XhvVKh7Yt0yyHzKs7JMnoh1Jh3u3djkr8UBNLv89igP4+FFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0zUJVAatt8ZR21o+vEcWuxRMNGbbu94TI4wkWDlQ9w=;
 b=jFGYI+v7AVIIrNPjPJYvCvHq1tbyJNa2DwUNascsao5eqKGwTHeLKScdMVHzPUdoBLOLv6/z2sIiTD0iZo7tLAJE4CV1cqV8IDaDkmdANHL7kz6K/DdCoNeWwsuZ8Z6vHM0Ba2pS4vAzvfiwhi8pg4olxo1hc4cNj4JgL9xmtB+Qy7wqmjWqzZa6BjYt/OUhrMs6uQFkT/hwIjLReDywG0gH/v7NqCGqhHpFDE8HbbhNqsZofAjdt9D3J0N/AhedbP4zRCK94NGEYgDjT9zDHPaRq1EcI4IFKqeNdYinA5CfxjDULu1PYSyp76J3XM0xTAifAFmzcuMRveRvi2aO5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0zUJVAatt8ZR21o+vEcWuxRMNGbbu94TI4wkWDlQ9w=;
 b=IeS1m//s8UzmDhyOA7AUcVKF5+5XtT9ZwovQy9RVPLK4QN/IGgyQettcM/o7+grajNkgeVobBhwka44tsU/TsHVVUY/j6AYArLAKYGFuY99DN1uafTzaeyWyN0av+7ww+RL+Oxbnte/Bw0XBalX82dZyxrtfr2DFbD836UewdVs=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1341.namprd10.prod.outlook.com (2603:10b6:300:20::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Thu, 24 Jun
 2021 18:49:29 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc%8]) with mapi id 15.20.4264.020; Thu, 24 Jun 2021
 18:49:29 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v4 0/6] acpi: Error Record Serialization Table, ERST,
 support for QEMU
Thread-Topic: [PATCH v4 0/6] acpi: Error Record Serialization Table, ERST,
 support for QEMU
Thread-Index: AQHXXvAFI/97KfjNF0qR5aV6zQEGW6sgPwMAgANWM94=
Date: Thu, 24 Jun 2021 18:49:29 +0000
Message-ID: <CO1PR10MB4531A63EE2FA51FCDEC16E0497079@CO1PR10MB4531.namprd10.prod.outlook.com>
References: <1623436283-20213-1-git-send-email-eric.devolder@oracle.com>,
 <20210622175120.3080e88a@redhat.com>
In-Reply-To: <20210622175120.3080e88a@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [138.3.201.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4086d2e7-ee80-489d-156f-08d93740cc88
x-ms-traffictypediagnostic: MWHPR10MB1341:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR10MB13416526E4F773E3B341AF2197079@MWHPR10MB1341.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M7bImfXsNcUT3fTjrBJVw30sqIsU92pR3ovbx1EHZSgU7HmLGO+f/Y0WbxUqVoKL4PJDMzJLK3k3kqz7X6bHs8VSjF9TEQesCPM3nb7LdGMR04/1cWgaWeN4GTbBXdwKXy8oiMCQPNLai++4MAIRXE0ILB9FxWUG0EsnJUzad34qRuvsE6sWKLW76wkccC+JwKqq++/1HOK8BwNBNk9zx9ie1UmdjmL2WgHCGxbOxyf4l9fw/v67i+/lEDv8UXDWMIFv3GhwMEMiaAKmG9W9HWMkKwYYrrI/jSzKu69VfZJpQmjoasIzVjzdbOKC1b6o8t2LOJuLQaRzAj0CQJ/k/2DPj/6aE4ia+Tvb5RgM+wGeUKjssa2xEqQKbeEXhEMSWonXsV/ITDVbtF1m35yiT7Z4ZgY8HUXE76xVNznpfu0W2UO71SMwdmHdgHK2tMleNp3iitiyOBUszdpm53jIPpl+N5kwvcvZwHMpu935D+RhuGevz8iWOqTR/LHhK7L3A3BBXlTZM0yK15U4Y7Zmi93csaHjy15xhzjrUpUDKDdCTnMUwYH4krpte0gtOww6A3dsgGeEbB/QqxUY2OjXWDFZaPWYGQhygRoLjCLaq5ugyuQlUsr19fpquKARDrnItdHbJ3MfZ+0RFmi9JSvUDLoC6bxpQ004rhh791jl7w4VnDhzhD46BADtT2pazvqFNp15kfKQVHrG7NCzwIPeI80uxg1zoFzQAlmSFZzdaFiZQlCHDzeGx9UlHfVHZaTidA2Ephx3HHgKOjlHhKkNeXlCrSC7/N3tJq5ShBnV9OVNherQUsh70+Q6U8LqER3Q
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(136003)(376002)(396003)(346002)(366004)(478600001)(52536014)(71200400001)(83380400001)(33656002)(6916009)(45080400002)(166002)(66446008)(64756008)(66556008)(66476007)(5660300002)(8936002)(76116006)(8676002)(966005)(66946007)(91956017)(186003)(53546011)(7696005)(107886003)(26005)(55016002)(54906003)(316002)(2906002)(6506007)(9686003)(4326008)(38100700002)(86362001)(122000001)(19627405001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?H2vRz44Xo1K7wdt1T3/ZtNot6MFWaMn1JhUzlJF9wLL/5U/M4SqhUyfvZbai?=
 =?us-ascii?Q?qvUITFQobN8r/36Vru7IGobg83AXPIKyTqwJH+d0KquqeoJv8+uyL/ce4WNb?=
 =?us-ascii?Q?23YKEihcmo56LxyDNaLV2kFxIFzVeANZd44DMvpdP5jqqrMFX1OCw6KHn7R/?=
 =?us-ascii?Q?SmpaYnZnGo58+/KtQf27oU7fUuZ2Wbq6bofv66QJJC7NOVIcFW/0sIx4MQgv?=
 =?us-ascii?Q?dPQPb6jQscSYTerGMTLMKQXYrQYMOEl/qcpw7bHywiav2gZ22LNzcd/Ybmxz?=
 =?us-ascii?Q?V+1nFiJodcrd9ypXGthnEhlw2vT5H+tXC34Fapji0RtVw3xp0ZBNYIdwF3Ix?=
 =?us-ascii?Q?l3dxwUwCqnu4as0+TL7KPjRvLS/c5L5Er9REfUAskes/TR0bYtGh3UqpZDMr?=
 =?us-ascii?Q?tEEFEz5HZLekBIOKTNhMfJeovf2ed5T/mqmUwJEnfD5W00fXRb479SgeUwej?=
 =?us-ascii?Q?swWH5fOfqpSzmbNQMAtu9QG/y3rykFLSHt4vXLeK3AqMAI9z8A3IprRda2WT?=
 =?us-ascii?Q?v0CyiN3sQRT6sAwnkXcToPYnGlTBib1uiq4QJumbUOGk1MKI0OSS/tFUUytP?=
 =?us-ascii?Q?m6xOpF0Lda2NRoe//85i2r8rzLmtAlj78iY+6CfQxYG+LCd/S3NS6nfnUtSz?=
 =?us-ascii?Q?xe0xupWDK9dWOgSEmxH8rqfcI565852f3YeQupSgxVcakYfU2rG+svxfvV1J?=
 =?us-ascii?Q?aqPlzARwTiWbIw8aNiTw5yJ8dISpJ3vESZtxbGjFL6Uo7kk4Pie7pmvAjTGK?=
 =?us-ascii?Q?Il2IMCTUen6x0SQXb4ttxH2Zaz8hkEPWcoHzLJAnQbxjXof1pGnSGdfXaRej?=
 =?us-ascii?Q?FIokKGR+vDBucbgBtQ++2pScmRbxovBAbwFtTDsH8XiXUMS2b7jHf+BtwLAH?=
 =?us-ascii?Q?gADVBvDhe+J51jG7BF71h5ao0xxKJGFIakpPzQXEHxgeV5CcKyM31fMwroor?=
 =?us-ascii?Q?UvS3HD8B8IUcPtwSCvk4NI6Q62bUqPjQBbV2IgaahoGKMaFJIpggAmk0HVRN?=
 =?us-ascii?Q?PrDzSvFENmWSTmEd1MiTy0m0sy26QkKcdd9hcACkDD37xa6Xzpowe1BPR945?=
 =?us-ascii?Q?IElWHWVDNAQQJwpl1NGr3xbITHV2XfLFpsLPed2KtqpwcCCnF//ycUgkYKYc?=
 =?us-ascii?Q?+83P8zuMHDh5gyJUKGjbqtrwLAM7pT7DsFhtP7udVwVcQyL4mQR3QeoQ4Tu9?=
 =?us-ascii?Q?u4rkSGp+Dw1yvPEt3SxeliXK/33B90YW7D0vtqxsoed/ILBwyAfUlii9o5HX?=
 =?us-ascii?Q?SiFy3F3PLPB13QuBn34wOFZm2/zK/1cJuIYNXFDgGyy47zGjJXPhncDX20vX?=
 =?us-ascii?Q?lrU=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CO1PR10MB4531A63EE2FA51FCDEC16E0497079CO1PR10MB4531namp_"
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4086d2e7-ee80-489d-156f-08d93740cc88
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2021 18:49:29.7266 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XkA7HWheDzKkbxhmLIaJ4tG4kdPSbqf6b1bo46RaoXfgjyp2NKq7KLelE4eu0YwhS3E58YWhLpGwLYQh9ZcHzEjXOXr6iokjBB3BXpXzLNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1341
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10025
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106240103
X-Proofpoint-ORIG-GUID: Ql6ByMjaH25JfeUIspeMk4t3tDq_6WDi
X-Proofpoint-GUID: Ql6ByMjaH25JfeUIspeMk4t3tDq_6WDi
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
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_CO1PR10MB4531A63EE2FA51FCDEC16E0497079CO1PR10MB4531namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Igor,
Thanks for the feedback. I am working to address/correct the items. I hope =
to have v5 posted early next week.
eric

________________________________
From: Igor Mammedov <imammedo@redhat.com>
Sent: Tuesday, June 22, 2021 10:51 AM
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: qemu-devel@nongnu.org <qemu-devel@nongnu.org>; mst@redhat.com <mst@redh=
at.com>; marcel.apfelbaum@gmail.com <marcel.apfelbaum@gmail.com>; pbonzini@=
redhat.com <pbonzini@redhat.com>; rth@twiddle.net <rth@twiddle.net>; ehabko=
st@redhat.com <ehabkost@redhat.com>; Konrad Wilk <konrad.wilk@oracle.com>; =
Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v4 0/6] acpi: Error Record Serialization Table, ERST, s=
upport for QEMU

On Fri, 11 Jun 2021 14:31:17 -0400
Eric DeVolder <eric.devolder@oracle.com> wrote:

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
> file. The size and location of the backing file is specified upon
> QEMU startup of the ACPI ERST device.
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
> v4: 11jun2021
>  - Converted to a PCI device, per Igor.

Series looks much better now that impl. were split into
backend/frontend parts and dynamic MMIO placement.

I left some mandatory nit-picking about
comments, styles, overall documentation, leftovers
from previous revisions.
And also some how we can simplify impl. a bit more.


>  - Updated qtest.
>
> v3: 28may2021
>  - Converted to using a TYPE_MEMORY_BACKEND_FILE object rather than
>    internal array with explicit file operations, per Igor.
>  - Changed the way the qdev and base address are handled, allowing
>    ERST to be disabled at run-time. Also aligns better with other
>    existing code.
>
> v2: 8feb2021
>  - Added qtest/smoke test per Paolo Bonzini
>  - Split patch into smaller chunks, per Igo Mammedov
>  - Did away with use of ACPI packed structures, per Igo Mammedov
>
> v1: 26oct2020
>  - initial post
>
> ---
> Eric DeVolder (6):
>   ACPI ERST: bios-tables-test.c steps 1 and 2
>   ACPI ERST: header file for ERST
>   ACPI ERST: support for ACPI ERST feature
>   ACPI ERST: create ACPI ERST table for pc/x86 machines.
>   ACPI ERST: qtest for ERST
>   ACPI ERST: step 6 of bios-tables-test.c
>
>  hw/acpi/erst.c               | 880 +++++++++++++++++++++++++++++++++++++=
++++++
>  hw/acpi/meson.build          |   1 +
>  hw/i386/acpi-build.c         |   5 +
>  include/hw/acpi/erst.h       |  79 ++++
>  tests/data/acpi/microvm/ERST |   0
>  tests/data/acpi/pc/ERST      | Bin 0 -> 976 bytes
>  tests/data/acpi/q35/ERST     | Bin 0 -> 976 bytes
>  tests/qtest/erst-test.c      | 109 ++++++
>  tests/qtest/meson.build      |   2 +
>  9 files changed, 1076 insertions(+)
>  create mode 100644 hw/acpi/erst.c
>  create mode 100644 include/hw/acpi/erst.h
>  create mode 100644 tests/data/acpi/microvm/ERST
>  create mode 100644 tests/data/acpi/pc/ERST
>  create mode 100644 tests/data/acpi/q35/ERST
>  create mode 100644 tests/qtest/erst-test.c
>


--_000_CO1PR10MB4531A63EE2FA51FCDEC16E0497079CO1PR10MB4531namp_
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
Igor,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks for the feedback. I am working to address/correct the items. I hope =
to have v5 posted early next week.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
eric</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Igor Mammedov &lt;ima=
mmedo@redhat.com&gt;<br>
<b>Sent:</b> Tuesday, June 22, 2021 10:51 AM<br>
<b>To:</b> Eric DeVolder &lt;eric.devolder@oracle.com&gt;<br>
<b>Cc:</b> qemu-devel@nongnu.org &lt;qemu-devel@nongnu.org&gt;; mst@redhat.=
com &lt;mst@redhat.com&gt;; marcel.apfelbaum@gmail.com &lt;marcel.apfelbaum=
@gmail.com&gt;; pbonzini@redhat.com &lt;pbonzini@redhat.com&gt;; rth@twiddl=
e.net &lt;rth@twiddle.net&gt;; ehabkost@redhat.com &lt;ehabkost@redhat.com&=
gt;;
 Konrad Wilk &lt;konrad.wilk@oracle.com&gt;; Boris Ostrovsky &lt;boris.ostr=
ovsky@oracle.com&gt;<br>
<b>Subject:</b> Re: [PATCH v4 0/6] acpi: Error Record Serialization Table, =
ERST, support for QEMU</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Fri, 11 Jun 2021 14:31:17 -0400<br>
Eric DeVolder &lt;eric.devolder@oracle.com&gt; wrote:<br>
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
&gt; file. The size and location of the backing file is specified upon<br>
&gt; QEMU startup of the ACPI ERST device.<br>
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
&gt; v4: 11jun2021<br>
&gt;&nbsp; - Converted to a PCI device, per Igor.<br>
<br>
Series looks much better now that impl. were split into<br>
backend/frontend parts and dynamic MMIO placement.<br>
<br>
I left some mandatory nit-picking about<br>
comments, styles, overall documentation, leftovers<br>
from previous revisions.<br>
And also some how we can simplify impl. a bit more.<br>
<br>
<br>
&gt;&nbsp; - Updated qtest.<br>
&gt; <br>
&gt; v3: 28may2021<br>
&gt;&nbsp; - Converted to using a TYPE_MEMORY_BACKEND_FILE object rather th=
an<br>
&gt;&nbsp;&nbsp;&nbsp; internal array with explicit file operations, per Ig=
or.<br>
&gt;&nbsp; - Changed the way the qdev and base address are handled, allowin=
g<br>
&gt;&nbsp;&nbsp;&nbsp; ERST to be disabled at run-time. Also aligns better =
with other<br>
&gt;&nbsp;&nbsp;&nbsp; existing code.<br>
&gt; <br>
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
&gt; Eric DeVolder (6):<br>
&gt;&nbsp;&nbsp; ACPI ERST: bios-tables-test.c steps 1 and 2<br>
&gt;&nbsp;&nbsp; ACPI ERST: header file for ERST<br>
&gt;&nbsp;&nbsp; ACPI ERST: support for ACPI ERST feature<br>
&gt;&nbsp;&nbsp; ACPI ERST: create ACPI ERST table for pc/x86 machines.<br>
&gt;&nbsp;&nbsp; ACPI ERST: qtest for ERST<br>
&gt;&nbsp;&nbsp; ACPI ERST: step 6 of bios-tables-test.c<br>
&gt; <br>
&gt;&nbsp; hw/acpi/erst.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 880 ++++++++++++++++++++++++++++++++++=
+++++++++<br>
&gt;&nbsp; hw/acpi/meson.build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |&nbsp;&nbsp; 1 +<br>
&gt;&nbsp; hw/i386/acpi-build.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; |&nbsp;&nbsp; 5 +<br>
&gt;&nbsp; include/hw/acpi/erst.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbs=
p; 79 ++++<br>
&gt;&nbsp; tests/data/acpi/microvm/ERST |&nbsp;&nbsp; 0<br>
&gt;&nbsp; tests/data/acpi/pc/ERST&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 0 -&=
gt; 976 bytes<br>
&gt;&nbsp; tests/data/acpi/q35/ERST&nbsp;&nbsp;&nbsp;&nbsp; | Bin 0 -&gt; 9=
76 bytes<br>
&gt;&nbsp; tests/qtest/erst-test.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 109 ++++=
++<br>
&gt;&nbsp; tests/qtest/meson.build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nb=
sp; 2 +<br>
&gt;&nbsp; 9 files changed, 1076 insertions(+)<br>
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

--_000_CO1PR10MB4531A63EE2FA51FCDEC16E0497079CO1PR10MB4531namp_--

