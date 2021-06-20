Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E60693ADF5D
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 18:31:39 +0200 (CEST)
Received: from localhost ([::1]:54842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv0MB-0000wu-68
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 12:31:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <admin@fosshost.org>)
 id 1lv0KV-0000EA-MS
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 12:29:51 -0400
Received: from mail-eopbgr110067.outbound.protection.outlook.com
 ([40.107.11.67]:52496 helo=GBR01-CWL-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <admin@fosshost.org>)
 id 1lv0KS-0006R3-F7
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 12:29:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3EBPkBZr+ja5v1YtP8BLGID/T/EFvYsiQ9kCEFXSs03kd0dfa5aIbnglJ4iH8CsJLsNtFJzqCZpqgos++PoTW3Dy6SxfmC4xCFTLaW/YxMOep/1dEYDZTTihDHmD8lmPsxsskZ/QUS2a+1E84RaygUy3Pvw57d+GGPS1LSLTmFgmm4Wb6zyRmWlfRNgsvWWnN7H0mkGSlFyCOvcUy7JdCb6CVCvzVYB8Rq+/OwNgehJnt5thA3x/lCncTsBMOUGgh3C3SCJM7tOWERPAV7scbabaiEcpL2OFoY1Nc5d7cQt7ONvNg3sHVrCnuuc2Va4O4Lt+jYZ/d0hkbYTNoqeWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCybmaLTjC0PYactE4WbuGyAZzELDjbEbTooU428buQ=;
 b=G1PcenxsPcxHGly6ByAkTtjanGv8HSVNDzOCVc/ucbv4XcnUwcHc+zpkNASd16sg2epDnKqfbCUGiXGil0Qkbc1ZbNZtrOo1+Arpd44kNkVnY6h86lWiReeK8hiS4tBicQ0b4DKLHYY2ffAYRCSRG6+axL4gJlGT5yzC6gkT8y3QbSHYcg19OfYdZpQQQjpQAZNEiYkFisorhObzZ4LuDqvQVHuZoI+Lcv3D/nWAsKQtYkxtYh/lvm1cZ8OwcPiciGSTLWJPzA4vH5W+cGPiWLvB1rxhKlH+PasokU3bwqIoSpM6R8OsQhuqM1V8vdLKuLuH6LHayonhTBnIlYzfKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fosshost.org; dmarc=pass action=none header.from=fosshost.org;
 dkim=pass header.d=fosshost.org; arc=none
Received: from LO2P123MB2605.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:c2::10)
 by LO4P123MB4607.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1c9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Sun, 20 Jun
 2021 16:14:41 +0000
Received: from LO2P123MB2605.GBRP123.PROD.OUTLOOK.COM
 ([fe80::90a2:d4cb:8183:8368]) by LO2P123MB2605.GBRP123.PROD.OUTLOOK.COM
 ([fe80::90a2:d4cb:8183:8368%4]) with mapi id 15.20.4242.023; Sun, 20 Jun 2021
 16:14:41 +0000
From: Thomas Markey <admin@fosshost.org>
To: =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 =?iso-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>, Thomas Huth
 <thuth@redhat.com>
Subject: Re: QEMU hosting
Thread-Topic: QEMU hosting
Thread-Index: AQHW424jqgpOevQOwkK3Y6N1ZcH1wqoZYUODgEs+hwCAAAL0AIAAATyAgAFGzYCAuCv0kw==
Date: Sun, 20 Jun 2021 16:14:41 +0000
Message-ID: <LO2P123MB2605ABB192A2375FC06314F6C80B9@LO2P123MB2605.GBRP123.PROD.OUTLOOK.COM>
References: <CAJSP0QVZuh8H-U1vtFMhasqSsSy3OA4jmRvwZrQEAx3=1dcb+w@mail.gmail.com>
 <LO2P123MB2605DA330913C7D2DA311EF1C8D10@LO2P123MB2605.GBRP123.PROD.OUTLOOK.COM>
 <b803bbce-ef10-229b-eccb-b26f0e589a43@redhat.com>
 <b19717c3-bf78-9369-e84a-b8f965d7150f@redhat.com>
 <e8513f65-a94f-7944-587c-6a7462a3f7a5@redhat.com>,
 <19ca4ff0-55b7-0bfd-624a-85962fee3bcc@redhat.com>
In-Reply-To: <19ca4ff0-55b7-0bfd-624a-85962fee3bcc@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=fosshost.org;
x-originating-ip: [176.116.125.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0404265e-d5cd-4e46-afe7-08d9340682c0
x-ms-traffictypediagnostic: LO4P123MB4607:
x-microsoft-antispam-prvs: <LO4P123MB46073BB04D53A40022BCAAEEC80B9@LO4P123MB4607.GBRP123.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +khNnw+JyJvEgA374D10Q4NtcM34lr/lNOkbV/3jaJ3/sOisM0X630Xr+VmspYXK56Fuq5jDbYbpJgDQGQoZwXwuZXRv3Ng8x35IlynYH3Z/7E22BL4JuiLTD5vjBh8MovOp4I5h+TsUJKjEapu9LjqyZBFs1vbyiQ+F/3HwEIKJ6CzqiYe9iV1lpSrzRAWyw08fylIANhNhvjj5Q+FJlUP+AB1EJGkaTKJFm50TYEnwZpVMdN3s6pLCq97fUU7d1tAlsDLQk8swGeQ8EFL61fqV63BFslUlmEvEbHz54xSYJAKc2vueUTI8giU6d1dLnxQFfXzqinxW5ySh+iI8l7L9j+0VF9jejOp9b2ptphR+pyfbTmTBN8g4jfJdWJ97cSEwT2hHYJHksDnKZV/jTXqpVV2/EwcHUh7qYueR/kccimkdM7kQ2zuCuY83rI61qJUQNySV3jzMYE/wQpDlsNAvlgDcPZCj7O1Vb3w2R9ieZTCMgGguUWafRmpT5W8Bi3JIrsoM9lAneiCVRHYc8zjz3/LWtQV4I5lYTYhtZefQ1AOboKZKfLczkDstMrxqIdgTtWm0pbOyp9NLeH6OhKNAlaktYOcXQPKoiRheamkUsv7R4dfWIDOyrlyFY9p/A8cY1Gn/WbpBCkJIC7iZCOFVH3+dA1Ixzopt2DnR+gJugWMKitN+y4o6C2yZgkToASD7Te5Cyav4DY7dBBKDnsMpJE6eIjP9GoWVtABsVtA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO2P123MB2605.GBRP123.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(39830400003)(136003)(376002)(396003)(366004)(346002)(66616009)(66556008)(26005)(966005)(66476007)(53546011)(33656002)(4326008)(66446008)(64756008)(6506007)(66946007)(52536014)(9686003)(8676002)(5660300002)(8936002)(21615005)(2906002)(76116006)(55016002)(7116003)(186003)(71200400001)(38100700002)(122000001)(7696005)(110136005)(83380400001)(86362001)(66574015)(166002)(316002)(99936003)(478600001)(54906003)(19627405001)(3480700007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?q4jXyRB/GTaXFLyD1UZbBR5npoCFRTdvfQ18eQ+Qsf2QlyAz6nQMSPAPkk?=
 =?iso-8859-1?Q?B8+Cuk1QSe9uE9QeVFkYoAaFFCSOtzSj6lCq8refqjBY9QtLPsaV/swNWv?=
 =?iso-8859-1?Q?NeNtXHElegSv8zBnn9TwEAaWA6263iGS/FnVAltaCyDKEZtN2vobp2tXtR?=
 =?iso-8859-1?Q?WnTUqjS5fGOfb38nwiCUo70VFwEM7SCl2dqD2rEL8EdIcaVYBxBx9v+zeB?=
 =?iso-8859-1?Q?9Em3XmbSZBsBAczuepbV27Gc1UEe3jzaUltALxqj0ETi+wZNLyHIFmuW17?=
 =?iso-8859-1?Q?rb+9kvXeP9p/5qE8SliDUnjTsWMoQtfN25vYOaDDFzAdVxRhrCepzVcexb?=
 =?iso-8859-1?Q?SRgA7ABjW/v4HOHBetfbv6/AkcBUg3zyimX9bK62nAjmn9/3aYFTpIkQE+?=
 =?iso-8859-1?Q?Xd6GblzMLcZiLX6zz2gHN7U+Q3vkinLmECtSrBBWnbIQx/O3Zsb/XOnSSu?=
 =?iso-8859-1?Q?xvYS6LeXIHmtoNjdibbvDxcLczPDyi+vQQhX1nURBCwp12PgZO053Bsjx+?=
 =?iso-8859-1?Q?wsPFJGFR7PmlssEM7h1o6Ps/7N8ePd8YBhhJYATGANGtsEoo8Sa1a0deUW?=
 =?iso-8859-1?Q?LHx5Qw6jsse10UrnQ0tN0N7wIuk0UEsr15Ku4JFOZH/4BpC9PZr9wTUn/y?=
 =?iso-8859-1?Q?sRCRX1aLS87b2EdyCoQKd2s14391MoaDNyaRJ0suLS3At3ke3KeTukIUEG?=
 =?iso-8859-1?Q?3x/6RhdTHF9O9VJQi51qMHRHUJIDc+7jJvzZUmVfOAs2dkRYER2nsklbK4?=
 =?iso-8859-1?Q?HAsEkKu2khJTSVBndLlTWoMVkslw6o8AVjNo2OGaVTm80Nbw8wZG7bOpc4?=
 =?iso-8859-1?Q?QNgwY5Np/WNTuodaqEo89ybqU5hC80YZ4Ydx7GYfipMERtqzVlv0eg+el+?=
 =?iso-8859-1?Q?XoeNTu9RCPCkfjy95H/UCnsv7vAp0zr4WlfjpdzudL1XVSQMue7SSKd8RK?=
 =?iso-8859-1?Q?mr5Z5f4loRgjWFckjpl33arMuKTDRGNHvwjcbBIleLINgADb9AWWS5O3Mt?=
 =?iso-8859-1?Q?M0Uv26SdgzniiyHMYIWqRdYSTtrCQdBGyP908+0+a2mHyO7672EILMG+i9?=
 =?iso-8859-1?Q?+ziorocIW95aEYKkDV5WVUbiyQtixkFHwBS0zM0NXMeOh1Jqt4Wqa5bwj4?=
 =?iso-8859-1?Q?6lyj2FpYClS6k7aknr2IqSzZaFb5h+jallxIL70xAnGzLih9zRUDCzXIsj?=
 =?iso-8859-1?Q?OhBcCh/xcHO80v7hNoJnXH8Iz6hn+/uW6WNpYroO7kdYBTB9QdTfW3bOBh?=
 =?iso-8859-1?Q?BWCGngMMy07c75HG9HCLZh15SveW52PCcy3uQEBRcacpAlLryT4F7EKnY0?=
 =?iso-8859-1?Q?kF5CpyfkoBPTNIkuY4gKqbSxR6w498umm6YLQ/ISYfIjhV6l/zQPOqKiSS?=
 =?iso-8859-1?Q?joUCFTAWfO?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/related;
 boundary="_004_LO2P123MB2605ABB192A2375FC06314F6C80B9LO2P123MB2605GBRP_";
 type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: fosshost.org
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO2P123MB2605.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0404265e-d5cd-4e46-afe7-08d9340682c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2021 16:14:41.7150 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6f05e4df-9801-4bb7-80d6-e7c58e957903
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MMEn/rSG5uIoaieZyZi/fGzDOOScL8flsdvcTUK6suv0xjSByBTtM5mw4uAyVzy5UMhvUFmsdbQpp2sFhPlJAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P123MB4607
Received-SPF: pass client-ip=40.107.11.67; envelope-from=admin@fosshost.org;
 helo=GBR01-CWL-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_004_LO2P123MB2605ABB192A2375FC06314F6C80B9LO2P123MB2605GBRP_
Content-Type: multipart/alternative;
	boundary="_000_LO2P123MB2605ABB192A2375FC06314F6C80B9LO2P123MB2605GBRP_"

--_000_LO2P123MB2605ABB192A2375FC06314F6C80B9LO2P123MB2605GBRP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Dear all

Would it be possible, may I ask, for the QEMU website to be updated to show=
 that Fosshost is supporting the project?

The fosshost logo with a link back to https://fosshost.org will be more tha=
n sufficient, or just a link in footer / sponsor's page (if you have one).

In addition, we're currently experiencing significant growth and are lookin=
g at the more established/larger projects we work with, to understand wheth=
er there may be an opportunity for financial donation.  In short, we need t=
o take on full time members of staff in order to run our service.  Your tim=
e and attention in this would be greatly appreciated if you could afford it=
 to us.

I look forward to hearing from you.

Kind regards,

Thomas Markey
Chief Executive & Founder

To go further, together.

[cid:7890ea8e-31b1-4b77-bfd7-d3e2f8270a17]

Tel: +44 (0) 208 154 4278


Disclaimer: This email and the attachments within may be confidential and a=
re intended solely for the use of the intended recipient. If you are not th=
e intended recipient of this email and its attachments, you must take no ac=
tion based upon them, nor must you copy or show them to anyone. Please cont=
act the sender if you believe you have received this email in error. Any vi=
ews or opinions expressed are solely those of the author and do not necessa=
rily represent Fosshost C.I.C.  Fosshost C.I.C. is a Community Interest Com=
pany, registered in England and Wales.  Company Reg No: 13356530.  Register=
ed Office Address: 7 Bell Yard, London, England, WC2A 2JR, Great Britain.

________________________________
From: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
Sent: 23 February 2021 11:41
To: Alex Benn=E9e <alex.bennee@linaro.org>; Thomas Huth <thuth@redhat.com>;=
 Fosshost <admin@fosshost.org>
Cc: qemu-devel <qemu-devel@nongnu.org>; Stefan Hajnoczi <stefanha@gmail.com=
>; Cleber Rosa <crosa@redhat.com>
Subject: Re: QEMU hosting

Updating this thread for the list, I have been told that
Cleber is looking at all these options for mainstream CI,
and is already in contact with fosshost.org.

I'll let him follow these ideas.

Regards,

Phil.

On 2/22/21 5:11 PM, Philippe Mathieu-Daud=E9 wrote:
> On 2/22/21 5:07 PM, Philippe Mathieu-Daud=E9 wrote:
>> On 2/22/21 4:56 PM, Philippe Mathieu-Daud=E9 wrote:
>>> Hi Thomas and Stefan,
>>>
>>> On 1/5/21 7:55 PM, Fosshost wrote:
>>>> Hi Stefan
>>>>
>>>> Thank you for your email.
>>>>
>>>>  1. We do not offer MacOS hosting
>>>>  2. We can provide virtual machines with full KVM virt on x86
>>>>     architecture and soon arm64 v8
>
> And from https://fosshost.org/about:
> "We support most operating systems including CentOS, Debian, Ubuntu,
> ArchLinux and FreeBSD and custom OS."
>
> Eventually we could add a pair of FreeBSD runners to our Gitlab CI?
> https://docs.gitlab.com/runner/install/freebsd.html
>
>>>>  3. We do not provide dedicated servers.
>>>
>>> Would it be possible to have a dedicated VM for a git LFS server [*]?
>>
>> Just noticed the Mirrors-as-a-Service option "(available for package
>> mirrors, operating systems, repositories, documentation, static assets,
>> etc)":
>>
>> https://docs.fosshost.org/en/home/getting-started#production-services
>> https://docs.fosshost.org/en/home/mirrors-as-a-service
>>
>>> If so, what storage is usable? Are there network traffic limits?
>>>
>>> Thanks,
>>>
>>> Phil.
>>>
>>> [*] https://docs.gitlab.com/ee/topics/git/lfs/
>>>
>>>> ----------------------------------------------------------------------=
--
>>>> *From:* Stefan Hajnoczi <stefanha@gmail.com>
>>>> *Sent:* 05 January 2021 14:21
>>>> *To:* Fosshost <admin@fosshost.org>
>>>> *Cc:* qemu-devel <qemu-devel@nongnu.org>
>>>> *Subject:* QEMU hosting
>>>>
>>>> Hi Thomas,
>>>> In November you emailed qemu-devel asking if the QEMU project was
>>>> interested in exploring hosting with Fosshost.org. I think my reply
>>>> may have gotten lost so I wanted to check if you have time to discuss
>>>> this again.
>>>>
>>>> The main hosting need that QEMU has is for continuous integration
>>>> system runners. We are particularly interested in non-x86/non-Linux
>>>> build machines and a dedicated server for reproducible performance
>>>> tests. Just today there was discussion on #qemu IRC about how to go
>>>> about adding a macOS build machine, for example.
>>>>
>>>> It would be great to find out more about Fosshost.org and whether we
>>>> can work together.
>>>>
>>>> Thanks,
>>>> Stefan
>>>
>>
>


--_000_LO2P123MB2605ABB192A2375FC06314F6C80B9LO2P123MB2605GBRP_
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
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Dear all</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Would it be possible, may I ask, for the QEMU website to be updated to show=
 that Fosshost is supporting the project?</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
The fosshost logo with a link back to <a href=3D"https://fosshost.org" id=
=3D"LPlnk">https://fosshost.org</a> will be more than sufficient, or just a=
 link in footer / sponsor's page (if you have one).<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
In addition, we're currently experiencing significant growth and are lookin=
g at the more established/larger projects we work with, to understand wheth=
er there may be an opportunity for financial donation.&nbsp; In short, we n=
eed to take on full time members of staff
 in order to run our service.&nbsp; Your time and attention in this would b=
e greatly appreciated if you could afford it to us.</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I look forward to hearing from you.</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div>
<div id=3D"Signature">
<div>
<div></div>
<div></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Kind regards,<br>
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<b>Thomas Markey</b></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Chief Executive &amp; Founder</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<b>To go further, together.</b></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<b><br>
</b></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<b><img class=3D"EmojiInsert" style=3D"max-width:100%; width:176px; height:=
43px" width=3D"176" height=3D"43" data-outlook-trace=3D"F:1|T:1" src=3D"cid=
:7890ea8e-31b1-4b77-bfd7-d3e2f8270a17"><br>
</b></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Tel: +44 (0) 208 154 4278<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<p><span style=3D"font-size:10pt">Disclaimer: This email and the attachment=
s within may be confidential and are intended solely for the use of the int=
ended recipient. If you are not the intended recipient of this email and it=
s attachments, you must take no action
 based upon them, nor must you copy or show them to anyone. Please contact =
the sender if you believe you have received this email in error. Any views =
or opinions expressed are solely those of the author and do not necessarily=
 represent Fosshost C.I.C.&nbsp; Fosshost
 C.I.C. is a Community Interest Company, registered in England and Wales.&n=
bsp; Company Reg No: 13356530.&nbsp; Registered Office Address:&nbsp;7 Bell=
 Yard, London, England, WC2A 2JR, Great Britain.&nbsp;</span><br>
</p>
<br>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Philippe Mathieu-Daud=
=E9 &lt;philmd@redhat.com&gt;<br>
<b>Sent:</b> 23 February 2021 11:41<br>
<b>To:</b> Alex Benn=E9e &lt;alex.bennee@linaro.org&gt;; Thomas Huth &lt;th=
uth@redhat.com&gt;; Fosshost &lt;admin@fosshost.org&gt;<br>
<b>Cc:</b> qemu-devel &lt;qemu-devel@nongnu.org&gt;; Stefan Hajnoczi &lt;st=
efanha@gmail.com&gt;; Cleber Rosa &lt;crosa@redhat.com&gt;<br>
<b>Subject:</b> Re: QEMU hosting</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Updating this thread for the list, I have been tol=
d that<br>
Cleber is looking at all these options for mainstream CI,<br>
and is already in contact with fosshost.org.<br>
<br>
I'll let him follow these ideas.<br>
<br>
Regards,<br>
<br>
Phil.<br>
<br>
On 2/22/21 5:11 PM, Philippe Mathieu-Daud=E9 wrote:<br>
&gt; On 2/22/21 5:07 PM, Philippe Mathieu-Daud=E9 wrote:<br>
&gt;&gt; On 2/22/21 4:56 PM, Philippe Mathieu-Daud=E9 wrote:<br>
&gt;&gt;&gt; Hi Thomas and Stefan,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 1/5/21 7:55 PM, Fosshost wrote:<br>
&gt;&gt;&gt;&gt; Hi Stefan<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Thank you for your email.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&nbsp; 1. We do not offer MacOS hosting<br>
&gt;&gt;&gt;&gt;&nbsp; 2. We can provide virtual machines with full KVM vir=
t on x86<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; architecture and soon arm64 v8<br>
&gt; <br>
&gt; And from <a href=3D"https://fosshost.org/about:">https://fosshost.org/=
about:</a><br>
&gt; &quot;We support most operating systems including CentOS, Debian, Ubun=
tu,<br>
&gt; ArchLinux and FreeBSD and custom OS.&quot;<br>
&gt; <br>
&gt; Eventually we could add a pair of FreeBSD runners to our Gitlab CI?<br=
>
&gt; <a href=3D"https://docs.gitlab.com/runner/install/freebsd.html">https:=
//docs.gitlab.com/runner/install/freebsd.html</a><br>
&gt;<br>
&gt;&gt;&gt;&gt;&nbsp; 3. We do not provide dedicated servers.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Would it be possible to have a dedicated VM for a git LFS serv=
er [*]?<br>
&gt;&gt;<br>
&gt;&gt; Just noticed the Mirrors-as-a-Service option &quot;(available for =
package<br>
&gt;&gt; mirrors, operating systems, repositories, documentation, static as=
sets,<br>
&gt;&gt; etc)&quot;:<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://docs.fosshost.org/en/home/getting-started#produ=
ction-services">
https://docs.fosshost.org/en/home/getting-started#production-services</a><b=
r>
&gt;&gt; <a href=3D"https://docs.fosshost.org/en/home/mirrors-as-a-service"=
>https://docs.fosshost.org/en/home/mirrors-as-a-service</a><br>
&gt;&gt;<br>
&gt;&gt;&gt; If so, what storage is usable? Are there network traffic limit=
s?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Thanks,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Phil.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; [*] <a href=3D"https://docs.gitlab.com/ee/topics/git/lfs/">htt=
ps://docs.gitlab.com/ee/topics/git/lfs/</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; ----------------------------------------------------------=
--------------<br>
&gt;&gt;&gt;&gt; *From:* Stefan Hajnoczi &lt;stefanha@gmail.com&gt;<br>
&gt;&gt;&gt;&gt; *Sent:* 05 January 2021 14:21<br>
&gt;&gt;&gt;&gt; *To:* Fosshost &lt;admin@fosshost.org&gt;<br>
&gt;&gt;&gt;&gt; *Cc:* qemu-devel &lt;qemu-devel@nongnu.org&gt;<br>
&gt;&gt;&gt;&gt; *Subject:* QEMU hosting<br>
&gt;&gt;&gt;&gt; &nbsp;<br>
&gt;&gt;&gt;&gt; Hi Thomas,<br>
&gt;&gt;&gt;&gt; In November you emailed qemu-devel asking if the QEMU proj=
ect was<br>
&gt;&gt;&gt;&gt; interested in exploring hosting with Fosshost.org. I think=
 my reply<br>
&gt;&gt;&gt;&gt; may have gotten lost so I wanted to check if you have time=
 to discuss<br>
&gt;&gt;&gt;&gt; this again.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; The main hosting need that QEMU has is for continuous inte=
gration<br>
&gt;&gt;&gt;&gt; system runners. We are particularly interested in non-x86/=
non-Linux<br>
&gt;&gt;&gt;&gt; build machines and a dedicated server for reproducible per=
formance<br>
&gt;&gt;&gt;&gt; tests. Just today there was discussion on #qemu IRC about =
how to go<br>
&gt;&gt;&gt;&gt; about adding a macOS build machine, for example.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; It would be great to find out more about Fosshost.org and =
whether we<br>
&gt;&gt;&gt;&gt; can work together.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Thanks,<br>
&gt;&gt;&gt;&gt; Stefan<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt; <br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_LO2P123MB2605ABB192A2375FC06314F6C80B9LO2P123MB2605GBRP_--

--_004_LO2P123MB2605ABB192A2375FC06314F6C80B9LO2P123MB2605GBRP_
Content-Type: image/png; name="Outlook-pktnknbp.png"
Content-Description: Outlook-pktnknbp.png
Content-Disposition: inline; filename="Outlook-pktnknbp.png"; size=24946;
	creation-date="Sun, 20 Jun 2021 16:14:41 GMT";
	modification-date="Sun, 20 Jun 2021 16:14:41 GMT"
Content-ID: <7890ea8e-31b1-4b77-bfd7-d3e2f8270a17>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAcwAAABuCAYAAACqeCPXAAAAAXNSR0IArs4c6QAAAAlwSFlzAAAO
xAAADsQBlSsOGwAAActpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADx4OnhtcG1ldGEgeG1sbnM6
eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IlhNUCBDb3JlIDUuNC4wIj4KICAgPHJkZjpSREYg
eG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4K
ICAgICAgPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIKICAgICAgICAgICAgeG1sbnM6eG1w
PSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIgogICAgICAgICAgICB4bWxuczp0aWZmPSJo
dHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyI+CiAgICAgICAgIDx4bXA6Q3JlYXRvclRvb2w+
d3d3Lmlua3NjYXBlLm9yZzwveG1wOkNyZWF0b3JUb29sPgogICAgICAgICA8dGlmZjpPcmllbnRh
dGlvbj4xPC90aWZmOk9yaWVudGF0aW9uPgogICAgICA8L3JkZjpEZXNjcmlwdGlvbj4KICAgPC9y
ZGY6UkRGPgo8L3g6eG1wbWV0YT4KGMtVWAAAQABJREFUeAHtnQecFUXyx9ldYMk5CIIsUXIQBVFU
UMw5YA73N5yBM53nmbOnnjmdOZ166okgnqgYUEERUaIEyTln2CWH/X9/w8xj4stv9yFTn0+9nulQ
XV1dXdXd0/OmTJkQQgmEEgglEEoglEAogVACoQRCCYQSCCUQSiCUQCiBUAKhBEIJhBIIJRBKIJRA
KIFQAqEEQgmEEgglEEoglEAogVACoQRCCYQSCCUQSiCUQCiBUAKhBEIJhBIIJRBKIJRAKIFQAqEE
QgmEEgglEEoglEAogVACoQRCCYQSCCUQSiCUQCiBUAKhBEIJhBIIJRBKIJRAKIFQAqEEQgmEEggl
EEoglEAogVACoQRCCYQSCCUQSiDbJZCT7QzuKfy1a9euyrZt26pXqFChPDyX37lzZ35OTk4x19uK
i4u35eXlbd6wYUPhzJkz1+8pbfLjs2vXrpWKiopq5ObmVqZ95cGyXO8k3Lply5atXG8uLCxcu3Dh
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

--_004_LO2P123MB2605ABB192A2375FC06314F6C80B9LO2P123MB2605GBRP_--

