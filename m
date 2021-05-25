Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7C8390255
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 15:26:03 +0200 (CEST)
Received: from localhost ([::1]:60216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llX4M-0001MQ-8a
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 09:26:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llX2o-0000PC-Er
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:24:27 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:46618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llX2l-00015P-LI
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:24:25 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 l18-20020a1c79120000b0290181c444b2d0so6265454wme.5
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 06:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/PZLIlQSVpomspGdEUgm3d/OhIGxFGBdy1u2bO5Cmgk=;
 b=BnIi/bHO/fcJqcjdXxBENqTjJVD70uGwMRspDReJvaXXSNgnx+ZEDFgwYGNI0mq/Uy
 sdyTzwWw+eCY4iIHmApE39Vy/blqFnZJQwYHSEhuXc7tx0Te6ZXvVfR7ue1a9pQFos+N
 HZ47zIbAAqv1bieQJ25ib6Xxo+/K9gz7r8NkfI+ltHbhTTOwjAamSXp0XnoHS0xicvQ0
 HArHGAiOKwaaOPS2CYBeL7YRwG20qSvvH9G6zrK0sk3YujUJiPG0TW/SYCUZylrSzurj
 9m05rDZ93YzaN5RMb2iZYRlQrMKRuk3N/TEuse02FqC1alRSBYQb59R3g0iY7cjVNUNR
 La7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=/PZLIlQSVpomspGdEUgm3d/OhIGxFGBdy1u2bO5Cmgk=;
 b=mgqVcilQcGqPAwmczASSHvyw7FkfbXjussMNqVLelrl/tm72raIN+bHoo3100l9WmW
 O3G6KlcvXHC86jkvlrzPntnLYIKl99A0Mt2h19U32ukycXNQlsVTN9uRe2mqNrk0Inp1
 dgiaeYUvr0wkEbQXqw1WdmCHm+ZVX085bFallPRrOmDm2hmLST0RY6frcQyWB+vsGEyD
 GOCs2K2h0uYy8y9Zl2LramkvccHrgFTMyRHcf18BNvsIZoDjBemzPToCaYerAlhJOZJ0
 5fyVGKehUsj3pn+ZW6nXZZVzhP7BcT2sIdKSA7DDSBb3/fLQfsd4+QpfwmcwrJ/r4veU
 h/Aw==
X-Gm-Message-State: AOAM532a1v0pa/QVSDkk8azsjiO23eIGAm2BF7i8dquQmiNx+4JLyltk
 ua6p1kgEbsMvKSTkYtzVfNU=
X-Google-Smtp-Source: ABdhPJzO8BgBs8h6+Wgh+t67zXQUkAW/cfDXbBQymZzgJ7lSlVUIMfj0WYu+cvQqhA+pmLor4PqSfw==
X-Received: by 2002:a7b:c93a:: with SMTP id h26mr3862685wml.141.1621949061479; 
 Tue, 25 May 2021 06:24:21 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id a23sm15383088wrc.22.2021.05.25.06.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 06:24:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: [PATCH 0/2] Fix for the 'testing, gdbstub and plugin updates' pull
 request
Date: Tue, 25 May 2021 15:24:16 +0200
Message-Id: <20210525132418.4133235-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: <20210525112431.22005-1-alex.bennee@linaro.org>=0D
https://github.com/stsquad/qemu.git tags/pull-testing-and-misc-updates-2505=
21=3D=0D
-1=0D
=0D
Philippe Mathieu-Daud=3DC3=3DA9 (2):=0D
  !fixup gitlab: add special rule for the hexagon container=0D
  gitlab-ci: Convert check-dco/check-patch jobs to the 'rules' syntax=0D
=0D
 .gitlab-ci.d/containers.yml |  7 ++++---=0D
 .gitlab-ci.yml              | 24 ++++++++++++++----------=0D
 2 files changed, 18 insertions(+), 13 deletions(-)=0D
=0D
--=3D20=0D
2.26.3=0D
=0D

