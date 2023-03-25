Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F28BB6C8F71
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Mar 2023 17:30:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pg6ld-0006MX-7m; Sat, 25 Mar 2023 12:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pg6la-0006MM-Jr
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 12:29:18 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pg6lY-0005Fu-UW
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 12:29:18 -0400
Received: by mail-ed1-x531.google.com with SMTP id x3so19468564edb.10
 for <qemu-devel@nongnu.org>; Sat, 25 Mar 2023 09:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679761755;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=U4ifqdOclajdyXSr4AOmk8DMNyM7gC/GkAFa5BfoknE=;
 b=veZxXtbBQRCqdSWNTJN+NQnyml3+ts7R2E0h/XPCM9bZafcRyPm3pkkLCR7odtyvFg
 c0UbHi6Kll0U7r+qq3EKY4smy+G1KxsXMA0nJHnFXcvDL/LOHFASoMmGXOilrzm3d3oH
 r3JxIWFmy4MRxGmMs/C85uRt9amT2a/VT28hf4A7KiCTi3JnMZHTbcjUyAJIqiHPVC3T
 gppUEw3L+WZPL8ZskkcqlJODB119JsMFLONCFQJnJGo2zS3eHPFmj/T91L3qjQTYEg4F
 KniJrRWi3woJJSt2JdCYGi5vydZylcRxzQXjyiAN9t0KfN3kmlz558vZivR+IaxkLCsH
 ssYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679761755;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U4ifqdOclajdyXSr4AOmk8DMNyM7gC/GkAFa5BfoknE=;
 b=gecZ/OAEZHeeSu2/gWP3sVDyYXYEbhpG7SuG/JlV9cw1jf27C/w70KbybwRLHk6irO
 kAoASFjbSyTTraroUSinoyYPqYuwnOzExswWR08W5iyPfCnkOYbzfX6tb/aHqQXGKZ4v
 puE+uMoqYZ3NSQ+lwsvA7E64RgpLz7vtNVCSid+0b0Xtsb0uFIUvvlggW3qcnWPpRAYy
 jdsf2q8Tmht8UBZEC7y6zKoi8bgrzwurovoq2VIno//ST/z5F+fKMCBqKp5Mfy/T+d1o
 F4vue2dHf6shVa6OpWEkv8GPQUa+IUvcyz8aUyTfQV8PBaIqfdf6X2adgSqWMOKphUx3
 9IyA==
X-Gm-Message-State: AAQBX9cEWGbIV0CgJ1W/317LmtbOyMM0RIRUY3sQBOGkj2p3ERqYAcjx
 0nWVM0zCkcVUEZX+90GWe5bNMEQu7qA9KthNTR+W+w==
X-Google-Smtp-Source: AKy350YfnVoNixMSQADXydYlKp3N08iwf+XLJRNTrVAekFveh2iuHJqiuRb3yz0zfZbABi7Y6dcEF0kEDLwj3MF+ChY=
X-Received: by 2002:a50:d517:0:b0:4fb:7e7a:ebf1 with SMTP id
 u23-20020a50d517000000b004fb7e7aebf1mr3123911edi.6.1679761755470; Sat, 25 Mar
 2023 09:29:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230324153610.224673-1-thuth@redhat.com>
In-Reply-To: <20230324153610.224673-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 25 Mar 2023 16:29:04 +0000
Message-ID: <CAFEAcA8U4qyoLZBA1ebM3R+tLf2fXKfiMxgfrYO9R1ZA0Nu2CA@mail.gmail.com>
Subject: Re: [PULL 0/8] Misc patches for QEMU 8.0-rc2
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, 24 Mar 2023 at 15:36, Thomas Huth <thuth@redhat.com> wrote:
>
> The following changes since commit 60ca584b8af0de525656f959991a440f8c191f12:
>
>   Merge tag 'pull-for-8.0-220323-1' of https://gitlab.com/stsquad/qemu into staging (2023-03-22 17:58:12 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/thuth/qemu.git tags/pull-request-2023-03-24
>
> for you to fetch changes up to 8635a3a153da3a6712c4ee249c2bf3513cbfdbf7:
>
>   Revert "docs/about/deprecated: Deprecate 32-bit arm hosts for system emulation" (2023-03-24 12:10:49 +0100)
>
> ----------------------------------------------------------------
> * Remove TABs in hw/ide and hw/block
> * Two fixes for GCC 13
> * MSYS2 CI job improvements
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

