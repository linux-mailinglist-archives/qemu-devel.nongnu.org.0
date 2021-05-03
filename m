Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF933371876
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 17:51:23 +0200 (CEST)
Received: from localhost ([::1]:38468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldaqw-0001yD-T7
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 11:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1ldapJ-00016Q-4L
 for qemu-devel@nongnu.org; Mon, 03 May 2021 11:49:41 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:37398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1ldapF-0007DZ-HQ
 for qemu-devel@nongnu.org; Mon, 03 May 2021 11:49:40 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 143FdkHR012591;
 Mon, 3 May 2021 15:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=zhWc4BhMHZc5Zbe3qCEMrNpuGLzB6Wz8AHf72e0p6xw=;
 b=WpkJbT1TCgE6JBgDX8oPPaXOaKNPb2qv8khZkneNa80JRycCywyuqO6PT18Apt055cnC
 t0jErWea10JD6NCy547Vn7Gqub5VbddVGoti+dLWNQ85b+KMO8rqVT5xRa4sEV+s3piW
 M4nhWvupwsbdvSJSEF/5lQt7E9/5UhNZY0/Y+PVLluevTX6VGtEbgS4KGcrJpXH8g5Sx
 DMlnoWG4utfy0g9SwiO7Sq3cBqHYnLMz3FD8PZV8W6nsXBqgZY1LTEXI911TBXJZ3EaL
 0ZI64ikjeYQykezvaggQQdOihCOuafHdtgpheSu+qxyNnpMrRaI4SqOtypNfuJTUc5ex IQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 388xdrv3m6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 03 May 2021 15:49:32 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 143FfGDF010661;
 Mon, 3 May 2021 15:49:32 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
 by userp3020.oracle.com with ESMTP id 389grqvh13-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 03 May 2021 15:49:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jwySAIEmidhFQiuujSe0VTs1NS3P9SDCnSpfAxKfE9Sl479P9iv57nX922JMOIVf5IcvMjT3V9xp+BO+GvwPrG51cmsY3mkqGP/dW3iXEO411FhG3bLnZKnPG+inJ1F56OVCQYi1VzucGApERnwKlalKg9KMJ6GzzcBr5Y0DuHl9aHFb32qeE0DJxd8qMNvtN278VYen2nv0fDbcL2648hIj3gatJxqFFmQSpxYUFhMssE0xqJxXdOxFP22zuMDWCFIZF+8wOZBV+JuB+9sbVSELn+1fg0cBQhGmSHE7nxuzyX2sp2uy9Xr/lc7CjtbSyhdEx9FxAk9zU5m8uJEDjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhWc4BhMHZc5Zbe3qCEMrNpuGLzB6Wz8AHf72e0p6xw=;
 b=gwpgSYzxrEUOOhZ944nv9kTGI41rZj99C9vXAVEPp+N2/kyAlMDvhw1Iz2mKyAPJXTxiOoMsZM6xCKU1mdT8oApQ/jxu0Dr1U/OJSLQuBzegL5/BZMToFksHI0nJO7bc+aKnkxNiiapout7wLVz/cMW5H986A91B7xDG4p7RI55RzOu6qHA/DJCZ8wILsoEC1V8mCe/LxiZGcNO0MsHYzzuAdHCNZCn15ERN+wibwWbFDl2nJzb00qBaYn35vDiDh0zFleNaABwTS5o7yRjwZX8mi47reLlWNg8nXTQK90odfs6D4Jf1fABS0RUO/DS/O264LEivxAwpQu/g5z4KDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhWc4BhMHZc5Zbe3qCEMrNpuGLzB6Wz8AHf72e0p6xw=;
 b=G6UR7s6oBEzsCI0XetapoqxD2oZRSXXBHRxX9y6nPrrd3XdgGHFR36iotlbbukeG5VwCPWMiE7MNUOD8v7rBjaMH4T2PR10QEhzOPdTPgpM39ZbW81xNGuKolx+RZCb7pjEotGChfxUH/LhOIjAFaM7lHc1T0zN7KrUYHk7Y7vw=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1968.namprd10.prod.outlook.com (2603:10b6:300:111::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.43; Mon, 3 May
 2021 15:49:28 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::2c38:cf0c:fee8:d429]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::2c38:cf0c:fee8:d429%4]) with mapi id 15.20.4087.044; Mon, 3 May 2021
 15:49:28 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v2 3/7] ACPI ERST: support for ACPI ERST feature
Thread-Topic: [PATCH v2 3/7] ACPI ERST: support for ACPI ERST feature
Thread-Index: AQHW/l0fQlwSEv68gU2Ur30xmG3nWKqoOiqAgARyYeeAB3TagIAeR4s6
Date: Mon, 3 May 2021 15:49:28 +0000
Message-ID: <CO1PR10MB4531ACA8EFC99E57809E1499975B9@CO1PR10MB4531.namprd10.prod.outlook.com>
References: <1612817879-21511-1-git-send-email-eric.devolder@oracle.com>
 <1612817879-21511-4-git-send-email-eric.devolder@oracle.com>
 <20210406213131.21045f68@redhat.com>
 <CO1PR10MB4531392E4B963B163A0FC89C97739@CO1PR10MB4531.namprd10.prod.outlook.com>,
 <20210414111759.66e78f71@redhat.com>
In-Reply-To: <20210414111759.66e78f71@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [138.3.201.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 955c9938-7755-4917-905f-08d90e4b0921
x-ms-traffictypediagnostic: MWHPR10MB1968:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR10MB19689E8C12F428B78EB16E73975B9@MWHPR10MB1968.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lHR1etXNzHWFrRI7R/VMfmdZZ01YI0QdRkiuLWA8IqSLDisJ1/Qw4yHmI8oh+vJ1fndnItwXXJmXSXP06E8KG8pm+63N19FSp4XhhFIkMVLuHuGMIe6GICmLimrTF15wuK83Crxgol3aAv2GyZmIsbkej2NLyUuNEnApSpulQWcyNj5V/T83+JsPIt35TCUwnTKBuAGYP4J/ogqw5jV/L59CjKl8Eoyt3ZYqY+Z7VHGWqw8uwOedKtB1cVLlgWGTJebuq2tas+Lsh3EreRrQ3l7hcGjYfLxl4qYOSJVIj9TN8Sn9YPOLZaOfZN5xlXQ2L4lOkYUsnk0NmaZr/wVSgX/oJ2kGm+6w9z/LJ8vGN4ZUD8aXT1HToLl6N0hn+89egRtRMo22c7HTh/626+bmUgCYEEK4rg94ryoxHYE/58Mw0YSFQZHzT03nDUPqjEpBSKSYKU/8q2JZTWPcdP0H/JY5UsQB1RvtrLkYOsyc8Bf3yuwfObbY30dJM8HlcsjuL6ck1izqfgJQpSZbmhTex/0R4tGenf7Q51jy1jis29kM/a9/tiJ9kg0aauZd1j2yjTYGAeyDz9iqrrE9l2zkmI1sT6WOnQl2YWCSygbFGIjOsSSEZK0+F6JlPmbeFJw0IOz6QNHDr9ZzT5z3xYic8dpZhT++M+00+64S3yW4vSGMERGVpErlWN4sjm6ete+N
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(86362001)(8936002)(54906003)(26005)(64756008)(186003)(8676002)(2906002)(122000001)(6506007)(38100700002)(4326008)(6916009)(9686003)(55016002)(66446008)(66476007)(66556008)(166002)(19627405001)(66946007)(53546011)(83380400001)(33656002)(76116006)(966005)(71200400001)(7696005)(498600001)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?QoGhLKskwIf7oERA7XSQUWJQHdhhTMnd2kELsUdFgHHbQeWv3h2Opp7och9/?=
 =?us-ascii?Q?VCmFjUUYHeW0ALMWop4+s62RcuYgSxWhA145miopsxywMWn/v7tPUAomzQqX?=
 =?us-ascii?Q?QxTlyxt2VFGxxTUXn3va4ScBgCF1QwK9IKuDu9SXlYI/iSA1I+YlRSPzdEda?=
 =?us-ascii?Q?E9yTP7nsWZswY45EkYNTO1Ani1dJAFq/iem1iyjEtuGt83CqEYI1W3UXn0Mp?=
 =?us-ascii?Q?esTfHOLmVD7EQMoYezwipWusGmr3JWjMg9I/0memKRg1jxMPLN+rAJS/oChw?=
 =?us-ascii?Q?j2RguLrxSYK/09AKMJy2Tdvqxs6HbTyfAQMYvPBTo4KNH5FO+JIAN6dM47u6?=
 =?us-ascii?Q?nyXnqdnAD6uPStCRwVj4mLbznuohrV/mRq1ZI+mSuvPG6OfcIfrSEH68LRXB?=
 =?us-ascii?Q?5IRDYX0wlDGz82fT1jGoc/jr2kdnqI63p60YFWlVUYtcEzGS+223IE+RgByY?=
 =?us-ascii?Q?w69yJjFw+qcPpU+/4nkyAQn7NEgkCj7qaViFUOcAQ7CYP63esouJpEQn81dF?=
 =?us-ascii?Q?+8x5eHxWYM//ofNcaZFnUZVtN9Cr3ud9EML6C3K/cJlWZO9ti8MZvH+E1Gq9?=
 =?us-ascii?Q?78XdGxaAbNSxrP1qIR4Z2+fBLMnvf2h3Rki+EGGvdG2ElM/ouDuryGSpzYFT?=
 =?us-ascii?Q?75/NTKdq2EUWtd0nVEAUHK9igjtC7cBYNxuilZ/C45bYBPY1pAz3HEydViXh?=
 =?us-ascii?Q?M4aK9k9L5Uok4fb+Rrzhz5DLkFXWTPBTSrrTUORX1kpvZpccf5WeVRR3mqQx?=
 =?us-ascii?Q?/FTJ97fhWz9r6hHg3RJiOPqrVIfFJ6+E+rNfCbhDGXo681+jxlEhXhB/F/En?=
 =?us-ascii?Q?+DUmGbnqT6ZC68qy544/Pqae/ujliELSNcYQRtKlDYUjDfZoeHVJCAWwnANV?=
 =?us-ascii?Q?L8bfUToHZwtZRuE4aJtOkqxIENP7Ji++brNODY/Wwe6kTGSRAjPrS7nqVhtD?=
 =?us-ascii?Q?rt2ByNyE/Rtt3kf2sk93ejaniTmM2lzmbGGcKSweXtKBvnEcRXgAosbwlnbd?=
 =?us-ascii?Q?AD9RiWKuabN6wXR2AIaQSajga0mKWmDM6MkX1E3yV1/pj5e9TPpYKpSB5dkf?=
 =?us-ascii?Q?jHKqrIISYoGfsLDF4q81XWSf3Ezsoc/ujlHroD86C/2eunmZzMpCGEAMvHeD?=
 =?us-ascii?Q?hdnF0KfLDb0+btuvjr/KpjBe4FYJW7HzB4nQ0VYWcs3dKvOgUnMq0oQ757RE?=
 =?us-ascii?Q?8jNWighX2+9g5fu7ktwu4KFo8zKyP5x+6UqGjPDGi8lXd0+JMZeVDAI7o1kh?=
 =?us-ascii?Q?SXtxCItCmDM+5w6W8DmUlaBmIix6FIjtYggABlqUgaKWJjRS7lpRYUeYmjOj?=
 =?us-ascii?Q?Qw0=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CO1PR10MB4531ACA8EFC99E57809E1499975B9CO1PR10MB4531namp_"
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 955c9938-7755-4917-905f-08d90e4b0921
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2021 15:49:28.7111 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aDwvXHzqSSawE0V/5JkKahwIhLUO9fUMBX1KK49+CgWQH5jZm+f7IMjzbCqyKpoKhvXItoMfLVotIgFHZKt2W/rP5ZpcSH3x8WGY6p0+zkk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1968
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9973
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 phishscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2105030106
X-Proofpoint-ORIG-GUID: pzCGKvk3HzoIqc_XN-7yRb6HYIgx3IED
X-Proofpoint-GUID: pzCGKvk3HzoIqc_XN-7yRb6HYIgx3IED
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9973
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 clxscore=1011
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105030106
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=eric.devolder@oracle.com; helo=userp2130.oracle.com
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
Cc: "ehabkost@redhat.com" <ehabkost@redhat.com>,
 Konrad Wilk <konrad.wilk@oracle.com>, "mst@redhat.com" <mst@redhat.com>,
 "jusual@redhat.com" <jusual@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_CO1PR10MB4531ACA8EFC99E57809E1499975B9CO1PR10MB4531namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Igor,
I've rebased the original patches on to qemu-v6.0.0-rc4, and finally have e=
verything working as it previously did.
I've started now to work to incorporate the HostMemoryBackendFile; that is =
progressing.
My question for you today is with regard to placing ERST device on PCI. The=
 PCI example provided is a template device, and while I do find that helpfu=
l, I still do not understand how the ERST Actions, which contain GAS for de=
scribing the register accesses, would be patched/linked when a PCI bar is a=
ssigned. Or is there perhaps another way of obtaining the PCI BAR using ACP=
I semantics?
Thanks,
eric

________________________________
From: Igor Mammedov <imammedo@redhat.com>
Sent: Wednesday, April 14, 2021 4:17 AM
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: ehabkost@redhat.com <ehabkost@redhat.com>; mst@redhat.com <mst@redhat.c=
om>; Konrad Wilk <konrad.wilk@oracle.com>; qemu-devel@nongnu.org <qemu-deve=
l@nongnu.org>; pbonzini@redhat.com <pbonzini@redhat.com>; Boris Ostrovsky <=
boris.ostrovsky@oracle.com>; rth@twiddle.net <rth@twiddle.net>; jusual@redh=
at.com <jusual@redhat.com>
Subject: Re: [PATCH v2 3/7] ACPI ERST: support for ACPI ERST feature

On Fri, 9 Apr 2021 15:54:47 +0000
Eric DeVolder <eric.devolder@oracle.com> wrote:

> Hi Igor,
> Thank you for reviewing. I've responded inline below.
> eric
>
> ________________________________
> From: Igor Mammedov <imammedo@redhat.com>
> Sent: Tuesday, April 6, 2021 2:31 PM
> To: Eric DeVolder <eric.devolder@oracle.com>
> Cc: mst@redhat.com <mst@redhat.com>; marcel.apfelbaum@gmail.com <marcel.a=
pfelbaum@gmail.com>; pbonzini@redhat.com <pbonzini@redhat.com>; rth@twiddle=
.net <rth@twiddle.net>; ehabkost@redhat.com <ehabkost@redhat.com>; qemu-dev=
el@nongnu.org <qemu-devel@nongnu.org>; Boris Ostrovsky <boris.ostrovsky@ora=
cle.com>; kwilk@oracle.com <kwilk@oracle.com>
> Subject: Re: [PATCH v2 3/7] ACPI ERST: support for ACPI ERST feature
>
> On Mon,  8 Feb 2021 15:57:55 -0500
> Eric DeVolder <eric.devolder@oracle.com> wrote:
>
> > This change implements the support for the ACPI ERST feature[1,2].
> >
> > The size of the ACPI ERST storage is declared via the QEMU
> > global parameter acpi-erst.size. The size can range from 64KiB
> > to to 64MiB. The default is 64KiB.
> >
> > The location of the ACPI ERST storage backing file is delared
> > via the QEMU global parameter acpi-erst.filename. The default
> > is acpi-erst.backing.
> >
> > [1] "Advanced Configuration and Power Interface Specification",
> >     version 6.2, May 2017.
> >     https://www.uefi.org/sites/default/files/resources/ACPI_6_2.pdf
> >
> > [2] "Unified Extensible Firmware Interface Specification",
> >     version 2.8, March 2019.
> >     https://uefi.org/sites/default/files/resources/UEFI_Spec_2_8_final.=
pdf
> >
> > Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>
> items 2/4/5 from v1 review still need to be addressed.
>
> >
> > 2. patch is too big to review, please split it up in smaller chunks.
> >
> > EJD: Done.
>
> (separating a header and a makefile rule doesn't make much sense)
>
> it should be split at least on part that implements device model and ACPI=
 parts
>
> EJD: I'll rebase this patch set on qemu-6 and accommodate your suggestion=
s with how to split/organize the patch set.
>
> [...]
> >
> > 4. Maybe instead of SYSBUS device, implement it as a PCI device and
> >    use its BAR/control registers for pstore storage and control interfa=
ce.
> >    It could save you headache of picking address where to map it +
> >    it would take care of migration part automatically, as firmware
> >    would do it for you and then QEMU could pickup firmware programmed
> >    address and put it into ERST table.
> > EJD: Thanks for the idea. For now I've left it as a SYSBUS device; we c=
an revisit as needed.
>
> I would really prefer to see a PCI version (current way is just a hack)
>
> EJD: I understand, I don't like the base address problem either. Is there=
 an example PCI device that gets its base address assigned during ACPI setu=
p that I could reference and pattern this work after? I've been using SYSBU=
S as that most closely mimics the real hardware implementations I've studie=
d in order to produce this code.
> EJD: I thought my inexperience with authoring QEMU devices was the primar=
y problem in establishing a solution for the base address. Otherwise, this =
thing only needs a single 4KiB page (for the 2 registers + exchange buffer)=
 exposed.

I don't recall if we merged example PCI device in QEMU, but someone worked =
on it before.
Google search yields following:
 https://github.com/grandemk/qemu_devices/commit/ba8d38a858ba63ef4d419a926f=
58328b9675fc98


> > 5. instead of dealing with file for storage directly, reuse hostmem bac=
kend
> >    to provide it to for your device. ex: pc-dimm. i.e. split device
> >    on frontend and backend
> >
> > EJD: I had looked into that prior to posting v1. The entire ERST storag=
e is not memory mapped, just an exchange buffer. So the hostmem backend is =
not suitable for this purpose.
>
> Is there a compelling reason why it can't be memory mapped?
>
> EJD: Well, this ERST device I've coded pretty much follows the ACPI ERST =
spec verbatim. As it stands today, the spec doesn't provide a way to report=
 the total size of the persistent storage behind the interface; you know wh=
en storage is full only when you receive an Out Of Storage error code upon =
write. In a sense, that allows the size of the storage to vary greatly and =
be implemented in any way needed (ie actual hardware, this has tended to be=
 in the 64KiB range when it is carved out of system parallel flash memory, =
but some hardware uses serial flash as well). In virtual environments, it c=
an be of any size, and we at Oracle have intentions of heavily utilizing AC=
PI ERST to stuff all kinds of diagnostic information into it, thus wanting =
the storage to be very large. By not actually exposing/memory-mapping the s=
torage, the issue of where to drop it in the memory map goes away (yes a PC=
I BAR could solve this).
> EJD: But at the end of the day, could this storage be memory mapped? I su=
ppose it could be, but then that rather circumvents the entire need for the=
 ACPI ERST interface to start with. Linux and Windows both already know how=
 to utilize ACPI ERST.

Maybe I wasn't clear on it, I did not propose to map storage into guest.
Only use MemoryRegion provided by backend inside of your device.
This way you can drop all file related code from your patch,
and just work with read/store info from/to memory directly.

[...]


--_000_CO1PR10MB4531ACA8EFC99E57809E1499975B9CO1PR10MB4531namp_
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
I've rebased the original patches on to qemu-v6.0.0-rc4, and finally have e=
verything working as it previously did.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I've started now to work to incorporate the HostMemoryBackendFile; that is =
progressing.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
My question for you today is with regard to placing ERST device on PCI. The=
 PCI example provided is a template device, and while I do find that helpfu=
l, I still do not understand how the ERST Actions, which contain GAS for de=
scribing the register accesses,
 would be patched/linked when a PCI bar is assigned. Or is there perhaps an=
other way of obtaining the PCI BAR using ACPI semantics?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks,</div>
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
<b>Sent:</b> Wednesday, April 14, 2021 4:17 AM<br>
<b>To:</b> Eric DeVolder &lt;eric.devolder@oracle.com&gt;<br>
<b>Cc:</b> ehabkost@redhat.com &lt;ehabkost@redhat.com&gt;; mst@redhat.com =
&lt;mst@redhat.com&gt;; Konrad Wilk &lt;konrad.wilk@oracle.com&gt;; qemu-de=
vel@nongnu.org &lt;qemu-devel@nongnu.org&gt;; pbonzini@redhat.com &lt;pbonz=
ini@redhat.com&gt;; Boris Ostrovsky &lt;boris.ostrovsky@oracle.com&gt;;
 rth@twiddle.net &lt;rth@twiddle.net&gt;; jusual@redhat.com &lt;jusual@redh=
at.com&gt;<br>
<b>Subject:</b> Re: [PATCH v2 3/7] ACPI ERST: support for ACPI ERST feature=
</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Fri, 9 Apr 2021 15:54:47 +0000<br>
Eric DeVolder &lt;eric.devolder@oracle.com&gt; wrote:<br>
<br>
&gt; Hi Igor,<br>
&gt; Thank you for reviewing. I've responded inline below.<br>
&gt; eric<br>
&gt; <br>
&gt; ________________________________<br>
&gt; From: Igor Mammedov &lt;imammedo@redhat.com&gt;<br>
&gt; Sent: Tuesday, April 6, 2021 2:31 PM<br>
&gt; To: Eric DeVolder &lt;eric.devolder@oracle.com&gt;<br>
&gt; Cc: mst@redhat.com &lt;mst@redhat.com&gt;; marcel.apfelbaum@gmail.com =
&lt;marcel.apfelbaum@gmail.com&gt;; pbonzini@redhat.com &lt;pbonzini@redhat=
.com&gt;; rth@twiddle.net &lt;rth@twiddle.net&gt;; ehabkost@redhat.com &lt;=
ehabkost@redhat.com&gt;; qemu-devel@nongnu.org &lt;qemu-devel@nongnu.org&gt=
;;
 Boris Ostrovsky &lt;boris.ostrovsky@oracle.com&gt;; kwilk@oracle.com &lt;k=
wilk@oracle.com&gt;<br>
&gt; Subject: Re: [PATCH v2 3/7] ACPI ERST: support for ACPI ERST feature<b=
r>
&gt; <br>
&gt; On Mon,&nbsp; 8 Feb 2021 15:57:55 -0500<br>
&gt; Eric DeVolder &lt;eric.devolder@oracle.com&gt; wrote:<br>
&gt; <br>
&gt; &gt; This change implements the support for the ACPI ERST feature[1,2]=
.<br>
&gt; &gt;<br>
&gt; &gt; The size of the ACPI ERST storage is declared via the QEMU<br>
&gt; &gt; global parameter acpi-erst.size. The size can range from 64KiB<br=
>
&gt; &gt; to to 64MiB. The default is 64KiB.<br>
&gt; &gt;<br>
&gt; &gt; The location of the ACPI ERST storage backing file is delared<br>
&gt; &gt; via the QEMU global parameter acpi-erst.filename. The default<br>
&gt; &gt; is acpi-erst.backing.<br>
&gt; &gt;<br>
&gt; &gt; [1] &quot;Advanced Configuration and Power Interface Specificatio=
n&quot;,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; version 6.2, May 2017.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"https://www.uefi.org/sites/def=
ault/files/resources/ACPI_6_2.pdf">
https://www.uefi.org/sites/default/files/resources/ACPI_6_2.pdf</a><br>
&gt; &gt;<br>
&gt; &gt; [2] &quot;Unified Extensible Firmware Interface Specification&quo=
t;,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; version 2.8, March 2019.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"https://uefi.org/sites/default=
/files/resources/UEFI_Spec_2_8_final.pdf">
https://uefi.org/sites/default/files/resources/UEFI_Spec_2_8_final.pdf</a><=
br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Eric DeVolder &lt;eric.devolder@oracle.com&gt;&nbs=
p; <br>
&gt; <br>
&gt; items 2/4/5 from v1 review still need to be addressed.<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; 2. patch is too big to review, please split it up in smaller chun=
ks.<br>
&gt; &gt;<br>
&gt; &gt; EJD: Done.&nbsp; <br>
&gt; <br>
&gt; (separating a header and a makefile rule doesn't make much sense)<br>
&gt; <br>
&gt; it should be split at least on part that implements device model and A=
CPI parts<br>
&gt; <br>
&gt; EJD: I'll rebase this patch set on qemu-6 and accommodate your suggest=
ions with how to split/organize the patch set.<br>
&gt; <br>
&gt; [...]<br>
&gt; &gt;<br>
&gt; &gt; 4. Maybe instead of SYSBUS device, implement it as a PCI device a=
nd<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; use its BAR/control registers for pstore storag=
e and control interface.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; It could save you headache of picking address w=
here to map it +<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; it would take care of migration part automatica=
lly, as firmware<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; would do it for you and then QEMU could pickup =
firmware programmed<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; address and put it into ERST table.<br>
&gt; &gt; EJD: Thanks for the idea. For now I've left it as a SYSBUS device=
; we can revisit as needed.&nbsp;
<br>
&gt; <br>
&gt; I would really prefer to see a PCI version (current way is just a hack=
)<br>
&gt; <br>
&gt; EJD: I understand, I don't like the base address problem either. Is th=
ere an example PCI device that gets its base address assigned during ACPI s=
etup that I could reference and pattern this work after? I've been using SY=
SBUS as that most closely mimics the
 real hardware implementations I've studied in order to produce this code.<=
br>
&gt; EJD: I thought my inexperience with authoring QEMU devices was the pri=
mary problem in establishing a solution for the base address. Otherwise, th=
is thing only needs a single 4KiB page (for the 2 registers + exchange buff=
er) exposed.<br>
<br>
I don't recall if we merged example PCI device in QEMU, but someone worked =
on it before.<br>
Google search yields following:<br>
&nbsp;<a href=3D"https://github.com/grandemk/qemu_devices/commit/ba8d38a858=
ba63ef4d419a926f58328b9675fc98">https://github.com/grandemk/qemu_devices/co=
mmit/ba8d38a858ba63ef4d419a926f58328b9675fc98</a><br>
<br>
<br>
&gt; &gt; 5. instead of dealing with file for storage directly, reuse hostm=
em backend<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; to provide it to for your device. ex: pc-dimm. =
i.e. split device<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; on frontend and backend<br>
&gt; &gt;<br>
&gt; &gt; EJD: I had looked into that prior to posting v1. The entire ERST =
storage is not memory mapped, just an exchange buffer. So the hostmem backe=
nd is not suitable for this purpose.&nbsp;
<br>
&gt; <br>
&gt; Is there a compelling reason why it can't be memory mapped?<br>
&gt; <br>
&gt; EJD: Well, this ERST device I've coded pretty much follows the ACPI ER=
ST spec verbatim. As it stands today, the spec doesn't provide a way to rep=
ort the total size of the persistent storage behind the interface; you know=
 when storage is full only when you
 receive an Out Of Storage error code upon write. In a sense, that allows t=
he size of the storage to vary greatly and be implemented in any way needed=
 (ie actual hardware, this has tended to be in the 64KiB range when it is c=
arved out of system parallel flash
 memory, but some hardware uses serial flash as well). In virtual environme=
nts, it can be of any size, and we at Oracle have intentions of heavily uti=
lizing ACPI ERST to stuff all kinds of diagnostic information into it, thus=
 wanting the storage to be very
 large. By not actually exposing/memory-mapping the storage, the issue of w=
here to drop it in the memory map goes away (yes a PCI BAR could solve this=
).<br>
&gt; EJD: But at the end of the day, could this storage be memory mapped? I=
 suppose it could be, but then that rather circumvents the entire need for =
the ACPI ERST interface to start with. Linux and Windows both already know =
how to utilize ACPI ERST.<br>
<br>
Maybe I wasn't clear on it, I did not propose to map storage into guest.<br=
>
Only use MemoryRegion provided by backend inside of your device.<br>
This way you can drop all file related code from your patch,<br>
and just work with read/store info from/to memory directly.<br>
<br>
[...]<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_CO1PR10MB4531ACA8EFC99E57809E1499975B9CO1PR10MB4531namp_--

