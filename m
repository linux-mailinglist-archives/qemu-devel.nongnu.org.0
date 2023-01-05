Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF1865F2C1
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:33:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTk5-0002FR-Ba; Thu, 05 Jan 2023 12:09:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDTk2-0002Bz-MX
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 12:09:22 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDTk0-0007C0-UP
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 12:09:22 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so1803274wmb.2
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 09:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CWmgURgVvT3HkVgRo206lKNbnitmtJNybOYPrf7FVHA=;
 b=t0RahvRtCKTVBiC3ODDBBpwR2I4ctkh78vTjxkDFo9mxLY4Ni6dlq0nO35xlnCTIDn
 wHpWm5pe0eQcvHxvxl9mqogm7lY0Ww28CngjiHEf9nxR7jPGqhd1KE3EK83WivqjEZVy
 0O3XLjrxMpUkfEV2C9x4FizprG6GRlmGeGTksKdwDahrT3qh5PUxQm0od1vGfK/nznR0
 d86PpVEnzRk8Dxi7QXbONqSIeuiHyCzO0FLtbSu028XPCOtjGUiV2Rg6qrq0ByHOJXl/
 oRXgGyuc7KTc/aOFvSAB1JqVyA1qBsveB1lTU6qX+ttN1+LSU7lOY4zNc3v+jF0Wj+3T
 IDoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CWmgURgVvT3HkVgRo206lKNbnitmtJNybOYPrf7FVHA=;
 b=0RypUhbMt9FUW1pmheZSjrq+CcfMnpJOvtJ/ldV8kG0GDCRQu5sNZnsAIWxoyOsYx+
 pC4gPALNT7nBpfXEg1nHZkilfMjFlTNZ2BiQ5lPcvtkDpzt91PYKJe4ESEyVrWVC95jg
 gPnlFKULJmux5lCELCVv4CJaf7C7q38BBhXNpv93aVjOXdBTmMoCHtSR9ONoWFnXlfwS
 SG4zN6uxuDOKrGtK/ToGUIEDyPWkc0fjOCyjOduu6dy53pjxynVPUY2kkB5dfLGXcWKk
 ieNn5GVOHJbFfij/GtTzeyE+iJ557PPi7GqbI+RVlDSMiJd454OOBYKpHmJPLf4TxsB2
 I3ug==
X-Gm-Message-State: AFqh2krrKzALA+7WHgL61elPVUMLyUaplagUCEX8M1kjov89Hs44pQcG
 yiR812AIcB3dqP367WwotOGiVw==
X-Google-Smtp-Source: AMrXdXvHkOYnZr7eQ/ugslrmQ+p+ngw764iMWu0RkcvptaEQkwPEVd43YAIXhbHAJWd9egKMqsen9A==
X-Received: by 2002:a05:600c:1911:b0:3d9:8635:a916 with SMTP id
 j17-20020a05600c191100b003d98635a916mr31504778wmq.9.1672938559250; 
 Thu, 05 Jan 2023 09:09:19 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o5-20020a05600c510500b003b4ff30e566sm7814600wms.3.2023.01.05.09.09.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 09:09:18 -0800 (PST)
Message-ID: <65ef72d7-1d7d-d6d4-a10f-fe854a34d39a@linaro.org>
Date: Thu, 5 Jan 2023 18:09:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 09/21] gdbstub: make various helpers visible to the
 rest of the module
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
 <20230105164320.2164095-10-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230105164320.2164095-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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

On 5/1/23 17:43, Alex Bennée wrote:
> We will be needing to use these helpers between the user and softmmu
> files so declare them in the headers, add a system prefix and remove

"system prefix" -> "'gdb_' prefix"

> static from the implementations.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   gdbstub/internals.h |  25 ++++
>   gdbstub/gdbstub.c   | 271 ++++++++++++++++++++++----------------------
>   2 files changed, 161 insertions(+), 135 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +/*
> + * Connection helpers for both softmmu and user backends
> + */
> +
> +void gdb_put_strbuf(void);
> +int gdb_put_packet(const char *buf);
> +int gdb_put_packet_binary(const char *buf, int len, bool dump);
> +void gdb_hextomem(GByteArray *mem, const char *buf, int len);
> +void gdb_memtohex(GString *buf, const uint8_t *mem, int len);
> +void gdb_memtox(GString *buf, const char *mem, int len);
> +void gdb_read_byte(uint8_t ch);
> +
> +/* utility helpers */
> +CPUState *gdb_first_attached_cpu(void);
> +void gdb_append_thread_id(CPUState *cpu, GString *buf);
> +int gdb_get_cpu_index(CPUState *cpu);
> +
> +void gdb_init_gdbserver_state(void);
> +void gdb_create_default_process(GDBState *s);
> +
> +/*
> + * Helpers with separate softmmu and user implementations
> + */
> +void gdb_put_buffer(const uint8_t *buf, int len);


