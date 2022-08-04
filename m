Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1D758A0FC
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 20:59:25 +0200 (CEST)
Received: from localhost ([::1]:49364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJg44-0000E0-T4
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 14:59:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJfmZ-0005Bf-BL; Thu, 04 Aug 2022 14:41:19 -0400
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936]:39835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJfmX-0004vQ-Fv; Thu, 04 Aug 2022 14:41:19 -0400
Received: by mail-ua1-x936.google.com with SMTP id c19so185778uat.6;
 Thu, 04 Aug 2022 11:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=3AHRBvtK+8ekDRF6Xl9IaxBvwMrKZUWuH96uIV8rFmI=;
 b=BupuRzHVwHZBon6QT7qpc8Px2Oc8Zp3Sx08DO5O6c2QSE0UgOGLBgh4DLEr+Bve/rt
 TVIrYG0Wkb4q4FyL7jWq24RB8lrdZN+xSeFdGRfc4e9r8OoAA0dB3jnWBlzHR5oXLThM
 AeYbpcxsCMLbaW/XWZTt0RIix9/KekdgpIMRk5HJkhLmDPlLAG/n1XL8iSeDGYLaVc4N
 tm/VVW/qFIndzMtLLwte1JDVNsstNYh1ROfqelRgBs3PbpOG/QSywLbJZkKUT2skWAs5
 Pv/hsYC0lHzXugclqFEbSDfCqd57Z7ARk+ARr/UYAYDwFMjbFCDlMvVaqTNEBsVpwVb7
 B0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=3AHRBvtK+8ekDRF6Xl9IaxBvwMrKZUWuH96uIV8rFmI=;
 b=PaxYa9b/B6unUUZqumXyVzlB+EolGwHfZwORxX09BHUlr43ffG/I0/YdJ+u6eo3Od9
 Mw+BT95z+R1LF1rv+grz2bgrgrvJAXgENenztwDDpCEQtT/IyCz/7zupdZRMCnP1IIno
 DNWxS0Rm1EdjuHn9z3anJ1HJB2RW/fhkKlpa/NC8HB4PykSAP33PGxtOGODijJLeqiR+
 6ZkslWTnoRk86vP2hzYrsEhxn3uwXbIQ6KkD81VbudOi+aeAtgkOYvUC7l2zwVZ6UVnX
 0sPsyWz6xY0wbXg9llX75061VnwQMwLQjDz1ofDZDEK1DO8VwljzpcN8dCxzpre7uT4u
 r5jg==
X-Gm-Message-State: ACgBeo1WK85rx8cyOJVMAtDYAQbdwA787HQK3CoV7B3ESNB0KrPN+szx
 HixNtmp5b6XSprMEbeLHwyE5stoU8a8=
X-Google-Smtp-Source: AA6agR57rGQHaN6eRmMPwA3Jna4B5hHibZRJp4zBzFrkk7I3VjJ972GDgQMhJldgPRvSqlavgEMb3Q==
X-Received: by 2002:ab0:7c7b:0:b0:384:7e37:3083 with SMTP id
 h27-20020ab07c7b000000b003847e373083mr1567383uax.53.1659638475737; 
 Thu, 04 Aug 2022 11:41:15 -0700 (PDT)
Received: from balboa.ibmuc.com ([2804:431:c7c7:52e2:fb25:323c:5709:7237])
 by smtp.gmail.com with ESMTPSA id
 a12-20020ab00c0c000000b003875ff95a29sm1592583uak.30.2022.08.04.11.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Aug 2022 11:41:15 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org
Subject: [PULL 0/1] ppc queue
Date: Thu,  4 Aug 2022 15:41:10 -0300
Message-Id: <20220804184111.2770822-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x936.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 2480f3bbd03814b0651a1f74959f5c6631ee5819:

  Merge tag 'linux-user-for-7.1-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2022-08-03 08:32:44 -0700)

are available in the Git repository at:

  https://gitlab.com/danielhb/qemu.git tags/pull-ppc-20220804

for you to fetch changes up to ed021daf2d6c19499ae406055156dc19c073228f:

  hw/ppc: sam460ex.c: store all GPIO lines in mal_irqs[] (2022-08-04 15:20:14 -0300)

----------------------------------------------------------------
ppc patch queue for 2022-08-04:

In this short queue we have a fix in the sam460ex machine where we're
not storing all GPIO lines in sam460ex_init().

This is not causing problems (as far as we're aware of) at this moment,
but this is getting in the way of a ppc405 rework we want to do for 7.2,
so let's fix it now.

----------------------------------------------------------------
Daniel Henrique Barboza (1):
      hw/ppc: sam460ex.c: store all GPIO lines in mal_irqs[]

 hw/ppc/sam460ex.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

