Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B6A4D6976
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 21:27:37 +0100 (CET)
Received: from localhost ([::1]:43984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSlrM-0000wd-0L
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 15:27:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSlqE-0000GJ-Ru
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 15:26:26 -0500
Received: from [2607:f8b0:4864:20::102e] (port=55835
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSlqD-0006p0-6a
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 15:26:26 -0500
Received: by mail-pj1-x102e.google.com with SMTP id e3so9027818pjm.5
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 12:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=fD6w0wp8LPQzesxAd0Y7irKgL/ruNexZXG/0CDf7A+Q=;
 b=Ifm3R7P9+z0HKJDh4kc8FfZ2UrtPPkZBQm5Hg2jv9Xly61k6yFBhNaSv6kvGLfy1bv
 J4ZFtI+HIAcL25O1FjuWjZZoLwKemIKnX4qSwLpZxCMh+kuONJOdA8dkI9udFEYYsRv7
 r1+WydVopGu1hfh+2IymHFcBZQCVqj5leUKmacN6ixx5wk7Y1eha36qz2apBp8WVlZfM
 8ePgMPhKG9F0aMvlEwImpa2L/0cmjWjSrto7h5RqGrB9k+taLnpn6OMxWIt/Ey/iN/dC
 aur41EL6hyoPFe6WxH+ia/764+p6wk/dATfTFl9LGokSmcmJe0ZFsO9+e2o8rXD5I0L/
 fvNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fD6w0wp8LPQzesxAd0Y7irKgL/ruNexZXG/0CDf7A+Q=;
 b=xBkwUOoHAvDQkcFQ6h4bMJr/8fWODm4KfHVIawdv3AZ0acaCqjljcQ6AUedu82uGZd
 ont6oASnV7qEXl7nYXiy6+x2SwiavqRtnOYyjZ6cvEnIoZaemD+F1H9hRIJt1TLxYcfs
 XP+3y7NOCBWmWq82UxUDE8RH46GNTHk3/tgFK63ps0+XsHCl9YTKGj7zX74psrCTO1R8
 z8igBjSWhFmfUST3PClzNGUzaUn72YfhXJlqgQ/z5bVwQE5RpFQqVN+oxnSTyZxp+Q3T
 +UCi+QMgSJP1wywLnXkkZjWarApbkSDSBbLRvooDGdLNJ+SVS4sHxglAmntGa9tMdz2h
 ltsQ==
X-Gm-Message-State: AOAM5315cKMxPSSP0b445YiuJVorkEmYXJFqaZBGhjovi+ARZSqrsGwo
 et0kTEAl3I0eiMj3cMkXOG5lfw==
X-Google-Smtp-Source: ABdhPJyTkAXV+TMMnm5cWGN9xUl6VbUlnWUs+sia1+yuTG2KvSgwdjzIFKGC0p1QsYTb3RPv+3H6yQ==
X-Received: by 2002:a17:90b:4b4b:b0:1be:fd9a:c279 with SMTP id
 mi11-20020a17090b4b4b00b001befd9ac279mr23660891pjb.83.1647030383586; 
 Fri, 11 Mar 2022 12:26:23 -0800 (PST)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm13775821pjp.39.2022.03.11.12.26.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Mar 2022 12:26:23 -0800 (PST)
Message-ID: <d20dfd54-0501-0d15-049d-83451264f498@linaro.org>
Date: Fri, 11 Mar 2022 12:26:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/5] dump: Split write of section headers and data and add
 a prepare step
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220310111608.3362-1-frankja@linux.ibm.com>
 <20220310111608.3362-3-frankja@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220310111608.3362-3-frankja@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, mhartmay@linux.ibm.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/22 03:16, Janosch Frank wrote:
> -static void write_elf_section(DumpState *s, int type, Error **errp)
> +static size_t write_elf_section_hdr_zero(DumpState *s, void *buff)
>   {
> -    Elf32_Shdr shdr32;
> -    Elf64_Shdr shdr64;
> -    int shdr_size;
> -    void *shdr;
> -    int ret;
> +    Elf32_Shdr *shdr32 = buff;
> +    Elf64_Shdr *shdr64 = buff;
>   
> -    if (type == 0) {
> -        shdr_size = sizeof(Elf32_Shdr);
> -        memset(&shdr32, 0, shdr_size);
> -        shdr32.sh_info = cpu_to_dump32(s, s->phdr_num);
> -        shdr = &shdr32;
> +    if (dump_is_64bit(s)) {
> +        memset(buff, 0, sizeof(Elf64_Shdr));
> +        shdr64->sh_info = cpu_to_dump32(s, s->phdr_num);
>       } else {
> -        shdr_size = sizeof(Elf64_Shdr);
> -        memset(&shdr64, 0, shdr_size);
> -        shdr64.sh_info = cpu_to_dump32(s, s->phdr_num);
> -        shdr = &shdr64;
> +        memset(buff, 0, sizeof(Elf32_Shdr));
> +        shdr32->sh_info = cpu_to_dump32(s, s->phdr_num);
>       }

I'd move those shdr* variables into the if blocks.
It looks odd to have them both in scope at once.

You're re-zeroing the data -- it was allocated with g_malloc0.

>   
> -    ret = fd_write_vmcore(shdr, shdr_size, s);
> +    return dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
> +}

Return value here...

> +
> +static void prepare_elf_section_hdrs(DumpState *s)
> +{
> +    uint8_t *buff_hdr;
> +    size_t len, sizeof_shdr;
> +
> +    /*
> +     * Section ordering:
> +     * - HDR zero (if needed)
> +     */
> +    sizeof_shdr = dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
> +    len = sizeof_shdr * s->shdr_num ;
> +    s->elf_section_hdrs = g_malloc0(len);

Perhaps save to s->shdr_len?

> +    buff_hdr = s->elf_section_hdrs;

Why this extra variable?

> +
> +    /* Write special section first */
> +    if (s->phdr_num == PN_XNUM) {
> +            write_elf_section_hdr_zero(s, buff_hdr);
> +    }

... but not used here.  Was there some other intended use?  You already know the size, per 
above...

> +static void write_elf_section_headers(DumpState *s, Error **errp)
> +{
> +    size_t sizeof_shdr;
> +    int ret;
> +
> +    sizeof_shdr = dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
> +
> +    ret = fd_write_vmcore(s->elf_section_hdrs, s->shdr_num * sizeof_shdr, s);

Use saved s->shdr_len?  Skip if 0?

> +static void write_elf_sections(DumpState *s, Error **errp)
> +{
> +    int ret;
> +
> +    /* Write section zero */
> +    ret = fd_write_vmcore(s->elf_section_data, s->elf_section_data_size, s);

Again skip if 0?  Comment is misleading because section 0 should have no contents...


r~

