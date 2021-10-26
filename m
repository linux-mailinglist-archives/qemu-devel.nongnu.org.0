Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC7F43AE71
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 10:59:41 +0200 (CEST)
Received: from localhost ([::1]:38064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfIJ3-0004vL-03
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 04:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfIHP-0002aC-WA
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 04:58:00 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:53177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfIHN-0000kI-Ua
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 04:57:59 -0400
Received: by mail-wm1-x331.google.com with SMTP id m42so13336414wms.2
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 01:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9zlVyUkSi3KRusoLAVqLGKSO/RSIHWdQ8HsPQAJkzzI=;
 b=bEq9KwBPbrNFK7mznOOQ5ASFmdUWwY9iCUWKefSILqsAzvRSD4q0kyuKWiij/njdvF
 YLukOP75Y8e1hJgTehldvFfyLsFxHDK20I5aj6VU1l1u4/T4AN1fpVEgU+PQc/c5nz5x
 1rNGfTYefW2OvfuzX0ieGG98KKt4EdmtfXCAupT+6BY2KVonHkAUpXjgevuaYOoeGXpu
 XkKdDkEHIpapTOYqtKlqj2n+raW6Z9S68Bh3hvt6ziMjSdeF4DcBd3B48NsxrFI7f2LP
 Id4VrwPfZ2LxRxlKmrv71pErR6n/wUqIOlIF6enOf/aNgTmcJ+iOoLWcjKClCfm6NsTE
 eeZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9zlVyUkSi3KRusoLAVqLGKSO/RSIHWdQ8HsPQAJkzzI=;
 b=G+82mEzmALu6JZ3+gcZF5QRv7J3FNQq1WNFCw2fdTESDRdwG+3TW9peyE5x5IZdJq6
 Eh/kcuAcMx6RZC6qrCnUbxQp6c4UbifY7SizCWE4gZrLTqRxf8ICVH3Zxk/urw5el13x
 88DFBweE2l3lMgF3RuC0+Zimv2g3mdONV1eDkByR8/JSWDammW62eIQnbO6ej7d66TFi
 yzqAEsWm6Jkg00+FpvYuudwvvYYI4IOAq7ct0nFzNXvG51MyYgYuCFJS/h0e971B5pLq
 mjuF95LhHDd5txt3hJS23pFDNfQitQ4uQ8YioDAPPoixg3TddDtGuy7oV7NSPNbiialI
 iNpQ==
X-Gm-Message-State: AOAM531xP2CWdjGWk96klPMQ9Qfn5jfGhsI2rKuoRjgG6N1TGXZmm5WO
 C3yUr3dGhTJjXau844FqezA=
X-Google-Smtp-Source: ABdhPJx1ZcPk8CeQA+St10HrMHV0FW0VNwU+c+kJnx002QtsetWXywsSYjIFOqFhM0FbpBp03uA3RQ==
X-Received: by 2002:a1c:3842:: with SMTP id f63mr34411374wma.128.1635238676566; 
 Tue, 26 Oct 2021 01:57:56 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id z135sm23803775wmc.45.2021.10.26.01.57.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 01:57:56 -0700 (PDT)
Message-ID: <b5a14992-e5ea-5299-a7e6-9d78f2986dce@amsat.org>
Date: Tue, 26 Oct 2021 10:57:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] hvf: arm: Ignore cache operations on MMIO
Content-Language: en-US
To: Alexander Graf <agraf@csgraf.de>, Cameron Esfahani <dirty@apple.com>
References: <20211026071241.74889-1-agraf@csgraf.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211026071241.74889-1-agraf@csgraf.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.846,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, kettenis@openbsd.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 09:12, Alexander Graf wrote:
> Apple's Hypervisor.Framework forwards cache operations as MMIO traps
> into user space. For MMIO however, these have no meaning: There is no
> cache attached to them.
> 
> So let's just treat cache data exits as nops.
> 
> This fixes OpenBSD booting as guest.
> 
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reported-by: AJ Barris <AwlsomeAlex@github.com>
> Reference: https://github.com/utmapp/UTM/issues/3197
> ---
>  target/arm/hvf/hvf.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index bff3e0cde7..0dc96560d3 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -1150,12 +1150,19 @@ int hvf_vcpu_exec(CPUState *cpu)
>          uint32_t sas = (syndrome >> 22) & 3;
>          uint32_t len = 1 << sas;
>          uint32_t srt = (syndrome >> 16) & 0x1f;
> +        uint32_t cm = (syndrome >> 8) & 0x1;
>          uint64_t val = 0;
>  
>          trace_hvf_data_abort(env->pc, hvf_exit->exception.virtual_address,
>                               hvf_exit->exception.physical_address, isv,
>                               iswrite, s1ptw, len, srt);
>  
> +        if (cm) {
> +            /* We don't cache MMIO regions */
> +            advance_pc = true;
> +            break;
> +        }
> +
>          assert(isv);

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

