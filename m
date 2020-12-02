Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FAF2CB27B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 02:49:26 +0100 (CET)
Received: from localhost ([::1]:57366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkHGm-0002XE-VL
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 20:49:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1kkHEb-0001nD-T8
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 20:47:09 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:8537)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1kkHEZ-0005or-Hh
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 20:47:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1606873627; x=1638409627;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pRcBMSAYS2gdBmV7jP40pB5kGRnvqLpi307hcWB2Rew=;
 b=EMFZa5PwM6z+kbhoM4qX9OrkOLO+hr2k11AStelYBRBLGayuuus7+mAR
 2iuglx3x+jlwlZeGJDP3kokyl06PIeKVk8kbtx4bu23/jsnZzr35gVW9g
 CXPt70JmiRt/OyqRdmuPkEd82Yha4ufiaUlj82QX3lu2FTsmS1p02NGk5 w=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 01 Dec 2020 17:47:02 -0800
X-QCInternal: smtphost
Received: from nasanexm03c.na.qualcomm.com ([10.85.0.106])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 01 Dec 2020 17:47:02 -0800
Received: from nasanexm03g.na.qualcomm.com (10.85.0.49) by
 nasanexm03c.na.qualcomm.com (10.85.0.106) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Dec 2020 17:47:01 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03g.na.qualcomm.com (10.85.0.49) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Tue, 1 Dec 2020 17:47:01 -0800
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB5159.namprd02.prod.outlook.com (2603:10b6:a03:6e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Wed, 2 Dec
 2020 01:46:55 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::eca5:4fbf:3096:fea6]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::eca5:4fbf:3096:fea6%6]) with mapi id 15.20.3611.031; Wed, 2 Dec 2020
 01:46:55 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Alessandro Di Federico <ale.qemu@rev.ng>
Subject: RE: [RFC PATCH v5 22/33] Hexagon (target/hexagon) generater phase 4 -
 decode tree
Thread-Topic: [RFC PATCH v5 22/33] Hexagon (target/hexagon) generater phase 4
 - decode tree
Thread-Index: AQHWrlEE4fr7FA/ccU+oZZ7iP7Mh+6nQMQGAgBMMB9A=
Date: Wed, 2 Dec 2020 01:46:55 +0000
Message-ID: <BYAPR02MB4886977395FBA4233D5C340CDEF30@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1604016519-28065-1-git-send-email-tsimpson@quicinc.com>
 <1604016519-28065-23-git-send-email-tsimpson@quicinc.com>
 <20201119235339.039ba041@orange>
In-Reply-To: <20201119235339.039ba041@orange>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rev.ng; dkim=none (message not signed)
 header.d=none;rev.ng; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45a4e55c-6ffb-4f81-b668-08d896642643
x-ms-traffictypediagnostic: BYAPR02MB5159:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB51594BEDEDA246D4FD2485C8DEF30@BYAPR02MB5159.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qDIvcigojpHIs0wrYF2MLFkVcdWiLoLgUiP3wBVdFgPAiPGgqCoFcFHvZmKq5AEdT/nr0asgb+Jj/V9BHUXukCyOkEYJG4Wg2WDh7vGFOzCEtWHe+xUvq/zFeVeyyAcl1npo5JjpjJSa+bxRlNJ0Q8+MPw5BSF+0sXBVtBKvQAcMIvz/h9UOC1Ekw+tvg/tXun3t0yFgNf/6e1CdXCE7R+N8wnsc1/8KATNxmbILzQhqEaeeVGEB6lUiJ7YMz7SghsW2pd30AWmyQcZjG9jnoKXG/778p13pFS3oWVKK9KUoDdeTYc2angqtpXXJ7qWK
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(136003)(346002)(396003)(366004)(376002)(83380400001)(6506007)(7696005)(9686003)(4744005)(54906003)(76116006)(33656002)(186003)(55016002)(66556008)(66446008)(64756008)(53546011)(66946007)(66476007)(71200400001)(26005)(478600001)(86362001)(316002)(4326008)(5660300002)(2906002)(8676002)(52536014)(6916009)(107886003)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?JMe54vtl8Hc7JLs9vSCWy9CLRAUwc63s70igVgSbRs5JWVki14xwXPXs6n5A?=
 =?us-ascii?Q?8n9AwpnqLur3hPp2MLTY5Ak3bvldJBA5gAt7UKDNteE3n5HAix5ZL4Vv7Bn4?=
 =?us-ascii?Q?JyHLRThK0uqnR/7JDwusbsXucXI+63KlryfsNSNP+73utUBqFgynXYWiDODU?=
 =?us-ascii?Q?YA9sbJfHX+3I20/lmiWNI/sDuVinQexZKYud1Fi9mpgxXAy9YyxlCBZ2LIUk?=
 =?us-ascii?Q?150RHFS/UDJlT/VyvpJQQg+a7RBMYL2cfKndkQodJdS0ljFySyFpMgWr/ltT?=
 =?us-ascii?Q?i31574Dv3ssCQiA3g43tWRXQ2S5xsqUU3ZO+R4W1GVsOvKPEuEIBRHcG9Sg6?=
 =?us-ascii?Q?i983w9CvBcGs2U0RxxKmTjHjOuN25k4gIb2iv7ad+YicXM7ekWGW+p+wwgaY?=
 =?us-ascii?Q?Tyr0HUoPmxAD1x54na3VTXQna5g4+im4tU/rylihOM221P/ZhTz+zSYuv5Z1?=
 =?us-ascii?Q?cMXOyaSj7CTAAg2/AZXfvxK/N0wq6r5jwW3HY4OGwGaJEjJ2ZJ7AoAeEJxv4?=
 =?us-ascii?Q?6Ew4TSCwX7jGnp2pWAdQhWey8pNNgXKX3lfy1ZwDBXcaUeuda5UMtbf98t5n?=
 =?us-ascii?Q?7IgXAPX+WA1IhgUR7VbrKsZrEWvOxbHI887l3Skmhq/Xbd04o7FlsZJtgEI3?=
 =?us-ascii?Q?ppkp081eDIeAuw8X/2EdcL986MGoFcyyDx93H6dZb2loONwJi2x0RD5czqEB?=
 =?us-ascii?Q?6RVR+G+e4CJvpps3IzeoL9KSHA8qDlQYwThYc9Rd7kdyZMOMuc0kHhmVzjzr?=
 =?us-ascii?Q?hN3I9OkVM7sAoPJHxbMW/dDen1sBYbD+C0i7evf6TzY99n94ynQ0LyMF76sr?=
 =?us-ascii?Q?/Fn3r7YI4/dG9r0IzQn7ykbY+2XtWeUgvK1GYS2VV2NLj9MON4xazrDjkP/S?=
 =?us-ascii?Q?xRjpz85bGwzqtw9Ag3tk4No5qZz5XD4ic/X34bxxMWIcefaLZpSPHVBcu/Ng?=
 =?us-ascii?Q?H2K14yk0yUr48PAbDic72FhaTG2CEYJhD522ctE2sdo=3D?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nIpCeFf/9LK/T2ttMjdNDyD9q58du97EXd/Ucaw5uBDEjrefG7mPqiTF52uv7W3ibjvHY4W7T3t65iSQN+Poo2OgTP3SFcbWGpf9oKCsVV48+HDBRXkwwC+lQT0sKmHS+VBAQBA38a+m3rQbmLa+ot5KX7Yi58QSWCctnPe9Lx+YntHHlvfKRdmGuDkxMrIl3kmLQVMySjrmMNdy8r/TcDyFPrTrGQuovuDhzHvuFJEE05KglyQZVk3gNblEBEUwZP70IIPcsC1VlE507NsWo/tCEKQT//OJY4B/i73DyB8PkCEqItPSxFs8KWPy6COx3oKwBk8J26X+4crNqcdJEA==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=043VLqfnXIhfod9Ivci0UuBSvhg1gBBa9v/D3dJZlrE=;
 b=lQZLISZp7m4UqEQDwSOsB/4rUe0NC8hbKEZDJ0jN8VgEjJj+dcPww22I3Y8X+tG0Hikedxn2bVWmP1Plp3HQjaUAufuWRbJt9L1NsAHtM232sjOrDdad5og9Ag6LBlVUwUGRazZQJdcw7X6flHDKsVJJ25EOIq1vbt9705Vb/mc2AoCIV6snW8ntAw4ysn3HP4lkWv7Wa2gyGA5nLi22QWw8IyZiIApoULFk4lD9edqgwROJmHaHhHmjGq2GK2gKayF5bwguOGRsWcwdF4bFNHSOvmq1hXIztRIF4DjZUpmFPS+CMoxELNbHrJaU5jP4H8GEvMR4jT2EwbS9atQtNA==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
dkim-signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.onmicrosoft.com; s=selector1-qualcomm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=043VLqfnXIhfod9Ivci0UuBSvhg1gBBa9v/D3dJZlrE=;
 b=HRFHoDapJMBoQLwv7iIbM+aUL+2hZKIy4rOYVDO2AHHvVRUGIsrjbosY9X1oTu/SrsF4FLlJJ5zgWwpHdC9/NCu/gXW0ypjxlPia7I+pBEctCgHQRFdmJg/rFKFkloEnDCBrp5k7TeBps/s/wJdegCL3lUrqPfRg2+GUhdc0AOg=
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 45a4e55c-6ffb-4f81-b668-08d896642643
x-ms-exchange-crosstenant-originalarrivaltime: 02 Dec 2020 01:46:55.4503 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: jjPjO4xGl8jdJxVR38HVhIh2RrlrK2qrpzvpxbKpY6KhezSf8YItl+sBVc5+oI9avmJZubj73gjpKZ1BtWu32w==
x-ms-exchange-transport-crosstenantheadersstamped: BYAPR02MB5159
x-originatororg: quicinc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=199.106.114.39; envelope-from=tsimpson@quicinc.com;
 helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Brian Cain <bcain@quicinc.com>, "at.org@qualcomm.com" <at.org@qualcomm.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "laurent@vivier.eu" <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> -----Original Message-----
> From: Alessandro Di Federico <ale.qemu@rev.ng>
> Sent: Thursday, November 19, 2020 4:54 PM
> To: Taylor Simpson <tsimpson@quicinc.com>
> Cc: qemu-devel@nongnu.org; richard.henderson@linaro.org;
> at.org@qualcomm.com; laurent@vivier.eu; Brian Cain <bcain@quicinc.com>
> Subject: Re: [RFC PATCH v5 22/33] Hexagon (target/hexagon) generater
> phase 4 - decode tree
>
> Is there any specific reason why (here and elsewhere) you use
> `StringIO` instead of writing to the file directly?
>
> I'd expect something like:
>
> ```
> if __name__ =3D=3D '__main__':
>     with open(sys.argv[1], 'w') as f:
>         print_tree(f, dectree_normal)
>         print_tree(f, dectree_16bit)
>         if subinsn_groupings:
>             print_tree(f, dectree_subinsn_groupings)
>         for (name, dectree_subinsn) in sorted(dectree_subinsns.items()):
>             print_tree(f, dectree_subinsn)
>         for (name, dectree_ext) in sorted(dectree_extensions.items()):
>             print_tree(f, dectree_ext)
>         print_match_info(f)
>         print_op_info(f)
> ```

OK



