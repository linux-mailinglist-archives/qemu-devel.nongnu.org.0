Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA47395261
	for <lists+qemu-devel@lfdr.de>; Sun, 30 May 2021 19:35:48 +0200 (CEST)
Received: from localhost ([::1]:43034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnPLn-0004aB-R6
	for lists+qemu-devel@lfdr.de; Sun, 30 May 2021 13:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lnPJo-0003A8-GL
 for qemu-devel@nongnu.org; Sun, 30 May 2021 13:33:44 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:34639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lnPJm-0007qb-OS
 for qemu-devel@nongnu.org; Sun, 30 May 2021 13:33:44 -0400
Received: by mail-ej1-x62e.google.com with SMTP id g8so4610821ejx.1
 for <qemu-devel@nongnu.org>; Sun, 30 May 2021 10:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0rCQnlI7V6kQ39SBemFBsKt0QLcoRb9QPWytgZz9ai8=;
 b=HwaHWXS/ClqantLzJC1n6hWjY3qGJBKnpiaUtFgxBk05fe1K9I0hIxRigs2F9nCY9e
 KDm6Ic2dEAoXSk2/RJ0thx36cAGq0WEys+4cH0n8YI2iIuKzHKhArR4diK+61BugBWlU
 7PAbSWeBjelkp2tGmlfutF5E7mSmvej6QyxjMBYrs0F5Z9RMaUqDpo3pYKHKqlcio/We
 +LNic7fDhpM8YwNluHfxp6ivB1M1V+ManMEGGdzG3seWF4dKUgxVx1XXTiDxou1een4E
 BabgDKU5iUnfcBojcoHK8I4DEzvSl6pEnUpq8UI/7HdWOPLxo+GjgpJ0CDUy9D6+Kqc8
 gfyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0rCQnlI7V6kQ39SBemFBsKt0QLcoRb9QPWytgZz9ai8=;
 b=b2u/nG/29pDUy4mPYP4S0VQXYUObeQmNmqhGRFURE79ahGkkHlYcNsJmX+1LMI9KHm
 Hdyo0h2xWZF6lTcomti5dP2sMzyqo3iYOkJEnYMkUw/HHzLChfVK3QXkned6KaYI4nuL
 6+wdh9/gij1cV/D4koKcQwkOEs3rHBxXQiC84fYACCZjC+1LPHf/udY/pPhloVRAQpRf
 ByjcVk70wvJk5bnEo+JWtbYG7fDor+O/42w6/hMId3UyzEGI2SeGZ95/qG+lW5/1qTWv
 t6h4A2u4NvFygvCVZ8fl2/dftk7zt1JVcFhzKL043G8g+BuDPW8L/pmYdA155YT6t7EH
 4wkQ==
X-Gm-Message-State: AOAM533JTsLAj4OwjoAvjGH/09eTpO13hkCciy96hSwpIGBxHXo/d1dq
 BVPcDU+zU8p4gvVS/n7Q2SXAqRD2+lQu79moxacKGQ==
X-Google-Smtp-Source: ABdhPJxScDGYPEmDYiM5yamnQzp2gNHds8Bx/c5Gek5dTBiQX9G0mypWb5dgmjeuRASPYFyvyYHTVvy9TMLX7T1Q3hU=
X-Received: by 2002:a17:907:9047:: with SMTP id
 az7mr6921732ejc.4.1622396021104; 
 Sun, 30 May 2021 10:33:41 -0700 (PDT)
MIME-Version: 1.0
References: <1622089478-5426-1-git-send-email-jasowang@redhat.com>
In-Reply-To: <1622089478-5426-1-git-send-email-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 30 May 2021 18:33:12 +0100
Message-ID: <CAFEAcA9YbJBqKMOzDyQoM3GXKbZ=jFOgN1gYPEA4maw4NSS=KA@mail.gmail.com>
Subject: Re: [PULL V2 0/3] Net patches
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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

On Thu, 27 May 2021 at 05:24, Jason Wang <jasowang@redhat.com> wrote:
>
> The following changes since commit d90f154867ec0ec22fd719164b88716e8fd48672:
>
>   Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.1-20210504' into staging (2021-05-05 20:29:14 +0100)
>
> are available in the git repository at:
>
>   https://github.com/jasowang/qemu.git tags/net-pull-request
>
> for you to fetch changes up to 4f8a39494aded9f2026a26b137378ea2ee3d5338:
>
>   tap-bsd: Remove special casing for older OpenBSD releases (2021-05-27 11:03:55 +0800)
>
> ----------------------------------------------------------------
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

