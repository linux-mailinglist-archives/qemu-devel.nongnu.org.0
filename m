Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C45FE2E0635
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 07:44:48 +0100 (CET)
Received: from localhost ([::1]:51734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krbPb-0002v5-BN
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 01:44:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1krbMf-0002P1-Gl; Tue, 22 Dec 2020 01:41:45 -0500
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:39492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1krbMd-0008F2-BF; Tue, 22 Dec 2020 01:41:45 -0500
Received: by mail-yb1-xb34.google.com with SMTP id k4so6970819ybp.6;
 Mon, 21 Dec 2020 22:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oxvYqoPwDEbK+1X4Xq1eL/JN/GGMAxT7W1YdFmAiO40=;
 b=M57oxlJGn6t2//bD2yTrB4VtJA8A+cCi3jwvrbOkmKj4xthfMkY3sRwUv6HBh1vcb+
 DDHE1h72zPlinDOi4WQQXC0XE1E3GERJU5HA/mrG9SP8Od9RnRNbPj1VK9vtPqgj0XUj
 iGOkzeQB4/1RUFtPb2JTRIAR8+kc4SUtM9R6LRJR6hTFuUU3nzdZdg7OIKYedXFdBL91
 24F4ndEwQajc/s5O7EM+FOrUnWL3eG3Y26Gl4j36dJ0/YEqN2Do/46ZmFl0ZDhmet+hY
 V95nfyE0hmUD9tlNOiMRzVj0mwhkYO+BB3Cu8VEAcMe7iPrr4yRZ8dJ/JkTHRjWAnH/T
 7ghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oxvYqoPwDEbK+1X4Xq1eL/JN/GGMAxT7W1YdFmAiO40=;
 b=ua9iWDKImOGODlBQ4I/4mdoS5IIddxJ4f/6M7s53V6cbzTFSC5m3H2vBZeTI5ietTH
 zCHsN0d0Cgu8ZVV1NqdF+usVKDQ023QzuRuAPZAI2Hp/PwJP/Q1q8AXvkuW37jBQf7KW
 vPIG7NPZrkB5Ujc1zfazER1mcC2LqgxmJBu1OXD4XU49ed63tcQj6v8tbSdLj1KHGVUO
 XPzbLA3Za7cOnpivws6QUEOcikePCXj4r3HvW+WYHDkAeIA0upzpkkpWv3ChsVWuZ8DY
 NVc3pgtJBZXDa+K2Hyk4yszS/qDXrrZuKN2A5xOgmHUpYLmh+ZJjiEbZSrbzuDnnYnbZ
 Mang==
X-Gm-Message-State: AOAM533fx33QP4WwpzNwKhbwieGm6rU0bKNE0z4DGyZlb0plTTVsNB2Z
 CVyF8Nk6c/sMAmLHkiuY+8JNrMIoaulWTZI6cxA=
X-Google-Smtp-Source: ABdhPJzoLTWibtXDtcM1m+82HXBdWqjluNn4a/gkqPnOlvb/Rfu8afnIjuQuj99JBuM6JmdIQytUIrTUfIJNfVeuEfc=
X-Received: by 2002:a25:4744:: with SMTP id u65mr28866519yba.239.1608619302038; 
 Mon, 21 Dec 2020 22:41:42 -0800 (PST)
MIME-Version: 1.0
References: <1607668640-33970-1-git-send-email-bmeng.cn@gmail.com>
 <1607668640-33970-2-git-send-email-bmeng.cn@gmail.com>
 <20201221155159.GA23373@fralle-msi>
In-Reply-To: <20201221155159.GA23373@fralle-msi>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 22 Dec 2020 14:41:30 +0800
Message-ID: <CAEUhbmU2sTkFvMFwtAjqp3t5kyMOysxhBHbvGVfRc1iq0KZJmQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] hw/block: m25p80: Implement AAI-WP command support
 for SST flashes
To: Francisco Iglesias <frasse.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Francisco,

On Mon, Dec 21, 2020 at 11:52 PM Francisco Iglesias
<frasse.iglesias@gmail.com> wrote:
>
> Hi Bin,
>
> On [2020 Dec 11] Fri 14:37:20, Bin Meng wrote:
> > From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> >
> > Auto Address Increment (AAI) Word-Program is a special command of
> > SST flashes. AAI-WP allows multiple bytes of data to be programmed
> > without re-issuing the next sequential address location.
> >
> > Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >
> > ---
> >
> > Changes in v3:
> > - initialize aai_enable to false in reset_memory()
> >
> > Changes in v2:
> > - add aai_enable into the vmstate
> > - validate AAI command before decoding a new command
> > - log guest errors during AAI_WP command handling
> > - report AAI status in the status register
> > - abort AAI programming when address is wrapped
> > - make sure AAI programming starts from the even address
> >
> >  hw/block/m25p80.c | 61 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 61 insertions(+)
> >
> > diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> > index 236e1b4..802a21d 100644
> > --- a/hw/block/m25p80.c
> > +++ b/hw/block/m25p80.c
> > @@ -359,6 +359,7 @@ typedef enum {
> >      QPP_4 = 0x34,
> >      RDID_90 = 0x90,
> >      RDID_AB = 0xab,
> > +    AAI_WP = 0xad,
> >
> >      ERASE_4K = 0x20,
> >      ERASE4_4K = 0x21,
> > @@ -449,6 +450,7 @@ struct Flash {
> >      bool four_bytes_address_mode;
> >      bool reset_enable;
> >      bool quad_enable;
> > +    bool aai_enable;
> >      uint8_t ear;
> >
> >      int64_t dirty_page;
> > @@ -664,6 +666,11 @@ static void complete_collecting_data(Flash *s)
> >      case PP4_4:
> >          s->state = STATE_PAGE_PROGRAM;
> >          break;
> > +    case AAI_WP:
> > +        /* AAI programming starts from the even address */
> > +        s->cur_addr &= ~BIT(0);
> > +        s->state = STATE_PAGE_PROGRAM;
> > +        break;
> >      case READ:
> >      case READ4:
> >      case FAST_READ:
> > @@ -762,6 +769,7 @@ static void reset_memory(Flash *s)
> >      s->write_enable = false;
> >      s->reset_enable = false;
> >      s->quad_enable = false;
> > +    s->aai_enable = false;
> >
> >      switch (get_man(s)) {
> >      case MAN_NUMONYX:
> > @@ -932,6 +940,15 @@ static void decode_qio_read_cmd(Flash *s)
> >      s->state = STATE_COLLECTING_DATA;
> >  }
> >
> > +static bool is_valid_aai_cmd(uint32_t value)
> > +{
> > +    if (value == AAI_WP || value == WRDI || value == RDSR) {
> > +        return true;
> > +    } else {
> > +        return false;
> > +    }
>
> For fewer lines (perhaps also rename value -> cmd):
>
> return value == AAI_WP || value == WRDI || value == RDSR;

Sure!

>
>
> > +}
> > +
> >  static void decode_new_cmd(Flash *s, uint32_t value)
> >  {
> >      int i;
> > @@ -943,6 +960,11 @@ static void decode_new_cmd(Flash *s, uint32_t value)
> >          s->reset_enable = false;
> >      }
> >
> > +    if (get_man(s) == MAN_SST && s->aai_enable && !is_valid_aai_cmd(value)) {
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "M25P80: Invalid cmd within AAI programming sequence");
> > +    }
> > +
> >      switch (value) {
> >
> >      case ERASE_4K:
> > @@ -1008,6 +1030,9 @@ static void decode_new_cmd(Flash *s, uint32_t value)
> >
> >      case WRDI:
> >          s->write_enable = false;
> > +        if (get_man(s) == MAN_SST) {
> > +            s->aai_enable = false;
> > +        }
> >          break;
> >      case WREN:
> >          s->write_enable = true;
> > @@ -1018,6 +1043,10 @@ static void decode_new_cmd(Flash *s, uint32_t value)
> >          if (get_man(s) == MAN_MACRONIX) {
> >              s->data[0] |= (!!s->quad_enable) << 6;
> >          }
> > +        if (get_man(s) == MAN_SST) {
> > +            s->data[0] |= (!!s->aai_enable) << 6;
> > +        }
> > +
> >          s->pos = 0;
> >          s->len = 1;
> >          s->data_read_loop = true;
> > @@ -1160,6 +1189,24 @@ static void decode_new_cmd(Flash *s, uint32_t value)
> >      case RSTQIO:
> >          s->quad_enable = false;
> >          break;
> > +    case AAI_WP:
> > +        if (get_man(s) == MAN_SST) {
> > +            if (s->write_enable) {
> > +                if (s->aai_enable) {
> > +                    s->state = STATE_PAGE_PROGRAM;
> > +                } else {
> > +                    s->aai_enable = true;
> > +                    s->needed_bytes = get_addr_length(s);
> > +                    s->state = STATE_COLLECTING_DATA;
> > +                }
> > +            } else {
> > +                qemu_log_mask(LOG_GUEST_ERROR,
> > +                              "M25P80: AAI_WP with write protect\n");
> > +            }
> > +        } else {
> > +            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Unknown cmd %x\n", value);
> > +        }
> > +        break;
> >      default:
> >          s->pos = 0;
> >          s->len = 1;
> > @@ -1205,6 +1252,19 @@ static uint32_t m25p80_transfer8(SSISlave *ss, uint32_t tx)
> >          trace_m25p80_page_program(s, s->cur_addr, (uint8_t)tx);
> >          flash_write8(s, s->cur_addr, (uint8_t)tx);
> >          s->cur_addr = (s->cur_addr + 1) & (s->size - 1);
> > +
> > +        if (get_man(s) == MAN_SST && s->aai_enable && s->cur_addr == 0) {
>
> I had a another look at above and think [1] actually speeks about wrapping
> when hitting into protected areas. Since we do not handle those at the
> moment we can just remove this portion in case you agree with me.
>

The datasheet actually says:

1. "An AAI Word program instruction pointing to a protected memory
area will be ignored."
2. "There is no wrap mode during AAI programming once the highest
unprotected memory address is reached."

In QEMU protected block is implemented for m25p80 so 1 can be ignored.
2 indicates that AAI stops at the highest unprotected memory address,
ie. no wrap mode like what READ or FAST READ does.

We've also tested on a real SST flash and tests showed that AAI stops
at the highest memory address (note the whole flash is unprotected)

>
> > +            /*
> > +             * There is no wrap mode during AAI programming once the highest
> > +             * unprotected memory address is reached. The Write-Enable-Latch
> > +             * bit is automatically reset, and AAI programming mode aborts.
> > +             */
> > +            qemu_log_mask(LOG_GUEST_ERROR,
> > +                          "M25P80: AAI highest memory address reached");
> > +            s->write_enable = false;
> > +            s->aai_enable = false;
> > +        }
> > +
> >          break;
> >
> >      case STATE_READ:
> > @@ -1372,6 +1432,7 @@ static const VMStateDescription vmstate_m25p80 = {
> >          VMSTATE_UINT32(volatile_cfg, Flash),
> >          VMSTATE_UINT32(enh_volatile_cfg, Flash),
> >          VMSTATE_BOOL(quad_enable, Flash),
> > +        VMSTATE_BOOL(aai_enable, Flash),
>
> Above we will have to be put into a subsection (for not breaking
> migration). In 'docs/devel/migration.rst' one can read more about those
> (and in the file there's one already that can be looked into).
>

Will do in v4.

> The rest of the patch looks good to me!

Thanks for the review!

Regards,
Bin

