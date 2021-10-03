Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C03C420307
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 19:05:32 +0200 (CEST)
Received: from localhost ([::1]:45764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX4va-0007kP-Sr
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 13:05:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9910b4adaa=pdel@fb.com>)
 id 1mX4u9-0006bI-6u; Sun, 03 Oct 2021 13:04:01 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:56124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9910b4adaa=pdel@fb.com>)
 id 1mX4u6-0002dX-D0; Sun, 03 Oct 2021 13:04:00 -0400
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 193Eoemd001474; 
 Sun, 3 Oct 2021 10:03:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=lVyz17ORtKkHDq/9mmG3lhdIx4OAM4SN/Zzqu3zZ3QY=;
 b=CdzULeZb0kY53lzGnlGFN/fxiujUEtJ4Zh52hIc3+NtlMkvf9hnlKeIdQrl7Uhn7a/aa
 nUIBQDTJcPJovv8+ZBbcjv4ZaQ+TOk5yn4PXyRsiBmKeZDMikfJ4C1xKKqj9Rr9ul62D
 cBBPQGfI7EaWz7RIb3fPdmDKi0Z3GrR76OY= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 3bfbsr191j-18
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Sun, 03 Oct 2021 10:03:41 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.103) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Sun, 3 Oct 2021 10:03:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V08tgBnLVFiRJU6rNfzV4cKfT7w306o8c7PyvbUqeSnrkrcnoIdhH6aK6zzwuhZ0teqTV2NQYeBWQ8CfymtYKu41a5qimm4PB46yqr0+ID3OsJt8qW74pLApjo8vy+7rnBzoNfPGEdlsiY+jPY0UkcxEpjORZiD5TCv4GHNUKnrQN8DIi6/JrDkmyJrSvW8SUTfuZfttqjHar6UpQSK2KOkz+W1M5q90dFslKwGZKzvdGQTTW+OXFFqcRCvMSHummPvxMR6lxqlnwJDYgezQa0+12ZNQLBjawKgJHjQIdFlDZ7RjSd2laGrPsD6cb5AU/jBjSmp/sRso2Lk/pjUGbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lVyz17ORtKkHDq/9mmG3lhdIx4OAM4SN/Zzqu3zZ3QY=;
 b=jDuS/yalWzrvhHhDElhblrxOGyNz4AdBas/eCRcXz5Z5xei0uW2iuksT0DHSpVRm8nH11Zjh6n8BSgzrSb7aDEwkozW4HD4CTmHvxnh82o+9bnSytTm8EEUCT3E/sY22LNX3oWp0qM092OQxG+FzxjMZdOTeCamSnK2vyI5yzk105Jd1WDckUtyDyI+xwcwQpAX1k2lv2al2zwbu/OvffhnZhKxEAxUPNDqDMfaOASPa1DSHG5NJikqkD5cL9+f721qQeKG+32KVI0mnQAvyjwJFCRH2mQPRgN4E0N6sktli01ygKYoRNMt9CSQFmYJoDjTeSx28bpE1MQ5tY+vVWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by SJ0PR15MB4597.namprd15.prod.outlook.com (2603:10b6:a03:37a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Sun, 3 Oct
 2021 17:03:39 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::38da:f6f6:bb5c:dd5f]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::38da:f6f6:bb5c:dd5f%7]) with mapi id 15.20.4566.022; Sun, 3 Oct 2021
 17:03:39 +0000
From: Peter Delevoryas <pdel@fb.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>
CC: Alistair Francis <alistair@alistair23.me>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, qemu-arm <qemu-arm@nongnu.org>, Cameron Esfahani via
 <qemu-devel@nongnu.org>, "patrick@stwcx.xyz" <patrick@stwcx.xyz>, Dan Zhang
 <zhdaniel@fb.com>
Subject: Re: [PATCH 0/2] hw/adc: Add basic Aspeed ADC model
Thread-Topic: [PATCH 0/2] hw/adc: Add basic Aspeed ADC model
Thread-Index: AQHXt9apw0iVTOFVykm6c4kOezOaFqvBTTwAgAA0TgA=
Date: Sun, 3 Oct 2021 17:03:39 +0000
Message-ID: <764A61F4-4299-4F07-A932-4FD14C32736B@fb.com>
References: <20211002214414.2858382-1-pdel@fbc.om>
 <f553afbb-f29f-6837-8815-334a77c8e7f8@kaod.org>
In-Reply-To: <f553afbb-f29f-6837-8815-334a77c8e7f8@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kaod.org; dkim=none (message not signed)
 header.d=none;kaod.org; dmarc=none action=none header.from=fb.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b481d3e9-09f7-4368-07bb-08d9868fbf0e
x-ms-traffictypediagnostic: SJ0PR15MB4597:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR15MB4597FFFD9C04C2A59BD2660FACAD9@SJ0PR15MB4597.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CYLM1wk0WLSlQ6uoxdsk1C++LKU+4lpcDPzSRvsSMvkscNt8u+QN7G+RL9LZlkLg9US2sGblxixz5a2pDYsCnbqxMGGlvy+o53BghsLkH5N9FNpFN1YWOmgTXip9HxOyTsG501h9o+/1uD18sHzIz/+yn0fs/hAR5PVy7L6H7ICevSPL9bWE2OGooW1GYhawGUW+vvMABt7PN7xl7d4mxym6ylZ75TtytHPchLwv7oT2kvsliBgLOfaDhziGUgME314pLdR+zKw6Zdmdtq8/HuOGE1KKKoYhejdF8lDsFj/iURZ7A3ki8ohkzcmEybjpzNZGuptR0fd17pC1z6xoQaH6JvwwGbHujFCXCu0rBEnFLWaxL/3W6D0x9G94TNfoBRpOgzPhyaXA7NSG0K3OSrO9nUu8Fetde3WG57PVN55PXNUPBtxwmstqWPzXBLiXDfutJvNGZycJM24Fd5AfNAUuExyOcZ+5j4xl5aHLg9q4u96bkXFpd6diey8+WmusasvT3rufjprpRF6bl00H902g33ulViwnIC7nD/H4FiMSFW99wM9gJ/nrfVwPvtcH1Ae2REdCUHOSLeKP0LfOz4vsZdgQdQlqsQPhyNOtMFUXTx6WQg6fWBJhAltjmOSvvziaFRONr9MymKTZEv9MoCoVgmwl8/7LSAA+1OJMaE9+i17urxBWKWoK6jCx6lcOwp/nD83gzi+M2PDd4u6IdIA7Ggf2nnn55sLiQwzTcrmg5ux4j7JjP63OvKrFvKtcXQzMQYllxIRi0BnfLMFj4p7eSRX5k1Kph0D6bA4I3zp18tG5r64+sztmd77l060T2hlH+M1by/uOfrW7g22p5RPdhhIHiA/AnGGiCI2klGQI4B7pIj1+bbYxCLMQTab4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(5660300002)(122000001)(83380400001)(86362001)(36756003)(6512007)(966005)(54906003)(316002)(71200400001)(33656002)(2616005)(38070700005)(6916009)(186003)(38100700002)(6506007)(66556008)(66476007)(2906002)(64756008)(66446008)(66946007)(8936002)(76116006)(66574015)(8676002)(4326008)(6486002)(53546011)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Wk95UWJmRmxVMWNQK2R3bEZCSzBKYkMxVUpNaWhweHRFaGVaMzEvWnY3bUtC?=
 =?utf-8?B?MjNObXZ3ZDZlcUpxTW9ZVkp0dzNsZnU2RGFWZzRROE5VdG0rcnVRbTVrWnQ4?=
 =?utf-8?B?cDZHNVNVc010Q01DZXJSaGRyS0FPTHRWd0VqR3dmT1phR0svcDdXNk9vOGkr?=
 =?utf-8?B?a1R1bjMyVm11LzFaakdNVkZTSkNsZFVMK0IxWU5BbC9zaEVzaWh5NnNxamEw?=
 =?utf-8?B?NTdBb0JIc0xXWlI1VjVrUlFtQVhaYmpTRUFsdUE2bWR2M1pVQ2RTdlBNMkhH?=
 =?utf-8?B?eldyTCtKdWtUQ2lLV1FxMnZ2YXVteTMyUUQwc212ak5jSTY3MHFsb3ZVTjNI?=
 =?utf-8?B?dkxFbHVVNFJ5YXZUZzJ2RVZDVGd0aE1PVThTRytlWXd2TVZUeVlYZVlyUWpC?=
 =?utf-8?B?TDJ4a2lPaCtUbnBaUEtzbVZ1Vmp4d3oxY2xqWmd0RzBPQllkbFV1d2V4a3px?=
 =?utf-8?B?ZGRGbHFKbVFub1JhTXc5TjFJT3ZTYWxSZkhCMXVZWkF4blZiOVZsQ29FUURr?=
 =?utf-8?B?dUljQUJKL2l6Z08rUjhzdlJFWDYwYlJGY2dIRXAydUVmTHA1WFlGV1lGN3ZT?=
 =?utf-8?B?cFIzdjErM2xISm53cDY0QTlLVTlQMDlEcTE1RmZDbkxiQk96N09HY21GcXkz?=
 =?utf-8?B?dHRMY3FYeXRmZUhRT3MwL2pNaERJajRmZ2pkMUxacy9ySUh6bVViSjZYSFRv?=
 =?utf-8?B?K0xIZEpDR3VvYlVYT1F0VWR4a0JKV3hOSndPb0Nlc1hCMDUzNnk1UzFKVVBV?=
 =?utf-8?B?OE42Q3VLSXF2dFpaQmdMWG5rN1BveWlFcmRvaUhPZXRTWEJPVFU5cE1TSDZR?=
 =?utf-8?B?Q1lSK2ZNNkFqN09IZS95MVJ3Vmt4eUZGSnFXV3VJdm1CZGVqSmZPSkEwS2Vj?=
 =?utf-8?B?QWVBY1dvSGE2WG8vZlAxU016VVZyTC9mb1djTUxhNFFLRXhHcGpNSWFYczJV?=
 =?utf-8?B?VkZYOG1EOFBjRlZzUTVvTTROUWcxRGpYS0prQUUydEtIQUQyS2JLWDUwd01J?=
 =?utf-8?B?VHg5L0tKbkQ1dTZwazNJckRRZENQQTByVGR3dDIzaVZ6SXQ0QTErSXkzVmkz?=
 =?utf-8?B?WmFYdGlXcTJaRU9nSEhvbDVoM2FoWXFYazdWOVRYakZNakV2ak53UWFhck4r?=
 =?utf-8?B?ZHE3Q1ltMzJqSmgzRk5hR2lNQ04yWGJhUVBpeTFJY1g3eERMVFU1Ukl4dzJk?=
 =?utf-8?B?MlBmaS9KNzZWQXQvdkhyVElKRk1rODYvc3pIaUZDMTJXM3pzMnBhSTBmQWpV?=
 =?utf-8?B?cmxjVWU3SDhwa2lUSDZBaWkwNnZYakwwSHM5M1Z6Y0RVaGFRY3dmM1J1NDhi?=
 =?utf-8?B?TlFTQnorSGxwU1FZbUVEYjZremNZUlgrYTJTUFY3Qk9Fdmh0QmlGVnFibEdh?=
 =?utf-8?B?dWtVUUg4aGpxVEZ3Yy9WV2o3MDNsdVluWkJZNHI4a3B3MkVxb0YyZVFzQ3Rt?=
 =?utf-8?B?bm16MDZvZHRmOEZsc0VkUGQ1LzVmd1RhWTVGSkU4SzFlS1JVWVZIT2QvYTBW?=
 =?utf-8?B?TmNXaW5UK0szSGwwbHFzRVRuclZCWGhrUHd4MC9neW1vb0lqRG9KZitlbVNG?=
 =?utf-8?B?RFFTdHZQSEd1SmgwYUhXOWhaMzV0cHBCeW5CZlNiOEhZbG9JeHgzNkM4Wmdw?=
 =?utf-8?B?bVkwZytucEt0QmcwQWYwWkR0YTNVRVRwNzY2bHdrbDE3TE1NWXROTDVvMmhP?=
 =?utf-8?B?MDF3Tm5GVlJkMUNoZ2E4cytDbjlSY1dEU1BIWFdvaldlZ3Zqbk9Ea1BXZG51?=
 =?utf-8?B?NWpCLzlXRGszYXFEaVZWcytNSE82dWR1WjFHU1VTMG5uYWxuMUFwNUNqNEwx?=
 =?utf-8?Q?vkKUYuzDmPzD1qTclR4ExdflTUF+UnJOzLqHs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CBB6975C9445DE419BC43AF2B2107A9A@namprd15.prod.outlook.com>
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b481d3e9-09f7-4368-07bb-08d9868fbf0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2021 17:03:39.1639 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ejbVsXI58FsaQjxuPxaK2Cj0uGNFM45osV8Cv8oUj9oEaImoiN4hDA/yzihofD4G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR15MB4597
X-OriginatorOrg: fb.com
X-Proofpoint-GUID: 4jabS5etpZwUhGYR8SkCyxPZaFMJVNOo
X-Proofpoint-ORIG-GUID: 4jabS5etpZwUhGYR8SkCyxPZaFMJVNOo
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-03_08,2021-10-01_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 malwarescore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110030122
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=9910b4adaa=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

DQo+IE9uIE9jdCAzLCAyMDIxLCBhdCA2OjU2IEFNLCBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGth
b2Qub3JnPiB3cm90ZToNCj4gDQo+IE9uIDEwLzIvMjEgMjM6NDQsIHBkZWxAZmJjLm9tIHdyb3Rl
Og0KPj4gRnJvbTogUGV0ZXIgRGVsZXZvcnlhcyA8cGRlbEBmYi5jb20+DQo+PiBGb2xsb3dpbmcg
dXAgZnJvbQ0KPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcWVtdS1kZXZlbC8yMDIxMDkzMDAw
NDIzNS4xNjU2MDAzLTEtcGRlbEBmYi5jb20vDQo+PiBUaGlzIGlzIGEgcmVzdWJtaXNzaW9uIG9m
IEFuZHJldyBKZWZmZXJ5J3MgQURDIG1vZGVsLCBidXQgd2l0aCB0aGUNCj4+IHJlZ2lzdGVycyBj
b252ZXJ0ZWQgZnJvbSB0eXBlZC1tZW1iZXItZmllbGRzIHRvIGEgcmVnc1tdIGFycmF5Lg0KPj4g
T3RoZXJ3aXNlLCBpdCBzaG91bGQgYmUgcHJldHR5IG11Y2ggZXF1aXZhbGVudC4NCj4gDQo+IFRo
YW5rcyBmb3IgdGFraW5nIG92ZXIuDQo+IA0KPj4gUmVmZXJlbmNlcyB0byB0aGUgb3JpZ2luYWwg
cGF0Y2hlcyBmcm9tIEFuZHJldzoNCj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9sZWdvYXRlci9xZW11
L2NvbW1pdC8xZWZmN2IxY2YxMGQxNzc3NjM1ZjdkMmNlZjhlY2I0NDFjYzYwN2M0DQo+PiBodHRw
czovL2dpdGh1Yi5jb20vbGVnb2F0ZXIvcWVtdS9jb21taXQvMzA1MmY5ZDhjY2RhZjc4Yjc1M2U1
MzU3NGI3ZThjYzJlZTAxNDI5Zg0KPj4gSSBkaWQgQS9CICItLXRyYWNlIGFzcGVlZF9hZGNfZW5n
aW5lXyoiIHRlc3RpbmcgYW5kIHRoZSBvdXRwdXQgZnJvbSB0aGUNCj4+IGJvb3Qgc2VxdWVuY2Ug
d2FzIGVxdWl2YWxlbnQsIGFuZCBJIHRlc3RlZCB0aGF0IHRoZSBjaGFubmVsIHNpbXVsYXRpb24N
Cj4+IGNvZGUgcHJvZHVjZXMgdGhlIHNhbWUgc2VxdWVuY2Ugb2YgdmFsdWVzLg0KPj4gSGVyZSdz
IHRoZSBpbml0aWFsaXphdGlvbiBzZXF1ZW5jZToNCj4+IGFzcGVlZF9hZGNfZW5naW5lX3dyaXRl
IGVuZ2luZVswXSAweDAgMHhmICA7IEVuZ2luZSBpbml0DQo+PiBhc3BlZWRfYWRjX2VuZ2luZV9y
ZWFkIGVuZ2luZVswXSAweDAgMHgxMGYgOyBiaXQgOCBzZXQNCj4+IGFzcGVlZF9hZGNfZW5naW5l
X3dyaXRlIGVuZ2luZVswXSAweDAgMHgyZiA7IEF1dG8gY29tcGVuc2F0aW5nIHNlbnNpbmcgbW9k
ZQ0KPj4gYXNwZWVkX2FkY19lbmdpbmVfcmVhZCBlbmdpbmVbMF0gMHgwIDB4MTBmIDsgYml0IDgg
c2V0IChyZWRvaW5nIGVuZ2luZSBpbml0LCBsb2wpLCBiaXQgNSByZXNldA0KPj4gSGVyZSdzIHNv
bWUgb2YgdGhlIGNoYW5uZWwgc2ltdWxhdGlvbjoNCj4+IChxZW11KSB4cCAweDFlNmU5MDEwDQo+
PiAwMDAwMDAwMDFlNmU5MDEwOiAweDAwMDcwMDA1DQo+PiAocWVtdSkgeHAgMHgxZTZlOTAxMA0K
Pj4gMDAwMDAwMDAxZTZlOTAxMDogMHgwMDBlMDAwYQ0KPj4gKHFlbXUpIHhwIDB4MWU2ZTkwMTAN
Cj4+IDAwMDAwMDAwMWU2ZTkwMTA6IDB4MDAxNTAwMGYNCj4+IChxZW11KSB4cCAweDFlNmU5MDEw
DQo+PiAwMDAwMDAwMDFlNmU5MDEwOiAweDAwMWMwMDE0DQo+PiAocWVtdSkgeHAgMHgxZTZlOTAx
MA0KPj4gMDAwMDAwMDAxZTZlOTAxMDogMHgwMDIzMDAxOQ0KPj4gKHFlbXUpIHhwIDB4MWU2ZTkw
MTANCj4+IDAwMDAwMDAwMWU2ZTkwMTA6IDB4MDAyYTAwMWUNCj4+IChxZW11KSB4cCAweDFlNmU5
MDEwDQo+PiAwMDAwMDAwMDFlNmU5MDEwOiAweDAwMzEwMDIzDQo+PiAocWVtdSkgeHAgMHgxZTZl
OTAxMA0KPj4gMDAwMDAwMDAxZTZlOTAxMDogMHgwMDM4MDAyOA0KPj4gVGhpcyB3YXMgdGVzdGVk
IHdpdGggYSBGdWppIE9wZW5CTUMgaW1hZ2U6DQo+PiBodHRwczovL2dpdGh1Yi5jb20vcGV0ZXJk
ZWxldm9yeWFzL29wZW5ibWMvcmVsZWFzZXMvZG93bmxvYWQvZnVqaS5tdGQuMC9mdWppLm10ZA0K
Pj4gTXkgcmVmYWN0b3Jpbmcgd2FzIGtpbmRhIGF3a3dhcmQsIGl0IHRvb2sgbWUgYSBmZXcgdHJp
ZXMgdG8gZmluYWxseSBnZXQNCj4+IHNvbWV0aGluZyB0aGF0IG1hZGUgc2Vuc2UgdG8gbWUuIElu
IHBhcnRpY3VsYXIsIEkgZG9uJ3Qga25vdyBpZiB5b3UgZ3V5cw0KPj4gcmVhbGl6ZWQgdGhpcyBw
cmV2aW91c2x5LCBidXQgaW4gdGhlIEFTVDI2MDAsIHRoZXJlJ3MgMiBlbmdpbmVzLCBidXQNCj4+
IHN0aWxsIG9ubHkgMTYgY2hhbm5lbHM6IGVhY2ggZW5naW5lIG9ubHkgaGFzIGhhbGYgdGhlIHJl
Z2lzdGVycywgYXMgZmFyDQo+PiBhcyBJIHVuZGVyc3RhbmQuDQo+IA0KPiB5ZXMuDQo+IA0KPiAN
Cj4+IFRoYXQncyB3aHkgSSBhZGRlZCB0aGUgIm5yLWNoYW5uZWxzIiBwcm9wZXJ0eSB0byB0aGUg
ZW5naW5lLiBJIGFsc28NCj4+IHRyaWVkIHRvIGFkZCBndWVzdC1lcnJvciBsb2dzIHdoZW4gYSBk
cml2ZXIgdHJpZXMgdG8gcmVhZCBvciB3cml0ZSB0bw0KPj4gdGhlIHVwcGVyLWVpZ2h0IGNoYW5u
ZWwgcmVnaXN0ZXJzIGluIHRoZSAyNjAwIGVuZ2luZXMuIEZvciBleGFtcGxlOg0KPj4gKHFlbXUp
IHhwIDB4MWU2ZTkwMDANCj4+IDAwMDAwMDAwMWU2ZTkwMDA6IDB4ZmZmZjAxMGYNCj4+IChxZW11
KSB4cCAweDFlNmU5MDIwDQo+PiBhc3BlZWRfYWRjX2VuZ2luZV9yZWFkOiBlbmdpbmVbMF06IGRh
dGEgcmVnaXN0ZXIgNCBpbnZhbGlkLCBvbmx5IDAuLi4zIHZhbGlkDQo+PiAwMDAwMDAwMDFlNmU5
MDIwOiAweDAwMDAwMDAwDQo+PiAocWVtdSkgeHAgMHgxZTZlOTAzMA0KPj4gMDAwMDAwMDAxZTZl
OTAzMDogMHgwMDAwMDAwMA0KPj4gKHFlbXUpIHhwIDB4MWU2ZTkwNDANCj4+IDAwMDAwMDAwMWU2
ZTkwNDA6IDB4MDAwMDAwMDANCj4+IChxZW11KSB4cCAweDFlNmU5MDUwDQo+PiBhc3BlZWRfYWRj
X2VuZ2luZV9yZWFkOiBlbmdpbmVbMF06IGJvdW5kcyByZWdpc3RlciA4IGludmFsaWQsIG9ubHkg
MC4uLjcgdmFsaWQNCj4+IDAwMDAwMDAwMWU2ZTkwNTA6IDB4MDAwMDAwMDANCj4+IChxZW11KSB4
cCAweDFlNmU5MDYwDQo+PiBhc3BlZWRfYWRjX2VuZ2luZV9yZWFkOiBlbmdpbmVbMF06IGJvdW5k
cyByZWdpc3RlciAxMiBpbnZhbGlkLCBvbmx5IDAuLi43IHZhbGlkDQo+PiAwMDAwMDAwMDFlNmU5
MDYwOiAweDAwMDAwMDAwDQo+PiAocWVtdSkgeHAgMHgxZTZlOTA3MA0KPj4gMDAwMDAwMDAxZTZl
OTA3MDogMHgwMDAwMDAwMA0KPj4gKHFlbXUpIHhwIDB4MWU2ZTkwODANCj4+IDAwMDAwMDAwMWU2
ZTkwODA6IDB4MDAwMDAwMDANCj4+IChxZW11KSB4cCAweDFlNmU5MDkwDQo+PiBhc3BlZWRfYWRj
X2VuZ2luZV9yZWFkOiBlbmdpbmVbMF06IGh5c3RlcmVzaXMgcmVnaXN0ZXIgOCBpbnZhbGlkLCBv
bmx5IDAuLi43IHZhbGlkDQo+PiAwMDAwMDAwMDFlNmU5MDkwOiAweDAwMDAwMDAwDQo+PiAocWVt
dSkgeHAgMHgxZTZlOTBhMA0KPj4gYXNwZWVkX2FkY19lbmdpbmVfcmVhZDogZW5naW5lWzBdOiBo
eXN0ZXJlc2lzIHJlZ2lzdGVyIDEyIGludmFsaWQsIG9ubHkgMC4uLjcgdmFsaWQNCj4+IDAwMDAw
MDAwMWU2ZTkwYTA6IDB4MDAwMDAwMDANCj4gDQo+IFRoaXMgbG9va3MgbmljZS4NCj4gDQo+PiBJ
dCBtaWdodCB0dXJuIG91dCB0aGF0IHdlIHNob3VsZCBqdXN0IHN0aWNrIHdpdGggYSBjbG9zZXIg
dmVyc2lvbiBvZg0KPj4gQW5kcmV3J3Mgb3JpZ2luYWwgcGF0Y2gsIGFuZCB0aGF0IHdvdWxkIGJl
IHRvdGFsbHkgZmluZSB3aXRoIG1lLCBJIGp1c3QNCj4+IHdhbnQgdG8gZ2V0IHRoZSBBREMgc3Vw
cG9ydCBtZXJnZWQgb25lIHdheSBvciBhbm90aGVyLg0KPiANCj4gDQo+IERvIHlvdSBoYXZlIGEg
dGVzdCBjYXNlIHdlIGNvdWxkIGluY2x1ZGUgaW4gcXRlc3QgPyBUaGlzIGlzIG5vdCBhDQo+IHJl
cXVpcmVtZW50IGJ1dCBpdCdzIGFsd2F5cyBnb29kIHRvIGhhdmUuDQoNClllYWggYWJzb2x1dGVs
eSEgSSBoYXZlIHRvIGdvIGxvb2sgbW9yZSBhdCBxdGVzdCBhIGxpdHRsZSwgYnV0IEnigJltIHN1
cmUgSQ0KY2FuIGFkZCBzb21lIGtpbmQgb2YgdGVzdCBmb3IgdGhpcy4NCg0KPiANCj4gVGhhbmtz
LA0KPiANCj4gQy4NCj4gDQo+PiBBbHNvLCBJJ20gaW50ZXJlc3RlZCBpbiByZXN1Ym1pdHRpbmcg
QW5kcmV3J3Mgd29yayBvbiBzdXBwb3J0aW5nDQo+PiB1bmFsaWduZWQgYWNjZXNzZXMgZm9yIG1v
ZGVscyB0aGF0IG9ubHkgaW1wbGVtZW50IGFsaWduZWQgYWNjZXNzLCB0bw0KPj4gbWFrZSBzdXBw
b3J0aW5nIDgtYml0IGFuZCAxNi1iaXQgcmVhZHMgdHJhbnNwYXJlbnQgdG8gdGhpcyBtb2RlbCwg
YnV0DQo+PiBJJ2xsIHN1Ym1pdCB0aGF0IHNlcGFyYXRlbHkuDQo+PiANCj4+IFJlZmVyZW5jZTog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcWVtdS1kZXZlbC8yMDE3MDYzMDAzMDA1OC4yODk0My0x
LWFuZHJld0Bhai5pZC5hdS8NCj4+IFRoYW5rcywNCj4+IFBldGVyDQo+PiBBbmRyZXcgSmVmZmVy
eSAoMik6DQo+PiAgIGh3L2FkYzogQWRkIGJhc2ljIEFzcGVlZCBBREMgbW9kZWwNCj4+ICAgaHcv
YXJtOiBJbnRlZ3JhdGUgQURDIG1vZGVsIGludG8gQXNwZWVkIFNvQw0KPj4gIGh3L2FkYy9hc3Bl
ZWRfYWRjLmMgICAgICAgICB8IDQxNiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysNCj4+ICBody9hZGMvbWVzb24uYnVpbGQgICAgICAgICAgfCAgIDEgKw0KPj4gIGh3L2FkYy90
cmFjZS1ldmVudHMgICAgICAgICB8ICAgMyArDQo+PiAgaHcvYXJtL2FzcGVlZF9hc3QyNjAwLmMg
ICAgIHwgIDExICsNCj4+ICBody9hcm0vYXNwZWVkX3NvYy5jICAgICAgICAgfCAgMTEgKw0KPj4g
IGluY2x1ZGUvaHcvYWRjL2FzcGVlZF9hZGMuaCB8ICA1NSArKysrKw0KPj4gIGluY2x1ZGUvaHcv
YXJtL2FzcGVlZF9zb2MuaCB8ICAgMiArDQo+PiAgNyBmaWxlcyBjaGFuZ2VkLCA0OTkgaW5zZXJ0
aW9ucygrKQ0KPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBody9hZGMvYXNwZWVkX2FkYy5jDQo+PiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvaHcvYWRjL2FzcGVlZF9hZGMuaA0KDQo=

