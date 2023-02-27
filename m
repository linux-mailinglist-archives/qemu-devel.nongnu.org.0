Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7075E6A4510
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:47:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWelJ-00021t-2M; Mon, 27 Feb 2023 09:45:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWelG-0001rw-Ah
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:45:54 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWelE-0000OH-Ge
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:45:54 -0500
Received: by mail-wr1-x430.google.com with SMTP id l25so6505529wrb.3
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HpLk7tk5pCXFVuqX4++s3nBj+CH/NW+6+BTecI/A6sQ=;
 b=O9JFmxR++cV8JfAif6P47Rl5HZzCDCCvVao/lr1l1TaZ+9Dv0Wg9/7rTQ0pWGAk1vw
 E2CoJrDNEx9Mj619+XgyXRygRi7pgjcYJlc3P2bfCWkYvVvFEgcgOsepNSYVBi4QNpe/
 hV4C/qqQeqrLzTURZtc+gngPVnLsLo9o+YZom7Dui6wkrv9X0PYzstsPOO1FcAIqT1+w
 /W7UFxKX7MgGsVuqoyz7Uok92M69NfC+Y++7E+3oszAl1ReMLTcGSAwfdPNyE+/SbMbh
 cn0AE7PaaDd52pTJuCJm0BOqgnsEm6W6kJz0k5zC4kTz9K86kfsacHKPVMvHVtpwDhhy
 QN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HpLk7tk5pCXFVuqX4++s3nBj+CH/NW+6+BTecI/A6sQ=;
 b=8A+AFrVA3GsBxePLxSxAbrivKKTY1S15k7O/MYkk4e9lsPF2Zvc3Y6AJU4wZ/mOcAa
 DsI7m6HsH5cbX6naXVnOuseQ4kh+bss1P0sV7Ggbfdhhkx86HatDUJRuEFygQyxK2Cgp
 +684OkJWOhXkS+CjfI5LT7mLTnIAtgAh8j3YyMkz7iShGhq7x/qPDTKkscNzOpPj5Tsl
 fZFtKLjdMOxwlvZP3g3V43V2GNzbvHdLDnOHDd6jcbWTStXUm9vqIlQXWHylvuSOoGMb
 apmOpun/tC16jjATWnid0kisX0zU+XoZtUxU8V7KcLz7BEm+BOihCJ2HYbZgZfjf1wfP
 Iidw==
X-Gm-Message-State: AO0yUKW6ZKQp5r9bP9Vp80Fq3dMs+kbfe1JcZ0Cn6cwEmlQSJm6a4529
 2yZpvne/ybPStdjHpyy2Fs5frJ6jlDH3p2ibfzTLyw==
X-Google-Smtp-Source: AK7set8wuWxb23lUI58a+YNFdnzeE6fb2jrfmcRx0G7Zdkhfpdt6YQ5ShZ66xDAN3pPGWHUDRaTtYVa6pxBypH/klBI=
X-Received: by 2002:a5d:45c4:0:b0:2c9:bb13:2122 with SMTP id
 b4-20020a5d45c4000000b002c9bb132122mr1169402wrs.8.1677509150929; Mon, 27 Feb
 2023 06:45:50 -0800 (PST)
MIME-Version: 1.0
References: <20230227113621.58468-1-thuth@redhat.com>
In-Reply-To: <20230227113621.58468-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Feb 2023 14:45:30 +0000
Message-ID: <CAFEAcA8ADDjxdHUfxVDVkjqpbysRCH-sSQbTDBzX2G1v=bsnHQ@mail.gmail.com>
Subject: Re: [PULL 00/33] s390x and testing related patches
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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

On Mon, 27 Feb 2023 at 11:36, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter!
>
> The following changes since commit 1270a3f57c9221080f3205a15964814ff8359ca9:
>
>   Merge tag 'for-upstream' of https://repo.or.cz/qemu/kevin into staging (2023-02-24 15:09:39 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/thuth/qemu.git tags/pull-request-2023-02-27
>
> for you to fetch changes up to fffa36b68e2f266c8b03ef3fdd242aa9a9181a87:
>
>   Deprecate the "-no-acpi" command line switch (2023-02-27 09:23:21 +0100)
>
> ----------------------------------------------------------------
> * Simplify device casting in w/vfio/ccw.c
> * Fix memory corruption in the s390x dump code
> * Various s390x TCG clean-ups
> * s390x PV support for asynchronous teardown for reboot
> * qemu-keymap related fixes
> * Improvements for the duration of the gitlab-CI
> * Deprecate the "-no-acpi" command line switch
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

