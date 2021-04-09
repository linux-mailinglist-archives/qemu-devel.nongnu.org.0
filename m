Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 673C735A273
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 17:57:42 +0200 (CEST)
Received: from localhost ([::1]:35256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUtVt-0003t4-8S
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 11:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lUtTQ-00030H-EZ
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 11:55:08 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:34216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lUtTG-0002MC-Gm
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 11:55:07 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 139FZBmm110547;
 Fri, 9 Apr 2021 15:54:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=5mG9KerNjkPS97QAAQSSXoPft7vm/hAkuw9PxWPv43s=;
 b=lhoxcWTFlti/DDAsiFmBu6Y9XSBHKCIA1pDX6gDS3G9zAXJBRPeNshFi7u7OFPOTsiWS
 KvaU/pYtXKkRLkJHXyP8+vN1HWk4Nm/ly/2f8zRhSKvAXLsarD5sXYcLgKDI+c4pT5gv
 A+rdbPaU9UWuj8NUTvGXGIyRxHrvaoIMneEPqsD7Ro/Masym0pZFNxYVE/o1lNbdSH3C
 EqqS+BrpHagMp8NfY5Blwm4f7HxlQ34rgj5RLmPXfV51eOe8jbK1fTou2uNYO5lfSoDa
 3AulwLWIbFOU3HkJPbd4IDldw5jLhuKGzzu+PfOztLFKXGP+GXh/V/BMb1Bs+hflm9lF /g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 37rvaw9vf7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 09 Apr 2021 15:54:51 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 139FaE0D074377;
 Fri, 9 Apr 2021 15:54:51 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
 by aserp3030.oracle.com with ESMTP id 37rvbhrq9q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 09 Apr 2021 15:54:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+yZDoSDMKCPWdmAif3Oq3MAAbCQ7iB1/kwpdDQhSB2gpZSRNe5ZOdCp51whH6M/KFJqicIEUZDsYznXixdIRU8UfuMRTcbFCWWhL/OrdcPpCWpUTjeqj/QfF1Atl5gSQXe/u0Xa+S5L44IvaY8ul326Wo8bx8+0EZnM7KMx+MplpMgNMSlAM8l/O/UBG8xW/GdQzbbrUGcw+luAYmwfXmEipVV+HsvLLFY6FStQeYAXDUiVofb10Y2FHuQNrNl3DD2y0hA0oPysb15qn7EI9j1gTGOJQUc9dmkxwSy3KhazistL43ZmmTFzyWyszQiLLNLYbBZQtNyT1GOpydERQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mG9KerNjkPS97QAAQSSXoPft7vm/hAkuw9PxWPv43s=;
 b=DnVlngGKtXxXtRetGgfaYakmKWiSiAnMaTq6JDSQVy7+ikzjCfMgIQU+SvtjTami+wFg3szeYP0fWhBxAoRVHReRgQLmJqKizZ9U9ZQ3n8mONLdrp8HTZjvpADZYSlotI4Ov3FqqWR9JKSA6W9mijhPPCFY0uM+ErAeGHFQhtDBD5zfW1eE5Fld2vfCxoD23iiNYkrj8iKpKzO8lwxo6P4E0r0wq7Hzm7SiGghXs8RmjkJoo8irNNgZnyuGYCDRT1Itz61UXppmGusR5c50EXzB/49raO3R6hT33Ljn+baspcvgqDMeCjuldCMzcW7pGPlZgR6PN5E/yeTOOc5UAww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mG9KerNjkPS97QAAQSSXoPft7vm/hAkuw9PxWPv43s=;
 b=QOB1/nryPWwlCO/XdovDDk5986KvT6iAoxc692hnwIh6VZbue/BX/WjZDBconXD5cGo0KyZJY7VzJgpFtF7HLIOnq2X/bp5PgYhsxsaQ1hKBv9CL+j95B1Sec7TaxLOZDPkiZncUh/MTtnyGmjEoBR6T4jFHuQI019Wr+gRTqMo=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB4514.namprd10.prod.outlook.com (2603:10b6:303:9d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Fri, 9 Apr
 2021 15:54:47 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::2c38:cf0c:fee8:d429]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::2c38:cf0c:fee8:d429%4]) with mapi id 15.20.4020.016; Fri, 9 Apr 2021
 15:54:47 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v2 3/7] ACPI ERST: support for ACPI ERST feature
Thread-Topic: [PATCH v2 3/7] ACPI ERST: support for ACPI ERST feature
Thread-Index: AQHW/l0fQlwSEv68gU2Ur30xmG3nWKqoOiqAgARyYec=
Date: Fri, 9 Apr 2021 15:54:47 +0000
Message-ID: <CO1PR10MB4531392E4B963B163A0FC89C97739@CO1PR10MB4531.namprd10.prod.outlook.com>
References: <1612817879-21511-1-git-send-email-eric.devolder@oracle.com>
 <1612817879-21511-4-git-send-email-eric.devolder@oracle.com>,
 <20210406213131.21045f68@redhat.com>
In-Reply-To: <20210406213131.21045f68@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [138.3.201.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3f6c617a-86c2-468b-18a7-08d8fb6fcd5b
x-ms-traffictypediagnostic: CO1PR10MB4514:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR10MB45149A69F677850F8DABB82E97739@CO1PR10MB4514.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: joHgakNMdVirR3axg9T1Phj1AIzKSORBGXUFFHXM4tnGGDR5xW5GWG5UQogXdH/i86ZV+B5FQVf/BLQc4OO/Qed6wbp8mi/vsMIwUGmIGVRN27yHQgHWc3cWV6n60RSid5+k0Wi1vwgdMJPkGunfQCdvcnkYN7a7On3IR3qR5l1R46/4SzPNk3VdrYWHUsi7JGTAOvFSd306UpFRK1rp+VBiJpMFfGHithdfQEm6pxTPMpFIqfn3/R6XEW4JZwvAS0Q4OttiD5fWvdSLAJKSB31tRLWh7Ufzoy87xkCLUwhFifKFCaGqN12qSybHm+5VBr62EDq0BrxkynghWpvoTXz07jUmiIXCd7DYPu9NxP4YDG+PAZX6ORBmE/ZL8VusPWMiqQurEyxIx55bpIBw1L5mWnDKR8HwGyH9YZWTFppe/beJsLvCBgVxwPpAhddUa5WDicNui4mPYLHk0nd6Rc9ONphZPfC24HsoimXPE1DhQUn2KVj1SQiby+UFNKPVXioUfiCh8RCotk1jRgnMqFauoUWNtgPpRk3HCK/Ijm9bY81Lu1KMCldgZ80A1tUkmSEnxXJr4M50+46vpHdSBSY1uWXAJgUpYUnkiXUV+HEKZrLrTDFS7olLi5M4F1VEJ4IgS9Mk1bmNfNOR+CM70j0wiryegAeEEOnptwiibHLbzjhhrQW76GfQUN9kkiZAy/Rvvb8L+qq0o7o4oX/DPrW6gwVk3Nj+OmmuuMrwQsAIwHjamUyd9zbPqGKMg6OO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(346002)(366004)(376002)(396003)(186003)(86362001)(66446008)(66946007)(76116006)(33656002)(66556008)(83380400001)(52536014)(8936002)(107886003)(64756008)(66476007)(9686003)(4326008)(8676002)(19627405001)(7696005)(6506007)(53546011)(26005)(54906003)(966005)(478600001)(5660300002)(71200400001)(2906002)(38100700001)(55016002)(30864003)(166002)(6916009)(316002)(2004002)(559001)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?XW4sCbrylO5NSLh5hx6t7xp6C37XaO0k980qVu8qVihMTy2Yt9n2+UduHa?=
 =?iso-8859-1?Q?HvulxXZNJcOsyLB4q/JcvjR05EH/43yYksZzCwk8rFaROOOLCbB7x9eKwH?=
 =?iso-8859-1?Q?pTywZO+QgNxaOaPa5x4VCv9hKdAW2eQ7PmeLRLep0Oqktvo0oCC1AcaysO?=
 =?iso-8859-1?Q?yNM51w5LYngd5sPZ0+ckMTa3WD/gfGqJm9Ihwdcm3NzHC6nAcV9qrjf5hB?=
 =?iso-8859-1?Q?UNjzZ02FrBoykx6fXahr0pOG/Y4eSjBpAAkd7f86VvJroj4MCtN61ZMttH?=
 =?iso-8859-1?Q?dcpeKpc11g4l1lQ8LmjP0TwtRS6vWT0g1K+ev9VvzvK6+Wqm8mRYxH+ohk?=
 =?iso-8859-1?Q?1XHNN+0Rck1ZNyaqcWlgtjYJUP7Z1FeXsBbyn8RMJQCmlruVnFZKamj352?=
 =?iso-8859-1?Q?VWM0Iz/CM/Z3k6eDM1MmiO+DvJ8UNfKpkHRKNF1qlhcyRVKNpBL6tQ5AW0?=
 =?iso-8859-1?Q?dfSYfw9+H+hj/pRh1+ACxG9E56wZBOXo0SWAvjHSAH/O2iEG74R5JU9us6?=
 =?iso-8859-1?Q?j6idDX5bZE1b9t2ADJu7VsTrRrYyDM68wvvYHbM4agfqlwPxHwO5OwZEN/?=
 =?iso-8859-1?Q?0syhChy7lcYEpIA8ZnuZdor7qjHrczuwTm/R4uoDFYXvDvb7DepdrquV8n?=
 =?iso-8859-1?Q?t3p3sVb+TzoK5HSvQuIwAfzUBooqR1M+/cAh2pkw7NdcMLURYqU+GhHD0U?=
 =?iso-8859-1?Q?jRdJuAxU7+4OIFVCBSNeQKDhP/OfxSMDVoJ6FnR2Zwjh/26w6YyVBE46xT?=
 =?iso-8859-1?Q?/a6QMX1z3/6+nvUvpNiON7dvVSPn4aAaeZMClPbz3CI57gWjDdTtDSXH3A?=
 =?iso-8859-1?Q?ENeb68xxnboR9WIy4Saw/uefScNvPhvv1hS6s9OyS5UVrOx7Yb8J31S/6m?=
 =?iso-8859-1?Q?BQN9fim2EkOlkfeEUTSQc66zujDVKADHyTx9Fgm5vdwqe7Rebpsn5mLocQ?=
 =?iso-8859-1?Q?zF88ge+MGpiKQJ+EdhsiOnv987SC0vfltaeZjMOX1cFL5tbEOl95TKFDn8?=
 =?iso-8859-1?Q?ZfjlEzT95WaKUlYdeankI5DXOYVStDB2JqkBbhmt/Gl13vO1/+qdro4R/P?=
 =?iso-8859-1?Q?R61QFbWTpgvW3O+NEKeGeLMtbg+4cL2msWijGCkbUEebyiRqu29/an430m?=
 =?iso-8859-1?Q?WBvn+wjoADZs5mYYzfsCeSwZ0aT8APt4mX90HtG39tE77Hti8YX4lMEv9N?=
 =?iso-8859-1?Q?bBtSxf3ihTy37ItikbeDjOC8oN2FmbencbM5jqy8hiFC22Kam0xMzGPB6e?=
 =?iso-8859-1?Q?Odr+Z6aY1tC+XW+2mQQ9bEm0lrl3vDNMu1L4TNwS08yvuSg5FUw8ULVPmQ?=
 =?iso-8859-1?Q?XUO4GGyqwNEnviy5BpVi//MsVL1M9Dw+nqo1HzfmvPvg9gc=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CO1PR10MB4531392E4B963B163A0FC89C97739CO1PR10MB4531namp_"
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f6c617a-86c2-468b-18a7-08d8fb6fcd5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2021 15:54:47.7011 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yUZRFjLZutohbm66nOYtDquwWoKMpMs7Hm4B6Hf4/srIOn6LGR8p93cHD+Qq+lJPZd8kU4e5iHn0sRAFpzk76uJtyJnRpsoKzz85SqkZmZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4514
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9949
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 malwarescore=0 mlxscore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104090113
X-Proofpoint-ORIG-GUID: R_pg6myIvGDGrHd1_vXVn5qd8nTmmyZ5
X-Proofpoint-GUID: R_pg6myIvGDGrHd1_vXVn5qd8nTmmyZ5
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9949
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104090113
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
 "mst@redhat.com" <mst@redhat.com>, Konrad Wilk <konrad.wilk@oracle.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_CO1PR10MB4531392E4B963B163A0FC89C97739CO1PR10MB4531namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Igor,
Thank you for reviewing. I've responded inline below.
eric

________________________________
From: Igor Mammedov <imammedo@redhat.com>
Sent: Tuesday, April 6, 2021 2:31 PM
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: mst@redhat.com <mst@redhat.com>; marcel.apfelbaum@gmail.com <marcel.apf=
elbaum@gmail.com>; pbonzini@redhat.com <pbonzini@redhat.com>; rth@twiddle.n=
et <rth@twiddle.net>; ehabkost@redhat.com <ehabkost@redhat.com>; qemu-devel=
@nongnu.org <qemu-devel@nongnu.org>; Boris Ostrovsky <boris.ostrovsky@oracl=
e.com>; kwilk@oracle.com <kwilk@oracle.com>
Subject: Re: [PATCH v2 3/7] ACPI ERST: support for ACPI ERST feature

On Mon,  8 Feb 2021 15:57:55 -0500
Eric DeVolder <eric.devolder@oracle.com> wrote:

> This change implements the support for the ACPI ERST feature[1,2].
>
> The size of the ACPI ERST storage is declared via the QEMU
> global parameter acpi-erst.size. The size can range from 64KiB
> to to 64MiB. The default is 64KiB.
>
> The location of the ACPI ERST storage backing file is delared
> via the QEMU global parameter acpi-erst.filename. The default
> is acpi-erst.backing.
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
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>

items 2/4/5 from v1 review still need to be addressed.

>
> 2. patch is too big to review, please split it up in smaller chunks.
>
> EJD: Done.

(separating a header and a makefile rule doesn't make much sense)

it should be split at least on part that implements device model and ACPI p=
arts

EJD: I'll rebase this patch set on qemu-6 and accommodate your suggestions =
with how to split/organize the patch set.

[...]
>
> 4. Maybe instead of SYSBUS device, implement it as a PCI device and
>    use its BAR/control registers for pstore storage and control interface=
.
>    It could save you headache of picking address where to map it +
>    it would take care of migration part automatically, as firmware
>    would do it for you and then QEMU could pickup firmware programmed
>    address and put it into ERST table.
> EJD: Thanks for the idea. For now I've left it as a SYSBUS device; we can=
 revisit as needed.

I would really prefer to see a PCI version (current way is just a hack)

EJD: I understand, I don't like the base address problem either. Is there a=
n example PCI device that gets its base address assigned during ACPI setup =
that I could reference and pattern this work after? I've been using SYSBUS =
as that most closely mimics the real hardware implementations I've studied =
in order to produce this code.
EJD: I thought my inexperience with authoring QEMU devices was the primary =
problem in establishing a solution for the base address. Otherwise, this th=
ing only needs a single 4KiB page (for the 2 registers + exchange buffer) e=
xposed.

> 5. instead of dealing with file for storage directly, reuse hostmem backe=
nd
>    to provide it to for your device. ex: pc-dimm. i.e. split device
>    on frontend and backend
>
> EJD: I had looked into that prior to posting v1. The entire ERST storage =
is not memory mapped, just an exchange buffer. So the hostmem backend is no=
t suitable for this purpose.

Is there a compelling reason why it can't be memory mapped?

EJD: Well, this ERST device I've coded pretty much follows the ACPI ERST sp=
ec verbatim. As it stands today, the spec doesn't provide a way to report t=
he total size of the persistent storage behind the interface; you know when=
 storage is full only when you receive an Out Of Storage error code upon wr=
ite. In a sense, that allows the size of the storage to vary greatly and be=
 implemented in any way needed (ie actual hardware, this has tended to be i=
n the 64KiB range when it is carved out of system parallel flash memory, bu=
t some hardware uses serial flash as well). In virtual environments, it can=
 be of any size, and we at Oracle have intentions of heavily utilizing ACPI=
 ERST to stuff all kinds of diagnostic information into it, thus wanting th=
e storage to be very large. By not actually exposing/memory-mapping the sto=
rage, the issue of where to drop it in the memory map goes away (yes a PCI =
BAR could solve this).
EJD: But at the end of the day, could this storage be memory mapped? I supp=
ose it could be, but then that rather circumvents the entire need for the A=
CPI ERST interface to start with. Linux and Windows both already know how t=
o utilize ACPI ERST.




> ---
>  hw/acpi/erst.c | 952 +++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 952 insertions(+)
>  create mode 100644 hw/acpi/erst.c
>
> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
> new file mode 100644
> index 0000000..3a342f9
> --- /dev/null
> +++ b/hw/acpi/erst.c
> @@ -0,0 +1,952 @@
> +/*
> + * ACPI Error Record Serialization Table, ERST, Implementation
> + *
> + * Copyright (c) 2020 Oracle and/or its affiliates.
> + *
> + * See ACPI specification,
> + * "ACPI Platform Error Interfaces" : "Error Serialization"
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation;
> + * version 2 of the License.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see <http://www.gnu.org/lice=
nses/>
> + */
> +
> +#include <sys/types.h>
> +#include <sys/stat.h>
> +#include <unistd.h>
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "hw/sysbus.h"
> +#include "qom/object_interfaces.h"
> +#include "qemu/error-report.h"
> +#include "migration/vmstate.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/acpi/acpi.h"
> +#include "hw/acpi/acpi-defs.h"
> +#include "hw/acpi/aml-build.h"
> +#include "hw/acpi/bios-linker-loader.h"
> +#include "exec/address-spaces.h"
> +#include "hw/acpi/erst.h"
> +
> +#ifdef _ERST_DEBUG
> +#define erst_debug(fmt, ...) \
> +    do { fprintf(stderr, fmt, ## __VA_ARGS__); fflush(stderr); } while (=
0)
> +#else
> +#define erst_debug(fmt, ...) do { } while (0)
> +#endif
> +
> +/* See UEFI spec, Appendix N Common Platform Error Record */
> +/* UEFI CPER allows for an OSPM book keeping area in the record */
> +#define UEFI_CPER_RECORD_MIN_SIZE 128U
> +#define UEFI_CPER_SIZE_OFFSET 20U
> +#define UEFI_CPER_RECORD_ID_OFFSET 96U
> +#define IS_UEFI_CPER_RECORD(ptr) \
> +    (((ptr)[0] =3D=3D 'C') && \
> +     ((ptr)[1] =3D=3D 'P') && \
> +     ((ptr)[2] =3D=3D 'E') && \
> +     ((ptr)[3] =3D=3D 'R'))
> +#define THE_UEFI_CPER_RECORD_ID(ptr) \
> +    (*(uint64_t *)(&(ptr)[UEFI_CPER_RECORD_ID_OFFSET]))
> +
> +#define ERST_INVALID_RECORD_ID (~0UL)
> +#define ERST_EXECUTE_OPERATION_MAGIC 0x9CUL
> +#define ERST_CSR_ACTION (0UL << 3) /* action (cmd) */
> +#define ERST_CSR_VALUE  (1UL << 3) /* argument/value (data) */
> +
> +/*
> + * As ERST_IOMEM_SIZE is used to map the ERST into the guest,
> + * it should/must be an integer multiple of PAGE_SIZE.
> + * NOTE that any change to this value will make any pre-
> + * existing backing files, not of the same ERST_IOMEM_SIZE,
> + * unusable to the guest.
> + */
> +#define ERST_IOMEM_SIZE (2UL * 4096)
> +
> +/*
> + * This implementation is an ACTION (cmd) and VALUE (data)
> + * interface consisting of just two 64-bit registers.
> + */
> +#define ERST_REG_LEN (2UL * sizeof(uint64_t))
> +
> +/*
> + * The space not utilized by the register interface is the
> + * buffer for exchanging ERST record contents.
> + */
> +#define ERST_RECORD_SIZE (ERST_IOMEM_SIZE - ERST_REG_LEN)
> +
> +/*
> + * Mode to be used for backing file
> + */
> +#define ERST_BACKING_FILE_MODE 0644 /* S_IRWXU|S_IRWXG */
> +
> +#define ACPIERST(obj) \
> +    OBJECT_CHECK(ERSTDeviceState, (obj), TYPE_ACPI_ERST)
> +#define ACPIERST_CLASS(oc) \
> +    OBJECT_CLASS_CHECK(ERSTDeviceStateClass, (oc), TYPE_ACPI_ERST)
> +#define ACPIERST_GET_CLASS(obj) \
> +    OBJECT_GET_CLASS(ERSTDeviceStateClass, (obj), TYPE_ACPI_ERST)
> +
> +static hwaddr erst_base;
> +
> +typedef struct {
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion iomem;
> +    uint32_t prop_size;
> +    char *prop_filename;
> +    hwaddr base;
> +
> +    uint8_t operation;
> +    uint8_t busy_status;
> +    uint8_t command_status;
> +    uint32_t record_offset;
> +    uint32_t record_count;
> +    uint64_t reg_action;
> +    uint64_t reg_value;
> +    uint64_t record_identifier;
> +
> +    unsigned next_record_index;
> +    uint8_t record[ERST_RECORD_SIZE]; /* read/written directly by guest =
*/
> +    uint8_t tmp_record[ERST_RECORD_SIZE]; /* intermediate manipulation b=
uffer */
> +    uint8_t *nvram; /* persistent storage, of length prop_size */
> +
> +} ERSTDeviceState;
> +
> +static void update_erst_backing_file(ERSTDeviceState *s,
> +    off_t offset, const uint8_t *data, size_t length)
> +{
> +    int fd;
> +
> +    /* Bounds check */
> +    if ((offset + length) > s->prop_size) {
> +        error_report("update: off 0x%lx len 0x%lx > size 0x%lx out of ra=
nge",
> +            (long)offset, (long)length, (long)s->prop_size);
> +        return;
> +    }
> +
> +    fd =3D open(s->prop_filename, O_WRONLY | O_CREAT, ERST_BACKING_FILE_=
MODE);
> +    if (fd > 0) {
> +        off_t src;
> +        size_t wrc =3D 0;
> +        src =3D lseek(fd, offset, SEEK_SET);
> +        if (offset =3D=3D src) {
> +            wrc =3D write(fd, data, length);
> +        }
> +        if ((offset !=3D src) || (length !=3D wrc)) {
> +            error_report("ERST write failed: %d %d", (int)wrc, (int)leng=
th);
> +        }
> +        close(fd);
> +    } else {
> +        error_report("open failed: %s : %d", s->prop_filename, fd);
> +    }
> +}
> +
> +static unsigned copy_from_nvram_by_index(ERSTDeviceState *s, unsigned in=
dex)
> +{
> +    /* Read a nvram[] entry into tmp_record */
> +    unsigned rc =3D ACPI_ERST_STATUS_FAILED;
> +    off_t offset =3D (index * ERST_RECORD_SIZE);
> +
> +    if ((offset + ERST_RECORD_SIZE) <=3D s->prop_size) {
> +        memcpy(s->tmp_record, &s->nvram[offset], ERST_RECORD_SIZE);
> +        rc =3D ACPI_ERST_STATUS_SUCCESS;
> +    }
> +    return rc;
> +}
> +
> +static unsigned copy_to_nvram_by_index(ERSTDeviceState *s, unsigned inde=
x)
> +{
> +    /* Write entry in tmp_record into nvram[], and backing file */
> +    unsigned rc =3D ACPI_ERST_STATUS_FAILED;
> +    off_t offset =3D (index * ERST_RECORD_SIZE);
> +
> +    if ((offset + ERST_RECORD_SIZE) <=3D s->prop_size) {
> +        memcpy(&s->nvram[offset], s->tmp_record, ERST_RECORD_SIZE);
> +        update_erst_backing_file(s, offset, s->tmp_record, ERST_RECORD_S=
IZE);
> +        rc =3D ACPI_ERST_STATUS_SUCCESS;
> +    }
> +    return rc;
> +}
> +
> +static int lookup_erst_record_by_identifier(ERSTDeviceState *s,
> +    uint64_t record_identifier, bool *record_found, bool alloc_for_write=
)
> +{
> +    int rc =3D -1;
> +    int empty_index =3D -1;
> +    int index =3D 0;
> +    unsigned rrc;
> +
> +    *record_found =3D 0;
> +
> +    do {
> +        rrc =3D copy_from_nvram_by_index(s, (unsigned)index);
> +        if (rrc =3D=3D ACPI_ERST_STATUS_SUCCESS) {
> +            uint64_t this_identifier;
> +            this_identifier =3D THE_UEFI_CPER_RECORD_ID(s->tmp_record);
> +            if (IS_UEFI_CPER_RECORD(s->tmp_record) &&
> +                (this_identifier =3D=3D record_identifier)) {
> +                rc =3D index;
> +                *record_found =3D 1;
> +                break;
> +            }
> +            if ((this_identifier =3D=3D ERST_INVALID_RECORD_ID) &&
> +                (empty_index < 0)) {
> +                empty_index =3D index; /* first available for write */
> +            }
> +        }
> +        ++index;
> +    } while (rrc =3D=3D ACPI_ERST_STATUS_SUCCESS);
> +
> +    /* Record not found, allocate for writing */
> +    if ((rc < 0) && alloc_for_write) {
> +        rc =3D empty_index;
> +    }
> +
> +    return rc;
> +}
> +
> +static unsigned clear_erst_record(ERSTDeviceState *s)
> +{
> +    unsigned rc =3D ACPI_ERST_STATUS_RECORD_NOT_FOUND;
> +    bool record_found;
> +    int index;
> +
> +    index =3D lookup_erst_record_by_identifier(s,
> +        s->record_identifier, &record_found, 0);
> +    if (record_found) {
> +        memset(s->tmp_record, 0xFF, ERST_RECORD_SIZE);
> +        rc =3D copy_to_nvram_by_index(s, (unsigned)index);
> +        if (rc =3D=3D ACPI_ERST_STATUS_SUCCESS) {
> +            s->record_count -=3D 1;
> +        }
> +    }
> +
> +    return rc;
> +}
> +
> +static unsigned write_erst_record(ERSTDeviceState *s)
> +{
> +    unsigned rc =3D ACPI_ERST_STATUS_FAILED;
> +
> +    if (s->record_offset < (ERST_RECORD_SIZE - UEFI_CPER_RECORD_MIN_SIZE=
)) {
> +        uint64_t record_identifier;
> +        uint8_t *record =3D &s->record[s->record_offset];
> +        bool record_found;
> +        int index;
> +
> +        record_identifier =3D (s->record_identifier =3D=3D ERST_INVALID_=
RECORD_ID)
> +            ? THE_UEFI_CPER_RECORD_ID(record) : s->record_identifier;
> +
> +        index =3D lookup_erst_record_by_identifier(s,
> +            record_identifier, &record_found, 1);
> +        if (index < 0) {
> +            rc =3D ACPI_ERST_STATUS_NOT_ENOUGH_SPACE;
> +        } else {
> +            if (0 !=3D s->record_offset) {
> +                memset(&s->tmp_record[ERST_RECORD_SIZE - s->record_offse=
t],
> +                    0xFF, s->record_offset);
> +            }
> +            memcpy(s->tmp_record, record, ERST_RECORD_SIZE - s->record_o=
ffset);
> +            rc =3D copy_to_nvram_by_index(s, (unsigned)index);
> +            if (rc =3D=3D ACPI_ERST_STATUS_SUCCESS) {
> +                if (!record_found) { /* not overwriting existing record =
*/
> +                    s->record_count +=3D 1; /* writing new record */
> +                }
> +            }
> +        }
> +    }
> +
> +    return rc;
> +}
> +
> +static unsigned next_erst_record(ERSTDeviceState *s,
> +    uint64_t *record_identifier)
> +{
> +    unsigned rc =3D ACPI_ERST_STATUS_RECORD_NOT_FOUND;
> +    unsigned index;
> +    unsigned rrc;
> +
> +    *record_identifier =3D ERST_INVALID_RECORD_ID;
> +
> +    index =3D s->next_record_index;
> +    do {
> +        rrc =3D copy_from_nvram_by_index(s, (unsigned)index);
> +        if (rrc =3D=3D ACPI_ERST_STATUS_SUCCESS) {
> +            if (IS_UEFI_CPER_RECORD(s->tmp_record)) {
> +                s->next_record_index =3D index + 1; /* where to start ne=
xt time */
> +                *record_identifier =3D THE_UEFI_CPER_RECORD_ID(s->tmp_re=
cord);
> +                rc =3D ACPI_ERST_STATUS_SUCCESS;
> +                break;
> +            }
> +            ++index;
> +        } else {
> +            if (s->next_record_index =3D=3D 0) {
> +                rc =3D ACPI_ERST_STATUS_RECORD_STORE_EMPTY;
> +            }
> +            s->next_record_index =3D 0; /* at end, reset */
> +        }
> +    } while (rrc =3D=3D ACPI_ERST_STATUS_SUCCESS);
> +
> +    return rc;
> +}
> +
> +static unsigned read_erst_record(ERSTDeviceState *s)
> +{
> +    unsigned rc =3D ACPI_ERST_STATUS_RECORD_NOT_FOUND;
> +    bool record_found;
> +    int index;
> +
> +    index =3D lookup_erst_record_by_identifier(s,
> +        s->record_identifier, &record_found, 0);
> +    if (record_found) {
> +        rc =3D copy_from_nvram_by_index(s, (unsigned)index);
> +        if (rc =3D=3D ACPI_ERST_STATUS_SUCCESS) {
> +            if (s->record_offset < ERST_RECORD_SIZE) {
> +                memcpy(&s->record[s->record_offset], s->tmp_record,
> +                    ERST_RECORD_SIZE - s->record_offset);
> +            }
> +        }
> +    }
> +
> +    return rc;
> +}
> +
> +static unsigned get_erst_record_count(ERSTDeviceState *s)
> +{
> +    /* Compute record_count */
> +    off_t offset;
> +
> +    s->record_count =3D 0;
> +    offset =3D 0;
> +    do {
> +        uint8_t *ptr =3D &s->nvram[offset];
> +        uint64_t record_identifier =3D THE_UEFI_CPER_RECORD_ID(ptr);
> +        if (IS_UEFI_CPER_RECORD(ptr) &&
> +            (ERST_INVALID_RECORD_ID !=3D record_identifier)) {
> +            s->record_count +=3D 1;
> +        }
> +        offset +=3D ERST_RECORD_SIZE;
> +    } while (offset < (off_t)s->prop_size);
> +
> +    return s->record_count;
> +}
> +
> +static void load_erst_backing_file(ERSTDeviceState *s)
> +{
> +    int fd;
> +    struct stat statbuf;
> +
> +    erst_debug("+load_erst_backing_file()\n");
> +
> +    /* Allocate and initialize nvram[] */
> +    s->nvram =3D g_malloc(s->prop_size);
> +    memset(s->nvram, 0xFF, s->prop_size);
> +
> +    /* Ensure backing file at least same as prop_size */
> +    if (stat(s->prop_filename, &statbuf) =3D=3D 0) {
> +        /* ensure prop_size at least matches file size */
> +        if (statbuf.st_size < s->prop_size) {
> +            /* Ensure records are ERST_INVALID_RECORD_ID */
> +            memset(s->nvram, 0xFF, s->prop_size - statbuf.st_size);
> +            update_erst_backing_file(s,
> +                statbuf.st_size, s->nvram, s->prop_size - statbuf.st_siz=
e);
> +        }
> +    }
> +
> +    /* Pre-load nvram[] from backing file, if present */
> +    fd =3D open(s->prop_filename, O_RDONLY, ERST_BACKING_FILE_MODE);
> +    if (fd > 0) {
> +        size_t rrc =3D read(fd, s->nvram, s->prop_size);
> +        (void)rrc;
> +        close(fd);
> +        /*
> +         * If existing file is smaller than prop_size, it will be resize=
d
> +         * accordingly upon subsequent record writes. If the file
> +         * is larger than prop_size, only prop_size bytes are utilized,
> +         * the extra bytes are untouched (though will be lost after
> +         * a migration when the backing file is re-written as length
> +         * of prop_size bytes).
> +         */
> +    } else {
> +        /* Create empty backing file */
> +        update_erst_backing_file(s, 0, s->nvram, s->prop_size);
> +    }
> +
> +    /* Initialize record_count */
> +    get_erst_record_count(s);
> +
> +    erst_debug("-load_erst_backing_file() %d\n", s->record_count);
> +}
> +
> +static uint64_t erst_rd_reg64(hwaddr addr,
> +    uint64_t reg, unsigned size)
> +{
> +    uint64_t rdval;
> +    uint64_t mask;
> +    unsigned shift;
> +
> +    if (size =3D=3D sizeof(uint64_t)) {
> +        /* 64b access */
> +        mask =3D 0xFFFFFFFFFFFFFFFFUL;
> +        shift =3D 0;
> +    } else {
> +        /* 32b access */
> +        mask =3D 0x00000000FFFFFFFFUL;
> +        shift =3D ((addr & 0x4) =3D=3D 0x4) ? 32 : 0;
> +    }
> +
> +    rdval =3D reg;
> +    rdval >>=3D shift;
> +    rdval &=3D mask;
> +
> +    return rdval;
> +}
> +
> +static uint64_t erst_wr_reg64(hwaddr addr,
> +    uint64_t reg, uint64_t val, unsigned size)
> +{
> +    uint64_t wrval;
> +    uint64_t mask;
> +    unsigned shift;
> +
> +    if (size =3D=3D sizeof(uint64_t)) {
> +        /* 64b access */
> +        mask =3D 0xFFFFFFFFFFFFFFFFUL;
> +        shift =3D 0;
> +    } else {
> +        /* 32b access */
> +        mask =3D 0x00000000FFFFFFFFUL;
> +        shift =3D ((addr & 0x4) =3D=3D 0x4) ? 32 : 0;
> +    }
> +
> +    val &=3D mask;
> +    val <<=3D shift;
> +    mask <<=3D shift;
> +    wrval =3D reg;
> +    wrval &=3D ~mask;
> +    wrval |=3D val;
> +
> +    return wrval;
> +}
> +
> +static void erst_write(void *opaque, hwaddr addr,
> +    uint64_t val, unsigned size)
> +{
> +    ERSTDeviceState *s =3D (ERSTDeviceState *)opaque;
> +
> +    if (addr < ERST_REG_LEN) {
> +        /*
> +         * NOTE: All actions/operations/side effects happen on the WRITE=
,
> +         * by design. The READs simply return the reg_value contents.
> +         */
> +        erst_debug("ERST write %016lx %10s val %016lx sz %u",
> +            addr, erst_reg(addr), val, size);
> +        /* The REGISTER region */
> +        switch (addr) {
> +        case ERST_CSR_VALUE + 0:
> +        case ERST_CSR_VALUE + 4:
> +            s->reg_value =3D erst_wr_reg64(addr, s->reg_value, val, size=
);
> +            break;
> +        case ERST_CSR_ACTION + 0:
> +/*      case ERST_CSR_ACTION+4: as coded, not really a 64b register */
> +            switch (val) {
> +            case ACPI_ERST_ACTION_BEGIN_WRITE_OPERATION:
> +            case ACPI_ERST_ACTION_BEGIN_READ_OPERATION:
> +            case ACPI_ERST_ACTION_BEGIN_CLEAR_OPERATION:
> +            case ACPI_ERST_ACTION_BEGIN_DUMMY_WRITE_OPERATION:
> +            case ACPI_ERST_ACTION_END_OPERATION:
> +                s->operation =3D val;
> +                break;
> +            case ACPI_ERST_ACTION_SET_RECORD_OFFSET:
> +                s->record_offset =3D s->reg_value;
> +                break;
> +            case ACPI_ERST_ACTION_EXECUTE_OPERATION:
> +                if ((uint8_t)s->reg_value =3D=3D ERST_EXECUTE_OPERATION_=
MAGIC) {
> +                    s->busy_status =3D 1;
> +                    switch (s->operation) {
> +                    case ACPI_ERST_ACTION_BEGIN_WRITE_OPERATION:
> +                        s->command_status =3D write_erst_record(s);
> +                        break;
> +                    case ACPI_ERST_ACTION_BEGIN_READ_OPERATION:
> +                        s->command_status =3D read_erst_record(s);
> +                        break;
> +                    case ACPI_ERST_ACTION_BEGIN_CLEAR_OPERATION:
> +                        s->command_status =3D clear_erst_record(s);
> +                        break;
> +                    case ACPI_ERST_ACTION_BEGIN_DUMMY_WRITE_OPERATION:
> +                        s->command_status =3D ACPI_ERST_STATUS_SUCCESS;
> +                        break;
> +                    case ACPI_ERST_ACTION_END_OPERATION:
> +                        s->command_status =3D ACPI_ERST_STATUS_SUCCESS;
> +                        break;
> +                    default:
> +                        s->command_status =3D ACPI_ERST_STATUS_FAILED;
> +                        break;
> +                    }
> +                    s->record_identifier =3D ERST_INVALID_RECORD_ID;
> +                    s->busy_status =3D 0;
> +                }
> +                break;
> +            case ACPI_ERST_ACTION_CHECK_BUSY_STATUS:
> +                s->reg_value =3D s->busy_status;
> +                break;
> +            case ACPI_ERST_ACTION_GET_COMMAND_STATUS:
> +                s->reg_value =3D s->command_status;
> +                break;
> +            case ACPI_ERST_ACTION_GET_RECORD_IDENTIFIER:
> +                s->command_status =3D next_erst_record(s, &s->reg_value)=
;
> +                break;
> +            case ACPI_ERST_ACTION_SET_RECORD_IDENTIFIER:
> +                s->record_identifier =3D s->reg_value;
> +                break;
> +            case ACPI_ERST_ACTION_GET_RECORD_COUNT:
> +                s->reg_value =3D s->record_count;
> +                break;
> +            case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE:
> +                s->reg_value =3D s->base + ERST_REG_LEN;
> +                break;
> +            case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_LENGTH:
> +                s->reg_value =3D ERST_RECORD_SIZE;
> +                break;
> +            case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES=
:
> +                s->reg_value =3D 0; /* correct/intended value */
> +                break;
> +            case ACPI_ERST_ACTION_GET_EXECUTE_OPERATION_TIMINGS:
> +                /*
> +                 * 100UL is max, 10UL is nominal
> +                 */
> +                s->reg_value =3D ((100UL << 32) | (10UL << 0));
> +                break;
> +            case ACPI_ERST_ACTION_RESERVED:
> +            default:
> +                /*
> +                 * NOP
> +                 */
> +                break;
> +            }
> +            break;
> +        default:
> +            /*
> +             * All other register writes are NO-OPs
> +             */
> +            break;
> +        }
> +    } else {
> +        /* The RECORD region */
> +        unsigned offset =3D addr - ERST_REG_LEN;
> +        uint8_t *ptr =3D &s->record[offset];
> +        switch (size) {
> +        default:
> +        case sizeof(uint8_t):
> +            *(uint8_t *)ptr =3D (uint8_t)val;
> +            break;
> +        case sizeof(uint16_t):
> +            *(uint16_t *)ptr =3D (uint16_t)val;
> +            break;
> +        case sizeof(uint32_t):
> +            *(uint32_t *)ptr =3D (uint32_t)val;
> +            break;
> +        case sizeof(uint64_t):
> +            *(uint64_t *)ptr =3D (uint64_t)val;
> +            break;
> +        }
> +    }
> +}
> +
> +static uint64_t erst_read(void *opaque, hwaddr addr,
> +                                unsigned size)
> +{
> +    ERSTDeviceState *s =3D (ERSTDeviceState *)opaque;
> +    uint64_t val =3D 0;
> +
> +    if (addr < ERST_REG_LEN) {
> +        switch (addr) {
> +        case ERST_CSR_ACTION + 0:
> +        case ERST_CSR_ACTION + 4:
> +            val =3D erst_rd_reg64(addr, s->reg_action, size);
> +            break;
> +        case ERST_CSR_VALUE + 0:
> +        case ERST_CSR_VALUE + 4:
> +            val =3D erst_rd_reg64(addr, s->reg_value, size);
> +            break;
> +        default:
> +            break;
> +        }
> +    erst_debug("ERST read  %016lx %10s val %016lx sz %u\n",
> +        addr, erst_reg(addr), val, size);
> +    } else {
> +        /*
> +         * The RECORD region
> +         */
> +        uint8_t *ptr =3D &s->record[addr - ERST_REG_LEN];
> +        switch (size) {
> +        default:
> +        case sizeof(uint8_t):
> +            val =3D *(uint8_t *)ptr;
> +            break;
> +        case sizeof(uint16_t):
> +            val =3D *(uint16_t *)ptr;
> +            break;
> +        case sizeof(uint32_t):
> +            val =3D *(uint32_t *)ptr;
> +            break;
> +        case sizeof(uint64_t):
> +            val =3D *(uint64_t *)ptr;
> +            break;
> +        }
> +    }
> +    erst_debug("ERST read  %016lx %10s val %016lx sz %u\n",
> +        addr, erst_reg(addr), val, size);
> +    return val;
> +}
> +
> +static size_t build_erst_action(GArray *table_data,
> +    uint8_t serialization_action,
> +    uint8_t instruction,
> +    uint8_t flags,
> +    uint8_t width,
> +    uint64_t address,
> +    uint64_t value,
> +    uint64_t mask)
> +{
> +    /* See ACPI spec, Error Serialization */
> +    uint8_t access_width =3D 0;
> +    build_append_int_noprefix(table_data, serialization_action, 1);
> +    build_append_int_noprefix(table_data, instruction         , 1);
> +    build_append_int_noprefix(table_data, flags               , 1);
> +    build_append_int_noprefix(table_data, 0                   , 1);
> +    /* GAS space_id */
> +    build_append_int_noprefix(table_data, AML_SYSTEM_MEMORY   , 1);
> +    /* GAS bit_width */
> +    build_append_int_noprefix(table_data, width               , 1);
> +    /* GAS bit_offset */
> +    build_append_int_noprefix(table_data, 0                   , 1);
> +    /* GAS access_width */
> +    switch (width) {
> +    case 8:
> +        access_width =3D 1;
> +        break;
> +    case 16:
> +        access_width =3D 2;
> +        break;
> +    case 32:
> +        access_width =3D 3;
> +        break;
> +    case 64:
> +        access_width =3D 4;
> +        break;
> +    default:
> +        access_width =3D 0;
> +        break;
> +    }
> +    build_append_int_noprefix(table_data, access_width        , 1);
> +    /* GAS address */
> +    build_append_int_noprefix(table_data, address, 8);
> +    /* value */
> +    build_append_int_noprefix(table_data, value  , 8);
> +    /* mask */
> +    build_append_int_noprefix(table_data, mask   , 8);
> +
> +    return 1;
> +}
> +
> +static const MemoryRegionOps erst_rw_ops =3D {
> +    .read =3D erst_read,
> +    .write =3D erst_write,
> +    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +};
> +
> +void build_erst(GArray *table_data, BIOSLinker *linker, hwaddr base)
> +{
> +    unsigned action, insns =3D 0;
> +    unsigned erst_start =3D table_data->len;
> +    unsigned iec_offset =3D 0;
> +
> +    /* See ACPI spec, Error Serialization */
> +    acpi_data_push(table_data, sizeof(AcpiTableHeader));
> +    /* serialization_header_length */
> +    build_append_int_noprefix(table_data, 48, 4);
> +    /* reserved */
> +    build_append_int_noprefix(table_data,  0, 4);
> +    iec_offset =3D table_data->len;
> +    /* instruction_entry_count (placeholder) */
> +    build_append_int_noprefix(table_data,  0, 4);
> +
> +#define BEA(I, F, W, ADDR, VAL, MASK) \
> +    build_erst_action(table_data, action, \
> +        ACPI_ERST_INST_##I, F, W, base + ADDR, VAL, MASK)
> +#define MASK8  0x00000000000000FFUL
> +#define MASK16 0x000000000000FFFFUL
> +#define MASK32 0x00000000FFFFFFFFUL
> +#define MASK64 0xFFFFFFFFFFFFFFFFUL
> +
> +    for (action =3D 0; action < ACPI_ERST_MAX_ACTIONS; ++action) {
> +        switch (action) {
> +        case ACPI_ERST_ACTION_BEGIN_WRITE_OPERATION:
> +            insns +=3D BEA(WRITE_REGISTER_VALUE, 0, 32,
> +                ERST_CSR_ACTION, action, MASK8);
> +            break;
> +        case ACPI_ERST_ACTION_BEGIN_READ_OPERATION:
> +            insns +=3D BEA(WRITE_REGISTER_VALUE, 0, 32,
> +                ERST_CSR_ACTION, action, MASK8);
> +            break;
> +        case ACPI_ERST_ACTION_BEGIN_CLEAR_OPERATION:
> +            insns +=3D BEA(WRITE_REGISTER_VALUE, 0, 32,
> +                ERST_CSR_ACTION, action, MASK8);
> +            break;
> +        case ACPI_ERST_ACTION_END_OPERATION:
> +            insns +=3D BEA(WRITE_REGISTER_VALUE, 0, 32,
> +                ERST_CSR_ACTION, action, MASK8);
> +            break;
> +        case ACPI_ERST_ACTION_SET_RECORD_OFFSET:
> +            insns +=3D BEA(WRITE_REGISTER      , 0, 32,
> +                ERST_CSR_VALUE , 0, MASK32);
> +            insns +=3D BEA(WRITE_REGISTER_VALUE, 0, 32,
> +                ERST_CSR_ACTION, action, MASK8);
> +            break;
> +        case ACPI_ERST_ACTION_EXECUTE_OPERATION:
> +            insns +=3D BEA(WRITE_REGISTER_VALUE, 0, 32,
> +                ERST_CSR_VALUE , ERST_EXECUTE_OPERATION_MAGIC, MASK8);
> +            insns +=3D BEA(WRITE_REGISTER_VALUE, 0, 32,
> +                ERST_CSR_ACTION, action, MASK8);
> +            break;
> +        case ACPI_ERST_ACTION_CHECK_BUSY_STATUS:
> +            insns +=3D BEA(WRITE_REGISTER_VALUE, 0, 32,
> +                ERST_CSR_ACTION, action, MASK8);
> +            insns +=3D BEA(READ_REGISTER_VALUE , 0, 32,
> +                ERST_CSR_VALUE, 0x01, MASK8);
> +            break;
> +        case ACPI_ERST_ACTION_GET_COMMAND_STATUS:
> +            insns +=3D BEA(WRITE_REGISTER_VALUE, 0, 32,
> +                ERST_CSR_ACTION, action, MASK8);
> +            insns +=3D BEA(READ_REGISTER       , 0, 32,
> +                ERST_CSR_VALUE, 0, MASK8);
> +            break;
> +        case ACPI_ERST_ACTION_GET_RECORD_IDENTIFIER:
> +            insns +=3D BEA(WRITE_REGISTER_VALUE, 0, 32,
> +                ERST_CSR_ACTION, action, MASK8);
> +            insns +=3D BEA(READ_REGISTER       , 0, 64,
> +                ERST_CSR_VALUE, 0, MASK64);
> +            break;
> +        case ACPI_ERST_ACTION_SET_RECORD_IDENTIFIER:
> +            insns +=3D BEA(WRITE_REGISTER      , 0, 64,
> +                ERST_CSR_VALUE , 0, MASK64);
> +            insns +=3D BEA(WRITE_REGISTER_VALUE, 0, 32,
> +                ERST_CSR_ACTION, action, MASK8);
> +            break;
> +        case ACPI_ERST_ACTION_GET_RECORD_COUNT:
> +            insns +=3D BEA(WRITE_REGISTER_VALUE, 0, 32,
> +                ERST_CSR_ACTION, action, MASK8);
> +            insns +=3D BEA(READ_REGISTER       , 0, 32,
> +                ERST_CSR_VALUE, 0, MASK32);
> +            break;
> +        case ACPI_ERST_ACTION_BEGIN_DUMMY_WRITE_OPERATION:
> +            insns +=3D BEA(WRITE_REGISTER_VALUE, 0, 32,
> +                ERST_CSR_ACTION, action, MASK8);
> +            break;
> +        case ACPI_ERST_ACTION_RESERVED:
> +            insns +=3D BEA(WRITE_REGISTER_VALUE, 0, 32,
> +                ERST_CSR_ACTION, action, MASK8);
> +            break;
> +        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE:
> +            insns +=3D BEA(WRITE_REGISTER_VALUE, 0, 32,
> +                ERST_CSR_ACTION, action, MASK8);
> +            insns +=3D BEA(READ_REGISTER       , 0, 64,
> +                ERST_CSR_VALUE, 0, MASK64);
> +            break;
> +        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_LENGTH:
> +            insns +=3D BEA(WRITE_REGISTER_VALUE, 0, 32,
> +                ERST_CSR_ACTION, action, MASK8);
> +            insns +=3D BEA(READ_REGISTER       , 0, 64,
> +                ERST_CSR_VALUE, 0, MASK32);
> +            break;
> +        case ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES:
> +            insns +=3D BEA(WRITE_REGISTER_VALUE, 0, 32,
> +                ERST_CSR_ACTION, action, MASK8);
> +            insns +=3D BEA(READ_REGISTER       , 0, 32,
> +                ERST_CSR_VALUE, 0, MASK32);
> +            break;
> +        case ACPI_ERST_ACTION_GET_EXECUTE_OPERATION_TIMINGS:
> +            insns +=3D BEA(WRITE_REGISTER_VALUE, 0, 32,
> +                ERST_CSR_ACTION, action, MASK8);
> +            insns +=3D BEA(READ_REGISTER       , 0, 64,
> +                ERST_CSR_VALUE, 0, MASK64);
> +        default:
> +            insns +=3D BEA(NOOP, 0, 0, 0, action, 0);
> +            break;
> +        }
> +    }
> +
> +    /* acpi_data_push() within BEA() can result in new GArray pointer */
> +    *(uint32_t *)(table_data->data + iec_offset) =3D cpu_to_le32(insns);
> +
> +    build_header(linker, table_data,
> +                 (void *)(table_data->data + erst_start),
> +                 "ERST", table_data->len - erst_start,
> +                 1, NULL, NULL);
> +
> +    if (erst_base =3D=3D 0) {
> +        /*
> +         * This ACPI routine is invoked twice, but this code
> +         * snippet needs to happen just once.
> +         * And this code in erst_class_init() is too early.
> +         */
> +        DeviceState *dev;
> +        SysBusDevice *s;
> +
> +        dev =3D qdev_new(TYPE_ACPI_ERST);
> +        erst_debug("qdev_create dev %p\n", dev);
> +        s =3D SYS_BUS_DEVICE(dev);
> +        sysbus_realize_and_unref(s, &error_fatal);
> +
> +        ACPIERST(dev)->base =3D base;
> +        sysbus_mmio_map(s, 0, base);
> +        erst_base =3D base;
> +        erst_debug("erst_base %lx\n", base);
> +    }
> +}
> +
> +/*******************************************************************/
> +/*******************************************************************/
> +static int erst_post_load(void *opaque, int version_id)
> +{
> +    ERSTDeviceState *s =3D opaque;
> +    erst_debug("+erst_post_load(%d)\n", version_id);
> +    /* Ensure nvram[] persists into backing file */
> +    update_erst_backing_file(s, 0, s->nvram, s->prop_size);
> +    erst_debug("-erst_post_load()\n");
> +    return 0;
> +}
> +
> +static const VMStateDescription erst_vmstate  =3D {
> +    .name =3D "acpi-erst",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .post_load =3D erst_post_load,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_UINT8(operation, ERSTDeviceState),
> +        VMSTATE_UINT8(busy_status, ERSTDeviceState),
> +        VMSTATE_UINT8(command_status, ERSTDeviceState),
> +        VMSTATE_UINT32(record_offset, ERSTDeviceState),
> +        VMSTATE_UINT32(record_count, ERSTDeviceState),
> +        VMSTATE_UINT64(reg_action, ERSTDeviceState),
> +        VMSTATE_UINT64(reg_value, ERSTDeviceState),
> +        VMSTATE_UINT64(record_identifier, ERSTDeviceState),
> +        VMSTATE_UINT8_ARRAY(record, ERSTDeviceState, ERST_RECORD_SIZE),
> +        VMSTATE_UINT8_ARRAY(tmp_record, ERSTDeviceState, ERST_RECORD_SIZ=
E),
> +        VMSTATE_VARRAY_UINT32(nvram, ERSTDeviceState, prop_size, 0,
> +            vmstate_info_uint8, uint8_t),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void erst_realizefn(DeviceState *dev, Error **errp)
> +{
> +    SysBusDevice *d =3D SYS_BUS_DEVICE(dev);
> +    ERSTDeviceState *s =3D ACPIERST(dev);
> +
> +    erst_debug("+erst_realizefn()\n");
> +    if (!s->prop_filename) {
> +        s->prop_filename =3D (char *)(TYPE_ACPI_ERST ".backing");
> +    }
> +
> +    if (!s->prop_filename) {
> +        error_setg(errp, "'filename' property is not set");
> +        return;
> +    }
> +
> +    if (!(s->prop_size > ERST_RECORD_SIZE) &&
> +        (s->prop_size <=3D 0x04000000)) {
> +        error_setg(errp, "'size' property %d is not set properly",
> +            s->prop_size);
> +        return;
> +    }
> +
> +    /* Convert prop_size to integer multiple of ERST_RECORD_SIZE */
> +    s->prop_size -=3D (s->prop_size % ERST_RECORD_SIZE);
> +
> +    load_erst_backing_file(s);
> +
> +    erst_debug("filename %s\n", s->prop_filename);
> +    erst_debug("size %x\n", s->prop_size);
> +
> +    memory_region_init_io(&s->iomem, OBJECT(s), &erst_rw_ops, s,
> +                          TYPE_ACPI_ERST, ERST_IOMEM_SIZE);
> +    sysbus_init_mmio(d, &s->iomem);
> +    erst_debug("-erst_realizefn()\n");
> +}
> +
> +static void erst_unrealizefn(DeviceState *dev)
> +{
> +    ERSTDeviceState *s =3D ACPIERST(dev);
> +
> +    erst_debug("+erst_unrealizefn()\n");
> +    if (s->nvram) {
> +        /* Ensure nvram[] persists into backing file */
> +        update_erst_backing_file(s, 0, s->nvram, s->prop_size);
> +        g_free(s->nvram);
> +        s->nvram =3D NULL;
> +    }
> +    erst_debug("-erst_unrealizefn()\n");
> +}
> +
> +static void erst_reset(DeviceState *dev)
> +{
> +    ERSTDeviceState *s =3D ACPIERST(dev);
> +
> +    erst_debug("+erst_reset(%p) %d\n", s, s->record_count);
> +    s->operation =3D 0;
> +    s->busy_status =3D 0;
> +    s->command_status =3D ACPI_ERST_STATUS_SUCCESS;
> +    /* indicate empty/no-more until further notice */
> +    s->record_identifier =3D ERST_INVALID_RECORD_ID;
> +    s->record_offset =3D 0;
> +    s->next_record_index =3D 0;
> +    /* NOTE: record_count and nvram[] are initialized elsewhere */
> +    erst_debug("-erst_reset()\n");
> +}
> +
> +static Property erst_properties[] =3D {
> +    DEFINE_PROP_UINT32("size", ERSTDeviceState, prop_size, 0x00010000),
> +    DEFINE_PROP_STRING("filename", ERSTDeviceState, prop_filename),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void erst_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +
> +    erst_debug("+erst_class_init()\n");
> +    dc->realize =3D erst_realizefn;
> +    dc->unrealize =3D erst_unrealizefn;
> +    dc->reset =3D erst_reset;
> +    dc->vmsd =3D &erst_vmstate;
> +    device_class_set_props(dc, erst_properties);
> +    dc->desc =3D "ACPI Error Record Serialization Table (ERST) device";
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +    erst_debug("-erst_class_init()\n");
> +}
> +
> +static const TypeInfo erst_type_info =3D {
> +    .name          =3D TYPE_ACPI_ERST,
> +    .parent        =3D TYPE_SYS_BUS_DEVICE,
> +    .class_init    =3D erst_class_init,
> +    .instance_size =3D sizeof(ERSTDeviceState),
> +};
> +
> +static void erst_register_types(void)
> +{
> +    type_register_static(&erst_type_info);
> +}
> +
> +type_init(erst_register_types)


--_000_CO1PR10MB4531392E4B963B163A0FC89C97739CO1PR10MB4531namp_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Igor,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thank you for reviewing. I've responded inline below.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
eric<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> Igor Mammedov &lt;i=
mammedo@redhat.com&gt;<br>
<b>Sent:</b> Tuesday, April 6, 2021 2:31 PM<br>
<b>To:</b> Eric DeVolder &lt;eric.devolder@oracle.com&gt;<br>
<b>Cc:</b> mst@redhat.com &lt;mst@redhat.com&gt;; marcel.apfelbaum@gmail.co=
m &lt;marcel.apfelbaum@gmail.com&gt;; pbonzini@redhat.com &lt;pbonzini@redh=
at.com&gt;; rth@twiddle.net &lt;rth@twiddle.net&gt;; ehabkost@redhat.com &l=
t;ehabkost@redhat.com&gt;; qemu-devel@nongnu.org &lt;qemu-devel@nongnu.org&=
gt;;
 Boris Ostrovsky &lt;boris.ostrovsky@oracle.com&gt;; kwilk@oracle.com &lt;k=
wilk@oracle.com&gt;<br>
<b>Subject:</b> Re: [PATCH v2 3/7] ACPI ERST: support for ACPI ERST feature=
</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">On Mon,&nbsp; 8 Feb 2021 15:57:55 -0500<br>
Eric DeVolder &lt;eric.devolder@oracle.com&gt; wrote:<br>
<br>
&gt; This change implements the support for the ACPI ERST feature[1,2].<br>
&gt; <br>
&gt; The size of the ACPI ERST storage is declared via the QEMU<br>
&gt; global parameter acpi-erst.size. The size can range from 64KiB<br>
&gt; to to 64MiB. The default is 64KiB.<br>
&gt; <br>
&gt; The location of the ACPI ERST storage backing file is delared<br>
&gt; via the QEMU global parameter acpi-erst.filename. The default<br>
&gt; is acpi-erst.backing.<br>
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
&gt; Signed-off-by: Eric DeVolder &lt;eric.devolder@oracle.com&gt;<br>
<br>
items 2/4/5 from v1 review still need to be addressed.<br>
<br>
&gt; <br>
&gt; 2. patch is too big to review, please split it up in smaller chunks.<b=
r>
&gt; <br>
&gt; EJD: Done.<br>
<br>
(separating a header and a makefile rule doesn't make much sense)<br>
<br>
it should be split at least on part that implements device model and ACPI p=
arts<br>
<br>
</div>
<div class=3D"PlainText">EJD: I'll rebase this patch set on qemu-6 and acco=
mmodate your suggestions with how to split/organize the patch set.<br>
</div>
<div class=3D"PlainText"><br>
[...]<br>
&gt; <br>
&gt; 4. Maybe instead of SYSBUS device, implement it as a PCI device and<br=
>
&gt;&nbsp;&nbsp;&nbsp; use its BAR/control registers for pstore storage and=
 control interface.<br>
&gt;&nbsp;&nbsp;&nbsp; It could save you headache of picking address where =
to map it +<br>
&gt;&nbsp;&nbsp;&nbsp; it would take care of migration part automatically, =
as firmware<br>
&gt;&nbsp;&nbsp;&nbsp; would do it for you and then QEMU could pickup firmw=
are programmed<br>
&gt;&nbsp;&nbsp;&nbsp; address and put it into ERST table.<br>
&gt; EJD: Thanks for the idea. For now I've left it as a SYSBUS device; we =
can revisit as needed.<br>
<br>
I would really prefer to see a PCI version (current way is just a hack)</di=
v>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">EJD: I understand, I don't like the base address p=
roblem either. Is there an example PCI device that gets its base address as=
signed during ACPI setup that I could reference and pattern this work after=
? I've been using SYSBUS as that most
 closely mimics the real hardware implementations I've studied in order to =
produce this code.</div>
<div class=3D"PlainText">E<font size=3D"2"><span style=3D"font-size:11pt">J=
D: I thought my inexperience with authoring QEMU devices was the primary pr=
oblem in establishing a solution for the base address. Otherwise, this thin=
g only needs a single 4KiB page (for the
 2 registers + exchange buffer) exposed.</span></font><br>
</div>
<div class=3D"PlainText"><br>
&gt; 5. instead of dealing with file for storage directly, reuse hostmem ba=
ckend<br>
&gt;&nbsp;&nbsp;&nbsp; to provide it to for your device. ex: pc-dimm. i.e. =
split device<br>
&gt;&nbsp;&nbsp;&nbsp; on frontend and backend<br>
&gt; <br>
&gt; EJD: I had looked into that prior to posting v1. The entire ERST stora=
ge is not memory mapped, just an exchange buffer. So the hostmem backend is=
 not suitable for this purpose.<br>
<br>
Is there a compelling reason why it can't be memory mapped?</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">EJD: Well, this ERST device I've coded pretty much=
 follows the ACPI ERST spec verbatim. As it stands today, the spec doesn't =
provide a way to report the total size of the persistent storage behind the=
 interface; you know when storage
 is full only when you receive an Out Of Storage error code upon write. In =
a sense, that allows the size of the storage to vary greatly and be impleme=
nted in any way needed (ie actual hardware, this has tended to be in the 64=
KiB range when it is carved out
 of system parallel flash memory, but some hardware uses serial flash as we=
ll). In virtual environments, it can be of any size, and we at Oracle have =
intentions of heavily utilizing ACPI ERST to stuff all kinds of diagnostic =
information into it, thus wanting
 the storage to be very large. By not actually exposing/memory-mapping the =
storage, the issue of where to drop it in the memory map goes away (yes a P=
CI BAR could solve this).<br>
</div>
<div class=3D"PlainText">EJD: But at the end of the day, could this storage=
 be memory mapped? I suppose it could be, but then that rather circumvents =
the entire need for the ACPI ERST interface to start with. Linux and Window=
s both already know how to utilize
 ACPI ERST.<br>
</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText"><br>
&gt; ---<br>
&gt;&nbsp; hw/acpi/erst.c | 952 +++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++<br>
&gt;&nbsp; 1 file changed, 952 insertions(+)<br>
&gt;&nbsp; create mode 100644 hw/acpi/erst.c<br>
&gt; <br>
&gt; diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..3a342f9<br>
&gt; --- /dev/null<br>
&gt; +++ b/hw/acpi/erst.c<br>
&gt; @@ -0,0 +1,952 @@<br>
&gt; +/*<br>
&gt; + * ACPI Error Record Serialization Table, ERST, Implementation<br>
&gt; + *<br>
&gt; + * Copyright (c) 2020 Oracle and/or its affiliates.<br>
&gt; + *<br>
&gt; + * See ACPI specification,<br>
&gt; + * &quot;ACPI Platform Error Interfaces&quot; : &quot;Error Serializa=
tion&quot;<br>
&gt; + *<br>
&gt; + * This library is free software; you can redistribute it and/or<br>
&gt; + * modify it under the terms of the GNU Lesser General Public<br>
&gt; + * License as published by the Free Software Foundation;<br>
&gt; + * version 2 of the License.<br>
&gt; + *<br>
&gt; + * This library is distributed in the hope that it will be useful,<br=
>
&gt; + * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
&gt; + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.&nbsp; See the=
 GNU<br>
&gt; + * Lesser General Public License for more details.<br>
&gt; + *<br>
&gt; + * You should have received a copy of the GNU Lesser General Public<b=
r>
&gt; + * License along with this library; if not, see &lt;<a href=3D"http:/=
/www.gnu.org/licenses/">http://www.gnu.org/licenses/</a>&gt;<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;sys/types.h&gt;<br>
&gt; +#include &lt;sys/stat.h&gt;<br>
&gt; +#include &lt;unistd.h&gt;<br>
&gt; +<br>
&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;qapi/error.h&quot;<br>
&gt; +#include &quot;hw/sysbus.h&quot;<br>
&gt; +#include &quot;qom/object_interfaces.h&quot;<br>
&gt; +#include &quot;qemu/error-report.h&quot;<br>
&gt; +#include &quot;migration/vmstate.h&quot;<br>
&gt; +#include &quot;hw/qdev-properties.h&quot;<br>
&gt; +#include &quot;hw/acpi/acpi.h&quot;<br>
&gt; +#include &quot;hw/acpi/acpi-defs.h&quot;<br>
&gt; +#include &quot;hw/acpi/aml-build.h&quot;<br>
&gt; +#include &quot;hw/acpi/bios-linker-loader.h&quot;<br>
&gt; +#include &quot;exec/address-spaces.h&quot;<br>
&gt; +#include &quot;hw/acpi/erst.h&quot;<br>
&gt; +<br>
&gt; +#ifdef _ERST_DEBUG<br>
&gt; +#define erst_debug(fmt, ...) \<br>
&gt; +&nbsp;&nbsp;&nbsp; do { fprintf(stderr, fmt, ## __VA_ARGS__); fflush(=
stderr); } while (0)<br>
&gt; +#else<br>
&gt; +#define erst_debug(fmt, ...) do { } while (0)<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +/* See UEFI spec, Appendix N Common Platform Error Record */<br>
&gt; +/* UEFI CPER allows for an OSPM book keeping area in the record */<br=
>
&gt; +#define UEFI_CPER_RECORD_MIN_SIZE 128U<br>
&gt; +#define UEFI_CPER_SIZE_OFFSET 20U<br>
&gt; +#define UEFI_CPER_RECORD_ID_OFFSET 96U<br>
&gt; +#define IS_UEFI_CPER_RECORD(ptr) \<br>
&gt; +&nbsp;&nbsp;&nbsp; (((ptr)[0] =3D=3D 'C') &amp;&amp; \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ((ptr)[1] =3D=3D 'P') &amp;&amp; \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ((ptr)[2] =3D=3D 'E') &amp;&amp; \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ((ptr)[3] =3D=3D 'R'))<br>
&gt; +#define THE_UEFI_CPER_RECORD_ID(ptr) \<br>
&gt; +&nbsp;&nbsp;&nbsp; (*(uint64_t *)(&amp;(ptr)[UEFI_CPER_RECORD_ID_OFFS=
ET]))<br>
&gt; +<br>
&gt; +#define ERST_INVALID_RECORD_ID (~0UL)<br>
&gt; +#define ERST_EXECUTE_OPERATION_MAGIC 0x9CUL<br>
&gt; +#define ERST_CSR_ACTION (0UL &lt;&lt; 3) /* action (cmd) */<br>
&gt; +#define ERST_CSR_VALUE&nbsp; (1UL &lt;&lt; 3) /* argument/value (data=
) */<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * As ERST_IOMEM_SIZE is used to map the ERST into the guest,<br>
&gt; + * it should/must be an integer multiple of PAGE_SIZE.<br>
&gt; + * NOTE that any change to this value will make any pre-<br>
&gt; + * existing backing files, not of the same ERST_IOMEM_SIZE,<br>
&gt; + * unusable to the guest.<br>
&gt; + */<br>
&gt; +#define ERST_IOMEM_SIZE (2UL * 4096)<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * This implementation is an ACTION (cmd) and VALUE (data)<br>
&gt; + * interface consisting of just two 64-bit registers.<br>
&gt; + */<br>
&gt; +#define ERST_REG_LEN (2UL * sizeof(uint64_t))<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * The space not utilized by the register interface is the<br>
&gt; + * buffer for exchanging ERST record contents.<br>
&gt; + */<br>
&gt; +#define ERST_RECORD_SIZE (ERST_IOMEM_SIZE - ERST_REG_LEN)<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Mode to be used for backing file<br>
&gt; + */<br>
&gt; +#define ERST_BACKING_FILE_MODE 0644 /* S_IRWXU|S_IRWXG */<br>
&gt; +<br>
&gt; +#define ACPIERST(obj) \<br>
&gt; +&nbsp;&nbsp;&nbsp; OBJECT_CHECK(ERSTDeviceState, (obj), TYPE_ACPI_ERS=
T)<br>
&gt; +#define ACPIERST_CLASS(oc) \<br>
&gt; +&nbsp;&nbsp;&nbsp; OBJECT_CLASS_CHECK(ERSTDeviceStateClass, (oc), TYP=
E_ACPI_ERST)<br>
&gt; +#define ACPIERST_GET_CLASS(obj) \<br>
&gt; +&nbsp;&nbsp;&nbsp; OBJECT_GET_CLASS(ERSTDeviceStateClass, (obj), TYPE=
_ACPI_ERST)<br>
&gt; +<br>
&gt; +static hwaddr erst_base;<br>
&gt; +<br>
&gt; +typedef struct {<br>
&gt; +&nbsp;&nbsp;&nbsp; SysBusDevice parent_obj;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; MemoryRegion iomem;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t prop_size;<br>
&gt; +&nbsp;&nbsp;&nbsp; char *prop_filename;<br>
&gt; +&nbsp;&nbsp;&nbsp; hwaddr base;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; uint8_t operation;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint8_t busy_status;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint8_t command_status;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t record_offset;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint32_t record_count;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint64_t reg_action;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint64_t reg_value;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint64_t record_identifier;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; unsigned next_record_index;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint8_t record[ERST_RECORD_SIZE]; /* read/written =
directly by guest */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint8_t tmp_record[ERST_RECORD_SIZE]; /* intermedi=
ate manipulation buffer */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint8_t *nvram; /* persistent storage, of length p=
rop_size */<br>
&gt; +<br>
&gt; +} ERSTDeviceState;<br>
&gt; +<br>
&gt; +static void update_erst_backing_file(ERSTDeviceState *s,<br>
&gt; +&nbsp;&nbsp;&nbsp; off_t offset, const uint8_t *data, size_t length)<=
br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp; int fd;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; /* Bounds check */<br>
&gt; +&nbsp;&nbsp;&nbsp; if ((offset + length) &gt; s-&gt;prop_size) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error_report(&quot;update:=
 off 0x%lx len 0x%lx &gt; size 0x%lx out of range&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (l=
ong)offset, (long)length, (long)s-&gt;prop_size);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
&gt; +&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; fd =3D open(s-&gt;prop_filename, O_WRONLY | O_CREA=
T, ERST_BACKING_FILE_MODE);<br>
&gt; +&nbsp;&nbsp;&nbsp; if (fd &gt; 0) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; off_t src;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t wrc =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; src =3D lseek(fd, offset, =
SEEK_SET);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (offset =3D=3D src) {<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wr=
c =3D write(fd, data, length);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((offset !=3D src) || (=
length !=3D wrc)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; er=
ror_report(&quot;ERST write failed: %d %d&quot;, (int)wrc, (int)length);<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(fd);<br>
&gt; +&nbsp;&nbsp;&nbsp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error_report(&quot;open fa=
iled: %s : %d&quot;, s-&gt;prop_filename, fd);<br>
&gt; +&nbsp;&nbsp;&nbsp; }<br>
&gt; +}<br>
&gt; +<br>
&gt; +static unsigned copy_from_nvram_by_index(ERSTDeviceState *s, unsigned=
 index)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp; /* Read a nvram[] entry into tmp_record */<br>
&gt; +&nbsp;&nbsp;&nbsp; unsigned rc =3D ACPI_ERST_STATUS_FAILED;<br>
&gt; +&nbsp;&nbsp;&nbsp; off_t offset =3D (index * ERST_RECORD_SIZE);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; if ((offset + ERST_RECORD_SIZE) &lt;=3D s-&gt;prop=
_size) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(s-&gt;tmp_record, &=
amp;s-&gt;nvram[offset], ERST_RECORD_SIZE);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rc =3D ACPI_ERST_STATUS_SU=
CCESS;<br>
&gt; +&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp; return rc;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static unsigned copy_to_nvram_by_index(ERSTDeviceState *s, unsigned i=
ndex)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp; /* Write entry in tmp_record into nvram[], and bac=
king file */<br>
&gt; +&nbsp;&nbsp;&nbsp; unsigned rc =3D ACPI_ERST_STATUS_FAILED;<br>
&gt; +&nbsp;&nbsp;&nbsp; off_t offset =3D (index * ERST_RECORD_SIZE);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; if ((offset + ERST_RECORD_SIZE) &lt;=3D s-&gt;prop=
_size) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(&amp;s-&gt;nvram[of=
fset], s-&gt;tmp_record, ERST_RECORD_SIZE);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; update_erst_backing_file(s=
, offset, s-&gt;tmp_record, ERST_RECORD_SIZE);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rc =3D ACPI_ERST_STATUS_SU=
CCESS;<br>
&gt; +&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp; return rc;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int lookup_erst_record_by_identifier(ERSTDeviceState *s,<br>
&gt; +&nbsp;&nbsp;&nbsp; uint64_t record_identifier, bool *record_found, bo=
ol alloc_for_write)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp; int rc =3D -1;<br>
&gt; +&nbsp;&nbsp;&nbsp; int empty_index =3D -1;<br>
&gt; +&nbsp;&nbsp;&nbsp; int index =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp; unsigned rrc;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; *record_found =3D 0;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; do {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rrc =3D copy_from_nvram_by=
_index(s, (unsigned)index);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (rrc =3D=3D ACPI_ERST_S=
TATUS_SUCCESS) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ui=
nt64_t this_identifier;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; th=
is_identifier =3D THE_UEFI_CPER_RECORD_ID(s-&gt;tmp_record);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if=
 (IS_UEFI_CPER_RECORD(s-&gt;tmp_record) &amp;&amp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; (this_identifier =3D=3D record_identifier)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; rc =3D index;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *record_found =3D 1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if=
 ((this_identifier =3D=3D ERST_INVALID_RECORD_ID) &amp;&amp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; (empty_index &lt; 0)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; empty_index =3D index; /* first available for write *=
/<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ++index;<br>
&gt; +&nbsp;&nbsp;&nbsp; } while (rrc =3D=3D ACPI_ERST_STATUS_SUCCESS);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; /* Record not found, allocate for writing */<br>
&gt; +&nbsp;&nbsp;&nbsp; if ((rc &lt; 0) &amp;&amp; alloc_for_write) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rc =3D empty_index;<br>
&gt; +&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; return rc;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static unsigned clear_erst_record(ERSTDeviceState *s)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp; unsigned rc =3D ACPI_ERST_STATUS_RECORD_NOT_FOUND;=
<br>
&gt; +&nbsp;&nbsp;&nbsp; bool record_found;<br>
&gt; +&nbsp;&nbsp;&nbsp; int index;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; index =3D lookup_erst_record_by_identifier(s,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s-&gt;record_identifier, &=
amp;record_found, 0);<br>
&gt; +&nbsp;&nbsp;&nbsp; if (record_found) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(s-&gt;tmp_record, 0=
xFF, ERST_RECORD_SIZE);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rc =3D copy_to_nvram_by_in=
dex(s, (unsigned)index);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (rc =3D=3D ACPI_ERST_ST=
ATUS_SUCCESS) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s-=
&gt;record_count -=3D 1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; return rc;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static unsigned write_erst_record(ERSTDeviceState *s)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp; unsigned rc =3D ACPI_ERST_STATUS_FAILED;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; if (s-&gt;record_offset &lt; (ERST_RECORD_SIZE - U=
EFI_CPER_RECORD_MIN_SIZE)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t record_identifier=
;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint8_t *record =3D &amp;s=
-&gt;record[s-&gt;record_offset];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool record_found;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int index;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; record_identifier =3D (s-&=
gt;record_identifier =3D=3D ERST_INVALID_RECORD_ID)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ? =
THE_UEFI_CPER_RECORD_ID(record) : s-&gt;record_identifier;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; index =3D lookup_erst_reco=
rd_by_identifier(s,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; re=
cord_identifier, &amp;record_found, 1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (index &lt; 0) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rc=
 =3D ACPI_ERST_STATUS_NOT_ENOUGH_SPACE;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if=
 (0 !=3D s-&gt;record_offset) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; memset(&amp;s-&gt;tmp_record[ERST_RECORD_SIZE - s-&gt=
;record_offset],<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xFF, s-&gt;record_offset);<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; me=
mcpy(s-&gt;tmp_record, record, ERST_RECORD_SIZE - s-&gt;record_offset);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rc=
 =3D copy_to_nvram_by_index(s, (unsigned)index);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if=
 (rc =3D=3D ACPI_ERST_STATUS_SUCCESS) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (!record_found) { /* not overwriting existing reco=
rd */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s-&gt;record_count +=3D 1; /*=
 writing new record */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; return rc;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static unsigned next_erst_record(ERSTDeviceState *s,<br>
&gt; +&nbsp;&nbsp;&nbsp; uint64_t *record_identifier)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp; unsigned rc =3D ACPI_ERST_STATUS_RECORD_NOT_FOUND;=
<br>
&gt; +&nbsp;&nbsp;&nbsp; unsigned index;<br>
&gt; +&nbsp;&nbsp;&nbsp; unsigned rrc;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; *record_identifier =3D ERST_INVALID_RECORD_ID;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; index =3D s-&gt;next_record_index;<br>
&gt; +&nbsp;&nbsp;&nbsp; do {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rrc =3D copy_from_nvram_by=
_index(s, (unsigned)index);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (rrc =3D=3D ACPI_ERST_S=
TATUS_SUCCESS) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if=
 (IS_UEFI_CPER_RECORD(s-&gt;tmp_record)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; s-&gt;next_record_index =3D index + 1; /* where to st=
art next time */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *record_identifier =3D THE_UEFI_CPER_RECORD_ID(s-&gt;=
tmp_record);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; rc =3D ACPI_ERST_STATUS_SUCCESS;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ++=
index;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if=
 (s-&gt;next_record_index =3D=3D 0) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; rc =3D ACPI_ERST_STATUS_RECORD_STORE_EMPTY;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s-=
&gt;next_record_index =3D 0; /* at end, reset */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp; } while (rrc =3D=3D ACPI_ERST_STATUS_SUCCESS);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; return rc;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static unsigned read_erst_record(ERSTDeviceState *s)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp; unsigned rc =3D ACPI_ERST_STATUS_RECORD_NOT_FOUND;=
<br>
&gt; +&nbsp;&nbsp;&nbsp; bool record_found;<br>
&gt; +&nbsp;&nbsp;&nbsp; int index;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; index =3D lookup_erst_record_by_identifier(s,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s-&gt;record_identifier, &=
amp;record_found, 0);<br>
&gt; +&nbsp;&nbsp;&nbsp; if (record_found) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rc =3D copy_from_nvram_by_=
index(s, (unsigned)index);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (rc =3D=3D ACPI_ERST_ST=
ATUS_SUCCESS) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if=
 (s-&gt;record_offset &lt; ERST_RECORD_SIZE) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; memcpy(&amp;s-&gt;record[s-&gt;record_offset], s-&gt;=
tmp_record,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ERST_RECORD_SIZE - s-&gt;reco=
rd_offset);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; return rc;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static unsigned get_erst_record_count(ERSTDeviceState *s)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp; /* Compute record_count */<br>
&gt; +&nbsp;&nbsp;&nbsp; off_t offset;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; s-&gt;record_count =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp; offset =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp; do {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint8_t *ptr =3D &amp;s-&g=
t;nvram[offset];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t record_identifier=
 =3D THE_UEFI_CPER_RECORD_ID(ptr);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (IS_UEFI_CPER_RECORD(pt=
r) &amp;&amp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (E=
RST_INVALID_RECORD_ID !=3D record_identifier)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s-=
&gt;record_count +=3D 1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; offset +=3D ERST_RECORD_SI=
ZE;<br>
&gt; +&nbsp;&nbsp;&nbsp; } while (offset &lt; (off_t)s-&gt;prop_size);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; return s-&gt;record_count;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void load_erst_backing_file(ERSTDeviceState *s)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp; int fd;<br>
&gt; +&nbsp;&nbsp;&nbsp; struct stat statbuf;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; erst_debug(&quot;+load_erst_backing_file()\n&quot;=
);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; /* Allocate and initialize nvram[] */<br>
&gt; +&nbsp;&nbsp;&nbsp; s-&gt;nvram =3D g_malloc(s-&gt;prop_size);<br>
&gt; +&nbsp;&nbsp;&nbsp; memset(s-&gt;nvram, 0xFF, s-&gt;prop_size);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; /* Ensure backing file at least same as prop_size =
*/<br>
&gt; +&nbsp;&nbsp;&nbsp; if (stat(s-&gt;prop_filename, &amp;statbuf) =3D=3D=
 0) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* ensure prop_size at lea=
st matches file size */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (statbuf.st_size &lt; s=
-&gt;prop_size) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*=
 Ensure records are ERST_INVALID_RECORD_ID */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; me=
mset(s-&gt;nvram, 0xFF, s-&gt;prop_size - statbuf.st_size);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; up=
date_erst_backing_file(s,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; statbuf.st_size, s-&gt;nvram, s-&gt;prop_size - statb=
uf.st_size);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; /* Pre-load nvram[] from backing file, if present =
*/<br>
&gt; +&nbsp;&nbsp;&nbsp; fd =3D open(s-&gt;prop_filename, O_RDONLY, ERST_BA=
CKING_FILE_MODE);<br>
&gt; +&nbsp;&nbsp;&nbsp; if (fd &gt; 0) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t rrc =3D read(fd, s-=
&gt;nvram, s-&gt;prop_size);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (void)rrc;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(fd);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * If existing file i=
s smaller than prop_size, it will be resized<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * accordingly upon s=
ubsequent record writes. If the file<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * is larger than pro=
p_size, only prop_size bytes are utilized,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * the extra bytes ar=
e untouched (though will be lost after<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * a migration when t=
he backing file is re-written as length<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * of prop_size bytes=
).<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Create empty backing fi=
le */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; update_erst_backing_file(s=
, 0, s-&gt;nvram, s-&gt;prop_size);<br>
&gt; +&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; /* Initialize record_count */<br>
&gt; +&nbsp;&nbsp;&nbsp; get_erst_record_count(s);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; erst_debug(&quot;-load_erst_backing_file() %d\n&qu=
ot;, s-&gt;record_count);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static uint64_t erst_rd_reg64(hwaddr addr,<br>
&gt; +&nbsp;&nbsp;&nbsp; uint64_t reg, unsigned size)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp; uint64_t rdval;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint64_t mask;<br>
&gt; +&nbsp;&nbsp;&nbsp; unsigned shift;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; if (size =3D=3D sizeof(uint64_t)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 64b access */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mask =3D 0xFFFFFFFFFFFFFFF=
FUL;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; shift =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 32b access */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mask =3D 0x00000000FFFFFFF=
FUL;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; shift =3D ((addr &amp; 0x4=
) =3D=3D 0x4) ? 32 : 0;<br>
&gt; +&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; rdval =3D reg;<br>
&gt; +&nbsp;&nbsp;&nbsp; rdval &gt;&gt;=3D shift;<br>
&gt; +&nbsp;&nbsp;&nbsp; rdval &amp;=3D mask;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; return rdval;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static uint64_t erst_wr_reg64(hwaddr addr,<br>
&gt; +&nbsp;&nbsp;&nbsp; uint64_t reg, uint64_t val, unsigned size)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp; uint64_t wrval;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint64_t mask;<br>
&gt; +&nbsp;&nbsp;&nbsp; unsigned shift;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; if (size =3D=3D sizeof(uint64_t)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 64b access */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mask =3D 0xFFFFFFFFFFFFFFF=
FUL;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; shift =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 32b access */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mask =3D 0x00000000FFFFFFF=
FUL;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; shift =3D ((addr &amp; 0x4=
) =3D=3D 0x4) ? 32 : 0;<br>
&gt; +&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; val &amp;=3D mask;<br>
&gt; +&nbsp;&nbsp;&nbsp; val &lt;&lt;=3D shift;<br>
&gt; +&nbsp;&nbsp;&nbsp; mask &lt;&lt;=3D shift;<br>
&gt; +&nbsp;&nbsp;&nbsp; wrval =3D reg;<br>
&gt; +&nbsp;&nbsp;&nbsp; wrval &amp;=3D ~mask;<br>
&gt; +&nbsp;&nbsp;&nbsp; wrval |=3D val;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; return wrval;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void erst_write(void *opaque, hwaddr addr,<br>
&gt; +&nbsp;&nbsp;&nbsp; uint64_t val, unsigned size)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp; ERSTDeviceState *s =3D (ERSTDeviceState *)opaque;<=
br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; if (addr &lt; ERST_REG_LEN) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * NOTE: All actions/=
operations/side effects happen on the WRITE,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * by design. The REA=
Ds simply return the reg_value contents.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; erst_debug(&quot;ERST writ=
e %016lx %10s val %016lx sz %u&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ad=
dr, erst_reg(addr), val, size);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* The REGISTER region */<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (addr) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ERST_CSR_VALUE + 0:<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ERST_CSR_VALUE + 4:<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s-=
&gt;reg_value =3D erst_wr_reg64(addr, s-&gt;reg_value, val, size);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; br=
eak;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ERST_CSR_ACTION + 0:<=
br>
&gt; +/*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ERST_CSR_ACTION+4: as coded, no=
t really a 64b register */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sw=
itch (val) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ca=
se ACPI_ERST_ACTION_BEGIN_WRITE_OPERATION:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ca=
se ACPI_ERST_ACTION_BEGIN_READ_OPERATION:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ca=
se ACPI_ERST_ACTION_BEGIN_CLEAR_OPERATION:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ca=
se ACPI_ERST_ACTION_BEGIN_DUMMY_WRITE_OPERATION:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ca=
se ACPI_ERST_ACTION_END_OPERATION:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; s-&gt;operation =3D val;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ca=
se ACPI_ERST_ACTION_SET_RECORD_OFFSET:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; s-&gt;record_offset =3D s-&gt;reg_value;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ca=
se ACPI_ERST_ACTION_EXECUTE_OPERATION:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if ((uint8_t)s-&gt;reg_value =3D=3D ERST_EXECUTE_OPER=
ATION_MAGIC) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s-&gt;busy_status =3D 1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (s-&gt;operation) {<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ACPI_ERST_ACTION_BEGIN_W=
RITE_OPERATION:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s-&gt=
;command_status =3D write_erst_record(s);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break=
;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ACPI_ERST_ACTION_BEGIN_R=
EAD_OPERATION:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s-&gt=
;command_status =3D read_erst_record(s);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break=
;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ACPI_ERST_ACTION_BEGIN_C=
LEAR_OPERATION:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s-&gt=
;command_status =3D clear_erst_record(s);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break=
;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ACPI_ERST_ACTION_BEGIN_D=
UMMY_WRITE_OPERATION:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s-&gt=
;command_status =3D ACPI_ERST_STATUS_SUCCESS;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break=
;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ACPI_ERST_ACTION_END_OPE=
RATION:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s-&gt=
;command_status =3D ACPI_ERST_STATUS_SUCCESS;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break=
;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s-&gt=
;command_status =3D ACPI_ERST_STATUS_FAILED;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break=
;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s-&gt;record_identifier =3D E=
RST_INVALID_RECORD_ID;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s-&gt;busy_status =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ca=
se ACPI_ERST_ACTION_CHECK_BUSY_STATUS:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; s-&gt;reg_value =3D s-&gt;busy_status;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ca=
se ACPI_ERST_ACTION_GET_COMMAND_STATUS:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; s-&gt;reg_value =3D s-&gt;command_status;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ca=
se ACPI_ERST_ACTION_GET_RECORD_IDENTIFIER:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; s-&gt;command_status =3D next_erst_record(s, &amp;s-&=
gt;reg_value);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ca=
se ACPI_ERST_ACTION_SET_RECORD_IDENTIFIER:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; s-&gt;record_identifier =3D s-&gt;reg_value;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ca=
se ACPI_ERST_ACTION_GET_RECORD_COUNT:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; s-&gt;reg_value =3D s-&gt;record_count;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ca=
se ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; s-&gt;reg_value =3D s-&gt;base + ERST_REG_LEN;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ca=
se ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_LENGTH:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; s-&gt;reg_value =3D ERST_RECORD_SIZE;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ca=
se ACPI_ERST_ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; s-&gt;reg_value =3D 0; /* correct/intended value */<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ca=
se ACPI_ERST_ACTION_GET_EXECUTE_OPERATION_TIMINGS:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; * 100UL is max, 10UL is nominal<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; s-&gt;reg_value =3D ((100UL &lt;&lt; 32) | (10UL &lt;=
&lt; 0));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ca=
se ACPI_ERST_ACTION_RESERVED:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; de=
fault:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; * NOP<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; br=
eak;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; * All other register writes are NO-OPs<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; br=
eak;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* The RECORD region */<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned offset =3D addr -=
 ERST_REG_LEN;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint8_t *ptr =3D &amp;s-&g=
t;record[offset];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (size) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case sizeof(uint8_t):<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *(=
uint8_t *)ptr =3D (uint8_t)val;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; br=
eak;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case sizeof(uint16_t):<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *(=
uint16_t *)ptr =3D (uint16_t)val;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; br=
eak;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case sizeof(uint32_t):<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *(=
uint32_t *)ptr =3D (uint32_t)val;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; br=
eak;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case sizeof(uint64_t):<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *(=
uint64_t *)ptr =3D (uint64_t)val;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; br=
eak;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp; }<br>
&gt; +}<br>
&gt; +<br>
&gt; +static uint64_t erst_read(void *opaque, hwaddr addr,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned size)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp; ERSTDeviceState *s =3D (ERSTDeviceState *)opaque;<=
br>
&gt; +&nbsp;&nbsp;&nbsp; uint64_t val =3D 0;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; if (addr &lt; ERST_REG_LEN) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (addr) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ERST_CSR_ACTION + 0:<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ERST_CSR_ACTION + 4:<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; va=
l =3D erst_rd_reg64(addr, s-&gt;reg_action, size);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; br=
eak;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ERST_CSR_VALUE + 0:<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ERST_CSR_VALUE + 4:<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; va=
l =3D erst_rd_reg64(addr, s-&gt;reg_value, size);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; br=
eak;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; br=
eak;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp; erst_debug(&quot;ERST read&nbsp; %016lx %10s val %=
016lx sz %u\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; addr, erst_reg(addr), val,=
 size);<br>
&gt; +&nbsp;&nbsp;&nbsp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * The RECORD region<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint8_t *ptr =3D &amp;s-&g=
t;record[addr - ERST_REG_LEN];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (size) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case sizeof(uint8_t):<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; va=
l =3D *(uint8_t *)ptr;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; br=
eak;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case sizeof(uint16_t):<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; va=
l =3D *(uint16_t *)ptr;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; br=
eak;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case sizeof(uint32_t):<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; va=
l =3D *(uint32_t *)ptr;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; br=
eak;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case sizeof(uint64_t):<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; va=
l =3D *(uint64_t *)ptr;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; br=
eak;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp; erst_debug(&quot;ERST read&nbsp; %016lx %10s val %=
016lx sz %u\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; addr, erst_reg(addr), val,=
 size);<br>
&gt; +&nbsp;&nbsp;&nbsp; return val;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static size_t build_erst_action(GArray *table_data,<br>
&gt; +&nbsp;&nbsp;&nbsp; uint8_t serialization_action,<br>
&gt; +&nbsp;&nbsp;&nbsp; uint8_t instruction,<br>
&gt; +&nbsp;&nbsp;&nbsp; uint8_t flags,<br>
&gt; +&nbsp;&nbsp;&nbsp; uint8_t width,<br>
&gt; +&nbsp;&nbsp;&nbsp; uint64_t address,<br>
&gt; +&nbsp;&nbsp;&nbsp; uint64_t value,<br>
&gt; +&nbsp;&nbsp;&nbsp; uint64_t mask)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp; /* See ACPI spec, Error Serialization */<br>
&gt; +&nbsp;&nbsp;&nbsp; uint8_t access_width =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp; build_append_int_noprefix(table_data, serializatio=
n_action, 1);<br>
&gt; +&nbsp;&nbsp;&nbsp; build_append_int_noprefix(table_data, instruction&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; , 1);<br>
&gt; +&nbsp;&nbsp;&nbsp; build_append_int_noprefix(table_data, flags&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; , 1);<br>
&gt; +&nbsp;&nbsp;&nbsp; build_append_int_noprefix(table_data, 0&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; , 1);<br>
&gt; +&nbsp;&nbsp;&nbsp; /* GAS space_id */<br>
&gt; +&nbsp;&nbsp;&nbsp; build_append_int_noprefix(table_data, AML_SYSTEM_M=
EMORY&nbsp;&nbsp; , 1);<br>
&gt; +&nbsp;&nbsp;&nbsp; /* GAS bit_width */<br>
&gt; +&nbsp;&nbsp;&nbsp; build_append_int_noprefix(table_data, width&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; , 1);<br>
&gt; +&nbsp;&nbsp;&nbsp; /* GAS bit_offset */<br>
&gt; +&nbsp;&nbsp;&nbsp; build_append_int_noprefix(table_data, 0&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; , 1);<br>
&gt; +&nbsp;&nbsp;&nbsp; /* GAS access_width */<br>
&gt; +&nbsp;&nbsp;&nbsp; switch (width) {<br>
&gt; +&nbsp;&nbsp;&nbsp; case 8:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; access_width =3D 1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp; case 16:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; access_width =3D 2;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp; case 32:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; access_width =3D 3;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp; case 64:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; access_width =3D 4;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp; default:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; access_width =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp; build_append_int_noprefix(table_data, access_width=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; , 1);<br>
&gt; +&nbsp;&nbsp;&nbsp; /* GAS address */<br>
&gt; +&nbsp;&nbsp;&nbsp; build_append_int_noprefix(table_data, address, 8);=
<br>
&gt; +&nbsp;&nbsp;&nbsp; /* value */<br>
&gt; +&nbsp;&nbsp;&nbsp; build_append_int_noprefix(table_data, value&nbsp; =
, 8);<br>
&gt; +&nbsp;&nbsp;&nbsp; /* mask */<br>
&gt; +&nbsp;&nbsp;&nbsp; build_append_int_noprefix(table_data, mask&nbsp;&n=
bsp; , 8);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; return 1;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const MemoryRegionOps erst_rw_ops =3D {<br>
&gt; +&nbsp;&nbsp;&nbsp; .read =3D erst_read,<br>
&gt; +&nbsp;&nbsp;&nbsp; .write =3D erst_write,<br>
&gt; +&nbsp;&nbsp;&nbsp; .endianness =3D DEVICE_NATIVE_ENDIAN,<br>
&gt; +};<br>
&gt; +<br>
&gt; +void build_erst(GArray *table_data, BIOSLinker *linker, hwaddr base)<=
br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp; unsigned action, insns =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp; unsigned erst_start =3D table_data-&gt;len;<br>
&gt; +&nbsp;&nbsp;&nbsp; unsigned iec_offset =3D 0;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; /* See ACPI spec, Error Serialization */<br>
&gt; +&nbsp;&nbsp;&nbsp; acpi_data_push(table_data, sizeof(AcpiTableHeader)=
);<br>
&gt; +&nbsp;&nbsp;&nbsp; /* serialization_header_length */<br>
&gt; +&nbsp;&nbsp;&nbsp; build_append_int_noprefix(table_data, 48, 4);<br>
&gt; +&nbsp;&nbsp;&nbsp; /* reserved */<br>
&gt; +&nbsp;&nbsp;&nbsp; build_append_int_noprefix(table_data,&nbsp; 0, 4);=
<br>
&gt; +&nbsp;&nbsp;&nbsp; iec_offset =3D table_data-&gt;len;<br>
&gt; +&nbsp;&nbsp;&nbsp; /* instruction_entry_count (placeholder) */<br>
&gt; +&nbsp;&nbsp;&nbsp; build_append_int_noprefix(table_data,&nbsp; 0, 4);=
<br>
&gt; +<br>
&gt; +#define BEA(I, F, W, ADDR, VAL, MASK) \<br>
&gt; +&nbsp;&nbsp;&nbsp; build_erst_action(table_data, action, \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ACPI_ERST_INST_##I, F, W, =
base + ADDR, VAL, MASK)<br>
&gt; +#define MASK8&nbsp; 0x00000000000000FFUL<br>
&gt; +#define MASK16 0x000000000000FFFFUL<br>
&gt; +#define MASK32 0x00000000FFFFFFFFUL<br>
&gt; +#define MASK64 0xFFFFFFFFFFFFFFFFUL<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; for (action =3D 0; action &lt; ACPI_ERST_MAX_ACTIO=
NS; ++action) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (action) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ACPI_ERST_ACTION_BEGI=
N_WRITE_OPERATION:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in=
sns +=3D BEA(WRITE_REGISTER_VALUE, 0, 32,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ERST_CSR_ACTION, action, MASK8);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; br=
eak;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ACPI_ERST_ACTION_BEGI=
N_READ_OPERATION:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in=
sns +=3D BEA(WRITE_REGISTER_VALUE, 0, 32,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ERST_CSR_ACTION, action, MASK8);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; br=
eak;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ACPI_ERST_ACTION_BEGI=
N_CLEAR_OPERATION:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in=
sns +=3D BEA(WRITE_REGISTER_VALUE, 0, 32,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ERST_CSR_ACTION, action, MASK8);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; br=
eak;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ACPI_ERST_ACTION_END_=
OPERATION:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in=
sns +=3D BEA(WRITE_REGISTER_VALUE, 0, 32,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ERST_CSR_ACTION, action, MASK8);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; br=
eak;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ACPI_ERST_ACTION_SET_=
RECORD_OFFSET:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in=
sns +=3D BEA(WRITE_REGISTER&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; , 0, 32,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ERST_CSR_VALUE , 0, MASK32);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in=
sns +=3D BEA(WRITE_REGISTER_VALUE, 0, 32,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ERST_CSR_ACTION, action, MASK8);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; br=
eak;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ACPI_ERST_ACTION_EXEC=
UTE_OPERATION:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in=
sns +=3D BEA(WRITE_REGISTER_VALUE, 0, 32,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ERST_CSR_VALUE , ERST_EXECUTE_OPERATION_MAGIC, MASK8)=
;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in=
sns +=3D BEA(WRITE_REGISTER_VALUE, 0, 32,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ERST_CSR_ACTION, action, MASK8);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; br=
eak;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ACPI_ERST_ACTION_CHEC=
K_BUSY_STATUS:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in=
sns +=3D BEA(WRITE_REGISTER_VALUE, 0, 32,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ERST_CSR_ACTION, action, MASK8);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in=
sns +=3D BEA(READ_REGISTER_VALUE , 0, 32,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ERST_CSR_VALUE, 0x01, MASK8);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; br=
eak;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ACPI_ERST_ACTION_GET_=
COMMAND_STATUS:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in=
sns +=3D BEA(WRITE_REGISTER_VALUE, 0, 32,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ERST_CSR_ACTION, action, MASK8);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in=
sns +=3D BEA(READ_REGISTER&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; , 0, 32,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ERST_CSR_VALUE, 0, MASK8);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; br=
eak;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ACPI_ERST_ACTION_GET_=
RECORD_IDENTIFIER:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in=
sns +=3D BEA(WRITE_REGISTER_VALUE, 0, 32,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ERST_CSR_ACTION, action, MASK8);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in=
sns +=3D BEA(READ_REGISTER&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; , 0, 64,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ERST_CSR_VALUE, 0, MASK64);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; br=
eak;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ACPI_ERST_ACTION_SET_=
RECORD_IDENTIFIER:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in=
sns +=3D BEA(WRITE_REGISTER&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; , 0, 64,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ERST_CSR_VALUE , 0, MASK64);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in=
sns +=3D BEA(WRITE_REGISTER_VALUE, 0, 32,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ERST_CSR_ACTION, action, MASK8);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; br=
eak;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ACPI_ERST_ACTION_GET_=
RECORD_COUNT:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in=
sns +=3D BEA(WRITE_REGISTER_VALUE, 0, 32,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ERST_CSR_ACTION, action, MASK8);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in=
sns +=3D BEA(READ_REGISTER&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; , 0, 32,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ERST_CSR_VALUE, 0, MASK32);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; br=
eak;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ACPI_ERST_ACTION_BEGI=
N_DUMMY_WRITE_OPERATION:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in=
sns +=3D BEA(WRITE_REGISTER_VALUE, 0, 32,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ERST_CSR_ACTION, action, MASK8);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; br=
eak;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ACPI_ERST_ACTION_RESE=
RVED:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in=
sns +=3D BEA(WRITE_REGISTER_VALUE, 0, 32,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ERST_CSR_ACTION, action, MASK8);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; br=
eak;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ACPI_ERST_ACTION_GET_=
ERROR_LOG_ADDRESS_RANGE:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in=
sns +=3D BEA(WRITE_REGISTER_VALUE, 0, 32,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ERST_CSR_ACTION, action, MASK8);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in=
sns +=3D BEA(READ_REGISTER&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; , 0, 64,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ERST_CSR_VALUE, 0, MASK64);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; br=
eak;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ACPI_ERST_ACTION_GET_=
ERROR_LOG_ADDRESS_LENGTH:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in=
sns +=3D BEA(WRITE_REGISTER_VALUE, 0, 32,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ERST_CSR_ACTION, action, MASK8);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in=
sns +=3D BEA(READ_REGISTER&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; , 0, 64,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ERST_CSR_VALUE, 0, MASK32);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; br=
eak;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ACPI_ERST_ACTION_GET_=
ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in=
sns +=3D BEA(WRITE_REGISTER_VALUE, 0, 32,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ERST_CSR_ACTION, action, MASK8);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in=
sns +=3D BEA(READ_REGISTER&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; , 0, 32,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ERST_CSR_VALUE, 0, MASK32);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; br=
eak;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case ACPI_ERST_ACTION_GET_=
EXECUTE_OPERATION_TIMINGS:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in=
sns +=3D BEA(WRITE_REGISTER_VALUE, 0, 32,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ERST_CSR_ACTION, action, MASK8);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in=
sns +=3D BEA(READ_REGISTER&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; , 0, 64,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ERST_CSR_VALUE, 0, MASK64);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in=
sns +=3D BEA(NOOP, 0, 0, 0, action, 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; br=
eak;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; /* acpi_data_push() within BEA() can result in new=
 GArray pointer */<br>
&gt; +&nbsp;&nbsp;&nbsp; *(uint32_t *)(table_data-&gt;data + iec_offset) =
=3D cpu_to_le32(insns);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; build_header(linker, table_data,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; (void *)(table_data-&gt;data + erst_start),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;ERST&quot;, table_data-&gt;len - erst_sta=
rt,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; 1, NULL, NULL);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; if (erst_base =3D=3D 0) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * This ACPI routine =
is invoked twice, but this code<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * snippet needs to h=
appen just once.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * And this code in e=
rst_class_init() is too early.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DeviceState *dev;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SysBusDevice *s;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev =3D qdev_new(TYPE_ACPI=
_ERST);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; erst_debug(&quot;qdev_crea=
te dev %p\n&quot;, dev);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s =3D SYS_BUS_DEVICE(dev);=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sysbus_realize_and_unref(s=
, &amp;error_fatal);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ACPIERST(dev)-&gt;base =3D=
 base;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sysbus_mmio_map(s, 0, base=
);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; erst_base =3D base;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; erst_debug(&quot;erst_base=
 %lx\n&quot;, base);<br>
&gt; +&nbsp;&nbsp;&nbsp; }<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*******************************************************************/=
<br>
&gt; +/*******************************************************************/=
<br>
&gt; +static int erst_post_load(void *opaque, int version_id)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp; ERSTDeviceState *s =3D opaque;<br>
&gt; +&nbsp;&nbsp;&nbsp; erst_debug(&quot;+erst_post_load(%d)\n&quot;, vers=
ion_id);<br>
&gt; +&nbsp;&nbsp;&nbsp; /* Ensure nvram[] persists into backing file */<br=
>
&gt; +&nbsp;&nbsp;&nbsp; update_erst_backing_file(s, 0, s-&gt;nvram, s-&gt;=
prop_size);<br>
&gt; +&nbsp;&nbsp;&nbsp; erst_debug(&quot;-erst_post_load()\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const VMStateDescription erst_vmstate&nbsp; =3D {<br>
&gt; +&nbsp;&nbsp;&nbsp; .name =3D &quot;acpi-erst&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp; .version_id =3D 1,<br>
&gt; +&nbsp;&nbsp;&nbsp; .minimum_version_id =3D 1,<br>
&gt; +&nbsp;&nbsp;&nbsp; .post_load =3D erst_post_load,<br>
&gt; +&nbsp;&nbsp;&nbsp; .fields =3D (VMStateField[]) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VMSTATE_UINT8(operation, E=
RSTDeviceState),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VMSTATE_UINT8(busy_status,=
 ERSTDeviceState),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VMSTATE_UINT8(command_stat=
us, ERSTDeviceState),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VMSTATE_UINT32(record_offs=
et, ERSTDeviceState),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VMSTATE_UINT32(record_coun=
t, ERSTDeviceState),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VMSTATE_UINT64(reg_action,=
 ERSTDeviceState),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VMSTATE_UINT64(reg_value, =
ERSTDeviceState),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VMSTATE_UINT64(record_iden=
tifier, ERSTDeviceState),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VMSTATE_UINT8_ARRAY(record=
, ERSTDeviceState, ERST_RECORD_SIZE),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VMSTATE_UINT8_ARRAY(tmp_re=
cord, ERSTDeviceState, ERST_RECORD_SIZE),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VMSTATE_VARRAY_UINT32(nvra=
m, ERSTDeviceState, prop_size, 0,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vm=
state_info_uint8, uint8_t),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VMSTATE_END_OF_LIST()<br>
&gt; +&nbsp;&nbsp;&nbsp; }<br>
&gt; +};<br>
&gt; +<br>
&gt; +static void erst_realizefn(DeviceState *dev, Error **errp)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp; SysBusDevice *d =3D SYS_BUS_DEVICE(dev);<br>
&gt; +&nbsp;&nbsp;&nbsp; ERSTDeviceState *s =3D ACPIERST(dev);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; erst_debug(&quot;+erst_realizefn()\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp; if (!s-&gt;prop_filename) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s-&gt;prop_filename =3D (c=
har *)(TYPE_ACPI_ERST &quot;.backing&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; if (!s-&gt;prop_filename) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error_setg(errp, &quot;'fi=
lename' property is not set&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
&gt; +&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; if (!(s-&gt;prop_size &gt; ERST_RECORD_SIZE) &amp;=
&amp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (s-&gt;prop_size &lt;=3D 0=
x04000000)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error_setg(errp, &quot;'si=
ze' property %d is not set properly&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s-=
&gt;prop_size);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
&gt; +&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; /* Convert prop_size to integer multiple of ERST_R=
ECORD_SIZE */<br>
&gt; +&nbsp;&nbsp;&nbsp; s-&gt;prop_size -=3D (s-&gt;prop_size % ERST_RECOR=
D_SIZE);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; load_erst_backing_file(s);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; erst_debug(&quot;filename %s\n&quot;, s-&gt;prop_f=
ilename);<br>
&gt; +&nbsp;&nbsp;&nbsp; erst_debug(&quot;size %x\n&quot;, s-&gt;prop_size)=
;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; memory_region_init_io(&amp;s-&gt;iomem, OBJECT(s),=
 &amp;erst_rw_ops, s,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; TYPE_ACPI_ERST, ERST_IOMEM_SIZE);<br>
&gt; +&nbsp;&nbsp;&nbsp; sysbus_init_mmio(d, &amp;s-&gt;iomem);<br>
&gt; +&nbsp;&nbsp;&nbsp; erst_debug(&quot;-erst_realizefn()\n&quot;);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void erst_unrealizefn(DeviceState *dev)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp; ERSTDeviceState *s =3D ACPIERST(dev);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; erst_debug(&quot;+erst_unrealizefn()\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp; if (s-&gt;nvram) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Ensure nvram[] persists=
 into backing file */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; update_erst_backing_file(s=
, 0, s-&gt;nvram, s-&gt;prop_size);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_free(s-&gt;nvram);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s-&gt;nvram =3D NULL;<br>
&gt; +&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp; erst_debug(&quot;-erst_unrealizefn()\n&quot;);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void erst_reset(DeviceState *dev)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp; ERSTDeviceState *s =3D ACPIERST(dev);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; erst_debug(&quot;+erst_reset(%p) %d\n&quot;, s, s-=
&gt;record_count);<br>
&gt; +&nbsp;&nbsp;&nbsp; s-&gt;operation =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp; s-&gt;busy_status =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp; s-&gt;command_status =3D ACPI_ERST_STATUS_SUCCESS;=
<br>
&gt; +&nbsp;&nbsp;&nbsp; /* indicate empty/no-more until further notice */<=
br>
&gt; +&nbsp;&nbsp;&nbsp; s-&gt;record_identifier =3D ERST_INVALID_RECORD_ID=
;<br>
&gt; +&nbsp;&nbsp;&nbsp; s-&gt;record_offset =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp; s-&gt;next_record_index =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp; /* NOTE: record_count and nvram[] are initialized =
elsewhere */<br>
&gt; +&nbsp;&nbsp;&nbsp; erst_debug(&quot;-erst_reset()\n&quot;);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static Property erst_properties[] =3D {<br>
&gt; +&nbsp;&nbsp;&nbsp; DEFINE_PROP_UINT32(&quot;size&quot;, ERSTDeviceSta=
te, prop_size, 0x00010000),<br>
&gt; +&nbsp;&nbsp;&nbsp; DEFINE_PROP_STRING(&quot;filename&quot;, ERSTDevic=
eState, prop_filename),<br>
&gt; +&nbsp;&nbsp;&nbsp; DEFINE_PROP_END_OF_LIST(),<br>
&gt; +};<br>
&gt; +<br>
&gt; +static void erst_class_init(ObjectClass *klass, void *data)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp; DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; erst_debug(&quot;+erst_class_init()\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp; dc-&gt;realize =3D erst_realizefn;<br>
&gt; +&nbsp;&nbsp;&nbsp; dc-&gt;unrealize =3D erst_unrealizefn;<br>
&gt; +&nbsp;&nbsp;&nbsp; dc-&gt;reset =3D erst_reset;<br>
&gt; +&nbsp;&nbsp;&nbsp; dc-&gt;vmsd =3D &amp;erst_vmstate;<br>
&gt; +&nbsp;&nbsp;&nbsp; device_class_set_props(dc, erst_properties);<br>
&gt; +&nbsp;&nbsp;&nbsp; dc-&gt;desc =3D &quot;ACPI Error Record Serializat=
ion Table (ERST) device&quot;;<br>
&gt; +&nbsp;&nbsp;&nbsp; set_bit(DEVICE_CATEGORY_MISC, dc-&gt;categories);<=
br>
&gt; +&nbsp;&nbsp;&nbsp; erst_debug(&quot;-erst_class_init()\n&quot;);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const TypeInfo erst_type_info =3D {<br>
&gt; +&nbsp;&nbsp;&nbsp; .name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; =3D TYPE_ACPI_ERST,<br>
&gt; +&nbsp;&nbsp;&nbsp; .parent&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
=3D TYPE_SYS_BUS_DEVICE,<br>
&gt; +&nbsp;&nbsp;&nbsp; .class_init&nbsp;&nbsp;&nbsp; =3D erst_class_init,=
<br>
&gt; +&nbsp;&nbsp;&nbsp; .instance_size =3D sizeof(ERSTDeviceState),<br>
&gt; +};<br>
&gt; +<br>
&gt; +static void erst_register_types(void)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp; type_register_static(&amp;erst_type_info);<br>
&gt; +}<br>
&gt; +<br>
&gt; +type_init(erst_register_types)<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_CO1PR10MB4531392E4B963B163A0FC89C97739CO1PR10MB4531namp_--

