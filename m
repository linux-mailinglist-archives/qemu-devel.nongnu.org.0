Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F04BD6A6C19
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 13:07:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXLDR-0001m6-Bz; Wed, 01 Mar 2023 07:05:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pXLDO-0001YI-NJ
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 07:05:46 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pXLDM-00033J-HP
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 07:05:46 -0500
Received: by mail-pf1-x435.google.com with SMTP id c10so7107153pfv.13
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 04:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112; t=1677672334;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5J/yNGZRvjXwHW4/9FZYKqcz5O7lufUkx5Xp5krASEk=;
 b=vjO6zwOsVtoA7GHDuhQDLupg7TCmug9AxORSYgXCKViZj46A5Uu/GxHVXvKhYCCvsx
 ChDmsb9JT3otRyoN83PUnsoMp4CMQNgfKCM2jWkStUnf1yvNN1n9r5UbJSPOgYHKHvN/
 ZQ9KvrzvaiYKWPZ8rYpqGG4XOPCafpC73IdMyZWLoGiBcJhzGVnah7YzwfJGLKBXp7Ms
 wzdPjWRPKVMMJ3Y3lFvj6rrsV9aHQdZzelfyTmBl7xvfVJdq6HL2+pfrh5tnfl3wNtPN
 1yMmvr5ueqDjtDVsUE3tgGtegfsgD8CBfvexb9Uwg7zDEqWO1VekWijqCD5DN63ctFwR
 QSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677672334;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5J/yNGZRvjXwHW4/9FZYKqcz5O7lufUkx5Xp5krASEk=;
 b=5lodnOztzVe5DReAICJ5NF+FdMyQuURHyHm5RXCC7QYzZtt2/HW5iEgSID2jhtTc7H
 yyWyl4qaRlx1xrQzuZvrksLV9tDTdHRQ67ieDSElSbqcleO/YcKkFikbs7sZbuefbElt
 bZCVHxHNYyIVW+ocvPKuutXAP+iLOw4pLSgbKJFVWwzaixIE4AFOF6kCEZNGJqfmXx6/
 Umg73geJGJ9xL9BYHSVsj0s9Y2XN9x1PLJaU/UGanURLnsRYxV86heYOs23SOWibbQqa
 2O5VDpiXIZDCdFsVuiz1kmM30y1tTAeyuY0WBp8T+DRQo0UtaIc3jVA9p4kUu/jR4L19
 9Oxw==
X-Gm-Message-State: AO0yUKVy2s9H/g2Q4VQKXAzgXGAqvW1O8bHfZyNJ18bUktQ62sTCxTee
 cP8/gZDuOcjPpw013qiTKT9nDg==
X-Google-Smtp-Source: AK7set9FHUuUGQt5BC0aYF/1pfvZg4zZjrTT2Y/HAZ+mFkD80GFKd5pbmB2zyT4E41igHqEXCQEfGg==
X-Received: by 2002:aa7:9e8f:0:b0:5e6:14a9:b0c8 with SMTP id
 p15-20020aa79e8f000000b005e614a9b0c8mr4800430pfq.32.1677672333652; 
 Wed, 01 Mar 2023 04:05:33 -0800 (PST)
Received: from localhost ([169.150.203.33]) by smtp.gmail.com with ESMTPSA id
 v19-20020aa78093000000b0058d54960eccsm7725536pff.151.2023.03.01.04.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 04:05:33 -0800 (PST)
Date: Wed, 1 Mar 2023 07:05:28 -0500
From: Emilio Cota <cota@braap.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org,
 aaron@os.amperecomputing.com, frederic.petrot@univ-grenoble-alpes.fr
Subject: Re: [PATCH 1/2] tcg: Clear plugin_mem_cbs on TB exit
Message-ID: <Y/8/iCIOVdAwcgW0@cota-l14>
References: <20230301024737.1210851-1-richard.henderson@linaro.org>
 <20230301024737.1210851-2-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230301024737.1210851-2-richard.henderson@linaro.org>
Received-SPF: softfail client-ip=2607:f8b0:4864:20::435;
 envelope-from=cota@braap.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

As I mentioned in the patch that is being superseded here
I like this approach -- it is simpler and generates less
code.

I'd also like to see the plugin_gen_disable_mem_helpers
function go away, and a mention somewhere that now we are
intentionally not clearing cpu->plugin_mem_cbs until TB exit
(before we weren't doing that either, but that was unintentional
due to a bug).  So, for instance when doing a goto_tb from a
TB with helpers, we leave plugin_mem_cbs set. This is not a
problem in practice because if subsequent TB's use helpers,
they will overwrite the pointer.

Some more comments below.

On Tue, Feb 28, 2023 at 16:47:36 -1000, Richard Henderson wrote:
> Do this in cpu_tb_exec (normal exit) and cpu_loop_exit (exception),
> adjacent to where we reset can_do_io.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1381
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/cpu-exec-common.c | 4 ++++
>  accel/tcg/cpu-exec.c        | 5 +++--
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
> index c7bc8c6efa..e136b0843c 100644
> --- a/accel/tcg/cpu-exec-common.c
> +++ b/accel/tcg/cpu-exec-common.c
> @@ -65,6 +65,10 @@ void cpu_loop_exit(CPUState *cpu)
>  {
>      /* Undo the setting in cpu_tb_exec.  */
>      cpu->can_do_io = 1;
> +#ifdef CONFIG_PLUGIN
> +    /* Undo any setting in generated code. */
> +    cpu->plugin_mem_cbs = NULL;
> +#endif
>      siglongjmp(cpu->jmp_env, 1);
>  }
>  
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 56aaf58b9d..2831fcafee 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -459,6 +459,9 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
>      qemu_thread_jit_execute();
>      ret = tcg_qemu_tb_exec(env, tb_ptr);
>      cpu->can_do_io = 1;
> +#ifdef CONFIG_PLUGIN
> +    cpu->plugin_mem_cbs = NULL;
> +#endif

We should use qemu_plugin_disable_mem_helpers, which avoids the
ifdef.

Also note that there are existing calls to that function that
should now go away because they happen after the clearings here.

Thanks,

		Emilio

