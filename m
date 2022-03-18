Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2900E4DD93E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 12:50:55 +0100 (CET)
Received: from localhost ([::1]:57310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVB8A-0005wp-8g
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 07:50:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVB3w-0004SQ-OD
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 07:46:32 -0400
Received: from [2607:f8b0:4864:20::112f] (port=40295
 helo=mail-yw1-x112f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVB3v-0001YP-Br
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 07:46:32 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2e5e9025c20so5103867b3.7
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 04:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RL1+BTbf8vNhcrVvVsf65vvoN25nMrIhYNDwBfAxNqo=;
 b=c7WPBqrpjbKniQf0E7M5/WGiAJn/78Bsvoff3oMuSs/MK2jLVmWoUQEyb0OLY08eYK
 L5L0VpgpLJjiErQgUMEo3OtQPTD2OA+xlZX7+6cYfQLGyApjXoUvgpm8QsgFeqsQszMa
 u9qbOS+VLYBZvb9UKqI9bxBMl9dYqb8e3YKgcJ8YIJWKY5oS/KVSYGgZ02NHXQkO1Ej3
 9/yYoQRcYoJBg8NMWlp27LrAZ3QzZ19oMdw40PsSC2mFitTllWIK9KtV7iozWVguWPIx
 r/v20Bi67ribodYj9TWG5aGXDqscmp/5RWSWGsponnVScM0oJmDXPyzrhdaja7TzG6Wh
 /WFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RL1+BTbf8vNhcrVvVsf65vvoN25nMrIhYNDwBfAxNqo=;
 b=wC6+C7Tx+ZPoMbTlDmanNZBR2muk958QTLEsx7Y9B0XUENBjT0ShgffqtFjsC6NH5O
 4kfDXZA4abPKZrxnYadebhOQ8ZASq6znsU6JC7MJElG0nVkwXoUabvn28A9EMMN7Sohx
 VsfhSQ0QvOe6rp/XtVp6/VEyS2kGiVlV0i6x2Zqwi7UKLB9FajmAJxLG9NXjILXSD6DA
 79sMa/EwdMPuE03efoLEM3bf2AWsrWa/RXZR0rvO9BBfdqm8d0d/CzZqUP9b+4BdxDZB
 OO9iSkaVPCC+8A7KQm+ortrIGY970KrOxksao11D+yhYBGadknTsybjTVsdJTejpuh7K
 avmw==
X-Gm-Message-State: AOAM532HwQFhcAmEdJGuvlI6Cbvd7WWlCcDYirDbK8LHcRWfeLANM0ro
 FykRTVe1mbPbobj3Ur6o+XwM/jBddk1HF8wl/Dqa8A==
X-Google-Smtp-Source: ABdhPJz0lHWaWYbgn5HB4UO+vTiwIB4mWWdNp5EBwjt6wfhdYkM50a+rSr+n5lLfdmxlmHITk4WyDasTb3OLryRxcSA=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr10689257ywf.347.1647603990401; Fri, 18
 Mar 2022 04:46:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220302130417.18551-1-ubzeme@gmail.com>
 <20220302130417.18551-2-ubzeme@gmail.com>
In-Reply-To: <20220302130417.18551-2-ubzeme@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Mar 2022 11:46:18 +0000
Message-ID: <CAFEAcA-Ktb6RDhXLsBhWwFvg5LPYG-B=+4mQnMtrwq9vSzjPsw@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] hvf: move memory related functions from
 hvf-accel-ops.c to hvf-mem.c
To: Yan-Jie Wang <ubzeme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Mar 2022 at 13:04, Yan-Jie Wang <ubzeme@gmail.com> wrote:
>
> Signed-off-by: Yan-Jie Wang <ubzeme@gmail.com>
> ---
>  accel/hvf/hvf-accel-ops.c | 220 +--------------------------------
>  accel/hvf/hvf-mem.c       | 252 ++++++++++++++++++++++++++++++++++++++
>  accel/hvf/meson.build     |   1 +
>  include/sysemu/hvf_int.h  |   2 +
>  4 files changed, 256 insertions(+), 219 deletions(-)
>  create mode 100644 accel/hvf/hvf-mem.c

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

