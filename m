Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B955958461F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 20:54:47 +0200 (CEST)
Received: from localhost ([::1]:35570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH8ek-00082m-JE
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 14:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oH8at-0004jO-1A
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 14:50:47 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:46705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oH8ar-0004t9-Et
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 14:50:46 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id x8so2030516qvo.13
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 11:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=7Mnsa5CUheWCXpYFcgr3FM/aU+wDc87UPMQ+KxnRMjE=;
 b=0tNx/GulOOEauTTCKgVE9sN7CB9d15uGaDhcAAbb7+oudn2b6ZAZttMGTfLsw2lMjp
 KUMErtJV7W6qtMewVHv4tifaip71Jvwq04JRmpEVJy63pzbFExl+6cUo5VYM2GmE8MCR
 +8oLMbKWk+KXJkiDH0jkp4kWRj6cwikoHJjo89o7bcpoqsuEsj/BrnX8Xj3afPlzPdkZ
 Ev15Ws5LNRte9GD9fIBdpgxctd6gMSQEaGKT2NrwW9Ku33nxvrRTDVBShCULkh9wzjEH
 O+i4UQMADpFHCUb0EzvIokLsF7CJ12ACvbHCct/o/HKlEwn6W2nwFEGN98xojF0esAJI
 wr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=7Mnsa5CUheWCXpYFcgr3FM/aU+wDc87UPMQ+KxnRMjE=;
 b=3a1izwZ9wS4NGeWZ6bo65GfV/pnF4Jz4dlV+bNK3roBBh7YpfHxkyFxrQUBb+UWerX
 5hZebtasOYAfn+YQ742UlwVGWgQ0jzQoIOFk6CkqBd8wUVSnBVRufUEcB9BrWGrNfBUj
 Muxm8gK8CeyHSqBc97k/RxHecxwiLGQqejhqqQaDGNVIxOSD1q/wtPcnNTiGa+Ok2Svr
 kvxg+AxIHxWQhT5X7MdPuNyGBDZWmff6C/2JBQfqGTr7aYUm4Tqit0NDF0Gf5laEhAVX
 GinaOomqIzUgXoCbxvdPaSEd95mzOu4Tl7RhTTYyovfH4E45BYqU2hy/toTWIlDEnGsf
 eCpA==
X-Gm-Message-State: ACgBeo0LzJE24fe+vxJ4Gj7d4H/OstAI9OOngFcoeDZ68Q/NZzscZ0tM
 QrkIOcoUq8m4amI276hgBTiV4w==
X-Google-Smtp-Source: AA6agR5nor7t4T9OVh3T4GK5Xu2IxeiCIl+xKmbiSJyQnqZNKoSMxEm6hAwPSdhDpjkt/QRpaV8cTg==
X-Received: by 2002:a05:6214:5199:b0:474:3fc1:129d with SMTP id
 kl25-20020a056214519900b004743fc1129dmr305526qvb.41.1659034244334; 
 Thu, 28 Jul 2022 11:50:44 -0700 (PDT)
Received: from snn377.eng.timetra.com ([208.184.70.254])
 by smtp.googlemail.com with ESMTPSA id
 de28-20020a05620a371c00b006b5ee4de4fbsm1084274qkb.37.2022.07.28.11.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 11:50:43 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 28 Jul 2022 11:50:41 -0700 (PDT)
X-X-Sender: anisinha@anisinha-lenovo
To: Peter Maydell <peter.maydell@linaro.org>
cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org, 
 f4bug@amsat.org, aurelien@aurel32.net, jiaxun.yang@flygoat.com, 
 ani@anisinha.ca, dgilbert@redhat.com, mst@redhat.com
Subject: Re: [PATCH for-7.1] hw/mips/malta: turn off x86 specific features
 of PIIX4_PM
In-Reply-To: <CAFEAcA95sRW8u2NFDa1BX7uNg2t85Yr_kPgWWC+5QnJobygwMA@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2207281150220.151455@anisinha-lenovo>
References: <20220728115034.1327988-1-imammedo@redhat.com>
 <CAFEAcA95sRW8u2NFDa1BX7uNg2t85Yr_kPgWWC+5QnJobygwMA@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=ani@anisinha.ca; helo=mail-qv1-xf2e.google.com
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



On Thu, 28 Jul 2022, Peter Maydell wrote:

> On Thu, 28 Jul 2022 at 12:50, Igor Mammedov <imammedo@redhat.com> wrote:
> >
> > QEMU crashes trying to save VMSTATE when only MIPS target are compiled in
> >   $ qemu-system-mips -monitor stdio
> >   (qemu) migrate "exec:gzip -c > STATEFILE.gz"
> >   Segmentation fault (core dumped)
> >
> > It happens due to PIIX4_PM trying to parse hotplug vmstate structures
> > which are valid only for x86 and not for MIPS (as it requires ACPI
> > tables support which is not existent for ithe later)
> >
> > Issue was probably exposed by trying to cleanup/compile out unused
> > ACPI bits from MIPS target (but forgetting about migration bits).
> >
> > Disable compiled out features using compat properties as the least
> > risky way to deal with issue.
> >
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/995


Reviewed-by: Ani Sinha <ani@anisinha.ca>

>
> > ---
> > PS:
> > another approach could be setting defaults to disabled state and
> > enabling them using compat props on PC machines (which is more
> > code to deal with => more risky) or continue with PIIX4_PM
> > refactoring to split x86-shism out (which I'm not really
> > interested in due to risk of regressions for not much of
> > benefit)
> > ---
> >  hw/mips/malta.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> > index 7a0ec513b0..0e932988e0 100644
> > --- a/hw/mips/malta.c
> > +++ b/hw/mips/malta.c
> > @@ -1442,6 +1442,14 @@ static const TypeInfo mips_malta_device = {
> >      .instance_init = mips_malta_instance_init,
> >  };
> >
> > +GlobalProperty malta_compat[] = {
> > +    { "PIIX4_PM", "memory-hotplug-support", "off" },
> > +    { "PIIX4_PM", "acpi-pci-hotplug-with-bridge-support", "off" },
> > +    { "PIIX4_PM", "acpi-root-pci-hotplug", "off" },
> > +    { "PIIX4_PM", "x-not-migrate-acpi-index", "true" },
> > +};
>
> Is there an easy way to assert in hw/acpi/piix4.c that if
> CONFIG_ACPI_PCIHP was not set then the board has initialized
> all these properties to the don't-use-hotplug state ?
> That would be a guard against similar bugs (though I suppose
> we probably aren't likely to add new piix4 boards...)
>
> > +const size_t malta_compat_len = G_N_ELEMENTS(malta_compat);
> > +
> >  static void mips_malta_machine_init(MachineClass *mc)
> >  {
> >      mc->desc = "MIPS Malta Core LV";
> > @@ -1455,6 +1463,7 @@ static void mips_malta_machine_init(MachineClass *mc)
> >      mc->default_cpu_type = MIPS_CPU_TYPE_NAME("24Kf");
> >  #endif
> >      mc->default_ram_id = "mips_malta.ram";
> > +    compat_props_add(mc->compat_props, malta_compat, malta_compat_len);
> >  }
> >
> >  DEFINE_MACHINE("malta", mips_malta_machine_init)
> > --
> > 2.31.1
>
> thanks
> -- PMM
>

