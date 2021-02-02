Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6520D30BCF8
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 12:27:18 +0100 (CET)
Received: from localhost ([::1]:52236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6tpl-0005He-Eq
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 06:27:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6tnZ-0004ff-UA
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 06:24:45 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:44206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6tnY-0004Pq-23
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 06:24:45 -0500
Received: by mail-ej1-x630.google.com with SMTP id w1so29331556ejf.11
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 03:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y080sHJCy4LzIh3UfrO71QFMj3wTpVCs4+tmi0hJfqs=;
 b=TCNhytzSZITK+AfrSwuPDrUK7WQ8waIhoL7IxlPEt5DM5i1L2hhpbvtR7MiEZGJtfq
 00JENdkia9u9IqGdggwWpYeQmF2SDtOZHAyZaOQ4xtA1LnM8Coc1CYK0ukj7kw+TJ2gy
 qHYzYOYjQNQ7w+IlM7GcgtiPdl46fQU727IfUsQCYNNYw4nGKbARcFpu+Ok4yQ2oRoJg
 HifdM3voBI5TCrKOJv8U4KQEdhZyQjalmbvmU8bNHuNnC81F9yVzDKjaiaruOQWSCW/6
 0q4pVgxKsJAyLyC5dK3H3waHjEeLIA2Zoy1ssnMUld6MIBOTfGYkO5dprnrLUl5OqNPv
 si6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y080sHJCy4LzIh3UfrO71QFMj3wTpVCs4+tmi0hJfqs=;
 b=S6n/Pleljkk2L3yJRBUsmPiI03FbNvBmolzEXDnCbOuM3wjBF1AkztX6GzKP7uqVRs
 Kv1LS3suwOSiesUerRL6XqF61xdrPOvMzbma0psm+w9HR20bQAVZRPNqCHwvLLzqiq0C
 0mTUUlAK0ay1HAy0edstzZ9LUQEfdK9tGLL9VcA4j4EYbWtH12H2FwCdtTMWHo9koXuX
 lY+XK3YXFuI0+n1so5ax8J14gGQjjNK6D4/yff9O/Visg1v8KKr4hS0JvuwJwVRyduxV
 qqKz6zWTiee0dzF6LM0IZ43fG8LyCtxzfZPHya+wyHaXxyvxE5T7BKfBwIJ0A5MGYsYg
 ZuWw==
X-Gm-Message-State: AOAM530apALQiVAul49n6vYtIIRAGwMaHFQjKu5XsqnfTwMKCUyzwDXR
 zcVz+vPVGnAQoUKkCctpuDFtH+77x5ycyGQFH1OZow==
X-Google-Smtp-Source: ABdhPJzF5efLoMeLwLVi6Lt+OCR9IdkkJoHVoINqyWkK3jGQKjSMWF8CxDHTq1BfmxzPoCpHjO9/2tvv9d6xj/BtuOU=
X-Received: by 2002:a17:906:4bc2:: with SMTP id
 x2mr21769238ejv.4.1612265081930; 
 Tue, 02 Feb 2021 03:24:41 -0800 (PST)
MIME-Version: 1.0
References: <20210201154703.180022-1-stefanha@redhat.com>
In-Reply-To: <20210201154703.180022-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 11:24:30 +0000
Message-ID: <CAFEAcA-DqWhawj-7EnfeSpmQ5ZOAD8M9e2ZrbBadY3XHO+sPAw@mail.gmail.com>
Subject: Re: [PULL 00/11] Tracing patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 1 Feb 2021 at 15:48, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The following changes since commit 74208cd252c5da9d867270a178799abd802b9338:
>
>   Merge remote-tracking branch 'remotes/berrange-gitlab/tags/misc-fixes-pull-request' into staging (2021-01-29 19:51:25 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stefanha/qemu.git tags/tracing-pull-request
>
> for you to fetch changes up to 0dfb3ca73c54fc105ab78e37e31ab05bed1360aa:
>
>   trace: update docs with meson build information (2021-02-01 11:23:04 +0000)
>
> ----------------------------------------------------------------
> Pull request
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

