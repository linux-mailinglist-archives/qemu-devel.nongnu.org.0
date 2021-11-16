Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 487CE453495
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 15:47:45 +0100 (CET)
Received: from localhost ([::1]:38414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmzkO-000822-6e
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 09:47:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmziS-0006Bq-FU
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 09:45:44 -0500
Received: from [2a00:1450:4864:20::32e] (port=37505
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmziN-00073h-Ut
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 09:45:44 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso2184134wms.2
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 06:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uJas13CEkggHw6On8znQmFved5FZSgDHSDuNT0Fw9ks=;
 b=j9EUj5vNjxFrA9mHGNGX5H4uX+0PsftBxhK5Z1oS5WD7oORnSOGX2uTc/jBrJcLL9u
 V+q62bpED0WdyfLbA546oruTMqQ8ScB71Ic1viRcod5UwIyt3OhXWNQJrbgANZuirJfE
 hUasCOH+kpKk9o1G9j6V76VlBPzBANljKgq/hknd7SzYWp/xoo9sUSi/Wwq76KHsOGtK
 zyXn3wJJlFwNYTAISsa4u3457JwuRHQUS1aZ/ZFDwv/MhJLD7ZOHX2/J6sSL3XpXQCBd
 /c1n5dJl+H7iB0VBQ2xcI8QXfzzKPWjDyW5Mg3k60RMmgcnwut4Px8wTqMHhX78v2hI7
 OTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uJas13CEkggHw6On8znQmFved5FZSgDHSDuNT0Fw9ks=;
 b=i1H0VLy8ddYoHchA6rydhG2Ez8el3asgUU3CFOXaAtUoBeQ8VXadUQ1B0hj4rZs6ww
 X19VvrIbqWqne/v5BHNOpV5Xwr/H3M4JrR1a/t7wfWxBW/ZPSYi/XMqX3G9RDhQIgnD0
 t+NfU/muraqPJysktBQ+yEWsBr0wPostA6NskjTbqhJ2IUyhZeIt56UMLEVO/px1TWda
 NyLv42vVm6RWbe2Sjmn/OtgSaUDelPd6xIsbv3GtNwh0gyuUnHXj4qGQZswphGyzifBG
 IDrmGoFhzxwuqEP3EnNnicruBnnkK4pl8v8H3Xv6bP/f4baJJPkl9SjhwikuBrW5dMqt
 flDg==
X-Gm-Message-State: AOAM533GAMGu9/oDdXlq63QVisne8mvKLAM7J9unVpgR3ww24p6/TtVL
 hgrCVDqevbETZY0OXDNhpXLXWg==
X-Google-Smtp-Source: ABdhPJz9MC6EjKmoXp7l5F48PEShzah6km/zSdl9qxtZ17tDBL4qbeSdPqvpp2PVB1xn8s+NGZdxcw==
X-Received: by 2002:a05:600c:b46:: with SMTP id
 k6mr8398029wmr.45.1637073938000; 
 Tue, 16 Nov 2021 06:45:38 -0800 (PST)
Received: from [192.168.8.105] (145.red-37-158-173.dynamicip.rima-tde.net.
 [37.158.173.145])
 by smtp.gmail.com with ESMTPSA id j17sm2979296wmq.41.2021.11.16.06.45.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 06:45:37 -0800 (PST)
Subject: Re: [PULL v2 00/13] Block patches
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20211116130618.700441-1-hreitz@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <64fa99ec-8a61-5420-b391-7e79e29b4cae@linaro.org>
Date: Tue, 16 Nov 2021 15:45:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211116130618.700441-1-hreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.446,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/21 2:06 PM, Hanna Reitz wrote:
> The following changes since commit 42f6c9179be4401974dd3a75ee72defd16b5092d:
> 
>    Merge tag 'pull-ppc-20211112' of https://github.com/legoater/qemu into staging (2021-11-12 12:28:25 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/hreitz/qemu.git tags/pull-block-2021-11-16
> 
> for you to fetch changes up to 5dbd0ce115c7720268e653fe928bb6a0c1314a80:
> 
>    file-posix: Fix alignment after reopen changing O_DIRECT (2021-11-16 11:30:29 +0100)
> 
> ----------------------------------------------------------------
> Block patches for 6.2.0-rc1:
> - Fixes to image streaming job and block layer reconfiguration to make
>    iotest 030 pass again
> - docs: Deprecate incorrectly typed device_add arguments
> - file-posix: Fix alignment after reopen changing O_DIRECT
> 
> ----------------------------------------------------------------
> v2:
> - Fixed iotest 142 (modified by "file-posix: Fix alignment after reopen
>    changing O_DIRECT") -- at least I hope so: for me, it now passes on a
>    4k block device, and the gitlab pipeline passed, too
> 
> - Note that because I had to modify Kevin's pull request, I did not want
>    to merge it partially (with a merge commit), but instead decided to
>    apply all patches from the pull request mails (including their message
>    IDs)
> 
> ----------------------------------------------------------------
> Hanna Reitz (10):
>    stream: Traverse graph after modification
>    block: Manipulate children list in .attach/.detach
>    block: Unite remove_empty_child and child_free
>    block: Drop detached child from ignore list
>    block: Pass BdrvChild ** to replace_child_noperm
>    block: Restructure remove_file_or_backing_child()
>    transactions: Invoke clean() after everything else
>    block: Let replace_child_tran keep indirect pointer
>    block: Let replace_child_noperm free children
>    iotests/030: Unthrottle parallel jobs in reverse
> 
> Kevin Wolf (2):
>    docs: Deprecate incorrectly typed device_add arguments
>    file-posix: Fix alignment after reopen changing O_DIRECT
> 
> Stefan Hajnoczi (1):
>    softmmu/qdev-monitor: fix use-after-free in qdev_set_id()
> 
>   docs/about/deprecated.rst   |  14 +++
>   include/qemu/transactions.h |   3 +
>   block.c                     | 233 +++++++++++++++++++++++++++---------
>   block/file-posix.c          |  20 +++-
>   block/stream.c              |   7 +-
>   softmmu/qdev-monitor.c      |   2 +-
>   util/transactions.c         |   8 +-
>   tests/qemu-iotests/030      |  11 +-
>   tests/qemu-iotests/142      |  29 +++++
>   tests/qemu-iotests/142.out  |  18 +++
>   10 files changed, 279 insertions(+), 66 deletions(-)

Applied, thanks.

r~

