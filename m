Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77266351529
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 15:30:16 +0200 (CEST)
Received: from localhost ([::1]:49128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRxOo-0001yY-U8
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 09:30:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRxM2-0000K9-0T
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:27:22 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:43962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRxLw-0003m5-W3
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:27:21 -0400
Received: by mail-io1-xd31.google.com with SMTP id z136so2164550iof.10
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 06:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yd/fvxHCn/BsFdv4/yg+B+DPng9MSeB6yTC7R4W1v1M=;
 b=fOl3bmpIon3Zl/8naJOLH91ZMu+tQ6w5U0/KzUEHSRJLuJsu3U45jMe5M6F3hsYdlG
 G3RfMB/QMwX7V/Ir2ggdzGPOPOvpfIGEfvIlU7fZxdTORwVq0D0QRI4PoyQQO2BaAhZB
 F+gLhwddNKeOPD6SJgbDgu4iZinxk65z8Gm9Lt5lNuDWG/cw/tWrSZyLkNRXOSKvukNB
 PAhojXdvxI7Uin6o5eQNP3SmHGc8gyWTRKy3BecJm3WVvKjqDzy3M3naZv2ozf/8iCGU
 GYgJEwhCY6Wk07xGbEPIbZpN6q3c5bI5uNXI+7sCgbxFK/LUb60AfwHTXhXQnGu0xCwn
 tEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yd/fvxHCn/BsFdv4/yg+B+DPng9MSeB6yTC7R4W1v1M=;
 b=ua8N+oGUPWA9KmBTeOIbG58aRTeD9P6hvCfddW74uu6LnGKu2pM+gXZY8aMZXDLcGa
 Lb7YBt/Zg2x6/ktyOF/k5fVp1escMTrIuGO1nkq0US+SbRSCS46Q9MeaesWyTXBo6tbb
 hAmh4rJOL5//lNPkNCFdf8xA+QOZbYaRPPO38lfVC08xtteWhZ+g2sFChpIJLM8M/Zha
 0hp/zrW3D3k8R6AMq/u3vxP0qry9ziFOO7iEmQCxWYoWbNqUPxA62UTbWdf4EAcpGikb
 dOeIj2/Fl6yly7pPzR0y4qGbWxNHLDztvoXwf831xK6IO0uZ9aX8vZTM/P4ivIfxWnDO
 PUjw==
X-Gm-Message-State: AOAM530VsrXpCutod2GjY8XbzQNL0PmgBc9Q9SGZCnyvorzu1Zvh1uLz
 +mNHM4yFa2yvL2M+oA3msHuyvWw8U/zoYb02yVEk
X-Google-Smtp-Source: ABdhPJzjLzuKmI6NH/LgTpbOrvrxz7d/qFX3oaexigCRw8CZ07sQ1nPs+LnsWX7kJLugnKy/AMr3kw0/DUiYA+seKOo=
X-Received: by 2002:a5d:9e09:: with SMTP id h9mr6946541ioh.178.1617283630409; 
 Thu, 01 Apr 2021 06:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1615972140.git.haibo.xu@linaro.org>
 <881871e8394fa18a656dfb105d42e6099335c721.1615972140.git.haibo.xu@linaro.org>
 <87y2ebmegw.fsf@secure.mitica>
In-Reply-To: <87y2ebmegw.fsf@secure.mitica>
From: Haibo Xu <haibo.xu@linaro.org>
Date: Thu, 1 Apr 2021 21:26:58 +0800
Message-ID: <CAJc+Z1GLPxWhoTJqh77QddmO9Rg3=djsrAX_3WiWPDS+_=ZDgQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/5] Add migration support for KVM guest with MTE
To: Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=haibo.xu@linaro.org; helo=mail-io1-xd31.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 25 Mar 2021 at 23:37, Juan Quintela <quintela@redhat.com> wrote:
>
> Haibo Xu <haibo.xu@linaro.org> wrote:
> > To make it easier to keep the page tags sync with
> > the page data, tags for one page are appended to
> > the data during ram save iteration.
> >
> > This patch only add the pre-copy migration support.
> > Post-copy and compress as well as zero page saving
> > are not supported yet.
> >
> > Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
>
>
> >  #define RAM_SAVE_FLAG_XBZRLE   0x40
> >  /* 0x80 is reserved in migration.h start with 0x100 next */
> >  #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
> > +#define RAM_SAVE_FLAG_MTE              0x200
>
> Flags are really a scarce resource.  You are using one here, when you
> know that you will always have the feature enable (or not), so you can
> do better during negotiation IMHO.
>

Yes, any suggestions are welcomed to finalize the MTE migration support!

>
> > +void precopy_enable_metadata_migration(void)
> > +{
> > +    if (!ram_state) {
> > +        return;
> > +    }
> > +
> > +    ram_state->metadata_enabled = true;
> > +}
>
> My understanding is that in your following patch, if mte is enabled, you
> will always sent mte tags, for all pages needed, right?

Yes, for the current kernel support, we can't tell whether the MTE was enabled
for a specific page.

>
> > +static int save_normal_page_mte_tags(QEMUFile *f, uint8_t *addr)
> > +{
> > +    uint8_t *tag_buf = NULL;
> > +    uint64_t ipa;
> > +    int size = TARGET_PAGE_SIZE / MTE_GRANULE_SIZE;
> > +
> > +    if (kvm_physical_memory_addr_from_host(kvm_state, addr, &ipa)) {
> > +        /* Buffer for the page tags(one byte per tag) */
> > +        tag_buf = g_try_malloc0(size);
>
> size of the buffer is known at start of migration.  Just get a buffer
> and reuse it?

Yes, we can pre-allocate the buffer during the migration setup time

>
> Do zero pages have mte tags?  From migration point of view, a zero page
> is a page that is just full of zeros, i.e. nothing else special.
> Because you are not sending any for them.
>

Yes, I think we can do some optimization for the zero page migration support.

>
>
> > @@ -1148,6 +1219,10 @@ static bool control_save_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
> >  static int save_normal_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
> >                              uint8_t *buf, bool async)
> >  {
> > +    if (rs->metadata_enabled) {
> > +        offset |= RAM_SAVE_FLAG_MTE;
>
> You don't really need the flag, for you normal pages are just
> TARGET_PAGE_SIZE + (TARGET_PAGE_SIZE/MTE_)
>

So you suggest to use the size field to indicate whether tags are available?

>
> > +    }
> > +
> >      ram_counters.transferred += save_page_header(rs, rs->f, block,
> >                                                   offset | RAM_SAVE_FLAG_PAGE);
> >      if (async) {
> > @@ -1159,6 +1234,11 @@ static int save_normal_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
> >      }
> >      ram_counters.transferred += TARGET_PAGE_SIZE;
> >      ram_counters.normal++;
> > +
> > +    if (rs->metadata_enabled) {
>
> See?  You are not checking the flag, you are checking the bool setup at
> the beggining of migration.

The idea is to only migrate the memory tags when MTE was enabled for the VM.
Could you be more elaborate on "You are not checking the flag"?

>
> > +        ram_counters.transferred += save_normal_page_mte_tags(rs->f, buf);
> > +    }
> > +
> >      return 1;
> >  }
> >
> > @@ -2189,6 +2269,7 @@ static void ram_state_reset(RAMState *rs)
> >      rs->last_version = ram_list.version;
> >      rs->ram_bulk_stage = true;
> >      rs->fpo_enabled = false;
> > +    rs->metadata_enabled = false;
> >  }
> >
> >  #define MAX_WAIT 50 /* ms, half buffered_file limit */
> > @@ -3779,7 +3860,7 @@ static int ram_load_precopy(QEMUFile *f)
> >              trace_ram_load_loop(block->idstr, (uint64_t)addr, flags, host);
> >          }
> >
> > -        switch (flags & ~RAM_SAVE_FLAG_CONTINUE) {
> > +        switch (flags & ~(RAM_SAVE_FLAG_CONTINUE | RAM_SAVE_FLAG_MTE)) {
>
> Creating the flag is hurting you here also.
>
> >          case RAM_SAVE_FLAG_MEM_SIZE:
> >              /* Synchronize RAM block list */
> >              total_ram_bytes = addr;
> > @@ -3849,6 +3930,9 @@ static int ram_load_precopy(QEMUFile *f)
> >
> >          case RAM_SAVE_FLAG_PAGE:
> >              qemu_get_buffer(f, host, TARGET_PAGE_SIZE);
> > +            if (flags & RAM_SAVE_FLAG_MTE) {
> > +                load_normal_page_mte_tags(f, host);
> > +            }
>
> I don't claim to understand the MTE, but my understanding is that if we
> are using MTE, all pages have to have MTE flags, right?
>
> So, somtehing like
>
> is_mte_enabled()
>
> that I told in the other thread looks like a good idea.
>

Yes, we do need a function like this.

> Later, Juan.
>
> >              break;
> >
> >          case RAM_SAVE_FLAG_COMPRESS_PAGE:
>

