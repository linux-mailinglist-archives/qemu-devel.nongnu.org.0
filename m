Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F046E3CB1
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 00:57:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poBHc-0004zC-Fz; Sun, 16 Apr 2023 18:55:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mateusz.p.albecki@gmail.com>)
 id 1poAs8-0002SX-Fm
 for qemu-devel@nongnu.org; Sun, 16 Apr 2023 18:29:24 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mateusz.p.albecki@gmail.com>)
 id 1poAs3-0000jW-5A
 for qemu-devel@nongnu.org; Sun, 16 Apr 2023 18:29:23 -0400
Received: by mail-ej1-x62d.google.com with SMTP id dx24so15459180ejb.11
 for <qemu-devel@nongnu.org>; Sun, 16 Apr 2023 15:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681684156; x=1684276156;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mf66ChiduMs2HuJbdy1IwvoPyoWfADemLhsTDhoq8CE=;
 b=PsYiOZZwSYPR5taCCn4rpUNz6284KWgmo0HqUVsNIezY8BOrVeEFVVQEA5Cfdi2D47
 4akJyGnYxeJ4qoQcJm6lT4IJle4S0jfR6TPwkgxZCwhFIRKANHTvwuxlT7BNTfnsAfsd
 0pcJkLWZ2yHoMjRFQbdaF5m5fWHALZlDYH/nxmTsJgUXb5p1OrDRxeHxWvaEwtLaUTGk
 cHTNpRd8ekLZcBeCQ35Rq9ZkI3fe0zLsvJ2UTBGsjn07b5sE9CoPNQYY7yHbMC6qYPQ8
 PRPkCf6evg77370/SAHMAzFOpGu09rxjTD/pySN2+ns03fC1cI5FGHepPZ6uTCmU64dA
 LVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681684156; x=1684276156;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mf66ChiduMs2HuJbdy1IwvoPyoWfADemLhsTDhoq8CE=;
 b=Gbz2KIUCeC9ec5ZtVw1WKO2rXKXKvPI5UONAlc433cH74iI9DLUB+Wk+Pl+RiDhOns
 MAHx0zNMFwZxamkpb20k9Bs0auTbOJFXbX0fDJTJcQhQWICjN5lIGNpJwgUhKmeP4MHt
 PmPGqLOVjSRgX0VrY0wIYrybnv20AiVKG7g+ovjeKzT7jGrGzqrClxjqPQhp/CszfZ0P
 H/EOMKNl+XnitM8OMXKRNwLbEtR9NbLWhat7rMnIIQL+Ow8kHhhwhILVmd24iHQlSrp1
 3CLp1kfSREwLcSpp0FHBzh30kObApNPO9141e1ABxpM6s8aF718gFnreUtC0mtehqGNL
 BaEg==
X-Gm-Message-State: AAQBX9coh5p61HxUdSX4stJVp5Q28EMdIPWbaZBmE9efwaxs6aTuCB1M
 qECysiPecQmaRw/kNlMNTDAx/nixLQrvLQ==
X-Google-Smtp-Source: AKy350bdHXn8tcH4k6qm4L6/e/i85MPGv16H6zNEr5ZmDzJljfYNFKCm2IaV3mBDj8jqbwHnf8fb9Q==
X-Received: by 2002:a17:907:cb82:b0:94f:450e:6a76 with SMTP id
 un2-20020a170907cb8200b0094f450e6a76mr3233899ejc.61.1681684156458; 
 Sun, 16 Apr 2023 15:29:16 -0700 (PDT)
Received: from localhost.localdomain (87-205-52-253.adsl.inetia.pl.
 [87.205.52.253]) by smtp.gmail.com with ESMTPSA id
 gl17-20020a170906e0d100b0094f09cd4658sm3119143ejb.71.2023.04.16.15.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Apr 2023 15:29:15 -0700 (PDT)
From: Mateusz Albecki <mateusz.p.albecki@gmail.com>
To: qemu-devel@nongnu.org
Cc: jsnow@redhat.com,
	Mateusz Albecki <mateusz.p.albecki@gmail.com>
Subject: [PATCH 0/1] hw/ide/core.c: fix handling of unsupported commands
Date: Mon, 17 Apr 2023 00:28:37 +0200
Message-Id: <20230416222838.36642-1-mateusz.p.albecki@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=mateusz.p.albecki@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 16 Apr 2023 18:55:33 -0400
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

The patch was developed during the debug for the UEFI SCT issue reported in
https://bugzilla.tianocore.org/show_bug.cgi?id=4016. After fixing the issue
in EDK2 the test was still failing on qemu since qemu wouldn't return abort and
instead we would get a command timeout. Additionally qemu also has another bug in that
it reports support for storage security commands which it doesn't support(will file a bug).

Tests:
- tested against UEFI SCT test mentioned in bugzilla and it is passing.
- able to read/write files on ahci controller from UEFI.

Mateusz Albecki (1):
  hw/ide/core.c: fix handling of unsupported commands

 hw/ide/core.c | 1 +
 1 file changed, 1 insertion(+)

-- 
2.40.0


