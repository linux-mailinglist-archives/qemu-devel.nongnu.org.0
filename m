Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD476968C9
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 17:07:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRxpm-0007gu-7P; Tue, 14 Feb 2023 11:07:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jadon.mcdowell@optum.com>)
 id 1pRxpk-0007dn-Dm; Tue, 14 Feb 2023 11:07:08 -0500
Received: from sp-internet-ext-ply.uhc.com ([198.203.175.175]
 helo=ovarp0634.uhc.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jadon.mcdowell@optum.com>)
 id 1pRxph-00020E-SW; Tue, 14 Feb 2023 11:07:08 -0500
Received: from irmplyep02.uhc.com (HELO sp-internet-ext-ply.uhc.com)
 ([10.114.75.150])
 by mail20634.uhc.com with ESMTP; 14 Feb 2023 10:06:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=optum.com; i=@optum.com; q=dns/txt;
 s=dk.sep2016.2048; t=1676390811;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version:content-transfer-encoding;
 bh=UR5rp4LLiHlHQve81Gy1LTCrorR1i0+FSXNryMhLQr0=;
 b=VbvqQ1i1xOXqk+zkbJKOyTWvlvQ5O9X1/ylf8GXnYgsjvlPsMaI2ttp2
 ov1Wfjc9IHkz4qKCUI9oJdvDNn16gLzJFxTTPpPl+LEGWxL470qd0ICL9
 MLpcxEbAPXgNeDw+RCuiF0jvTcChicl4wu22ptBD+zCk1pB2kJpQLPB8f
 m9rbn2Td2Xh/Q18DnYTi9uM8q3zZe1xdTA30ChkD+0u6q2jk3TuUKWHKf
 Br/kqhzO0/tG+Zna1WWR6L7SVx8mgHgclGq5lCNYQwDtN/cmtZRpNsswS
 1Un4wImmckyRPl9UyaRLxNbeV4jgipfMJEd8oQHcjqkkZQYQlJHn+8E+l w==;
X-REMOTEHOST: apswp2265.ms.ds.uhc.com
X-REMOTEIP: 10.112.80.145
X-CONF-FOOTER: True
Received: from apswp2265.ms.ds.uhc.com ([10.112.80.145])
 by mail6.uhc.com with ESMTP; 14 Feb 2023 10:06:47 -0600
Received: from apswp2214.ms.ds.uhc.com (10.176.137.144) by
 apswp2265.ms.ds.uhc.com (10.112.80.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Tue, 14 Feb 2023 10:06:47 -0600
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.119.116.7) by
 apswp2214.ms.ds.uhc.com (10.176.137.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17 via Frontend Transport; Tue, 14 Feb 2023 10:06:46 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NZ9lmdB+y+5OS0v/VS82SY5+XY2xcTp8Qcbus+dwfSBfv19plDIOK3UN5Ienpyg3VhOG4e3v2gaB2eopw27/BHeEqgsRoe21xT5Td+qw4MjOisc5/7mWHuMRvTdfXpVXcA6ZSxYg2Ax5mTFn440jkFm7OzeWPwBIXKyqR6tiSFYJ3SHIiU7MCsxRm9rvrGBs+VTm8hbS2Y+/qRtcK8Madx6OPorjDTQEGsAl2LzYe3sE7zcytcoHabgn3ii6BaTfUIn0tpFAiMSaZuIYGKv4gcy61XMrgplMBovAKbC16CJPT8KUo68NSKqVifw0EkDvkp/DJiqFAe0OVZ5z8HqakA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+iHV3uUrz1dLQzAFWVdPhVIMdeXA5xg2+T4RZ4RDw2A=;
 b=b8KDLgRA5RaWXTlvps9QZye5IRJxvO2vnqGAg9wpvUnLzds1iSclaD+Cj/I/jFPv5fkybToSsIv0P0K/1Bl9JatkVu4sZcvqp6M4z+w/dAnXRa4kM4POfWcs7d19ZnZYTFZj2eLGFZp1bJ5BndNH4oZLnwIgsN/WnWKksuBnM7VHRL14GSAag23ff1hJJSBA2JKXBtS87aCe3xWC3OkvEqS+7luot2tUq/cf9xJxgG+I5x/c/5YsWtWfXQ0qXSVxLFZY0NAW4yDDx47qguEI/uw7zAl7sYXSeorGN370SR6KkePbC9um1meuTvNnHo4j7MOxXos+vC1fyviDWeL8bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=optum.com; dmarc=pass action=none header.from=optum.com;
 dkim=pass header.d=optum.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uhgazure.onmicrosoft.com; s=selector1-uhgazure-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+iHV3uUrz1dLQzAFWVdPhVIMdeXA5xg2+T4RZ4RDw2A=;
 b=YjE/Nz3G96dwfdOV/HgC1VmQNCCtmyO5jSBL80cBRhpOpXMYMk2Vd+RS3nFmM9AZNLOjowpxKds9V3F1nTnzB+IVK2ckjw7r/H94EMj0DwYtLIa5jNjkTd3AITA+5UBnw5E6Q67hXcEw+lGxpgq2gW8cTWrIJKMobrgRiYurtIs=
Received: from PH0PR22MB3210.namprd22.prod.outlook.com (2603:10b6:510:111::5)
 by SJ2PR22MB3845.namprd22.prod.outlook.com (2603:10b6:a03:502::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 16:06:45 +0000
Received: from PH0PR22MB3210.namprd22.prod.outlook.com
 ([fe80::c469:afe7:2a58:d333]) by PH0PR22MB3210.namprd22.prod.outlook.com
 ([fe80::c469:afe7:2a58:d333%3]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 16:06:45 +0000
From: "McDowell, Jadon" <jadon.mcdowell@optum.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, Juan Quintela
 <quintela@redhat.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Ilya Leoshkevich <iii@linux.ibm.com>, "qemu-block@nongnu.org"
 <qemu-block@nongnu.org>, Alex Williamson <alex.williamson@redhat.com>, "Fam
 Zheng" <fam@euphon.net>, Eric Blake <eblake@redhat.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, "Halil
 Pasic" <pasic@linux.ibm.com>, David Hildenbrand <david@redhat.com>, "Thomas
 Huth" <thuth@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>, John Snow
 <jsnow@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: unsubscribe RE: [PATCH 3/3] migration: Remove _only suffix for
 res_postcopy/precopy
Thread-Topic: unsubscribe RE: [PATCH 3/3] migration: Remove _only suffix for
 res_postcopy/precopy
Thread-Index: AQHZQIkAd/DmGfXGR02cRdtwtuXW0K7Om5gA
Date: Tue, 14 Feb 2023 16:06:45 +0000
Message-ID: <PH0PR22MB3210797117139305C653012491A29@PH0PR22MB3210.namprd22.prod.outlook.com>
References: <20230208135719.17864-1-quintela@redhat.com>
 <20230208135719.17864-4-quintela@redhat.com>
 <6a3cfdab-ff8e-d07a-dd86-ce17eb5dc623@yandex-team.ru>
In-Reply-To: <6a3cfdab-ff8e-d07a-dd86-ce17eb5dc623@yandex-team.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a8a73c85-e524-44a6-bd58-7df7ef87be8f_ActionId=48a92a34-d7ef-4beb-b8b1-0b66fc36b853;
 MSIP_Label_a8a73c85-e524-44a6-bd58-7df7ef87be8f_ContentBits=0;
 MSIP_Label_a8a73c85-e524-44a6-bd58-7df7ef87be8f_Enabled=true;
 MSIP_Label_a8a73c85-e524-44a6-bd58-7df7ef87be8f_Method=Standard;
 MSIP_Label_a8a73c85-e524-44a6-bd58-7df7ef87be8f_Name=Internal
 Label;
 MSIP_Label_a8a73c85-e524-44a6-bd58-7df7ef87be8f_SetDate=2023-02-14T16:06:34Z;
 MSIP_Label_a8a73c85-e524-44a6-bd58-7df7ef87be8f_SiteId=db05faca-c82a-4b9d-b9c5-0f64b6755421;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=optum.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR22MB3210:EE_|SJ2PR22MB3845:EE_
x-ms-office365-filtering-correlation-id: 546878fd-1d38-4ddc-34c6-08db0ea5784e
x-corpex-transportrule: EXO-Outbound X-header
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Xab+NtHuOjHp8jJyxM1KwKcGvCZWoVjSLp8DJAllSJSP7zvOT1n26TbZVl2xXG4Gwav/8xS38vzQviDaatQ+gLU7gGFHMHj5zUWXD1NrODAuVFMgarTjjVeZiI4GgLgsSsFClxjv6r+0hPDwc7ASPsghKYUODBcXiN3dlLacLiJRpAcuTaJmewCnjhbB+FLfqc+KOSh3NNgdt3MPhP0QT7SOzR9ktLvMXsZVkQAWK8xFmELpVJLeil5eMCJRqpSin6IHuxE4he1Uf+WdiwovizPBt7ny5GTJINLc5CpI2//8YHxIrCYi6N5g08hGBsxisyN3A4dWiAbk8Gj/gHq70QtqDVPImXE5NjfL9JhzHI3XE8uugjuLVKroiGdgZwuB9/pL05G+YCq5mcPCG/wLsUXFayWyUty2lI3DUxBe6lzG0RF+HHddAh6+5bWVI/F3MYTfNOhHD1gmh9uJ/JrNNUvBPK48qltkCjjenGb8HYNVUgH4FMTDpFAJf59iMfFHnfsjVb6x+fTSZKffWSMJpnBqP/v+W7jPZ6gSamg7tBGxk8aLeqlxwVltl9yw64A1pOyhCtGdiOOofdtXOVZjo0d6tzmjMW0wEnwvgdlwUsG/QhBlDmu2rABydXMewjWgp8QldIPMD8TtwX5fH4q0hS5XKjsVzgY1tXcd8qOw9pg6OKyjiPf0xzqqtfDJOtZ2VatUQkSEP7UFHnAGh3jyCg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR22MB3210.namprd22.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(366004)(396003)(346002)(39860400002)(136003)(451199018)(2906002)(82960400001)(86362001)(71200400001)(38100700002)(122000001)(33656002)(38070700005)(9686003)(7696005)(76116006)(6506007)(26005)(53546011)(55016003)(186003)(66946007)(316002)(83380400001)(54906003)(41300700001)(66446008)(110136005)(8676002)(4326008)(478600001)(7416002)(8936002)(52536014)(64756008)(5660300002)(66556008)(66476007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YkxqZGdoZkVHdnkxZTE4WU9GKzZXcTdWcGRWZFU0ZXBuNVdzSU4zL3pUYm94?=
 =?utf-8?B?T1pNYy9PSlpOdFNQS051Rmt2OTl5YXNkQ3ZZVVdZK2FhMkRkMGd5QWRMZEFI?=
 =?utf-8?B?VndkVTBTLzdsT2k5TDFjQ00zd2ZkaEsrQmt2NUZVeGRTNllQYkszWkFLV2Fn?=
 =?utf-8?B?VXA4SkdwTkthMDFHelpqc1dSRThaZVRCckF2VWFnSy81cVhQWHpXZXVwTTd5?=
 =?utf-8?B?RitRWWJLSmZvWU9HTm81ZlhVYVVkSTR4WVg4MVBtb2pTbTdKMkFUZ0xHbDZ1?=
 =?utf-8?B?bzdMTWdtaUdVaHNIUGRNTDV0Qy9vWmRoeURjSi9VclpweUFkT1lPazBYMTVR?=
 =?utf-8?B?MkVCNU90cWFjOXQxRVBRay84cGtjYXJqWnBHTkt1RUg3MTB6VjBjaWdvZyta?=
 =?utf-8?B?L1Q2UE1EMlpSd21oNTNDWXVLemRzek40SERmRlNtR0JKN2VjekorOHlFdlN0?=
 =?utf-8?B?RmpJb2QvTlJGd0xGU0E1SVluV2pVSFdNOUlBZGUvWk50Sm5yQTVQQk16d0V2?=
 =?utf-8?B?aDdHY2Q3K09CR1N5TFpTRU1rbkMzVGRQc0Joa0k5eXltVkxtemxrT3B1Y1g3?=
 =?utf-8?B?RkhhVzAwaEZEeGVXZDFmK0xuMVJLcnluaitoQnpXMWtTZXo5WFB0c3VQUThj?=
 =?utf-8?B?dm9yRFJDQ3l6c1oycVJjUU0rSnNIRHZjSHZpZGdhLzVNN0ZlcUxxcXFqWVc2?=
 =?utf-8?B?WkFISXVQUnlTV0E1M0VRY2p5MkhuRExvZG1vSGc1WldBb3lPRUl0RFY2ZHNR?=
 =?utf-8?B?ZnBKVDJnYVQ0ZUh6SW1NL005YjNTMmkwempwNXVHenM5Mm01eFpIVzhsSjZ2?=
 =?utf-8?B?WHROd3hDRUp4Q2t0OFd5NmhsOTlLWFR0ZVQ1b0JBTHhPVmFmdUNhd0NnY1Jz?=
 =?utf-8?B?MU1hMVlYNjQwdkFKbkFpUVpMYndpbDgzM0Myc0c5cFJNU3puN2JMMDJYRFR4?=
 =?utf-8?B?K2x4eUQrRjdkR0VYVU1MZ1JjZlA1QnRENmRRUVNLYk1nUkUxaEdSRzVrcGVu?=
 =?utf-8?B?MWpseFI4ekJLQlZ3RXpnTWFoZ0ZVU3VXZ2R5Q0gxOWdVRDBrYis4eHRCT2Iw?=
 =?utf-8?B?aVYrZmhreTVCaU90NGJZSHNkRXJVRkJhN0trbGowYmN6REhNa1ExdUo5MXp2?=
 =?utf-8?B?am1ZWnVYdC81TVorU2h6VHNhN1VwYmJYeDZjdnBNRkNNS0tQQ1RSN3BRVktD?=
 =?utf-8?B?WDN3ZzRpM2FROE1sQm8xZTNtOUg4Y2Nub0trZzNEa2w5R3B4QlQ4cEVuUm1y?=
 =?utf-8?B?Smh4QTNEU3g2YmZ5cExpaFFqSzRWTGFZVnNSN09EVlA0N2l5U3YzS0JQMDBk?=
 =?utf-8?B?M2k5MTYxYk82aGNJcXZaOVlROHpOVXJOWTJhanVuTjNRN0NFSTNVVlBOTlQ3?=
 =?utf-8?B?bkF3VzdIL09kZElQSDJONC9zUXZ6c2NKK0F6OXAydHd1MGtnajM1TGRiYktZ?=
 =?utf-8?B?SmRBMzNDRDVqZzl5bXBnNy91RTlIbFY1ZG41ZXpmWXhJbFdyZEZ6UkhHcWI1?=
 =?utf-8?B?dlhwaEZzcEFKSG9acU1UUGNHOWtJMC9WNUtmZzhWT25VVEJsV00rNzlJcVVF?=
 =?utf-8?B?MklMNUtaQjUxd2ZISUp5bkowNzc0QUVheTlMcHhUVkdQMHNuZ0J4RGthMnpa?=
 =?utf-8?B?SG5GOGpBNVd0OUh5L3ZpOVp2anRkYXIrOGhOd3NidVkrTmtpZlpjSFd1d2JH?=
 =?utf-8?B?R2dDUGM2TkNKZVIvQllPVlZCb3oxRGVheFB1eldZRGZkNWFKRzYzbloreUFN?=
 =?utf-8?B?Rk1rQUdiUGdsTlQ2OFIvbWtheUMxYnljY1JNOU12TzZJU0ZJZVpMVzhIRjhU?=
 =?utf-8?B?eXpMc0VRZDZVcVNpeG9ZY2JsV0d6ODhRaWtQOUtQRzFoeUdLSFlaZnlOZHdl?=
 =?utf-8?B?WTdyc0dSaEt1VzlyWWN4THorOGFOL3JHZ01KOUxuR2xGTnRETFVmd1dFbnlm?=
 =?utf-8?B?clNpR0g1YlFXZWNxM0wwdXcvbXVkSDVSdWlaY05hT0R1cWtTamllQkxGbGNu?=
 =?utf-8?B?QnlhdzVTOURjSG9qL3VMRWtBRkU1N1kyWk1NdVJqRk10MllRbEsyRnltRUNr?=
 =?utf-8?B?Z0ttYURoUGkvTGJkZTJaQVBMbmdMRzErMlJuSEtIL0V4WXR0a05Ucm02cVZq?=
 =?utf-8?B?azVFM2tCQWxKakNvRm05bmNBNnFPUTVGQTlITlh4SmNnZ1RnREE3K1ZQNE85?=
 =?utf-8?B?blE9PQ==?=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR22MB3210.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 546878fd-1d38-4ddc-34c6-08db0ea5784e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2023 16:06:45.3372 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: db05faca-c82a-4b9d-b9c5-0f64b6755421
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WlZyESZF2D5exCCHzFRDFHEmI5UBoiTioUTecbQUUyh/nJt48aHDnWpZjqijDTGm0rSEVF6c8OS4FowkrfuZAGes+eq+41dHg3pXgaDbgxM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR22MB3845
X-OriginatorOrg: optum.com
Content-Transfer-Encoding: base64
X-IP-VFilter-R: R
Received-SPF: pass client-ip=198.203.175.175;
 envelope-from=jadon.mcdowell@optum.com; helo=ovarp0634.uhc.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBxZW11LXMzOTB4LWJvdW5jZXMr
amFkb24ubWNkb3dlbGw9b3B0dW0uY29tQG5vbmdudS5vcmcgPHFlbXUtczM5MHgtYm91bmNlcytq
YWRvbi5tY2Rvd2VsbD1vcHR1bS5jb21Abm9uZ251Lm9yZz4gT24gQmVoYWxmIE9mIFZsYWRpbWly
IFNlbWVudHNvdi1PZ2lldnNraXkNClNlbnQ6IFR1ZXNkYXksIEZlYnJ1YXJ5IDE0LCAyMDIzIDk6
MjcgQU0NClRvOiBKdWFuIFF1aW50ZWxhIDxxdWludGVsYUByZWRoYXQuY29tPjsgcWVtdS1kZXZl
bEBub25nbnUub3JnDQpDYzogSWx5YSBMZW9zaGtldmljaCA8aWlpQGxpbnV4LmlibS5jb20+OyBx
ZW11LWJsb2NrQG5vbmdudS5vcmc7IEFsZXggV2lsbGlhbXNvbiA8YWxleC53aWxsaWFtc29uQHJl
ZGhhdC5jb20+OyBGYW0gWmhlbmcgPGZhbUBldXBob24ubmV0PjsgRXJpYyBCbGFrZSA8ZWJsYWtl
QHJlZGhhdC5jb20+OyBEci4gRGF2aWQgQWxhbiBHaWxiZXJ0IDxkZ2lsYmVydEByZWRoYXQuY29t
PjsgU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPjsgSGFsaWwgUGFzaWMgPHBh
c2ljQGxpbnV4LmlibS5jb20+OyBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT47
IFRob21hcyBIdXRoIDx0aHV0aEByZWRoYXQuY29tPjsgRXJpYyBGYXJtYW4gPGZhcm1hbkBsaW51
eC5pYm0uY29tPjsgcWVtdS1zMzkweEBub25nbnUub3JnOyBKb2huIFNub3cgPGpzbm93QHJlZGhh
dC5jb20+OyBDaHJpc3RpYW4gQm9ybnRyYWVnZXIgPGJvcm50cmFlZ2VyQGxpbnV4LmlibS5jb20+
OyBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4NClN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggMy8zXSBtaWdyYXRpb246IFJlbW92ZSBfb25seSBzdWZmaXggZm9yIHJl
c19wb3N0Y29weS9wcmVjb3B5DQoNCk9uIDA4LjAyLjIzIDE2OjU3LCBKdWFuIFF1aW50ZWxhIHdy
b3RlOg0KPiBPbmNlIHRoYXQgcmVzX2NvbXBhdGlibGUgaXMgcmVtb3ZlZCwgdGhleSBkb24ndCBt
YWtlIHNlbnNlIGFueW1vcmUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKdWFuIFF1aW50ZWxhIDxx
dWludGVsYUByZWRoYXQuY29tPg0KPiAtLS0NCj4gICBpbmNsdWRlL21pZ3JhdGlvbi9yZWdpc3Rl
ci5oICAgfCAxOCArKysrKysrKy0tLS0tLS0tLS0NCj4gICBtaWdyYXRpb24vc2F2ZXZtLmggICAg
ICAgICAgICAgfCAgOCArKysrLS0tLQ0KPiAgIGh3L3MzOTB4L3MzOTAtc3RhdHRyaWIuYyAgICAg
ICB8ICA3ICsrKy0tLS0NCj4gICBody92ZmlvL21pZ3JhdGlvbi5jICAgICAgICAgICAgfCAxMCAr
KysrLS0tLS0tDQo+ICAgbWlncmF0aW9uL2Jsb2NrLWRpcnR5LWJpdG1hcC5jIHwgIDYgKysrLS0t
DQo+ICAgbWlncmF0aW9uL2Jsb2NrLmMgICAgICAgICAgICAgIHwgIDcgKysrLS0tLQ0KPiAgIG1p
Z3JhdGlvbi9yYW0uYyAgICAgICAgICAgICAgICB8IDE4ICsrKysrKysrLS0tLS0tLS0tLQ0KPiAg
IG1pZ3JhdGlvbi9zYXZldm0uYyAgICAgICAgICAgICB8IDI0ICsrKysrKysrKystLS0tLS0tLS0t
LS0tLQ0KPiAgIDggZmlsZXMgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygrKSwgNTUgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9taWdyYXRpb24vcmVnaXN0ZXIuaCANCj4g
Yi9pbmNsdWRlL21pZ3JhdGlvbi9yZWdpc3Rlci5oIGluZGV4IGE5NThhOTJhMGYuLjRhNGE2ZDcx
NzQgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvbWlncmF0aW9uL3JlZ2lzdGVyLmgNCj4gKysrIGIv
aW5jbHVkZS9taWdyYXRpb24vcmVnaXN0ZXIuaA0KPiBAQCAtNDcsMjIgKzQ3LDIwIEBAIHR5cGVk
ZWYgc3RydWN0IFNhdmVWTUhhbmRsZXJzIHsNCj4gICAgICAgLyogVGhpcyBydW5zIG91dHNpZGUg
dGhlIGlvdGhyZWFkIGxvY2shICAqLw0KPiAgICAgICBpbnQgKCpzYXZlX3NldHVwKShRRU1VRmls
ZSAqZiwgdm9pZCAqb3BhcXVlKTsNCj4gICAgICAgLyogTm90ZSBmb3Igc2F2ZV9saXZlX3BlbmRp
bmc6DQo+IC0gICAgICogLSByZXNfcHJlY29weV9vbmx5IGlzIGZvciBkYXRhIHdoaWNoIG11c3Qg
YmUgbWlncmF0ZWQgaW4gcHJlY29weSBwaGFzZQ0KPiArICAgICAqIC0gcmVzX3ByZWNvcHkgaXMg
Zm9yIGRhdGEgd2hpY2ggbXVzdCBiZSBtaWdyYXRlZCBpbiBwcmVjb3B5IA0KPiArIHBoYXNlDQo+
ICAgICAgICAqICAgICBvciBpbiBzdG9wcGVkIHN0YXRlLCBpbiBvdGhlciB3b3JkcyAtIGJlZm9y
ZSB0YXJnZXQgdm0gc3RhcnQNCj4gLSAgICAgKiAtIHJlc19wb3N0Y29weV9vbmx5IGlzIGZvciBk
YXRhIHdoaWNoIG11c3QgYmUgbWlncmF0ZWQgaW4gcG9zdGNvcHkgcGhhc2UNCj4gKyAgICAgKiAt
IHJlc19wb3N0Y29weSBpcyBmb3IgZGF0YSB3aGljaCBtdXN0IGJlIG1pZ3JhdGVkIGluIHBvc3Rj
b3B5IA0KPiArIHBoYXNlDQo+ICAgICAgICAqICAgICBvciBpbiBzdG9wcGVkIHN0YXRlLCBpbiBv
dGhlciB3b3JkcyAtIGFmdGVyIHNvdXJjZSB2bSBzdG9wDQoNCg0KVGhhdCdzIG5vdyB3cm9uZy4g
InBvc3Rjb3B5IiBpcyBldmVyeXRoaW5nIGV4Y2VwdCAicHJlY29weSIsIGFzIGl0IGluY2x1ZGVz
ICJjb21wYXQiLiBSZWFsbHksIGZvciBSQU0sIGl0IGNhbiBiZSBjb3BpZWQgaW4gcHJlY29weSB0
b28sIGFuZCBpdCBpcyBjb3BpZWQgaW4gcHJlY29weSB1bnRpbCB1c2VyIHJ1biBjb21tYW5kIG1p
Z3JhdGUtc3RhcnQtcG9zdGNvcHkuIChJbiBjb250cmFzdDogYmxvY2stZGlydHktYml0bWFwIGNh
bm5vdCBtaWdyYXRlIGluIHByZWNvcHkgYXQgYWxsLCBpdCBtaWdyYXRlIG9ubHkgaW4gc3RvcHBl
ZCBzdGF0ZSBvciBpbiBwb3N0Y29weSkuDQoNClNvLCBmaW5hbGx5Og0KDQoicHJlY29weSINCg0K
ICAgZGVmaW5pdGlvbjoNCiAgIC0gbXVzdCBiZSBtaWdyYXRlZCBpbiBwcmVjb3B5IG9yIGluIHN0
b3BwZWQgc3RhdGUNCiAgIC0gaW4gb3RoZXIgd29yZHM6IG11c3QgYmUgbWlncmF0ZWQgYmVmb3Jl
IHRhcmdldCBzdGFydA0KICAgLSBpbiBvdGhlciB3b3JkczogY2FuJ3QgYmUgbWlncmF0ZWQgaW4g
cG9zdGNvcHkNCiAgIC0gaW4gb3RoZXIgd29yZHM6IGNhbid0IGJlIG1pZ3JhdGVkIGFmdGVyIHRh
cmdldCBzdGFydA0KDQoicG9zdGNvcHkiDQoNCiAgIGRlZmluaXRpb246DQogICAtIGNhbiBtaWdy
YXRlIGluIHBvc3Rjb3B5DQogICAtIGluIG90aGVyIHdvcmRzOiBjYW4gbWlncmF0ZSBhZnRlciB0
YXJnZXQgc3RhcnQNCiAgIA0KICAgc29tZSBwcm9wZXJ0aWVzOg0KICAgLSBwcm9iYWJseSBjYW4g
YmUgbWlncmF0ZWQgaW4gcHJlY29weSAobGlrZSBSQU0pLCBvciwgbWF5IGJlIG5vdCAobGlrZSBi
bG9jay1kaXJ0eS1iaXRtYXApDQogICAtIG9mIGNvdXJzZSwgY2FuIGJlIG1pZ3JhdGVkIGluIHN0
b3BwZWQgc3RhdGUNCg0KDQpUbyBiZSBhYnNvbHV0ZWx5IGNsZWFyLCB3ZSBtYXkgcmVuYW1lIHRo
ZW0gdG8gIm5vdF9wb3N0Y29weWFibGUiIGFuZCAicG9zdGNvcHlhYmxlIi4NCg0KDQotLQ0KQmVz
dCByZWdhcmRzLA0KVmxhZGltaXINCg0KVGhpcyBlLW1haWwsIGluY2x1ZGluZyBhdHRhY2htZW50
cywgbWF5IGluY2x1ZGUgY29uZmlkZW50aWFsIGFuZC9vcg0KcHJvcHJpZXRhcnkgaW5mb3JtYXRp
b24sIGFuZCBtYXkgYmUgdXNlZCBvbmx5IGJ5IHRoZSBwZXJzb24gb3IgZW50aXR5DQp0byB3aGlj
aCBpdCBpcyBhZGRyZXNzZWQuIElmIHRoZSByZWFkZXIgb2YgdGhpcyBlLW1haWwgaXMgbm90IHRo
ZSBpbnRlbmRlZA0KcmVjaXBpZW50IG9yIGludGVuZGVkIHJlY2lwaWVudOKAmXMgYXV0aG9yaXpl
ZCBhZ2VudCwgdGhlIHJlYWRlciBpcyBoZXJlYnkNCm5vdGlmaWVkIHRoYXQgYW55IGRpc3NlbWlu
YXRpb24sIGRpc3RyaWJ1dGlvbiBvciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIGlzDQpwcm9oaWJp
dGVkLiBJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5v
dGlmeSB0aGUNCnNlbmRlciBieSByZXBseWluZyB0byB0aGlzIG1lc3NhZ2UgYW5kIGRlbGV0ZSB0
aGlzIGUtbWFpbCBpbW1lZGlhdGVseS4K


