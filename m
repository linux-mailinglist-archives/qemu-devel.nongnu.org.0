Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95160544BA2
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 14:22:43 +0200 (CEST)
Received: from localhost ([::1]:45246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzHBR-0002me-9J
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 08:22:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzEuZ-0002zF-N6
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:57:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzEuX-0005aH-WE
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:57:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654768625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7JdUSmAZT5pWBwWi7rcHR/O5yAKXNDlDj/WZkZwWYSU=;
 b=JVi1rx1COaP9kPk2/gsruUID29jsFJ1LW27IzqBrE8O6ew18gG7/OEDZuqAx7bR9K2bLaa
 c8cVhCfC1aGSAe+kUCHnbcSi2P5FpPMFPiCBjRsffeWix25nWm4PSqomnSdelRWUf0HtGA
 f3maqwSTs6encyiEEB5pokS4XC6I0BY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-mKpHAoCJOpimgNG3gFp6nQ-1; Thu, 09 Jun 2022 05:57:01 -0400
X-MC-Unique: mKpHAoCJOpimgNG3gFp6nQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3CAE2185A7A4;
 Thu,  9 Jun 2022 09:57:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0885CC44CC3;
 Thu,  9 Jun 2022 09:57:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 655831800094; Thu,  9 Jun 2022 11:56:59 +0200 (CEST)
Date: Thu, 9 Jun 2022 11:56:59 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Hongren (Zenithal) Zheng" <i@zenithal.me>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, contact@canokeys.org
Subject: Re: [PATCH v5 4/6] docs: Add CanoKey documentation
Message-ID: <20220609095659.ulgk64bx3nlqzs2k@sirius.home.kraxel.org>
References: <YoY5k0PQny8WtAHi@Sun>
 <YoY6ilQimrK+l5NN@Sun>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YoY6ilQimrK+l5NN@Sun>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
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

On Thu, May 19, 2022 at 08:39:38PM +0800, Hongren (Zenithal) Zheng wrote:
> Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
> ---
>  docs/system/device-emulation.rst |   1 +
>  docs/system/devices/canokey.rst  | 168 +++++++++++++++++++++++++++++++
>  2 files changed, 169 insertions(+)
>  create mode 100644 docs/system/devices/canokey.rst
> 
> Note on the qemu-xhci issue:
> 
> For FIDO2 packets, they follow the pattern below
> 
>   Interrupt IN (size 64)
>   Interrupt OUT (size 128 with payload)
>   Interrupt OUT ACK (size 64)
>   Interrupt IN ACK (size 128 with payload)

> In qemu-xhci, it assumes a pattern like this
> 
>   Interrupt IN (size 64)
>    -> usb_handle_packet
>   Interrupt IN ACK (size 128 with payload (not possible))
>    <- usb_handle_packet returns
>   Interrupt OUT (size 128 with payload)
>    -> the next usb_handle_packet
>   Interrupt OUT ACK (size 64)
>    <- the next usb_handle_packet returns

> The code works for uhci/ehci in the following way
> 
>   Interrupt IN (size 64)
>    -> usb_handle_packet
>   Interrupt IN NAK (size 64)
>    <- usb_handle_packet returns
>   ... there are many IN NAK here
>   ... uhci/ehci reschedule OUT before IN now
>   Interrupt OUT (size 128 with payload)
>    -> the next usb_handle_packet
>   Interrupt OUT ACK (size 64)
>    <- the next usb_handle_packet returns
>   Interrupt IN (size 64)
>    -> last usb_handle_packet
>   Interrupt IN ACK (size 128 with payload)
>    <- last usb_handle_packet returns

I think this is just a missing usb_wakeup() call somewhere.  If a
usb device got data it must notify the host adapter that way.

> I think qemu-xhci should retry/schedule the failed IN token after
> receiving NAK instead of failing immediately, because interrupt
> endpoint is async.

uhci/ehci keeps polling the device.  That is pretty much mandatory for
correct emulation due to the way the host adapter hardware is designed.
So things are typically working even without an explicit usb_wakeup()
call.

xhci doesn't poll (which is good because that reduces virtualization
overhead alot) but requires an explicit usb_wakeup() call to make xhci
re-try NACK-ed transfers.

take care,
  Gerd


