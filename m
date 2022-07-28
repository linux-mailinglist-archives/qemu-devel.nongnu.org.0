Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DABC658383B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 07:48:17 +0200 (CEST)
Received: from localhost ([::1]:39162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGwNb-0006x8-Ga
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 01:48:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elic@nvidia.com>) id 1oGwFF-0003cl-1Y
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 01:39:39 -0400
Received: from mail-sn1anam02on2045.outbound.protection.outlook.com
 ([40.107.96.45]:15956 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elic@nvidia.com>) id 1oGwFB-0006bQ-PC
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 01:39:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kwukzjqcE9Fwjp4wKcAOiANKVT9GNeXVr06AcyHtlBstj33kHoukyKGRVv7Us9/UA8GjXb1KgIavgATAjlE5hVs1TCEseqnRqGLALEoACzpfoYZ4jEFlKiiX+JqyJVhvn3i8bO91tZ3B1pmHJwP2unQBMWWBB7sHtPz8ebxYPiJT1H1GR3zCCVd5TEqkHT3e2Q7R41YoppjaNVKWAfKTtDH5RBxjlIpZ1QAqAvyeqZp4Zxoj4pRYgsQioC7yHMK8FfYDnYx/LH5HxKWToJD4ete59N6Qun8HRqwdkvpi9uFqn6qdtqK9BVvXuVMmeBKZTBR0z6wEI/k6ioEVpws/hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CYqgbzsXZt1knYs2yEmBb9g5sLDkWQ5WnSz5q0RRcQ8=;
 b=QZEUZz6RzjdTmHEXoLZyiyFkvBXk4TL+9bj/l+duOGOJtD0JzuBoZKZuB7aIN8HZyuSqdNVKnT73ipTeR5QsUvc3rdRMa/uV/1dmaMltq+7ukCIxS9UhnDbCbfSZmIwtOWknoZ7fl3GfPwaZdDMvWVYeQUlTuBwuPfzw7iIuGdwHtQWZ7rEWW5Q8NC1rdFJD82ZDPJ0PoAP0/Ecp9WaHTK3ksBiM53K3gSnNzLNaQGP9fstlC90Xu5BxEWM/nYcIdvDTfnohd9fIdiCW28vIG+P+3Ng2Xbe6lroNncHbPsqgAwm1CaVZ7y0hm+D1TOl0HOFIqHXKZXNMnHticoU3Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CYqgbzsXZt1knYs2yEmBb9g5sLDkWQ5WnSz5q0RRcQ8=;
 b=XhdarQHamCYX3qnLG5hHIZL3TVUymMMx0HwdJbhsnYb0H0c6cLTQ5T1LGYJio3P6G4HeUIMOCm/tP/1sB5cXub/vFbRf3+eCJdt+OrEOtbmAfyV0BfjP6cFWr2pnBjap6cjAVR+9htPZMK7b7dhevJCkv4qdZkUZj1V4czlxeiWuXExJJMdkkKEK/5AU6o8Mnd1AR0D9rW536begwLRJrSugW/tZdxJCGfIMmmA6FLvke9yyY3cvbW+6ZenBSatLoi5yTyIwhSXECeuuNK5rhw3++1W/CgElaWZlc0HVrZrYdcNfrozXTbULyuZy7nRhdFd8aJvi3Uu1GRgfZdKHhQ==
Received: from DM8PR12MB5400.namprd12.prod.outlook.com (2603:10b6:8:3b::12) by
 MW6PR12MB7069.namprd12.prod.outlook.com (2603:10b6:303:238::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Thu, 28 Jul
 2022 05:39:27 +0000
Received: from DM8PR12MB5400.namprd12.prod.outlook.com
 ([fe80::54d4:93f6:1cfa:948a]) by DM8PR12MB5400.namprd12.prod.outlook.com
 ([fe80::54d4:93f6:1cfa:948a%4]) with mapi id 15.20.5482.006; Thu, 28 Jul 2022
 05:39:27 +0000
From: Eli Cohen <elic@nvidia.com>
To: Jason Wang <jasowang@redhat.com>
CC: Eugenio Perez Martin <eperezma@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
Subject: RE: VIRTIO_NET_F_MTU not negotiated
Thread-Topic: VIRTIO_NET_F_MTU not negotiated
Thread-Index: AdibctjDcRi2EWKMSzmmrEX7B4yyOAAAkbGAAAAkGdAAAGTyoAAB7gYAACC7v/AAAsI8gAAAarJAAAVbDgABV8vWUAAo8zOAAAcmxcA=
Date: Thu, 28 Jul 2022 05:39:27 +0000
Message-ID: <DM8PR12MB5400DBF0BFFF104940BB4A45AB969@DM8PR12MB5400.namprd12.prod.outlook.com>
References: <DM8PR12MB5400869D5921E28CE2DC7263AB8F9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <20220719093841-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5400F967A710B1151AD5132CAB8F9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <DM8PR12MB5400AB08EE51E6BF05EEBDE2AB8F9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CAJaqyWc0M4O8Rr2jR4L_myPd_VmxkYjHTnwdxQFAf3N_hZw_3g@mail.gmail.com>
 <DM8PR12MB540033DA1293BA23E29148EAAB8E9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CAJaqyWfOS9nCBNeborhTdOXAnmZX9XwRF=2E0aphuHbqr352CA@mail.gmail.com>
 <DM8PR12MB54005AB1DE4617493645D2CBAB8E9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CAJaqyWczrvaaookrQE5=6mTABS-VmJKF6iY+aO3ZD8OB4FumRA@mail.gmail.com>
 <DM8PR12MB54001D7DFB29EF048CCD04CCAB979@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CACGkMEtDu9D2ovmWkKEuxqg5POqvMgYNK1_MHWCGMYOG7_t7Qg@mail.gmail.com>
In-Reply-To: <CACGkMEtDu9D2ovmWkKEuxqg5POqvMgYNK1_MHWCGMYOG7_t7Qg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45a2e83c-6a9b-4b90-4ea2-08da705b898b
x-ms-traffictypediagnostic: MW6PR12MB7069:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KL9ApODyEPKfUHRLbG899uvHhjh6rIGkvCfsZEjeHzyzSzhXziTS9bLFC4yZ93EFyMZtf1/tM07zGIx8vR8YPCL1Pj4AkSIUVSqySR6ULvBAaHyekPSyEAkQJzhauU6vpZ486zrtG79jjSOwhbCQPgGSt+Qd8Qa9toxPkkff4JDmlUAgsZcWtD/dVWRPgZRfTtZSDfKqDNWluUw1mM8AjsqVOKritKo32mJgyqq0C+Hr2nJgOyXzhzU0kw8MCnI4vc1Exh60JXdqXFlXNvB1lijst+ex8Y6wnzPh8oa6QfK9l724fFgSrUOWAqQE++gZuUuG25rMA2EoMTWHZNFZhANjmGZtwfW1EuCzQMm1hRmE3LkDnLGWgBLTFt0FBN3jgI0RWgtQxp055YKoE8OFMUUGUvezwC17lbG8VG+4MMrkcgDOdKmY8AAnRixagQb9Q9KuIlffbAiylpPnSW9lDlRWRXOR10admGk0WkZbTIDL9Zo3on31gk7ATPdSi3fJEFokCgqoBuWG8kvyh0g5zCsUxG9g8L2FTOxmvcKEAqOOZAUX69bGM8lXZF6nvu6Es/IIMY42RzQ7/gQnosHW4EFNp9be34TAtH+go6z4czjS/+5D+veNkEu8vseV6FFR+12JnJmw59wLfbVqjFlWey0aFf5tytTNVLu2pcLD1dZipPoPLIryOEzrJqvcOeWN4snKqEwZg8kDibxWbgaTRllPGjLzxblf25jFH3AHKgq1J4F/CRyyY3uAGAzIE6u+xKSfy+ojIyaMJ2osfWxp5aDVhOrwSpx1mT1wjkGBLaHdVA2/hmNzgkRljz/tBLxt
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR12MB5400.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(366004)(39860400002)(136003)(376002)(41300700001)(64756008)(8676002)(4326008)(66476007)(2906002)(66556008)(76116006)(38100700002)(66946007)(66446008)(478600001)(55016003)(8936002)(52536014)(33656002)(5660300002)(71200400001)(7116003)(6916009)(54906003)(122000001)(316002)(186003)(6506007)(7696005)(83380400001)(86362001)(53546011)(26005)(9686003)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WHhhdzBwaWZITTM2MFhiblVFdHUrazVEVXN5ZDVabFN0aUM5MU55TTdVTGxI?=
 =?utf-8?B?Vyt6WFNyclJZWFVjc3FMQTJpR0R3MU5rQ1IrVEtUQ3VtU3BDR0lIS1hBSzg5?=
 =?utf-8?B?VVAxUWUyeFBjTiszOExIbEdXcDY2N1dacExYbE40eU1nMGgvSVM2ZytCRDEr?=
 =?utf-8?B?TEtDdmc3UU5FYk9OWk5qRjRxNFd6UXlFWTQzNnEzZHZzbmlldEVwWTh0L1R2?=
 =?utf-8?B?L0JsWG1UV0ZRS1NnYjlGcUVCOWtnUENLK1NxUS9vN01yMnlRakFCZkVtaGxo?=
 =?utf-8?B?Uk51K2NjSnBYNExha0VONCtZRXZNYjJFdlFRTTRPOWxkSGRYZHVsaUJhZHBV?=
 =?utf-8?B?MnhwTm5hZm5kTnNCMU15aTZhZDlkV05KYTJkMWVybzRBei9hY3R1MmJ5UDBC?=
 =?utf-8?B?a0QxQWhtNDdGQ2Q0dXNFUGh0MDM1NVgyVUx0K2RCNHNFQmUxbU02MG45eVl5?=
 =?utf-8?B?bG5HODR5dFJ5SG95TTBJYWRsaGtBZ1VWVFVPdnRGRExnVno1VnZNMUE0a1Ri?=
 =?utf-8?B?SS9hd0Z4NkREbHNUWUhlL3VRbFBGWGFLajdzWVJ5SGt1eGdxY040V2tIUFZB?=
 =?utf-8?B?THZvUUtmSlV2VFFTelJKSk80bEUyT1dFdm5OVXE3Q1dSNDhSOFQ3U1BUVFZI?=
 =?utf-8?B?Z3pLQjZJNzBtYWZ2bGlnTnpLSjl1bWY1WGxKODRFNGVNd0p0NWttM0Q5Tlhp?=
 =?utf-8?B?RFVrbTZGSW5EUTJkWDZBTlJXeXpkZGhXZjROZFhPSDRSUEhJdEoxbDRWTXlo?=
 =?utf-8?B?WGJ4Ly9QeGRXY1Jkb2d0dUdSS1U2Y09iZnB5akRvcVJsT0NZVXFhUENPYTJH?=
 =?utf-8?B?N1hra3dnTWJiQ1dHdmZYQnZNVFpLYm9aTE5rRWZPQjNScFdMUTJ1TTA1SWtR?=
 =?utf-8?B?dE9FaWRPSUZ1V2l2Vy9LU1Z2ZGVzblUxWEZXdUJsVUZhWnBQM25ick5FSXdF?=
 =?utf-8?B?QmJ0b1ZFRDNqcGdacXcyRHJaR0tiZjVtblRtNDVObVVzMEpZRkdCbmNYcWVK?=
 =?utf-8?B?RGg4bmlhNjZGTm9MTlEyNk4zT2FqYlVQaDZCWGN5Q2p0bnV0WFUzdXhobjk3?=
 =?utf-8?B?MzlDa3NLRDJ0WWlZeWNNYzhPSkRsbHlkT3pCNmtwd0MvUXgrQWpTK0kyb2Rm?=
 =?utf-8?B?bXFWdFVLNTJnaThQT0VVY2ZnTTZkWXExblcweWluYnprbXlleEdKNXF4Witq?=
 =?utf-8?B?UzBBMUpVMGx6UzU0d0szSnU1eE1ZYm5uamgrNVZydjBkTGRINXQyelJ0WnN4?=
 =?utf-8?B?d3Ira3JMbnRxK3g3Q3YrVitwMWVqWnZZeVdjV2twSXQySmU3ZkZWcWRJUVBl?=
 =?utf-8?B?YzlMNnZpK2hOQXZFYVJkWkpnUWs2ZVVQSmg4NTVJRnE3d0lra1NxM1FrQ0s3?=
 =?utf-8?B?eHZ0czdaZGJoVG40cTYvZlExc21DSUZVTldZU0Y5VWc1VjhBOWNvN0NiemJa?=
 =?utf-8?B?dmdzRElPcGFjUFJJWTN2S2NQSGZEMzNpM0NlZWxOQnV5TDJ0Y1FMUDVxVFJU?=
 =?utf-8?B?MWcrUG14OVhyTU5TaFVKZ2pWck9vTk9xR2NqZHN6M2N6YzZFSjVEM2doVEJR?=
 =?utf-8?B?eWFRNzBzWVk2ZjZaRE4vTFNMUWFXSWFnNGFFajNreVQ3NE15UnE1NG1NNU5H?=
 =?utf-8?B?ZWE3THZNaXBXQmhkTno3dm9ibVpkNzZVK25DNWNrVTJkUzFBZHJVL3J3cmsw?=
 =?utf-8?B?Q21wNGRzaWNxMTdUSnVhRU9HcFRnaGtWeHBsQ29sMlNOZ0tzY3ZQM0pSbi9o?=
 =?utf-8?B?dkxSUHYxa3k5UHAvQVRMTFk1MUpPMnhrVkN4VkdyS1VjclpoMlgra3JlRTNY?=
 =?utf-8?B?MXdWTmw4bmgzeHpVOVJpS2ZyUE4rQVo1Z0lpRC9SUlZTelFFWFFudlhDVnI1?=
 =?utf-8?B?RDNiTi9nc2tSVE1DemZ5Zi9QYnU2cmNFa1IyU0lqZDdFTnMwWEZrVFJLd2tv?=
 =?utf-8?B?azdBTnQyQzM1NUpJUjRFa2RRTmR5cENacit0L0NBZ2UxUnJZd0NzTUVoVHJ0?=
 =?utf-8?B?MXZPem5oRGU4QkZ1K21vQ2ZicVVHbm0raTJlSFlHWTlVNDhvck1ZL0tkU3I5?=
 =?utf-8?B?MzZhVzFpNXhhTFVScUorNk5UMnRqclliY2tJN2RzczdyNG16eWVZUTNaVlNG?=
 =?utf-8?Q?OR0A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5400.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45a2e83c-6a9b-4b90-4ea2-08da705b898b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2022 05:39:27.7976 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PdjZFh5XJ2jmVTJPMZ8plVp+stMiZXm661Rj463Wo2dSIpLNr6jyo4sUZzJmHlTp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7069
Received-SPF: softfail client-ip=40.107.96.45; envelope-from=elic@nvidia.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

PiBGcm9tOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPg0KPiBTZW50OiBUaHVyc2Rh
eSwgSnVseSAyOCwgMjAyMiA1OjA5IEFNDQo+IFRvOiBFbGkgQ29oZW4gPGVsaWNAbnZpZGlhLmNv
bT4NCj4gQ2M6IEV1Z2VuaW8gUGVyZXogTWFydGluIDxlcGVyZXptYUByZWRoYXQuY29tPjsgcWVt
dS1kZXZlbEBub25nbnUub3JnOyBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPjsN
Cj4gdmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcNCj4gU3ViamVjdDog
UmU6IFZJUlRJT19ORVRfRl9NVFUgbm90IG5lZ290aWF0ZWQNCj4gDQo+IE9uIFdlZCwgSnVsIDI3
LCAyMDIyIGF0IDI6NTIgUE0gRWxpIENvaGVuIDxlbGljQG52aWRpYS5jb20+IHdyb3RlOg0KPiA+
DQo+ID4gSSBmb3VuZCBvdXQgdGhhdCB0aGUgcmVhc29uIHdoeSBJIGNvdWxkIG5vdCBlbmZvcmNl
IHRoZSBtdHUgc3RlbXMgZnJvbSB0aGUgZmFjdCB0aGF0IEkgZGlkIG5vdCBjb25maWd1cmUgbWF4
IG10dSBmb3IgdGhlIG5ldCBkZXZpY2UNCj4gKGUuZy4gdGhyb3VnaCBsaWJ2aXJ0IDxtdHUgc2l6
ZT0iOTAwMCIvPikuDQo+ID4gTGlidmlydCBkb2VzIG5vdCBhbGxvdyB0aGlzIGNvbmZpZ3VyYXRp
b24gZm9yIHZkcGEgZGV2aWNlcyBhbmQgcHJvYmFibHkgZm9yIGEgcmVhc29uLiBUaGUgdmRwYSBi
YWNrZW5kIGRyaXZlciBoYXMgdGhlIGZyZWVkb20gdG8gZG8NCj4gaXQgdXNpbmcgaXRzIGNvcHkg
b2YgdmlydGlvX25ldF9jb25maWcuDQo+ID4NCj4gPiBUaGUgY29kZSBpbiBxZW11IHRoYXQgaXMg
cmVzcG9uc2libGUgdG8gYWxsb3cgdG8gY29uc2lkZXIgdGhlIGRldmljZSBNVFUgcmVzdHJpY3Rp
b24gaXMgaGVyZToNCj4gPg0KPiA+IHN0YXRpYyB2b2lkIHZpcnRpb19uZXRfZGV2aWNlX3JlYWxp
emUoRGV2aWNlU3RhdGUgKmRldiwgRXJyb3IgKiplcnJwKQ0KPiA+IHsNCj4gPiAgICAgVmlydElP
RGV2aWNlICp2ZGV2ID0gVklSVElPX0RFVklDRShkZXYpOw0KPiA+ICAgICBWaXJ0SU9OZXQgKm4g
PSBWSVJUSU9fTkVUKGRldik7DQo+ID4gICAgIE5ldENsaWVudFN0YXRlICpuYzsNCj4gPiAgICAg
aW50IGk7DQo+ID4NCj4gPiAgICAgaWYgKG4tPm5ldF9jb25mLm10dSkgew0KPiA+ICAgICAgICAg
bi0+aG9zdF9mZWF0dXJlcyB8PSAoMVVMTCA8PCBWSVJUSU9fTkVUX0ZfTVRVKTsNCj4gPiAgICAg
fQ0KPiA+DQo+ID4gVGhlIGFib3ZlIGNvZGUgY2FuIGJlIGludGVycHJldGVkIGFzIGZvbGxvd3M6
DQo+ID4gaWYgdGhlIGNvbW1hbmQgbGluZSBhcmd1bWVudHMgb2YgcWVtdSBpbmRpY2F0ZXMgdGhh
dCBtdHUgc2hvdWxkIGJlIGxpbWl0ZWQsIHRoZW4gd2Ugd291bGQgcmVhZCB0aGlzIG10dSBsaW1p
dGF0aW9uIGZyb20gdGhlDQo+IGRldmljZSAodGhhdCBhY3R1YWwgdmFsdWUgaXMgaWdub3JlZCku
DQo+ID4NCj4gPiBJIHdvcmtlZCBhcm91bmQgdGhpcyBsaW1pdGF0aW9uIGJ5IHVuY29uZGl0aW9u
YWxseSBzZXR0aW5nIFZJUlRJT19ORVRfRl9NVFUgaW4gdGhlIGhvc3QgZmVhdHVyZXMuIEFzIHNh
aWQsIGl0IG9ubHkgaW5kaWNhdGVzIHRoYXQNCj4gd2Ugc2hvdWxkIHJlYWQgdGhlIGFjdHVhbCBs
aW1pdGF0aW9uIGZvciB0aGUgZGV2aWNlLg0KPiA+DQo+ID4gSWYgdGhpcyBtYWtlcyBzZW5zZSBJ
IGNhbiBzZW5kIGEgcGF0Y2ggdG8gZml4IHRoaXMuDQo+IA0KPiBJIHdvbmRlciB3aGV0aGVyIGl0
J3Mgd29ydGggdG8gYm90aGVyOg0KPiANCj4gMSkgbWdtdCAoYWJvdmUgbGlidmlydCkgc2hvdWxk
IGhhdmUgdGhlIGtub3dsZWRnZSB0byBwcmVwYXJlIHRoZSBjb3JyZWN0IFhNTA0KPiAyKSBpdCdz
IG5vdCBzcGVjaWZpYyB0byBNVFUsIHdlIGhhZCBvdGhlciBmZWF0dXJlcyB3b3JrIGxpa2UsIGZv
cg0KPiBleGFtcGxlLCB0aGUgbXVsdGlxdWV1ZT8NCj4gDQoNCg0KQ3VycmVudGx5IGxpYnZpcnQg
ZG9lcyBub3QgcmVjb2duaXplIHNldHRpbmcgdGhlIG10dSB0aHJvdWdoIFhNTCBmb3IgdmRwYSBk
ZXZpY2UuIFNvIHlvdSBtZWFuIHRoZSBmaXggc2hvdWxkIGdvIHRvIGxpYnZpcnQ/DQpGdXJ0aGVy
bW9yZSwgZXZlbiBpZiBsaWJ2aXJ0IHN1cHBvcnRzIE1UVSBjb25maWd1cmF0aW9uIGZvciBhIHZk
cGEgZGV2aWNlLCB0aGUgYWN0dWFsIHZhbHVlIHByb3ZpZGVkIHdpbGwgYmUgaWdub3JlZCBhbmQg
dGhlIGxpbWl0YXRpb24gd2lsbCBiZSB0YWtlbiBmcm9tIHdoYXQgdGhlIHZkcGEgZGV2aWNlIHB1
Ymxpc2hlZCBpbiBpdHMgdmlydGlvX25ldF9jb25maWcgc3RydWN0dXJlLiBUaGF0IG1ha2VzIHRo
ZSBYTUwgY29uZmlndXJhdGlvbiBiaW5hcnkuDQoNCj4gVGhhbmtzDQoNCg==

