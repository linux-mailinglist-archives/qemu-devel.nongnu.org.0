Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5D833F90C
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 20:22:19 +0100 (CET)
Received: from localhost ([::1]:35914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMbkI-0005X6-Aa
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 15:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1lMbZw-00064I-Fp
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 15:11:36 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:32975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1lMbZt-00084f-Iu
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 15:11:36 -0400
Received: by mail-pg1-x52c.google.com with SMTP id g4so214214pgj.0
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 12:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+cov/Pby034B8URCFDLJN6dtRs7lBzWNmP1hIcRFWjI=;
 b=Igfo0t04sdhm7kZ+1Sum2AB8+J6AKxR0yBRJBzx9zKO62os37TYB5ICgBlEf9Rwjz9
 huMBtoxMGjVc8ItiSm6dDZFvERDRhwPPGSN6GNVh4e6Wl+CCkuoZX29IixgfddcK9FtR
 jBEhC/tHx0N1LOXUcpZR5VKqpEOPeCCKB0uXCutH0U2isQ2+mORgEZKqzs1g4u+hsHCl
 tmKxRz75Q9Dhf1J3VZyb1QedR17+UbOcg5pUI4hRPz1DNh/5x2FOXxczwpyGFiYEcL2T
 Ze9lFlSq99g/qAC8AZmGkODumwA/gO3h0ZpcEQlqO3wYyPd0TaTYvjTH12herlDC4rVg
 ydqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+cov/Pby034B8URCFDLJN6dtRs7lBzWNmP1hIcRFWjI=;
 b=V49O8+m8hDM62lL1gC4+z4GyZgao1MrEP3n7SGM+B0KVE2h/nE8wCuXxajq8FHf+DF
 dYGTGRU0f5uqrU3N4IieHok02vTYBkP+aVpt9PSWjwGq0lY7BQMHryUbOaCkHwOs7VNm
 NhW3jDL9SHoj6ddK5eE6AGXKkYOQP4BFZM16DOLA7f+VCR7fnP1Kk5DuextpoIeRU9po
 QXjnYboLviqgQmyh2umK7iR/ayks+Uffes+ksvYZYtuUuVsSirHQYGmi0EpS1hCxYfos
 6AExia62HjBrX2NRK+9OUDGPbtAlSr7j6zKLLN1uochmpTYVsRKVKGKwJBlMYZ6Uun2L
 dPDw==
X-Gm-Message-State: AOAM530LKy/3+kT1DSibhWl9Pd0/uH7NMx2YRKkpmjC4oIQdEp999XqI
 HCgKd26e7xdrtR0Pci3664xLjOnV8Aslkw==
X-Google-Smtp-Source: ABdhPJzXrXw9dOV6PiL5EI/1HMyeRMwgDGHgoi42bQZGf6tomfA6eGpCdtbdVW9H3ApvCRUZiEH+Qw==
X-Received: by 2002:a63:7c45:: with SMTP id l5mr3911006pgn.156.1616008288879; 
 Wed, 17 Mar 2021 12:11:28 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id i20sm19077870pgg.65.2021.03.17.12.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 12:11:27 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] *** This is based on pull request from Alex =?utf-8?q?B?=
 =?utf-8?q?enn=C3=A9e?= ***
Date: Wed, 17 Mar 2021 19:11:13 +0000
Message-Id: <20210317191115.1445-1-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.29.2.windows.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=luoyonggang@gmail.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

*** BLURB HERE ***=0D
The pull request=0D
https://patchew.org/QEMU/20210317072216.16316-1-alex.bennee@linaro.org/=0D
=0D
Yonggang Luo (2):=0D
  plugins: Update qemu-plugins.symbols to match qemu-plugins.h=0D
  plugins: Move all typedef and type declaration to the front of the=0D
    qemu-plugin.h=0D
=0D
 include/qemu/qemu-plugin.h   | 187 +++++++++++++++++------------------=0D
 plugins/qemu-plugins.symbols |  25 +++--=0D
 2 files changed, 104 insertions(+), 108 deletions(-)=0D
=0D
-- =0D
2.29.2.windows.3=0D
=0D

