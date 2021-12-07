Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 052D346B50B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 09:02:38 +0100 (CET)
Received: from localhost ([::1]:45646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muVQq-0007bS-Sk
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 03:02:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1muVFX-00079G-Vk
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 02:50:56 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:37150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1muVFW-0006P8-CV
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 02:50:55 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B74gT1q019276; 
 Tue, 7 Dec 2021 07:50:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=Cnaj+jvk+b0MvS8joWMyRj2ujNH62oojL5QQWjwQCk8=;
 b=cyhzy5wd96Xh/Gal9chhyGMJtb1LDRwv61ocX5MppNt6kFcDZKHUve6YIe32377pd8Vl
 bS0lw/+yc9GIyq0unEtduFZw0XBnavmvxCVVDI2/gptQOKl/VpnN4FbYoRl93+j+ewG5
 LMGWuaz9mmS7RFoWpfORzxluUQAdWD8d59d/64YQTaIwO25L0VP4yZEsxsw5Q0Y1ad8q
 EATf3L8u3Bq0vMYedGEk3IfL23AtU0QE/Zn1B2eP7loFabDJyFQSzBOBXisF7jJEQJug
 Xo5QbdJoxFxhPGnNRBc/Hmh5lpnsmb4XrkyRSr+1cBQ06CPQCC1sdwjLchwKqLqkbRUj Wg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3csbbqmwnc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Dec 2021 07:50:53 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B77g499193718;
 Tue, 7 Dec 2021 07:50:52 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 by aserp3020.oracle.com with ESMTP id 3cr054hx7y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Dec 2021 07:50:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YjBqnCU/VhtuddKv/vXEsQbClSspWz15u3bQ1Zcy1syB6TprK9UfiMpjpXJzQ538R2fxLtvvCEuGJqLWwKSJILcMKiVNGaOFsZEyLkdRn51gdwm4dOe+cPJUGpsaOf42WuUC4FwTHtRBjKgmYr8fWbF2Qh9V5P4t7ojuJphvNOzOhCysdxLGHSIS6nEvuHwO+CSH7B8hR4xm7bD4FqK9RLF8HFxzhhXLZlc68ucJn5zcGnO2U0zVpP4jEs4NznZVuUTSJbp/GOVLEk4EWhk0pkOFWqJNH8Ez1k/2yOGw64CK7yFfBkwpIkaOaKu68G6sttBb5vQBv2UPHetkNox5Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cnaj+jvk+b0MvS8joWMyRj2ujNH62oojL5QQWjwQCk8=;
 b=Pc1gBl92SfovTmLpUXSqr7Gurt3z9zjCLn1PJX7wdjc/vRegFr+fw4nDGT0bVNbXYRPyoIM1NDhFmHT/a088FlzEniRL+inPbFMIn97+9z1ztFCw7igDC4+SJZDUe1o80kOqp9NMPM+nc1LebkIaar4oWJF0KH57QmVrgHk2K9yeCc4BCXP3dDAQqiSFpV3zCzrdq8GG1o9MHKFWjDG5Xs+sEnCZDipYGEcT07clymjajKHJg7T9NXW8OwY1OG4H+yFVaorndCCTgOU6p24nqb/G4Ha7u89OaHlRoJNVehbOWVxDSIUoxDANgpMA6Fr05n6Ofa73kiLezB93cDoh6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cnaj+jvk+b0MvS8joWMyRj2ujNH62oojL5QQWjwQCk8=;
 b=l9YhxRksYNDUGZVE8+scXnJqCHGbEbgjJYQqzTG8yoz/UPHO2uGvFRjWFcXkKuWtC4lLOEyPfVHbihS7jJwCULf08NG2K6uph/D9i/fPDGFXMKUuF34tjCCFEWTpslxWKijIv1zLGtfbbBQx/uD1JmBolXV+ZIEHrqrgzDswFLI=
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23)
 by BY5PR10MB4225.namprd10.prod.outlook.com (2603:10b6:a03:20f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Tue, 7 Dec
 2021 07:50:51 +0000
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::3c06:36a6:bab9:fffd]) by SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::3c06:36a6:bab9:fffd%2]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 07:50:51 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [RFC v3 19/19] vfio-user: migration support
Thread-Topic: [RFC v3 19/19] vfio-user: migration support
Thread-Index: AQHX0bovYrBFju3KCkKwA6jIX2wzbKwLigeAgBtQ0gA=
Date: Tue, 7 Dec 2021 07:50:50 +0000
Message-ID: <FC346C53-1F1A-4AFA-AC28-1B5C712E96E6@oracle.com>
References: <cover.1636057885.git.john.g.johnson@oracle.com>
 <fd19a5e8a491c63edbcc9882994cad22cdff9f55.1636057885.git.john.g.johnson@oracle.com>
 <20211119154233.6eb825b2.alex.williamson@redhat.com>
In-Reply-To: <20211119154233.6eb825b2.alex.williamson@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3fe74245-5151-44b3-ee62-08d9b9564a0b
x-ms-traffictypediagnostic: BY5PR10MB4225:EE_
x-microsoft-antispam-prvs: <BY5PR10MB4225651B871F709E6D15896DB66E9@BY5PR10MB4225.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T1k9T7WklhwAkwgtfPRVCOZqsQG8Vk8HlKJ8dATr0HJO2q13gsHaUT5N7dqHBFfki8fbewFz7RjEvj0y2Fzrl5dFdO2gT6U6GYB0aePIFRTOGrPLZlHH39JpbyGkQAcN/AL3sSkaby+Uccl9G+08+NQcfyNLeHbL95cbq83t6Os4Bk+i66re8iWbHUj8F3P+jeAfDA5YAv7Q7pVXz51S/EwSHWqOL1+mUEfktbdLagzpYcYxXFgXcOhWo9BUde8GUaWrUuXjuQpyyZ54LYYrboW4SMkE3sW6ZrHzl3UrKPzRdpzPi4DItER/i7FwkfmLj01ocwgmBAz62rCmB4lprF9/K8BK4e84ZJq7G7BNumSh4+rjgcIQQNEH9gCpuz6leHsiJl/gHwxwCWKkqJKgVbsF1D/fLUWe/XLPJTuxtyeBrbHEtobdPx2Y7hQ95zKcGr5J/lbO/dAeymlHlj/8V/0rBSnwedw7K0UMubQqVUvVnSx9FWEYTZwvZ47DQcm4O2ew0p6jRwgijBvkIkF0K0Cy+zrDPUzgOnch1joCdlYrH6jp9C7q+77EFvr6HoClAw/GFxBVMELz5901Mij/jNVUPKegWY5OGY+BGO/goOeUH+wBmo9tOjbbCDvXPMvq0I3PuGiDlo5mOaiHWavbgc24bNSHYF1gk9vLtKmu4+Pugfz8zR+gf7Ako/FI+jdUU/Kdc2S6fG5Ni4WAR3SVHP7OvopVxdfVnDKlJjWqM0o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4686.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38070700005)(71200400001)(6512007)(8676002)(66556008)(4744005)(66476007)(64756008)(66946007)(316002)(33656002)(6916009)(66446008)(53546011)(6486002)(186003)(38100700002)(76116006)(5660300002)(2616005)(36756003)(4326008)(8936002)(26005)(122000001)(6506007)(508600001)(2906002)(86362001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7EURtBAV0ISqRZ6BxM7fm+4SWRbZUBcvMpH/GOGiFVS6441Df8fsCnjB12zI?=
 =?us-ascii?Q?v90p8pzf1C+h+b/nAHrs1cA74yFpGglCqhVM7JullveiDP90MZkC483rIuoZ?=
 =?us-ascii?Q?fnsGmca426im5gtLHZYvrC+spkDGK7UqAO+BKxbK0rg4kzfLBijCti3tX5oD?=
 =?us-ascii?Q?56sTuec95NtracTgcuVLUsCq/ZZ4JK7p99uBxb4WX+xAOLpJ3bmriK4RzJJA?=
 =?us-ascii?Q?WE7ihZnqKQpBPP0VlVKeQsu2+Zb7ZxHBwFH4dO5EzwgNgyrE3VLSNPAdQ4FZ?=
 =?us-ascii?Q?DAspN4DFH+WN025woBKp3sCpYxqd3jty6PLxOKboz+RV26rqTQoYN5gMPw1p?=
 =?us-ascii?Q?DLp1lROfsUN2xq3aMNcxtO5KOj97MP5p406TCzN+651X7fu7D8YIw2TTwaYZ?=
 =?us-ascii?Q?0HhFTj5pOehdQakQwo1Y7WiZR7aN+zDMg7eClCeOXsnjpx1U9xfJDxc/INcq?=
 =?us-ascii?Q?QaQSSPJ9Ha3nWXTCpMeVcOnHSTwZluix/7FfBPtM+LPmTqZ2unYK21NoTaIN?=
 =?us-ascii?Q?lerWgPbzdDtIba1xGQVeuF5s416ubNlMp/x8EUcQpBGg71Q7KSvNNC4Z3gt5?=
 =?us-ascii?Q?lgbHnB4vZFNivWD6JHXbUzM9d00btSVrllDPHvlACYmi2yRVEyJzVJDuzRNU?=
 =?us-ascii?Q?y81v9KkWL912+pJLRzinrkiG1LGokP7KzQVU3cZsAkROEe7GvjSIBpcJOWaz?=
 =?us-ascii?Q?9kB56tchLqoLQ5WcCDCWfJhSw8rvu+z56+sryqpcb/Nniu0SbHSlTu8lzxCl?=
 =?us-ascii?Q?FcaeIBJSP7JA6sbZKiuD4fWp4jH5PvXeZEpwwtUGCIDmW7m7lmb9D42Jtr4x?=
 =?us-ascii?Q?fqtIHnXqvmk5Fh+ljd+ADZ6gqJHBz6gSUZECeIMn9gdfslXHP+ggc9qNjyUO?=
 =?us-ascii?Q?HP2ufWVkeCYovTSr7H1wee04m8ob9nkW2kYCnU47REbgrEHMH/TqIWl4VrUH?=
 =?us-ascii?Q?Wy/RY8UW8CZ5LxNQbFE/6YfTog34UGeL+1Okp6IMQe3+XjkKv4NfjlKf+jGc?=
 =?us-ascii?Q?DA6puImrHlKaa7HaJ5wlFlXl3Wl5YQuENjGLrzRCx5x1pj3faAlH6kR15/EM?=
 =?us-ascii?Q?j1mcsmA7OmSRrorJoDj9YsNqYe2y1/oO0s8d6tbO2aePu4flEmc4xMpD+amg?=
 =?us-ascii?Q?MOgoO4Iix2mO3XDO+4x20JUlFft58mDZJMrUjeS8DFpqCu4NutxwnD4W1bw/?=
 =?us-ascii?Q?dIRLKKrC569s/Jdn3ORZjQHw4NkfUKvjpSgZYYKvNYRbUjFGSyj8oaMKfIwv?=
 =?us-ascii?Q?iN036AHYyHZ2j3Lpqm+b36iJBjRI08h/Sw7J7Iq+ZesJEF7AUVfcBq49DpTv?=
 =?us-ascii?Q?onKPXyI0grwqhmT2XgYuko5mUuEDeWIhwETlXZNDgbBWNimcBLuP1j2ET81w?=
 =?us-ascii?Q?5FlNR1X1QGtMdKpxenyPO+WJLF9aZ/yPq9xMivsAfB/y9KkbY66L+FkV2gEG?=
 =?us-ascii?Q?cRpwmyVgiI/7CvyRyrYkimd/TCVI2ipdJXe6oZBh0IFnPzP8D17Ic0buhIIJ?=
 =?us-ascii?Q?9iooQfFWP5avDVqcm1pk+hhxJ8Px/k7tvDa3+XKFdfZ/oCbwnfzK6u0aIjc5?=
 =?us-ascii?Q?kbb7bIynVZpTddGhEe0agWSdFGJewxsYPxOHay+gk/pSvmoqFZ99zSIQAvPh?=
 =?us-ascii?Q?Eax1JvXUZZeqaKXjKj8jvWpK/AS4MvN/OnZnrPAd9b0uNPAX5cwYWgRATSCi?=
 =?us-ascii?Q?fts54g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6A005D391810F840A06A3D89E9159F49@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4686.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fe74245-5151-44b3-ee62-08d9b9564a0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2021 07:50:50.9476 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 84SLGOBDBeb9ZlrMZZgjPyfos8RBL91PDd5OL9ExPxa/rLF9bLRHzndBZCOzlUsRruqrn/0LktfFY+LzBdODLRioLWFW2MMZJg9LO2dxkms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4225
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10190
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112070044
X-Proofpoint-GUID: C_ISC4l-Hm6p8LBP6aKbv3t1Isu1GBhg
X-Proofpoint-ORIG-GUID: C_ISC4l-Hm6p8LBP6aKbv3t1Isu1GBhg
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Nov 19, 2021, at 2:42 PM, Alex Williamson <alex.williamson@redhat.com>=
 wrote:
>=20
> On Mon,  8 Nov 2021 16:46:47 -0800
> John Johnson <john.g.johnson@oracle.com> wrote:
>=20
>> bug fix: only set qemu file error if there is a file
>=20
>=20
> I don't understand this commit log.  Is this meant to be a revision
> log?  In general it would be nice to have more detailed commit logs for
> many of these patches describing any nuances.
>=20
> Note that the migration uAPI is being reevaluated on the kernel side,
> so I expect we'll want to hold off on vfio-user beyond minimal stub
> support.  Thanks,
>=20

	It was a note that this was a bug found in the vfio code,
and not a vfio-user addition.  I can add more commentary to the
patches.

						JJ



