Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A29E44740A4
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 11:42:27 +0100 (CET)
Received: from localhost ([::1]:55290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx5GM-0001pu-As
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 05:42:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mx5F2-00019h-QP
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 05:41:04 -0500
Received: from [2a00:1450:4864:20::42b] (port=33525
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mx5F0-0004Em-7r
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 05:41:04 -0500
Received: by mail-wr1-x42b.google.com with SMTP id d24so31744397wra.0
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 02:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dd1IvqkgrLYUKuUDX+urHDV5/Ai/uROpJNzovmAdrCU=;
 b=VO8/vn5DPNXXn+AlruPcon2ns2qnFFxaSrjWpPQ7LMyCS14ih39bmUbKWyPvPfANrL
 anc4u+B1m0dafoafsttYsuF2q+p2X74hIaDbLthKJPF3YBlZvmYk7ptKb0mL+ndz4J9n
 VcS8sImSK7GpA4AVVs4Rd1vNH8igbs5A7ic3DFNE2MXytGfTlf492DPQs86H2kqOd6iC
 wM+z9aBLFuO5kFVt7grdOVCjsA8GntShTm4nbVZ5v8CHTFp0i71b4iHFGtmprU0Bfcmh
 /lQk15VGOMswf3jS1Jj6LPJfQUSWDdyOmoszN2I5VXD1ajsRqNaEM0g8zNWXAoHUwGTG
 UFqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dd1IvqkgrLYUKuUDX+urHDV5/Ai/uROpJNzovmAdrCU=;
 b=2vtHnApLEKsVRWWCGXdzhcmPTkHTSFSgBF/W71bC026dwK5Z0Jqgji745VfmI7XChF
 jWBISwnuXmNh4dr8bC9EnKiUlEK62Q4Ob5DiASH517puuSTE6fs8lRLErV14UC8xNnOb
 cFNGxbqHMhuJJ1TAgykvmZ3PkEEnbJi4+HgWcvO5r3EK1MX4UCpJaZhzp9l/cx3A40ke
 TkNLAN/OqninhAAoAm5GMN2wK5l1Hg/645/6TSyz2FIftKR96AxvFZHND9A5kB1wtRHF
 3uHj+qbnFrogEoFyxETVo8955Ah0CKKf7hLu8KKbSZlDT0uHg7Ubo6MD/nT69NdSQ/Zc
 AySQ==
X-Gm-Message-State: AOAM531v0ZOZbsBUclNm8eCvzEICIHsVs5KER2K9P+1CwRcbo4NxxSL+
 oCIsQhDYrZ0hj3TWuEziPOtdPt22RRRv0DjZCG5eYg==
X-Google-Smtp-Source: ABdhPJyr+IOnQ+zg9B13xuRz9wG2LEs0193bMU77s5UrKii/slr0AratNRjedJVFr2+lIs6CVEJZ9nczppkFWDvpVeM=
X-Received: by 2002:a5d:522b:: with SMTP id i11mr1495490wra.2.1639478460678;
 Tue, 14 Dec 2021 02:41:00 -0800 (PST)
MIME-Version: 1.0
References: <20211103173002.209906-1-kwolf@redhat.com>
 <871r365042.fsf@dusky.pond.sub.org> <YbhwrGRDs5lA7I7r@redhat.com>
In-Reply-To: <YbhwrGRDs5lA7I7r@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Dec 2021 10:40:49 +0000
Message-ID: <CAFEAcA_MhWPycXs0yZtnHq1BTdYecDHR+xGo21o8ASP=hFSr1g@mail.gmail.com>
Subject: Re: [RFC PATCH 00/12] QOM/QAPI integration part 1
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 14 Dec 2021 at 10:26, Kevin Wolf <kwolf@redhat.com> wrote:
> Configuration is for creating objects, properties are for runtime after
> the creation.

Well, yes and no. In a few places we have some properties which
are morally speaking configuration stuff, but which are runtime
settable. This happens because the property needs to be set after
the device is realized but before the machine is run, and we
don't have a concept of "settable only during the machine creation
phase", only of "settable only before realize". (I can't find an
example of this in the codebase offhand, but I definitely have one
in a patchset I'm working on -- the code which needs to
configure the property of the configured object is far removed
in both location in the codebase and point at which it runs
from the code which is doing the initialize-and-realize.)

-- PMM

