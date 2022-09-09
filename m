Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F27B35B3338
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 11:14:58 +0200 (CEST)
Received: from localhost ([::1]:44132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWa6D-0003Kr-K9
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 05:14:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=244fa2c59=Niklas.Cassel@wdc.com>)
 id 1oWa3k-0001bW-Ow; Fri, 09 Sep 2022 05:12:25 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:41808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=244fa2c59=Niklas.Cassel@wdc.com>)
 id 1oWa3h-0004rt-6o; Fri, 09 Sep 2022 05:12:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662714740; x=1694250740;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=i6MPUO2opkJuD7pzLnngXterlxzxIXis5yXQ2FZu4rk=;
 b=N3ryjwBkeY2Tt8fARkQv1oo5dq8b7x2IjRuDAUhhlWm8tkLcak0oZ1D7
 gLoR/XKk5egH8Bl3G/qOGKNDrRnyahTcaDjbEwAT3diV+roubKhDJ+/RY
 X7tDTC8XASZs/5u2JWutC+wA+V2GLRdIpzGtHYBOQjpfuapBKYvWH/qu6
 l2VGDlvnWgilWbdG6UsCiHufwlNq0+QqsyMKtr30r2Ehc0yCpSpISGP6H
 V0vrZwZtMVtUgO7nh/1XCCufWCB3IpUzW18WAuZ7nFdSsRE+p+seyBwKd
 GDe4zG4VTQQ682N2A01vTz8Sb054UvrDkLAKlPcaTEbKDkFWzqDCkyumP Q==;
X-IronPort-AV: E=Sophos;i="5.93,302,1654531200"; d="scan'208";a="216094360"
Received: from mail-bn8nam04lp2042.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.42])
 by ob1.hgst.iphmx.com with ESMTP; 09 Sep 2022 17:12:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eTwevygu31uRxTt2ApvnCotTfe9Gk/n3+uxgg4GVFMkpd7ZLq8DXdJ8abrvvWs8162YlPEdwebIZit4v+9ME8FmwtZ9pVZzWjl/ILNcoJ6lJ+8ng2rP9Tc3RPWmPewBmYgLBLgukTXLr/3hCz5eoi9sA1jYgc0VyxdsQeyBdmuArL+NjqjZQykoikJ2hmX2uby1WcVpzTn8/wOEYDx5gsPfExmeAMs5Daczuu5Utn1XFIqYTL/ikXkC1zYnxHDFKEAFsPg15hKqZHr7sR7o25clDCdNtlphxUz03TdT+rlhoF72hZbWAVWy6O+9uyLKStawi8yidck5KXEMsU8XrPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i6MPUO2opkJuD7pzLnngXterlxzxIXis5yXQ2FZu4rk=;
 b=eWaSsJqechwpdW9+yQ/3rESyp0aTpWrDUVM1cLbf/1pYpYcZh0JRxxKWOsn0sIuSsk3PUOkK+zNncQx+868g8c/n3mcDsy/y0tllkl9h4fQpUTaH0xY7G72IkoJdpJ7D1hHELuTmzyMOk4s7FHtYJODdOKpM2SEtnd/E2zpeJ+QlV/5KN0vNJlGFLyvZVAvprMKctgOUcuXOShz3a7pg1ESffo604v2evRH5N47DroBUA9WhmYltXPsJRV2aElG9gLwbd6RwE4+n2G+K5emBvjla/m7829A7vb8B6wL7tWGiOK1DUJfTsneWnf/0ZStRNwZwmFgMRX5HdktuQKTrlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i6MPUO2opkJuD7pzLnngXterlxzxIXis5yXQ2FZu4rk=;
 b=fTgh0Bbj082Y3XjAk32T3fqP0709MRUizwz69eDe5J3Lgir6Z7hYVxUHiDxN8WpMMdXrVScoReCht4GjgIfNxQ7pkXWOuA0By9/WCzlRZdN4CotfBjT4TT9vTKVxjPOK01NuWurzINfh2k7mbHZFECQ8f6xEiLEw+7O5HYk3LMo=
Received: from PH0PR04MB7158.namprd04.prod.outlook.com (2603:10b6:510:8::18)
 by DM6PR04MB4076.namprd04.prod.outlook.com (2603:10b6:5:b8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Fri, 9 Sep
 2022 09:12:11 +0000
Received: from PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::c839:6239:54ad:fc30]) by PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::c839:6239:54ad:fc30%7]) with mapi id 15.20.5612.020; Fri, 9 Sep 2022
 09:12:11 +0000
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: "kbusch@kernel.org" <kbusch@kernel.org>, "its@irrelevant.dk"
 <its@irrelevant.dk>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH] hw/nvme: remove param zoned.auto_transition
Thread-Topic: [PATCH] hw/nvme: remove param zoned.auto_transition
Thread-Index: AQHYrjruo39gL04Z/UuDQ/Chf5WDQ63W/AUA
Date: Fri, 9 Sep 2022 09:12:11 +0000
Message-ID: <YxsDahQ+K2uxlZdG@x1-carbon>
References: <20220812110137.1011659-1-niklas.cassel@wdc.com>
In-Reply-To: <20220812110137.1011659-1-niklas.cassel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR04MB7158:EE_|DM6PR04MB4076:EE_
x-ms-office365-filtering-correlation-id: 55b7eed2-a9fb-4b01-6d69-08da924360fd
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gXnn6rXes1MfLn1xji/sxFlgVkMFZO1Eq8GMd5LWFIlOV6M1BNhf0xAgf45Yw5NZTW9CKGVSxLOrMiYLY62blNRTI9ULLzcIu1NXmaxeY3wHnf6gmhjym4S7DtlijQXUKgpG/tkzDpNneLtvxmcT+Mz3eGfmvIXZGcZRluXrHg6DA4z37n47Z7ZnW5/1NYhEoKrYg8dM7VnMkxt3XAUVu26RMQV7ProNMNSBE11QwQVfcKh7SYeeg3UKrkg3MkoaeO6Qr4VsD78vtgfNbznObbTOXO4g5rfcp64vWhftDawJVOgFYoxOTV6mpEPVkBs6QoeOcMzP7XAfqygK+htJhD5iuInI5OTylPC2MXjt4iNi2I7/R6uyC3LrLT4gViWYKUYekgrwat+YhyWkHhQf1iHSwNQdy4g7hCOs2al9Z3wXhQa5z0/eOo8mgcCcNY0NF8NWAIXTD0srkk2uSQLUOQf/+E3K4WqxvhTCdrstiTv6s9/enASFjAsqS6el5JmRkgWtNDv8vo5FCAg5aj63w5peo05ulJeqVgv5VqRWTkMjYqBhrSzrpncJKKtXYfWA8RqvBy4Scfmemu9PJfDjxhlbQYOUbQl+DSTQCOocGu5PEdF24GPvJSitK+86Ml20P5+aREEgjI8m18sOKX6gU5aP+U+iRagGuUjjeji6sjTyX2LFQMYJOXwTHgVHE5j1fSXNLrPiTREESjK6mCwQLeRq7yjtrHVjKuZT8ZadZLYcKvZDVcblF++WUVqs4U9jJaz3w/7DRV64KXgBRapveSQlYckx4NdAYmeH6UERP2A=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7158.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(7916004)(376002)(396003)(346002)(39860400002)(136003)(366004)(66556008)(83380400001)(82960400001)(38100700002)(186003)(86362001)(38070700005)(8936002)(122000001)(6512007)(5660300002)(76116006)(66946007)(66476007)(8676002)(33716001)(64756008)(91956017)(66446008)(26005)(6506007)(41300700001)(2906002)(478600001)(6486002)(9686003)(71200400001)(110136005)(316002)(67856001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?elJ4Lzg4a2owelZGMEFTTE1MSG5Ud0toNzRTOVREODBqeDhpZXBGdCtDRkFz?=
 =?utf-8?B?eDZYTk9sbWlxN0JXbnRqMWptUlZacktBZ0E3WXVWZEZDNjdyaGl5QkZISDNo?=
 =?utf-8?B?Z0FUa01oVXp3VjFaeGo5Mm1WYUFVNlRmUnAwbEtuUWVCUjJUcUJUWm9nOXBz?=
 =?utf-8?B?bWMzNXN4em44ZVNNTkRMTlZMdFhlWkpmNHBBcVlnQWJJb3RMQkNWZXB1UEdu?=
 =?utf-8?B?NkU4UG53dXJ1eHFSVTZwdEdhczkwZ1dQSUVvQzNneG9FRFZYTlBnTUk4ZWcv?=
 =?utf-8?B?dFIwL0pneVEzZjh5Mm9DaEovVStxQ250OU96SGRKbllxamhPWmIrdlFlTTRh?=
 =?utf-8?B?MHh6QzJyNWxPMWJpTDRZa2FuM2tTMnNmeXBGZ1ZMaXoyZFBGbHN5QmRiYk16?=
 =?utf-8?B?VFVPZGw1RmxzMVh6SFBuampYVEw1OE1qZXhVb1d2ZE04M1ZYUllsd3ZpcEwx?=
 =?utf-8?B?OUcrd081ekRxaWNsc1RjT1NPVy9xTlh1NGRCbm4rcjlVTFFlVmlHQ2QvanhQ?=
 =?utf-8?B?bUZGTFgxMTZKMzdqNm5EQzFHUThOUTZoS043TFExL3MrWStZNHRLTWxnSFZm?=
 =?utf-8?B?N3JGVVl6RmNFY1dtcjlYYUpJTnFKVWNuWjFYRk1GYnV3Q0xFVit2QjZRUjFZ?=
 =?utf-8?B?aWQzMFlnRFJJVE9uZzRiQ3E2dDhFbm9OaHgyWjh0WWJrOU5NV0xxWWZHUnM0?=
 =?utf-8?B?ZGVTZWRLdHRHajErZVplZG5JSko2VE04U0F4ckFFRXhNZGl4UkRrb2U1dW1Y?=
 =?utf-8?B?dTVpVnAzOGs2UnBzeC8yS25pQlp4V2xadFNQYnV2WDdLb0M5MGgzcklJT0lK?=
 =?utf-8?B?OFBRM2pTZ3FOSTNZT3Ayb3hqUzVZMnZzbFBBUWpYSGdyZTNCUlRJTFkvbzdr?=
 =?utf-8?B?V1VIbVB4aFI4UGw2U0ppbTdsZlJUU2hJcW5qODUzRGZxaEVMUUxDTlA1a3M0?=
 =?utf-8?B?OUNnUWhtSGs3d2JNNktVZVhkQzFFMlBDWTJBa2Vxbk1tVXpxYlM3RkhtOGVP?=
 =?utf-8?B?TTNhSm1ldEhOZDhRQnF0Y21iTWZDZkVtNkRwbzA2cmtMWWsybEhLSDAzYURt?=
 =?utf-8?B?S2tYWFR3RTlwY0xVdjRiZ1krZHpwcGsrd0dIS2JQQnNrQmRrb29abCtGNVds?=
 =?utf-8?B?YUZ6R003d3l5ZlIzbUlHa0pDRTFmM3MzTmJYMmZMWlJpRElNcnJRQThjUFMx?=
 =?utf-8?B?eC9kNm4rUU81c3FOSXBIOTFGUjdDNkw1N2M5TGRxTGt0bGh2SzZUZldzd3k2?=
 =?utf-8?B?Lzc0Rno4ZjZGSEpaZFR4UVdicHZXNG1YNHNKbVVxUVpPSUgzRWZQRkI4a295?=
 =?utf-8?B?VWxIYTd0dGtXbFBjcEhiamJqWnk3a2cySHQ3WnlLUjlFOW9aUDRlVnIzTDI4?=
 =?utf-8?B?Q3U0dlJmL1FyZDdzSWhnRnEzL1p4RDVUTEJZVFQxaVZCcEhWL3N0N05CbEVE?=
 =?utf-8?B?T0I3Z3h2dExpUlFZTXM4d1VWOTVaSUFyanUybitFdDRCcXo0bXQyYUk3cnRa?=
 =?utf-8?B?d2NpNTdoU29YR2IwVnFFemdYOExGWGhJYXNSb2JwVXhUa3Izem5lRE52TVNG?=
 =?utf-8?B?L2JoaGU2NGRxeUJhT09ISVFkWnVPQzNDS0E2TkJFWmdLbWxUd1pESnJUbnFz?=
 =?utf-8?B?b2ZTd2pmNnZvTXBhVG5Gck14VHo2UkJ2N292YjhrMHBLQzEvM1Fkb0xzYUoy?=
 =?utf-8?B?ZDZMODF1UDJkV05xWUhhdkgwbkdMTzY0eDNXRHIyMVN0MG5keXFDYmJjbXZO?=
 =?utf-8?B?Qms2TDN4Y3dpckJKL3p1S3lnV2I0a2pKMU92dERXdlB3Z2I3Z0NDSDkzSTd6?=
 =?utf-8?B?QUZZWWwvb293K1FER3U4UzZCMWRKUjhKYVhvdm5uUTBFT202UnN6L1BYcDBY?=
 =?utf-8?B?UjBpdHNWSjhpcnJMeVNjOWJReHFaSko3eTVzdjFrMXRWMUN2NlF4WlllN2pk?=
 =?utf-8?B?N0tKYXNHMjJZSGJQcmRmbnZTVm1td0V0QjJTeWgwYng0Z1BMWHoxSzlrL3dt?=
 =?utf-8?B?YVFPREZlbU5QZTdvSHdWcXNLd2VXMDdRdS9wdmM2dWZoRE1Td3hBcFB1WTkz?=
 =?utf-8?B?WCtPOVFZMEo2d292NzVRUkZmUkhBODNMcHlXcEVGZWR3R3l5NFFXa0lBNktq?=
 =?utf-8?B?ZEVLbmVReWVmVEp3TzQ5eDM0NDlRUGNlYVBDd1FJRk01U1ZXQ3N5eU43UU1L?=
 =?utf-8?B?L1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <30978EC13CA5F642837F80FDAA27A0D4@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7158.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55b7eed2-a9fb-4b01-6d69-08da924360fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2022 09:12:11.3407 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SJR/hpGwAV7SUzn9gv7tEvwpuCTtv7FHRfljb6N/n/xnZNAOUodozsLcqTAEO0aMmclCgULhMC+3nGGYf+Y1Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4076
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=244fa2c59=Niklas.Cassel@wdc.com; helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gRnJpLCBBdWcgMTIsIDIwMjIgYXQgMDE6MDE6MzdQTSArMDIwMCwgTmlrbGFzIENhc3NlbCB3
cm90ZToNCj4gVGhlIGludGVudGlvbiBvZiB0aGUgWm9uZWQgTmFtZXNwYWNlIENvbW1hbmQgU2V0
IFNwZWNpZmljYXRpb24gd2FzDQo+IG5ldmVyIHRvIG1ha2UgYW4gYXV0b21hdGljIHpvbmUgdHJh
bnNpdGlvbiBvcHRpb25hbC4NCj4gDQo+IEV4Y2VycHQgZnJvbSB0aGUgbnZtZXhwcmVzcy5vcmcg
em5zIG1haWxpbmcgbGlzdDoNCj4gIiIiDQo+IEEgcXVlc3Rpb24gY2FtZSB1cCBpbnRlcm5hbGx5
IG9uIHRoZSBkaWZmZXJlbmNlcyBiZXR3ZWVuIFpOUyBhbmQgWkFDL1pCQw0KPiB0aGF0IGFza2Vk
IGFib3V0IHdoZW4gYSBjb250cm9sbGVyIHNob3VsZCB0cmFuc2l0aW9ucyBhIHNwZWNpZmljIHpv
bmUgaW4NCj4gdGhlIEltcGxpY2l0bHkgT3BlbmVkIHN0YXRlIHRvIENsb3NlZCBzdGF0ZS4NCj4g
DQo+IEZvciBleGFtcGxlLCBjb25zaWRlciBhIFpOUyBTU0QgdGhhdCBzdXBwb3J0cyBhIG1heCBv
ZiAyMCBhY3RpdmUgem9uZXMsDQo+IGFuZCBhIG1heCBvZiAxMCBvcGVuIHpvbmVzLCB3aGljaCBo
YXMgdGhlIGZvbGxvd2luZyBhY3Rpb25zIG9jY3VyOg0KPiANCj4gRmlyc3QsIHRoZSBob3N0IHdy
aXRlcyB0byB0ZW4gZW1wdHkgem9uZXMsIHRoZXJlYnkgdHJhbnNpdGlvbmluZyAxMCB6b25lcw0K
PiB0byB0aGUgSW1wbGljaXRseSBPcGVuZWQgc3RhdGUuDQo+IA0KPiBTZWNvbmQsIHRoZSBob3N0
IGlzc3VlcyBhIHdyaXRlIHRvIGFuIDExdGggZW1wdHkgem9uZS4NCj4gDQo+IEdpdmVuIHRoYXQg
c3RhdGUsIG15IHVuZGVyc3RhbmRpbmcgb2YgdGhlIHNlY29uZCBwYXJ0IGlzIHRoYXQgdGhlIFpO
UyBTU0QNCj4gY2hvb3NlcyBvbmUgb2YgdGhlIHByZXZpb3VzbHkgMTAgem9uZXMsIGFuZCB0cmFu
c2l0aW9uIHRoZSBjaG9zZW4gem9uZSB0bw0KPiB0aGUgQ2xvc2VkIHN0YXRlLCBhbmQgdGhlbiBw
cm9jZWVkcyB0byB3cml0ZSB0byB0aGUgbmV3IHpvbmUgd2hpY2ggYWxzbw0KPiBpbXBsaWNpdGx5
IHRyYW5zaXRpb24gaXQgZnJvbSB0aGUgRW1wdHkgc3RhdGUgdG8gdGhlIEltcGwuIE9wZW4gc3Rh
dGUuDQo+IEFmdGVyIHRoaXMsIHRoZXJlIHdvdWxkIGJlIDExIGFjdGl2ZSB6b25lcyBpbiB0b3Rh
bCwgMTAgaW4gaW1wbC4gT3Blbg0KPiBzdGF0ZSwgYW5kIG9uZSBpbiBjbG9zZWQgc3RhdGUuDQo+
IA0KPiBUaGUgYWJvdmUgYXNzdW1lcyB0aGF0IGEgWk5TIFNTRCB3aWxsIGFsd2F5cyB0cmFuc2l0
aW9uIGFuIGltcGxpY2l0bHkNCj4gb3BlbmVkIHpvbmUgdG8gY2xvc2VkIHN0YXRlIHdoZW4gcmVx
dWlyZWQgdG8gZnJlZSB1cCByZXNvdXJjZXMgd2hlbg0KPiBhbm90aGVyIHpvbmUgaXMgb3BlbmVk
LiBIb3dldmVyLCBpdCBpc27igJl0IHN0cmljdGx5IHNhaWQgaW4gdGhlIFpOUyBzcGVjLg0KPiAN
Cj4gVGhlIHBhcmFncmFwaCB0aGF0IHNob3VsZCBjb3ZlciBpdCBpcyBkZWZpbmVkIGluIHNlY3Rp
b24NCj4gMi4xLjEuNC4xIOKAkyBNYW5hZ2luZyBSZXNvdXJjZXM6DQo+IFRoZSBjb250cm9sbGVy
IG1heSB0cmFuc2l0aW9uIHpvbmVzIGluIHRoZSBaU0lPOkltcGxpY2l0bHkgT3BlbmVkIHN0YXRl
DQo+IHRvIHRoZSBaU0M6Q2xvc2VkIHN0YXRlIGZvciByZXNvdXJjZSBtYW5hZ2VtZW50IHB1cnBv
c2VzLg0KPiANCj4gSG93ZXZlciwgaXQgZG9lc27igJl0IHNheSDigJx3aGVu4oCdIGl0IHNob3Vs
ZCBvY2N1ci4gVGh1cywgYXMgdGhlIHRleHQgc3RhbmQsDQo+IGl0IGNvdWxkIGJlIG1pc2ludGVy
cHJldGVkIHRoYXQgdGhlIGNvbnRyb2xsZXIgc2hvdWxkbuKAmXQgZG8gY2xvc2UgYSB6b25lDQo+
IHRvIG1ha2Ugcm9vbSBmb3IgYSBuZXcgem9uZS4gVGhlIGlzc3VlIHdpdGggdGhpcywgaXMgdGhh
dCBpdCBtYWtlcyB0aGUNCj4gcG9pbnQgb2YgaGF2aW5nIGltcGxpY2l0bHkgbWFuYWdlZCB6b25l
cyBtb290Lg0KPiANCj4gVGhlIFpBQy9aQkMgc3BlY3MgaXMgbW9yZSBzcGVjaWZpYyBhbmQgY2xh
cmlmaWVzIHdoZW4gYSB6b25lIHNob3VsZCBiZQ0KPiBjbG9zZWQuIEkgdGhpbmsgaXQgd291bGQg
YmUgbmF0dXJhbCB0byB0aGUgc2FtZSBoZXJlLg0KPiAiIiINCj4gDQo+IFdoaWxlIHRoZSBab25l
ZCBOYW1lc3BhY2UgQ29tbWFuZCBTZXQgU3BlY2lmaWNhdGlvbiBoYXNuJ3QgcmVjZWl2ZWQgYW4N
Cj4gZXJyYXRhIHlldCwgaXQgaXMgcXVpdGUgY2xlYXIgdGhhdCB0aGUgaW50ZW50aW9uIHdhcyB0
aGF0IGFuIGF1dG9tYXRpYw0KPiB6b25lIHRyYW5zaXRpb24gd2FzIG5ldmVyIHN1cHBvc2VkIHRv
IGJlIG9wdGlvbmFsLCBhcyB0aGVuIHRoZSB3aG9sZQ0KPiBwb2ludCBvZiBoYXZpbmcgaW1wbGlj
dGx5IG9wZW4gem9uZXMgd291bGQgYmUgcG9pbnRsZXNzLiBUaGVyZWZvcmUsDQo+IHJlbW92ZSB0
aGUgcGFyYW0gem9uZWQuYXV0b190cmFuc2l0aW9uLCBhcyB0aGlzIHdhcyBuZXZlciBzdXBwb3Nl
ZCB0bw0KPiBiZSBjb250cm9sbGVyIGltcGxlbWVudGF0aW9uIHNwZWNpZmljLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogTmlrbGFzIENhc3NlbCA8bmlrbGFzLmNhc3NlbEB3ZGMuY29tPg0KPiAtLS0N
Cg0KR2VudGxlIHBpbmcuDQoNCg0KS2luZCByZWdhcmRzLA0KTmlrbGFz

