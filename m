Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA996EFE1D
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 01:54:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1proxB-00022C-EH; Wed, 26 Apr 2023 19:53:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <satyeshwar.singh@intel.com>)
 id 1prox9-000224-BT
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 19:53:39 -0400
Received: from mga18.intel.com ([134.134.136.126])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <satyeshwar.singh@intel.com>)
 id 1prox6-0004YQ-52
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 19:53:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682553216; x=1714089216;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=zIRzxBOE5lVivQrKqhpWzvLdqdhzSWgmLDdXuG0gj6o=;
 b=BjnPbOns1P7e4jP3DYi/G7M+ADDhKellNQLTqo2CGS/JUslEVyxNjHjP
 eveWxoaDyI/gK/wjC9+mO5pYb532cUMiG5IjQv0eZPzOMv6/VNVSOyX5L
 NsSRPMSvUchpmB98fSYeD6Tma4NO1YEPTi/81RK088/5NtBvv8Fqqbu5H
 hu/ndtGlw2CCgQHNIbUbsgI4ZE4aRZ3MwkXce9X7cNZQxWxKHVCe9LbGJ
 yrjcRokKuWMTsVVc0giigAoNDOevqV3YyVMOeI2vYTmQPOvKf8i0jFBX5
 lcUG2322limWS+Zs8HovcHKdlYSn983sNwpjl1ejMpNlIlyI4yGR1nqJ5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="331520322"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="331520322"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 16:53:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="724649294"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="724649294"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 26 Apr 2023 16:53:28 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 16:53:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 16:53:27 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 16:53:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OymwanFCoco1iX0aXPZ4ePKc2P9mCkTHs3lhYFxtr2JzDQyEbMIINvJOmJDuYPNEl//qgLGOqAZKFznco23jg63H+61rG1wBqkznFwjoik8NF/ux04ATAZsUSOtPpLH72CIf30+e8pm+T1SLVr0W+XwoCrm3cyqrthSz8zgwduYf+K2vN6w6B5L5e/iISW2TdJKiBORnlTkXMaoHtJtdTKe33oYxOkT0c46loybfE6TqzTlVzWlPTZfWiNB+Mq/33U88204E3VxO1IaxgjpgyNYASEg9fswAE64pLHYouhEnm4rPymYVimfkMhga88A9Zm/q/a9hpsOvNFmyBwiE8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnxHWwwSeG85AeFoN5QblEhJj0bd4s0JaXt4xralgTI=;
 b=eMINHK3vQc/NtHCGs4R58F+ullzBhkkUi+s7wsrrV3aV/aZwGuXfJeMXyauXYCKvhE4TmbIZ5KSdU3rq6LrDRHgqdBNAjRFkrrZtYMWBwYVlIaA2CnX3Q7fCRsf9oYxNauvej4mD+S5u2vdPd2eDVeVFSxstot/3FSP0aaPMqdyOnwrFFNDhac/59hErbERp7v0O7zMFSoQB5evNcg50K25FTDKC4Iju1OPg1cenpngsSEnI22prg6YhmzCUO4P1P9DivHqyFD1EMeBF0Yx1At0JnpjRxeDJibQwqRUbpJEUlOAdo4BBPq7A0y1XdIcdZEMl+K7+68imNRkzUWD+hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4684.namprd11.prod.outlook.com (2603:10b6:303:5d::14)
 by PH8PR11MB7070.namprd11.prod.outlook.com (2603:10b6:510:216::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Wed, 26 Apr
 2023 23:53:25 +0000
Received: from MW3PR11MB4684.namprd11.prod.outlook.com
 ([fe80::3b02:a1f2:7877:7824]) by MW3PR11MB4684.namprd11.prod.outlook.com
 ([fe80::3b02:a1f2:7877:7824%9]) with mapi id 15.20.6340.020; Wed, 26 Apr 2023
 23:53:25 +0000
From: "Singh, Satyeshwar" <satyeshwar.singh@intel.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>, "Kim, Dongwon"
 <dongwon.kim@intel.com>, "kraxel@redhat.com" <kraxel@redhat.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 =?iso-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: [PATCH v2 1/1] ui/gtk: Added an input mode
Thread-Topic: [PATCH v2 1/1] ui/gtk: Added an input mode
Thread-Index: Adl4mfR8cCo0eV/3SyuHMJtlpEHGdQ==
Date: Wed, 26 Apr 2023 23:53:25 +0000
Message-ID: <MW3PR11MB46846D3723E3DA2645DF332C9F659@MW3PR11MB4684.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4684:EE_|PH8PR11MB7070:EE_
x-ms-office365-filtering-correlation-id: 7fab6f28-0c7c-497b-c16b-08db46b16cff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ruLmumfM8RHNCQS1tlMo+tjGjyG+V8bUQD1ewODA6xcLNY5SitaokkhbRadZx1lMVolhdYBRKLEwaf+y4zJBol2XXI/L9EJLFn/n3HmVmdh46slFQG9AeWx21mu54zntaN5ojxQzh3X5u49SDg6Ql1PrnsDXo3Yqi6wzUrza4YKSu/EORRC2MVunPl+2IrsRApqjg8zX6arDUmbuf40uaQWHmFm9Nhg9xGpoPnmW9mgnvSVHwho5MiskykbQ8cbFoZkZo0ULkVg40s3E9D8ZBOhJjeCpGeIC/MtZGW6CXFDw0X8u9jkzsKNaLnabn6Gk3ElSrgbhQvY6UnTRB4/E+H1t/oe2zO56PJFEJJdUqaHYhdk9v+FwEmbyIoFGLDifiYvUNa4KZmBvtTJEMpNRHwwylF5PU1LXV1ZdqlV/htDCapic5n0fCi4n5/xHX9WGNbrgEm460Jh0HfQJYqrVl94U4a5e6nZ7WpB8Fku8xTqg37C6WM7ZQTFvv/tUMkIMPdS8/m1ZateQEmE/gIIlnfz/UqXuvvNastkGq1Lc4uvQzdCc9meHie6aXwiesRxIdfuyEYUyPutqFk5UzewuWQ1mWlrUrVZSWkI+TiE0WQndGx0prcPETcfLyXAaeyF3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4684.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(346002)(396003)(366004)(39860400002)(451199021)(54906003)(38070700005)(478600001)(316002)(55016003)(76116006)(82960400001)(66946007)(66446008)(64756008)(4326008)(122000001)(66476007)(66556008)(6916009)(41300700001)(8676002)(8936002)(2906002)(52536014)(38100700002)(5660300002)(9686003)(6506007)(26005)(86362001)(186003)(33656002)(71200400001)(83380400001)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?oViEpbSfwDL4DXis6T/YOlpNYWyeah77rz+42GN1tgCiXHNcR8ZjbXsk5G?=
 =?iso-8859-1?Q?InWhbikXjeSEv8uRknzKK5TXnCAaGhH9NpHmpTnfM8J3UxRwf942k6X5SV?=
 =?iso-8859-1?Q?3UpbsqyB3YMEQWYKnQ3uX1CKY8/8n/INRiX2yEHO+0S4BC8ivlJT/VS63N?=
 =?iso-8859-1?Q?EyQ0FN20UR515UyFDjRb9xHxFln+q1wVtqXUSI5dGNybaXu5EBa7jTrjUg?=
 =?iso-8859-1?Q?B2fx5WKdkyGiic9d0zGx2jqSd84Bh+1c2Ao+fIQgC+eBUe5pnXBswmdJ6l?=
 =?iso-8859-1?Q?RLI10KU2QTyL3iAP52T5cEm7HqaHuhafefhzFKU/D5jyQwL2mBCYVZKzcu?=
 =?iso-8859-1?Q?c3lApoCApYxDiIyBCCLcWrM2qw16jWQnRp2SEW5zlyY4RaCLU9mruaZtty?=
 =?iso-8859-1?Q?ZyDmJisJbdrs68oIuP5B1aylDx2YD7fpnjb7t8lodAxhTh7VNSthoSVbBD?=
 =?iso-8859-1?Q?y9OgooPOo1XQCleS/2lap3FE+ml/y5VsZ4h6LgBH/EueSNcDdjI8nxoGyB?=
 =?iso-8859-1?Q?vig3r/R6FkunlcTk0pqkzT9hUAHh297AjEfNVI+BIDWlFm9WkdbysPj+7/?=
 =?iso-8859-1?Q?mMU+XsWh2a9vWACTTE2AOnrkRtTd86D63cU/mfBmsgzK8Z6kPKoLJA/dDG?=
 =?iso-8859-1?Q?avIJL4hAliojdqX2blMPUiliYvMND/DqQfdNvSYWnH94u2bE1ra3Kkd9rQ?=
 =?iso-8859-1?Q?K3k9y/3+8WVbGDjiWW72DtaNJkp1qSpAIKif0x8yM4rJQ+hMU1d8tm/B2/?=
 =?iso-8859-1?Q?EDxVlpqGs0MbTG/OhWuE4aJvpANRHov+PkkRuepBSXeLmt+fY5bARqluv7?=
 =?iso-8859-1?Q?Ud4H6jEzDDsP6Y6tZv7/ni8hzDirZu0cPulBG/9Ps/tZawiFz526749Wol?=
 =?iso-8859-1?Q?I5nVLGa2N4CdwVfFayAtz9NbqmZQFP3zfW/DJXTKpfuppNDPY1L/79zIWE?=
 =?iso-8859-1?Q?sYBbws9HQ8kFltwdwqln4EmXM6N19LExP9UGj+v45GVTPdhyrqBIg7la7I?=
 =?iso-8859-1?Q?T2uIjsyq54DihB1gi+A1DLSgaznqDGe3EEMwqpdwz8N2SHSu/IozsA/qul?=
 =?iso-8859-1?Q?fp1JVfxcS+qihde+EZ7sIpH1rmN3WGamt3bvr0WmBTKl0yL7wF5hibC6cr?=
 =?iso-8859-1?Q?KHmjnvDK49s2pqZx9iW1bLVSsew+Uwag1JOWu1SKwEGNA1UopMBvP5RU2Q?=
 =?iso-8859-1?Q?5Ho5Bg26lnr2fYWo6oaQEGQ+AepPlHtwmC40uNhl2YJQBtgWuL4A96P9FJ?=
 =?iso-8859-1?Q?vyPjegxlr0IqRCCGQ+I3GW9TAK4mwb9few4ldYSUGwlDe6rLm7NwsNjo2x?=
 =?iso-8859-1?Q?7pvSe3J7HQkaRMtkiKd+H/3VvXGV4UG0a2MWRl0dvSOueM2x/4PycXnSrW?=
 =?iso-8859-1?Q?PpyPo0hWi3ZBzwmGKUc4jCje7F4K2v4q2MNwlPtw24K8lPZJrgcx65QMtB?=
 =?iso-8859-1?Q?S2x3MNFSv1bnA2kEd8DqjzUaBzQtVFZZd/7czsAoHghY9gN9RtNahofayd?=
 =?iso-8859-1?Q?cUpKSE7ow6sQQiXDVZN0tSp7e4N2ZvKHcnoUiw3IeA3Tar29DvGhwkyHW0?=
 =?iso-8859-1?Q?XT2HU8bCU9ELIGKFEM05/srsu468MBPgGQ/VtSpoR/5V/x0yPdR9jsaep5?=
 =?iso-8859-1?Q?0YOUt5chET1IWlkpb73Ao5rCHHYYNjo5NpuGHCR5rnxtgt8axa/TVTLg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4684.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fab6f28-0c7c-497b-c16b-08db46b16cff
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2023 23:53:25.4668 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dmG4SQguDQ2kwyCe6Yt8ZSA7+raNT7hikVJwfcb8Jky9moO25H6briJaARohx/boN6mCEEfk2WrV7vhjyImZ455wmfaHy301maMJKSqlem4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7070
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=satyeshwar.singh@intel.com; helo=mga18.intel.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In a multi-seat scenario where multiple keyboards and mice are connected
to the host but some are dedicated for the guests only (through pass
through mode) and some are only for the host, there is a strong use case
where a customer does not want a HID device connected to the host to be
able to control the guest.
In such a scenario, neither should we bind any input events to Qemu UI,
nor should we show menu options like "Grab on Hover" or "Grab Input".
This patch adds a GTK command line option called "input".
It can be set like this:
  gtk,input=3Doff/on

If set to on or completely left out, it will default to normal
operation where host HID devices can control the guests. However, if
turned off, then host HID devices will not be able to control the guest
windows.

Signed-off-by: Satyeshwar Singh <satyeshwar.singh@intel.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
Cc: Daniel P. Berrang=E9 <berrange@redhat.com>
---
 qapi/ui.json    |  6 +++++-
 qemu-options.hx |  5 ++++-
 ui/gtk.c        | 43 ++++++++++++++++++++++++++++++-------------
 3 files changed, 39 insertions(+), 15 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 98322342f7..f8644e6f48 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1214,6 +1214,9 @@
 #               Since 7.1
 # @show-menubar: Display the main window menubar. Defaults to "on".
 #                Since 8.0
+# @input:       Don't let host's HID devices control the guest. Defaults t=
o "on" so
+#               they can control the guest.
+#               Since 8.0
 #
 # Since: 2.12
 ##
@@ -1221,7 +1224,8 @@
   'data'    : { '*grab-on-hover' : 'bool',
                 '*zoom-to-fit'   : 'bool',
                 '*show-tabs'     : 'bool',
-                '*show-menubar'  : 'bool'  } }
+                '*show-menubar'  : 'bool',
+                '*input'         : 'bool'  } }
=20
 ##
 # @DisplayEGLHeadless:
diff --git a/qemu-options.hx b/qemu-options.hx
index 59bdf67a2c..22a78e294f 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1977,7 +1977,7 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
 #if defined(CONFIG_GTK)
     "-display gtk[,full-screen=3Don|off][,gl=3Don|off][,grab-on-hover=3Don=
|off]\n"
     "            [,show-tabs=3Don|off][,show-cursor=3Don|off][,window-clos=
e=3Don|off]\n"
-    "            [,show-menubar=3Don|off]\n"
+    "            [,show-menubar=3Don|off][,input=3Don|off]\n"
 #endif
 #if defined(CONFIG_VNC)
     "-display vnc=3D<display>[,<optargs>]\n"
@@ -2072,6 +2072,9 @@ SRST
=20
         ``show-menubar=3Don|off`` : Display the main window menubar, defau=
lts to "on"
=20
+        ``input=3Don|off``        : Don't let host's HID devices control t=
he guest
+                                  if set to "off", defaults to "on"
+
     ``curses[,charset=3D<encoding>]``
         Display video output via curses. For graphics device models
         which support a text mode, QEMU can display this output using a
diff --git a/ui/gtk.c b/ui/gtk.c
index f16e0f8dee..00446121c3 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1967,6 +1967,20 @@ static void gd_connect_vc_gfx_signals(VirtualConsole=
 *vc)
                          G_CALLBACK(gd_resize_event), vc);
     }
 #endif
+    if (qemu_console_is_graphic(vc->gfx.dcl.con)) {
+        g_signal_connect(vc->gfx.drawing_area, "configure-event",
+                         G_CALLBACK(gd_configure), vc);
+    }
+
+    /*
+     * Don't configure input events if the user has provided an option
+     * for input and explicitly set it to off. In this case, they want
+     * passthrough HID devices to control the guest.
+     */
+    if (vc->s->opts->u.gtk.has_input && !vc->s->opts->u.gtk.input ) {
+        return;
+    }
+
     if (qemu_console_is_graphic(vc->gfx.dcl.con)) {
         g_signal_connect(vc->gfx.drawing_area, "event",
                          G_CALLBACK(gd_event), vc);
@@ -1989,8 +2003,6 @@ static void gd_connect_vc_gfx_signals(VirtualConsole =
*vc)
                          G_CALLBACK(gd_focus_in_event), vc);
         g_signal_connect(vc->gfx.drawing_area, "focus-out-event",
                          G_CALLBACK(gd_focus_out_event), vc);
-        g_signal_connect(vc->gfx.drawing_area, "configure-event",
-                         G_CALLBACK(gd_configure), vc);
         g_signal_connect(vc->gfx.drawing_area, "grab-broken-event",
                          G_CALLBACK(gd_grab_broken_event), vc);
     } else {
@@ -2033,8 +2045,10 @@ static void gd_connect_signals(GtkDisplayState *s)
                      G_CALLBACK(gd_menu_zoom_fixed), s);
     g_signal_connect(s->zoom_fit_item, "activate",
                      G_CALLBACK(gd_menu_zoom_fit), s);
-    g_signal_connect(s->grab_item, "activate",
+    if (!s->opts->u.gtk.has_input || s->opts->u.gtk.input) {
+	    g_signal_connect(s->grab_item, "activate",
                      G_CALLBACK(gd_menu_grab_input), s);
+    }
     g_signal_connect(s->notebook, "switch-page",
                      G_CALLBACK(gd_change_page), s);
 }
@@ -2228,18 +2242,21 @@ static GtkWidget *gd_create_menu_view(GtkDisplaySta=
te *s, DisplayOptions *opts)
     s->zoom_fit_item =3D gtk_check_menu_item_new_with_mnemonic(_("Zoom To =
_Fit"));
     gtk_menu_shell_append(GTK_MENU_SHELL(view_menu), s->zoom_fit_item);
=20
-    separator =3D gtk_separator_menu_item_new();
-    gtk_menu_shell_append(GTK_MENU_SHELL(view_menu), separator);
=20
-    s->grab_on_hover_item =3D gtk_check_menu_item_new_with_mnemonic(_("Gra=
b On _Hover"));
-    gtk_menu_shell_append(GTK_MENU_SHELL(view_menu), s->grab_on_hover_item=
);
+    if (!s->opts->u.gtk.has_input || s->opts->u.gtk.input) {
+       separator =3D gtk_separator_menu_item_new();
+       gtk_menu_shell_append(GTK_MENU_SHELL(view_menu), separator);
=20
-    s->grab_item =3D gtk_check_menu_item_new_with_mnemonic(_("_Grab Input"=
));
-    gtk_menu_item_set_accel_path(GTK_MENU_ITEM(s->grab_item),
-                                 "<QEMU>/View/Grab Input");
-    gtk_accel_map_add_entry("<QEMU>/View/Grab Input", GDK_KEY_g,
-                            HOTKEY_MODIFIERS);
-    gtk_menu_shell_append(GTK_MENU_SHELL(view_menu), s->grab_item);
+       s->grab_on_hover_item =3D gtk_check_menu_item_new_with_mnemonic(_("=
Grab On _Hover"));
+       gtk_menu_shell_append(GTK_MENU_SHELL(view_menu), s->grab_on_hover_i=
tem);
+
+       s->grab_item =3D gtk_check_menu_item_new_with_mnemonic(_("_Grab Inp=
ut"));
+       gtk_menu_item_set_accel_path(GTK_MENU_ITEM(s->grab_item),
+                                    "<QEMU>/View/Grab Input");
+       gtk_accel_map_add_entry("<QEMU>/View/Grab Input", GDK_KEY_g,
+                               HOTKEY_MODIFIERS);
+       gtk_menu_shell_append(GTK_MENU_SHELL(view_menu), s->grab_item);
+    }
=20
     separator =3D gtk_separator_menu_item_new();
     gtk_menu_shell_append(GTK_MENU_SHELL(view_menu), separator);
--=20
2.33.1


