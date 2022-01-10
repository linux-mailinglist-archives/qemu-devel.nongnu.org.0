Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFC648957C
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 10:42:16 +0100 (CET)
Received: from localhost ([::1]:44480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6rBv-0000vy-Qd
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 04:42:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6r8t-0006wV-Rs
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 04:39:07 -0500
Received: from [2a00:1450:4864:20::430] (port=46724
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6r8p-00068a-JD
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 04:39:07 -0500
Received: by mail-wr1-x430.google.com with SMTP id l25so14676303wrb.13
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 01:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CsYIfMR+4nKAAIqrQCuKZImTgjI7yEcY5c9AgHRcfd8=;
 b=hhi7jMlxCVzHZ7012D3vRkb3J+IZtuU45xn746Hb9ecDxPrC7lp9z8HGV1/3xRQLL8
 BKCYl9Jj4JbP1B3YH+Fn45gopE4qZ685zYZL/subViVglKiA9eZOktNvrdZ1zg5dWXTT
 LER22wK4cZpbjl6TmRUj05dcPzY2biygI011S3lbcHKnbrMp8SQPjvL+++VhJK0tSmXp
 T6jIBIBo3XoOrGCNDt4ogeLl03l11DlK8wDXNH+M/1XOP3FnKAnNUiLdlh/jnXzGlkbG
 JGD57/jUdybHljEUSSjAzY5HgdIDMIr7Arbl0kmZefHd0gD52Fdcf6xHYv1+dHRFQc0K
 eafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CsYIfMR+4nKAAIqrQCuKZImTgjI7yEcY5c9AgHRcfd8=;
 b=pWLYU5+5gcuZKZ+cVVBJY9WTJ5sCm3YgLZjFxI3/JIV9KpVxNlaVd36N+POQ9b6QI9
 C+Iff5/O4BX1d1ci1xozZwbAoacGAO4tY4jirMH4pRJXZDxjY6NTuyeAjrpcRWgelMX/
 UkfWbQyhcwGjXW8fGxARE4YyzYTqpA+B2KV4ONE29D6h6Ib9VDkxy0J6djGKyHd+YmPJ
 nK97594aoHLMTF+ihsOov5AIfZe4Bacx9cxwhGoUmVGXwzeVWqmxpZjoeuhvRQQw2die
 Rpms9PiiQid554iUcZ5Qi9XzX7OlMwEHKtFsHLOUSw4vqqcKCewk+1dfZSiHiqe/BwEd
 E7Hg==
X-Gm-Message-State: AOAM531h3raHRoPUAoy/xdNy6S9VC/wUZ+KB0VbSzRZ/FtcZkCAyrOlL
 jJ9N1FVbCWHqinBm84xKTdQ=
X-Google-Smtp-Source: ABdhPJx5kYUeqwCwGkhGx8o0VuMPcjpa4I8ohvpR72cg7hYIKyizFGknmChCwyGnftVMQKYfV8aARA==
X-Received: by 2002:a5d:690c:: with SMTP id t12mr1691122wru.536.1641807542287; 
 Mon, 10 Jan 2022 01:39:02 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id z5sm5016486wmf.25.2022.01.10.01.39.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 01:39:01 -0800 (PST)
Message-ID: <0424f2d4-c9d0-3409-78e1-c0cabbff90a1@amsat.org>
Date: Mon, 10 Jan 2022 10:38:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] net/dump.c: Suppress spurious compiler warning
Content-Language: en-US
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20220109205748.4127032-1-philipp.tomsich@vrull.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220109205748.4127032-1-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eric Blake <eblake@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Richard & Eric for dubious compiler warning.

On 1/9/22 21:57, Philipp Tomsich wrote:
> Compiling with gcc version 11.2.0 (Ubuntu 11.2.0-13ubuntu1) results in
> a (spurious) warning:
> 
>   In function ‘dump_receive_iov’,
>       inlined from ‘filter_dump_receive_iov’ at ../net/dump.c:157:5:
>   ../net/dump.c:89:9: error: ‘writev’ specified size 18446744073709551600 exceeds maximum object size 9223372036854775807 [-Werror=stringop-overflow=]
>      89 |     if (writev(s->fd, dumpiov, cnt + 1) != sizeof(hdr) + caplen) {
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   In file included from /home/ptomsich/qemu/include/qemu/osdep.h:108,
>                    from ../net/dump.c:25:
>   ../net/dump.c: In function ‘filter_dump_receive_iov’:
>   /usr/include/x86_64-linux-gnu/sys/uio.h:52:16: note: in a call to function ‘writev’ declared with attribute ‘read_only (2, 3)’
>      52 | extern ssize_t writev (int __fd, const struct iovec *__iovec, int __count)
>         |                ^~~~~~
>   cc1: all warnings being treated as errors
> 
> This change helps that version of GCC to understand what is going on
> and suppresses this warning.
> 
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> 
> ---
> 
>  net/dump.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/dump.c b/net/dump.c
> index a07ba62401..c32d3bf4e6 100644
> --- a/net/dump.c
> +++ b/net/dump.c
> @@ -86,7 +86,7 @@ static ssize_t dump_receive_iov(DumpState *s, const struct iovec *iov, int cnt)
>      dumpiov[0].iov_len = sizeof(hdr);
>      cnt = iov_copy(&dumpiov[1], cnt, iov, cnt, 0, caplen);
>  
> -    if (writev(s->fd, dumpiov, cnt + 1) != sizeof(hdr) + caplen) {
> +    if (writev(s->fd, &dumpiov[0], cnt + 1) != sizeof(hdr) + caplen) {
>          error_report("network dump write error - stopping dump");
>          close(s->fd);
>          s->fd = -1;

