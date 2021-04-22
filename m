Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CAD368446
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 17:57:58 +0200 (CEST)
Received: from localhost ([::1]:39660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZbiH-0007kW-4N
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 11:57:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZbfE-00063x-4Z
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 11:54:48 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:38629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZbfC-0004I2-DG
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 11:54:47 -0400
Received: by mail-ej1-x635.google.com with SMTP id r12so69556384ejr.5
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 08:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+oEQl8OOqquu0F1Gzk7YnshwQdTufZq5vw2czd8+klA=;
 b=b0oKE83iEHDx9Y+uTr6MtJjnXS3rP3JXRwHNfX/AB3F7UU4c9b8EQNfqfUp4qzz7Dk
 w1GhBFes+Vk9B7yWZ3uiTqxfMANfK0ihP0HfAJXpJ3XNqOGSzz5jwi7CNl3DLSEDT3du
 9TC+J2cRAZD1hrjaaRGig4HmJstPJjgxMuvP6iFHVUn0rb5HZ57KdcdOrIJ242R6aWrl
 hz9GrvGTNGJRSlHxhSvlK8DByBVXY1X3i1vB5tdp3JWRaye1DcqtBMaRxih3UMCzAys/
 Z3Rc36EtssLtXlroVZHwr54APuiviT5nLdJFc1FViEVowqlwyos72f+KssJ0fXBpyNIk
 s23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+oEQl8OOqquu0F1Gzk7YnshwQdTufZq5vw2czd8+klA=;
 b=lJEgJ99bA+Fn6WSSszvPOczBCtwFoz07v57/dB3uJc+1hdSMHpG+azHzqzO+oSPOo2
 DUTKvvb+PlCdFord+N9FBsMe5oXtm5pv3DA/ZMT0KrJn2ufHbN0wfTXfPlkoRAQ1moY7
 5uiiFwaFmGDHBV9lIgJEWqVG7q+iPeZxC+Q/+IVehYFSzMAwbSxHTpn5LnnppG8tFM1N
 /NhESygbN3jbZJnjDZT21s7c4iajFpq7wqGHWMFbrRDPncdj7JjHE422eEEK4h7DBp+x
 K0kggtvkDQ8secmmbKGvGz9C6MVh1WlU6lXa6tfO5GmoTht6nBpEY3SW1+18HmzawPWQ
 nG8A==
X-Gm-Message-State: AOAM531wMCWLKpa66k4FEa5QjUQGrBasU5k7/o5mva3TJriTOzBYTad+
 GROe0wpRNZH/YwMMjL5g1FCXCgyzOVvvk+i6aDf8pg==
X-Google-Smtp-Source: ABdhPJyU3AEDW1h8TMrhKCbN6ZpW+b5aJkM8PLtvA+7I4uQ0VpajdL73wBm4I9wM7i4UXA+AfndrOsTSa6IjrBzeUmI=
X-Received: by 2002:a17:906:6d41:: with SMTP id
 a1mr4193770ejt.482.1619106882991; 
 Thu, 22 Apr 2021 08:54:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210302145818.1161461-1-f4bug@amsat.org>
 <20210302145818.1161461-2-f4bug@amsat.org>
 <20210421220333.bkxo6zriqe6w3rim@habkost.net>
 <cccb8e5c-55cb-3f46-1391-ca96ab7c27ce@amsat.org>
 <CAFEAcA8_cjzAzoA9BFucR7LzQA7KXnrmufH4kp7aNL9bo_5Q5A@mail.gmail.com>
 <6bfaaaab-8045-d8be-4edd-652d500a6c14@amsat.org>
 <280abf24-4e72-78ed-621b-b66495943003@amsat.org>
In-Reply-To: <280abf24-4e72-78ed-621b-b66495943003@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Apr 2021 16:53:48 +0100
Message-ID: <CAFEAcA867BoyAEDfHB8eCXN12X58XBan_v-PzBKLvBK-o=XZDg@mail.gmail.com>
Subject: Re: [PATCH v3 01/27] target: Set CPUClass::vmsd instead of
 DeviceClass::vmsd
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 22 Apr 2021 at 16:41, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
> IOW new targets should use type 1.
>
>
> Looking at type 2:
>
> a) targets added 'recently' with the incorrect type 2:
>
> target/avr/cpu.c:216:    cc->vmsd =3D &vms_avr_cpu;
> target/riscv/cpu.c:627:    cc->vmsd =3D &vmstate_riscv_cpu;
>
> b) targets where migration isn't really an issue:
>
> target/lm32/cpu.c:244:    cc->vmsd =3D &vmstate_lm32_cpu;
> target/moxie/cpu.c:125:    cc->vmsd =3D &vmstate_moxie_cpu;
>
> c) targets where migration could be broken:
>
> target/mips/cpu.c:723:    cc->vmsd =3D &vmstate_mips_cpu;
> target/sparc/cpu.c:892:    cc->vmsd =3D &vmstate_sparc_cpu;
>
> d) KVM targets ("security boundary" or Tier-1) are left:
>
> target/arm/cpu.c:1985:    cc->vmsd =3D &vmstate_arm_cpu;
> target/i386/cpu.c:7434:    cc->vmsd =3D &vmstate_x86_cpu;
> target/ppc/translate_init.c.inc:10923:    cc->vmsd =3D &vmstate_ppc_cpu;
> target/s390x/cpu.c:520:    cc->vmsd =3D &vmstate_s390_cpu;
>
>
> Isn't "machine type" what allows us to change migration stream?
> All targets in d) do support that.

Versioned machine types allow us to change the migration stream
if we do it in a forwards-compatible way (and if we're feeling
kind to RH as a downstream perhaps even backwards-compatible);
but new QEMU still has to be able to read the migration stream
produced by old QEMU for the "virt-5.2" board, or whatever.

In some cases I think we also like to maintain migration
compat on a "best-effort" basis; I think Mark likes to handle
the SPARC guests that way.

thanks
-- PMM

