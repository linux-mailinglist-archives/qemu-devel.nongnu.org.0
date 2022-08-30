Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A705A5CAF
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 09:16:12 +0200 (CEST)
Received: from localhost ([::1]:58760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSvTm-0006CG-JJ
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 03:16:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1oSvQv-0004lP-2B
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 03:13:14 -0400
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35]:42763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1oSvQs-0008SL-KJ
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 03:13:12 -0400
Received: by mail-vs1-xe35.google.com with SMTP id i1so440974vsc.9
 for <qemu-devel@nongnu.org>; Tue, 30 Aug 2022 00:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=t6EdYenelYEAKvYI7l5sMM1+TCE0xZ4wvYAEChvTwwY=;
 b=ZnRkpIK4p52NmfjpwCK+1O4J6pwXnzbMfzpHmeIC6YF7fo30Jij+In4Rd++7h3izUW
 NZYyeA2PzGmV0Tqhh5mjp4RAUPz92mj9JT09KusBlcfn4gsFmo3C/xd1eBZFUhaq2lrH
 M0TNF5WyYmNnxepUxTEIyhOx/tRwL8TehEG3Q1rX/eq0jAPwui45RmgsWWzj9hX7ADB5
 aJtwWmsS1q/Mw9exKaUgvY6wTuRCb6XlOKgm2nMBy3YoucaNZJSOfvGwVf4RWz+eflVs
 hGrDRubBgtAiVIdnr/I1xgqjuovoFx249OhTrGK7Exsrg8/FZ7O+X5osuW33Gi74InPX
 PguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=t6EdYenelYEAKvYI7l5sMM1+TCE0xZ4wvYAEChvTwwY=;
 b=q+b0SirDuI8yycVt0qyi8NNHC6sJuk1/mQ9/7gew6S4LDOKCyyB2HCsNy+8WYYSV7z
 kjZrNtyMGrqLs2A/bFvv2emraiyetKZjXcKWvQf0M6zfgYz9PZdo8Jr+iRoCOecRDeUF
 4gwH799deLQIHf6UUB3jY3/3m7xlYwlxg6d7IozbXK7JplDVYMYoT7/KgagdoJ3irs05
 hP5jgLlh9tWhVE0m/hPdX+H3mO/fsVKgwHguVdKvxXEcAjgOuv6GoDybEoZO8+3MVK1T
 GI0mvzZ9YjoDNsqPwT28WO2UIW/2ORJFJg1ndU98SNZB8bnnwlTrl9tsijyodn8DVa3k
 GNOw==
X-Gm-Message-State: ACgBeo0rdBUWhBv9blYtySJS692IOLkze5IfMtUx8sVwHuZDdOm2hk2r
 fbk0sN5PeFu72/jwMkcr20qIQ9Svai7A5QAqX+k=
X-Google-Smtp-Source: AA6agR5Ko3un9ehOGBZssqQmXGbKc0Lh9sXjRme1db4OHbYECjn6Sz9ffZyq9cuyLGCD66zWSa0DT4QXleWWXq+YVOk=
X-Received: by 2002:a05:6102:390d:b0:387:78b9:bf9c with SMTP id
 e13-20020a056102390d00b0038778b9bf9cmr4648016vsu.43.1661843589474; Tue, 30
 Aug 2022 00:13:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220830063827.813053-1-kraxel@redhat.com>
 <20220830063827.813053-3-kraxel@redhat.com>
In-Reply-To: <20220830063827.813053-3-kraxel@redhat.com>
From: Qiang Liu <cyruscyliu@gmail.com>
Date: Tue, 30 Aug 2022 15:12:58 +0800
Message-ID: <CAAKa2j=Z3Qmgkzwm4ogYgpfLOxJ2zwYWNSGKYQoWrYPtHpqz9g@mail.gmail.com>
Subject: Re: [PATCH 2/2] usb/msd: add usb_msd_fatal_error() and fix
 guest-triggerable assert
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=cyruscyliu@gmail.com; helo=mail-vs1-xe35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

I've checked out the patches and re-run my PoC. I see no crash anymore.
I also fuzzed the latest code for a while (with the patches) and I saw
no related crashes.

Tested-by: Qiang Liu <cyruscyliu@gmail.com>

On Tue, Aug 30, 2022 at 2:38 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Add handler for fatal errors.  Moves device into error state where it
> stops responding until the guest resets it.
>
> Guest can send illegal requests where scsi command and usb packet
> transfer directions are inconsistent.  Use the new usb_msd_fatal_error()
> function instead of assert() in that case.
>
> Reported-by: Qiang Liu <cyruscyliu@gmail.com>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/hw/usb/msd.h |  1 +
>  hw/usb/dev-storage.c | 30 +++++++++++++++++++++++++++++-
>  hw/usb/trace-events  |  1 +
>  3 files changed, 31 insertions(+), 1 deletion(-)
>
> diff --git a/include/hw/usb/msd.h b/include/hw/usb/msd.h
> index 54e9f38bda46..f9fd862b529a 100644
> --- a/include/hw/usb/msd.h
> +++ b/include/hw/usb/msd.h
> @@ -40,6 +40,7 @@ struct MSDState {
>      bool removable;
>      bool commandlog;
>      SCSIDevice *scsi_dev;
> +    bool needs_reset;
>  };
>
>  typedef struct MSDState MSDState;
> diff --git a/hw/usb/dev-storage.c b/hw/usb/dev-storage.c
> index 4485a2411797..3928209b8249 100644
> --- a/hw/usb/dev-storage.c
> +++ b/hw/usb/dev-storage.c
> @@ -191,6 +191,23 @@ static void usb_msd_packet_complete(MSDState *s)
>      usb_packet_complete(&s->dev, p);
>  }
>
> +static void usb_msd_fatal_error(MSDState *s)
> +{
> +    trace_usb_msd_fatal_error();
> +
> +    if (s->packet) {
> +        s->packet->status = USB_RET_STALL;
> +        usb_msd_packet_complete(s);
> +    }
> +
> +    /*
> +     * Guest messed up up device state with illegal requests.  Go
> +     * ignore any requests until the guests resets the device (and
> +     * brings it into a known state that way).
> +     */
> +    s->needs_reset = true;
> +}
> +
>  static void usb_msd_copy_data(MSDState *s, USBPacket *p)
>  {
>      uint32_t len;
> @@ -227,7 +244,11 @@ void usb_msd_transfer_data(SCSIRequest *req, uint32_t len)
>      MSDState *s = DO_UPCAST(MSDState, dev.qdev, req->bus->qbus.parent);
>      USBPacket *p = s->packet;
>
> -    assert((s->mode == USB_MSDM_DATAOUT) == (req->cmd.mode == SCSI_XFER_TO_DEV));
> +    if ((s->mode == USB_MSDM_DATAOUT) != (req->cmd.mode == SCSI_XFER_TO_DEV)) {
> +        usb_msd_fatal_error(s);
> +        return;
> +    }
> +
>      s->scsi_len = len;
>      s->scsi_off = 0;
>      if (p) {
> @@ -317,6 +338,8 @@ void usb_msd_handle_reset(USBDevice *dev)
>
>      memset(&s->csw, 0, sizeof(s->csw));
>      s->mode = USB_MSDM_CBW;
> +
> +    s->needs_reset = false;
>  }
>
>  static void usb_msd_handle_control(USBDevice *dev, USBPacket *p,
> @@ -382,6 +405,11 @@ static void usb_msd_handle_data(USBDevice *dev, USBPacket *p)
>      SCSIDevice *scsi_dev;
>      uint32_t len;
>
> +    if (s->needs_reset) {
> +        p->status = USB_RET_STALL;
> +        return;
> +    }
> +
>      switch (p->pid) {
>      case USB_TOKEN_OUT:
>          if (devep != 2)
> diff --git a/hw/usb/trace-events b/hw/usb/trace-events
> index 914ca7166829..b65269892c5e 100644
> --- a/hw/usb/trace-events
> +++ b/hw/usb/trace-events
> @@ -263,6 +263,7 @@ usb_msd_packet_complete(void) ""
>  usb_msd_cmd_submit(unsigned lun, unsigned tag, unsigned flags, unsigned len, unsigned data_len) "lun %u, tag 0x%x, flags 0x%08x, len %d, data-len %d"
>  usb_msd_cmd_complete(unsigned status, unsigned tag) "status %d, tag 0x%x"
>  usb_msd_cmd_cancel(unsigned tag) "tag 0x%x"
> +usb_msd_fatal_error(void) ""
>
>  # dev-uas.c
>  usb_uas_reset(int addr) "dev %d"
> --
> 2.37.2
>

