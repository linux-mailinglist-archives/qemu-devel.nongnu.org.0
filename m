Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD25A3CFA68
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 15:17:56 +0200 (CEST)
Received: from localhost ([::1]:49014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5pdD-0004qi-Ql
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 09:17:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m5pan-0002Yx-68
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:15:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m5pak-0004LF-U8
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:15:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626786920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1inYEOWgTJ5ReoYKTpNspfXseJzeIQO2YJ9A9ggynuw=;
 b=ESZF8dk0uyBDl5JxWz6Y9hQfeykTtLdRuteimHO1Mfh09QASGtvIoXMtEvxF2PerA1N0Qn
 0cUtn6CbyfFlAFifFUocSgN5obmoscvaUcSPd/hc5krwRLIk8yhQ7MGdOyI9+cNOuA44qk
 L/DZUPu/2yPu5Fg5UBsKe42i4DA7SIU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-IXr5SXsBMw-070dhnMvWtA-1; Tue, 20 Jul 2021 09:15:17 -0400
X-MC-Unique: IXr5SXsBMw-070dhnMvWtA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A221802C80;
 Tue, 20 Jul 2021 13:15:16 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EDBEB5C1CF;
 Tue, 20 Jul 2021 13:15:10 +0000 (UTC)
Date: Tue, 20 Jul 2021 15:15:09 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v5 07/10] ACPI ERST: trace support
Message-ID: <20210720151509.7fd47f31@redhat.com>
In-Reply-To: <1625080041-29010-8-git-send-email-eric.devolder@oracle.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
 <1625080041-29010-8-git-send-email-eric.devolder@oracle.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 30 Jun 2021 15:07:18 -0400
Eric DeVolder <eric.devolder@oracle.com> wrote:

> Provide the definitions needed to support tracing in ACPI ERST.
trace points should be introduced in patches that use them for the first time,
as it stands now series breaks bisection.

> 
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> ---
>  hw/acpi/trace-events | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/hw/acpi/trace-events b/hw/acpi/trace-events
> index dcc1438..a5c2755 100644
> --- a/hw/acpi/trace-events
> +++ b/hw/acpi/trace-events
> @@ -55,3 +55,17 @@ piix4_gpe_writeb(uint64_t addr, unsigned width, uint64_t val) "addr: 0x%" PRIx64
>  # tco.c
>  tco_timer_reload(int ticks, int msec) "ticks=%d (%d ms)"
>  tco_timer_expired(int timeouts_no, bool strap, bool no_reboot) "timeouts_no=%d no_reboot=%d/%d"
> +
> +# erst.c
> +acpi_erst_reg_write(uint64_t addr, uint64_t val, unsigned size) "addr: 0x%04" PRIx64 " <== 0x%016" PRIx64 " (size: %u)"
> +acpi_erst_reg_read(uint64_t addr, uint64_t val, unsigned size) " addr: 0x%04" PRIx64 " ==> 0x%016" PRIx64 " (size: %u)"
> +acpi_erst_mem_write(uint64_t addr, uint64_t val, unsigned size) "addr: 0x%06" PRIx64 " <== 0x%016" PRIx64 " (size: %u)"
> +acpi_erst_mem_read(uint64_t addr, uint64_t val, unsigned size) " addr: 0x%06" PRIx64 " ==> 0x%016" PRIx64 " (size: %u)"
> +acpi_erst_pci_bar_0(uint64_t addr) "BAR0: 0x%016" PRIx64
> +acpi_erst_pci_bar_1(uint64_t addr) "BAR1: 0x%016" PRIx64
> +acpi_erst_realizefn_in(void)
> +acpi_erst_realizefn_out(unsigned size) "total nvram size %u bytes"
> +acpi_erst_reset_in(unsigned record_count) "record_count %u"
> +acpi_erst_reset_out(unsigned record_count) "record_count %u"
> +acpi_erst_class_init_in(void)
> +acpi_erst_class_init_out(void)


