Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 747626EF5B2
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 15:45:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prfRQ-0007EI-MI; Wed, 26 Apr 2023 09:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1prfRO-0007CX-4O; Wed, 26 Apr 2023 09:44:14 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1prfRL-0007Y6-R9; Wed, 26 Apr 2023 09:44:13 -0400
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33QATRRF030275; Wed, 26 Apr 2023 13:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=EAxo3kGA+094cbj+5ZPHJvSMD2Nl6e20ftpsmG8ZHTY=;
 b=Sj4Qt15w8sEFQ/wq/2wptxTs/KwiBohN/obsmqFaG80Q9jVFDdCjUalNkIVfaIAN31He
 qmJ+DlLQzFPD3TP9bDR3ARXR4V+wrk8nF7+o5Y64SlAkJ4cih7wiEcRbUsow1KPF7udv
 UahO+B+FG1D+G+XexKTt1xf5HuKyrV/1VApdRx882K4snAItl6daew8s6pP4tabNn9Fx
 Bb33GxBv9G6Gk487bfAe3rGh2s7SwJxt4ESzDCpfWX9kZ1Foyu5lPQiK4LuyULyOUCdi
 +PFTOJff6A+E3mxCgWarirNh7zDCUhh8d9RvDn+AGuFSO/uixseTeV8WjNrOFuOUftKh YQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3q46gbsgj7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Apr 2023 13:44:06 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 33QD5EEM013428; Wed, 26 Apr 2023 13:44:05 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3q4617q1ef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Apr 2023 13:44:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c4c4KPUp3RydBQuVKai9TggeNBnCCFRUA3LNAVk3Z9JDPAGJEjP54rLVh9L2KSZpKrG/SFCYjP03pSjfB/TnF0JMcesxvC+IVwCokfrMCgzuJD6byyBEQx9DVhTIJsse9swE6wAPmrB+KV1GKdInok07SAGetxlKg2Gg+v4IjLhO5GY+UBu0gQLGVl/491+Yh3/mbMeaYRhAvqTvqIvwe4gBf7IOiEmiEOxlpL9AdX9fS6LwHFsBISyOKWLq8wJ5HDr+dQqEv8g3vqZGNafusvXTXvRdoJ0QcJBa+CKHI309TUHrO95ZbBSPO17TPu7WUuwD6RuYvncNctxmM69XyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EAxo3kGA+094cbj+5ZPHJvSMD2Nl6e20ftpsmG8ZHTY=;
 b=kNsUi+NONv4wrirxgHoMo0MgID7qoUeRFBqIXYTkDhaqMtclwEMWQDYLYYbFd/i+w6mjLqIhAQajdWV8siNimOxlLf4Ua/BEy+gSX5jqq06OfMkqKm/yrqotXVjdfTOdSFZVMLnoNzEJyVSG/jUoZogxBS/Ux5MRtImlTbhUKrvC0UYufIzUej8ZYIOz3k0YFFpgs7HBOCogL6d19w2v7mJ4ot5GEK6ir0oq1qvUnUUTGK1xw1Ot7J1cL145D8BFY+EZdHUcKnpiBKBDbBG1uXnS8fU6M+RMRj2vbYkhz0ur12MUWFWpgnNM2IgTORmTjWLU82Z4oLyTkuz5BBgUmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EAxo3kGA+094cbj+5ZPHJvSMD2Nl6e20ftpsmG8ZHTY=;
 b=NgBY6dzCfbH7nj0hFGkm3VcNhfGfuZc5RoWIDIQluwZYFaPug7DzVgHy3BRGnZXKdBMIqBI0HuNWLnsL+ud1QgclxGvlyMivsP2PI7LeZKkyMGxvGpOQf2EvdLIJBnOQIFPqMpCsPjARChRQGwyLtyl9+/syBfbqgtuh4VV/8jc=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BN0PR10MB4981.namprd10.prod.outlook.com (2603:10b6:408:12d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.20; Wed, 26 Apr
 2023 13:41:42 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::805e:c245:d42d:5688]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::805e:c245:d42d:5688%6]) with mapi id 15.20.6319.034; Wed, 26 Apr 2023
 13:41:42 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Mattias Nissler <mnissler@rivosinc.com>
CC: QEMU Developers <qemu-devel@nongnu.org>, "qemu-trivial@nongnu.org"
 <qemu-trivial@nongnu.org>
Subject: Re: [PATCH] hw/remote: Fix vfu_cfg trace offset format
Thread-Topic: [PATCH] hw/remote: Fix vfu_cfg trace offset format
Thread-Index: AQHZeCJ1oUPgMmPZ+0WWHUmXQtgWda89mVmA
Date: Wed, 26 Apr 2023 13:41:42 +0000
Message-ID: <CAA9D978-1B81-4B11-A519-D56517104624@oracle.com>
References: <20230426093518.966397-1-mnissler@rivosinc.com>
In-Reply-To: <20230426093518.966397-1-mnissler@rivosinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR10MB4013:EE_|BN0PR10MB4981:EE_
x-ms-office365-filtering-correlation-id: 152ef3e9-a4e7-4fd1-8e46-08db465bf811
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DKTEJkXV5qcvW0ZD/puGpjwbIL14nuSNor037EjTixY/IJiPgC2t1NQawSbKMd43tU52uqqOz6st9d659qXFAW36RrfiSSIwNXJqgbrp+P56+gG6KkflqkqWuzE1ekSxMpatydRGLP1T5xyS8qiob7CrJFKA6u9LAfpKBsV2nWwDa3+lhYRNMXuT/b1Hb+f8JAojOOkYhJO9wFu3iso7ObyMgHj/NLK3at8eEuNCy9hWsTYOl8zAGR55SjQo0kqQB46+9kQzaoRWJB3T5CkcHG24IfIoAkdZzVDMYPEUKSFeZiAdgn38I2XyglZOtX05l1UxUmVJkgwjxncMpXVgRLk4WUIDvLjPwRCnDGxKDFCn0mqK9GLWtjOG4aDhbDrc4vk53YbP5E6wIRA+4uyMCJPzcSKIkM79B/+z0wCepQl4x6hktwwC7jUAluyinCRRbbACkZt2wkt7PTA9HFHNMq/Asy3ERE5CF+RiwnX6oxd71yBuYlY52TxqmvJcGvvjzNFd3HmmVI1oD8bxdG7A47UYSIgmtWTU3x/5S6BBuD5dg/vKNc0wvLHDad66QCQaRpOt12cS85lMshchsBGXm6f+iXfkWjDCbuvfXl8A3raYr8d6pGP0uCxW9DaxR1nazEy4xD+c4ePdjP2k8PjN3A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(136003)(346002)(39860400002)(376002)(451199021)(76116006)(66476007)(91956017)(66556008)(4326008)(66446008)(66946007)(6916009)(64756008)(41300700001)(2616005)(26005)(6512007)(6506007)(53546011)(83380400001)(186003)(478600001)(122000001)(6486002)(71200400001)(38100700002)(54906003)(33656002)(86362001)(8676002)(36756003)(316002)(2906002)(5660300002)(38070700005)(8936002)(44832011)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Yrad6/DfdrSMiCgUjwzGuEC9+Z2B8HeWi3ZCKkfCWb3QbsIJm8u87sWMHTNI?=
 =?us-ascii?Q?mURv0k0Jmrj2TVD6P6S23XigToR8dwCziwxM1FE7+bN8HJBXHS63b1D3BGUu?=
 =?us-ascii?Q?RgYa5xbjXN2Hlt6kQoFiX6VSk0NFUjBp1Nc1Q2h224XXievBioRAVDeq8Rla?=
 =?us-ascii?Q?9rKvZMXA7f5HfApWboR53lXLYbr9KxDHu/vEpdwGFkRHq2oLAtS4jQGyhOMk?=
 =?us-ascii?Q?bleAK5QSpPKnAcDQz/1YpaTEi+C4gWeIWsB/ralPTyjXNNueHy7OyHKCsW3y?=
 =?us-ascii?Q?+MJTQqNcxJdTuEh/l2Aqm7kq5ArlQL1yP4Eh8gtm+1IPe1VCHVq3HuzRsPx7?=
 =?us-ascii?Q?/RfW6Yewd3VWRVmqAfvNIPn79ceaxcbto+CfsPqIvtIquGJFV6HFSw9S+NNu?=
 =?us-ascii?Q?Xs5I/SxVbwEiWhQewzX5SZvxhs/YHkYDgPqsXKL3eoiNs+La7ULCiN92aqPT?=
 =?us-ascii?Q?uUXDDDB1XxjfDzQHL14kBVqPqSzIAuiINCUesny4qOqnPPYekONkfhy0IysX?=
 =?us-ascii?Q?ZoThCG0bYBzyapu1msjCK4VZZF5UDkf/PJSCVorLERp95yo8BzXQkrXDS02L?=
 =?us-ascii?Q?Eq9JxwBwRZhALZ9TbI1UB/QWKH45qD5I4nQ6WUGM0FLK33xyUy0CwtqthSPS?=
 =?us-ascii?Q?SIfT8vqt3X2uQeyIRcjcNzprDxrtmx/xtDksvpcnvN8o8RXU82EI03PC/Ih1?=
 =?us-ascii?Q?LvwuUR3kwlVXigC/Rfrx8C7kgs30omi0frVDApslYYjSuD1QfrPRvUcJH20r?=
 =?us-ascii?Q?ZAdjmYQ+SYaS4/2n/WFbC9bPpc4NnBJX8svXuiHNZ+lwg5NLRhWaN8jy7MbE?=
 =?us-ascii?Q?ClQXt6X9gJbfOPeShDmhceNTv2XijHQy/PmW1wUmlEhwbaZ2Yk6o3KOKFen1?=
 =?us-ascii?Q?7Q2WZ/maul1SyRuxBg/0Jv/RkZYpN80IfYsx91amewzkPPK3eDlD88ymmxLY?=
 =?us-ascii?Q?mEWsrWHn8ptVZNYdOMX3jWbaHirm1IUzcwRYFb/i8YhOoYW+Kcbc3xpC0bcg?=
 =?us-ascii?Q?t0AZ05IJ5Jt/l8Rzb2q7k+9tdy2uTdlqQOC6aRyP7/kx2EtmkNX4bAlzd79Y?=
 =?us-ascii?Q?wO5QzoTtHt3VDSOgfswuzycHVP5qFx/wywuBQFbwJzraTonQ1sd5UMCZ28Xm?=
 =?us-ascii?Q?6AOUEJAC2yyx4jeWGC9hgPiQihxdozNaGueR9jcjCqNvzM3se3XiyLgsIIuC?=
 =?us-ascii?Q?Eklq9hgMoZliHFJDif2EZMhcULNFz1u+8Y6l/7V9GalIYxAMl6arIfDGbpz1?=
 =?us-ascii?Q?WTXmS2WTjVwXNjcFPqmU0gacqf6yFHV8swIlJYvDsaTmMAhKmUw31Ax5lh3b?=
 =?us-ascii?Q?MajRebHkREOnbuGkfIYTpYG8oARmojU5iY+hxCVFmp6gE1CjtNVCyJWzkXXK?=
 =?us-ascii?Q?av6F2NHv+PwMma9gMv+kwvYRQ26dNVdL4vdLqUsIcW9HOTQFPV8KEaTJrgpR?=
 =?us-ascii?Q?Rp/5jAXmkX8/cDZCu9a36gkyzSmoF42+s0xRCKepHnnGfGahZtOPydmbw9pK?=
 =?us-ascii?Q?a2hJ/mLY7kk67iUMXpta1yMh0HtkKebHjz/rKbMBB8uo8wukdELwzp7M2Nkd?=
 =?us-ascii?Q?0dwqGt36m9JnrVzss9fXfmJVoqdIA/ctCWid1Ntm?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B24A17E7D3F8834783A1B634B2813407@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: IG0FtG5NH4Jm1ddUmhHgla34q73F6tDCySP0jhV3e2isXrvqmHlJeOyGxe6971ouYbzrbHlRjWoM43luIpNL7pKhMLS5F+7IcHWR9gUZZamtfZr3oA8Q8FfetbMHJpKPSsSr408CoFnh9K7jlABVR04q4da0PaeD6iS1YFJmuJ/NRZPOm3MwgTpLcgHPQjrGu/fzRV6OO83bVcwCYj7Qgd87l4UPsB2dyS5tEfOfd8bJFjhUUHD9a0wkSGF6jy0EJPOcghQl+b3JkIiUHZ6KXPQewGHfZpW0LB3cC80peQBVa6nKAoFivdIJ2RnZVVVBzP9ArSo6lt4Dhvvk6p2H/pa+C/aO2ltP+HZNcuj0Ay67Zp4T6n4VgpEqvURL9kTzJBhll9xs4eqbGb+OdIncMVHIqiMqFI2/quIJkGOU2ny+PbdF2uZT3ZN4+8Te6HUvo5k8HShneuyjh+kMRe+OezaOsnlgbDL15zKnmGnjgvVoco8BDaKVlq7WmyGe2c49E7vjncr7qwVNfgs0dqHxbapB6bync7B/rsobk9na7yoytI0PJU1vIxJQ6ycG877UA0eyHDaY5pua/4GpNqvHwZYSLi1mr1vqxBmpEr6mhsqtY/AKNjR+JtEa4bbZzfp1xQxNfBsQym8sAmaKHpLWKxZ+TPozswqEXFk0R6Nt5w+kDvPhkiyFWHXTvh6Z6y1IXok/n0SJ50rpteDeekXjfNuj9uAKhlyXDIGV3YMOLRuSuIUdl1AoBne9dqBPnAZ7CBMq0ddACP6qTBkprwO9DtYPC5St2K2E4aNlVIoP8hI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 152ef3e9-a4e7-4fd1-8e46-08db465bf811
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2023 13:41:42.0458 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9l1bPMruct8Sw05mMWvRiEOkoGuey9Tn8jkHf3bTAZQyX2lbgIai+zGSCGeOyF8abKZEu97q51focQbqeCWdaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4981
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-26_06,2023-04-26_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304260122
X-Proofpoint-GUID: 4RoCCR9oIkUecvICnDfgU8G37R3r7wqF
X-Proofpoint-ORIG-GUID: 4RoCCR9oIkUecvICnDfgU8G37R3r7wqF
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Thank you!

> On Apr 26, 2023, at 5:35 AM, Mattias Nissler <mnissler@rivosinc.com> wrot=
e:
>=20
> The printed offset value is prefixed with 0x, but was actually printed
> in decimal. To spare others the confusion, adjust the format specifier
> to hexadecimal.
>=20
> Signed-off-by: Mattias Nissler <mnissler@rivosinc.com>

Reviewed-by: Jagannathan Raman <jag.raman@oracle.com>

> ---
> hw/remote/trace-events | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/remote/trace-events b/hw/remote/trace-events
> index c167b3c7a5..0d1b7d56a5 100644
> --- a/hw/remote/trace-events
> +++ b/hw/remote/trace-events
> @@ -5,8 +5,8 @@ mpqemu_recv_io_error(int cmd, int size, int nfds) "failed=
 to receive %d size %d,
>=20
> # vfio-user-obj.c
> vfu_prop(const char *prop, const char *val) "vfu: setting %s as %s"
> -vfu_cfg_read(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u -> 0x%x"
> -vfu_cfg_write(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u <- 0x%x"
> +vfu_cfg_read(uint32_t offset, uint32_t val) "vfu: cfg: 0x%x -> 0x%x"
> +vfu_cfg_write(uint32_t offset, uint32_t val) "vfu: cfg: 0x%x <- 0x%x"
> vfu_dma_register(uint64_t gpa, size_t len) "vfu: registering GPA 0x%"PRIx=
64", %zu bytes"
> vfu_dma_unregister(uint64_t gpa) "vfu: unregistering GPA 0x%"PRIx64""
> vfu_bar_register(int i, uint64_t addr, uint64_t size) "vfu: BAR %d: addr =
0x%"PRIx64" size 0x%"PRIx64""
> --=20
> 2.25.1
>=20


