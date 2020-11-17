Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B03C62B5CA6
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 11:10:34 +0100 (CET)
Received: from localhost ([::1]:46576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kexwX-0001u9-Ps
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 05:10:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kexv5-0000Ht-2m
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 05:09:03 -0500
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43]:37439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kexv3-00071x-4W
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 05:09:02 -0500
Received: by mail-yb1-xb43.google.com with SMTP id v92so18436971ybi.4
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 02:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z8/AJj8tzmvrV/3K1tfmDqMsYoflHAZ1xLVBxcEq/JA=;
 b=fM3M4e4txYjKcoEFn4ydPOEKwy5V98q+yb3rQaIzftc1EHEGKFTU0IHcIW5/TAvmWf
 +LQrI6inEOgXs+9tFzVI4waX30kYTVuPA2iWSL9uEmSCl4LBeBlil/U9jC0WygknuPqM
 ySfqM6Q3dyrsitvJybusGfutl+vFh4K00V5WFZn44cmjjBVQUHKry5xHEbfhbcBu8Gzu
 3p1YBJ0rXsCTNg2TTb0N8oZyzhchs+xsu/I4qWMIaFcXG0vF7A9LJzwJCKbK9Qhvz2s5
 afZrnjLBDBezV+C7EM6tSsxOksog1qK3jepYOlIXDIh8pRuE9B5pYzoL5swDUbQ4V5GO
 SHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z8/AJj8tzmvrV/3K1tfmDqMsYoflHAZ1xLVBxcEq/JA=;
 b=rIrgN1xZynmFuhwPYgS20aKMb88AzNEUFqGCOIE3hbBdLL8bfP6p6XbBLEMR089+6R
 8Bwiq6MN/w6EZvM5dNHgJ0tgTZobKdh1pH+L5d+9LeotodhzpIBpQa7EUMWEUcZKkIQq
 QS0YYOEMfWXnz206LZ/CcTX7PdaT54APTSzU6orCj7+AnNQkSilDdbaHIPI0PkmalURS
 oHq7ydUoyD/ZRIWmmiSakftY28jP7pDNSogKjk3pqvSeI6FsALOZNn/FbDlP5LjnXT8z
 3mkHNmpNOame3TFzE5ioTTO8mSDv9AvIe1kruS5m48BA4yztCQ+ndZCYXIn/r2jwnSJR
 GduQ==
X-Gm-Message-State: AOAM532QOS0n0u0HVBo5pl+qOKFFjkhXIHDbZy89LIXHOIFmAI36eAWt
 9rLy9nyhQdgIDr+ywV1WjMbGOMgp8jd27zl8vSM=
X-Google-Smtp-Source: ABdhPJzYAiEeqRNcfO3twisjJ0D37cr/oJ8UEzvyQ63sOFbRnHzMMBllJhKT7HD8ibZ18SZlrZA+mrkRpgPqW/hv+jY=
X-Received: by 2002:a25:9a02:: with SMTP id x2mr21265521ybn.306.1605607739736; 
 Tue, 17 Nov 2020 02:08:59 -0800 (PST)
MIME-Version: 1.0
References: <1605261378-77971-1-git-send-email-bmeng.cn@gmail.com>
 <4e7e41c4-ce96-05c7-f2cf-27f926639d49@redhat.com>
 <CAEUhbmWDXFExcYGy6SZzz9t+TwHRD3LCuPAvg_S9_5tHRHF6-A@mail.gmail.com>
 <a29cdbe7-12f0-839e-4296-7bf4b846bcef@redhat.com>
In-Reply-To: <a29cdbe7-12f0-839e-4296-7bf4b846bcef@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 17 Nov 2020 18:08:48 +0800
Message-ID: <CAEUhbmWPi=4u8y0U0Py7rxyFVkD5gqkDQsze39XjPaXsADnJtg@mail.gmail.com>
Subject: Re: [PATCH v2] target/i386: seg_helper: Correct segement selector
 nullification in the RET/IRET helper
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b43;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo,

On Fri, Nov 13, 2020 at 6:39 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 13/11/20 11:23, Bin Meng wrote:
> >> It would be nicer if the commit message explained how
> >> the guest can notice the difference.
> >
> > The commit message says "Per the SDM" :) The actual failure case
> > involves a special code sequence that is exposed in VxWorks guest
> > testing. Linux does not expose this however.
>
> I see.  Is there any chance you could write a testcase for
> kvm-unit-tests?  Or just explain how to write such a test, and then I
> can write it myself; it's not clear to me how the guest can observe the
> base and limit of a non-present segment.

I am not familiar with kvm-unit-test. The original issue cannot be
reproduced with a KVM enabled QEMU as the codes-in-flaw is in the
emulation path.

Regards,
Bin

