Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AA347CA1E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 01:12:55 +0100 (CET)
Received: from localhost ([::1]:33500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzpFW-0007b5-7v
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 19:12:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <orzechowski.alexander@gmail.com>)
 id 1mzpDx-0005bJ-Ii; Tue, 21 Dec 2021 19:11:17 -0500
Received: from [2607:f8b0:4864:20::732] (port=43886
 helo=mail-qk1-x732.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <orzechowski.alexander@gmail.com>)
 id 1mzpDw-0004Za-2o; Tue, 21 Dec 2021 19:11:17 -0500
Received: by mail-qk1-x732.google.com with SMTP id f138so688417qke.10;
 Tue, 21 Dec 2021 16:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=im5BaiLvVm0Mtty/oSmlct8BNjrIwlIbNqeSddnZHvw=;
 b=BLVwi9ps/J6znCSmabm/dGiehsruaOe+gC7wz2oOCxjFbwbSdzDTo6C67BKoqg2Hn/
 jpryyPn6HWb/TJgL70MVvhwOsfhTcmYtpKYSVHEKPD83nkHznbVIt2dfDeSM5vOpEjWU
 M+CRryiuKt5e7wRh+GN/uNLXC2jyVCHjDdpNMwauiWi56F/Fdpjk42+SAuUfCfZ76PB5
 s9eLHvNTvfcdtDy5xzOzXdrEjYaqki8DPfSMtkyMA59Zdwokl1e6n0C4/Mm9uYPAXgFS
 AtJk/kGMinpgX/OoBkZerkrG9HjY3WFUnfdlvyVVpwqUY/p7/5lY4c6j05GiA+meJby5
 aJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=im5BaiLvVm0Mtty/oSmlct8BNjrIwlIbNqeSddnZHvw=;
 b=Th7g+DwhfqmPhwxGcxXpgk9ngwLrv5EAGgrfmDb/9LfTadF7kk3IgF0El5hv/gctMV
 rb8FYH///H7UKJdRlQ0jDR71OmEXdv63KGO+Mp75+tmXtwNtLjgOy81uFHd7EBonphLc
 RpDw01KUo2YSPn86AjE0epbc1zRjpx30cnh33OUtgrJ0xjSg8oJ2D7OhAI/da/dqPIx5
 KlGHlzwlrve74/sWwFLrg/HdgtckqDhDqzKc6jvWyOTB07t1HZCXp+kRBZK6jOHB9Ptn
 aoXGwBZPHW3XsIuRizmsW9ermB7Oh5vy87tSNXDOHmHlLocA43k5hPcbXP1DjaiZDzmc
 LE2g==
X-Gm-Message-State: AOAM532hSaw/47JCyu15V0x0RjkbqWTNdOIYyPvaKqS0VBgXbwqZQR4A
 i+A6zdx8RV5v44Ulb6PgwDmZVSsV3tnrKw==
X-Google-Smtp-Source: ABdhPJzycMR0//0M/8e8N7IpM6ATto1Y8TnfJCWoAzMg1/1GsDZDF+HDQ2M35wUsLEPY1bdipUpT0A==
X-Received: by 2002:a05:620a:28c9:: with SMTP id
 l9mr547172qkp.761.1640131874530; 
 Tue, 21 Dec 2021 16:11:14 -0800 (PST)
Received: from alexdesktop.localdomain
 (cpebc4dfb42ca53-cmbc4dfb42ca50.cpe.net.cable.rogers.com. [99.251.122.96])
 by smtp.gmail.com with ESMTPSA id i6sm503410qkn.26.2021.12.21.16.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 16:11:14 -0800 (PST)
From: Alexander Orzechowski <orzechowski.alexander@gmail.com>
To: QEMU <qemu-devel@nongnu.org>
Subject: [PATCH v2 0/3] UI fixups
Date: Tue, 21 Dec 2021 19:10:48 -0500
Message-Id: <20211222001051.2295513-1-orzechowski.alexander@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::732
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=orzechowski.alexander@gmail.com; helo=mail-qk1-x732.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu trivial <qemu-trivial@nongnu.org>,
 Mark-Andre Lureau <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Alexander Orzechowski <orzechowski.alexander@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some UI fixups including one revert.

I have some things that I want to have a discussion about. Fullscreen mode
will always distort the virtual console. Is this behavior we really want? If we
get rid of this, we can combine scale_x and scale_y into a single variable
and simplify things a little bit.

Also just from looking around a little bit in ui/gtk-egl.c the code
seems super broken regarding the virtual console rendering in the correct place.
I'm unable to test those code paths so I haven't touched it for now.

Changes in v2:
 - Dropped patch 2, I couldn't figure out what to colour the bike shed
 - Fixed incorrect rendering when gtk/gl is using scanout_mode

Alexander Orzechowski (3):
  ui: Use allocated size instead of window size
  ui: Revert: "fix incorrect pointer position on highdpi with gtk"
  ui: Fix gtk/gl when the scaled virtual console does not fit the window

 ui/gtk-gl-area.c | 34 +++++++++++++++++++++++++++++-----
 ui/gtk.c         | 30 +++++++++++-------------------
 2 files changed, 40 insertions(+), 24 deletions(-)

-- 
2.34.1


