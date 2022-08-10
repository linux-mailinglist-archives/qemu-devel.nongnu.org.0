Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3141C58F3BC
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 23:12:06 +0200 (CEST)
Received: from localhost ([::1]:56694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLszj-0003dC-Tj
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 17:12:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oLsxl-00026w-Qb
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 17:10:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oLsxh-0004Qe-NC
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 17:10:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660165796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AzcxXWnDC8ivZ4Sqj7U1v0MCXExPxBs3kq+Cn2QNbc0=;
 b=GKI2ExCAZXDLFdobBB3Uda2Icl/4mO1qy+FY0XaB0cO9vNk7jW9p4kXZIr+V8msWf8vpjS
 PTOQOm79huN9HUS0hf/tn8AOagHbpIni88wsXe+Tm2A8DHLNvT1JaiG/wTH3hW+O/VUkhq
 ydMWaLVlkCd75ue1okU8RnfHtTcTrSs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-OOirqYrgPDyaBee1Wmtwmw-1; Wed, 10 Aug 2022 17:09:47 -0400
X-MC-Unique: OOirqYrgPDyaBee1Wmtwmw-1
Received: by mail-ed1-f71.google.com with SMTP id
 z20-20020a05640235d400b0043e1e74a495so10000392edc.11
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 14:09:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=AzcxXWnDC8ivZ4Sqj7U1v0MCXExPxBs3kq+Cn2QNbc0=;
 b=obWLIh9UiiXDfLbSgz8sWOA3H8XC+/5yTJrUDU4/pvv60p1Yg3TgIwH+R6PWMry6GQ
 byIp4jGSQDD+GqoTEyaMYEiTKWtfCqlln44si9LF3yNUmOvtYYSs+kpQA/1THX9v1H0R
 m+wUB6yHxSMqSNGrkRL4CbxFCszcq4/eCEMyof955nXc/t+uOqg/FFOhELpkWRxuJ7eG
 jovLILYBu7gO0DXqlUlHTRzf71m5cMjDC+908JnIMBOs2PYmtL630PNey/uiVqoDx72K
 o4SIsYK9dlJC8180G6pV/70DYabPhdJuKHVZdI9YMIR5R6huFTOR68B6FFXWLaIMG3B6
 rfXg==
X-Gm-Message-State: ACgBeo0yr3wMSK6IrFm+AsgLpAgrW1XLH/NyIRq6nMkeEchFk12X/nk8
 7A5ArKENNaAHd9k1SbdcGOKywGl/yHbsgmeAQmveGrvkS76mSAxMU7GP9ClL/fzXwhymCdMzQB6
 FfILaO3H6wWIyni8=
X-Received: by 2002:a17:907:5ce:b0:730:bae0:deb with SMTP id
 wg14-20020a17090705ce00b00730bae00debmr22567370ejb.181.1660165786318; 
 Wed, 10 Aug 2022 14:09:46 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4c66vXW+DLtvsDH80iDkjMv8z257kSa/yFKgw3F+11mr1cKcxco9DcArfQwSz6oqaEdtkfng==
X-Received: by 2002:a17:907:5ce:b0:730:bae0:deb with SMTP id
 wg14-20020a17090705ce00b00730bae00debmr22567358ejb.181.1660165786038; 
 Wed, 10 Aug 2022 14:09:46 -0700 (PDT)
Received: from redhat.com ([2.52.152.113]) by smtp.gmail.com with ESMTPSA id
 20-20020a170906309400b00730fd9ccf84sm2713832ejv.90.2022.08.10.14.09.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 14:09:45 -0700 (PDT)
Date: Wed, 10 Aug 2022 17:09:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v3] pc: hide linuxboot RNG seed behind a machine property
Message-ID: <20220810170827-mutt-send-email-mst@kernel.org>
References: <20220810165942.104545-1-pbonzini@redhat.com>
 <20220810130346-mutt-send-email-mst@kernel.org>
 <CABgObfa0dr3H7tr8S5L+pLjFyJUMP7rVTPxr4senHDfofBq1RA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABgObfa0dr3H7tr8S5L+pLjFyJUMP7rVTPxr4senHDfofBq1RA@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, Aug 10, 2022 at 09:25:05PM +0200, Paolo Bonzini wrote:
> 
> 
> Il mer 10 ago 2022, 19:06 Michael S. Tsirkin <mst@redhat.com> ha scritto:
> 
>     > @@ -1387,6 +1405,7 @@ static void x86_machine_initfn(Object *obj)
>     >      x86ms->acpi = ON_OFF_AUTO_AUTO;
>     >      x86ms->pit = ON_OFF_AUTO_AUTO;
>     >      x86ms->pic = ON_OFF_AUTO_AUTO;
>     > +    x86ms->linuxboot_randomness = ON_OFF_AUTO_OFF;
>     >      x86ms->pci_irq_mask = ACPI_BUILD_PCI_IRQS;
>     >      x86ms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
>     >      x86ms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
> 
> 
>     This is a weird thing to do in that there's no way to make it auto now.
> 
> 
> Sure, -M x-linuxboot-randomness=auto works. And making it already on/off/auto
> will limit future patches to the injection logic rather than the QOM
> boilerplate.
> 
> Paolo

Hmm. It's unusual that auto is not the same as "no value at all".
But I guess there's no rule saying that can't be the case.
OK then.

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>




> 
>     And in that case, let's just make it a simple boolean property for now?
> 
>     > @@ -1426,6 +1445,12 @@ static void x86_machine_class_init(ObjectClass
>     *oc, void *data)
>     >      object_class_property_set_description(oc, X86_MACHINE_PIT,
>     >          "Enable i8254 PIT");
>     > 
>     > +    object_class_property_add(oc, X86_MACHINE_LINUXBOOT_RANDOMNESS,
>     "OnOffAuto",
>     > +        x86_machine_get_linuxboot_randomness,
>     x86_machine_set_linuxboot_randomness,
>     > +        NULL, NULL);
>     > +    object_class_property_set_description(oc,
>     X86_MACHINE_LINUXBOOT_RANDOMNESS,
>     > +        "Pass random number seed to -kernel Linux image");
>     > +
>     >      object_class_property_add(oc, X86_MACHINE_PIC, "OnOffAuto",
>     >                                x86_machine_get_pic,
>     >                                x86_machine_set_pic,
>     > diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
>     > index 8435733bd6..9cc3f5d338 100644
>     > --- a/include/hw/i386/pc.h
>     > +++ b/include/hw/i386/pc.h
>     > @@ -128,9 +128,6 @@ struct PCMachineClass {
>     > 
>     >      /* create kvmclock device even when KVM PV features are not exposed
>     */
>     >      bool kvmclock_create_always;
>     > -
>     > -    /* skip passing an rng seed for legacy machines */
>     > -    bool legacy_no_rng_seed;
>     >  };
>     > 
>     >  #define TYPE_PC_MACHINE "generic-pc-machine"
>     > diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
>     > index 62fa5774f8..d7a2eb6f1c 100644
>     > --- a/include/hw/i386/x86.h
>     > +++ b/include/hw/i386/x86.h
>     > @@ -70,6 +70,7 @@ struct X86MachineState {
>     >      OnOffAuto acpi;
>     >      OnOffAuto pit;
>     >      OnOffAuto pic;
>     > +    OnOffAuto linuxboot_randomness;
>     > 
>     >      char *oem_id;
>     >      char *oem_table_id;
>     > @@ -94,6 +95,7 @@ struct X86MachineState {
>     >  #define X86_MACHINE_OEM_ID           "x-oem-id"
>     >  #define X86_MACHINE_OEM_TABLE_ID     "x-oem-table-id"
>     >  #define X86_MACHINE_BUS_LOCK_RATELIMIT  "bus-lock-ratelimit"
>     > +#define X86_MACHINE_LINUXBOOT_RANDOMNESS "x-linuxboot-randomness"
>     > 
>     >  #define TYPE_X86_MACHINE   MACHINE_TYPE_NAME("x86")
>     >  OBJECT_DECLARE_TYPE(X86MachineState, X86MachineClass, X86_MACHINE)
>     > @@ -126,8 +128,7 @@ void x86_bios_rom_init(MachineState *ms, const char
>     *default_firmware,
>     >  void x86_load_linux(X86MachineState *x86ms,
>     >                      FWCfgState *fw_cfg,
>     >                      int acpi_data_size,
>     > -                    bool pvh_enabled,
>     > -                    bool legacy_no_rng_seed);
>     > +                    bool pvh_enabled);
>     > 
>     >  bool x86_machine_is_smm_enabled(const X86MachineState *x86ms);
>     >  bool x86_machine_is_acpi_enabled(const X86MachineState *x86ms);
>     > --
>     > 2.37.1
> 
> 


