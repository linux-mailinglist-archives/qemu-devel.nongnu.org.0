Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7779438C25F
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 10:56:21 +0200 (CEST)
Received: from localhost ([::1]:44318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk0xA-0000pJ-HQ
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 04:56:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lk0vh-00085P-Dq
 for qemu-devel@nongnu.org; Fri, 21 May 2021 04:54:49 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:41736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lk0vf-0004X8-Oc
 for qemu-devel@nongnu.org; Fri, 21 May 2021 04:54:49 -0400
Received: by mail-ej1-x633.google.com with SMTP id gb17so11313404ejc.8
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 01:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a3denY6dD4U/HRRHmNsZQWCHhe/NRpgPJY1UnAY5rKM=;
 b=w3mVXMikfd9ehMEU62Bry/giak1jnjPXfvsqClcnGc3iw8iyQzaqtypMyNn/7vw3yv
 6Gmd08ddJpsG+tkYkUYhvBvOlHCjDyzMa30cnRE+hKK3CzyzjWTu1ySwNN3C3DG5FvSj
 YF0MrrjOdwFk9Lg5YsTMLj3kumzHxLeUJYcIVpMz5xpp0/FGCj9qhp7EY/Xy14K9CYYK
 JuNoLCE497ijlmf8LErXXt7KQbOrwqLHm6Z23lKnsD7xutSNpU16ZHTiDMELX+GLnYy4
 xu+S0Fg6wRrTU8638lF11biF91+GumojdhjE3M0G9GDwItAlJY0nY5pwmrwlxPzDC5Qo
 Ys7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a3denY6dD4U/HRRHmNsZQWCHhe/NRpgPJY1UnAY5rKM=;
 b=oMg/Arq9IEcaa7+HDi54QYF8YuJ8z2iFqrLOZrDH7FKBoXDoWGVDLxtD/CMhXzcYcZ
 /GJwuuiiB2IHMgp2sU8FCItJHLGnaWExb/T8gnkDmkVwg1SayV8pPyvSwr0PO4fyMrO1
 ZcPRpSvibsSh021ky1us9gzfPEA4z9II4M2x7piMx513/JFwrrx55wnXpTAVm+9XlZvf
 gdCmF9a8zhhaeqe7QNncnsbID++UmzvbWAEmyCQFl9rKXt2Lp9VvZ73wGwRBLt5wojN3
 1IeeRoI9CR9YrOqH+WGma+I2I/eNiZwIHoGblyDEY9cqkxKNJ1Zufwvxc4BHixA/6FoA
 EvHA==
X-Gm-Message-State: AOAM530JLzs1zsnKFJ2A2LxBGToQhYb29WjpYp/cJ6B++wuFMYZg1q3l
 08/RsTEaJPuIjsEUV9Mt1qd10IkezyQVd6Fhvuv7rg==
X-Google-Smtp-Source: ABdhPJyK3gQLJnD2TU0bTU9hB0e7SJhdXPuiATxtSK3IObFa917AywvdZtHywxx0aXHgCjG5QBA442daN+1CfDOkO+w=
X-Received: by 2002:a17:906:b74f:: with SMTP id
 fx15mr9271131ejb.85.1621587286176; 
 Fri, 21 May 2021 01:54:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210520175256.1119684-1-armbru@redhat.com>
In-Reply-To: <20210520175256.1119684-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 May 2021 09:54:27 +0100
Message-ID: <CAFEAcA_11CZeVuuEKPrM_PaYuxXKaqDZEo=KtbghOi_cvmYUqA@mail.gmail.com>
Subject: Re: [PULL 00/15] QAPI patches patches for 2021-05-20
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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

On Thu, 20 May 2021 at 18:53, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit d874bc081600528f0400977460b4f98f21e156a1:
>
>   Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into staging (2021-05-19 16:10:35 +0100)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-05-20
>
> for you to fetch changes up to d4092ffa2604e07b2e1bb5b1f7b2651bc1edda80:
>
>   qapi/parser: add docstrings (2021-05-20 17:10:09 +0200)
>
> ----------------------------------------------------------------
> QAPI patches patches for 2021-05-20
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

