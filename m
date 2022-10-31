Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BAC613825
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:36:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUwY-0007HM-Sx; Mon, 31 Oct 2022 09:35:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1opUwU-0007GR-8s
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:35:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1opUwR-0002fk-9o
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:35:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667223302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V/9InpCfSi+lnm7r5zCM/ameo5aDGD4EViUQ7Ncsqvw=;
 b=XlsB/hj0LfFjfyaSqSdv2E5tucl9jkuwcZ794kL92WgMBk+PORcOcRtoWOWRzfRjfcOnlw
 qsi6ejDXTcqIqY9QT7jzpNmoJ3UAiNzXW94VutQm3/vwJ8ribW/Cg+vHeFIAE/sJq6WBJU
 u8qs3W/FXSq6HEbq4/v/doyA6pkrBEs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-8QXS-bcJOW201w2GsfZ-eA-1; Mon, 31 Oct 2022 09:35:00 -0400
X-MC-Unique: 8QXS-bcJOW201w2GsfZ-eA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 602CC800186;
 Mon, 31 Oct 2022 13:35:00 +0000 (UTC)
Received: from localhost (unknown [10.39.193.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0515840C6EC6;
 Mon, 31 Oct 2022 13:34:59 +0000 (UTC)
Date: Mon, 31 Oct 2022 13:34:59 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 1/4] hw/acpi: add trace events for TCO watchdog register
 access
Message-ID: <20221031133459.GG7636@redhat.com>
References: <20221031131934.425448-1-berrange@redhat.com>
 <20221031131934.425448-2-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221031131934.425448-2-berrange@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Oct 31, 2022 at 01:19:31PM +0000, Daniel P. Berrangé wrote:
> These tracepoints aid in understanding and debugging the guest drivers
> for the TCO watchdog.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  hw/acpi/tco.c        | 41 ++++++++++++++++++++++++++++-------------
>  hw/acpi/trace-events |  2 ++
>  2 files changed, 30 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/acpi/tco.c b/hw/acpi/tco.c
> index 4783721e4e..9ebd3e5e64 100644
> --- a/hw/acpi/tco.c
> +++ b/hw/acpi/tco.c
> @@ -86,6 +86,7 @@ static inline int can_start_tco_timer(TCOIORegs *tr)
>  static uint32_t tco_ioport_readw(TCOIORegs *tr, uint32_t addr)
>  {
>      uint16_t rld;
> +    uint32_t ret = 0;
>  
>      switch (addr) {
>      case TCO_RLD:
> @@ -96,35 +97,49 @@ static uint32_t tco_ioport_readw(TCOIORegs *tr, uint32_t addr)
>          } else {
>              rld = tr->tco.rld;
>          }
> -        return rld;
> +        ret = rld;
> +        break;
>      case TCO_DAT_IN:
> -        return tr->tco.din;
> +        ret = tr->tco.din;
> +        break;
>      case TCO_DAT_OUT:
> -        return tr->tco.dout;
> +        ret = tr->tco.dout;
> +        break;
>      case TCO1_STS:
> -        return tr->tco.sts1;
> +        ret = tr->tco.sts1;
> +        break;
>      case TCO2_STS:
> -        return tr->tco.sts2;
> +        ret = tr->tco.sts2;
> +        break;
>      case TCO1_CNT:
> -        return tr->tco.cnt1;
> +        ret = tr->tco.cnt1;
> +        break;
>      case TCO2_CNT:
> -        return tr->tco.cnt2;
> +        ret = tr->tco.cnt2;
> +        break;
>      case TCO_MESSAGE1:
> -        return tr->tco.msg1;
> +        ret = tr->tco.msg1;
> +        break;
>      case TCO_MESSAGE2:
> -        return tr->tco.msg2;
> +        ret = tr->tco.msg2;
> +        break;
>      case TCO_WDCNT:
> -        return tr->tco.wdcnt;
> +        ret = tr->tco.wdcnt;
> +        break;
>      case TCO_TMR:
> -        return tr->tco.tmr;
> +        ret = tr->tco.tmr;
> +        break;
>      case SW_IRQ_GEN:
> -        return tr->sw_irq_gen;
> +        ret = tr->sw_irq_gen;
> +        break;
>      }
> -    return 0;
> +    trace_tco_io_read(addr, ret);
> +    return ret;
>  }
>  
>  static void tco_ioport_writew(TCOIORegs *tr, uint32_t addr, uint32_t val)
>  {
> +    trace_tco_io_write(addr, val);
>      switch (addr) {
>      case TCO_RLD:
>          tr->timeouts_no = 0;
> diff --git a/hw/acpi/trace-events b/hw/acpi/trace-events
> index eb60b04f9b..78e0a8670e 100644
> --- a/hw/acpi/trace-events
> +++ b/hw/acpi/trace-events
> @@ -55,6 +55,8 @@ piix4_gpe_writeb(uint64_t addr, unsigned width, uint64_t val) "addr: 0x%" PRIx64
>  # tco.c
>  tco_timer_reload(int ticks, int msec) "ticks=%d (%d ms)"
>  tco_timer_expired(int timeouts_no, bool strap, bool no_reboot) "timeouts_no=%d no_reboot=%d/%d"
> +tco_io_write(uint64_t addr, uint32_t val) "addr=0x%" PRIx64 " val=0x%" PRIx32
> +tco_io_read(uint64_t addr, uint32_t val) "addr=0x%" PRIx64 " val=0x%" PRIx32
>  
>  # erst.c
>  acpi_erst_reg_write(uint64_t addr, uint64_t val, unsigned size) "addr: 0x%04" PRIx64 " <== 0x%016" PRIx64 " (size: %u)"

Reviewed-by: Richard W.M. Jones <rjones@redhat.com>

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-builder quickly builds VMs from scratch
http://libguestfs.org/virt-builder.1.html


