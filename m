Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16935641A2
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jul 2019 09:05:16 +0200 (CEST)
Received: from localhost ([::1]:58336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hl6fC-0008Gu-W7
	for lists+qemu-devel@lfdr.de; Wed, 10 Jul 2019 03:05:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54023)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <wentong.wu@intel.com>) id 1hl6bb-0007VE-Pp
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 03:01:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wentong.wu@intel.com>) id 1hl6ba-0006LG-Cb
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 03:01:31 -0400
Received: from mga03.intel.com ([134.134.136.65]:48287)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wentong.wu@intel.com>)
 id 1hl6bZ-000635-P1
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 03:01:30 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jul 2019 00:01:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,473,1557212400"; 
 d="scan'208,217";a="165987956"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by fmsmga008.fm.intel.com with ESMTP; 10 Jul 2019 00:01:10 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 10 Jul 2019 00:01:10 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 10 Jul 2019 00:01:09 -0700
Received: from shsmsx108.ccr.corp.intel.com (10.239.4.97) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 10 Jul 2019 00:01:08 -0700
Received: from shsmsx106.ccr.corp.intel.com ([169.254.10.240]) by
 SHSMSX108.ccr.corp.intel.com ([169.254.8.174]) with mapi id 14.03.0439.000;
 Wed, 10 Jul 2019 15:01:07 +0800
From: "Wu, Wentong" <wentong.wu@intel.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Topic: in icount mode guest OS can't boot on qemu_x86 when shift
 value range in [0, 3] 
Thread-Index: AdU27Jpm512BV98IRK+ajWB/8kN2Sw==
Date: Wed, 10 Jul 2019 07:01:06 +0000
Message-ID: <228A20DABA3D9846AF1B64E31C217296010BF167@SHSMSX106.ccr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMzljZTRiZGEtY2Q0Ny00ZWE5LWFkNWItNzBlYWIwNzBiODg1IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoidkhrWHl3S3pGb2hSK05oZWdtOTBYWGtsb0JuWjhleWdEbTlKWjNQbEwzb3ZwbnlSc2pqejBjanhyd3BpM1MzdCJ9
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.65
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: [Qemu-devel] in icount mode guest OS can't boot on qemu_x86 when
 shift value range in [0, 3]
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

I'm running a rtos on qemu_x86 with icount mode enabled, shift value locate=
d in [0, 3], there is very high possibility that the guest os(the rtos) can=
't boot up. Does anyone have any idea for this issue? And this issue blocke=
d me long time, appreciate any input?


Thanks
