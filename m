Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5923E4306
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 11:41:39 +0200 (CEST)
Received: from localhost ([::1]:34320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD1ms-0001ei-Ll
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 05:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mD1lD-00005W-Er; Mon, 09 Aug 2021 05:39:55 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mD1lB-00046W-PW; Mon, 09 Aug 2021 05:39:55 -0400
Received: by mail-wr1-x42e.google.com with SMTP id l18so20553210wrv.5;
 Mon, 09 Aug 2021 02:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1DgC/qnPyBPODPYSGo4xmDvpGJM4YMcWkVMipGZP07Y=;
 b=KWg9k54ZY9qsYoqViOJzg3vdL7/lUeoDQbGQx3agdYUaagK4lDsq4QubhLy1NJRObP
 P/jY7KaO8W/FAZOsOEQ+YMtUNfNqaQ1VI9ZCsd4xKfNpGbazZDXznG8cLA/2nBd6Gmbx
 Z7XGV7lesuJDD9evm1hFzYDky16Nbb9vByansM3Lvul1VaRD0RP8yE7U4ich9rcVJb2s
 sscDSZ0ov0l1XuX6ZuJj1hRy8DTdHZ1QXAfJ6E+RsKXQL6rGUJgh4yuMZnfCqIYG5Da0
 +6YC94ieD2OqivDbTO6Mx35lSsLliXYXzOC28BcvksaAsFpbQcNUfRBUjgBIvt42EN0z
 iDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1DgC/qnPyBPODPYSGo4xmDvpGJM4YMcWkVMipGZP07Y=;
 b=WLoYVIZUvcFeSQOJPrcS1rikDgLi4x1LMr+habAk9p3T46Np0t6+PDY0oozLfCkFtU
 uUib6D8lAyyGYC9GIO62kzdVueO8VqoVKuFTXVktCz393mXkgfg6UDI7tNTpDkwRomQL
 EFQRrcC6e5v89EVkmfNc9lfKCP5vlTzFoqGPLoYhD3CWzKOkRjtcKEg0yei/yBh//MTB
 VSshm8HcFCDOHuowHjC9FOCb6GvYF5roCYw0Kj7hDyRZV0LC9mdUJ8fYbod8qCv9WYEX
 MaFarFv8xMp/lLloLb/wN8C/CoAkujxvd0SSsOBpjwzNp/F/9RzF+igGAq/F5eLoxAYI
 YhIw==
X-Gm-Message-State: AOAM530DGODr1aULn+MiTx2mIJb9aqLHjkrzEjL4dz0ddTeoIA9Yx6Pq
 PFH6dktawL48dGlfAsB/3qpD4H8H/0s=
X-Google-Smtp-Source: ABdhPJycR48xqBpsPsb3vdevezkS2nNp5CCIlu7NQgRMT4ExGBEzCc2T0bxOzHd/+d3d4G9rlzIbfQ==
X-Received: by 2002:adf:f707:: with SMTP id r7mr23331833wrp.175.1628501991222; 
 Mon, 09 Aug 2021 02:39:51 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id h4sm4351076wrt.5.2021.08.09.02.39.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 02:39:50 -0700 (PDT)
Subject: Re: [PATCH] xive: Remove extra '0x' prefix in trace events
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20210809085227.288523-1-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e546f365-b941-ccda-8ba9-24aadb12da3b@amsat.org>
Date: Mon, 9 Aug 2021 11:39:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210809085227.288523-1-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/9/21 10:52 AM, Cédric Le Goater wrote:
> Cc: thuth@redhat.com
> Fixes: 4e960974d4ee ("xive: Add trace events")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/519
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/intc/trace-events | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/intc/trace-events b/hw/intc/trace-events
> index e56e7dd3b667..6a17d38998d9 100644
> --- a/hw/intc/trace-events
> +++ b/hw/intc/trace-events
> @@ -219,14 +219,14 @@ kvm_xive_source_reset(uint32_t srcno) "IRQ 0x%x"
>  xive_tctx_accept(uint32_t index, uint8_t ring, uint8_t ipb, uint8_t pipr, uint8_t cppr, uint8_t nsr) "target=%d ring=0x%x IBP=0x%02x PIPR=0x%02x CPPR=0x%02x NSR=0x%02x ACK"
>  xive_tctx_notify(uint32_t index, uint8_t ring, uint8_t ipb, uint8_t pipr, uint8_t cppr, uint8_t nsr) "target=%d ring=0x%x IBP=0x%02x PIPR=0x%02x CPPR=0x%02x NSR=0x%02x raise !"
>  xive_tctx_set_cppr(uint32_t index, uint8_t ring, uint8_t ipb, uint8_t pipr, uint8_t cppr, uint8_t nsr) "target=%d ring=0x%x IBP=0x%02x PIPR=0x%02x new CPPR=0x%02x NSR=0x%02x"
> -xive_source_esb_read(uint64_t addr, uint32_t srcno, uint64_t value) "@0x0x%"PRIx64" IRQ 0x%x val=0x0x%"PRIx64
> -xive_source_esb_write(uint64_t addr, uint32_t srcno, uint64_t value) "@0x0x%"PRIx64" IRQ 0x%x val=0x0x%"PRIx64
> +xive_source_esb_read(uint64_t addr, uint32_t srcno, uint64_t value) "@0x%"PRIx64" IRQ 0x%x val=0x%"PRIx64
> +xive_source_esb_write(uint64_t addr, uint32_t srcno, uint64_t value) "@0x%"PRIx64" IRQ 0x%x val=0x%"PRIx64
>  xive_router_end_notify(uint8_t end_blk, uint32_t end_idx, uint32_t end_data) "END 0x%02x/0x%04x -> enqueue 0x%08x"
>  xive_router_end_escalate(uint8_t end_blk, uint32_t end_idx, uint8_t esc_blk, uint32_t esc_idx, uint32_t end_data) "END 0x%02x/0x%04x -> escalate END 0x%02x/0x%04x data 0x%08x"
> -xive_tctx_tm_write(uint64_t offset, unsigned int size, uint64_t value) "@0x0x%"PRIx64" sz=%d val=0x%" PRIx64
> -xive_tctx_tm_read(uint64_t offset, unsigned int size, uint64_t value) "@0x0x%"PRIx64" sz=%d val=0x%" PRIx64
> +xive_tctx_tm_write(uint64_t offset, unsigned int size, uint64_t value) "@0x%"PRIx64" sz=%d val=0x%" PRIx64
> +xive_tctx_tm_read(uint64_t offset, unsigned int size, uint64_t value) "@0x%"PRIx64" sz=%d val=0x%" PRIx64
>  xive_presenter_notify(uint8_t nvt_blk, uint32_t nvt_idx, uint8_t ring) "found NVT 0x%x/0x%x ring=0x%x"
> -xive_end_source_read(uint8_t end_blk, uint32_t end_idx, uint64_t addr) "END 0x%x/0x%x @0x0x%"PRIx64
> +xive_end_source_read(uint8_t end_blk, uint32_t end_idx, uint64_t addr) "END 0x%x/0x%x @0x%"PRIx64
>  
>  # pnv_xive.c
>  pnv_xive_ic_hw_trigger(uint64_t addr, uint64_t val) "@0x%"PRIx64" val=0x%"PRIx64
> 

Acceptable for 6.1 IMHO.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


