Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C1B6BF092
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 19:19:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdEfN-0001aN-5L; Fri, 17 Mar 2023 14:19:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <karl.heubaum@oracle.com>)
 id 1pdEfK-0001a0-Dg
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 14:18:58 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <karl.heubaum@oracle.com>)
 id 1pdEfE-0001S5-8a
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 14:18:54 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32HHuMjU032656; Fri, 17 Mar 2023 18:18:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=VzAGKgcO32tsD6HSxCl3Z1SMjIwDZ+F6FSPSklJYePs=;
 b=LVGXSFtinQN1XqokH3OFPfz56QkM3Yj7RLeNqY0a8wSTk+2RxoMYvtTVnqOZjDOXQTaY
 mOJB/GpRHWn21hNx22iWXRARs+uj1cQ/wRzTIfGYlu0g0ylSTPTle7nOHxFyMsCGn92g
 kNCWCnGyCJV2rbwYbnCxF6c/eRGRCdaIHGQI5Kl6pglf87dSiBEblKjm1xPz9YTJ1Eh3
 i5LT/TRBrxP4coZdBX2FwwPUorYAHc3EjQ4eqDqGP/Zcm+j5vx6Sbcc5vYmzpfNj+e97
 AVbVUoc4amprA4956TXIh0L99Mg7rPq575N9B6pfi6RfAa7r4vxgnFy2B0POltMrqLfT gA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pbs29veeq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Mar 2023 18:18:42 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 32HHCX3a020704; Fri, 17 Mar 2023 18:18:41 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3pbq46mnvw-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Mar 2023 18:18:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+GG/m+bNH/jr26xugBpRSRVbNT79qorhnTgdsF5nzbpavITcCELxmT1WaaiRUopCo1O47dSuxKMc3eCKFupkQ6iZiVICB5s91eQhO5Dkw9VDQVdBoT3Ykaz6Nl+54/pqLveAhVVBirnj/2DkuoiFIitHzpUWPgMliku4+kPmFRWmt9Bi20Z5dE9B7PRmnK3Uzn3KpVjPRvUEL7rVJ7II2Ko7bWJqyx3fdULedbButbVOakQiehcCqrjhuqQw52lSu8qWSlftI8mu2A6Qrfo9mjC5AEex7g6fgzCHy31lSLQoFR9Z5WhEzhepjOp12gboOXGiZ6l6Nb2zdAUba1UOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VzAGKgcO32tsD6HSxCl3Z1SMjIwDZ+F6FSPSklJYePs=;
 b=XQJxaX5J1hx/E++q9n1qvpytKrIXG2lFeZrawhT29TQfkr0a89ebKi24ZVHNDXDLxQGUJA03MPYOzvTYC3WGfOGjkgn4/bXplr2YuroOEVWh2qoR0Dq694alEd6LjnBfr2tdTsp6ePFkzwf8OXv2FtnhYZkIWE41EUTfQpaBK60lN2gQk+EB/kzuIbvB/du15GiroezGYK7n3rO/yF/IQ4Uu9RUOQsXsByi7TuQfH7JyXjXAKGrr9vAgHcTtkX877dh4876zuSljzjUC6DpkresOMl4o2Xw32Gaecmy2tCJ+P5zdyhv030pVEOmtJumVhDqmmgOolSi5RrlG80ULDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VzAGKgcO32tsD6HSxCl3Z1SMjIwDZ+F6FSPSklJYePs=;
 b=JZWqgScNSptU6aQ3rJH9zBmKWJU0PYvIAowTA+v7i9g+rDYQ6f4PuFiNxozfOH6mBU5tXfhbTzt3OVLgc0wPt96znjSKnQnAjGuxMo0Fl1iID5cOePzWVs+3vwZq5pvLPxcTA1ZYRtOocLuA1ps/8CM5VnnIhWrE9QNgF/jzWUQ=
Received: from SN4PR10MB5543.namprd10.prod.outlook.com (2603:10b6:806:1ea::13)
 by DS7PR10MB5054.namprd10.prod.outlook.com (2603:10b6:5:38e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 18:18:30 +0000
Received: from SN4PR10MB5543.namprd10.prod.outlook.com
 ([fe80::f696:c994:c299:e91e]) by SN4PR10MB5543.namprd10.prod.outlook.com
 ([fe80::f696:c994:c299:e91e%5]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 18:18:30 +0000
From: Karl Heubaum <karl.heubaum@oracle.com>
To: Mauro Matteo Cascella <mcascell@redhat.com>
CC: qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 "fam@euphon.net" <fam@euphon.net>, "philmd@linaro.org" <philmd@linaro.org>,
 "alxndr@bu.edu" <alxndr@bu.edu>,
 "zheyuma97@gmail.com" <zheyuma97@gmail.com>
Subject: Re: [PATCH] scsi/lsi53c895a: restrict DMA engine to memory regions
 (CVE-2023-0330)
Thread-Topic: [PATCH] scsi/lsi53c895a: restrict DMA engine to memory regions
 (CVE-2023-0330)
Thread-Index: AQHZKes7AJp7tdfTbUqywuylIY7dD67/pdyA
Date: Fri, 17 Mar 2023 18:18:30 +0000
Message-ID: <110DADE7-A361-4F53-B735-B926C40C0B9B@oracle.com>
References: <20230116204232.1142442-1-mcascell@redhat.com>
In-Reply-To: <20230116204232.1142442-1-mcascell@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR10MB5543:EE_|DS7PR10MB5054:EE_
x-ms-office365-filtering-correlation-id: 09ee4f7c-facc-4b11-b4f7-08db271402b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nRx2v8ERJRsFunFtVo0g5R6wcj+K7aC+PxbjOBo6cBhMbkuLVGePF10UBxYTWkGylOCf/gBX47KZZ+QmCfwKdYqo6XzHfobM1oHnqRVTgcGDKZJhPg5mXZWn/751GFaMOuDCt2GOj4GOPMVxDt6A3hbE3lGzP+ZafvOSkLBoVlBn8Rogk4yk+x4GOVvm1/U2QFhsehxv+vodNSqAP8UHLegpv0LCz/zSDNsYE32X721uzumSujRLaYI/dpoHxSRBXj07tnyTGAqiHb779Ss3ghWiPOpFQ2Qjaw8tCb4xT/eXo/tpOXBpewr4yTahkivRUNyompzvTNLbIUCVo1L9pAUjMwH87OCx/Y0scL4Jh3Hz4siXX9KQIvRKQ9JPhrCU/E+ucxyIQb2/+sehh0dEXBxUbOVEpiC+nDn5ywmBaGew9xi2dkRwC9bYEt8gH1QJsMAfCUjRVWr7Mkg9vG3NZkMrZ3kMuuAnmcjLlLklc8uSo6aw8tSMU47Wpqcjm1K5IUDJbvP/FIUHOhAjBuzKQGhlwapmL2MBdlena+tSEO2H3xVxJo08gPKjwm5J0ZtjUBSvpKD2lfWktY8+vRHbKXXxZ9qUbgK8QZOAPJI0c7u4IZSE9RSWXoqNKF30AQ+YQ1o4GP5i6binEj0623Dxf3rlgHJcd0xjqf/2hQIuZLoPO6+eDJORxr1QtxYqwkVRa/1sI9TlS0tt8hUDDMlU0kCmSC3DmAQduR1/ScGQpyg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR10MB5543.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199018)(44832011)(76116006)(6916009)(8676002)(66556008)(64756008)(66946007)(2906002)(66476007)(66446008)(91956017)(36756003)(83380400001)(33656002)(41300700001)(4326008)(8936002)(122000001)(71200400001)(38100700002)(5660300002)(186003)(6512007)(53546011)(6506007)(6486002)(966005)(2616005)(86362001)(478600001)(54906003)(316002)(38070700005)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aQN5/bQ7LrTbBsYpAkfR9HD1pXSs3Cb3FNhUtYshK8lQudHAlpGUG5aUJZle?=
 =?us-ascii?Q?jcNa4vz/riwwMH3UwlJNUacJ48kMeTtj7PWlw8rZhTaF+O0Ve5U2emINg5Dq?=
 =?us-ascii?Q?gcCsosQUKQPeWzgftz4XIDxQA+O3VgQ2tss8/eA4+om184ngy7inpQCHPJTk?=
 =?us-ascii?Q?kxnyZDhsGM3i4WLmnxZT7bHbCskC9FHEa9X7dNaRO80K81x7DsxXau1OZhgp?=
 =?us-ascii?Q?Emh02BEwN4rPH0sB5tmHGoqYHC4Hq8wlpHg0oNOEQF02i7uNCZR3SNMqXZM/?=
 =?us-ascii?Q?lDUClGjfdNNb+deKp0i5H1vPBnkZWidSJDksRjb0vr2TU/tJXORihJi5Q9wq?=
 =?us-ascii?Q?/1S+AJ4eBQktFanKq4lHClP0GwrlPM5BTYcijEopfUgMmrpFT3vlB6Q0xzbm?=
 =?us-ascii?Q?ESgwAs4jWOsBOHwFFS/hjgw3HE9KLvOe2can5YZrDyzvtg7dOsg4FSieYFJ6?=
 =?us-ascii?Q?XhlxdYGax4zKo1q8iK74O5Q7XVfRweHmihnjCDvUY5mqS0o+6CesJ4FxPGGr?=
 =?us-ascii?Q?gpRRl5d4W6sRjLQnpq0Z1R7X9QVwVAtN88jljyDFp3ep3kf0veT87M5TZ9hA?=
 =?us-ascii?Q?XN8yWf4tt2nq9BIWedgx5BHKzDH0lhrpK5VpMrWUpyO0OG/B1aRe/bruexyv?=
 =?us-ascii?Q?Gn4AtfyxtYaFfvFa+vzjFxIg1ifQLMa8r87ryJjxlid8Ak4v1mXDkiqq07k0?=
 =?us-ascii?Q?uBLI2bz1xq+qJe/ocmW5sKdcIbNRkzDBjtgN7BL9iSYVhjULAFW5nuAyqvic?=
 =?us-ascii?Q?8NZAlQON3i9W7F/2TBCxgmU29cmfNQUEXcoMVm36dac0epDHI03A3dVXQaRb?=
 =?us-ascii?Q?DZyzypUWFaicx/k9qDDsZaZ98B7Gjt5s+8SToKiQK9RnNuUah/skmeRna5qv?=
 =?us-ascii?Q?ttEdK85vhkNUGUDvQ7y7ekG6rO7JJhpV/jpBOx3VERZ6bsItF6SJro01B34Z?=
 =?us-ascii?Q?stZCl9FMjiS8RkNV63k1y7YK7sG5VmhPAMUei5I9rhAK/PE+sn8Lhu06ieFp?=
 =?us-ascii?Q?VZC8/rvXSlwbsthzhpgFSIN2p+UGmuX9rsCUgQ3LYoBevvfiVOLkSelLaK9k?=
 =?us-ascii?Q?YP2SOEL14v2fqLozatX9xdM6TV3Djm1xlq8rVg4QNUaPiC+5+3h2xZYPfB6o?=
 =?us-ascii?Q?QpDzcKCruUPjA8q5EXD21vSBZnMxuVbELalwr76TWbICfGupQrxB6+fUX1TC?=
 =?us-ascii?Q?a3+Tw+UczP5ozczB6Wjrdz8TAlGzWlRelObDXobRcEzgO7Iz1D93PI1EbtE7?=
 =?us-ascii?Q?W7Y+P/8+VSM/f+s8UmAsn9ZMkM2dNWsUom/xfoynG+hxS3cc4qT0Own4VQW0?=
 =?us-ascii?Q?Iios4koKwN+SCeAicPDKwDv4KKTEb6THj8vjM79v49Lc3en/PyoSzlGHpQoz?=
 =?us-ascii?Q?tMVNTz0sxKJR/tmcPGJU9UbOeyZEUKjfLDUm0PJQWk/Hg/bxDcTrFFjTv+z/?=
 =?us-ascii?Q?OvVFjP+lTxYbQOIQqmc3YqA8qNNkYT/6E1z79lBR5EVrqU1rs3zJmOOPT0+a?=
 =?us-ascii?Q?vpwhAkRyxWAuQLdxtyy/tLTIiXj6k//ZRp0rtu6cDvl514dEamtiaA+yiS7T?=
 =?us-ascii?Q?yez9O7uPA3ifipKTowHjD7/B4w9ombfNmIwkmxPGQk1qHyCBAR3OhBn80IOz?=
 =?us-ascii?Q?BUxTeiGKkaiGlLFkWXuAgr4+SQMt+zJGkg7VncWTzq4tz7/Ff0wkY9dBWWUY?=
 =?us-ascii?Q?RKY4aA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1F2D9D0FA4DEBE409B7879E4EF1DC6E9@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: BgVIuZSrfEH/Vd1dV4o0PDHnSJFwZ1ZVsnhgFnjYHqVkQ3VXF+TPQdAE3ZUhTyBmdkwV2gvMbixEI1oQx7a11zlYF/FuIykZGqdHFguUOnP066PJvzitK/G1NEAV2eWW4kaQdjg5aozvzETczdlvWrllAQOpFfIoUT9qP6q33EgMX+V6Qw7YPBHuuSjZOmYWx95+SFarxb4biOb486RpdbEJfBpMCtxl3mELZd9MX/pepB6cAgZ3t0tzgokjAgUKizt9Halx9UtaCh0iPimI1cJDq4MoFYfykebvOH+wfoh8Gf/Y4mMxumacq3aYndwpMdVS58vyZ50r1f/xdiML3eTmz95l8Jk3wmeJr2L3PK9fITuHlcn5/52Ic7dzlwZ4SEC69zdWS+BepbkrGhq3dnVN0Xl3Zo59lhbkJA+SwPi54uj73bAFlzQiHDUCZX8VUKw965jQ7TFplyLBhv7FUWLLYxiAulAX8BZIWy6DwWYy5nMZpwPqzH9B0GXlDbwpItZgCgU6y2x6XQr9kB1VHZi1pubBZeHW8bPExvd9PUzp9yKXFCYnp2W1iALzV4vX9nJ8ki9PF/sTQS87qgfDd8svyK24DPvnkkEInPSCutaT1xr922JqaPCZDD0SzrwktShQ7kkwPNnrQSV5MtLeUw+kRlDVyTvPYlu+RyiZjHHxPzquJo59Cw/YcmFU0PwUxQ9eCgUDpsp10CwauYhbyJwH/+fM67gxKsJK8KFn89UNreg4UOhepoeyyD5ntPOKE4QRd+YhzBFOJJirqGZa981EGJhbBySi3YC4H3BXOblgDEorRdf/ghb+uGLYAjs0NHbkC+IaOleGCNnvVGNm2vE7JceeL/YkhsPjsRp1K7BINhKO9yyQOL116N9fJrok
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR10MB5543.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09ee4f7c-facc-4b11-b4f7-08db271402b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2023 18:18:30.0946 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4G8Zb1e8FFR1qC1dV+OyPVTBXpjPRvhl2hBa0fQu8WLLNJzqpMC6QE8fMxp9JLh9lZXnMoGSu+3E+Or+WtcSAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5054
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-17_14,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=959 malwarescore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303150002
 definitions=main-2303170125
X-Proofpoint-GUID: 1aoPVY5MzlOmmlqICKmub-ls1l6vr9Tc
X-Proofpoint-ORIG-GUID: 1aoPVY5MzlOmmlqICKmub-ls1l6vr9Tc
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=karl.heubaum@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Did this CVE fix fall in the cracks during the QEMU 8.0 merge window?

Karl

> On Jan 16, 2023, at 2:42 PM, Mauro Matteo Cascella <mcascell@redhat.com> =
wrote:
>=20
> This prevents the well known DMA-MMIO reentrancy problem (upstream issue =
#556)
> leading to memory corruption bugs like stack overflow or use-after-free.
>=20
> Fixes: CVE-2023-0330
> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> Reported-by: Zheyu Ma <zheyuma97@gmail.com>
> ---
> hw/scsi/lsi53c895a.c               | 14 +++++++++----
> tests/qtest/fuzz-lsi53c895a-test.c | 32 ++++++++++++++++++++++++++++++
> 2 files changed, 42 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
> index af93557a9a..89c52594eb 100644
> --- a/hw/scsi/lsi53c895a.c
> +++ b/hw/scsi/lsi53c895a.c
> @@ -446,22 +446,28 @@ static void lsi_reselect(LSIState *s, lsi_request *=
p);
> static inline void lsi_mem_read(LSIState *s, dma_addr_t addr,
>                                void *buf, dma_addr_t len)
> {
> +    const MemTxAttrs attrs =3D { .memory =3D true };
> +
>     if (s->dmode & LSI_DMODE_SIOM) {
> -        address_space_read(&s->pci_io_as, addr, MEMTXATTRS_UNSPECIFIED,
> +        address_space_read(&s->pci_io_as, addr, attrs,
>                            buf, len);
>     } else {
> -        pci_dma_read(PCI_DEVICE(s), addr, buf, len);
> +        pci_dma_rw(PCI_DEVICE(s), addr, buf, len,
> +                      DMA_DIRECTION_TO_DEVICE, attrs);
>     }
> }
>=20
> static inline void lsi_mem_write(LSIState *s, dma_addr_t addr,
>                                 const void *buf, dma_addr_t len)
> {
> +    const MemTxAttrs attrs =3D { .memory =3D true };
> +
>     if (s->dmode & LSI_DMODE_DIOM) {
> -        address_space_write(&s->pci_io_as, addr, MEMTXATTRS_UNSPECIFIED,
> +        address_space_write(&s->pci_io_as, addr, attrs,
>                             buf, len);
>     } else {
> -        pci_dma_write(PCI_DEVICE(s), addr, buf, len);
> +        pci_dma_rw(PCI_DEVICE(s), addr, (void *) buf, len,
> +                      DMA_DIRECTION_FROM_DEVICE, attrs);
>     }
> }
>=20
> diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi53c=
895a-test.c
> index 392a7ae7ed..35c02e89f3 100644
> --- a/tests/qtest/fuzz-lsi53c895a-test.c
> +++ b/tests/qtest/fuzz-lsi53c895a-test.c
> @@ -8,6 +8,35 @@
> #include "qemu/osdep.h"
> #include "libqtest.h"
>=20
> +/*
> + * This used to trigger a DMA reentrancy issue
> + * leading to memory corruption bugs like stack
> + * overflow or use-after-free
> + */
> +static void test_lsi_dma_reentrancy(void)
> +{
> +    QTestState *s;
> +
> +    s =3D qtest_init("-M q35 -m 512M -nodefaults "
> +                   "-blockdev driver=3Dnull-co,node-name=3Dnull0 "
> +                   "-device lsi53c810 -device scsi-cd,drive=3Dnull0");
> +
> +    qtest_outl(s, 0xcf8, 0x80000804); /* PCI Command Register */
> +    qtest_outw(s, 0xcfc, 0x7);        /* Enables accesses */
> +    qtest_outl(s, 0xcf8, 0x80000814); /* Memory Bar 1 */
> +    qtest_outl(s, 0xcfc, 0xff100000); /* Set MMIO Address*/
> +    qtest_outl(s, 0xcf8, 0x80000818); /* Memory Bar 2 */
> +    qtest_outl(s, 0xcfc, 0xff000000); /* Set RAM Address*/
> +    qtest_writel(s, 0xff000000, 0xc0000024);
> +    qtest_writel(s, 0xff000114, 0x00000080);
> +    qtest_writel(s, 0xff00012c, 0xff000000);
> +    qtest_writel(s, 0xff000004, 0xff000114);
> +    qtest_writel(s, 0xff000008, 0xff100014);
> +    qtest_writel(s, 0xff10002f, 0x000000ff);
> +
> +    qtest_quit(s);
> +}
> +
> /*
>  * This used to trigger a UAF in lsi_do_msgout()
>  * https://gitlab.com/qemu-project/qemu/-/issues/972
> @@ -120,5 +149,8 @@ int main(int argc, char **argv)
>     qtest_add_func("fuzz/lsi53c895a/lsi_do_msgout_cancel_req",
>                    test_lsi_do_msgout_cancel_req);
>=20
> +    qtest_add_func("fuzz/lsi53c895a/lsi_dma_reentrancy",
> +                   test_lsi_dma_reentrancy);
> +
>     return g_test_run();
> }
> --=20
> 2.39.0
>=20
>=20


