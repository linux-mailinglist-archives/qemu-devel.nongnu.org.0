Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3342669772D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 08:11:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSBvm-00074j-3f; Wed, 15 Feb 2023 02:10:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSBva-00073X-AF
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 02:10:06 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSBvX-00006g-Vl
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 02:10:05 -0500
Received: by mail-wr1-x429.google.com with SMTP id r2so18024695wrv.7
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 23:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5rQrdf4wX4WOvxW7C17zWEq8ahsfua1KVAy1shLISrs=;
 b=ne6BYhitXAUpj75vvK9e87GrfYVmsbtIaeuatrkzBV650diBPBYNfVpMihE66TCjLX
 rVFbazdNeTY95c2OzWtOaIKpIvaO9NaEB6BY4BQy7alixFrzuduyRR181atlbhdRodpY
 BcfHcex81i2OuO8qwga/I609ImVSxbIfAHuyvR7aZj0636LlMIeV7QoPhd8CBRQpC/1c
 B2Hs7TqMakq76xaSScusBfCWO8nwJZbfrKnLz/UNzM+MBQXmxAbfXx25YB1wc5WCPi8S
 nwI1xPfOsNqWSEnqZNhi8gtYqhML6XNaN9tqb7eobOfBkj5nBF28pzXjSjdP+6R7Sl6J
 /uHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5rQrdf4wX4WOvxW7C17zWEq8ahsfua1KVAy1shLISrs=;
 b=xuV06Ah3el0eMOggCcbCzTYpuCsJmkX/IA0Atzgs52UZT5q6Te4sQ302NI5RkFM0MO
 DummcD7jBEZlCOonvrn1NclnB7arXekyS6ygL65VfDkaF0XCS13ajymJj9CNuY9RJgnb
 2XemHPjnbPLszQ2UpjejYglg9Ae7ULbKmYCFLI/vBjNvBPNdsIZ6jyMgIRrZ10ITkMJ3
 5bBxtmAk+XszlmEdZwjjTWvt2eQMdOcd0o76VyvgaLoOvQl0Z/dH6XS+PvF46fcAHfPl
 ZnIegm5E4brxMFawWhQ2NnCffLXubM0HT7GutoMzjLHW5x//oydSZXAtX5MOpWtYJe0N
 r26Q==
X-Gm-Message-State: AO0yUKVhFSuKZkVCTjccrZR28C7Qtokzzschv2oj9Cj1ArbAn+IMFeab
 DHJ4qqjDMJLF2vNTCerP/ET7cw==
X-Google-Smtp-Source: AK7set+auUUfUW+vNX74L9ckJEBgj9hL/XefaMyuPuvYuuI8pRsPi+fLEL/UvGNCiQ08QD1+I/1VrQ==
X-Received: by 2002:adf:e707:0:b0:2c5:550e:fad0 with SMTP id
 c7-20020adfe707000000b002c5550efad0mr718951wrm.17.1676445002075; 
 Tue, 14 Feb 2023 23:10:02 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 b15-20020a5d550f000000b002c55ebe37ddsm5372556wrv.115.2023.02.14.23.10.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 23:10:01 -0800 (PST)
Message-ID: <a8cc2a89-c34e-986b-eaa0-317db14228f8@linaro.org>
Date: Wed, 15 Feb 2023 08:10:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH] target/s390x/arch_dump: Simplify memory allocation in
 s390x_write_elf64_notes()
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 David Hildenbrand <david@redhat.com>, frankja@linux.ibm.com
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230215054834.726355-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230215054834.726355-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
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

On 15/2/23 06:48, Thomas Huth wrote:
> We are not on a hot path here, so there is no real need for the logic
> here with the split heap and stack space allocation. Simplify it by
> always allocating memory from the heap.
> 
> Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   Based-on: <20230214141056.680969-1-thuth@redhat.com>
> 
>   target/s390x/arch_dump.c | 20 ++++++--------------
>   1 file changed, 6 insertions(+), 14 deletions(-)
> 
> diff --git a/target/s390x/arch_dump.c b/target/s390x/arch_dump.c
> index a7c44ba49d..84e17effda 100644
> --- a/target/s390x/arch_dump.c
> +++ b/target/s390x/arch_dump.c
> @@ -227,25 +227,23 @@ static int s390x_write_elf64_notes(const char *note_name,
>                                          DumpState *s,
>                                          const NoteFuncDesc *funcs)
>   {
> -    Note note, *notep;
> +    g_autofree Note *notep = NULL;
>       const NoteFuncDesc *nf;
> -    int note_size, content_size;
> +    int note_size, prev_size = 0, content_size;

We can start with:

   prev_size = sizeof(Note);

If this goes thru your tree, feel free to modify without respining.


Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Thanks!

>       int ret = -1;
>   
> -    assert(strlen(note_name) < sizeof(note.name));
> +    assert(strlen(note_name) < sizeof(notep->name));
>   
>       for (nf = funcs; nf->note_contents_func; nf++) {
> -        notep = &note;
>           if (nf->pvonly && !s390_is_pv()) {
>               continue;
>           }
>   
>           content_size = nf->note_size_func ? nf->note_size_func() : nf->contents_size;
> -        note_size = sizeof(note) - sizeof(notep->contents) + content_size;
> +        note_size = sizeof(Note) - sizeof(notep->contents) + content_size;
>   
> -        /* Notes with dynamic sizes need to allocate a note */
> -        if (nf->note_size_func) {
> -            notep = g_malloc(note_size);
> +        if (prev_size < note_size) {
> +            notep = g_realloc(notep, note_size);
>           }


