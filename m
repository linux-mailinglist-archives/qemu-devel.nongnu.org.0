Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0DF5F85C6
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Oct 2022 17:13:59 +0200 (CEST)
Received: from localhost ([::1]:34064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohBWY-0003OG-Dn
	for lists+qemu-devel@lfdr.de; Sat, 08 Oct 2022 11:13:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heecheol.yang@outlook.com>)
 id 1ohBUQ-00021u-72
 for qemu-devel@nongnu.org; Sat, 08 Oct 2022 11:11:47 -0400
Received: from mail-mw2nam12acsn20806.outbound.protection.outlook.com
 ([2a01:111:f400:fe5a::806]:33689
 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heecheol.yang@outlook.com>)
 id 1ohBUM-0003op-Rd
 for qemu-devel@nongnu.org; Sat, 08 Oct 2022 11:11:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1rofmgrHHOWbqCE+pyYM7SMj68kVfi4es7oBW0/1yMWGk7lW+EIKxTRzrCEpIH2voWfk0nbTZMEw38TzaVpVPyjGLKrAcxZyOqzY9L7BFR4eLZirEDYZpP57R8srciljE+JNRa/A05gFPSnyJw021U+hKZ9Fx2hoQmpdHcAtcjQgRSqg8QcTzE32jhyzxo7LkBM7uNGYW+IYpasdYgvZOmHFlXaiWG+j7+ecI+kItwdXM2MNzVFGF3JWm+B+MV1zTY2+Nken2sGAuIiK1wcCSb+rMRydb9kmZLfccyruPfP051n1QZ0M0e1K7oeno2zdGnVILgOKpFy6rUuEb/y7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5mxfZJOJ8zbkj0WETpFVHw+E7DBQH8GEucDX0apbXF4=;
 b=GYHzyoPSkc/zeEjXblJq94heO4KT5ycRl8bmm+A0uG0dimj62/TfZosKzhQa8ilimC3HVxH+oJDsWpscVNwGE9jXhi9eQkOidxrYlmNk3nLQEOP/fFGwjP0/Ef3dA4IiATuyqZSBTl9gAwvRUMig5NCsDEJJwwDdL3/8cFFbhYksD3r7QpVhWy2o5QmqlVCGMNW8S7o7J+OpFEwI/FEME9EHoatf3qRQHsTrC27HwwhGdGQb74qjIi63dbN4bR+4ApI3t5IaVlgvTh1T0zK0nmyKTKw/fvdWHTeKD/CyI6VpxpEdoDJRISuSlggMN92xEE03oAmviR1hOFNHCwz7yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mxfZJOJ8zbkj0WETpFVHw+E7DBQH8GEucDX0apbXF4=;
 b=cV/J3Wueufd+XTqRkJOflxeKYASVBjFpgVF1oGpyCdgWzxndlePt58MoH+XTEn5Kc9Kd3PEdxjOdpJOSWn0ngFSw/gUPHCauOOM8JuDzibQ2jFC+wk3eWDXOGSzCDgWEXuX2uzK50Pf0odrDx32ZkYa4Q3ZCrcGUV+DrdXXKSQO7HuHIPNOjeG2nskrWYyvW5t1qHvKOQESRB/HUaohLb/dUiPhodYMVUrb35WH1jaAIreLGTcvNQyYtFNKRhEXul804KMNt/sjWTNpTlOnSlT4R6r8BRwRoRxvpUQLOTOVw0SAj6xY08YTC00D31BxmXtkzS3DTQjSz/RXxUGhq3w==
Received: from DM5PR06MB2537.namprd06.prod.outlook.com (2603:10b6:3:53::19) by
 CO6PR06MB7089.namprd06.prod.outlook.com (2603:10b6:5:345::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.15; Sat, 8 Oct 2022 15:06:36 +0000
Received: from DM5PR06MB2537.namprd06.prod.outlook.com
 ([fe80::d5c9:d75f:47d5:45ea]) by DM5PR06MB2537.namprd06.prod.outlook.com
 ([fe80::d5c9:d75f:47d5:45ea%7]) with mapi id 15.20.5676.033; Sat, 8 Oct 2022
 15:06:36 +0000
From: Hee-cheol Yang <heecheol.yang@outlook.com>
To: Michael Rolnik <mrolnik@gmail.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 1/8] hw/avr: Add limited support for avr gpio registers
Thread-Topic: [PATCH 1/8] hw/avr: Add limited support for avr gpio registers
Thread-Index: AQHYxpnQB5+c8YczRU+NBa9n2c7Njq3zprUAgBEa5W8=
Date: Sat, 8 Oct 2022 15:06:36 +0000
Message-ID: <DM5PR06MB253735A4BA992987C3E7C8E3E65E9@DM5PR06MB2537.namprd06.prod.outlook.com>
References: <DM5PR06MB253775CC03F84F6A36F44370E6449@DM5PR06MB2537.namprd06.prod.outlook.com>
 <CAK4993hVNwnC5fAroLYxhJ1HM5xhg3yRKQ1X3NyyGRwUnzxS9g@mail.gmail.com>
In-Reply-To: <CAK4993hVNwnC5fAroLYxhJ1HM5xhg3yRKQ1X3NyyGRwUnzxS9g@mail.gmail.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [RyXJI6vierANvyRmUwp+Xm2jzqPBEbke]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM5PR06MB2537:EE_|CO6PR06MB7089:EE_
x-ms-office365-filtering-correlation-id: 8deca369-dc1a-4b50-61c8-08daa93eb230
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YD9+AFvsID04G+CubLA54Oarhagh7S7hiKRhr6DC2M11edC6gCezBTpqBHkSD6zSyoXAo/k9LG9rwWlHcAcYpQv2t5uaWv+SDhZV6us6W/OLdy1aOa/UuGzziSsup+XU1KiLkkGPBzPW4lEm/slkJXGYj7b7YBCAnIYVgCyCxD2GzvyI9mBdekRD8E/CwpvNTL+K+lKAeKcKHv94tS4pmt7U00wXkCO3uG24UsBqqhNB+tFvChKIf4rLjdmFXbCZVtYDXb0Y54upWSwqAvfqJHBZNsuZAHNSV7SEstFftQRlTSItjEc9O85sAj+RZ9y7tFPt9g0VMVjMW6fFHACn3TuVzLFYs1FiuiYWLpBQBwZEQjMxR+6bVOlJ/5foCeZB626GGcgznlFNoMicTg07wLNfTZmLsTaYl78Mh6cDEEAOmfw3ihedmaD+UqYtByZU+5QDMMN1FSqSlBHTmlAxN+6t2VBKkd56155VgV2l2PDOSUIDqgKY4dnIdXY7ptwTU/kXhjZHRJNKb27G9AnyR6kiCo9nOjH+lWfxt9IN7LQxDf0M2R/IUeRt1l+8aYdIqWzfMkQT4X4hfGJHNJsVWloV/4Kk7BTuiHWczBNx8p20Non/cA/upfqX4ikE4vfCXnzZqPDEWY1mqcfLAT28qaOREY3mWM6krrTqZIw9j9w1l3muAFlo2PgKVQF8eOgF
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?/Yr3EdgkZRUncVypzvlxd5JWHSRsZ3trNlw7sP9O9OpX7CPyrDb6PcuJ8p?=
 =?iso-8859-1?Q?WP1vdrJYtr+Yip9M8HRyb5A9cB5o/epYc7JrypG/UJTSK+lq9No8aznTqg?=
 =?iso-8859-1?Q?FfpasPbnaOADtcD7H0Z+e2J2V6u+D6d/60qGxlCVhae96h53pjfy/ubjx8?=
 =?iso-8859-1?Q?ci+dPhHBkxhgtO+iCFmIGLNhNL1Bt61F+HK/xX2Ibm8cDu8/dV9TGRKIae?=
 =?iso-8859-1?Q?79LbBbq8h15HwY9YzpS+yWqtqU9qgeoYFj2Df77jzIuB/dwPu/QW9wfRB8?=
 =?iso-8859-1?Q?MTd2LDD2KJSWFJFDrgujP86Jd0q0/SwuWB8ZOuzQbbQ6m2ymxQWJbNUMEj?=
 =?iso-8859-1?Q?Dok2Yuj/A9QQoL4hv16O+lvrL1xIqHLqqPeo5Q9tgOfrk5J1Q3CA8PUGA0?=
 =?iso-8859-1?Q?fpVYVgusKbWmrEl72aeV3ayTcSkljsgCiW8GWfSrtmLzAjZJDfgDNBOS6d?=
 =?iso-8859-1?Q?CnCt1neE69ibyHEdYmgFmuhrSKiF+NVJrDTCmslRHFPiPmdrfc+ES2wTHI?=
 =?iso-8859-1?Q?mHTdVAwXsYALcIMxQZXmouEDZlchNaCFwhj+gB8x+Krh9yYzlE+8FhsWrb?=
 =?iso-8859-1?Q?4ikWIWYHt2dEmKy5s+zD47CRXtctqwvbfda58EERFURSIHIXW2UO81AzLu?=
 =?iso-8859-1?Q?ealr7aGWlyNdsdYRf1udDfHzLH2KlqQr/1D7w+sf/BcMAlNxhe9f1fPHu+?=
 =?iso-8859-1?Q?VXbQxwOyB2BHROc6f0ycDk9F1n91MdKmi/ICHQRcz/aviCVZ+RxQUZ+yZL?=
 =?iso-8859-1?Q?jmKYc3tkl4a2Oq6FEQWotCouvfCULHrLpMnqinqTCMTThH4YZiVP756cum?=
 =?iso-8859-1?Q?tfQr6JeZgfaD4ZARFysnTYmFvmS/6OC8DH7T3i81pp2BLAaNz95F/wJCl1?=
 =?iso-8859-1?Q?d5VUQvCFHonZCkDFUcMDUG4Qz6E2OL+OxJfETKLUloLo6ZjjJWxE5yJr8B?=
 =?iso-8859-1?Q?bEDfwYgNAOtUbx4gk+IllqC1zr/JYgbCdDotTig524xIaorxwN8aYITymW?=
 =?iso-8859-1?Q?QuUrfF8u0KEaJrD8zMSP978pVuBInwoEovHdzRhN9w5tVd4pMLYyKTNINg?=
 =?iso-8859-1?Q?SD5SGRMQrdQYF6zsQ2Gj4vFSDKM0glbKk58Ogz/SQwEvwIoDKWMarGJgnZ?=
 =?iso-8859-1?Q?6itKt1fEUN8P7UlboDZnPFvfxK2R7I33ZDBch9B/HgdC5G2bGpMrf1Wwl+?=
 =?iso-8859-1?Q?+0sYOmZ88HYxAe9sGnzEW6ggyPrkNe31gE541qjMJk2oMlcNKvi7cpBOyu?=
 =?iso-8859-1?Q?Em5IRl1qV9BOi3eCUPoB2VhtqiyDYhRTFh7ttI9eX9hlUPgvVFQBJ9O7eK?=
 =?iso-8859-1?Q?F7qSEUk9Hz7nykBDdiMKa+QYJybOvFP7DkXm4x64qEne8Wc=3D?=
Content-Type: multipart/alternative;
 boundary="_000_DM5PR06MB253735A4BA992987C3E7C8E3E65E9DM5PR06MB2537namp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR06MB2537.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 8deca369-dc1a-4b50-61c8-08daa93eb230
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2022 15:06:36.8771 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR06MB7089
Received-SPF: pass client-ip=2a01:111:f400:fe5a::806;
 envelope-from=heecheol.yang@outlook.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, HTTPS_HTTP_MISMATCH=0.1, SPF_HELO_PASS=-0.001,
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

--_000_DM5PR06MB253735A4BA992987C3E7C8E3E65E9DM5PR06MB2537namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Sorry for your inconvenience.
There's something wrong on my patchwork.

I'll upload them again and share the link soon.


Thanks again.
Best regards

Heecheol yang
________________________________
From: Michael Rolnik <mrolnik@gmail.com>
Sent: Wednesday, September 28, 2022 2:52:48 AM
To: Heecheol Yang <heecheol.yang@outlook.com>
Cc: qemu-devel@nongnu.org <qemu-devel@nongnu.org>; Philippe Mathieu-Daud=E9=
 <f4bug@amsat.org>
Subject: Re: [PATCH 1/8] hw/avr: Add limited support for avr gpio registers

Hi all,

Is there any kind of web UI where I can review it?
I don't find this patch in https://patchew.org/<https://nam12.safelinks.pro=
tection.outlook.com/?url=3Dhttps%3A%2F%2Fpatchew.org%2F&data=3D05%7C01%7C%7=
Cd9ed323c3bfb446283d608daa0b12d31%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C=
0%7C637998980070472344%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoi=
V2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DC7fUyn1FKu62=
nDe7yTHNdSr0%2F3nXh%2BcdQznlYlTqPRg%3D&reserved=3D0>  (there is only 2 year=
 old version (https://patchew.org/search?q=3Dproject%3AQEMU+%22hw%2Favr%22<=
https://nam12.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatchew=
.org%2Fsearch%3Fq%3Dproject%253AQEMU%2B%2522hw%252Favr%2522&data=3D05%7C01%=
7C%7Cd9ed323c3bfb446283d608daa0b12d31%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C=
1%7C0%7C637998980070628584%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQ=
IjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DIeBgjcAe=
Ps3ZAkcmH0IVysVB%2FS0etfjL%2FP0XB8a%2BWQ4%3D&reserved=3D0>))

Thank you,
Michael Rolnik

On Mon, Sep 12, 2022 at 2:21 PM Heecheol Yang <heecheol.yang@outlook.com<ma=
ilto:heecheol.yang@outlook.com>> wrote:
Add some of these features for AVR GPIO:

  - GPIO I/O : PORTx registers
  - Data Direction : DDRx registers
  - DDRx toggling : PINx registers

Following things are not supported yet:
  - MCUR registers

Signed-off-by: Heecheol Yang <heecheol.yang@outlook.com<mailto:heecheol.yan=
g@outlook.com>>
Reviewed-by: Michael Rolnik <mrolnik@gmail.com<mailto:mrolnik@gmail.com>>
Message-Id: <DM6PR16MB247368DBD3447ABECDD795D7E6090@DM6PR16MB2473.namprd16.=
prod.outlook.com<mailto:DM6PR16MB247368DBD3447ABECDD795D7E6090@DM6PR16MB247=
3.namprd16.prod.outlook.com>>
[PMD: Use AVR_GPIO_COUNT]
Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org<mailto:f4bug@amsat=
.org>>
Message-Id: <20210313165445.2113938-4-f4bug@amsat.org<mailto:20210313165445=
.2113938-4-f4bug@amsat.org>>
---
 hw/avr/Kconfig             |   1 +
 hw/avr/atmega.c            |   7 +-
 hw/avr/atmega.h            |   2 +
 hw/gpio/Kconfig            |   3 +
 hw/gpio/avr_gpio.c         | 138 +++++++++++++++++++++++++++++++++++++
 hw/gpio/meson.build        |   1 +
 include/hw/gpio/avr_gpio.h |  53 ++++++++++++++
 7 files changed, 203 insertions(+), 2 deletions(-)
 create mode 100644 hw/gpio/avr_gpio.c
 create mode 100644 include/hw/gpio/avr_gpio.h

diff --git a/hw/avr/Kconfig b/hw/avr/Kconfig
index d31298c3cc..16a57ced11 100644
--- a/hw/avr/Kconfig
+++ b/hw/avr/Kconfig
@@ -3,6 +3,7 @@ config AVR_ATMEGA_MCU
     select AVR_TIMER16
     select AVR_USART
     select AVR_POWER
+    select AVR_GPIO

 config ARDUINO
     select AVR_ATMEGA_MCU
diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c
index a34803e642..f5fb3a5225 100644
--- a/hw/avr/atmega.c
+++ b/hw/avr/atmega.c
@@ -282,8 +282,11 @@ static void atmega_realize(DeviceState *dev, Error **e=
rrp)
             continue;
         }
         devname =3D g_strdup_printf("atmega-gpio-%c", 'a' + (char)i);
-        create_unimplemented_device(devname,
-                                    OFFSET_DATA + mc->dev[idx].addr, 3);
+        object_initialize_child(OBJECT(dev), devname, &s->gpio[i],
+                                TYPE_AVR_GPIO);
+        sysbus_realize(SYS_BUS_DEVICE(&s->gpio[i]), &error_abort);
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio[i]), 0,
+                        OFFSET_DATA + mc->dev[idx].addr);
         g_free(devname);
     }

diff --git a/hw/avr/atmega.h b/hw/avr/atmega.h
index a99ee15c7e..e2289d5744 100644
--- a/hw/avr/atmega.h
+++ b/hw/avr/atmega.h
@@ -13,6 +13,7 @@

 #include "hw/char/avr_usart.h"
 #include "hw/timer/avr_timer16.h"
+#include "hw/gpio/avr_gpio.h"
 #include "hw/misc/avr_power.h"
 #include "target/avr/cpu.h"
 #include "qom/object.h"
@@ -44,6 +45,7 @@ struct AtmegaMcuState {
     DeviceState *io;
     AVRMaskState pwr[POWER_MAX];
     AVRUsartState usart[USART_MAX];
+    AVRGPIOState gpio[GPIO_MAX];
     AVRTimer16State timer[TIMER_MAX];
     uint64_t xtal_freq_hz;
 };
diff --git a/hw/gpio/Kconfig b/hw/gpio/Kconfig
index f0e7405f6e..fde7019b2b 100644
--- a/hw/gpio/Kconfig
+++ b/hw/gpio/Kconfig
@@ -13,3 +13,6 @@ config GPIO_PWR

 config SIFIVE_GPIO
     bool
+
+config AVR_GPIO
+    bool
diff --git a/hw/gpio/avr_gpio.c b/hw/gpio/avr_gpio.c
new file mode 100644
index 0000000000..cdb574ef0d
--- /dev/null
+++ b/hw/gpio/avr_gpio.c
@@ -0,0 +1,138 @@
+/*
+ * AVR processors GPIO registers emulation.
+ *
+ * Copyright (C) 2020 Heecheol Yang <heecheol.yang@outlook.com<mailto:heec=
heol.yang@outlook.com>>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 or
+ * (at your option) version 3 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/<https://na=
m12.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.gnu.org%2Flice=
nses%2F&data=3D05%7C01%7C%7Cd9ed323c3bfb446283d608daa0b12d31%7C84df9e7fe9f6=
40afb435aaaaaaaaaaaa%7C1%7C0%7C637998980070628584%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C=
%7C%7C&sdata=3DTJFNdHECVf2ZYpH10ueb79F9qD9X9GoSE9ar8qL1Gfg%3D&reserved=3D0>=
>.
+ */
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/sysbus.h"
+#include "hw/irq.h"
+#include "hw/gpio/avr_gpio.h"
+#include "hw/qdev-properties.h"
+
+static void avr_gpio_reset(DeviceState *dev)
+{
+    AVRGPIOState *gpio =3D AVR_GPIO(dev);
+
+    gpio->reg.pin =3D 0u;
+    gpio->reg.ddr =3D 0u;
+    gpio->reg.port =3D 0u;
+}
+
+static void avr_gpio_write_port(AVRGPIOState *s, uint64_t value)
+{
+    uint8_t pin;
+    uint8_t cur_port_val =3D s->reg.port;
+    uint8_t cur_ddr_val =3D s->reg.ddr;
+
+    for (pin =3D 0u; pin < AVR_GPIO_COUNT ; pin++) {
+        uint8_t cur_port_pin_val =3D cur_port_val & 0x01u;
+        uint8_t cur_ddr_pin_val =3D cur_ddr_val & 0x01u;
+        uint8_t new_port_pin_val =3D value & 0x01u;
+
+        if (cur_ddr_pin_val && (cur_port_pin_val !=3D new_port_pin_val)) {
+            qemu_set_irq(s->out[pin], new_port_pin_val);
+        }
+        cur_port_val >>=3D 1u;
+        cur_ddr_val >>=3D 1u;
+        value >>=3D 1u;
+    }
+    s->reg.port =3D value & s->reg.ddr;
+}
+static uint64_t avr_gpio_read(void *opaque, hwaddr offset, unsigned int si=
ze)
+{
+    AVRGPIOState *s =3D (AVRGPIOState *)opaque;
+    switch (offset) {
+    case GPIO_PIN:
+        return s->reg.pin;
+    case GPIO_DDR:
+        return s->reg.ddr;
+    case GPIO_PORT:
+        return s->reg.port;
+    default:
+        g_assert_not_reached();
+        break;
+    }
+    return 0;
+}
+
+static void avr_gpio_write(void *opaque, hwaddr offset, uint64_t value,
+                                unsigned int size)
+{
+    AVRGPIOState *s =3D (AVRGPIOState *)opaque;
+    value =3D value & 0xF;
+    switch (offset) {
+    case GPIO_PIN:
+        s->reg.pin =3D value;
+        s->reg.port ^=3D s->reg.pin;
+        break;
+    case GPIO_DDR:
+        s->reg.ddr =3D value;
+        break;
+    case GPIO_PORT:
+        avr_gpio_write_port(s, value);
+        break;
+    default:
+        g_assert_not_reached();
+        break;
+    }
+}
+
+static const MemoryRegionOps avr_gpio_ops =3D {
+    .read =3D avr_gpio_read,
+    .write =3D avr_gpio_write,
+    .endianness =3D DEVICE_NATIVE_ENDIAN,
+};
+
+static void avr_gpio_init(Object *obj)
+{
+    AVRGPIOState *s =3D AVR_GPIO(obj);
+
+    qdev_init_gpio_out(DEVICE(obj), s->out, ARRAY_SIZE(s->out));
+    memory_region_init_io(&s->mmio, obj, &avr_gpio_ops, s, TYPE_AVR_GPIO, =
3);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
+}
+static void avr_gpio_realize(DeviceState *dev, Error **errp)
+{
+    /* Do nothing currently */
+}
+
+
+static void avr_gpio_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+
+    dc->reset =3D avr_gpio_reset;
+    dc->realize =3D avr_gpio_realize;
+}
+
+static const TypeInfo avr_gpio_info =3D {
+    .name          =3D TYPE_AVR_GPIO,
+    .parent        =3D TYPE_SYS_BUS_DEVICE,
+    .instance_size =3D sizeof(AVRGPIOState),
+    .instance_init =3D avr_gpio_init,
+    .class_init    =3D avr_gpio_class_init,
+};
+
+static void avr_gpio_register_types(void)
+{
+    type_register_static(&avr_gpio_info);
+}
+
+type_init(avr_gpio_register_types)
diff --git a/hw/gpio/meson.build b/hw/gpio/meson.build
index 7bd6a57264..ef372bdd3b 100644
--- a/hw/gpio/meson.build
+++ b/hw/gpio/meson.build
@@ -12,3 +12,4 @@ softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_=
gpio.c'))
 softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_gpio.c'))
 softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_gpio.c'))
 softmmu_ss.add(when: 'CONFIG_SIFIVE_GPIO', if_true: files('sifive_gpio.c')=
)
+softmmu_ss.add(when: 'CONFIG_AVR_GPIO', if_true: files('avr_gpio.c'))
diff --git a/include/hw/gpio/avr_gpio.h b/include/hw/gpio/avr_gpio.h
new file mode 100644
index 0000000000..498a7275f0
--- /dev/null
+++ b/include/hw/gpio/avr_gpio.h
@@ -0,0 +1,53 @@
+/*
+ * AVR processors GPIO registers definition.
+ *
+ * Copyright (C) 2020 Heecheol Yang <heecheol.yang@outlook.com<mailto:heec=
heol.yang@outlook.com>>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 or
+ * (at your option) version 3 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/<https://na=
m12.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.gnu.org%2Flice=
nses%2F&data=3D05%7C01%7C%7Cd9ed323c3bfb446283d608daa0b12d31%7C84df9e7fe9f6=
40afb435aaaaaaaaaaaa%7C1%7C0%7C637998980070628584%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C=
%7C%7C&sdata=3DTJFNdHECVf2ZYpH10ueb79F9qD9X9GoSE9ar8qL1Gfg%3D&reserved=3D0>=
>.
+ */
+
+#ifndef AVR_GPIO_H
+#define AVR_GPIO_H
+
+#include "hw/sysbus.h"
+#include "qom/object.h"
+
+/* Offsets of registers. */
+#define GPIO_PIN   0x00
+#define GPIO_DDR   0x01
+#define GPIO_PORT  0x02
+
+#define TYPE_AVR_GPIO "avr-gpio"
+OBJECT_DECLARE_SIMPLE_TYPE(AVRGPIOState, AVR_GPIO)
+#define AVR_GPIO_COUNT 8
+
+struct AVRGPIOState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion mmio;
+
+    struct {
+        uint8_t pin;
+        uint8_t ddr;
+        uint8_t port;
+    } reg;
+
+    /* PORTx data changed IRQs */
+    qemu_irq out[8u];
+
+};
+
+#endif /* AVR_GPIO_H */
--
2.34.1



--
Best Regards,
Michael Rolnik

--_000_DM5PR06MB253735A4BA992987C3E7C8E3E65E9DM5PR06MB2537namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
" dir=3D"auto">
Sorry for your inconvenience.&nbsp;</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
" dir=3D"auto">
There's something wrong on my patchwork.&nbsp;</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
" dir=3D"auto">
<br>
</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
" dir=3D"auto">
I'll upload them again and share the link soon.&nbsp;</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
" dir=3D"auto">
<br>
</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
" dir=3D"auto">
<br>
</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
" dir=3D"auto">
Thanks again.&nbsp;</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
" dir=3D"auto">
Best regards&nbsp;</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
" dir=3D"auto">
<br>
</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
" dir=3D"auto">
Heecheol yang&nbsp;</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Michael Rolnik &lt;mr=
olnik@gmail.com&gt;<br>
<b>Sent:</b> Wednesday, September 28, 2022 2:52:48 AM<br>
<b>To:</b> Heecheol Yang &lt;heecheol.yang@outlook.com&gt;<br>
<b>Cc:</b> qemu-devel@nongnu.org &lt;qemu-devel@nongnu.org&gt;; Philippe Ma=
thieu-Daud=E9 &lt;f4bug@amsat.org&gt;<br>
<b>Subject:</b> Re: [PATCH 1/8] hw/avr: Add limited support for avr gpio re=
gisters</font>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"ltr">Hi all,
<div><br>
</div>
<div>Is there any kind of web UI where I can review it?</div>
<div>I don't find this patch in&nbsp;<a href=3D"https://nam12.safelinks.pro=
tection.outlook.com/?url=3Dhttps%3A%2F%2Fpatchew.org%2F&amp;data=3D05%7C01%=
7C%7Cd9ed323c3bfb446283d608daa0b12d31%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C=
1%7C0%7C637998980070472344%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQ=
IjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DC7fU=
yn1FKu62nDe7yTHNdSr0%2F3nXh%2BcdQznlYlTqPRg%3D&amp;reserved=3D0" originalsr=
c=3D"https://patchew.org/" shash=3D"jquhyyd//4BPTntIpKbMykBZ8Fkv370eCCvDHVi=
/1RbroxyrZQ06Mu+NLqoKMBspzVAdn1B3h+p61e+QcfdNKb45Ma/NjJ+GdLkeKsRme3XUOUepC+=
LkMesonToBlnvNhno5XbSqTW1x8oZU/kERxUPyMJ/2/1nU8CY+WtAvxIQ=3D">https://patch=
ew.org/</a>&nbsp;
 (there is only 2 year old version (<a href=3D"https://nam12.safelinks.prot=
ection.outlook.com/?url=3Dhttps%3A%2F%2Fpatchew.org%2Fsearch%3Fq%3Dproject%=
253AQEMU%2B%2522hw%252Favr%2522&amp;data=3D05%7C01%7C%7Cd9ed323c3bfb446283d=
608daa0b12d31%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C6379989800706285=
84%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1h=
aWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DIeBgjcAePs3ZAkcmH0IVysVB%2FS=
0etfjL%2FP0XB8a%2BWQ4%3D&amp;reserved=3D0" originalsrc=3D"https://patchew.o=
rg/search?q=3Dproject%3AQEMU+%22hw%2Favr%22" shash=3D"KHGakyYp8Broj5C9G7muv=
EShYi07s9mw/mpLb2Qex3qWzFtXkvVaT4eq59ubEhfQFGZ1BWP8qbJn9LdloMQUCnBbVpNl/D9A=
DjBZ4XxFQxgEeYAAKnimLNVIvyfE+s8XiEDT19vL0oCgjpwmQK5Vkhk3k3BQa8tRsG7q03Op314=
=3D">https://patchew.org/search?q=3Dproject%3AQEMU+%22hw%2Favr%22</a>))</di=
v>
<div><br>
</div>
<div>Thank you,</div>
<div>Michael Rolnik</div>
</div>
<br>
<div class=3D"x_gmail_quote">
<div dir=3D"ltr" class=3D"x_gmail_attr">On Mon, Sep 12, 2022 at 2:21 PM Hee=
cheol Yang &lt;<a href=3D"mailto:heecheol.yang@outlook.com">heecheol.yang@o=
utlook.com</a>&gt; wrote:<br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bord=
er-left:1px solid rgb(204,204,204); padding-left:1ex">
Add some of these features for AVR GPIO:<br>
<br>
&nbsp; - GPIO I/O : PORTx registers<br>
&nbsp; - Data Direction : DDRx registers<br>
&nbsp; - DDRx toggling : PINx registers<br>
<br>
Following things are not supported yet:<br>
&nbsp; - MCUR registers<br>
<br>
Signed-off-by: Heecheol Yang &lt;<a href=3D"mailto:heecheol.yang@outlook.co=
m" target=3D"_blank">heecheol.yang@outlook.com</a>&gt;<br>
Reviewed-by: Michael Rolnik &lt;<a href=3D"mailto:mrolnik@gmail.com" target=
=3D"_blank">mrolnik@gmail.com</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:DM6PR16MB247368DBD3447ABECDD795D7E6090@DM=
6PR16MB2473.namprd16.prod.outlook.com" target=3D"_blank">DM6PR16MB247368DBD=
3447ABECDD795D7E6090@DM6PR16MB2473.namprd16.prod.outlook.com</a>&gt;<br>
[PMD: Use AVR_GPIO_COUNT]<br>
Signed-off-by: Philippe Mathieu-Daud=E9 &lt;<a href=3D"mailto:f4bug@amsat.o=
rg" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20210313165445.2113938-4-f4bug@amsat.org"=
 target=3D"_blank">20210313165445.2113938-4-f4bug@amsat.org</a>&gt;<br>
---<br>
&nbsp;hw/avr/Kconfig&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp;=
 &nbsp;1 +<br>
&nbsp;hw/avr/atmega.c&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; &nbs=
p;7 +-<br>
&nbsp;hw/avr/atmega.h&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; &nbs=
p;2 +<br>
&nbsp;hw/gpio/Kconfig&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; &nbs=
p;3 +<br>
&nbsp;hw/gpio/avr_gpio.c&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 138 +++++++++++=
++++++++++++++++++++++++++<br>
&nbsp;hw/gpio/meson.build&nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; &nbsp;1 +<br>
&nbsp;include/hw/gpio/avr_gpio.h |&nbsp; 53 ++++++++++++++<br>
&nbsp;7 files changed, 203 insertions(+), 2 deletions(-)<br>
&nbsp;create mode 100644 hw/gpio/avr_gpio.c<br>
&nbsp;create mode 100644 include/hw/gpio/avr_gpio.h<br>
<br>
diff --git a/hw/avr/Kconfig b/hw/avr/Kconfig<br>
index d31298c3cc..16a57ced11 100644<br>
--- a/hw/avr/Kconfig<br>
+++ b/hw/avr/Kconfig<br>
@@ -3,6 +3,7 @@ config AVR_ATMEGA_MCU<br>
&nbsp; &nbsp; &nbsp;select AVR_TIMER16<br>
&nbsp; &nbsp; &nbsp;select AVR_USART<br>
&nbsp; &nbsp; &nbsp;select AVR_POWER<br>
+&nbsp; &nbsp; select AVR_GPIO<br>
<br>
&nbsp;config ARDUINO<br>
&nbsp; &nbsp; &nbsp;select AVR_ATMEGA_MCU<br>
diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c<br>
index a34803e642..f5fb3a5225 100644<br>
--- a/hw/avr/atmega.c<br>
+++ b/hw/avr/atmega.c<br>
@@ -282,8 +282,11 @@ static void atmega_realize(DeviceState *dev, Error **e=
rrp)<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;continue;<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;devname =3D g_strdup_printf(&quot;atmega-=
gpio-%c&quot;, 'a' + (char)i);<br>
-&nbsp; &nbsp; &nbsp; &nbsp; create_unimplemented_device(devname,<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; OFFSET_DATA + mc-&gt;de=
v[idx].addr, 3);<br>
+&nbsp; &nbsp; &nbsp; &nbsp; object_initialize_child(OBJECT(dev), devname, =
&amp;s-&gt;gpio[i],<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TYPE_AVR_GPIO);<br>
+&nbsp; &nbsp; &nbsp; &nbsp; sysbus_realize(SYS_BUS_DEVICE(&amp;s-&gt;gpio[=
i]), &amp;error_abort);<br>
+&nbsp; &nbsp; &nbsp; &nbsp; sysbus_mmio_map(SYS_BUS_DEVICE(&amp;s-&gt;gpio=
[i]), 0,<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; OFFSET_DATA + mc-&gt;dev[idx].addr);<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;g_free(devname);<br>
&nbsp; &nbsp; &nbsp;}<br>
<br>
diff --git a/hw/avr/atmega.h b/hw/avr/atmega.h<br>
index a99ee15c7e..e2289d5744 100644<br>
--- a/hw/avr/atmega.h<br>
+++ b/hw/avr/atmega.h<br>
@@ -13,6 +13,7 @@<br>
<br>
&nbsp;#include &quot;hw/char/avr_usart.h&quot;<br>
&nbsp;#include &quot;hw/timer/avr_timer16.h&quot;<br>
+#include &quot;hw/gpio/avr_gpio.h&quot;<br>
&nbsp;#include &quot;hw/misc/avr_power.h&quot;<br>
&nbsp;#include &quot;target/avr/cpu.h&quot;<br>
&nbsp;#include &quot;qom/object.h&quot;<br>
@@ -44,6 +45,7 @@ struct AtmegaMcuState {<br>
&nbsp; &nbsp; &nbsp;DeviceState *io;<br>
&nbsp; &nbsp; &nbsp;AVRMaskState pwr[POWER_MAX];<br>
&nbsp; &nbsp; &nbsp;AVRUsartState usart[USART_MAX];<br>
+&nbsp; &nbsp; AVRGPIOState gpio[GPIO_MAX];<br>
&nbsp; &nbsp; &nbsp;AVRTimer16State timer[TIMER_MAX];<br>
&nbsp; &nbsp; &nbsp;uint64_t xtal_freq_hz;<br>
&nbsp;};<br>
diff --git a/hw/gpio/Kconfig b/hw/gpio/Kconfig<br>
index f0e7405f6e..fde7019b2b 100644<br>
--- a/hw/gpio/Kconfig<br>
+++ b/hw/gpio/Kconfig<br>
@@ -13,3 +13,6 @@ config GPIO_PWR<br>
<br>
&nbsp;config SIFIVE_GPIO<br>
&nbsp; &nbsp; &nbsp;bool<br>
+<br>
+config AVR_GPIO<br>
+&nbsp; &nbsp; bool<br>
diff --git a/hw/gpio/avr_gpio.c b/hw/gpio/avr_gpio.c<br>
new file mode 100644<br>
index 0000000000..cdb574ef0d<br>
--- /dev/null<br>
+++ b/hw/gpio/avr_gpio.c<br>
@@ -0,0 +1,138 @@<br>
+/*<br>
+ * AVR processors GPIO registers emulation.<br>
+ *<br>
+ * Copyright (C) 2020 Heecheol Yang &lt;<a href=3D"mailto:heecheol.yang@ou=
tlook.com" target=3D"_blank">heecheol.yang@outlook.com</a>&gt;<br>
+ *<br>
+ * This program is free software; you can redistribute it and/or<br>
+ * modify it under the terms of the GNU General Public License as<br>
+ * published by the Free Software Foundation; either version 2 or<br>
+ * (at your option) version 3 of the License.<br>
+ *<br>
+ * This program is distributed in the hope that it will be useful,<br>
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.&nbsp; See the<br>
+ * GNU General Public License for more details.<br>
+ *<br>
+ * You should have received a copy of the GNU General Public License along=
<br>
+ * with this program; if not, see &lt;<a href=3D"https://nam12.safelinks.p=
rotection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.gnu.org%2Flicenses%2F&amp;dat=
a=3D05%7C01%7C%7Cd9ed323c3bfb446283d608daa0b12d31%7C84df9e7fe9f640afb435aaa=
aaaaaaaaa%7C1%7C0%7C637998980070628584%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w=
LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;=
sdata=3DTJFNdHECVf2ZYpH10ueb79F9qD9X9GoSE9ar8qL1Gfg%3D&amp;reserved=3D0" or=
iginalsrc=3D"http://www.gnu.org/licenses/" shash=3D"LfUhc8maejUkczc/cbl81Hl=
k/ITtUsliIi4AN2DeEE6dJVfEJpaNbClhzd9fgXeAsGoJcQdwHfBQov9qIPcsgv3Vdo0NWPfOxi=
sKrOptdM/fsnGHWrl52gdABLbD39ymsUz7ZLGONo8P/4SRFK1PwCf0G720TT9cucWHLXBlgtA=
=3D" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/licenses/</a>&=
gt;.<br>
+ */<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qemu/log.h&quot;<br>
+#include &quot;qemu/module.h&quot;<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qapi/error.h&quot;<br>
+#include &quot;hw/sysbus.h&quot;<br>
+#include &quot;hw/irq.h&quot;<br>
+#include &quot;hw/gpio/avr_gpio.h&quot;<br>
+#include &quot;hw/qdev-properties.h&quot;<br>
+<br>
+static void avr_gpio_reset(DeviceState *dev)<br>
+{<br>
+&nbsp; &nbsp; AVRGPIOState *gpio =3D AVR_GPIO(dev);<br>
+<br>
+&nbsp; &nbsp; gpio-&gt;reg.pin =3D 0u;<br>
+&nbsp; &nbsp; gpio-&gt;reg.ddr =3D 0u;<br>
+&nbsp; &nbsp; gpio-&gt;reg.port =3D 0u;<br>
+}<br>
+<br>
+static void avr_gpio_write_port(AVRGPIOState *s, uint64_t value)<br>
+{<br>
+&nbsp; &nbsp; uint8_t pin;<br>
+&nbsp; &nbsp; uint8_t cur_port_val =3D s-&gt;reg.port;<br>
+&nbsp; &nbsp; uint8_t cur_ddr_val =3D s-&gt;reg.ddr;<br>
+<br>
+&nbsp; &nbsp; for (pin =3D 0u; pin &lt; AVR_GPIO_COUNT ; pin++) {<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uint8_t cur_port_pin_val =3D cur_port_val &amp=
; 0x01u;<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uint8_t cur_ddr_pin_val =3D cur_ddr_val &amp; =
0x01u;<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uint8_t new_port_pin_val =3D value &amp; 0x01u=
;<br>
+<br>
+&nbsp; &nbsp; &nbsp; &nbsp; if (cur_ddr_pin_val &amp;&amp; (cur_port_pin_v=
al !=3D new_port_pin_val)) {<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; qemu_set_irq(s-&gt;out[pin], new=
_port_pin_val);<br>
+&nbsp; &nbsp; &nbsp; &nbsp; }<br>
+&nbsp; &nbsp; &nbsp; &nbsp; cur_port_val &gt;&gt;=3D 1u;<br>
+&nbsp; &nbsp; &nbsp; &nbsp; cur_ddr_val &gt;&gt;=3D 1u;<br>
+&nbsp; &nbsp; &nbsp; &nbsp; value &gt;&gt;=3D 1u;<br>
+&nbsp; &nbsp; }<br>
+&nbsp; &nbsp; s-&gt;reg.port =3D value &amp; s-&gt;reg.ddr;<br>
+}<br>
+static uint64_t avr_gpio_read(void *opaque, hwaddr offset, unsigned int si=
ze)<br>
+{<br>
+&nbsp; &nbsp; AVRGPIOState *s =3D (AVRGPIOState *)opaque;<br>
+&nbsp; &nbsp; switch (offset) {<br>
+&nbsp; &nbsp; case GPIO_PIN:<br>
+&nbsp; &nbsp; &nbsp; &nbsp; return s-&gt;reg.pin;<br>
+&nbsp; &nbsp; case GPIO_DDR:<br>
+&nbsp; &nbsp; &nbsp; &nbsp; return s-&gt;reg.ddr;<br>
+&nbsp; &nbsp; case GPIO_PORT:<br>
+&nbsp; &nbsp; &nbsp; &nbsp; return s-&gt;reg.port;<br>
+&nbsp; &nbsp; default:<br>
+&nbsp; &nbsp; &nbsp; &nbsp; g_assert_not_reached();<br>
+&nbsp; &nbsp; &nbsp; &nbsp; break;<br>
+&nbsp; &nbsp; }<br>
+&nbsp; &nbsp; return 0;<br>
+}<br>
+<br>
+static void avr_gpio_write(void *opaque, hwaddr offset, uint64_t value,<br=
>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; unsigned int size)<br>
+{<br>
+&nbsp; &nbsp; AVRGPIOState *s =3D (AVRGPIOState *)opaque;<br>
+&nbsp; &nbsp; value =3D value &amp; 0xF;<br>
+&nbsp; &nbsp; switch (offset) {<br>
+&nbsp; &nbsp; case GPIO_PIN:<br>
+&nbsp; &nbsp; &nbsp; &nbsp; s-&gt;reg.pin =3D value;<br>
+&nbsp; &nbsp; &nbsp; &nbsp; s-&gt;reg.port ^=3D s-&gt;reg.pin;<br>
+&nbsp; &nbsp; &nbsp; &nbsp; break;<br>
+&nbsp; &nbsp; case GPIO_DDR:<br>
+&nbsp; &nbsp; &nbsp; &nbsp; s-&gt;reg.ddr =3D value;<br>
+&nbsp; &nbsp; &nbsp; &nbsp; break;<br>
+&nbsp; &nbsp; case GPIO_PORT:<br>
+&nbsp; &nbsp; &nbsp; &nbsp; avr_gpio_write_port(s, value);<br>
+&nbsp; &nbsp; &nbsp; &nbsp; break;<br>
+&nbsp; &nbsp; default:<br>
+&nbsp; &nbsp; &nbsp; &nbsp; g_assert_not_reached();<br>
+&nbsp; &nbsp; &nbsp; &nbsp; break;<br>
+&nbsp; &nbsp; }<br>
+}<br>
+<br>
+static const MemoryRegionOps avr_gpio_ops =3D {<br>
+&nbsp; &nbsp; .read =3D avr_gpio_read,<br>
+&nbsp; &nbsp; .write =3D avr_gpio_write,<br>
+&nbsp; &nbsp; .endianness =3D DEVICE_NATIVE_ENDIAN,<br>
+};<br>
+<br>
+static void avr_gpio_init(Object *obj)<br>
+{<br>
+&nbsp; &nbsp; AVRGPIOState *s =3D AVR_GPIO(obj);<br>
+<br>
+&nbsp; &nbsp; qdev_init_gpio_out(DEVICE(obj), s-&gt;out, ARRAY_SIZE(s-&gt;=
out));<br>
+&nbsp; &nbsp; memory_region_init_io(&amp;s-&gt;mmio, obj, &amp;avr_gpio_op=
s, s, TYPE_AVR_GPIO, 3);<br>
+&nbsp; &nbsp; sysbus_init_mmio(SYS_BUS_DEVICE(obj), &amp;s-&gt;mmio);<br>
+}<br>
+static void avr_gpio_realize(DeviceState *dev, Error **errp)<br>
+{<br>
+&nbsp; &nbsp; /* Do nothing currently */<br>
+}<br>
+<br>
+<br>
+static void avr_gpio_class_init(ObjectClass *klass, void *data)<br>
+{<br>
+&nbsp; &nbsp; DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
+<br>
+&nbsp; &nbsp; dc-&gt;reset =3D avr_gpio_reset;<br>
+&nbsp; &nbsp; dc-&gt;realize =3D avr_gpio_realize;<br>
+}<br>
+<br>
+static const TypeInfo avr_gpio_info =3D {<br>
+&nbsp; &nbsp; .name&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D TYPE_AVR_GPIO,<b=
r>
+&nbsp; &nbsp; .parent&nbsp; &nbsp; &nbsp; &nbsp; =3D TYPE_SYS_BUS_DEVICE,<=
br>
+&nbsp; &nbsp; .instance_size =3D sizeof(AVRGPIOState),<br>
+&nbsp; &nbsp; .instance_init =3D avr_gpio_init,<br>
+&nbsp; &nbsp; .class_init&nbsp; &nbsp; =3D avr_gpio_class_init,<br>
+};<br>
+<br>
+static void avr_gpio_register_types(void)<br>
+{<br>
+&nbsp; &nbsp; type_register_static(&amp;avr_gpio_info);<br>
+}<br>
+<br>
+type_init(avr_gpio_register_types)<br>
diff --git a/hw/gpio/meson.build b/hw/gpio/meson.build<br>
index 7bd6a57264..ef372bdd3b 100644<br>
--- a/hw/gpio/meson.build<br>
+++ b/hw/gpio/meson.build<br>
@@ -12,3 +12,4 @@ softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_=
gpio.c'))<br>
&nbsp;softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_gpio.c')=
)<br>
&nbsp;softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_gpio=
.c'))<br>
&nbsp;softmmu_ss.add(when: 'CONFIG_SIFIVE_GPIO', if_true: files('sifive_gpi=
o.c'))<br>
+softmmu_ss.add(when: 'CONFIG_AVR_GPIO', if_true: files('avr_gpio.c'))<br>
diff --git a/include/hw/gpio/avr_gpio.h b/include/hw/gpio/avr_gpio.h<br>
new file mode 100644<br>
index 0000000000..498a7275f0<br>
--- /dev/null<br>
+++ b/include/hw/gpio/avr_gpio.h<br>
@@ -0,0 +1,53 @@<br>
+/*<br>
+ * AVR processors GPIO registers definition.<br>
+ *<br>
+ * Copyright (C) 2020 Heecheol Yang &lt;<a href=3D"mailto:heecheol.yang@ou=
tlook.com" target=3D"_blank">heecheol.yang@outlook.com</a>&gt;<br>
+ *<br>
+ * This program is free software; you can redistribute it and/or<br>
+ * modify it under the terms of the GNU General Public License as<br>
+ * published by the Free Software Foundation; either version 2 or<br>
+ * (at your option) version 3 of the License.<br>
+ *<br>
+ * This program is distributed in the hope that it will be useful,<br>
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.&nbsp; See the<br>
+ * GNU General Public License for more details.<br>
+ *<br>
+ * You should have received a copy of the GNU General Public License along=
<br>
+ * with this program; if not, see &lt;<a href=3D"https://nam12.safelinks.p=
rotection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.gnu.org%2Flicenses%2F&amp;dat=
a=3D05%7C01%7C%7Cd9ed323c3bfb446283d608daa0b12d31%7C84df9e7fe9f640afb435aaa=
aaaaaaaaa%7C1%7C0%7C637998980070628584%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w=
LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;=
sdata=3DTJFNdHECVf2ZYpH10ueb79F9qD9X9GoSE9ar8qL1Gfg%3D&amp;reserved=3D0" or=
iginalsrc=3D"http://www.gnu.org/licenses/" shash=3D"LfUhc8maejUkczc/cbl81Hl=
k/ITtUsliIi4AN2DeEE6dJVfEJpaNbClhzd9fgXeAsGoJcQdwHfBQov9qIPcsgv3Vdo0NWPfOxi=
sKrOptdM/fsnGHWrl52gdABLbD39ymsUz7ZLGONo8P/4SRFK1PwCf0G720TT9cucWHLXBlgtA=
=3D" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/licenses/</a>&=
gt;.<br>
+ */<br>
+<br>
+#ifndef AVR_GPIO_H<br>
+#define AVR_GPIO_H<br>
+<br>
+#include &quot;hw/sysbus.h&quot;<br>
+#include &quot;qom/object.h&quot;<br>
+<br>
+/* Offsets of registers. */<br>
+#define GPIO_PIN&nbsp; &nbsp;0x00<br>
+#define GPIO_DDR&nbsp; &nbsp;0x01<br>
+#define GPIO_PORT&nbsp; 0x02<br>
+<br>
+#define TYPE_AVR_GPIO &quot;avr-gpio&quot;<br>
+OBJECT_DECLARE_SIMPLE_TYPE(AVRGPIOState, AVR_GPIO)<br>
+#define AVR_GPIO_COUNT 8<br>
+<br>
+struct AVRGPIOState {<br>
+&nbsp; &nbsp; /*&lt; private &gt;*/<br>
+&nbsp; &nbsp; SysBusDevice parent_obj;<br>
+<br>
+&nbsp; &nbsp; /*&lt; public &gt;*/<br>
+&nbsp; &nbsp; MemoryRegion mmio;<br>
+<br>
+&nbsp; &nbsp; struct {<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uint8_t pin;<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uint8_t ddr;<br>
+&nbsp; &nbsp; &nbsp; &nbsp; uint8_t port;<br>
+&nbsp; &nbsp; } reg;<br>
+<br>
+&nbsp; &nbsp; /* PORTx data changed IRQs */<br>
+&nbsp; &nbsp; qemu_irq out[8u];<br>
+<br>
+};<br>
+<br>
+#endif /* AVR_GPIO_H */<br>
-- <br>
2.34.1<br>
<br>
</blockquote>
</div>
<br clear=3D"all">
<div><br>
</div>
-- <br>
<div dir=3D"ltr" class=3D"x_gmail_signature">Best Regards,<br>
Michael Rolnik</div>
</div>
</body>
</html>

--_000_DM5PR06MB253735A4BA992987C3E7C8E3E65E9DM5PR06MB2537namp_--

