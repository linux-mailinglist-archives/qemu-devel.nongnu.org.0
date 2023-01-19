Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C10673797
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 12:57:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pITXJ-000492-GB; Thu, 19 Jan 2023 06:56:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pITXE-00048m-Se
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 06:56:48 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pITXD-0000QK-4X
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 06:56:48 -0500
Received: by mail-pf1-x436.google.com with SMTP id a184so1275456pfa.9
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 03:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=S1iJ5uL1PxMra/dgN/ClBLRTr8MyiZZ4S5f75dHucuo=;
 b=PhRqhw6Fm3J6gLwD/kR1t+c+I+FcIsaNd8Jwd8DX7RCtMXyDORDi4OWuZMce2GHMyO
 NheIW4DDrTk/QoqSDzQ6WJFCb7uQGP4cWxnVnrQ3M/z8PocYcRtnGzTiKW41QGDAYztc
 bS66wYydkkrc9P/FhF+qUyylW/7RwnElu5kUylDtRIjGyqpGZNyQqRW9szdX+zzvx0ds
 h1vx4jIeO3ZELORo4cAuBnIu3nNdrLu2ypaNGGFHIoJ1kZz8C6+jyc2WqyTIhQeP9O/t
 aKalpHRjHm/2eAnWmYaAF7DRCFINtucOOL5XAN2JdwZm7l/jlWpNTM9qLFrdMc5P110W
 EvFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S1iJ5uL1PxMra/dgN/ClBLRTr8MyiZZ4S5f75dHucuo=;
 b=eUReVV0Wm1ohGA0HgvhOQf9tIKdyp7N57qUHoUA+eOOZ/Jg50uE5QS8LJPcb4OV/3X
 Gf9YJ8pn5gQBod59BEKW9FhpauE3M4jtGSdrEiTz3ZsQ6r/ziwKkUhnYTcQ4FpIqMNdL
 OFOtuEAHwAXvc0klzhiqbGFRYYgZA5ICiM7PDO7KyUEGcNcI7pwK21AQOo0W/BChCJp4
 hPJaLc0PEd7cGPFTC5/vR2WCQBqK5QU4qClbMqerykS9vttWLFSXEXWHcPobtrSiFMcA
 Al6lItEfWm/agYATVtSnrbqqhxtZOB1aZOLiAxc6YqnEh4HnOkWwHsSvbSThDgiB/8S3
 T02g==
X-Gm-Message-State: AFqh2kpPDmTkBQlygHjTruEWdBGzj3+uvhjSpIU5TZ9WMwic735psKY8
 e8U2yWEU54gv3FgyPc37zqQM63yBVP9eDDn5Qf1EYQ==
X-Google-Smtp-Source: AMrXdXunGUW/U9xl+2GIUQA7zec3Z9BG7hEwqp1sS1EtTPCo6PIg4zscYs8LM6NBn7MKWXU5hyevMC+P2UImruJdw1c=
X-Received: by 2002:a05:6a00:2b1:b0:582:a212:d922 with SMTP id
 q17-20020a056a0002b100b00582a212d922mr923726pfs.3.1674129404350; Thu, 19 Jan
 2023 03:56:44 -0800 (PST)
MIME-Version: 1.0
References: <20230118113418.1650416-1-thuth@redhat.com>
In-Reply-To: <20230118113418.1650416-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Jan 2023 11:56:33 +0000
Message-ID: <CAFEAcA9yyLpcyt4gOhG_2p0d4DsAsA5e29x3pS7r_5QbLRZj-A@mail.gmail.com>
Subject: Re: [PULL 0/9] Testing, s390x and misc patches
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, 18 Jan 2023 at 11:34, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter!
>
> The following changes since commit 7c9236d6d61f30583d5d860097d88dbf0fe487bf:
>
>   Merge tag 'pull-tcg-20230116' of https://gitlab.com/rth7680/qemu into staging (2023-01-17 10:24:16 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/thuth/qemu.git tags/pull-request-2023-01-18
>
> for you to fetch changes up to 75d7150c636569f6687f7e70a33be893be43eb5f:
>
>   s390x/pv: Implement a CGS check helper (2023-01-18 12:27:21 +0100)
>
> ----------------------------------------------------------------
> * Fix the FreeBSD CI jobs in Gitlab by upgrading the packages in the beginning
> * Fix the Haiku VM test by updating it to r1beta4
> * Allow "make uninstall"
> * Rename TARGET_FMT_plx to HWADDR_FMT_plx
> * Some small qtest fixes/improvements
> * Check for valid amount of CPUs before starting a secure execution s390x guest
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

