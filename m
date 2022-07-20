Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3F657B066
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 07:37:55 +0200 (CEST)
Received: from localhost ([::1]:48266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE2PC-0006ZE-Js
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 01:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oE2Jf-0002kn-Cl
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 01:32:11 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:41703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oE2Jd-0000zH-0i
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 01:32:11 -0400
Received: by mail-pl1-x62b.google.com with SMTP id j12so13982739plj.8
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 22:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qlx/gB0iqUvigRY5hI9alL+gwSonbrXy/GJu4i3JLKc=;
 b=IhnuEgyFXG8s9YXMF9XZPxkvYOTo0fCP+Z5m8Nph4iqsWqhKSphfJUPQy1E+ba7hZw
 Wvq5clfaU1dDErn7exQjfT4FKGlxqqmE/K15ZFX0rBkRaGCywxoUzIyO4CZGWsW25Pqe
 1V4zmYJBdQcoC1m+gxWwsilv+XcZ/tJikpOM+4SOHu6DhsmCrIe+74wvaljKpU+Wj+8Q
 qlX+PjFd8kKSNvFgX/XfQ0HOKjrkGayO8ndACzTWrXGMozkkRCFWBRhAaKUuJfV7b7wV
 hzZb774YQkyWWcrAMOSAB4mfgOMuuXEixBia6fpv938ZCNPH/a2jBu4O1CEbaeOTusZq
 QVng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qlx/gB0iqUvigRY5hI9alL+gwSonbrXy/GJu4i3JLKc=;
 b=YcE0YTTafL9HFG8Be+OklaLSNyffcky8RsJxzRzHfLcrutLB6wxXRhxne/Z2HDk2LE
 Pl3mNLfb2SMKFATl1kYk87WkVa8yQmlvX0blm3vCdmdABrZQrxDj0CVQaGC4t83+iV4W
 Y48NQhmXTm8Ii8QjTOLK6eM/Z9kGsOHr+68l2wFTXosD/HfXhdP04+iZcwENeHXePQFe
 nZd+lbnMXkrCY+SDdYMJJr+3NS8e5HbL9Gyn48xXAqZ2kATZ6Ze6J9TMdgFbf7H2CPWH
 Vkhfm54R6C6jz65YW7EFAM8dKZCSc2NMqGZDW7YKqmLW4fbuFf1D/Otjva6wKbS8QEpH
 ZRkg==
X-Gm-Message-State: AJIora8MALWSw7jtCHaIqB1jzCGu+NSoxVrO4pqFRdnDjrNPT/sfwsRx
 RRmijoBH5hyrf86lVyUdiRINGv9wE2AVC1WS+j0=
X-Google-Smtp-Source: AGRyM1seotLg3aiYivprlA58J/3mXh8a2AEWsie9sarJAAICdINjn2IWk4/97UIJsPFDkaDRIU+Gx0ajw+/N84Pjdrk=
X-Received: by 2002:a17:903:2290:b0:16c:33f5:a978 with SMTP id
 b16-20020a170903229000b0016c33f5a978mr37428640plh.121.1658295127501; Tue, 19
 Jul 2022 22:32:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220719082635.3741878-1-bin.meng@windriver.com>
In-Reply-To: <20220719082635.3741878-1-bin.meng@windriver.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 20 Jul 2022 15:31:41 +1000
Message-ID: <CAKmqyKNBq+fFy3znyAKjE=Um_S3RODWyWMJpetKdX2ORVzNFiA@mail.gmail.com>
Subject: Re: [PATCH] docs: List kvm as a supported accelerator on RISC-V
To: Bin Meng <bin.meng@windriver.com>
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Tue, Jul 19, 2022 at 11:37 PM Bin Meng <bin.meng@windriver.com> wrote:
>
> Since commit fbf43c7dbf18 ("target/riscv: enable riscv kvm accel"),
> KVM accelerator is supported on RISC-V. Let's document it.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>
>  docs/about/build-platforms.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
> index ebde20f981..118a4c64dc 100644
> --- a/docs/about/build-platforms.rst
> +++ b/docs/about/build-platforms.rst
> @@ -46,7 +46,7 @@ Those hosts are officially supported, with various accelerators:
>     * - PPC
>       - kvm, tcg
>     * - RISC-V
> -     - tcg
> +     - kvm, tcg
>     * - s390x
>       - kvm, tcg
>     * - SPARC
> --
> 2.25.1
>
>

