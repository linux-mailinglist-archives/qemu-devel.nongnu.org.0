Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E5C57BFAE
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 23:36:56 +0200 (CEST)
Received: from localhost ([::1]:41226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEHNH-000148-JV
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 17:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEHLd-0007zr-Lj
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 17:35:13 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:40652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEHLc-00018u-4z
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 17:35:13 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id k85so31573902ybk.7
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 14:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HQ5D+IWOv+r+d06iV5GHOsGEgRJXV1137xt6FE4e0vk=;
 b=ZE2lUZ/bNY6c2mx+ap0Joe3Wmobc1iqgfnV9aufy8gPV1v9Q4AvKGFfJTnRGtCXBUN
 H2noo1HqdR7sba7JIR7gOAvSAFhcERqGYAceNvTZYPG78MTWpI3VwHTkX/8+Qlpnb9IS
 B5KPxdLB2DSRnze11bH9Ort17JkYfcTRr3KTZRU/5QcFOZ+c9wWfQS+4Y3LKALn/MWsX
 NrZd7MqnGIOphuSP0EtOldJPDurJK60b+RNlojeCQ3OAHLbCXzdkTbhDqg+uX/PXMaz6
 Oz6eHL0gpYgOCFVNblLGu5IVMsAJkjc4MQ+j0kKlZWCPa7TMSKw4E+0lTgyAKdc/0G6C
 92mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HQ5D+IWOv+r+d06iV5GHOsGEgRJXV1137xt6FE4e0vk=;
 b=ZT0iUN+UHWkZb6LQfweAwXfyTGphBaxo9vELegkeiBEOmpANiG5rLbqOXNkOFl1hXa
 n2lUL+05vAIyJdhObQAvdYHQaFwOylNdQAO8lrWxvwM1Ud5cnJDIrODkpfTEJ5R2V8L/
 sSpS0VJepfY2fQXfclyXnvT2UeLvRTp4OVw3kRo78FkRscplxjKEFxuD7mT47mh80eIE
 Bb7KSXbC4Wh4bv7HN2StAgwzxRMH+dr682bF1V5yO9Cri4IBykZ9dN32P2kVOYAN6zZC
 BSvFiO1Mg6N9MLOwgDHHhRJVIjIMK3W+iqQngevp40yeqiSkgfuYkvwRDVW3UmiGrTWW
 d56g==
X-Gm-Message-State: AJIora+XmwV4hPptqdnSHvi3dc0hjER2L5T9vc+rJo0ZImZBYiV7slhG
 I0DQgCSnrqpumvLf8XtaBvjwieB0jkZWYOGmDzgfow==
X-Google-Smtp-Source: AGRyM1t2d2qwgHd3fFBUoDUi+86gn0FZ9EJ/IIaz9S601oSkqIaPHfzLat4CGEku5E28HuX5jCOQjHMKqyrVnYq7FHo=
X-Received: by 2002:a5b:dd2:0:b0:668:fc4a:9403 with SMTP id
 t18-20020a5b0dd2000000b00668fc4a9403mr39227362ybr.39.1658352910815; Wed, 20
 Jul 2022 14:35:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210904213506.486886-1-mst@redhat.com>
 <20210904213506.486886-7-mst@redhat.com>
 <CAFEAcA9WBo2Kn9BPz1y2JCxpBGnBWDOtgLFiu31V4PL2m6b7bQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2207201132430.9370@anisinha-lenovo>
In-Reply-To: <alpine.DEB.2.22.394.2207201132430.9370@anisinha-lenovo>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Jul 2022 22:34:31 +0100
Message-ID: <CAFEAcA8-ufAM2sg8-WkCPV3ksBZ=RU_1M2aq-wUBij82ot7iUw@mail.gmail.com>
Subject: Re: [PULL 06/35] hw/acpi: refactor acpi hp modules so that targets
 can just use what they need
To: Ani Sinha <ani@anisinha.ca>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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

On Wed, 20 Jul 2022 at 19:37, Ani Sinha <ani@anisinha.ca> wrote:
>
>
>
> On Tue, 19 Jul 2022, Peter Maydell wrote:
>
> > On Sat, 4 Sept 2021 at 22:36, Michael S. Tsirkin <mst@redhat.com> wrote:
> > How is this intended to work? The obvious fix from my point
> > of view would just be to say "piix4.c requires pcihp.c"
> > and cause CONFIG_ACPI_PIIX4 to pull in CONFIG_ACPI_PCIHP,
> > but that seems like it would be rather undoing the point
> > of this change.
>
> Yes. From the commit log and the vague recollection I have about this
> change :
>
> > For example, mips only needs support for PIIX4 and does not
> > need acpi pci hotplug support or cpu hotplug support or memory hotplug
> support
> > etc
>
> So does malta really need acpi hotplug? If not, then the stubbing out of
> the vmstate struct is correct.

It's not, because the vmstate struct is actually used when you
savevm/loadvm a malta machine. If the malta shouldn't have
acpi hotplug then we need to arrange for the hotplug code
to be avoided at an earlier point, not just stub in the
vmstate struct field.

-- PMM

