Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC863C15E4
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:24:33 +0200 (CEST)
Received: from localhost ([::1]:60512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1VtA-00061e-US
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmu-0000EP-P2
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:04 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:41546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmr-0008BD-R8
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:04 -0400
Received: by mail-ej1-x62e.google.com with SMTP id b2so10269505ejg.8
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7+5cc9IQeAW+TStBpSLFzIsbErmZkEw/lI6tTeLLQr0=;
 b=KsC8WGdcTM3iXZiMZuJf9/lNzDYoHLzKndqE9eIuNsI3KkYd2EFF9zIJ6+jj3EZbM/
 T9dD7Jup1B1DRgOBY2ctqy7Rc/6xHq8RHR/15sZ0RhNjoAuIH8A15s0Q3PcpccSyoFIN
 Rq4ttXcl4aC4S7w5FzBh6kIbTphbaxVExOeq3kSNJ6tw+mylI3kZ9C34YbUE32f+sRSr
 pv1Nc/+p2I/Xhbo9OmJ/R714dAl2Hc/PyR2iF94smi7yGbJ5pbJeoVBQs05XIcToKZc5
 3Gqw8i3voscmvVWbs6UNf8c/FMy/q8Q7XaGlNON4frfKuNKUOVl3v+dKCkbD9H87lB0G
 R5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7+5cc9IQeAW+TStBpSLFzIsbErmZkEw/lI6tTeLLQr0=;
 b=X6PzBUekzu+O/pAbudbpXebHueGf66wNWRrxCMJzapgEW4ULBt5lfV5eH3nd9+UuLd
 yGRk31T0QftyfWbeNMOL1CS3oQdzFc0cTRbrX6RlYayjoRDnaRCjVCP+mB54gA7mP5NF
 idyUp6iCBWheRcc4RVWf7zvQNfk6Iezj7LTBMTf1gXLnHoKbRbGlzhOzZrX756RJCiSo
 TU4yabVztobk2z8zIbtkcxXQ2K68ysDgTYts2gN+4RaW0dtk8uVpyW8UjabFoVpjBVOL
 ED9Y5z2HtGsEtlcxf1a0BOz/acz2Gdov9pe2mroAbgErq6fD2nPnQYHyRgHY/RiLl2Bu
 Jv4g==
X-Gm-Message-State: AOAM532RWJ9adY5dVogbk3+T5rhVzbbB6AUAl+X3IHc5n1Z7bPetCWrz
 crOqFmGoumAuBUzJFOEFxdg9kPCUhJ4=
X-Google-Smtp-Source: ABdhPJyYI50pyaLAoMfcXud3I0ej6ConbJ1mS62EL2/UsEdDi8IjZtrQdlD1TqhmUxHS3r6ukLIfKg==
X-Received: by 2002:a17:906:a219:: with SMTP id
 r25mr3891648ejy.133.1625757479180; 
 Thu, 08 Jul 2021 08:17:59 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:17:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/48] modules: add usb-redir module annotations
Date: Thu,  8 Jul 2021 17:17:13 +0200
Message-Id: <20210708151748.408754-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Jose R . Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Jose R. Ziviani <jziviani@suse.de>
Message-Id: <20210624103836.2382472-10-kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/usb/redirect.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index 6a75b0dc4a..4ec9326e05 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -2608,6 +2608,7 @@ static const TypeInfo usbredir_dev_info = {
     .class_init    = usbredir_class_initfn,
     .instance_init = usbredir_instance_init,
 };
+module_obj(TYPE_USB_REDIR);
 
 static void usbredir_register_types(void)
 {
-- 
2.31.1



