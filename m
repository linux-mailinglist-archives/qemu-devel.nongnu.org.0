Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A45478341
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 03:40:23 +0100 (CET)
Received: from localhost ([::1]:37672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my3AU-0000NE-3N
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 21:40:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1my31v-0003td-EX
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 21:31:32 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:29056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1my31o-0000wk-C8
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 21:31:29 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGLE5PW012922; 
 Fri, 17 Dec 2021 02:31:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=R9KNSPnFTzcINkSKbEKcomP0/dWNnM5mgi6ZdAtVzMU=;
 b=MejIzXqzMLnGGjwK16YXnL63VUC9b1+K3aXTrTd0yWkyS5L0csWsEdRgvuJwhFOtpWyI
 wewCWJaWjH/9C1G63i3qOjEKKulE7ojWt/P7sZfFo+Fh7h9wkUYZZtx9rNADv+LzV4+Y
 UStglPMayhAQ550LI/vsufD6/blL/lT3Iz+MtZ4DTWixrSzxtLOwyBPDE1ITkd3Dezil
 Pa4H1vTtmMOYr3FIGsMg3OhmPAEAP7ya9KVBdDj6Yg98SddrtA7FQsEaVrq6+2YVYgqy
 HpcLZAKxHkyupMi1/O4mwFU6V49u5NkejAvHBQlijyMIJCbBV9YOz2ysYmG7UmrqFfN7 wQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cyknrmgtc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Dec 2021 02:31:17 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BH2GF58109406;
 Fri, 17 Dec 2021 02:31:16 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
 by aserp3030.oracle.com with ESMTP id 3cyjuauce1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Dec 2021 02:31:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UMgmsF1VdRVBxNiTDMhVnVvZm5P8zQEuAC1Ws9FvPK7FMS+uIXkokQZY1LXY7RzXYf2uueK7+xWRTXSJiQ8UfNKEpVpF4UUb5ujqHyDgGDOPOsKDOGCQI0SBWHp8iWxCmPlhnIeQjzvfOHRlh05z5BFNrNrARkL6xoiAK4XELFyjlmgKoCbS2y1yQOxh5YivxVGzdxHiXEoWy4Os4YIKa+H0mdhVC0ydVrxyEtqhh24PBlEUSQPFtNW9KgPUHY8+rmK+6TcP8jZwiyCb2FnqRfaQfvWIRXTZz//POMiaN5PR5eR3m/oKWV0ygDjmOaKOv7Y9+O/XDdGQprHjZxHMSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9KNSPnFTzcINkSKbEKcomP0/dWNnM5mgi6ZdAtVzMU=;
 b=baLtDzDNWkkRB241hkIonRGDUq1WepmwG2mW2t+K2M7OppVk3rRwdU2N63L2KBf6Ed/ZtZ9dW4AF2arQuNMAb5f1BcHJKliF57wsNu6TZIMOTaUqYsMP7FtwWXLcwDJ1ASBKFXxT5Lpb4gUDqwRAhsZkCjgOcfTPqkhwjNR72e3bHXSmfsOkEoF2MepFwuwi0orX/2GWlZoHl9dcwDjP+ua4okn25vqC3R6dQemxBgElLQUEa9xi7CPug+s27rTg2w/6e5jd8m6bka2uqeSELxevr6F5/OWdVC5jxLib+1FMB5QdLFtVGdSaRxht5BQtxO2TQIcLD0C3Hje4kEm4XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R9KNSPnFTzcINkSKbEKcomP0/dWNnM5mgi6ZdAtVzMU=;
 b=mFu5vda7nUASz5Gjvs12r/dpTm2GkS++CQjA8C0daQKihFCuTROKI6mzeigRkXoFDwckMKTruqoxSj7Wk6OVX2+924Pyz9olNBmNkluEhpk5PwUlFM6Y7WEvwDkPcKPje+OJVP8oKMPIK6eCY9zl0iXqlXBMVUruAiMeEWxxYTk=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB4368.namprd10.prod.outlook.com (2603:10b6:208:1d6::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.18; Fri, 17 Dec
 2021 02:31:14 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d%5]) with mapi id 15.20.4778.018; Fri, 17 Dec 2021
 02:31:14 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v4 04/14] vfio-user: define vfio-user-server object
Thread-Topic: [PATCH v4 04/14] vfio-user: define vfio-user-server object
Thread-Index: AQHX8YAohLArQJeUR02z+A4gatAUZaw05A4AgAEVQ4A=
Date: Fri, 17 Dec 2021 02:31:14 +0000
Message-ID: <62537D98-BE2F-446C-9596-34266EC3D535@oracle.com>
References: <cover.1639549843.git.jag.raman@oracle.com>
 <22b0d82a54d53043323bda2ae0b409fb54cbf007.1639549843.git.jag.raman@oracle.com>
 <YbsN3CLL827zMvna@stefanha-x1.localdomain>
In-Reply-To: <YbsN3CLL827zMvna@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a2067dab-bebb-4dbc-c328-08d9c1054bfd
x-ms-traffictypediagnostic: MN2PR10MB4368:EE_
x-microsoft-antispam-prvs: <MN2PR10MB4368AFF7A32AEF1A1552689490789@MN2PR10MB4368.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ivMAOaOn7dnR0ccrPoR6fiPrGCr6RmDoFYFQOH4dEgz97oGPNP3OuUS+RgPGrIMlADb1EtHgCn27l1y08Uz9spulflVEpFAvKwi6ntDeDu7BKPdQe862Ero9YV80GYoaTZgZ47YtFxkEhlpvpZgWFGNorqH2Jc5YrwgoukUb/B0p5xwwD1PvFFxKSuKN67T+8Z5Yhmr14YXrrehqyExGcNaegVotzdATzEHNctSuuxF3H7Rq0e/PIvlurE1a428kFnFlJ1XNnt/vdc8ZrLse9NvpjOzUUEMlZg1zliZ3OxfyY389O19HHeb2ECUQhZu1aCXOh43nwmX9+wwaeAvrcbYYZPIF8YQ3AMnPUbM72PQeB9S/VlfGznIE/UMatQuJ5fzErjpTBDWOCZ2vx4mmHtbVUbracjst8XY5MjTDCcxGGjW+KCkwH1655kxIn1pogEPIJ6WkVynPggcuLKeZBSV4SbbFOx7RlhIsyyaw7mlP4j9CLA+WJJzgFgPiG7QoN4CMmQTtu8zFlSwWbFQYVILugZIvKfBnXQpXn/JQwiFz+evyN+izjJyTcRkSgiidr4ghpid80w5WqJTia3iun8PdGbsoAexRwwDCUqwMipmPVLcD2SYAqDHmYW8lxgigcmKNS7VZ9VHvN+IeTvoMXIyRxyZ4MB/maedqCtWOLoebj5TUEZdDQR51Re9DyWISyjkitnalzFrmh4I9T9zHLJf7YwDWxkLY6VNoekEZNFQe2BNemjyJ2g7b7jEe8dBB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6506007)(38070700005)(53546011)(6512007)(316002)(38100700002)(186003)(91956017)(122000001)(8676002)(6916009)(54906003)(33656002)(2906002)(8936002)(36756003)(86362001)(76116006)(6486002)(4326008)(66476007)(508600001)(5660300002)(66446008)(64756008)(71200400001)(2616005)(66556008)(44832011)(66946007)(7416002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ck5vZXpxc0syZVdvNUxGeTdNdU9PZnZtVGFvWDllblk4WC9BQmpzaGJxOUtl?=
 =?utf-8?B?ZFQwcmpBalhVK0lVY0FMN1JWQ0I5MmNRbXEvM2tXR2czVnJGMC81ZVlFbitl?=
 =?utf-8?B?a3lqU1V0cXZLSENjc0hjcUpUZU1zWm40Q0JMampqNUg4UFJURnp2VlZvVmF4?=
 =?utf-8?B?R0hmblJwK1VpT2NvRHFKTFNkcVpGZHVwTzVWVVcyZGZnbjhlTWFrbnNhRDB4?=
 =?utf-8?B?bE83dkZkUml5aDl0V0hyS0VQSlNaS29Nb0VkUHdKeFMrY1RaQ1NLLytjUVEz?=
 =?utf-8?B?dk14eDl4SGVjSit5QlYwL2VMSVZOb3RnMWNvQXBVYzdwRUUwaEV0ckdJbnlv?=
 =?utf-8?B?VEJERjhDZmtDV3F0UE0zV1F5MWVvN3doQndvbHFTblIyaVIvL29mTUtjWGt0?=
 =?utf-8?B?NS9FS1hqRGlTT245aHNDYVZQQ2xQZktVTTZIN1AwRW9PWUJtRnRkbW9DOVFx?=
 =?utf-8?B?dEZTbk5lQXpmMmZvZTJ5eVd1UFZHcHJpY3JmNWY0M1dlRzhYdEJ0Rkw3eVJN?=
 =?utf-8?B?RGwvYzEzWlVyY3Z3dDJiaUpZYUV5cmc4MEx4R3Bjcjh0ODRzWnZOTDJXYUdn?=
 =?utf-8?B?UU9lWTRjSG5IbHZEejMzS2NMYjgvTHZHU3k4am03bjFKR1BjZllnR2FVaDJy?=
 =?utf-8?B?WWhVU3J3Y2M4R3dJd2VtNVBIdHpCWFhCWkxRdzU2YmdvTDV1THlXVUNSQ0pz?=
 =?utf-8?B?Q1owWGE0dmhaQU9pZVJDVHhvRmd4ZHJDTGlpM01lOFo1VVpRWktueWVLeldZ?=
 =?utf-8?B?Ykd4TVhFcUREbEgyZit5TFJPNkNRaGl0eHBLT0N5QUpMaGlRbTN4Ym5vTjlJ?=
 =?utf-8?B?L3VHeEtnTkVCb1k0MkxraU5SNHIwSWE2ODA4Wm0wSFlzczlwbysyMnU1cllP?=
 =?utf-8?B?WkJHVTgwdUZpRjYyUnRRalRtOUNQMElwOVpjMytJbUlvTFVHempUV0xsS3lU?=
 =?utf-8?B?VnlZalZVTWlmajlaV0dxSTVoaVpEcWt0S09vT0RpMjVtcmkxRkIrekRoa1Z0?=
 =?utf-8?B?UFN5KzlYTjFtN2hGcmJVMjFRS21KQlZ3YUd6eXJVT2RxeEUzWEppdm5lc2lN?=
 =?utf-8?B?ekc2Mk1CVmV5MGFlNlR2QzB1cnBzdDhHZlZQZ3c0bWg3a0V2Y1NmMlBXQWNY?=
 =?utf-8?B?bnM3YkhOYXh4QzhmRXY0R0tZYThVYXJDVDhXM21oYVRuQ0VTVTRYVFVObFVJ?=
 =?utf-8?B?dTc1enI0RWJYN2FaOXZ2eVU0SkFNczlLOExrSVJydXZHenE3ZDdGdFJ3b0FQ?=
 =?utf-8?B?T2l3L3VGdmRJNXlXekpna05lM0l5T2Rsd0dZOFJkM1VuMGtvUUltbXFxcTJ0?=
 =?utf-8?B?WXEydVJJNWNEbTVYMlJmd0tVbmVyM0MzYmJTajdvUXpUVzZqSitTRk5NNDEz?=
 =?utf-8?B?UnRFSTgybWJQbnZpZ1BINE5yUjFaK01JUHBPQUhyYlFyS3hqR2NLZXltRTJR?=
 =?utf-8?B?dXBkbWVZTGk5b3duRXBNV01nalZkd1ZaZ2VUSkNSL2VocTdHNFVlU2cvZ1Rw?=
 =?utf-8?B?dTR2L0p2UDg5Y2x0UFh5bFRuU040MytCaFBBUnFyNGh0dkRHTExHaGxvM0M1?=
 =?utf-8?B?L1hhNXNwOE5lZHd2eGlub2dpQ1g2b1dqUHdpVkJveFdFRGRaS2pOYW9pOFMw?=
 =?utf-8?B?SWNPaGZsWjBHR0FDeVpGMkVVNU0yck0vY0tIVmZYeHlIN2p6eUxKOXg1K3Bn?=
 =?utf-8?B?Rk40b0QramswaDVCSUlhQzNUTWNJYy9OdWtScE1PQUVuU1hmdzUveldXV01p?=
 =?utf-8?B?QnZtczFEZGtCL2VnanVRQ1VmVDdwaVVUUnVwcm90UmVvN0JmR0Q5aHZkUC9I?=
 =?utf-8?B?eG5WMzAwMmlOUUpLRTVmcmI2R21naGFQR09JUTFSa3B5azdndkU5NmJXL0U1?=
 =?utf-8?B?QlFIMUhiblhFQzZXTVRRZ0tMdStFOFFJK2N4YVgzYklwNFFwQjB3OFRFVUNO?=
 =?utf-8?B?dW9FT1hlUTh5TWR1dXZ1TzA4Mkx6Vjh2RDAwcmJvTzhoa0plY09RL1M2YmpJ?=
 =?utf-8?B?T0w4ZVVQRGxnNzNHZWowa2lBaW5qV2s0TmZwTG5RMnoyOWxoeFZQbC9DbTBH?=
 =?utf-8?B?U0k2dlNUQ2drK2xGdDZqTlpxaVgyWnE4UGhVY1J4QlB4cU9peEFHOTFWVHRC?=
 =?utf-8?B?VG1remkwWnN2RVMvSWJMeTRFL2JKam5PUkhGL3lwamw2TGdNeWMwRURBdWNa?=
 =?utf-8?B?VTdmcnFia0Z5bzFDREV5NVJtM0dXNkI5MDBjREVqM1pkRWhXWTFUYTltcEFH?=
 =?utf-8?B?eFZCOTBSVUxEcDRaZEo4TkdnS0dnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <423679400772094B9ED2903716C22AC8@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2067dab-bebb-4dbc-c328-08d9c1054bfd
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 02:31:14.1992 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iHqBk3AzIjnz5FDfz+QwQFL/WCgkGuVOOB7MG4WiELwSUn6rE5oVhXh/kmOzcDQQJyemuSLcMQQybRFemLyNsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4368
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10200
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112170010
X-Proofpoint-ORIG-GUID: BxlTzM4BXse2WN9ZU-0EBCybDPsTWGrN
X-Proofpoint-GUID: BxlTzM4BXse2WN9ZU-0EBCybDPsTWGrN
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 "wainersm@redhat.com" <wainersm@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 "crosa@redhat.com" <crosa@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gRGVjIDE2LCAyMDIxLCBhdCA0OjU4IEFNLCBTdGVmYW4gSGFqbm9jemkgPHN0ZWZh
bmhhQHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gV2VkLCBEZWMgMTUsIDIwMjEgYXQgMTA6
MzU6MjhBTSAtMDUwMCwgSmFnYW5uYXRoYW4gUmFtYW4gd3JvdGU6DQo+PiArc3RhdGljIHZvaWQg
dmZ1X29iamVjdF9zZXRfc29ja2V0KE9iamVjdCAqb2JqLCBWaXNpdG9yICp2LCBjb25zdCBjaGFy
ICpuYW1lLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpvcGFx
dWUsIEVycm9yICoqZXJycCkNCj4+ICt7DQo+PiArICAgIFZmdU9iamVjdCAqbyA9IFZGVV9PQkpF
Q1Qob2JqKTsNCj4+ICsNCj4+ICsgICAgcWFwaV9mcmVlX1NvY2tldEFkZHJlc3Moby0+c29ja2V0
KTsNCj4+ICsNCj4+ICsgICAgby0+c29ja2V0ID0gTlVMTDsNCj4+ICsNCj4+ICsgICAgdmlzaXRf
dHlwZV9Tb2NrZXRBZGRyZXNzKHYsIG5hbWUsICZvLT5zb2NrZXQsIGVycnApOw0KPj4gKw0KPj4g
KyAgICBpZiAoby0+c29ja2V0LT50eXBlICE9IFNPQ0tFVF9BRERSRVNTX1RZUEVfVU5JWCkgew0K
Pj4gKyAgICAgICAgcWFwaV9mcmVlX1NvY2tldEFkZHJlc3Moby0+c29ja2V0KTsNCj4+ICsgICAg
ICAgIG8tPnNvY2tldCA9IE5VTEw7DQo+PiArICAgICAgICBlcnJvcl9zZXRnKGVycnAsICJ2ZnU6
IFVuc3VwcG9ydGVkIHNvY2tldCB0eXBlIC0gJXMiLA0KPj4gKyAgICAgICAgICAgICAgICAgICBv
LT5zb2NrZXQtPnUucV91bml4LnBhdGgpOw0KPj4gKyAgICAgICAgcmV0dXJuOw0KPj4gKyAgICB9
DQo+PiArDQo+PiArICAgIHRyYWNlX3ZmdV9wcm9wKCJzb2NrZXQiLCBvLT5zb2NrZXQtPnUucV91
bml4LnBhdGgpOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgdm9pZCB2ZnVfb2JqZWN0X3NldF9k
ZXZpY2UoT2JqZWN0ICpvYmosIGNvbnN0IGNoYXIgKnN0ciwgRXJyb3IgKiplcnJwKQ0KPj4gK3sN
Cj4+ICsgICAgVmZ1T2JqZWN0ICpvID0gVkZVX09CSkVDVChvYmopOw0KPj4gKw0KPj4gKyAgICBn
X2ZyZWUoby0+ZGV2aWNlKTsNCj4+ICsNCj4+ICsgICAgby0+ZGV2aWNlID0gZ19zdHJkdXAoc3Ry
KTsNCj4+ICsNCj4+ICsgICAgdHJhY2VfdmZ1X3Byb3AoImRldmljZSIsIHN0cik7DQo+PiArfQ0K
PiANCj4gSXQgYXBwZWFycyAic29ja2V0IiBhbmQgImRldmljZSIgY2FuIGJlIGNoYW5nZWQgYWZ0
ZXIgdGhlDQo+IHZmaW8tdXNlciBzZXJ2ZXIgaGFzIHN0YXJ0ZWQuIEluIHRoZSBiZXN0IGNhc2Ug
aXQganVzdCBtZWFucyB0aGUNCj4gcHJvcGVydGllcyBjb250YWluIHZhbHVlcyB0aGF0IGRvIG5v
dCByZWZsZWN0IHRoZSBhY3R1YWwgc29ja2V0L2RldmljZQ0KPiBjdXJyZW50bHkgaW4gdXNlLCB3
aGljaCBpcyBjb25mdXNpbmcuDQoNCknigJltIG5vdCBzdXJlIGFib3V0IHRoZSBzY2VuYXJpbyBp
biB3aGljaCB0aGF0IHdvdWxkIG9jY3VyLCBidXQgd2lsbCBhZGQgdGhhdCBjaGVjay4NCg0KVGhh
bmsgeW91IQ0KLS0NCkphZw0KDQo+IA0KPiBJdCdzIHNhZmVyIHRvIHJlZnVzZSBjaGFuZ2luZyB0
aGVzZSBwcm9wZXJ0aWVzIG9uY2UgdGhlIHZmaW8tdXNlcg0KPiBzZXJ2ZXIgaGFzIHN0YXJ0ZWQu
DQo+IA0KPiBTdGVmYW4NCg0K

