Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF77B4F0543
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 19:44:09 +0200 (CEST)
Received: from localhost ([::1]:40768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nahnE-0003l8-AT
	for lists+qemu-devel@lfdr.de; Sat, 02 Apr 2022 13:44:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nahiQ-0002o5-PT
 for qemu-devel@nongnu.org; Sat, 02 Apr 2022 13:39:11 -0400
Received: from [2607:f8b0:4864:20::1132] (port=41825
 helo=mail-yw1-x1132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nahiO-0006oX-QS
 for qemu-devel@nongnu.org; Sat, 02 Apr 2022 13:39:10 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2e6ceb45174so61988637b3.8
 for <qemu-devel@nongnu.org>; Sat, 02 Apr 2022 10:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UoKz0i+Si9waVcyENPOyOhJcytmcpkoAbFcDxQowY+A=;
 b=IPWIXFiZwYHRhjZ2V5UzfDA934sTg69WVHhLFxOq7CBc331Rb0/z4yRy5SCz0NClAa
 OkYetbdDm72PgJSMQO3gaaRvw8fKXaxtse5ZyxfqgsUlKa6XleI9O/6r7xmG3/pqrpL+
 pDKV95wapSbX9gJiHylgUZ2GaqKmXYUFuxBkMAvzjEQ8sV/zGC3dHKGEj8DI33O0304p
 gCXzcJZBjk9kkWOSFr847pErUMbUfWiM8Eng4ORSeqFkdTQcfAQZNVh2RhdUjausS+94
 KcLg9PtJdjDFe/ZRpP13s2pgLjmyQ2xDtFyWN51GOO8ZlVKXp6gnlV40nJaUmMqlK9HZ
 XCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UoKz0i+Si9waVcyENPOyOhJcytmcpkoAbFcDxQowY+A=;
 b=gmNmyQtuhjN13LHf142ckabBuRylO5ZLYqpT6RD8/ByNOzVqGa3UYNlZBmLOnVh2ZT
 nK6Bu5ZrLVK6nTUe/Mwz0CyFCGrLt+S4cQSrT8+07VCYmE5UXVQf0F95THarOC9x5yIO
 yyQLCS8dfh2C525yl0r+v2SdZczzVxwpXJzhnhG9b2P9fD4eabGsoG3PFTdLYsrnD2QO
 w6oDaiBaTKtY9o2ordtmo5sHEng/rTM5ANDs3J8ee3yNOHHfo0uyQv2j/mbL2LiWSrMG
 1FQuqq98ED9kRt2srKEMlsbMF5Y/yMiz7jf+golKaCBUbxqFA6aT61Ob6n69J4XmVAyg
 XseQ==
X-Gm-Message-State: AOAM532H+ZBly2VZi7Cc4B2I9MQeF1zWDGlFnfKOXoHANkUemfexX+Lr
 ZPOgp6YF7dGHblj2iX++EMn2E8a7V2bau0/eBh6oKA==
X-Google-Smtp-Source: ABdhPJy9R26dAxayUwSSuhvC+QDr7QE/iosz3bp1fV25oeP2bz4ytZ1gaK9lNZiaEw3ft+sgDnq09w+3GGWRqy4Q6E8=
X-Received: by 2002:a81:db05:0:b0:2ea:2b92:c317 with SMTP id
 u5-20020a81db05000000b002ea2b92c317mr15811259ywm.329.1648921146075; Sat, 02
 Apr 2022 10:39:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220401152323.52519-1-thuth@redhat.com>
In-Reply-To: <20220401152323.52519-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 2 Apr 2022 18:38:55 +0100
Message-ID: <CAFEAcA8BPjB-qd-F17jzJh_R-k+AmAp_VbTXCm_QCAZ4iD-3-Q@mail.gmail.com>
Subject: Re: [PULL 0/6] Misc fixes for 7.0
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1132
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 1 Apr 2022 at 16:23, Thomas Huth <thuth@redhat.com> wrote:
>
> The following changes since commit 9b617b1bb4056e60b39be4c33be20c10928a6a5c:
>
>   Merge tag 'trivial-branch-for-7.0-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2022-04-01 10:23:27 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/thuth/qemu.git tags/pull-request-2022-04-01
>
> for you to fetch changes up to e32aaa5a19e24233180042f84a0235a209de71cc:
>
>   trace: fix compilation with lttng-ust >= 2.13 (2022-04-01 13:06:07 +0200)
>
> ----------------------------------------------------------------
> * Fix some compilation issues
> * Fix overflow calculation in s390x emulation
> * Update location of lockdown.yml in MAINTAINERS file
>
> ----------------------------------------------------------------



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

