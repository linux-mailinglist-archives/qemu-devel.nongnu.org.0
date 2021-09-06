Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD816401FD1
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 20:44:18 +0200 (CEST)
Received: from localhost ([::1]:39676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNJbN-0003H9-Cd
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 14:44:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNJZ9-0001jO-As
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 14:41:59 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNJZ4-00023Q-LX
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 14:41:58 -0400
Received: by mail-wr1-x42b.google.com with SMTP id x6so10982623wrv.13
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 11:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fBvu+EUAVp2BPTIvZztAaEjtfTNnk94JKHuVT8cnyIA=;
 b=s15HJNfivbPHRbv995vP7V2QFGgIFDboV1V/lUgjUJTjaLN5lrpaDUIlV3+8O3AHQm
 GMonds89I0ejeRfGDXdwhqjQZxMry30DyuitnXoroH6ZNB3nYmCDq9F3dp/314h4+Nw9
 iRLHKmS7WyF0XqrFhR+3NBZH9OfN2YPZsgPw70beFbhXcTX3YtE4R/NyZ7upqBVROTHw
 xJOg8hziHnv0LdaVntC7JAc4eiVo2FfWD2BDbwdVqLQ/NRIAoSriEFY5IMFDJUyk/54R
 /AK8lkuiL1OEhzHQHJ7QWIarKI16LnxMTkgWI1yWpgxarE5uJ70OS6h4IVpxa5VyesXS
 /7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fBvu+EUAVp2BPTIvZztAaEjtfTNnk94JKHuVT8cnyIA=;
 b=aMR7R7CTrUZyYem02i643G22Zw+HEQk3K4phUiWUKtwSiB0+2UAOC2rPsWX9Hd4eFT
 myF/Dk6w9o+6Xfq7jXd5hGEj4d+DKzspmfxeRiD8hicVy52jbV9eVM/xXKt8KzsDe1Vt
 im/zZlPR+bT3w0v8Gz5sS5pugpzx3F5OVJCsHnSrdWuEnckqZE3VJzjWcdNL/bYKoIKx
 OyZGs0OaYhPGUFsRMiw4liWaFLwpVu9aiuev8l083lxO3xhrVxRcYI4CI8dt5io9YkcK
 HLAJmNEsUHZNheQrIqy2ROYvIvKBySXJfXaLPT7RKUbfU3oKtrtthRf6jmF7SiP4LkdE
 HVbQ==
X-Gm-Message-State: AOAM5310lAHNUtiSo3SVbmOs5eUs78DorDZKiSCeAnh7dl6fgpsqeDRy
 1RoNR2DhkCY+lQw6wjosz0x55/h5223cktydmA9LkmW/OvSmxQ==
X-Google-Smtp-Source: ABdhPJxZtLeXRt0SbLLlMndeEp4To3y3Hi/QIFRFldE/PE+8GvYQjVpWDj+ki3jqWN5wTd4/ZzxVSysTQeS5xJ6zV2g=
X-Received: by 2002:a5d:6cae:: with SMTP id a14mr15189140wra.275.1630953712760; 
 Mon, 06 Sep 2021 11:41:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1630941575.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1630941575.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Sep 2021 19:41:03 +0100
Message-ID: <CAFEAcA_gnDs61BMPgwwBKoGgJDKZGeTSBAs=JAiqQQarE3DiNA@mail.gmail.com>
Subject: Re: [PULL] qemu-socket unix socket bugfix 2021-09-06
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 6 Sept 2021 at 16:21, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> The following changes since commit 935efca6c246c108253b0e4e51cc87648fc7ca10:
>
>   Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-2021-09-06' into staging (2021-09-06 12:38:07 +0100)
>
> are available in the Git repository at:
>
>   git://git.corpit.ru/qemu.git tags/patch-fetch
>
> for you to fetch changes up to 118d527f2e4baec5fe8060b22a6212468b8e4d3f:
>
>   qemu-sockets: fix unix socket path copy (again) (2021-09-06 17:18:54 +0300)
>
> ----------------------------------------------------------------
> qemu-socket unix socket bugfix 2021-09-06
>
> ----------------------------------------------------------------
> Michael Tokarev (1):
>       qemu-sockets: fix unix socket path copy (again)

Hi. gpg says the key you signed this with has expired:

gpg: Signature made Mon 06 Sep 2021 16:19:32 BST
gpg:                using RSA key 7B73BAD68BE7A2C289314B22701B4F6B1A693E59
gpg:                issuer "mjt@tls.msk.ru"
gpg: Good signature from "Michael Tokarev <mjt@tls.msk.ru>" [expired]
gpg:                 aka "Michael Tokarev <mjt@corpit.ru>" [expired]
gpg:                 aka "Michael Tokarev <mjt@debian.org>" [expired]
gpg: Note: This key has expired!
Primary key fingerprint: 6EE1 95D1 886E 8FFB 810D  4324 457C E0A0 8044 65C5
     Subkey fingerprint: 7B73 BAD6 8BE7 A2C2 8931  4B22 701B 4F6B 1A69 3E59

Assuming you've renewed the key,  can you give me a keyserver I can
download the updated version from, please?

thanks
-- PMM

