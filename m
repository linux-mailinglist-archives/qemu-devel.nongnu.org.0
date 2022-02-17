Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 296A34BA502
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 16:52:36 +0100 (CET)
Received: from localhost ([::1]:43158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKj59-0001AK-5T
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 10:52:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKj2c-0006iZ-95
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 10:49:58 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:14452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKj2V-0004qN-Nq
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 10:49:57 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21HDv5oC009086; 
 Thu, 17 Feb 2022 15:49:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=+/XWSEMe4pQRwmsZlK2fQuNEn6RlY2t8ppcFYaWdYng=;
 b=fU4Bmhp410QLFQbEoeIr8izISWMKYlcu6hfroY+aEXj8Lv9rnXau69A+nZ+uKZZh3hbi
 Ve7qxWWBkLTBsVjLxa/7zEZ9YP8Fv8KHP9hO8XDNb01laLRdsKvHJQULZhTmF1RY8MFS
 X8CrbbQGyjqaSd+7d5Gaf2GP2midJmCsp+Gwfs640npVRtWO8arqiYjowPP3yQokOcu/
 a96c8+U1HvT5GDjtnan2iFmrjSr97nE5dhF16+KGYmM0Zvr4SgOqwOFM/Fu+hEtxXO9T
 kJ/fga/ALVSj0lAMQCqHIcN4QbtOaDpK7oueaoM8JlT3gKTjngG2EAQJ9VIHtufVXMmM oA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e8nb3p19d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 15:49:42 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21HFZSKK073720;
 Thu, 17 Feb 2022 15:49:41 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
 by userp3030.oracle.com with ESMTP id 3e8nm06fv3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 15:49:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eoba5wJzXyG7LsQJxaxrlI53aVYPD0hbWoJ31hZO6C7+WenvNI9kXD5y1C/Mwb+GR6eZ1051zR8/obOKkgkAn6+7xowmFEQQtHyaKsBHoQnQ5aBGQboRYUIUIZB01jAMyA1Gi/2yLU8X5EjuC6k4Ab3PWKOs4fbdaq69LVAnUHhPygY6Bx0ouFhkgpO8eexPq2GRW7PRUarSMZzNU+x71It0iwKHYkTa2OLE+9avpf6XLCtheylExRulH6sCOIjBmozI+6wmxaTg0o2KCfeZshgqUZBNc1w3sAFEdAYzgdMujk8pbCt8e7WFJx51klZsM73OfZseIL1uRgPGOdvpfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/XWSEMe4pQRwmsZlK2fQuNEn6RlY2t8ppcFYaWdYng=;
 b=STOt4m9Z1l9qFC9p/Z4DLk8bA8vZgJYoCq0A8H8DbRnfbQMnivKT+UUo4Va9wYyI670hcXHbj/JJVhCFM+nBdF7xaCUCgryusGgpd175dfA/93fY6akZWjCMrOtKnlNT0pnnCbqG6VDX2+uK/N8kilf4MZNIsHUMg9V6ebF6DGOOEwrGd8BEZFBKQKOEgUUmqpDXfYb7EL/2EjPkoy8acaFyZHF7in7OKlIVPjyjTVKibaluB5vkhVHmky69TwoEPVkZU0Zx/4jMCr8yLz1oHGfLwwp42Xcg/VcG5zLQKV6KplUWCx7wb1KZcqOwJ6p6XNh5WDcAklMhiDaDyLKv4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/XWSEMe4pQRwmsZlK2fQuNEn6RlY2t8ppcFYaWdYng=;
 b=jUEUvlUFpjKVhdqXjpRPZiUB3OygfJ/xcLE25eWCcHOTvOITRrtM4xWAn3z4qBEu2MQE9HN/JW1P9+XZq9nYUeEyUyvNXIKQGh6ytnXPx74pj+YmmhUuDrxeSfZw2bH5teQVEBBzbj763nWYhgOWnjU+OjurHAubUqUZ41j5I/I=
Received: from CH2PR10MB4008.namprd10.prod.outlook.com (2603:10b6:610:c::22)
 by BN6PR1001MB2132.namprd10.prod.outlook.com (2603:10b6:405:32::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12; Thu, 17 Feb
 2022 15:49:39 +0000
Received: from CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe]) by CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe%6]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 15:49:38 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v6 01/19] configure, meson: override C compiler for cmake
Thread-Topic: [PATCH v6 01/19] configure, meson: override C compiler for cmake
Thread-Index: AQHYI8rkEa0YT9oQI0CMw6V1okPM+KyXptgAgAA9fwA=
Date: Thu, 17 Feb 2022 15:49:38 +0000
Message-ID: <51E15BC7-D3D5-425D-AD62-B7F8C043457E@oracle.com>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <4bef7bdd7309e128eca140a2324a126346c9f1f1.1645079934.git.jag.raman@oracle.com>
 <CAFEAcA9JW0OyAyCk0zbnMMQbo=Q6vr7P4EhEHjrc=i0spCSGLw@mail.gmail.com>
In-Reply-To: <CAFEAcA9JW0OyAyCk0zbnMMQbo=Q6vr7P4EhEHjrc=i0spCSGLw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a3902091-b054-457f-dce1-08d9f22d1afe
x-ms-traffictypediagnostic: BN6PR1001MB2132:EE_
x-microsoft-antispam-prvs: <BN6PR1001MB21327EC39C1D74531144A56E90369@BN6PR1001MB2132.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QB6e273ch3KupfLDtmKMmarUXUitsZVuga/Lfzn9lR8pl/X5GfoiT4O51hdkfozKduNQaGkcFL3jfi4EeQir2jd3xEQjDmbgx/XAyFrfED0STNwhp+ruTk+jNVHene7KLk90EYt8n9kue4GTahBPfK1CYtNKLAYgsefB0TQzWt2XDH6i1z+d5XdKl4qsr8HFSPYBxfWtaOULVARrRCvS6hxvhlbfBejXiw3fQJDBbwC0zIN1MXWvefErkTjXNHAlPIh5hlmSdmYkkaIsimIaJgi6vBf/SEs0n5HJbba7DMZUsctQ+WjTwduJabUzF7/hCqIAVS1/sg9QPEZpNOYHpHfqjDmESG9ce8EvZ35p+D7fuNt8GVvXHNyuaD2N2IEg38mXO9rCOhKyF7m7EiwsCbjnxNxUiO62rTgss7gZQR/vCt/efO1h9bHNwOM4IIJj69NtKl69cVtU+h77pZp64Q8esP7X2ZA5gwqYABe91sojJJ2+q583Wbpz5/KNz5PHWEdkaeyZLWhD59LqHqJXnp6CD/42Ak6jyfOKECkVVqZdT1kZpwZ0vn6dXVDg4V2QybmV2azQ/xNhSlJbTr62n0K36lsAef3GgKEz3oNS7iEfPP3mVTynRGOqaMPGwHQ0lHJ6Y+X0I6Gkc1w0rbWpmAQVbIZPmHg+TBLDqU6CxFkt2r+Dkm8HV07H5G7f0NmRZUBQAejMZlFONCElo+nGEEYky/lx9PY+BLVrqpj72Pg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR10MB4008.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(5660300002)(2906002)(316002)(122000001)(6506007)(71200400001)(4744005)(6512007)(6486002)(44832011)(508600001)(54906003)(6916009)(53546011)(83380400001)(7416002)(186003)(2616005)(86362001)(33656002)(8936002)(76116006)(91956017)(8676002)(4326008)(66946007)(66446008)(66556008)(66476007)(64756008)(38070700005)(36756003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NVRHbjNicjF6STBHeUlGUUlsQXVzSGEvc25EelhLTjNBZ3ZQT1lBa2lmeWRi?=
 =?utf-8?B?UjFjeXBOdEw3b3BHVGQ5WlduYWhhTm9Oa0FMbU9HM1BhbTlKS2oxdFZLamYz?=
 =?utf-8?B?UzlNTmw5MnFBN0ROeVdLQ1E3NTJzM0R3MTJBVktZa0x4cjBQeXgzQ3JGbFFH?=
 =?utf-8?B?aWZYUVNvRHlPWVNMYkJnajJrMTJuUDV1V21jUlZidVVJOW13Tlk3UVdCY2Ji?=
 =?utf-8?B?a29qVFZpemZGbStMMHNxOUJtL2VybURnYUp5bE9hNFZzQWlTSEhOcnhxTXlv?=
 =?utf-8?B?TiszOFZlZUtlc3NVaGl6MkF6a1d5MGxsQU9xNUVaL1k2SExoSDZydUNCQ25i?=
 =?utf-8?B?Ti9Wc0twNkpaSTIveUx0OGx0NU1qWkRSdDdValc4K2pnS1VBcDFYT0pzRE1t?=
 =?utf-8?B?eDIvTjJuSk81WldUT211Sk5sYVhIcU9CWVI3UU9iS1ZVMjhUQUxCclFvNFhH?=
 =?utf-8?B?Y0JyMHVmb0VvNUFMREg1OEVLcTA3ZWpBdS92Z1dTTlpWb2pTUnJOSVZXTCs5?=
 =?utf-8?B?aHFPcE9tcVIvRGd2Q1pyRTlaY2RPK3JYNkdFTHBiRldiWW1uWlF6TVNYaitK?=
 =?utf-8?B?dDlGQ0pBa0RBZjFoYzBFVnB1L1ExZkVjM3hUSEMzVTBvTEFlWGFPMGVYRUty?=
 =?utf-8?B?ZFFoUmVNR0xMdlFibWZha3RHUytlVWhMQ0hZRlgyRDZoSEpXZW5PME8zZXNM?=
 =?utf-8?B?SFVKZFhlTCs5T2lXTUVJVUkyNGE1OVI4TlUxNVNGQkZja0l6ZU45ODRPSU5P?=
 =?utf-8?B?VFIrL0FaV2VVbHVsVkVLQXVKZi8vUnpMdWpqQitWM2RZTmwwT3NNNVVrelNH?=
 =?utf-8?B?endnc2IxWnRmMHR2VDBTcDhodWk0MWJFQklMSXZLRGhwZDA3WVNlZkhjQVo3?=
 =?utf-8?B?anU3S3NiYllGRWp2V0x2aExQazRHVWo1c096bDRBeWlLL1V0NjlNT2NhZHN2?=
 =?utf-8?B?TUorQmJVT2QyNjlmdW4wSytVQnFqTEFPcHlmZlRCRVlRZEs0TE14R2JnVjNF?=
 =?utf-8?B?NUpVQXBxWllBaFRFdkJmemtQUWNOdkU3UnlWcVVBUkxZK2RuTDIyQTQrY2cx?=
 =?utf-8?B?eWZKTjFmRUh6L2VyNXM0cnVCeFFzcy9hM0JxNzh3QTZrMWsvcmJMS201ek1M?=
 =?utf-8?B?N05ncmM4aGtGMXJidFBSbUErTzdRYjk0RXo5VlBFcjQveDJiZTRWUzJYR1lU?=
 =?utf-8?B?RVpJWGxFd05WS2RpekxYcTVnL0JPeE5PdWdnRDNCajRYVDJMeGlOMVFISUJw?=
 =?utf-8?B?Q0ZUSFFoWUNzNGdjcDZ6OHF5aUE5SUdRK1ZYdkVMdzJVUkxza0VibTI2K2Rx?=
 =?utf-8?B?aG1xdFNKb2ZESnd4VTk0ZmlnUlgydUdQcTg4aHBaeUZSL2xMZGlJN3orb0tk?=
 =?utf-8?B?NUdtd1ROaFFBZGxsbS91OEwyc0JOMjdRZ1lwR3Z0c2VjK1BSR1V0UENyemJY?=
 =?utf-8?B?dnl1VUUyQVZ6ZWlQWStTNzNmZ2dpNnBrb1h2RHBjRzNIOGJha3hKOGtLVWpk?=
 =?utf-8?B?MStKTHpmbnRUa0hRVWxsbkpuV0xTUkQ3QUJJSnlVdjRWMlRZVlNWRVExc3Jw?=
 =?utf-8?B?VzBjSk16c2Rmd0tMZWNDYjVpZEtJZEtuVzcxWFNaMXdNZXQwMGJHTXIxNk5W?=
 =?utf-8?B?dEl1YiszSGpGSjR6Vy85c2VWdzJmM2pYTktRem41TjBadEErcDVIVmJhTEpI?=
 =?utf-8?B?MVhTVTF6UHMzdytYS2JTMGVnSTF5M0p4MXhmSSsxMlVMektCUTVWcEdXTDJ0?=
 =?utf-8?B?UUQ4OTFVTFZNbzFNenJON3dnMHc0cHpDald6eldOMkdPS29HUzNlbWJqazN3?=
 =?utf-8?B?RkFOVXZSSmpvM1pSYmt0WWpNQzRuVTBKQ25YUlAyekVWbkpDNWFncnA2WXpZ?=
 =?utf-8?B?dWh6L3VWSk9tM1hWbEhEN3FtOTRVaDE0WmhadUF2ZWgrb1FmdkViYkRLcFhZ?=
 =?utf-8?B?eFdoNHdxVjBid0J5dXVXOXVsdUR2SG4zaVdVZExpcVI1NHF1T2lUcE5mWm1J?=
 =?utf-8?B?Kyt4azUyQ0VoVTIvM3RlN1ZUS1RPK2Q5WGFJa2JEdVllSDBRZlQwUFZZbDdh?=
 =?utf-8?B?bDlTYUdVYldQTWJKN0VhL3VvUHhBUDJrdklXdmtLWEhPMFBQaHAxVTVxZUVp?=
 =?utf-8?B?SzIySHFsK0VDYVk4VWM4U3dYTDVFVm5Dc24yc3J1UTFMd2k5TVJwRytDMlhF?=
 =?utf-8?B?bVpNK3hNa2xTVFpVcUtLOHYvZ2NYY1FvS0lKc2UvMlgrYjJnRStMWlpKdDlW?=
 =?utf-8?B?eHg4Q1E4cW1UaVdJNEh4eDFkRjB3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <62FC15D453F8364194CFC5C711325AAB@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB4008.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3902091-b054-457f-dce1-08d9f22d1afe
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2022 15:49:38.8902 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SDrq3FZ52a1ZOPtXak3FbSeZFwz749oMdrk/3JuDrBgZnqa6XvS7xz9QjY1MJad5KlE/2Qptzl6EM3q8F63eaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1001MB2132
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10261
 signatures=677564
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202170071
X-Proofpoint-GUID: lZd3DHhKGQrG4j1K8GB4A0EuZ1lj0bum
X-Proofpoint-ORIG-GUID: lZd3DHhKGQrG4j1K8GB4A0EuZ1lj0bum
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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
 "berrange@redhat.com" <berrange@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 qemu-devel <qemu-devel@nongnu.org>, "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "f4bug@amsat.org" <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gRmViIDE3LCAyMDIyLCBhdCA3OjA5IEFNLCBQZXRlciBNYXlkZWxsIDxwZXRlci5t
YXlkZWxsQGxpbmFyby5vcmc+IHdyb3RlOg0KPiANCj4gT24gVGh1LCAxNyBGZWIgMjAyMiBhdCAw
Nzo1NiwgSmFnYW5uYXRoYW4gUmFtYW4gPGphZy5yYW1hbkBvcmFjbGUuY29tPiB3cm90ZToNCj4+
IA0KPj4gVGhlIGNvbXBpbGVyIHBhdGggdGhhdCBjbWFrZSBnZXRzIGZyb20gbWVzb24gaXMgY29y
cnVwdGVkLiBJdCByZXN1bHRzIGluDQo+PiB0aGUgZm9sbG93aW5nIGVycm9yOg0KPj4gfCAtLSBU
aGUgQyBjb21waWxlciBpZGVudGlmaWNhdGlvbiBpcyB1bmtub3duDQo+PiB8IENNYWtlIEVycm9y
IGF0IENNYWtlTGlzdHMudHh0OjM1IChwcm9qZWN0KToNCj4+IHwgVGhlIENNQUtFX0NfQ09NUElM
RVI6DQo+PiB8IC9vcHQvcmgvZGV2dG9vbHNldC05L3Jvb3QvYmluL2NjOy1tNjQ7LW1jeDE2DQo+
PiB8IGlzIG5vdCBhIGZ1bGwgcGF0aCB0byBhbiBleGlzdGluZyBjb21waWxlciB0b29sLg0KPj4g
DQo+PiBFeHBsaWNpdGx5IHNwZWNpZnkgdGhlIEMgY29tcGlsZXIgZm9yIGNtYWtlIHRvIGF2b2lk
IHRoaXMgZXJyb3INCj4gDQo+IFRoaXMgc291bmRzIGxpa2UgYSBidWcgaW4gTWVzb24uIElzIHRo
ZXJlIGEgTWVzb24gYnVnIHJlcG9ydA0KPiB3ZSBjYW4gcmVmZXJlbmNlIGluIHRoZSBjb21taXQg
bWVzc2FnZSBoZXJlID8NCg0KSGkgUGV0ZXIsDQoNCknigJlsbCB0cnkgdG8gbG9jYXRlIHRoZSBi
dWcgcmVwb3J0IGFuZCB0aGUgbWVzb24gdmVyc2lvbiB3aGljaCBoYXMgdGhlIGZpeCwNCmFuZCBn
ZXQgYmFjayB0byB5b3UuDQoNClRoYW5rIHlvdSENCi0tDQpKYWcNCg0KPiANCj4gdGhhbmtzDQo+
IC0tIFBNTQ0KDQo=

