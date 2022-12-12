Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCB664A8DF
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 21:46:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4pfC-00005n-Rf; Mon, 12 Dec 2022 15:44:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1p4pfA-00005L-C7
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 15:44:36 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1p4pf6-0007AQ-Va
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 15:44:36 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BCGwnhb029926; Mon, 12 Dec 2022 20:44:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=0RJzgOmE4muxCPMCR5lYFsBddFn9aCdS9t5csqqQlxE=;
 b=myv+Al9qrCCJ/k1JjUw9yEZk/TnsRkT4BlxnuiIjkUBS+WraiKtCByvLwlg+27cleehW
 mPo6DWUWFxv/7hd7sctspZClpyCZe9yYU4OUWDwudUwzdWMy8QqKvgjC/qS4sIOFimsy
 rAAtQnQdKLQq4KGmgBeMybTPsgZj06ggK+6AsyM1DxX2hsiBbph1smE3oUnShti7MtG1
 rN3Kg1SNZnaW/n5ZL1tD8BuhyR5prhJeaxgMoyDAVueOnIbuEdjFYmYr3IOXjiMqnqSO
 HNlq7p34RTvpY8H2m6ZhnqGN5b6WfKL6sXj/DruxeyfFDLnDFhxztEACCtv4TFoI4tnY cA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3mcj093tuc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Dec 2022 20:44:26 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2BCIrVPq017622; Mon, 12 Dec 2022 20:44:25 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3mcgjavu11-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Dec 2022 20:44:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hASD28jYkREoaoBb9CBPkepJ98x9ZRuioxsTcnf0ZOJs0e/AnPY6Qr8JBYnPHwIBl1MUevt2216lWlqCh8g81SVanKh7TmM80hWWij/SlOO06HI+Sw4I2bBW426QP6QKza2ir09JmmNn9aZ8iM74bpJbUeHw8N4kgKLrtKhTuE81eBTuuEh5q106X3pPWyL3+OkKD2ijb/sZIskCSWgxJO1bU9d+TYelLe+xQfJlMS82Mqp9q+N03Bnf2iYKdmzEQYVme92+nBIExQcPmFPsR1pdoRYrFQPirLvmTbT7rRdy6gUCtohVE4a6Bend/ZjGGs5Bn5D1RHU+CCOJ9/XTXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0RJzgOmE4muxCPMCR5lYFsBddFn9aCdS9t5csqqQlxE=;
 b=SBtNqD/APKf+N+2VUaVeLBrMKykfmyhJ4x7OnFKpO+NKC+byCXcDX5cjyweYCjb+YoarX74Yoo2s3YF7Vq+hSi2eztCnX1gDXudLSMLAneuTJRn7yAJG+JbSNcE5+SzHsnyX8KXKhqiRNdno0tH7f1Jq4werj54WB69DNM+MF+5vPSQSj9/aum2ylCCkSRJJeJYb1e3j9D2X+xqi8UzoniL1oWJd/0mTndxB+WYoLJTN74mrCoPwHo0xqroSpbx9N6bl1B4/SMQ3SP8nGfdlOT7uoTwpmmD5802y7TqqjgpFVGTXQno7/Mr1yxyEkm0gcJWfRWxiK65QcPxD0VSRLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RJzgOmE4muxCPMCR5lYFsBddFn9aCdS9t5csqqQlxE=;
 b=0M5UHHgYvaNZN451/rtthJ4QrAQNZ2GliaquMBxy/b2m9g/EcGBFYKL4NqxIOzYxUaEKa4BnHfLlu7fpUEKx1nwUql8gh2rSBv5/2n0G0rR/EysxMwWAPNiGMNmCZiXGxJzmAwYlVjcFgK5MVunGnqvzimbOQ657gMBnnLjldJE=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by CO1PR10MB4579.namprd10.prod.outlook.com (2603:10b6:303:96::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 20:44:23 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::4636:bc4:6c76:2486]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::4636:bc4:6c76:2486%4]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 20:44:23 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
CC: John Levon <levon@movementarian.org>, =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?=
 <clg@redhat.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v1 06/24] vfio-user: Define type vfio_user_pci_dev_info
Thread-Topic: [PATCH v1 06/24] vfio-user: Define type vfio_user_pci_dev_info
Thread-Index: AQHY86IWgNgFw7KcwUyH35/qW0p7F65qKWWAgAAiFQCAAAv6AIAAlk4A
Date: Mon, 12 Dec 2022 20:44:23 +0000
Message-ID: <CF6BB82C-86FA-40BC-8853-34E6A37A5A67@oracle.com>
References: <cover.1667542066.git.john.g.johnson@oracle.com>
 <957361f0e497e0b95f10a3caf617fe04d9c6fb72.1667542066.git.john.g.johnson@oracle.com>
 <78476e9d-0d40-12e8-075c-ec4ac84aab32@redhat.com>
 <Y5cKhIY/F4/BwORD@movementarian.org>
 <b44cbf94-051c-6e3a-9d6e-af60d817e222@linaro.org>
In-Reply-To: <b44cbf94-051c-6e3a-9d6e-af60d817e222@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR10MB3255:EE_|CO1PR10MB4579:EE_
x-ms-office365-filtering-correlation-id: 58ca959f-7ac8-4f01-3158-08dadc81a6c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bMBcbR8isekE7p5fkpEsHwmZXu6E0EzzSDQLNNk0v24+ZPkTNO6FgsokT1md5yge/EcveN8vIprHwuMnK+p/gQ37EVatfNbv3UFC3AdQpf5eITd3lqB/Du2X1PsSc67+UJ/JFQg640ebCFs1ichxlC+2OYJrjXpbFXxGlhiwbYiYgwbKpLxU9JKdQMclXuf7iMq2A3ZS5eVygWLs+a1Yc61fpfergORkP297eSZJX+oRUS+6EK6cI/wAWUEwMhdbswbu3nw6GKrM9LBRI1CD9MLW9MSHCEp7IG6By8hWSwH1njVcXbH8ui8OwJrwt+VQ82gNufBLV2h9VDAazbRj+70X7aMWFXT21Hz2nLZFWeDTV7dCb/yD7Fn2i4XepQVJ/qekgrcQv8+XpQtLKtMIcYnEafOuGwC74U/mKhgDVeBzNy11a23ivOpihtEWHXBKaHgPblTNTbDB+aaW1T7gqJlNR91p9wwlRKpZxDAxLzf97v61c6ZaS+G7oWRDl28LDA1ei3wlc+saIViXuJcRXhFcZ9o8xq8v2Z5BMw7keEiX0TI9KndAIY4+oTh6lK+l1oXuXAf9lJfTKQU/boahj2M9o9Fv0CJlZb4iVwhdmYRlx240Del4LNIjyoJaIslpfROaZ6UT77FRNYW5zOp9BOldqiR+qtCcuZDGXuk9JXfIVTK7dR2h4xknl7/KZLMMonzA9FTdsLVnX/y0cKxdE6xs6omonVFvya+7p+WB5CQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(39860400002)(396003)(136003)(366004)(376002)(451199015)(6512007)(6486002)(122000001)(26005)(478600001)(186003)(53546011)(6506007)(71200400001)(2616005)(38100700002)(66476007)(66446008)(64756008)(66556008)(8676002)(54906003)(41300700001)(76116006)(4326008)(6916009)(316002)(66946007)(2906002)(5660300002)(8936002)(86362001)(38070700005)(36756003)(33656002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RXRhREtmNEtBc05yRWlZNkNIb0dLQXFMY3Z1TVpkdXNDaGtTQkhRQVo5cGh1?=
 =?utf-8?B?SGNvbjlZZDJrZU1EWGY3cFF1RDFwbVUrYU1PbE82MGN4eTFLNVlWWnVNUExs?=
 =?utf-8?B?dzNZbTZwRVdQRjR1SFJZSE5IVHJ1dGYrMWdCN3E2WXFGVS9nSVpGMUMxYXpP?=
 =?utf-8?B?bk1IYWFEWlRMU0pUdXV4eFNqd3JZd05JdkgxVTkzTEFHdUxQVTMveWtuemlY?=
 =?utf-8?B?TFhvRGhPSm9sWDhpTVoxOTkyVFlEUTdOQ2FZdDBQK0FZd1lheWxUU0ZwRFR1?=
 =?utf-8?B?amtLdDRXa1B3Z2JrMHlodTA3bkJNTWFkVE5la3JLZnB2aGt2eVJ6YzNITHhD?=
 =?utf-8?B?eXI0SHI5S2pzd2szT2ZrdmxURnpmQVNlT3l2QnBWeTZocnRFZ1BvTXN5WjVM?=
 =?utf-8?B?RHBoSlRiRysrYWtFODFYcFo3dUh0MlZCYzJ5R1dERDBYcHAxV0VRTmJ1U0ph?=
 =?utf-8?B?dmhUV2hnOWpFZW42SXhZelJFa2VsL29acVhFanQxWXBlZWFBWFd3L2VmUklE?=
 =?utf-8?B?UUh6d05zWDNCWnVMQXpWNXJoZ2trd2pTVXYxaHNuakhiZmpCQ2doZnY4MDVR?=
 =?utf-8?B?V3ErYTdDMmR0dVVlQmRFOGJUbmJkRkZWNlpuNXp1dFBKSzdhaW5CbWVac2Nn?=
 =?utf-8?B?eGd2MXY2TkZmclBwemN2dGJjVVBzNzUvWms3Z2kwbkF6WVFWSUxqUkVRblVW?=
 =?utf-8?B?Zmw5ZFU0RWNUbndWMzlCdlpOcEtqNWZKVnFlbzFoQ2hHdmFrQ1ZIYTNxZWtG?=
 =?utf-8?B?UlRaOWNKUk5IWHIxLzIraWUzYVBHQjh2N3NiOXZGQWU0L2ZVZFo2ZVJYK3h5?=
 =?utf-8?B?cnN6V0lHWG5EUFJES29IQjZsV0FCZWRKSGswcjdaQ1lUdmRnT1k0QVNDdXFj?=
 =?utf-8?B?MGpoSG1kMWpqZm5uaU9Vb0JUTUhkTTk1bjhUQk1LSVA2bjUvR1dHUWszU29Z?=
 =?utf-8?B?M2pUK01KODl2UXhEZm1WTjNFN0sxL0Nnb3FIYnlCUnIxbUtuOGl0cXhOaXdm?=
 =?utf-8?B?YjhvbzFzQ0ZlSWdubkFQcWN0OVR5K2VkeWFvcTVHYW1hSHUzSHNqeWg1Y1E5?=
 =?utf-8?B?U1Vrb0VlWk9BeVp3LzhOdlFpVDQ2emZTY2lvamFwM21Xa0RZRUlHVGlzenVs?=
 =?utf-8?B?V1FzbGVaaHRLZ2V5aHJ0NkNUL3R0Ni9objN6eHBZNHBINHYvbHUzTlhsZzNa?=
 =?utf-8?B?WURiN1ZQZjJtME9UTVJodEVmMEkzMXF5akVFWlFQdkVvMHZrUUZEWExMbkta?=
 =?utf-8?B?QWVlTEtOTDRRb2Zjb2ZOcFdob0RFVStXS2ZydHZqWm9QN2llNWFJbHRBaHRF?=
 =?utf-8?B?NnRqdEpNRDlOaTYvNFlqSVhhZkZZTGNaV09FNUJaRUVNY1NSTmQ0R1Jtc245?=
 =?utf-8?B?cm1UaU5tWU4zZktTSTdWSi9NanRzb0NvRjZ4UHVmUUc1YzFQQkE1bXM4Znps?=
 =?utf-8?B?ZmZIelZBeE9kTlgwdFI5MnZDbjMvTkdsb2l6K3A0V1ZrVmxvRmdZbUVFc2x3?=
 =?utf-8?B?VnF2UzV3QzkxRTQxOGtwbnNVUVZlWGhjU0lJenZBVU5PdXlNWmVmaXpNdm43?=
 =?utf-8?B?bGdLS2kvWmpzMGNBUXQ4Um03ZVZHOFRpbGl6QzZ1TWNlTis1bUNTdUVkM1pl?=
 =?utf-8?B?dGRYd01pYkdLNFFIOFlUT3VML3hBVVREeDVtVlNBYUM3VVFhSFlxQ2UyRlpC?=
 =?utf-8?B?VWpTdXl5RDBBVUJ3SmhpQ1I0T1ZHSGlqbEp4WHRLVFlUNEtjNzhqakhsdmZp?=
 =?utf-8?B?cHYwQVFqYWFxa3JrZ1QwekFoZkFBUURvYzBZYkU4NVB3QlZiUVozUHpRUmZm?=
 =?utf-8?B?ZEducUg5b0krbndXcUZ2UlVPWllRNkFIWTE3S0sxY25Gbnd6SzhpVGFvUkJa?=
 =?utf-8?B?L3Y2S3ovbTMrQ1JzUUlPYythb0FMRkJXNFBqSmRQWEFWZUpOczNBNDR4WFE4?=
 =?utf-8?B?SmRBamVnUXQzak1vOG9iMzkyWFZuWXVyTE4yR2FMazZnc3dHcXFOSFJjbUZZ?=
 =?utf-8?B?UHlTL3NPTmcwMW1jSEs2ZVVQS25YZjFpeUhvM0xYN0R3NkdwWk9zUUhCTEZ6?=
 =?utf-8?B?VG5PSGhJT1NpMHljQjUwdjkzTjI0RHY1R2xxZzJML2h0VGpIWHdoUlJKaFRF?=
 =?utf-8?B?Q01jWUk2M21uQzQ0RCtqZFl5UXp1MUJOZm1tOUNKZDlYRlFwVit0WXEyZ0ZC?=
 =?utf-8?B?bXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5F42D4425F57B94D99F2E818FAEE467B@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ca959f-7ac8-4f01-3158-08dadc81a6c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2022 20:44:23.3219 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gClGw69HhHUtvTRvHbjLtHZ3mCdPef7jN2lJIhRMzZzeKcly15lfoF8u7gNEOAD9YAK6HWfx4Z/CMI7u21GGv18r9o4vzjsNa67ix4aLgs0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4579
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212120182
X-Proofpoint-ORIG-GUID: iBr8CzRBaHnPTixZQM0RPFh6nKU0mOqS
X-Proofpoint-GUID: iBr8CzRBaHnPTixZQM0RPFh6nKU0mOqS
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
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

DQoNCj4gT24gRGVjIDEyLCAyMDIyLCBhdCAzOjQ2IEFNLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTD
qSA8cGhpbG1kQGxpbmFyby5vcmc+IHdyb3RlOg0KPiANCj4gT24gMTIvMTIvMjIgMTI6MDMsIEpv
aG4gTGV2b24gd3JvdGU6DQo+PiBPbiBNb24sIERlYyAxMiwgMjAyMiBhdCAxMDowMTozM0FNICsw
MTAwLCBDw6lkcmljIExlIEdvYXRlciB3cm90ZToNCj4+Pj4gZGlmZiAtLWdpdCBhL2h3L3ZmaW8v
cGNpLmMgYi9ody92ZmlvL3BjaS5jDQo+Pj4+IGluZGV4IDgwYjAzYTIuLmRjMTk4NjkgMTAwNjQ0
DQo+Pj4+IC0tLSBhL2h3L3ZmaW8vcGNpLmMNCj4+Pj4gKysrIGIvaHcvdmZpby9wY2kuYw0KPj4+
PiBAQCAtMTksNiArMTksNyBAQA0KPj4+PiAgICAqLw0KPj4+PiAgICNpbmNsdWRlICJxZW11L29z
ZGVwLmgiDQo+Pj4+ICsjaW5jbHVkZSBDT05GSUdfREVWSUNFUw0KPj4+PiAgICNpbmNsdWRlIDxs
aW51eC92ZmlvLmg+DQo+Pj4+ICAgI2luY2x1ZGUgPHN5cy9pb2N0bC5oPg0KPj4+PiBAQCAtMzQy
MSwzICszNDIyLDkxIEBAIHN0YXRpYyB2b2lkIHJlZ2lzdGVyX3ZmaW9fcGNpX2Rldl90eXBlKHZv
aWQpDQo+Pj4+ICAgfQ0KPj4+PiAgIHR5cGVfaW5pdChyZWdpc3Rlcl92ZmlvX3BjaV9kZXZfdHlw
ZSkNCj4+Pj4gKw0KPj4+PiArDQo+Pj4+ICsjaWZkZWYgQ09ORklHX1ZGSU9fVVNFUl9QQ0kNCj4+
PiANCj4+PiBXaHkgbm90IGludHJvZHVjZSBhIG5ldyBmaWxlIGh3L3ZmaW8vdXNlci5jIGZpbGUg
PyBJdCB3b3VsZCBiZQ0KPj4+IGNsZWFuZXIuDQo+PiB1c2VyLmMgaXMgaW4gdGhpcyBzZXJpZXMs
IGFuZCBob2xkcyB0aGUgdmZpby11c2VyIGltcGxlbWVudGF0aW9uIC0gaXQncyBub3QgYQ0KPj4g
UENJIHNwZWNpZmljIHRoaW5nLiBTbyBpdCB3b3VsZCBoYXZlIHRvIGJlIGh3L3ZmaW8vdXNlcl9w
Y2kuYyBvciBzb21ldGhpbmcNCj4gDQo+IE9yIGh3L3ZmaW8vcGNpLXVzZXIuYw0KDQoNCglUaGUg
dmZpb191c2VyXyogcm91dGluZXMgdXNlIGEgbG90IG9mIGh3L3ZmaW8vcGNpLmMgcm91dGluZXMs
IHNvIHdl4oCZZA0KbmVlZCB0byBtYWtlIGEgbG90IG9mIHRob3NlIHJvdXRpbmVzIG5vbi1zdGF0
aWMgaWYgd2UgbWFkZSBhIG5ldyBmaWxlLg0KDQoJCQkJCQkJCUpKDQoNCg==

