Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E8765F2D5
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:36:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDU2s-0005et-1p; Thu, 05 Jan 2023 12:28:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDU2k-0005TU-Uc
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 12:28:42 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDU2i-00017q-KA
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 12:28:42 -0500
Received: by mail-wm1-x329.google.com with SMTP id ay40so28577104wmb.2
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 09:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xLc3h8yqPnvvcE3JzSjb8mPuQCKVOGDC88RCNMEdEBI=;
 b=KwSIzupnOaRjU7pDIFTrJ/Gs8FzxZk9o6Ayv+7BqF+1P7MKPtPAaTjFNO+O7KncIRt
 wpSiNyWy5ibCAdKlsoxsvUsuocAhA1Ilz4m+xGOpeMNNw08vhqNjj5CN7GdyEb03PE5F
 tfZHnRGb/F6JGUuO1yo45zPTrcR2vRsa/T7+h7O+aWvqgCsTjPR/BP/T+mHO+mbIyJeG
 I5nxi4zOEeYJZz47k1CHN998L56TY0Ajc1dM68Dg8B9KFF3dh0RY3KaTQEdWKyX0P8IF
 FnAbNVkJxYC65weSWL9xpVKqBxRTg2eM7nkjv/T9WFuQ5eUNrk6xhY+bmQ88SKqjwRPo
 njsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xLc3h8yqPnvvcE3JzSjb8mPuQCKVOGDC88RCNMEdEBI=;
 b=TOrIeofhpONP8QMvEyKdru7HGc7ZgCVa1fff/Mk3Ndh8tU02Y+avp5nCp31KoadUWq
 D9PsfL9F1jKdGd1MrD3bOp1XvMMaThBIWO7ggKUdRJOMthv4JWmd3VPPZYwsgR3Izkrz
 lQ/NdgzGEVCgqaqRXmheWjZA4ZDQ+U26P7HEL68dskXsi3dBp0lDOGxxuNmAAKhuj683
 U1qWRml/WCRcoByuR7sU7NHgm7kpCWihYU+yJ3HJqEo2EW44VdOiGS5OCAZo5dFvlYQi
 O/v8ZZNSQKlpGsBfgbQF0qNEU/5YCJA7XSvGN+EllSVOJDQ7rf/F5PYYs+R+wSXHPT9P
 WD5g==
X-Gm-Message-State: AFqh2kqe5ogYgXrrw/1vEATZUwTdiXpyGTbT2cep2KxiUANh6AWymUzo
 jfieRH6mVsC0+HQLnqBS6UCPkQ==
X-Google-Smtp-Source: AMrXdXsF0Bc9tPrumh0aEI/VQiagz31RjL4K54DzQvbwkaUt8OmYanPtii91U7p06dGyCd8PCxDItg==
X-Received: by 2002:a05:600c:3b93:b0:3d3:43ae:4d10 with SMTP id
 n19-20020a05600c3b9300b003d343ae4d10mr39659064wms.11.1672939719323; 
 Thu, 05 Jan 2023 09:28:39 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c314f00b003d99469ece1sm3410678wmo.24.2023.01.05.09.28.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 09:28:38 -0800 (PST)
Message-ID: <7d8fc0af-93ba-c79f-4c53-0cb52db40fa5@linaro.org>
Date: Thu, 5 Jan 2023 18:28:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 18/21] gdbstub: don't use target_ulong while handling
 registers
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, alex.bennee@gmail.com
Cc: David Hildenbrand <david@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Michael Rolnik <mrolnik@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Greg Kurz
 <groug@kaod.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Song Gao <gaosong@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bin Meng <bin.meng@windriver.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-arm@nongnu.org
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
 <20230105164320.2164095-19-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230105164320.2164095-19-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/1/23 17:43, Alex Bennée wrote:
> This is a hangover from the original code. addr is misleading as it is
> only a really a register id. While len will never exceed

"a really"?

> MAX_PACKET_LENGTH I've used size_t as that is what strlen returns.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   gdbstub/gdbstub.c | 17 ++++++++++-------
>   1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index 4547ca3367..c50c2f8e0f 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -1192,7 +1192,8 @@ static void handle_read_mem(GArray *params, void *user_ctx)
>   
>   static void handle_write_all_regs(GArray *params, void *user_ctx)
>   {
> -    target_ulong addr, len;
> +    int reg_id;

'unsigned'?

> +    size_t len;
>       uint8_t *registers;
>       int reg_size;
>   
> @@ -1204,9 +1205,10 @@ static void handle_write_all_regs(GArray *params, void *user_ctx)
>       len = strlen(get_param(params, 0)->data) / 2;
>       gdb_hextomem(gdbserver_state.mem_buf, get_param(params, 0)->data, len);
>       registers = gdbserver_state.mem_buf->data;
> -    for (addr = 0; addr < gdbserver_state.g_cpu->gdb_num_g_regs && len > 0;
> -         addr++) {
> -        reg_size = gdb_write_register(gdbserver_state.g_cpu, registers, addr);
> +    for (reg_id = 0;
> +         reg_id < gdbserver_state.g_cpu->gdb_num_g_regs && len > 0;
> +         reg_id++) {
Regardless:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


