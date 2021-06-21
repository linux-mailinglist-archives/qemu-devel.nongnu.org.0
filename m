Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA2E3AE2C3
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 07:27:26 +0200 (CEST)
Received: from localhost ([::1]:53066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvCSz-0004cs-6h
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 01:27:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <swee.aun.khor@intel.com>)
 id 1lvCS1-0003tt-Ec
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 01:26:25 -0400
Received: from mga01.intel.com ([192.55.52.88]:19368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <swee.aun.khor@intel.com>)
 id 1lvCRx-00056j-LF
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 01:26:24 -0400
IronPort-SDR: xXFL07VEgPXSZetDEGDPt7nQXweIla+NwVtETkJSuUvAqehA8XHmI2xV7OkCKzrFu5v03TpMAo
 iwzcDAgBkO+g==
X-IronPort-AV: E=McAfee;i="6200,9189,10021"; a="228322459"
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="228322459"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2021 22:26:13 -0700
IronPort-SDR: fAG56nmp/vdlkInXh1tyWKRsB7PlHNTBsMCQMl7P/4josb/5sXI0xNmFOTSqiz72DSzpv/Az+9
 olnvZbEFK1uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="622967024"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 20 Jun 2021 22:26:12 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Sun, 20 Jun 2021 22:26:11 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Sun, 20 Jun 2021 22:26:11 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Sun, 20 Jun 2021 22:26:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oOiyHhyDXiMatrVT9iHighmb5nCjjDHzr++G2MzIkpcG/l2rKaN5PKroYpLVR1M5OsJguGU11PExhZEMtyWKvcxFy1/22t3urNyE3JBnNkbpPWUnaANZPklS688CAu9LrEpXvABmVbsHwa66b/Bq74bfJtw/y4Nk/ZvCt5QQJVh80urstiErbWc+WhxHnFkhkJxXAfqHvxOEfkjeKWgN83KUizGJomJKvt7NOPu2+TKM0B29AijDv43/Z91mZZm5m7ifPukLaaib7D66j8hMmqVW53W2GBz2q7c6BPHwHUKSJSOwrq4t8qNUUhbV45kb+gHqVnzaj5Vyk0sQtpUK7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXanN8Vo4Q09myj8Rg1QC7Z20IgJCHSLJDgBepg/wtM=;
 b=WHxBVyrGACj4XwdDVw+6hLuQAYPRZUklHM1+L6e0769TZLv6Fm5eJG+r34g9JtlGzNkZ3st7Xmrwg4gGpW02Cc/IAy7M8HXYYreIjxBBlcr1BAMutCDKpzNxZj/SzGYmiJNtvmquJCx6BQQhGZqigHgGAPgDYIvBBpACW5+MRZaSCOvJdSmOcbp20ARVp8KB2PJqt9hotfO2BiX/N65YFWsgM4jHxZnsayGFjjq6V2aXKSD103dyw0X3qaojTaL960+L7WUE14lTB/F93TrAx4zKfKptd3dsF6v0Hw3WVggX8lmc/is6FyJEV+VacFFh7FoTSlNJWUOKKKnbDgMYgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXanN8Vo4Q09myj8Rg1QC7Z20IgJCHSLJDgBepg/wtM=;
 b=B9M3y6fc2GwReHHp61rlog13x35Ow235crZz4crEaF4AssItf2O7xzW4ZLNZ+NirKZs9C3ZfasbuaM/27vh+e6fH0k7PQRjTJhKD+KnoSIu0nz3n4ywgQB66XjAWNAlmXG6hfIQZQjjKdCEGbciLQAacrETVMXZlUTQFzZbiZTc=
Received: from DM8PR11MB5717.namprd11.prod.outlook.com (2603:10b6:8:30::9) by
 DM5PR11MB1497.namprd11.prod.outlook.com (2603:10b6:4:c::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.19; Mon, 21 Jun 2021 05:26:09 +0000
Received: from DM8PR11MB5717.namprd11.prod.outlook.com
 ([fe80::ed6d:88e5:949b:62f1]) by DM8PR11MB5717.namprd11.prod.outlook.com
 ([fe80::ed6d:88e5:949b:62f1%8]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 05:26:09 +0000
From: "Khor, Swee Aun" <swee.aun.khor@intel.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: RE: [PATCH v2] ui/gtk: Allow user to select monitor number to display
 qemu in full screen through new gtk display option
Thread-Topic: [PATCH v2] ui/gtk: Allow user to select monitor number to
 display qemu in full screen through new gtk display option
Thread-Index: AQHXZDIfHJcen+WIR0WYeKfsyBDVzasZtNJA
Date: Mon, 21 Jun 2021 05:26:09 +0000
Message-ID: <DM8PR11MB571712EDA6522BB50D192A63AF0A9@DM8PR11MB5717.namprd11.prod.outlook.com>
References: <20210617020609.18089-1-swee.aun.khor@intel.com>
 <8735tfsa79.fsf@dusky.pond.sub.org>
In-Reply-To: <8735tfsa79.fsf@dusky.pond.sub.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a9029e5-2463-40ff-5915-08d934751378
x-ms-traffictypediagnostic: DM5PR11MB1497:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB1497764855DF9D04E60C3B40AF0A9@DM5PR11MB1497.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j2rL5sKHNO91/ZLiQP67TxNykH3u3grD+7DKnI978MoZRv5ovk0y8cHhzv2eF7t0FAAs1IRkqMSwkjt09+HZfbnAlESh4BV48c9SooYucAC8MATt1eKtjpsUF2hhRjQMN37cdZci1Q8WbZnY7WJm8Tg46Mjcw+8iuS3id2sJOcA0aFcb5Iy0hf/zkUtGGNMSZD9qZIa4Y4JA0KJwhyCm6EBckShnZA5L2HBVoLgGnRDBDgxtA3aieyB5zmrpSfii3JqHmYn2JGwwwuESH7a99v6e0F27VcFpEjF4FYKae95szgKoIF1F21ysOLyQpMSndDwTe8otrH0m9yHdetV57AmTn4UWxFxFjqfpdDLetaIwRAeutM8OV5w+zgTVrLuDALvzpX7MMIkp2iU4FBmHUIEFeFIjnwG2pZnM+LShCydbxsPaP30LGiaP0LVVRbBlG06DAQXxBcoM0SnQyzGphsF46FjJkrW7etJJsieYcUrJ7Ina4ikuUI6HWqEW3RCTj3aXrUcNEqqt0d7ty/d3jFsdZsO0ljiiov4AH8ZogipCE7W91v/cQj6SP/fRg7r9B6ZwueuurUaoeJDpkvOrjGje3Hn+tGpGR+vh/gjX9Bc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(376002)(39860400002)(346002)(366004)(71200400001)(55016002)(6506007)(53546011)(33656002)(478600001)(86362001)(316002)(7696005)(122000001)(4326008)(38100700002)(26005)(9686003)(2906002)(8676002)(186003)(52536014)(8936002)(76116006)(66476007)(6916009)(66446008)(66946007)(83380400001)(54906003)(66556008)(64756008)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VDZ1TjUzZGdvd3pMUU9iVnBCREpjbGlLZlFFQWE3RGVOcGhORHFJRkcxN1oz?=
 =?utf-8?B?SGNmQVYxajVXdTJhcXE1SDBIdldUVlBCdnRCQUhrNU5pR1RIQlY5QVFKT0Nn?=
 =?utf-8?B?c0JCN2NINktVaTFOUllrazEzRFJpamJYMkVodDB5TDhaWnRqSmtaT2JFbWdy?=
 =?utf-8?B?azMrNWhhR3RiZkRNb3h5L0h3VExYMGhsbWFVQ3VTeWlmYXVramE4S2xTd2Ux?=
 =?utf-8?B?aHRQWnFtSWZWODdiN25rYmp4MGFlZTAwMjRIcDg2ZnZPb2hBdTlWQ3FndWxB?=
 =?utf-8?B?MVVvcU9YU2xHN1dldC9mWWZ4QTg4Q3NNS3ZMaExqZTJscGRucHU5ckRPVGV6?=
 =?utf-8?B?SEw0OXVsVDJUWncrTnd5czdjd1N4b0RLQjVnMmRvWmRWVnFmaGpocWNlNFp4?=
 =?utf-8?B?cW03U1Flc2xteDRjM0NLb29HYmJkWDhVOEg0UUplOEhVUVRZbTZ5Zm9aaHJP?=
 =?utf-8?B?RllObVFXOHlVZ2w3MnVWKzhvaUVieVIxeDl4ajZTTnB3cW5xaFlKN0RYbHp6?=
 =?utf-8?B?bUhYNXZiNC8zMXcrUW9na20yVVcyVkhiWUVvWS9ZVzNtb2NDT3dRaWRnWEJn?=
 =?utf-8?B?ZHJ2dEUzWjEyUUZkaDRiand6Vm5iVmduNnB4WFBQYmVKUWF0RUYrNlNiaEVn?=
 =?utf-8?B?V2lDZFBVakZwd2JCV05NQ29uNnhjL0RpYzFpbTlaMFRKRjFiTzVqM0hxRWR0?=
 =?utf-8?B?Qnh1dTZJdlpUem80amxKSnl4QjRjWVZZMGlxQ1ZzajNIeUNBWDg2cnBBUVhr?=
 =?utf-8?B?YXNzamNiRVBLZm92UDNNM1VrcFJ5VmlqT1A2WTNwQ08zcTZCOVNabXkvREFa?=
 =?utf-8?B?YWc3K09TRzdjTDVqTDg1U1JjVDVHMGVOUDJYeHhsNjlSZktmNVg4Y0NsWEVH?=
 =?utf-8?B?Yi95aFVrN05Pakt0SmdSTytoRTg4VnM3b1RDa29lNkhFd3piT0wrOXBkcHJO?=
 =?utf-8?B?SitSTGFGMUVCU1BrdnNPNEZzYVV6Rjd6cTRHU1d2WTM1OWJxT0VuUHpYMFZ5?=
 =?utf-8?B?RVk4Wi9oZkhSR0Ezd1J1RmRDU3U4dWs1MVZFU29IWHFyZHMzSHI2L2VuMVEv?=
 =?utf-8?B?NFJzWm1LTjR2aDVicXVRbkxuVkZuMWVsOUZBZUd5allPOVVvQ3lrdTcyQVhu?=
 =?utf-8?B?V3ZvU2wyM3Q5OU1Ec1VZVUxWa3hnOGtXS3I2ZnlFUi9DemhGakhvcXhhTTEv?=
 =?utf-8?B?S1RRTnRQVEFKOVNYQ1MzWnNDZ2pCMm43T0p6RFIyL2VZQTQ2VjdLa3VVdVRM?=
 =?utf-8?B?SjRXd3NsOTM2TEpzQTF6eDU2bVBrOW4zOHZwdjFPWHA1L2dSSzVtY3N5b2Vp?=
 =?utf-8?B?ejBEMWE5RFhuUGJuY1llMWFTMVVTY0VYYnBiZi9Bd0FtcDVFTWMwMWFBbGZ2?=
 =?utf-8?B?alBoTjFWeTRxamgxQWpweEx5VTMwdUNDY3FZWWpnbXZYUDUwMkZTSWR5Z1lj?=
 =?utf-8?B?NXY3NWpOTkIxZVQya0VpNkYrd3hUK1A4RCtUNms3M2t1WEJXNUI0UHhZSVdz?=
 =?utf-8?B?TmRwcnNDanJQZGRQQkJwVE5tNFdOMFpBeXhzcDJFZ09lRzRkNUZ1ZTh4NlJ1?=
 =?utf-8?B?UzJidXlaQ2EvZGFGTTFQUm9Vc3Rudlg5a21ha1dHbW9nMjFNUUczRlBqTXJD?=
 =?utf-8?B?bTgwK1BBcVRtZk93SUJpMmxBbjJlV2NlM3VkOFJ5L2hGSWFrc2VVV3d4ay9h?=
 =?utf-8?B?alpTY3VZSVh2OStvb21pQlFzZ0lKcS9GcDB3S2lISjdrdWt0c0FsaExBalA3?=
 =?utf-8?Q?QdYPciO5cPo/ByYvk3hgYRxiRecm99kXTX09qZl?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a9029e5-2463-40ff-5915-08d934751378
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2021 05:26:09.0878 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gFOFNF8ntRcV5PRphMtQvE+QOfLBXD73xWd29T0xEya2aUazZzu1XqboEFkbvWr8TU+XBP2urlRVKHVE/vnRFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1497
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.88;
 envelope-from=swee.aun.khor@intel.com; helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: "Romli, Khairul Anuar" <khairul.anuar.romli@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, "eblake@redhat.com" <eblake@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Kasireddy,
 Vivek" <vivek.kasireddy@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgTWFya3VzLA0KVGhhbmtzIGZvciBpbmNsdWRlIEdyYXBoaWMgbWFpbnRhaW5lciBhbmQgdGhl
IGNvZGluZyBzdHlsZSBjb21tZW50cy4gIFllcywgc3dlZWF1biBpcyBteSBuYW1lIPCfmIoNCg0K
Rm9yICAiZnVsbCBzY3JlZW4iIGJlICJmdWxsLXNjcmVlbiIgb3IgZXZlbiAiZnVsbHNjcmVlbiI/
IFRoZXNlIDMgd29yZHMgaGF2ZSBiZWVuIGJlaW5nIHVzZWQgaW4gUUVNVSByZXBvLCBidXQgZnVs
bC1zY3JlZW4gbW9zdGx5IHVzZWQgZm9yIHZhcmlhYmxlL21lbWJlci4NClRodXMsIEkgZmVsdCBm
dWxsIHNjcmVlbiBzaG91bGQgYmUgZmluZSB0byBiZSB1c2VkIGFzIGRvY3VtZW50YXRpb24uIFdo
YXQgZG8geW91IHRoaW5rPw0KRXhhbXBsZToNCiJGdWxsU2NyZWVuIiBpbiBody9hcm0vbnNlcmll
cy5jDQoidG9nZ2xlIGZ1bGwgc2NyZWVuIiBpbiBzb2Z0bW11L3ZsLmMgDQoiImZ1bGwtc2NyZWVu
IiBpbiAvcWVtdS1vcHRpb25zLmh4DQoNCkZvciBzdWJzZXF1ZW5jZSBxdWVzdGlvbnM6DQoiIFlv
dXIgbmV3IG9wdGlvbiBhcmd1bWVudCBzZWVtcyB0byBjb3VudCBtb25pdG9ycyBmcm9tIDEsIHdo
aWxlIEdUSyBjb3VudHMgdGhlbSBmcm9tIHplcm8uICBXaHkgdGhlIGRpZmZlcmVuY2U/Ig0Kc3dl
ZWF1bjogSXQgaXMgZHVlIHRvIGd0a193aW5kb3dfZnVsbHNjcmVlbl9vbl9tb25pdG9yIG1vbml0
b3IgaW5kZXggaXMgc3RhcnRlZCBmcm9tIHplcm8uIEkgYW0gbm90IHVzaW5nIHplcm8gYXMgc3Rh
cnRpbmcgaW5kZXggb2YgbmV3IG9wdGlvbiBhcmd1bWVudCB0byBtYWtlIGVhc2llciBmb3IgdXNl
ci4gRXhhbXBsZSwgaWYgdGhlcmUgaXMgMiBtb25pdG9ycywgdGhlbiBhcmd1bWVudCBvcHRpb24g
Y2FuIGJlIG1vbml0b3IgMSBvciAyLiBMYXN0IG51bWJlciB3aWxsIG1hdGNoZWQgd2l0aCB0b3Rh
bCBtb25pdG9ycyB3aGljaCBjYW4gYXZvaWQgY29uZnVzaW9uIGZvciB1c2VyLiBUaGF0IGlzIG15
IHRob3VnaHQuICAgDQoNCiJZb3VyIGRvY3VtZW50YXRpb24gc3RhdGVzIHRoYXQgQG1vbml0b3Ig
YXBwbGllcyBvbmx5ICJpbiBmdWxsIHNjcmVlbiIsIGJ1dCB0aGlzIGNvZGUgaXMgbm90IGd1YXJk
ZWQgYnkgaWYgKG9wdHMtPmZ1bGxfc2NyZWVuKS4gIFdoeSBpcyB0aGF0IG9rYXk/Ig0Kc3dlZWF1
bjogSXQgZG9lc27igJl0IG5lZWQgdG8gYmUgZ3VhcmRlZCBieSBpZiAob3B0cy0+ZnVsbF9zY3Jl
ZW4pLCBhcyBndGtfd2luZG93X2Z1bGxzY3JlZW5fb25fbW9uaXRvciB3aWxsIGVuYWJsZSB0aGUg
ZnVsbCBzY3JlZW4gYnkgaXRzZWxmLiAgDQoNCiJGcm9tIGdka19kaXNwbGF5X2dldF9uX21vbml0
b3JzKCkncyBkb2N1bWVudGF0aW9uOiAiVGhlIHJldHVybmVkIG51bWJlciBpcyB2YWxpZCB1bnRp
bCB0aGUgbmV4dCBlbWlzc2lvbiBvZiB0aGUg4oCcbW9uaXRvci1hZGRlZOKAnSBvciDigJxtb25p
dG9yLXJlbW92ZWTigJ0gc2lnbmFsLiIgIFRoaXMgc3VnZ2VzdHMgbW9uaXRvcnMgY2FuIGNvbWUg
YW5kIGdvIGF0IGFueSB0aW1lLiAgSWYgdGhleSBjYW4sIHdoYXQgaGFwcGVucyB3aGVuIHRoZSBt
b25pdG9yIHdlJ3JlIHRyeWluZyB0byB1c2UgaGVyZSBoYXMgZ29uZSBhd2F5IHNpbmNlIHdlIGNh
bGxlZCBnZGtfZGlzcGxheV9nZXRfbl9tb25pdG9ycygpPyINCnN3ZWVhdW46IEJhc2VkIG9uIG15
IG9ic2VydmF0aW9uLCB3aGVuIHNwZWNpZmljIG1vbml0b3IgZGV2aWNlIGRpc2Nvbm5lY3RlZCBh
ZnRlciBRRU1VIGxhdW5jaGVkIG9uIGl0LCBRRU1VIGFwcGxpY2F0aW9uIHdpbGwgbm90IGJlIHZp
c2libGUgYnV0IFFFTVUgYXBwbGljYXRpb24gc3RpbGwgcnVubmluZyBhbmQgc2NyZWVuIGZyYW1l
YnVmZmVyIHNpemUgaXMgbm90IGJlaW5nIGNoYW5nZWQgYXQgYWxsLiBRRU1VIGFwcGxpY2F0aW9u
IHdpbGwgYmUgdmlzaWJsZSBvbmNlIHlvdSBjb25uZWN0IGJhY2sgdGhlIG1vbml0b3IuIA0KWWVz
IHRoZSByZXR1cm4gbnVtYmVyIGZyb20gZ2RrX2Rpc3BsYXlfZ2V0X25fbW9uaXRvcnMoKSB3aWxs
IG1pbnVzIDEgY29tcGFyZWQgdG8gcHJldmlvdXMgb25jZSAxIG1vbml0b3IgaGFzIGJlZW4gZGlz
Y29ubmVjdGVkLiANCg0KUmVnYXJkcywNClN3ZWVBdW4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCkZyb206IE1hcmt1cyBBcm1icnVzdGVyIDxhcm1icnVAcmVkaGF0LmNvbT4gDQpTZW50
OiBGcmlkYXksIEp1bmUgMTgsIDIwMjEgNzowNyBQTQ0KVG86IEtob3IsIFN3ZWUgQXVuIDxzd2Vl
LmF1bi5raG9yQGludGVsLmNvbT4NCkNjOiBxZW11LWRldmVsQG5vbmdudS5vcmc7IFJvbWxpLCBL
aGFpcnVsIEFudWFyIDxraGFpcnVsLmFudWFyLnJvbWxpQGludGVsLmNvbT47IGVibGFrZUByZWRo
YXQuY29tOyBLYXNpcmVkZHksIFZpdmVrIDx2aXZlay5rYXNpcmVkZHlAaW50ZWwuY29tPjsgR2Vy
ZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIIHYyXSB1
aS9ndGs6IEFsbG93IHVzZXIgdG8gc2VsZWN0IG1vbml0b3IgbnVtYmVyIHRvIGRpc3BsYXkgcWVt
dSBpbiBmdWxsIHNjcmVlbiB0aHJvdWdoIG5ldyBndGsgZGlzcGxheSBvcHRpb24NCg0KWW91IG5l
Z2xlY3RlZCB0byBjYzogdGhlIEdyYXBoaWNzIG1haW50YWluZXIuICBJJ20gZG9pbmcgdGhhdCBm
b3IgeW91IG5vdy4NCg0Kc3dlZWF1biA8c3dlZS5hdW4ua2hvckBpbnRlbC5jb20+IHdyaXRlczoN
Cg0KPiAgLWRpc3BsYXkgZ3RrLG1vbml0b3I9PHZhbHVlPg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBz
d2VlYXVuIDxzd2VlLmF1bi5raG9yQGludGVsLmNvbT4NCg0KWW91ciBjb21taXQgbWVzc2FnZSBp
cyBmb3JtYXR0ZWQgYmFkbHkuICBXaGF0IGFib3V0IHRoaXM6DQoNCiAgICB1aS9ndGs6IE5ldyAt
ZGlzcGxheSBndGsgcGFyYW1ldGVyICdtb25pdG9yJy4NCg0KICAgIFRoaXMgbGV0cyB0aGUgdXNl
ciBzZWxlY3QgbW9uaXRvciBudW1iZXIgdG8gZGlzcGxheSBRRU1VIGluIGZ1bGwNCiAgICBzY3Jl
ZW4gd2l0aCAtZGlzcGxheSBndGssbW9uaXRvcj08dmFsdWU+Lg0KDQpGdXJ0aGVybW9yZSwgeW91
J3JlIFNpZ25lZC1vZmYtYnkgbGluZSBtYXkgYmUgb2ZmLiAgSXQgc2hvdWxkIGJlIG9mIHRoZSBm
b3JtDQoNCiAgICBTaWduZWQtb2ZmLWJ5OiBSRUFMIE5BTUUgPEVNQUlMPg0KDQpJcyAic3dlZWF1
biIgeW91ciByZWFsIG5hbWU/DQoNCj4gLS0tDQo+ICBxYXBpL3VpLmpzb24gICAgfCAgNCArKyst
DQo+ICBxZW11LW9wdGlvbnMuaHggfCAgMiArLQ0KPiAgdWkvZ3RrLmMgICAgICAgIHwgMTUgKysr
KysrKysrKysrKysrDQo+ICAzIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9xYXBpL3VpLmpzb24gYi9xYXBpL3VpLmpzb24g
aW5kZXggMTA1MmNhOWMzOC4uMTYxNmYzZmZiZCANCj4gMTAwNjQ0DQo+IC0tLSBhL3FhcGkvdWku
anNvbg0KPiArKysgYi9xYXBpL3VpLmpzb24NCj4gQEAgLTEwMzUsMTMgKzEwMzUsMTUgQEANCj4g
ICMgICAgICAgICAgICAgICBhc3N1bWluZyB0aGUgZ3Vlc3Qgd2lsbCByZXNpemUgdGhlIGRpc3Bs
YXkgdG8gbWF0Y2gNCj4gICMgICAgICAgICAgICAgICB0aGUgd2luZG93IHNpemUgdGhlbi4gIE90
aGVyd2lzZSBpdCBkZWZhdWx0cyB0byAib2ZmIi4NCj4gICMgICAgICAgICAgICAgICBTaW5jZSAz
LjENCj4gKyMgQG1vbml0b3I6IE1vbml0b3IgbnVtYmVyIHRvIGRpc3BsYXkgcWVtdSBpbiBmdWxs
IHNjcmVlbi4NCg0KV2Ugc3BlbGwgaXQgUUVNVS4NCg0KU2hvdWxkICJmdWxsIHNjcmVlbiIgYmUg
ImZ1bGwtc2NyZWVuIiBvciBldmVuICJmdWxsc2NyZWVuIj8NCg0KPiAgIw0KPiAgIyBTaW5jZTog
Mi4xMg0KPiAgIw0KPiAgIyMNCj4gIHsgJ3N0cnVjdCcgIDogJ0Rpc3BsYXlHVEsnLA0KPiAgICAn
ZGF0YScgICAgOiB7ICcqZ3JhYi1vbi1ob3ZlcicgOiAnYm9vbCcsDQo+IC0gICAgICAgICAgICAg
ICAgJyp6b29tLXRvLWZpdCcgICA6ICdib29sJyAgfSB9DQo+ICsgICAgICAgICAgICAgICAgJyp6
b29tLXRvLWZpdCcgICA6ICdib29sJywNCj4gKyAgICAgICAgICAgICAgICAnKm1vbml0b3InIDog
J2ludCcgfSB9DQoNCkJlc3QgdG8gbWFrZSB5b3VyIGFkZGl0aW9uICJibGVuZCBpbiIgbGlrZSB0
aGlzDQoNCiAgIHsgJ3N0cnVjdCcgIDogJ0Rpc3BsYXlHVEsnLA0KICAgICAnZGF0YScgICAgOiB7
ICcqZ3JhYi1vbi1ob3ZlcicgOiAnYm9vbCcsDQogICAgICAgICAgICAgICAgICAgJyp6b29tLXRv
LWZpdCcgICA6ICdib29sJywNCiAgICAgICAgICAgICAgICAgICAnKm1vbml0b3InICAgICAgIDog
J2ludCcgfSB9DQoNCj4gIA0KPiAgIyMNCj4gICMgQERpc3BsYXlFR0xIZWFkbGVzczoNCj4gZGlm
ZiAtLWdpdCBhL3FlbXUtb3B0aW9ucy5oeCBiL3FlbXUtb3B0aW9ucy5oeCBpbmRleCANCj4gMTQy
NTg3ODRiMy4uZTRiODliNmE3MiAxMDA2NDQNCj4gLS0tIGEvcWVtdS1vcHRpb25zLmh4DQo+ICsr
KyBiL3FlbXUtb3B0aW9ucy5oeA0KPiBAQCAtMTc4Nyw3ICsxNzg3LDcgQEAgREVGKCJkaXNwbGF5
IiwgSEFTX0FSRywgUUVNVV9PUFRJT05fZGlzcGxheSwNCj4gICAgICAiICAgICAgICAgICAgWyx3
aW5kb3dfY2xvc2U9b258b2ZmXVssZ2w9b258Y29yZXxlc3xvZmZdXG4iDQo+ICAjZW5kaWYNCj4g
ICNpZiBkZWZpbmVkKENPTkZJR19HVEspDQo+IC0gICAgIi1kaXNwbGF5IGd0a1ssZ3JhYl9vbl9o
b3Zlcj1vbnxvZmZdWyxnbD1vbnxvZmZdfFxuIg0KPiArICAgICItZGlzcGxheSBndGtbLGdyYWJf
b25faG92ZXI9b258b2ZmXVssZ2w9b258b2ZmXVssbW9uaXRvcj08dmFsdWU+XVxuIg0KPiAgI2Vu
ZGlmDQo+ICAjaWYgZGVmaW5lZChDT05GSUdfVk5DKQ0KPiAgICAgICItZGlzcGxheSB2bmM9PGRp
c3BsYXk+Wyw8b3B0YXJncz5dXG4iDQo+IGRpZmYgLS1naXQgYS91aS9ndGsuYyBiL3VpL2d0ay5j
DQo+IGluZGV4IDk4MDQ2ZjU3N2IuLjg0ZGExMjY2MTEgMTAwNjQ0DQo+IC0tLSBhL3VpL2d0ay5j
DQo+ICsrKyBiL3VpL2d0ay5jDQo+IEBAIC0yMjY4LDYgKzIyNjgsMjEgQEAgc3RhdGljIHZvaWQg
Z3RrX2Rpc3BsYXlfaW5pdChEaXNwbGF5U3RhdGUgKmRzLCBEaXNwbGF5T3B0aW9ucyAqb3B0cykN
Cj4gICAgICAgICAgZ3RrX21lbnVfaXRlbV9hY3RpdmF0ZShHVEtfTUVOVV9JVEVNKHMtPmdyYWJf
b25faG92ZXJfaXRlbSkpOw0KPiAgICAgIH0NCj4gICAgICBnZF9jbGlwYm9hcmRfaW5pdChzKTsN
Cj4gKw0KPiArICAgIGlmIChvcHRzLT51Lmd0ay5oYXNfbW9uaXRvcikgew0KPiArICAgICAgICBp
bnQgbl9tb25pdG9yOw0KPiArICAgICAgICBuX21vbml0b3IgPSBnZGtfZGlzcGxheV9nZXRfbl9t
b25pdG9ycyh3aW5kb3dfZGlzcGxheSk7DQoNClRlcnNlcjoNCg0KICAgICAgICAgICBpbnQgbl9t
b25pdG9yID0gZ2RrX2Rpc3BsYXlfZ2V0X25fbW9uaXRvcnMod2luZG93X2Rpc3BsYXkpOw0KDQo+
ICsNCj4gKyAgICAgICAgaWYgKChvcHRzLT51Lmd0ay5tb25pdG9yIDw9IG5fbW9uaXRvcikgJiYN
Cj4gKyAgICAgICAgICAgIChvcHRzLT51Lmd0ay5tb25pdG9yID4gMCkpIHsNCg0KU3VnZ2VzdCB0
byBkcm9wIHRoZSBzdXBlcmZsdW91cyBwYXJlbnRoZXNpczoNCg0KICAgICAgICAgICBpZiAob3B0
cy0+dS5ndGsubW9uaXRvciA8PSBuX21vbml0b3IgJiYNCiAgICAgICAgICAgICAgIG9wdHMtPnUu
Z3RrLm1vbml0b3IgPiAwKSB7DQoNCj4gKyAgICAgICAgICAgIEdka1NjcmVlbiAqZ2RrX3NjcmVl
bjsNCj4gKyAgICAgICAgICAgIGdka19zY3JlZW4gPSBnZGtfZGlzcGxheV9nZXRfZGVmYXVsdF9z
Y3JlZW4od2luZG93X2Rpc3BsYXkpOw0KPiArICAgICAgICAgICAgZ3RrX3dpbmRvd19mdWxsc2Ny
ZWVuX29uX21vbml0b3IoR1RLX1dJTkRPVyhzLT53aW5kb3cpLCBnZGtfc2NyZWVuLA0KPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKG9wdHMtPnUuZ3RrLm1v
bml0b3IgLSANCj4gKyAxKSk7DQoNCkRyb3AgdGhlIHN1cGVyZmx1b3VzIHBhcmVudGhlc2lzIGFy
b3VuZCB0aGUgbGFzdCBhcmd1bWVudC4NCg0KWW91ciBuZXcgb3B0aW9uIGFyZ3VtZW50IHNlZW1z
IHRvIGNvdW50IG1vbml0b3JzIGZyb20gMSwgd2hpbGUgR1RLIGNvdW50cyB0aGVtIGZyb20gemVy
by4gIFdoeSB0aGUgZGlmZmVyZW5jZT8NCg0KWW91ciBkb2N1bWVudGF0aW9uIHN0YXRlcyB0aGF0
IEBtb25pdG9yIGFwcGxpZXMgb25seSAiaW4gZnVsbCBzY3JlZW4iLCBidXQgdGhpcyBjb2RlIGlz
IG5vdCBndWFyZGVkIGJ5IGlmIChvcHRzLT5mdWxsX3NjcmVlbikuICBXaHkgaXMgdGhhdCBva2F5
Pw0KDQpGcm9tIGdka19kaXNwbGF5X2dldF9uX21vbml0b3JzKCkncyBkb2N1bWVudGF0aW9uOiAi
VGhlIHJldHVybmVkIG51bWJlciBpcyB2YWxpZCB1bnRpbCB0aGUgbmV4dCBlbWlzc2lvbiBvZiB0
aGUg4oCcbW9uaXRvci1hZGRlZOKAnSBvciDigJxtb25pdG9yLXJlbW92ZWTigJ0gc2lnbmFsLiIg
IFRoaXMgc3VnZ2VzdHMgbW9uaXRvcnMgY2FuIGNvbWUgYW5kIGdvIGF0IGFueSB0aW1lLiAgSWYg
dGhleSBjYW4sIHdoYXQgaGFwcGVucyB3aGVuIHRoZSBtb25pdG9yIHdlJ3JlIHRyeWluZyB0byB1
c2UgaGVyZSBoYXMgZ29uZSBhd2F5IHNpbmNlIHdlIGNhbGxlZCBnZGtfZGlzcGxheV9nZXRfbl9t
b25pdG9ycygpPw0KDQo+ICsgICAgICAgIH0gZWxzZSB7DQo+ICsgICAgICAgICAgICBmcHJpbnRm
KHN0ZGVyciwgIkludmFsaWQgR1RLIG1vbml0b3IgYXJndW1lbnRcbiIpOw0KPiArICAgICAgICB9
DQo+ICsgICAgfQ0KPiAgfQ0KPiAgDQo+ICBzdGF0aWMgdm9pZCBlYXJseV9ndGtfZGlzcGxheV9p
bml0KERpc3BsYXlPcHRpb25zICpvcHRzKQ0KDQo=

