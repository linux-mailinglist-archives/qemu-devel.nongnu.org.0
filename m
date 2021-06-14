Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A2B3A66E6
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 14:47:10 +0200 (CEST)
Received: from localhost ([::1]:49694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lslzh-000646-If
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 08:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lsly0-0005I5-O0
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 08:45:24 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:15560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lslxw-0002iW-02
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 08:45:24 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15ECgWRl027266; Mon, 14 Jun 2021 12:45:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=0r1+bL566qtfxoOE6D1M1LGQolcbgKcFUBREX3Q8Es4=;
 b=Z5Y4AKkPw7DatnvCdBdw26EgbF3BTLQNd8wiPiOQGVMknMY9OUQoEMpoaTNFh7NbnGma
 fHH4H/5NnCNKqdDU1E0sP5clFsP2EldVFevhuUL27FBHaSQCmqj5yIYQZd+YMzXnH/TJ
 b+vKoKiST97niZ4B3K8JJ3zG5MLFXp7BO7s+YzlWPoY6usAeWAVVW7zbJ5Zhi5Dng4pg
 3Fn1M3BQZnzYeJArzjig5z8eFCwiomkPi+PRG1AL1bX5WhPOp8YFDn1jNbJobBaEFTnN
 +cXgdPGvff/6lsYYIvmI4zkD10Vex/+JTaYYTKAuXgpQbkskErM/OS/fweRgYL7AgD5a MA== 
Received: from oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 395y1kr4v0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Jun 2021 12:45:15 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 15ECjE4q050886;
 Mon, 14 Jun 2021 12:45:14 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2041.outbound.protection.outlook.com [104.47.51.41])
 by aserp3030.oracle.com with ESMTP id 3959cj9q4u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Jun 2021 12:45:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZPxrzqq2Iem314H1TjnDofWz/T8Z4PxQw3YX7eSI7rnqpA0tjXNui+cpjDZzCi1BySnaKelqoZYrFZAm9O53mxS9pMIF0XGfck8H8UUOqgYohdOoLfHrDs42THxkvlD34xI6yXm2cenzqa6IQEU+2JjpFQ5tprchwcefWBgvaJYMTdi2kyB5cR2Za2kJJy4c8Bi9JdqlICgFyS8VuI2VM1OhroYAf+OQr3f+aCD7FAqZUQJ8EU7V1Flzf39pcCZwSnBlkR9/gtxCZjKNPBbWr8EPrAV/e4shmmcyrEjuBvHMSyUzLwVPuIqowk1rfdRMclW11aYbJBDXIdX38uZGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0r1+bL566qtfxoOE6D1M1LGQolcbgKcFUBREX3Q8Es4=;
 b=RKPC3EJSpAvugAkmiZZnN7WKTP7FsZ+i4cypz4k768z4BoMj13Pu3e2Ncvo9KEQuHyN/V/D5DV0bLRhK5+VHpkQb5UcS+sTV0OZM6jpBqa66tMniczDF6ytYX1z17mTAUuE+nr9YjkJ7+wpM7VWEHXkmXhMWy7wSxXs3jIZ/8JXL66DlS2EtC48/ntKT65y2MmFG3iS6ZXQfa3b2FWPctHFVJnLX42ld7uVvQEMcGLuS/Bsl+QXQ2W+APF7Wg1HJocEZmE15ULUu7NCrHWV5XVs8HhPT0jURLeMb1ajawNkcYxJQ4YSEPlIMk4jatJIw7lVBsFSsQo3eZkRtOLlrNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0r1+bL566qtfxoOE6D1M1LGQolcbgKcFUBREX3Q8Es4=;
 b=C9gj80mrZq6Y9GU8gM/kWVBUTd61RDPmQ2GSsc8zD8N+GOGEW/lL6fhXyWpxJo1ROVCn0V0ZMHwUd11R7lqMC565nrI9W7eyYHqovIzGbG4HKeqhrg+V27Tq9/9CX7QgsRCsZBtvDsKd+1NyXCcxjD5eEh26Bav8hcVeyquA1Pc=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB4740.namprd10.prod.outlook.com (2603:10b6:303:9d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Mon, 14 Jun
 2021 12:45:01 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc%7]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 12:45:01 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v3 0/7] acpi: Error Record Serialization Table, ERST,
 support for QEMU
Thread-Topic: [PATCH v3 0/7] acpi: Error Record Serialization Table, ERST,
 support for QEMU
Thread-Index: AQHXU+1K1MWO0uUa1UaYo1SgFby41KsIj2WAgACI24SACip5AIAAS4Cy
Date: Mon, 14 Jun 2021 12:45:01 +0000
Message-ID: <CO1PR10MB45313C63F84EA27124CC2C5297319@CO1PR10MB4531.namprd10.prod.outlook.com>
References: <1622225659-16847-1-git-send-email-eric.devolder@oracle.com>
 <20210607144959.65b4c5a6@redhat.com>
 <CO1PR10MB4531BD9AC25B8A64611702E997389@CO1PR10MB4531.namprd10.prod.outlook.com>,
 <20210614101426.5c814ef9@redhat.com>
In-Reply-To: <20210614101426.5c814ef9@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [138.3.201.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b59c4225-1d88-4967-7e0c-08d92f3239b6
x-ms-traffictypediagnostic: CO1PR10MB4740:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR10MB4740A2C0AEFD6882F8FE9BCF97319@CO1PR10MB4740.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mMRepo40+QTxsqq80aN4gep1vZaZbTvC6JKJui7vwyWQ1Sl+PCdCcSAiTuc3cDv73TKoBp6QtkI9thidFgD51z78kGMhUjtkeTRTnVHdv4rNlnCGFeDyJqCwPCyqjsH/CWk1mJVj7bxykXfj98HpJDpORwAvyhmQzZ/LVyuZDVKDqWTPjdzE25XLLjMd+UnwqBQPV0ht9yJs9cNwretufhm2bIyA3RbTFB3b6FIKh32SRoRx+6eyz6rvrDRW6z8RlyRjgh+GKe/bxc5vIq4EreBAmerH5TR4sECDO/Fkd3MX7JTKRl3uhdGilaFVM+xtXtr1r2QcyRKv1AhU6scT28/V5ecNNGsfDlPkEJLSFQ0D8P71TjSc3Tdmdqe9IL+PGw1AvAO2guXXmdoncgITLByaoGnjzC7iYCfXVw2J3fRSh0IVhuI48jRBAkSbyiGVVyWktbcjY4iNaZefArLDhV3tOMeWw6HL28/A1MWz++3GpUAjf3p8x+yQKUxhA+tuAMLe+7QWI4WCOpr1HyWvwnboyIKedKwCbXtH2BSCSVM8AK29EBgpZMKhTe+ZmtixVbl+oOcEW5qwYBnFdVPaws+7Wvkf6763RhYlxn0zWFGSityIAij+KTOVmuq1/kN7GRQY9bKt2g4V6SGvdw+njYgMrM+5VNZqxCU6JcIFPFZMIw0JyPNfkWrHQmF75uF1eh/PDQZIG5TDkBkWyHbGbK0aVLxNMSK5mX3/mK2o4kXbeUaMQ5DMT3wd55Mbze+m
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(39860400002)(376002)(396003)(346002)(19627405001)(478600001)(186003)(53546011)(122000001)(316002)(83380400001)(166002)(52536014)(7696005)(38100700002)(966005)(86362001)(6506007)(6916009)(33656002)(66946007)(8936002)(4326008)(64756008)(66556008)(66446008)(8676002)(55016002)(66476007)(54906003)(71200400001)(9686003)(91956017)(2906002)(45080400002)(76116006)(26005)(107886003)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KWSLNpQHgY91dEaDUrl3T8Mb9mSDtnk2RvaNUMx+9MlYZEUNgwyRViMVP/H2?=
 =?us-ascii?Q?+lEaB2A0ql6bxpS/IZZM0U2J46PicofU1GP4W5LlRiEvKVqYhZTusMXLOZa/?=
 =?us-ascii?Q?ff4R5QbVevUtyf+kagCPgAnd429XoSSclypDIP0TW5WN0cB3MDHelQGAR4BD?=
 =?us-ascii?Q?9rrQ2UE1/L/Iyrk6QrJv42UhqbL5ZzRQOQ0XO6F+AcDmEnF5D1+enQOlTaxH?=
 =?us-ascii?Q?UsvX9p3jkLvdzw7f5JJM3u9cby1tAbuYoHVFs3DiCUBLTIKusdjIEsIVM28G?=
 =?us-ascii?Q?TuyARkeV5WJeiB4raVGN2TRCn6/TSq5xS8QEJTwJ+FVV5Bif1iO7Oe5mUc2L?=
 =?us-ascii?Q?5sZh16RJ3xehmV2b6FuvH3iL+IIX8oHKseSV+RmDNOlEehf6cBnwff9b2zj4?=
 =?us-ascii?Q?1EFht8CaOghrqH1qqNGaqB0EaZPjPwgyqji4FZItS+FGfPaeytis/yA/9WlE?=
 =?us-ascii?Q?ZLrVmp3mPhBN4hBti/QfNf5xpXODA0O7TyzGbyC+jjFTLAUx2qP7dD4D2lr6?=
 =?us-ascii?Q?vcjUEaVQu9Zr4bd6Zcf05yUMP1Z9A8CwWRbbHcVOo8+WY8v0YiHnL6cnCEQD?=
 =?us-ascii?Q?u2MfWNeCGFgzif25IiNpehk2QntyWa3sNTlpjfqqdhh1GvWi6h3ZlUziLxtw?=
 =?us-ascii?Q?DiCI9BaIFxdy73NOoYyXFLfzhzewfeM215kzEU3MSPSkTChD4qoFHQ81r8fA?=
 =?us-ascii?Q?jC/v4kDYnw7r22QP3e07rPmBlMXllDn9+Ei6p78RQonPYGvINZofVbxKtKiT?=
 =?us-ascii?Q?ZhbF+A3ni65CwV6Aegl9ZsxXn0Pxlq7YMJl1DGv+0v9zJn6sPFFnrOKdJJJa?=
 =?us-ascii?Q?m9duoXyuVAiACAgYCBHIzSXTcotAHiavW8XRRjblFmesMloZFQuND/cj2K/N?=
 =?us-ascii?Q?jclKOQOzw7eGFFnxatTyh5pDSjmk/oGSqQJwGEkMNnkpdkhoc+k8F6V/r8ZI?=
 =?us-ascii?Q?H8r7uKV1BrcEXMQ9c86NuHk4lZxyc5lz9IMMrrRNe8WhELQi5vISEHdFVu7m?=
 =?us-ascii?Q?nnXACFqnQPyAfB3fJe2nDt2VMF22oXqwAhicCL7U97Jp4WVhPzlwateTwxPy?=
 =?us-ascii?Q?IvKfHLGnqsm8uPQ7UTWqEQdTx7NsOnyD7XScFwB1pb4otpBKT5xhr3aeAipc?=
 =?us-ascii?Q?770y/D3iFxuxBAaaPhPl0cE3Ts5Ri04tKxWEP78n7e5oP+MK+NtweuIO35EJ?=
 =?us-ascii?Q?LRBOEgpebMNeVH3/lFhD+HLFmd4nFeNgUnWNaQIOLGMGAvDc7x1UBEvA0Txl?=
 =?us-ascii?Q?GpxsvBwP7GM7D7SyzsRtga/K8JHSx3H0s+ksR9mEYzi9tb2KbDWpIcZ4FEtV?=
 =?us-ascii?Q?vlk=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CO1PR10MB45313C63F84EA27124CC2C5297319CO1PR10MB4531namp_"
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b59c4225-1d88-4967-7e0c-08d92f3239b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2021 12:45:01.1313 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tDot7S1znR9C/3k7GLo41QYgpa96YX9VWRi9N/r19oMy6N3UubHP1wIueUJfyKJhjfmP5adFzELOgyifJHaAiHpy+yTKmAeXl2uyigmp7rY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4740
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10014
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 mlxscore=0
 adultscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106140087
X-Proofpoint-ORIG-GUID: xX3STexRK-gULWizjHkk2eCtuwz2FK_r
X-Proofpoint-GUID: xX3STexRK-gULWizjHkk2eCtuwz2FK_r
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
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

--_000_CO1PR10MB45313C63F84EA27124CC2C5297319CO1PR10MB4531namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Igor,
Thanks, I sent out V4 Friday; I believe it has all the changes in it that y=
ou have requested.
Regards,
eric

________________________________
From: Igor Mammedov <imammedo@redhat.com>
Sent: Monday, June 14, 2021 3:14 AM
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: qemu-devel@nongnu.org <qemu-devel@nongnu.org>; mst@redhat.com <mst@redh=
at.com>; marcel.apfelbaum@gmail.com <marcel.apfelbaum@gmail.com>; pbonzini@=
redhat.com <pbonzini@redhat.com>; rth@twiddle.net <rth@twiddle.net>; ehabko=
st@redhat.com <ehabkost@redhat.com>; Konrad Wilk <konrad.wilk@oracle.com>; =
Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v3 0/7] acpi: Error Record Serialization Table, ERST, s=
upport for QEMU

On Mon, 7 Jun 2021 21:03:06 +0000
Eric DeVolder <eric.devolder@oracle.com> wrote:

> Igor,
> Thanks for the information/feedback. I am working to implement all your s=
uggestions; from my perspective, there were two big changes requested, and =
the use of hostmem-file was the first, and the conversion to PCI the second=
. V3 was the hostmem-file, and hopefully all changes then in v4.

if series is work in progress and not ready for merging,
one should use RFC instead of PATCH tag


> Regards,
> eric
>
> ________________________________
> From: Igor Mammedov <imammedo@redhat.com>
> Sent: Monday, June 7, 2021 7:49 AM
> To: Eric DeVolder <eric.devolder@oracle.com>
> Cc: qemu-devel@nongnu.org <qemu-devel@nongnu.org>; mst@redhat.com <mst@re=
dhat.com>; marcel.apfelbaum@gmail.com <marcel.apfelbaum@gmail.com>; pbonzin=
i@redhat.com <pbonzini@redhat.com>; rth@twiddle.net <rth@twiddle.net>; ehab=
kost@redhat.com <ehabkost@redhat.com>; Konrad Wilk <konrad.wilk@oracle.com>=
; Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Subject: Re: [PATCH v3 0/7] acpi: Error Record Serialization Table, ERST,=
 support for QEMU
>
> On Fri, 28 May 2021 14:14:12 -0400
> Eric DeVolder <eric.devolder@oracle.com> wrote:
>
> > NOTE: Also, I wanted to push this v3 for review while alerting
> > that I will be on holiday through June 8 (possibly a few days
> > later).
> this version addressed only the way the host storage is accessed
> (and even that is only partially and needs more work to put into it)
> The rest of the comments on v2 are still not addressed.
>
> > NOTE: The patches are arranged such that each can be applied
> > in order and not break the build (except the 0001 patch). Igor
> > has hinted at changing this, but I'm unsure how else to
> > re-arrange these patches accordingly.
> as minimum, see suggestion for splitting #4 in 5/7
>
> > NOTE: With the conversion to TYPE_MEMORY_BACKEND_FILE, live
> > migration to a completely different host does not behave
> > properly (it loses the ERST contents because the file is not
> > present on the new host). This still needs to be worked out.
> > Other than live migration, this patchset fully works.
>
> see: vmstate_register_ram_global()
>
> > This patchset introduces support for the ACPI Error Record
> > Serialization Table, ERST.
> >
> > Linux uses the persistent storage filesystem, pstore, to record
> > information (eg. dmesg tail) upon panics and shutdowns.  Pstore is
> > independent of, and runs before, kdump.  In certain scenarios (ie.
> > hosts/guests with root filesystems on NFS/iSCSI where networking
> > software and/or hardware fails), pstore may contain the only
> > information available for post-mortem debugging.
> >
> > Two common storage backends for the pstore filesystem are ACPI ERST
> > and UEFI. Most BIOS implement ACPI ERST; however, ACPI ERST is not
> > currently supported in QEMU, and UEFI is not utilized in all guests.
> > By implementing ACPI ERST within QEMU, then the ACPI ERST becomes a
> > viable pstore storage backend for virtual machines (as it is now for
> > bare metal machines).
> >
> > Enabling support for ACPI ERST facilitates a consistent method to
> > capture kernel panic information in a wide range of guests: from
> > resource-constrained microvms to very large guests, and in
> > particular, in direct-boot environments (which would lack UEFI
> > run-time services).
> >
> > Note that Microsoft Windows also utilizes the ACPI ERST for certain
> > crash information, if available.
> >
> > The ACPI ERST persistent storage is contained within a single backing
> > file, with a default size of 64KiB. The size and filename of the
> > backing file can be obtained from QEMU parameters.
> >
> > The ACPI specification[1], in Chapter "ACPI Platform Error Interfaces
> > (APEI)", and specifically subsection "Error Serialization", outlines
> > a method for storing error records into persistent storage.
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
> > Suggested-by: Konrad Wilk <konrad.wilk@oracle.com>
> > Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> >
> > ---
> > v3: 28may2021
> >  - Converted to using a TYPE_MEMORY_BACKEND_FILE object rather than
> >    internal array with explicit file operations, per Igor.
> good start but it's not complete yet.
>
> >  - Changed the way the qdev and base address are handled, allowing
> >    ERST to be disabled at run-time. Also aligns better with other
> >    existing code.
> it aligns with ancient code template and the way it used to plumb
> into board (it's fine for pre-existing devices but not for new ones
> (unless there is no other way )).
> v2 had suggestions how to proceed (you asked some questions back then,
> but result is not reflected in this series, which still has the old
> code as it was in v2).
>
>
> > v2: 8feb2021
> >  - Added qtest/smoke test per Paolo Bonzini
> >  - Split patch into smaller chunks, per Igo Mammedov
> >  - Did away with use of ACPI packed structures, per Igo Mammedov
> >
> > v1: 26oct2020
> >  - initial post
> >
> > ---
> >  hw/acpi/erst.c         | 909 +++++++++++++++++++++++++++++++++++++++++=
++++++++
> >  hw/acpi/meson.build    |   1 +
> >  hw/i386/acpi-build.c   |   4 +
> >  include/hw/acpi/erst.h |  97 ++++++
> >  4 files changed, 1011 insertions(+)
> >  create mode 100644 hw/acpi/erst.c
> >  create mode 100644 include/hw/acpi/erst.h
> >
> >
> > Eric DeVolder (7):
> >   ACPI ERST: bios-tables-test.c steps 1 and 2
> >   ACPI ERST: header file for ERST
> >   ACPI ERST: support for ACPI ERST feature
> >   ACPI ERST: include ERST feature in build of ACPI support
> >   ACPI ERST: create ERST device for pc/x86 machines.
> >   ACPI ERST: qtest for ERST
> >   ACPI ERST: step 6 of bios-tables-test.c
> >
> >  hw/acpi/erst.c               | 902 +++++++++++++++++++++++++++++++++++=
++++++++
> >  hw/acpi/meson.build          |   1 +
> >  hw/i386/acpi-build.c         |   7 +
> >  hw/i386/pc.c                 |  31 ++
> >  include/hw/acpi/erst.h       |  82 ++++
> >  include/hw/i386/pc.h         |   1 +
> >  tests/data/acpi/microvm/ERST |   0
> >  tests/data/acpi/pc/ERST      | Bin 0 -> 976 bytes
> >  tests/data/acpi/q35/ERST     | Bin 0 -> 976 bytes
> >  tests/qtest/erst-test.c      | 106 +++++
> >  tests/qtest/meson.build      |   2 +
> >  11 files changed, 1132 insertions(+)
> >  create mode 100644 hw/acpi/erst.c
> >  create mode 100644 include/hw/acpi/erst.h
> >  create mode 100644 tests/data/acpi/microvm/ERST
> >  create mode 100644 tests/data/acpi/pc/ERST
> >  create mode 100644 tests/data/acpi/q35/ERST
> >  create mode 100644 tests/qtest/erst-test.c
> >
>


--_000_CO1PR10MB45313C63F84EA27124CC2C5297319CO1PR10MB4531namp_
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
Thanks, I sent out V4 Friday; I believe it has all the changes in it that y=
ou have requested.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
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
<b>Sent:</b> Monday, June 14, 2021 3:14 AM<br>
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
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Mon, 7 Jun 2021 21:03:06 +0000<br>
Eric DeVolder &lt;eric.devolder@oracle.com&gt; wrote:<br>
<br>
&gt; Igor,<br>
&gt; Thanks for the information/feedback. I am working to implement all you=
r suggestions; from my perspective, there were two big changes requested, a=
nd the use of hostmem-file was the first, and the conversion to PCI the sec=
ond. V3 was the hostmem-file, and hopefully
 all changes then in v4.<br>
<br>
if series is work in progress and not ready for merging,<br>
one should use RFC instead of PATCH tag<br>
<br>
<br>
&gt; Regards,<br>
&gt; eric<br>
&gt; <br>
&gt; ________________________________<br>
&gt; From: Igor Mammedov &lt;imammedo@redhat.com&gt;<br>
&gt; Sent: Monday, June 7, 2021 7:49 AM<br>
&gt; To: Eric DeVolder &lt;eric.devolder@oracle.com&gt;<br>
&gt; Cc: qemu-devel@nongnu.org &lt;qemu-devel@nongnu.org&gt;; mst@redhat.co=
m &lt;mst@redhat.com&gt;; marcel.apfelbaum@gmail.com &lt;marcel.apfelbaum@g=
mail.com&gt;; pbonzini@redhat.com &lt;pbonzini@redhat.com&gt;; rth@twiddle.=
net &lt;rth@twiddle.net&gt;; ehabkost@redhat.com &lt;ehabkost@redhat.com&gt=
;;
 Konrad Wilk &lt;konrad.wilk@oracle.com&gt;; Boris Ostrovsky &lt;boris.ostr=
ovsky@oracle.com&gt;<br>
&gt; Subject: Re: [PATCH v3 0/7] acpi: Error Record Serialization Table, ER=
ST, support for QEMU<br>
&gt; <br>
&gt; On Fri, 28 May 2021 14:14:12 -0400<br>
&gt; Eric DeVolder &lt;eric.devolder@oracle.com&gt; wrote:<br>
&gt; <br>
&gt; &gt; NOTE: Also, I wanted to push this v3 for review while alerting<br=
>
&gt; &gt; that I will be on holiday through June 8 (possibly a few days<br>
&gt; &gt; later).&nbsp; <br>
&gt; this version addressed only the way the host storage is accessed<br>
&gt; (and even that is only partially and needs more work to put into it)<b=
r>
&gt; The rest of the comments on v2 are still not addressed.<br>
&gt; <br>
&gt; &gt; NOTE: The patches are arranged such that each can be applied<br>
&gt; &gt; in order and not break the build (except the 0001 patch). Igor<br=
>
&gt; &gt; has hinted at changing this, but I'm unsure how else to<br>
&gt; &gt; re-arrange these patches accordingly.&nbsp; <br>
&gt; as minimum, see suggestion for splitting #4 in 5/7<br>
&gt; <br>
&gt; &gt; NOTE: With the conversion to TYPE_MEMORY_BACKEND_FILE, live<br>
&gt; &gt; migration to a completely different host does not behave<br>
&gt; &gt; properly (it loses the ERST contents because the file is not<br>
&gt; &gt; present on the new host). This still needs to be worked out.<br>
&gt; &gt; Other than live migration, this patchset fully works.&nbsp; <br>
&gt; <br>
&gt; see: vmstate_register_ram_global()<br>
&gt; <br>
&gt; &gt; This patchset introduces support for the ACPI Error Record<br>
&gt; &gt; Serialization Table, ERST.<br>
&gt; &gt;<br>
&gt; &gt; Linux uses the persistent storage filesystem, pstore, to record<b=
r>
&gt; &gt; information (eg. dmesg tail) upon panics and shutdowns.&nbsp; Pst=
ore is<br>
&gt; &gt; independent of, and runs before, kdump.&nbsp; In certain scenario=
s (ie.<br>
&gt; &gt; hosts/guests with root filesystems on NFS/iSCSI where networking<=
br>
&gt; &gt; software and/or hardware fails), pstore may contain the only<br>
&gt; &gt; information available for post-mortem debugging.<br>
&gt; &gt;<br>
&gt; &gt; Two common storage backends for the pstore filesystem are ACPI ER=
ST<br>
&gt; &gt; and UEFI. Most BIOS implement ACPI ERST; however, ACPI ERST is no=
t<br>
&gt; &gt; currently supported in QEMU, and UEFI is not utilized in all gues=
ts.<br>
&gt; &gt; By implementing ACPI ERST within QEMU, then the ACPI ERST becomes=
 a<br>
&gt; &gt; viable pstore storage backend for virtual machines (as it is now =
for<br>
&gt; &gt; bare metal machines).<br>
&gt; &gt;<br>
&gt; &gt; Enabling support for ACPI ERST facilitates a consistent method to=
<br>
&gt; &gt; capture kernel panic information in a wide range of guests: from<=
br>
&gt; &gt; resource-constrained microvms to very large guests, and in<br>
&gt; &gt; particular, in direct-boot environments (which would lack UEFI<br=
>
&gt; &gt; run-time services).<br>
&gt; &gt;<br>
&gt; &gt; Note that Microsoft Windows also utilizes the ACPI ERST for certa=
in<br>
&gt; &gt; crash information, if available.<br>
&gt; &gt;<br>
&gt; &gt; The ACPI ERST persistent storage is contained within a single bac=
king<br>
&gt; &gt; file, with a default size of 64KiB. The size and filename of the<=
br>
&gt; &gt; backing file can be obtained from QEMU parameters.<br>
&gt; &gt;<br>
&gt; &gt; The ACPI specification[1], in Chapter &quot;ACPI Platform Error I=
nterfaces<br>
&gt; &gt; (APEI)&quot;, and specifically subsection &quot;Error Serializati=
on&quot;, outlines<br>
&gt; &gt; a method for storing error records into persistent storage.<br>
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
&gt; &gt; Suggested-by: Konrad Wilk &lt;konrad.wilk@oracle.com&gt;<br>
&gt; &gt; Signed-off-by: Eric DeVolder &lt;eric.devolder@oracle.com&gt;<br>
&gt; &gt;<br>
&gt; &gt; ---<br>
&gt; &gt; v3: 28may2021<br>
&gt; &gt;&nbsp; - Converted to using a TYPE_MEMORY_BACKEND_FILE object rath=
er than<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; internal array with explicit file operations, p=
er Igor.&nbsp; <br>
&gt; good start but it's not complete yet.<br>
&gt; <br>
&gt; &gt;&nbsp; - Changed the way the qdev and base address are handled, al=
lowing<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; ERST to be disabled at run-time. Also aligns be=
tter with other<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; existing code.&nbsp; <br>
&gt; it aligns with ancient code template and the way it used to plumb<br>
&gt; into board (it's fine for pre-existing devices but not for new ones<br=
>
&gt; (unless there is no other way )).<br>
&gt; v2 had suggestions how to proceed (you asked some questions back then,=
<br>
&gt; but result is not reflected in this series, which still has the old<br=
>
&gt; code as it was in v2).<br>
&gt; <br>
&gt; <br>
&gt; &gt; v2: 8feb2021<br>
&gt; &gt;&nbsp; - Added qtest/smoke test per Paolo Bonzini<br>
&gt; &gt;&nbsp; - Split patch into smaller chunks, per Igo Mammedov<br>
&gt; &gt;&nbsp; - Did away with use of ACPI packed structures, per Igo Mamm=
edov<br>
&gt; &gt;<br>
&gt; &gt; v1: 26oct2020<br>
&gt; &gt;&nbsp; - initial post<br>
&gt; &gt;<br>
&gt; &gt; ---<br>
&gt; &gt;&nbsp; hw/acpi/erst.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; | 909 +++++++++++++++++++++++++++++++++++++++++++++++++<br>
&gt; &gt;&nbsp; hw/acpi/meson.build&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +<br>
&gt; &gt;&nbsp; hw/i386/acpi-build.c&nbsp;&nbsp; |&nbsp;&nbsp; 4 +<br>
&gt; &gt;&nbsp; include/hw/acpi/erst.h |&nbsp; 97 ++++++<br>
&gt; &gt;&nbsp; 4 files changed, 1011 insertions(+)<br>
&gt; &gt;&nbsp; create mode 100644 hw/acpi/erst.c<br>
&gt; &gt;&nbsp; create mode 100644 include/hw/acpi/erst.h<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Eric DeVolder (7):<br>
&gt; &gt;&nbsp;&nbsp; ACPI ERST: bios-tables-test.c steps 1 and 2<br>
&gt; &gt;&nbsp;&nbsp; ACPI ERST: header file for ERST<br>
&gt; &gt;&nbsp;&nbsp; ACPI ERST: support for ACPI ERST feature<br>
&gt; &gt;&nbsp;&nbsp; ACPI ERST: include ERST feature in build of ACPI supp=
ort<br>
&gt; &gt;&nbsp;&nbsp; ACPI ERST: create ERST device for pc/x86 machines.<br=
>
&gt; &gt;&nbsp;&nbsp; ACPI ERST: qtest for ERST<br>
&gt; &gt;&nbsp;&nbsp; ACPI ERST: step 6 of bios-tables-test.c<br>
&gt; &gt;<br>
&gt; &gt;&nbsp; hw/acpi/erst.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 902 +++++++++++++++++++++++++++++=
++++++++++++++<br>
&gt; &gt;&nbsp; hw/acpi/meson.build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +<br>
&gt; &gt;&nbsp; hw/i386/acpi-build.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |&nbsp;&nbsp; 7 +<br>
&gt; &gt;&nbsp; hw/i386/pc.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 31 ++<br>
&gt; &gt;&nbsp; include/hw/acpi/erst.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp; 82 ++++<br>
&gt; &gt;&nbsp; include/hw/i386/pc.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |&nbsp;&nbsp; 1 +<br>
&gt; &gt;&nbsp; tests/data/acpi/microvm/ERST |&nbsp;&nbsp; 0<br>
&gt; &gt;&nbsp; tests/data/acpi/pc/ERST&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin=
 0 -&gt; 976 bytes<br>
&gt; &gt;&nbsp; tests/data/acpi/q35/ERST&nbsp;&nbsp;&nbsp;&nbsp; | Bin 0 -&=
gt; 976 bytes<br>
&gt; &gt;&nbsp; tests/qtest/erst-test.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 106=
 +++++<br>
&gt; &gt;&nbsp; tests/qtest/meson.build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbs=
p;&nbsp; 2 +<br>
&gt; &gt;&nbsp; 11 files changed, 1132 insertions(+)<br>
&gt; &gt;&nbsp; create mode 100644 hw/acpi/erst.c<br>
&gt; &gt;&nbsp; create mode 100644 include/hw/acpi/erst.h<br>
&gt; &gt;&nbsp; create mode 100644 tests/data/acpi/microvm/ERST<br>
&gt; &gt;&nbsp; create mode 100644 tests/data/acpi/pc/ERST<br>
&gt; &gt;&nbsp; create mode 100644 tests/data/acpi/q35/ERST<br>
&gt; &gt;&nbsp; create mode 100644 tests/qtest/erst-test.c<br>
&gt; &gt;&nbsp; <br>
&gt; <br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_CO1PR10MB45313C63F84EA27124CC2C5297319CO1PR10MB4531namp_--

