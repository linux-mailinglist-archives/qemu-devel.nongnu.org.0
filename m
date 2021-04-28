Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EBF36DEEA
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 20:24:05 +0200 (CEST)
Received: from localhost ([::1]:50540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lboqy-0005r3-02
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 14:24:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1lbopN-0005Kg-W5; Wed, 28 Apr 2021 14:22:26 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:59650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1lbopJ-0006Yo-6m; Wed, 28 Apr 2021 14:22:25 -0400
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13SID1du031245; Wed, 28 Apr 2021 11:22:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=XWyKXh0iI/FB0PWR+ieQ+q5FVJaSGaJDkGe61OSb8B8=;
 b=xlY9L8BLAra/0vq5SsXWB5hE2mtGTlDWYM5e0LKZ76rwRSlJMSRwiDSDwXVECtH1AdvW
 kED95YTG1TgmS+ZJCBM/8EhfayWb54TpQjRLqlkN3+OEY1TsFDgjdeRKflvAQuwK8EV4
 cTeI4IrUsu+HnZkISqMZcZyrLDvpzQU8nXsAhWN2RnUcAsCWRHMUbW3g0vN9oXY96Grq
 9n25i+cMN3g4HE98FyeSS74kJG5yu7X4sqrQmLmZ8ley2uuofNABjBxSQgGM5AL5Vp6l
 W36Lo5vTdL2iWtxTgPW2b6OxRf7QrYcwOWmL/D+4YrXhc/YTyOz8sNBezscwEnxzh8RT xA== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
 by mx0a-002c1b01.pphosted.com with ESMTP id 386t3ht7en-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 11:22:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z3VRWENNjL1Kckpz+BAMIKY0SjXMxEgRLNry11uGi5DpxPh3SCg3jZ0uKKDrPDaUnTbUYEIjW2ll8Zdd8Mch8vUMYudVpHf7EKAsHjxRsn58pNFt/BNQ7zSK805axALX2VN5zUkpZ/8KuHCq3zuTyNCr8Bcb7aqQOkoJtrkzH4K6yGFgJIS6QJyzEM1vWlmV7uIgSktpoV8RkLvPpFBPH7cajYG8MvIN7a0dbhDDnqtkAQ+82mXreqVFg29QLcViORaHEviE48V4kMtUNG6WGt8sYdtoPGnzSgfGh3Kf00FrPk5eahKcPAJ36H5NGTtJiwqd5jxTXf1hSBmxw8On+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWyKXh0iI/FB0PWR+ieQ+q5FVJaSGaJDkGe61OSb8B8=;
 b=XhW/Mx7LHtagkRJHtydJqMOrm9vPGyPakm+J1S9p10SpHig0NIe08iyXsMRmZvegnAlpmeL1XDntS7oPaquTtCWFapvJLPTNZDqZp8GahyoQ4zo4KVFwSgoMbVBnwd5zfbopzFqc3OmLa0NcYj5xnyGKS71QrRdfb6lM67VhJb9r0BsyBifj1Dg9Gas6d/4UN3Al2h5UddB0G1GI8dfYeri407fALPg+ocgh5m3tpUIm/uH9QWmfu8h0eEub5JaEDrhUTemxS/5OXEIXLRrCGnKJIAwXBAV6fc3J5uhjjT12/A9oEejoBrHXkXyMPJLOH1GX1jAzCxWIWgyAocK4VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SN6PR02MB4543.namprd02.prod.outlook.com (2603:10b6:805:b1::24)
 by SA2PR02MB7851.namprd02.prod.outlook.com (2603:10b6:806:137::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Wed, 28 Apr
 2021 18:22:15 +0000
Received: from SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::bdbb:69ac:63f9:fc33]) by SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::bdbb:69ac:63f9:fc33%7]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 18:22:15 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 1/5] vhost-user-blk: Don't reconnect during initialisation
Thread-Topic: [PATCH 1/5] vhost-user-blk: Don't reconnect during initialisation
Thread-Index: AQHXN5luvZM5Xi2MZEaKiL49u8fLParKJwGAgAASXoCAAA47gA==
Date: Wed, 28 Apr 2021 18:22:15 +0000
Message-ID: <20210428182200.GA20605@raphael-debian-dev>
References: <20210422170221.285006-1-kwolf@redhat.com>
 <20210422170221.285006-2-kwolf@redhat.com>
 <20210428162529.GA20148@raphael-debian-dev>
 <YImb4XGSPiD/gpnT@merkur.fritz.box>
In-Reply-To: <YImb4XGSPiD/gpnT@merkur.fritz.box>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-originating-ip: [69.122.45.60]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cde29c3e-a26a-4fd8-2a7c-08d90a728cb4
x-ms-traffictypediagnostic: SA2PR02MB7851:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR02MB7851F0752028738987169498EA409@SA2PR02MB7851.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2TmU0o2nGGmU6zYuKjG+FUfQotXhqO6jImH4zIvHTh2Emc5khSIsOX463Q8ZJFyGIzYaheGxZdR+JCxbP1KRwTObzCZ8uiy4HeuJ0rmFPyV3nm0TWheNGM2XndIz/qhAwZYL1/4D7kDJKhYnz46jbJePEVvHrJ64u2ofVoCskS8gfeBnxwr4/ra8GNwxV4bgqIP+JartItq8D2RmMdb1I1ccYi39RyLRVvsKxHF1bZS5jt//n5i8Me1C3agq1qQLCm1d3iaLlHroBGDfdGXRMVeN0jUIYTsir3kzUg7HGW49DfydmC4IG6O7siKGCsFeyxAPNMtrOyCl0D1hT2KXAOQPzhm8tcIBvBDQs7atOgSTZNo2HbG9yMt9goYI/gSbuiGnd5I5ugPU5qx3FdVbqwBjwq3cPa17E6xREhYpVxYObyd2EuMr9U/6ONjQXDM+MmPOR2Y34k0ncKb8t69gYqpbSnv3Nsx9NYgwVb3odpBxG+2sBD4BUZ4Dc+X8JCo+eUn3iy0DcaUHRQFAr/oyMhAClwU4f3yIhkuz4UJ95QOPHrT5wZai/SyUojw7SUOy0Vy4vhlEHqt8F4CWhvg0Nk/3gcdkd+KgY63rDD+IRDk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4543.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(39860400002)(396003)(376002)(366004)(136003)(346002)(8936002)(8676002)(30864003)(64756008)(5660300002)(122000001)(4326008)(66946007)(76116006)(91956017)(83380400001)(71200400001)(2906002)(33656002)(6512007)(1076003)(186003)(38100700002)(66556008)(9686003)(6506007)(26005)(6916009)(478600001)(86362001)(66476007)(66446008)(33716001)(44832011)(316002)(6486002)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?+i88zjoYV4mEZFHcBku3HmOoQKvouE/ZOrcDioMe2myoPa78VACVzjyV/glG?=
 =?us-ascii?Q?GB7CF75k0XgGSMQUuRZVshNuffOuufWs17GySWL3lv2uSBssPAifgsXY7ujN?=
 =?us-ascii?Q?z7OfPHfnykBPeYiyW2O706rqUzk2e50wN0QLv0P2fjlOgp8PzZcHKBW9QHLR?=
 =?us-ascii?Q?ZYj7ZDj1c450jmjT4/jT+V3CwlJKM37lp8/TJnbnaC5oxv46OCj4RA03LT9i?=
 =?us-ascii?Q?T2mGEnoeQL9P4Ri9ejRYw43otW/QGmdhJ20lNBYwTuJA7lE+NiY6YDwkGsUs?=
 =?us-ascii?Q?IQdzgshLOtdra9oB4ToVJixD1jBJlC/hqlD2d7Z6GHcpi/BknqOlw83UdQuo?=
 =?us-ascii?Q?vlpbD0RjCBp5eU2fo3EexfPUG41a1YIrIDi33lNj+pzRw+vA1BaA9Hns4IdY?=
 =?us-ascii?Q?Dzp9r+lyoUtlc2fCmwMyrrM/36FDwNvEimIrPT3z+h/LWA4mE9SOGwhJAczz?=
 =?us-ascii?Q?ZcxmzMKgs+rW6HYpHycvS2uQpX9TuslO560b6l69MHsg7+I2NmA/mnOo3BYr?=
 =?us-ascii?Q?oc1KTCNIag1S9fRiyCVoOptaR3/RuTIjkza7DTA5Uezhqefnq0dOGX3gzVZz?=
 =?us-ascii?Q?K09NY9oBHGQQoO/mWauqkpS64H1VNwxNjTQBV4ww8e3zn3Kr3t6N6j9GzPkO?=
 =?us-ascii?Q?FpD4JrlX3xOOGnL95fWx3kO+qzSSjPVdS8xh5Jy4ZgRMprfhHASG1tFyowjX?=
 =?us-ascii?Q?Napz732AZcCHm70CKDK3SUMjRdgmFRelSwksx/XD4bfM59vkLCPibakQ18dk?=
 =?us-ascii?Q?PlExyAJ/4sx0OWP/8S3Zy4oH6lAZPMgF9EVS9SC88N6rGk95cCWDLTCmVul8?=
 =?us-ascii?Q?Tk6ZAekCbIP0qGyU8DkHryWt1peGUTpiTn3ppVhBAHSO+G5iZbm+Gz3YAi1g?=
 =?us-ascii?Q?kxfF6n7Y/UYyLM0WfnzPlZ/ltgGeIo+jJ1+7K3qbhHrjXKSeDqHsyR1V/piU?=
 =?us-ascii?Q?TnLE2Jk6XTtNVH8iB8O5S7p2DxajOoHr96m02lnlZEnKLyIJkAsMYpDC1zPK?=
 =?us-ascii?Q?LgbpwtzmjTaJfhPbJga3x5O38dKkjJpYOnWtv9cz0zamv9SdhQQfuLVw7ez8?=
 =?us-ascii?Q?cveW8+sTeWPMl+1sJSfWNjYa0WAAA43FQ81KTHYXT1hZsKe5jgHuWFmexAKM?=
 =?us-ascii?Q?Th3UkB+4Nzqeh0EufiNh1hxL0laRllYnRAo+Ygq7muBPXdq8LFXbCTZLIhVY?=
 =?us-ascii?Q?8u1mxdtH2Ke1Lok/tRDq2oIrzAwZs4R/pworCXrJvYOr+0s5p4Cqu5WzUtKq?=
 =?us-ascii?Q?4ipNgAMfzH7lf/4TLGXCwSZeDlzL2UyuwWzOPL73kHupvFHknw2gR9CiLYsD?=
 =?us-ascii?Q?vh6pdWSfiVFP6tn2zbzSwG0y?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3E660F09D439594084B5CA0FFF9C8858@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4543.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cde29c3e-a26a-4fd8-2a7c-08d90a728cb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2021 18:22:15.0934 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t135LopBoB7v/9WCcUYGDunE0BQkZm/GUAkE9XiQWFl4644VxsOrE3Lws163qaYuNCVPekXMh7giOzlDRFLQX2i626iwRuZDjwaS4acEx4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7851
X-Proofpoint-ORIG-GUID: qFXwbTj0WWwkOeGxgeoGoukKC4IA3OsX
X-Proofpoint-GUID: qFXwbTj0WWwkOeGxgeoGoukKC4IA3OsX
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-28_10:2021-04-28,
 2021-04-28 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: "den-plotnikov@yandex-team.ru" <den-plotnikov@yandex-team.ru>,
 "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 28, 2021 at 07:31:13PM +0200, Kevin Wolf wrote:
> Am 28.04.2021 um 18:52 hat Raphael Norwitz geschrieben:
> > Given what you've shown with the use-after-free, I agree the changes
> > need to be reverted. I'm a little uneasy about removing the reconnect
> > logic from the device realization completely though.
> >=20
> > On Thu, Apr 22, 2021 at 07:02:17PM +0200, Kevin Wolf wrote:
> > > This is a partial revert of commits 77542d43149 and bc79c87bcde.
> > >=20
> > > Usually, an error during initialisation means that the configuration =
was
> > > wrong. Reconnecting won't make the error go away, but just turn the
> > > error condition into an endless loop. Avoid this and return errors
> > > again.
> > >=20
> >=20
> > Is that nessesarily true? As I understand it the main usecases for
> > device reconnect are to allow a device backend to be restarted after a
> > failure or to allow the backend to be upgraded without restarting the
> > guest. I agree - misconfiguration could be a common cause of a device
> > backend crashing at realize time, but couldn't there be others? Maybe
> > transient memory pressure?
> >=20
> > Especially in the case where one process is connecting to many differen=
t
> > vhost-user-blk instances, I could imagine power-ons and incoming
> > migrations racing with backend restarts quite frequently. Should
> > these cases cause failures?
> >=20
> > We can still hit the infinite looping case you describe post-realize.
> > Why should we treat pre-realize differently?
>=20
> I think there is one main difference between realize() and later
> operation, which is that we can actually deliver an error to the user
> during realize(). When we're just starting QEMU and processing the CLI
> arguments, failure is very obvious, and in the context of QMP
> device-add, the client is actively waiting for a result, too.
>=20
> Later on, there is no good way to communicate an error (writes to stderr
> just end up in some logfile at best, QAPI events can be missed), and
> even if there were, we would have to do something with the guest until
> the user/management application actually reacts to the error. The latter
> is not a problem during realize() because the device wasn't even plugged
> in yet.
>=20
> So I think there are good reasons why it could make sense to distinguish
> initialisation and operation.
>

Fair enough. I'm happy in this case, provided we remain resiliant
against one-off daemon restarts during realize.

> > > Additionally, calling vhost_user_blk_disconnect() from the chardev ev=
ent
> > > handler could result in use-after-free because none of the
> > > initialisation code expects that the device could just go away in the
> > > middle. So removing the call fixes crashes in several places.
> > >=20
> > > For example, using a num-queues setting that is incompatible with the
> > > backend would result in a crash like this (dereferencing dev->opaque,
> > > which is already NULL):
> > >=20
> > >  #0  0x0000555555d0a4bd in vhost_user_read_cb (source=3D0x5555568f469=
0, condition=3D(G_IO_IN | G_IO_HUP), opaque=3D0x7fffffffcbf0) at ../hw/virt=
io/vhost-user.c:313
> > >  #1  0x0000555555d950d3 in qio_channel_fd_source_dispatch (source=3D0=
x555557c3f750, callback=3D0x555555d0a478 <vhost_user_read_cb>, user_data=3D=
0x7fffffffcbf0) at ../io/channel-watch.c:84
> > >  #2  0x00007ffff7b32a9f in g_main_context_dispatch () at /lib64/libgl=
ib-2.0.so.0
> > >  #3  0x00007ffff7b84a98 in g_main_context_iterate.constprop () at /li=
b64/libglib-2.0.so.0
> > >  #4  0x00007ffff7b32163 in g_main_loop_run () at /lib64/libglib-2.0.s=
o.0
> > >  #5  0x0000555555d0a724 in vhost_user_read (dev=3D0x555557bc62f8, msg=
=3D0x7fffffffcc50) at ../hw/virtio/vhost-user.c:402
> > >  #6  0x0000555555d0ee6b in vhost_user_get_config (dev=3D0x555557bc62f=
8, config=3D0x555557bc62ac "", config_len=3D60) at ../hw/virtio/vhost-user.=
c:2133
> > >  #7  0x0000555555d56d46 in vhost_dev_get_config (hdev=3D0x555557bc62f=
8, config=3D0x555557bc62ac "", config_len=3D60) at ../hw/virtio/vhost.c:156=
6
> > >  #8  0x0000555555cdd150 in vhost_user_blk_device_realize (dev=3D0x555=
557bc60b0, errp=3D0x7fffffffcf90) at ../hw/block/vhost-user-blk.c:510
> > >  #9  0x0000555555d08f6d in virtio_device_realize (dev=3D0x555557bc60b=
0, errp=3D0x7fffffffcff0) at ../hw/virtio/virtio.c:3660
> > >=20
> > > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > > ---
> > >  hw/block/vhost-user-blk.c | 54 ++++++++++---------------------------=
--
> > >  1 file changed, 13 insertions(+), 41 deletions(-)
> > >=20
> > > diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> > > index f5e9682703..e824b0a759 100644
> > > --- a/hw/block/vhost-user-blk.c
> > > +++ b/hw/block/vhost-user-blk.c
> > > @@ -50,6 +50,8 @@ static const int user_feature_bits[] =3D {
> > >      VHOST_INVALID_FEATURE_BIT
> > >  };
> > > =20
> > > +static void vhost_user_blk_event(void *opaque, QEMUChrEvent event);
> > > +
> > >  static void vhost_user_blk_update_config(VirtIODevice *vdev, uint8_t=
 *config)
> > >  {
> > >      VHostUserBlk *s =3D VHOST_USER_BLK(vdev);
> > > @@ -362,19 +364,6 @@ static void vhost_user_blk_disconnect(DeviceStat=
e *dev)
> > >      vhost_dev_cleanup(&s->dev);
> > >  }
> > > =20
> > > -static void vhost_user_blk_event(void *opaque, QEMUChrEvent event,
> > > -                                 bool realized);
> > > -
> > > -static void vhost_user_blk_event_realize(void *opaque, QEMUChrEvent =
event)
> > > -{
> > > -    vhost_user_blk_event(opaque, event, false);
> > > -}
> > > -
> > > -static void vhost_user_blk_event_oper(void *opaque, QEMUChrEvent eve=
nt)
> > > -{
> > > -    vhost_user_blk_event(opaque, event, true);
> > > -}
> > > -
> > >  static void vhost_user_blk_chr_closed_bh(void *opaque)
> > >  {
> > >      DeviceState *dev =3D opaque;
> > > @@ -382,12 +371,11 @@ static void vhost_user_blk_chr_closed_bh(void *=
opaque)
> > >      VHostUserBlk *s =3D VHOST_USER_BLK(vdev);
> > > =20
> > >      vhost_user_blk_disconnect(dev);
> > > -    qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL,
> > > -            vhost_user_blk_event_oper, NULL, opaque, NULL, true);
> > > +    qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL, vhost_user_blk=
_event,
> > > +                             NULL, opaque, NULL, true);
> > >  }
> > > =20
> > > -static void vhost_user_blk_event(void *opaque, QEMUChrEvent event,
> > > -                                 bool realized)
> > > +static void vhost_user_blk_event(void *opaque, QEMUChrEvent event)
> > >  {
> > >      DeviceState *dev =3D opaque;
> > >      VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> > > @@ -401,17 +389,7 @@ static void vhost_user_blk_event(void *opaque, Q=
EMUChrEvent event,
> > >          }
> > >          break;
> > >      case CHR_EVENT_CLOSED:
> > > -        /*
> > > -         * Closing the connection should happen differently on devic=
e
> > > -         * initialization and operation stages.
> > > -         * On initalization, we want to re-start vhost_dev initializ=
ation
> > > -         * from the very beginning right away when the connection is=
 closed,
> > > -         * so we clean up vhost_dev on each connection closing.
> > > -         * On operation, we want to postpone vhost_dev cleanup to le=
t the
> > > -         * other code perform its own cleanup sequence using vhost_d=
ev data
> > > -         * (e.g. vhost_dev_set_log).
> > > -         */
> > > -        if (realized && !runstate_check(RUN_STATE_SHUTDOWN)) {
> > > +        if (!runstate_check(RUN_STATE_SHUTDOWN)) {
> > >              /*
> > >               * A close event may happen during a read/write, but vho=
st
> > >               * code assumes the vhost_dev remains setup, so delay th=
e
> > > @@ -431,8 +409,6 @@ static void vhost_user_blk_event(void *opaque, QE=
MUChrEvent event,
> > >               * knowing its type (in this case vhost-user).
> > >               */
> > >              s->dev.started =3D false;
> > > -        } else {
> > > -            vhost_user_blk_disconnect(dev);
> > >          }
> > >          break;
> > >      case CHR_EVENT_BREAK:
> > > @@ -490,31 +466,27 @@ static void vhost_user_blk_device_realize(Devic=
eState *dev, Error **errp)
> > >      s->vhost_vqs =3D g_new0(struct vhost_virtqueue, s->num_queues);
> > >      s->connected =3D false;
> > > =20
> > > -    qemu_chr_fe_set_handlers(&s->chardev,  NULL, NULL,
> > > -                             vhost_user_blk_event_realize, NULL, (vo=
id *)dev,
> > > -                             NULL, true);
> > > -
> > > -reconnect:
> > >      if (qemu_chr_fe_wait_connected(&s->chardev, &err) < 0) {
> > >          error_report_err(err);
> > >          goto virtio_err;
> > >      }
> > > =20
> > > -    /* check whether vhost_user_blk_connect() failed or not */
> > > -    if (!s->connected) {
> > > -        goto reconnect;
> > > +    if (vhost_user_blk_connect(dev) < 0) {
> > > +        qemu_chr_fe_disconnect(&s->chardev);
> > > +        goto virtio_err;
> > >      }
> > > +    assert(s->connected);
> >=20
> > Maybe a good compromise here would be to retry some small number of
> > times (or even just once) so that cases like daemon upgrades and
> > recoverable crashes racing with power-ons and incoming migrations
> > don't result in failures?
> >=20
> > As a more general solution, we could have a user defined parameter to
> > specify a number of repeated connection failures to allow both pre and
> > post realize before bringing QEMU down. Thoughts?
>=20
> Retrying once or even a small number of times sounds reasonable enough.
> At first I thought it wouldn't help because restarting the daemon might
> take some time, but with qemu_chr_fe_wait_connected() we already wait
> until we can successfully connect in each iteration, and we would only
> retry for errors that happen afterwards.
>=20
> But I think what we really want to do before retrying is distinguishing
> errors that are actually related to the connection itself from errors
> that relate to the content of the communication (i.e. invalid requests
> or configuration).
> In fact, I think the error I hit wasn't even produced on the remote
> side, it came from QEMU itself. Making vhost_user_blk_connect() return
> -EAGAIN in the right cases and reconnecting only there sounds much
> better than just blindly retrying.
>=20

Agreed - we should definitely identify any invalid requests or
configuration and treat them differently to legitimate cases.

> Of course, adjusting error reporting so that we can distinguish these
> cases will probably touch much more places than would be appropriate for
> this patch, so I'd suggest that we indeed just revert the reconnection
> during realize() in this series, but then try to add some more selective
> retry logic back on top of it (without using the event handler, which
> only made everything more complicated in a function that waits
> synchronously anyway).

Sounds good to me. I don't see a good reason to use an event handler in
realize since it is synchronous.

>=20
> Kevin
> =

