Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A48BD315570
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 18:56:35 +0100 (CET)
Received: from localhost ([::1]:48752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9XFa-0000V9-8Z
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 12:56:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9XDf-0007fG-Ke
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 12:54:35 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:54925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9XDc-0005nG-MY
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 12:54:35 -0500
Received: by mail-pj1-x1035.google.com with SMTP id gb24so1994595pjb.4
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 09:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mHXATDP/bEwCEsHOGumYcFFMET6+KXxcSYsI24iX2nw=;
 b=pxyAKsJHb1rJsyJugEiOqN+NDn3t3AbyAstae2Wxd3oB6yqMmEAE65agXvr79zbna2
 sc7zaZcHdC4OUGCIPFd+DAivuJ6FLk/BSCtX0ZgG+9OrEJ/68FkbCoPbyc6C1AhBbHBk
 l8oImI8+/tVhike9xsQyJzJVMxQR9kAZQYx+EPbuy+TLlGI1VjiZVoAum17MafRoadp9
 J6UvN2OShusr4K+HK4WMShFcnTSk51lXrTmEEJyXmUJ+YwB2Cj3iKI4xyU/QUDR7e7yc
 YGZitWbqNcfPax2ORGRat50Yg2wlBmOg2WfPVrpdJAkPl8Cka1FxoQH3p5XMICdH1fio
 Oj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mHXATDP/bEwCEsHOGumYcFFMET6+KXxcSYsI24iX2nw=;
 b=LXRzNb1Z0AcSUiVgHwq3XaGlV+eb5fCyYYXJbI9L30VUoOgork096dQMRvpNySvmd/
 U4PQRPNHx1VXO00xYWUprhbxJza/81BsTTuwb1gMNp/40SC+BTZDIzZAPCn9A+2ySXjB
 dkHWUCcM+Cw4ba1Ygzf8mWUfcHmMBawWhaXqWdaLnkpiKIx00o2L67IaUW2szhOURqYo
 ugSD8nd9Qcf0bzehx+ZCpb4D8RpTrEw2nmTCKsFTORpMhI8nNcZnklF0OYZ+6tZUjZD7
 JJGjbyZMlUycfl7YET+lC9Ul8s02yuMNYUsSrwwxfFrD6jnKu28czchu0JPV6B1du5aa
 Gsqg==
X-Gm-Message-State: AOAM533x0xlFzqZQfaOe23NM10BFH91pSlf3zwruO1LTTArG/5DrGjcE
 vdvI/Ta56LWB0TY/MJG1gJ1k5w==
X-Google-Smtp-Source: ABdhPJy7IH6+Qei+KN/RR6/NZdUE4ASC9GlroouzoHLfFFOb8ngeaG5NNeW9U1+ggAuXSjDeJa34mQ==
X-Received: by 2002:a17:903:4095:b029:e2:fb7d:8b13 with SMTP id
 z21-20020a1709034095b02900e2fb7d8b13mr2120724plc.68.1612893268838; 
 Tue, 09 Feb 2021 09:54:28 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 g6sm2032393pfi.15.2021.02.09.09.54.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Feb 2021 09:54:28 -0800 (PST)
Subject: Re: [PATCH] meson: adjust timeouts for some slower tests
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210209174541.150011-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9825c4c6-ae01-57ee-6616-86eba1d3b04d@linaro.org>
Date: Tue, 9 Feb 2021 09:54:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210209174541.150011-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
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
Cc: berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/21 9:45 AM, Paolo Bonzini wrote:
> Adjust the timeouts for the longest running tests.  These are the
> times that I measured and the corresponding timeouts.  For generic
> qtests, the target that reported the longest runtime is included.
> 
> unit tests:
>     test-crypto-tlscredsx509        13.15s   60s
>     test-crypto-tlssession          14.12s   60s
> 
> qtests:
>     ide-test                        13.65s   60s
>     npcm7xx_watchdog_timer-test     15.02s   60s
>     qos-test                        21.26s   60s   (i386)
>     ahci-test                       22.18s   60s
>     pxe-test                        26.51s   90s
>     boot-serial-test                28.02s   90s   (sparc)
>     prom-env-test                   28.86s   90s
>     bios-tables-test                50.17s   90s   (aarch64)
>     test-hmp                        57.15s   90s   (aarch64)
>     npcm7xx_pwm-test                71.27s   120s
>     migration-test                  97.09s   150s  (aarch64)
>     qom-test                        139.20s  180s  (aarch64)
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  tests/meson.build       |  6 ++++++
>  tests/qtest/meson.build | 15 +++++++++++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/tests/meson.build b/tests/meson.build
> index 0c939f89f7..fde21b6c8f 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -237,6 +237,11 @@ test_env = environment()
>  test_env.set('G_TEST_SRCDIR', meson.current_source_dir())
>  test_env.set('G_TEST_BUILDDIR', meson.current_build_dir())
>  
> +slow_tests = {
> +  'test-crypto-tlscredsx509': 2,
> +  'test-crypto-tlssession': 2
> +}
> +
>  foreach test_name, extra: tests
>    src = [test_name + '.c']
>    deps = [qemuutil]
> @@ -254,6 +259,7 @@ foreach test_name, extra: tests
>         env: test_env,
>         args: ['--tap', '-k'],
>         protocol: 'tap',
> +       timeout: 30 * slow_tests.get(test_name, 1),
>         suite: ['unit'])
>  endforeach
>  
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 7e082be6fb..b1f8790b75 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -4,6 +4,20 @@ if not config_host.has_key('CONFIG_POSIX')
>    subdir_done()
>  endif
>  
> +slow_qtests = {
> +  'ahci-test' : 2,
> +  'bios-tables-test' : 3,
> +  'boot-serial-test' : 3,
> +  'ide-test' : 2,
> +  'migration-test' : 5,
> +  'npcm7xx_pwm-test': 4,
> +  'npcm7xx_watchdog_timer-test': 2,
> +  'prom-env-test' : 3,
> +  'pxe-test' : 3,
> +  'qos-test : 2,
> +  'qom-test' : 6,
> +  'test-hmp' : 3,
> +]

Mismatched brace?

>  qtests_generic = [
>    'cdrom-test',
>    'device-introspect-test',
> @@ -272,6 +286,7 @@ foreach dir : target_dirs
>           env: qtest_env,
>           args: ['--tap', '-k'],
>           protocol: 'tap',
> +         timeout: 30 * slow_qtests.get(test_name, 1),

Why scale here, rather than putting the real time in the dict?  Is there some
other scaling going on that I can't see?


r~

>           suite: ['qtest', 'qtest-' + target_base])
>    endforeach
>  endforeach
> 


