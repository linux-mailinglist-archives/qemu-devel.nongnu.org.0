Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D52F82825B8
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Oct 2020 19:59:18 +0200 (CEST)
Received: from localhost ([::1]:57190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOloT-0007Ea-Ut
	for lists+qemu-devel@lfdr.de; Sat, 03 Oct 2020 13:59:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kOln5-0005yn-UP
 for qemu-devel@nongnu.org; Sat, 03 Oct 2020 13:57:51 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:38436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kOln4-0005FC-Dx
 for qemu-devel@nongnu.org; Sat, 03 Oct 2020 13:57:51 -0400
Received: by mail-wr1-x442.google.com with SMTP id g4so5221651wrs.5
 for <qemu-devel@nongnu.org>; Sat, 03 Oct 2020 10:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RWV6+gN9jYZlM6AXdvbm/xnXmgrQZfrfVfePaY4W/kw=;
 b=t9x7zLV1yQ3awBv7bvP+yevUH0CVmiKUyVPmNq7Qf/oFH9cqiZ0ly6VddcGbGFGNd8
 5kdzbE2rec/6mHrV7E8qYeAxan55aEn84Xp6lLXopk9omgm5o7+COrrtChmiqxBOLebO
 /MN/yQHix9Bd1HBNDl0LseLixl7RepFhTlC8gMqwfvbdZZcGhBliqgx7wt4N7DdcOwCL
 vm6/V+c3YE32Q/AYMAvrZ20Wyo1JjsmfCC5644mMkr5TFM3vX8sO49WC9AICqG3RBXUL
 PgdhD66Pf9XtCA3NDjujH66JoHqvMcnveN6f8qtKBaHDFFTu8N4AVxkmHLTjtISNx4Gg
 T/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RWV6+gN9jYZlM6AXdvbm/xnXmgrQZfrfVfePaY4W/kw=;
 b=DnidqTZ+9b0ZokAwj/6STVb0aKYfQQNOD7J44/0UCUrT1m+tjZMnLjA3Tip7gfKE1g
 BTc9fR2rOKoeqbRObZ7oPQCn93sc3pUtKX714WZsnTbJsCQitILabt4vCsZEs36JivRL
 LML48hGwh8bJ72oJoRJE62fNdmfLKsowZbcXtPmY7p81sJEeTRJs6SLxYZjo1rc7eK1t
 WXdXveof17y4TGWi0VmOo7B/M7Z9CZaHrbKfLLPms6iRSjrdz49LPMOSKLgMeO5bVLut
 9sePvpSBo/XZ+18NQ5PiyKBgzxFaxNDjduXPGKX37CJPu3VCSe4fmmQJ0Fl4IEsS+yCg
 kVuQ==
X-Gm-Message-State: AOAM531m9RHdqjbfcK6NFnI7klZG45h26RCXXp/XXGSpLyhDxV5O4qLa
 f6uhpuABQRkOlYjxr5wrPzY=
X-Google-Smtp-Source: ABdhPJxsvmkidTtTDyssk/638+qF8d3OWprCrZcBbmyvW2QWISnmypCidDjkT6OWymL9WS4v0mZ46g==
X-Received: by 2002:a5d:4a48:: with SMTP id v8mr9066854wrs.304.1601747868997; 
 Sat, 03 Oct 2020 10:57:48 -0700 (PDT)
Received: from [192.168.1.36] (74.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.74])
 by smtp.gmail.com with ESMTPSA id o194sm6411504wme.24.2020.10.03.10.57.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Oct 2020 10:57:48 -0700 (PDT)
Subject: Re: [PATCH] tests: tcg: do not use implicit rules
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20201003085054.332992-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <50478739-bfa3-e381-07c7-8cbbf7daa7a0@amsat.org>
Date: Sat, 3 Oct 2020 19:57:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201003085054.332992-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.252,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/3/20 10:50 AM, Paolo Bonzini wrote:
> Use pattern rules to clarify which targets are going to match the
> rule and to provide clearer error messages.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  tests/Makefile.include | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 40d909badc..5aca98e60c 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -50,21 +50,21 @@ RUN_TCG_TARGET_RULES=$(patsubst %,run-tcg-tests-%, $(TARGET_DIRS))
>  $(foreach PROBE_TARGET,$(TARGET_DIRS), 				\
>  	$(eval -include $(SRC_PATH)/tests/tcg/Makefile.prereqs))
>  
> -build-tcg-tests-%: $(if $(CONFIG_PLUGIN),test-plugins)
> +$(BUILD_TCG_TARGET_RULES): build-tcg-tests-%: $(if $(CONFIG_PLUGIN),test-plugins)
>  	$(call quiet-command,$(MAKE) $(SUBDIR_MAKEFLAGS) \
>  		-f $(SRC_PATH)/tests/tcg/Makefile.qemu \
>  		SRC_PATH=$(SRC_PATH) \
>  	       	V="$(V)" TARGET="$*" guest-tests, \
>  		"BUILD", "TCG tests for $*")
>  
> -run-tcg-tests-%: build-tcg-tests-% all
> +$(RUN_TCG_TARGET_RULES): run-tcg-tests-%: build-tcg-tests-% all
>  	$(call quiet-command,$(MAKE) $(SUBDIR_MAKEFLAGS) \
>  		-f $(SRC_PATH)/tests/tcg/Makefile.qemu \
>  		SRC_PATH=$(SRC_PATH) SPEED="$(SPEED)" \
>  		V="$(V)" TARGET="$*" run-guest-tests, \
>  		"RUN", "TCG tests for $*")
>  
> -clean-tcg-tests-%:
> +$(CLEAN_TCG_TARGET_RULES): clean-tcg-tests-%:
>  	$(call quiet-command,$(MAKE) $(SUBDIR_MAKEFLAGS) \
>  		-f $(SRC_PATH)/tests/tcg/Makefile.qemu \
>  		SRC_PATH=$(SRC_PATH) TARGET="$*" clean-guest-tests, \
> 


