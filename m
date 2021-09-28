Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F54941B25A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 16:48:41 +0200 (CEST)
Received: from localhost ([::1]:44632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVEPP-0006MG-JM
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 10:48:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9905a3ac13=jtanen@fb.com>)
 id 1mVDrN-0006TJ-Gs
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 10:13:33 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:56894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9905a3ac13=jtanen@fb.com>)
 id 1mVDrL-0004FN-8b
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 10:13:29 -0400
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18SA4LTv025026; 
 Tue, 28 Sep 2021 07:13:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : mime-version; s=facebook;
 bh=Zxw1mxdpl04FRrD4wKUL1wuKi3ngpfKdv0ssnKMxqYk=;
 b=j/2Z3oE8dOxoA8Ql/j2R6pujea05Uy/YTVh5j/T/G+sMa8gvr6s8NGjc41aoLrJA45oo
 mTJ1Q7xrJXQHFoNtTvWcyfS0Cjo9rLuuKCy1zeEArLOWMA5ZIaPaLdtSPHW1t+bMizdx
 qP9IVQ0ecATFy65vLnR7saYxKO160c1n+8M= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 3bbq81vu59-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 28 Sep 2021 07:13:20 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Tue, 28 Sep 2021 07:13:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=czJ7I5HckxsD4t/iEzlxv5U0spMR1NaRDiA/b1dPp7GfWqfWq7WgrMfDoqCaaGvBKZ+CYJBTwMt6Yl5a1lZprIuX1laJFkWgFrf3jVDiySfmGNRwT+NjLQM0dMJTZJC7qi0lj3b/XF8S+Nos/tEmerTOm+xObECtajn52uQFt44HyjMl/bv3KNTIpTSNfg+DRgQPXYvjtt8f76bcxFyRUf71lbmZb423qcvRYMxzY9R8TA19HqOLO+A83TKkQOmDeJzremSk699QPnKJJvXTMut8tSfJK3jTtm1Wz3/QekoKhhyqbdqXHUefd7H6qDbf5LLCE8wM+5iZTMbXaW+G1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Zxw1mxdpl04FRrD4wKUL1wuKi3ngpfKdv0ssnKMxqYk=;
 b=B8M5aNGE7tepkuoJ0GTJQZU5evxS5M8BFYyOFcljNh5HrtoHkpcXiNQR2X1Z4VxaTQMecl9XCfHMceGpwXf2PABMZcuSVmddP2//L0Gnd9SL0SfignAFbX5UeTkkhcV4vTvmsIn2nEro+0t4tcJQZzjhU1hRz2QL7wxBcGz3DrQSElPQaunSTWYJ1f/TBTw5L7z5lC38rfvTQWKdrB4WQ1lrSBXhF1W6QKnSOExE6GaBrkugZ1v0xJS4opzk+q3CW1i2DjgRcKQpirvM1ZbB6QgwFp8cGLyPi6IJp+m/i4RynaMLUViQTCDtyqdM1BK8FHxlSGsI3WiowyJrnO6hFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from SA1PR15MB4484.namprd15.prod.outlook.com (2603:10b6:806:197::5)
 by SA0PR15MB4015.namprd15.prod.outlook.com (2603:10b6:806:8f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13; Tue, 28 Sep
 2021 14:13:18 +0000
Received: from SA1PR15MB4484.namprd15.prod.outlook.com
 ([fe80::f087:d4d8:2453:9135]) by SA1PR15MB4484.namprd15.prod.outlook.com
 ([fe80::f087:d4d8:2453:9135%6]) with mapi id 15.20.4544.022; Tue, 28 Sep 2021
 14:13:18 +0000
From: Joe Tanen <jtanen@fb.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "dirty@apple.com" <dirty@apple.com>
Subject: Issue with time going backwards on OSX
Thread-Topic: Issue with time going backwards on OSX
Thread-Index: AQHXtHL8WA9WEEYKikq0JyqP9DGzkQ==
Date: Tue, 28 Sep 2021 14:13:18 +0000
Message-ID: <7ADF21C8-B567-4B66-B1F6-475626868561@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=fb.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7c206a2-50ae-4cb3-50db-08d9828a1eff
x-ms-traffictypediagnostic: SA0PR15MB4015:
x-microsoft-antispam-prvs: <SA0PR15MB40150AB257B8C2071B6DA4D2ABA89@SA0PR15MB4015.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x9PMnt6XUWGkKATvwqVvF8/LqUcIjx52QHxk8OUvVHw+88UxjanXzsVo1MeJ4Pu3W8v13/ldUU1ra6vDqTiOVz6EI3MbgSW24A844b9oh3EMYoSiv+bl2KOSS+ws1ASZySH2pcQSY12FSwAl7xzkFrRC3XSrYFq8E6os3L6iMN3NMAdroAljGKkYEJmhw2c0M1ZoH9IB2rK+8xgbo8VWWvFUSp3Ws9jAv18yXJySWgVwf2oOunARDRyZMhlNclakWID0W37mBAKfUhWdW3opsKck3KYgfODqX78ae00swkI/2eLgMp+Nngy1AwBdcShUfza6YqRN47oQwf0yijJ2qLxNVkXCJFAw1JXS+ob829PnG1a+Yiy4louRMkVGWihWDAnN6X5z59so719vI1fdqmJOAmKR5e78h5v1pkDUqxIWrpoHyt8RDu30O1jhywKyqeNoKCwVXjVKzugcjSqf8+Oqp9FIFlhGulFcMcp7B0CJHWLDuVSEkxqb/HQEXq/TxPP5EsFpq6ikXDJ2Y3bHIb5cLhD3QukCy0SirZr4sIpjEsKxZ36MDa0cRn4IsZ0MilF+coL+Z1bziUf4Ue9LJMO/vPQui1ppk3vDuCE3CmU8IYkVGT0THrEoJ4SeS9Dj2GPoxkohCdO0isEZDj0b/NlALsNAw3rnlmVeSqqnOuFmj9WO8HPmZxr1qgKmGTuNMJ61Qc8Usig8MLFPUeYnen0726uB3mEYNGoffTQMllQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR15MB4484.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(5660300002)(36756003)(71200400001)(83380400001)(66476007)(66446008)(6486002)(66556008)(64756008)(86362001)(2906002)(6512007)(8936002)(33656002)(122000001)(316002)(38100700002)(9326002)(6506007)(6916009)(66946007)(91956017)(508600001)(76116006)(2616005)(4326008)(38070700005)(186003)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YktubUNjUHpNSWNscDlvUDhIRVBVUXRVSWtJVHJrTXRsWWUvdnJSVVVDYVBP?=
 =?utf-8?B?eGNxdjBMNDFUUjFKZVVqUDgyOGZLTE9ieVhOSzBmWUlVcmR2RGdqeEk3Rm5t?=
 =?utf-8?B?ZXRYU3VMZFh5VGUyRjdWa0ZUV2R2UjNwS29xVWdYOXU3OHAzSy9KMkM1QzZv?=
 =?utf-8?B?NFNWUE5Jb3A0ckRBc1F2OE5NSmdSbUNrUmNWc096R1hYN0pmR2VhQTFIdXdG?=
 =?utf-8?B?cWw0L3pDUnc4TXM1dFcxMkh0Q29oUkxGSXJIdi96Rk85Zk40TSs2ZUV5NnZX?=
 =?utf-8?B?YUFSYnAxbG5mNkh3WW8yUmxyNDF0TU9QSXdlQW5vaWFUNDVDc2NkWUxZazZH?=
 =?utf-8?B?NEt1WXN0ejdvWUp6WW02T092U3lkNjI2NkQzRUFITk50VjlOeVlMQkdHWlRN?=
 =?utf-8?B?eEhkWExCS24xUWF2LzgwSmVHcWw0QTJ6OEtGNTh0elhNbU9xRTNFQytxYWhi?=
 =?utf-8?B?OGZYZDl3eFpseW5TQ09YZXRaZ2hyVlkybzRhd2s0SHB1YWx3M3RqZFQ3dTdj?=
 =?utf-8?B?RUE0OGJQS0oxenAxK2xSZ2l5dXNHKzF2UWIzU2tzSlJWQ3c1NlBzTjJmUXl4?=
 =?utf-8?B?N2ZrSUdNMFBzYUg3dm9Mdno5OCtyaCtKNDFwb2RXcHdIWVh4Q2xObkt0dXVa?=
 =?utf-8?B?aU0zalozZkpjWFZwamQvMUhscHQzenZ4bGk5REZPTlc0bTh0RGtFa0lqSzRQ?=
 =?utf-8?B?SHYzSW9TcUZFQ3BWc0liZEhUNHNYMi9PUFFWbS93LzMwUTdpWjFzbTJBM0ZN?=
 =?utf-8?B?ZVFZZTB1bzZXTWhRdkp2TjlpN2xXZVJnV2FnWjBUSmlaZk92aEZsUkE0SnFO?=
 =?utf-8?B?RUNkUkZBajVLV1pUcUVZeHgvZWlyc3F6NUNKMS9mVGxMNjBJb0g4aUliaENp?=
 =?utf-8?B?ZUdlbjllWEFmV21mZU5NY1BncUxsN0VOTEZhTGZ1eVNiZGpxMmRGbndHV1N0?=
 =?utf-8?B?NHFWRzR5c3QvT2p2bmFJMmhHWElxWTBGNlZ1VU9IYlNMNXd0QVNWWmx3NzNy?=
 =?utf-8?B?c2hHS3h1TkVOelVkbHpZeHY5a0VkWVpzZ1lpS2FRdnovWWNsR0FOdU1yZUMx?=
 =?utf-8?B?Q0ROblB0OUpwT1VJWHpFclQrL1FpVGFRbzVsS2FTdGI1OFZMTUFWVFFxbFRH?=
 =?utf-8?B?M0VQMGtJRURSV2pnVk1RcFU2aUFxS2FUdlNhd2JSNmg1RFgzTkxSQUdKaUxs?=
 =?utf-8?B?N1A5aHdGVVl4UWlOSDdkWkNlRE5BR3FucXNvZ0ZldkxzeTBrK2ZDMFpuOVAr?=
 =?utf-8?B?U3Y1RFZZOUVEUnlKRFJaRGhYbTQxSlhlaW5CaHU3cXZXNXlUQzQzU0ZoMzM5?=
 =?utf-8?B?bUs0ZmwrbU9RMEJ0cXB6d3BwY3BCYnFFdjNRTU9ZTjlRczJSQzQ4ZnpYcHp3?=
 =?utf-8?B?VDk5QmxYSmxrWjROSVpOWm5HSnVSazZ2dFNJWHhldHpuNkYyYzg0SS9zdE5y?=
 =?utf-8?B?dGFSUVFCajZqZHRuUUp6UFVCUERpcVBIS0tUZUFGOHNweFZNSHo5dXR3dlJU?=
 =?utf-8?B?L3RwbUx3OVhUd010NlFqemZhT1VCS093REhqRThFK2RBcWF2M1ZyU2tBQStE?=
 =?utf-8?B?OHlzeTMwdm1BOExOdlViSXExUzg0c0hVOFRHNkkwNC83SzRQQU12NWdBdEZZ?=
 =?utf-8?B?cXRtRnhjMzVoRmgwQlZ5N0hEa21MbUxaL1lIK21aRVozTGFXdklKOGZOcGtn?=
 =?utf-8?B?ajdTSS9zRjFZZ09wemh0c0d6R3BGM3hHOStDMHRyWEEvMlRBd0lUVmxjeU9m?=
 =?utf-8?B?WkROdlVYZlQzZ3prcTAyc1dxdkE1elJnUEEwWjdETk1EaXNNOFhiZWM0ZkZO?=
 =?utf-8?Q?iiu0SqgT/sJ6FYJGVApkePOmrWKgqbL1HR/do=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_7ADF21C8B5674B66B1F6475626868561fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR15MB4484.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7c206a2-50ae-4cb3-50db-08d9828a1eff
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2021 14:13:18.5478 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ujS1D+pka44TnwN54WZzDreSViTWD6hFvlFm3pT2XY6Fa+95Hb8+sxmqu8TfQigs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR15MB4015
X-OriginatorOrg: fb.com
X-Proofpoint-ORIG-GUID: 3f5cOKQ4F79XTYOM6MpZWkjRtFdcHxq0
X-Proofpoint-GUID: 3f5cOKQ4F79XTYOM6MpZWkjRtFdcHxq0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-28_05,2021-09-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 lowpriorityscore=0
 clxscore=1011 mlxscore=0 suspectscore=0 impostorscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109280082
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=9905a3ac13=jtanen@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 28 Sep 2021 10:46:10 -0400
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

--_000_7ADF21C8B5674B66B1F6475626868561fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8sDQoNCkkgcG9zdGVkIHRoaXMgb24gcWVtdS1kaXNjdXNzLCBidXQgaXQgZG9lc24ndCBz
ZWVtIGxpa2UgYW55Ym9keSBlbHNlIGhhcyBzZWVuIHRoaXMgaXNzdWUuIEkgZmlndXJlZCBJJ2Qg
dHJ5IGhlcmUgdG8gc2VlIGlmIGFueWJvZHkgaGFkIGFueSB0aG91Z2h0cy4NCg0KSSdtIHVzaW5n
IHFlbXUtc3lzdGVtLWFhcmNoNjQgdjUuMiBvbiBPU1ggMTEuNi4gV2hpbGUgcmVhZGluZyBjbnR2
Y3RfZWwwLCBJJ3ZlIHNlZW4gdGhlIHRpY2tzIGNvdW50IGdvIGJhY2t3YXJkcy4gSSBkdWcgaW50
byB0aGUgcWVtdSBzb3VyY2UgYSBiaXQsIGFuZCB0aGlzIHJlZ2lzdGVyIGlzIGV2ZW50dWFsbHkg
YmFja2VkIGJ5IGEgY2FsbCB0byBjbG9ja19nZXR0aW1lKENMT0NLX01PTk9UT05JQyksIHdoaWNo
IHNob3VsZCBub3QgZ28gYmFja3dhcmRzLiBUaGlzIGNvZGUgc2VlbXMgdG8gYmUgdGhlIHNhbWUg
b24gbWFzdGVyIGFzIHRoZSBicmFuY2ggSSdtIG9uLg0KDQpCZWZvcmUgSSBzdGFydGVkIGRlbHZp
bmcgaW50byBkZWJ1Z2dpbmcgcWVtdSwgSSB3YW50ZWQgdG8gdmVyaWZ5IHRoYXQgdGhpcyB3YXNu
J3QgYW4gT1MgaXNzdWUuIEkgd3JvdGUgYSBzaW1wbGUgdGVzdCB0aGF0IHJlYWQgQ0xPQ0tfTU9O
T1RPTklDIGV2ZXJ5IDEwMG1zLCBjb21wYXJlZCB0aGUgdmFsdWVzIHRvIG1ha2Ugc3VyZSB0aGV5
IGFsd2F5cyBpbmNyZWFzZWQsIGFuZCBsZXQgaXQgcnVuIG92ZXJuaWdodC4gTG8gYW5kIGJlaG9s
ZCwgSSBzYXcgdGltZSBnbyBiYWNrd2FyZHMuIEkgcmFuIGEgY29uY3VycmVudCB0ZXN0IHdpdGgg
Q0xPQ0tfTU9OT1RPTklDX1JBVywgYW5kIEkgZGlkIG5vdCBzZWUgdGltZSBnbyBiYWNrd2FyZHMu
IFN1Y2Nlc3NpdmUgcmVhZHMgb2YgdGhlIENMT0NLX01PTk9UT05JQyBhZnRlciBpdCBqdW1wZWQg
YmFja3dhcmRzIHRyYWNrZWQgdGhlIG5ldyB0aW1lLCBzbyB0aGUganVtcCB3YXNuJ3QgYSBzcHVy
aW91cyBlcnJvci4gV2hlbiBJIHJhbiB0aGlzIHRlc3Qgb24gYSBGZWRvcmEgMzQgUEMsIEkgbmV2
ZXIgc2F3IHRpbWUgZ28gYmFja3dhcmRzLg0KDQpTb21lb25lIHN1Z2dlc3RlZCBhcyBhIHRlc3Qg
ZGlzYWJsaW5nIG5ldHdvcmtpbmcgc28gdGhlIE5UUCBkYWVtb24gY291bGRuJ3QgbWVzcyB3aXRo
IHRoZSBjbG9jaywgYnV0IHRoYXQncyBub3Qgc29tZXRoaW5nIEkgY2FuIGRvIElSTC4gSW4gYW55
IGNhc2UsIG15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCBDTE9DS19NT05PVE9OSUMgc2hvdWxkIG5l
dmVyIGdvIGJhY2t3YXJkcyBhbmQgdGhhdCBhbnkgYWRqdXN0bWVudHMgYXJlIG1hZGUgYnkgdGVt
cG9yYXJpbHkgc2xvd2luZyBkb3duIG9yIHNwZWVkaW5nIHVwIHRoZSB0aWNrIHJhdGUuIEknbSBn
b2luZyB0byBwdXJzdWUgd2hhdCBJIGJlbGlldmUgdG8gYmUgdGhlIHVuZGVybHlpbmcgaXNzdWUg
c2VwYXJhdGVseSwgYnV0IG15IHFlbXUgcXVlc3Rpb25zIGFyZSB0aGVzZToNCg0KLSBIYXMgYW55
Ym9keSBlbHNlIHNlZW4gdGhpcyBvciBvdGhlciB0aW1lciByZWdpc3RlcnMgZ28gYmFja3dhcmRz
IHVuZGVyIHRoZXNlIG9yIG90aGVyIGNvbmRpdGlvbnM/IEkgb25seSBzZWUgdGhlIGJlaGF2aW9y
IG9uIE9TWCAxMS42LCBidXQgSSdtIGEgc21hbGwgc2FtcGxlIHNpemUuDQoNCi0gV291bGQgaXQg
bWFrZSBzZW5zZSB0byB1c2UgQ0xPQ0tfTU9OT1RPTklDX1JBVyAoaWYgYXZhaWxhYmxlKSBpbnN0
ZWFkIG9mIENMT0NLX01PTk9UT05JQyBpbiBxZW11PyBNeSBpc3N1ZSBhc2lkZSwgQ0xPQ0tfTU9O
T1RPTklDX1JBVyBmZWVscyBjbG9zZXIgdG8gZ2l2aW5nIHRoZSBndWVzdCBkaXJlY3QgYWNjZXNz
IHRvIGEgaGFyZHdhcmUgY2xvY2suIGUuZy4sIGlmIEkgd2FudGVkIHRvIHdyaXRlIG15IG93biBO
VFAgdGltZSBhZGp1c3RtZW50IGRhZW1vbiwgSSdkIHByZWZlciB0byBoYXZlIGFuIHVuYWRqdXN0
ZWQgY2xvY2suIFRoZSBjb2RlIGFscmVhZHkgY2hlY2tzIHRvIHNlZSBpZiBDTE9DS19NT05PVE9O
SUMgaXMgYXZhaWxhYmxlLCBhbmQsIGlmIG5vdCwgaXQgcmV2ZXJ0cyB0byBhIHNpbXBsZSBnZXR0
aW1lb2ZkYXkoKS4gSXQgd2FzIGVhc3kgdG8gYWRkIGFub3RoZXIgY2hlY2sgdG8gaW5pdF9nZXRf
Y2xvY2soKSB0byBhZGQgYSBjYXNlIGNoZWNraW5nIGZvciB0aGUgYXZhaWxhYmlsaXR5IG9mIENM
T0NLX01PTk9UT05JQ19SQVcuIEkndmUgdGVzdGVkIHRoaXMgbXlzZWxmLCBidXQgSSB3YW50ZWQg
dG8gc2VlIGlmIHRoZXJlIHdhcyB1cHN0cmVhbSBpbnRlcmVzdCBpbiB0aGlzIGFuZC9vciBpZiB0
aGVyZSB3ZXJlIHJlYXNvbnMgdG8gcHJlZmVyIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uLg0K
DQpUaGFua3MsIGFuZCBiZXN0IHJlZ2FyZHMsDQpKb2UNCg0K

--_000_7ADF21C8B5674B66B1F6475626868561fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <62004FF5116C52449D232AE458425F1E@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToy
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3Jt
YWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0KCWZvbnQtc2l6
ZToxMS4wcHQ7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0Kc3Bhbi5FbWFp
bFN0eWxlMTcNCgl7bXNvLXN0eWxlLXR5cGU6cGVyc29uYWwtY29tcG9zZTsNCglmb250LWZhbWls
eToiQ2FsaWJyaSIsc2Fucy1zZXJpZjsNCgljb2xvcjp3aW5kb3d0ZXh0O30NCi5Nc29DaHBEZWZh
dWx0DQoJe21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJp
IixzYW5zLXNlcmlmO30NCkBwYWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjguNWluIDExLjBpbjsN
CgltYXJnaW46MS4waW4gMS4waW4gMS4waW4gMS4waW47fQ0KZGl2LldvcmRTZWN0aW9uMQ0KCXtw
YWdlOldvcmRTZWN0aW9uMTt9DQotLT48L3N0eWxlPg0KPC9oZWFkPg0KPGJvZHkgbGFuZz0iRU4t
VVMiIGxpbms9IiMwNTYzQzEiIHZsaW5rPSIjOTU0RjcyIiBzdHlsZT0id29yZC13cmFwOmJyZWFr
LXdvcmQiPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PjxzcGFuIHN0eWxlPSJjb2xvcjpibGFjayI+SGVsbG8sPG86cD48L286cD48L3NwYW4+PC9wPg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImNvbG9yOmJsYWNrIj48bzpwPiZuYnNw
OzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iY29s
b3I6YmxhY2siPkkgcG9zdGVkIHRoaXMgb24gcWVtdS1kaXNjdXNzLCBidXQgaXQgZG9lc24ndCBz
ZWVtIGxpa2UgYW55Ym9keSBlbHNlIGhhcyBzZWVuIHRoaXMgaXNzdWUuIEkgZmlndXJlZCBJJ2Qg
dHJ5IGhlcmUgdG8gc2VlIGlmIGFueWJvZHkgaGFkIGFueSB0aG91Z2h0cy48bzpwPjwvbzpwPjwv
c3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iY29sb3I6YmxhY2si
PiZuYnNwOzxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFu
IHN0eWxlPSJjb2xvcjpibGFjayI+SSdtIHVzaW5nIHFlbXUtc3lzdGVtLWFhcmNoNjQgdjUuMiBv
biBPU1ggMTEuNi4gV2hpbGUgcmVhZGluZyBjbnR2Y3RfZWwwLCBJJ3ZlIHNlZW4gdGhlIHRpY2tz
IGNvdW50IGdvIGJhY2t3YXJkcy4gSSBkdWcgaW50byB0aGUgcWVtdSBzb3VyY2UgYSBiaXQsIGFu
ZCB0aGlzIHJlZ2lzdGVyIGlzIGV2ZW50dWFsbHkgYmFja2VkIGJ5IGEgY2FsbCB0byBjbG9ja19n
ZXR0aW1lKENMT0NLX01PTk9UT05JQyksDQogd2hpY2ggc2hvdWxkIG5vdCBnbyBiYWNrd2FyZHMu
IFRoaXMgY29kZSBzZWVtcyB0byBiZSB0aGUgc2FtZSBvbiBtYXN0ZXIgYXMgdGhlIGJyYW5jaCBJ
J20gb24uPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4g
c3R5bGU9ImNvbG9yOmJsYWNrIj4mbmJzcDs8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iY29sb3I6YmxhY2siPkJlZm9yZSBJIHN0YXJ0ZWQg
ZGVsdmluZyBpbnRvIGRlYnVnZ2luZyBxZW11LCBJIHdhbnRlZCB0byB2ZXJpZnkgdGhhdCB0aGlz
IHdhc24ndCBhbiBPUyBpc3N1ZS4gSSB3cm90ZSBhIHNpbXBsZSB0ZXN0IHRoYXQgcmVhZCBDTE9D
S19NT05PVE9OSUMgZXZlcnkgMTAwbXMsIGNvbXBhcmVkIHRoZSB2YWx1ZXMgdG8gbWFrZSBzdXJl
IHRoZXkgYWx3YXlzIGluY3JlYXNlZCwNCiBhbmQgbGV0IGl0IHJ1biBvdmVybmlnaHQuIExvIGFu
ZCBiZWhvbGQsIEkgc2F3IHRpbWUgZ28gYmFja3dhcmRzLiBJIHJhbiBhIGNvbmN1cnJlbnQgdGVz
dCB3aXRoIENMT0NLX01PTk9UT05JQ19SQVcsIGFuZCBJIGRpZCBub3Qgc2VlIHRpbWUgZ28gYmFj
a3dhcmRzLiBTdWNjZXNzaXZlIHJlYWRzIG9mIHRoZSBDTE9DS19NT05PVE9OSUMgYWZ0ZXIgaXQg
anVtcGVkIGJhY2t3YXJkcyB0cmFja2VkIHRoZSBuZXcgdGltZSwgc28gdGhlIGp1bXAgd2Fzbid0
DQogYSBzcHVyaW91cyBlcnJvci4gV2hlbiBJIHJhbiB0aGlzIHRlc3Qgb24gYSBGZWRvcmEgMzQg
UEMsIEkgbmV2ZXIgc2F3IHRpbWUgZ28gYmFja3dhcmRzLjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJjb2xvcjpibGFjayI+PG86cD4mbmJz
cDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImNv
bG9yOmJsYWNrIj5Tb21lb25lIHN1Z2dlc3RlZCBhcyBhIHRlc3QgZGlzYWJsaW5nIG5ldHdvcmtp
bmcgc28gdGhlIE5UUCBkYWVtb24gY291bGRuJ3QgbWVzcyB3aXRoIHRoZSBjbG9jaywgYnV0IHRo
YXQncyBub3Qgc29tZXRoaW5nIEkgY2FuIGRvIElSTC4gSW4gYW55IGNhc2UsIG15IHVuZGVyc3Rh
bmRpbmcgaXMgdGhhdCBDTE9DS19NT05PVE9OSUMgc2hvdWxkIG5ldmVyIGdvIGJhY2t3YXJkcw0K
IGFuZCB0aGF0IGFueSBhZGp1c3RtZW50cyBhcmUgbWFkZSBieSB0ZW1wb3JhcmlseSBzbG93aW5n
IGRvd24gb3Igc3BlZWRpbmcgdXAgdGhlIHRpY2sgcmF0ZS4gSSdtIGdvaW5nIHRvIHB1cnN1ZSB3
aGF0IEkgYmVsaWV2ZSB0byBiZSB0aGUgdW5kZXJseWluZyBpc3N1ZSBzZXBhcmF0ZWx5LCBidXQg
bXkgcWVtdSBxdWVzdGlvbnMgYXJlIHRoZXNlOjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJjb2xvcjpibGFjayI+Jm5ic3A7PG86cD48L286
cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImNvbG9yOmJs
YWNrIj4tIEhhcyBhbnlib2R5IGVsc2Ugc2VlbiB0aGlzIG9yIG90aGVyIHRpbWVyIHJlZ2lzdGVy
cyBnbyBiYWNrd2FyZHMgdW5kZXIgdGhlc2Ugb3Igb3RoZXIgY29uZGl0aW9ucz8gSSBvbmx5IHNl
ZSB0aGUgYmVoYXZpb3Igb24gT1NYIDExLjYsIGJ1dCBJJ20gYSBzbWFsbCBzYW1wbGUgc2l6ZS48
bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0i
Y29sb3I6YmxhY2siPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPjxzcGFuIHN0eWxlPSJjb2xvcjpibGFjayI+LSBXb3VsZCBpdCBtYWtlIHNlbnNlIHRv
IHVzZSBDTE9DS19NT05PVE9OSUNfUkFXIChpZiBhdmFpbGFibGUpIGluc3RlYWQgb2YgQ0xPQ0tf
TU9OT1RPTklDIGluIHFlbXU/IE15IGlzc3VlIGFzaWRlLCBDTE9DS19NT05PVE9OSUNfUkFXIGZl
ZWxzIGNsb3NlciB0byBnaXZpbmcgdGhlIGd1ZXN0IGRpcmVjdCBhY2Nlc3MgdG8gYSBoYXJkd2Fy
ZSBjbG9jay4gZS5nLiwNCiBpZiBJIHdhbnRlZCB0byB3cml0ZSBteSBvd24gTlRQIHRpbWUgYWRq
dXN0bWVudCBkYWVtb24sIEknZCBwcmVmZXIgdG8gaGF2ZSBhbiB1bmFkanVzdGVkIGNsb2NrLiBU
aGUgY29kZSBhbHJlYWR5IGNoZWNrcyB0byBzZWUgaWYgQ0xPQ0tfTU9OT1RPTklDIGlzIGF2YWls
YWJsZSwgYW5kLCBpZiBub3QsIGl0IHJldmVydHMgdG8gYSBzaW1wbGUgZ2V0dGltZW9mZGF5KCku
IEl0IHdhcyBlYXN5IHRvIGFkZCBhbm90aGVyIGNoZWNrIHRvIGluaXRfZ2V0X2Nsb2NrKCkNCiB0
byBhZGQgYSBjYXNlIGNoZWNraW5nIGZvciB0aGUgYXZhaWxhYmlsaXR5IG9mIENMT0NLX01PTk9U
T05JQ19SQVcuIEkndmUgdGVzdGVkIHRoaXMgbXlzZWxmLCBidXQgSSB3YW50ZWQgdG8gc2VlIGlm
IHRoZXJlIHdhcyB1cHN0cmVhbSBpbnRlcmVzdCBpbiB0aGlzIGFuZC9vciBpZiB0aGVyZSB3ZXJl
IHJlYXNvbnMgdG8gcHJlZmVyIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uLjxvOnA+PC9vOnA+
PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJjb2xvcjpibGFj
ayI+Jm5ic3A7PG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNw
YW4gc3R5bGU9ImNvbG9yOmJsYWNrIj5UaGFua3MsIGFuZCBiZXN0IHJlZ2FyZHMsPG86cD48L286
cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImNvbG9yOmJs
YWNrIj5Kb2U8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpw
PiZuYnNwOzwvbzpwPjwvcD4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_7ADF21C8B5674B66B1F6475626868561fbcom_--

