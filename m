Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9118149209C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 08:54:38 +0100 (CET)
Received: from localhost ([::1]:42632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9jK9-0002dn-Aw
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 02:54:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9iu0-0007md-Le; Tue, 18 Jan 2022 02:27:40 -0500
Received: from [2a00:1450:4864:20::32f] (port=51071
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9itz-00049G-2x; Tue, 18 Jan 2022 02:27:36 -0500
Received: by mail-wm1-x32f.google.com with SMTP id w26so25560583wmi.0;
 Mon, 17 Jan 2022 23:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JB5TbY70GbqQ1LJJA9IQvZYuNpMXPcVGpp6kMPL0vTk=;
 b=Y0kNNtWEseycLNqshrUl9dS/JIhoP1zn9NOGP/zPO1yAvWqkpMYSC3Rb5EuQfDTqxP
 r4ZbX5LiXjW2kbx4EFxuCIqx+Cf2u2lYNnjvItA2osHEOD4OuPHIZACR5/wSiwFEUT66
 Sw8hJNxjoFW8iUFKs4LkfOtRqVrqJobYbVimHp6GgKlMQhQma7QPxiDLJJ7Us+4hANDC
 ziZqFKJDom4dw56BpxVU9dxLHJRqTlQrARcJXg7yuq69vvAqHny1SJh3h1hnnK/TYm3R
 KumJ6NnToEZM/431ZMCdXOMtOagskC+VeKupavA3G5Cc8bhZ705l3+s9OaqdXxRADoLR
 073A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JB5TbY70GbqQ1LJJA9IQvZYuNpMXPcVGpp6kMPL0vTk=;
 b=puCGFB85ift6mK0MR9vx1pToRrBb/21uKPorL88najtB5cuFT5SCZMEO89KKTt7dGV
 dStHS78LEzvjeQ8/mvhaKplVjo9/AI3XWOnY8ll0pCpKRux7Yh8wivl6wHsGifX5EXPW
 LfjhvcqAGNSNWOoqUsLafBRfpjOxGYwlyuQRuHF+FCGm46xRgwmu/rSAPHZtCgHiulB9
 ANUMIwQARZJrUtJ+HYq3IXXFEyo7pUGzIsFGQ4aQUaYpHFpgwUXD9EsxXQ0zSTIKsFz3
 5wOg9U1vSLMzHJQGy1VZkVUzvFQY2X9lo1lDQMBk+ZXpXlxHWFXlfCkxExPvuQSXWqJo
 iSlA==
X-Gm-Message-State: AOAM532soCTghNwYShNuBBIAr+HquNcm4l2F9sSpgSn8+r12dlTBhbLF
 HtL9MpAUq3Y+QSc9XdhlqYGjAulp1KQ=
X-Google-Smtp-Source: ABdhPJyve0DKFVRpQaJvXehrU5c92gN6WqHECVRNQpXZmwCMKQadzQX5CspxDN1VlPQG7LNZEKsiIw==
X-Received: by 2002:a05:6000:2cb:: with SMTP id
 o11mr17735742wry.187.1642490853393; 
 Mon, 17 Jan 2022 23:27:33 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id v131sm1477951wme.25.2022.01.17.23.27.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 23:27:32 -0800 (PST)
Message-ID: <f7dd6900-a7dc-6f1d-da18-13c33a14f852@amsat.org>
Date: Tue, 18 Jan 2022 08:27:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3] hw/dma: Let dma_buf_read() / dma_buf_write() propagate
 MemTxResult
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>
References: <20220117125130.131828-1-f4bug@amsat.org>
In-Reply-To: <20220117125130.131828-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 1/17/22 13:51, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Since commit 292e13142d2, dma_buf_rw() returns a MemTxResult type.
> Do not discard it, return it to the caller. Pass the previously
> returned value (the QEMUSGList residual size, which was rarely used)
> as an optional argument.
> 
> With this new API, SCSIRequest::residual might now be accessed via
> a pointer. Since the size_t type does not have the same size on
> 32 and 64-bit host architectures, convert it to a uint64_t, which
> is big enough to hold the residual size, and the type is constant
> on both 32/64-bit hosts.
> 
> Update the few dma_buf_read() / dma_buf_write() callers to the new
> API.
> 
> Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> v3:
> - Reworded to precise the SCSIRequest::residual type change
> - Posted out of the "Use dma_addr_t type definition when relevant"
>   series (dhildenb)
> ---
>  include/hw/scsi/scsi.h |  2 +-
>  include/sysemu/dma.h   |  4 +--
>  hw/ide/ahci.c          |  8 +++---
>  hw/nvme/ctrl.c         |  4 +--
>  hw/scsi/megasas.c      | 59 ++++++++++++++++++++++++++++++------------
>  hw/scsi/scsi-bus.c     |  6 +++--
>  softmmu/dma-helpers.c  | 16 +++---------
>  7 files changed, 59 insertions(+), 40 deletions(-)

Queued via memory-api.

