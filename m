Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9A860D3BB
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 20:42:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onOpu-000195-Cn; Tue, 25 Oct 2022 14:39:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jaykhandkar2002@gmail.com>)
 id 1onOpr-0000v7-Qi
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 14:39:35 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jaykhandkar2002@gmail.com>)
 id 1onOpq-00036O-8f
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 14:39:35 -0400
Received: by mail-pf1-x430.google.com with SMTP id e4so8787245pfl.2
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 11:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KxqBpN3dIw7NdjOGD6yinW3PvjVZUdappDXGBwZuYYU=;
 b=ZoYOWKG3q7Aaqapkm2JS6NP9qVSK1TA8N/AGSiiUlMp7Ks1xKxWtDIYtDtTNrY9H9/
 aYc7+B2IGYXzwKbb3MFgPxCp/eu1SSECThz8CB/Bv339NzldBqj9Agc+MqWlVRDfoko3
 xI/mrrCH0uMngSfMRMiMI3nNgXmzud4MGLwAxupdNxL8+0f8/KIByWPFJjYBz62zc9xy
 T/ouZ+YZAbEgUr9mA30HXBzKCruLUpcKAu3YRLh5B+3v5kNTPdeHDwkGkfNpuO5BA9Zg
 e80z5w/6AFtJKWAS/uhiFhi/27NpWcBlNRMqFyup2V5siQnipT3IE8t9beZVtSOT/fs5
 vF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KxqBpN3dIw7NdjOGD6yinW3PvjVZUdappDXGBwZuYYU=;
 b=fz0fnOHHXlaPCoQU9mU+SHp6Xt4mKM4GC6PJfVISvaFHKlgVHoE2Z0pGfl/KAwvgE0
 lA50uzDZ4vdl3YrBLuTnpBBaDhgqDeGCpqeTcnx8AfJyCbsNiVylxReLp/E8YNOBpEZU
 Sdsom35tyTKZwXLecLFY+LBAcAr39xuq8wrSjKUGqkmDM5DCUkvGxE8zyMA9dtIFEXab
 BLYCCAHHMUtabZNN9Njybc2Wt7wslR/16cmtmxNci/zjC+6on74PCYyfHGka4G1G96kb
 5rbwwmI5yTlQQWn0ZKUeC303y9nGVtVYkkeuLInkLywwq0KfXpHn4pUazWz9L94FEmiD
 Mhgg==
X-Gm-Message-State: ACrzQf0eN0f9mDKrX0TSa1fvlBd3zK881CmbwZ8PUdLRrNJt9PLxWZ4I
 /Kl988TKVVieWNcWdjaFyPo=
X-Google-Smtp-Source: AMsMyM4oQGUb63d0QR5LU6+kmFXynEG90NQ9M0K4fRB1M+GJ4SZbiY0IVuyrx1ckDlPc9Pc5nT3BvQ==
X-Received: by 2002:a62:a512:0:b0:536:e2bd:e15e with SMTP id
 v18-20020a62a512000000b00536e2bde15emr40838462pfm.1.1666723171679; 
 Tue, 25 Oct 2022 11:39:31 -0700 (PDT)
Received: from thinkpad ([103.144.92.240]) by smtp.gmail.com with ESMTPSA id
 c10-20020a170903234a00b0017f49b41c12sm1503703plh.173.2022.10.25.11.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 11:39:29 -0700 (PDT)
Date: Wed, 26 Oct 2022 00:09:25 +0530
From: Jay Khandkar <jaykhandkar2002@gmail.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, mst@redhat.com
Subject: Re: [PATCH V2] hw/intc: Handle software disabling of APIC correctly
Message-ID: <Y1gtXdQVtNMHhRxJ@thinkpad.localdomain>
References: <20220907174410.25180-1-jaykhandkar2002@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220907174410.25180-1-jaykhandkar2002@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=jaykhandkar2002@gmail.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Sep 07, 2022 at 11:14:11PM +0530, Jay Khandkar wrote:
> When the local APIC is in a software disabled state, all local interrupt
> sources must be masked and all attempts to unmask them should be
> ignored. Currently, we don't do either. Fix this by handling it
> correctly in apic_mem_write().
> 
> Signed-off-by: Jay Khandkar <jaykhandkar2002@gmail.com>
> ---
>  hw/intc/apic.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/hw/intc/apic.c b/hw/intc/apic.c
> index 3df11c34d6..be26b5c913 100644
> --- a/hw/intc/apic.c
> +++ b/hw/intc/apic.c
> @@ -793,6 +793,11 @@ static void apic_mem_write(void *opaque, hwaddr addr, uint64_t val,
>          break;
>      case 0x0f:
>          s->spurious_vec = val & 0x1ff;
> +        if (!(val & APIC_SPURIO_ENABLED)) {
> +            for (int i = 0; i < APIC_LVT_NB; i++) {
> +                s->lvt[i] |= APIC_LVT_MASKED;
> +            }
> +        }
>          apic_update_irq(s);
>          break;
>      case 0x10 ... 0x17:
> @@ -812,6 +817,9 @@ static void apic_mem_write(void *opaque, hwaddr addr, uint64_t val,
>      case 0x32 ... 0x37:
>          {
>              int n = index - 0x32;
> +            if (!(s->spurious_vec & APIC_SPURIO_ENABLED)) {
> +                val |= APIC_LVT_MASKED;
> +            }
>              s->lvt[n] = val;
>              if (n == APIC_LVT_TIMER) {
>                  apic_timer_update(s, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
> -- 
> 2.37.3
> 
Ping...?

