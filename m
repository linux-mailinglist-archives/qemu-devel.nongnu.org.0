Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BED0B3F4D09
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 17:07:48 +0200 (CEST)
Received: from localhost ([::1]:41326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIBY6-0005mv-Lz
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 11:07:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mIBWK-0003gZ-1S
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 11:05:52 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:38567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mIBWF-0000dt-DK
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 11:05:51 -0400
Received: by mail-qk1-x732.google.com with SMTP id f22so9826747qkm.5
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 08:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yued7Oy/qelzIR/xWh4LWJOlS8BORQ94XxLRXXxxqSY=;
 b=dq9bvnI1b1OyWdvZZm5K1FUIibCLosC9I4dHtiNaht5fZ02YKONoq6Dha/bGmlZFVA
 ayfk1Kvg6NzdDN1ZMmQ6RB7jdTlpvgZTTGcGct4uG0W0T6j5MbbJ3ujo2fIKr8Ys+Y6L
 vz9qLox5SKCqlAN/ObXV8BFKanLWJ7QBUSSXXwsb0S8mMIXKXVHxTh9wcMmGjPD2KqgI
 5tcu4iWjQpEdyxk9KHd3Vn/VKiXgLFySdEc4gvXzzd4vPfO2yV982KeHlokfJjLKm9Ds
 x6hNkEdbL7Lh8pDbaoz1XRm76STZcvbRSqH5RbA5frjXh1X9NIIRO4wYyFEwruehLaeG
 7F6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yued7Oy/qelzIR/xWh4LWJOlS8BORQ94XxLRXXxxqSY=;
 b=RizMFJayrQCp3KnxJ5c2kgbti2rETZ+Y26H4Ku6rVrTuiCaUY70nrDDpdiDfkNn8YB
 KOWRcrLFfAMvdcps+p3eHq8HL7yjXfyBhXQ/P3I1YIOJtPAK7YrChLurw2kBo7pO0B4S
 1OViDV5zflAGDCGFj1PadVBWv6QNNm70DNc/eX+YPoTfoKM0yrZbxXH2Y7UOujXPfXPr
 8oo61y/IEkqmy03pgzoeqeI5dkQRKkuig9tWfwf6cU3RuGKvJzqT16ZqV2lboGm5A+Qn
 2Cm5bamX4TBgDBOEYmajccDjr8QId+NbTgQzvZ1/HOyae5A+cgBm12Ttc8binLkI2NdI
 gShA==
X-Gm-Message-State: AOAM530nPPBmGk2eu3ZFHTnYywagJh+1SbuNR7StsLBIY7J/vQJp0DEK
 bB8LAPmC4LOdIZg2ettuGcsE5A==
X-Google-Smtp-Source: ABdhPJwBYxQAJeO3zLVbLnPsU6sdc1ER0TAd4nBxAiSR8FoMcMtSdIQzf0eP7vEd0ILchkOD+liIoA==
X-Received: by 2002:a37:506:: with SMTP id 6mr21647287qkf.15.1629731145294;
 Mon, 23 Aug 2021 08:05:45 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.gmail.com with ESMTPSA id p187sm8689041qkd.101.2021.08.23.08.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 08:05:44 -0700 (PDT)
Message-ID: <79931b6db53a9a92e0e0d80270ccb1284f881dff.camel@linaro.org>
Subject: Re: [PATCH v8 07/10] hw/arm/sbsa-ref: add ITS support in SBSA GIC
From: shashi.mallela@linaro.org
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Aug 2021 11:05:43 -0400
In-Reply-To: <CAFEAcA9WVu+kjfCWwfGQV00yKgmdFDCSUpxNOu1BEBM3AZCWXg@mail.gmail.com>
References: <20210812165341.40784-1-shashi.mallela@linaro.org>
 <20210812165341.40784-8-shashi.mallela@linaro.org>
 <CAFEAcA9WVu+kjfCWwfGQV00yKgmdFDCSUpxNOu1BEBM3AZCWXg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x732.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 narmstrong@baylibre.com, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2021-08-19 at 14:27 +0100, Peter Maydell wrote:
> On Thu, 12 Aug 2021 at 17:53, Shashi Mallela <
> shashi.mallela@linaro.org> wrote:
> > Included creation of ITS as part of SBSA platform GIC
> > initialization.
> > 
> > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> > ---
> >  hw/arm/sbsa-ref.c | 79
> > ++++++++++++++++++++++++++++++++++++++++++++---
> >  1 file changed, 75 insertions(+), 4 deletions(-)
> > 
> > +static char *sbsa_get_version(Object *obj, Error **errp)
> > +{
> > +    SBSAMachineState *sms = SBSA_MACHINE(obj);
> > +
> > +    switch (sms->version) {
> > +    case SBSA_DEFAULT:
> > +        return g_strdup("default");
> > +    case SBSA_ITS:
> > +        return g_strdup("sbsaits");
> > +    default:
> > +        g_assert_not_reached();
> > +    }
> > +}
> > +
> > +static void sbsa_set_version(Object *obj, const char *value, Error
> > **errp)
> > +{
> > +    SBSAMachineState *sms = SBSA_MACHINE(obj);
> > +
> > +    if (!strcmp(value, "sbsaits")) {
> > +        sms->version = SBSA_ITS;
> > +    } else if (!strcmp(value, "default")) {
> > +        sms->version = SBSA_DEFAULT;
> > +    } else {
> > +        error_setg(errp, "Invalid version value");
> > +        error_append_hint(errp, "Valid values are default,
> > sbsaits.\n");
> > +    }
> > +}
> > 
> >  static void sbsa_ref_instance_init(Object *obj)
> >  {
> >      SBSAMachineState *sms = SBSA_MACHINE(obj);
> > 
> > +    sms->version = SBSA_ITS;
> >      sbsa_flash_create(sms);
> >  }
> > 
> > @@ -850,6 +915,12 @@ static void sbsa_ref_class_init(ObjectClass
> > *oc, void *data)
> >      mc->possible_cpu_arch_ids = sbsa_ref_possible_cpu_arch_ids;
> >      mc->cpu_index_to_instance_props = sbsa_ref_cpu_index_to_props;
> >      mc->get_default_cpu_node_id =
> > sbsa_ref_get_default_cpu_node_id;
> > +
> > +    object_class_property_add_str(oc, "version", sbsa_get_version,
> > +                                  sbsa_set_version);
> > +    object_class_property_set_description(oc, "version",
> > +                                          "Set the Version type. "
> > +                                          "Valid values are
> > default & sbsaits");
> 
> This doesn't look right; where has it come from ?
> 
> If you want a command line switch to let the user say whether the
> ITS should be present or not, you should use the same thing the
> virt board does, which is a bool property "its".
> 
> If you want the sbsa-ref board to become a proper "versioned machine
> type" such that users can say "-M sbsa-ref-6.1" and get the SBSA
> board exactly as QEMU 6.1 supplied it, that looks completely
> different
> (and is a heavy back-compatibility burden, so needs discussion about
> whether now is the right time to do it), and probably is better not
> tangled up with this patchseries.
> 
> thanks
> -- PMM
Since the memory map for sbsa-ref has been updated with ITS address
range added between distributor and redistributor regions(as per last
reveiw comments),this has resulted in a change in the redistributor
base address(as compared to previous sbsa-ref with no ITS
support).Hence there was a subsequent request for creating a versioning
logic to differentiate between ITS presence or absence which would be
of use to other modules (like TF-A) to pick the relevant redistributor
base address based on this versioning.



