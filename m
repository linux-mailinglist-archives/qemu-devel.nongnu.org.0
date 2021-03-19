Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CD5341ED9
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 14:54:22 +0100 (CET)
Received: from localhost ([::1]:53096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNFZw-00014d-5b
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 09:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lNFUG-0003W2-7h
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:48:24 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:38615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lNFUE-0007TI-D9
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:48:23 -0400
Received: by mail-ej1-x62f.google.com with SMTP id r12so9821584ejr.5
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 06:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RC+zG+DZOHhRkxcVE0T1norqg7oWOjtzJGEbuShqQWc=;
 b=RYFKVEDTdLvNojgf0QRmeW+/StmWbvMKURAfRirARQGG/RCViq0aNNIEg+yUpUMxCb
 gYBfI32n89zm8QTlxAPQ5K+0Y9ctpZ1Sfkua5m7vnhAzCICd34eRuS9TQ+3I3Kvi6NXv
 twH6vEVqXVwlNy672wgohlxv5Mx9iK1gJGwHXq+dptq6eYOQ3qU4+Ekgf644cKig8FAr
 NpPv/k2OnkdeRXQx3ew8MsGHTO6qhb8vkaETAgBz0T0xWkyJFlpO7POcVGSJq2J22Z08
 1Zf7/PdN0IFngDyedhlZNpZBJPcrBEPSZv8E2mmTRrAAOfqbSgziFCZetW2TPEaJhxZ+
 A2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RC+zG+DZOHhRkxcVE0T1norqg7oWOjtzJGEbuShqQWc=;
 b=q+JKCZRX9nNy8WNnuWgVfA0/iSfJa9x3XQlXQVYYvJNoaloHoCTySu6VTQkT3jO1vG
 rdtbtR03NHmwAflIgITXJTcMeRueuihK18EY4urNdu39vPwe63vnGtHUwQCGLtegjxyV
 ccRZqEz4A98ZXfsB96pBHyoaJbP8MC3z5YcA+84D4riOUdKvQZhz7fKvqdavo0fTNrpG
 E9h4kZ0jDwL9d0o/k0xuW53jjTz0YJB3HVTZghHvEzZR1z0/b3sCKnMlzaDnNZASso0X
 sYJ5mBAhun5s6WvVL3UkehsD0QEevxwDun72U4pinxOnWoxGZV3AEra8pI0TcAA5IkYw
 yAGw==
X-Gm-Message-State: AOAM530fLvnd7s5jnSLkHcUs+0cfARmgTem/MljaCdbd3m+VEh63Uzd2
 A0G00AzeboagXuupQ4AYFs0lOatKEgprv9ym8plziA==
X-Google-Smtp-Source: ABdhPJyINOVLjJkkiAZHMFnu85tkdqaB/wW4rt35Zka/91XLfoJB9n9HyI3mIn0rl/phIxpxVsKP2R045LqigD8HkfQ=
X-Received: by 2002:a17:906:1ecc:: with SMTP id
 m12mr4424776ejj.4.1616161700360; 
 Fri, 19 Mar 2021 06:48:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210319115823.1762787-1-armbru@redhat.com>
In-Reply-To: <20210319115823.1762787-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Mar 2021 13:47:55 +0000
Message-ID: <CAFEAcA9V0g3z0NW3L9PW+x-gag+W5cKEj7XbOsZUJfUjB4346Q@mail.gmail.com>
Subject: Re: [PULL v3 00/11] QAPI patches patches for 2021-03-16
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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

On Fri, 19 Mar 2021 at 11:58, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit cf6b56d4f2107259f52413f979a1d474dad0c1e1:
>
>   Merge remote-tracking branch 'remotes/philmd/tags/pflash-20210318' into staging (2021-03-18 23:04:41 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-03-16-v3
>
> for you to fetch changes up to 64e9c1e5bc73192bbf740db40c5b2c3764dcaf05:
>
>   qapi: New -compat deprecated-input=crash (2021-03-19 11:36:52 +0100)
>
> ----------------------------------------------------------------
> QAPI patches patches for 2021-03-16
>
Conflict in storage-daemon/qemu-storage-daemon.c. I had a go at fixing
this one up, but obviously wrongly since my attempt didn't compile.
Can you rebase and resend, please?

thanks
-- PMM

