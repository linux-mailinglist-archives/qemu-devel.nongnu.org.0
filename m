Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D79644FF1F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 08:14:02 +0100 (CET)
Received: from localhost ([::1]:60664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmWBk-0001VP-NR
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 02:14:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mmWAe-0000qA-KH
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 02:12:52 -0500
Received: from [2607:f8b0:4864:20::130] (port=38633
 helo=mail-il1-x130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mmWAd-0001Rw-0h
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 02:12:52 -0500
Received: by mail-il1-x130.google.com with SMTP id m11so15512553ilh.5;
 Sun, 14 Nov 2021 23:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9UVKrVQj7vEXirfxuvSjYgwX9jpuevAny9e8qkP/rEM=;
 b=EmqzjQSV+VzmBqnK8/nkSKrTP6tNYCIJuzOVwSTuIfgfDyuaI4XZlObYmZI4zc9HEF
 41E4t2GDCETZ8baor+RsRZPCoWhseljIkImNHEucNSBB2KS3qPqwW3wSjSOkf5EeNFdJ
 8Ul5cq/vBgrAq9k2zzgAV8NUrG0gKRbXkSXFrlhUZhPD7jomZo2kqDyPutfhU6SoRn2x
 cPAowbmNx8EIBj311gHnNRysmatHMFmOrRIo5CN2MtWVkT1DSuwRni06dJrOXfYKeDvK
 XuNUMxojlMsEzXOkSSTBo7Xm9qmJBMuAP1AiUESeNsiOG7qGhx7l3V7T7XRDdvRUmy7v
 MPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9UVKrVQj7vEXirfxuvSjYgwX9jpuevAny9e8qkP/rEM=;
 b=1L6lS3waPCkTtATE9G6vhYc7mVd1rDa85XVOxdzqvtiGMBoEOZizmktZQV1Ybs925N
 hOqYsm3QaAPlTcYY51LmVw9xhWZmhnpw4CLOFqSgt0vOorbiNQ9r1LcdsVrnfyaDlJ0U
 l0t6a3w066HVgWOmtefXdiSZ/LaSc+8zQLqFHIeguYCPHc7+mEQg1oHOJT6tXrYwngBW
 yyShghDBAwMJ0lI5R2e9t2CFyVl8yBEzNucRl3mscuAsq4b895hUravhnydPwdyTnJ2D
 oySSfmaiFJiQC0pV//AS8yFLK0wF4J3tbUwB9jTLAtq6NLDn4ZAqxLLwk23mYcDOCVTQ
 BNvQ==
X-Gm-Message-State: AOAM530tkAMBnQYpLLT0aoeDB2GTZPEZZf4rXHOq+W4x4Zmh/cGPv2Hl
 ECKW9WQUO+iVhZpX7JDQX3rf1Mmh0aNvH8YaZr8=
X-Google-Smtp-Source: ABdhPJwTtSijsQJNnVwjV1gi30PARvTTx5B23rVVBj0lRCtTX71Cng1/q8HTQG9m6IS+067qjdqnpfll9BZPWGatbWA=
X-Received: by 2002:a05:6e02:1bec:: with SMTP id
 y12mr18964837ilv.74.1636960369555; 
 Sun, 14 Nov 2021 23:12:49 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA9zmPds0+jHm8VY465XEhK6bbVPd+nDob1ruRPaHOua_Q@mail.gmail.com>
 <87r1bxzl5c.fsf@dusky.pond.sub.org>
 <e7ec3afc-6db9-822e-5a5e-dee7c4db8f34@redhat.com>
 <87pmr5cxbt.fsf@dusky.pond.sub.org>
 <CAFEAcA8sNjLsknea5Nt-tANEniFF2FYmjiV0xz=pr+vFwkX-gw@mail.gmail.com>
 <875ysunfwz.fsf@dusky.pond.sub.org>
In-Reply-To: <875ysunfwz.fsf@dusky.pond.sub.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Nov 2021 17:12:23 +1000
Message-ID: <CAKmqyKN9FWkNd2WpBsW8sdDdiQsmw-AVvG-kowiBigj5kRyZFQ@mail.gmail.com>
Subject: Re: does drive_get_next(IF_NONE) make sense?
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::130
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x130.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 15, 2021 at 3:32 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Fri, 12 Nov 2021 at 13:34, Markus Armbruster <armbru@redhat.com> wrote:
> >>
> >> Thomas Huth <thuth@redhat.com> writes:
> >>
> >> > On 03/11/2021 09.41, Markus Armbruster wrote:
> >> >> Peter Maydell <peter.maydell@linaro.org> writes:
> >> >>
> >> >>> Does it make sense for a device/board to do drive_get_next(IF_NONE) ?
> >> >> Short answer: hell, no!  ;)
> >> >
> >> > Would it make sense to add an "assert(type != IF_NONE)" to drive_get()
> >> > to avoid such mistakes in the future?
> >>
> >> Worth a try.
> >
> > You need to fix the sifive_u_otp device first :-)
>
> And for that, we may want Hao Wu's "[PATCH v4 5/7] blockdev: Add a new
> IF type IF_OTHER" first.

I can fixup sifive_u_otp, just let me know what the prefered solution is

Alistair

