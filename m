Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BB74D867F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 15:11:29 +0100 (CET)
Received: from localhost ([::1]:54386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTlQ0-0006tP-GY
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 10:11:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nTl6G-0000rW-Ok
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:51:06 -0400
Received: from [2607:f8b0:4864:20::630] (port=45918
 helo=mail-pl1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nTl6D-0004C4-Pl
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:51:03 -0400
Received: by mail-pl1-x630.google.com with SMTP id q13so13577570plk.12
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 06:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UpdfmPDxOYmy+xr7GwuZowe6rqx+yy1B3kZns8rY1Uw=;
 b=P756awhwmOHP199pIw0tMW36sk4YvFV7/auFjmzG+h2+r78au0h/pOnJFOnBnHfgrl
 0t9QMU1KmBe+2/B9l2TMYdA7mz6GBxRphakZqDJdEf05FHBdnj6xIR+LxLsXclOanT59
 ofNV9ldzInGM2kYB64wOWpAXraM8Rh2L1YUdT0SdzbMEWQq3kXT9Fvz8VanY5cYF0UR9
 WEcfIsdINc3z9434IjAW/ITi8MqbhHFKCaeHqcbHx0AO/syb+ffib7r3qQSXbX8/AuxU
 GtFtQO04whJf89FKLbazSruf06XKJm2uegOXD4Z9ZRAaGWhoo6yXK618VTUFWgiRmnWx
 071g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UpdfmPDxOYmy+xr7GwuZowe6rqx+yy1B3kZns8rY1Uw=;
 b=FopBtY1uvRzK9qIURQuTVarOrbeEGMnx70tkqo/VR352FhTuLvW+mwHujZA+dbF+7Z
 sBqLmO04/dv0U3D5Dw+paKsogN6SUvD9DQ5RgDst4KAQYCtbHVC3DzrKOJUQwaXrb57v
 WEWgrv7kU10J0Bn9xqgDp9KHJtdVX9MqBDHbLMoKPcYdy5p9oJaWZZl09p2L7ktl+fzY
 XFgIr1r3U9KXQUgENiI8s+x+Q/UxGqODALDi1pMHKF+KLuOXZXscAPoOs+J0+SD0i5hc
 uHiIOa2i2xXJKTI19GBMICMh+rzIMYKX7ih33Q3u7Oo529a5xyjm8/149EhZBTP6y/Gi
 TXag==
X-Gm-Message-State: AOAM533SZPS6J5P3L3o19V/Guxv4E1nnECT+KR1ErWCjRL5OmISZHqJx
 DKjck/LvCGlsLxvguH7KsWkoHuapEPI=
X-Google-Smtp-Source: ABdhPJyrQCM1kPVS5nXcLo0q/dKqs0BLWc0BlTmix3yLxiL9nRpyr8fOSijRRV6wGLApbANAeIQnxw==
X-Received: by 2002:a17:902:f549:b0:151:fd3b:247 with SMTP id
 h9-20020a170902f54900b00151fd3b0247mr23920851plf.11.1647265859849; 
 Mon, 14 Mar 2022 06:50:59 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a056a00158500b004f745148736sm21699365pfk.179.2022.03.14.06.50.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 14 Mar 2022 06:50:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] I2C patches for 2022-03-14
Date: Mon, 14 Mar 2022 14:50:53 +0100
Message-Id: <20220314135054.25261-1-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::630
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: 23
X-Spam_score: 2.3
X-Spam_bar: ++
X-Spam_report: (2.3 / 5.0 requ) AC_FROM_MANY_DOTS=2.996, BAYES_00=-1.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The following changes since commit 15df33ceb73cb6bb3c6736cf4d2cff51129ed4b4:

  Merge remote-tracking branch 'remotes/quic/tags/pull-hex-20220312-1' into staging (2022-03-13 17:29:18 +0000)

are available in the Git repository at:

  https://github.com/philmd/qemu.git tags/i2c-20220314

for you to fetch changes up to 1cbab82e9d1bdb2c7b9ef46a396fdc03ea3fa04c:

  hw/nvram: at24 return 0xff if 1 byte address (2022-03-14 14:48:35 +0100)

----------------------------------------------------------------
I2C patch queue

- Fix AT24 EEPROM partial write (Patrick Venture)

----------------------------------------------------------------

Patrick Venture (1):
  hw/nvram: at24 return 0xff if 1 byte address

 hw/nvram/eeprom_at24c.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

-- 
2.34.1


