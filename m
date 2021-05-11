Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B02937AA2C
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 17:04:05 +0200 (CEST)
Received: from localhost ([::1]:41284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgTvY-000789-1m
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 11:04:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebastien.boeuf@intel.com>)
 id 1lgTss-0005lS-ID
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:01:18 -0400
Received: from mga07.intel.com ([134.134.136.100]:3722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebastien.boeuf@intel.com>)
 id 1lgTsZ-0007SU-JW
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:01:15 -0400
IronPort-SDR: EFUAhDbPOHX3PVLejY3jhBVC0P5uCiDB4OIpHhXE+nxkX4csPAGQINyrewCuAlBDQolY+lXq4F
 e8bCZgE53eyg==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="263393071"
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; 
 d="scan'208,217";a="263393071"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 08:00:09 -0700
IronPort-SDR: ++j2TCY5l7J0NXj0FsZMMU7TqFGzk3jgPfimb9Ljp0nK93CwSPSL4yQu3tDBmBOsnLRm/0d1De
 XqsBKaILefhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; 
 d="scan'208,217";a="434527114"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga008.fm.intel.com with ESMTP; 11 May 2021 08:00:08 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 11 May 2021 08:00:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Tue, 11 May 2021 08:00:08 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Tue, 11 May 2021 08:00:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Crx8jC7afBzR051IbGPanIVNsHxmWZN1j9evzJ0rLow0kjdcy+w+kQMDRFgtqURQzAXmlPjy92UylUTsl2DECTiwzMcROlJ0qnB6Whsa8h7EkvlSlPMvxHWPgPUVauQogy4qlMrFE5CDhHcp+qr8KjRudxjOI8+yEkdvZPHWqwxglr2+4IH/PCRlFaiICCx7iv7wtT2iDgSGVfRS5Um9BWaBZ6QW+6kDtaKPo08Q1HFww2raNEXuMkEpbLoXyQXxJkfJ6y7OfUIrhNUbTm9Bf+iprmX0EJUItZAhiG1KHAKvb8ZxGuTPKSwAno3ACuzhlqTgxsj03W0N1i1UB+I53Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hfj2Lf2GyTY4ZYLyYyJ9PlMh5Z/g2REg0TFmzTYclOo=;
 b=aN4LTsuc0jUTtTnM5+BVIIJWRsjSlL2Q0UFNM3Iujw9lfZNBoVrIZxOsw+qvV6aPOxEkeCgXFMzhNqaitxDlzu453YYtZ+DjY7hqbIJjpzS5KNTgR0gQIx3cBbTgyVc4H4XMZBdCcTRu9uUlXPsOxjYACsYtZnU+rQD/d5hrbxMo4+kolgIEOFnNKff9jQu+m0pAWEpAFL04RsGragdWcJHDpDboZlOiN+TQEm1GKR10GnvdJpYxoTa2U4XtWBtPh0saIpaTdWMwW5XldeKEq1jFFuyKLalJLZ2hoPUHmQMXFtJj4YyJwPLTfotilYp18zAMMpxJIs7PDLrMGemvcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hfj2Lf2GyTY4ZYLyYyJ9PlMh5Z/g2REg0TFmzTYclOo=;
 b=D3C2jbnbd7zfLVfHsLiNoUgE8coLjLv6IymyEqgnmNJijo0gldCOjmcHC1vctB5ksm8uhi8snXbZoT6HvqvO7pnVqEEoX2ENE/+MM5gsaWpSDRdZQ5/SnySn3NKMaJ9/m4PpXl5Gv0RhLRIDStGJGCT3PMGmS2rwZ+kKKtkxNp0=
Received: from BY5PR11MB4401.namprd11.prod.outlook.com (2603:10b6:a03:1be::13)
 by SJ0PR11MB4976.namprd11.prod.outlook.com (2603:10b6:a03:2d7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Tue, 11 May
 2021 15:00:05 +0000
Received: from BY5PR11MB4401.namprd11.prod.outlook.com
 ([fe80::d85a:10d3:e094:f94a]) by BY5PR11MB4401.namprd11.prod.outlook.com
 ([fe80::d85a:10d3:e094:f94a%7]) with mapi id 15.20.4108.031; Tue, 11 May 2021
 15:00:05 +0000
From: "Boeuf, Sebastien" <sebastien.boeuf@intel.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: vhost-user reconnection and crash recovery
Thread-Topic: vhost-user reconnection and crash recovery
Thread-Index: AQHXRnTd8V7ML7LbukyGxvqiybosqQ==
Date: Tue, 11 May 2021 15:00:05 +0000
Message-ID: <BY5PR11MB44018CADDC7A5C04F3D32BC4EA539@BY5PR11MB4401.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [2a01:cb1c:8ee:f300:890a:51e3:36e3:b308]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06fa891d-28ab-48c9-025f-08d9148d7656
x-ms-traffictypediagnostic: SJ0PR11MB4976:
x-microsoft-antispam-prvs: <SJ0PR11MB4976470DEB8D22CA1048D658EA539@SJ0PR11MB4976.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +UP7EAjrhmBsfHFqviVV5uf8B9suZ8f0f6VqvLOQ4PsNjr8j44cRsN1uznMHfd05nIuTd2cLyHrkggXtSLSQr5+sAOXc4pSssuCrtecpdv+CWadt+aU2F3rXErfxOBBuoFW25+sr4KcaYWJ/6Qsm9Cr+eeNz+2LJ36rzv4uGyIYrgwa9l9jvqxWWaITJ3kxujzRyifJ7vSMDoUZ/QU77O62SW9An5hfZsD5gHXU5RRX/KGQnk1sZIrBR9+0oj2a8XHEzMsM1TpHeZ/T3kuvaIx2tER6Q7/ZYiQHV9qTvT87JLCmTNzty5fxB1T20wbF671vJzcvAq4iQyZIXzksjK6yhc8S6ePUagVYTqJD9ob1Io6TcMHaT20P+nOP3FWkSibRXieKJ1wTd/w1NuD0PYigqNeZALBNfX7rVJBFWqQqNJTm+eKasFtkV5KBzkTAbGmLTMVgX2l/zcNJ4sSoFnyHDwjLnuVi998FEH6xGVOiS/2s9J2CeEnLFCBLkzmtEM0kxhcdOkkmwFma8prg/Z+Up22HFVUHDzgM+wPBJp2Q56MO1QeLvy/kfCYzAoTdmIJYeejQeXn1K3XeVaBymyFmP/jmWLGHpk1zCliXdYvqxw9+OfbD159OjFz14Qbm2gUE+I7stSg2Pitnir+E5x9MXHMDzP5BcY2hkquezKZvHjob7AXftOGg4E/MSz9cj
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4401.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(366004)(396003)(346002)(376002)(136003)(166002)(71200400001)(53546011)(186003)(66446008)(83380400001)(64756008)(66476007)(478600001)(8936002)(6506007)(5660300002)(8676002)(7696005)(66556008)(66946007)(52536014)(19627405001)(86362001)(55016002)(9686003)(6916009)(2906002)(54906003)(316002)(38100700002)(76116006)(91956017)(4326008)(122000001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?UPVc+pxmL/meXDiWtd3enzukiLQRH5/rxsF5ky237G1KOCDWLg6pvBD0b7?=
 =?iso-8859-1?Q?1Hn2ao6r8TDFzmUv1Oc/OOdEHtiME4hI7kef99Ipj6WDiLledT7Kmo8jeB?=
 =?iso-8859-1?Q?yDtqZEogI+V77G/C8ehU7om7/clnZnJaMETXljDxHzYAw3THKfCfa/xSn7?=
 =?iso-8859-1?Q?ZZpR0MUPcWzF0gM53Fw+fN6c8X384sUpNCrTSXI8ktpWE8MWzjYvzq4UGn?=
 =?iso-8859-1?Q?VwVM+qBBXFRMuYNJdCVoemkuD46aypIaX2rEzE4OiBaqkD2sC+FJUYdU8m?=
 =?iso-8859-1?Q?uzxt5+sQXxWBILTczmfHvLgGTU0C9XmKnsc57ksadC8WwfvUs3vq4DmW5e?=
 =?iso-8859-1?Q?dk+cMU3yWujSjnK1of2wpb6YbWeNN+umUmsZ/M1ejJrtwNokK+uToXBgqe?=
 =?iso-8859-1?Q?I+KIG9+mKYJCNAgiSnKcrBuV4xdkNkt369SK1tmNSQaS/p/2uVeAdgdoRp?=
 =?iso-8859-1?Q?wLYHJ/dgW+d6Cr8wq6VRIj0vV+TqMpOjls79Hws3G5lT9odznCMuxoiuEn?=
 =?iso-8859-1?Q?yPqnRxKa61OkF31iRhXnfxsb9G/r9t/qXmVW9y0cPwrr+SZG5NdTIItuSa?=
 =?iso-8859-1?Q?CV2d1V/Hb8KycmnNlwKtQ3Yz7tIhQw7pXFU+eiWgOOlCiaYxQkaQO2Bg1b?=
 =?iso-8859-1?Q?0nusPopnaP7RIMSGMUNSUGLBmq8VMdrwPZWhPwQu4kbpT7nEVsU3mRpiP/?=
 =?iso-8859-1?Q?IIVWYSm66KvOTdAdy8xaucwpIWCjraf12g6wZg0TMfIiAhvj1X/11PwaCZ?=
 =?iso-8859-1?Q?1pE54xRZPrdqSy0ONk2jioeqikA5eCdE0iovHpjl+Pjuzg2EPeFWS6IrVh?=
 =?iso-8859-1?Q?NVu8iaXpL9TwN/Xp2VVliWq0pVGWDOxUFK/BLClgQfJ4Yo7tg1ub6OOpXQ?=
 =?iso-8859-1?Q?/32JJoPvKzxET6pxpiLCXZfi5qdQbsMG7rh09b6PnK7YdclJaqKO21pkCg?=
 =?iso-8859-1?Q?4ZcFszTvygvHomEsWc0ltPOMRYUi++DKU0rKsuktlDFi6FzJ4pi+CvXeTc?=
 =?iso-8859-1?Q?CDbTh11k+K4vU36SvwuWr9lYkvKTxn+0emFNOQ1op6/aAZQ4lsqfHftre3?=
 =?iso-8859-1?Q?9bFA/kXuOKUspMaCwRUpruqBzgt+U6DaSi+FoW3ovhRIpNcq7I2gGYjj9C?=
 =?iso-8859-1?Q?IUpj/T9nuvgkDLeTbJkS0+yJJXPZGQ+/mpiRjEGyjLEhYkgJHrFBO9EGrd?=
 =?iso-8859-1?Q?JgkO84irhWfeS5kEd/c9vKAx3Jy8uFCnZnsDSY5pqJDPjYYkR61qwTrPUa?=
 =?iso-8859-1?Q?HYNYrqFXFCt2KAMUS470Jt0L+OFN+Sk8iuyjvbgrLtWp/+h6CMxBADuKSy?=
 =?iso-8859-1?Q?0sllefXyyPEV9cTYGxjDXk26BMiD7iBHKB7K81FfxN66XJn7d8PNlc4G8Y?=
 =?iso-8859-1?Q?F3+tpleWg7e3eGfWIaMDUbzR3YbqvYajXyF149N/xc7wmWcXlg5bN9kR2b?=
 =?iso-8859-1?Q?uq5tQSF4waULIvdz?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_BY5PR11MB44018CADDC7A5C04F3D32BC4EA539BY5PR11MB4401namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4401.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06fa891d-28ab-48c9-025f-08d9148d7656
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2021 15:00:05.7428 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sYwOeRrAuU5dAHMmehPTRop72YPgMDZuAvdLAO5NbzJiCOCsPCeO61FtsnYbeW5h71ZsYGhml7u3J9cEyBXgr889s37kupYdRjiRF0kPuuM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4976
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=sebastien.boeuf@intel.com; helo=mga07.intel.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, HTML_MESSAGE=0.001, LOTS_OF_MONEY=0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "virtio-fs@redhat.com" <virtio-fs@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_BY5PR11MB44018CADDC7A5C04F3D32BC4EA539BY5PR11MB4401namp_
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

Thanks for the explanation.

So reconnection for vhost-user is not a well defined behavior,
and QEMU is doing its best to retry when possible, depending
on each device.

The guest does not know about it, so it's never notified that
the device needs to be reset.

But what about the vhost-user backend initialization? Does
QEMU go again through initializing memory table, vrings, etc...
since it can't assume anything from the backend?

Thanks,
Sebastien

________________________________
From: Stefan Hajnoczi
Sent: Tuesday, May 11, 2021 2:45 PM
To: Boeuf, Sebastien
Cc: virtio-fs@redhat.com; qemu-devel@nongnu.org
Subject: vhost-user reconnection and crash recovery

Hi Sebastien,
On #virtio-fs IRC you asked:

 I have a vhost-user question regarding disconnection/reconnection. How
 should this be handled? Let's say the vhost-user backend disconnects,
 and reconnects later on, does QEMU reset the virtio device by notifying
 the guest? Or does it simply reconnects to the backend without letting
 the guest know about what happened?

The vhost-user protocol does not have a generic reconnection solution.
Reconnection is handled on a case-by-case basis because device-specific
and implementation-specific state is involved.

The vhost-user-fs-pci device in QEMU has not been tested with
reconnection as far as I know.

The ideal reconnection behavior is to resume the device from its
previous state without disrupting the guest. Device state must survive
reconnection in order for this to work. Neither QEMU virtiofsd nor
virtiofsd-rs implement this today.

virtiofs has a lot of state, making it particularly difficult to support
either DEVICE_NEEDS_RESET or transparent vhost-user reconnection. We
have discussed virtiofs crash recovery on the bi-weekly virtiofs call
(https://etherpad.opendev.org/p/virtiofs-external-meeting). If you want
to work on this then joining the call would be a good starting point to
coordinate with others.

One approach for transparent crash recovery is for virtiofsd to keep its
state in tmpfs (e.g. inode/fd mappings) and open fds shared with a
clone(2) process via CLONE_FILES. This way the virtiofsd process can
terminate but its state persists in memory thanks to its clone process.
The clone can then be used to launch the new virtiofsd process from the
old state. This would allow the device to resume transparently with QEMU
only reconnecting the vhost-user UNIX domain socket. This is an idea
that we discussed in the bi-weekly virtiofs call.

You mentioned device reset. VIRTIO 1.1 has the Device Status Field
DEVICE_NEEDS_RESET flat that the device can use to tell the driver that
a reset is necessary. This feature is present in the specification but
not implemented in the Linux guest drivers. Again the reason is that
handling it requires driver-specific logic for restoring state after
reset...otherwise the device reset would be visible to userspace.

Stefan
---------------------------------------------------------------------
Intel Corporation SAS (French simplified joint stock company)
Registered headquarters: "Les Montalets"- 2, rue de Paris, =

92196 Meudon Cedex, France
Registration Number:  302 456 199 R.C.S. NANTERRE
Capital: 4,572,000 Euros

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

--_000_BY5PR11MB44018CADDC7A5C04F3D32BC4EA539BY5PR11MB4401namp_
Content-Type: text/html; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Stefan,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks for the explanation.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
So reconnection for vhost-user is not a well defined behavior,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
and QEMU is doing its best to retry when possible, depending</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
on each device.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
The guest does not know about it, so it's never notified that</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
the device needs to be reset.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
But what about the vhost-user backend initialization? Does</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
QEMU go again through initializing memory table, vrings, etc...</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
since it can't assume anything from the backend?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Sebastien<br>
</div>
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0);">
<br>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%;">
<b>From:</b> Stefan Hajnoczi<br>
<b>Sent:</b> Tuesday, May 11, 2021 2:45 PM<br>
<b>To:</b> Boeuf, Sebastien<br>
<b>Cc:</b> virtio-fs@redhat.com; qemu-devel@nongnu.org<br>
<b>Subject:</b> vhost-user reconnection and crash recovery
<div><br>
</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi Sebastien,<br>
On #virtio-fs IRC you asked:<br>
<br>
&nbsp;I have a vhost-user question regarding disconnection/reconnection. Ho=
w<br>
&nbsp;should this be handled? Let's say the vhost-user backend disconnects,=
<br>
&nbsp;and reconnects later on, does QEMU reset the virtio device by notifyi=
ng<br>
&nbsp;the guest? Or does it simply reconnects to the backend without lettin=
g<br>
&nbsp;the guest know about what happened?<br>
<br>
The vhost-user protocol does not have a generic reconnection solution.<br>
Reconnection is handled on a case-by-case basis because device-specific<br>
and implementation-specific state is involved.<br>
<br>
The vhost-user-fs-pci device in QEMU has not been tested with<br>
reconnection as far as I know.<br>
<br>
The ideal reconnection behavior is to resume the device from its<br>
previous state without disrupting the guest. Device state must survive<br>
reconnection in order for this to work. Neither QEMU virtiofsd nor<br>
virtiofsd-rs implement this today.<br>
<br>
virtiofs has a lot of state, making it particularly difficult to support<br>
either DEVICE_NEEDS_RESET or transparent vhost-user reconnection. We<br>
have discussed virtiofs crash recovery on the bi-weekly virtiofs call<br>
(<a href=3D"https://etherpad.opendev.org/p/virtiofs-external-meeting" targe=
t=3D"_blank" rel=3D"noopener noreferrer" data-auth=3D"NotApplicable">https:=
//etherpad.opendev.org/p/virtiofs-external-meeting</a>). If you want<br>
to work on this then joining the call would be a good starting point to<br>
coordinate with others.<br>
<br>
One approach for transparent crash recovery is for virtiofsd to keep its<br>
state in tmpfs (e.g. inode/fd mappings) and open fds shared with a<br>
clone(2) process via CLONE_FILES. This way the virtiofsd process can<br>
terminate but its state persists in memory thanks to its clone process.<br>
The clone can then be used to launch the new virtiofsd process from the<br>
old state. This would allow the device to resume transparently with QEMU<br>
only reconnecting the vhost-user UNIX domain socket. This is an idea<br>
that we discussed in the bi-weekly virtiofs call.<br>
<br>
You mentioned device reset. VIRTIO 1.1 has the Device Status Field<br>
DEVICE_NEEDS_RESET flat that the device can use to tell the driver that<br>
a reset is necessary. This feature is present in the specification but<br>
not implemented in the Linux guest drivers. Again the reason is that<br>
handling it requires driver-specific logic for restoring state after<br>
reset...otherwise the device reset would be visible to userspace.<br>
<br>
Stefan<br>
</div>
</span></font></div>
</div>
<p>---------------------------------------------------------------------<br>
Intel Corporation SAS (French simplified joint stock company)<br>
Registered headquarters: "Les Montalets"- 2, rue de Paris, <br>
92196 Meudon Cedex, France<br>
Registration Number:&nbsp; 302 456 199 R.C.S. NANTERRE<br>
Capital: 4,572,000 Euros</p>

<p>This e-mail and any attachments may contain confidential material for<br>
the sole use of the intended recipient(s). Any review or distribution<br>
by others is strictly prohibited. If you are not the intended<br>
recipient, please contact the sender and delete all copies.</p></body>
</html>

--_000_BY5PR11MB44018CADDC7A5C04F3D32BC4EA539BY5PR11MB4401namp_--


