Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BECEB4C7881
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 20:12:52 +0100 (CET)
Received: from localhost ([::1]:48350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOlRz-0001Iy-9I
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 14:12:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nOlQi-0000bs-W3
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 14:11:33 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:44512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nOlQf-00082D-Lw
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 14:11:31 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21SIJ3PE025510; 
 Mon, 28 Feb 2022 19:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=61cKqVeLy3k7wEnGCB8SlnT0OWIy3GxD63ESY6zAhzc=;
 b=dGebJ2LT5yXI+Uk3GlBkFka+uyaFeoxO359nWakweIlqAPO/N3AI61hxasO4iujABkNB
 qMaTORRv9q/QljAiyJdezt6kSY2pyzHpYoimy27/tlB7V4zYtH14dKUEswmaRdg1pHRI
 0VtZVi6hoKN0xAAO7McYUo3S3Npg2KwDj710aNxPZgf0Db6SyEn/0LcF80EL9pAWd8UN
 cHMYwN1PqP/amk8u74Qn9KsiTzDTjD69204lC2gI8ffKy/rIrYhZcA6BOwL7b8sqlB9Q
 iyKON9nDi8aML4JO/NzLZnzARJlS3fa7X4P0ZTZJyzLbg/LBQB1ZCvaWzI5kRPiHagjw 3A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3efb02nbmb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 19:11:23 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21SIjEBY146614;
 Mon, 28 Feb 2022 19:11:22 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
 by aserp3030.oracle.com with ESMTP id 3efa8cwvux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 19:11:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCJhAxW/avnp7n4MoNxSFxBGsr0lU2m6y2pjPY8r53hAEhzZUI4KL3yNDLRj9fhNQT1r+1UhDWvJwrlSJnxg4BK1d6mP7eRpb+iKAvIPd/mofafcuUnQJhxXYLKf51+Fs5uCM3zUcFsj6U1PLv/tffOH60US+QgmcV8fZOAna2guWQgNLVOgbxEUj1XThNo8N+3Bao+USJIARTX1PRVR+gGJjf03InH50niAuqzfrTe+FrAyolDueXlUyDiOzVsNIONp2UwPhCjo5Ksa5kcS/Fnu/2JyS6/977rJlBp1aUwDKDamNURxgb1KOc73isJqkdcR9r0FSPiWeLyAmmGLqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=61cKqVeLy3k7wEnGCB8SlnT0OWIy3GxD63ESY6zAhzc=;
 b=B90tYT0r1A0asKhE/VZtHxFasIKQAWVWVMQf3RSEzpJwAJtxfgJgIqZFFHF1Vac48DRccv6dNGjp20Ha1d6w8PF2Lfk9a8/D0PtoDqHfXVr+rXkRHNtsN7NdbQz+yeChDe3U5bhEFuKGG0/R9W15IXsNsKLMeazztbDJIOGfzBU37fTbmsCt2PiG0eUQ338TCxtkKlWyrl3QaonGU9HD83ogDfGttT5ciQS5a6F0p/TnM8vvqKrBe6Oyu72HCgbivjQAfDVFcjZY3rMlyY7/ovSWl0JUP85rbRN4c0pxVwlTlPno4A2zuOleeEu+IDICKcDZ09fm/L6g8fMehVkxtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61cKqVeLy3k7wEnGCB8SlnT0OWIy3GxD63ESY6zAhzc=;
 b=FpQd1OvthKi8MSlJ1Je1LEmw9mNToOrhQN0voTkTVkzjjv/NbLhjNXt4ywa/NNx5xQDOdmDC3b/JvkHJm2etGkeOZvNbJVLZCEG+s1JmpN6M5yqI9vNxC81zD5IGCknrCwoeMGyr1SPSGJUJg/zFleRJBcTPQAw1dTlyOvcmU7U=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DM5PR10MB1612.namprd10.prod.outlook.com (2603:10b6:4:5::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.26; Mon, 28 Feb 2022 19:11:19 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a%4]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 19:11:18 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v6 03/19] qdev: unplug blocker for devices
Thread-Topic: [PATCH v6 03/19] qdev: unplug blocker for devices
Thread-Index: AQHYI8rlxaVvdL/3Hk+KEC3FbT8qX6yeKFkAgAs9/AA=
Date: Mon, 28 Feb 2022 19:11:18 +0000
Message-ID: <BA4A579F-F53B-491C-8512-46B4C8913B9F@oracle.com>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <5acc81b16d52949a47cbcbfcc2eacc0e4f3a5687.1645079934.git.jag.raman@oracle.com>
 <YhOwGkAa7uYdS2r/@stefanha-x1.localdomain>
In-Reply-To: <YhOwGkAa7uYdS2r/@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fcf0ad61-9708-4300-069a-08d9faee1979
x-ms-traffictypediagnostic: DM5PR10MB1612:EE_
x-microsoft-antispam-prvs: <DM5PR10MB161222817CC0FB739391A87990019@DM5PR10MB1612.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +YFv40UeFq8G6/3YWY2bZQs8zHCcehPBoQKMpDpcm275F8bPG4ga1ii7w1BSXvjAUSbYu0UGmXfXXE6msIi4V8wvxdiLLLGFZWnvx99D8r/Rb9gQqssKEzYBdsAgg8ZP2F0FwI9SwFGQlvOrbRdoeCQxyc7akRaUBVpGZw1fol+pGAcA4RuANMgMvaYgJVzpoQA1YL69Buvc6Qc14P1ahoI4b5fzD46CYVELdiqaFQoKcRj6BACqJMMXtWsoiH75RRstBG6keEhNeEZI5UVP/tuN9+Rc7Nd+77yc/K58CPviFwFHJTcDSSl3w6cpBGODrL7Z1sfSsDXVVqqR1dMgheokTYeiOYZK42lXlMGnYGtsuGsS2Q8yoy4fSHsVvennuPuUUyZH3KsHiO9Ky5SRWUJn6BIz5YW32QtaAB7hbhZcT7JNmuLnwrBoRvdN8HP+boWizXqHGrPyFuJzypVU+YHEA2PaDkAjEUPNS1W/ZBv+1hZcKaO8eEvqAVAp4kuN83l1Mx0dulAbdeX7J0ECyIaVm2xVDUslxuM+1LVbmIB8Gx1O1ebopU82ow/4MeYL+G3gDuAPzwNZDsZJ3DDXDAx92zdkLdounFyLFmy812MyzdrbWfBZdLSUFcbkmuIMyHaHeE5LM/LPdCKXKimhUiqGpWHlopFRxCPj0rCJXhyRiIGNnZhkfD/+8SaFBlqUcV9yjqBWaiCdazassqlpkq2xaq+i0ypJlC5keRAdbHyV50QObHA2eZVHmEgWisbB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(33656002)(66946007)(38100700002)(76116006)(107886003)(6512007)(4326008)(8676002)(64756008)(66446008)(66476007)(66556008)(4744005)(8936002)(2906002)(2616005)(7416002)(86362001)(5660300002)(83380400001)(186003)(44832011)(38070700005)(36756003)(71200400001)(6486002)(508600001)(316002)(54906003)(6916009)(91956017)(122000001)(6506007)(53546011)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LwZoLNWMHkzgix89+x2SuGOhMXs552HqfAfEKOgRzqo11Jf1gye9ajCzWdbH?=
 =?us-ascii?Q?bvPJc6enhzCvK9sDtmHVeNoM8j5R0Tn8uABPL5XsIO9IJ0RmA4e0gx9+ordp?=
 =?us-ascii?Q?vHGQoYkbXd2903+S6bC9IMEa9LnF4fsdJm6fu5D6td+cyo5NmqqBClaSrvWv?=
 =?us-ascii?Q?yZIlI9XQWqovGSIXbcbIRqQggUyXfK1qzB5dzq3jF2Gr3A8DdC4tJH2psczj?=
 =?us-ascii?Q?aORJ6TsNaj3+02mc31Rj7FdnQMkHKb7Bq1Egs4Zadz7FCeQKlN7b04NSjlxE?=
 =?us-ascii?Q?jcg25fT/pos+gp58U4qLIKz/anBRnX2m4jmOLNzWcKtk1ObDkSWp075hml3P?=
 =?us-ascii?Q?djAoKHLIltt6uCs7TbSI3pQ7tmjHfhSFRhQ40427tX4y1mTO2jO7S6HC5Orc?=
 =?us-ascii?Q?nAzyqH3OfMEXxIRG1hd5uEOY4bd21NC7BuO0j59r3cKO4g9jPQKPs1daoiu0?=
 =?us-ascii?Q?Vf6z2NroHEO6Np/CqOqr3mjAT8zEnQR6QfWTDDBvWwbGvwZCYqV5zqUvZAzX?=
 =?us-ascii?Q?45XC5YQdVBVvaK6VyK+fhNto4+masRCc2t+2mLbtmtAqcXvYMmlFmmSHbd/T?=
 =?us-ascii?Q?xgZWv7IEiwcPWlqfSpdxogS9sk/e/6tlDa1HgAFSnwIMhZBQWkKYCifANo33?=
 =?us-ascii?Q?nxVL7Bizg1iiJT2GhRAFE5VAIPWeKJv3IAZqiIRtDaBewpGwf8taII32PxYq?=
 =?us-ascii?Q?mRImI/G7p1FLr4TBGnQB02uKv07N8OxFNT49wPd/PtV2HwtcsJBPgUvSNjSK?=
 =?us-ascii?Q?xoEqAwWTLfADbJ8xJjNkenMa9S4eXKnYFAuOXZCDdGd2+IEcJLryeEuMuqRU?=
 =?us-ascii?Q?BmPahPnoTT67m07LCMAilr6kDB5R2wxxSh91T6ZhrmwFo7cUu1xx3UfNpSz0?=
 =?us-ascii?Q?05YEWCQgM9k4JUFXylk452fLHgZ4hhs4l4GRq2XjA9ggn8x8T9D3+w0DP7SL?=
 =?us-ascii?Q?tCk4Dsbr4OqD/sugoLFsbNHsVTiFpymQcSE+FpxYqiBhuJ+9bty+9SnqRVns?=
 =?us-ascii?Q?wDpx7w2XH8/iFGyGihKdVg1+CIw1S62NOsj3waZ5BTP2ViNfQXAG3Q9h23K6?=
 =?us-ascii?Q?3Id+WgqhZ6G2aYEH71MiaC+wyziYrzWj3nIp0txAO6+U+ijGcBN+zZ/huBsR?=
 =?us-ascii?Q?UM71R6udkv0CS84TvU67/l5vn8+3w4Rtb3/mnXHY3q3KhEDi9hLy0yNo4A7U?=
 =?us-ascii?Q?VvJke3izqSl2PptfelFzW/ucKwH+QhX0ttjFMeNFDm6bPovu/jH5DWTHNnk3?=
 =?us-ascii?Q?gfSkn84lzyKYMhpvp7/B3Rlx19lUsyAHl/e9Yea1UYdqiuJriDx3faDMx3mB?=
 =?us-ascii?Q?/sXo3omDjbtHBSMNbmJ7HkitmO4hg3VLO/DgaW2LAsSElsgLBOs3qhNHC+Rq?=
 =?us-ascii?Q?cCYv3BLDIbrABaOtTVmJAYBuPodreFKR2ufqR6X8BpPNoQ9eHN4jQAQ0oMML?=
 =?us-ascii?Q?jTobVECWuF82u2QHtcZeDOz5SzpOzbGwAk7D8n115Zbeel+8fVTHl0Pa9CNc?=
 =?us-ascii?Q?KxU5lPrJsduZ1RSOXaEnKCy4w5UfF1sVyRlKeMH6bbD/GMAH/w681//Ovdp9?=
 =?us-ascii?Q?/B99RRON24Sqf2o4CynMzIbgf+aLIHTw8rjLpBcs/wtD6JgrAnbbahAu1vbB?=
 =?us-ascii?Q?vAupP5dNWBISRFWV961SrK2Y6xslmv4V3oESJmrZKmjSLk4rrEFOAK5BVuS+?=
 =?us-ascii?Q?aeKQ4g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <82771496B7D6B041A63FB4F3D9AE8A81@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcf0ad61-9708-4300-069a-08d9faee1979
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2022 19:11:18.5064 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /l0CBtIElhNuyJw/Xhz0snFUBlx27iZrKNKzbYOq25N0nbHF3411LecWVtAbkj2g1bIafH029uBnVxn5jtiLbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1612
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10272
 signatures=684655
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 phishscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202280094
X-Proofpoint-GUID: snG5wrS8GUz87axFpkvbtHAjAvtSUZS3
X-Proofpoint-ORIG-GUID: snG5wrS8GUz87axFpkvbtHAjAvtSUZS3
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
 "f4bug@amsat.org" <f4bug@amsat.org>, qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Feb 21, 2022, at 10:30 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote=
:
>=20
> On Thu, Feb 17, 2022 at 02:48:50AM -0500, Jagannathan Raman wrote:
>> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
>> index 01f3834db5..69d9cf3f25 100644
>> --- a/softmmu/qdev-monitor.c
>> +++ b/softmmu/qdev-monitor.c
>> @@ -945,10 +945,36 @@ void qmp_device_del(const char *id, Error **errp)
>>             return;
>>         }
>>=20
>> +        if (qdev_unplug_blocked(dev, errp)) {
>> +            return;
>> +        }
>> +
>>         qdev_unplug(dev, errp);
>=20
> Can qdev_unplug() check this internally?

Yes, I think qdev_unplug() could check this internally. Will move it there.

Thank you!
--
Jag


