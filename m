Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4562F531599
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 20:53:24 +0200 (CEST)
Received: from localhost ([::1]:42432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntDBB-0005Pl-4P
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 14:53:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ntD9O-0004cN-8D
 for qemu-devel@nongnu.org; Mon, 23 May 2022 14:51:31 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:40537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ntD9M-0003sF-6Z
 for qemu-devel@nongnu.org; Mon, 23 May 2022 14:51:29 -0400
Received: by mail-io1-xd32.google.com with SMTP id y12so16254056ior.7
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 11:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KH8aTXvRUZQcEDhlIy2VYqtZiZKs33thWYfthIFeRS8=;
 b=liiGiP7w3El6sNV9rBMT1MnJ2VS7n9j9I2+04ptKU+9N8lVigW9iPJHTB1G4FMh6BB
 C876NbX5OKY4laDG1EaDxSc9KzflX19Idvbmp/oIXYkh2UX1pAv8RQyFzh4IEnLMd/G8
 yvYiqUCE31H41xqFDybKyaySm42fcWMF4VojtEvZmeUTHyqSxYc5EXXEEkhsc6hqLmlU
 F1lUo83n1mBslSqPIiP0Z7ryQkiVDUWzJbCW/Kg26dDd92b5DXUiYJ2RELDPJqjUWzcP
 l9kIpkF3gS6msB3xDi86mRfWJUw43VwkU9FYq2TfOHPVEtq32U02GOMnNCFhEqeveSME
 k95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KH8aTXvRUZQcEDhlIy2VYqtZiZKs33thWYfthIFeRS8=;
 b=oCUl5gzvAe27OGsEf0+suK15QRcxMeqGUu26f1eqyaz9eUBrvTqeI71A27xO9P4PRR
 U7UmgIz0EkZyA+79uQDhANu7O3RJE6+VncG5Sep534m5yOH39JV0sWEsxpg8RQ1fU6Ev
 fpWnr1s0Ud7eWVFacG1p1QZKOwWluQfN7f3ECspYOXhysMUljANIbtllVATDXCwLKbOV
 6AXp1ja/zrCFFdlMTmFs9CoHH5n+1/csfErSXdk03BoRUKvNdEcrZxWkjsnCm0P81Tlu
 RY2OZpguSil1vaDoKUz3RhKLQYQmEhVB6sNszra1YRY6cRRlyt4ZhZ5t2AiSG8OmH1g0
 B/sQ==
X-Gm-Message-State: AOAM530uhouWAnEJMj458KA47akHIJAlsKblFw4duC0eYf5xPcGeEuVy
 2/43JADWnpqpxVKxBb+LLkmVzBJvmQvp0sH5V5s=
X-Google-Smtp-Source: ABdhPJzRE5q/BZNJ1tHFaAb3Ob5e/wgRPMdEC4NwiHZSgmOVX+3UY7uL78IHg0AvuzyipqnDpNbiNP5Ck13Pb3yeGv0=
X-Received: by 2002:a02:944e:0:b0:31a:2e9:bfa6 with SMTP id
 a72-20020a02944e000000b0031a02e9bfa6mr12514292jai.277.1653331886624; Mon, 23
 May 2022 11:51:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAJSP0QW338v=VuVpO_6WWZMBjsT1FOTLytpSbgUHemcCHQ_szA@mail.gmail.com>
 <CAKbZUD3ObTfkdFebT1hJir-dYAH21BUsW6dX4wb-pgP8Ue3zrg@mail.gmail.com>
In-Reply-To: <CAKbZUD3ObTfkdFebT1hJir-dYAH21BUsW6dX4wb-pgP8Ue3zrg@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 23 May 2022 19:51:14 +0100
Message-ID: <CAJSP0QUtgwqe7YYRPegB7gEKsPMzrTu1ZirXL4QGMN5dNgjo_A@mail.gmail.com>
Subject: Re: TianoCore "Add QEMU support to MinPlatform (OpenQEMUBoardPkg)"
 GSoC project
To: Pedro Falcato <pedro.falcato@gmail.com>
Cc: Isaac Oram <isaac.w.oram@intel.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=stefanha@gmail.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Mon, 23 May 2022 at 19:00, Pedro Falcato <pedro.falcato@gmail.com> wrote=
:
>
> Hi Stefan, Gerd,
>
> Some questions: Is emulation of the current boards ever going to be expan=
ded? For instance, can FW rely on the emulation being relatively simple or =
do you actually need to look at chipset docs?
> For example, I was looking at (most? all?) of the current chipset emulati=
on [1] [2] and it looks relatively simple, such that writing something that=
 directly interfaces with it isn't particularly hard.

I suggest a mix of referencing the hardware datasheets and open source
drivers or firmware code when developing new guest code.

Firmware should follow hardware datasheets and avoid taking relying on
QEMU implementation details.

fw_cfg and other paravirt interfaces that are documented won't change
in backwards incompatible ways. It's fine to rely on them.
QEMU-specific hardware interfaces are documented in docs/specs/ (e.g.
acpi_pci_hotplug.rst).

Anything that isn't documented may not be a stable interface. I
recommend discussing stabilization on qemu-devel before relying on it.

New QEMU versions do not change the hardware interfaces when launched
with a specific machine type version (e.g. -M pc-q35-6.2), so old
firmware should continue working under new QEMU versions as long as a
versioned machine type is specified on the command-line. But
undocumented QEMU hardware interfaces could change in new machine
types, so it's risky to rely on them.

> I've been trying to figure out exactly what one needs to do in FW to get =
a completely set up virtual machine environment. Are there good docs on tha=
t or do you need to just read OVMF/SeaBios code? Have interfaces changed si=
gnificantly over the years?
> As an example, I remember seeing some OVMF CMOS memory detection shenanig=
ans in the EDK2 mailing list but in my QEMU (7.0.0) you seem to just get th=
e memory map straight from fw_cfg. Also, do you get ALL the ACPI tables fro=
m fw_cfg, or do you need to modify them/generate them dynamically in firmwa=
re?

Gerd can answer these questions. Please clarify which machine types
you are interested in (see the list from "qemu-system-x86_64 -machine
\?").

Stefan

> Hopefully my questions make sense. Feel free to CC qemu-devel if you thin=
k these questions are better suited there.
>
> Thanks,
> Pedro
>
> [1] https://github.com/qemu/qemu/blob/master/hw/isa/lpc_ich9.c
> [2] https://github.com/qemu/qemu/blob/master/hw/isa/piix4.c
>
> On Sat, May 21, 2022 at 8:58 PM Stefan Hajnoczi <stefanha@gmail.com> wrot=
e:
>>
>> Hi,
>> I am a QEMU developer and saw the "Add QEMU support to MinPlatform
>> (OpenQEMUBoardPkg)" TianoCore GSoC project:
>> https://summerofcode.withgoogle.com/programs/2022/projects/s892c1ox
>>
>> You may already know each other from edk2, but in case not, I wanted
>> to introduce Gerd. He's doing edk2 work for QEMU and has been an
>> active QEMU developer for many years.
>>
>> Feel free to CC qemu-devel@nongnu.org if you ever want input or help
>> from the QEMU community.
>>
>> Have a great summer!
>>
>> Stefan
>
>
>
> --
> Pedro Falcato

