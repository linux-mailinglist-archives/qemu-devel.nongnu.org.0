Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 679205803B7
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 19:59:02 +0200 (CEST)
Received: from localhost ([::1]:46242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oG2M8-0007uh-4q
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 13:59:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oG2KF-0006Z1-PJ
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 13:57:04 -0400
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:33778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oG2KD-00039F-Ij
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 13:57:03 -0400
Received: by mail-qv1-xf2a.google.com with SMTP id mz20so8992661qvb.0
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 10:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=+Sl1lbA3cbWbDXe675+ZHmXpvwkwcNbVzXw1tPNNg3U=;
 b=Rd2Y4xJfQdbQgBTtk3xJxjgg/hTYPIpMejKMAFpakpF4iQka9t+yIMzvK5lNbzSXph
 iolJytiQAYwlsZkD0RZJUdvQlTNvCIvWPHwi9xohVmiE6Al3RBYER5pF/lRomKuMHOi1
 nHiUwnxBZ2fzEr3LrXaCGgQWDliPTwmHVI8pZyvThU3VYEctasixSqybkdol/lNN1YbA
 JFfwoz0ZaLiPNnPGXJs+UNt5QvhOix6reVdeTkZ40h+dBdjIU03IMvEAwt7TkL6ILeuA
 PB+q/wnors0BgQEGNPShvFtGYmeDo1HB4LLIQgHy26OT746BPhHq89HayOMhuHiKweRG
 BGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=+Sl1lbA3cbWbDXe675+ZHmXpvwkwcNbVzXw1tPNNg3U=;
 b=tplww4EKtrH1V9cyDl5MwW33Rs8JqW1tpxYvCGotuBu42simthsuhr0x70nBzFKleo
 G7UL8VK8g+e2oFpO5xh9/gWOt+JxlSekrd/tCTbml+nC8L8jgepNc49mGGfXocaAhJDd
 hNqP7AERHpFjZwkC/yyAePXxYIkaWBQN6n3MdQaKHA92IUgaSlTYKYQ7e89VOxWLKK3n
 kfAFQKsZ3LBelGku4cxIv+CGBr2LdvdDKUQPOxTHF8zW9mdCHUW5eyrAmwR6hGubMR0z
 N1+1ISgcf/DPJ3TKWJKC3h4eS76zc5Ah48lmGzwBuQLapvPmeE6f0u9oP52JE+Jw8COM
 0Sew==
X-Gm-Message-State: AJIora9zRG+PWewVzU5mP9Odi2fmphLECnuMEPodriXp7nSkpbwKeJy2
 HweYNeLo9il0sxar/saa6kx5DA==
X-Google-Smtp-Source: AGRyM1uoTJ69npUbrAQFQSp6RXUoxQth6XelcMPwpjYYoinL5hNn2wsxUCKw8e5mzJWjxbdEnrqfuQ==
X-Received: by 2002:a0c:b319:0:b0:473:82bd:327b with SMTP id
 s25-20020a0cb319000000b0047382bd327bmr11168801qve.43.1658771819683; 
 Mon, 25 Jul 2022 10:56:59 -0700 (PDT)
Received: from snn377.eng.timetra.com ([208.184.70.254])
 by smtp.googlemail.com with ESMTPSA id
 t1-20020a05620a450100b006b5e296452csm10405880qkp.54.2022.07.25.10.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 10:56:59 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Mon, 25 Jul 2022 10:57:00 -0700 (PDT)
X-X-Sender: anisinha@anisinha-lenovo
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>, 
 Aurelien Jarno <aurelien@aurel32.net>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PULL 06/35] hw/acpi: refactor acpi hp modules so that targets
 can just use what they need
In-Reply-To: <YtlIIbR5i3St3B0c@work-vm>
Message-ID: <alpine.DEB.2.22.394.2207251056110.87138@anisinha-lenovo>
References: <20210904213506.486886-1-mst@redhat.com>
 <20210904213506.486886-7-mst@redhat.com>
 <CAFEAcA9WBo2Kn9BPz1y2JCxpBGnBWDOtgLFiu31V4PL2m6b7bQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2207201132430.9370@anisinha-lenovo>
 <CAFEAcA8-ufAM2sg8-WkCPV3ksBZ=RU_1M2aq-wUBij82ot7iUw@mail.gmail.com>
 <alpine.DEB.2.22.394.2207201450430.17070@anisinha-lenovo>
 <YtlIIbR5i3St3B0c@work-vm>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=ani@anisinha.ca; helo=mail-qv1-xf2a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On Thu, 21 Jul 2022, Dr. David Alan Gilbert wrote:

> * Ani Sinha (ani@anisinha.ca) wrote:
> >
> >
> > On Wed, 20 Jul 2022, Peter Maydell wrote:
> >
> > > On Wed, 20 Jul 2022 at 19:37, Ani Sinha <ani@anisinha.ca> wrote:
> > > >
> > > >
> > > >
> > > > On Tue, 19 Jul 2022, Peter Maydell wrote:
> > > >
> > > > > On Sat, 4 Sept 2021 at 22:36, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > How is this intended to work? The obvious fix from my point
> > > > > of view would just be to say "piix4.c requires pcihp.c"
> > > > > and cause CONFIG_ACPI_PIIX4 to pull in CONFIG_ACPI_PCIHP,
> > > > > but that seems like it would be rather undoing the point
> > > > > of this change.
> > > >
> > > > Yes. From the commit log and the vague recollection I have about this
> > > > change :
> > > >
> > > > > For example, mips only needs support for PIIX4 and does not
> > > > > need acpi pci hotplug support or cpu hotplug support or memory hotplug
> > > > support
> > > > > etc
> > > >
> > > > So does malta really need acpi hotplug? If not, then the stubbing out of
> > > > the vmstate struct is correct.
> > >
> > > It's not, because the vmstate struct is actually used when you
> > > savevm/loadvm a malta machine. If the malta shouldn't have
> > > acpi hotplug then we need to arrange for the hotplug code
> > > to be avoided at an earlier point, not just stub in the
> > > vmstate struct field.
> >
> > yes I think that would be more appropriate fix, I agree. Since mst added
> > that vmstate, maybe he can comment on this.
>
> Can't we just change the stub to be a valid vmstate structure?

This would be only a short term solution until we can re-org the code so
that Malta does not use acpi hotplug anymore.

>
> Dave
> (I coincidentally found this today because I'd been cc'd on
> https://gitlab.com/qemu-project/qemu/-/issues/995 a few months back
> and only just noticed)
>

