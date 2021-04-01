Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9545235153E
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 15:36:08 +0200 (CEST)
Received: from localhost ([::1]:34826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRxUV-0007wM-M1
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 09:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRxRy-0006Nv-Hx
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:33:30 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:41760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRxRv-0006un-VG
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:33:30 -0400
Received: by mail-io1-xd2c.google.com with SMTP id z3so2198379ioc.8
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 06:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FGOQmH/WShoS1HBAf7ApeqTR6C8FjbAq6rEnpsZfXy8=;
 b=gbERk778VjFAKLqhkXVw/4cKmkD392UwpeGSyjK3k/h+1jQsFMTZRwlS0fI17kCdTU
 RyNS/IJeptcFpfaQM8m2wmh55eqmW2UCGqvYxxwXQY9Po/FwWi/72zQApbsXsbr2rRgM
 riWywEcu0f8Y4qgofUa3Ff26eYkfT/SqxplWyc9ZxJKUo+qo0I2x2YX8GPt8Tgc2+izo
 Y65UXWvusSiLGXQFc2JEEgBXzno4khKo31XzxUfQSn3NSmv9fANpqb2kwRTYI3b53S6G
 3OjCFEXmP7V5yNFQT4fFhM8oIrDkRM5bkgTvFEd2wxvfFiY+9tbaL0Jlo3HL4rtRXn6x
 CReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FGOQmH/WShoS1HBAf7ApeqTR6C8FjbAq6rEnpsZfXy8=;
 b=W9BVbp1cUSU1VE7WZdyGykWuw6B8dVTWM0S7GZHGrvouAxmiU6XBj2k40D4yo6EFLK
 vGVvDFdul3h3Q9LoCrg/qgFTdMQFoDrvgIjBM1F+Qq5z1OAMyF1dCbIugTUdWUdR0VwG
 TJHePpbSP/HFg/5wMIqdQr2ll2yTQJyKRD42Hf/VipOTyOn6BtPgHhz0B7iBFUMpPAFf
 oZkdgV25hhqvteDs4gh9FMPh7dAn5Ar/jcMinaZtGxRHDXxPlCi/Ql6+pEB0vsxdqICI
 gu50nBZXhzJn/iXB/5SsaLLqz/tPwi7E/CofprHH3wfdWVnCEO6prXIoF1wLX7bn/M3X
 q14w==
X-Gm-Message-State: AOAM531Iu5bRGmXd5KZ8X8LkbaTsnVr+orc32VG5mhOvu1sRBc0Ycez6
 mj/ALKrX0JNBwCsOafqmoT9B76hrv+1DcDqpiJt1
X-Google-Smtp-Source: ABdhPJz5VxKt33Myi17rge+buwRyXCRZ1Om1eSLCQjgWu7otoCOCq6mW7nbWrMeAQFnZbgv9C3tVg9/GmRMUwcKawAg=
X-Received: by 2002:a6b:db15:: with SMTP id t21mr6674763ioc.133.1617284004038; 
 Thu, 01 Apr 2021 06:33:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1615972140.git.haibo.xu@linaro.org>
 <881871e8394fa18a656dfb105d42e6099335c721.1615972140.git.haibo.xu@linaro.org>
 <YFJiZSW0OjdQdOXZ@work-vm>
 <CAJc+Z1FVwgVHGP6b0cbFaeWOqTGe9WJDV7UQgf6TP1Qthu2O4w@mail.gmail.com>
 <YFzmjCAtz3WwbOmt@work-vm>
In-Reply-To: <YFzmjCAtz3WwbOmt@work-vm>
From: Haibo Xu <haibo.xu@linaro.org>
Date: Thu, 1 Apr 2021 21:33:12 +0800
Message-ID: <CAJc+Z1FZxSYB_zJit4+0uTR-88VqQL+-01XNMSEfua-dXDy6Wg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/5] Add migration support for KVM guest with MTE
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=haibo.xu@linaro.org; helo=mail-io1-xd2c.google.com
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
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 26 Mar 2021 at 03:38, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Haibo Xu (haibo.xu@linaro.org) wrote:
> > On Thu, 18 Mar 2021 at 04:11, Dr. David Alan Gilbert
> > <dgilbert@redhat.com> wrote:
> > >
> > > * Haibo Xu (haibo.xu@linaro.org) wrote:
> > > > To make it easier to keep the page tags sync with
> > > > the page data, tags for one page are appended to
> > > > the data during ram save iteration.
> > > >
> > > > This patch only add the pre-copy migration support.
> > > > Post-copy and compress as well as zero page saving
> > > > are not supported yet.
> > > >
> > > > Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> > >
> > > My guess is that this doesn't work with a lot of other options; e.g.
> > > postcopy and probably compression and a bunch of other things.
> > > Postcopy I can see you'll need some interesting kernel changes for -
> > > you'd need to be able to atomically place a  page with it's tag data.
> > >
> > > You probably need to add stuff to migrate_caps_check  to disable
> > > features that you don't support.
> > >
> >
> > Hi David,
> >
> > Thanks so much for the comments!
> >
> > You are right, this RFC patch only supports pre-copy mode, no
> > postcopy, no compression.
> > As a RFC, here just want to finalize the tag migration process, that is:
> > 1. let the tag go with the page data(the current choice) which may be
> > a little complex to put
> >     them into the current migration process.
>
> I think it's probably the easiest.
>

Agree!

> > 2. migrate them separately which is easy to implement with the current
> > migration(treat the tags
> >     as device status), but it would be hard to keep the page data and
> > tag to sync with each other.
> > 3. Any other ways?
> >
> > Once the tag migration process is finalized, a new formal patch series
> > with postcopy as well as
> > compression should be reworked.
>
> It's probably best to look what you would have to do to fit it in with
> those before finalising the basic version; not necessary implement them
> - just get an idea.
>

Thanks for the suggestion!

> > What's more, you mentioned that "some interesting kernel changes are
> > needed to atomically
> > place a  page with it's tag data". You mean a single kernel API to
> > store page data and tag in
> > the migration load process?
>
> Yes;  see migration/postcopy-ram.c postcopy_place_page  - it has the
> problem of placing the whole page in memory before the guest starts
> usign it; I think for MTE you're going to have to put the MTE data in at
> the same time.
>

Good point! Will check this with the kernel guys.

> Dave
>
> >
> > Regards,
> > Haibo
> >
> > > > ---
> > > >  include/hw/arm/virt.h    |  2 +
> > > >  include/migration/misc.h |  1 +
> > > >  migration/ram.c          | 86 +++++++++++++++++++++++++++++++++++++++-
> > > >  3 files changed, 88 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> > > > index 921416f918..8b28cde8bf 100644
> > > > --- a/include/hw/arm/virt.h
> > > > +++ b/include/hw/arm/virt.h
> > > > @@ -166,6 +166,8 @@ struct VirtMachineState {
> > > >      PCIBus *bus;
> > > >      char *oem_id;
> > > >      char *oem_table_id;
> > > > +    /* migrate memory tags */
> > > > +    NotifierWithReturn precopy_notifier;
> > > >  };
> > > >
> > > >  #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
> > > > diff --git a/include/migration/misc.h b/include/migration/misc.h
> > > > index bccc1b6b44..005133f471 100644
> > > > --- a/include/migration/misc.h
> > > > +++ b/include/migration/misc.h
> > > > @@ -38,6 +38,7 @@ void precopy_add_notifier(NotifierWithReturn *n);
> > > >  void precopy_remove_notifier(NotifierWithReturn *n);
> > > >  int precopy_notify(PrecopyNotifyReason reason, Error **errp);
> > > >  void precopy_enable_free_page_optimization(void);
> > > > +void precopy_enable_metadata_migration(void);
> > > >
> > > >  void ram_mig_init(void);
> > > >  void qemu_guest_free_page_hint(void *addr, size_t len);
> > > > diff --git a/migration/ram.c b/migration/ram.c
> > > > index 72143da0ac..e67b798c3b 100644
> > > > --- a/migration/ram.c
> > > > +++ b/migration/ram.c
> > > > @@ -53,10 +53,12 @@
> > > >  #include "block.h"
> > > >  #include "sysemu/sysemu.h"
> > > >  #include "sysemu/cpu-throttle.h"
> > > > +#include "sysemu/kvm.h"
> > > >  #include "savevm.h"
> > > >  #include "qemu/iov.h"
> > > >  #include "multifd.h"
> > > >  #include "sysemu/runstate.h"
> > > > +#include "kvm_arm.h"
> > > >
> > > >  #if defined(__linux__)
> > > >  #include "qemu/userfaultfd.h"
> > > > @@ -80,6 +82,9 @@
> > > >  #define RAM_SAVE_FLAG_XBZRLE   0x40
> > > >  /* 0x80 is reserved in migration.h start with 0x100 next */
> > > >  #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
> > > > +#define RAM_SAVE_FLAG_MTE              0x200
> > >
> > > I think that's using the last free bit in the flags field, which is a
> > > bit painful.
> > >
> >
> > Yes, only 0x80(reserved) and 0x200 are available.
> >
> > > > +#define MTE_GRANULE_SIZE   (16)
> > > >
> > > >  static inline bool is_zero_range(uint8_t *p, uint64_t size)
> > > >  {
> > > > @@ -317,6 +322,8 @@ struct RAMState {
> > > >      bool ram_bulk_stage;
> > > >      /* The free page optimization is enabled */
> > > >      bool fpo_enabled;
> > > > +    /* The RAM meta data(e.t memory tag) is enabled */
> > > > +    bool metadata_enabled;
> > > >      /* How many times we have dirty too many pages */
> > > >      int dirty_rate_high_cnt;
> > > >      /* these variables are used for bitmap sync */
> > > > @@ -394,6 +401,15 @@ void precopy_enable_free_page_optimization(void)
> > > >      ram_state->fpo_enabled = true;
> > > >  }
> > > >
> > > > +void precopy_enable_metadata_migration(void)
> > > > +{
> > > > +    if (!ram_state) {
> > > > +        return;
> > > > +    }
> > > > +
> > > > +    ram_state->metadata_enabled = true;
> > > > +}
> > > > +
> > > >  uint64_t ram_bytes_remaining(void)
> > > >  {
> > > >      return ram_state ? (ram_state->migration_dirty_pages * TARGET_PAGE_SIZE) :
> > > > @@ -1134,6 +1150,61 @@ static bool control_save_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
> > > >      return true;
> > > >  }
> > > >
> > > > +static int save_normal_page_mte_tags(QEMUFile *f, uint8_t *addr)
> > > > +{
> > > > +    uint8_t *tag_buf = NULL;
> > > > +    uint64_t ipa;
> > > > +    int size = TARGET_PAGE_SIZE / MTE_GRANULE_SIZE;
> > >
> > > This function needs to be mostly somewhere aarch specific; or somehow
> > > made more generic.
> > > We shouldn't have RAM_SAVE_FLAG_MTE as well - we should be something
> > > like RAM_SAVE_FLAG_ARCH_METADATA and that way other architectures with
> > > something else glued onto pages can do something similar.
> > > Try and keep migration/ architecture independent.
> >
> > Yes, it should be arch independent and handled with a more abstract way.
> >
> > >
> > > > +    if (kvm_physical_memory_addr_from_host(kvm_state, addr, &ipa)) {
> > > > +        /* Buffer for the page tags(one byte per tag) */
> > > > +        tag_buf = g_try_malloc0(size);
> > >
> > > It feels like you want to allocate tag_buf in setup and free it at the
> > > end rather than doing this in every page.
> >
> > Yes, the tag buffer allocation could be moved to migration save/load
> > setup and cleanup function.
> >
> > >
> > > > +        if (!tag_buf) {
> > > > +            error_report("%s: Error allocating MTE tag_buf", __func__);
> > > > +            return 0;
> > > > +        }
> > > > +
> > > > +        if (kvm_arm_mte_get_tags(ipa, TARGET_PAGE_SIZE, tag_buf) < 0) {
> > > > +            error_report("%s: Can't get MTE tags from guest", __func__);
> > >
> > > For any error like this you probably want to say the addresses to make
> > > it easier to debug when it fails.
> > >
> >
> > Good suggestion! Will add the "address" info to the log.
> >
> > > > +            g_free(tag_buf);
> > > > +            return 0;
> > > > +        }
> > > > +
> > > > +        qemu_put_buffer(f, tag_buf, size);
> > > > +
> > > > +        g_free(tag_buf);
> > > > +
> > > > +        return size;
> > > > +    }
> > > > +
> > > > +    return 0;
> > > > +}
> > > > +
> > > > +static void load_normal_page_mte_tags(QEMUFile *f, uint8_t *addr)
> > > > +{
> > > > +    uint8_t *tag_buf = NULL;
> > > > +    uint64_t ipa;
> > > > +    int size = TARGET_PAGE_SIZE / MTE_GRANULE_SIZE;
> > > > +
> > > > +    if (kvm_physical_memory_addr_from_host(kvm_state, addr, &ipa)) {
> > > > +        /* Buffer for the page tags(one byte per tag) */
> > > > +        tag_buf = g_try_malloc0(size);
> > > > +        if (!tag_buf) {
> > > > +            error_report("%s: Error allocating MTE tag_buf", __func__);
> > > > +            return;
> > > > +        }
> > > > +
> > > > +        qemu_get_buffer(f, tag_buf, size);
> > > > +        if (kvm_arm_mte_set_tags(ipa, TARGET_PAGE_SIZE, tag_buf) < 0) {
> > >
> > > what protections are there here to stop you setting the mte on something
> > > useful, like part of the host kernel or qemu?
> >
> > Kernel would do some parameter check(e.t ipa within a valid slot)
> > before setting the tag data.
> >
> > >
> > > > +            error_report("%s: Can't set MTE tags to guest", __func__);
> > > > +        }
> > > > +
> > > > +        g_free(tag_buf);
> > > > +    }
> > > > +
> > > > +    return;
> > > > +}
> > > > +
> > > >  /*
> > > >   * directly send the page to the stream
> > > >   *
> > > > @@ -1148,6 +1219,10 @@ static bool control_save_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
> > > >  static int save_normal_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
> > > >                              uint8_t *buf, bool async)
> > > >  {
> > > > +    if (rs->metadata_enabled) {
> > > > +        offset |= RAM_SAVE_FLAG_MTE;
> > > > +    }
> > > > +
> > > >      ram_counters.transferred += save_page_header(rs, rs->f, block,
> > > >                                                   offset | RAM_SAVE_FLAG_PAGE);
> > > >      if (async) {
> > > > @@ -1159,6 +1234,11 @@ static int save_normal_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
> > > >      }
> > > >      ram_counters.transferred += TARGET_PAGE_SIZE;
> > > >      ram_counters.normal++;
> > > > +
> > > > +    if (rs->metadata_enabled) {
> > > > +        ram_counters.transferred += save_normal_page_mte_tags(rs->f, buf);
> > > > +    }
> > > > +
> > > >      return 1;
> > > >  }
> > > >
> > > > @@ -2189,6 +2269,7 @@ static void ram_state_reset(RAMState *rs)
> > > >      rs->last_version = ram_list.version;
> > > >      rs->ram_bulk_stage = true;
> > > >      rs->fpo_enabled = false;
> > > > +    rs->metadata_enabled = false;
> > > >  }
> > > >
> > > >  #define MAX_WAIT 50 /* ms, half buffered_file limit */
> > > > @@ -3779,7 +3860,7 @@ static int ram_load_precopy(QEMUFile *f)
> > > >              trace_ram_load_loop(block->idstr, (uint64_t)addr, flags, host);
> > > >          }
> > > >
> > > > -        switch (flags & ~RAM_SAVE_FLAG_CONTINUE) {
> > > > +        switch (flags & ~(RAM_SAVE_FLAG_CONTINUE | RAM_SAVE_FLAG_MTE)) {
> > > >          case RAM_SAVE_FLAG_MEM_SIZE:
> > > >              /* Synchronize RAM block list */
> > > >              total_ram_bytes = addr;
> > > > @@ -3849,6 +3930,9 @@ static int ram_load_precopy(QEMUFile *f)
> > > >
> > > >          case RAM_SAVE_FLAG_PAGE:
> > > >              qemu_get_buffer(f, host, TARGET_PAGE_SIZE);
> > > > +            if (flags & RAM_SAVE_FLAG_MTE) {
> > > > +                load_normal_page_mte_tags(f, host);
> > > > +            }
> > > >              break;
> > > >
> > > >          case RAM_SAVE_FLAG_COMPRESS_PAGE:
> > > > --
> > > > 2.17.1
> > > >
> > > --
> > > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > >
> >
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>

