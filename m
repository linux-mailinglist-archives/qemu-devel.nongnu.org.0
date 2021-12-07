Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A5646B4FB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 09:00:46 +0100 (CET)
Received: from localhost ([::1]:42266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muVP3-0005Gh-J1
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 03:00:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1muVF8-0006P1-EF
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 02:50:30 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:20108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1muVF5-0005ut-8b
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 02:50:29 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B74ZwDP004022; 
 Tue, 7 Dec 2021 07:50:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=sug+bLtapL1DlsfvxjBs7iIOVvNAn9nsTnY57aCk4SM=;
 b=wmhECXX9x4kk1S3pxONLk/9cvsTNoAN+GaWKOfDUSj2PDzbwtwzZS7PqMKvH/pz86jer
 8qKSEjOySBv7V8pG3RX47/VPBr2iY5AJ6glpA73CragU5n0q1mu/Sp3ROsB3FeEoY6Ep
 cMvW7X6cTzqRc/1PAh6z/XhUp/38RVdmiIWFNmsSx7wCuuFpwnApPoznbbTfNE4UXd+u
 yVPv3nO0pSuBwjoGC7rP3TYw/vi7N+kkSOXU49Ql3RyrfS9//XUldBZV1BnYwddisgvL
 kLDaBf6PNngkS8IeQ3UYqJRkXYgBsm1nwDvcfcjOvAPpty9x7BGs47os785HYP7jJwL+ tw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cscwccqa0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Dec 2021 07:50:25 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B77efbQ008177;
 Tue, 7 Dec 2021 07:50:23 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
 by userp3020.oracle.com with ESMTP id 3cr1snjggk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Dec 2021 07:50:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A1yhkBppuwczH9PknccAPna6T2Z6vN2LJmIBuS12DxXO1finEjozb0mOVPCqq59adccJP/8FQS27ZMg4Xz3mMkF0tp3yvD4yd8tQIkIFEhgSxZwyCy8U6+FJ9XBMl4wGDbfG5o3/llOxfpHnFPIIGVfgETHOZF/mcW6ABJIAfftOgGSCqf2+C+iR+pQEnCpF4DRmTJJ4sqpVecboQZmgWVqY3p/wo0nGZYRzifYMKSqPRQY6rfmoRBKqe13iEhPsTSr0yd7Ps+QvDZWj8mkPVBYxyT61/aJRIYqH37OJIVWHNpc4NdX5RcE/+jdjZu1Ii6wH5onBnqBxS9lgcfLtvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sug+bLtapL1DlsfvxjBs7iIOVvNAn9nsTnY57aCk4SM=;
 b=ASsE4GlHMRKuMF1aMjbGVkwVCWLpC/12/E5dzrR/NYNC24r2TZWvoE9CctDBEa6HmCFPHJuDAnAXxzFRUQxhsOZYQYd04TD6vqnCmKIpOUQ1ngy2swTAdO3pTsHBil2zN+VQIGydKSswml/beIKDHz06Lq7lbrXmOm22/RXe8nBEfVp2cYh+IEukkeY+nUizzh8qTCgskHtRXERuRrV6a4jexgkrC2YkJ0UQLucRnNC3c/rA2+UFstZ0auiS8COlVK/Nt4EI3UEuExSK2sW0eATSvk6qyHW+Xg34IepHTU1keSbz5RYwiAV6dE4cUlc9dos4v0yAeWIbyKZwE0Wiug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sug+bLtapL1DlsfvxjBs7iIOVvNAn9nsTnY57aCk4SM=;
 b=MGVaDJmTxxp2oBZDwMbKPLApHPVqvx56OtOhAsdylSGepQJNP5tSHuGOEJTwjBvObyPdMQDW5VzrI5ZU6+q9ebl5oGpD1kM/HIl43Fw/pv3+JNvPKXdUBxnRMhcGS91wGC0TRufbIetAGDgLsKH96TuHt/eKbAI888Z/274DSZo=
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23)
 by BY5PR10MB4225.namprd10.prod.outlook.com (2603:10b6:a03:20f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Tue, 7 Dec
 2021 07:50:20 +0000
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::3c06:36a6:bab9:fffd]) by SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::3c06:36a6:bab9:fffd%2]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 07:50:20 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [RFC v3 11/19] vfio-user: get region info
Thread-Topic: [RFC v3 11/19] vfio-user: get region info
Thread-Index: AQHX0botHpNIiLqImEevreaQ2JynoKwLigEAgBtQtAA=
Date: Tue, 7 Dec 2021 07:50:20 +0000
Message-ID: <A6456315-19FE-47C7-9FC7-A935854CE69B@oracle.com>
References: <cover.1636057885.git.john.g.johnson@oracle.com>
 <32606ff56a2dd3f0d9ceaa91feb6a3c3fa6b98d5.1636057885.git.john.g.johnson@oracle.com>
 <20211119154228.3f33d8da.alex.williamson@redhat.com>
In-Reply-To: <20211119154228.3f33d8da.alex.williamson@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d68d3634-ac03-4707-53c6-08d9b9563818
x-ms-traffictypediagnostic: BY5PR10MB4225:EE_
x-microsoft-antispam-prvs: <BY5PR10MB4225ED943D8B8E70E947C4B4B66E9@BY5PR10MB4225.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IxYQmgQCF+vBRvd3AN7bM3kHcf5Moi3ps8vJ7Coc8YJwqkM4eEQliUSrIeV55py2so4W83YX2BCOUA1uFX7svheptaeI3Q0Ny6ohiV6fU5zIF5desWozZUUVU9XvJwuUBxepdSWybfDtpfi6jhMVd0HyyADn/9yeMCzndHZHo4NTJjw2oDOxt5myRRqf0A4li9vF2yHd3L2CJpXYwUeqWKVNjq4VOX7wJ14I3R+t+rdO7kAfzwJ4WFTCDpnlSdVJlliiiq+Y46QF3MkVLn+roK+ADsPRLhqbaCadI3cSuY8ZKcaksSfAke6SC2m786OhjzhiKJ6bQWtihZ4uI+kmhmRjmrZWZJ2iPzJm9qhTW49ek+XPDRQaEHP41oOGETzr1mRxUOO1GklbcdUvDbcwRYCobnLutrLalOLatWsFlUhn4XO9mwuWfZqI9WFj5KeZPld1YwGfSLRcvkXcOQIlee+Y+gA+GXsRaeUjvhOfGXdZhmL8M44avFM0dYVP3VXkiXE3hIa4xUE3hS3oFhVCaqczZF12ksEjbqB+CPvRqf5ke0ih7PvVRdCkxT/HUu/tPFrkbXthMqQOaaMscvoqrrtFNdK4xWfVdWR+Ydg6dz7g22i2lGZwCi9zXrlC8ksbf/vK6KyoZJPf0LSgoX2Qr0lWbs2+AX8nyHB1WS8Mr1YgyIFVi7BUB/KaL7yfF4E4+F5j4Ruf1EXx2ujjqlJWNcEVIHLbLARxF7wgFDnI05M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4686.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38070700005)(71200400001)(6512007)(8676002)(66556008)(66476007)(64756008)(66946007)(316002)(33656002)(6916009)(66446008)(53546011)(6486002)(186003)(83380400001)(38100700002)(76116006)(5660300002)(2616005)(36756003)(4326008)(8936002)(26005)(122000001)(6506007)(508600001)(2906002)(86362001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?anhsNmF5WU9NTjBCYVRHak5IWDV1Yi92ZkhEVExEdTFaRnp3RnRzWlNKWVM4?=
 =?utf-8?B?NVJ1VThiMitHVklqalNWcGZhU2tGYkZmT3RyYUxoa1U1Nk84RzRESG94M1Iv?=
 =?utf-8?B?eHEvZUxMK09pdEFMVXYzNEd4bnlBUUdKY0xHUEJiZlQ1OG1qc3ppWnNra3hZ?=
 =?utf-8?B?TndIcFA5UE15aGpOQUtTTy9KMmZwVzh5SFFVakRrMUUyVi9DdXlSY1poQW9Q?=
 =?utf-8?B?MnZOdjFndkxLNjVxcXh4bjB1RG0yMGR3eFpucStUL0Zyd1pCcjNkWE9tRERV?=
 =?utf-8?B?LzByMTJHejRYQjRLbVFLQVRZbTBDMHZETlkrK0lrMkdvVkUxUm1NaXNVWEJk?=
 =?utf-8?B?aWxUTWN3N29pSnEyODFIem42Z1NNSElMQjV5MjBxeFBNNFpaLzJrYW9YOCtk?=
 =?utf-8?B?S1ZTUWtNcXluNlhmQ3JyUjgxc3JvelZhQnVHZ2lQTW1IZFVvTDA1b0xDYm1z?=
 =?utf-8?B?QzBZNTl0ZDZCWFRiRmJWL2pKZ01INnZyY053SFE3WDhxTjJZQ3YxRHJOa0R6?=
 =?utf-8?B?Q2NUR1JGRXJJZjh4b1ZlQ1VZaE1nSFJGWE05UjdDMDc2V1FZMkxSWm1ySEZG?=
 =?utf-8?B?OFhZY1JSdU04ZWJITHZlYmdhVFRWTzE1S2Z1dTVmZDJzeTRjYkswakhlQ29s?=
 =?utf-8?B?WXJQaUpIZGthWnRJWTg3WEJEUHBrNHdvdHNZdFVkYUtSNHpyeDZIWkh1b3lV?=
 =?utf-8?B?T1RxM3FvNnowRnJrbzQ5MEMvWWZoMXdrMGtiT1lQY0lqb3BpUWN6NU9EbjVi?=
 =?utf-8?B?SExmcm40TG44NTZraE5VY2lNRXdQVklob1k2TEFyQ1FyTEN5K1o5S3d5V1pI?=
 =?utf-8?B?c3I2RTdLbVFXWFNhaXZRWFkrelQzNXExaE5haVZzditGc25sTmVranFlWWZ4?=
 =?utf-8?B?NWVIbnpaem9WZThXTjdFMG9EVDA0QlgrWit1MlV4Tk53MG9qSmM1Um41c2Js?=
 =?utf-8?B?OUJ2eGRBelBxQ1MwenY1SWIwMHVjSjhEbmZwY2VnSXd1UFE4TExLRFczbTdO?=
 =?utf-8?B?YmdHckZ5TmVrNmw1WjB5S2o4dENSN2tndTFyUzArU0NJcWJxQnBMdEMzRjRJ?=
 =?utf-8?B?NXFPaVVJSERQY1RCaUxUVjVzSCswVTFnQXJrUWF2TnpWeWsvQVRPQThzNEpz?=
 =?utf-8?B?Rk1Jek9paVQ5eGIrcDhZeDQzZEdXZTBtanEyL0NJbWNzVVpHOExtVHdxM0wy?=
 =?utf-8?B?Z0h0ZEwyanJMMmxoZWVQMFhma0x1anlxRHc2em9GUUh4cGdNYytOdWJqcC9y?=
 =?utf-8?B?a0VVYXorR0NjeWozM29YK1c4bWVBaDUxUENqVld5RHNscHFKWXNSZ3VaNFJR?=
 =?utf-8?B?bHViNDJYTDJRNkpmVTY0Z1ZlVk1zcnZua2NmU3REYlJFOUVqWHVtMmF5SDUw?=
 =?utf-8?B?THpYdlJJalNwZjAzeGFLTFRqSTN6THZqYlBkNEZUc1Vjd3NBeHBwd3RaRlBW?=
 =?utf-8?B?ZEc2TUhvRzVMTHhGWld0ZkVOakwwZDAzZ3FmV1JYbW8zcENRVDI5TjluRW40?=
 =?utf-8?B?VzUyK21hdGQ5UncrZGFTSHFMcjZrNjRiSkJQMUF5YlpsOS90cnNkTVFmUXMx?=
 =?utf-8?B?ZHBpSnV6V0xUR0pPN3JGZ3BPQ1daRU92UGI4ZDZEMVg5NE8xTGo3V3VlaEVo?=
 =?utf-8?B?YnlxSXZMVEoveXFOQkNQSDMvcVpUblRIdEUza2N6MnhKSWlQNE9LbnpFa0ZB?=
 =?utf-8?B?Vng1U0R2OW5EaWNnbnhLRjBHS1ZocjdWNGZRRDFGZ0xLTkwxUS9PVFlVUFA4?=
 =?utf-8?B?eW9YQ1h0MjNTWmUxcUxQWmxZRm82QlpjbjdYc2tNejc3TEhkd1k1T25YZVRx?=
 =?utf-8?B?T3BrN0ppYUw2Ykg4VUJlTnZmNDFReHE2MzVtTGxaSmZXV2Q1eGV1Q1c3bjFn?=
 =?utf-8?B?eDd5QWdob1BRZ0xEMXpBWDZEVnR5WjBTcmVqQkR0T1E1a0NKSDNnTEQ3R3NK?=
 =?utf-8?B?NGthVktXaS9oOEVVdUo1M2IxY1NtcVRJOHcxdmxHNndVanFaOHlIQzFnTVNk?=
 =?utf-8?B?ZGlEZUVXR2ZrN2U1SkdGNjBjN25YWVBpcjQ5ZVBrQ082Ukt2WTdCZENDVjdG?=
 =?utf-8?B?aXFTUkdsYkZoZXArMEs1QWhHTXhrc0RXclNyV3NXV1ZrK0djMEFBRUtlbUVp?=
 =?utf-8?B?VW50RTlnWXlvNFFEQkhYQml4d3oxU2tvcGNNaTc2aEhjRXBOTWpLV09iYWhD?=
 =?utf-8?B?dzJsVCs3YXFZTmhnTi96YnNIbUo3UlBDQjFSSWhXOENpaTY3VVJUTEl1M0JK?=
 =?utf-8?B?UTYvQWZEaU5lb1BZQSs0Ny9ZdzlnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1647A83B8CECFE4C989E0AD2534E9159@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4686.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d68d3634-ac03-4707-53c6-08d9b9563818
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2021 07:50:20.8299 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b/hdswDcCMoUO1zzbVGNg/L5UQ4ZWSErImmaBmt0i+NY8upEBl2awNSLoKUf8NpBeqVJMNqVOdwTVEV2OE+Kk1O+zsN49Zr459UrbTfl10g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4225
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10190
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112070044
X-Proofpoint-ORIG-GUID: D990aqgDi1JC2llR94BeUIVdNJ6twsQ_
X-Proofpoint-GUID: D990aqgDi1JC2llR94BeUIVdNJ6twsQ_
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: QEMU Devel Mailing List <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gTm92IDE5LCAyMDIxLCBhdCAyOjQyIFBNLCBBbGV4IFdpbGxpYW1zb24gPGFsZXgu
d2lsbGlhbXNvbkByZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IE9uIE1vbiwgIDggTm92IDIwMjEg
MTY6NDY6MzkgLTA4MDANCj4gSm9obiBKb2huc29uIDxqb2huLmcuam9obnNvbkBvcmFjbGUuY29t
PiB3cm90ZToNCj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBFbGVuYSBVZmltdHNldmEgPGVsZW5hLnVm
aW10c2V2YUBvcmFjbGUuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogSm9obiBHIEpvaG5zb24gPGpv
aG4uZy5qb2huc29uQG9yYWNsZS5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKYWdhbm5hdGhhbiBS
YW1hbiA8amFnLnJhbWFuQG9yYWNsZS5jb20+DQo+PiAtLS0NCj4+IGh3L3ZmaW8vdXNlci1wcm90
b2NvbC5oICAgICAgIHwgMTQgKysrKysrKysrKysrDQo+PiBpbmNsdWRlL2h3L3ZmaW8vdmZpby1j
b21tb24uaCB8ICA0ICsrKy0NCj4+IGh3L3ZmaW8vY29tbW9uLmMgICAgICAgICAgICAgIHwgMzAg
KysrKysrKysrKysrKysrKysrKysrKysrKy0NCj4+IGh3L3ZmaW8vdXNlci5jICAgICAgICAgICAg
ICAgIHwgNTAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4g
NCBmaWxlcyBjaGFuZ2VkLCA5NiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4gDQo+
PiBkaWZmIC0tZ2l0IGEvaHcvdmZpby91c2VyLXByb3RvY29sLmggYi9ody92ZmlvL3VzZXItcHJv
dG9jb2wuaA0KPj4gaW5kZXggMTNlNDRlYi4uMTA0YmY0ZiAxMDA2NDQNCj4+IC0tLSBhL2h3L3Zm
aW8vdXNlci1wcm90b2NvbC5oDQo+PiArKysgYi9ody92ZmlvL3VzZXItcHJvdG9jb2wuaA0KPj4g
QEAgLTk1LDQgKzk1LDE4IEBAIHR5cGVkZWYgc3RydWN0IHsNCj4+ICAgICB1aW50MzJfdCBjYXBf
b2Zmc2V0Ow0KPj4gfSBWRklPVXNlckRldmljZUluZm87DQo+PiANCj4+ICsvKg0KPj4gKyAqIFZG
SU9fVVNFUl9ERVZJQ0VfR0VUX1JFR0lPTl9JTkZPDQo+PiArICogaW1wb3J0ZWQgZnJvbSBzdHJ1
Y3RfdmZpb19yZWdpb25faW5mbw0KPj4gKyAqLw0KPj4gK3R5cGVkZWYgc3RydWN0IHsNCj4+ICsg
ICAgVkZJT1VzZXJIZHIgaGRyOw0KPj4gKyAgICB1aW50MzJfdCBhcmdzejsNCj4+ICsgICAgdWlu
dDMyX3QgZmxhZ3M7DQo+PiArICAgIHVpbnQzMl90IGluZGV4Ow0KPj4gKyAgICB1aW50MzJfdCBj
YXBfb2Zmc2V0Ow0KPj4gKyAgICB1aW50NjRfdCBzaXplOw0KPj4gKyAgICB1aW50NjRfdCBvZmZz
ZXQ7DQo+PiArfSBWRklPVXNlclJlZ2lvbkluZm87DQo+PiArDQo+PiAjZW5kaWYgLyogVkZJT19V
U0VSX1BST1RPQ09MX0ggKi8NCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L3ZmaW8vdmZpby1j
b21tb24uaCBiL2luY2x1ZGUvaHcvdmZpby92ZmlvLWNvbW1vbi5oDQo+PiBpbmRleCAyMjRkYmY4
Li5lMmQ3ZWUxIDEwMDY0NA0KPj4gLS0tIGEvaW5jbHVkZS9ody92ZmlvL3ZmaW8tY29tbW9uLmgN
Cj4+ICsrKyBiL2luY2x1ZGUvaHcvdmZpby92ZmlvLWNvbW1vbi5oDQo+PiBAQCAtNTYsNiArNTYs
NyBAQCB0eXBlZGVmIHN0cnVjdCBWRklPUmVnaW9uIHsNCj4+ICAgICB1aW50MzJfdCBucl9tbWFw
czsNCj4+ICAgICBWRklPTW1hcCAqbW1hcHM7DQo+PiAgICAgdWludDhfdCBucjsgLyogY2FjaGUg
dGhlIHJlZ2lvbiBudW1iZXIgZm9yIGRlYnVnICovDQo+PiArICAgIGludCByZW1mZDsgLyogZmQg
aWYgZXhwb3J0ZWQgZnJvbSByZW1vdGUgcHJvY2VzcyAqLw0KPj4gfSBWRklPUmVnaW9uOw0KPj4g
DQo+PiB0eXBlZGVmIHN0cnVjdCBWRklPTWlncmF0aW9uIHsNCj4+IEBAIC0xNTAsOCArMTUxLDkg
QEAgdHlwZWRlZiBzdHJ1Y3QgVkZJT0RldmljZSB7DQo+PiAgICAgVkZJT01pZ3JhdGlvbiAqbWln
cmF0aW9uOw0KPj4gICAgIEVycm9yICptaWdyYXRpb25fYmxvY2tlcjsNCj4+ICAgICBPbk9mZkF1
dG8gcHJlX2NvcHlfZGlydHlfcGFnZV90cmFja2luZzsNCj4+IC0gICAgc3RydWN0IHZmaW9fcmVn
aW9uX2luZm8gKipyZWdpb25zOw0KPj4gICAgIFZGSU9Qcm94eSAqcHJveHk7DQo+PiArICAgIHN0
cnVjdCB2ZmlvX3JlZ2lvbl9pbmZvICoqcmVnaW9uczsNCj4+ICsgICAgaW50ICpyZWdmZHM7DQo+
PiB9IFZGSU9EZXZpY2U7DQo+PiANCj4+IHN0cnVjdCBWRklPRGV2aWNlT3BzIHsNCj4+IGRpZmYg
LS1naXQgYS9ody92ZmlvL2NvbW1vbi5jIGIvaHcvdmZpby9jb21tb24uYw0KPj4gaW5kZXggNDFm
ZGQ3OC4uNDdlYzI4ZiAxMDA2NDQNCj4+IC0tLSBhL2h3L3ZmaW8vY29tbW9uLmMNCj4+ICsrKyBi
L2h3L3ZmaW8vY29tbW9uLmMNCj4+IEBAIC00MCw2ICs0MCw3IEBADQo+PiAjaW5jbHVkZSAidHJh
Y2UuaCINCj4+ICNpbmNsdWRlICJxYXBpL2Vycm9yLmgiDQo+PiAjaW5jbHVkZSAibWlncmF0aW9u
L21pZ3JhdGlvbi5oIg0KPj4gKyNpbmNsdWRlICJody92ZmlvL3VzZXIuaCINCj4+IA0KPj4gVkZJ
T0dyb3VwTGlzdCB2ZmlvX2dyb3VwX2xpc3QgPQ0KPj4gICAgIFFMSVNUX0hFQURfSU5JVElBTEla
RVIodmZpb19ncm91cF9saXN0KTsNCj4+IEBAIC0xNDkxLDYgKzE0OTIsMTYgQEAgYm9vbCB2Zmlv
X2dldF9pbmZvX2RtYV9hdmFpbChzdHJ1Y3QgdmZpb19pb21tdV90eXBlMV9pbmZvICppbmZvLA0K
Pj4gICAgIHJldHVybiB0cnVlOw0KPj4gfQ0KPj4gDQo+PiArc3RhdGljIGludCB2ZmlvX2dldF9y
ZWdpb25faW5mb19yZW1mZChWRklPRGV2aWNlICp2YmFzZWRldiwgaW50IGluZGV4KQ0KPj4gK3sN
Cj4+ICsgICAgc3RydWN0IHZmaW9fcmVnaW9uX2luZm8gKmluZm87DQo+PiArDQo+PiArICAgIGlm
ICh2YmFzZWRldi0+cmVnaW9ucyA9PSBOVUxMIHx8IHZiYXNlZGV2LT5yZWdpb25zW2luZGV4XSA9
PSBOVUxMKSB7DQo+PiArICAgICAgICB2ZmlvX2dldF9yZWdpb25faW5mbyh2YmFzZWRldiwgaW5k
ZXgsICZpbmZvKTsNCj4+ICsgICAgfQ0KPj4gKyAgICByZXR1cm4gdmJhc2VkZXYtPnJlZ2ZkcyAh
PSBOVUxMID8gdmJhc2VkZXYtPnJlZ2Zkc1tpbmRleF0gOiAtMTsNCj4+ICt9DQo+IA0KPiBUaGlz
IHBhdGNoIGlzIHJlYWxseSBvYnNjdXJlIGR1ZSB0byB0aGUgcmVnaW9uIGluZm8gZmQgYmVpbmcg
YWRkZWQgbWFueQ0KPiBwYXRjaGVzIGFnbyBhbmQgb25seSBub3cgYmVpbmcgdXNlZC4NCj4gDQo+
IERvIHdlIHJlYWxseSB3YW50IGEgcGFyYWxsZWwgYXJyYXkgdG8gcmVnaW9ucyBmb3Igc3Rvcmlu
ZyB0aGVzZSBmZHM/DQo+IA0KPiBXaHkgZG8gd2UgY2FsbCBhbiBhcnJheSBvZiB0aGVzZSBmZHMg
InJlZ2ZkcyIgYnV0IGEgc2luZ2xlIG9uZSAicmVtZmQiPw0KPiANCj4gVWdoLCB3aHkgZG8gd2Ug
aGF2ZSBib3RoIHRoZSByZWdmZHMgYXJyYXkgYW5kIGEgcmVtZmQgcGVyIFZGSU9SZWdpb24/DQo+
IA0KPiBUQkgsIEknbSBzdGlsbCBub3Qgc3VyZSB3aHkgd2UncmUgY2FjaGluZyByZWdpb24gaW5m
b3MgYXQgYWxsLCB0aGlzDQo+IHNlZW1zIHRvIGJlIGdyYXR1aXRvdXNseSBibG9hdGVkLg0KPiAN
Cj4+ICsNCj4+IHN0YXRpYyBpbnQgdmZpb19zZXR1cF9yZWdpb25fc3BhcnNlX21tYXBzKFZGSU9S
ZWdpb24gKnJlZ2lvbiwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCB2ZmlvX3JlZ2lvbl9pbmZvICppbmZvKQ0KPj4gew0KPj4gQEAgLTE1NDQsNiAr
MTU1NSw3IEBAIGludCB2ZmlvX3JlZ2lvbl9zZXR1cChPYmplY3QgKm9iaiwgVkZJT0RldmljZSAq
dmJhc2VkZXYsIFZGSU9SZWdpb24gKnJlZ2lvbiwNCj4+ICAgICByZWdpb24tPnNpemUgPSBpbmZv
LT5zaXplOw0KPj4gICAgIHJlZ2lvbi0+ZmRfb2Zmc2V0ID0gaW5mby0+b2Zmc2V0Ow0KPj4gICAg
IHJlZ2lvbi0+bnIgPSBpbmRleDsNCj4+ICsgICAgcmVnaW9uLT5yZW1mZCA9IHZmaW9fZ2V0X3Jl
Z2lvbl9pbmZvX3JlbWZkKHZiYXNlZGV2LCBpbmRleCk7DQo+IA0KPiBXaHkgZGlkbid0IHdlIGp1
c3QgZ2V0IGFuIGZkIGJhY2sgZnJvbSB2ZmlvX2dldF9yZWdpb25faW5mbygpIHRoYXQgd2UNCj4g
Y291bGQgdXNlIGhlcmU/DQo+IA0KDQoJQXMgSSBzYWlkIGluIHRoZSBwYXRjaCB3aXRoIHRoZSBj
YWNoZSBjaGFuZ2VzLCB0aGUgcHVycG9zZSBvZg0KdGhlIGNhY2hlIHdhcyB0byBmaWxsIGl0IG9u
Y2UsIGFuZCBoYXZlIGFsbCB0aGUgb3RoZXIgY2FsbGVycyB3aG8gd2FudA0KcmVnaW9uIGluZm8g
YmUgc2F0aXNmaWVkIGZyb20gdGhlIGNhY2hlLiAgVGhpcyBpbmNsdWRlcyB0aGUgRkQgdXNlZA0K
dG8gbWFwIGRldmljZSBtZW1vcnkgZXhwb3J0ZWQgYnkgdGhlIHNlcnZlci4NCg0KPj4gDQo+PiAg
ICAgaWYgKHJlZ2lvbi0+c2l6ZSkgew0KPj4gICAgICAgICByZWdpb24tPm1lbSA9IGdfbmV3MChN
ZW1vcnlSZWdpb24sIDEpOw0KPj4gQEAgLTE1ODcsNiArMTU5OSw3IEBAIGludCB2ZmlvX3JlZ2lv
bl9tbWFwKFZGSU9SZWdpb24gKnJlZ2lvbikNCj4+IHsNCj4+ICAgICBpbnQgaSwgcHJvdCA9IDA7
DQo+PiAgICAgY2hhciAqbmFtZTsNCj4+ICsgICAgaW50IGZkOw0KPj4gDQo+PiAgICAgaWYgKCFy
ZWdpb24tPm1lbSkgew0KPj4gICAgICAgICByZXR1cm4gMDsNCj4+IEBAIC0xNTk1LDkgKzE2MDgs
MTEgQEAgaW50IHZmaW9fcmVnaW9uX21tYXAoVkZJT1JlZ2lvbiAqcmVnaW9uKQ0KPj4gICAgIHBy
b3QgfD0gcmVnaW9uLT5mbGFncyAmIFZGSU9fUkVHSU9OX0lORk9fRkxBR19SRUFEID8gUFJPVF9S
RUFEIDogMDsNCj4+ICAgICBwcm90IHw9IHJlZ2lvbi0+ZmxhZ3MgJiBWRklPX1JFR0lPTl9JTkZP
X0ZMQUdfV1JJVEUgPyBQUk9UX1dSSVRFIDogMDsNCj4+IA0KPj4gKyAgICBmZCA9IHJlZ2lvbi0+
cmVtZmQgIT0gLTEgPyByZWdpb24tPnJlbWZkIDogcmVnaW9uLT52YmFzZWRldi0+ZmQ7DQo+IA0K
PiBHYWNrLCB3aHkgY2FuJ3QgVkZJT1JlZ2lvbi5mZCBiZSBlaXRoZXIgdGhlIHJlbW90ZSBwcm9j
ZXNzIGZkIG9yIHRoZQ0KPiB2YmFzZWRldmZkIHRvIGF2b2lkIGFsbCB0aGVzZSBzd2l0Y2hlcz8g
IFRoYW5rcywNCj4gDQoNCglUaGF04oCZcyBhIGdvb2QgaWRlYS4gIFRoZSBjb250YWluZXIgRkQg
Y2FuIGJlIHRoZSB2YmFzZWRldiBGRA0KaXMgdGhlIGtlcm5lbCBjYXNlLCBhbmQgdGhlIGV4cG9y
dGVkIEZEIGluIHZmaW8tdXNlci4NCg0KCQkJCQkJCUpKDQoNCg0K

