Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAA3680C23
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 12:42:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMSXc-0000vq-6r; Mon, 30 Jan 2023 06:41:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ORO@il.ibm.com>)
 id 1pMSXZ-0000vO-Id; Mon, 30 Jan 2023 06:41:37 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ORO@il.ibm.com>)
 id 1pMSXX-00037W-NE; Mon, 30 Jan 2023 06:41:37 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30UAcS2e023224; Mon, 30 Jan 2023 10:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : date :
 message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version : subject; s=pp1;
 bh=tF6a+ke3kaSSGQgvwGmUnYSv2q//u+OdmSF7Vp0vtgo=;
 b=UAEgv2E28emiHGfHj8nwnOTwHHVVhBDqGo7mqaVSHeFDMj/tLeOC3S89cmcZbkURPBd7
 AXUrJlbl3LmAwZ5MXpOnUX+7/boVrf83RbhT3qvy9LAiHPE3C7g5GJSBkThFrnUU3o6S
 5yiplWIFRVxEJ9kn8WJbCWgiSDkAqABquK8lVaUrVd0yDZ5HOQ0J9t+Kkp+gEouR3fcN
 FRJJZQuDrLeVwbk/x7PYkI2+vCyxzMLcgirFAwROzOBRrLAxoarQ2spuNjdAtDcbdJ3M
 7QsZ4p9/9EzKN2e5MXOl5UzKGxNlkIcJ4Pza+dvBuphINdZUh9SU2F2ES4BKpkrqLKKU Bw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nddgsn9sk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 10:48:45 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30UAchFT023500;
 Mon, 30 Jan 2023 10:48:44 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nddgsn9rw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 10:48:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fkzyuZ5uq8hZYW9mq9HogxOXHlyp2J89TO0f3K9zonY1/YsxFNS+WbczlupHzi4lvroRdALhQpml5YeBvGTI9dfnt4zyCC6h6CtcKlZinrbi5FjVKWrROBH6rldtqGSZzZuVp4WOgcChYW4b3JnOBRiSHh01xG8g+ZSyPCuHZkaVgW0X3HsQ0a0jqOhG6HeWg7X1OOZxIL9vkK+RKrDKVcjjxTXXjxcbw7PC7BipFAfnCy6glMQQLGX6KVtaslR/vMzCqR94hoXCoLFYBcSM6P4jaSQYW7uJpUEjDHd5eiTSeU2TNPLZ3EoMT3MicKeHbT4yx8G/ikVS6ryOISWFGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tF6a+ke3kaSSGQgvwGmUnYSv2q//u+OdmSF7Vp0vtgo=;
 b=A2SxPzSytxpoQ40ssGtCZ+2V7A7YVl5wOuKspUKTmXuV3EHKWfwLx6mjP2ytBJrft3Xbi01EMtI7tQ9sO6KKoRH1nLgcLD5f9Doxu/VjV03Nv/1YNsaGWWbOwWNi3JjNaRiGAsjZsJi0Nl9U/5F+jbFFQTb92qQBZTrkdicB+3gqkMmrLWG+hS6L4yD+RxiZwQmn8KvmuDM+kDIxjeMK3jTwtKWl9TB0IYyIZnYM9k4gd+6V7xeZk1WwB2Lod2sd7Y/AXVT56IKD/WHHrJNgEg7JdhtRnwrTLDlgjVkT7zcGkuQ2/FICEUHc2LoRB70ie1XgK5JlqNRAnS5GDcr1Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=il.ibm.com; dmarc=pass action=none header.from=il.ibm.com;
 dkim=pass header.d=il.ibm.com; arc=none
Received: from MN2PR15MB3488.namprd15.prod.outlook.com (2603:10b6:208:a6::17)
 by PH7PR15MB5367.namprd15.prod.outlook.com (2603:10b6:510:1d2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23; Mon, 30 Jan
 2023 10:48:41 +0000
Received: from MN2PR15MB3488.namprd15.prod.outlook.com
 ([fe80::5d05:f8cd:79d8:844f]) by MN2PR15MB3488.namprd15.prod.outlook.com
 ([fe80::5d05:f8cd:79d8:844f%7]) with mapi id 15.20.6043.028; Mon, 30 Jan 2023
 10:48:41 +0000
From: Or Ozeri <ORO@il.ibm.com>
To: Kevin Wolf <kwolf@redhat.com>, Ilya Dryomov <idryomov@gmail.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "dupadhya@redhat.com"
 <dupadhya@redhat.com>, "to.my.trociny@gmail.com" <to.my.trociny@gmail.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, Danny Harnik
 <DANNYH@il.ibm.com>, Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>
Thread-Topic: [EXTERNAL] Re: [PATCH v1 1/1] virtio-block: switch to
 blk_get_max_hw_transfer
Thread-Index: AQHX7N8wPe8Nf6ncXUKCwgxtM70ZKq6drwuAgAEAIoCAGqT2IA==
Date: Mon, 30 Jan 2023 10:48:41 +0000
Message-ID: <MN2PR15MB348846A9688BBA63991814D38AD39@MN2PR15MB3488.namprd15.prod.outlook.com>
References: <20211209092815.778066-1-oro@il.ibm.com>
 <20211209092815.778066-2-oro@il.ibm.com>
 <CAOi1vP95sznmAETC1ikqb5bxKueDZYd7HtEjM=7KerMSALYFuQ@mail.gmail.com>
 <Y8FEObcExtXrcoSx@redhat.com>
In-Reply-To: <Y8FEObcExtXrcoSx@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR15MB3488:EE_|PH7PR15MB5367:EE_
x-ms-office365-filtering-correlation-id: 51701d86-06cc-4bbc-ba02-08db02af8d10
x-ld-processed: fcf67057-50c9-4ad4-98f3-ffca64add9e9,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lfqtPuU+0Ya62EKX9lJTccRLqCHHQzTWLtt3Sst+Mg6S7ol8HW6uRH345zkaC7mQjLKYP0UTtFTp5mmTAk5+VEELFfZVqH3dYT/dGAXOfOjO2CrbIg9QCWkuT0sa8WPQfinsSCtxZjTjJkGRzFx1P1tbX559Ox2rx9sSMGQt9Qx545UjYiZugk6eC0AJFPtsVNwUSU+G0uYbjuSR+iPQ489FRC7udfFFGU0VOl4OwkfmJnJw+TNAzNyakt7OgZzpIpYBV1Og7QS3jmlhzXchAh+JEDg9oKUV1uqzgFW4HrMPkz36P31OYh2mN4cJs2SHMvQDIKRmz68QgW6JTo2U4XbRI2+oPqOXv4QmQrur8FSZyd8Ti9mfyg++uA/7KyOHZgyY7PoLM/csNikd/CNHUBV7z/aU+csRBMJhnW9CTYFzzo13NMBgXz0j+1YgbHo+JNCTknDFL+cZAqOw7bcj0nkWlhB6b6lhLVth+Rolmq+MZj1uQp3DaO7//WT3nB1wJe28QPmm/EBMuIZbO5aMVE8VsP1V44H/UgPk2kw5VVeiwZ9zEK98e82NoeTCALlnGHwd4ULP96YwAgftwUFwZfbqxZ+IFwAJcEaIgav1i8UVV9T7h+GLuaUO93UYYFnuHFzjUueQ3VqH8zPRQ5YGMooul6PfQYRLBeROA8LYnkQVPlbLJPnmqzrpmGtcys1GEcfTQcMF3pCR4ji5x4J/lwWT+Oxu01m8O2RTBBsRJM0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR15MB3488.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(376002)(366004)(39860400002)(346002)(396003)(451199018)(478600001)(7696005)(53546011)(26005)(6506007)(9686003)(5660300002)(76116006)(4326008)(66946007)(8676002)(186003)(2906002)(71200400001)(110136005)(54906003)(316002)(83380400001)(41300700001)(8936002)(38070700005)(52536014)(33656002)(66556008)(86362001)(966005)(55016003)(38100700002)(64756008)(66446008)(122000001)(66476007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?anlTSHpIVkpvbm00SGJMKzJsMVlHYlgrVk1CNGYyV2Q5cHNrTm8yVWhXbGJO?=
 =?utf-8?B?NjM4S2tQdDFkMUtoaFlSNUx3Y3RRNDd6WlplZ2xPVDlXQzJhOStSMVNZSXFQ?=
 =?utf-8?B?MXhyZWZmWERhMUhEb1YvM3dSdWFPdkk5R00yS1dGZllvWVF5bmxuZE9TZSt3?=
 =?utf-8?B?ZktJOUxVUW5YdFhUd1Vid0ppaExnUW1FVFptY3NtWFhTMjBTZUtHWEptV3BY?=
 =?utf-8?B?Rys2aGpvemlwczdsME9hOURXZ0cxa21JYnlsZjBudWVreVhuR2pOMHJjOGFq?=
 =?utf-8?B?NDVjazRYMjI3UFYzOGxiT21Yd1orbzJRdjJpZWNmd1hVc1JabEZlRy83c1c2?=
 =?utf-8?B?UXRXMzVjU00rVXI2U0trc1VSMnVXNU5NOE9sQmJKcThEbUM0cG9JbFc3QjBT?=
 =?utf-8?B?MDNCUTFEaEMxNWNhalVFRk5RM0hpTmM5YlVaUTk4RXlPaWhBTmJVbXYyR0hJ?=
 =?utf-8?B?c21wWW44ZmlaWWE1R01GQ2pYWittYnBIcStHM1I5UjNTYnlCMjZEekJ6N1FG?=
 =?utf-8?B?VlJSQWdmMklKdUU0RmF5SXc5R2FwZFQzTU00UFZLSjJQYyt5eUVyZktoK3BW?=
 =?utf-8?B?dkZ5MGhWYnBHWDlDL0cvYmx1aGJnaHpaTnZTSnFPTzU1bXpPZFJYbzUrM2kz?=
 =?utf-8?B?VTd1ZlpacVR2aDF2RUdON3l5MXFuZXNCdExicUZnSjE4SUFsZE1mL00xZGFS?=
 =?utf-8?B?M2J2NmZuUzZlcGFGd2xNUHZKNGliaUkwTFk1SW1IZGt1dmw5bjRSbERuK3Nr?=
 =?utf-8?B?Nk9hNktWR0IzZkNBQk4wblpGZGwvVU1kVHprZEVyd0JMQTVmdWNCeWF0MWhp?=
 =?utf-8?B?K25OVmpFdmdkQzZKL09PdTVaekl1Mm1ydVBIMFZURGNVbUMydmhPbnQ2TVVh?=
 =?utf-8?B?b1VSY2VUWXU2Ukd5ZnRCekQxd1RyQnFaNklFYS9yTEh4RnNXZVBXNHF3YnZk?=
 =?utf-8?B?Q1dNdVNpTlF1OUJtbkdGR25OL0h4QmViamxTS0xMMVIwdmF0a1k5TlN3MFQy?=
 =?utf-8?B?TUNuZjFxZXVlOWdKUXVoVTRGc0hEaXI4MVlOdEdOdHRlRHVXQ3dBYklSQXJZ?=
 =?utf-8?B?dHBUL1ZUVGdoNUZTaXliQjc2aGxqTTZXN0NpTDBHMElTRVhSYnFiazdNaHl2?=
 =?utf-8?B?NEp3UE5tWEJWV1Zza3pVUGt0OVN4NXMrYjhBbFczUldFUnIzWWRlbERNOWJh?=
 =?utf-8?B?UEhOQ0xOOTRZTFErVWgvWjZ4L0JpRUJpZmpuTVZwMXUwZlNkekxzdFBmWnhy?=
 =?utf-8?B?cVN6SGk5NkNkUnUwNGRUcFNXNjVQcGZubldvSEh3WHlIdUMwb2J3NUFnenJ5?=
 =?utf-8?B?dWZqWVhpL2NLUzBBaWJNd29MQVB6eEN4ZDMwanVvblBNajdjaXp5L2I0YkhI?=
 =?utf-8?B?QnB3WmxmOXN6M2c3MDRSUDI3R0lsYTRBZ0pYSGUxWmNBV1hWOEtjdmV6M3F5?=
 =?utf-8?B?L2xkTnN3ZGpFbGVCK1F0TEUwOE5CYXVRSWRXdmhZUjRUVGxVMzFwN1c4ZnEw?=
 =?utf-8?B?NnhxRTJqbmhSL1dueFlXdXNicVVZZ0R3L1JjcGNYWVRrY01SMS90Q1RTWDh5?=
 =?utf-8?B?Vi9PVFNYNVZxSmR0SWE2NmdIbzIxdVFnZnBrUzNsdUtQUEVvZW96N1h2Sk1G?=
 =?utf-8?B?VFNUK0FsNURYT1YrTkFndFpYVTdJL2pPVVdJaUU0ZjNuVTUzaTZOR09ScGpz?=
 =?utf-8?B?V3hVOWVIR3dReEhNQStHN1VWbzlxTVcvd3ZwVjJTemZqTTRNbWxrc0szbW5U?=
 =?utf-8?B?d0JMSC9TUVplNHhJNGZ2TVZ6VmVMVUtlQTN2Wk9oeXpLUmxma2tMQzk2Z3dJ?=
 =?utf-8?B?bXNmM09vK3dzV1NMWnJ3YW9MSFhZVEhJelRtSXJUdGFKWldPTFNzdXRWaTBk?=
 =?utf-8?B?MUFoMldadHNZdEk4aGdvVXkyVitHZmMrUitWVWdzaVVIcEZIaU11d1Zhd0sv?=
 =?utf-8?B?SkpCb1VjaG0vaWFrK3hTNzNyMWZ0bXVRMW55TEsvK3ByQm5acGUrcEU5L0hH?=
 =?utf-8?B?bk1SMXV3UjkrajN2Mm80MXZjanhOM3NhbmpZQUlFdTRMdk1FZGE1bGhxOUF0?=
 =?utf-8?B?VFVVcTBrRHJPbVJoTEUzSHFwUUVBT0hoY0VLVzJuczhaWjBTdCtXa1NjQTdW?=
 =?utf-8?Q?iNxU=3D?=
Content-Type: text/plain; charset="utf-8"
X-OriginatorOrg: il.ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR15MB3488.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51701d86-06cc-4bbc-ba02-08db02af8d10
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2023 10:48:41.1960 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VZNdb+s+w1F2cZDV8i+71mybRN74w5yPSR7VZzDxcUUPqaH0X72A+d6RF/ILNhHI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR15MB5367
X-Proofpoint-ORIG-GUID: JKTDnzfAQH9LlbVPkqbwygl4zF8WTvqu
X-Proofpoint-GUID: z5RjFnLf2Qp1mPVw5IsOr6DBJFYILxbk
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
Subject: RE: [PATCH v1 1/1] virtio-block: switch to blk_get_max_hw_transfer
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_09,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 mlxscore=0 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301300101
Received-SPF: pass client-ip=148.163.156.1; envelope-from=ORO@il.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEtldmluIFdvbGYgPGt3b2xm
QHJlZGhhdC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgMTMgSmFudWFyeSAyMDIzIDEzOjQ1DQo+IFRv
OiBJbHlhIERyeW9tb3YgPGlkcnlvbW92QGdtYWlsLmNvbT4NCj4gQ2M6IE9yIE96ZXJpIDxPUk9A
aWwuaWJtLmNvbT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsNCj4gZHVwYWRoeWFAcmVkaGF0LmNv
bTsgdG8ubXkudHJvY2lueUBnbWFpbC5jb207IHFlbXUtDQo+IGJsb2NrQG5vbmdudS5vcmc7IERh
bm55IEhhcm5payA8REFOTllIQGlsLmlibS5jb20+OyBTdGVmYW4gSGFqbm9jemkNCj4gPHN0ZWZh
bmhhQHJlZGhhdC5jb20+OyBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPg0KPiBT
dWJqZWN0OiBbRVhURVJOQUxdIFJlOiBbUEFUQ0ggdjEgMS8xXSB2aXJ0aW8tYmxvY2s6IHN3aXRj
aCB0bw0KPiBibGtfZ2V0X21heF9od190cmFuc2Zlcg0KPiA+IA0KPiBJJ20gbm90IHN1cmUgSSB1
bmRlcnN0YW5kLiBUaGlzIGlzIG5vdCBhIHBhc3N0aHJvdWdoIGRldmljZSAodW5saWtlIHNjc2kt
DQo+IGdlbmVyaWMpLCBzbyB3aHkgc2hvdWxkIHdlIGNvbnNpZGVyIHRoZSBoYXJkd2FyZSBsaW1p
dHMgcmF0aGVyIHRoYW4gdGhlDQo+IGtlcm5lbC9vdGhlciBiYWNrZW5kIGxpbWl0cyBmb3IgcmVh
ZC93cml0ZSByZXF1ZXN0cz8NCg0KSSBkb24ndCB1bmRlcnN0YW5kIG11Y2ggYWJvdXQgaXQgYXMg
d2VsbCA6KQ0KQnV0IGFueXdheSwgdGhpcyBidWcgd2FzIHRlc3RlZCBvbiA2LjEuMCwgYW5kIEls
eWEgc3VnZ2VzdGVkIHRoYXQgSSB3aWxsIHRlc3QgaXQgb24gbmV3ZXIgdmVyc2lvbnMuDQpBZnRl
ciBkb2luZyB0aGF0LCBJIGZvdW5kIG91dCB0aGF0IHRoZSBidWcgaXMgbm90IHJlcHJvZHVjZWFi
bGUgaW4gNi4xLjEuDQpUaGUgY29tbWl0IHRoYXQgZml4ZWQgdGhpbmdzIGluIDYuMS4xIGlzIHRo
aXM6DQpibG9jazogaW50cm9kdWNlIG1heF9od19pb3YgZm9yIHVzZSBpbiBzY3NpLWdlbmVyaWMN
Cmh0dHBzOi8vbGlzdHMuZ251Lm9yZy9hcmNoaXZlL2h0bWwvcWVtdS1ibG9jay8yMDIxLTA5L21z
ZzAwODA3Lmh0bWwNCg0KSSBndWVzcyB3ZSBjYW4ganVzdCBkaXNjYXJkIHRoaXMgdGhyZWFkLg0K
DQpUaGFua3MsDQpPcg0K

