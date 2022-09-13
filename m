Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 002585B7967
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 20:26:43 +0200 (CEST)
Received: from localhost ([::1]:48558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYAcM-00028E-Cs
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 14:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3QsogYwYKCnkqfqrpodlldib.Zljnbjr-absbiklkdkr.lod@flex--titusr.bounces.google.com>)
 id 1oYAXn-0004jB-4z
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 14:21:59 -0400
Received: from mail-vs1-xe49.google.com ([2607:f8b0:4864:20::e49]:55128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3QsogYwYKCnkqfqrpodlldib.Zljnbjr-absbiklkdkr.lod@flex--titusr.bounces.google.com>)
 id 1oYAXk-0007Ot-JI
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 14:21:58 -0400
Received: by mail-vs1-xe49.google.com with SMTP id
 129-20020a670387000000b00390232a1bfcso1308611vsd.21
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 11:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date; bh=CfSWvIPhukRlqR1oyosRZ+jgV+Jbam3Axvbe2ylEOsY=;
 b=i1NOY1kckfVq9BZYXJ2D8iJ/JExirWHNHPgF7PU4s8w9AfnuvdVWTx/85FVp0bJfpa
 jWeShWW2WcYBpxzQidhx7gndJkunn7banLi2VK+B9OXxvXvpylxZ4aB15MG+WEbc2Fof
 nrjAycUzRSYtaAGEfTebOvPbhiFFeqcvJ6fQ1jtiZFqRXkXpOVdCb4isY0OF76sVaQ1P
 tytrcWXD6kzwPjW9OXTEShqmfqaJyEBE7fTbEDfnpHZcUVn/jLRwlDMV4w4HWKx9lj9E
 O91F3LGEr+AwOEVlQ0FgHcDkpffWio1F2i1gSuzXsuLAMzFm66ZDeASK3q5AGvGdbg8K
 d1Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date;
 bh=CfSWvIPhukRlqR1oyosRZ+jgV+Jbam3Axvbe2ylEOsY=;
 b=Xu/nEUqfBiRCCbfJjdFcq3VFsBaHYiUG1xyWuSmV9sa1zU5XHad0N56q5pJSsP0+o9
 eNW5RMLhhereyfMfarzWaE4qCl9ZzZyxGaKJlDEE0yrdaj3VpmTgSJKrVknko2QVJXqK
 q0I++0l7xZfvNfvl8wvlYlP9xBCkguLA3Vv7hm0LDwoRMQxq5T3YsSi0Rb9Ene53N0Wg
 ZpejyhsZhoXA2IXwz8or+9+/62M3bLKdyNcfAzOwF5j8BmHqAaySo2JIvOpCgy19fg//
 9yrESrzszErBIJsQIqyv/YYhpQFpRhZjH6V+226Aq93av99clnRcZClO5yois2fARmdH
 sWrA==
X-Gm-Message-State: ACgBeo1JZRyLxR2Ux1nTzS4li5gN64Lj3P3mWmiuCqhJSbBDr1N15okj
 EfHpJ7qVe86E6Rra2QqdGlv5iRHcizpNcChMHwjazVQ6Vr5wJ+aA1QYo7vwHfJhm6RlssvsbUhH
 ycGGGKPImi32zZ0JFFCfFwo46EFzaj37cSDk7X5nwkTc3VUBFfvhrA9yt6RCh
X-Google-Smtp-Source: AA6agR5Q/4x4ymdEhxcdYNiVFjCR1MZxjucCb2gj2bR/BYgCs8libl2yNnXdmvGR0kSYfoN+mrTnD8l4sW8=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a1f:27c5:0:b0:39e:a10c:8134 with SMTP id
 n188-20020a1f27c5000000b0039ea10c8134mr10612826vkn.29.1663093314174; Tue, 13
 Sep 2022 11:21:54 -0700 (PDT)
Date: Tue, 13 Sep 2022 18:21:46 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
Message-ID: <20220913182149.1468366-1-titusr@google.com>
Subject: [RFC PATCH v2 0/3] Initial PECI bus support
From: Titus Rwantare <titusr@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter@pjd.dev, patrick@stwcx.xyz, 
 iwona.winiarska@intel.com, tmaimon77@gmail.com, quic_jaehyoo@quicinc.com, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e49;
 envelope-from=3QsogYwYKCnkqfqrpodlldib.Zljnbjr-absbiklkdkr.lod@flex--titusr.bounces.google.com;
 helo=mail-vs1-xe49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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

The Platform Environment Control Interface (PECI), is a way for Intel
processors to communicate with management controllers.

This series of patches simulate some PECI subsystem functionality. This
work is currently used against Nuvoton 7xx BMC, but it can easily be
extended to support Aspeed BMCs. Most of the functionality is derived
from PECI support in openbmc. See https://github.com/openbmc/libpeci

The main consumer of this work is openbmc, so functionality not
exercised by the openbmc/libpeci is unlikely to be present here.

peci-core.c is an attempt to split out functionality defined by the
spec. Anything that is not expected to change between BMC vendors.

The following commands have some support:
    Ping()
    GetDIB()
    GetTemp()
    ~RdPkgConfig()
    ~RdEndPtConfig()

To be implemented:
    RdIAMSR()
    RdPCIConfig()
    RdPCIConfigLocal()

Currently, in the board file during bmc_init() one may specify defaults
as follows:

static void my_machine_peci_init(NPCM7xxState *soc)
{
    PECIBus *peci_bus = npcm7xx_peci_get_bus(soc);
    DeviceState *dev;

    /* per socket properties - both sockets are identical in this case */
    PECIClientProperties peci_props = {
        .cpu_family = FAM6_SAPPHIRE_RAPIDS_X,
        .cpus = 56,
        .dimms = 16
    };

    /* socket 0 - with example setting a few of the cpu and dimm temperatures in millidegrees */
    dev = DEVICE(peci_add_client(peci_bus, 0x30, &peci_props));
    object_property_set_uint(OBJECT(dev), "cpu_temp[0]", 30000, &error_abort);
    object_property_set_uint(OBJECT(dev), "cpu_temp[2]", 35000, &error_abort);
    object_property_set_uint(OBJECT(dev), "dimm_temp[1]", 40000, &error_abort);
    object_property_set_uint(OBJECT(dev), "dimm_temp[8]", 36000, &error_abort);

    /* socket 1 */
    dev = DEVICE(peci_add_client(peci_bus, 0x31, &peci_props));
    object_property_set_uint(OBJECT(dev), "cpu_temp[9]", 50000, &error_abort);
    object_property_set_uint(OBJECT(dev), "dimm_temp[0]", 31000, &error_abort);
    object_property_set_uint(OBJECT(dev), "dimm_temp[14]", 36000, &error_abort);
    ...
}

This is something that can also be extended as other parameters arise that need
to differ between platforms. So far you can have have different CPUs, DIMM counts,
DIMM temperatures here. These fields can also be adjusted at runtime through qmp.

A lot of the registers are hard coded, see hw/peci/peci-client.c. I'd like to
gauge interest in what potential users would like to be adjustable at runtime.
I've not written QEMU models that read config files at runtime, something I'd
appreciate guidance on.

Thanks all

Changes in v2:
- rename EndPt to EndPoint

Titus Rwantare (3):
  hw/peci: add initial support for PECI
  hw/peci: add PECI support for NPCM7xx BMCs
  hw/peci: add support for EndPointConfig reads

 MAINTAINERS                    |   8 +
 hw/Kconfig                     |   1 +
 hw/arm/Kconfig                 |   1 +
 hw/arm/npcm7xx.c               |   9 +
 hw/meson.build                 |   1 +
 hw/peci/Kconfig                |   2 +
 hw/peci/meson.build            |   2 +
 hw/peci/npcm7xx_peci.c         | 204 +++++++++++++++++++++++
 hw/peci/peci-client.c          | 293 +++++++++++++++++++++++++++++++++
 hw/peci/peci-core.c            | 222 +++++++++++++++++++++++++
 hw/peci/trace-events           |  10 ++
 hw/peci/trace.h                |   1 +
 include/hw/arm/npcm7xx.h       |   2 +
 include/hw/peci/npcm7xx_peci.h |  37 +++++
 include/hw/peci/peci.h         | 217 ++++++++++++++++++++++++
 meson.build                    |   1 +
 16 files changed, 1011 insertions(+)
 create mode 100644 hw/peci/Kconfig
 create mode 100644 hw/peci/meson.build
 create mode 100644 hw/peci/npcm7xx_peci.c
 create mode 100644 hw/peci/peci-client.c
 create mode 100644 hw/peci/peci-core.c
 create mode 100644 hw/peci/trace-events
 create mode 100644 hw/peci/trace.h
 create mode 100644 include/hw/peci/npcm7xx_peci.h
 create mode 100644 include/hw/peci/peci.h

-- 
2.37.3.968.ga6b4b080e4-goog


