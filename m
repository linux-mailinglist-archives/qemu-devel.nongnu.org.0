Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C414ADF07
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 18:12:33 +0100 (CET)
Received: from localhost ([::1]:57436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHU2a-00050e-Ge
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 12:12:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHStr-0008MP-Ox
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:59:27 -0500
Received: from [2a00:1450:4864:20::42e] (port=46723
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHSto-0006Cv-9R
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:59:27 -0500
Received: by mail-wr1-x42e.google.com with SMTP id q7so3425413wrc.13
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 07:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e1F3cyiPfCm2qK9gtGdMvd6m3L6XeAhMZslq6HsdFCI=;
 b=kbJdx77zrg5OTfkhsZOWHlrxyxfWnozCkf3Br1fkSVC/lQwu6FSxUSHtD30BBDcq/2
 XXWPqPmqGfJfvnVkIyqgwSiGN7sAAOZvh19oGy2uXc8cnXjw7nzutwKXQpywoED2+5Bn
 ltW6vTfiRDvGeMdq6CWiVmG1lJDmX+BpweJqQ4kzqXp40+EQE5AEN0A57CjTvyWBjD+V
 wPaBDeABxt68+tc5nB7I45+nG5MZiBfcL3IBCbbYLx1UKC+mShlaY9Y75Dnup8R5yzil
 KVkWPDgwahWsVi+ZtL697SRMOfK2IWH+G5k9n3Wjv5vvFRQxLFTuTfxekz3lXTZlgZNY
 1V0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e1F3cyiPfCm2qK9gtGdMvd6m3L6XeAhMZslq6HsdFCI=;
 b=xmSkH88jKJ4N85o2UKP1wnCdWMgnS/+zvrKX7wx+Fu0ynt/0sjEWHlgvnuWOXrc6tN
 IhS+1sNaL7ER3+kXfBYxqPY3p0ukMiZRA/kWm3WrLDp/2g6ZsJ9omyh5yYkb7RS2BsJ/
 MAKDjwlizrMAHqYIHBwgydo8TC7U4N9I+JgZRdoWYd2VewMjlqcXAXF4PEJesD2dRatg
 VH82YTlhzP3atCWNA8tOhFg2CuToY47ToYK3Rw7pMnP70+spTbahVyUukB0CRErXEo3e
 mNHovvKWbNhq1RdCq2oZXp2rH6WYo+o+UgNKwSz+2rYrHfFpG+kvtuUt6oA7srZuPdDj
 goRg==
X-Gm-Message-State: AOAM531zaJHtEbMteq6J8Ud7Tx8GWNTQE3FyEX7UqGGsOhG6fUS/6BKT
 WsuMt6al+5R3QExH5ASqUpqEUA==
X-Google-Smtp-Source: ABdhPJx9xDHbFz3DF9frp7FXgVAFhQQO7J7LZTB3ms5AcGj+zEYqW1eS4EyE6Ms+x+JpnY04YiDsqQ==
X-Received: by 2002:adf:d183:: with SMTP id v3mr4112237wrc.538.1644335953474; 
 Tue, 08 Feb 2022 07:59:13 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id f5sm14805125wry.64.2022.02.08.07.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 07:59:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] Kconfig: Add an I2C_DEVICES device group
Date: Tue,  8 Feb 2022 15:59:09 +0000
Message-Id: <20220208155911.3408455-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Kevin Townsend <kevin.townsend@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset adds a new Kconfig "device group" for I2C devices which
a user might reasonably want to plug in to an arbitrary i2c bus via
the command line.  This follows the approach we use for PCI devices:
generally-usable i2c devices have
       default y if I2C_DEVICES
and board models with user-accessible i2c buses have
       imply I2C_DEVICES

This means that when building a board model that pulls in the device
group, the devices are all compiled in and available for use. 
(Previously they would happen to be present and usable only if some
other board that explicitly pulled that device in happened to also be
built into the same QEMU binary.)

I have been fairly conservative in marking devices as being in the
group and in marking board models as pulling in the group; feel free
to suggest changes.

In particular I've only added 'imply I2C_DEVICES' to arm boards. 
Grepping through Kconfig files I only found the PPC boards e500 and
ppc44x that enable some kind of i2c controller anyway.

The immediate motivation here is that the recently added lsm303dlhc
magnetometer isn't currently built unless the user manually adds it
to their config, because as it happens no boards have it as a
hard-wired device.

thanks
-- PMM

Peter Maydell (2):
  Kconfig: Add I2C_DEVICES device group
  Kconfig: Add 'imply I2C_DEVICES' on boards with available i2c bus

 docs/devel/kconfig.rst |  8 ++++++--
 hw/arm/Kconfig         | 10 ++++++++++
 hw/i2c/Kconfig         |  5 +++++
 hw/rtc/Kconfig         |  2 ++
 hw/sensor/Kconfig      |  5 +++++
 5 files changed, 28 insertions(+), 2 deletions(-)

-- 
2.25.1


