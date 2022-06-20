Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5488A550DCA
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 02:21:44 +0200 (CEST)
Received: from localhost ([::1]:45228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o35Ak-0003zh-HF
	for lists+qemu-devel@lfdr.de; Sun, 19 Jun 2022 20:21:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o359Q-0003Fk-VJ
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 20:20:21 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:34580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o359P-000074-7Y
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 20:20:20 -0400
Received: by mail-pg1-x529.google.com with SMTP id g186so8843868pgc.1
 for <qemu-devel@nongnu.org>; Sun, 19 Jun 2022 17:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wiRkuwltAVMnG11qz+1SbROts/5H3OBEEroJyTKg5xQ=;
 b=g4RLtT/VhU0eiERBv2hAlu8fKhXuMvkGjTlJzDsvdfwDnl/Sij+Gu/TUpg/UNMvmLS
 AD8ankXrV1i59wnBMmYDDJVWG2yAR0uNRMxcf05Buf71+9Xa7Wf6pZxD6laWOtrKgKkX
 Xx86U6Ko8jljVJgW6brYsb7jNlH0u3SEo2yRoIXV1LDZP3JTj8u7RvFhDoPZb4CJL3vS
 v1lKpbVzI1E3j9pMezevFUaNBE6U8NT/CwN89EbjRjDP8DwRHcj2U64pne5c6vuUgH04
 nOgnZJzzs+PoKPCyEUd+tm6PCtSmz3jfwMf4456bJ/ugSR5y9lXZq7ACAPVVX9mdiLlN
 NWSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wiRkuwltAVMnG11qz+1SbROts/5H3OBEEroJyTKg5xQ=;
 b=os8xtYzBuSL/8VuRUMGxL+EGj0/h/IwBuM2VIYt1aXelFJBcxZwYcegDib09FsFxST
 wIZ4GVW1myXp3nhgxdciEtjzN7cDuYSOPquuwws/x2lzyJouPuDkpUzEWDHzKqghGeog
 V+E6K3S8/GphnRZItmzyLgkMlECrVNnhUOO2BTrwYSxmZ3ojeR0/6fw8xMOlnQQOGX9/
 33tebLm8hEfEBzpR1PDdFqxniwRL9jN2x0ymuCQnGrMOcXPHWV6t/2dLHd7f+68gqA7T
 eevm0oRBqNh4upXsKzwoX/WoFmfSvXLS6wovrHPuznPc0RRm92yqvSJSze0r585Vx6Qy
 0DtQ==
X-Gm-Message-State: AJIora+KYcDwJVg4a/iu1JP2VPK9Ecq5ZTPU+nK26LGjIMle0GZbeCjS
 lYuHv6f88qjh0l7xZEMt3s6I2A==
X-Google-Smtp-Source: AGRyM1sMFKeZsmI/DgLb7Ojcy1CzO+IaAw52FwBZf4RoIVk7P/Ulv8oW4y4zk3uQ5eKxkbJ1xm6dNw==
X-Received: by 2002:a63:dd56:0:b0:405:34ac:9bc9 with SMTP id
 g22-20020a63dd56000000b0040534ac9bc9mr19435504pgj.324.1655684417011; 
 Sun, 19 Jun 2022 17:20:17 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:7550:11ea:e955:446b?
 ([2602:47:d49e:3c01:7550:11ea:e955:446b])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a170902f7d300b0016a1fdb5efasm1348423plw.86.2022.06.19.17.20.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Jun 2022 17:20:16 -0700 (PDT)
Message-ID: <cb794b80-4254-f944-a278-579e438776f6@linaro.org>
Date: Sun, 19 Jun 2022 17:20:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/11] Bsd user syscall 2022q2 patches
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, jrtc27@FreeBSD.org, arrowd@freebsd.org,
 def@FreeBSD.org
References: <20220619180531.9161-1-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220619180531.9161-1-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

On 6/19/22 11:05, Warner Losh wrote:
> The following changes since commit dcb40541ebca7ec98a14d461593b3cd7282b4fac:
> 
>    Merge tag 'mips-20220611' of https://github.com/philmd/qemu into staging (2022-06-11 21:13:27 -0700)
> 
> are available in the Git repository at:
> 
>    ssh://git@github.com/qemu-bsd-user/qemu-bsd-user.git tags/bsd-user-syscall-2022q2-pull-request
> 
> for you to fetch changes up to d35020ed00b1cb649ccd73ba4f5e918a5cc5363a:
> 
>    bsd-user: Implement acct and sync (2022-06-14 08:17:44 -0600)
> 
> ----------------------------------------------------------------
> bsd-user: Next round of syscalls
> 
> Implement the next round of system calls. These are open, openat, close,
> fdatasync, fsync, close_from, revoke, access, eacccess, facccessat, chdir,
> fchdir, rename, renameat, mkdir, mkdirat, rmdir, _getcwd, dup, dup2, truncate,
> ftruncate, acct and sync. In addition, the helper functions needed for these to
> work are included. With the helper functions, all of these system calls are the
> 'obvious' wrapper...

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> 
> Warner Losh (11):
>    bsd-user: Implement open, openat and close
>    bsd-user: Implement fdatasync, fsync and close_from
>    bsd-user: Implement revoke, access, eaccess and faccessat
>    bsd-user: Implement chdir and fchdir
>    bsd-user: Implement rename and renameat
>    bsd-user: Implement link, linkat, unlink and unlinkat
>    bsd-user: Implement mkdir and mkdirat
>    bsd-user: Implement rmdir and undocumented __getcwd
>    bsd-user: Implement dup and dup2
>    bsd-user: Implement trunctate and ftruncate
>    bsd-user: Implement acct and sync
> 
>   bsd-user/bsd-file.h           | 359 ++++++++++++++++++++++++++++++++++
>   bsd-user/freebsd/os-syscall.c | 116 +++++++++++
>   bsd-user/syscall_defs.h       |   4 +
>   3 files changed, 479 insertions(+)
> 


