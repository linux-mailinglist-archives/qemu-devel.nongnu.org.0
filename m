Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C265553736F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 03:59:26 +0200 (CEST)
Received: from localhost ([::1]:51422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvUgn-0007J9-Bb
	for lists+qemu-devel@lfdr.de; Sun, 29 May 2022 21:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nvUfY-0006d7-HT
 for qemu-devel@nongnu.org; Sun, 29 May 2022 21:58:08 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:38509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nvUfW-0001LW-Nb
 for qemu-devel@nongnu.org; Sun, 29 May 2022 21:58:08 -0400
Received: by mail-pg1-x532.google.com with SMTP id 137so8901359pgb.5
 for <qemu-devel@nongnu.org>; Sun, 29 May 2022 18:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NONVSfxb0qgNuDVPOylR/5fm5N15+lTnSdBbMZIEWC8=;
 b=PDHNXoth2c9wGHeNLyjLXL4S9ocPj2SURAiC+Gl8f3G66/VD8pKbjHFIMmt/lEoY+C
 7a3IZiZLGOf2CY7keSXM5tnkWDt+spPihdFbvYimCOtbTRIx9DHMzuSdZYB+Lx0+DMuX
 +m+RJiDX3E3iF4jCsp/MRICuc1OFzvhTykpIm2GIsu3Sr7U/TOFqKepOaz9HlthoJVuz
 bXKTRC1IJ1wTaoKVllZTsRjDpWbMUoPorABSRd4wbr2qeoTMxZMiyN0fkn2JGPgjEE5K
 9Puq8dsPa6CcO7ETlqNln6D8oGq20hJmNAp2TKBwPsdgX4II7j2Ft6Sze1TjYnZWgTuK
 QSDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NONVSfxb0qgNuDVPOylR/5fm5N15+lTnSdBbMZIEWC8=;
 b=o1Fd0zPPn15ZgA8YVz6SlxkjhUY5S1+B+w3t3wMV6e8Vfq8NYBUx2V6FRhr4izdaCq
 mbZbHXSvk4ctCNxvbyxyzl6dE0HU/gcm432TtW0+1TUClWJFlYqPWreMbnwxO12J9N3E
 Ny5JQSAEN6n6txu/w0LuOqPnJ1hKTaUzLvi2qdRYo7OjoQjt8jeV8F3Tmkae9+GhIFbU
 8edn2hUaJaNQod6majcE4hfP9uXdmfikXiJuhmuS13fW2xA4GdNO70tw77k0u86jsURs
 Hwu6Jrt+Og2LsYRerA4naMNPRxP8W4aPeZt0SfAkNSA0ATZe2J37fvvEEe8vucLfdNS1
 L0Ig==
X-Gm-Message-State: AOAM532fsaMHeSZPgQbAdAlFfz8CjtvRyTDq4ZFYAMXUDg1/Cf9ZS4qD
 +Zw9Rm9MIk28gvIMSOuHVpZ15w==
X-Google-Smtp-Source: ABdhPJx6Kr0Enb/vr6vx6ARrHud0Ex7r5tXPdeMJFN51uG8PgN92D8NJuEzwtLFN0OHIWbXtKjmYGw==
X-Received: by 2002:a63:184d:0:b0:3fb:74ce:effa with SMTP id
 13-20020a63184d000000b003fb74ceeffamr14666620pgy.621.1653875884305; 
 Sun, 29 May 2022 18:58:04 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:6923:e77f:e88f:1dd3?
 ([2602:ae:1547:e101:6923:e77f:e88f:1dd3])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a170902f34d00b00163d6249a62sm1512344ple.196.2022.05.29.18.58.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 May 2022 18:58:03 -0700 (PDT)
Message-ID: <3fb4b54c-04d6-da23-f914-0516343f8e7d@linaro.org>
Date: Sun, 29 May 2022 18:58:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL v2 00/15] Misc patches
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>
References: <20220529225137.232359-1-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220529225137.232359-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/29/22 15:51, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The following changes since commit 2417cbd5916d043e0c56408221fbe9935d0bc8da:
> 
>    Merge tag 'ak-pull-request' of https://gitlab.com/berrange/qemu into staging (2022-05-26 07:00:04 -0700)
> 
> are available in the Git repository at:
> 
>    git@gitlab.com:marcandre.lureau/qemu.git tags/misc-pull-request
> 
> for you to fetch changes up to bb6960a11ae9c9d727bab45c22cb4a9eb12cde55:
> 
>    test/qga: use g_auto wherever sensible (2022-05-28 11:42:56 +0200)
> 
> ----------------------------------------------------------------
> Misc cleanups
> 
> Mostly qemu-ga related cleanups.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> 
> Marc-André Lureau (15):
>    include: move qemu_*_exec_dir() to cutils
>    util/win32: simplify qemu_get_local_state_dir()
>    tests: make libqmp buildable for win32
>    qga: flatten safe_open_or_create()
>    qga: add qga_open_cloexec() helper
>    qga: use qga_open_cloexec() for safe_open_or_create()
>    qga: throw an Error in ga_channel_open()
>    qga: replace qemu_open_old() with qga_open_cloexec()
>    qga: make build_fs_mount_list() return a bool
>    test/qga: use G_TEST_DIR to locate os-release test file
>    qga/wixl: prefer variables over environment
>    qga/wixl: require Mingw_bin
>    qga/wixl: simplify some pre-processing
>    qga/wixl: replace QEMU_GA_MSI_MINGW_BIN_PATH with glib bindir
>    test/qga: use g_auto wherever sensible
> 
>   configure                            |   9 +-
>   meson.build                          |   5 +-
>   include/qemu/cutils.h                |   7 ++
>   include/qemu/osdep.h                 |   8 --
>   qga/cutils.h                         |   8 ++
>   tests/qtest/libqmp.h                 |   2 +
>   qemu-io.c                            |   1 +
>   qga/channel-posix.c                  |  55 +++++-----
>   qga/commands-posix.c                 | 154 +++++++++++++--------------
>   qga/cutils.c                         |  33 ++++++
>   storage-daemon/qemu-storage-daemon.c |   1 +
>   tests/qtest/fuzz/fuzz.c              |   1 +
>   tests/qtest/libqmp.c                 |  34 +++++-
>   tests/unit/test-qga.c                | 130 ++++++++--------------
>   util/cutils.c                        | 117 ++++++++++++++++++++
>   util/oslib-posix.c                   |  86 +--------------
>   util/oslib-win32.c                   |  53 +--------
>   qga/installer/qemu-ga.wxs            |  83 +++++----------
>   qga/meson.build                      |  12 +--
>   19 files changed, 396 insertions(+), 403 deletions(-)
>   create mode 100644 qga/cutils.h
>   create mode 100644 qga/cutils.c
> 


