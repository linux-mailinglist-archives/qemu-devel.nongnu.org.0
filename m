Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F33484B30
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 00:31:53 +0100 (CET)
Received: from localhost ([::1]:42346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4tHT-0003TA-RI
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 18:31:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4tEk-00027J-44; Tue, 04 Jan 2022 18:29:02 -0500
Received: from [2a00:1450:4864:20::32e] (port=41579
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4tEi-0005JI-HR; Tue, 04 Jan 2022 18:29:01 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 b186-20020a1c1bc3000000b00345734afe78so2299637wmb.0; 
 Tue, 04 Jan 2022 15:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8LA3/n8sctVec6qROBt23msuoQk3Cfjdxpm0txxqur8=;
 b=OqpEjHAKM6xM6GQG5/J2/wS1J8Fhsrt3/2iVtx1472B01G8OC+3RHmCPXRqGYgDwH2
 LEJPbhXJV0MA2tr40msRXvcCAyCqAzMl1GV60eOv5dsZAr0A93sGkrG5Y7pKUByuSPfQ
 PCXFmaXGyY7PVLYI/HlAuCWHPVOvVoM/s+LMZnt/LwsKitlYDsXzo58oXVzyjiTShBM/
 g4cG+XIbuLfJfkL0tw69XblCNxQ87T7wnWOrnNndt3hopfip5NL3V1z3S6FYdI4XLcOP
 pId1he2OV+TigXjbz0oe97vn8xouVcpOQHZJhaZbduV+T4GzO1z3o+xT2uOZtMtepxOi
 YA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8LA3/n8sctVec6qROBt23msuoQk3Cfjdxpm0txxqur8=;
 b=5ClSdgIz57/8+iuDEXgFIYpwkn/plsUvSFxDZn3tKAN6DIXhEUxA80bySQ/rdVz8M6
 7y4xgx0je42VBZg7nzxA5zAI0Q4zIZwylHXsZVnMjWcn3AJ52zL6b621esiOKGIAA4/b
 GmD91a3JX+E6oSw0BrAfCc6t9RJ7ahZH6ShCL3RGyEGbIBdMXYVIR6WOZ0PtMQxhxJ1J
 SMWR5Eh4hx9L7ekH0WGfAQ32ApKZyCJ9JFZetdOZIUrfp+ST5F18CCZqK6MGoEvqFIq/
 RvAF/emFfC+OP2FGP+S+agt5LWMycVIpTbDlyuFfhDH4SKEzMvX7gZEBH2g8WaDwETTz
 uFSg==
X-Gm-Message-State: AOAM530rW5AS7rQw7sy5ShT5tznrW2zA++wcgQOELDRNSdVy6OW0MC48
 xWIQs5IviJoyQ/0T71gS2oU=
X-Google-Smtp-Source: ABdhPJzK4YsVzTDONjro+0qUUb+7P9HcbnSzNw3BHzZaMR1ZTFk/rfNnxjJgCUTf2wtgFRlBhNHm/w==
X-Received: by 2002:a1c:f205:: with SMTP id s5mr510226wmc.33.1641338938741;
 Tue, 04 Jan 2022 15:28:58 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id a2sm44455153wri.17.2022.01.04.15.28.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 15:28:58 -0800 (PST)
Message-ID: <8542122e-e9bd-e641-d464-9b2f1cbebfb4@amsat.org>
Date: Wed, 5 Jan 2022 00:28:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/2] hw/display/vmware_vga: replace fprintf calls with
 trace events
Content-Language: en-US
To: Carwyn Ellis <carwynellis@gmail.com>, qemu-devel@nongnu.org
References: <20220104180659.91619-1-carwynellis@gmail.com>
 <20220104180659.91619-2-carwynellis@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220104180659.91619-2-carwynellis@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/4/22 19:06, Carwyn Ellis wrote:
> Debug output was always being sent to STDERR.
> 
> This has been replaced with trace events.
> 
> Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
> ---
>  hw/display/trace-events |  3 +++
>  hw/display/vmware_vga.c | 22 ++++++++++------------
>  2 files changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/display/trace-events b/hw/display/trace-events
> index 3a7a2c957f..e1a0d2a88a 100644
> --- a/hw/display/trace-events
> +++ b/hw/display/trace-events
> @@ -21,6 +21,9 @@ vmware_palette_write(uint32_t index, uint32_t value) "index %d, value 0x%x"
>  vmware_scratch_read(uint32_t index, uint32_t value) "index %d, value 0x%x"
>  vmware_scratch_write(uint32_t index, uint32_t value) "index %d, value 0x%x"
>  vmware_setmode(uint32_t w, uint32_t h, uint32_t bpp) "%dx%d @ %d bpp"
> +vmware_verify_rect_less_than_zero(const char *name, const char *param, int x) "%s: %s was < 0 (%d)"
> +vmware_verify_rect_greater_than_bound(const char *name, const char *param, int bound, int x) "%s: %s was > %d (%d)"
> +vmware_verify_rect_surface_bound_exceeded(const char *name, const char *component, int bound, const char *param1, int value1, const char *param2, int value2) "%s: %s > %d (%s: %d, %s, %d)"

"%s: %s > %d (%s: %d, %s: %d)", otherwise:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>



