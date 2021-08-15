Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA83E3ECA35
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Aug 2021 18:29:20 +0200 (CEST)
Received: from localhost ([::1]:40644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFJ0h-0005rW-88
	for lists+qemu-devel@lfdr.de; Sun, 15 Aug 2021 12:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.townsend@linaro.org>)
 id 1mFIzF-0004Qo-U7
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 12:27:49 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:35437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kevin.townsend@linaro.org>)
 id 1mFIzE-0003LI-Bo
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 12:27:49 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 q11-20020a7bce8b0000b02902e6880d0accso13264679wmj.0
 for <qemu-devel@nongnu.org>; Sun, 15 Aug 2021 09:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mFUQ4PCEvX1htUqWh63mdPI9iOjwIup5omrzK04yORk=;
 b=dRvS0Z6ud5XkRoAYdwV6XN1wJfOcQy6LAcbA0d+j/NwhIwD3rz077vHh+TEP8AZ4L2
 QV38Dti9JXc6Wkt4WJhBy9UWITZrDNjKu82mKS1KCeoazCfPrz1CDe3IFdEDesPISEgh
 UNNAHg8JH9wr6NmhREJmLO/PC22lY/gCxK92erdhT24HK0U0FaUCdYcRjIOdq6Evn7c7
 k/XbEOu9nqojlFn34kZxmZmQhofX1MHqAy2JGEUfs7XAulzB1ZuSbBX5ostVzS4kECA5
 9GQQMqRpksAi+feJypyzuipm4aiwxy6PoRzSTIEWXWXf3MN3AS8X/pMMu12aPv2yiT3K
 +ldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mFUQ4PCEvX1htUqWh63mdPI9iOjwIup5omrzK04yORk=;
 b=dvU8byFdxX6SkhK2XQrmkTySCY4Suy9SE2DjuKRPbmzs2FNPNcrnM8R5xB4ZCDvUOD
 lUEBODLby9tfnOPrEZ2WzBElAbbr9pJbScA9LqiS8knFRysOmKQQcrysxVDwMRj/v8qc
 NBklraQrBBqjYMu/0iz8gGI3aoL8EwKTxOMe9WQWuIdwlFjcYsRDkE/VfoiQdI9T8ysm
 2NJn+Y2swJsYtRH0WHqIIWwCxAyqaU+iGEB7lkZO3ZR3CaoJVUpiXGNQjpS0SoMUSuTk
 5mZCXw+is566ceK6zk2jQbwO6aWO6zemuIxD8EV6cAXX9DPJXVHDWhOirVIFL2gmd/Ck
 jHIA==
X-Gm-Message-State: AOAM532iPusPrR81q1/GyBAJto6Mixw5NdKLpVmK/aJGPABZM4nZ2ObI
 w4ZsLoC6LVQfTN/UM5rbm63NyYoJteFpXg==
X-Google-Smtp-Source: ABdhPJyHG1rpLdkXm4msgNku3iK+00rj0eIw/r1e9U4bQrMHoeV3uDtK8letGG5Bqk/hlUHEG0Wg5w==
X-Received: by 2002:a1c:7214:: with SMTP id n20mr11638021wmc.181.1629044865966; 
 Sun, 15 Aug 2021 09:27:45 -0700 (PDT)
Received: from Kevins-MBP-2.lan ([37.222.182.64])
 by smtp.gmail.com with ESMTPSA id n10sm2514763wrw.76.2021.08.15.09.27.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 15 Aug 2021 09:27:45 -0700 (PDT)
From: Kevin Townsend <kevin.townsend@linaro.org>
To: qemu-devel@nongnu.org
Subject: 
Date: Sun, 15 Aug 2021 18:27:37 +0200
Message-Id: <20210815162738.75461-1-kevin.townsend@linaro.org>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=kevin.townsend@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Updates the proposed LSM303DLHC magnetometer device following review by
Philippe Mathieu-Daudé.

This has been tested with Zephyr 2.6.0, as follows:

$ west build -p auto -b mps2_an521 \
  zephyr/samples/sensor/sensor_shell/ \
  -- -DCONFIG_I2C_SHELL=y

$ qemu-system-arm -M mps2-an521 -device loader,file=build/zephyr/zephyr.elf \
  -serial stdio \
  -monitor tcp:localhost:4444,server,nowait \
  -device lsm303dlhc_mag,id=lsm303,address=0x1E

uart:~$ i2c scan I2C_SHIELD1 
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:             -- -- -- -- -- -- -- -- -- -- -- -- 
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- 1e -- 
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
70: -- -- -- -- -- -- -- --                         
1 devices found on I2C_SHIELD1

Zephyr's LSM303DLHC driver can be enabled in a sample by adding the following
DTS overlay:

/*
 * Copyright (c) 2021 Linaro Limited
 *
 * SPDX-License-Identifier: Apache-2.0
 */

&i2c_shield1 {
	lsm303dlhc-magn@1e {
		compatible = "st,lsm303dlhc-magn";
		reg = <0x1e>;
		label = "LSM303DLHC-MAGN";
	};
};

And the following KConfig settings:

CONFIG_I2C=y
CONFIG_I2C_SHELL=y
CONFIG_SENSOR=y
CONFIG_LSM303DLHC_MAGN=y

When a sample with the above settings is run, the magnetometer can be read
via the shell sensor command:

uart:~$ sensor get LSM303DLHC-MAGN magn_xyz
channel idx=11 magn_xyz x =   0.000000 y =   0.000000 z =   0.000000

Set the y-axis (via human monitor or qmp) to 1100, which equals 1 Gauss
with the default gain settings:

(qemu) qom-set lsm303 mag_y 1100
qom-set lsm303 mag_y 1100

And test again in Zephyr:

uart:~$ sensor get LSM303DLHC-MAGN magn_xyz
channel idx=11 magn_xyz x =   0.000000 y =   1.000000 z =   0.000000


