Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 172054E2E7B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 17:47:56 +0100 (CET)
Received: from localhost ([::1]:57678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWLCF-0005RI-6X
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 12:47:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nWL9Y-0002P7-6L
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:45:08 -0400
Received: from [2a00:1450:4864:20::52a] (port=37517
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nWL9V-00080y-S9
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:45:07 -0400
Received: by mail-ed1-x52a.google.com with SMTP id b15so18582184edn.4
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 09:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pNZnv1saRQDDmcJLBkOEI7OsO8XdqJo3aoM6lXuAMCw=;
 b=NthXUVNX83wpzRcmhe3cpFcwxrNMCrBuQuCTruvhsuzmKbC59zde2XoLDP9vPh3d4V
 8Mu5fJiEois9qlS8EZyXI2d1lwUlrlEWMhpvyjrjllyvmHBxCpyWuNIGsny6rArKz99/
 T4tiX0YZXRtPV/hUBUFKOsCu7mYfmFFYUhutG0V+gOg61OP5OVK2YyJMdOQoYk1wA74I
 WkFoQk0qMVMpKYk1XAADvfowHNxuTicSKlTI/M91og0+Tebk4wxFnNuPjNeyuC7+WVg8
 aiIY9ilHaqQRWCZORqqsFqBuHpThCwt3+a6Zxbvnc5AtvqNShCkTQsDnEj/b8+26ThWM
 4CNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=pNZnv1saRQDDmcJLBkOEI7OsO8XdqJo3aoM6lXuAMCw=;
 b=IjkwDYR2yVVIDRiN+XoprDzgB3TeLS+GQd3FuT5LdWb0Yb4Dm+7eOnn8HjrAl2Lakr
 PbFsTJhB50Og7dcDR8wL+Y6GqPFQJWPmyomjbkzSWs4gKA43ufNqfyZ1yss5CVTQRwWp
 B90wyNhcf9lI5ksJQkWU8KtoyjrgVmR9ovXfxBKmGdtmTDj/+g2HrHbydaJ3chX0sHyr
 foqpe9fyFSUMVM4Pvxrql1+kZgXs0ZOPmOySg+QiTMvlW+B3AxBDLrG1ZAj+nQNDTQJo
 /URkQFN2SpItBDzHLm1YtTJfdGD13UHz60JL7/e4cJX6H3e3hiFzOJdLibkGGtIiw6sj
 DRvg==
X-Gm-Message-State: AOAM530lLG2niMqJF3C89UJAMMML0xoxNoAAhQh6XNbcw5dppHMXEdhj
 EE610Qpr0QaObK7wOKkqyYEwu5eLtzY=
X-Google-Smtp-Source: ABdhPJzDqV/Ki6ui9raPYUzF4Z3Ytqozi/BnXxizRqtgC4sTNblEUibeCR73Q0z2uFsX6z+eQzq+Cw==
X-Received: by 2002:a05:6402:d67:b0:419:48b:a762 with SMTP id
 ec39-20020a0564020d6700b00419048ba762mr19239858edb.291.1647881104043; 
 Mon, 21 Mar 2022 09:45:04 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 a102-20020a509eef000000b0041614c8f79asm7949352edf.88.2022.03.21.09.45.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 09:45:03 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] Bugfixes for QEMU 7.0-rc1
Date: Mon, 21 Mar 2022 17:45:00 +0100
Message-Id: <20220321164502.201160-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit e2fb7d8aa218256793df99571d16f92074258447:

  Merge tag 'dbus-pull-request' of gitlab.com:marcandre.lureau/qemu into staging (2022-03-15 16:28:50 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 17e6ffa6a5d2674cb2ebfd967d28b1048261d977:

  hw/i386/amd_iommu: Fix maybe-uninitialized error with GCC 12 (2022-03-21 15:57:47 +0100)

----------------------------------------------------------------
Bugfixes.

----------------------------------------------------------------
Paolo Bonzini (2):
      target/i386: kvm: do not access uninitialized variable on older kernels
      hw/i386/amd_iommu: Fix maybe-uninitialized error with GCC 12

 hw/i386/amd_iommu.c   |  7 ++-----
 target/i386/kvm/kvm.c | 17 +++++++++++++----
 2 files changed, 15 insertions(+), 9 deletions(-)
-- 
2.35.1


