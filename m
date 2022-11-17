Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C387A62DBDD
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 13:44:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oveDh-0001tE-0q; Thu, 17 Nov 2022 07:42:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ORO@il.ibm.com>)
 id 1oveDd-0001qT-1T; Thu, 17 Nov 2022 07:42:13 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ORO@il.ibm.com>)
 id 1oveDa-0005yI-VO; Thu, 17 Nov 2022 07:42:12 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AHCEXex024556; Thu, 17 Nov 2022 12:42:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : date :
 message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version : subject; s=pp1;
 bh=WrKsdgItRNIjWhsWk5gvCpuA84zH542e4/r1zRG8LkY=;
 b=QGNTK5eewhVEL9YP4G/9ZDo620TqxWu+/fcjwyyMY6VUTiTlL4VuK3zthqhrwmVcHaEK
 zSBzEkefjxC02Fxcc625PatJDR3WB735QEH7cryijOMDsvnJ1YOWh1MnZ6J4tCz5DTYm
 +haSIMosTDMVdXv4q+qOsxM2nB5LXxmB+ky7B3VeVU84ZN8iPcsYkFhMpZZZyFKuKImN
 dLDGO8CYzrSC+CHBsk3G+msU7FZskaLdBIj0Tg+TgZczQYbuHhWcl52to9hSvep8sfLh
 f9MRsBtj8aCbZrqBw0D4vjgQOoMODJlvpG/SS84Lv9VC4aOX/npe78kM6LZnXlEOwh9p +Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kwmsqgpr0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Nov 2022 12:42:06 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AHCIFpj035440;
 Thu, 17 Nov 2022 12:42:06 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kwmsqgpqs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Nov 2022 12:42:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MfjZc3uUkyihXQ1dT1Oc3vj9t2XT1/Lds4y2Uwqm8llETu8OCK39NApfUVingnFtxAjDgB1cog5RlOH9K+cPsDU4q/EsVaZh7/+pRhQ9T4Rq0+oG/2q1Um5RslXfL1vebVRp7Oht3+k4f3UPStONcci9C+QnCitu4MBn6xQ9LUGYXkBVrRFk1La2bZ6XHuCYQOqcv1ycYdMJs9Abh69nt2QAtv2AqVvXud78/sf6fXJqpd5j1kPPpP7z5MhBmjBro8IxSDPkq9TfY1bkfzFNLIh+N+wr0sdWvXODQmHO50cMcxzJX+18CV4wGujCtcOUJ9/z1ze2BG+oU07ESbEzfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WrKsdgItRNIjWhsWk5gvCpuA84zH542e4/r1zRG8LkY=;
 b=SM+hNm9O/Mi7z6ztyajtZnBUEzpVA8cf8mUGjXul/IzAlClxC+miwPVtMBOld60/a8IZFzZqXREV3dWtlJm5Qwx12tl24aPg8jWrKPJrRVEArSb32BM/Otrpma6CPwVRGvucYRxCW/5/HmorUPP3rhn8X/81Ro6t+LfY0Et0eaGXDAQwH8930/JzjD9Q9IgIA6bsUZ6JiATNt2yrAdjsJXoCrFVboOdV+YpBQG7VaGhhxi0Pcc8x8w4Bm7mOwX/0Q3pevlLGIdUbfEaXFQV5EsqSH3vPfnf9IiXkWpKWTFFg2tWIa1OyPfl/Kqgss90DXnJ1g0HwcJu2BDdtLafOjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=il.ibm.com; dmarc=pass action=none header.from=il.ibm.com;
 dkim=pass header.d=il.ibm.com; arc=none
Received: from MN2PR15MB3488.namprd15.prod.outlook.com (2603:10b6:208:a6::17)
 by BL0PR1501MB2130.namprd15.prod.outlook.com (2603:10b6:207:1b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Thu, 17 Nov
 2022 12:42:04 +0000
Received: from MN2PR15MB3488.namprd15.prod.outlook.com
 ([fe80::95f:9dc4:235d:c082]) by MN2PR15MB3488.namprd15.prod.outlook.com
 ([fe80::95f:9dc4:235d:c082%7]) with mapi id 15.20.5813.017; Thu, 17 Nov 2022
 12:42:04 +0000
From: Or Ozeri <ORO@il.ibm.com>
To: =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>, Danny Harnik <DANNYH@il.ibm.com>,
 "idryomov@gmail.com" <idryomov@gmail.com>
Thread-Topic: [EXTERNAL] Re: [PATCH v3] block/rbd: Add support for layered
 encryption
Thread-Index: AQHY+O1f2SmBS264OUGDNGysDDoGAa5AQqWAgAD970CAABidAIAADlGAgAGomlA=
Date: Thu, 17 Nov 2022 12:42:04 +0000
Message-ID: <MN2PR15MB3488DA644C772F708108977E8A069@MN2PR15MB3488.namprd15.prod.outlook.com>
References: <20221115122527.2896476-1-oro@il.ibm.com>
 <Y3PQj/MBztn8SobQ@redhat.com>
 <MN2PR15MB34886DD5A9D0F5D64A248AA08A079@MN2PR15MB3488.namprd15.prod.outlook.com>
 <Y3S6OGqGFovAyRWw@redhat.com> <Y3TGO6AEAAOux8FH@redhat.com>
In-Reply-To: <Y3TGO6AEAAOux8FH@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR15MB3488:EE_|BL0PR1501MB2130:EE_
x-ms-office365-filtering-correlation-id: d8503c27-83d4-4dc5-4ed1-08dac8992189
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 09/pKYOavyVhucNnIPS5k5O0UyoOmBOvlPHqtzs2fXR6qe4uXlT4eWXyXLySWac9lspBAvJWtcUUIDZ2f0uhrTFGFSAcDLXjT0vp5r3fn57wqjBBLzVED+y8a1WLo9CneZhK7jSaJiLmjmWl10RAif4K314Tk3rvg8fG2vNc73rTRyYAtxWiQwwTvCtijOMWCbegNy3BbxHkEJm0RCd8mKWPCcWBzf9OXXSIBAPvrscBTQT1lRZEHwxfaXnJw8Pn5SVOd5OCLf32FoImdbN6i33QMB2Uwak9u++BV0KHJSZnWRKAxCt4dXEOx/WgPwN0YlV/JryWrLUa0X2flSM0p9BaNHt4ju2xF4UXxCmdOMAs9jS4/JqgOEYO5Ty/IgPFwCS3ZzBDbpmouV+EapfFNCxVadhaSemWbRzTGR0UARjugo5/ItbvX3cU9oZdONIt+sY9RuS1ZFpGg0dLWZH/Pp8/CT1/XGXuIovXWMZSfoECr77BF+X6+9K1V5mbu3YiyTs/DrOtv56X024fnjaXjMItITC3jA0mm/yL8x9SpU4mJPpjmXJXYbGCyxm4N0bb6TUikzguHojIYEX87hrJIcPgFGs38FVN66j94KYloaBWWEVgTEXAVYKTy3FRTAXXuDAa40RIhsSClKCFaOLado6AgdeHrYpzuRvjX6unfOAj/Wzm281WvGiuxy1hw4yrsCFky51g6p0/fRs3MpU/fQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR15MB3488.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(39860400002)(366004)(136003)(376002)(346002)(451199015)(41300700001)(8936002)(83380400001)(4744005)(186003)(5660300002)(66476007)(26005)(71200400001)(66446008)(76116006)(9686003)(7696005)(64756008)(53546011)(6506007)(122000001)(66946007)(66556008)(8676002)(38070700005)(52536014)(478600001)(33656002)(316002)(110136005)(2906002)(38100700002)(86362001)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2g1VVptMnB2dm01ZnZaOWYvUkFnVkg3YmlXTTdHUWZ4Q3FoZnNESytMYXUw?=
 =?utf-8?B?NEc1ekVVQ2N6dmJiMlFaaHIyTFAwNHBsU05nR2VFdzcxVjBlVTFpb05RbENo?=
 =?utf-8?B?aTNNYXFJOVlVSDFTVnB0ZUF6czNqQmFWTnpRWWFxYWhZb0FoMi90R2Fyei9T?=
 =?utf-8?B?bGFGamRQS0liZEFNclEwaDN6ZVRxRmdDclBhdDQ1cFAraHQ4UzNiVFZGSkhu?=
 =?utf-8?B?SUhxNXRtdW0vaHZWaWEva0lnN08rVnluZm9hTlpCdmVkaHZZNVZMNUVscE82?=
 =?utf-8?B?cUdIeS9RZ0tCcXZKSDMyVVZPVWpLdnNLVEVPRkZMRllmOEtjb3NIOG5yUGZs?=
 =?utf-8?B?VkJnZklxSHNIbmZieDJFZUd0M1E4dmlBUWpPT1ZXTlZFZ1lkZDdteUY5cFBq?=
 =?utf-8?B?a2wvT1NmSVlyN1Z0TitMU3FsaDNnL1dQNTY5K1hmSmFRL2F4dDVtQ1V3b3ht?=
 =?utf-8?B?Z2RLeFdUNGxaSW14MHJiVEFoWEU0eUd3RTFnaVZnaFF5WTkrT1UrODl6YXhP?=
 =?utf-8?B?Ni9Jc3phWEVnS2xuSmxveXdYdW5RM1dKV2JnWXY1Y1RJamx2eFpZT24ya2ND?=
 =?utf-8?B?aElYdU52aVA1RnVjZk5OVFpSSVJORkY0RlR5N1Z4R1YvUXB2WUZpWFR4QnJQ?=
 =?utf-8?B?TDhNWmhwRnBRSk4zQnJWZkdZb1NvWncvQVdaNC80UkVHS0V2V2VXQ3NkTlJp?=
 =?utf-8?B?MWtNVkx4dE9TSE5ERXdQN1hHdjJIZ3BkT0ZQcXM0OWcxb01kMHl3Q1R4ZWtJ?=
 =?utf-8?B?dzd6Q1pUVmFDcGNCc3JoMnpXQkVoTmtMTXEzOEc0ZlE1MzJRM09pc2IrNXkv?=
 =?utf-8?B?MVFoajlmUGNmalJMeUsrRUVUV24wUUNrVGlSelpyaFkxbURKNWF5cFpXOFBV?=
 =?utf-8?B?MWtqNW4yeXYxNHdnUGZ3OEVxTjFmei9lNG1kbkpKbW50MzQ3QmpUZzYyNGxn?=
 =?utf-8?B?WGZTeUNCUXBNaFFXRG1ZVW9MSUpORG16UzZhRjh5V0hzQ1NPUjNuOHBWdW9H?=
 =?utf-8?B?Rm94cVV2MmJhTm91bVgyNm1HT1pMS0FvNGdxZVZ1NTNqTnJoV3RvcnpIZHA4?=
 =?utf-8?B?RHFQYXI3bjVNdkVtRUxLQ2lQRXFDZlhvOEJLdFJyRCtCVGxaa0lSTXJzQWRv?=
 =?utf-8?B?MHhEVmhqVjNITTBlOUgxTmlrc1ZvUlZzNWQvaThjNnM4Z2JhY2FzQVlhM1lH?=
 =?utf-8?B?b3VOekNyajhlY2N2eHpJRzlFV1dET2RJTy94R3JtQTN6Vk9KdUdORVpZMDJG?=
 =?utf-8?B?dlNhTWNXYjRFdFRyUkdFZzUwN0tNNTJIVG9rSzBjeWRNenNXQUtkTHh3MGo1?=
 =?utf-8?B?L0p6NXFpVGtGQzVxT3lhSm80TGFzaDRZSXk5Zkcwc1RrMEpqSENyaEt4Tk9m?=
 =?utf-8?B?VlRubWZXamxnaVJ5VUZBT3dtQlhYeDZhdjV5eStTUmF2cnVvNU9sRUEvbHQ5?=
 =?utf-8?B?N0ZKOUNYTkFodEx6M3ZKblRJaFdmSXNrSkhmNDhVYmNYZG5xbmpaTnorQzk2?=
 =?utf-8?B?STZuakhKY2xGMjdqWHI4dlc4cTM3TU0zbk9DS0l2R0JRcVJseWdnaTdBNzFW?=
 =?utf-8?B?Z0JSSzJuRHhKQ0tGNkhaL3lIUlBmOVd4REJ6cnJkazlDR0tqRk1JNmJaUVdy?=
 =?utf-8?B?dTZSZFJRRFlXNDdSU2o0OSt2R3FlOWxjQUJGd01HWlJpWjNnSnhmNS9hUzkw?=
 =?utf-8?B?Y2VtME9MUlMxblBCTC9ILzA3QXptZy81OXNoU2xNUlUwRGdReC8rTmZNMDRk?=
 =?utf-8?B?VVhub1JMOVdzYUhaT25taWV2VTNYZHgxTjIxNkJ1S0dWMFUzRFgwNXJkUURE?=
 =?utf-8?B?VWdCM0dlZ1hNdjFiV0UyTGRDOGR5UXlhL1U3M1RXQTJRUzNmcHZYV3ZZR3Ji?=
 =?utf-8?B?ZHpDcGJTSElHZ2dMVHhlOXBYMGxyTFdnT1VkRDI3RWtRQ3NsWnNnYjI0UXdV?=
 =?utf-8?B?Qnc2RUdNbWFEM3hUQTJaTC9FalN0cTVPV0NHUUpmeU1LaTdKRU1JNXFDSEZz?=
 =?utf-8?B?VUtNSmFRZnYvZnM0ZTdVc1NwY1RSZ0pReHcrN1VOSytvaUJpNFViVU9ZYTFt?=
 =?utf-8?B?dDJGSThmK2ZySVg5NlFCdGQ0QjZSTDdzZEdlb0pwRHFzRlgzZTRtbjVDSlRw?=
 =?utf-8?Q?JbFQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: il.ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR15MB3488.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8503c27-83d4-4dc5-4ed1-08dac8992189
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2022 12:42:04.4076 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: epjgRjFVi5sB3vLbr0fzlYOx5iApy4XViUgM+sXTHXOqEfpuu+x0wvoNshIiA/xF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR1501MB2130
X-Proofpoint-GUID: ptY5degx2BKvyYBSf6-Y8gucPyeGS0U1
X-Proofpoint-ORIG-GUID: EMKIgoPzsCByKQS93ilQYIV2bQOHHlRK
Subject: RE: [PATCH v3] block/rbd: Add support for layered encryption
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-17_06,2022-11-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211170095
Received-SPF: pass client-ip=148.163.156.1; envelope-from=ORO@il.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGFuaWVsIFAuIEJlcnJh
bmfDqSA8YmVycmFuZ2VAcmVkaGF0LmNvbT4NCj4gU2VudDogMTYgTm92ZW1iZXIgMjAyMiAxMzox
NQ0KPiBUbzogT3IgT3plcmkgPE9ST0BpbC5pYm0uY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3Jn
OyBxZW11LQ0KPiBibG9ja0Bub25nbnUub3JnOyBEYW5ueSBIYXJuaWsgPERBTk5ZSEBpbC5pYm0u
Y29tPjsNCj4gaWRyeW9tb3ZAZ21haWwuY29tDQo+IFN1YmplY3Q6IFtFWFRFUk5BTF0gUmU6IFtQ
QVRDSCB2M10gYmxvY2svcmJkOiBBZGQgc3VwcG9ydCBmb3IgbGF5ZXJlZA0KPiBlbmNyeXB0aW9u
DQo+IA0KPiBPbiBXZWQsIE5vdiAxNiwgMjAyMiBhdCAxMDoyMzo1MkFNICswMDAwLCBEYW5pZWwg
UC4gQmVycmFuZ8OpIHdyb3RlOg0KPiANCj4gU28gd2l0aCB0aGF0IHByZWNlZGVudCBJIGd1ZXNz
IGl0IGlzIG9rIHRvIGFkZCAnbHVrcy1hbnknLg0KPiANCg0KU28gaXMgaXQgT0sgdG8gbGVhdmUg
dGhlICJsdWtzLWFueSIgY2hhbmdlcyB0byB0aGlzIGNvbW1pdD8NCklmIG5vdCwgaXMgaXQgb2sg
dG8gc3BsaXQgdGhpcyB0byAyIGNvbW1pdHMsIGluIHRoZSBzYW1lICJwYXRjaC1zZXJpZXMiPw0K
DQpCVFcgaXMgdGhlcmUgYSBwb3NzaWJpbGl0eSB0aGlzIHdpbGwgYWN0dWFsbHkgbWFrZSBpdCB0
byA3LjI/DQpGb3IgbWUgcGVyc29uYWxseSwgdGhlIGhpZ2hlc3QgcHJpb3JpdHkgZm9yIG1lIGlz
IGp1c3QgZ2V0dGluZyBpdCBtZXJnZWQgKG5vdCBuZWNlc3NhcmlseSB0byB0aGUgNy4yIHJlbGVh
c2UpLA0Kc28gdGhhdCBJIGNhbiBzdWJtaXQgYSBmb2xsb3ctdXAgcGF0Y2ggdG8gbGlidmlydC4N
Cg==

