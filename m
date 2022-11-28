Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E47A563AA11
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 14:51:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozeXw-0006l6-B5; Mon, 28 Nov 2022 08:51:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozeXb-0006jP-DB
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 08:51:23 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozeXZ-0000un-Kb
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 08:51:23 -0500
Received: by mail-wr1-x42a.google.com with SMTP id h11so9628823wrw.13
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 05:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CbpbnF5JhAQ4PR/9/He/8MaYDs5nDXMIPVQf+qwt1ng=;
 b=zNpw//x8hauD/SZiKAaXkx82z4GQen3WsPGLdyyz5Nyb4BqttY0llPqRzcb2v7/g5Z
 ZfXR+BUFNudYeOCJfLCIOGYTZJ+6Y8N53fTamTQa122bqF4jNJjB5ebp70p1qqEk/7ke
 xs6oC0lk9KxHXOrEIX83TE/SLhJE82DV/2SZygC/KccpZS3syjTCAuaebn1DdKdeP5QJ
 t5PlenwOtAMA+BL2HDAj9ZJVhF679PTCjWiya9pSbPHX67eSM8+P4NQNJEEtYrQL+Mlq
 KK3AGYlbC2E/IIjKkFj4KmkG8hJ1lh5G83SAE9EGMWO1BpM1nIxCoUykmdFGgezO2IfA
 TpNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CbpbnF5JhAQ4PR/9/He/8MaYDs5nDXMIPVQf+qwt1ng=;
 b=70Yv6Qm+cDIOhFgOwnJU9LuiDWEOlW2D6MpbwG1iI3TfyvR1zCF4qFO99T0/9IOgcN
 jOl8otxwU6PJOHCF54m4aK/vnvdFJyZVbTx2XGVRjskc9ka44YebEykK59XYtiGoc76f
 c36EUMXsPwHMf7yLrqI/66+UDGUu4BFRFHXrq2SHQ6ZgqytdEdvcPx5P0o2GP3dP/VUb
 ayn/6S415ww4P6mHDY2GTP6jNY/hsf0y3Oo7eS3ltIwYd4TpUs7oZ0zCdCjHlTyXbmoq
 mYzzNbAy22ECA0wxYN89GQQE09ta/GJG25DGhRSZr8Q9Chh2WOOVT45WQX04veLyqkFt
 TSFw==
X-Gm-Message-State: ANoB5pnBOgflAQm2FUipBkQnfJt1jPTaMnIfbiU2Ht3gRLByWdglpIG1
 u1a+O2dPKZAvGerCb1ZuCqC6iQ==
X-Google-Smtp-Source: AA0mqf706UKCGEDoaH0bcmTHHZrsRwjrJj4m35CAv+x7ScAj5/UVnuICwTPWCChbgbTUEcyRxSFdSw==
X-Received: by 2002:adf:f944:0:b0:236:8f54:f1f4 with SMTP id
 q4-20020adff944000000b002368f54f1f4mr31753919wrr.654.1669643480014; 
 Mon, 28 Nov 2022 05:51:20 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 z12-20020a05600c220c00b003cf7055c014sm14922015wml.1.2022.11.28.05.51.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 05:51:19 -0800 (PST)
Message-ID: <60a0bce3-d7c5-1f3c-6211-c85d07dc96c8@linaro.org>
Date: Mon, 28 Nov 2022 14:51:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [RFC PATCH-for-7.2 v2 0/5] hw/display/qxl: Avoid buffer overrun
 in qxl_phys2virt()
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221128134832.84867-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221128134832.84867-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 28/11/22 14:48, Philippe Mathieu-Daudé wrote:
> Since v1:
> - Addressed Marc-André review comments
> - Moved overrun check in qxl_get_check_slot_offset()
> 
> memory_region_get_ram_ptr() returns a host pointer for a
> MemoryRegion. Sometimes we do offset calculation using this
> pointer without checking the underlying MemoryRegion size.
> 
> Wenxu Yin reported a buffer overrun in QXL. This series
> aims to fix it. I haven't audited the other _get_ram_ptr()
> uses (yet). Eventually we could rename it _get_ram_ptr_unsafe
> and add a safer helper which checks for overrun.
> 
> Worth considering for 7.2?
> 
> Regards,
> 
> Phil.

This series is v2...

v1 was 
https://lore.kernel.org/qemu-devel/20221125154030.42108-1-philmd@linaro.org/

