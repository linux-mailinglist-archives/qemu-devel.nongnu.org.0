Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4717142BBC1
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:37:05 +0200 (CEST)
Received: from localhost ([::1]:37418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maah5-0000eB-L7
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaF3-0002cd-5x
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:08:06 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:35656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEr-0005w3-Bm
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:08:03 -0400
Received: by mail-ed1-x52c.google.com with SMTP id w19so7364720edd.2
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9e6ErNC+odqDQ74nox/v6mwbruJMWqSgjCx7Fe58coQ=;
 b=AZMHfswDMV0q/BG9ZMXwyo8hPw4WQpMF/BPvDCUJwqrj7uhHI6L+u34wt3zrVfaSIE
 9kD038+6p5XP05MYQFgLzW70mb7PJk5W+ygiqvLGqsDFkSbMEs9JJtOvakRaJxoyCIzm
 ws8lUvU/6QZfTFbzGWP7knjxFB6hf5yqyJlQKCykmU9oa1lPqWz7fEqDsBT49Q9tEXOr
 DDlh5Z909bg7crcxLkccrHlPHa8AfwsOFgblj+BWDjoM8wIOGydyeWdv7seza6WaUjZu
 +xASIo71R8iTn4ZB1fNEfnqlwmaJa8s1RYtogyFkke3wEfy52Dc3sxZHiKzelat1T3Ln
 mhCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9e6ErNC+odqDQ74nox/v6mwbruJMWqSgjCx7Fe58coQ=;
 b=iQtE7niDxUHUzfyq4IwDmuflXJ4m1riWU0bt1ITdq5wpABIRxCVVI4y/THRKP0yvgG
 /9ypNHr6qClD6HVuzJ+leMNWLQbBYxSeSaL9f9STEIe11/MldCHFkUGUsnAhJM+bCjvi
 QrKrTFglTzZ0RGmH/vXifEMq2kpnxbPMNAaoawtbl8UALMpshlxj77g4TnR91NQF5+NV
 B+F8Fn9138OOa4ZblBvI05Pfc8RBpmOMxllriwF1P2jKC6D2apih6nZKIDBb8O+uDVeN
 UkzKsLL1yECpJHcyySlPQWtrlxgbh/KipCCm4TOW2MNTV3Gf/nZCrrRIKauLQAMaLrsN
 puIA==
X-Gm-Message-State: AOAM531NJHH0GDFJzqqjJYMCjyHLAkKlX6MfeR9dvlYfUIQV6/HYratB
 K43HkdvfpNnET6vg48LDlg9hl7NbIqo=
X-Google-Smtp-Source: ABdhPJyKQDXlTvc/V8TbMIP6+hd8TnFOlzQM7tXxphMWtRiVfq2Aswrwz60udR3PQ81eNi5niN8yiw==
X-Received: by 2002:a17:906:1c03:: with SMTP id
 k3mr31277746ejg.562.1634116071969; 
 Wed, 13 Oct 2021 02:07:51 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 32/40] MAINTAINERS: Cover SGX documentation file with X86/KVM
 section
Date: Wed, 13 Oct 2021 11:07:20 +0200
Message-Id: <20211013090728.309365-33-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013090728.309365-1-pbonzini@redhat.com>
References: <20211013090728.309365-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Yang Zhong <yang.zhong@intel.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Cc: Yang Zhong <yang.zhong@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marcelo Tosatti <mtosatti@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211007175612.496366-2-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e31c190b47..cfefe386ea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -418,6 +418,7 @@ M: Marcelo Tosatti <mtosatti@redhat.com>
 L: kvm@vger.kernel.org
 S: Supported
 F: docs/amd-memory-encryption.txt
+F: docs/system/i386/sgx.rst
 F: target/i386/kvm/
 F: target/i386/sev*
 F: scripts/kvm/vmxcap
-- 
2.31.1



