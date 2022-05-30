Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07038537A03
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 13:37:46 +0200 (CEST)
Received: from localhost ([::1]:51438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvdiT-0006cI-1X
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 07:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=142e1760f=Damien.LeMoal@wdc.com>)
 id 1nvdY3-000831-5A; Mon, 30 May 2022 07:27:08 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:46204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=142e1760f=Damien.LeMoal@wdc.com>)
 id 1nvdXz-0001FS-Hf; Mon, 30 May 2022 07:26:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653910015; x=1685446015;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=yGtCnyrwznd7pJ8MnGGvu3WYzSZwr3GiV6rSkRt/KLg=;
 b=oAw8jPkWbmWw4z4IcusvMwNtb3UCj2YOlt+IvmdcVHGmPkk7pV/SBt7r
 HhEvOR4TjF+L4ntpFcZCNzoyF8Nb2YqOZxb+RDZagYvL2eFXCUGFtikSN
 3QT5QLk2YmZW4ZEez3Uhx1zIDevCl8LIVgh8QPtEQGrVz7sxZ14SiTCy2
 jaZaZ6sg0t6onuO9SRyrDxzLXSQVODXIRGDjpK6j37HMGGY4D6QOInsjS
 jZFE7xJp4QRGZIRF6VVgssoMeh+5XspUTqyqoLfmZRsfMfq6iXrQiBdIn
 0aYYDa8hLOyMW3S8rtgURjJAimnptjITQuf+bnqbM2u1vCpfaSnaBpAJC w==;
X-IronPort-AV: E=Sophos;i="5.91,262,1647273600"; d="scan'208";a="200557576"
Received: from mail-mw2nam08lp2176.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.176])
 by ob1.hgst.iphmx.com with ESMTP; 30 May 2022 19:26:50 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h1CLFvsVcdsCt8nDXQUh8pPNH6N0CScoLxn6cZr/VSE2Ei5uJQwDI6hAT7a4Q+A8FO4p8jjXHeffxPf1boaqBYsxwTKYPMVFZ8RyosQzLg32D4QyCvluuXXseFFJn1YmGZz29f8MbQs6KV98pUNMVeGdGBpH4DvVIN/4t0qiRuBeOmmf//JvAr3O9T+9CPEPoLDlWKY4B0+oT+dix01hlY9KEQQuHApCd5Ranb4s6mz627QJd8BYRDwc6sKfq6C75arJt22AQTV80LymvIgoYYOtXm6GNZqP3stjac0PN26/wDNNuIU9wHY3nhkphTv9TdZPT/0j/TnAkr+xWL3U0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yGtCnyrwznd7pJ8MnGGvu3WYzSZwr3GiV6rSkRt/KLg=;
 b=dZTRSewor4V2SP0Rx/vdZnWlpcFM7HmjZ3GhTfoTwKqJ3wEmXfYXK9DKt2T1aU3pn8H04vqWvtM5P7sIMISSsNIWeSmQqu981sF/CHLaQvNJEw+X23fodeENtl+P0HkcS7kxmzdAu2d0uhg6pCkpMh8LR/WEZUbTAaxPb42v1PhwgEinHMhqMptMg+1noZ2dZtzzNlKQdIYIgS/dTj6X0VjJgnvmFsYByChlKMDOxocEFTBBIK16SWUaWg8vc/AYix0WrqhjpN3pO5pZaoF5U/KrHduR2t+fUWQShAH6pBCTSd4O8CGsBaALBNQjKx9vwR1kRCe6qxo/XkrLPGW6Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yGtCnyrwznd7pJ8MnGGvu3WYzSZwr3GiV6rSkRt/KLg=;
 b=lRJiWOiUzbbbghsNOzvYcV/8QxUKw8h5Xh4rUJEu2GH6z0O1kI96CFqGie/35EnypHWUhmYe8yf0MBraAfH6s8UAHh1/U5100sCwVUyt24L1tQQqgCWAEkW/DxoAkc7K1uvCuaZhqohw46KaKVTQx3rj2M1ao1a1EgsyF4YskCQ=
Received: from DM6PR04MB7081.namprd04.prod.outlook.com (2603:10b6:5:244::21)
 by SJ0PR04MB7520.namprd04.prod.outlook.com (2603:10b6:a03:329::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 11:26:48 +0000
Received: from DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::b080:89a3:62e1:942d]) by DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::b080:89a3:62e1:942d%2]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 11:26:48 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
CC: Sam Li <faithilikerun@gmail.com>, Dmitry Fomichev
 <Dmitry.Fomichev@wdc.com>, Hannes Reinecke <hare@suse.de>, qemu-devel
 <qemu-devel@nongnu.org>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Subject: Re: Outreachy project task: Adding QEMU block layer APIs resembling
 Linux ZBD ioctls.
Thread-Topic: Outreachy project task: Adding QEMU block layer APIs resembling
 Linux ZBD ioctls.
Thread-Index: AQHYc+N680vCNb3LXEGqexiEqafJWQ==
Date: Mon, 30 May 2022 11:26:48 +0000
Message-ID: <DM6PR04MB7081038581B7F0580A4B3010E7DD9@DM6PR04MB7081.namprd04.prod.outlook.com>
References: <CAAAx-8+ECfznYPcJqPvP=7fzfgQobU1t+kGhGzWvArjm_Xs_yg@mail.gmail.com>
 <DM6PR04MB7081D63D848FC239F92860F4E7DD9@DM6PR04MB7081.namprd04.prod.outlook.com>
 <CAJSP0QXZEq4+Rjyg0xGq5KZm=Wb_p1+o9gYmVKg8GH_Y9Wi0fQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 96711ac8-9e8c-482e-f1fe-08da422f4953
x-ms-traffictypediagnostic: SJ0PR04MB7520:EE_
x-microsoft-antispam-prvs: <SJ0PR04MB7520CA097E20ACF641353F67E7DD9@SJ0PR04MB7520.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RmBsghtUjfxuyqbnu1MMKtTRsKgPiJe9hGcO+ZxFhE0E+zPkWlwpAE7Zl59Txcq39OG6CvLZZV7ZLT/FZo2/oIECqWGq5fElrfLykYR5Au+KeC+RY8g8XPSfctkrWFHI49iAifOG1iS8sGTQx+vgqH3pmlriP5P2ycOygDhnupui6Dlzc4fnittj63uRsKelYE6OOcuFDNoW2B1S+sV9QWtF7G2Qpe1HMg66wFYH/eMm97noZVNHkAgMbZRjTKOdflU2iuXGILC3qyoPG2mWnObQxiyp3pHFY3/cXU59Xkyxi+KVyPLj0nal443wCIuTxxZDETOFQ8VQMv0JhRBPcYIhyCYf5+zs9nBlDbSwFoLLmJwviBwY0xT/FxZREIHq2j61Rr0FU3c2qLSac9YRy3YozZTEkfzSU/HQDOxOWYdd0n/nE09IzJaEaSDQv83BnbVAQjRRZaSljQ90B3dHHdJRMAYE0CRx/wLftNKJdJSkvTrPN44pfpWD2mefgduQWYbgWRAzhuoOzjeiA6i0PfO9zNn1OnpGiLDyja6vZPVyMoc/1Ot70U/cA1Y0ulk8HhS3QqFUzI7Hsr9lj3APvGcsZBVpLgaFSer2gUXqt4o7HkcAJ6gDpgcRcBwlVjWGjZDTnNVMKvf1Uc8U7hDL1b8zVFctu/at6BusLGtp+l/wE0j1pf+k1FQ+Ei6QkmiNeR6tYvcBBnP1s9/j+cvjlA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB7081.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(7696005)(9686003)(316002)(2906002)(53546011)(54906003)(6916009)(122000001)(38070700005)(83380400001)(55016003)(82960400001)(38100700002)(5660300002)(86362001)(66946007)(52536014)(4326008)(76116006)(64756008)(66556008)(8676002)(91956017)(66446008)(66476007)(508600001)(33656002)(71200400001)(186003)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CAoe1t19wiGZ08oOET4cIJjAVRk7/DtaJYiSPsQNB3fFF9ndqEvOLqY/XKwX?=
 =?us-ascii?Q?RU838bTVHGXDbXJ2cZhOZbMwqITmQrLznMnF96XJLgC8Cphy6+gQGLLy7+9e?=
 =?us-ascii?Q?VrlQVyDWMqNuPXeIJOW/EJ0zFB1tTGU1pUBjEUQIYJlBy1re/wrLDY5896Dp?=
 =?us-ascii?Q?6SDFzA7OHtVMJgVecp+PQv3hDyj9ksIXCrrtusmIW8e1kb4MYN7CGj6KY+8q?=
 =?us-ascii?Q?q707sKV4GGs+fqpRSMSuebTy6y7hhrb5MP5RCdnLlPMQhj3d8PFjpHWbiPcj?=
 =?us-ascii?Q?q/PGbvzFaVtO+wZmu8wDmT/lrACOBvVOURuqhr/BWokG2vndL44i1PKJY/7b?=
 =?us-ascii?Q?NAhlqbzO53DTg9SmDryF6c6+74QFiKx33wS2KqAIF0vxkr+14cEb+mJFrMlJ?=
 =?us-ascii?Q?QzR39wC/ggdK9LKBfOorjJ0iLVn+irFpPatylksao2WJGGIuRTZQV+zhIUVW?=
 =?us-ascii?Q?XxsJySX0Um2FdiWH7slPeSzgTGHYUT6bbZ3JP3FPdxMSroDRhWFXvSzPr9AZ?=
 =?us-ascii?Q?QRoVqgL7PgeNpuldyHM+Oya70cqZKG1ctl1XJg1D9lgTkGlEYwZ97sv/9HEL?=
 =?us-ascii?Q?ZHAm6OmXMmpzoRNUZthvhKdFo4QkoDvlK3xzvmoA7zuty2fHZa4TTVoYYkpX?=
 =?us-ascii?Q?SmpxBVYEXbpU7RnywfzPby2unxn9oZ/DtE0gvdb4hjAYdFpPSps3VfZQVkhb?=
 =?us-ascii?Q?X58XjkoP2qSCYqnJYXOsm6dd1FDIDAkEmqrI7BfrB6JU2CC2dCEAjVZ8vEUu?=
 =?us-ascii?Q?m9o8bancJDMc+Bmk0FYho2yA0+oOuoZA1cLifzQFN9wELQbiPY+EWaK5BSZj?=
 =?us-ascii?Q?A3uCRXnZCz9J2RZCeVh5eXwrrEVNhIvSIqfXztCHwbiFED0hNB4eUaWYEi8N?=
 =?us-ascii?Q?+hClGvnygIg+gE7qsAz5UMZe/rygIXfCbgAZHmZBk/kl6vd3jVfALNc+L9vp?=
 =?us-ascii?Q?ROnmyU4VUvAp8Q9LgHFoiI1CRtlViu5ewrhr1M7v/ZeZ9gFOuhvOdi1omSzI?=
 =?us-ascii?Q?DtNiJEJ928s97jIM0VgV9DwhvAZCsp4OV/7V2KjvmczSx4oS1BKqWac/bBKd?=
 =?us-ascii?Q?RWOrvWXmSlRwKpfCyYa36FH9oLs0PRRK1IfjBstZQC9JZgFuL6ruOcKALzYm?=
 =?us-ascii?Q?Ah6ItT0hZ8iXOGOzacozAFASOrJ+U8YWbO8rRvXRwfEBe9A7bg7Is2Aw48qB?=
 =?us-ascii?Q?ZnXyhr3ku/7uu8xxqeFsixB+i0PBxrdXgKgeZcpG/MSTHbz5kNdqVljXJBzb?=
 =?us-ascii?Q?faEA8KjniQUTGtPEyB99kJ0f3d8pdiufoQMaK4OhrsCKYfAB9Sh5JJiy8jjs?=
 =?us-ascii?Q?M4ql8/2iICcMqATcQFSQbR850N7YSJTgJWDcQj1lu17k6CcNPMYemaYe/uLb?=
 =?us-ascii?Q?C1k0L8t/uaertuFxptJERvTCZMPVkFaOpxKdqn+YkGbe4y+77IchXB2re8rR?=
 =?us-ascii?Q?PaPa51/yAaM02ngbVYhSy/wOAsDkFKsRUBZGiP6IE0KVwLKFd3kbb8Q+0niR?=
 =?us-ascii?Q?vnYvNCPA1bYmAxAMOD1smbDtJfd7UaRLolysYLnd0N2sjNrTE4CEAtdL62hw?=
 =?us-ascii?Q?iuN8JCJWpuHC4wjuJu8GsEouuB2LIn7Dx0bn3IA1ZHRRPYU9Wj3cdoSBAPsj?=
 =?us-ascii?Q?+XRCWTYx3Fk3a3dUYsfl8c/y0bNyhVNPf9IqcktcfT1nPFfNCUPeLSvJN5bk?=
 =?us-ascii?Q?pE1hGBLS5fLOM707eQdPgx7F5HvmJ451ZlvSA2JFYJPVuY38frdXdXLHnO5S?=
 =?us-ascii?Q?+4/vXDA2pDl/8DBo5N3KkvG7TWs81x5uo5MIbFarf67voHAsqQkfYJfw41BN?=
x-ms-exchange-antispam-messagedata-1: ELqYRG/tt54DY1MIAcEq228y600CcjDIv6c=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7081.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96711ac8-9e8c-482e-f1fe-08da422f4953
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2022 11:26:48.6855 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uc42PlDAj8kncq+vdKJ2Ls/KUDY6o+INOk5nIGSok2I+P0IonULrcGU49hUIHJ7GDndl9pUQgj1RMCwZFTBWPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7520
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=142e1760f=Damien.LeMoal@wdc.com; helo=esa4.hgst.iphmx.com
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

On 2022/05/30 20:22, Stefan Hajnoczi wrote:=0A=
> On Mon, 30 May 2022 at 06:38, Damien Le Moal <Damien.LeMoal@wdc.com> wrot=
e:=0A=
>> On 2022/05/30 14:09, Sam Li wrote:=0A=
>> Once you have an API working and the ability to execute all zone operati=
ons from=0A=
>> a guest, you can then work on adding the more difficult bits: supporting=
 the=0A=
>> zone append operation will require tracking the write pointer position a=
nd state=0A=
>> of the device sequential zones. For that, the zone information will need=
 the=0A=
>> zone capacity and write pointer position of all zones. The zone state ma=
y not be=0A=
>> necessary as you can infer the empty and full states from the zone capac=
ity and=0A=
>> zone write pointer position. States such as explicit/implicit open, clos=
ed,=0A=
>> read-only and offline do not need to be tracked. If an operation cannot =
be=0A=
>> executed, the device will fail the io on the host side and you can simpl=
y=0A=
>> propagate that error to the guest.=0A=
>>=0A=
>> See the Linux kernel sd_zbc driver and its emulation of zone append oper=
ations=0A=
>> for inspiration: drivers/scsi/sd_zbc.c. Looking at that code (e.g.=0A=
>> sd_zbc_prepare_zone_append()), you will see that the only thing being tr=
acked is=0A=
>> the write pointer position of zones (relative to the zone start sector).=
 The=0A=
>> state is inferred from that value, indicating if the zone can be written=
 (it is=0A=
>> not full) or not (the zone is full).=0A=
> =0A=
> It sounds like QEMU BlockDrivers need to maintain state? I haven't=0A=
> thought this through but the guest probably has some state and the=0A=
> device below QEMU also has state. Can QEMU just invoke the BLK*ZONE=0A=
> ioctls on behalf of the guest without maintaining it's own state?=0A=
=0A=
FOr all operations except zone append, yes, it can and that the way it shou=
ld be=0A=
done. However, for a linux host, since there is no user interface for the z=
one=0A=
append operation, QEMU will need to emulate that command using regular writ=
es.=0A=
And for that to work, zones state (at least the zone write pointer position=
)=0A=
need to be tracked. Linux mandates zone append working for zoned devices...=
=0A=
This kind of emulation is thus implemented in the scsi disk driver since ZB=
C &=0A=
ZAC do not have zone append. It is not too hard to do, but care must be app=
lied=0A=
to zone wp tracking and locking (mutual exclusion for zone wp test + change=
=0A=
depending on the operation). This tracking can be fully initialized on star=
tup=0A=
and does not need any persistent "metadata".=0A=
=0A=
=0A=
> =0A=
> Stefan=0A=
> =0A=
=0A=
=0A=
-- =0A=
Damien Le Moal=0A=
Western Digital Research=0A=

