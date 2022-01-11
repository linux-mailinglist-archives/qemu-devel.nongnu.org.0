Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D6E48AF28
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 15:09:52 +0100 (CET)
Received: from localhost ([::1]:39138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7HqR-0007Wy-OK
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 09:09:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1n7GyC-0004ef-RC
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:13:49 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:41384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1n7Gy1-0007rB-Vj
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:13:45 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20B8cmis008377; 
 Tue, 11 Jan 2022 13:13:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=xShz7bXDxa/Pt6dsu9LhIxDQvqtq44kzyPyOxPAXLXU=;
 b=m+mdLIvN1fqfJbQebZ8eLsG9TRnYpTSwR4s7Q8uNIK5NepbTm3LSZfz/u0OG7uYLuUfy
 u6v6Gskl+uKmvIqfGorBsw6++BI81gwd4RUl78p96QbPs+yCGai3EnwkRZtsj/6ptYN8
 TqBCdwP3FxL5rBYgJKJt3YKIYB9GGgZgNuBteTbRLM1Zu/dFwzsGrQ74k4TyDQOoopgN
 IXrXmc2IjPHq8NxQH8r/8l8PLODPVfhdnWw/7Beak93GWjnV/W3YCz5hdnCmH/c5OKK4
 kotfocNeF4O6FPbFL0C7ms/Dl3+S97nk/kWJxdWW1Q0HPwQzA8HAn3gD9apfBTMEP8k7 ew== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dgkhx345j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jan 2022 13:13:01 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20BDARUx033611;
 Tue, 11 Jan 2022 13:13:01 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2046.outbound.protection.outlook.com [104.47.51.46])
 by aserp3030.oracle.com with ESMTP id 3df0ne14p3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jan 2022 13:13:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CKO3gkLJ8zTAivVDM2DaT9EuyYbqt9ypW/VDrGAhKMnboY9X6qs5t5ccW0saR1aR9A3/GbFQWRvR/mfLvTHX6gloJSsfrx4jLEaUFWNHNsdOrAq8sITbiVrKBNCP8ZycSVo2nKQ9L4CI/cLGhq8HtkZkxbXp9BfOCYl9SXfOgaGKFAjv1LAoWDQfxL+grzNZvomMVTrlVwDmIKXn01FXmL9sR8niM1hGLKGHUH2Q2fe6xO5V43Cof3zQP7maF+Uw9/Bw4pDCGTz8hAC03IcOAUydOKK/PduBwAcqhKpX2hW+yjKzPqBmARYoHn71q+BpZ6aH97m+vI6zFt0Y2QgzLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xShz7bXDxa/Pt6dsu9LhIxDQvqtq44kzyPyOxPAXLXU=;
 b=j1mhE3pNrECr3MvKr1eWqx1vhWl7wgmjMT4vNsI4U+tOdkdKJ5h9BvVDsw2RD8oWi7x+Y0rRPjo+hlXq6pkA8ZPpixkA6qjbppOIJLkKSDCh1+0O9RwN8aRmQ2EtLW0ngKdSyCiZTXgRzfTl8yCmC4uNOZ823/qgNuEO9YxdHC03OvcvEF91s2DUVBrC1CpY9bBtL+1pO3Y0Yhq4iux7CJA/ArDoHfExHLvCb9xKGtG10l9AJH6KJGpjxTpwo93U7WeZVBXdD7YvRQIF+4kfuAMqVodO88ds0ZZ4embgTwzyq9gzfJLMwmOxcKYgCLdibXvOVoRUKJ67fUqia3eglQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xShz7bXDxa/Pt6dsu9LhIxDQvqtq44kzyPyOxPAXLXU=;
 b=WCMt+P8YbRZoEeYTbFmQ1ykdcRGVfveZ4ZOMEczIr+0IyVlF7diuLJEJE6s7+yVMcvTG/Is1ykk5LLggFy3r8JlO/vX6XsEUOsAXNjkzMlLhlagmm2Vsb61+OciCqh7JTluE9FfTJLusggSEgp0eTA1UeYvrAQuUeNWl4gB1ZRg=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DM6PR10MB4044.namprd10.prod.outlook.com (2603:10b6:5:1d0::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Tue, 11 Jan
 2022 13:12:58 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc%7]) with mapi id 15.20.4867.012; Tue, 11 Jan 2022
 13:12:58 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v4 07/14] vfio-user: run vfio-user context
Thread-Topic: [PATCH v4 07/14] vfio-user: run vfio-user context
Thread-Index: AQHX8YApP455uSlkD0+QKeZz8trhfaw0+iYAgAICnACAHWDoAIABw+MAgAaSN4CAAQaugIAAPHUA
Date: Tue, 11 Jan 2022 13:12:58 +0000
Message-ID: <6ABE8600-95AA-4A04-9291-293E93CD8EBE@oracle.com>
References: <cover.1639549843.git.jag.raman@oracle.com>
 <f7fdee9b5cde0f8ee8e99702f113ab22dc4167ea.1639549843.git.jag.raman@oracle.com>
 <YbsgZDU06gcanadE@stefanha-x1.localdomain>
 <6EB1EAC5-14BF-46CB-A7CD-C45DE7116B44@oracle.com>
 <DM8PR02MB80054A55BCA44CD3525364308B4B9@DM8PR02MB8005.namprd02.prod.outlook.com>
 <YdbwJE2E0T6Lo9Aw@stefanha-x1.localdomain>
 <YdxzRoyD5gZDduYr@movementarian.org>
 <Yd1Po1Wv6T3AELBF@stefanha-x1.localdomain>
In-Reply-To: <Yd1Po1Wv6T3AELBF@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c3644a03-9cda-4ca4-a6b4-08d9d50416bb
x-ms-traffictypediagnostic: DM6PR10MB4044:EE_
x-microsoft-antispam-prvs: <DM6PR10MB404427A983941A3622A7226F90519@DM6PR10MB4044.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /gdmNDmAbXfXJAFlWeerB0piOvKUHz6zTQXZVa2Q3aTABJ5v8dIqxjiQM4a7uKPlFGM2dLBA6FHlDHYbI5Gs8bD+RXbmIUQqYgrIeHmD6icPJAPNxkYJ1bmQkwJ9ZVEOdnQy8AuFe4OlRTQXX/a0jKFUN4I8NcLqeUgFR4DpwpBIeuimoCfKAw4zGPcDTKdgF09GpJ7rEJpGW1uD95FkU+YvVziDAgqXiHlUeS8835L+uDPHRugZ5cKkZTbVxSxHE3FTSAt/JEAwalibxvtpF+WZnwzIFXGp8jLMJ5afZ7KY8CSTWKHwyAenX1nHU44vgQzXdedyKeUQy3DPPpL5M8lCURFVHrqGYVBYRvBF1atgPgUZnaJD/j9oa+dLUOm7smKbZkHcK2QALlfvI8+N849JX5pBqpqeiZ2P2wlfXzmXXk/IrLHchjgnxuJMOZm+JcVqJwMDrSFapUk9ZyoOwex01UaysWePyOPEemuzrJRmQdrGTjsPAHSct39NLaHbqe5eyAcsdviEI83OpwBtZJNvLP8IqKqBvcrcx+EILFgUkWN7X0XbtMXF+M4m8C4T3XVeR8N8PDuKF5ozAAYVp0QAYjCuMAemUqzQx9P5iJ5e8Itn7m/JDTl5StlUxxjN6PNFeN76n7XZ0v3iVCa1Oz/w3gPwDxH19Bs7qPQds3Wp4YrI7RwOq9V1dDLi3R7A4XgpA6+11v5auIgUG3kAkCQD0Zhp7S9dvCJg/rFsZ98=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(53546011)(6506007)(83380400001)(33656002)(8936002)(38100700002)(54906003)(8676002)(122000001)(6916009)(71200400001)(38070700005)(2616005)(5660300002)(76116006)(66946007)(6512007)(66476007)(64756008)(66446008)(4326008)(44832011)(7416002)(91956017)(66556008)(36756003)(6486002)(86362001)(508600001)(2906002)(186003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?cPL381PfcnYyD1B8VnIQtssllDC7mUbC4wXYxzTUimiCLpvJ/PC2uytT+3?=
 =?iso-8859-1?Q?isqCN68BOYfzii8NShregvv5lQTLeFTfU1uHzPe9JprxeWtmrx5JfX4t1H?=
 =?iso-8859-1?Q?m/KD1u+xjLPyDZYURm8aHkoD8bA/TLG0mHoFA5nw6m1CqDhBUB59QBL+d9?=
 =?iso-8859-1?Q?mU5NBDlpBT1poq7YKv1gFPIbDQ6ii87VdDNSlJxpcbPAYjcwM99wuhZQij?=
 =?iso-8859-1?Q?oYxO5iqAlnk9z9kPtJPZlMcki4MUgouTtCSiPo3uSCNP/FNBGDMJYj4L9e?=
 =?iso-8859-1?Q?4HQgZmD+otWDlsCRnOLlBtXdqDN4tKhWha4gHeqzRZGofIIgEYw9Gx3tFT?=
 =?iso-8859-1?Q?OsqQi5nZbQk36RyunzYXUwq1It12JQwxMbIh5jOdy7sN1pw6+dMnCZjiNn?=
 =?iso-8859-1?Q?0hInVuJgoNSb8AkcQ7YiussYKmoKkouu/l9gk6chj46fqqf8yuxD6xcyiE?=
 =?iso-8859-1?Q?ehgfaIblel2BISSu0sZjMbpsNY/UxwYg+Tz9KQRCn7jattYD4PADr4zJli?=
 =?iso-8859-1?Q?L59Xh8f50nIUFs+pm5JNRh0nRS9UR+njW1zjFc19wxhXcJbaqMt/f5x0yN?=
 =?iso-8859-1?Q?HBpIp6a5u/YxuR6+7RaNa44Dpn9ijnOJGlZNZ+iM0YPmIpEWM6YCIJf2bc?=
 =?iso-8859-1?Q?+2012gtILaD5rOkfx0Qlh5MVk3BUwqkwZvNTTbDM4Z+dT+nStD/HmE0AG/?=
 =?iso-8859-1?Q?felhnsGnrqZyRlKOK1Xsx32gY5Xs0E8sP+jxmMkvivMbyNnwTJQusQ7ZWL?=
 =?iso-8859-1?Q?hWlFCHx5uET0qaiDKXrRA/C/GQwipb/qVliymCiuq1oIT0CO2vpH8JlHfy?=
 =?iso-8859-1?Q?MGhw94dLseMt01x9wR4WCrIrAbsjvyCrz+21IRCZyGmnRpOVCaL5h1qwyZ?=
 =?iso-8859-1?Q?l4LmzjqP5QjxlLZSYMoPMOQYr3dveS0+F7zF+rOLCZUsSJ1gP2lrTRipsb?=
 =?iso-8859-1?Q?adf4x8MYkX9m84IkcvzXQMT6Is1kAO+1H5+gxZ8aGhUzgai3n4jfUocqWT?=
 =?iso-8859-1?Q?0/i4E9l2w15f5hGtIJ8dwqZF+mbYDiiFx/EoO3EYP8fy1V0eu6dXBwv6dq?=
 =?iso-8859-1?Q?8+Ht9RRCIOuKU8Mhr3NPBWYYazsSQ8EnN9NQqndDYbhaKMpo6GwBnZr4Wz?=
 =?iso-8859-1?Q?rQOx+Bm6CQ25REwDSlt1JMp6C/bBnAHrgsthxHfplg9/WwZotGLJxlMo3p?=
 =?iso-8859-1?Q?hAuPqxA7UUq58y8y+N2hD+JOSZgTnpASFD0V4TsjFkWUuvrF4VGdF5fTwH?=
 =?iso-8859-1?Q?l4O64VKwBbCjmIr59iQOrekmQvZMeJSvQ+QOLf3cIoEi5AdU+CFd7UpGOa?=
 =?iso-8859-1?Q?9Ce7S6OH4Fir8XrZHrxG6LjeWmwjsisDDnKbsXEE3xpu6cD3BCElH6R5DC?=
 =?iso-8859-1?Q?dofqFdVHJOJCOoC2pXAhOx3L6awv+BQHwl2ymBN0jaV2BxtHTIV8ILTulk?=
 =?iso-8859-1?Q?uSW+i/EL8Wkq2e8VcJNnwJJg62cTPgpMoWl6t8PiiUmKIEpbXxy/+c5rd/?=
 =?iso-8859-1?Q?M45cvR4OFOwMk3QTT+zuc9X20IWQwm1H6DR3rcqYtXK50lsy7PA7uSYGdN?=
 =?iso-8859-1?Q?qxJZeWIZfFNcnq9DYw2gJmjt+cz6+prm3QDC7X3KlQPlClJ4ZTG3kh0O9f?=
 =?iso-8859-1?Q?TcG+57j32KjLSSgXez4yrGbaNNzeQWU8jh/yAk6APvBERDWDXmeVXDYUPl?=
 =?iso-8859-1?Q?khJ9nkEHaHGwjr+qB+C5835a7XmucAQAT37rshV7roe+aFeRkADUlCAySb?=
 =?iso-8859-1?Q?4qJg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <99BD74C4138A1643867B8AA4740B64FF@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3644a03-9cda-4ca4-a6b4-08d9d50416bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2022 13:12:58.6368 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pCg1z23ulY9V674wbwhUXf4fg6GsIuZC0eCzFowWhmt0kL8GPd/LCjjxiOyChSZOhQg9zKCm0lG7OwyNFrIZkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4044
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10223
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201110080
X-Proofpoint-GUID: 1aUY5k2AuMzMYA5310t0RdlUAsy95_RE
X-Proofpoint-ORIG-GUID: 1aUY5k2AuMzMYA5310t0RdlUAsy95_RE
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>, "bleal@redhat.com" <bleal@redhat.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>, John Levon <john.levon@nutanix.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "crosa@redhat.com" <crosa@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "wainersm@redhat.com" <wainersm@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@gmail.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Jan 11, 2022, at 4:36 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>=20
> On Mon, Jan 10, 2022 at 05:56:25PM +0000, John Levon wrote:
>> On Thu, Jan 06, 2022 at 01:35:32PM +0000, Stefan Hajnoczi wrote:
>>=20
>>>>>>> +static void vfu_object_attach_ctx(void *opaque)
>>>>>>> +{
>>>>>>> +    VfuObject *o =3D opaque;
>>>>>>> +    GPollFD pfds[1];
>>>>>>> +    int ret;
>>>>>>> +
>>>>>>> +    qemu_set_fd_handler(o->vfu_poll_fd, NULL, NULL, NULL);
>>>>>>> +
>>>>>>> +    pfds[0].fd =3D o->vfu_poll_fd;
>>>>>>> +    pfds[0].events =3D G_IO_IN | G_IO_HUP | G_IO_ERR;
>>>>>>> +
>>>>>>> +retry_attach:
>>>>>>> +    ret =3D vfu_attach_ctx(o->vfu_ctx);
>>>>>>> +    if (ret < 0 && (errno =3D=3D EAGAIN || errno =3D=3D EWOULDBLOC=
K)) {
>>>>>>> +        qemu_poll_ns(pfds, 1, 500 * (int64_t)SCALE_MS);
>>>>>>> +        goto retry_attach;
>>>>>>=20
>>>>>> This can block the thread indefinitely. Other events like monitor
>>>>>> commands are not handled in this loop. Please make this asynchronous
>>>>>> (set an fd handler and return from this function so we can try again
>>>>>> later).
>>>>>>=20
>>>>>> The vfu_attach_ctx() implementation synchronously negotiates the
>>>>>> vfio-user connection :(. That's a shame because even if accept(2) is
>>>>>> handled asynchronously, the negotiation can still block. It would be
>>>>>> cleanest to have a fully async libvfio-user's vfu_attach_ctx() API t=
o
>>>>>> avoid blocking. Is that possible?
>>>>>=20
>>>>> Thanos / John,
>>>>>=20
>>>>>    Any thoughts on this?
>>>>=20
>>>> I'm discussing this with John and FYI there are other places where lib=
vfio-user can block, e.g. sending a response or receiving a command. Is it =
just the negotiation you want it to be asynchronous or _all_ libvfio-user o=
perations? Making libvfio-user fully asynchronous might require a substanti=
al API rewrite.
>>>=20
>>> I see at least two reasons for a fully async API:
>>>=20
>>> 1. The program wants to handle other events (e.g. a management REST API=
)
>>>   from the same event loop thread that invokes libvfio-user. If
>>>   libvfio-user blocks then the other events cannot be handled within a
>>>   reasonable time frame.
>>>=20
>>>   The workaround for this is to use multi-threading and ignore the
>>>   event-driven architecture implied by vfu_get_poll_fd().
>>>=20
>>> 2. The program handles multiple clients that do not trust each other.
>>>   This could be a software-defined network switch or storage appliance.
>>>   A malicious client can cause a denial-of-service by making a
>>>   libvfio-user call block.
>>>=20
>>>   Again, the program needs separate threads instead of an event loop to
>>>   work around this.
>>=20
>> Hi Stefan, we're certainly aware of the rationale. Ultimately we just ha=
ven't
>> yet found resources to fix this: in practice, we don't really hit proble=
ms from
>> the parts that are still synchronous. Of course, that's not a good argum=
ent when
>> it comes to your second issue, and indeed the library is not currently s=
uitable
>> for multiple untrusted clients.
>>=20
>> For Jag but: patches are welcome. But it's not just negotiate(): all sor=
ts of
>> things are potentially synchronous - for example, it's expected that the=
 region
>> read/write callbacks are done synchronously. Any other client reply, or
>> server->client message, is also synchronous.
>>=20
>> It's partly why we haven't yet stabilised the API.
>=20
> From the QEMU side it's okay to have blocking code in this experimental
> feature if users are aware of the limitation (e.g. the monitor is
> unresponsive if vfio-user blocks) and multiple untrusted clients are not
> supported. The QEMU code should also make its limitations clear so
> readers are aware of them and know the author chose this approach
> intentionally rather than due to an oversight.
>=20
> Jag: Please mention this in the documentation and add a comment to
> vfu_object_attach_ctx() explaining that this code currently blocks.

Sure, will do.

Thank you!
--
Jag

>=20
> I think in the long run it will be necessary to address it, e.g. in the
> multi-client case. That can either be done with threads or by making
> libvfio-user fully async.
>=20
> Stefan


