Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D52350E73E
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 19:28:34 +0200 (CEST)
Received: from localhost ([::1]:52232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj2Vl-0005QD-1d
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 13:28:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nj2U2-0004M1-9y
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 13:26:48 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:39898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nj2Tz-0001Ap-94
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 13:26:45 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23PFpXRf025669;
 Mon, 25 Apr 2022 17:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=ep+mzbrGDizFFkRwsv9v1QQevVykFzCX4d+5xXS+Bzc=;
 b=cumXBrpGwUTGCjZjZepzKIZCeI1bTGsieqnAhnBXFswi5YmIt4JANufRrYwd1EsYuLwc
 fLmNASRE0+GCngLqjmYqKdwdrEBJ0IJ5L7JV0Wz6vBRE4AhOF+NIuaENSpUVy7Cez+GA
 QM8iKPHprNFXqhadhloL+VfymP0QyDxJN8nUAOA0bmBig7D73ErWkT0Wnf0di5VjXrFy
 Kxq6sIb+TVx6UKB0I6PO1GuQeCB/zJPHhIui0LmITcp4hX/B9jd8Cd/CPCj4rt9O5h7I
 iV255Z9fyOIY9oOelyE1L2A4n437Cegq5aL3/jhuw7ugBcbzNWiqYMLsXwt5PWAGd8hA XQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmb1mkwm8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Apr 2022 17:26:26 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23PHGIK6015913; Mon, 25 Apr 2022 17:26:26 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fm7w2tqq8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Apr 2022 17:26:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AJkWExMl5Mzr5aW2sMux/99wyrzVRygZhmtd4+/kmbesXCdiSdixmWFu1Hzn7P/DvXO27Aq5oUFPyN82X2iYk/Ne21OzyJYTbYlhinqeIUdGl6TPNdvSEK7GCy6u9mvbCtTX+4d9M3hcvlYJMtkHXKc4W0Epr0hx4SnnVx9CQzsrtSWSe+9QXKbOza8kFH4JuWII2CSCypaskcMxOLYR/7kXlNlm8ZRTpyviVHyoHEWodVJx2tlA6dcLsEfaUgfanOwvUAbscG78k0Spy4ofkvZoUDfupYPViDoKAnTILJF6CrcT6B4EnoakoPlN8FXdhRNtKN8K5tEG8tKt3He8cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ep+mzbrGDizFFkRwsv9v1QQevVykFzCX4d+5xXS+Bzc=;
 b=STNVyZsbFvKXr+qguRYYIRLQ3iTjQqC8DzGz3x+A5LzioQoaW9QJzXSh3Bqjl/qVNWkRb2A0MDdIuzVfH5gLcIYFjafAslehB6wzp/RUBeMm1R8fMxfPjrT5SsRDGqUom2EjdygG0JH49IT4BYwKpmtyXS/nOiFdczEwkElZcOkcSoPja1mux5u9LnQrt0pNxjdbGeSkqbPAn7hVIuJTdY/KHj3NKpizgdqAFPbm3pCkHEBlxpqYUVy8crLahu4/m3TNlcbwn1t+1yUvkUQ8YV/wsIx5NMcvvcbu8ryRx/V6taKjAXBnJ48y72UA14CY3QGfAUxSCoZvJSwmE1ht0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ep+mzbrGDizFFkRwsv9v1QQevVykFzCX4d+5xXS+Bzc=;
 b=JA/fAM9Z7/eejr5bve/nu1G7eGErx8BKbiKKNHGfy0HeXOQDpfO3gdMjEzTgWjsvO5XG7d6RjIRBloM6iSFHp+fdJ0NTwjYs2W4PFGP7wByDYImGEnHCPWuY0LERS6NrJEMceGIjVSCmJDryzKpRqGZiNFZzM2P11twSTt5aZgk=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BN7PR10MB2497.namprd10.prod.outlook.com (2603:10b6:406:c9::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Mon, 25 Apr
 2022 17:26:23 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 17:26:23 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v8 12/17] vfio-user: IOMMU support for remote device
Thread-Topic: [PATCH v8 12/17] vfio-user: IOMMU support for remote device
Thread-Index: AQHYVC5hP+b0lxyaWEa1TGZcvM2cNK0AZjaAgACEloA=
Date: Mon, 25 Apr 2022 17:26:23 +0000
Message-ID: <CD924833-E396-4DB2-A99C-B188475AF4DD@oracle.com>
References: <cover.1650379269.git.jag.raman@oracle.com>
 <2a42664b61cef7cdd44688679b60a8c6c397b075.1650379269.git.jag.raman@oracle.com>
 <YmZqhRsiQk8SvI0n@stefanha-x1.localdomain>
In-Reply-To: <YmZqhRsiQk8SvI0n@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f9d43f44-0388-44b7-9c99-08da26e0b87a
x-ms-traffictypediagnostic: BN7PR10MB2497:EE_
x-microsoft-antispam-prvs: <BN7PR10MB2497EFD1D1843D0870B8B82290F89@BN7PR10MB2497.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3KI7VhAB/WzT2koVLMVAVPxs7FFClZ561RjCbFi81nYdUzu7+LcM2Nvh/8SvPFkd/WZrRTWhYnVUZi1URsZ6d/O9lsI/cprimEHlYIzqbs4PsmCjnXpsm4Duviiy7z2Qkps52okUQ5C480zuspGangkhwpeqC7hwGNGLkijh0agLyLoKJNdcMg8Zpk6zEzVvzRWJC8zTDBjb3SbG3cMFpwevnjTqFcl6lqOzWvgSrIp6HvhxEU2bagbLhzwD41imfwXdrh92jfpI1P0HEWkVpLZCVu6m+l8p2EqZgKXoX6AjTAvd6vJgsB2tooXWWdIYW4S32k9s+XpqzK42EJa/t+VKNbwfuqDir5wKDG4TOmuJqRBb+H2NUldumcTycKncQFfBQ1ZS75xLhn8ye0+reNcKFik0RIJyOHa22citoipxyFLiT1dBgY/n47uPaer6GOz8Z8NYFnKsAoOxcJByu7h0fT5eKfo84XpxNZpgs/00ron5AMRsu1ttcjTMGPKDu7iVgFURP0BpTsO0Xz4+zBgS76mc2B5XOAWwn9V6/hCA/cxQ04GR5YRmhNa6LJ+Ge7vHTxF+zGawSzL+OZr2BN4175bsOrnVfOXVKuqQrXzm2A+WypNRDyKCFjSykttiG8pAoaZrIXL5edgKsk4TNMxyfgwOKaaUq9b2ZdChkmWoIH2niAiNo5oR6k6wtNC4KvJ3qK4Arv3ge03BwR+z0M1oIoguDYdI8GM5KN/MYj0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(6486002)(7416002)(316002)(53546011)(6506007)(8676002)(2906002)(508600001)(54906003)(44832011)(6916009)(33656002)(6512007)(122000001)(71200400001)(2616005)(5660300002)(66946007)(4326008)(107886003)(64756008)(66476007)(86362001)(91956017)(76116006)(66446008)(66556008)(38070700005)(38100700002)(8936002)(83380400001)(186003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?2+Jhg0P2SobbU+lNayg9Ohcjdt1n/P0JvQKeTRFHT0TXb1HuSSa6Lpvp07?=
 =?iso-8859-1?Q?ETz3kCOZTxR2+QlzmAMgBHiWfNteKeFyN/zKWMo/sipC/NlSZT9XL+ZMdd?=
 =?iso-8859-1?Q?dlIdgz+lXOc0VoEoFeMVFGGkPPHS5tuY7MSs8GZh6wJ2kfeF7eu/lsrZ9V?=
 =?iso-8859-1?Q?t/uCdHvtJ1qY2LqqLnW0eIp24AuBuW7qREWNK7kpR6eP8exImYNtQVq+V6?=
 =?iso-8859-1?Q?GyT6wy8yhrePGwARMy7bLihCO/uozbnZX5G/rGYe9OLg6c/KxL2MLhsxad?=
 =?iso-8859-1?Q?T3ZVJoqYYiV5ckA1Yr8UpjjNXEDJSikt0tDBKwkHezY21Bz7yP7N8c5VnP?=
 =?iso-8859-1?Q?OpqZ3iJvAmS+8wFwfYTVP0OpAqqsQRuuS6werPi0+dKiDBwqXDEw5KS4Zt?=
 =?iso-8859-1?Q?XR63DoH6PAsjVfy4HZvh0QhDhljW+q9NsYTxFKWkG+7yBeQyjUdrkDCuqX?=
 =?iso-8859-1?Q?5h/bFoxQtEQRJ1WkwQevhjIoUnV9dtieRhRAfjiJLJ8T3II79V331csWB8?=
 =?iso-8859-1?Q?/DZ5tGHDDWVZ/CObLOvaduDshRLZERNG3H1ZATSEdWU/RKfcZdwB1SJM5y?=
 =?iso-8859-1?Q?VnRahhEqRXAy0UG+rwrU0RHd87jwfbLAYvrzMVCKO4I1vH5RafQrMQUTQe?=
 =?iso-8859-1?Q?pg7qfkTw8Yfm79SzMC7XmzGXKExjMzCHHRzizFoSjYV3KtVwkwQX56qH5F?=
 =?iso-8859-1?Q?Q6biF53KBvVB85gvQMPdinQkWHRmuruDyVvTbzqCTmMrlS7nSTX8Ey3c76?=
 =?iso-8859-1?Q?FQQIz3wBdhU7egrgdT2ZXoRydf6wLd4lSXV7fULbCyJ4BTdg09OqH051Id?=
 =?iso-8859-1?Q?3TjMhiuz6Mkg0ZtDP1oJgg/DIYk/mXtKyAcugJWtaQfHRtD9veGSKs8Zih?=
 =?iso-8859-1?Q?ZOr2QX7k+fL2wXJNH5Li2s7RzC5adHLZE8gndGagLjUL60fD957jIyL3Jf?=
 =?iso-8859-1?Q?lArdw3hvtvCBW+I+TCUTpaSjwhM7WQd+pqYbdAcB4/t8bqyKKnhdM5iRFP?=
 =?iso-8859-1?Q?J1anNWC5Cj54KjXyXYfGhVzSyI2HfIK7e9HNDvOqE8wVx0+3MX5CbEShO/?=
 =?iso-8859-1?Q?ab/mRyxzkcI31SNlHbodfATQehdZW3R7UOKqnmBz22LratqdezntVuVCN2?=
 =?iso-8859-1?Q?c6IL/ozZ21NSwTAxgpBRk2kt4CiKLjY0A5WHpiJFGv/3aMDJX+QfTJ8rHl?=
 =?iso-8859-1?Q?i9+u4uEP96kkz+fk83tHJUE6AoWpfsBXzLeWfe65aWjezjOVMrCyMIt7AC?=
 =?iso-8859-1?Q?GrN1VYphLaiqHYgOwmL+dkLWSpo7LDJJg/iYsHHv7bkiuE3bMy+LlWnIwn?=
 =?iso-8859-1?Q?6V8sp32CoO29k+xyd94RUYDEYYEBc+4wSxnDXAkSjgX5eSJrsthKUSE1xo?=
 =?iso-8859-1?Q?L9dizAqTeMhFifXmEBsNyzdjPsGMTk5g5zV8oBJw3aB3QQzrER7x3M1TFL?=
 =?iso-8859-1?Q?weOD7mK5APW3ULqKx0CpMm8UIHukOJ51HpiX144vbHJ4U0yJBW8sIKDtVw?=
 =?iso-8859-1?Q?Ng1p9x4lUd4oo3wJrDY7Uz9H+a/G/G9xKaoI3lkwgjMzH1hGV4Ccdmi2VW?=
 =?iso-8859-1?Q?iAfDAYijXWboXnMbhP/LjMOL8tHgu/BpGjD8JFF+rl5OHoCEwQ8L4FBY/R?=
 =?iso-8859-1?Q?r1yljfFVVevFTymTrqH4ntz4OymzL0BeGSPikjtfj58rIw49r87RFqXkKy?=
 =?iso-8859-1?Q?HWQx+ZRLh3+ClbYspwWEIO6s+v0UGUDyUjQHGVKWbn48XIq2JrE2rREP/f?=
 =?iso-8859-1?Q?GXF9Na7TOvbTOSZ3hloITrg/cJwHhkAUX9fR7lVZk2UmvNIwoU9ohPeZvS?=
 =?iso-8859-1?Q?+dI3KXb3PgP1fGbD5IH91SxlYVhIbyDKWXBfYGAeSvealNXJSSm6?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <D422CA9A5345BD4BBCEEB638D0D4E925@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9d43f44-0388-44b7-9c99-08da26e0b87a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2022 17:26:23.5607 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j68qAJhYRlh6I+uV3mMGVOmvHbtV3FVqc9pkgtWYq332tUhKAwbxMIvPQxlv1xZYSvuRVv/U2HDhFPUJMMOl7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR10MB2497
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-25_08:2022-04-25,
 2022-04-25 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204250077
X-Proofpoint-GUID: YyM4RWgkbdYV-cAamaD1piu6qM_hZDDk
X-Proofpoint-ORIG-GUID: YyM4RWgkbdYV-cAamaD1piu6qM_hZDDk
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 "thuth@redhat.com" <thuth@redhat.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 =?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Apr 25, 2022, at 5:31 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>=20
> On Tue, Apr 19, 2022 at 04:44:17PM -0400, Jagannathan Raman wrote:
>> +static AddressSpace *remote_iommu_find_add_as(PCIBus *pci_bus,
>> +                                              void *opaque, int devfn)
>> +{
>> +    RemoteIommu *iommu =3D opaque;
>> +    RemoteIommuElem *elem =3D NULL;
>> +
>> +    qemu_mutex_lock(&iommu->lock);
>> +
>> +    elem =3D g_hash_table_lookup(iommu->elem_by_devfn, INT2VOIDP(devfn)=
);
>> +
>> +    if (!elem) {
>> +        elem =3D g_malloc0(sizeof(RemoteIommuElem));
>> +        g_hash_table_insert(iommu->elem_by_devfn, INT2VOIDP(devfn), ele=
m);
>> +    }
>> +
>> +    if (!elem->mr) {
>> +        elem->mr =3D MEMORY_REGION(object_new(TYPE_MEMORY_REGION));
>> +        memory_region_set_size(elem->mr, UINT64_MAX);
>> +        address_space_init(&elem->as, elem->mr, NULL);
>> +    }
>> +
>> +    qemu_mutex_unlock(&iommu->lock);
>> +
>> +    return &elem->as;
>> +}
>=20
> A few comments that can be added to this file to explain the design:
>=20
> - Each vfio-user server handles one PCIDevice on a PCIBus. There is one
>  RemoteIommu per PCIBus, so the RemoteIommu tracks multiple PCIDevices
>  by maintaining a ->elem_by_devfn mapping.
>=20
> - memory_region_init_iommu() is not used because vfio-user MemoryRegions
>  will be added to the elem->mr container instead. This is more natural
>  than implementing the IOMMUMemoryRegionClass APIs since vfio-user
>  provides something that is close to a full-fledged MemoryRegion and
>  not like an IOMMU mapping.
>=20
> - When a device is hot unplugged, the elem->mr reference is dropped so
>  all vfio-user MemoryRegions associated with this vfio-user server are
>  destroyed.

OK, will add this comment.

>=20
>> +static void remote_iommu_finalize(Object *obj)
>> +{
>> +    RemoteIommu *iommu =3D REMOTE_IOMMU(obj);
>> +
>> +    qemu_mutex_destroy(&iommu->lock);
>> +
>> +    if (iommu->elem_by_devfn) {
>=20
> ->init() and ->finalize() are a pair, so I don't think ->finalize() will
> ever be called with a NULL ->elem_by_devfn.

OK, got it.

Thanks!
--
Jag

>=20
> If ->elem_by_devfn can be NULL then there would probably need to be a
> check around qemu_mutex_destroy(&iommu->lock) too.
>=20
>> +        g_hash_table_destroy(iommu->elem_by_devfn);
>> +        iommu->elem_by_devfn =3D NULL;
>> +    }
>> +}


