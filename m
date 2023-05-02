Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EE16F416B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 12:23:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptn9g-0008Qf-OQ; Tue, 02 May 2023 06:22:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptn9f-0008PX-4F
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:22:43 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptn9d-0002ex-CX
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:22:42 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-50bd2d7ba74so4260740a12.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 03:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683022959; x=1685614959;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wROztpAR5kVw2WNQ6v2T+CLkXs+5ZH3oTikkmtqGwT0=;
 b=l06RT0eXBRvWmB7Im4yNj032Vb/qTVy0x0ka/xfP7TMU4CDtkkH9spekvqDPGqO+hA
 GsR9KNBhg6NVYSNxp6FE6HfePeRdNWZxX3dl0ueOE4zjffrdl2vULgkGv7+cLYs9nH5I
 Ta9VblSTTsBmV+F2lsKI9iJSMOPYdkWcdAUio5hqGg245ZVZWkTz2QZ64dF0DFGkxCuT
 By+FTB4PicZ6NKY2gQgGf+SQNUABu7nLrFgJ7gOBJu/yL7/VMTO69smoTwflhvHenlzm
 uFCAQlPzDwzKIRZD5OW5RqwIZnv0jIhDSYpHTPQP3wM6YNHZwoLrEV6+YvZ2lUzRK6d8
 S86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683022959; x=1685614959;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wROztpAR5kVw2WNQ6v2T+CLkXs+5ZH3oTikkmtqGwT0=;
 b=PA6tHfrk/x+Jtx6woNZhk4KUMaXymeKV1HxoojwE9WnOgu6hcujy1JAQec070FWcXE
 i81/W8jcjn8SlS7g2Ht5WKvI/iKe7J+4+FyWD22KO0uu/kCdO4BadSta79ZGz+UVcy6R
 edOeC5lNCdHbKFyh+jHNym8gSVyg+V6XVujxVlwIA01vq7qLTaBgCmyFYN5xJtsSrqSG
 L+H+V0v6rg/on5rk+oirwHieLf/fYm2WdsOiGX2Rlb6sXVdO3UALzrhFlLGIK9YEA8IE
 +Vj5vtz4CqGejaoEkSrO4XtcUR0XQUkZyBUI5s/aQosdoH20QHoqEF6ailLW2e9zY2iw
 9ziA==
X-Gm-Message-State: AC+VfDzSBKtwDbkSFV1mxLaZi1fk9Swyo7RDVD36UgqS58+qcPSPUzsD
 jy2gS9jcHWW+cbY9n3AjbgJnxdQserClDBau9/PZq4oVN0rcvQmR
X-Google-Smtp-Source: ACHHUZ61Ti/sNiocmUKN7RcE6iqdDKLvyQFEP7AE2gHPog5VH8+sa3v/Rg8tIPC1Xd8Qu7BeRpUICeQ0dB1QJ6R4sw4=
X-Received: by 2002:a05:6402:1e90:b0:4ea:a9b0:a518 with SMTP id
 f16-20020a0564021e9000b004eaa9b0a518mr9027522edf.17.1683022959294; Tue, 02
 May 2023 03:22:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230417164041.684562-1-peter.maydell@linaro.org>
In-Reply-To: <20230417164041.684562-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 May 2023 11:22:28 +0100
Message-ID: <CAFEAcA-gWH62VjOsQ1LJnLBZ7d94u1R78ESdGvF+jukRQvoY8g@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] Deprecate/rename singlestep command line option, 
 monitor interfaces
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, 
 Kyle Evans <kevans@freebsd.org>, libvir-list@redhat.com, 
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 17 Apr 2023 at 17:40, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The command line option '-singlestep' and its HMP equivalent
> the 'singlestep' command are very confusingly named, because
> they have nothing to do with single-stepping the guest (either
> via the gdb stub or by emulation of guest CPU architectural
> debug facilities). What they actually do is put TCG into a
> mode where it puts only one guest instruction into each
> translation block. This is useful for some circumstances
> such as when you want the -d debug logging to be easier to
> interpret, or if you have a finicky guest binary that wants
> to see interrupts delivered at something other than the end
> of a basic block.

I'm going to take this series via target-arm.next since
I'm doing a pullreq anyway.

thanks
-- PMM

