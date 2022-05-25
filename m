Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7C9533BFA
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 13:52:06 +0200 (CEST)
Received: from localhost ([::1]:44916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntpYE-00024i-Bt
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 07:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ntpSz-0000Kk-Uq
 for qemu-devel@nongnu.org; Wed, 25 May 2022 07:46:22 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:44674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ntpSx-00076M-PI
 for qemu-devel@nongnu.org; Wed, 25 May 2022 07:46:17 -0400
Received: by mail-yb1-xb35.google.com with SMTP id q184so6929240ybg.11
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 04:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5XgHuY+pOkET2Lm9N7PcVM1CyP+W7NKRRXrZf6ymFYA=;
 b=jHSSbKJLwIthjaQPLjn23RnW/60FXUtMn2jdpdn7eXB57o+xVMHMfyIb6zyuiaorMQ
 eUogDzeLonk0HvGSfAWhOju3dRycIzKlnf7Ut2PzxrbP67GseeDs3oGsgJd3Dwjiny9I
 gjfb+5oYTUxHBvomCW62iZCvCC1gJKTIsSERfBosqZYYqEFiqXA3mHyK+4QuZ/0iLFER
 mFi+ISsOSLALHhhUN48/1hq9PnbUOcHob0IDNiNNNhj9iKAE2IEXyUEPt+9+30PEakdc
 E7bf0xSbfTibBErq23FadMiWk811kRw5+vgSg5VRDWmK9tGtowinM1FyRfRvbwC1lupz
 nfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5XgHuY+pOkET2Lm9N7PcVM1CyP+W7NKRRXrZf6ymFYA=;
 b=SVn1LS+/4F2dTaTwJy4gCsRzGSgFbo5RG2OjOyAe74+BSFGkfTN8okEz2Ps9WItO2x
 6zySMRRX+YmHUZYwc+W06H+tYxz/YU53tzkr0VEe3uhDQ1LQBEOZf16v1IwGQYiP9QPu
 qwyrzVVhVbR/E8xQwS/1VgtSis6iI1vDl9rxv9yJCatZSA0Mxquh1UlmMpOpOZngizI8
 qb5TmM2aqDTgWOOr/mH5zbS0ula0JafVqoADAy/LBDaCcSjElYNf7eHRll85W55UG0Va
 EsP6g3JPkVVqF4/TQf6fMwvDuddEsNo0Z+LFzicHq9Kxi9qlTKqIE5zKj7IWmMEAAE0R
 SH7g==
X-Gm-Message-State: AOAM5309Y8ffuiP2HOAkMmGfVz7NzA2nCUKzBovp9iRleMkYa13nlwZk
 SazSdNcBcK2YexI9xcSE5/JNoUSFZSBNgjDTdJVODg==
X-Google-Smtp-Source: ABdhPJz8n7VWTyvUZ7rZxkFsXPNdVWb0WrxcLFaYwi/VIAfG6JbdMArz/8++8YaJpa4WT+qCK7n7tu/rAkXIJIx+MEM=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr30705132ybq.67.1653479164888; Wed, 25
 May 2022 04:46:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220524134809.40732-1-damien.hedde@greensocs.com>
 <e494e267-acbf-e6bd-5590-22b6ae2d2a55@ilande.co.uk>
 <1a71b7ee-aac6-a191-5a9c-472d46999ff1@greensocs.com>
In-Reply-To: <1a71b7ee-aac6-a191-5a9c-472d46999ff1@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 25 May 2022 12:45:53 +0100
Message-ID: <CAFEAcA8UTLiab5Tg19y7pdJwyuqqxcrxL-9QmzK9r9skGVVGYQ@mail.gmail.com>
Subject: Re: [RFC PATCH v5 0/3] Sysbus device generic QAPI plug support
To: Damien Hedde <damien.hedde@greensocs.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 David Hildenbrand <david@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Peter Xu <peterx@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
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

On Wed, 25 May 2022 at 10:51, Damien Hedde <damien.hedde@greensocs.com> wrote:
> On 5/24/22 19:44, Mark Cave-Ayland wrote:
> > Sorry for coming late into this series, however one of the things I've
> > been thinking about a lot recently is that with the advent of QOM and
> > qdev, is there really any distinction between TYPE_DEVICE and
> > TYPE_SYS_BUS_DEVICE anymore, and whether it makes sense to keep
> > TYPE_SYS_BUS_DEVICE long term.
>
> On QAPI/CLI level there is a huge difference since TYPE_SYS_BUS_DEVICE
> is the only subtype of TYPE_DEVICE which is subject to special
> treatment. It prevents to plug a sysbus device which has not be allowed
> by code and that's what I want to get rid of (or workaround by allowing
> all of them).

Yes, but the fact that TYPE_SYS_BUS_DEVICE is a special subclass
is an accident of history. At some point we really ought to tidy
this up so that any TYPE_DEVICE can have MMIO regions and IRQs,
and get rid of the subclass entirely. This isn't trivial, for
reasons including problems with reset handling, but I would
prefer it if we didn't bake "sysbus is special" into places like
the QMP commands.

More generally, I don't think that the correct answer to "is this
device OK to cold-plug via commandline and QMP is "is it a sysbus
device?". I don't know what the right way to identify cold-pluggable
devices is but I suspect it needs to be more complicated.

> I'm note sure what you mean by identification and enumeration. I do not
> do any introspection and rely on knowing which mmio or irq index
> corresponds to what. The "id" in `device_add` allows to reference the
> device in following commands.

This is then baking in a device's choices of MMIO region
ordering and arrangement and its IRQ numbering into a
user-facing ABI. I can't say I'm very keen on that -- it
would block us from being able to do a variety of
refactorings and cleanups.

-- PMM

