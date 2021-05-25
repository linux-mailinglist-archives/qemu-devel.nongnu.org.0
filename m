Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBB5390A6E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 22:24:14 +0200 (CEST)
Received: from localhost ([::1]:40680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lldb3-0003OG-Nv
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 16:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lldZc-0001my-AD
 for qemu-devel@nongnu.org; Tue, 25 May 2021 16:22:45 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:60826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lldZU-0003WG-5N
 for qemu-devel@nongnu.org; Tue, 25 May 2021 16:22:42 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14PKFPMQ066994;
 Tue, 25 May 2021 20:22:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=sx/pbq2NpGXdyUI8nQddE0V/kdm2l8zGYAJI3xFv+S0=;
 b=uYDPg61Bx2H+yvlY0/nPE7ccxypJNOHVCSlrUMdplc4SEfKYARzzvcXSxwS+djBSEJNb
 OPrsSJC+koBtmwf9swkdttAzDtMvY8v3S38MESbYt90kV6AcJLsT8zEtOv2QRc/O1waU
 4CvSoLOHOhKhIsj/VP5dW6dtb5QVVRdbQm0nKtSk54zT3jJM5Z71LRVUvhPpj1W0QPWX
 kgDTlrs+OSoWBl9Nn9fSWWeE3vMZxfr2SjIE9no1edNUbcIkCqD3e765MzwB+3XmHSZG
 o/yXVdwDRCz/ygWsk8sz2mC6AhFz8/BPSReX7pprYvK6ac12VjdWQGsTCYrWOSqDN/ZS cQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 38q3q8xndj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 May 2021 20:22:29 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14PKAEAm027813;
 Tue, 25 May 2021 20:22:29 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
 by userp3020.oracle.com with ESMTP id 38qbqsk1t1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 May 2021 20:22:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XORwZvmW0uC5cd22/FoGeDTtAE7FR0lIURumtfuHCllpN1CzfyUcJSPEkRA9N/0efce9SYmL4dExAUQbYEyqps9TqwPGTHuYH4sf9R+omaaCy86FvTGiAHqUk2vLutcsjdH+1M7/pnCrz+7cBBnomH2HgnyOoA0J3k/EfSZ8m5GYTB1QcfOId7m9SqN4y4/h7XU6KsPCSE+GmZvB25Vm0iCZD+7P+XPKwDXg7pFSxlgE+L/7hLpu//Z2mWwcBjq4+RrFuYap+95jK2p9hmy896b02zASZCMBI/WN7ImHG1hfjCFet5bB6+EM3QbBKg3SJ+66e58q3KozoZ7q6fvamw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sx/pbq2NpGXdyUI8nQddE0V/kdm2l8zGYAJI3xFv+S0=;
 b=I6cgUhaiso6r6eO0oWS5M6XhGUo4OyGhdxRGLFwiGZrII7ojEc9L4uiL4rAMFJFLJgPVV2vIwWa0oh15V6oy7O2N1794Nb/Jwrnu7TYRZ5Km1qsLQgHQsKlNWo8A+Auyd7XV/4RYv9NWJLqp7W4skXmRwRPjUiNjlhd0PjbvhzIWnSRfQ2QJ+GYLe+A4td73byMBtbQk/EOXI2jI3cWsLgiU6j23x52SZYwdMtOxag+ntYfk4kxvRRYDxnrsjH6XRAC3odgSFmcGG6QjfQetY08dpMDbZXdmneLKAIv/gwoS5JZUVzDzpKIv8RRqS27PqJ3mzQpRcDKl0sfa16lwQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sx/pbq2NpGXdyUI8nQddE0V/kdm2l8zGYAJI3xFv+S0=;
 b=EKP3yWUWA8uW9Jcm8r2EvFv9axZtZUuTKwBUbcMQY1RaGQkdgQ/O5uUYKCgJF8woSIDh50w/ghf5ihvjrrlpAWe/J70Xy07GZqTHAVBLRinXfwc24y6AfKrDLgIJw3qjx5IQUuaeHDtpw/8tZmoNEtW4HrCvy/JYxkg0P/bZBNY=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1933.namprd10.prod.outlook.com (2603:10b6:300:10b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Tue, 25 May
 2021 20:22:26 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::2c38:cf0c:fee8:d429]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::2c38:cf0c:fee8:d429%4]) with mapi id 15.20.4150.027; Tue, 25 May 2021
 20:22:26 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v2 3/7] ACPI ERST: support for ACPI ERST feature
Thread-Topic: [PATCH v2 3/7] ACPI ERST: support for ACPI ERST feature
Thread-Index: AQHW/l0fQlwSEv68gU2Ur30xmG3nWKqoOiqAgARyYeeAB3TagIAeR4s6gAAX9ACAFduLw4AAGw4AgAGaggiAAsAMgIAId9kz
Date: Tue, 25 May 2021 20:22:26 +0000
Message-ID: <CO1PR10MB45317C1FA7B7EF0229AC1B0397259@CO1PR10MB4531.namprd10.prod.outlook.com>
References: <1612817879-21511-1-git-send-email-eric.devolder@oracle.com>
 <1612817879-21511-4-git-send-email-eric.devolder@oracle.com>
 <20210406213131.21045f68@redhat.com>
 <CO1PR10MB4531392E4B963B163A0FC89C97739@CO1PR10MB4531.namprd10.prod.outlook.com>
 <20210414111759.66e78f71@redhat.com>
 <CO1PR10MB4531ACA8EFC99E57809E1499975B9@CO1PR10MB4531.namprd10.prod.outlook.com>
 <20210503190734.12e4c1ac@redhat.com>
 <CO1PR10MB453130B44F61C9E82C431789972D9@CO1PR10MB4531.namprd10.prod.outlook.com>
 <20210517183138.5a429692@redhat.com>
 <CO1PR10MB4531D0D81AEDA7FD7F10DF19972C9@CO1PR10MB4531.namprd10.prod.outlook.com>,
 <20210520130047.1a89d520@redhat.com>
In-Reply-To: <20210520130047.1a89d520@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [138.3.201.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 181aac7c-0af8-4abb-c942-08d91fbad041
x-ms-traffictypediagnostic: MWHPR10MB1933:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR10MB19330265606821B9C04394A797259@MWHPR10MB1933.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z4ZZdb7H4FJoTNRoBdiKOyFqfWjgWglfuQ0yDOAL3O9zmGlyLShVOX/cJf4yFuJ1FQf41fg3gpdVbwN0OOzpA5rYOvUXnfqMCn21V1IdmXJeeM+Y+vDdTPf4ImKa0OkXdVSDzc0z0xXWr3964QJYFOuMWLZBh2os31Aycla86qG5IE8YBhDv1GyDLgw6h+eE/5klFfE/444jgkhP4lofU2TMsK30vg5dM4lTx41XfxX7vUafRyKqkjg9I7Q/zBsPl+EZgMZmveeIpST/1R2UYXb4WmCgoMpP1ZW6zZVR1leolsZHL2CiAhQ6gjsomyFBAgAKmK0ruQo7e377EuJdrAiCZTU0risRizo6jQCAfUMfADsOgtShCYdcEJyUi/4VPf4oXeBfkxp2H1bpkH+93w2k8lGyLZxMsamgYEg6xt+M2fuY+qp9ATajCZg/aZ2/5kX82nkcODOae0I/POA1bkZG3WbAy5iR6/EwrTdBsjIO+Fr9Ubb1Z/Dz5BtqWOp6sTDpL+V0O8KNTSPoGYLZ89Oar4Ts8LW2cGOkCd49a5RNh5xXpsLe0NId0dn4JhQrhujJXDKsc86bB5G0yHJSeLpKr6VCm1Sv6SWVY14jb2g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(366004)(376002)(39860400002)(136003)(86362001)(7696005)(64756008)(2906002)(66476007)(66446008)(66556008)(66946007)(71200400001)(38100700002)(478600001)(186003)(316002)(8676002)(8936002)(122000001)(5660300002)(76116006)(33656002)(53546011)(83380400001)(54906003)(6506007)(26005)(55016002)(19627405001)(6916009)(4326008)(52536014)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ZKIDSAdrykBJ0vnOyHdq6YMHusEv7FJnenMjLSCCXZcy09nkYRpochGXblBQ?=
 =?us-ascii?Q?d/hZ6w0aBlWBqsfopmFWOt7nDCvQTwg1SJBhkJBHkqgoyVIth26X8kFax4oZ?=
 =?us-ascii?Q?Dd2vXaHLpe5VO9uMsenUc7xobnfP6jtYia+6ZS1+OQ83HEX36Lcvv1M12iws?=
 =?us-ascii?Q?ujzA4zPLWyIKYcM3MphApVnoMVOC8i+btm1o+Ija+X2mUILp1vM6ks8TANJx?=
 =?us-ascii?Q?JROJpjniO6xQSz4OXFQRUSOHhxcY6qYJsJJgIBEiD8B4qz1CmkpPKz++uFjx?=
 =?us-ascii?Q?GW88FoBmv5YgNHTiRTY3SaSR/rYMWZBp8rGgprUs7L63KKcwg12FGQoAaQ7X?=
 =?us-ascii?Q?nDZwqnIvmRtV4MLv640iVO8AYDpsU5s9lnOGxaADdSvc+pD+JgcVbutGK9Gz?=
 =?us-ascii?Q?aoGHd7A7ov2Os5CXjpT/eymaBLop4xfiEk7LM11+5RWtj8touVDIaif8LWHS?=
 =?us-ascii?Q?tDgfP+fCZ5a9R5odPBi45F8vH+De4V9VbTByCFQ6bBEeY8sr/sOIIoWGuKhG?=
 =?us-ascii?Q?HHKgZqr4hVIyoeRJaQEsDnKRnO1ZTUKROi6BKdlEOtZtO+F3ocCbkY8iDHqn?=
 =?us-ascii?Q?UxJoShbxk/ysk5eUUyYnhdG4BBpbZXwPJnZi+Ig2SMuGUY0QGdVk0aCmQcqj?=
 =?us-ascii?Q?Seh69jxdM2vFOMXsZE4ns+usLZrG0Y45fS5W8GchM1oIPCuTlZxRsqlnoefA?=
 =?us-ascii?Q?QepGZGIBspLJ5I4YXzgs3LiWvKkP4kc8XsCxrcOrCBZusQA/w+DAqUp71pqa?=
 =?us-ascii?Q?BEmWO/EpKplUOzRaXbXYztKCjRHEmBWiNaLgqvndMCrPEJbcO+WVxAeB0u6M?=
 =?us-ascii?Q?a4Dq2sdh05GBU1UvRP8rR25PJHUikomiC7JTJWJIRBriO1ePmHtb3HvAWAQi?=
 =?us-ascii?Q?CGMHJm1VmkpPVFJpwlsWcBCO6quM5fC3L/p7uUpY+aoLvCWmP/uu/PIwgFJ1?=
 =?us-ascii?Q?mhh+W8cwPf6zoltnY4BXb66kT+E4uzaX+0dgtFtquTrgyyz5F/GHbeOsin8O?=
 =?us-ascii?Q?b9L189qtHtYc8GmHynbN+ytZmDDgPckd1dT4wcBmufSd3SmXg01Rn/5e0OD+?=
 =?us-ascii?Q?35KD9LdYHbPqVZyUKdtG/9emV4Qf1h75IOB0DxzH5DJeBfbXq+okoSy7XqEA?=
 =?us-ascii?Q?8gYEPVvCvNA+T7Ga46jBPxLU6Zt6iW1ZCP1OgdYtKtN3hFSffHFi0cCiuJhj?=
 =?us-ascii?Q?4XfRwaCKQZUUE20lVg9hdaGBLJ0oExHtA90+GE1OPVGecrWy6MHCaEMCAVWA?=
 =?us-ascii?Q?ZIG7d7u6f+LL5g30w04qClbECBwJR6/BgriUw9QlrNXQYVUvZPtm8s8QmOje?=
 =?us-ascii?Q?WYQ=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CO1PR10MB45317C1FA7B7EF0229AC1B0397259CO1PR10MB4531namp_"
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 181aac7c-0af8-4abb-c942-08d91fbad041
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2021 20:22:26.6313 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L8phzJPHoaC2gtW9/Ijfw0azz5l6GC0A+CqKnutJrlkpBntoHzjlQaHc/P3erCLyYpAL7QS6NJlV1ZfGEWdldfUS230Bn6ZE+HK7IZMlMy4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1933
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9995
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105250124
X-Proofpoint-GUID: YmdqbUVOWT43lOctaXpJs-6Dhm3wEOyZ
X-Proofpoint-ORIG-GUID: YmdqbUVOWT43lOctaXpJs-6Dhm3wEOyZ
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9995
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 clxscore=1011
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105250124
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=eric.devolder@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--_000_CO1PR10MB45317C1FA7B7EF0229AC1B0397259CO1PR10MB4531namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Igor,
Thank you for the pointers, I've turned the corner on the use of hostmem-fi=
le and am able to use it now!
I do have one question regarding hostmem-file. In the VMStateDescription, I=
 used to have this for the contents
of the nvram (backed by a file):

          VMSTATE_VARRAY_UINT32(nvram, ERSTDeviceState, prop_size, 0,
            vmstate_info_uint8, uint8_t),

I've searched and I do not locate an example of passing a HostMemoryBackend=
 object; how do I do that?
Thanks,
eric



________________________________
From: Igor Mammedov <imammedo@redhat.com>
Sent: Thursday, May 20, 2021 6:00 AM
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: ehabkost@redhat.com <ehabkost@redhat.com>; mst@redhat.com <mst@redhat.c=
om>; Konrad Wilk <konrad.wilk@oracle.com>; qemu-devel@nongnu.org <qemu-deve=
l@nongnu.org>; pbonzini@redhat.com <pbonzini@redhat.com>; Boris Ostrovsky <=
boris.ostrovsky@oracle.com>; rth@twiddle.net <rth@twiddle.net>; jusual@redh=
at.com <jusual@redhat.com>
Subject: Re: [PATCH v2 3/7] ACPI ERST: support for ACPI ERST feature

On Tue, 18 May 2021 17:08:31 +0000
Eric DeVolder <eric.devolder@oracle.com> wrote:

> Hi Igor,
> Thanks for the information. I am primarily interested in ensuring data pe=
rsistence in the case of #1.
> As it stands so far, I have yet to observe any kind of write back into th=
e backing file. Just to summarize,
> what I've done thus far is:
>
> in erst_realizefn():
> ...
>     s->hostmem_obj =3D object_new(TYPE_MEMORY_BACKEND_FILE);
>     object_property_set_str(s->hostmem_obj, "mem-path", (const char *)(TY=
PE_ACPI_ERST ".hostmem"), &error_fatal);
>     object_property_set_int(s->hostmem_obj, "size", s->prop_size, &error_=
fatal);
>     user_creatable_complete(USER_CREATABLE(s->hostmem_obj), &error_fatal)=
;
>     s->hostmem =3D MEMORY_BACKEND(s->hostmem_obj);

backend should be provided by user on CLI so all backend's properties are c=
onfigured there
as user desires and frontend should access it via link property.
see how pc-dimm's memdev property is used.

> and then in erst_update_backing_file(), which is called when records are =
created/updated:
>
> ...
>     if ((mr =3D host_memory_backend_get_memory(s->hostmem))) {
>         uint8_t *p =3D (uint8_t *)memory_region_get_ram_ptr(mr);
>         memcpy(p + offset, data, length);
>         memory_region_msync(mr, 0, s->prop_size); /* for now, the whole t=
hing */
> }
>
> I've instrumented this code, and I can see the records. I've instrumented=
 memory_region_msync() all the way down
> to qemu_msync() and it makes it into that code. But the end result has al=
ways been the same, the backing file is
> never updated.
>
> I'm not really sure what else I need to do to get the hostmem contents to=
 be written back into the file.

see "man mmap"
 in particular MAP_SHARED vs MAP_PRIVATE

and there is a corresponding property for the file backend to manage that.

in case #1 no explicit sync is needed, backing file should be updated on cl=
ose at the latest
(whether it's graceful/or forced (i.e. crash))


> Thanks,
> eric
>
>
> ________________________________
> From: Igor Mammedov <imammedo@redhat.com>
> Sent: Monday, May 17, 2021 11:31 AM
> To: Eric DeVolder <eric.devolder@oracle.com>
> Cc: ehabkost@redhat.com <ehabkost@redhat.com>; mst@redhat.com <mst@redhat=
.com>; Konrad Wilk <konrad.wilk@oracle.com>; qemu-devel@nongnu.org <qemu-de=
vel@nongnu.org>; pbonzini@redhat.com <pbonzini@redhat.com>; Boris Ostrovsky=
 <boris.ostrovsky@oracle.com>; rth@twiddle.net <rth@twiddle.net>; jusual@re=
dhat.com <jusual@redhat.com>
> Subject: Re: [PATCH v2 3/7] ACPI ERST: support for ACPI ERST feature
>
> On Mon, 17 May 2021 15:01:02 +0000
> Eric DeVolder <eric.devolder@oracle.com> wrote:
>
> > Hi Igor,
> > I've been working to transition ERST to use the hostmem-file object as =
the backing store, as requested.
> >
> > I have the backend-file object now in ERST, and I have a question for y=
ou. This hostmem-file initializes
> > itself from a file, but in looking at the code, I do not see that it ev=
er writes back to the file!? Furthermore,
> > I don't see a "flush" type method to force writeback of data in the obj=
ect back to file?
> >
> > The original ERST code would flush/write to the backing file each recor=
d as it was created. I don't see
> > any equivalent way of doing that with hostmem-file?
>
> To force flush you can use memory_region_msync() on MemoryRegion that you=
 get from hostmem backend.
> But question is what are you trying to achieve with sync
>   1. data persistence in case of QEMU crash
>   2. data persistence in case of host crash
>
> for the former you do not need explicit sync as memory buffers should be =
flushed to disk by kernel
> if you put backend on nvdimm, you should get 2 without sync as well (see =
pmem=3Don property)
>
> just do not forget that sync is not free, so if #1 is acceptable I'd avoi=
d explicit sync.
>
>
> > Please point out where I am misunderstanding.
> >
> > Thanks,
> > eric
[...]


--_000_CO1PR10MB45317C1FA7B7EF0229AC1B0397259CO1PR10MB4531namp_
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
Thank you for the pointers, I've turned the corner on the use of hostmem-fi=
le and am able to use it now!</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I do have one question regarding hostmem-file. In the VMStateDescription, I=
 used to have this for the contents</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
of the nvram (backed by a file):<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; VMSTATE_VARRAY_UINT32(nvram, ERSTDe=
viceState, prop_size, 0,
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vmstate_info_uint8, uint8_t)=
,<br>
</div>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I've searched and I do not locate an example of passing a HostMemoryBackend=
 object; how do I do that?</div>
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Igor Mammedov &lt;ima=
mmedo@redhat.com&gt;<br>
<b>Sent:</b> Thursday, May 20, 2021 6:00 AM<br>
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
<div class=3D"PlainText">On Tue, 18 May 2021 17:08:31 +0000<br>
Eric DeVolder &lt;eric.devolder@oracle.com&gt; wrote:<br>
<br>
&gt; Hi Igor,<br>
&gt; Thanks for the information. I am primarily interested in ensuring data=
 persistence in the case of #1.<br>
&gt; As it stands so far, I have yet to observe any kind of write back into=
 the backing file. Just to summarize,<br>
&gt; what I've done thus far is:<br>
&gt; <br>
&gt; in erst_realizefn():<br>
&gt; ...<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; s-&gt;hostmem_obj =3D object_new(TYPE_MEMORY_B=
ACKEND_FILE);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; object_property_set_str(s-&gt;hostmem_obj, &qu=
ot;mem-path&quot;, (const char *)(TYPE_ACPI_ERST &quot;.hostmem&quot;), &am=
p;error_fatal);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; object_property_set_int(s-&gt;hostmem_obj, &qu=
ot;size&quot;, s-&gt;prop_size, &amp;error_fatal);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; user_creatable_complete(USER_CREATABLE(s-&gt;h=
ostmem_obj), &amp;error_fatal);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; s-&gt;hostmem =3D MEMORY_BACKEND(s-&gt;hostmem=
_obj);<br>
<br>
backend should be provided by user on CLI so all backend's properties are c=
onfigured there<br>
as user desires and frontend should access it via link property.<br>
see how pc-dimm's memdev property is used.<br>
<br>
&gt; and then in erst_update_backing_file(), which is called when records a=
re created/updated:<br>
&gt; <br>
&gt; ...<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; if ((mr =3D host_memory_backend_get_memory(s-&=
gt;hostmem))) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint8_t *p =3D (uint8_=
t *)memory_region_get_ram_ptr(mr);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(p + offset, dat=
a, length);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memory_region_msync(mr=
, 0, s-&gt;prop_size); /* for now, the whole thing */<br>
&gt; }<br>
&gt; <br>
&gt; I've instrumented this code, and I can see the records. I've instrumen=
ted memory_region_msync() all the way down<br>
&gt; to qemu_msync() and it makes it into that code. But the end result has=
 always been the same, the backing file is<br>
&gt; never updated.<br>
&gt; <br>
&gt; I'm not really sure what else I need to do to get the hostmem contents=
 to be written back into the file.<br>
<br>
see &quot;man mmap&quot;<br>
&nbsp;in particular MAP_SHARED vs MAP_PRIVATE<br>
<br>
and there is a corresponding property for the file backend to manage that.<=
br>
<br>
in case #1 no explicit sync is needed, backing file should be updated on cl=
ose at the latest<br>
(whether it's graceful/or forced (i.e. crash))<br>
<br>
<br>
&gt; Thanks,<br>
&gt; eric<br>
&gt; <br>
&gt; <br>
&gt; ________________________________<br>
&gt; From: Igor Mammedov &lt;imammedo@redhat.com&gt;<br>
&gt; Sent: Monday, May 17, 2021 11:31 AM<br>
&gt; To: Eric DeVolder &lt;eric.devolder@oracle.com&gt;<br>
&gt; Cc: ehabkost@redhat.com &lt;ehabkost@redhat.com&gt;; mst@redhat.com &l=
t;mst@redhat.com&gt;; Konrad Wilk &lt;konrad.wilk@oracle.com&gt;; qemu-deve=
l@nongnu.org &lt;qemu-devel@nongnu.org&gt;; pbonzini@redhat.com &lt;pbonzin=
i@redhat.com&gt;; Boris Ostrovsky &lt;boris.ostrovsky@oracle.com&gt;; rth@t=
widdle.net
 &lt;rth@twiddle.net&gt;; jusual@redhat.com &lt;jusual@redhat.com&gt;<br>
&gt; Subject: Re: [PATCH v2 3/7] ACPI ERST: support for ACPI ERST feature<b=
r>
&gt; <br>
&gt; On Mon, 17 May 2021 15:01:02 +0000<br>
&gt; Eric DeVolder &lt;eric.devolder@oracle.com&gt; wrote:<br>
&gt; <br>
&gt; &gt; Hi Igor,<br>
&gt; &gt; I've been working to transition ERST to use the hostmem-file obje=
ct as the backing store, as requested.<br>
&gt; &gt;<br>
&gt; &gt; I have the backend-file object now in ERST, and I have a question=
 for you. This hostmem-file initializes<br>
&gt; &gt; itself from a file, but in looking at the code, I do not see that=
 it ever writes back to the file!? Furthermore,<br>
&gt; &gt; I don't see a &quot;flush&quot; type method to force writeback of=
 data in the object back to file?<br>
&gt; &gt;<br>
&gt; &gt; The original ERST code would flush/write to the backing file each=
 record as it was created. I don't see<br>
&gt; &gt; any equivalent way of doing that with hostmem-file?&nbsp; <br>
&gt; <br>
&gt; To force flush you can use memory_region_msync() on MemoryRegion that =
you get from hostmem backend.<br>
&gt; But question is what are you trying to achieve with sync<br>
&gt;&nbsp;&nbsp; 1. data persistence in case of QEMU crash<br>
&gt;&nbsp;&nbsp; 2. data persistence in case of host crash<br>
&gt; <br>
&gt; for the former you do not need explicit sync as memory buffers should =
be flushed to disk by kernel<br>
&gt; if you put backend on nvdimm, you should get 2 without sync as well (s=
ee pmem=3Don property)<br>
&gt; <br>
&gt; just do not forget that sync is not free, so if #1 is acceptable I'd a=
void explicit sync.<br>
&gt; <br>
&gt; <br>
&gt; &gt; Please point out where I am misunderstanding.<br>
&gt; &gt;<br>
&gt; &gt; Thanks,<br>
&gt; &gt; eric<br>
[...]<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_CO1PR10MB45317C1FA7B7EF0229AC1B0397259CO1PR10MB4531namp_--

