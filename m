Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 765A34DCE0F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 19:53:36 +0100 (CET)
Received: from localhost ([::1]:46436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUvFf-00058E-Jd
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 14:53:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUuzS-0001tS-7M
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 14:36:53 -0400
Received: from [2607:f8b0:4864:20::1135] (port=36433
 helo=mail-yw1-x1135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUuzQ-0007wx-Ja
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 14:36:49 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2e5a8a8c1cdso59749997b3.3
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 11:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3LpDDJSMNP5BCavZwSFmvd7EShKZzKjWRMg0o2kCOBg=;
 b=v1PG99Wl2PuF71uuYw05DUSDeL+S7TDPEDPPqDn6ANIBNnKtbu0kZ0DUwPS6PFJ76Y
 VhwWo+cNEGImCqJMmDDcgF5QKAVEitgYhl+ZcwtLZb93Sh0eWry5aeSVycI0OL7WdbaY
 eF0Lr0K9Kt6Oy4eHrd4bczluNoQDh7MljIh54Z6RlW26VQ/iggcJGMuiwHHBx0wwIK5T
 6I4/UfJoFhzxlR9+JQF5dlZzw5VbSP0/8n5pKGlsqHmstP2zV38dFD0ndxg+AwGOFhSt
 x1sg5UV1j/Trh+FMh8fhdI6xBAscOtTwOkEl4rweN72IXWnd3WXkz1yakACe8LTkYqnu
 D6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3LpDDJSMNP5BCavZwSFmvd7EShKZzKjWRMg0o2kCOBg=;
 b=CwqJPhIcrrS8R+2C3yO7clhxOzE7RCyTBzYzMjnDuWi1d3fPYwlaQeaSNnY8CdfSp7
 95khEjxcqAHlUl7SkYoNOUc7zvoD6UJoPzZN8UkWny57qthUtq8l7aBWcOkWF61Ymnp2
 H8sdFjY+Ar4GGb77XL+u9Jxqi/uzcEhKEyhddImwTpF/kjfk+1SFJhM3vOEjjSL8trSo
 hu3E5ZiDIZfpCKg4Zp/YN6xYCo3X9/cPUv/287z9hcWeKePcF3WgSRlBEujtmPYFL7bN
 It//U+orgfEZbFuc+zZewca7c5+HtKJ+CC/QgGJZo0zOb2OL77A8kGB73/qpqT3mbY9c
 GLWQ==
X-Gm-Message-State: AOAM530V6atcJFjP/0dGM3KEmBoYLIekwAdejLagTggp7vXRFg9nssu9
 I1zJ3xiBEuJZ3mBz5jZIS9a4gVRQ+yntA/G4XpBWDQ==
X-Google-Smtp-Source: ABdhPJw1UlTDAPIxJUK0vbAQfZmMEPcgld8MFV6sizhq3V7lcT53npPouFKyi2y16Pb3b1sCukhpR+ABzW8ZYiXhjWQ=
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr6945799ywh.329.1647542207523; Thu, 17
 Mar 2022 11:36:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220317165743.238662-1-stefanha@redhat.com>
In-Reply-To: <20220317165743.238662-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Mar 2022 18:36:36 +0000
Message-ID: <CAFEAcA97E1F0MgYPgZgUUegzDMpL9wNa9fzkGKE8_A-fUmbzyA@mail.gmail.com>
Subject: Re: [PULL for-7.0 0/2] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1135
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Mar 2022 at 16:57, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The following changes since commit 1d60bb4b14601e38ed17384277aa4c30c57925d3:
>
>   Merge tag 'pull-request-2022-03-15v2' of https://gitlab.com/thuth/qemu into staging (2022-03-16 10:43:58 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stefanha/qemu.git tags/block-pull-request
>
> for you to fetch changes up to fc8796465c6cd4091efe6a2f8b353f07324f49c7:
>
>   aio-posix: fix spurious ->poll_ready() callbacks in main loop (2022-03-17 11:23:18 +0000)
>
> ----------------------------------------------------------------
> Pull request
>
> Bug fixes for 7.0.

msys2-32bit CI job fails on test-aio:

| 14/85 ERROR:../tests/unit/test-aio.c:501:test_timer_schedule:
assertion failed: (aio_poll(ctx, true)) ERROR
14/85 qemu:unit / test-aio ERROR 2.40s (exit status 2147483651 or
signal 2147483523 SIGinvalid)

https://gitlab.com/qemu-project/qemu/-/jobs/2217696361

-- PMM

