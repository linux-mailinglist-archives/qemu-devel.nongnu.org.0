Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8411B340EA3
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 20:57:30 +0100 (CET)
Received: from localhost ([::1]:43340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMylt-00043J-K5
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 15:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMyk3-00031X-T6
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 15:55:35 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:42578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMyk0-0003gW-2y
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 15:55:35 -0400
Received: by mail-ej1-x634.google.com with SMTP id hq27so5873088ejc.9
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 12:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DH823nZOq9YJRYgVA1+/537UJz9VJKqYq3MCwXJg43U=;
 b=qOf0iVu0BOBwmuHBEi4k04VWt83RnWzFgFTF3hQE66eDfqeBF5ALYIPESj9x2HxKgb
 MCA9iGCaMToV5BgWGP+PJcavyBy04D0vCK4KNBsg5VwYn+SqVN1Y2N0KEUFC4B1Rj2lh
 MhjalpLk6W4NV/iaUlNTJYtFLPoqukY9+Sm+/BcJV7QJFhlsuxjXCCqNIZV6GFf399jI
 GDsbUyQ+UcAb4NKdWTHvSPMBaLRckXeVdeuVgBtOSEfbPI/AHC2wyydJtYt/LYVg2hcO
 3kEXpODWVDMjE7ZvRIfl8p7m4myL3h1kslrsNW4lJSh9U+Z83iZI8lgLIpIH2IyLsnQt
 CUJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DH823nZOq9YJRYgVA1+/537UJz9VJKqYq3MCwXJg43U=;
 b=cOr1ANwuqC9SMji4gAXTHxIaM2f7kRkY0QluE3cfUwJKGDpRS5Vygc3gCaapajjpjL
 b5vT3Ue8TlHtP5/3Z20pB1JIAJJnRolR+D7vWt/AolkzxP83sWmzcQWL4xjJll54LmXE
 HzAQ8uEImEB6PSk4ok5hutR7eTd/CpUi3d/kjZvhfUyLVqnrI/p5CfrxA8PuCJMHg/fr
 Gx1oF9jEI3zvEkJtadH1aUOQll7iSpAG7C1va/55ZH6UlqOAJ74iumZoi1+ZajjGFa29
 uhrEG8eH9KT7nfwoHaullpkxV0dw70aiPHm4enRbHecuc1gWUUcluGVwxLguzgJvhTL3
 aEnw==
X-Gm-Message-State: AOAM532T+Q0t0WVBgovlOJdJIPYaoTDtXAWE/0pY5qjESht1QOs/g9k3
 4jHLGwGOSKAK7hqQpntW2VKpj/5Yv+WdK7IsYwFqsw==
X-Google-Smtp-Source: ABdhPJy9ZycoprrkcNXhpe56uhhtxkn1NJy8JZXGk/XxEUWESK3tGyTd7FbVCUK2+aPEZjBkwfcwADH6enck64l/6Ro=
X-Received: by 2002:a17:906:16ca:: with SMTP id
 t10mr262591ejd.85.1616097329109; 
 Thu, 18 Mar 2021 12:55:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210318094807.10472-1-kwolf@redhat.com>
In-Reply-To: <20210318094807.10472-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Mar 2021 19:55:04 +0000
Message-ID: <CAFEAcA9R4LCogF4va2o1BefjZcFYUkwS2mQLM4JWnrCeFvx1UQ@mail.gmail.com>
Subject: Re: [PULL v4 00/42] Block layer patches and object-add QAPIfication
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Mar 2021 at 09:48, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit 571d413b5da6bc6f1c2aaca8484717642255ddb0:
>
>   Merge remote-tracking branch 'remotes/mcayland/tags/qemu-openbios-20210316' into staging (2021-03-17 21:02:37 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to ef11a2d8972147994492c36cd3d26677e831e4d7:
>
>   vl: allow passing JSON to -object (2021-03-18 10:45:01 +0100)
>
> ----------------------------------------------------------------
> Block layer patches and object-add QAPIfication
>
> - QAPIfy object-add and --object
> - stream: Fail gracefully if permission is denied
> - storage-daemon: Fix crash on quit when job is still running
> - curl: Fix use after free
> - char: Deprecate backend aliases, fix QMP query-chardev-backends
> - Fix image creation option defaults that exist in both the format and
>   the protocol layer (e.g. 'cluster_size' in qcow2 and rbd; the qcow2
>   default was incorrectly applied to the rbd layer)
>

Auto-merging docs/system/removed-features.rst
CONFLICT (content): Merge conflict in docs/system/removed-features.rst
Auto-merging docs/system/deprecated.rst
CONFLICT (content): Merge conflict in docs/system/deprecated.rst

I'm afraid your pullreq was racing with another one deprecating features :-(

thanks
-- PMM

