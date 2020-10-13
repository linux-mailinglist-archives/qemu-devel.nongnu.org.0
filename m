Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34ED228D60B
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Oct 2020 22:55:25 +0200 (CEST)
Received: from localhost ([::1]:40810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSRKK-0002ri-80
	for lists+qemu-devel@lfdr.de; Tue, 13 Oct 2020 16:55:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kSRIf-00029v-0S
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 16:53:37 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:39436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kSRId-0003QR-Cp
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 16:53:36 -0400
Received: by mail-ed1-x542.google.com with SMTP id t21so891195eds.6
 for <qemu-devel@nongnu.org>; Tue, 13 Oct 2020 13:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8fOlUtz9FaxkVlqrhZUA5La74ITlYMmLTuUsvWkjkTI=;
 b=DIgC2fzdIzrioOhxAIvmbeiJLNYFX/pf1Ls+gQb9bElFJtfI9Vv1hqPFEkwuQ+dbtu
 gtxrAyY1ikjcVbcb9ZZRrr1W7I1bpvQgJvYfUHl9qJiouqb5JQYgdTR5GB32MD/J6kyc
 7dDFzozW1rfEFoTfieoL38L6WqUl+QzmcvVxEGiK4iJIQotH/lWVyO00ymo5KSVj1zoN
 JhJSZjYPe+YTuX2ktJsYZTV6earRigQeT21Cos5IzUwbmlNDWnsuLAS9pKemEKVHDAnx
 QKH4GAlEEAJfG4Kjr0R29C9AWJed69AkKeJKPcgnDQEwPdBRFoDIgQd/fNwUvvqmeGKY
 vBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8fOlUtz9FaxkVlqrhZUA5La74ITlYMmLTuUsvWkjkTI=;
 b=AUoln5viNdy/gjWPEG5a2JjC7EYHjG37nmSGwms4dKu0OAgz2/Q2mFHto23mMb531z
 2lbkWv0Li/yHnBwFFSnPmzKcwdnIzyVd7HEQhdzoZXcmU4zjEGmVWyCTkGH0SF7Aju0h
 myKHKxIdogJDUgnjVaFJoeB38V2pqV3ZtuzpCspQrJTLtr7pzSOGpdCtY76zFTBKQzzL
 MPnQHzn61Ra2Bfe7YnMUGkVw4iigpaaivby7fae4vN5iTbKIYcuoJlTTpUPpZRbOLEOo
 GZ4YUeogDPBBRgsPj8iFWwYX2A4c//ZMshjvhCKL5cNnBUTJeDeBYkt+xJ/JHMjHFDpU
 hT0A==
X-Gm-Message-State: AOAM532xsenM/6QNECg0GfGXZtV/4h5lN1GC1XLOWbleCTnxogmEFG5q
 O5vbA4hBz1OnoNGI1eZvFcdZvGfPQrEVUBeTHmDKKg==
X-Google-Smtp-Source: ABdhPJzIcqviF+JAHaT+HtMUrUwODLu4sQZ0BMhYnXONub2cz0aR7dSoGLOzi3g5FANiw8Gr1mGKhw9pf1QRqIKhVJk=
X-Received: by 2002:a50:9ea6:: with SMTP id a35mr1665980edf.52.1602622413204; 
 Tue, 13 Oct 2020 13:53:33 -0700 (PDT)
MIME-Version: 1.0
References: <a6600c8b-74d9-4c1a-73d9-6302461b7192@oracle.com>
In-Reply-To: <a6600c8b-74d9-4c1a-73d9-6302461b7192@oracle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Oct 2020 21:53:22 +0100
Message-ID: <CAFEAcA-At8-thXWBN-JanPhcgzCg==hhYWthGxOZF-82dMDCcA@mail.gmail.com>
Subject: Re: pvpanic mmio support
To: Mihai Carabas <mihai.carabas@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

On Tue, 13 Oct 2020 at 21:37, Mihai Carabas <mihai.carabas@oracle.com> wrote:
> Does anyone know if there is any progress with pvpanic patches that
> brings in mmio support [1]?

I don't think so. If I recall correctly there was quite a lot
of discussion on at least one version of that patchset, and it
was never clear to me at least that having an MMIO pvpanic device
was actually useful (as opposed to for instance having a PCI
device, or maybe a virtio backend, both of which have the
virtue of being (a) pluggable by the user and (b) autodetectable
by the guest).

> I see no activity since late 2018, but I do
> see support added to the kernel (also asking myself how this was tested):
>
> 46f934c misc/pvpanic: add support to get pvpanic device info FDT
> b1d9d6c dt-bindings: misc/pvpanic: add document for pvpanic-mmio
> 725eba2 misc/pvpanic: add MMIO support

That was probably tested with somebody's not-actually-in-QEMU
patchset. The documentation in the kernel's
Documentation/devicetree/bindings/misc/pvpanic-mmio.txt
is just wrong when it says
# QEMU's emulation / virtualization targets provide the following
# PVPANIC MMIO Configuration interface on the "virt" machine.

because we definitely do not.

thanks
-- PMM

