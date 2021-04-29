Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB35036E8BF
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 12:28:42 +0200 (CEST)
Received: from localhost ([::1]:47330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc3uU-0004hi-0W
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 06:28:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lc3sp-0003Lm-A8
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 06:26:59 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:40863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lc3sn-0001z3-F1
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 06:26:58 -0400
Received: by mail-ed1-x534.google.com with SMTP id c22so14266893edn.7
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 03:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=weDF1A8SGlTybcc3s+87vTGpHZg7m650Ts73PE0uym4=;
 b=TFqudgFKaAWGnbP3/FTEXUxwMoOAnLZpRVQNrWgGPnW0Jtva6O4PTXaJ0WyjqKq+Mt
 IdW6XOXWYFDgyk5Celhv31W2y7IEFf48DJNgGB2eiQz8jSFi02TA8B/hbowp0mgnYE4w
 /XUELO6y+f73IcBYA241kxXTje71VEsIHcbJyKBuX6WTi2qItWL0lJD+LxV7v5ET4lq9
 XkU4n0AHQeZiU9DYomDWHy+553hzgUMebFwnTnR3C2oUywx/EMiJAsZVmC+XQ2yXKom6
 WtOKjzemfbmRIqG6zJ01H2nN4KB/kUW8s+bGiFXGlfTwX4DMf6bUrykTA7ZpdX4JVXzu
 SJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=weDF1A8SGlTybcc3s+87vTGpHZg7m650Ts73PE0uym4=;
 b=DOnNsFSqK1WOsm9+UszYrxPCtAA74xSV8ktThYfSfvUL8SVr67tueIwArEyTJMMbmX
 jIYbh+pPN5jfg2670+nCFEh+blsZyWU5gM07LUaoZsCuuzZYQBQmIdFkL8py/C/sP4h8
 xq5TAgU6lew6YibwKf6mdiSWe2oAxrEzgMJjawz8aYCpCry+CI1rELrsXT1SHPd0VQW8
 AL6lv5/L1Uq0UJ0XWrog7d67/RHHzvuRfSmDPGkyC9MBV91Q6qv9mi5Tf50xhKu/Amp9
 KKUrsiLw3dCbISsDDtuzgmeGSsFZ2CZeC1HgDHqkBCwWt7++VrtRGbIfNJQ5iBRmo4Yb
 /CRg==
X-Gm-Message-State: AOAM532f3+NuJI2vjIMXsBi1jeN5wQFhL01iVpw1uoox5uERQi0bQqfe
 EUCfjDalVjSKUcEjGbfOA1+zCnkrHyIr1A3XMy6X0g==
X-Google-Smtp-Source: ABdhPJwhyUvEDMXr7Z0GxgOillP9C70ocC4R/U9zFJWCAZ8IN8CXG/p5FFnyUMTyOkqaAZTlaXlRwTS7pCQM4PhTito=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr17155623edt.36.1619692015252; 
 Thu, 29 Apr 2021 03:26:55 -0700 (PDT)
MIME-Version: 1.0
References: <87y2d1csxe.fsf@dusky.pond.sub.org>
In-Reply-To: <87y2d1csxe.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Apr 2021 11:25:54 +0100
Message-ID: <CAFEAcA8_vU_zbFE8CNsW2Stpz_C=6f=hUO0A3iaSvGW46CLL9A@mail.gmail.com>
Subject: Re: Let's remove some deprecated stuff
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?S8WRdsOhZ8OzLCBab2x0w6Fu?= <dirty.ice.hu@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 29 Apr 2021 at 11:02, Markus Armbruster <armbru@redhat.com> wrote:
>
> If you're cc'ed, you added a section to docs/system/deprecated.rst that
> is old enough to permit removal.  This is *not* a demand to remove, it's
> a polite request to consider whether the time for removal has come.
> Extra points for telling us in a reply.  "We should remove, but I can't
> do it myself right now" is a valid answer.  Let's review the file:

> I'm not sure there's anything to remove here, but anyway, Peter Maydell:

This isn't one of mine -- I just show up in git blame because this
section predates the conversion from texi to rst. It was originally
added by Eduardo (cc'd) in commit aa5b9692871.

>     Runnability guarantee of CPU models (since 4.1.0)
>     '''''''''''''''''''''''''''''''''''''''''''''''''
>
>     Previous versions of QEMU never changed existing CPU models in
>     ways that introduced additional host software or hardware
>     requirements to the VM.  This allowed management software to
>     safely change the machine type of an existing VM without
>     introducing new requirements ("runnability guarantee").  This
>     prevented CPU models from being updated to include CPU
>     vulnerability mitigations, leaving guests vulnerable in the
>     default configuration.
>
>     The CPU model runnability guarantee won't apply anymore to
>     existing CPU models.  Management software that needs runnability
>     guarantees must resolve the CPU model aliases using the
>     ``alias-of`` field returned by the ``query-cpu-definitions`` QMP
>     command.
>
>     While those guarantees are kept, the return value of
>     ``query-cpu-definitions`` will have existing CPU model aliases
>     point to a version that doesn't break runnability guarantees
>     (specifically, version 1 of those CPU models).  In future QEMU
>     versions, aliases will point to newer CPU model versions
>     depending on the machine type, so management software must
>     resolve CPU model aliases before starting a virtual machine.

thanks
-- PMM

