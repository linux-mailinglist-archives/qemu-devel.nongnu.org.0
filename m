Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C454C78A6
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 20:19:18 +0100 (CET)
Received: from localhost ([::1]:57036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOlYD-0007GV-Qw
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 14:19:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nOlWO-0005tM-OS
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 14:17:24 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:13888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nOlWN-0000aD-1H
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 14:17:24 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21SIJK2p018829; 
 Mon, 28 Feb 2022 19:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=EpX2PTKiGUuOMk8pgTGFKZ1oxP0ohqvT5SxVirXhwDw=;
 b=gzQftVxpZqviitS496Vsj+eX/CziUPlE4a5QMfHVbXtrlD760aAy2WRj89Jwxo7GavXS
 MCRVDMMvFUY/4AlVdKA2wz3M31JXHI3nu/JdmR9zGmEhRssinoDY095XZp1j0QojlYTv
 yxucbwR+u0wza2ao9O+bv616PoKZ02mLkeR791oLH/d4Qda0Oe9r4wpKsaPS3gIvigd8
 IfR0abc1Mdncfss0v6ipaLZySSTdfczeXN7Be9Feqy1Agu7ADWpcqcxqFjyQnxtRopBC
 goqRKvl0KW3mzL0zNJjiSrmAiGY04/d0rAhIQejgMzLu/ouHCYoha1Zee+fKQwjKMR3B aA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3eh15agn8p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 19:17:15 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21SJFWLQ064094;
 Mon, 28 Feb 2022 19:17:14 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 by userp3020.oracle.com with ESMTP id 3efdnke68j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 19:17:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kpJUqDeamKxIYxFv1IRpAWygcz1LK2RYen/EFF+ZqNey/gpdRrlr5PO+8o5q4XsPV3U7dDHVmA/003qvDQnGmSJo2fielhxdv2UaTMpsXILw6MqXszbAqHkGb6o+ZLJLGh2duhtkT/iH1oZ16boPngl+PgsTKTKOpvzZVKyMzcoXWF1VGpqlovzWdeC9k/6tsOx4ousqB57F3iG/FNaottSF6eF02fkhlbxXGhuzD9s64SoVmZbsN1VV7ZeIQaI9xgFvNT2gHaF4JUMUUX/S74AOeTpfh30VI6gGGg6tTyeF/iF4SorAm+jVDq6OFv25sf86qCNpxcMTckf+fPGRlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EpX2PTKiGUuOMk8pgTGFKZ1oxP0ohqvT5SxVirXhwDw=;
 b=RPUzCKEkYwEwtOB7tQJVpEhklt5bkrtsaPuazvFfArrMPJYz8vLM0apZ2Ozv2ooiKh8fTnQsnj4cTQFx1f14YvQ67l292PCkmLYUkzKAG7JNfa78xcqJixqiJyKqRwzExgu6V6xpk2LiJO3jTG2xfJxRI/WaaREUsvdHTvRmjmPhiQvnMKbYjDkpLxb47b6TaoDfnQqXZ3qAaa4WnwZA5riBBWxuv+eN/L3JZ4NUnFJeQWwP0+w3/zhEUH8HHZ4wEQjg6nNueseqT6DTBZeby2hSwSb0VWEmpFAdmbpT3Y0C80F9jPZpGV3EM5YfUG01zT9623TEYw2o+/fiPdDOrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EpX2PTKiGUuOMk8pgTGFKZ1oxP0ohqvT5SxVirXhwDw=;
 b=HVrwtvMozoof2Y/dK+Aw+qHRske0XAXKPe/EnIpeEU3wWC/o9jE3HjUzepigYKaziynmPWGKUXvmS4alWrBEvyG+tiVApnKRL4CRBLGKPkp7bTOiN79G0VdIkkcsCEYjxNtkhSKrqYPZBDPNKbP5sOU7qOaevvnqilZeuY7AgMA=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BN6PR10MB1778.namprd10.prod.outlook.com (2603:10b6:405:9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Mon, 28 Feb
 2022 19:17:12 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a%4]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 19:17:12 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v6 09/19] vfio-user: find and init PCI device
Thread-Topic: [PATCH v6 09/19] vfio-user: find and init PCI device
Thread-Index: AQHYI8rouCqOkfSDPE6VDQXwTrNc86yeL/oAgAs4AoA=
Date: Mon, 28 Feb 2022 19:17:11 +0000
Message-ID: <91AF9675-73A8-4C62-A183-F91547EF3824@oracle.com>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <fcc3548397af6c548d46fdeb1ddeedc1c71f28e2.1645079934.git.jag.raman@oracle.com>
 <YhO2gARa4poEBSzI@stefanha-x1.localdomain>
In-Reply-To: <YhO2gARa4poEBSzI@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 55427f33-dbbb-4675-f4da-08d9faeeec1c
x-ms-traffictypediagnostic: BN6PR10MB1778:EE_
x-microsoft-antispam-prvs: <BN6PR10MB1778813D3EB43869FD66F20490019@BN6PR10MB1778.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mxk3DOMFaMulB60BmR1/eAod+tI3wH2RkNNH1aBtqpJwMsVXlT5TjkFfrphmtuDLCrnvtrsP6Hg+MMsnTS89+5k7r0YGIp96ou0DCV1vcaazziedojIIBjLo7JXE2o01KrUSe3cZRI5nO6cc8SsQT5OrStkBY4Qq5vg473rDKKJy8Xj5byr6RZwBoA6EAT7xkY5us2UyDNVxrS9gLreaB5vtQD7beM24h/0zHM2fnefcvVZxKEAWCzaUx0WY96jbUJDyAY68tOpfbSpaFVdwysHHIxCMkkQqsinzzdOvInoYxg2EoT3MiJ4Ti0G9scbygKPxpNOWtBZ+kpB7+8voW0p1HckKwJ25+tFiKhwpdH/fhrb+odz8EPFG4O3YkddqDICwlxr5l5JLoFbCUAeA/h3ePm0F85D2mAaSUlpnuAtJiOFRwl1+Cfb6rtUEoKfrMaJWDdgreoEa/76mf4eYIey/edcHHYxBExUJhmu04NU3BGGjEKM1Bsiy/m2eabo7immypq5ebgNGQrKfKD7yn0AD7nirMgJ0d1BLvR/KYHWePmCLp4tmqGNgnGjClEpXVDS0BfvGALE4o8psFgPoaXpmGgZvc26vQCOVrGUilAJ9IARQgsGhmuNPTL74ngx2ZjJerB6b/YI0IHOx2y1qMR/u4sr4gQsDnCRKk4SJDCqCuzianAsHdBt4IN07c91Ul29kwmvcNIwYgRpB/WbO22uyT3fG+q7880yZ6rv267M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(186003)(107886003)(6506007)(6512007)(53546011)(71200400001)(508600001)(6486002)(6916009)(54906003)(2616005)(66476007)(64756008)(66946007)(66556008)(76116006)(8676002)(66446008)(44832011)(8936002)(4326008)(7416002)(5660300002)(2906002)(122000001)(4744005)(316002)(36756003)(33656002)(38070700005)(86362001)(38100700002)(91956017)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?0z1UA6CrWWnEguDSYDP20PxKzuWwmeMLOm7ny9M+bqvJWc2Q1xq1FqN7Nb?=
 =?iso-8859-1?Q?/023wxfwQUF7tyIbLvddedmDXCARexfCJapdFhKdB0nISpH61ljqOL2eOR?=
 =?iso-8859-1?Q?A04n5jt7j9TLCFDsDuXpKd3ZN9EBL3rFEAQuSs79eaUSsAZJwbXrkCGo9v?=
 =?iso-8859-1?Q?Mum4ZvuO+9IArDDf68aQmiu7aeqyNpK6pCTkRrJFh+HuOXqYDPEDlgn/yS?=
 =?iso-8859-1?Q?2aj/HZSgdjYPS5JiVIxSQNnJMCMfUamw0XY8px7nGiawpCMzcMWqJT78zO?=
 =?iso-8859-1?Q?Scn9AIadj+2wgvPNJ4svgUMbScMCjzVYtaRmaiXuP6RHAO4vHNUiXSDmJo?=
 =?iso-8859-1?Q?mwQj1sSVZBk4ImUcg1z9vmoh9Fe4/Whiq/VS12PnRKxPiTN2xGOYzIwo4e?=
 =?iso-8859-1?Q?PL8V4qfnMmyJde83d2wUQ18B8h9FXQkmWIWSvvaZmuRJkEeiyyYy2HVVFu?=
 =?iso-8859-1?Q?/YSg+eO9183ZKBAWTP3DrbiGSTvBzVt4YQhvV+CmuVzZebpbDgISxk1ksM?=
 =?iso-8859-1?Q?J7jSGobM4TvwqFx0+VXkHGOLGc56cfibCrg3J4GSdQ5FtyHC5S0RlYSBTu?=
 =?iso-8859-1?Q?MZ3ODJDunSCd5vUbINQTE9ST/rLDP8WSFbzdO/Tw1DPWjbhbsNfV0qbIta?=
 =?iso-8859-1?Q?QEzpBGVc1No27IclpMfQjCY9TV1oz8n2jZQIKvVN64jugJY461NxQqy2Bi?=
 =?iso-8859-1?Q?QOh7U10hnI49HL9TWQA7C/tGP87/vi+Pqu8IzSwe/xuPCMBPCulaWAEac3?=
 =?iso-8859-1?Q?vyWP8EeFObcd6AyAteFGJrp2NxMCMG6y1EDMYrqiuzpgBB60ApCr3LSMUM?=
 =?iso-8859-1?Q?xefQ0AAzmloGx4F2TBJHlIGJ/gcyL0hha6OMYRR6UVleQ5qPhBEaV2x4ha?=
 =?iso-8859-1?Q?he0S0dN7Kphrg6HtW5FNbrNZEBh7Em5E63CBUehXj7Bjfd18I6qEhZ5nxo?=
 =?iso-8859-1?Q?no/zPqC31JeNUMKuol7fzektMQwGpr8qaRRbrIy/H3oO1NJN9m+F1MMNW1?=
 =?iso-8859-1?Q?p4lL2Oc45aSoQZ2W5lMApKXhZ10KuFodEAT2Ak88NxJSrAAQfa3Q/uVYNO?=
 =?iso-8859-1?Q?WMELT2bbw135IdzI3Oeb/FGZv1qkqF/KeRGlE+ippaHhEZ+CZ0TS73IMWR?=
 =?iso-8859-1?Q?0upMZd8iMdMH0KX3BCrLFLglzOYcXQlyUvfyNsL22GpRCuwZhUZFkvhSHq?=
 =?iso-8859-1?Q?jCGK+gBCgfbtOpptd4Qf0UFLVRgLaRg43j71ZjzfWOP+joO4ClpHqhoN1K?=
 =?iso-8859-1?Q?OEMYGbb0pGmosfakE3aIQSsiSeJexBszKxjyi3jXAGk+MDn6dBj0avZpPY?=
 =?iso-8859-1?Q?vexlw338FhR5cyWA+QnJkgtsaXdHARImX3js2ujcF4yH5Tr3tjjr8ldDjZ?=
 =?iso-8859-1?Q?lY3s+V/tg3Ea+7gu+qxCQhZdX6Wlx6MmcOMUEunJ8MTflaQ68NXu7GCChQ?=
 =?iso-8859-1?Q?Ll5eZiDmhYYUFouxrQtDE24TTtgpDed63GVfK9xQNw5+mM3HjSzbG7QSYQ?=
 =?iso-8859-1?Q?D/SpHALhn4gRZVc2tr2z3YzmJibiwp9fUNaBi7ZI0/VLmUiAa1S5mJd1oj?=
 =?iso-8859-1?Q?QJ09ePtDl/EFi/bEJ8ybl5Cru23e9DLuqxnmQa4u/hiyKDxAR30YEDrSu0?=
 =?iso-8859-1?Q?R/QbXnSFqGx3ra3lhagwxxV2/PRdcq35c6NsUjv4WLvfIlCtjCLNeNN5Ht?=
 =?iso-8859-1?Q?4KEutvJGwOfEjEnbrMo9GMAm++1eb3mwBrv0fL/z4YRTXbV/zkuIfN3j2W?=
 =?iso-8859-1?Q?E+9A=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <7260B456BF5F944497089940B7C14CA5@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55427f33-dbbb-4675-f4da-08d9faeeec1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2022 19:17:11.8867 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Re/xuiK9U58Eyx0GdhHa17yB/2ye6149PEyoJqWqpGkreZJT7PfJLlzFq76KsKfR8P5pxRnXalzHZN7LWEWWuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1778
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10272
 signatures=684655
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 adultscore=0 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202280095
X-Proofpoint-ORIG-GUID: 4fCYBNH5YOh5634_7KhKvtouLlGJOdDl
X-Proofpoint-GUID: 4fCYBNH5YOh5634_7KhKvtouLlGJOdDl
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
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



> On Feb 21, 2022, at 10:57 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote=
:
>=20
> On Thu, Feb 17, 2022 at 02:48:56AM -0500, Jagannathan Raman wrote:
>> @@ -221,6 +272,14 @@ static void vfu_object_finalize(Object *obj)
>>=20
>>     o->device =3D NULL;
>>=20
>> +    if (o->unplug_blocker && o->pci_dev) {
>> +        qdev_del_unplug_blocker(DEVICE(o->pci_dev), o->unplug_blocker);
>> +        error_free(o->unplug_blocker);
>> +        o->unplug_blocker =3D NULL;
>> +    }
>> +
>> +    o->pci_dev =3D NULL;
>=20
> Since we don't hold a reference to o->pci_dev there is an assumption
> about the order of --object vs --device ->finalize() here. I think it
> will work because softmmu/runstate.c:qemu_cleanup() doesn't unref
> main_system_bus and only --object ->finalize() is called, but this seems
> fragile. We should probably hold a reference to pci_dev and call
> object_unref() on it.

OK, will do.

Thank you!
--
Jag


