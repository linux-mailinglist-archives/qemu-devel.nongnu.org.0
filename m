Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DACD49097D
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 14:24:58 +0100 (CET)
Received: from localhost ([::1]:35996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9S0H-0000tS-6c
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 08:24:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9RWS-0000NM-86; Mon, 17 Jan 2022 07:54:08 -0500
Received: from [2a00:1450:4864:20::333] (port=42635
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9RWP-0003OE-Gj; Mon, 17 Jan 2022 07:54:07 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 ay4-20020a05600c1e0400b0034a81a94607so21549621wmb.1; 
 Mon, 17 Jan 2022 04:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=D8lDidphOlwdksErnqxKyi11UwRFDJnFpTcWIk8YZk8=;
 b=JBxr/taX73S4s3T7ZwAIDpMaohylOxEqdqFjrqGFUvORZN7ElJgjhRbKYbh6Ni0iGD
 DSeajZB5Z2agRSumC5g8lecPRneYdvLhHnNqI1NIioTnF7S4Fj6k9cZBlOXtGTdtJNrh
 DFZTbjTsDyRaSNS5bX1ZBlh0NWapMOKpo4ixWG7zM52SZvNEcKeABRAxm/QiRrTuJT6q
 f25KdeVwehtPCrtGmGYijE8QX8xlTew7FTz0N7T7uNY6QQ9gZyLAHzpIc3yaRpVYKtRY
 u/3+ELwaa4P7Z5m0mNb//Q2cgwuoz6mk9No1bI4qYJwlLAuAJFnQZ5RRHqfT0dTZgDA4
 PsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=D8lDidphOlwdksErnqxKyi11UwRFDJnFpTcWIk8YZk8=;
 b=DC6ifqYqWgzpN2yihq2B/JTR+R/GOD0yRlReL2ePV9fScyKKL8r5T7PcNI2oBHG/GV
 Xo7F2pz9bCYU9guKu69YDAOIA+w8P0+gne3wE15pGsWvI7BaFzT2t8o78tnydJYXgA/s
 EMua/nMj/STF1n3Ts72cs0GZ22fQl6BuGw5Itw92UwsguxAmUsiqtwY/8EQavtxa/nfZ
 pdybAfydjZCOkgLbX9Sjio74EbyURZ+Uvkad88glh0S6K+qr98kFmNPFxFaB3zpVVaYy
 9zUATZ/Ki5K2CTbiBboYA482mdEtsCki4DIA5KA239I+Wpf+QYVFiVmVOkVgjbBSfPV5
 dx7A==
X-Gm-Message-State: AOAM532/D2SbV2IeHns2FCGcy76OkHSFR3xhhTJx/gT/sNMwDJ8qP3wo
 8mgdeLvLyFdXSN9pUz5W/GOt73B6KDVosmTD
X-Google-Smtp-Source: ABdhPJzhJCLhvZQYivNuFivW4E1FWcuVrvjo4gfPOwuZx/yNQ+YsbxEy2hYy04TJwS3dR9ZJUgLYlg==
X-Received: by 2002:a5d:6d50:: with SMTP id k16mr18888168wri.693.1642423966520; 
 Mon, 17 Jan 2022 04:52:46 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id q8sm13321647wrz.66.2022.01.17.04.52.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 04:52:46 -0800 (PST)
Message-ID: <d74dfb2d-acb3-17ae-35f9-a243e128e332@amsat.org>
Date: Mon, 17 Jan 2022 13:52:44 +0100
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
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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

Based-on: <20220111184309.28637-1-f4bug@amsat.org>

