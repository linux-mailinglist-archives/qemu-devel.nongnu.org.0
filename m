Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB7138F275
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 19:45:21 +0200 (CEST)
Received: from localhost ([::1]:39502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llEdk-0001f0-6p
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 13:45:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llE0m-0001Xc-Q4
 for qemu-devel@nongnu.org; Mon, 24 May 2021 13:05:05 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:41534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llE0l-0003zG-6p
 for qemu-devel@nongnu.org; Mon, 24 May 2021 13:05:04 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 l11-20020a05600c4f0bb029017a7cd488f5so8692314wmq.0
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 10:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X/RDNvQdX2KPe06yg5b1HSL5e8FsBd5LujHEk/jRQR4=;
 b=f+uNH7id7X9/OPX6zQskYyZ/UCNgEmqULDsah3XkCK0h/W3JRTGGJlVVaMZCMuEk0i
 XdJmsZa7+jlMsQxleSaOCM8dQdVJcqfji6vqRTnwrrW4DK6mg+D5GwlJd/qmaydkka5U
 aE9Drbg2D/8TDt/ppEKc1L6nAmDJmrEPzO2gb8N1iAHTTLxiFywETyYzyRKsbnVAJgr4
 HJeis0E1nnIT0VI50DE34DJkW60OmptaI/nvRwHpF4OysaTPR9CBnNoNJsxr0Yn61xWl
 cieYkiB4pJ6FKvpecoij9wlBTKm43WIDeO3ay7yfohkxU2ufUXluuoXySZhaV7pas82d
 pdyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=X/RDNvQdX2KPe06yg5b1HSL5e8FsBd5LujHEk/jRQR4=;
 b=F2/h/UMYFj6k3WotSnAbJzRTP9XYLJewYgPvS/OoO3TTnyTR6rTE7dkw1InqcyhXX2
 WK+O4Ee8XGnCXLJiDBWACUOFjkTvgioUvTGU1H4pvXjcV6+cXycGIC6Dx89WZkB8FUI6
 fW2oRO+lbFuafkkGC9g0eoOUjp6PE0ZI9TKJ5uiv939Xd6fqvun3JMnWc7hNfw6d6jKd
 I4FUExhoaVh8hfBzAItObf8UintFNauBQwKPvpFznMi9NHkErk2FOsHU/09sNoExr5Gg
 F9+BC25/7gosNFu47ksbs1RqDXAFkmigcneqzo6BWX3t1ml5VMsdPIvPcPPcngEAVZVg
 5N4w==
X-Gm-Message-State: AOAM530ZRRpp6ezvSAcKcAhLQmNpgwUT34icIlRcPp6bfQA7nL7KBada
 mWmNXm2wU6lpWKAoHvz7ojHpyZD6ehQZzg==
X-Google-Smtp-Source: ABdhPJzhBpDGrUbPX8OJB2o9SPWlPmNwUmtukJd6hdp6IQqfXX5KoaP+zQj3qJii3V95rqMBp3br0g==
X-Received: by 2002:a7b:c304:: with SMTP id k4mr106972wmj.68.1621875900994;
 Mon, 24 May 2021 10:05:00 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id r2sm13355367wrv.39.2021.05.24.10.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 10:05:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] accel/tcg: Reduce headers inclusion
Date: Mon, 24 May 2021 19:04:51 +0200
Message-Id: <20210524170453.3791436-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trivial series, restricting accel/tcg/ specific headers to TCG.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  accel/tcg: Reduce 'exec/tb-context.h' inclusion=0D
  accel/tcg: Keep TranslationBlock headers local to TCG=0D
=0D
 {include/exec =3D> accel/tcg}/tb-context.h | 0=0D
 {include/exec =3D> accel/tcg}/tb-hash.h    | 0=0D
 {include/exec =3D> accel/tcg}/tb-lookup.h  | 2 +-=0D
 include/exec/exec-all.h                  | 1 -=0D
 include/tcg/tcg.h                        | 1 -=0D
 accel/tcg/cpu-exec.c                     | 5 +++--=0D
 accel/tcg/cputlb.c                       | 2 +-=0D
 accel/tcg/tcg-runtime.c                  | 2 +-=0D
 accel/tcg/translate-all.c                | 3 ++-=0D
 MAINTAINERS                              | 1 -=0D
 10 files changed, 8 insertions(+), 9 deletions(-)=0D
 rename {include/exec =3D> accel/tcg}/tb-context.h (100%)=0D
 rename {include/exec =3D> accel/tcg}/tb-hash.h (100%)=0D
 rename {include/exec =3D> accel/tcg}/tb-lookup.h (98%)=0D
=0D
-- =0D
2.26.3=0D
=0D

