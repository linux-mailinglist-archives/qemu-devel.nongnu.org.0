Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 303214183F3
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 20:12:41 +0200 (CEST)
Received: from localhost ([::1]:40152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUCAB-0003Tj-Ql
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 14:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUC8X-0002Yz-HF
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 14:10:57 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:37860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUC8R-0004uZ-T5
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 14:10:54 -0400
Received: by mail-wr1-x434.google.com with SMTP id t8so37638027wrq.4
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 11:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KUFZiVYURmlquJb/8hjhnumrTU8nUimqof9Ge4p1/c8=;
 b=nNDAsgVQkWr96C+IMqGNziUsVJhpousfzAm5sCX99XD4qG1WOU5K+nf/SjHhLuXidH
 6UGEobp3ciD7ss9/K8MLIMCbwfsAELTIHleCp9+Gs/r8hRIY8cS0d9XzU29tqqwDjh95
 BeJqtcoF0AjMT78Pig+M0q3PAPul01CbSTVfVG3SSkj5CwXBDHpL3/vMzwuVtxw9vKE1
 L1TT4ogEOffi3Jqg3XocYX0g2gTFHf7t0IwHz3qC0IXzoQNgTKvXHHuOFpVOc2D3LOa8
 QSiBsngiAvjRXgPvh+cA0tgRvFw+4JXTDTXTirXLOP0Hi2BfIgLVFSkcSSl8UKPuclUC
 /c/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KUFZiVYURmlquJb/8hjhnumrTU8nUimqof9Ge4p1/c8=;
 b=vYHFJX7ku8VbhDXuLheYZ8AX2SzfkQFbdxfVyLH1qimPzh7QrkKYOggbC8EtBQiQKa
 8b01R7VGj9WdeOSiGz4uSU4Hv4VE05NQXXxvFzkO0PgJhpzbAPQBXrMpCaLuHETyr5vi
 7A2ycjSH36UA/iTIf1phKlqyutKRkiuYgaZc9BOnlsK3zcdMrJ2JRT/YoxIg5JbfY/Qk
 LJi7g1tOkJ9BnkmwBrGRZuhZVd6Bht73gX252UImIIpBKNaVOx2Vqe1KsceWwimjvMQG
 7aeEE/Lq8wxMNmsLApPqQDtvDzwTPQZorfZlEfXhUCdpSatKqPR1rAD/VU2jsql5pjHa
 EWBQ==
X-Gm-Message-State: AOAM533XZUK5mcDd7E0EZvZNsv/Ph7McSVn3OuoLFIDCghcLxIWxQngS
 MNWB/QkmzkjtuhajyrEtzfO+WSpBS+TrjFH1F883bg==
X-Google-Smtp-Source: ABdhPJz3GfvRilruVcPJIY29yeN+0AkK9nrlzaRI3NVhHMCMzOpbfAByuI5dLAoNvwrGKmVXK/F4KvJn+D2HI1b/EhY=
X-Received: by 2002:adf:eac5:: with SMTP id o5mr9472431wrn.275.1632593449147; 
 Sat, 25 Sep 2021 11:10:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210916155404.86958-1-agraf@csgraf.de>
 <CAFEAcA-LrvO7sg9gY0ZKnvXJyJuFc2Ej1Ve1245FZ7YkH-Oj2A@mail.gmail.com>
 <CAFEAcA_Hkqg16VbA1qACK4RG22iXHo8b3VZWQoBRZL0HuBazZA@mail.gmail.com>
 <d4859cae-d9c1-2879-0682-080d4b5efe90@amsat.org>
 <27a265d5-2e7c-f234-0d09-f40a731e588d@csgraf.de>
 <bdeef51c-901b-f5a8-0415-03c464255b1f@amsat.org>
 <60aac468-973b-daee-49ce-71829c234af8@csgraf.de>
 <2db79dcb-feba-4175-6805-5b365b30d819@amsat.org>
In-Reply-To: <2db79dcb-feba-4175-6805-5b365b30d819@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 25 Sep 2021 19:09:56 +0100
Message-ID: <CAFEAcA-hxM3b-zS2s8FbWG=SogNdp+o=X1K45kYqXK=OhBCUbg@mail.gmail.com>
Subject: Re: [PATCH v12 00/10] hvf: Implement Apple Silicon Support
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 25 Sept 2021 at 18:22, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
> So this part of Xilinx Versal:
>
>      * When loading an OS, we turn on QEMU's PSCI implementation with SMC
>      * as the PSCI conduit. When there's no -kernel, we assume the user
>      * provides EL3 firmware to handle PSCI.
>      */
>     if (machine->kernel_filename) {
>         psci_conduit =3D QEMU_PSCI_CONDUIT_SMC;
>     }
>
> abuses the fact that -kernel command line expect a *Linux* kernel able
> to read the provided dtb which describe SMC. >This won't work if we
> manually provide a crafted dtb with another conduit

...which is not a supported thing to do (it won't work with the
'virt' board either)...

>, or if we pass any
> other binary (not Linux, not particularly ELF, since -kernel can load
> many formats).

-kernel means "assume I am a Linux kernel and boot me accordingly".
Sometimes it works for other things, but there are no guarantees.
Among other things it always means "start me at EL2 or EL1, not EL3",
so PSCI handling via SMC doesn't get in anybody's way even if they're
not using it. (People who want a pure "load this ELF file" should
use the generic-loader.)

The basic distinction the versal-virt board is making here is
"we have EL3 firmware to run in the guest" vs "we don't";
for the same reason that the virt board does, in the former
case we disable QEMU's internal PSCI implementation, and in
the latter we enable it. In theory the orangepi board code
should do the same, because if we're really running guest
code at EL3 it probably is going to assume it has SMC, and
QEMU taking control instead is going to confuse it.

-- PMM

