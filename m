Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A742452ED06
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 15:24:16 +0200 (CEST)
Received: from localhost ([::1]:50110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns2c3-0004Z8-84
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 09:24:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ns2ZZ-0003HV-27
 for qemu-devel@nongnu.org; Fri, 20 May 2022 09:21:41 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:38736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ns2ZX-00036R-5x
 for qemu-devel@nongnu.org; Fri, 20 May 2022 09:21:40 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2ff7b90e635so21172527b3.5
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 06:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dxMBDFxHItrIvDbKJ0NI6N+sPnrqxbEXdZU1VDUu3wg=;
 b=v5Df1ioqbbwmGWURadEzE6H91hMfNr2bYCLKEYY6vkm6DpgPudxQ+C8FvVmVAN7TWx
 ugVrlCuMeQqHKBxWFessZv7f9Hjk20cAF96xCr88fW6Uo+1fmwv7twYtBTKEs+8AKO5U
 Ba6puE1faIhYwdC1TfrFgV9HJfFJkKI5iff3yIf7TTKn5YtRscqrEFsUb/9b+39UgLWR
 0xQ+Y6uyHXUPOBtOUG90OLOo0cHdQEWSOmh/QfLLONGODT0N2J/UmXf+qV/7OX2kbbaA
 yFq5EhrXAGNevQxhPhPkYchkv28WClndkG2mDIHym461wH4qt52Zxgohqv4n7C0rAMS3
 8XqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dxMBDFxHItrIvDbKJ0NI6N+sPnrqxbEXdZU1VDUu3wg=;
 b=zuZk8yZabcPzt6j+UR/1M56cTR4yhcdptUFOTGj6o9CdUZMuTUInALn7lqFIbbKlug
 ga5RTHhqWuZFeAHHEaxYshWqS9oI94T9p/M7D55zGjpmMzhPWw9T+T8Frqv5RijTxoyZ
 rEBXHE5yYlUjogtvyr+PfkRBB1i0mMhg12BNBvoGwxGDlUnqH5pGXDBssFj280qZHbT+
 Q/wTf0HfLMtpdvlo/aHCflh5BtQdS+XKpSZBHdpZDIYbly812wC02BYK+gU0yu/kN0H+
 IPAAKYzuipMwP9W/wCR/6kDehJ6cXpVadvIXgnhbnN1RubRwdd0TYViU7b3Y701N3xYA
 qSEQ==
X-Gm-Message-State: AOAM531DDjGFKDDunj6OeJGV/0g/4496AvCpc5PGpy29ySLAxAIqZzrR
 vj1a1scu48laqRIiT7vjsANeQCwbI5vd5SKWhdx3Nw==
X-Google-Smtp-Source: ABdhPJzzbvfXX//3x285Ut27VHGjN54DdqFw9QbsFLfIWOGHo7XC4JVjvV5JvSxsbRlSMG9g3qhkTR88Hw3MkQ6w3Ns=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr10248231ywf.347.1653052897739; Fri, 20
 May 2022 06:21:37 -0700 (PDT)
MIME-Version: 1.0
References: <SN6PR02MB4205DA19E31A951F2B5A6C42B8D39@SN6PR02MB4205.namprd02.prod.outlook.com>
In-Reply-To: <SN6PR02MB4205DA19E31A951F2B5A6C42B8D39@SN6PR02MB4205.namprd02.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 May 2022 14:21:26 +0100
Message-ID: <CAFEAcA8n5r4LP-9gu+v+zgALG=Svx65xJWEqGvx1ba9JmMEpfQ@mail.gmail.com>
Subject: Re: [PATCH] tests: Remove unused "wcount" from linux-test.c
To: Brian Cain <bcain@quicinc.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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

On Fri, 20 May 2022 at 14:16, Brian Cain <bcain@quicinc.com> wrote:
>
> clang reports this variable as 'set but not used'.
>
> Signed-off-by: Brian Cain <bcain@quicinc.com>
> ---
>  tests/tcg/multiarch/linux/linux-test.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/tests/tcg/multiarch/linux/linux-test.c b/tests/tcg/multiarch/linux/linux-test.c
> index 019d8175ca..d5781bb476 100644
> --- a/tests/tcg/multiarch/linux/linux-test.c
> +++ b/tests/tcg/multiarch/linux/linux-test.c
> @@ -332,12 +332,11 @@ static void test_pipe(void)
>      fd_set rfds, wfds;
>      int fds[2], fd_max, ret;
>      uint8_t ch;
> -    int wcount, rcount;
> +    int rcount;
>
>      chk_error(pipe(fds));
>      chk_error(fcntl(fds[0], F_SETFL, O_NONBLOCK));
>      chk_error(fcntl(fds[1], F_SETFL, O_NONBLOCK));
> -    wcount = 0;
>      rcount = 0;
>      for(;;) {
>          FD_ZERO(&rfds);
> @@ -360,7 +359,6 @@ static void test_pipe(void)
>              if (FD_ISSET(fds[1], &wfds)) {
>                  ch = 'a';
>                  chk_error(write(fds[1], &ch, 1));
> -                wcount++;
>              }
>          }
>      }

Another 'count' related oddity in this test code:

                if (rcount >= WCOUNT_MAX)
                    break;
why do we compare _r_count against _W_COUNT_MAX ?

-- PMM

