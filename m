Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E70E258011F
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 17:05:49 +0200 (CEST)
Received: from localhost ([::1]:59102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFzeW-00068K-IL
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 11:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1oFzZk-0001Xu-2S; Mon, 25 Jul 2022 11:00:52 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:1078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1oFzZd-0000oP-Hv; Mon, 25 Jul 2022 11:00:51 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26PErjUp008528;
 Mon, 25 Jul 2022 15:00:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=il13Gr2KWiBgO5Sz5phkPhCmvWTAlJUOnYfu2ei8n6g=;
 b=IefNrcbHkKW1OMvlFVW8EIhWVw96H0Y66lMt0pOgFHDczI2pnk8t4rd24pqGEyDtKeq2
 p90/pGar3DEI1ptOFeyPlW3L0nBEFBrLFHflT65+Yoqm1KIxthSOggp3RJFGayrJzHr3
 Y6uj2gfdx15jjFiQZ210mX6WouzpU/WQy+mYR3SnonYfPJnmlGHe7De94yD9sTHTCgpS
 9XxfoQUxSJNAo/PDtuv02HbU4T94QzksKkX4JshlmLI8iqTHCmbIW4naa1X/SYY4DCds
 6eIAlrVLOtFPZRjPhqg252brC++STJVBwRir3CBff5i3yVhB5/KG/PTfNb2NJGxEdS5k JQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hg94gbkga-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Jul 2022 15:00:34 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26PCH356020629; Mon, 25 Jul 2022 15:00:33 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3hh636k647-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Jul 2022 15:00:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HjYxNaoJxDrdj8eHZ3TMbQoW6fAiqq/FPpby4ZQvjXttoNc/PsO8KM4upyzE3GmD/NODV35d8ow7l70fVHOYRX5yLIEbhbXDSLnxnDWNz76Xw3UT6OBRYnvl4oekD6NTFTMBslicn7WT6Fyqq/bDs6E+oPrJ/D1cvEsWaebvxWweaYeooVfSZwmDzNVFoZXU3Ej0UXcs/c8bljHVCI9dmN2y1N3mRZKIc3ktvBlWr1Ba914mCKqdB32GdRWqL886pmiCJKFXaZ41OveH4Qh1Z1RXPcyC1Sb5p4FiTgIhVNMZRR9WgyfMSD0nf75odD1uu7OE5wjL3RZl2t0vGIB+9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=il13Gr2KWiBgO5Sz5phkPhCmvWTAlJUOnYfu2ei8n6g=;
 b=DFZ1mcAE3i7lrbJG23grakFVuMFPl2+gWkF2n6Ytc3r0ykUVAidg08ulWN6U7JNf9ajBxcxQfk6p8aC3/t/9Lp4j+yHdx1dtjLme+0K4ZC5ZVT6MUb6A1x16nYA6gO64YoTLciqWv8G5DH+94Ri9ypWoOyCJygNLtyzwA+tvNoSi0J3MH6vmTlmIzrOaiwzrM79COoCM6Jm9G+Bevg4djRwcgtbCeYklmD5Sd3fO1dqFMv/sfEHS/c21Kb4SNfVhnwjM2y5f2+BA3UxSk13P3uwE0HnmP1ywWoa+rflhnMToAI8S/2otr+pQ6swrBMnQ0Qufl+THR+WOodAfi2muYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=il13Gr2KWiBgO5Sz5phkPhCmvWTAlJUOnYfu2ei8n6g=;
 b=koEtYvQlCVtiHWzzhgTntwSoFsXiHtfwhXuqr1MuI4obo93J3c+BCj+w6+BmTD10gTPw+L39jsf+nXC1xDLsyk8m2Li0mW23z5192S9ELPMaxAHARiKuTAtk3jFarUw19FEOpfPfLER0r85xvKyLb5ZT20vKgEXe+dEinFLXOa8=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by CO1PR10MB4625.namprd10.prod.outlook.com (2603:10b6:303:6d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Mon, 25 Jul
 2022 15:00:30 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b5fb:1a47:c4b:a83f]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b5fb:1a47:c4b:a83f%6]) with mapi id 15.20.5458.024; Mon, 25 Jul 2022
 15:00:30 +0000
From: Jag Raman <jag.raman@oracle.com>
To: =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>
CC: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Thomas Huth <thuth@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>, Elena
 Ufimtseva <elena.ufimtseva@oracle.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 "virtio-fs@redhat.com" <virtio-fs@redhat.com>, Hanna Reitz
 <hreitz@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, Eric Blake
 <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Beraldo Leal
 <bleal@redhat.com>, Peter Xu <peterx@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Qiuhao Li <Qiuhao.Li@outlook.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>, Bandan Das
 <bsd@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Stefano Garzarella
 <sgarzare@redhat.com>, Alexander Bulekov <alxndr@bu.edu>, Julia Suvorova
 <jusual@redhat.com>, Darren Kenny <darren.kenny@oracle.com>, Wainer dos
 Santos Moschetta <wainersm@redhat.com>, John Johnson
 <john.g.johnson@oracle.com>
Subject: Re: [PULL 06/18] vfio-user: build library
Thread-Topic: [PULL 06/18] vfio-user: build library
Thread-Index: AQHYgNAzPAHg/fw6+UmvwSew+l/3da2I1rKAgAaR8gCAAAGaAIAAArEA
Date: Mon, 25 Jul 2022 15:00:30 +0000
Message-ID: <3D94C789-5F97-4104-8730-02BBA6DF94C0@oracle.com>
References: <20220615155129.1025811-1-stefanha@redhat.com>
 <20220615155129.1025811-7-stefanha@redhat.com> <Ytkpiao5Zk8Pj5Lq@redhat.com>
 <97E1536C-58CF-4DDD-94C9-D44EF63C5AA5@oracle.com>
 <Yt6tzDw0R/UZL3NF@redhat.com>
In-Reply-To: <Yt6tzDw0R/UZL3NF@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a8a4dfab-e7ad-472c-2ed7-08da6e4e6ae9
x-ms-traffictypediagnostic: CO1PR10MB4625:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wOJczsvB+SOyO6xyrz1bxl0md7hW4qHoQX7Wx0h2GywmzWw+AO51mWEoh0CXfLydaYvASwNGZ+5DtGsr0K8oUBPo4j2b4qUcJhZPVGJd2mX4/axrnUs62gc9Q9Sa3PzOgVA1M4JYIPFawZgOY3wKHsXm7agG8s/PNa8/Mo8SqU/Cb92mJWg99zOf5Dc7euYTAtVDxG7RFa6EmJZA7xZuDuu9H5j3+frAefGmdrv9N64EE994SVZxlcx+tOH2GboyNaFxHn1I8OEDQN1s4Uie3yJDp1rGjXqsGHz3a+vQw/3XFPZNRRg4P+mft8niLkrB+KFtIexx/DOWQh6V/MhyG7in7ZIxNRlD28ayYehEYwRE5QDI+0+ImIYfa3tbvwsosqyZSOhXBYhM5iiYuurkdbB5umaygmqfKbfTw7jLFH16fb+KMDivsKT66BBycQC07pgLD96baYmV0sg435BxnpO9Nyh4MZWfsrImbiLSAXH08M5NNuWGKgL2Zrbi4waGeMoRggmtnjCCCF/9AwlRHBO/R+AbP/2x4tGOhlDUAsqm+T2tjrsOtGB2ryzR1AodWqjwY7iriIY4nT8RTNsO6HtYhjwnBAbZZX7KTQuOoTfKe8B115D1VcFqdAMlVdlwQPcoZssgnkFLxgpIdNh6bED8Q+Vxq6Zb3PdVQpJkt7ET+FxQYHN0T8wwJ6zI3dup5vl38A9Gnbmm23UMQrfqZdyXkRwt7AR2/U34ox9pOFQLMbTT6QNYzqq2gx6RoPKEqm2z4EKHv7t2ZsiqfyM78kLZkUMKPc6KFdOyuWTRrII3jTyswPHJgefLe48dVPLMLGhI861GVvFVakuLiDO+HcJUtpMdQTDHDnjmlaAf6OTsuQ3xVUpRoZfhhL2XGU2XBBMSziCO52jm0kxQdB4qJQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(366004)(396003)(39860400002)(346002)(376002)(122000001)(38100700002)(6916009)(54906003)(38070700005)(316002)(83380400001)(41300700001)(107886003)(186003)(2616005)(7416002)(5660300002)(44832011)(6486002)(33656002)(966005)(478600001)(36756003)(8936002)(2906002)(53546011)(76116006)(4326008)(6512007)(6506007)(66446008)(66476007)(66556008)(66946007)(86362001)(91956017)(64756008)(71200400001)(8676002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a2dSZ2lPU2FWN1AzUEUyc2U3c0xSL1BDdGozdHVqSDhWSmRTLzc1U2RnTm15?=
 =?utf-8?B?a01LcWpJWE1hMXVXM0lQeUFnV0VXKzNtVGZCQ0JuazdjK1lQd0FwWUlMbkFO?=
 =?utf-8?B?dVN1WEt6NUIvUTlwTk9Vc1JnaDhOTWlXTVcySzIvVXVtVGU2Nloya1RManJu?=
 =?utf-8?B?UlFtak9UOUhkSHdDRjJmajVxS3RqUlg3STVSRi9US3hvQnduQnVKeWowaCs0?=
 =?utf-8?B?Uk1TM1RQSEk4OWNReEpCeDVlT2ZjancySTBGK0hvY0ZZaFNxbVBpelg3RXhR?=
 =?utf-8?B?b2l5eHBUSTdaaTRJMEthMXJVNTZteDlNVDUzUEZudllkay8vREZqSklRb0R0?=
 =?utf-8?B?S01OTDFCemZxc3ZKcmoyT2MyMXFqWEVhK3haa1Z1SE1LbWwyZHJ1Qmx3dnY1?=
 =?utf-8?B?TTMzZENoMUVJTjY5WjFQRTFqMkNoNVJ4K1hiQUZUWnZOY0pDZVh0Wk5KSUhC?=
 =?utf-8?B?NHRoNGE4QnhDRllkemFJL2MrRDRpL3AxdWFiY0N0bTFzamlSYzJXcGxJeit1?=
 =?utf-8?B?TE1XZUswd0didVc4R0dxdUl4enBuNzhNN0hoZDlmbUhsQjFyMndGMDZQcmhB?=
 =?utf-8?B?eWhSWHNvMm9MZmNJeDl5WGlZT3VsMnhhWGthS1FKWFhVSWxGTjdpckNhOWhP?=
 =?utf-8?B?MDV4K0dnNFN0YVBkNjZOY3VGNjdiVVJOby9vR0cyMmIwLzlDRW5SV2NZUjNF?=
 =?utf-8?B?c3h1aTQ0by9yRTlVcVJHb2tuUEFwdWJRbS9Fb3Z1VmdaS1UzSk44OWZLNk1J?=
 =?utf-8?B?VUwxWnY1SmEzZXkyZ2xrQzJwRHd0eUZERTk4RE05WkhHWWhXL1l4bDE3QlV0?=
 =?utf-8?B?a0NTRFVsSXNVaEw1VTZ2eit5b2JzKzZSamNMWnc1WThhMW9yS1FSRnNqMEJB?=
 =?utf-8?B?ejN5c2JSNGRjYWEzRVJaRWJ0bHhJM21raHdZeGFCdjJ3K0JTajhRbUh3Q3hw?=
 =?utf-8?B?UUtVZ2UyQXl3WjVzdnc5ZzJoOFhRMVR3RmZRSUhNQkREV2RrVk0rWWQzUmM4?=
 =?utf-8?B?cm9TTTY2Z0t5ZTVjNVkxNWVVbUplekttVkpYdEhkQzcwMXhJZFZyTkI1akpS?=
 =?utf-8?B?a3JMZDZEaXVXdXJsOGZkbkpEdmpJM2xqeUc1a1RsM1VORGRTL2tmZ3prYi9M?=
 =?utf-8?B?WVkwUWNYTFVqYlRWY2FJRUhySG5lNy9tQTVlQ1owOUdYTVQrYzJZRmxRL3px?=
 =?utf-8?B?VDFKdGVaeWtaWWt2aitoMDZRWmM4OGV5ZEJCMzY2VGdsSS80UWhWM3JlcWdK?=
 =?utf-8?B?OEVINVJnS3pteFoyeUxWTG5lQ25UbzBabzd3bDJkZEp6cVIrN0oyaXRHU3Ar?=
 =?utf-8?B?VTA1T29yNHJWeVc5eWRiSkI2UlhYTHJJeWYrM252MnIzYW5jVUh3OGd0ZXhX?=
 =?utf-8?B?VE52UGdoN3p3OVlvbk5GWE83SlM4azE1YkVXanpVWUNXVU9NZ2t6cGJwcU5j?=
 =?utf-8?B?a0tJYVh3WlVCRUd5VWh5N05iMW1IQm90eWZNUDY4UGtBd0pCQ0hyU0VSOTY0?=
 =?utf-8?B?QnhXWjJJUXUrUmhaMDA2OEJZbVY0TWcxWEtSdkFSZEFvYnBZMFdxMG8zSHk5?=
 =?utf-8?B?QzRNZ2pIVnZ1emxualZFVHAvYjdiL1FwNDZzYkpoUW9SZlIyZ1Y1ZzRIWWdO?=
 =?utf-8?B?SGk3U0ZNSUxhRExqdUVyeVNoZ1B6RkROdzFJUk92eTFaeWlSU09hVnhXOEho?=
 =?utf-8?B?UDJLWEhlQVpFQXg2a21LNzh6eTJwaFFuQktQcU8zRTcyaHNKU0ltQWduWkkr?=
 =?utf-8?B?MGZUN3FTMUU3bkZYKzBrVXpDdDVDNVhUdkVXWjlmaU5NdUI1WjNiWUtsZGZ5?=
 =?utf-8?B?UW03THZHenZVYlVsUGFhRjVBYzNIL0VCOHdJbWh4Um5Pc256UURlNVYwVHJV?=
 =?utf-8?B?bzNXSFZpaXJEU0plOUxyK3RGYU5VS0JBSmdNUVJqaG5jQlJ5U29rTkJ0MkRz?=
 =?utf-8?B?MG00clg2Z0duZ1QxU0RrNGNlRHNnS1N6YTM5VGV0QnhSTlVFYTJuSHZCV2FE?=
 =?utf-8?B?NWtDNnhsSm9nZ09xa1dZTEIrWmw5K1pSMEFVdkFIdldNSWtFVjdhWi9wdGtq?=
 =?utf-8?B?eUpCWVVNRlNqMDZuUnRzM3oxUEh4VlVrSExJd0N3VEg0RHJrNFVZcDJNZ3dK?=
 =?utf-8?B?cDVVN256WTRsTjNoU0FZMEh3UU1uWjlXQlR5bGJLNE5PZzU5RGxPcUsyZ055?=
 =?utf-8?Q?TNwi5RTvXf1CBB/GYYiBt+s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <71796D7130DC7246AA0925F4DBF30CE6@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8a4dfab-e7ad-472c-2ed7-08da6e4e6ae9
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2022 15:00:30.6205 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5qJh0CL6vFlMFlm7UeAtHxnKKFgRLIG46A84rB5U7AREunecHJvUdZgHVG2srPCz4v+IFwsgoePVgz1U4JlGlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4625
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-25_10,2022-07-25_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 suspectscore=0 mlxscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207250061
X-Proofpoint-GUID: NYPz2Fk1o912eZPH-mRvYthirHvaCC4A
X-Proofpoint-ORIG-GUID: NYPz2Fk1o912eZPH-mRvYthirHvaCC4A
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gSnVsIDI1LCAyMDIyLCBhdCAxMDo1MCBBTSwgRGFuaWVsIFAuIEJlcnJhbmfDqSA8
YmVycmFuZ2VAcmVkaGF0LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBNb24sIEp1bCAyNSwgMjAyMiBh
dCAwMjo0NTowOVBNICswMDAwLCBKYWcgUmFtYW4gd3JvdGU6DQo+PiBIaSBEYW5pZWwsDQo+PiAN
Cj4+IFdl4oCZdmUgY3JlYXRlZCB0aGUgZm9sbG93aW5nIGlzc3VlIHRvIHVwZGF0ZSBRRU1V4oCZ
cyBsaWJ2ZmlvLXVzZXIgbWlycm9yDQo+PiB0byB0aGUgbGF0ZXN0Og0KPj4gaHR0cHM6Ly9naXRs
YWIuY29tL3FlbXUtcHJvamVjdC9saWJ2ZmlvLXVzZXIvLS9pc3N1ZXMvMQ0KPj4gDQo+PiBXaWxs
IHVwZGF0ZSBRRU1V4oCZcyBzdWJtb2R1bGUgb25jZSB0aGlzIG1pcnJvciBpcyB1cGRhdGVkLg0K
PiANCj4gVGhhdCBzb3VuZHMgZ29vZCwgdGhhbmsgeW91LiBXZSBzaG91bGQgYmUgZmluZSB0byBn
ZXQgdGhlDQo+IHN1Ym1vZHVsZSByZWVmcmVzaGVkIGV2ZW4gaW4gc29mdCBmcmVlemUsIGdpdmVu
IHRoYXQgaXQgaXMNCj4gZml4aW5nIGEgdGVzdCBmYWlsdXJlIGJ1Zy4NCj4gDQo+IE9oIGFuZCBJ
IGp1c3Qgbm90aWNlZCBJIG1lc3NlZCB1cCB5b3VyIG5hbWUgaW4gbXkgbWVzc2FnZQ0KPiBiZWxv
dy4gSSdtIHZlcnkgc29ycnkgYWJvdXQgdGhhdC4NCg0KTm8gd29ycmllcy4gOikNCg0KPiANCj4g
V2l0aCByZWdhcmRzLA0KPiBEYW5pZWwgDQo+IA0KPj4gT24gSnVsIDIxLCAyMDIyLCBhdCA2OjI1
IEFNLCBEYW5pZWwgUC4gQmVycmFuZ8OpIDxiZXJyYW5nZUByZWRoYXQuY29tPG1haWx0bzpiZXJy
YW5nZUByZWRoYXQuY29tPj4gd3JvdGU6DQo+PiANCj4+IEhpIEpheSAvIFN0ZWZhbiwNCj4+IA0K
Pj4gV2UndmUgZ290IGEgbm9uLWRldGVybWluc2l0aWMgaGFuZyBpbiBRRU1VIENJIHNpbmNlIHRo
aXMgc2VyaWVzDQo+PiBtZXJnZWQsIHdoaWNoIHdlIHRyYWNrZWQgZG93biB0byBhIGxpYnZmaW8t
dXNlciB0ZXN0IHRoYXQgaXMNCj4+IGZsYWtleToNCj4+IA0KPj4gaHR0cHM6Ly9naXRsYWIuY29t
L3FlbXUtcHJvamVjdC9xZW11Ly0vaXNzdWVzLzExMTQNCj4+IA0KPj4gSm9obiBMZXZvbiBoYXMg
cHJvcG9zZWQgYSBQUiB0byBsaWJ2ZmlvLXVzZXIgdG8gdHVybiBvZmYgdGhlDQo+PiB0ZXN0LCBi
dXQgd2UnbGwgbmVlZCBvbmUgb2YgeW91IHRvIHVwZGF0ZSB0aGUgZ2l0IHN1Ym1vZHVsZQ0KPj4g
Zm9yIGxpYnZmaW8tdXNlciBvbiB0aGUgUUVNVSBzaWRlLCBhcyBJIGNhbid0IGZpbmQgYSBuaWNl
IHdheQ0KPj4gdG8gc2VsZWN0aXZlbHkgc2tpcCB0aGUgdGVzdCBmcm9tIFFFTVUgc2lkZSBhbG9u
ZS4NCj4+IA0KPj4gV2l0aCByZWdhcmRzDQo+PiBEYW5pZWwNCj4+IA0KPiANCj4gV2l0aCByZWdh
cmRzLA0KPiBEYW5pZWwNCj4gLS0gDQo+IHw6IGh0dHBzOi8vYmVycmFuZ2UuY29tICAgICAgLW8t
ICAgIGh0dHBzOi8vd3d3LmZsaWNrci5jb20vcGhvdG9zL2RiZXJyYW5nZSA6fA0KPiB8OiBodHRw
czovL2xpYnZpcnQub3JnICAgICAgICAgLW8tICAgICAgICAgICAgaHR0cHM6Ly9mc3RvcDEzOC5i
ZXJyYW5nZS5jb20gOnwNCj4gfDogaHR0cHM6Ly9lbnRhbmdsZS1waG90by5vcmcgICAgLW8tICAg
IGh0dHBzOi8vd3d3Lmluc3RhZ3JhbS5jb20vZGJlcnJhbmdlIDp8DQo+IA0KDQo=

