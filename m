Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0DC48B8D7
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 21:49:15 +0100 (CET)
Received: from localhost ([::1]:54370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7O4v-00066y-UJ
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 15:49:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7NaX-0007h6-75; Tue, 11 Jan 2022 15:17:49 -0500
Received: from [2a00:1450:4864:20::42d] (port=33447
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7NaV-0003If-N3; Tue, 11 Jan 2022 15:17:48 -0500
Received: by mail-wr1-x42d.google.com with SMTP id d19so432335wrb.0;
 Tue, 11 Jan 2022 12:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8e5WPf0StaVtu2e8SPWLEoDyr166RSKVw7mzpWY91Us=;
 b=mQbJrbAVhsR8g8LYr1+nE7g/YKiweDjJVGaNT8Lo0ukwnZj5kAckzNbe4MyHzrtEGW
 RCQgVQac69CNVp/0VwfoWAnvkKut8qf1nfYUlf+C1uNpFjUy/rwutg7dVgaopZ2hQ0uz
 Zfa8Oriflbo9gKtqRflT2jPqw0XoD0P2W1NsBwyLfds5AQJRQu+hEXe2+BGOHW4ccGCx
 HNoKmAl4XouBZ70P6eCTcHxKL2vDoS2Mp16x5UyO+DVeH9x2Ml4Cr1H7gsAvH+0yZNuv
 b9FoiQ3oK/MpXFlsRlSaKES0CALFgBFu/nUfe5a4LMPufrfU9BJI4xFVEazLxXhmMD5V
 QZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8e5WPf0StaVtu2e8SPWLEoDyr166RSKVw7mzpWY91Us=;
 b=cyTA6xdveUgZ1X9u2hYo+KhQyLXfQLqfXwJ9l8/6crogEhGa5/1tAwwvbmZs5YKxZE
 82VZxEo+aULSKPMI3uZ4/OphAS6asbTBJszXT1O8cZ/NlIWgxdlrQo++ehTH0QUy1fiu
 1O3Rfu/JmhkIE2kAqqLNEleJMHG3nRZYeRqkTrGWyPR+HfCQOP3jSr6ubp19nxkTjy1D
 pFlRmn6wkmBhwu5GtjIzdTGFeBuNImm6psM6KrlfCiJu1hXqYetAJUAWdIaiSNN4BEHo
 1NtgpkP+kVvTNXjPZ8BiY5PJx8kYo0eBLWWq+iph6ObCJUyMxZRhKU4CCFTP0Txz6GYY
 mC9Q==
X-Gm-Message-State: AOAM533cWFuALjx+4W6aRWsC3p+qzla++f58WxkA9IZYPqX9k73FOwjc
 5zQzFZYpD6Xd5kpy1cI9jBc=
X-Google-Smtp-Source: ABdhPJyPDnVnJ4Xk3nedpuH07NCq/TBubZRft2GcbRqT+QLjoheaObGmUSESfWNT9iY4fQZEeMc7fA==
X-Received: by 2002:adf:d4cd:: with SMTP id w13mr5182222wrk.506.1641932265691; 
 Tue, 11 Jan 2022 12:17:45 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id p11sm12163861wru.99.2022.01.11.12.17.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 12:17:45 -0800 (PST)
Message-ID: <9f0986b3-3878-72cd-33df-cd5f91bfc211@amsat.org>
Date: Tue, 11 Jan 2022 21:17:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] nbd/server.c: Remove unused field
Content-Language: en-US
To: Nir Soffer <nsoffer@redhat.com>, qemu-devel@nongnu.org
References: <20220111194313.581486-1-nsoffer@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220111194313.581486-1-nsoffer@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/11/22 20:43, Nir Soffer wrote:
> NBDRequestData struct has unused QSIMPLEQ_ENTRY filed. It seems that
> this field exists since the first git commit and was never used.
> 
> Signed-off-by: Nir Soffer <nsoffer@redhat.com>
> ---
>  nbd/server.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

