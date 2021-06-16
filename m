Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1E03A8E7D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:44:49 +0200 (CEST)
Received: from localhost ([::1]:38690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKbn-0008P8-JK
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:44:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <swee.aun.khor@intel.com>)
 id 1ltKLx-00078T-IC
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:28:25 -0400
Received: from mga14.intel.com ([192.55.52.115]:22124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <swee.aun.khor@intel.com>)
 id 1ltKLr-0000eC-E4
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:28:24 -0400
IronPort-SDR: fkpdofV/eZ01EbojGAXz0Zss61Eu31RfyFmoHycwtloPapSiO4VgkRJi+JNWb3/k3SxXZtRxwG
 XDOdXWbpPEQw==
X-IronPort-AV: E=McAfee;i="6200,9189,10016"; a="205915451"
X-IronPort-AV: E=Sophos;i="5.83,276,1616482800"; d="scan'208";a="205915451"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 18:28:11 -0700
IronPort-SDR: K5Zl2AlyW/jJDYfUVs2QwDWB1i1mEcymTBjwewWtepZTmDw8K3qeyRFutPVyiVlw/tccHSslh0
 VwXV2lQu97CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,276,1616482800"; d="scan'208";a="442727066"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga007.jf.intel.com with ESMTP; 15 Jun 2021 18:28:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 15 Jun 2021 18:28:11 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 15 Jun 2021 18:28:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Tue, 15 Jun 2021 18:28:10 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Tue, 15 Jun 2021 18:28:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cUV5SpNG3/RRCXnG1CpFj527Q0ihvSWjVaXC/9By+wHG0ITDrEAVx8xlzZawvjKuGt4wyHloCoX1o2MRYgUDh90oo0sMZUaQrVcbSe/35NUOML7fFa2n89+XMWbBEJQ6uiyRmEuH8Su0YZ0TnO2iM7JP03U6GfePBVNzpS3/BlBxEN7j4rEiko/Xi4vQ0xnIxSVeryhEgFRstI908oshRJi1+ffnMVsrJQwwxT2uaJNPz9DNvEMKNV4AY1tnMkiiVVmog2sBSZawV0YtfDs+rbfeATQnR2JZ+yURym92aUZuKeVDbt4HYGej77k9E5ZMg76I9Aw19bbjimP5gz3jEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1Se/b1TSjzUyZeaWThd4PRmuK6TzBrooPtGdVehN3g=;
 b=D6dzmnrXMhwAOSHvvM69gzV9JuzVX5HJGYN7CkZ3oXqeVlOTZpJJC82t55JmeZKJFd0TkXhIiaBlLnPYElEhHMA0dRqEldLjz/m8ZwdmKzSGOvq1gipU33RGNel8g2Wve/xmxzVht5lLS0uVhDe5fMoIRNlQRV0a3vIoTEP0stuFjkXRblIEmhEOf0yVUayAKmH3gjuBNnPX4LZ56DiQQvTCk4mpIx6WJR//d60uE1I8xz3Gb0k69RsHWs9npTyx8w/KUV+6KisRS0h3IvS2uS6O3n5MyS4XAVoH+2zJzuziQFSVLxrrrR5ST6o8bVzi7RR44auBGW4p8DsZ3hCgVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1Se/b1TSjzUyZeaWThd4PRmuK6TzBrooPtGdVehN3g=;
 b=zLOFlH5sUGj4em3WQ6xN3EIw1zC6KoTzWoZe6LB6enW7VGfKHrRWgzAzBaw9W4kA+bXFLHDAeZW0IhPl0rNHXj7VzlCNifImasf91pOtzpMZ0KwtRYzdVBIC8SvUm6WBV1mymvNA4UILyGeO66NYj1wVn5OjoMiTZ3rrP39uHjc=
Received: from DM8PR11MB5717.namprd11.prod.outlook.com (2603:10b6:8:30::9) by
 DM5PR11MB1980.namprd11.prod.outlook.com (2603:10b6:3:10c::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.24; Wed, 16 Jun 2021 01:28:08 +0000
Received: from DM8PR11MB5717.namprd11.prod.outlook.com
 ([fe80::ed6d:88e5:949b:62f1]) by DM8PR11MB5717.namprd11.prod.outlook.com
 ([fe80::ed6d:88e5:949b:62f1%8]) with mapi id 15.20.4219.026; Wed, 16 Jun 2021
 01:28:08 +0000
From: "Khor, Swee Aun" <swee.aun.khor@intel.com>
To: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: RE: [PATCH] ui/gtk: Allow user to select monitor number to display
 qemu in full screen through new gtk display option
Thread-Topic: [PATCH] ui/gtk: Allow user to select monitor number to display
 qemu in full screen through new gtk display option
Thread-Index: AQHXYSc4NxeHCjT1kEaKV1fJRv1DDqsTmhsXgAJAXFA=
Date: Wed, 16 Jun 2021 01:28:08 +0000
Message-ID: <DM8PR11MB57179B0933C04DD48CA487FCAF0F9@DM8PR11MB5717.namprd11.prod.outlook.com>
References: <20210614080542.5905-1-swee.aun.khor@intel.com>
 <20210614141129.plffhclmdczft3g6@redhat.com>
 <87o8c8wkwn.fsf@dusky.pond.sub.org>
In-Reply-To: <87o8c8wkwn.fsf@dusky.pond.sub.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [14.192.212.248]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c3deabb-cb53-4a29-21f7-08d93065ff51
x-ms-traffictypediagnostic: DM5PR11MB1980:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB198038722650315421DEAA78AF0F9@DM5PR11MB1980.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aIcEBtmHGMIlNA81rls2j67moRpmTBfM5UNIvhlE9r3EisSwYGNbxK9tEOymTXbtIYMkJaTNY5To897wn7gBLkiEweY80SPWxxQsytLEp5YC1ZRPnW9PC6XfLE6S/eylLZULy5sZmPfIacYocBvuTyZqThlyxpDZmJPay0LFNyQcgBMZwqSxFEWhVoYPTXJXq33u81bdiW1FFD+SBwTWTBUq9NDdg+s1TW8pZvIJg5Dw6iI3PJxms/e3SdJ60kM2xrwqYhsoYXCcmABzXw17pMBnOAkqlVflQqBT72uXl/wFkvDj68GhIcpNENLFN5z4IrcYj61XRcRNNfNnrTj+zaAN/kRO4eH9cLOoHjSQPB7XcRAETyVQsD7xmfn+fQ2rTvdAi1IAcmJ2jEBAzNgbskBBwKuX7GfkDVdDWsnOrq/VrJ0Fv9ETmmCWAu1EjEcrAzNoYWyoz8pYL67JLjqYXel/F1ypRFrX6VZq6Gq7tOMK2covLYCjS2+a0L9Qm4QdY1CphBMeHava8I6z4tst4aAxHDHmtUikMkBrehpFxAIsbTeqaP/cuqRTX17X8MlSZUlL1filWyA9RmSF9IOD7D5z0fimCikrD0FSJUnPZIc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(346002)(366004)(136003)(376002)(8936002)(26005)(83380400001)(107886003)(66946007)(76116006)(86362001)(66556008)(66446008)(52536014)(64756008)(5660300002)(66476007)(8676002)(9686003)(38100700002)(186003)(33656002)(55016002)(54906003)(2906002)(478600001)(6506007)(71200400001)(53546011)(4326008)(122000001)(110136005)(7696005)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6kMgpWmuH3X4CVIwDHbZ+m4w/ejxNoBDpucgJ9hHubiwi2sqWro5YrH7VVqC?=
 =?us-ascii?Q?cn3Ut2QhP2rEb96nsA2j8Gz+HJgITrWqmAwtJtULXySwEKBOsFXsIzdaljgY?=
 =?us-ascii?Q?WQm/H5ByolhwcrZH+x4YX8syxb4IAt8N0rDKbIQaDHtV0c5Skp/QoQps56Hu?=
 =?us-ascii?Q?zuwqgXo+USHYlg6UEjRz3eA0wnS9M1q1tO2tndfgMd3Gs22ZIHAWSK6Kl3Vo?=
 =?us-ascii?Q?l0KqOWwnPZxpwiPfzy+uO8wrfBqlEqdnBCOQMENJD/RYsthZmgDvAPcHUWKI?=
 =?us-ascii?Q?DqoSzEzSHVVHK0wnDUEeU1mPMbZOcBCoyeX3+LnV+aeROF5cAVLEKR1ai/Zw?=
 =?us-ascii?Q?FLk7/mtA6DfuHoIzF7/jDHSbqucxCanX55pERlKTwUeQe1gF6GNhjFLNY5U9?=
 =?us-ascii?Q?RzRMhug1k+R0tm1Hn7/Ko3h9MRe8up2kFhjZGIHU4GRGfbWskhLYJrK2pEz/?=
 =?us-ascii?Q?6nKnXTe97CJ3rlLvoTVCxvde4CZpdSHny3e4GDj4IM++DPPvXeGj6lvsDYNK?=
 =?us-ascii?Q?Ehw5uvOYumtAG4G3CZPSh1rSVMcP4RyRXmbKDe/Pwd9ZVnVdB6+KJxksul97?=
 =?us-ascii?Q?pSB1ZMMui0WRT6loF9xCzBJoM9o/auOu9a9Wn64n4UO8/KWGnw5M0eUw8KCt?=
 =?us-ascii?Q?1VoOr0d4JGhlu4FQKNhRvLSzsFEgR1C7kdjXOaemu3yyJYWUz9LK9eIk2a7l?=
 =?us-ascii?Q?/+YE3TLsacYoCtgaue6/nChyM0HlWAAiWmsk20h+3kfVkYg5x8mNNrO8uv6B?=
 =?us-ascii?Q?jelM9SBeCPZrz8TJ1azH4gV7Zt628dy41nuPrkZxB6tl81P3a8h6QPexOK49?=
 =?us-ascii?Q?iCkUUA0jZImnAPKPH6H3uHBnMpMB2rvcRpAmjkKUlvN7zxlyLxDvuULhXXFM?=
 =?us-ascii?Q?OUADSOr+1usyDNUIs78mimgehPEcKgp+fdWEgVOEzYQzpEBdM2cJqyGTGTpJ?=
 =?us-ascii?Q?Wt5Dw6fPstZYnf2Lq+6zeKY9ZFWqeCwNZ5mNgQ3a9rb0KuSJofpYyo9cnKGU?=
 =?us-ascii?Q?LI5wJdP+ntkY3pKhBVe85XULYdQWmdnhVQ4/KNHYNKFt17nWCixeYhV3d0c4?=
 =?us-ascii?Q?6kQKzr8iSazTObe3dVQX2ZTkMXCbSNRzRpiksRx2jHk9TPqXZX0UqWPLMmQt?=
 =?us-ascii?Q?vTYCPgJhW2oNZbXEy9EnFrzQdO0Ksm2W1DxEByvTmDPbWgEmWHVTBYqdEbOu?=
 =?us-ascii?Q?e8d+AbsJ2zoV9z0yb59PjGkaRomnm3YXpoZApFZt+Dyss2/UhwcaXlvK6CNO?=
 =?us-ascii?Q?CL9K6hEN1DelvEWu8TDIaZNMQu4yEzTx4/ZCit98N5FyrZqVwJVyaz2cpFJS?=
 =?us-ascii?Q?cxRc1QG5tO/OtFecIfCmJ2DD?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c3deabb-cb53-4a29-21f7-08d93065ff51
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2021 01:28:08.1549 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pbuyY56xClGTlFvUxb8b4A8lZVS1ejBTdWAGthRXt2JbKig2oGukfjK0ldVXzQcjkTvPxRvh1zDcjsTCkqB3TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1980
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.115;
 envelope-from=swee.aun.khor@intel.com; helo=mga14.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Kasireddy,
 Vivek" <vivek.kasireddy@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks for review and feedback. I shall rework those in v2.

Regards,
SweeAun

-----Original Message-----
From: Markus Armbruster <armbru@redhat.com>=20
Sent: Monday, June 14, 2021 11:01 PM
To: Eric Blake <eblake@redhat.com>
Cc: Khor, Swee Aun <swee.aun.khor@intel.com>; Romli, Khairul Anuar <khairul=
.anuar.romli@intel.com>; qemu-devel@nongnu.org; Kasireddy, Vivek <vivek.kas=
ireddy@intel.com>
Subject: Re: [PATCH] ui/gtk: Allow user to select monitor number to display=
 qemu in full screen through new gtk display option

Eric Blake <eblake@redhat.com> writes:

> On Mon, Jun 14, 2021 at 04:05:42PM +0800, sweeaun wrote:
>>  -display gtk,monitor-num=3D<value>
>>=20
>> Signed-off-by: sweeaun <swee.aun.khor@intel.com>
>> ---
>>  qapi/ui.json    |  3 ++-
>>  qemu-options.hx |  2 +-
>>  ui/gtk.c        | 15 +++++++++++++++
>>  3 files changed, 18 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/qapi/ui.json b/qapi/ui.json index 1052ca9c38..c3363c7ad5=20
>> 100644
>> --- a/qapi/ui.json
>> +++ b/qapi/ui.json
>> @@ -1041,7 +1041,8 @@
>>  ##
>>  { 'struct'  : 'DisplayGTK',
>>    'data'    : { '*grab-on-hover' : 'bool',
>> -                '*zoom-to-fit'   : 'bool'  } }
>> +                '*zoom-to-fit'   : 'bool',
>> +		'*monitor-num' : 'int' } }
>
> Missing documentation of the new member.  Also, get rid of the tab damage=
.

Suggest to name it either @monitor-number or @monitor (because what else th=
an the number could 'int' be?)


