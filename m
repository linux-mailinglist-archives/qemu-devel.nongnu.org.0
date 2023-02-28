Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2BF6A59D3
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 14:08:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWz16-0006FZ-Pm; Tue, 28 Feb 2023 07:23:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1pWz14-0006Ek-1X; Tue, 28 Feb 2023 07:23:34 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1pWz11-0000Ji-Om; Tue, 28 Feb 2023 07:23:33 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31S5rJ6N026844; Tue, 28 Feb 2023 12:23:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=w+gRKAnbYfHSt9yPkTp6DRLWDUkP8s9MULLhiKruTa4=;
 b=Rwph71ZCJjHiLw9jNs4UMvxUBdVF5bhoien/ZbTBni6eBqiOAY3VXgsTkeV2a2ZDDpu0
 b62MDusQRVS07aahtz1Ic08RZ0NoJazXWRQyaRAwtb1l6K0qb6gGi06j7GLFG6tdHt+M
 +7LPRFz3BaNts91mKnQoX6hMfg4dQ6/J9vNRND9b+8VBzROS9KA2WBRvNS+oo4EIy3um
 SFPLX2haT7epbmf+g1v3nprB7bOT+c2AqTDzjE66Yvzc6d+0nwvPpUqPEFnh9FZPitvx
 K0ytTw42h72FGi5hCgV/dxwCeGqfoW8KkLLrvOrrboT88sivwyc/FPWTOiXS2fB1l3Pw Lw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nyb9ae0t7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Feb 2023 12:23:25 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31SBMx1s000547; Tue, 28 Feb 2023 12:23:24 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam02lp2044.outbound.protection.outlook.com [104.47.51.44])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3ny8s6f6x1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Feb 2023 12:23:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WOoH/tSfcRRDniHg7gyoKMKZSV0GW0rZ+jIE26SA2p2ygUg1/JMY6mixbBBam5a7vb6aikCQa+6v/rLfomnQVkjGrkDXoz2WxZsobnGjoH1ZxIW/FmJXBrHr+hatHG+CciXRmZdMZWOFSibMkoxokkLgW1f01CnFP46nxQB9G04RlaatwtZ43UUz6zBQRcS31hIvWQtgty9OQBq2e09agT8awDzEAQ9eVEJZ5/yoWYViVR1WRIDfrG7VPO4qGVksSVXInaN7NfAmgqPNErcfeVzpIOZhQvjCW8IZZzdmoqzW5YAdjAWBEHZcVeBscwJ5+iKwJDA5oqpgyRX7UTsuqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+gRKAnbYfHSt9yPkTp6DRLWDUkP8s9MULLhiKruTa4=;
 b=VtbfdLCB4LEr5V83t0mDnciOGT/qG0gH94cFbyGw5PecJWpoaKljadRCsy7jagynwAnX3LUu9C5zjuIq6XFA+6rpq+J1HIca4ayR4E3ftW+oZzLtj+F1+njIMtEggN0spEkhVTVYQ37MfcVCO6ZTWhKFev4VaN1sJaM/hren2NKXdq7Td4Wrr5zxvWYoat09U1IzZkjv8khKZ9KNToAcfePhtEw3/8CF3LaIRyEi4rBIw8taPht82f3swiSGt4n1y3i4JHPsu1sFwMfypu20yWMVQ7g2ZDXEUZhL9ZCefF1hzjYGK2CiRYmg6nC8fQDdwvX+Ds/RPqaVgSmdsIygFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w+gRKAnbYfHSt9yPkTp6DRLWDUkP8s9MULLhiKruTa4=;
 b=yScVhW4TXdkcwZGAzGtWcbh8QRfECLYJYy7EOP0JXrPWot1MdN0X98a5lP95iQRkWqY1JGmJN0SBwhQoQIEojSxijj5e3A1zzJqhsd1sdWMShbnkknLjpjlF8J4kyXHU3pwkYp1ukHqB+cVWasgnQSzmMd3MbxQyqsLFAp0SD5A=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by CH2PR10MB4358.namprd10.prod.outlook.com (2603:10b6:610:a8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Tue, 28 Feb
 2023 12:23:21 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::a0c1:677d:5394:bf43]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::a0c1:677d:5394:bf43%5]) with mapi id 15.20.6156.017; Tue, 28 Feb 2023
 12:23:21 +0000
From: Miguel Luis <miguel.luis@oracle.com>
To: Richard Henderson <richard.henderson@linaro.org>
CC: Peter Maydell <peter.maydell@linaro.org>, "Michael S . Tsirkin"
 <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Haibo Xu
 <haibo.xu@linaro.org>, Andrew Jones <drjones@redhat.com>, Marc Zyngier
 <maz@kernel.org>
Subject: Re: [RFC PATCH 4/5] target/arm: enable feature ARM_FEATURE_EL2 if EL2
 is supported
Thread-Topic: [RFC PATCH 4/5] target/arm: enable feature ARM_FEATURE_EL2 if
 EL2 is supported
Thread-Index: AQHZSsnNgqOjmf8mc0OfFMGPlH0ZNK7jLJMAgAEcsAA=
Date: Tue, 28 Feb 2023 12:23:21 +0000
Message-ID: <E2C1B0C9-589C-4B1D-B79B-DA19E27E8063@oracle.com>
References: <20230227163718.62003-1-miguel.luis@oracle.com>
 <20230227163718.62003-5-miguel.luis@oracle.com>
 <fe4e7b11-c976-5f4f-87d6-60da1492dec6@linaro.org>
In-Reply-To: <fe4e7b11-c976-5f4f-87d6-60da1492dec6@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB5433:EE_|CH2PR10MB4358:EE_
x-ms-office365-filtering-correlation-id: 248ac5e4-45d2-4dc9-a0aa-08db198694d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vCMibpwJAO+KtCun7sH2rk21xipv0j4Qv3ZqVCE6Q1t9dW4mL/157zooduEiM21N9rxwWhlCP9uVZvKiRCrIOJ3SZEMG0h6NKP5Vseh7hyHIEfGvbppDiTQau+ZvGnfwfYwiFL5wMEL2pzpSOeK1bhhoBi9cLBN3VFIergvcS6U+i4fzD9Nyt6wJX7ZS6XMW+T3qvLTngDhjYHImWB5CXkDCw59aGXrH34+SAXejkmQaKJBGRi3NXJbYHHzpXmRnDe3hlwdpEC1tG+s02lXgrQgokVoURBamDrumoH2dIQY+m93WmxEyUttTIGLDHqchYlmmIKnsD2it6iABZ3zYY1/2Z9IWiKYGnut8VH9hC13u+OqI9mLt1pNSNcPWbuBgx3yfwrFxdBW4IvMPvkvcvrVGSuRTKid6iX43KrXhHtqLeRgdc5WAW5OUwsYKoTkvBLFq8qSzotPVvneiEVLFGfJryQb+PN0pzTbYvNyv/i7qxxwiP/lBD5Xtaby7sWpMCngFhTwnjufNGsdsLIqgGuPqic2syKN053nqgRnxk16vaFxtldSGwaXH9OabRACldopmsc05TGLfRaqd5RD2cJzD5JAr0MxYb0VQn8hTsViJz3wqfvFuqrGkyOE/xuCeisQAoC9p/ku/UJ6pdwWo+PUbPSzpdgdfyl/nrD2ygeJUgm9JzcWubv+QJOq84kNj0l0Gk5D9GKVnaqFKie5fL+CdUTD+9G4LPhshEWoYjN8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB5433.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(346002)(396003)(39860400002)(376002)(451199018)(86362001)(8936002)(7416002)(5660300002)(44832011)(71200400001)(186003)(316002)(66556008)(66476007)(66446008)(8676002)(76116006)(66946007)(64756008)(41300700001)(6916009)(4326008)(91956017)(36756003)(54906003)(83380400001)(33656002)(966005)(6486002)(478600001)(2906002)(6506007)(6512007)(53546011)(38070700005)(2616005)(122000001)(38100700002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vnLZhH1ZSxOj8SOjpObOxX3og4cEPgAAuddFR0GudqWZiiaDf1WYxWeQVWCM?=
 =?us-ascii?Q?GW64Vj25BX8Ciz67JWCdsVDbC3XQjFJmUj5GROE0B8+vX4zeMwXfGrrtHxWf?=
 =?us-ascii?Q?08F++nsyIJLWPjJmBZGo2G5EOB6THk81nAK+OT9UxRubJe93gh2n7p5GDApq?=
 =?us-ascii?Q?VyKqBEz9SXPVZXIRzqTRwlYx+/0NXrXktsf9tXdwYWTrjb4b41a7mR3BHMH2?=
 =?us-ascii?Q?UW5Zu0LsotQ6CDQa+90Y8B9N00LZatgYPYYTE565XIlqZnpP8LU5sl4R/NsV?=
 =?us-ascii?Q?lShAtbrTzIdbfRDMONWmaf8hr/Jy68rSy93jb5R8+bsmy1E4aodHexdAA3lL?=
 =?us-ascii?Q?Vs/1haqG6N6cxQ9BhSxXx7DaQiRPcTjNm9LQDq8ArS+tInh4gOKk8W2ZTMus?=
 =?us-ascii?Q?EnbeJsGUadXBNPwS/JisEZlI1aSLWf/FXf4vmtd0Yo7jTCDN3LtG9gVZjYeC?=
 =?us-ascii?Q?7XrjvBCp8ijWAifnhk4zOJVyzFkJRHUJG4L5RV92OKeAvRJlMRU633mCJxVv?=
 =?us-ascii?Q?AwxRLVe9lgO46M5x6q43cUQVpUn+1enurzZINADZ6bcdNiQxO5OX0lHHqzit?=
 =?us-ascii?Q?uZxf2bZBQK2ZWDTmfjmhDrUIt2TxeRpbXfJ+rbHphEXWNmXHkJrzMrX5nZyc?=
 =?us-ascii?Q?4/9+xCSYq6okReXdU1M6DXPBeM5ZEtzMMXqlsuejR+VzlF/MGa2Dv3kz1BPw?=
 =?us-ascii?Q?dhEqqaxDjyQv3HBL71TIrzlV3LLvUBsWHObiiU3TjJ9xM9/UK+84R6AF8X60?=
 =?us-ascii?Q?uNhTGJcEgi+APGAuDeMRxMVNPGvepkhlP9m3dW7bUYJkm6w8GaTrBh3NYY+j?=
 =?us-ascii?Q?f7xnlsxwT4wzyqZlY/dPNkqcefnHpSzhUK3mtTHpdxJqqdhQl4oXC6ZOQ3ih?=
 =?us-ascii?Q?8kgMzEjtKEP3mtgBPpMhqI/59PCMgecLEeRGAKbNE7zX0GBWhLTlNJd1cSaS?=
 =?us-ascii?Q?4mow67RDp4GZmkLrGmWKqxvhGPFsXvU/3DoWgISGC4w5AdcNFp8awanXLWNj?=
 =?us-ascii?Q?/nJiTPNqEZO/BWQl6+2VimcAjZYm004G9q/IRz0GLZVxY2ue78kDgEuxnQ2d?=
 =?us-ascii?Q?76sALhoadS8ChXEfAF9mteIpvq7zyoLckBYinxxE/l728j8wCe8dxhxzvMlQ?=
 =?us-ascii?Q?c8wbnY46PiM/f+m7Kf8ispidQ2B/ERsWHthQxTBB4VbDfWEdziRx8CWFTfPb?=
 =?us-ascii?Q?e/zEWNlq5SZBb//YzelrJdOrMLPT1yNZjdrOWLvc/0mxPSJRKxxHW3RwRL7m?=
 =?us-ascii?Q?A9ZS465djP7glkRGFvzQ4y4k0/uQt+W6wvjKT0z9E0mqjJ5LaJTJPhh0sKuF?=
 =?us-ascii?Q?GFa74MgFQYxEs9Ouq+qxGCmIZxJsK91TSPoRmXjrVfZwb0sj1vR8/DX+bbjk?=
 =?us-ascii?Q?HLdUBFEVRrc0EQ8Wa8+cch6EMu9q+OouYXgZQTFQNDjALbw1x7LSJExcWLOT?=
 =?us-ascii?Q?xzlF3XSAGc35V+97+cbS9L/Ez1hNr5R9TkbA4kdf3ARoFUUldIUzQMHv8rKb?=
 =?us-ascii?Q?eu/+BAJQfI5q7eQ383aJLRZIpQjTHlKTdKuTFhYqwwKdrP6b607n/eZwj5Yb?=
 =?us-ascii?Q?1mJ0GQ+DJBiC9joHCmUmIjiVt3LOSXpBJPKQejxeJxL+2Nzzw5n9M7kZznYl?=
 =?us-ascii?Q?5OzVMdG6WEYS2A+2wkCI/4U=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B9CFC6BF6335A84C96955F50524A1C97@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: zHIDhQrU3/WbNRAKKguGBlZiCUS1PKfIqnvosnmnM6R++QU4GGoaZP4+EZX0PLI4KuAzp6AviKCR+wZrXgB4Qcnjh2D3HNbCfckL6AR7dUXq9MQ0kQz+L7ET6ErthxZsPs7M2X1sr1IY7YQDMVlD9OKae5L1oTf1h4PPkJMAmUYbyDnIyrtNN7/Ui5G3C4w2CZP/4qYtAFuQVhA7Qw/p2Y56zLO5ofd2UBeJjQSzsBOXzjp0Mc0M62ENubNhB/Q1CFTE3kseywMMrP+VSW8d8nN0WddcGabXLj4LcfBIEcRne6+m3nxX/3tGrniazw9PTwBfC9F9/dLDWhWsgk6ebMZN/oLlv4QidRcN6j3UPB0kqEBRVCHh7qV44bp7LUB2vticDWCmcNd2JihLqWPE+fakdBv1lXYowp84/sObdeVgYScbZ6B8m4NnyZpNh0PQuuEZ+sn1x5wPXKFDqDg59aPXIgAupA42WSQGDWPGZxN3N0uAUl0c6jEFl/6Oa6GEwu3tTRyD2ceIjflzN2Hy8RY5C+4cxcgjuF+juun0PNCSNq/OYHDm1yn8Zg9gosMQ26WXk5WAVpZXEvWdVRTKaWkXii3AV0n+HqZ9dM7ifCqT1xnXLFGhSy+4sJPrCb/i/1lB6xGXWmYvbkiwoY1K7DCVs+ScRd+eCe2sHvYaIaoC6uz+nfO+Yqn9tCExtcc+bG5ssAIHArETg8Mxp8N2G4BDcx1EZED2DFyMoMoJE3CRBNolIiTFxfzqcZKBGG1PcU1/7YWEeKXhHifPJy+8BBtuym3BrmNXiKdWoW843WOnp5gneVAAkcZfkjQOFnSFD8+ryjlI87vjD57V4AK2pw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 248ac5e4-45d2-4dc9-a0aa-08db198694d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2023 12:23:21.5757 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c4H4QRC/aUC1BvfQ3lGir4A7HLMxjFQw6h5REgHVe5qjOxhQ2aA3lkF7VIE6KU0tMfYUCEwKRHQm8TKWjhrWsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4358
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-02-28_08,2023-02-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 spamscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302280099
X-Proofpoint-GUID: 9QeiyIvjIFv42Yks1Am_9NwtEvfDtqCd
X-Proofpoint-ORIG-GUID: 9QeiyIvjIFv42Yks1Am_9NwtEvfDtqCd
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=miguel.luis@oracle.com; helo=mx0a-00069f02.pphosted.com
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

Hi Richard,

> On 27 Feb 2023, at 18:24, Richard Henderson <richard.henderson@linaro.org=
> wrote:
>=20
> On 2/27/23 06:37, Miguel Luis wrote:
>> From: Haibo Xu <haibo.xu@linaro.org>
>> KVM_CAP_ARM_EL2 must be supported by the cpu to enable ARM_FEATURE_EL2.
>> EL2 bits on ID_AA64PFR0 state unsupported on the value 0b0000.
>> Ref: https://lore.kernel.org/qemu-devel/b7c2626e6c720ccc43e57197dff3dac7=
2d613640.1616052890.git.haibo.xu@linaro.org/
>> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
>> [Miguel Luis: use of ID_AA64PFR0 for cpu features]
>> Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
>> ---
>>  target/arm/cpu.h   |  2 +-
>>  target/arm/kvm64.c | 16 ++++++++++++++++
>>  2 files changed, 17 insertions(+), 1 deletion(-)
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index 9aeed3c848..de2a88b43e 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -3961,7 +3961,7 @@ static inline bool isar_feature_aa64_aa32_el1(cons=
t ARMISARegisters *id)
>>    static inline bool isar_feature_aa64_aa32_el2(const ARMISARegisters *=
id)
>>  {
>> -    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, EL2) >=3D 2;
>> +    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, EL2) !=3D 0;
>>  }
>=20
> No, this predicate is testing if EL2 supports AArch32 more.
>=20
>> @@ -714,6 +723,10 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatur=
es *ahcf)
>>      features |=3D 1ULL << ARM_FEATURE_PMU;
>>      features |=3D 1ULL << ARM_FEATURE_GENERIC_TIMER;
>>  +    if (el2_supported) {
>> +        features |=3D 1ULL << ARM_FEATURE_EL2;
>> +    }
>=20
> This is the test you want...
>=20
>> @@ -881,6 +894,9 @@ int kvm_arch_init_vcpu(CPUState *cs)
>>          assert(kvm_arm_sve_supported());
>>          cpu->kvm_init_features[0] |=3D 1 << KVM_ARM_VCPU_SVE;
>>      }
>> +    if (cpu_isar_feature(aa64_aa32_el2, cpu)) {
>> +        cpu->kvm_init_features[0] |=3D 1 << KVM_ARM_VCPU_HAS_EL2;
>> +    }
>=20
> ... here.
>=20
> While you could add a new isar_feature predicate for EL2 supported in AAr=
ch64 mode, the feature test is equivalent and good enough, and is more obvi=
ously tied to the required KVM support.
>=20
>=20

Thank you for the explanation. I will take it into consideration on the nex=
t version.

Miguel

> r~



