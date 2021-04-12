Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D549D35C8C5
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 16:30:09 +0200 (CEST)
Received: from localhost ([::1]:56536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVxZo-0003B9-VK
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 10:30:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Cupertino.Miranda@synopsys.com>)
 id 1lVxXB-00025u-ML
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 10:27:25 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:41636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Cupertino.Miranda@synopsys.com>)
 id 1lVxX4-0003SN-8t
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 10:27:25 -0400
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6F8B2405E0;
 Mon, 12 Apr 2021 14:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1618237636; bh=bMuI8upGNdXzEH/0HvJNVbTt2VcNNZExXeQCD2wjEkc=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=l0yMgpbTgyHvN9AdwAeLvqRaA5kV3LSeR4RnIBXyoWZ7h58rYS5Z9NNSuY9Vpi6oR
 c/oHGftX3R79611P/TtTct2GKRVuW2nyUl0G/iPcDF5Dun3xNtpIxKMyk4ouRaPQuk
 XT5QGypX7hi74+0TsXf87dAj1u8wDG84b6qgtAoHV1ckMLZvXK7hJrfiPvaX7/1/7f
 rWk+5UqQ2NxIP+3YyZ+5LxL/9q3vbtH7ujbpd4fTZNARpGRBE7ZZ+7x/XOE9fS0ZR0
 ebmzqVielkREXKGE8rQC9rEXyrnAkyGVx4n1MJtz6ssr5Wc82DpnECHxXoqSA/uWJe
 RPQyWP2//KorA==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 94DE5A0084;
 Mon, 12 Apr 2021 14:27:14 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 3B8AD40132;
 Mon, 12 Apr 2021 14:27:14 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=cmiranda@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="HsdVQ9/L";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SeR6T0445zbphuFMXDIhNNTcpeYfLvM+yayGKbYGgS/lmGiqvUEezriwAoqiua0fFCFHItwVysJokehyThnPYQxDTAR+QuJDRN6pqjZ2yz95EzEN7kbvVoRKM4kRVAOMXRu/L2sSqHZrwnq4MvewWuTzBAPm3w8oCcbUuwPPLjYdB99nADNAxiAsMPQ9CzfM5TLQAXrn5Omp/HIx/wIMdXxv6CU2LTf0tkEAxdq/7uhYkwa5lGtBXpxp+5QTY5bmp+Qb1vJTwg8dZaFUzH1ChH7VO7bZnnLtVX8khxn2t2+GmEuBlew2NhR2S2A0K4oCa/u0a6BZykyrcSkgK79Plw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMuI8upGNdXzEH/0HvJNVbTt2VcNNZExXeQCD2wjEkc=;
 b=RcO3xW8fMJa7fZ0DqSV9NMz6LfjNXkXv5IH61Jcx9RtKUrebIogfexk+2/TgiefSqFWgBReMTxDO17Axg5v3TA5QbSasj9z4Bb/FywPHwE+g0ZqhKNngikE9PDXLnBpv77TwykWIGoc5WT08kLA+h3tc+3/U9sAYfyK8dE9MLKllanywZyN7zsArnQ0oUO7IanB1ihfssw2VC6E6IpUsN0EWCRlg27mfWFDmy3gpu+nrqJUSjHLwhjaQTXsjUh6tMT3YD3/dJMPJXsKCbc9FQ6YKcgvRGs0pneczD8mzvLFL6iAx8y4w+M7XEMglhxOgA+x+TKLonr+VwrY7y/v78w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMuI8upGNdXzEH/0HvJNVbTt2VcNNZExXeQCD2wjEkc=;
 b=HsdVQ9/L5u+L83eBHzj3FP09X4dUQxnNqIGnYAlcOqaPh1PR9HQoIwfClfENF6J05wQEe3R1jkaxG5LmHW0D4kvFoQ8UZ1rFuZCrfwlAAlcF/wNM5sIN6B5B0yacdt4+5o52uVBZTdsMAATe7n2o3E2vkgFs6vOoPLdHqvg6VCs=
Received: from BL0PR12MB4673.namprd12.prod.outlook.com (2603:10b6:207:1d::16)
 by MN2PR12MB3853.namprd12.prod.outlook.com (2603:10b6:208:162::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Mon, 12 Apr
 2021 14:27:12 +0000
Received: from BL0PR12MB4673.namprd12.prod.outlook.com
 ([fe80::ed43:bf3a:aeac:b2d5]) by BL0PR12MB4673.namprd12.prod.outlook.com
 ([fe80::ed43:bf3a:aeac:b2d5%6]) with mapi id 15.20.4020.022; Mon, 12 Apr 2021
 14:27:12 +0000
X-SNPS-Relay: synopsys.com
From: Cupertino Miranda <Cupertino.Miranda@synopsys.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 "cupertinomiranda@gmail.com" <cupertinomiranda@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>
Subject: Re: [PATCH 07/27] arc: TCG instruction definitions
Thread-Topic: [PATCH 07/27] arc: TCG instruction definitions
Thread-Index: AQHXL6fsYeHRzH8azEygesag03UUDw==
Date: Mon, 12 Apr 2021 14:27:12 +0000
Message-ID: <a4613b07-0a10-b31d-9b4f-f4658d6c4cd7@synopsys.com>
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
 <20210405143138.17016-8-cupertinomiranda@gmail.com>
 <c2288398-1192-5abf-b671-9f57d81200ae@linaro.org>
In-Reply-To: <c2288398-1192-5abf-b671-9f57d81200ae@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [176.79.37.192]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cdb35da4-6b5f-409b-71d5-08d8fdbf104f
x-ms-traffictypediagnostic: MN2PR12MB3853:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB385305A71CF2B531F619BBA3A8709@MN2PR12MB3853.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aOv+37JMLYeMmJkoUrfCnuhQDVWss5dk7uvvjkhBleqfZ2E0nppQOxcOk+Di/8PiYmQVtObyXAdX8dup2w0KDrJcOulcsOca1eHznBZZ6fzIF6/TzSIs64tmy+DKOSoFkkubUHHgp+/Qcznp52ZULJqY9w9PffGNiBGOaoQAaDGpGX26b22r2TiGMZodc3nYwrxQUgOsHVMiqlsGHGbyglLM3fElINJz026ZSHnf11ZvrKqO1BuPbk4gt/PVNorfiS4otbpLTSG05RMeD07A6qckxuOM+1/cWcnrU7zn2HZxMpb5x+Gnenq1Dq75w5yZt6gD+C6jkcPaohskF9k7LlehhOlE9okmnCYM5U0L+5DQhAksu2byY7iW2Qov6WPvKiE2ijx2xCEBvIcc4FBGtlsg0UBCCYy3biltdr97OxdHe9c1W6EpYr1Cq4elkOwYb4EZ5PUL3MGQ9VyQLqdcOqjvoX2yTmdsi7XP89ALr4Atd+zfdNVsj/pndlxvLl3xwO/07OupKyxzOlqLvpGQ2clU3VSFmjhvRNY33zhbW/MmiVZp6m0eY1vGm0LnFyM+BvmE+HdKdIXXQf2jwqdXsiQG4IC1Qe0ms4ZtCCIrQ5Q7niknmsmXs+N69jIwj/RgN5Np9LLLKZi+ZLryI76y8Y3ksG0gw/YqX6P/BzJNFOU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(346002)(396003)(39860400002)(366004)(110136005)(71200400001)(2906002)(5660300002)(83380400001)(91956017)(2616005)(76116006)(478600001)(4326008)(64756008)(54906003)(6512007)(36756003)(66446008)(6506007)(66476007)(66556008)(66946007)(107886003)(53546011)(86362001)(26005)(8936002)(31696002)(186003)(8676002)(31686004)(316002)(38100700002)(6486002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?NnlZQStiN1NNOGZydEdaT0FQRW9YRy9LT3JGY05IY0tRLzFVM2dRY1AvWjhs?=
 =?utf-8?B?U1lnRDhwL0hrMVJhRldWM3psWndCT1hEK0d0bHlBVjRCdEN1em9iUkRSZ1ow?=
 =?utf-8?B?VWQzUzlFbFFvY2ZscVVmZ3FkTE9sMGp0ejRNbUoyUXFuOS8yVnlZWWgvWTVh?=
 =?utf-8?B?MmszOUZRR0xId0szaEhWVHhIQ1EwcVFxVnBla3hhbzU5dTlTd1RHTlQ0dUlv?=
 =?utf-8?B?UFlxRmYyYkl0WG5aWitxL0pBSENwbFhZMnJ3TXQrY0tPRzZVNUpSNFBnMGhP?=
 =?utf-8?B?amdrbC9JRHByazEwamp5b1dOVlU4YStBQ2FKL2ZveXNRbXJ6NXZ1V0w2SHox?=
 =?utf-8?B?cnhZTWZrQW5uUzk3T3FVNXREUVkxMjF5RW52SWRlM3BINWdKWDg5alNReDRX?=
 =?utf-8?B?enU3WVMyWXBkUzR0RDRzSy9jVUsreGc0bWYrL2ZRZEZHZGJJRjhhSzJKclE4?=
 =?utf-8?B?Tkloa3M0NlN6cTlHTjdGT25hRFVqbWVDbTU4UWd6M2RiOUlaR0NhdVdWK3g4?=
 =?utf-8?B?RythVUFDVmRlS0pZSmNQUW81YlEvUy91U3kvd3Y4QWIvUDRFcEpRdlpRM0RN?=
 =?utf-8?B?bE84SDYyVHZWMGdDaVRzZHY1M3AyY0IzUnlGOGNEZU5teEhTamkrU3pqRUsw?=
 =?utf-8?B?NFBRV09FZjVVUmpyVUlhKy9wWnR6NGRzTGV4U2RRazRsdzNxdll0NXMyRG1B?=
 =?utf-8?B?U3ljNDhzQ0hUREx5blUzaTROcFhyK3lYNHVBY0RPZ3lXWWMrMlVSTXJvTEFT?=
 =?utf-8?B?SVBEdDlnT2hTaC82UWNsbUF6TzdLMW1hTDFmb0xWcnFlYWtKd2hoek1QZk0x?=
 =?utf-8?B?WHZhUWVjbWNlcU4yZ0tQT0pNNEVtaVV0aXZTQWZpU1BlTllTaXdEV29RY1c1?=
 =?utf-8?B?azZoMXdKSHk5VEtTb0JTZ2ZuUEZVNnk2WHVZTWQrVjZsUXNEUzRvb1UzWDdu?=
 =?utf-8?B?am9WNnpSZTRXUlJVN2N1ZFZ6eGpPVUVlYkZRKzBTekxRaFZBTlZMUXgzNTlQ?=
 =?utf-8?B?OWw3eXlOVFdGSHNGMFZYOUhnY3VyODZnV0JxVDQrVXM1a2ZtdjUzOXdRa0Zt?=
 =?utf-8?B?Z3RWS05vanNyUzFVUkZFbTFCWHNaaG5sYlRXZUFLM2hpY2xVTEZXcE5oclNi?=
 =?utf-8?B?MEFvSHM1MzdTVU5HL0dLcFdHK1pIUjhrOFMrN2ZlTmVMQzZNOTE3N3o1RHJy?=
 =?utf-8?B?WmI3SEloOFVESE5lenJlT1pCSHF4a0pEQkJXSEUwM1hIN1JSUFdLcTlzTkFR?=
 =?utf-8?B?YWYrdVgrSTAvREpoSkFLNGl0VjZqTW1FMCs4cjZ5ZEtENHZMdHRVRGpDVWl1?=
 =?utf-8?B?ajVzUzNKTDVKWDM1bHJnb01qeVJvSzRqVU1vWjB4VHZqUlY3SS9xazY1SzRV?=
 =?utf-8?B?L2pOKzNvaW5GRVZSNXg1Rzc1eklJUlFYQ2FJek5YVlJudlQwRHhkSm1OQjF1?=
 =?utf-8?B?TE52YTYxUGVmbU42STEvVGRBNmpYcVRNbGJvL0plVHdjVFF0UXZHWDhPdkFt?=
 =?utf-8?B?dUhzd0xOZUl0UGQvdGpBcGRqNTJXRy85c0twQlBxNE5idHNKenI4dzVtQy9W?=
 =?utf-8?B?eUNHU0VPUVlYeEQvNWwvU3JoUnlnUEd5dVEzdkNJTlVNcDJMcllYaFB5RVI4?=
 =?utf-8?B?dmFvZlJxdk5GRWJMaFduV1g0NG9UNENNdlFJRmlnUlRzUEJoWUdLUmVCTVVB?=
 =?utf-8?B?cC9zOHdZWUdhMVd1ZXUyaGhTTkZoS0s5MU9UVmFYTlBEaWIrSSs4QlhvWEdX?=
 =?utf-8?Q?uCeQAE3HIG3qAfXm94=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4EFF7BC27CC16D49BF7E447016277A8C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdb35da4-6b5f-409b-71d5-08d8fdbf104f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2021 14:27:12.4789 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RVQ3COQv/vAIwCIvG5d+5FLGWa7XPFQK5ebrJKOhdycSmli0eWimW+uxUhKRpxOjXyTnBQ9sOxTMYaaBQjrPpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3853
Received-SPF: pass client-ip=149.117.73.133;
 envelope-from=Cupertino.Miranda@synopsys.com; helo=smtprelay-out1.synopsys.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

SGkgUmljaGFyZCwNCg0KSSB0b3RhbGx5IHVuZGVyc3RhbmQgeW91ciBwb3NpdGlvbiB3aXRoIGEg
bmV3IHNjcmlwdGluZyBsYW5ndWFnZSBhbmQgdGhlIA0KdW5jbGVhbiBjb2RlIHByb2R1Y2VkIGJ5
IHRoZSBhdXRvIGdlbmVyYXRlZCB0b29scy4NCkluIG9yZGVyIHRvIGVhc2Ugb3V0IHRoZSByZXZp
ZXcgcHJvY2VzcywgSSBwcm9wb3NlIHRvIGRyb3AgdGhlIGlkZWEgb2YgDQp0aGUgZ2VuZXJhdGVk
IGNvZGUgYW5kIGNsZWFudXAgYnkgaGFuZCBhbGwgb2YgdGhlIHNlbWZ1bmMuYyBmdW5jdGlvbnMu
DQpXaGF0IGlzIHlvdSBvcGluaW9uIGFib3V0IHRoaXM/DQoNCkp1c3QgdG8gY2xhcmlmeSBteSBp
bml0aWFsIHBvc2l0aW9uOg0KDQpJIGFncmVlIHRoYXQgb3V0cHV0IGNvZGUgZnJvbSBteSBnZW5l
cmF0aW9uIHRvb2xzIGFyZSBmYXIgZnJvbSBvcHRpbWFsIA0KYW5kIHdheSB0b28gdmVyYm9zZS4N
CkZpcnN0IHRoaW5nIHRvIGltcHJvdmUgd291bGQgYmUgdG8gcmVwbGFjZSB0aGUgdGVtcF9sb2Nh
bHMgd2hlbiBwb3NzaWJsZS4NCg0KIEZyb20gbXkgZWFybHkgZXhwZXJpbWVudHMsIEkgZ290IHRo
ZSBpbXByZXNzaW9uIHRoYXQgVENHIG9wdGltaXplciB3YXMgDQpub3QgdGhhdCBiYWQgYW5kIHRo
YXQgaGFuZCBvcHRpbWl6ZWQgVENHIHdvdWxkIG5vdCBiZSBwcm9kdWNpbmcgDQpzaWduaWZpY2Fu
dGx5IGJldHRlciB4ODYgY29kZSwgZXhjZXB0IHdoZW4gdXNpbmcgdGhvc2UgdGVtcF9sb2NhbHMs
IA0Kb2J2aW91c2x5Lg0KTXkgcGVyc29uYWwgaW5jbGluYXRpb24sIGFuZCBpbml0aWFsIHRob3Vn
aHQsIHdhcyB0aGF0IG1vcmUgdmVyYm9zZSBjb2RlIA0Kd291bGQgYmUgYWNjZXB0YWJsZS4gQWxz
byBteSBwZXJjZXB0aW9uLCBzaW5jZSBJIGRpZCBub3QgaGFkIHRoZSANCm9wcG9ydHVuaXR5IHRv
IGRpZyBpbnRvIHRoZSBUQ0cgb3B0aW1pemVyLCB3YXMgdGhhdCBUQ0cgb3B0aW1pemVyIGJlZm9y
ZSANCmJlaW5nIGFibGUgdG8gZ2VuZXJhdGUgaG9zdCBjb2RlIHdvdWxkIG5lZWQgdG8gZGVjb21w
b3NlIGFueSBUQ0cgDQpjb25zdHJ1Y3RzIGludG8gc2ltcGxlciBmb3JtcyBhbmQgb25seSB0aGVu
IGNvbnN0cnVjdCBob3N0IG1hY2hpbmUgY29kZSwgDQphbmQgZm9yIHRoYXQgcmVhc29uIGhhdmlu
ZyBtb3JlIGNvbXBhY3QgVENHIGNvZGUgd291bGQgYmUgbW9yZSBvZiBhIGNvZGUgDQpzaXplIG9w
dGltaXphdGlvbiByYXRoZXIgdGhlbiBhIHJlYWwgaW1wcm92ZW1lbnQgaW4gZmluYWwgZXhlY3V0
aW9uIHJlc3VsdC4NCg0KQW5zd2VyaW5nIGFsc28gb24gdGhlIGR1cGxpY2F0aW9uIGZyb20gdjIg
YW5kIHYzLiBJIHVuZGVyc3RhbmQgdGhhdCANCmR1cGxpY2F0aW9uIGluIGdlbmVyYWwgc2VlbXMg
c2xvcHB5LiBIb3dldmVyLCBwbGVhc2UgdGFrZSBpbnRvIA0KY29uc2lkZXJhdGlvbiB0aGF0IHRo
ZSBzZW1mdW5jLmMsIG1hcHBpbmcgYW5kIGRlY29kZXIgY29kZSBhcmUgZ2VuZXJhdGVkIA0Kb3Ig
cmV1c2VkIGZyb20gYmludXRpbHMsIGRpZCBub3Qgc2VlbSB0byBiZSBzbyBiYWQgdG8ga2VlcCB0
aGVtIGluIHRoZSANCm9yaWdpbmFsIGZvcm0uDQoNClJlZ2FyZHMsDQpDdXBlcnRpbm8NCg0KT24g
NC84LzIxIDE6MjAgQU0sIFJpY2hhcmQgSGVuZGVyc29uIHdyb3RlOg0KPiBPbiA0LzUvMjEgNzoz
MSBBTSwgY3VwZXJ0aW5vbWlyYW5kYUBnbWFpbC5jb20gd3JvdGU6DQo+PiArLyoNCj4+ICsgKiBB
REQNCj4+ICsgKsKgwqDCoCBWYXJpYWJsZXM6IEBiLCBAYywgQGENCj4+ICsgKsKgwqDCoCBGdW5j
dGlvbnM6IGdldENDRmxhZywgZ2V0RkZsYWcsIHNldFpGbGFnLCBzZXRORmxhZywgc2V0Q0ZsYWcs
IA0KPj4gQ2FycnlBREQsDQo+PiArICrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNldFZG
bGFnLCBPdmVyZmxvd0FERA0KPj4gKyAqIC0tLSBjb2RlIC0tLQ0KPj4gKyAqIHsNCj4+ICsgKsKg
wqAgY2NfZmxhZyA9IGdldENDRmxhZyAoKTsNCj4+ICsgKsKgwqAgbGIgPSBAYjsNCj4+ICsgKsKg
wqAgbGMgPSBAYzsNCj4+ICsgKsKgwqAgaWYoKGNjX2ZsYWcgPT0gdHJ1ZSkpDQo+PiArICrCoMKg
wqDCoCB7DQo+PiArICrCoMKgwqDCoMKgwqAgbGIgPSBAYjsNCj4+ICsgKsKgwqDCoMKgwqDCoCBs
YyA9IEBjOw0KPj4gKyAqwqDCoMKgwqDCoMKgIEBhID0gKEBiICsgQGMpOw0KPj4gKyAqwqDCoMKg
wqDCoMKgIGlmKChnZXRGRmxhZyAoKSA9PSB0cnVlKSkNCj4+ICsgKsKgwqDCoMKgwqDCoMKgwqAg
ew0KPj4gKyAqwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2V0WkZsYWcgKEBhKTsNCj4+ICsgKsKgwqDC
oMKgwqDCoMKgwqDCoMKgIHNldE5GbGFnIChAYSk7DQo+PiArICrCoMKgwqDCoMKgwqDCoMKgwqDC
oCBzZXRDRmxhZyAoQ2FycnlBREQgKEBhLCBsYiwgbGMpKTsNCj4+ICsgKsKgwqDCoMKgwqDCoMKg
wqDCoMKgIHNldFZGbGFnIChPdmVyZmxvd0FERCAoQGEsIGxiLCBsYykpOw0KPj4gKyAqwqDCoMKg
wqDCoMKgwqDCoCB9Ow0KPj4gKyAqwqDCoMKgwqAgfTsNCj4+ICsgKiB9DQo+PiArICovDQo+PiAr
DQo+PiAraW50DQo+PiArYXJjX2dlbl9BREQoRGlzYXNDdHh0ICpjdHgsIFRDR3YgYiwgVENHdiBj
LCBUQ0d2IGEpDQo+PiArew0KPj4gK8KgwqDCoCBpbnQgcmV0ID0gRElTQVNfTkVYVDsNCj4+ICvC
oMKgwqAgVENHdiB0ZW1wXzMgPSB0Y2dfdGVtcF9sb2NhbF9uZXcoKTsNCj4+ICvCoMKgwqAgVENH
diBjY19mbGFnID0gdGNnX3RlbXBfbG9jYWxfbmV3KCk7DQo+PiArwqDCoMKgIFRDR3YgbGIgPSB0
Y2dfdGVtcF9sb2NhbF9uZXcoKTsNCj4+ICvCoMKgwqAgVENHdiBsYyA9IHRjZ190ZW1wX2xvY2Fs
X25ldygpOw0KPj4gK8KgwqDCoCBUQ0d2IHRlbXBfMSA9IHRjZ190ZW1wX2xvY2FsX25ldygpOw0K
Pj4gK8KgwqDCoCBUQ0d2IHRlbXBfMiA9IHRjZ190ZW1wX2xvY2FsX25ldygpOw0KPj4gK8KgwqDC
oCBUQ0d2IHRlbXBfNSA9IHRjZ190ZW1wX2xvY2FsX25ldygpOw0KPj4gK8KgwqDCoCBUQ0d2IHRl
bXBfNCA9IHRjZ190ZW1wX2xvY2FsX25ldygpOw0KPj4gK8KgwqDCoCBUQ0d2IHRlbXBfNyA9IHRj
Z190ZW1wX2xvY2FsX25ldygpOw0KPj4gK8KgwqDCoCBUQ0d2IHRlbXBfNiA9IHRjZ190ZW1wX2xv
Y2FsX25ldygpOw0KPj4gK8KgwqDCoCBnZXRDQ0ZsYWcodGVtcF8zKTsNCj4+ICvCoMKgwqAgdGNn
X2dlbl9tb3ZfdGwoY2NfZmxhZywgdGVtcF8zKTsNCj4+ICvCoMKgwqAgdGNnX2dlbl9tb3ZfdGwo
bGIsIGIpOw0KPj4gK8KgwqDCoCB0Y2dfZ2VuX21vdl90bChsYywgYyk7DQo+PiArwqDCoMKgIFRD
R0xhYmVsICpkb25lXzEgPSBnZW5fbmV3X2xhYmVsKCk7DQo+PiArwqDCoMKgIHRjZ19nZW5fc2V0
Y29uZF90bChUQ0dfQ09ORF9FUSwgdGVtcF8xLCBjY19mbGFnLCBhcmNfdHJ1ZSk7DQo+PiArwqDC
oMKgIHRjZ19nZW5feG9yaV90bCh0ZW1wXzIsIHRlbXBfMSwgMSk7DQo+PiArwqDCoMKgIHRjZ19n
ZW5fYW5kaV90bCh0ZW1wXzIsIHRlbXBfMiwgMSk7DQo+PiArwqDCoMKgIHRjZ19nZW5fYnJjb25k
X3RsKFRDR19DT05EX0VRLCB0ZW1wXzIsIGFyY190cnVlLCBkb25lXzEpOw0KPj4gK8KgwqDCoCB0
Y2dfZ2VuX21vdl90bChsYiwgYik7DQo+PiArwqDCoMKgIHRjZ19nZW5fbW92X3RsKGxjLCBjKTsN
Cj4+ICvCoMKgwqAgdGNnX2dlbl9hZGRfdGwoYSwgYiwgYyk7DQo+PiArwqDCoMKgIGlmICgoZ2V0
RkZsYWcgKCkgPT0gdHJ1ZSkpIHsNCj4+ICvCoMKgwqDCoMKgwqDCoCBzZXRaRmxhZyhhKTsNCj4+
ICvCoMKgwqDCoMKgwqDCoCBzZXRORmxhZyhhKTsNCj4+ICvCoMKgwqDCoMKgwqDCoCBDYXJyeUFE
RCh0ZW1wXzUsIGEsIGxiLCBsYyk7DQo+PiArwqDCoMKgwqDCoMKgwqAgdGNnX2dlbl9tb3ZfdGwo
dGVtcF80LCB0ZW1wXzUpOw0KPj4gK8KgwqDCoMKgwqDCoMKgIHNldENGbGFnKHRlbXBfNCk7DQo+
PiArwqDCoMKgwqDCoMKgwqAgT3ZlcmZsb3dBREQodGVtcF83LCBhLCBsYiwgbGMpOw0KPj4gK8Kg
wqDCoMKgwqDCoMKgIHRjZ19nZW5fbW92X3RsKHRlbXBfNiwgdGVtcF83KTsNCj4+ICvCoMKgwqDC
oMKgwqDCoCBzZXRWRmxhZyh0ZW1wXzYpOw0KPj4gK8KgwqDCoCB9DQo+PiArwqDCoMKgIGdlbl9z
ZXRfbGFiZWwoZG9uZV8xKTsNCj4+ICvCoMKgwqAgdGNnX3RlbXBfZnJlZSh0ZW1wXzMpOw0KPj4g
K8KgwqDCoCB0Y2dfdGVtcF9mcmVlKGNjX2ZsYWcpOw0KPj4gK8KgwqDCoCB0Y2dfdGVtcF9mcmVl
KGxiKTsNCj4+ICvCoMKgwqAgdGNnX3RlbXBfZnJlZShsYyk7DQo+PiArwqDCoMKgIHRjZ190ZW1w
X2ZyZWUodGVtcF8xKTsNCj4+ICvCoMKgwqAgdGNnX3RlbXBfZnJlZSh0ZW1wXzIpOw0KPj4gK8Kg
wqDCoCB0Y2dfdGVtcF9mcmVlKHRlbXBfNSk7DQo+PiArwqDCoMKgIHRjZ190ZW1wX2ZyZWUodGVt
cF80KTsNCj4+ICvCoMKgwqAgdGNnX3RlbXBfZnJlZSh0ZW1wXzcpOw0KPj4gK8KgwqDCoCB0Y2df
dGVtcF9mcmVlKHRlbXBfNik7DQo+PiArDQo+PiArwqDCoMKgIHJldHVybiByZXQ7DQo+PiArfQ0K
Pg0KPiBJIG11c3Qgc2F5IEknbSBub3QgcmVhbGx5IGltcHJlc3NlZCBieSB0aGUgcmVzdWx0cyBo
ZXJlLg0KPg0KPiBZb3VyIGlucHV0IGlzIGNsZWFybHkgaW50ZW5kZWQgdG8gYmUgZmVkIHRvIGFu
IG9wdGltaXppbmcgY29tcGlsZXIsIA0KPiB3aGljaCBUQ0cgaXMgbm90Lg0KPg0KPg0KPj4gKy8q
DQo+PiArICogRElWDQo+PiArICrCoMKgwqAgVmFyaWFibGVzOiBAc3JjMiwgQHNyYzEsIEBkZXN0
DQo+PiArICrCoMKgwqAgRnVuY3Rpb25zOiBnZXRDQ0ZsYWcsIGRpdlNpZ25lZCwgZ2V0RkZsYWcs
IHNldFpGbGFnLCBzZXRORmxhZywgDQo+PiBzZXRWRmxhZw0KPj4gKyAqIC0tLSBjb2RlIC0tLQ0K
Pj4gKyAqIHsNCj4+ICsgKsKgwqAgY2NfZmxhZyA9IGdldENDRmxhZyAoKTsNCj4+ICsgKsKgwqAg
aWYoKGNjX2ZsYWcgPT0gdHJ1ZSkpDQo+PiArICrCoMKgwqDCoCB7DQo+PiArICrCoMKgwqDCoMKg
wqAgaWYoKChAc3JjMiAhPSAwKSAmJiAoKEBzcmMxICE9IDIxNDc0ODM2NDgpIHx8IChAc3JjMiAh
PSANCj4+IDQyOTQ5NjcyOTUpKSkpDQo+PiArICrCoMKgwqDCoMKgwqDCoMKgIHsNCj4+ICsgKsKg
wqDCoMKgwqDCoMKgwqDCoMKgIEBkZXN0ID0gZGl2U2lnbmVkIChAc3JjMSwgQHNyYzIpOw0KPj4g
KyAqwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYoKGdldEZGbGFnICgpID09IHRydWUpKQ0KPj4gKyAq
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHsNCj4+ICsgKsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc2V0WkZsYWcgKEBkZXN0KTsNCj4+ICsgKsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgc2V0TkZsYWcgKEBkZXN0KTsNCj4+ICsgKsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
c2V0VkZsYWcgKDApOw0KPj4gKyAqwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH07DQo+PiArICrC
oMKgwqDCoMKgwqDCoMKgIH0NCj4+ICsgKsKgwqDCoMKgwqDCoCBlbHNlDQo+PiArICrCoMKgwqDC
oMKgwqDCoMKgIHsNCj4+ICsgKsKgwqDCoMKgwqDCoMKgwqAgfTsNCj4+ICsgKsKgwqDCoMKgIH07
DQo+PiArICogfQ0KPj4gKyAqLw0KPj4gKw0KPj4gK2ludA0KPj4gK2FyY19nZW5fRElWKERpc2Fz
Q3R4dCAqY3R4LCBUQ0d2IHNyYzIsIFRDR3Ygc3JjMSwgVENHdiBkZXN0KQ0KPj4gK3sNCj4+ICvC
oMKgwqAgaW50IHJldCA9IERJU0FTX05FWFQ7DQo+PiArwqDCoMKgIFRDR3YgdGVtcF85ID0gdGNn
X3RlbXBfbG9jYWxfbmV3KCk7DQo+PiArwqDCoMKgIFRDR3YgY2NfZmxhZyA9IHRjZ190ZW1wX2xv
Y2FsX25ldygpOw0KPj4gK8KgwqDCoCBUQ0d2IHRlbXBfMSA9IHRjZ190ZW1wX2xvY2FsX25ldygp
Ow0KPj4gK8KgwqDCoCBUQ0d2IHRlbXBfMiA9IHRjZ190ZW1wX2xvY2FsX25ldygpOw0KPj4gK8Kg
wqDCoCBUQ0d2IHRlbXBfMyA9IHRjZ190ZW1wX2xvY2FsX25ldygpOw0KPj4gK8KgwqDCoCBUQ0d2
IHRlbXBfNCA9IHRjZ190ZW1wX2xvY2FsX25ldygpOw0KPj4gK8KgwqDCoCBUQ0d2IHRlbXBfNSA9
IHRjZ190ZW1wX2xvY2FsX25ldygpOw0KPj4gK8KgwqDCoCBUQ0d2IHRlbXBfNiA9IHRjZ190ZW1w
X2xvY2FsX25ldygpOw0KPj4gK8KgwqDCoCBUQ0d2IHRlbXBfNyA9IHRjZ190ZW1wX2xvY2FsX25l
dygpOw0KPj4gK8KgwqDCoCBUQ0d2IHRlbXBfOCA9IHRjZ190ZW1wX2xvY2FsX25ldygpOw0KPj4g
K8KgwqDCoCBUQ0d2IHRlbXBfMTAgPSB0Y2dfdGVtcF9sb2NhbF9uZXcoKTsNCj4+ICvCoMKgwqAg
VENHdiB0ZW1wXzExID0gdGNnX3RlbXBfbG9jYWxfbmV3KCk7DQo+PiArwqDCoMKgIGdldENDRmxh
Zyh0ZW1wXzkpOw0KPj4gK8KgwqDCoCB0Y2dfZ2VuX21vdl90bChjY19mbGFnLCB0ZW1wXzkpOw0K
Pj4gK8KgwqDCoCBUQ0dMYWJlbCAqZG9uZV8xID0gZ2VuX25ld19sYWJlbCgpOw0KPj4gK8KgwqDC
oCB0Y2dfZ2VuX3NldGNvbmRfdGwoVENHX0NPTkRfRVEsIHRlbXBfMSwgY2NfZmxhZywgYXJjX3Ry
dWUpOw0KPj4gK8KgwqDCoCB0Y2dfZ2VuX3hvcmlfdGwodGVtcF8yLCB0ZW1wXzEsIDEpOw0KPj4g
K8KgwqDCoCB0Y2dfZ2VuX2FuZGlfdGwodGVtcF8yLCB0ZW1wXzIsIDEpOw0KPj4gK8KgwqDCoCB0
Y2dfZ2VuX2JyY29uZF90bChUQ0dfQ09ORF9FUSwgdGVtcF8yLCBhcmNfdHJ1ZSwgZG9uZV8xKTsN
Cj4+ICvCoMKgwqAgVENHTGFiZWwgKmVsc2VfMiA9IGdlbl9uZXdfbGFiZWwoKTsNCj4+ICvCoMKg
wqAgVENHTGFiZWwgKmRvbmVfMiA9IGdlbl9uZXdfbGFiZWwoKTsNCj4+ICvCoMKgwqAgdGNnX2dl
bl9zZXRjb25kaV90bChUQ0dfQ09ORF9ORSwgdGVtcF8zLCBzcmMyLCAwKTsNCj4+ICvCoMKgwqAg
dGNnX2dlbl9zZXRjb25kaV90bChUQ0dfQ09ORF9ORSwgdGVtcF80LCBzcmMxLCAyMTQ3NDgzNjQ4
KTsNCj4+ICvCoMKgwqAgdGNnX2dlbl9zZXRjb25kaV90bChUQ0dfQ09ORF9ORSwgdGVtcF81LCBz
cmMyLCA0Mjk0OTY3Mjk1KTsNCj4+ICvCoMKgwqAgdGNnX2dlbl9vcl90bCh0ZW1wXzYsIHRlbXBf
NCwgdGVtcF81KTsNCj4+ICvCoMKgwqAgdGNnX2dlbl9hbmRfdGwodGVtcF83LCB0ZW1wXzMsIHRl
bXBfNik7DQo+PiArwqDCoMKgIHRjZ19nZW5feG9yaV90bCh0ZW1wXzgsIHRlbXBfNywgMSk7DQo+
PiArwqDCoMKgIHRjZ19nZW5fYW5kaV90bCh0ZW1wXzgsIHRlbXBfOCwgMSk7DQo+PiArwqDCoMKg
IHRjZ19nZW5fYnJjb25kX3RsKFRDR19DT05EX0VRLCB0ZW1wXzgsIGFyY190cnVlLCBlbHNlXzIp
Ow0KPj4gK8KgwqDCoCBkaXZTaWduZWQodGVtcF8xMCwgc3JjMSwgc3JjMik7DQo+PiArwqDCoMKg
IHRjZ19nZW5fbW92X3RsKGRlc3QsIHRlbXBfMTApOw0KPj4gK8KgwqDCoCBpZiAoKGdldEZGbGFn
ICgpID09IHRydWUpKSB7DQo+PiArwqDCoMKgwqDCoMKgwqAgc2V0WkZsYWcoZGVzdCk7DQo+PiAr
wqDCoMKgwqDCoMKgwqAgc2V0TkZsYWcoZGVzdCk7DQo+PiArwqDCoMKgwqDCoMKgwqAgdGNnX2dl
bl9tb3ZpX3RsKHRlbXBfMTEsIDApOw0KPj4gK8KgwqDCoMKgwqDCoMKgIHNldFZGbGFnKHRlbXBf
MTEpOw0KPj4gK8KgwqDCoCB9DQo+PiArwqDCoMKgIHRjZ19nZW5fYnIoZG9uZV8yKTsNCj4+ICvC
oMKgwqAgZ2VuX3NldF9sYWJlbChlbHNlXzIpOw0KPj4gK8KgwqDCoCBnZW5fc2V0X2xhYmVsKGRv
bmVfMik7DQo+PiArwqDCoMKgIGdlbl9zZXRfbGFiZWwoZG9uZV8xKTsNCj4NCj4gTm9yIGlzIHlv
dXIgY29tcGlsZXIsIGZvciB0aGF0IG1hdHRlciwgY3JlYXRpbmcgYnJhbmNoZXMgZm9yIGVtcHR5
IA0KPiBlbHNlcy7CoCBUaGUgdHdvIHRvZ2V0aGVyIHByb2R1Y2UgY3JpbmdlLXdvcnRoeSByZXN1
bHRzLg0KPg0KPiBJIGNhbid0IGhlbHAgYnV0IGZlZWxpbmcgdGhhdCB0aGUgc2FtZSBhbW91bnQg
b2YgZWZmb3J0IHdvdWxkIGhhdmUgDQo+IHByb2R1Y2VkIGEgbGVnaWJsZSwgbWFpbnRhaW5hYmxl
IGNvbnZlcnNpb24gZGlyZWN0bHkgdG8gVENHLCBhbmQgDQo+IHdpdGhvdXQgdGhlIGZhbnRhc3Rp
YyBhbW91bnQgb2YgZHVwbGljYXRpb24geW91IGhhdmUgY3JlYXRlZCB3aXRoIHlvdXIgDQo+IGlu
ZGVwZW5kZW50IHYyIGFuZCB2MyBmaWxlcy4NCj4NCj4NCj4gcn4NCg0KDQo=

