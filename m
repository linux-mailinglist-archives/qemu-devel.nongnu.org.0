Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23211499D23
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 23:17:00 +0100 (CET)
Received: from localhost ([::1]:56104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC7dz-0002uT-9I
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 17:16:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nC7bL-0001Tl-0Z
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 17:14:15 -0500
Received: from [2a00:1450:4864:20::42b] (port=41727
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nC7bH-00047l-Lh
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 17:14:14 -0500
Received: by mail-wr1-x42b.google.com with SMTP id r22so8627699wra.8
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 14:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fwaMDH8cSmbbSS0xpGdhd/no6vCAej8bHfnZpxUaZRA=;
 b=jCVjBDbJK8QM68KQjUARnJH7gB0MHwtbp654j4NmwfVeX9lVLqyXBsYGDtv/hEGqmS
 pMo+Fkhd7f0FPtk4dddvtnfHjuz5lO6GmiVQj/xrPA0B0/IUUHs1vYlIW9uZ7nI+poKS
 vPvQHydouUEy8DfOyYE6i9Ild1wM8nghp/6SsRRA3PoZgtayENJiH7iC1sdSJu00vL39
 s2uY5+1vI+cVa9zSD7z5Y2UdocYMnZ2rM6oyqxBvOfsJX15arMgSD/jSIcjnkfIQvU4U
 nvtl4mJFKrN6vE9VfaF3tgF0QcN0z1+0smhZPX7ymztKksLpQeZFfYv3hr1eW5aN+hFk
 DHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fwaMDH8cSmbbSS0xpGdhd/no6vCAej8bHfnZpxUaZRA=;
 b=3oZKTd8L0S7KdquA9+sfA+VMEDVwVeoWgwD3kWq+sbTvYnqCEHxI8XU0Elhq1fd/xl
 0XWVWtzIwt5ttNbYAb9mWILPkmM+iXP6ObD9NujQtflPqnaMkDtxtE1MLGHcCC7EBDfc
 D3N0SYI6KoPJFs9hdjzYQ0RKODJYGuwbr7FT5dTscpFCGTIEp6qCz6TcCvVyQghWzwXV
 BVMULP1JXe8qRR+H+FzqkybCOh8fnhHpc1f0vfAlB9Cfkc0mZUW7KKooka2cZcCeLDNR
 FPJd0PZ2Ndlw9XU/s9/+G0506ljsZK+VTqxIJPzzFbxvRdyj3BjBRABNcf6gAjRDfvcR
 j0SA==
X-Gm-Message-State: AOAM533vSbDxmuHgm+eziXLWvnbaApeFJF7MCQSm7LnCWJI+2ojnxf6i
 63vMYUxosS9AOshNYjwVq+M=
X-Google-Smtp-Source: ABdhPJw1/VMpWEUAv6c7BuB2We0jbtLHwb8KhnIYHjQRo2tep4YSlKORFLeqzPtrZ2MC05mMl0ND2w==
X-Received: by 2002:a5d:6486:: with SMTP id o6mr15624512wri.609.1643062450520; 
 Mon, 24 Jan 2022 14:14:10 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id o12sm528297wmq.41.2022.01.24.14.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 14:14:10 -0800 (PST)
Message-ID: <399c4c73-f629-cefc-f2ac-6d3488d37bf6@amsat.org>
Date: Mon, 24 Jan 2022 23:14:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 21/22] target/i386: use CPU_LOG_INT for IRQ servicing
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 aaron@os.amperecomputing.com, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Luke.Craig@ll.mit.edu, Paolo Bonzini <pbonzini@redhat.com>,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com
References: <20220124201608.604599-1-alex.bennee@linaro.org>
 <20220124201608.604599-22-alex.bennee@linaro.org>
In-Reply-To: <20220124201608.604599-22-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 1/24/22 21:16, Alex Bennée wrote:
> I think these have been wrong since f193c7979c (do not depend on
> thunk.h - more log items). Fix them so as not to confuse other
> debugging.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/i386/tcg/sysemu/seg_helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


