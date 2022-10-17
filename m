Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 605B06004B1
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 03:07:40 +0200 (CEST)
Received: from localhost ([::1]:37638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okEbT-0007fL-FS
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 21:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=282f36034=Dmitry.Fomichev@wdc.com>)
 id 1okERN-0002d2-PH; Sun, 16 Oct 2022 20:57:13 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:35371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=282f36034=Dmitry.Fomichev@wdc.com>)
 id 1okERL-0004wd-R1; Sun, 16 Oct 2022 20:57:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1665968231; x=1697504231;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Nwj3zc4DA2OcJAWfhTuGjYQOrXrIhL+ZziSgbAsd7VE=;
 b=IuZMwarv/mtMSz/IGb2hds+BhcO4GM7boK0+mhb8Tqao8J3M0A/jzS4g
 PVp3PMINjq5AQbojjN+f3mWSl/rIWK9Txfd3u3kpzqXwV6gdiK/jJHXms
 R26ZC+lXdLUaoe9sM/EY3fwUcRRhhTAPo84YmPDrh1WumKeoYrAnOdTFM
 rNOkmWw/ai5P1OIkFoxmx9PefqH2df10NPN5ev/+QoJKHEMoB97DqyMl7
 b5TFTC576oZDfEIRq6FHA71kunRHTCdkJtO1iDN7+AoB/eJRctqSJrDnJ
 UHJpHZgBbRJo+fETriUd7PzH3FSax41RS5jjhCV+XBES10wPXqzJdFNnM A==;
X-IronPort-AV: E=Sophos;i="5.95,190,1661788800"; d="scan'208";a="212291289"
Received: from mail-mw2nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.104])
 by ob1.hgst.iphmx.com with ESMTP; 17 Oct 2022 08:57:10 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XeFseGC2mvPo6PZbaBGSBIZt2arOncq/jDcIYfZdej5TjFhg11+d1M4JV4XMhShT/BDiXqOP/rusaEbP3fwXEZVQy9iEZS4LhdF0fIzbME2lLpJKt9pmc+J7OW4YByKllYqaZCdoid9ULEsKrzjs9SZ+RBzx8hwWNxHsvAwXhNVJABA2lF4q6RKYKiu1OdrrDIpZ8ima0H7VFotGBPg4GbN8eqlwiJKZ3bVxCCjZ7gRBtKBGc9Byipzg3PS0o3+eRqEUJyN9e3Mg5eZP4vXumMgr/9xH8cua+LvEqibfRd6BU4e2ey1lVQlSFsK+5NgJgRBAGnVYuoBx6RKkinIFUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nwj3zc4DA2OcJAWfhTuGjYQOrXrIhL+ZziSgbAsd7VE=;
 b=dEOMdBJ4SQEficBCRsPN/yTHjgnRs1iILbuB1AGnvludpOvKoiv7/HfJiyDB835kE0Ue7IF+Jh026aKYhPcUFGzq/pLRQZRpPfSkkms/p5vknOCkV79wGH4o5TlYGZsr+hubLwlr8ILdutdJu9w4I4mW/dXfxh2kl0meWKqS5n55NeO1AHELDBRUTm3OrMnGPXLIidtg7VPGtsoDJku1btABzkRkQoPiAWlAIB9U1gckm+HtOaS08FHQnQ9ODEwTUqZLQuoIzvscECnSeWn86twkNBBQnobHqbAih0AZWVjzywbpnme3b9ql++4Htnxi1yENyaDaO+lVhXTAB12FLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nwj3zc4DA2OcJAWfhTuGjYQOrXrIhL+ZziSgbAsd7VE=;
 b=HPp4JDfexfbz11DOZcLyiu76k5FbRC47KjGkfMh7c2aphRb58YQnLu0KbwbX74s41w78dxVyeNEh/cnKxQYbyHtPzm3AzNG2Tid9TfIyaxMv7tuh1/uoUvu//F8N4dY27eF3zBIlOJtIUr47EBUVcElnKLJYr51WcFFilCYNKXs=
Received: from MN2PR04MB5951.namprd04.prod.outlook.com (2603:10b6:208:3f::13)
 by MWHPR04MB0512.namprd04.prod.outlook.com (2603:10b6:300:70::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 00:57:06 +0000
Received: from MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::51df:fdd7:7c49:12ee]) by MN2PR04MB5951.namprd04.prod.outlook.com
 ([fe80::51df:fdd7:7c49:12ee%5]) with mapi id 15.20.5723.032; Mon, 17 Oct 2022
 00:57:06 +0000
From: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
To: "faithilikerun@gmail.com" <faithilikerun@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "hreitz@redhat.com" <hreitz@redhat.com>, "hare@suse.de" <hare@suse.de>,
 "armbru@redhat.com" <armbru@redhat.com>, "stefanha@redhat.com"
 <stefanha@redhat.com>, "fam@euphon.net" <fam@euphon.net>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "eblake@redhat.com"
 <eblake@redhat.com>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "damien.lemoal@opensource.wdc.com" <damien.lemoal@opensource.wdc.com>
Subject: Re: [PATCH v12 4/7] raw-format: add zone operations to pass through
 requests
Thread-Topic: [PATCH v12 4/7] raw-format: add zone operations to pass through
 requests
Thread-Index: AQHY4W7WdG6jWIhoj02DdYrmvbD0E64Rw+GA
Date: Mon, 17 Oct 2022 00:57:06 +0000
Message-ID: <747666bd9fd4ed8cb6861679b0f2f1bb1775bd90.camel@wdc.com>
References: <20221016145110.171262-1-faithilikerun@gmail.com>
 <20221016145110.171262-5-faithilikerun@gmail.com>
In-Reply-To: <20221016145110.171262-5-faithilikerun@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR04MB5951:EE_|MWHPR04MB0512:EE_
x-ms-office365-filtering-correlation-id: cca18546-a783-424f-b2a5-08daafda82e9
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Kc0e6qDyllVUBwC6NrLosqaTxu/IbRTF/kDCcqhAP0s0BMZ97x1x0BAP7iRkmcwQkkswdZXtMmNTAyI/+5o5jgsiXLbkAdqm17JryReWrB8ptEDRoX4ZVjCp8CtIEx3YzydMVA4lRXbqa9shpV4uFdw6/9yf1ZF5eeijHpo8+6oeglymmx3F4vJUEHz2OdNgXUD+J4+gOGRTvYJHIA4XWw7UkajDkMfhUyFQsUtKz7B+jBv6tWMz7aoZjcuhR3gmKNnXC/yjhcExkioPYjFwmx3+IJTDIgAGozmd9zvb4krJIlBxcfmPH5VumFJTkwW6fY+bUvKTmOT70FMIFEEkmkOs4l7b3QSJI5G0BeuPlpea05df1OgAHcRvy9Ajf8qtIdYeLJajOt8e8uSCdmuWHi2PiBdDdZLJpbcjTAAYW+Vvc+Sg20MwQq1XW/4VWEDHsv65Xcn+sqTVnA/BHLLcv0t8k/KKSKolfkcom5KeRmkoIlDYG9fDVTomajleuUIv4elPvojrw9roSKfgEXRJsh8ewuqgBopj72tv7ebMchED85ElX5hJ5tUJa5fgzCF/vMxKJ0MR8GZmpGr7bf9s/6aJFhm3yunZkkzsJ8R1dQE1w0kcXCWSN13Ji5T367JwjWz8Ah4NU07Rz3ApzxJGt3I9c2ItwIueI0GER1Lf01ZZw2VEUiaDqu9fpaRUpVpRS+P6HcQOWbB4GL9fNRE1/kMOd0IG1oCwOoDPtVKNb+MvWLZIG16RT6pSCqT50O+nW6pMxnLMq4QJKUYdgz3lvw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR04MB5951.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(451199015)(6506007)(71200400001)(478600001)(110136005)(54906003)(6486002)(66446008)(26005)(64756008)(8676002)(4326008)(91956017)(76116006)(66556008)(66946007)(41300700001)(6512007)(8936002)(5660300002)(7416002)(66476007)(2616005)(316002)(83380400001)(82960400001)(38070700005)(186003)(2906002)(4001150100001)(122000001)(38100700002)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ym8ybDFiVnhxYm03WXlEN3I4ZVVYNzdiYUphS0lmd0xZK21yaTczU0dKUUg4?=
 =?utf-8?B?Z0U1MHk1dGVCUTFMVnhOazFreERQUkVNQ3ZWbEJHTi8wbVFqcVd4K05Gdlox?=
 =?utf-8?B?SXZiMlhDOTZiM2k4L0FtdkxFNjFNUDJ5R1A5cjJJdE1PdDVYMWtyamJGNkly?=
 =?utf-8?B?RE93MzRaWlVKaU5aQTRRMjVTM1BsL1NPZ01pZWEyMzlmdWNMalBDVnVpVW5H?=
 =?utf-8?B?a2Y0Rzcrb2gvR0kvUm1Xd085cy90SmhKVkMxbGdTWlBnWVpwNjZqa1hENUlG?=
 =?utf-8?B?STVEcUQ0bytVRVA3eFk4YzFBSnZtMVJnSUtER1YwSG8wQ2JjSnN3UWN4bmFB?=
 =?utf-8?B?YXV4ZnZnK3hoS3YremtSdnpLTWZ0VllWczc0OEN0K1N6ZU9GMC9IaHR0ZTY4?=
 =?utf-8?B?MWhiWHFnbG04T2tVYVhxNExsRlpjNmxHdjFkTFcvRDlmSjNSMS9HUVlGcXJw?=
 =?utf-8?B?UXN6TmxvVG1ubnpYci91RzNrelg1QTZuc0ROc0U0WUlJL1d5RXhZalRRM2ln?=
 =?utf-8?B?WjdvYVp0RjZtL2tkSThyM2lkc0dYa1ppUEM0ZCtOdG01blgvY2hSZ2JFMVRP?=
 =?utf-8?B?UUpqaCtZMlBXTW0xVFdTV2FoRCs0bGtCSnlBMkxFbjlDTEpSd3ZrWlBrRGpl?=
 =?utf-8?B?ZHdmOFVkUU1zbVlpelprWkE0WjhiYmVwNmUvUE9QeWE3ZnVhSHBYNmtXVE1R?=
 =?utf-8?B?dnV4bm9WOG1CdTB5OGRjSGlpUEpMemZlWmVIZEltOElTaC9vNm9tWGx2aXhM?=
 =?utf-8?B?RSs3VEZEdXNjcUhmTDZoYVQzNmRITGpRUWVkRlpaQStjY0tRWlBuRXo3T2s5?=
 =?utf-8?B?UGRUeXh2NjdZUEc1WHNvUTBPNll0SzZaZEl2Q01WTGEzNFJ6TUVtZ2x0bWF3?=
 =?utf-8?B?b0ZGVWEwbkkvQ3JkaVFJUDZxWjc2dWszZU92eHh2TCtYdWczZTg4UnJhL1Rz?=
 =?utf-8?B?TFR3RSt2ZDI0U2V2Tk5ockFPelpsUEdWYVVNdkNHUWhFSWFCZXc0enBnazJ5?=
 =?utf-8?B?U29wTTk0QmQ2QTNmdjhwUEVGVW9HcEtRYzl2dnJ6RTlLVkJUSW8vTnJaU2I2?=
 =?utf-8?B?NFl4OXpHejNZbXFGdlZ6Q1gzUWRaUU8wTlVSMUdSNE5pV2JyeDQ1c25mZGVy?=
 =?utf-8?B?QVpxbWtVc1VXK3Q2WHVEWXQvYVkyV0h4TGZiSGE3VTBycGtDQnozajc5YXZO?=
 =?utf-8?B?bWRkcTJYbWlvdWUyY0FFak9NU2NVQm9EMmFla2Q3Q2hzUVdZbi9sOWQyMTdU?=
 =?utf-8?B?dFBPc2VvWldTWG9ZM3pvMmxiK0x5SnVFUWdvS2RDL1o0WDZKM0kzbE9NdU05?=
 =?utf-8?B?aXk0M2xZcWhrYm5PQ29EQVZQZGZkaUpmRHA5MnFXNlZzRWVibGxaelhtSFVw?=
 =?utf-8?B?RkVCQnBReXNYUGhSbmNxaFlNdWhzWS9xaHFRYW1hZ1drUVNNaTFBWFRiVHYv?=
 =?utf-8?B?YXFPOWl3OGt5SHdNeEdYWis1b1pFOWxtNHR1cVg4Umk4OWdadGlibWJNMEJD?=
 =?utf-8?B?VUpRV2kxd2Rpc1pMQlRjd3ZacHhzdmNDa3JnSmE0djhRNmR6VFkzTmgzRVJV?=
 =?utf-8?B?WDBTTXdCWUhKTGxNQU9NdGZQOVBPVklmM09XUmxXY2ZycDZjYVBlRytRelV0?=
 =?utf-8?B?RlhtQVd4enJxUlhZaTVMTmFaUGZkTk1DRkxiZkhTQ2FpcFhJN3lQcjNQV0Jz?=
 =?utf-8?B?TFhrb3RWZUZXOTRRUGZ6VnR6anpLeE5obSswVjNVaVdoQWxOY3ZOSzZMMHlx?=
 =?utf-8?B?WTc4VTlyYVQzZmhxdENJUEttWUZHd3hxWGZpM3hXRnA0KzlKUDVUR2NXOW82?=
 =?utf-8?B?MzRLalNNRjZGdmFOK0ZDVWxMbDd2N0g1c0NrWDkxQTZ4Tk1nenMyaEUrZHRI?=
 =?utf-8?B?UlowRU45a1FiTFBsWll4eHJ0SnFnckNRWlo1c3ozQUkrdEdBOTVOT3BlbzJi?=
 =?utf-8?B?OXlpNDNPZkNjVDMyeFBMWjdnZGUwc25ETEJJZElwK01pbmdCaS9vcEtGc0Ry?=
 =?utf-8?B?MFdFdndYcTBqb3dhSXhPZzIzNjZjajhoVVpjQ3JJZ2tYZERwNWJUVlcveDFj?=
 =?utf-8?B?dXV3YkdXSDY4R3NQb0F1cTAxUGhCOGdUSkd3VGoySW1CU0YraENJNGFsYkJs?=
 =?utf-8?B?Z0J4K3c2QllqV2JVOTMyOWxYaDFxM01yd29tWDZPcmJUQ0lHNXlHZXIxQ0ZX?=
 =?utf-8?B?UFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8318251F54B8B94C8F2BA9C49A3B5E28@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR04MB5951.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cca18546-a783-424f-b2a5-08daafda82e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2022 00:57:06.0119 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DKj7h4Fq7RIrPgaDHl7a/4zUnodEJEjeEGZGknFjEbaJC0aQ54UDVx2FGyyYvunhl2EmtJ72qQ9pcrEYSdE+bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0512
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=282f36034=Dmitry.Fomichev@wdc.com; helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gU3VuLCAyMDIyLTEwLTE2IGF0IDIyOjUxICswODAwLCBTYW0gTGkgd3JvdGU6Cj4gcmF3LWZv
cm1hdCBkcml2ZXIgdXN1YWxseSBzaXRzIG9uIHRvcCBvZiBmaWxlLXBvc2l4IGRyaXZlci4gSXQg
bmVlZHMgdG8KPiBwYXNzIHRocm91Z2ggcmVxdWVzdHMgb2Ygem9uZSBjb21tYW5kcy4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBTYW0gTGkgPGZhaXRoaWxpa2VydW5AZ21haWwuY29tPgo+IFJldmlld2Vk
LWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Cj4gUmV2aWV3ZWQtYnk6
IERhbWllbiBMZSBNb2FsIDxkYW1pZW4ubGVtb2FsQG9wZW5zb3VyY2Uud2RjLmNvbT4KPiBSZXZp
ZXdlZC1ieTogSGFubmVzIFJlaW5lY2tlIDxoYXJlQHN1c2UuZGU+CgpSZXZpZXdlZC1ieTogRG1p
dHJ5IEZvbWljaGV2IDxkbWl0cnkuZm9taWNoZXZAd2RjLmNvbT4KCj4gLS0tCj4gwqBibG9jay9y
YXctZm9ybWF0LmMgfCAxMyArKysrKysrKysrKysrCj4gwqAxIGZpbGUgY2hhbmdlZCwgMTMgaW5z
ZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9ibG9jay9yYXctZm9ybWF0LmMgYi9ibG9jay9y
YXctZm9ybWF0LmMKPiBpbmRleCBmMzM3YWM3NTY5Li5iYWM0M2YxZDI1IDEwMDY0NAo+IC0tLSBh
L2Jsb2NrL3Jhdy1mb3JtYXQuYwo+ICsrKyBiL2Jsb2NrL3Jhdy1mb3JtYXQuYwo+IEBAIC0zMTQs
NiArMzE0LDE3IEBAIHN0YXRpYyBpbnQgY29yb3V0aW5lX2ZuIHJhd19jb19wZGlzY2FyZChCbG9j
a0RyaXZlclN0YXRlCj4gKmJzLAo+IMKgwqDCoMKgIHJldHVybiBiZHJ2X2NvX3BkaXNjYXJkKGJz
LT5maWxlLCBvZmZzZXQsIGJ5dGVzKTsKPiDCoH0KPiDCoAo+ICtzdGF0aWMgaW50IGNvcm91dGlu
ZV9mbiByYXdfY29fem9uZV9yZXBvcnQoQmxvY2tEcml2ZXJTdGF0ZSAqYnMsIGludDY0X3QKPiBv
ZmZzZXQsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgKm5yX3pv
bmVzLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQmxvY2tab25lRGVzY3JpcHRvciAq
em9uZXMpIHsKPiArwqDCoMKgIHJldHVybiBiZHJ2X2NvX3pvbmVfcmVwb3J0KGJzLT5maWxlLT5i
cywgb2Zmc2V0LCBucl96b25lcywgem9uZXMpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW50IGNvcm91
dGluZV9mbiByYXdfY29fem9uZV9tZ210KEJsb2NrRHJpdmVyU3RhdGUgKmJzLCBCbG9ja1pvbmVP
cCBvcCwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50NjRfdCBvZmZzZXQsIGludDY0X3Qg
bGVuKSB7Cj4gK8KgwqDCoCByZXR1cm4gYmRydl9jb196b25lX21nbXQoYnMtPmZpbGUtPmJzLCBv
cCwgb2Zmc2V0LCBsZW4pOwo+ICt9Cj4gKwo+IMKgc3RhdGljIGludDY0X3QgcmF3X2dldGxlbmd0
aChCbG9ja0RyaXZlclN0YXRlICpicykKPiDCoHsKPiDCoMKgwqDCoCBpbnQ2NF90IGxlbjsKPiBA
QCAtNjE1LDYgKzYyNiw4IEBAIEJsb2NrRHJpdmVyIGJkcnZfcmF3ID0gewo+IMKgwqDCoMKgIC5i
ZHJ2X2NvX3B3cml0ZXbCoMKgwqDCoMKgID0gJnJhd19jb19wd3JpdGV2LAo+IMKgwqDCoMKgIC5i
ZHJ2X2NvX3B3cml0ZV96ZXJvZXMgPSAmcmF3X2NvX3B3cml0ZV96ZXJvZXMsCj4gwqDCoMKgwqAg
LmJkcnZfY29fcGRpc2NhcmTCoMKgwqDCoCA9ICZyYXdfY29fcGRpc2NhcmQsCj4gK8KgwqDCoCAu
YmRydl9jb196b25lX3JlcG9ydMKgID0gJnJhd19jb196b25lX3JlcG9ydCwKPiArwqDCoMKgIC5i
ZHJ2X2NvX3pvbmVfbWdtdMKgID0gJnJhd19jb196b25lX21nbXQsCj4gwqDCoMKgwqAgLmJkcnZf
Y29fYmxvY2tfc3RhdHVzID0gJnJhd19jb19ibG9ja19zdGF0dXMsCj4gwqDCoMKgwqAgLmJkcnZf
Y29fY29weV9yYW5nZV9mcm9tID0gJnJhd19jb19jb3B5X3JhbmdlX2Zyb20sCj4gwqDCoMKgwqAg
LmJkcnZfY29fY29weV9yYW5nZV90b8KgID0gJnJhd19jb19jb3B5X3JhbmdlX3RvLAoK

