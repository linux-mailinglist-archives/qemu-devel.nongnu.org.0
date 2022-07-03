Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE353564389
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 02:59:48 +0200 (CEST)
Received: from localhost ([::1]:42108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7nxj-0004tC-FG
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 20:59:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7nwH-0004Cl-LI
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:58:17 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:43638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7nwF-0004iQ-78
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:58:17 -0400
Received: by mail-pg1-x529.google.com with SMTP id 68so5763869pgb.10
 for <qemu-devel@nongnu.org>; Sat, 02 Jul 2022 17:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=GMjoLep2XX7AkkyVJTL9pXBHr3Z6E+Ms/uuj/99fHNI=;
 b=AYlSBYIugutZ5ZGxQMVS5nZ5A+dMt1jCn8mJUE0sl7/UgJXEWaan63Y7POHE2NZjIU
 7lcYQXUeyLaDODdPpkstEEZ/lPDFJNCbBYMduVWOvXzxYQm34xvQnoGEEMjMKpBuJB3P
 U3zVVL1CEbMtaBHx1NrLIrG4ouQWkSZG1aE5JjpuhSz3slhxUhOwyHEDDIGzFkjXYzpi
 mzRbJx5VPG/44w6oVD1LgmQFgHrEoKhdGM0es1ZAzh1c87H5PIgV+r+pbgRgyP8pi76I
 +KM8UFxlIIJo0zPEVFYVy2fxRVFQI2AhnSwcBtkRKk3tCiY9nBQKcBDWCbmiJDSCrtYb
 L0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GMjoLep2XX7AkkyVJTL9pXBHr3Z6E+Ms/uuj/99fHNI=;
 b=W4BSKaTE699lDHeXSQhCCM6pHW0uaPxfEAaMj0BDkT7bQ/VAHc7swg7Ebbk1R1G83V
 5ROfUDw3qLwd3vwSCClH/NYI9fNSxTPi00iCWXjE4OrNjlWZndKk5gpkexfSZenoceWF
 S63qnzKgIXXOiX/d90M2yqIMtrtmai+gRuwktHoN9nooNYyCef4xgNBlvm48a5tLXquZ
 ScQ5oJjgoykzk2X4TN5y4u6PTWod3az8RaIt9L8QM16H51E/DfMuMcfx/HALNrv/sYP5
 oj/eIF/VFsEMbvfBToI36idwicSRCobvA2N5PC+758uS8CM1MsLdfq8E/63m5QoV3URd
 I1ZA==
X-Gm-Message-State: AJIora9fnU6qY2UGZAXWCt/ZnwcZ0b0UrnUI07qnvMbwmwI5jNmCurTd
 D3e409DzxgIeBTJcWt712r2T9g==
X-Google-Smtp-Source: AGRyM1ui23FrKTMuBhXENbAweP1esRkLI4E5y8FXFd0Cv7zorOmyxOkxNmKtIuhrjf4IBAUJfQNx7A==
X-Received: by 2002:a63:c056:0:b0:411:b3d3:ae4c with SMTP id
 z22-20020a63c056000000b00411b3d3ae4cmr12562296pgi.102.1656809893446; 
 Sat, 02 Jul 2022 17:58:13 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a056a000a8400b0050dc7628158sm18213495pfl.50.2022.07.02.17.58.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jul 2022 17:58:12 -0700 (PDT)
Message-ID: <39220c4c-ed77-3512-877b-6e37cb9bc0a7@linaro.org>
Date: Sun, 3 Jul 2022 06:28:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/11] Bsd user syscall 2022q2b patches
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>
References: <20220702135706.73622-1-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220702135706.73622-1-imp@bsdimp.com>
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

On 7/2/22 19:26, Warner Losh wrote:
> The following changes since commit d495e432c04a6394126c35cf96517749708b410f:
> 
>    Merge tag 'pull-aspeed-20220630' of https://github.com/legoater/qemu into staging (2022-06-30 22:04:12 +0530)
> 
> are available in the Git repository at:
> 
>    ssh://git@github.com/qemu-bsd-user/qemu-bsd-user.git tags/bsd-user-syscall-2022q2b-pull-request
> 
> for you to fetch changes up to 3f1b0235f68ff74ebfd98b17626e4254c4345fa8:
> 
>    bsd-user: Remove stray 'inline' from do_bsd_close (2022-07-02 07:52:48 -0600)
> 
> ----------------------------------------------------------------
> bsd-user: More file-related system calls
> 
> A second round of mostly BSD-independent filesystem calls: mount, unmount,
> nmount, symlink, symlinkat, readlink, readlinkat, chmod, fchmod, lchmod,
> fchmodat, freebsd11_mknod, freebsd11_monodat, mknodat, chown, fchown, lchown,
> fchownat, chflags, lchflags, fchflags, chroot, flock, mkfifo, mkfifoat,
> pathconf, lpathconf, fpathconf, undelete.
> 
> These are all non-reentrant system calls, so these wrappers are pretty simple
> and no safe_* versions need to be created.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~

> 
> ----------------------------------------------------------------
> 
> Warner Losh (11):
>    bsd-user: Implement mount, umount and nmount
>    bsd-user: Implement symlink, symlinkat, readlink and readlinkat
>    bsd-user: implement chmod, fchmod, lchmod and fchmodat
>    bsd-user: Implement freebsd11_mknod, freebsd11_mknodat and mknodat
>    bsd-user: Implement chown, fchown, lchown and fchownat
>    bsd-user: Implement chflags, lchflags and fchflags
>    bsd-user: Implement chroot and flock
>    bsd-user: Implement mkfifo and mkfifoat
>    bsd-user: Implement pathconf, lpathconf and fpathconf
>    bsd-user: Implement undelete
>    bsd-user: Remove stray 'inline' from do_bsd_close
> 
>   bsd-user/bsd-file.h           | 392 +++++++++++++++++++++++++++++++++-
>   bsd-user/freebsd/os-syscall.c | 118 ++++++++++
>   2 files changed, 509 insertions(+), 1 deletion(-)
> 


