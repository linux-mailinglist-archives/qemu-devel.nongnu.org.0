Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3294050ECA8
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 01:33:43 +0200 (CEST)
Received: from localhost ([::1]:39902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj8D7-0003jW-U5
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 19:33:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nj8CF-0002rn-5A
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:32:47 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:36789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nj8CD-00072c-CT
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:32:46 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 gj17-20020a17090b109100b001d8b390f77bso725944pjb.1
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 16:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+6aEgtZbXepEnjqtd1A+o+0hQWUrQZyh1/bU4NO2HcA=;
 b=Vl25z4XGQlBp1DonfB0Q65gJ9sAfIRvvossZDh0WPrdUxkyNdwKaRHnxKiH6MIxo8q
 vkkzkSPC7moUm1HVCmlefUigIP77bwpd2E8JDjbyWGVrT9cTvHYEa47betMpdiO56I/n
 5vNDNZMgytB1tT9/j5r8mxsNeLdxQDDBNUTI5CAU09pH8wtOYiGO3Swnq8ErkT79VLZ0
 8sfzZo0xV9O/lnmQwkZcIIIIqLMWPdP1jST8UEbGQ5Oj3MvaCHg8/++Fsy4mwX513L4g
 U0Yrtmh7kI+OB5alUQUhHX6puO4f+zfGXvTHjcaz9pkfJ2pRXj5njiijhMZnmwrFt7bt
 OySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+6aEgtZbXepEnjqtd1A+o+0hQWUrQZyh1/bU4NO2HcA=;
 b=rq/I24ULD8oEaVHBDVJCAbgF8FRqY76vHm/38QBzozY9rwcjrZsw7r5S+A9XzuRJvT
 BS2zlYHBgNiVnr+fS+OvDE0rO/dkFVeh622vBcxJuyPXAw5klUtSGviycCpvtf3gaJXm
 lRxt8q5ZnVyPXE6bKdlNGfk6ITxfDX2d3mjcrbA65fT7cmZYgIWuDgZPboscLWrnHwEj
 mEmUuuI8kZkBHyeDnlhfTb9N2TS+irU+ws66GmrhUZlSsqAaIhCSNaREPtnmI3ioKxfV
 RUC7/zsZ2ghXJU8tliVrC33i/fSyQOJ7pk36eL9o4jc6776NZCP3UGpXV7cYSbVZpa9W
 nbrA==
X-Gm-Message-State: AOAM532YGEwNfXCtMjtzvgweKrO5CCuExwsfyCRq487P9ESCJ+tZmDfg
 gFfOY5LgElrPWmkcQTp1pBQW+g==
X-Google-Smtp-Source: ABdhPJy69WsMlrMahAKGg7PS12/5M66ppC1rfaPmEz2IN2JqViiWFo4lqofLo6FTevvCxfElAh4ARA==
X-Received: by 2002:a17:90b:1d0e:b0:1c9:b74e:494 with SMTP id
 on14-20020a17090b1d0e00b001c9b74e0494mr23416000pjb.238.1650929563683; 
 Mon, 25 Apr 2022 16:32:43 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a056a00245000b004f7728a4346sm13682547pfj.79.2022.04.25.16.32.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 16:32:43 -0700 (PDT)
Message-ID: <5b1bc292-fe14-107e-1b66-25b38d498e7d@linaro.org>
Date: Mon, 25 Apr 2022 16:32:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 00/14] Block patches
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20220425140821.957511-1-hreitz@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220425140821.957511-1-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/25/22 07:08, Hanna Reitz wrote:
> The following changes since commit 754f756cc4c6d9d14b7230c62b5bb20f9d655888:
> 
>    Merge tag 'pull-target-arm-20220422-1' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-04-22 08:03:18 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/hreitz/qemu.git tags/pull-block-2022-04-25
> 
> for you to fetch changes up to 348a0740afc5b313599533eb69bbb2b95d2f1bba:
> 
>    iotests/108: Fix when missing user_allow_other (2022-04-25 14:46:45 +0200)
> 
> ----------------------------------------------------------------
> Block patches:
> - New @force parameter for blockdev-change-medium
> - Improvements to the iotests to help with debugging
> - Fix iotest 108 on systems without user_allow_other in fuse.conf

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Denis V. Lunev (1):
>    block: add 'force' parameter to 'blockdev-change-medium' command
> 
> Hanna Reitz (1):
>    iotests/108: Fix when missing user_allow_other
> 
> John Snow (12):
>    iotests: replace calls to log(qemu_io(...)) with qemu_io_log()
>    iotests/163: Fix broken qemu-io invocation
>    iotests: Don't check qemu_io() output for specific error strings
>    iotests/040: Don't check image pattern on zero-length image
>    iotests/040: Fix TestCommitWithFilters test
>    iotests: create generic qemu_tool() function
>    iotests: rebase qemu_io() on top of qemu_tool()
>    iotests/migration-permissions: use assertRaises() for qemu_io()
>      negative test
>    iotests/image-fleecing: switch to qemu_io()
>    iotests: remove qemu_io_pipe_and_status()
>    iotests: remove qemu_io_silent() and qemu_io_silent_check().
>    iotests: make qemu_io_log() check return codes by default
> 
>   qapi/block.json                               |  6 ++
>   block/qapi-sysemu.c                           |  3 +-
>   monitor/hmp-cmds.c                            |  4 +-
>   hmp-commands.hx                               | 11 ++-
>   tests/qemu-iotests/030                        | 85 +++++++++++--------
>   tests/qemu-iotests/040                        | 53 +++++++-----
>   tests/qemu-iotests/056                        |  2 +-
>   tests/qemu-iotests/108                        |  2 +-
>   tests/qemu-iotests/149                        |  6 +-
>   tests/qemu-iotests/163                        |  5 +-
>   tests/qemu-iotests/205                        |  4 +-
>   tests/qemu-iotests/216                        | 12 +--
>   tests/qemu-iotests/218                        |  5 +-
>   tests/qemu-iotests/224                        |  4 +-
>   tests/qemu-iotests/242                        |  6 +-
>   tests/qemu-iotests/245                        | 17 ++--
>   tests/qemu-iotests/255                        |  4 +-
>   tests/qemu-iotests/258                        | 11 ++-
>   tests/qemu-iotests/298                        | 17 ++--
>   tests/qemu-iotests/303                        |  4 +-
>   tests/qemu-iotests/310                        | 22 ++---
>   tests/qemu-iotests/iotests.py                 | 69 ++++++++-------
>   tests/qemu-iotests/tests/image-fleecing       | 30 ++++---
>   .../qemu-iotests/tests/migration-permissions  | 28 +++---
>   .../tests/mirror-ready-cancel-error           |  2 +-
>   .../qemu-iotests/tests/nbd-reconnect-on-open  |  2 +-
>   .../qemu-iotests/tests/stream-error-on-reset  |  4 +-
>   ui/cocoa.m                                    |  1 +
>   28 files changed, 231 insertions(+), 188 deletions(-)
> 


