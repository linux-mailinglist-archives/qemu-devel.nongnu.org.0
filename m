Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD4D5842FE
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 17:22:53 +0200 (CEST)
Received: from localhost ([::1]:55652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH5Lg-00042A-Ns
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 11:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oH5CQ-0004Hv-5o
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 11:13:19 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:37473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oH5CO-0005cZ-Fk
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 11:13:17 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id 141so3744320ybn.4
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 08:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SsngolPpNfFh5iuJu0R8PCnaLqWy8O9mKkc9PJvlZJ8=;
 b=HE+Nti2sACUZs/W3nUScm0SuMCa3yJuLwHwuovKiDnhOpvz4JwJy2DaYu+xIkIeITs
 +G+I59Uo9Qg+8QH2T53PVi2VwYlPJi3l3rIMybslLLRBotjZ46vTFRowaNAOv49rQZtf
 GLSR6TxiMMDhalJzb93wwmORbEIG7hh1/9kXKVL6XmtqM8M44CX7hPfvVLgTB4HURvrQ
 oz/4lJjKnxADMVyGCqaPs57VwpS8MCKTjRSp7CL+cd9MmVCorxmmBmijjy1EYXLqOWRG
 3hxzPGr/ACvzU1X1QvVGJYIZVRyP+yYR/7O7MfH/9K8bMJvIMJqAlxitlVKOGlfGmsIP
 GtBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SsngolPpNfFh5iuJu0R8PCnaLqWy8O9mKkc9PJvlZJ8=;
 b=mUOre87OIoAM0J8eQJhIl3gVqnygkbFRcZLx2mCTGM1N5CuiluEEXgAVpf6fJ9f5cp
 5gqtYskrT8qWQ8qwCy5BH5UXsSonw86J6Y62w9M7QrppFOobExg/qDRqsI19m4+TFoyk
 X9Ulbu2WiwnIFASdFFapW0bwbF57s0UrV6yUdZzVz4fjlksbfCD19ML9z6gtqBrba6+f
 rYsAUi5rZs9i08C5d9UiOFysrorKAFLWQntGNCC7+wGebXLrkdZrp0o55hkXwpGnDffc
 Vuo/YkAJFfE6VmYDm9XFeIb4pMC6CZ5ayFM7TlynZNmvHi8hxk1Joga5vzmiQDUZ00iz
 /ZhA==
X-Gm-Message-State: AJIora/eLhjRom/7B4CCXdpDhiHOSMtdJP9YipejoVzwtbDkfOgB+O3Q
 9TKevMfAxMUfqIZDhtJ1BOk9tdvBwcnSMUGjwE9L9A==
X-Google-Smtp-Source: AGRyM1vqYX1yl81M1Qv8GeGuDIwuI2uCZb9Wu+beh+tGf3Ulss3zG+rc6lweUXxRr2vfvtcMy5ChG7RUb21LoyyMSFc=
X-Received: by 2002:a25:d617:0:b0:671:79bd:69bf with SMTP id
 n23-20020a25d617000000b0067179bd69bfmr9387260ybg.85.1659021194241; Thu, 28
 Jul 2022 08:13:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220728115034.1327988-1-imammedo@redhat.com>
 <YuKgxM4IjAXh/goO@work-vm>
 <20220728165411.5701befb@redhat.com> <YuKmuvgqMQtTXVjX@work-vm>
In-Reply-To: <YuKmuvgqMQtTXVjX@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jul 2022 16:12:34 +0100
Message-ID: <CAFEAcA-H=P44_e9qbKiGiCXjs9JPCmhEK5qp23TLX229G=Y6rg@mail.gmail.com>
Subject: Re: [PATCH for-7.1] hw/mips/malta: turn off x86 specific features of
 PIIX4_PM
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org, f4bug@amsat.org,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, ani@anisinha.ca, 
 mst@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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

On Thu, 28 Jul 2022 at 16:09, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Igor Mammedov (imammedo@redhat.com) wrote:
> > On Thu, 28 Jul 2022 15:44:20 +0100
> > "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> >
> > > * Igor Mammedov (imammedo@redhat.com) wrote:
> > > > QEMU crashes trying to save VMSTATE when only MIPS target are compiled in
> > > >   $ qemu-system-mips -monitor stdio
> > > >   (qemu) migrate "exec:gzip -c > STATEFILE.gz"
> > > >   Segmentation fault (core dumped)
> > > >
> > > > It happens due to PIIX4_PM trying to parse hotplug vmstate structures
> > > > which are valid only for x86 and not for MIPS (as it requires ACPI
> > > > tables support which is not existent for ithe later)
> > > >
> > > > Issue was probably exposed by trying to cleanup/compile out unused
> > > > ACPI bits from MIPS target (but forgetting about migration bits).
> > > >
> > > > Disable compiled out features using compat properties as the least
> > > > risky way to deal with issue.
> > >
> > > Isn't the problem partially due to a 'stub' vmsd which isn't terminated?
> >
> > Not sure what "'stub' vmsd" is, can you explain?
>
> In hw/acpi/acpi-pci-hotplug-stub.c there is :
> const VMStateDescription vmstate_acpi_pcihp_pci_status;
>
> this seg happens when the migration code walks into that - this should
> always get populated with some of the minimal fields, in particular the
> .name and .fields array terminated with VMSTATE_END_OF_LIST().

Either:
 (1) we should be sure the vmstate struct does not get used if the
     compile-time config has ended up with the stub
or
 (2) it needs to actually match the real vmstate struct, otherwise
     migration between a QEMU built with a config that just got the
     stub version and a QEMU built with a config that got the full
     version will break

This patch does the former. Segfaulting if we got something wrong
and tried to use the vmstate when we weren't expecting to is
arguably better than producing an incompatible migration stream.
(Better still would be if we caught this on machine startup rather
than only when savevm was invoked.)

thanks
-- PMM

