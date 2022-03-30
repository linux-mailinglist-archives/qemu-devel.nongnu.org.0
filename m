Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C22224ECF1A
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 23:51:23 +0200 (CEST)
Received: from localhost ([::1]:57232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZgDq-0001jp-Rd
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 17:51:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZg9T-0003w3-BR; Wed, 30 Mar 2022 17:46:51 -0400
Received: from [2a00:1450:4864:20::42e] (port=46986
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZg9Q-0006dr-3G; Wed, 30 Mar 2022 17:46:49 -0400
Received: by mail-wr1-x42e.google.com with SMTP id h4so31089601wrc.13;
 Wed, 30 Mar 2022 14:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=eexd5zizeD97D6NJ0ogxPbSuN+rc4vGyG8T3G4LuVBo=;
 b=J4ZhQYy4WGgEZ0fS6+5W8xZeVUF0aMfdNrMjrjuZNEZpkoe27RigpuIOJ5l569uapq
 ZCICeejSk2r3+UZRTP9SJfoAHusKP8J6N0Au2SL0IT0RWTieb4r2/e0b41fUpNrMj2IE
 3MURC80UDttKeD2Cn5EUJfwed23fC8XzcUl8niFzeM9sFTkFmJE7rh8O0B1KMdYHpZDl
 cHd+4oaCYhtGhLqjGYJUoUBfTFBtb3SINXf3p0acRjcXLfQdKtdZPJ/ZACmKtliU48YJ
 GvXDYU8pXU1pWxXRGqk0fLVBZ6e0ccsNIzxhKqMKgriA6jEnj67vqcqMrN+BAM4xRjqA
 vl2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eexd5zizeD97D6NJ0ogxPbSuN+rc4vGyG8T3G4LuVBo=;
 b=F4d3FgCvdJqxumUGlzFeeAy6CDO0svQ9CPB7ofFuyYSjhnysuq80XnVN0Y16pfHQkN
 Y0kFUuQy1smnOI1oSOtGz2h00zZ2u38aEHAFXUwp09i72NkgQQ+0NvF7WJSFJW9rcWv/
 uxlfIbFrqg3K2wJ5UgC5C13efjDuNRdTtjZL5J2drx5BXSXAnB94wSdulG1oVhzx8ISh
 mNtZ28PXGl54h0XS50WTX8RLppmLSq0by8eiyA9uGT8V24oINjPXsJJJXV7AdUJUB7LG
 Z9t8404neOHk3FZVinw+NErzdG2+ai3pKCI7lIWF+aDnHjncAx9AHFQLY+6bHoaQNJW5
 XoHg==
X-Gm-Message-State: AOAM531s/l4U0VcCkSy/5UADOX68IfRzWQ1wIm5UDZtPti/7qhg7PfvK
 58sNKQ9JNUfHzwRgVZbczPo=
X-Google-Smtp-Source: ABdhPJwnGTpthj0DFjIDFRW1Xyiix7bam/tDK5tUbSbQYGPZnJWISeajZj8uGfeZnPtte60XbiYmgw==
X-Received: by 2002:a5d:50c9:0:b0:205:b813:daa8 with SMTP id
 f9-20020a5d50c9000000b00205b813daa8mr1451318wrt.35.1648676806374; 
 Wed, 30 Mar 2022 14:46:46 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:403e:ab57:ee68:20ea?
 ([2600:70ff:f07f:0:403e:ab57:ee68:20ea])
 by smtp.gmail.com with ESMTPSA id
 q8-20020a056000136800b00203e740c7desm18264795wrz.71.2022.03.30.14.46.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 14:46:46 -0700 (PDT)
Message-ID: <3ff138d4-f89a-5524-c06b-a0a3dbe7501a@gmail.com>
Date: Wed, 30 Mar 2022 23:46:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 0/4] ppc: valgrind "uninitialized values" fixes
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20220330210443.597500-1-danielhb413@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220330210443.597500-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/3/22 23:04, Daniel Henrique Barboza wrote:
> Hi,
> 
> These are a handful of trivial fixes to make Valgrind happier when
> profiling the boot of a pSeries guest. All the patches are handling a
> similar case where we have something similar to this:
> 
> ---
> uint64_t val;
> 
> (...)
> 
> kvm_vcpu_ioctl(...., &val);

Which is a false positive.

> ---
> 
> Valgrind does not consider that 'val' was initialized and then it keeps
> complaining about every future use of 'val', or anything that got
> assigned as 'val', as being an uninitialized value/data. The fix is
> simple and without any side effects:: just initialize 'val'.

I gave a try to some definition but the result is rather ugly =)

-- >8 --
diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index d9359859d4..85429930fb 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -194,4 +194,10 @@ extern void QEMU_NORETURN QEMU_ERROR("code path is 
reachable")
  #define QEMU_DISABLE_CFI
  #endif

+#ifdef QEMU_STATIC_ANALYSIS
+#define QEMU_UNNECESSARY_INIT(values...) = values
+#else
+#define QEMU_UNNECESSARY_INIT(values...)
+#endif
+
  #endif /* COMPILER_H */
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index dc93b99189..97aec29694 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -546,7 +546,7 @@ static void kvm_get_one_spr(CPUState *cs, uint64_t 
id, int spr)
      union {
          uint32_t u32;
          uint64_t u64;
-    } val;
+    } val QEMU_UNNECESSARY_INIT({ });
      struct kvm_one_reg reg = {
          .id = id,
          .addr = (uintptr_t) &val,
---

Being able to use valgrind is more valuable that these unnecessary
init, so:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

