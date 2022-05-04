Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8849151A1BB
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 16:04:52 +0200 (CEST)
Received: from localhost ([::1]:52468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmFcZ-0003ln-3C
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 10:04:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nmFZE-00018j-DN
 for qemu-devel@nongnu.org; Wed, 04 May 2022 10:01:24 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:32514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nmFZ5-0007Ca-Fv
 for qemu-devel@nongnu.org; Wed, 04 May 2022 10:01:22 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 244DAPKD003197;
 Wed, 4 May 2022 14:00:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=xMAMK01qv0wZMz0Hn3t1VgGfhdwF8Hoz16VpYoMxmwo=;
 b=AX4oBdH6WUca+/qZ5y+4Lb9/Nq0UC/Thrfh8oiB01bpJf8xvB6tTm4h5cKwCLwz/bNlC
 Ozy1T4zsEUqxAkzoT+PjZ58NNiSceWQJ6QynQKk7t4XMaoLIAuUNjUR9Js4sfelrkdiP
 kPOpD9GtpY2wCy4DWecR3OmAQakvbReXuJDD2bZEoeotPFHcAm5JZD+ZZPL/zwgaFByJ
 7eZ0OcPMDpR6sMmNanGxqF3aWHVB3q0jMt8jH7LKZ/erqhHuKTkN9wLBO5UEGBMcU1ru
 BDoDYfzSLOtGm23sG7bwMcuiLfDu1kUX+/SLH2xjcTSPOQXvw7Z+oyzlJkANaPaKX4E0 yg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3frw0aras2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 04 May 2022 14:00:57 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 244DuUNr014356; Wed, 4 May 2022 14:00:55 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2049.outbound.protection.outlook.com [104.47.51.49])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fruj3e14v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 04 May 2022 14:00:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MfHvFSdX+7REZITRrg6yerTlpiEjoS5lcUH6tY+zpmWeoRLfXeUzLEMyWTPxWEoE0TOCqBVY8m8MgeZUyWKO8kejoYvKAqz3NsJ+JksizpqJY+8EdDE8vFOCd4YHJX26TpXF+vfsIuftYIleaMAWFGWZPXJRiPfhFzealmuWJ+CpikX4GOVb8B2+N6PwG0nt5n8V3+00k+27NgllyeBw2g6YEegv8lsgx2R4HKagzg3PFg2/pg0H2Lh3OxQYD+LQiofWR0JtHdvhtUhfZJD8Z4QmB+GllT/ebv1vsUKVKqrmZ/DnDV3no+IjxCyPYoI/EvVme7du/l7Oy6u1mQkryQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xMAMK01qv0wZMz0Hn3t1VgGfhdwF8Hoz16VpYoMxmwo=;
 b=FTfdtfyLeGic1PIPCsbSL88atDry2OJwoNDKHo65Y0tOtu4Fc6wZakOqwPjQoMiesLtHq8ByoUSAMKuTl8LqvmbPayl8hiu/x5SroHaNCZmK4EErhR4F+NSK3iuYDyAybZeJRduXFF4ym/vhbyonVWkMMEyyO9fybiP4kQFjt8ufvGcPHSCOFx+QcP4CeEVOm7bvYc/vtt9AN+RwxYpfT+v7bOwc5yvQ9o0vSvFdAMA6f+rwFFPD+XTIqRrNysIlns0X0vXcP1/XzzBE53heCxowShzGBWume+U5uZDX29AxS/bak/RVXRAWRAXHQMfzW1BqJ9gNKIYAlLr/KzZv7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMAMK01qv0wZMz0Hn3t1VgGfhdwF8Hoz16VpYoMxmwo=;
 b=dqNHHEK1T8DWmxNJreSNrRdpx/5JnuPnU/X9GrB0bt1RpqNHXOEXEG6Jv2Jd3Lty6M5A2SafBu1boWeHDdZr6QtOvTNnBAcUl/r1shUM2/gmHdBe9RNEz725rXtMu7USNkwpGIn+3MDTO28MgEOlP/m3ARg/QE8EkbQqcElHLAs=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DS7PR10MB5069.namprd10.prod.outlook.com (2603:10b6:5:3a8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Wed, 4 May
 2022 14:00:52 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 14:00:52 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Markus Armbruster <armbru@redhat.com>
CC: qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, "f4bug@amsat.org" <f4bug@amsat.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "thuth@redhat.com" <thuth@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>, "berrange@redhat.com"
 <berrange@redhat.com>, "eduardo@habkost.net" <eduardo@habkost.net>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "eblake@redhat.com" <eblake@redhat.com>, "quintela@redhat.com"
 <quintela@redhat.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>, "peterx@redhat.com"
 <peterx@redhat.com>, "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>, Elena Ufimtseva
 <elena.ufimtseva@oracle.com>, John Johnson <john.g.johnson@oracle.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>
Subject: Re: [PATCH v9 02/17] qdev: unplug blocker for devices
Thread-Topic: [PATCH v9 02/17] qdev: unplug blocker for devices
Thread-Index: AQHYXvh5w3EAJ0Scsk64+04Uorib660OkfPdgAAu1YA=
Date: Wed, 4 May 2022 14:00:52 +0000
Message-ID: <E1DCEB6B-6E5F-49C8-B9A9-55CBAE1CECA5@oracle.com>
References: <cover.1651586203.git.jag.raman@oracle.com>
 <01e8950f954c291acd74c9caf1d2016e898cd80c.1651586203.git.jag.raman@oracle.com>
 <87ilql7dq9.fsf@pond.sub.org>
In-Reply-To: <87ilql7dq9.fsf@pond.sub.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d8896663-bc73-41da-3ea0-08da2dd68063
x-ms-traffictypediagnostic: DS7PR10MB5069:EE_
x-microsoft-antispam-prvs: <DS7PR10MB5069DA07B1985C46C5F6D89A90C39@DS7PR10MB5069.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5ZieVsdaUfeMp5Ek1LQfwLIU4qZfShFl6zGDzge+4G+sLUrYITu8oc91JILecmWVwZUyTogP8vMon/j1ntpA0Awla27424bHOEgmWUPAsTU7ii67NuBWv4brxigLp3pXD46aF7HjSaATigxo1TAukrLmivYzM++xqB1F1VpnRud6T1d2C1DV6T5syxE6YoCb+zXT9fouY6dpZn6l7l9w7Djw/jI3qzk52rD/rRgcTbKdT5tHWyTH/52k4NwMKx/vTExheMd1riPmt1Db0aaadLsASCsbbQ9PFbJ5gULh6iaiz631Bo7CmhK9O0b2tMvFFn242xMbgn6+PaKtfoUg/gS8rIKRCHHi+6HZB1/TYjlYM/5X+nzsrkUB+y7Cnr7nwWopPCQ7Gi1m6b1B607iqF+XPT5Z0qmoPOhnSuMSqibbjIT6tyxBTyrtFl0pXglYWll54McqPg2NsXTK3cjSw0QxcTgZmKeDUH8X/dkzk11xq0t9PYCJ8OnGX9ylusExLigVBpUyFnvObYQBBWEH86Lwqt2LuCtJgQ0m8dX2HOwmkGSVElQsuHSkgYlPrgIElPbFhcT/dDNJujbFbVYkOT1S5Tmkva06q7XV4Jb/NnL2Lorgb4nYRtUy2GrfcbSNTcRZ8+rLuQ8rSzncmr18qvMV56weJLzeASxb8GqZTeH6Dn/ezFFdN/CnPAESo/mBZ4mtz6DRIS1/ld4JMby5VJyzCxxbsj0YrxK0+H1vtCM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(91956017)(8676002)(4326008)(64756008)(2906002)(66476007)(36756003)(33656002)(8936002)(38070700005)(66446008)(66556008)(6486002)(76116006)(38100700002)(186003)(44832011)(7416002)(508600001)(71200400001)(107886003)(5660300002)(316002)(66946007)(122000001)(6916009)(54906003)(53546011)(6506007)(2616005)(86362001)(83380400001)(6512007)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CzG22FgrD8rbeouZPC96AEd9riR7MhErcJ/AwKB8Vt0bqfCY6Fii+cBtShkf?=
 =?us-ascii?Q?3b6DGcFXOcV3AmwKhgSvvktBUXzN1L+ShJl0WPfNjC92C+CFb6sfO6zLnsVy?=
 =?us-ascii?Q?o49O1qh0AAYMRVaD0sY4+JUmHo0icX+EEQNyYmiOEkIuXSoNqJQ+YoHdOKnf?=
 =?us-ascii?Q?kY9DrpRigpWXwMKgAqM6icIXoF/EsSpEXC7sJ36uPcWq4utwOB9Ldmxhz9EB?=
 =?us-ascii?Q?98RovbMcSzv1mSodbJjKhEmRLBEoLOELSKB/0Q8MLlVGbP1Ooo4wACN5PE7n?=
 =?us-ascii?Q?D0hD5mdFMBVfBA6oP+6ig+Rny6Ir1wfZE06KpXhfEr7MRMliDuQqyiEUTu8L?=
 =?us-ascii?Q?tYQsVRjpPVaAWXI8NvaZdwHzrEekJ11shruU86529cbm4W48BYzy08nqMDUf?=
 =?us-ascii?Q?u8abAr2blmyWKU7LPIG6zcMiBOybqHJ5wmFILRnv0OxY0Y/B3J/8nK+bFY6q?=
 =?us-ascii?Q?JH5AbWhzYNzU7cKB+ZKaaervukjuSHhcjIsLyoywecAE7K1H85HfatqwJKSb?=
 =?us-ascii?Q?CISD43BNi9EsHYWtSeHv+wiCIhH8olMeZ6hmhoa4jJg+MQJUsvO9qntN6Xmz?=
 =?us-ascii?Q?ZCgFWw0U+PqrksawUK6gR2tKgDLvy5zgnGgyLDdvnm3w5DdYu6i64pcAL5sd?=
 =?us-ascii?Q?VgQtuTtTBC6yMZ5jc/JKC5qyJXtAIUZ23idZthzp2T+jFGxAgeMIlDN39G7+?=
 =?us-ascii?Q?7m1HXuqKRlx7Im3LwUFYu5k+aGMyvT0/3wQxwD+soyxfqZG/xGCCyNbjeejz?=
 =?us-ascii?Q?lmatKvMdBT4zVGzJf0xv1pDh+o4+36f4RcxpT4dbC7uFcMwhpbm7TllFYg3k?=
 =?us-ascii?Q?qJz1MQtjTZbmuS9EXR6Lt/utGIgoAwC3rylamPVpjjz31EPcmdjrw9Wh2dqv?=
 =?us-ascii?Q?oJGfG53Du9zEXeXEXlH46W0iZMkT41Y3ya2hZktOR0jx+NPWiq4WWxgVjrnA?=
 =?us-ascii?Q?sLoAG4nZhB5Bz3z4W8epR72rMj237ENAdX62mWTLwGgpApPf0VDKZr9puVI1?=
 =?us-ascii?Q?hgd+zUT8xGEh24LkDgI7Qw4Zn480+cnPX+IJX2YAk6LzuSq4JrQpDdsNWPg8?=
 =?us-ascii?Q?jSuJKxwldSbTK/U/RD3MJcfp0v1RkUGENJQpPikSEnznQ7yLPPTqtFYdZJoa?=
 =?us-ascii?Q?lLY2vop7AOdsgBCZbqaOkR1aUzq9oAThGMxb8XCK5zWpj44JLHovNd9hLDg2?=
 =?us-ascii?Q?6uDOIUM9Y5T7QeN2g0FzdU71NyQODua6Qrh8Oe+9ncSQRUQkHehSrNTG9qHa?=
 =?us-ascii?Q?ZSje68/xbyuJwGGcoUqVnSYT3xvDL+4fv4rHCA/8M1h1ksPAC1VSBBR7P2mW?=
 =?us-ascii?Q?pID3C46P2rZbWF5UknarQ68s8AtrteIxjoR8ubiQsCdRUWxklOGOIuqFsDcf?=
 =?us-ascii?Q?gTlJFXqmHIhcprCBqOcQdnbqEWyFDbJLSvskvJ6kjDaVljuyzCh96Lml2EMu?=
 =?us-ascii?Q?GqM4VgPp0AwBUOffmV/LlLz2jn35p0HvpBr/aTCudcP3sBqt2/OGmDat1FEQ?=
 =?us-ascii?Q?0kK9HouVBapev2QcFCpTlWWcq3XGBD247E9XTWHdth6kg31Go3cBc1sT8XGG?=
 =?us-ascii?Q?NrHymzn9SvTS041mPfDgpYXTSGncjjgJ6x8EsAKnpRhI8Q2EqpQA7B+dx/C+?=
 =?us-ascii?Q?hGrQrm8BmJ/kJmR1j9nRkedvk3OAbQ1HWPkGbphXCNJ7Jif45fLAfiSIM7v0?=
 =?us-ascii?Q?jWHe9yoRsA+8+Jc3uM6AkqBMG601BmyHxAg6lkz0HgmmOFFaIFUSWpKgJrE/?=
 =?us-ascii?Q?PxD1+Eym0974sw/rNqKAU66EyQJbSck1RzOKHGujFxFzGSSL0SIe?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <17509A0D14090B41B374F732FF1965FD@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8896663-bc73-41da-3ea0-08da2dd68063
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2022 14:00:52.6273 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7hFtS9ULafB0S5j1+eUuzmVnnUsTpuEJC5A9jqKrT/7PR0S+cPiZBZSozGa4xGAp+gepEzNmLYqwXi38QPbnAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5069
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-04_04:2022-05-04,
 2022-05-04 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 mlxscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205040089
X-Proofpoint-GUID: UFe0O059x_HZ876feHkCnZ2lSl4fuIuM
X-Proofpoint-ORIG-GUID: UFe0O059x_HZ876feHkCnZ2lSl4fuIuM
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On May 4, 2022, at 7:13 AM, Markus Armbruster <armbru@redhat.com> wrote:
>=20
> Jagannathan Raman <jag.raman@oracle.com> writes:
>=20
>> Add blocker to prevent hot-unplug of devices
>>=20
>> TYPE_VFIO_USER_SERVER, which is introduced shortly, attaches itself to a
>> PCIDevice on which it depends. If the attached PCIDevice gets removed
>> while the server in use, it could cause it crash. To prevent this,
>> TYPE_VFIO_USER_SERVER adds an unplug blocker for the PCIDevice.
>=20
> Appreciate the explanation :)
>=20
>>=20
>> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
>> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
>> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>> include/hw/qdev-core.h | 29 +++++++++++++++++++++++++++++
>> hw/core/qdev.c         | 24 ++++++++++++++++++++++++
>> softmmu/qdev-monitor.c |  4 ++++
>> 3 files changed, 57 insertions(+)
>>=20
>> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
>> index 92c3d65208..1b9fa25e5c 100644
>> --- a/include/hw/qdev-core.h
>> +++ b/include/hw/qdev-core.h
>> @@ -193,6 +193,7 @@ struct DeviceState {
>>     int instance_id_alias;
>>     int alias_required_for_version;
>>     ResettableState reset;
>> +    GSList *unplug_blockers;
>> };
>>=20
>> struct DeviceListener {
>> @@ -419,6 +420,34 @@ void qdev_simple_device_unplug_cb(HotplugHandler *h=
otplug_dev,
>> void qdev_machine_creation_done(void);
>> bool qdev_machine_modified(void);
>>=20
>> +/*
>=20
> Use /** here like we do in the other function comments nearby.
>=20
> In case you're curious: it's GTK-Doc format.  It's intended for
> generating documentation from doc comments.  Which we don't do, and
> perhaps never will.  But let's be locally consistent.

Sure, will do.

>=20
>> + * qdev_add_unplug_blocker: Adds an unplug blocker to a device
>=20
> Recommend imperative mood for function comments: "Add an unplug
> blocker to a device".

OK, got it. Will update the comments. :)

--
Jag

>=20
> More of the same below.
>=20
> [...]
>=20


