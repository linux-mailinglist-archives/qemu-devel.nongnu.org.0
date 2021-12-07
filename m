Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD4946B4D9
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 08:56:33 +0100 (CET)
Received: from localhost ([::1]:59034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muVKy-0005lo-QS
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 02:56:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1muVEZ-0005c7-Il
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 02:49:55 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:62134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1muVEJ-0005iP-RN
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 02:49:55 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B74n8cA012536; 
 Tue, 7 Dec 2021 07:49:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=BxIrbxVqXdGBAf9KRPoiJlollU8w37Lg03Vmk/FtOVk=;
 b=dbIyytlYysQaO0uhcV2PGcM2U5FdIA3FCbWVYoCq5Gb1YkOev4g5/x0HXFjLhzBpNrhd
 u0J9MnNcAePmPcEmgb8ZTUBlWfrGfnf2Axxecnu87e9Z3AkAu9KtK8Lly0I/1sWC2c67
 Osqe16QrAJFZDzyXV0YXUG1vl9fenT9Nlr/GZZm3H6FQBKikoKSQESwXx0+BShX69bKU
 iI7f4d3XTeZvyernFco58D47zfOqHssKbqeYv50ZSB4IHEDG4GaKY+HgYcg9Pl77lbT1
 fHOkFjgEUe6u4CJWXVz9QhGjbGpDTYwbB7hnpvUi/AEP0DSgYDMcFrQXUy/vq98XPofd 6w== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3csc72cj5s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Dec 2021 07:49:38 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B77f8Xw066742;
 Tue, 7 Dec 2021 07:49:37 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
 by userp3030.oracle.com with ESMTP id 3cqwex8ug7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Dec 2021 07:49:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ie8JVTjNbIpFVFaMyAkjulndNVdhMeSsauMBpBG61xRPJxIMXnPULOAgIiYivmHzRpBvBv5uWPs8l6fbxHSqyGpnbGjqNpMjp9zq+8q3W1kPGFbwnLXRvvSZpdKvLjNYCZePXPGPGFOttW909LlKKoNa8qbl6MFiKoAOqUOxE2pxDm6HKYnJkxhvQ3TFGrByYS/tt4Un+HqBUyaxb+zTnfBnYOrfOkkB3GMIaZsyPOv6Cre0JhigU8EM69ZzZGvAJd+kyn2DVODTJ4CznPfB8+dufL1re4RLXb8lROONSzqHuHSBWwRXyH/3RtKMZ0DbGzj9dpFqxSqkEK1A9oy4/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BxIrbxVqXdGBAf9KRPoiJlollU8w37Lg03Vmk/FtOVk=;
 b=NRsrM6T2Rrq+fNoK59bLt9wNTOA7FZ87q0DiUZguvWfxxSVz3M3TIvn9bpz9JLKNEqMhD7nEr0F6S8VaYL+tK16ORSMFjK1Jn2/vvkqDATnOhgPXk8VLMiRjkdLQHSiH3pNhysTqJ+YQrvlESPUNESw67IjOeWKMhC6bh04zS8dhCNlxnx4E+zTr2x2pK5IhvV34mGZtjplCKXU721UfBRiJclvSSYyHgcrF5nuaG3+1OYDUKtzbHEVn3lQhcnnDA8VNU8HX8H+NR9fgFCN3mRkDUWtxQnAHr1MeLzAKFokETo1mnZL9e/xAJtQLpP0s3ir7sbWCHvCeZVlcR4WHRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxIrbxVqXdGBAf9KRPoiJlollU8w37Lg03Vmk/FtOVk=;
 b=xRZ+hfhElsjOO4nDg3/o1HmPCHZtbwdtY0iUAz5NIhCzjIxvcsAlrHQkRcaKeHjdsGvQDs+OMPSpKKVEmcI4AhCm7/iE0vAaZqbrxqmPnpop7n/H2VRPrCUykRnTB8Uh5wX7y3+u2aO83pJ+n2LdntSPx66XIGiQg8A98udsyBo=
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23)
 by BY5PR10MB4225.namprd10.prod.outlook.com (2603:10b6:a03:20f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Tue, 7 Dec
 2021 07:49:35 +0000
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::3c06:36a6:bab9:fffd]) by SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::3c06:36a6:bab9:fffd%2]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 07:49:35 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [RFC v3 07/19] vfio-user: connect vfio proxy to remote server
Thread-Topic: [RFC v3 07/19] vfio-user: connect vfio proxy to remote server
Thread-Index: AQHX0botVeSuVmI/VUSkx93VWzW8m6wLifuAgBtQhYA=
Date: Tue, 7 Dec 2021 07:49:35 +0000
Message-ID: <17CEA874-42C7-4660-96B7-0DAF7EAF0C7F@oracle.com>
References: <cover.1636057885.git.john.g.johnson@oracle.com>
 <69d83c41ca7fe9b010f73dc15fe6a7783fce5620.1636057885.git.john.g.johnson@oracle.com>
 <20211119154223.5e9bdf19.alex.williamson@redhat.com>
In-Reply-To: <20211119154223.5e9bdf19.alex.williamson@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7125ff27-8091-46e3-b288-08d9b9561d33
x-ms-traffictypediagnostic: BY5PR10MB4225:EE_
x-microsoft-antispam-prvs: <BY5PR10MB4225D7DBDA45E394A0DD9761B66E9@BY5PR10MB4225.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LR50rK/SkJWVybcc2Rrs/I1YlPxw7kSBJ7MAPcK+xNJjdXkTlZ2+/i3WXSweh1/o7sa9Dtb2OTN9Pyw1HvKXK3ceIM/ThYPF+KB/UUZDuTBPMkRuHXgexn4c2vcB2Ix1DrsXTNT/zOU42ReLyk8Vrd4KWvcqWfd3VX25S7zHd2krqwXZjUe2w9MsocEQi7WzXGQk/or8BOU19KbqRuuXH+MN4DldfixZJHWyC7n6qQr16qggugOEhlGkWsZtoF6w5DPGBEgf/ttWYOWZwO5AtdoXONdmdzak23j1EhNIXL+21l92M2pN99Uzn53FGS+iS8zHKpLq987KA0VTFxLCqUeGZkhp26kPjTAwPGqw4IId+jiPsqLwfJfEw4KhZzahKN7Cr/jcijtY7yabfYZuNTgu+6N0VbquY5wKS21qk67rWvr/Q82fCJaVrei/gB4GgtUJ2vhCPNyDh27J2hzzyvK5UFImH5CipYVJjRtW2tnTt/5LpLRr4PTgYzNCNVzmXPzx0FpsbieKTavVkbnomhKDyfhTKIOJ3PSUGG5nWN9glT7c+CpgXW9n4KBdaxjZeTk7Ig1hvd/dTC8J9OG8dqBfU08qg9ICx5b1xpKn3uitMrjQtdDPbrVacJCnrTn5Spp+IEfSoSesYQXi7GaZvaQMnHgskA3Z2go1BgamBy8T2K9RsGz3vi2vl/4ZsPOF8k89ubzs+Y8Q5YnxY+arX7PTEAW5SUMwiemd4/nURAqgJBgqhYRXmdft/BBRER4H
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4686.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38070700005)(71200400001)(6512007)(8676002)(66556008)(4744005)(66476007)(64756008)(66946007)(316002)(33656002)(6916009)(66446008)(53546011)(6486002)(186003)(83380400001)(38100700002)(76116006)(5660300002)(2616005)(36756003)(4326008)(8936002)(26005)(122000001)(6506007)(508600001)(2906002)(86362001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8pCKCBgVwWsZ97wXVxR2i+3gHkUwrzdyDMigbIruFunao+4zbEiIoajOhxWi?=
 =?us-ascii?Q?CqeRO8B6nDHppf68EekdATucHPH1A4aUYbE2rEbNhyXbo3BpQrxrzothP07M?=
 =?us-ascii?Q?0Xfg3KvnNfaf8ZdRRFFWs0rBqyB5/XoSk9WR9VIlKH/wQFukERyzuHRUSaIK?=
 =?us-ascii?Q?IviG/uviWFBwaopH41e02wradS9YgUpYcP2Ao4XzOs1e1y2inNzEw8qm3djO?=
 =?us-ascii?Q?vkFgyseDE/8SNTC90MAsG2f0KJ2iErRw8s9Oe1s3BBIHkg016vbEcOkFWmQ+?=
 =?us-ascii?Q?qf8xzppIqt/mcthASGKAkCcQFxHPZOUD0MFUp5G0Lzge4Vqb6AmTM5zeTO5T?=
 =?us-ascii?Q?hXKwVZCIuTfP5jxhpK4/ySH2SPPGaPqI6qmBicJuL7VoF7ZIVQN6UiE3rzS8?=
 =?us-ascii?Q?PWwdrGHgFo1b3O0xhwp9dr9O17qBG81K2eR23hno3fYjeZSz5G968qwYqYzO?=
 =?us-ascii?Q?Ps5Y2TNoMBKmxJsmKrtdZdNzKFDyXTCKGozK5TxSwJ1qXqQCYYlKtjiSV6u6?=
 =?us-ascii?Q?bBiF6kHlKlM0Baqe+9x7ralcIfTukoFZHC57lT9lwLmJCJVAVnozu8jDqsQ6?=
 =?us-ascii?Q?Tvaf4hkP5Q8FbpwBxzpvP0Z/2Ef5lqs+NhR+IIfu1fw4OFGERhBIw1E//xVT?=
 =?us-ascii?Q?JB/qXdLThGmqM9kiVuEx3e1aFLLxjUE1Hy2xPk2MDeVozljRHXjZPjyOj7/Z?=
 =?us-ascii?Q?oMc86CdZ1xOf0xXjOA5bEHnXzzOauhQ90wapifGZ6C6sFE6dz83GZSci5Bk7?=
 =?us-ascii?Q?hQRgpw/hEqqnrc+toKZehowbIRRr8t+AgFn/il6F8XsROcIwN2RX1zeUX4UC?=
 =?us-ascii?Q?EoBUAhToHAxDCM2rU2gHygyN4ZiBrPONFYerMca9f9+Qm1OhkVz1eEr82HTm?=
 =?us-ascii?Q?tjkdMoQ/gSItpkb7GfKo2HH2IFpI+ofs/nOaVbeTes4NwYzZxc8/Vm39lP/B?=
 =?us-ascii?Q?Q7JwMssGhjZEm6VOwyFH2twxBA+0jE6b7NQUcssqPXoCmVh9uCSqCFaeeElk?=
 =?us-ascii?Q?vLQSj36G9BHzglE6TRhpnfogmIW0H71TzButMu7ei8yqUaDhhmRc+kEADJTc?=
 =?us-ascii?Q?0DxR001pS4jNVzV2unQTXVBGugQkM/9uqZBg6mXmkwQwXAmcKxgKxyQ6KQsu?=
 =?us-ascii?Q?/8I2W/UxdCYdLqepmGly7e4uj2pci4K+raT3yAl6v6k5WZWsPE75xGrOji9w?=
 =?us-ascii?Q?GgUPBnhmrGv28KyopWfinZiqGf2a7bpk6fJ3jrQRjH45WbH8wC07CwbTZSy0?=
 =?us-ascii?Q?5ihpNpviW2paVC473rnUj45p4uS3bB9JhEX//QTDC9fjmIli2ptEKoJ9mCd+?=
 =?us-ascii?Q?ktaV0yhnds83OCvLJzAqCd/SnQuC1PTJzq4NbrXmHk+/zTH/yR9qCQubCs28?=
 =?us-ascii?Q?ZmuXLFmwDVDDN3u9TFL2Nxc+F1vYb339v1UhHQzbHbjhaEngjQlSx0PTs1C6?=
 =?us-ascii?Q?5WxAdbDpaK3dVt0pT4g6au/F7Q9vpmWD+AX0Cm/PTqntwlOUODMZpkKJ/kRE?=
 =?us-ascii?Q?CqZWHamWoHEg2t8i7AEEMLbnyG5sLashSX8KRhH1XoIaL7kifQ7//nVz0OPg?=
 =?us-ascii?Q?0VZK3cFG8wpc8aL2a0ZM98TGOOb3NqIzXRH8/FXh7Be2YyIUEN2e+q/w4FDP?=
 =?us-ascii?Q?ruzXpj3QTIm5LGR/9vgHYC45InlKiLuRRM7Lv+f046yfDQPqlAaIyBmiUD+V?=
 =?us-ascii?Q?W3msO4s87Iek/8HlNw0hAPBEGvE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F887CA04C0119248BE1420A699EA94CE@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4686.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7125ff27-8091-46e3-b288-08d9b9561d33
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2021 07:49:35.6795 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iUB5jKhsNObiaROe1uOSvzyVslTuLQu6wEBOOeN/d7b1h1Q/36DlaG8e/DN/8MDYDsF3PugL5lrWCC2xKO1r9lFnunBXKRXL05K5t3cs+88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4225
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10190
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112070044
X-Proofpoint-ORIG-GUID: IgBfXLDcDw_wuUNEr3Lt6cjuawsXJojo
X-Proofpoint-GUID: IgBfXLDcDw_wuUNEr3Lt6cjuawsXJojo
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: QEMU Devel Mailing List <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Nov 19, 2021, at 2:42 PM, Alex Williamson <alex.williamson@redhat.com>=
 wrote:
>=20
> On Mon,  8 Nov 2021 16:46:35 -0800
> John Johnson <john.g.johnson@oracle.com> wrote:
>=20
>>=20
>>=20
>> static void vfio_user_instance_finalize(Object *obj)
>> {
>> +    VFIOPCIDevice *vdev =3D VFIO_PCI_BASE(obj);
>> +    VFIODevice *vbasedev =3D &vdev->vbasedev;
>> +
>> +    vfio_put_device(vdev);
>=20
> This looks suspiciously like the initial function in the previous patch
> should not have been empty.  Thanks,
>=20


	It can go in the other patch

				JJ


