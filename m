Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E17CE628DFC
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:09:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouihK-0000yh-24; Mon, 14 Nov 2022 18:17:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ouie2-0001X6-6x
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:38 -0500
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ouhRT-0003jO-As
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 16:56:37 -0500
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-3704852322fso119989227b3.8
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 13:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=kxlqVr1OxmBS+rNPxIes8OkW6MBKZVzX8osCz9t1Kho=;
 b=qZQmxZdevsFqvYJPtrEJ+GHyrckit9YsuohtCQd7/VGVJQdAaGPQQgAzSNyUu+i/Qf
 b9/1XZlTGy+bv5eCfCcrEGpjF59F1b3kRJInmyGijl22y3nq7TIXagwHlFOPIOLoaUUU
 X54e0zM6LE4FUL99o0/yJ/lO4EdwoqmDqdD7DgStPtMCtt+2tdz1KG88fsTnre0x9tNA
 TS2CeEVkwFB6diuoCwr7OUkwou2PnJ4kZqjepGUYkQhwn7TO06dA/g9WK9xWQlVSIQZP
 SjbYN7+UA5uLit1cKRLg1nuGfgoMzsr8wVJZIXDSPF8PHDYJRRq9HCPNtu8+AOHfWDLE
 dKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kxlqVr1OxmBS+rNPxIes8OkW6MBKZVzX8osCz9t1Kho=;
 b=VB8Bi52ImxaunIYm5TRu44VuhWoZuFylRNQ7cdXIuw3kXrt565qDYR6x0rkfSJDbwL
 YIFsVCtfBamtlJP/5nsSGzb5yijjOqNUpeFX2uZFELh9M7+++XUb6YfIfspiGIr8Y2sh
 VLMDrYcrzLTJaz4fO8a5v0JVYK8FXmzr/h1jddVWgo4VqKR6tIfnznvC/OKadHOnFeGB
 X5r3WsVCuSPmttZVJ2ZinBhauLaSBUOnP/UmYpw/xLqMVp37EoSpWDKKQT/KJVovjhkb
 hsKWl+RWQDgxLAse9OyrSSRq0rWSFpq8lpXm2087C4/aZjXW8CMdB+gW3yQVJbY/CDqZ
 npdw==
X-Gm-Message-State: ANoB5pm57b8MzQvZcXnE2m0CRKyEhVA/Uqf7+13LALnPLS52GkBG4uta
 pZoggyZNI+Ce1Q1DZsjceOi7BVlFfXRrgAnd4uw=
X-Google-Smtp-Source: AA0mqf5VNie16spGj4PxG33jx0riiFaMtgJBZ7YBsgiyn1IDBA+hY0k7BExPqT5NNqxtlpfWsUwjQnqQWjR34b25M04=
X-Received: by 2002:a81:a54f:0:b0:370:10fe:f7e8 with SMTP id
 v15-20020a81a54f000000b0037010fef7e8mr15309167ywg.296.1668462991761; Mon, 14
 Nov 2022 13:56:31 -0800 (PST)
MIME-Version: 1.0
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 14 Nov 2022 16:56:20 -0500
Message-ID: <CAJSP0QXFBKY1_aXSs9=0=FN0M5GhgqFyM_Wxq9028znz=-MvyQ@mail.gmail.com>
Subject: aarch64 GitLab CI runner down
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1134.google.com
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

Hi Alex and Richard,
The aarch64 GitLab CI runner is down again. Are you able to restart it?

Any idea why it disconnects sometimes?

Thanks,
Stefan

