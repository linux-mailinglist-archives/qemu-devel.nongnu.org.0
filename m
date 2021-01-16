Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A801B2F8D67
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 13:57:18 +0100 (CET)
Received: from localhost ([::1]:42562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0l8n-00012T-7K
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 07:57:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0l7u-0000EF-3S
 for qemu-devel@nongnu.org; Sat, 16 Jan 2021 07:56:22 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:46659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0l7s-00035z-9y
 for qemu-devel@nongnu.org; Sat, 16 Jan 2021 07:56:21 -0500
Received: by mail-ej1-x635.google.com with SMTP id t16so17104637ejf.13
 for <qemu-devel@nongnu.org>; Sat, 16 Jan 2021 04:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZgBtirv0aqNJX4eHqk23wpDeUOpGV0RG4uDdax3mMUk=;
 b=X+cx4ypDh8bATJJL5COh0ZO8Xts61VjtpN+DNwqrhWwISfYFcPwVOGc/oe17It/fS4
 75BAoJ5EdGXr5KJ9No0YmH+m5o+/zMPCWeOe7WsPdpNOoDnlVhQ0Lv0v3TFHHKszqhmW
 wBnVwGD62+JllO88v4YrHMu8uWR4fKVqpHZxwgJVtN+iWv1Y2CuTLjjQEIEMev1gmv2+
 9pMxilA+ZaiXuLUjYFyjm4UteclEBVfcT+pFRf6Q1s9509uLGSlca4tCjOb84Zv9sh/P
 fscQS7RwzGvZpC7lo7zjmta7lvL5vCHFPXktC1PpDsnNgF4SR1KuhyAzQ3lq32UH4kn4
 PXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZgBtirv0aqNJX4eHqk23wpDeUOpGV0RG4uDdax3mMUk=;
 b=bqaflA3ozCJEChNuiqKnUNtA1q7+1p+O2gvc4MO4BQhpIVxoFfbuEFcRjS/F1uN+UX
 gmgAB++3xMF60jU24mZY1pwRM6N039DVVLN2Uau+G7TnsZ7rD48CxU8LPs7jdtOLak50
 aYx7Jcx+RS3otJHmaaSh6My3AlMyUgqMlLNYDGYYzvdOwxzZQ+mZCD+ePQQDz0lKZPhj
 6LX1uTzbk4QyQTUo2qZuFPza7e0ADVHJ56FaOQ3m1kxkhqKNmOlMGFAQcE7XJY51+Tuo
 4cb1K23uELaTXjYvSj/8WjpLguMzL5FIz9WSOaMCFyS7qtDYMilQwRVN7YjUBUfmQE0M
 JxTg==
X-Gm-Message-State: AOAM531JLkS4HM5o6NLRCum7euE1A664a+isIRW8haqfcCSHpUBuePX5
 a3Dk4+RMEaapzVxLMl7OeRThmsYON+wFDqGpgIlu+Q==
X-Google-Smtp-Source: ABdhPJxUBNW6a9tW/IIR5msqHxpa4cq8QJImwwAuN0qmAdu+ei2AeQOEqEgw96nBVLzowmnBG3Y6jkl34RkESGjmBGE=
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr11827566ejf.407.1610801778126; 
 Sat, 16 Jan 2021 04:56:18 -0800 (PST)
MIME-Version: 1.0
References: <20210115132146.1443592-1-kraxel@redhat.com>
In-Reply-To: <20210115132146.1443592-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 16 Jan 2021 12:56:07 +0000
Message-ID: <CAFEAcA-u6dL7BmhOWf5W=iFqXyZMwsrcwufRGCfA4rghOZ6cNQ@mail.gmail.com>
Subject: Re: [PULL 00/30] Audio 20210115 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 at 13:50, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 45240eed4f064576d589ea60ebadf3c11d7ab891:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-yank-2021-01-13' int=
> o staging (2021-01-13 14:19:24 +0000)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/audio-20210115-pull-request
>
> for you to fetch changes up to 8abf3feb4d464abadd5133d8810c8a3232cbbe6e:
>
>   audio: space prohibited between function name and parenthesis'(' (2021-01-1=
> 5 11:49:26 +0100)
>
> ----------------------------------------------------------------
> audio: improvements for sdl, pulse, fsound.
> audio: cleanups & codestyle fixes.
>
> ----------------------------------------------------------------
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

