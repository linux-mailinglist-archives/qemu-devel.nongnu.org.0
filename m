Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 804034CC05F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 15:51:59 +0100 (CET)
Received: from localhost ([::1]:42460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPmoA-0001iw-49
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 09:51:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nPmmT-00006F-49
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 09:50:15 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:43172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nPmmP-0001x2-DO
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 09:50:11 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 223EnAFm003629; 
 Thu, 3 Mar 2022 14:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=eoduXuY1JnhTEPE2IQWP1l/NJKzXHthOpiGyjYVWgas=;
 b=XTdIiztNsQ5dTdf3MGxwifPUcw4PECzZdPmYMJqFn1xO9bxqVih7IuO38EzB73txZjkq
 Cb1/DmYuJX91p3DHrD6M72SxrIWy0zVrHqWWEiDdjYhKCT54zKVoPmQaU1Xl6JlQKowX
 QhD6+mU65LLYa/D0q+uWjfzh3BgdMa4Cck5w/AkQ59HHa6erTSKtUR6I9aSAAJBfqA0k
 7tnDi1afHrA2P4RKKk+hWi5OjmMd3WQMdxX4j1UEJRXY0qE23izgUrNBk3o+dTStAUT2
 qHPv7NTcXuG1UTb3lyLJt5aKIQCntOegxdFNJvwuQUEopC2V2qLFPgrAML6jq1qJaNur gQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ehh2epxr4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Mar 2022 14:49:57 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 223Eg9MO138167;
 Thu, 3 Mar 2022 14:49:56 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
 by userp3030.oracle.com with ESMTP id 3ef9b3jm73-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Mar 2022 14:49:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R8b5IXTGXgjmS/MxrOjgnUj4JD7mFURAwUMhtLkKOE1fTVw/6gP7UySv8f/i8Hmn60DXGQg3bhFwM+FCZH2JFRe3sJ/2MOoRWk15SdOoSYqDCYh76uYCMVkqW0FjAhTpif4+HzjojGXERet5XOE90SMT8GocelCY+Xbdr3zZ5Taw8nKF8szXb9MUem/zUM5Ueq+jt3i+rvueYREz3261LIGcdvih2oV/YnH0yTGgqTpWzYc60+yByApEMVvLGzzdbuKr873XrR49RPqq84lVWOlWHdqpYjAeSr8ZNbj2zFDaXtplPrXzuldbzH+guKNQerpMQF66D0s+KKK9lS86lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eoduXuY1JnhTEPE2IQWP1l/NJKzXHthOpiGyjYVWgas=;
 b=e6mSFsRyxvSQ7psTFH3Thg5TbswUs/vAorafIZzeiMt7YFtCOmF8z/QztGXnUCnWaM5U7yjibXUaV0r8WjFD+A+V6nH7csuuu/O2oRBE/amu2d8GVStboJfVlbMVXN8x4Mkv6duUsQ7719rAqFkkcmxpPKq0ZangXAqrDnMt0G0w9zD4XpF0nYVgnqH++BPNN779W65Td74YpdN5L+EYLwqTrdqPaX7syN6npXJePWaNFrFcoXFwnPWfVqfzLFMPXK3FFt5SLoadXVi3sCnHvLTcPO1DT4RiDP5BRMqkXbYlco+aOWIxRRZ4XbH07Ra7gim9apP4jQVUSFxgrCdWiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eoduXuY1JnhTEPE2IQWP1l/NJKzXHthOpiGyjYVWgas=;
 b=ofqT5vx47Y2aNu9angMeJ1IsjOrOIZXRpUoH9SvVyECUh4EXR/2vLg8YlpxxS5N0SLr5XdBbrPmWD3dLJUcwZbIZ4p/ahF2mSYT9OakaHD0MCjzQRoqx3aH9EfA5stLlyiUHDmv43OiPVtoL5+IaCB0zudyF0zQJ1er9QLdDXEA=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BN7PR10MB2451.namprd10.prod.outlook.com (2603:10b6:406:c6::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 14:49:53 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a%5]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 14:49:53 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v6 12/19] vfio-user: IOMMU support for remote device
Thread-Topic: [PATCH v6 12/19] vfio-user: IOMMU support for remote device
Thread-Index: AQHYI8rp1f9mHlzmeEK/icjoK3hvXqyfaYEAgAoI8ICAAvEPgIABcMoA
Date: Thu, 3 Mar 2022 14:49:53 +0000
Message-ID: <4022DDF7-8D34-4A65-969D-B632A66E386F@oracle.com>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <f6dc62f6957a6ae2d289a5810d48c717eefff861.1645079934.git.jag.raman@oracle.com>
 <YhS9gvErGeGVPcwk@stefanha-x1.localdomain>
 <208904A4-1F80-4102-8B00-C106121475A1@oracle.com>
 <Yh+gMyjTDM5GEXMT@stefanha-x1.localdomain>
In-Reply-To: <Yh+gMyjTDM5GEXMT@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c5a82c10-d710-4ff3-ea03-08d9fd2513cf
x-ms-traffictypediagnostic: BN7PR10MB2451:EE_
x-microsoft-antispam-prvs: <BN7PR10MB2451831EAE5813E7713D143490049@BN7PR10MB2451.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tvjGZkCJ/zT540TU71LWcX1xjvubC9kGjZtEtxJRyaZ6oeQHpMw5DwhFEKSLHuYiMiFm/79sKUyNt77S+ptx2We4xl9F2j6lpmcOybs4aIVepENuNAROj3SQkgaHzNjmVO7Hfz6ERqATI0m+tSsEIxCl78BYxjNCiDnkbjqK9rrEUitWjDnx07bdGj4meplk99d6cQPTM0/BL4WQRqPQBtuSxqajjx+GGxnKkQk2ONvMxRm5oNd6cS7euQrTJEjr5KvXjjP6HazSJgowuxiHXQAXT09nS06s5jlBKglY0rnE096tzxvImMSrS0KCr+oahG/Mt7n1j6p6w3MIOqaYnpoBjdIfGclSMR5Fv5rDGaOWX5xEqDr5qvEjQ69B5PNsxQbCWXWBI4iZfmla+oYNPvvlMQ6VltYb8qvmqAclqrcyyxr8cEUKcOUgHjxS60R66XOH2ui9VKsoRQYJYPxXFO6d59leC0nytV/N74LOUyw3dxWLOroBNR7LBvK/paEgiszrwCZRiggvI2EDSvtQR7oIt7I7fbLs6cGEWdLKrmKO4WHlmKDPbFDaMh0zm9hgWsRrRzNMB7WT5eJiETnAhTzO+5KiWFBj1fdf8V2a2q5Ao2tcF7S2QTCLrm0P/s5N4jrB6JeuuoDKFPh8gcrMlFGtDxX1AJdhoAfvTSOQBIMSWCt0xwXcvtYOMzMTCCDrgUGv25aOeyrjr4l9IirUpp3Qkl0Oj6ytppHvQ+Co/Dw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(91956017)(2906002)(8936002)(7416002)(2616005)(71200400001)(186003)(36756003)(86362001)(508600001)(6486002)(6512007)(44832011)(53546011)(6506007)(83380400001)(33656002)(107886003)(38100700002)(38070700005)(66946007)(5660300002)(4326008)(8676002)(76116006)(64756008)(66446008)(66476007)(66556008)(54906003)(6916009)(316002)(122000001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?wcAMzlfU8T2XwCNirhLVsSJmmLMZCfaAPfS+i9ZEwmgmV/X6PWsCp3hkZX?=
 =?iso-8859-1?Q?Yzvmle65MV40KkSgVkvVPwIAdO5J9f8kUtrmMKk3BeXvmL89kfCZbfBHEY?=
 =?iso-8859-1?Q?DFwZLjxWnM4qQt5pKvfy1JE9MjC5LL4vh+P8KAAJJsVK7rYU+xTPFkN1HD?=
 =?iso-8859-1?Q?thjkCy2neWaTVN7zwa+5Zj4LwN2UbeeiisHdNmy/4Idt9s2xdU0PVDu6wI?=
 =?iso-8859-1?Q?1TB3lXcfq9A8tLjZGZZDNKgB7XCYb78fvCqmO93K4N2Hmdpd2nKjlHx6S/?=
 =?iso-8859-1?Q?pfkQSzzDRxH2ACGRnUALk9WcGZVI7OVHwdZk7X99X7u0gwPY8Ga4r5tbXZ?=
 =?iso-8859-1?Q?Hakx9iurjWZFe42NA5JjAr0DkchH2/v1kqKVec9OjCxunCtlriK13psofs?=
 =?iso-8859-1?Q?xDwKg5qYXxJH0NtQiMieEpcZHTpa+1rgOM/64WovozM2VhjDawXeZA3BdR?=
 =?iso-8859-1?Q?JzWaWKuFmdDVl9kqxFp8eyBct2fQh+QxrnTE9Ina6dvmPl+VD2emP2yQHg?=
 =?iso-8859-1?Q?rwVoRVeet/at5VvfK7DKgBZRO0M7gcR1SBPSc70JDVtlnndhUiSbJv5bJ1?=
 =?iso-8859-1?Q?d1IMCGSbVDXb7Q1bSGBn6d3UvIqVB4dWFd3CIjZWbU26OalA/jVK0j5ctQ?=
 =?iso-8859-1?Q?JpM24g0DMOc/ZClmcvwxS3GWQt3RXqnrKUOmm8SvYVuYRUvQTUrvWFcPac?=
 =?iso-8859-1?Q?jZMhnJcaXYKd9x1As/VkChcdUREjmPTgRo5OFMST/MlarsdxA+BGUpINbg?=
 =?iso-8859-1?Q?2p3flv1L6SPE1FTUNNZ+uh0WYMTTMTPIqGMCXxzYhHcxzKswvrg/qqEdiV?=
 =?iso-8859-1?Q?lbq2UHcdKAPN3E6OpDLaqjkUXK2chKAzoa4JuIpawaKmE4c4OqFHi+WAHD?=
 =?iso-8859-1?Q?htPkMvvZLu/unAW6M6k2LwXlSaGjrFK0Jww8PJhbwlNa2wolSVlON38Lem?=
 =?iso-8859-1?Q?TttP/AlUILxw01+g0jQjsRBcJGWVV9/fHyzqM8ihoEMrfMzkZ7LQsBy5im?=
 =?iso-8859-1?Q?mrDBrQNbjhs6cwY4j8wtvu0WZnNGq6IwxCnqrcdjA4a8WP87XacDRe2V/i?=
 =?iso-8859-1?Q?0Xnj4Xc4ShO6WzH7UMiHVGjJVYJyU1W99MBN4HxzdAx2SHxCuJXrDZ1QbT?=
 =?iso-8859-1?Q?qJeZQrq0qiLQu2wEEzgzzJj5VC3GbQGCvaIDzoze+hl9jVSSuvN4XVGMFA?=
 =?iso-8859-1?Q?iUtPuJSRjIqbmkehezzeeczXujzIOuNPCj5lYmtiLCKwktCEyxNWtVBVpu?=
 =?iso-8859-1?Q?Lx6iPGg+v46hkVf0tXXbsj/HSnnYLQcSKa0EuzQYIA8J18cLGCpQjyEU5d?=
 =?iso-8859-1?Q?7eoUhtn+F0w+5/P6kmd0ll/f604okUs21lUVo0mr8sKRSrfWaQUkjPje2U?=
 =?iso-8859-1?Q?sRDryUgGiAw0fBvd53UFP3B7N5HzAXBo6aVf40n90/u5Zlj67lvSWaoBb1?=
 =?iso-8859-1?Q?MHL+c+zXxxKCu5kqLaD3GnPmHH2LepdLM7UoPf+UYgYZv5MMqjWK+4jCOB?=
 =?iso-8859-1?Q?tYveQAdnhds0NEAH67CJLbMUNAAUCHVB+fpGHRuMkY+6bR6D3meF/dnQOp?=
 =?iso-8859-1?Q?S7C1KA2pL0q4tBrrgVvNRekuWucn0Zdxu0AnL8NeLXZ7OOZ0VYxD8SQpR7?=
 =?iso-8859-1?Q?HVL+b7DGmJllv2U9NYUUriAZbQyDHi/RUGUuW2C8JAh+7Th99bBs8oZBpP?=
 =?iso-8859-1?Q?JadZg6VnfF4G8VigvT0HbRF3eYSgJpdBwCsnJHP1n77+kWnJVw3e1blJ1v?=
 =?iso-8859-1?Q?EkZA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <238D03BEB717D34E90538BE5AFED96B6@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5a82c10-d710-4ff3-ea03-08d9fd2513cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2022 14:49:53.6708 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L7lLWERH0YflvCJ5TGKqCrfODp9ZFYRKWggAS3hbmL6RkipL+wlixmVraZrUymF5GzbEf9u3LyxUtx+qyJRIXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR10MB2451
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10274
 signatures=686787
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 malwarescore=0
 mlxscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2203030070
X-Proofpoint-ORIG-GUID: 0XMyGvpUzp2v1y4F4a4PqekktigK7aER
X-Proofpoint-GUID: 0XMyGvpUzp2v1y4F4a4PqekktigK7aER
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Mar 2, 2022, at 11:49 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>=20
> On Mon, Feb 28, 2022 at 07:54:38PM +0000, Jag Raman wrote:
>>=20
>>=20
>>> On Feb 22, 2022, at 5:40 AM, Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
>>>=20
>>> On Thu, Feb 17, 2022 at 02:48:59AM -0500, Jagannathan Raman wrote:
>>>> +struct RemoteIommuElem {
>>>> +    AddressSpace  as;
>>>> +    MemoryRegion  mr;
>>>> +};
>>>> +
>>>> +GHashTable *remote_iommu_elem_by_bdf;
>>>=20
>>> A mutable global hash table requires synchronization when device
>>> emulation runs in multiple threads.
>>>=20
>>> I suggest using pci_setup_iommu()'s iommu_opaque argument to avoid the
>>> global. If there is only 1 device per remote PCI bus, then there are no
>>> further synchronization concerns.
>>=20
>> OK, will avoid the global. We would need to access the hash table
>> concurrently since there could be more than one device in the
>> same bus - so a mutex would be needed here.
>=20
> I thought the PCIe topology can be set up with a separate buf for each
> x-vfio-user-server? I remember something like that in the previous
> revision where a root port was instantiated for each x-vfio-user-server.

Yes, we could setup the PCIe topology to be that way. But the user could
add more than one device to the same bus, unless the bus type explicitly
limits the number of devices to one (BusClass->max_dev).

Thank you!
--
Jag

>=20
> Stefan


