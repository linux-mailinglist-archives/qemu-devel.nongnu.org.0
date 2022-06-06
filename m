Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A7353E409
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 12:16:57 +0200 (CEST)
Received: from localhost ([::1]:33574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ny9n6-0001y5-2G
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 06:16:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ny9c1-0006Ex-0V
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 06:05:37 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:39510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ny9bm-0002FM-U9
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 06:05:16 -0400
Received: by mail-yb1-xb29.google.com with SMTP id f34so24768453ybj.6
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 03:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AgnpbB3uaCK9ZoYnv0dBLc6i1r4aYAr3ASAqi88cT5o=;
 b=FpLu/WhRvhcqlN93cUNcwGvNC3m7zO5B7mEPwJI+0KsqWM35r3h/LquLIL/rhmai3l
 /tZzlKIwoPmRh7YtQ7I7SPse0NAPrZnpCqS+2+jipj4BpotXwXvXoWAAIZ3JKmPf3+e/
 fSInGUpRDdRTdgeVhz9grkP0lAZTMahCvN9YCJrLFIl5dc71HWb2rQpZFV3jy9pBSRSB
 pm9QkUfKnLZyUACwjQULUGBjZOsHDuTykmVWw/3hIqLbEXPMtKGMs4ZcDwKunsj42Sc9
 K39LInl2m2rC7h83ukpRcxyQYXZmIFLq3gMaTo4PvKvt5enB/mPSKOv/i1YQ5oJBZZFW
 JHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AgnpbB3uaCK9ZoYnv0dBLc6i1r4aYAr3ASAqi88cT5o=;
 b=WM65MdXvQSTuo4f8VZIqntlQsqznpvPF38ifhYubc6lhzD9uZBkAby3elaCUohYYSg
 0Dbf+iYUoqgJ3jS4u/lNrxLyFwjjA3X4E86M3FayiWOrPpUJy97kYvmk6t3qFvUUSCZf
 ZHAnDGCZ7QF9h3lfusVgj3dpGUsqWwqCpyjtcLaAZH19FQDa71O3aEs0qMQThBoBwTF1
 jBtK5+Z+4J/XGyE7npKEGx5i71nkinjW6Mqi8crn6OweyJcXkaeClhQLX9O+vxA60ump
 C6+07lngihf1aGrnvlxWzhTe0wApwpxl4dpoUF3uqwvc6lb6NjeOI/TD6j+MARzuHBvL
 +lMA==
X-Gm-Message-State: AOAM532TYgBVOd6eI9E7ov9TjVLIMfQvX1AYuS81CtVNqVC2BmDyCHFv
 68EOrXjYHcYuSzVpupfOtl+A65unlQoQjgU9vJUp5AgpUi4=
X-Google-Smtp-Source: ABdhPJxw7GfDa9Eh3KNL6BAx8yHUAkGyfwTfoUBY6WNH4d503/Fym+/3IYkBIhXMrgaoxhm1VRWJrXrsf7IWBS956+4=
X-Received: by 2002:a05:6902:728:b0:663:5591:aa2c with SMTP id
 l8-20020a056902072800b006635591aa2cmr9108690ybt.288.1654509900842; Mon, 06
 Jun 2022 03:05:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220505095015.2714666-1-peter.maydell@linaro.org>
 <CAFEAcA9khsVoAi9TB=wFNB-pkEiGXfghvpBr6WKQd5zyCNLTGA@mail.gmail.com>
In-Reply-To: <CAFEAcA9khsVoAi9TB=wFNB-pkEiGXfghvpBr6WKQd5zyCNLTGA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2022 11:04:50 +0100
Message-ID: <CAFEAcA_M7ZXYG4g3wubY79BQ8gN2_cFVBgcJzRJy-kaQhaD6+A@mail.gmail.com>
Subject: Re: [PATCH v2] Fix 'writeable' typos
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 23 May 2022 at 15:42, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Ping for qemu-trivial? Or I can take it through the arm queue
> if you prefer.

I'll take this via the arm queue, then.

thanks
-- PMM

