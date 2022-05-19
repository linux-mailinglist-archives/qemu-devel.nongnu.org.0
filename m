Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A1552D2BA
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 14:43:56 +0200 (CEST)
Received: from localhost ([::1]:42218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrfVT-0000pP-F3
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 08:43:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1nrfNg-0002vq-81
 for qemu-devel@nongnu.org; Thu, 19 May 2022 08:35:53 -0400
Received: from mail-tycjpn01on20726.outbound.protection.outlook.com
 ([2a01:111:f403:7010::726]:38415
 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1nrfNc-0004a9-PX
 for qemu-devel@nongnu.org; Thu, 19 May 2022 08:35:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mdmdxYVogCFe/B+YN3r9abTuc/EAmADMgK+uGoGpQpiRc5xppQDIEYrQ1qrl8Pg2d434K7bxdnVC6oeM31JZub1/pzOAxTD/9Orx5jlvw6kTypnmTrFdgz0R28bfqCxVAN6w4NKRs0BJEsQ074IgyVUkPF4hincRKAUJ/HKTvZ23PMddo7OZAIrJ/u68BfCkGHHNEMRCYX70Ya9KvvxGpE5cLUjVwUvzCVghZi4JFRGxW6I7cKBapWWPE/seICkyzlM4i5VejXna1HXvWZ3ZWVUF9FA95g/9k1i7UKOA4VNKL56jPhXCpTSgTxSQh9C4QZ6GXZLGZsuHLEKGcx7PkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fa0HlXyTCt1H6ksCc3oSbuuV8BkqTjyjVYB4R9H6eWs=;
 b=SCfCB/w1QqHKOTD2AzEuEe2SJ9XGXDQgpWgnzZS2pBS0jur/vlBnLjAiQEkhP6MKhz5mofNAuy2TAaIaOtqqI6/zf75A8mC0PkFuL2+HsM6QCcf1kpTUtn2zRCytjB6461QtNBHrUo67Nk3IB9+1QXceTI1UeRflxbAzoyMmdNTvEnSpTzlNRnZwCsnEFDwObhdjiHX6Gla10Octx25eDJu0v8UJHsqX/oAm0yKcvJKR6iw4i44cMbS4Xznu70r/lqhu1e3SOxt4nbnBUyDbbmUwR7ikpOfcCBHRzmMQ79MzfjsfM327WDHFyTpsCpZPBd+8yXxguUOQwAngLSRzOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fa0HlXyTCt1H6ksCc3oSbuuV8BkqTjyjVYB4R9H6eWs=;
 b=FW2LlUON5h83bmL+MLydpapp4WNdQqSbvN3Yy3Bnn5xUPjKqbgalPK65nri4pudAC3xYQtMBMMxxhKoXq/Rcyg2jM+kyc+xiXd/gpHjryKu5d8oUD9jY2ovBhDhlzyrK3DtyCiZ0+1EyQZVo0Afa6P+tN+L7ye6FLLkc88UZOUM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 OS3P286MB1541.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:17c::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14; Thu, 19 May 2022 12:35:39 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::bd99:5c83:e2dc:a8f7]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::bd99:5c83:e2dc:a8f7%7]) with mapi id 15.20.5273.015; Thu, 19 May 2022
 12:35:39 +0000
Date: Thu, 19 May 2022 20:35:31 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, contact@canokeys.org
Subject: [PATCH v5 0/6] Introduce CanoKey QEMU
Message-ID: <YoY5k0PQny8WtAHi@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Operating-System: Linux Sun 5.15.26
X-Mailer: Mutt 2.2.1 (2022-02-19)
X-ClientProxiedBy: SJ0PR03CA0164.namprd03.prod.outlook.com
 (2603:10b6:a03:338::19) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ae5d26a-704e-42cd-e294-08da39941456
X-MS-TrafficTypeDiagnostic: OS3P286MB1541:EE_
X-Microsoft-Antispam-PRVS: <OS3P286MB1541289887FCA77064D5B5F7BCD09@OS3P286MB1541.JPNP286.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sIHpf9ZpD+4kgWWlgZQywl10/lPukC87owtJtMYKBlvV1XwcUcZg+IF5GcaBICOSlQzClvQPhBkBkKrDaNXx8Yblndccuc2hnv5vb7SOzLnf9zPpiyY5paleL1eEVomTDEAdST/Q9V1hSxRZAtQvN1PTbv4mqyEXAgeKb29NbXaqtFK914MAaJeYtH9H/xQOqdrRHYh8arv0sPxWUox+v8a07zb0k4AOhW4JkkQGSPVP/3eKex+Xq0EKK1JlLu336vtjF9LhuBZD+fLfEsKqmJy7jAkOg4NtR6EmaIv+xJPA/i7EL4yO7goEBMdmxAYWGNxxP6E8oTXEtXSKIb+FoKuLewT8klnqwb7mV9RhOuguZLkUMiymnQEfUCtIyrgEyzVFXpY1E0Gnd5ZAxeCTWf2szL48nITie5MQCpPHWOQ2LQMMf90bWrIGpKyIGfKF5nRyhveTrRzK4TyGKpHOgxmGzETD+xLEKMAzSdNKt1kp2xj6dQu5suzUszVu0xIlP6Akx9XrXesZ1qhj1/qZyWRk4ik1yAOjb/7Pd7eKpEZa9QG0oeD8Q6zM+8mQhg6/cUgK8DnL3IgDHZEj/rJL1VTzKRCCCgu07frUByUYXrLSwFn6kRa3DnCMwEFIsV4kDZW2X7ZvQcSW1WiY43YuDRCuhvg4YMmeXzmBs2ym7EgK/h8GKamZKJmsFkRjPEfyv493zwpK2vs8XGbB3vPMsnzWDcqqYq8B6AoRRRrhWvh1rDKwjYb7Sc1G59qgOEe/a/kwgrACSmIKdoM7OgbzOw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(396003)(366004)(136003)(376002)(346002)(39830400003)(786003)(66556008)(66476007)(41300700001)(52116002)(316002)(41320700001)(6506007)(83380400001)(5660300002)(38100700002)(8676002)(8936002)(9686003)(33716001)(110136005)(966005)(6486002)(6512007)(6666004)(86362001)(186003)(2906002)(66946007)(508600001)(4326008)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WJzC9RCKr+kCh50OHsXNTwxMgJ9FslqVYBBgOVmN9XHdZhdQfEg6Z9eb3Zer?=
 =?us-ascii?Q?gau2feF2tlT/wV7JEPehjh45NyWCQd3x1/lHvIdS51PIA/oAE+Nl8Esj2rn4?=
 =?us-ascii?Q?ultpZfnbv8iJNsCp29IKYWx1NRwi7K8tcAcmCE7H1rRYxMG4eO7rETOvlELm?=
 =?us-ascii?Q?PuT9vnpsLfh+3fuWp15gojZeSJL/fcq6X/CzbJ/DdcZyQEvs2P0vxasKHaaR?=
 =?us-ascii?Q?v8sw9XagAWB0UcHHlu9e880qvtn67a9XVwGIa8xitgSn9HxhlwXmNylXyZMD?=
 =?us-ascii?Q?/d0sxpZ9dIovGPqo/aSGooRKHrh6+h8T/mYoJsyL1zc919RYvDBzqF8AMVQv?=
 =?us-ascii?Q?Qetsf9iuzEAdqDfeR3EIReSrKNj4kp7L+lTZPHlsWN+KJL5U0ElotUgaOkqn?=
 =?us-ascii?Q?ZViWGdbvFVNfrDCz7eQn+LbrMIHw9RzhjKIpVsvnpAKtcZ+GZcwTjSi3W0Co?=
 =?us-ascii?Q?Rw+kIM5PGz/CSmUmeX07d9fQQTAGYX8n5eS8N2JACF/9GxcNCxWGe6OBMfQB?=
 =?us-ascii?Q?0SYkGI9ATIJgQnJsy8hsX5XqoU8CfZHfeA+FNETKRJ63Wu9SOYectKbbGpjW?=
 =?us-ascii?Q?LSSXtTlPEEFOl9CEQR+a5phEBEDv9aU09fJyKK5AIwC7izE3Ht6iXgRERdn0?=
 =?us-ascii?Q?LqoUI5sKFi9knQfjaF8l8ixunBmxijxh4mGY5EKRRKYXKRi9cpD28m1BSZic?=
 =?us-ascii?Q?whyxzX/10QmBOtNtpLnBRizBDDCkqu5qQZXWkwVWMHJP1Lx48kOyV1F60g1k?=
 =?us-ascii?Q?cDos+VtJhrAoSIiFu0FgUZ4ylUqin1la47dPduXSwKmOjl4mUiSRiOKKqa21?=
 =?us-ascii?Q?aEwPIGfj+JwOUE46/CKCAF8A70/VbEDbJA/GTXlZJOJQks/GQC0IssziihL7?=
 =?us-ascii?Q?/2VDJw7rb4y760RnKMqn0yqpDoRsgfX8qwWowMhYRSc1UH5354TyW21KQ/aX?=
 =?us-ascii?Q?tEI7dTU9C9aJdVuaOU060vr7oSpFPYAyYZQrnqv1chlccIjGF97bw81spLDQ?=
 =?us-ascii?Q?gnZZjgQ6DSv9FIXvDCI3bBH04mP/NW6i0ihwedatdEkqOyZ3UvY6RojkVwpP?=
 =?us-ascii?Q?DjXYEofjn1xrlgNXcRKlnhyWQfQ1VQ4KhrlaLnA/zc8tTVMwIDFrkgpAQseB?=
 =?us-ascii?Q?DcZVwmRA5LN55/35Pjz9SsRIzJ8rEb7P04tpQM01QfylNBkyFBrUqlBG6sQQ?=
 =?us-ascii?Q?ze7JNJa9xrkXfGCCKm1qCGDPuT7KsVROEarE2z6cslzjLbEIhvx7OEl9xJEc?=
 =?us-ascii?Q?HVJRIxGuAYSWbWFyrm5xoQM/76413PEsUtDPJ78EgKcVNPGRsz+ZbX8+geKw?=
 =?us-ascii?Q?JZRYTkKtYn7XXIbwE6PdtBl3oJEX9XTCK6b93RU8vUvw0yuCTHaigQPDKRT0?=
 =?us-ascii?Q?GAMS0UqzQbt3V6Da86DQQhpCOASQh2nqm58OZtn2SbcmhTshsUHXLFFciQec?=
 =?us-ascii?Q?BanS1IUjTximKjhPUcEV1+JYzEoFQ+XXD1PDaNKlgcTrPnOq1tN2PkMMPdKV?=
 =?us-ascii?Q?VpalM1aU7LyI+/NzEinsFAhHdnMXzGtTNHD0/vT5QzlrT5HKd3zco2FbZP4T?=
 =?us-ascii?Q?jOYbG7z6Wb1EFDF5t787LeDD8aslkMbKxeV0QAmoq+ImYznkzlaY9ebc2J1F?=
 =?us-ascii?Q?q57k0ctHszGrL4LiBR7qB+qamowMPQIQtobfbjOYRYC2A1UD4aocZjGoB5yC?=
 =?us-ascii?Q?6daCqEaj6ps8h2MMSBBkc9TR6NBIWsvE17oZ1MqpLswWd85Fy/wIh2he6PfY?=
 =?us-ascii?Q?dnL3xLdFTg=3D=3D?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ae5d26a-704e-42cd-e294-08da39941456
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 12:35:39.0215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5X2YoIJIYe2Rtx4/R74f/lkvXWQKQOInciPUPer+3r0cW+7YT1IJ1PI7dRO/QmqA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB1541
Received-SPF: pass client-ip=2a01:111:f403:7010::726;
 envelope-from=i@zenithal.me;
 helo=JPN01-TYC-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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

- One sentense

With this patch series, QEMU would fully emulate an open-source secure key,
CanoKey, with supports of various features listed below:

 * U2F / FIDO2 with Ed25519 and HMAC-secret
 * OpenPGP Card V3.4 with RSA4096, Ed25519 and more
 * PIV (NIST SP 800-73-4)
 * HOTP / TOTP

- What's New

Although we have seen multiple emulated devices providing different
functionalities for different purposes such as U2F (hw/usb/u2f-emulated.c)
and CAC (hw/usb/ccid-card-emulated.c), modern secure key needs more advanced
protocols like FIDO2 (WebAuthn, in comparison to U2f) and PIV
(in comparison to CAC), which is not implemented previously.

Other features like OpenPGP / TOTP are also not implemented before, at least
as an emulated functionality.

- Why get upstreamed

At Canokeys.org, virtual cards on its own are for testing and debugging
on the key itself. We have implemented various virt-cards including
fido-hid-over-udp and USB/IP on our CI for testing and developer debuging.

As we found emulated U2F and CAC in QEMU mainline, we estimated we could
implement such features as well, which is good for testing since now
we can emulate the whole key as an USB device, and we implemented it!
as presented by this patch series.

The story doesn't end here. As CanoKey QEMU is a fully functional key and it is
inside QEMU, we think this emulated device could reach a wider audience
other than CanoKey developers: projects using secure key can also benefit
from it.

For example, this device can be used in CI for projects using secure key.
Bringing up a VM using QEMU with CanoKey QEMU, now we have an environment
with secure key, and we can test the correctness of the behavior of the code.

Another example is that as it is fully emulated rather than some hardware,
all traces/debug logs can be easily extracted, which is helpful for
developpers to debug.

One note though, using CanoKey QEMU as a daily secure key is not recommended
as the secret key in the emulated key is not protected by hardware.

- Implementation details

CanoKey implements all these platform independent features in canokey-core
https://github.com/canokeys/canokey-core, and leaves the USB implementation
to the platform, thus in this patch series we implemented the USB part
in QEMU platform using QEMU's USB APIs, therefore the emulated CanoKey
can communicate with the guest OS using USB.

Some note though, CanoKey also has a NFC interface, thus we can implement
the NFC part in QEMU and expose CanoKey to the guest as an NFC device.
This is left as future work.

In the meanwhile, unlike other emulated device which has a passthrough
counterpart, CanoKey QEMU does not provide a passthrough mode as a whole
since CanoKey has multiple interfaces which is hard to passthrough.
(Left as future work, passthrough via WebUSB interface)
You may try to use u2f-passthru and ccid-card-passthru to pass the U2F and
CCID (e.g. OpenPGP, PIV) part of a real (or virtual, referring to USB/IP)
CanoKey on the host to the guest.

---
v1 -> v2:
  * Use trace events instead of printf to log canokey.c function call
  * Update debug instructions (trace, pcap) in CanoKey doc
  * Drop commit about legacy -usbdevice usage

v2 -> v3:
  * Fix code style in commit hw/usb/canokey: Add trace events
  * Move docs/canokey.txt to docs/system/devices/canokey.rst

v3 -> v4:
  * Refactor canokey.c into single thread version. This version
    is much easier to understand and review
  * Add more comments
  * Add links to canokey.rst in usb.rst
  * Update MAINTAINERS canokey docs file

v4 -> v5:
  * Fix compile when there is no libcanokey-qemu
  * Separate canokey-qemu repo from canokey-core (doc change)
  * Categorize canokey into Misc devices
  * Add high speed support (thus usb-ehci) can use it
  * State the limitation when used with qemu-xhci

  About the qemu-xhci issue, see patch [PATCH v5 4/6] for more detail
  This patchset passes the CI, see
  https://gitlab.com/ZenithalHourlyRate/qemu/-/pipelines/543016316

Hongren (Zenithal) Zheng (6):
  hw/usb: Add CanoKey Implementation
  hw/usb/canokey: Add trace events
  meson: Add CanoKey
  docs: Add CanoKey documentation
  docs/system/devices/usb: Add CanoKey to USB devices examples
  MAINTAINERS: add myself as CanoKey maintainer

 MAINTAINERS                      |   8 +
 docs/system/device-emulation.rst |   1 +
 docs/system/devices/canokey.rst  | 168 +++++++++++++++++
 docs/system/devices/usb.rst      |   4 +
 hw/usb/Kconfig                   |   5 +
 hw/usb/canokey.c                 | 313 +++++++++++++++++++++++++++++++
 hw/usb/canokey.h                 |  69 +++++++
 hw/usb/meson.build               |   5 +
 hw/usb/trace-events              |  16 ++
 meson.build                      |   6 +
 meson_options.txt                |   2 +
 scripts/meson-buildoptions.sh    |   3 +
 12 files changed, 600 insertions(+)
 create mode 100644 docs/system/devices/canokey.rst
 create mode 100644 hw/usb/canokey.c
 create mode 100644 hw/usb/canokey.h

-- 
2.35.1


