Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA9230B23C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 22:46:01 +0100 (CET)
Received: from localhost ([::1]:45848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6h1E-0008Vs-H4
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 16:46:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6gys-00081r-CP
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 16:43:34 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:33335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6gyn-0003A8-7N
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 16:43:34 -0500
Received: by mail-ej1-x632.google.com with SMTP id sa23so10424950ejb.0
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 13:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rx68+ZYeQz9pDVO2LbMZoCVmIjF5UusYd12xg5ecLXI=;
 b=cVdQm9LS0rwwAGCyuRRY1DDu/FeUiPU0at/+VkF4pkodKWqxxPHDCKkzRbdBjxpYaI
 wzZgrli4PEPGcn4kPs+N7qe5VaQnL+Y3Z6kza/Y+1GV32AbqD2E9oX4rB9JJjdlh3eqw
 Gg5/Iq1cD309bWnUY6y3JrVNoR8alPVJanj/TnYJhMru98ddgF+1RrA/t5C8/xN+Et7X
 LR5E27lZWuZ6yUmJ7sxalZC4rx2zNUfdBIsksKmo3xddnR40o/yRWp9Y1eMCsz+tp+ry
 E0vOya/kQDucMiDs94qRuscvXe+QpOYROCGMPEwnmiz690Z44cbu/7XjX4QJIXBceyod
 A6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rx68+ZYeQz9pDVO2LbMZoCVmIjF5UusYd12xg5ecLXI=;
 b=nqB+J7WPrwGgtvOJ1sNA+frujNSrhpsmTqDxmQKNqtpQFrBWpAcoiTLN2SbYh7hWEp
 QNCsssbRMwqyHKkFfAl1WbNS36sLCawjbgYFEjcAZL9t6xulTEx5BUhZJ9y11++dDDNo
 DriPZ0No4uWjGsJnPZWoeMfGNxsNt8DuRBeljVkXVIUBw9bc059MwegnFEUOWbdylp6r
 Bk/UICA4D6ta3xQyU0Y+yAym+0qtf+mm84YDdE7e/1KjJeo81oIkKqh8CykeFg28PMX5
 XOMBtHxnSbJhKgbHwfZwLCfUT5B+AKkuman9TI6y736rC4gMXOfdR0GiilgPebRz+a7m
 8lRg==
X-Gm-Message-State: AOAM533LbHbOZLXpbWjt9gu71GxuvzXl3tdoP1eOYINufiVoLLqM/j8k
 1IvFK0gAIAT+W8T2EMlag+FfCRGXEE1jibt5ZwAo2w==
X-Google-Smtp-Source: ABdhPJwRrl6hyKjwsGoi8Sqybsy+siAKXkDGhwKlHnGNTgvxSpBrx0tLxYUXmaptWQcOhC7veMK0HtiQjWGAPiXKL3w=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr20356586ejd.250.1612215807662; 
 Mon, 01 Feb 2021 13:43:27 -0800 (PST)
MIME-Version: 1.0
References: <20210129145240.34104-1-kwolf@redhat.com>
 <CAFEAcA_5ASnuNjWs8rdRid-VpjFaHX0Y_8cKFRY0ojJKLB7ryA@mail.gmail.com>
 <CAFEAcA9otR2QS7EvH6vjJb+sePyiQ2jpO8bGkL12sG6Vt_Gm5A@mail.gmail.com>
In-Reply-To: <CAFEAcA9otR2QS7EvH6vjJb+sePyiQ2jpO8bGkL12sG6Vt_Gm5A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Feb 2021 21:43:16 +0000
Message-ID: <CAFEAcA8fNJN6Rr7jDkHkJm2Jn8w_7UE77mzVF0H6H-ndGc-P8Q@mail.gmail.com>
Subject: Re: [PULL 0/2] block: Fix iotests to respect configured Python binary
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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

On Fri, 29 Jan 2021 at 17:22, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 29 Jan 2021 at 16:13, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Fri, 29 Jan 2021 at 14:52, Kevin Wolf <kwolf@redhat.com> wrote:
> > > ----------------------------------------------------------------
> > > Block layer patches:
> > >
> > > - Fix iotests to respect configured Python binary
> > >
> > > ----------------------------------------------------------------
> >
> > This is definitely better so I'm going to apply it, but it seems
> > to reveal a pile of iotest failures on FreeBSD:
>
> These seem to be intermittent -- a rerun was fine.

Intermittent, but not very intermittent -- I've just run about
three lots of the NetBSD vm test run in a row trying to get a
pass through, but something in iotests dies every time :-(

thanks
-- PMM

