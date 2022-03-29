Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF584EB10E
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 17:52:53 +0200 (CEST)
Received: from localhost ([::1]:55540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZE9L-0006YJ-E2
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 11:52:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nZE85-0005UA-1X
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 11:51:33 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:56580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nZE81-0004AC-As
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 11:51:31 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22TFmIcM014855; 
 Tue, 29 Mar 2022 15:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=WxLVC+BbPU6YEXKbJjXA9myi4ksZXBEMSsyfzHpxkG4=;
 b=0guKqRsnFlF5901jKJ5BFWVcCJLz8A2YImSV56bQ0HmWdr+LiVNUcloEH23C9kaEFApZ
 fyfKvsWF9vbpRqjgb6itebPYzsVH1LxnOPTrHp1NyjGXtHnzh+Z3KUTeRP+1fIrlNiJG
 2FflLcZLXxeXxJs4icahLbLVGTouDT5BM3nIjKxsBXTpkNXPuSCx8kcUTedD1kfj+0Mm
 tm7TqKeadVdcSmKH6nYy3RizyW07EYcIkJV9bXiRtbGiCIZyChloby/1vx1JNXXoJRgg
 EovcAyE789pXI2U+ew5lscs7V3FxNoea0qdzMF7pJRsDLJBHqxYg/hhhTISeyyxdDxCG Nw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f1tqb6x02-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Mar 2022 15:51:21 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22TFaw4v149749;
 Tue, 29 Mar 2022 15:51:20 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
 by aserp3020.oracle.com with ESMTP id 3f1tmykvg6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Mar 2022 15:51:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TCl58l3yHVppmhebOD5KmmxXMVMtVlbMesZPf5jNn6BxwLn6lBfePbTNyJP/Pd1FcNVgBXRggBsjf847MXkr9unez+1amRxigHcX+ZiLubWcQLTMKFJYD37egnCuuP1VWljUUm/3vaAyA9+05J3GFhQ4NVCCHDYbPPIbpUnvFKBvBC2xRspzDy+Ny+WMDGjDX+9YPcHl3nX3pneLEqeZSGTTp1zgHFmnoqrIXoIH2bwJm/hnHIa/7u5PE/E213wNdkXCaLY7ZyNQb/jcox0dFRO6oWYZdtgMlXUmHpPfAFmFbv5OTKFKHLrt+CstTw4/pxwxrDI5FrULPj8Gby+0tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WxLVC+BbPU6YEXKbJjXA9myi4ksZXBEMSsyfzHpxkG4=;
 b=Q45JPHH1zfeMMA7gSdtJ3qGY+jKHOxtIGfkmZbxNsXKcEmoJ97cZRcnqFdzNyRocqz5L8g8slMc1s4679v1nc1zYRpc90vGJGBq3X/FTvlKaq9ZTl8SERf4+l9gL1cSaL+EkvbGwzrAC0JTLcCfgd0//g2JnMMq0LkxlYJYiphuAJxSdbqheVrTw8ruWDWb4JS7rHRx4fW/wRQXgBpaqaIAfkqXo2zpieEtdzFGjctUTkKEoydfYDwayocK0XH6MIRTYSuRJTZbrgio9Wg2WAiG7AfNMKDgvpcbent5YE1lUX4s477atTKHTuJPfwmkfcd5KWt4Sz7Ic7PkiP56Alg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WxLVC+BbPU6YEXKbJjXA9myi4ksZXBEMSsyfzHpxkG4=;
 b=fxSxt5Qxk0A5Q1ObO3j2+LhqmU3Pz6h2djjgkU60j0YG4OWFvYjZHiK2kMylCPO6AlZE/Y2tXnUA8tabuPovdAkLLd5lDj5+2bmn5Q3jN/zkHZYjC+LB3ytOmrfS2xD/hSAESlDDegmq0DAjtN+vDfi1JDI+/pVvGUKVdQJordQ=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by PH0PR10MB5481.namprd10.prod.outlook.com (2603:10b6:510:ea::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Tue, 29 Mar
 2022 15:51:17 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a%5]) with mapi id 15.20.5123.016; Tue, 29 Mar 2022
 15:51:17 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v7 14/17] vfio-user: handle PCI BAR accesses
Thread-Topic: [PATCH v7 14/17] vfio-user: handle PCI BAR accesses
Thread-Index: AQHYQH1ggKGjl7r8gk6LjOzjnAA7wqzWVkSAgAAyZgA=
Date: Tue, 29 Mar 2022 15:51:17 +0000
Message-ID: <45272D4A-0625-446A-804E-3211F2D91B81@oracle.com>
References: <cover.1648234157.git.jag.raman@oracle.com>
 <1c2cc82cc72964216fb63270805fefb095f4d4a8.1648234157.git.jag.raman@oracle.com>
 <YkMArX56GKwOTsc0@stefanha-x1.localdomain>
In-Reply-To: <YkMArX56GKwOTsc0@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de4c5ebc-9204-4a3b-b95d-08da119bf656
x-ms-traffictypediagnostic: PH0PR10MB5481:EE_
x-microsoft-antispam-prvs: <PH0PR10MB54812BCA4CDC5112B32B263E901E9@PH0PR10MB5481.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dsf2yB4u2bEE5mF3YTHzKkRncYJtUyM8SvW+0tzyaHmdWUIbQjHi2/XihKYHXGc5gGyM662Vm1U7K0pKXSNpJedD2gahs5GAOzRvRUxXeOXQuRuuhSkNCN0hLJzOPu4FS0cLehWb0+ncD3TRQsXqjgz3w/A14PJdPwY/kvGkGGg8gLcGk5MnR50lZHeB/4XOwg06cS02OWmbfjL8jPrX/QB3y9jvPfZFPn9wo4OvkTbffkj+ax5oG3mThIb7GREOpF4RqeE5N589huke1ND2dBsKc8YU4LPBYJUIdAo4EZbPf3mDtfM2l0lkJ6EilAq+WtH8lGnIM8G8mlqFFpBudDPOSkm/A9ltjuioQIPMlK5uktR56CDZ3T7sqqqINUw4GKaTuXHIi/oTOBPtoz1fAQ5YQoHqeF6o2HSQH43W/hKOruRk/YcCOZWjEHXe74aZd0B+hl3+e6o5ci4q+XTvIySUdctAwv3Sbbk1UAbJRFfbcQWFE+TbWkNBX+XHLBtmEi/BSoQ92Zz/yS+BmlF8D+tIa6kfEznFErZhmJxN2ErHKHVwxIo7zww8sjfnOth/BiXn//Hv/6bxJI4XN3Rm4UjjtaqrrRN2mZtFuzpdv2ssc1SQLaxgmgjZL37zlJM8dYNeMBWEPzOivIs91ZMScyLlkgNqFpUDNQDIILzsQGsfXRiKjZN6ezQkThBsBCOZbUAxk7/++9GKiu64NM6XtyGtZKn2atjQ3/J3QZsyvyw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(33656002)(122000001)(186003)(6512007)(6506007)(7416002)(6916009)(316002)(54906003)(53546011)(44832011)(38070700005)(107886003)(8936002)(64756008)(86362001)(71200400001)(36756003)(91956017)(83380400001)(66946007)(6486002)(66556008)(38100700002)(66446008)(76116006)(66476007)(2616005)(4326008)(8676002)(508600001)(2906002)(5660300002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?XJav1Yph/QMl8zRIaqXbrSfKU0V41sr5ciNt16EiuetONJsXaIBLRX6myZ?=
 =?iso-8859-1?Q?Yv0CbCB7RNUNGqy//LHwK+p+0SzLyxBE6ZBa7j2rqWf0Uv/GMuMq9NBS9/?=
 =?iso-8859-1?Q?NY0dbCN5RPq96bElWVBeXcCdddLQrdpc+EOLNAmcWg3eLP1PYkWer+ZvMb?=
 =?iso-8859-1?Q?CdygZzH8zyrqoEFCAd3f/YKLBU1303IcnQoTUGt+RYszzaCYLY1CDQNbhp?=
 =?iso-8859-1?Q?sQtwD2t+kWByTTnIYwxREW4c1wfvub8nsQRazQv6p4DjKAa+KE/j/H3m04?=
 =?iso-8859-1?Q?J0p2rANiBpeWpeL29zsn282biWDRHpy1de45KIBGNTzwkcdozJZoYtb/gv?=
 =?iso-8859-1?Q?bvomFl3ayJiUVLu7vtoqhiKp9s+4vFSI7/3pYsBzlQc7OODp9LnMNafP6o?=
 =?iso-8859-1?Q?ZTJyeYOFzJQcC9lPJKtLX509VjLwOy0UNlkP6gBedLodScYv0Xw4GXJtMr?=
 =?iso-8859-1?Q?AkwpW6eQUg17JFPR9PjW8TZrjSUf4q9XQJd6MS7SnCvAPnJBW98OoC3UdZ?=
 =?iso-8859-1?Q?tBivuOzkl0pfh/qXVKzVzVnQZyD9hl0+Awk9TYTKFxT41uy256dBZ1Mulf?=
 =?iso-8859-1?Q?TwgfkltMQfisEXf+O/WuEdb1GGWUM6CjtqgJiVQ5S8mlONW0O9IDMCElh9?=
 =?iso-8859-1?Q?J6eOvltVk4Lygu3E5UGou5z0n+mBoQ8luRiU5DrCQLCUfO9lKzgTGBvuyc?=
 =?iso-8859-1?Q?vfJBHmeKSki3pwREpN8Vh9fnrAfgPSIxfKF353xljjuatUwN2nuvAWOAD2?=
 =?iso-8859-1?Q?cSnKZ9IVvUb88/du+L2WfEScZfrSF8EV8lXtI6apYthn6Ne3+52sYSJBDv?=
 =?iso-8859-1?Q?eqMFdN8hGdiXMNme6i46pTcovhGkFrApmWwh95SvqUw/zxoc7opbYrIgBy?=
 =?iso-8859-1?Q?rEoTPKnJbEgO1CzdB3tvycwnz5dMuJoi/vT5b8nQ+gk9cP+ehEmMf81jiP?=
 =?iso-8859-1?Q?04nYqmZJU1H5ytknfYF6l5iL6GOWc+hlFaJnGfgOT80xcOFsgfo6SyRxHJ?=
 =?iso-8859-1?Q?DkhlaDxn7kQ80Ds07xnHM/9Vn7UzptwEpeKcs7D/nplbzwjQP3sRvqf913?=
 =?iso-8859-1?Q?qe4HCmcEPYe2U6BOFX32ArJebKDFsrBfi93JsVw6E0Cx2MQ9Sulkf8bDIf?=
 =?iso-8859-1?Q?nYueUziMfcHmT4WvcJKmdlx81WOKR08Z02eAkBLRdjzz1dQbRvDNCuIQuQ?=
 =?iso-8859-1?Q?vYU5tzp63BwekxFzy/WAKRL9+WSze5aKEN/sL0syw/B8a9Hm5R9UiJA3vj?=
 =?iso-8859-1?Q?YGOg/RPwz3xBvT8AZxFVEISZw/vyLRF3o3BwbfG2gr0CB9b6Pi0bavkZve?=
 =?iso-8859-1?Q?GRvUqRKL39yM2rsc6oAo9zxqxS7E3C7QACiV45n2+uGl9VFYIW8Uii5SVN?=
 =?iso-8859-1?Q?kdNJWdETC+j/L6cpyTWLSYYMzobvsFu0Qnh7lh6Bgns6CFgWNNgZQxs4d6?=
 =?iso-8859-1?Q?YKPlDdcrFhIB2kuawHqmmGaIi83t2FJ7PbF85DWV5LrTXCnjeJ6HN9aDTz?=
 =?iso-8859-1?Q?NFfKyAj17bVpSg6/U3LADvepv3PE3oVvZdag7f9Z1mtJPV9LRwMlHfaBIG?=
 =?iso-8859-1?Q?HpJzjQKUBcDaf6V548uNcmAYAc7dcgoA7WkeelgvZ6PKiFjuLzWAb8gb1p?=
 =?iso-8859-1?Q?6XkeFqe1KuliJ/83AIltqWBRL8HI+9UgsPUyFuW/4FGCiGjBQvMDLrjPcJ?=
 =?iso-8859-1?Q?rPevIzUkG+mm7u62whS/sKSXz1VaxU0NqkteHFxBSYZdRPsaUWWA4P1fEH?=
 =?iso-8859-1?Q?MkGpvTmIDOuHoD/7yk6NYUP9myNlXrp1kB5mmkkb4iztwBgKQe91AccPrj?=
 =?iso-8859-1?Q?PpqxVPM9FrTbBEIuYjoTcibNp6oJ/V1JgfAzPABMGty5qHiUxvKW?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <7093DDE884BE024B8BAE1DFF15776FE6@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de4c5ebc-9204-4a3b-b95d-08da119bf656
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2022 15:51:17.5734 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TAmKLbsQVcrdgokr4j2v/nKvRzmNtut3+nGglEbTNKxZmKhPfB8Ovl7cl9yBM0h9je5CL+NSP8XEOV2Jgjy17w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5481
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10301
 signatures=695566
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 spamscore=0
 phishscore=0 adultscore=0 mlxlogscore=724 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203290093
X-Proofpoint-GUID: UUWgLLTaf2lHJ3hX_SULBXp8Npdxtase
X-Proofpoint-ORIG-GUID: UUWgLLTaf2lHJ3hX_SULBXp8Npdxtase
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



> On Mar 29, 2022, at 8:50 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>=20
> On Fri, Mar 25, 2022 at 03:19:43PM -0400, Jagannathan Raman wrote:
>> @@ -324,6 +325,170 @@ static void dma_unregister(vfu_ctx_t *vfu_ctx, vfu=
_dma_info_t *info)
>>     trace_vfu_dma_unregister((uint64_t)info->iova.iov_base);
>> }
>>=20
>> +static size_t vfu_object_bar_rw(PCIDevice *pci_dev, int pci_bar,
>> +                                hwaddr offset, char * const buf,
>> +                                hwaddr len, const bool is_write)
>> +{
>> +    uint8_t *ptr =3D (uint8_t *)buf;
>> +    uint8_t *ram_ptr =3D NULL;
>> +    bool release_lock =3D false;
>> +    MemoryRegionSection section =3D { 0 };
>> +    MemoryRegion *mr =3D NULL;
>> +    int access_size;
>> +    hwaddr size =3D 0;
>> +    MemTxResult result;
>> +    uint64_t val;
>> +
>> +    section =3D memory_region_find(pci_dev->io_regions[pci_bar].memory,
>> +                                 offset, len);
>> +
>> +    if (!section.mr) {
>> +        return 0;
>> +    }
>> +
>> +    mr =3D section.mr;
>> +    offset =3D section.offset_within_region;
>> +
>> +    if (is_write && mr->readonly) {
>> +        warn_report("vfu: attempting to write to readonly region in "
>> +                    "bar %d - [0x%"PRIx64" - 0x%"PRIx64"]",
>> +                    pci_bar, offset, (offset + len));
>> +        return 0;
>=20
> A mr reference is leaked. The return statement can be replaced with goto
> exit.

OK.

>=20
>> +    }
>> +
>> +    if (memory_access_is_direct(mr, is_write)) {
>> +        /**
>> +         * Some devices expose a PCI expansion ROM, which could be buff=
er
>> +         * based as compared to other regions which are primarily based=
 on
>> +         * MemoryRegionOps. memory_region_find() would already check
>> +         * for buffer overflow, we don't need to repeat it here.
>> +         */
>> +        ram_ptr =3D memory_region_get_ram_ptr(mr);
>> +
>> +        size =3D len;
>=20
> This looks like it will access beyond the end of ram_ptr when
> section.size < len after memory_region_find() returns.

OK - will will handle shorter sections returned by memory_region_find().

>=20
>> +
>> +        if (is_write) {
>> +            memcpy((ram_ptr + offset), buf, size);
>> +        } else {
>> +            memcpy(buf, (ram_ptr + offset), size);
>> +        }
>> +
>> +        goto exit;
>=20
> What happens when the access spans two adjacent MemoryRegions? I think
> the while (len > 0) loop is needed even in the memory_access_is_direct()
> case so we perform the full access instead of truncating it.

OK - this should be covered by the shorter section handling above.

Thank you!
--
Jag

>=20
>> +    }
>> +
>> +    while (len > 0) {


