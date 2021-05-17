Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98664383B92
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 19:45:06 +0200 (CEST)
Received: from localhost ([::1]:53342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lihIf-00018t-NG
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 13:45:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lihCn-0003TJ-On
 for qemu-devel@nongnu.org; Mon, 17 May 2021 13:39:03 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:35444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lihCe-00073a-3P
 for qemu-devel@nongnu.org; Mon, 17 May 2021 13:39:01 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 69-20020a9d0a4b0000b02902ed42f141e1so6266836otg.2
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 10:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ldhso26GEs3DEBzaPURX8lnxkqjDJonKIn1L7JZZPg0=;
 b=kxWMK5E9RuqSJ6DTcy3uI5iOLKYlywpuG3PRrS+vAom0oTj3esHyTBAvSOgo5XoSp4
 n8m2bXe1WeMKz+I1nAEGQYeUsRXklC6OPDpLD+LfhOIjYWUze3jrszUj7+tdjtZa2JdX
 rKnD2aoemBEkDk0dLvM7TjrHc/4/p19yGXEvwpYsO5/Dzs1qJ93uZ9pbPhVDYh/Nzwqh
 zouIUHr4JdOp9YXGpTEy5U5RfWakXYJcdvma9nSYRjUuY6UcOviFD+o0wlTDKhinggHh
 oOzR1g4peyH6xhOJj+d2302FWr0lshtqD0W8saODrtNIvd0q45ZFoCSsYhnREwzS/W7u
 qYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ldhso26GEs3DEBzaPURX8lnxkqjDJonKIn1L7JZZPg0=;
 b=sImj1X9JEv1GDF5RTd9UxkPZXkyegzZ32rI5pUbUTNouC1wyvNxa4ETGNuNiahs3Bi
 rpFB/pEPdiW00+Vyv1KxKO5r2EgvVHCpvaPzpegad2E0jS0Cf/fZyeJG2PPe4DvFtPuF
 C0ZuSGoc06tZTgbWu2HSuyPq7ckFrN/XL1BY0SeyraloQmAqkCUeO0B2qKzbLm+1wiY7
 AaJAgFS+fUWEpg38fy+upGYGYEnCvovgfV7RfLRDJFR3pCUyfOMR6g0poI4cWsM6HJcg
 vqskSrLibExi9sGRPkspH0qbNpT+F+CQ32Q9CLLKkx0S9St7MGRlug6cb0mI2xVL2H1V
 sEVw==
X-Gm-Message-State: AOAM530cqBQArL5UKMGEpkO1Jhhy7/Fu3dGKUO5gZ12bXPTTS52gOLnx
 jjBQuJ6lU0RyB41oi9ReisgpnQ==
X-Google-Smtp-Source: ABdhPJzcOEFxyI94wB2oqMolsLZpnNa1TYn7NLpi16ja1wRhZx36V13S5l9ph/Q3mjez4hQa+diVng==
X-Received: by 2002:a9d:c24:: with SMTP id 33mr550970otr.289.1621273129223;
 Mon, 17 May 2021 10:38:49 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id v22sm2873258oic.37.2021.05.17.10.38.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 10:38:49 -0700 (PDT)
Subject: Re: [PATCH] target/riscv: Remove obsolete 'CPU unmigratable' comment
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210517070851.857841-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <797d7a56-1e29-8d5b-0f3b-4cfdbcb1869d@linaro.org>
Date: Mon, 17 May 2021 12:38:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517070851.857841-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, qemu-trivial@nongnu.org,
 Bin Meng <bin.meng@windriver.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 2:08 AM, Philippe Mathieu-Daudé wrote:
> The RISCV CPU is migratable since commit f7697f0e629
> ("target/riscv: Add basic vmstate description of CPU"),
> so remove an obsolete comment which is now incorrect.
> 
> Reported-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/riscv/cpu.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

