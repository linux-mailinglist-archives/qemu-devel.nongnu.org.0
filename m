Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA0850DD0
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jun 2019 16:23:40 +0200 (CEST)
Received: from localhost ([::1]:51626 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfPsh-00082U-B0
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 10:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52101)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <wentong.wu@intel.com>) id 1hfPpo-0006XX-D2
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 10:20:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wentong.wu@intel.com>) id 1hfPpm-0002CT-Gy
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 10:20:40 -0400
Received: from mga14.intel.com ([192.55.52.115]:32783)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wentong.wu@intel.com>)
 id 1hfPpm-0001sn-5C
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 10:20:38 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jun 2019 07:20:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,412,1557212400"; 
 d="scan'208,217";a="163336741"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga007.fm.intel.com with ESMTP; 24 Jun 2019 07:20:23 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 24 Jun 2019 07:20:23 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 24 Jun 2019 07:20:22 -0700
Received: from shsmsx152.ccr.corp.intel.com (10.239.6.52) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 24 Jun 2019 07:20:22 -0700
Received: from shsmsx106.ccr.corp.intel.com ([169.254.10.89]) by
 SHSMSX152.ccr.corp.intel.com ([169.254.6.225]) with mapi id 14.03.0439.000;
 Mon, 24 Jun 2019 22:20:21 +0800
From: "Wu, Wentong" <wentong.wu@intel.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Topic: icount mode 
Thread-Index: AdUqlUsCJuUt44ANStGsBLa8F4+c6Q==
Date: Mon, 24 Jun 2019 14:20:21 +0000
Message-ID: <228A20DABA3D9846AF1B64E31C217296010A5383@SHSMSX106.ccr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNDRjYTMzZmItZTA1MC00Nzg3LTliNjQtNjlhMzcxOGQ0ZmY0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiNENTd243ZHBnZHJuM2pqTDRiaUxzRVAzbTRkcGFpSGRxU053TkdzaHBGUFRuTnBwWERFdUFucnZ1ZnNrSHlWViJ9
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.115
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: [Qemu-devel] icount mode
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

Hi all,

Recently I'm using Qemu TCG icount mode, from the code I found Qemu timers =
run at 1GHz, and for ArmV7M example, there will be conversion factor from q=
emu timer to SysTick frequency which will be calculated by NANOSECONDS_PER_=
SECOND / SYSCLK_FRQ.
But the shift value also define the target cpu frequency(2^N ns /one instru=
ction), and both frequencies will be used together to calculate the guest t=
imer, so I think there is buggy because of the different frequency, can any=
one give some explanation for this? Thanks a lot!

Also can anyone give some hints about how to give the shift value when use =
icount TCG mode?


Thanks
Wentong Wu

