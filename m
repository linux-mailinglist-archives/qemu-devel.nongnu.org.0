Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD994C1C29
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 20:30:05 +0100 (CET)
Received: from localhost ([::1]:59912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMxKt-00075G-DP
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 14:30:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMxJZ-00066W-LQ
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 14:28:41 -0500
Received: from [2607:f8b0:4864:20::b2b] (port=34589
 helo=mail-yb1-xb2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMxJW-0005yH-1l
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 14:28:40 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id v186so50187620ybg.1
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 11:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GQRCu/J6VFf04KDh6uR9YcZj4zH+auOhoAGtMBrdPZw=;
 b=iyezxr9R9IFvovwuKDmK5Mi9SG6g+elGpP5tAWFVGQS6tFIbYH2t22e3WwUwU0MUj9
 b6jTotwrAD7a1canJ3LN41vZNB3/+2QAv8EVhCr7Y4iw7hg+VGEZ+XvoicejdzWWd7Up
 8rXrLtUcK52+20b30//uN4St9Ld4cXGynfMCTsnJvgWc4r7Lj2dsVQ26pW7yLiVrH2Q/
 ZCSO4Jf1rAYHwy6y7RDIFSu0uKA1doi3tp3BIH3dnYNWHpWUI2jwjez8ELUy17XtVk4t
 DeIPLxMZPvUpQLpkNab/G2zAu9fe7fe6JxzeXscbH9YogCc3TK17x3T/C1dr8baCHmma
 ETxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GQRCu/J6VFf04KDh6uR9YcZj4zH+auOhoAGtMBrdPZw=;
 b=vgnMlYADOeiahLWJ7XoUQz3f9H1bOfODfv6OqjzVdQLRhqHXhVLde85C3LW2Rjpv0Q
 0+h310mHiQAEHZSqOhIeoh8SCObULxNg/5bKPnaVwB7RG7YaKtATJeRWqdfVMg81azIP
 Xi5ll6B0okAJTsM6DbHEj8dEYZMdXHowfYK0C3zTUfN7tBDWvx7JosChXqCbKDyScqfj
 xLWkxIwPheJazhA2DiigfPPrsK/39tR1r4/r8xR4CP1FhTgRmVfCCIDwFyOUzP6FMT+w
 VI3ZAY8UDYVL576/OF/DF8uDdkDzVlgHf6cD3xH2RZlUCKHDTq2AonjoDOM4BpfGcA9S
 n4wg==
X-Gm-Message-State: AOAM5309HD4ZhgvFwKLCXYSG952/9oQYZ6aVZVSOEuCClvuzRd74ZOD/
 2TMVf/Iuvv55t0vvbhkmSgSclo5EjVhQGByBOeKX0w==
X-Google-Smtp-Source: ABdhPJyCtnNG/2yWH591ZkN+lf43OOsx24XWLprf0zXIrAY9cGfPT4qGLgOjRnwWfibeDIP2pJoiB6D8txB6VD+w/+Q=
X-Received: by 2002:a25:5011:0:b0:61d:853e:ef96 with SMTP id
 e17-20020a255011000000b0061d853eef96mr1134932ybb.288.1645644497190; Wed, 23
 Feb 2022 11:28:17 -0800 (PST)
MIME-Version: 1.0
References: <874k4xbqvp.fsf@linaro.org> <878ru2nacq.fsf@linaro.org>
 <YhURfqMvRT4xbiz6@redhat.com> <96bafa75-a0c6-f431-a6d8-fe98d438d0f9@gmail.com>
 <YhYVVnVSL8K1S4MC@redhat.com> <e9f70381-03f2-9582-8ad6-e9252d3195ab@gmail.com>
 <fb9999be-e1e2-8e8c-3c74-347c948635d6@redhat.com>
In-Reply-To: <fb9999be-e1e2-8e8c-3c74-347c948635d6@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 23 Feb 2022 19:28:06 +0000
Message-ID: <CAFEAcA-AvCDtM+evmTm5AsT-R2Hifc6-fPBWQ_vffOT7daBY_A@mail.gmail.com>
Subject: Re: Analysis of slow distro boots in check-avocado
 (BootLinuxAarch64.test_virt_tcg*)
To: Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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
Cc: Oleg Vasilev <me@svin.in>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Cleber Rosa <cleber@redhat.com>, Idan Horowitz <idan.horowitz@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Emilio Cota <cota@braap.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Feb 2022 at 16:38, Laszlo Ersek <lersek@redhat.com> wrote:
> BTW I still don't understand the problem with the DEBUG firmware builds;
> in the test suite, as many debug messages should be printed as possible,
> for helping with the analysis of any new issue that pops up. I've
> re-read Alex's message that I got first CC'd on, and I can't connect the
> dots, sorry.

As well as the performance question, these images aren't purely
used by the test suite -- we install them for end-users via
'make install'. If we want debug-images for use with the
test suite as well as generally usable ones, we should label
them appropriately and not install them.

-- PMM

