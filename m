Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B1942E1F3
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 21:17:22 +0200 (CEST)
Received: from localhost ([::1]:60858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb6ED-0005vn-G7
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 15:17:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mb6Cn-0004zX-NV
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 15:15:53 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:55103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mb6Cl-0000yQ-Nv
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 15:15:53 -0400
Received: by mail-pj1-x102d.google.com with SMTP id np13so5465663pjb.4
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 12:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=H4wUpgiveg78s47pPwU++oe8xyqx0YxvkDthzTT9fJI=;
 b=BjCEfwKejruSJ2H4LWunpG+d+LALxO81C5E5fswCpFT7aM6Pqz2gHhuS6jQt/dBdBG
 q4yLJVcUv3q/z64MeVj5k1fGhlhqL4n7hQT7O+6/o4KCUirCjfcD3R5NLpzrUaWl7FAK
 DpgK/xTRHNzmx3LjZXmBHiXrH5/YoHTka+ExoLt3pYF1SXydYppHSpyEmh0C5eKzxn97
 Zyb5b/Etcgyr/7haE1WZX841f6n6SICx6NzThxmZy6GIur2mbGEn6aUbjp4v6zL9LhAQ
 73O4f3ynzoZLoWKxydnRJj39oCK7OC61KTm78My4OSFaxRqNQdUPKemiQAzms0AoTZgK
 awBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H4wUpgiveg78s47pPwU++oe8xyqx0YxvkDthzTT9fJI=;
 b=MaWweaWBKODFiELHw8kSFv1hKe7f694o5OY+KedOxTdWgCl0IneN3BDiJbLY4JflD0
 0Fe39BvYe4/S9Hj4u4SxEHzyX02WPxUBr1oasCEkzHdl08Z7bYSXnZb7hVB6G6oD8HqA
 w7WNelxsudHXq78GKUYnzL8iGq+KCnCHOiVo4Lch7eNUTQJLXsNNPOdbkx8cRt/SA6Bm
 nanqVXlukQlB3eJu5om8RQQHsIRWlc9rmr7OBBf8npvEMvB0BOuAF/aiv19pwJ4+5Ofk
 08mUnNLCnndto0ePdp9uTmg13qU56SCz7HdG3hQq4mYZA5SSzcww9Sv2geUju7oVVtDx
 +OlQ==
X-Gm-Message-State: AOAM531oh73zHqhQk1um5EyCMQLAWSxxA24svvRT6c6kBMuXBcjjRNoM
 sTD4ehByZ6wHpt7R2+HT530ekklqqgQ=
X-Google-Smtp-Source: ABdhPJzRC4fdQk/Fetzxevx1Nyd9/ndt6G7u96Prm3SSXr6ZJdWOSv8Hi0LURFML6ZujspKaClMVYA==
X-Received: by 2002:a17:902:b193:b029:11a:a179:453a with SMTP id
 s19-20020a170902b193b029011aa179453amr6590337plr.69.1634238949469; 
 Thu, 14 Oct 2021 12:15:49 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 11sm3055701pfl.41.2021.10.14.12.15.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 12:15:49 -0700 (PDT)
Subject: Re: [PULL 00/26] Meson changes for 2021-10-14
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211014162938.430211-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b58388e8-bd97-8fb1-be83-11447c05a43f@linaro.org>
Date: Thu, 14 Oct 2021 12:15:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211014162938.430211-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/14/21 9:29 AM, Paolo Bonzini wrote:
> The following changes since commit e5b2333f24ff207f08cf96e73d2e11438c985801:
> 
>    Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20211013' into staging (2021-10-13 11:43:29 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
> 
> for you to fetch changes up to 3b4da13293482134b81d71be656ec76beff73a76:
> 
>    configure: automatically parse command line for meson -D options (2021-10-14 09:51:06 +0200)
> 
> ----------------------------------------------------------------
> * Meson conversions + introspection-based command line parser
> 
> ----------------------------------------------------------------
> Marc-André Lureau (1):
>        configure, meson: move Spice configure handling to meson
> 
> Paolo Bonzini (25):
>        configure: remove --oss-lib
>        audio: remove CONFIG_AUDIO_WIN_INT
>        configure, meson: move audio driver detection to Meson
>        meson: define symbols for all available audio drivers
>        configure: add command line options for audio drivers
>        kconfig: split CONFIG_SPARSE_MEM from fuzzing
>        configure, meson: move fuzzing configuration to Meson
>        trace: simple: pass trace_file unmodified to config-host.h
>        trace: move configuration from configure to Meson
>        configure, meson: move CONFIG_HOST_DSOSUF to Meson
>        configure, meson: get HOST_WORDS_BIGENDIAN via the machine object
>        configure, meson: remove CONFIG_GCOV from config-host.mak
>        meson: HAVE_GDB_BIN is not used by C code
>        configure, meson: move remaining HAVE_* compiler tests to Meson
>        configure, meson: move pthread_setname_np checks to Meson
>        configure, meson: move libaio check to meson.build
>        configure, meson: move vde detection to meson
>        configure, meson: move netmap detection to meson
>        configure: remove obsolete Solaris ar check
>        configure, meson: move more compiler checks to Meson
>        configure: remove deprecated --{enable, disable}-git-update
>        configure: accept "internal" for --enable-capstone/slirp/fdt
>        configure: prepare for auto-generated option parsing
>        meson-buildoptions: include list of tracing backends
>        configure: automatically parse command line for meson -D options
> 
>   Kconfig.host                  |    4 +
>   Makefile                      |    8 +-
>   audio/meson.build             |   23 +-
>   block/meson.build             |    2 +-
>   chardev/meson.build           |    2 +-
>   configure                     | 1271 ++---------------------------------------
>   docs/devel/build-system.rst   |  132 ++---
>   docs/meson.build              |    2 +-
>   hw/mem/Kconfig                |    3 +
>   hw/mem/meson.build            |    2 +-
>   meson.build                   |  421 ++++++++++++--
>   meson_options.txt             |   46 +-
>   net/meson.build               |    6 +-
>   scripts/meson-buildoptions.py |  172 ++++++
>   scripts/meson-buildoptions.sh |  270 +++++++++
>   scripts/meson.build           |    2 +-
>   stubs/meson.build             |    4 +-
>   tests/qtest/fuzz/meson.build  |    6 +-
>   trace/meson.build             |   15 +-
>   trace/simple.c                |    2 +-
>   ui/meson.build                |    4 +-
>   util/meson.build              |    4 +-
>   util/qemu-thread-posix.c      |    5 +-
>   23 files changed, 1041 insertions(+), 1365 deletions(-)
>   create mode 100755 scripts/meson-buildoptions.py
>   create mode 100644 scripts/meson-buildoptions.sh

Applied, thanks.

r~


