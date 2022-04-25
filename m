Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 762BC50E769
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 19:37:37 +0200 (CEST)
Received: from localhost ([::1]:33604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj2eW-0003kZ-1q
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 13:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nj2bt-0002tK-4N
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 13:34:53 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:36188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nj2br-00029g-54
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 13:34:52 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23PG6a2t017491;
 Mon, 25 Apr 2022 17:34:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=x9VLWnVNuMtJE9I8QzWdlVvQ3mLa1sk4VMGwvtPHJs8=;
 b=iHufcz5BgQO+VR3uTjB8C/VPAIYkA5lcBMmL4Dnz/1nAOKuWdKgkOiVzaKt/YkJNxsM7
 2VISjPTzF3WR4LHK9LpJxJePwENQzLHUyiOTKWdSblD2a8tdWRLpGPBpQ/yISCSxki9/
 BHSO84SUupOMgEzfa6V9+UjXcmVau2iO4p1FUHn8/Tnkr6XZX52W0JMW7mp3A6xCzVUc
 /FdSFmapy+AIrRmVGT41+N6fGOYiwgU3XQAqgi8uo4uveVkmI2cVQUeKVMH99amrcLL3
 F8yxEzx2g40oUddbUDifAsO8GSfJwST41e5RlhWgeXUwg5Q9zNXBBAKnrj2nZDe+Lqcs Bg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmbb4ku7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Apr 2022 17:34:47 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23PHUwEJ036036; Mon, 25 Apr 2022 17:34:46 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fm7w2fp46-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Apr 2022 17:34:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PX2zIZh54R9HvCXw6b3XgmvLc/WKPRs87h1GyZdIw23Pq/rogwljVZwo/GvDp0kKubn0d4c27A4VbfObOBpt9S1KSjMzV6FH+TClY9EU4poApkghtQEMXOVXhEuEuHGet3NWcowuodCSuzHNr9NtP0Sjc6PVhEYk1oiO99Ua0b5Vk80OFcIwN9F8FB08Oy3wRwJ1JwVSYgqszo4HaEXP5+latp0KY91dPyMCYeVlkgdbmyolpaknFDEfXBXj7KvT3CoEAPscPef55bRMfUmy2Otrh2PR82E2Q03i7eFHgZdg5kmHBnvlBp+aYf8XT+JrgE7MosaHpTRZmbLlQtaHWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9VLWnVNuMtJE9I8QzWdlVvQ3mLa1sk4VMGwvtPHJs8=;
 b=V2/Mwu1+CZ71KUeRSg313CU79Es5x9fW/mFhFC1ElvtjNoZ8LD9mrpUYirN0qDc/DSqzdRhr3OM26BHPY6xRYQzg2NBmZfsiPHEuH/hGHmO+4KI1sTXyeumtl8a0VLXJhZTrKSkgNwT0OtPEb4DD/LoTmQiY0sq9KqSjVJYWe0d8eywJMKuWvXJl3LpiZmDr0KeWJSigTodpxpyaB4T/zCL0srohEz8BZdr8b1Gm3ccUJQyUVLzDD/vvAkUuj2j+1HNITWvZKjjCBELUOOj39ylznrW/bcsUDpZ5+r34JVYJfUiyqQ1PxmgVWPYRjnd4EG48r98Wxr9UaDjl4pln/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9VLWnVNuMtJE9I8QzWdlVvQ3mLa1sk4VMGwvtPHJs8=;
 b=rpw/H8NQVwQC4qG1RxpmEITLJGl6zmLrxThXODOXJ5AA2XPfrsTVpxUYmMJrjq3bY0aNJPLDBXZu8T12SEeJVYEyVVJMakZzMyx+cKEMyoM+F2NF9FOsiIyLMjlN4pV9SmX0jZtiUHCl4WcEO//Ar+Zy8giTL0utujP9lvDC1XY=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BN0PR10MB4918.namprd10.prod.outlook.com (2603:10b6:408:12e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Mon, 25 Apr
 2022 17:34:44 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 17:34:44 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v8 13/17] vfio-user: handle DMA mappings
Thread-Topic: [PATCH v8 13/17] vfio-user: handle DMA mappings
Thread-Index: AQHYVC5kQy0YCRYTy0u/ggYMkZr9f60AbRSAgACADoA=
Date: Mon, 25 Apr 2022 17:34:44 +0000
Message-ID: <C75E641A-1654-440C-93BF-3AE223C60CFC@oracle.com>
References: <cover.1650379269.git.jag.raman@oracle.com>
 <e786c5991ac8b5830624305acaec31d8072716ee.1650379269.git.jag.raman@oracle.com>
 <YmZwRzW/FW97l/tp@stefanha-x1.localdomain>
In-Reply-To: <YmZwRzW/FW97l/tp@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56752f14-cf5c-49e5-dbe8-08da26e1e2ef
x-ms-traffictypediagnostic: BN0PR10MB4918:EE_
x-microsoft-antispam-prvs: <BN0PR10MB491834564DE240B7F206ABAB90F89@BN0PR10MB4918.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aoU9ul2VcchKsSXCRPkNlq7eIFQ+IAceaj/WMrhs2AaDmHjLyqlZPJWWI5dk6ggzGFGBq9apbVJVPRVlAplZt6Xy6kLrGP9GN/zCGqaRndS/t2svYirNXDOEFg6Qw1E3AjVRrdgH6MgprAP5OV8pWu+7o04wxxccAe/jZayeDD3jCVmmD70xPKckrS7Xz/pKIZwB1b5y54RZb6/IKxIUCkD9SHm8Ph8Bp8uOXsjyM7rBJHOunsqRFQLwNU4c65QwN/jiAP4wsR11PmGW+VRXKU64QVyId3LNMKbz65QjuWXo3KSTn4NyLF7rcUdQUMC3iVMeaFB4zH+Q4ULdOwwkN97nrjixq/vIVcRGNGp5RpXBDOXpzfKkOy9pT2fToGQ5c+9373KYNBWZGuLrYiFXT9RfDn5pS+/UiOEcFxdv6N7jSYngYAnysvj+qov2Ns9gNI2UGEwQQFbm6JCG5fCJ69GflK80uzusPMQ4fwEbUApvXdjWXnT72SroUdwXbiCuJGZl7dGyvVRHQ8ZGk7+oAuK8ZBa4vSHAJGiEJWhmUcTcXZ7wb6nXqEipwzhpMUWZZcSunmHmBq1dVaE3plxYy77kqv9bQZ63v+gAvoOKTwgCtXlUzj0lDBxG+Hm3jOlr8TxwUrR6lze4oUXpFO8UKrxedbCA40VVDKdZQP4NQzKF20lbrXpXcW2TYLgn+rYarGk1TvD4v0eh79RwwhVUjUn8Y/X1dkxzYf2q/vb2AQh6GBlISlP03YjXw6cdOEI5
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(316002)(64756008)(8676002)(4326008)(66946007)(66556008)(38100700002)(53546011)(122000001)(91956017)(54906003)(6512007)(66446008)(7416002)(2616005)(8936002)(2906002)(6506007)(186003)(4744005)(6486002)(5660300002)(44832011)(107886003)(36756003)(66476007)(76116006)(6916009)(33656002)(71200400001)(38070700005)(508600001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?5/FGsjUwp9HPORAOURfgTnsKWH+IwDgSMtkwsvEq5HMd1GGBN93NuokRHv?=
 =?iso-8859-1?Q?8xpg3C6DCvHyr0nd/x9xahWjcJWvcO4OCzEcqOLXNQm+1SxUzp3187W2Bz?=
 =?iso-8859-1?Q?fszGf76+ju300sbbH7aDdvmOGVti8H6zoTFGljoPISjvmAP9ZL7enFpX3y?=
 =?iso-8859-1?Q?IlnH7BjuLsER7ZeTZPPZ2z2QBuI2+9O0E3KW3MAiQWeGgEESKEpd0ED/ja?=
 =?iso-8859-1?Q?N7pfTKGZyHsgGpm95rJcL/8UfejF328UssBJ9DIOButLqKOeejQTT6g5Ru?=
 =?iso-8859-1?Q?7FZTwr/sSFqFNzhnx3IHpLNBytKBCEPuDXGDqQ0HGwcDHqNTRhHLilOaBK?=
 =?iso-8859-1?Q?rRps9RVsF1vSmembmsDIV535/CLPPZweRLscg91J4nyEBl+vSZhJIsc/W9?=
 =?iso-8859-1?Q?TimB8rHyOwTiameBKRlJTOWXIAlDXtUrcs35eTDeD1mJWTsxJDggfSFhyP?=
 =?iso-8859-1?Q?pPiKSo+6JaGk1/Sm9l5d0UiZ73uQKrMp+G3VNw62MHgD/TCKyRiRWvekIi?=
 =?iso-8859-1?Q?dBS9zYvH5tQ0jjcVtxdA0I+J2vpzdGgw/yXd8xrV34It3WYtY0NYztz1SG?=
 =?iso-8859-1?Q?LvFaZfHQnRe5cPJ7Jt2ZwnztQzzGOolN85Y/cXcV4clsiL4mC0SMjlRZFP?=
 =?iso-8859-1?Q?ITnTAiqnfRvcaGwtXaFMOnOEjLyvjq21EtNgXeVvWW1uiIcHM+7n5IDkk1?=
 =?iso-8859-1?Q?wE1VsNJaYuk2x5QNJUKQlPnoEgsNtw28K9h9/OX9g3Oj2oT78tyqTu8/Fk?=
 =?iso-8859-1?Q?MQ4GTVwZEM/GQnl8BarmNBf7qA5kgRzP23/1Ql7sypb5fAtUYjZFCQQZF2?=
 =?iso-8859-1?Q?b8gzs9RVwV9ubRLTE0fKRAX+vkD9UQV9BlUjM1vd3RB7aAlzHzNylGZzwC?=
 =?iso-8859-1?Q?G7z1fDa6TrSK9hURRrgPKXg+KZFYDUf6Ieuyr7N8zsKK/azUlk9pnz4yOC?=
 =?iso-8859-1?Q?yeeUbt109QLLuNW/EbWdUh+doiqFRYxuY7B/neqvHPQSYgADmGbvA73H+a?=
 =?iso-8859-1?Q?EJpqKwoKRl1If3F69CL8xX3zPpf8GZ0bNRPcWvqziy+/yUnR1b5lfoxEJW?=
 =?iso-8859-1?Q?seHI5A1OL1aOHo8fK7TZ9cLsXxdPkL2vwcuwWBR8MUGWs0HXnkK2ih1vM5?=
 =?iso-8859-1?Q?2CoErbVDZqnVY9AxIskVPIlaiW5DuAWorhS7s1TkVzao3uia7HevMZSXuU?=
 =?iso-8859-1?Q?jhGCwq8R85JhcNdsOwg6OYf0+WN0khIdCXdVVp8CFP6MAMqXpw1q8vHkD9?=
 =?iso-8859-1?Q?uW5wAgz/Cg2YAyqOsp38Ewp6roPh2tVb++6h32N2dH9FBYZA7u601SjVoN?=
 =?iso-8859-1?Q?urgj0f3ZY4eHWfAjQWMGHs1c6SXg4sU47yUa0dR7U61UajUA7WctAdJ2Sr?=
 =?iso-8859-1?Q?WTohS0qz45nZOQGlVvq0DEtFGXb+RIsYQiqj6MgTj0E6xISH1RofawXgh8?=
 =?iso-8859-1?Q?B3oqJGUOUOrXMQlpOG7AMF6EmO8sk9j7repZWHCRGSf3hv8hDEYLnRZiFH?=
 =?iso-8859-1?Q?SSdnnc7fcZP0dlbGLlze/lSZzl1VXDFaUyQ4idypAkbXs+2nfNpNTWI3Dp?=
 =?iso-8859-1?Q?ocF4wDN3HxTiBMi7fa6OrDzq7qhapAmMAEoMRlP+08RYkZ1JXZ8zcPx3FD?=
 =?iso-8859-1?Q?5/McXfyCu5r75IpsCghGNEjL7axKCjAkfBTncjVTU6ZFV86irkT1O5OU5q?=
 =?iso-8859-1?Q?+Fa1CXK/D5Y3er4mAZUdCrdxdVG0vrGhetPbM6f4SJ/6dvS2zC+ez+/PDk?=
 =?iso-8859-1?Q?pjr290vO5E1Qh/BkKY0Y7JyUgd9QE2H4nQTXCZX6ReU67cvmLP5bQEMVxg?=
 =?iso-8859-1?Q?/U6s6KaDOgrzGI68XMS0LpczQHp5Gw7lJBIqJqiX+0qdtJKFfYlL?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <E6367612FBB66C47884E03E3C94048F2@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56752f14-cf5c-49e5-dbe8-08da26e1e2ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2022 17:34:44.2745 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HaYSxWSqmvQMhKlj1uVov3SRx2554j6zxGtMnnvkA+9imgd4ifp+0FELWsa2t8GwNgPqFjp2w602pq3F+c93AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4918
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-25_08:2022-04-25,
 2022-04-25 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0
 malwarescore=0 mlxlogscore=929 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204250078
X-Proofpoint-ORIG-GUID: IFbfD0S4fVAeBSGrI7BAOtYxYaapatzw
X-Proofpoint-GUID: IFbfD0S4fVAeBSGrI7BAOtYxYaapatzw
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Apr 25, 2022, at 5:56 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>=20
> On Tue, Apr 19, 2022 at 04:44:18PM -0400, Jagannathan Raman wrote:
>> +static void dma_unregister(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
>> +{
>> +    VfuObject *o =3D vfu_get_private(vfu_ctx);
>> +    AddressSpace *dma_as =3D NULL;
>> +    MemoryRegion *mr =3D NULL;
>> +    ram_addr_t offset;
>> +
>> +    mr =3D memory_region_from_host(info->vaddr, &offset);
>> +    if (!mr) {
>> +        return;
>> +    }
>> +
>> +    dma_as =3D pci_device_iommu_address_space(o->pci_dev);
>> +
>> +    memory_region_del_subregion(dma_as->root, mr);
>> +
>> +    object_unparent((OBJECT(mr)));
>=20
> Where is obj->parent set?

Yeah, it should be object_unref().

Thank you!
--
Jag

>=20
> If it is not set then this call is a nop and mr is not freed:
>=20
>  void object_unparent(Object *obj)
>  {
>      if (obj->parent) {
>          object_property_del_child(obj->parent, obj);
>      }
>  }


