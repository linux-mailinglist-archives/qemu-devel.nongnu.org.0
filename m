Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF9651DC7E
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 17:46:34 +0200 (CEST)
Received: from localhost ([::1]:59430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn0A5-0005rN-Ja
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 11:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nn06n-0002sR-E3
 for qemu-devel@nongnu.org; Fri, 06 May 2022 11:43:09 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:33326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nn06l-0007lT-Nh
 for qemu-devel@nongnu.org; Fri, 06 May 2022 11:43:09 -0400
Received: by mail-ed1-x534.google.com with SMTP id p4so9181704edx.0
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 08:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6et6aIX/c4kRoGbNqwUeX1dYyLcethDXQYflwPxRSIw=;
 b=iN6qCsKfypIs9HkFiEWPCytti67prbrI0yjzGH4K4gD2HexTxwVL8gsixiNHRL0tFb
 Gxx8KKB8PpfA53YbiNVmmk31UYOg2ShptM37Xvb3hQK0V2Jc3WEsIINzmzHx9vks13lW
 0LiwH4t0Dn4V3oTx9X9M3jtmL6w6ZI0vzUgYzxgqhMtD3+5kAD9jqX2hyavNznVk/DVB
 hIddfah8+B7cFSiLNXZTS1jy4DMWctKDEDXEqr3tjcvWwOyizSK8ZQ9aFaT0jeUYy7iG
 UAfr4ndRhJiUACeL1R2w+tzTU82t+E2A3r4Goly4/9AuJAraaNYZYbWWKFRr70B15rqx
 YtFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6et6aIX/c4kRoGbNqwUeX1dYyLcethDXQYflwPxRSIw=;
 b=lJp/sygoyziXvbR8Jz/F53h/mhV76GtjupJk+ttyia8NcqZG9wqmEF1ygP9mtWc4N3
 tdxkMetkJKhaPq4W0e6ZrAvEruYFL7WT4ODGmeb3lr2opbkC1jxjq+dWMUh8AWH9UNpY
 zVPKR3iNX/Iaows5RDWGiN7fGryh6kRXaseicp5OZWuZhGASLVpj+PD1sDGWKN3QevjF
 WIh+uUNRx2qqmP57MSDdTVcDmUFkvRb/h7Hsi3CLFmLD2uut+2UpiigGc3M+wEXq+yYR
 6XSluY33Ab8Wx57OgCaGTkTots01nHulljZ/XJQMus/eKM2ZNCHaPAmp3qE1vc29D3Hw
 /HNA==
X-Gm-Message-State: AOAM532ebm9yh71laz2FLmfIHZsCrQZJm2nEuG8S3ZJruU7DMJJeYsWz
 c4Fyu/XOKNkDYXBmnve98Is=
X-Google-Smtp-Source: ABdhPJxFyk3NR5C/8KBj5I3CMTNzgAaxvjN3wJGyy5fmpqFN3gxgM/TJvFCSH81TDmz66KTXQ6qFKg==
X-Received: by 2002:a05:6402:1941:b0:413:2555:53e3 with SMTP id
 f1-20020a056402194100b00413255553e3mr4057870edz.164.1651851785455; 
 Fri, 06 May 2022 08:43:05 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 qc3-20020a170906d8a300b006f3ef214e0asm2060622ejb.112.2022.05.06.08.43.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 08:43:04 -0700 (PDT)
Message-ID: <7551dedd-7417-6292-907b-28ff8304cd83@redhat.com>
Date: Fri, 6 May 2022 17:43:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3] Warn user if the vga flag is passed but no vga device
 is created
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, kraxel@redhat.com,
 qemu-devel@nongnu.org, Gautam Agrawal <gutamnagrawal@gmail.com>
References: <20220501122505.29202-1-gautamnagrawal@gmail.com>
 <YnUvpsaM0hwUSZvM@stefanha-x1.localdomain>
 <b16d2b2d-f086-636b-4da5-79d3134a4482@redhat.com>
 <CAFEAcA9rK6T03mkUrojf+Wz=UCiakibXtj56W0F=uuEjeqoZig@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA9rK6T03mkUrojf+Wz=UCiakibXtj56W0F=uuEjeqoZig@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 5/6/22 16:48, Peter Maydell wrote:
>> I'm just in progress of preparing a pull request with misc patches, I can
>> also throw it in there if nobody minds.
> Paolo mentioned on IRC yesterday that there was some detail he thought
> it wasn't handling right with VGA_DEVICE, but I didn't really understand
> the details. Paolo ?

Yeah, I was wondering if this would warn for "-device VGA".  But if so 
it should be enough to do this to fix it:

diff --git a/softmmu/vl.c b/softmmu/vl.c
index eef1558281..7ff76b795a 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1352,6 +1352,7 @@ static void qemu_disable_default_devices(void)

      if (!vga_model && !default_vga) {
          vga_interface_type = VGA_DEVICE;
+        vga_interface_created = true;
      }
      if (!has_defaults || machine_class->no_serial) {
          default_serial = 0;

Paolo

