Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1A2621BA7
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 19:15:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osT7U-0000rb-F0; Tue, 08 Nov 2022 13:14:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1osT7S-0000pv-MW; Tue, 08 Nov 2022 13:14:42 -0500
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1osT7R-0001Jz-92; Tue, 08 Nov 2022 13:14:42 -0500
Received: by mail-yb1-xb35.google.com with SMTP id n85so12706677yba.1;
 Tue, 08 Nov 2022 10:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bC+ZVKLblWKhw3D3YTLaNlvsIFtSzqZulSjuHUpQTJc=;
 b=NIW4loZRsHvodLJ91KnrAixY0XmSEhuF8C/hEcOyIW2xxqAaN5DCS1nD2FTk8VRzs3
 FpWgGrlhI7Qgxgqa+dbrAOcjuBOIwoCgoLH9KxhvC8arLL19EVef4Blx2w/tC3pJv4pc
 lVVQJaVvWunsjHW66RqpONISt2P66sAvw5zXhLSa9Xi9qQI6s3K7a3ST1Pom2L1bAv9f
 RRhFn3OyWwkGJdpy7oEsXko3S03+2O+g9kd27Qsa9u7DBP4c2jtbUxphrjek5FU3Bhr9
 qGCbKGc3L9jre9qpIC9iuIKdsb0toVpCKjHh1XtQ+LLSzp5ps/5JEVdCwh1JEXCB9OO4
 Uuow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bC+ZVKLblWKhw3D3YTLaNlvsIFtSzqZulSjuHUpQTJc=;
 b=0/3fQzjBwJ5U0J119bYH9DWPa2qUyGfP38E2YVLeoNyd+BI1kzlD4B6c+ByJMw4Kny
 LPsVaspTnNELcUxZB/wNrlSk85v6eLdYTtT8XTuFtLMEwSdldGVnYVr4OLDItS39ycMR
 KlS+WOF2MKQzXdX93DU3lRnPJsLnjziNvM/7YxyRnbY1vV0vIsseI5P8be+N0AxitQle
 2b7Gs/9yeB3iZHjqPauD1dh+Q9SOgsAnwI9UHLmQPM5zSSvK+s2fFVjDz8py9dm189kF
 dMbZ7yNou2ZMoomqHCAvkbaImDsz5iR/mluVu8jNGoAv7UR/K6rQ3YLpNUX9bm8n873z
 CnOw==
X-Gm-Message-State: ACrzQf2iAUpDNj5b80A7xCnRfPsPitpjHsj/yDhLkvgyykKdksuXKE5b
 6OdnVQriCvV04YWPeR57yXM9/LmiM5qh/YKkYkU=
X-Google-Smtp-Source: AMsMyM7UjB11iQApuqTVYb1UyVLXpIdVDnHZjYmFG5nhIWySmNUSxqn16xHuPi2VCmCUAWbiUnyLiCuXH6yVwadBbQE=
X-Received: by 2002:a05:6902:191:b0:6cd:3a43:cda3 with SMTP id
 t17-20020a056902019100b006cd3a43cda3mr43339537ybh.207.1667931279583; Tue, 08
 Nov 2022 10:14:39 -0800 (PST)
MIME-Version: 1.0
References: <20221108175755.95141-1-philmd@linaro.org>
In-Reply-To: <20221108175755.95141-1-philmd@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 8 Nov 2022 13:14:27 -0500
Message-ID: <CAJSP0QWyiKF+5LhG5fwf37uz1Hy_gxUVvtH20acVc5X-OG2u8w@mail.gmail.com>
Subject: Re: [PATCH-for-7.2] Revert "hw/block/pflash_cfi: Error out if dev
 length isn't power of 2"
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Sunil V L <sunilvl@ventanamicro.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Markus Armbruster <armbru@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Applied to staging. Thanks!

Stefan

