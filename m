Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EED854C56F5
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 18:09:44 +0100 (CET)
Received: from localhost ([::1]:33866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO0Zk-0002ac-2T
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 12:09:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nO0XR-0008DJ-Pc
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 12:07:21 -0500
Received: from [2607:f8b0:4864:20::d2d] (port=45766
 helo=mail-io1-xd2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nO0XP-0000Pm-ON
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 12:07:21 -0500
Received: by mail-io1-xd2d.google.com with SMTP id c14so10146894ioa.12
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 09:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ofnHKkN8PdXzijWUIHfVMI1oGobWCqOzmD9JyEB/pSk=;
 b=KxEm+ptU/3UaatRdYzJAOQMDdwX5+9SuskzDO1ot6uy2bR0xOhIKy87SvIyjHZheJF
 9kEvnQRCQjPNxEBk8MUvDc46PSm+Rz5jOLgS3bGoLaWDH73CDY7OY68no/YJb12TGi7Z
 wLi5q/CnwrDGPJS9JcEZdoQeDXcxtkbaoTbK1i6mMUSFfaZpS26Dhdlcc5KKbO4JaQpZ
 7S4H3wvmNM5oEvIo9Ww7P3MfG9AdINIKxkAGkVV8vk23kHnxmcFYHsmrMDT1GAbWIdhp
 FdEHeHlulRnDCvlvDOF4HRINp9CdoCI0pKu2fVHrTCprdSQwzVcr2ramp9O9eMcHmpUE
 B4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ofnHKkN8PdXzijWUIHfVMI1oGobWCqOzmD9JyEB/pSk=;
 b=F34P46EW70NxHE+AcnJYSmTOsyClq0xQLgc9xerpYxqDfGlUqT8bkX9p4m8IkNFRyT
 5o9wNP+gO8tKoHEId6klFew6M1l8nyUwuCMJw16kLQ20oPjkTg2qhy2yw06oLPm91Dy6
 yhKeuIfDUnQK+/in7pctNW4R2xA71l40SdDghdVYIj46sOdvz2PmUkI1Ap/8Fpe1PaG5
 6H+4KM5mVhW7zm+J+HUd8e+NfNdUZEbd0UBKFVxEAgJ1tjt+LluWXLzClYG+6iCE6Zqx
 Ea0iMdYWsaqiTyFTf/nV4bzhQbsCEY10RrXnmPVnWtRSRaUGavV/Px9uTR2rNnGcqF/R
 xzYA==
X-Gm-Message-State: AOAM531xpkKurHQ3gmhyln3/rKWsWoI3q7WieLZAmYtmIVtCMCWVcwI4
 gDSM6EH8ir+bYZN8kV+uXSwFwq8wjcxLcA==
X-Google-Smtp-Source: ABdhPJyg4ZxTm/vWzBHjCjDTi+5MxAcsIjnuY8X/Napb6IxGGYhsoGHs3++2m5Dw1rSGrsSjRfhJQA==
X-Received: by 2002:a05:6602:2d90:b0:63d:b41e:e4e4 with SMTP id
 k16-20020a0566022d9000b0063db41ee4e4mr9433146iow.172.1645895238580; 
 Sat, 26 Feb 2022 09:07:18 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 e23-20020a6b5017000000b00635b8032d45sm3138764iob.22.2022.02.26.09.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 09:07:18 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/16] bsd-user/arm/target_arch_thread.h: Assume a FreeBSD
 target
Date: Sat, 26 Feb 2022 10:07:34 -0700
Message-Id: <20220226170744.76615-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220226170744.76615-1-imp@bsdimp.com>
References: <20220226170744.76615-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2d
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@FreeBSD.org,
 Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since we can't run on anything else, assume for the moment that this is
a FreeBSD target. In the future, we'll need to handle this properly
via some include file in bsd-user/*bsd/arm/mumble.h. There's a number
of other diffs that would be needed to make things work on OtherBSD,
so it doesn't make sense to preseve this one detail today.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_thread.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/bsd-user/arm/target_arch_thread.h b/bsd-user/arm/target_arch_thread.h
index 11c7f765838..fcafca2408c 100644
--- a/bsd-user/arm/target_arch_thread.h
+++ b/bsd-user/arm/target_arch_thread.h
@@ -62,9 +62,7 @@ static inline void target_thread_init(struct target_pt_regs *regs,
     }
     regs->ARM_pc = infop->entry & 0xfffffffe;
     regs->ARM_sp = stack;
-    if (bsd_type == target_freebsd) {
-        regs->ARM_lr = infop->entry & 0xfffffffe;
-    }
+    regs->ARM_lr = infop->entry & 0xfffffffe;
     /*
      * FreeBSD kernel passes the ps_strings pointer in r0. This is used by some
      * programs to set status messages that we see in ps. bsd-user doesn't
-- 
2.33.1


