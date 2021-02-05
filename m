Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 471D831110A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 20:24:47 +0100 (CET)
Received: from localhost ([::1]:47458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l86ik-0004kH-BO
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 14:24:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l86hc-0004J2-HJ
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 14:23:37 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:43085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l86ha-0006HA-TC
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 14:23:36 -0500
Received: by mail-ed1-x532.google.com with SMTP id s26so4358594edt.10
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 11:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aFI+oNvXSNhadjapmvD71GsKfrGkPPUyizZJTEc2/3o=;
 b=kQeCqfNSctfVlwkpGPk0/l5mOY8uDHwO/0TEoKLJHxY9vHl756yTXUpgUTzOo4V8ZB
 6vfNG6/hVUyp6EG59rTUSNBu8X2UMog5iTbk0IXkS/Z+FuN0TrNCQtGA+cHz42jM/lkH
 eYzVYfkj0qqEI7yzM8cpX4s7XUoK20Q6eq5KL4z1jtF8y5eWU2WNRkhtFJn0qqbu8FAV
 VTUghipDW4mMauj5Grhn8Rf/C5DTPILYit+QlLOSeD42HruznfSnnph5qdITHdcgp3Bk
 22fnn3Sx6lCddruaVRb4KN0zEag8jqTCECizQlmruSSGyhc3xytZnO8mFdw5qkR3ef5Z
 /qFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aFI+oNvXSNhadjapmvD71GsKfrGkPPUyizZJTEc2/3o=;
 b=Cwa70KkobDxi9rKGSTEM5DFfbgD+sMYKoMqKJSVw6U7ftZuMcqln0DoBt7Li/Dq+hF
 g1N19SNuSAXIo7l+4vyWveVv/p7XRoJL0DyM/M7NmKZzJmaW8UCt0ZezREINiNP4b2eQ
 xiIsTeWqW3rI9GCmiX2fDkDBqQWhHfiU/2U7QNFeggbAZsFq6+Dwt4r7VCNepciOznwd
 JERAFi0s91IBUJFDGQgX25XtRpISqrNiMG7hDkZX6cz245O/JM5u9As6u13fgnHxz8bV
 VOYHW7W4XwJavZe2N2zbpWrsVEwC4CqHt3MymDK7U3RDpYybGQ3TkkJfhhuzBFrGSKz3
 lMRQ==
X-Gm-Message-State: AOAM533KbCUU1Sxs8rvhUgzfM6kmrvZTzUR/oy9tS6sKn+UpPnoOnvjU
 4LTsrmw2n9gKIwKfo5incCit05Vn9IQXHcNYGTEQ7aONO7g=
X-Google-Smtp-Source: ABdhPJzIlo8qX7xe9b4GE+EXiCU+5vA2Iv44d09N+ykKuqP/5C01xO2IELv5C0g4IFwIoUeNVpUoVl66wpO25aRthcA=
X-Received: by 2002:a50:9e01:: with SMTP id z1mr3575548ede.44.1612553013687;
 Fri, 05 Feb 2021 11:23:33 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA8z=vQ9E6hNKUuzk2EgH8Dpkxo=3YbnQ5iX0DYCQDr6bg@mail.gmail.com>
In-Reply-To: <CAFEAcA8z=vQ9E6hNKUuzk2EgH8Dpkxo=3YbnQ5iX0DYCQDr6bg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Feb 2021 19:23:22 +0000
Message-ID: <CAFEAcA_S81bnYVcNENW9bFApAc-Ob1uKQncsGPmyFD034p2FOA@mail.gmail.com>
Subject: Re: runaway avocado
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 26 Oct 2020 at 22:35, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> So, I somehow ended up with this process still running on my
> local machine after a (probably failed) 'make check-acceptance':
>
> petmay01 13710 99.7  3.7 2313448 1235780 pts/16 Sl  16:10 378:00
> ./qemu-system-aarch64 -display none -vga none -chardev
> socket,id=mon,path=/var/tmp/tmp5szft2yi/qemu-13290-monitor.sock -mon
> chardev=mon,mode=control -machine virt -chardev
> socket,id=console,path=/var/tmp/tmp5szft2yi/qemu-13290-console.sock,server,nowait
> -serial chardev:console -icount
> shift=7,rr=record,rrfile=/var/tmp/avocado_iv8dehpo/avocado_job_w9efukj5/32-tests_acceptance_reverse_debugging.py_ReverseDebugging_AArch64.test_aarch64_virt/replay.bin,rrsnapshot=init
> -net none -drive
> file=/var/tmp/avocado_iv8dehpo/avocado_job_w9efukj5/32-tests_acceptance_reverse_debugging.py_ReverseDebugging_AArch64.test_aarch64_virt/disk.qcow2,if=none
> -kernel /home/petmay01/avocado/data/cache/by_location/a00ac4ae676ef0322126abd2f7d38f50cc9cbc95/vmlinuz
> -cpu cortex-a53
>
> and it was continuing to log to a deleted file
> /var/tmp/avocado_iv8dehpo/avocado_job_w9efukj5/32-tests_acceptance_reverse_debugging.py_ReverseDebugging_AArch64.test_aarch64_virt/replay.bin
>
> which was steadily eating my disk space and got up to nearly 100GB
> in used disk (invisible to du, of course, since it was an unlinked
> file) before I finally figured out what was going on and killed it
> about six hours later...

Just got hit by this test framework bug again :-( Same thing,
runaway avacado record-and-replay test ate all my disk space.

-- PMM

