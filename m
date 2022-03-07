Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1994D03B0
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 17:07:21 +0100 (CET)
Received: from localhost ([::1]:56880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRFtI-0002rf-1W
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 11:07:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRFq7-0001D6-OQ
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:04:03 -0500
Received: from [2607:f8b0:4864:20::42f] (port=40789
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRFq6-0000F7-3l
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:04:03 -0500
Received: by mail-pf1-x42f.google.com with SMTP id z15so14238531pfe.7
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 08:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Tc9+T8775sZcgfJFtCMh5SQxNxpa2REG2waxLnRH5gA=;
 b=nWPZfCLP6Rj/MtnjzbkQGUHHrOHpFzj+Adq8JTYUbHNgqE+Po8oSRQ7lF/V2LIJyOi
 Io1S0ROBK7TJjeB/07Ccyf+HSik/YJq6b+Bl0xMUF3KQJ2t5TFVIYzRkCBak07LVChjm
 i8Ua8p5NTS7U3PHeoyslbNluPywTxaZqJXF0kUSOOnrB2AfwxixptP14y2B+7VHu4GAn
 PnpJJ5W1D4zlj7hg31Gc9KkCY6FSSjOWnmmAw3YF+NxbDwCcdof2cT1VIe5Su0seAI05
 3V3YfxGsrztaL/7dYvG+Zbw4Gkj+BhRt9D9iT71WnFV5r1OjH6E9eyrmI6yZsrdWPGw+
 oyFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Tc9+T8775sZcgfJFtCMh5SQxNxpa2REG2waxLnRH5gA=;
 b=zqyf43/ARarGfR1ky7MAn9uaKc7CuOTa7mUYGKIhyEA/w4YLXWWN2m+x9dSiUZoVNB
 5gbritaGMa+CWPUIIPHqtE2JZVyXam6btrfq1U83aaxc4q//8+ZFGmuJz7patNcyV724
 /eWpQjOiOZmpyAPYdksGLl4XEcaPLA93RzBrlfshzWSTApY8XSgcHgxhZOOBpgFxRtPJ
 7Q4WTWQ9snxhJghx+cwY9RF78eQf0BgYMmv9J5BY9TJpROX4hf49HWxa2bhxUfxu24Vy
 7q8zz6L4/yhV3Upv3KtDquDNpXfez1FrZYlpiZIok+cZMQU0kMLXIB6BJBwxfBMhGH6Q
 GSbw==
X-Gm-Message-State: AOAM533Z2rQqATeNuV5PwwzSuSpmWXMcCvca4AEReCpH+4CXw+z87DCS
 buKJMyGVux5+q6EGvb6f704=
X-Google-Smtp-Source: ABdhPJx7malfDn3wlZ/aSRtdSbESF/s2lGvIkfNyH9zUfQ9rb4z2bKhMco2cxbre30tDnZYv+dgfDg==
X-Received: by 2002:a05:6a00:de:b0:4e0:ca1a:9f07 with SMTP id
 e30-20020a056a0000de00b004e0ca1a9f07mr13598151pfj.11.1646669040171; 
 Mon, 07 Mar 2022 08:04:00 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a056a001c4200b004f41e1196fasm15872250pfw.17.2022.03.07.08.03.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 08:03:59 -0800 (PST)
Message-ID: <c41c48fd-9e27-d521-d222-aee6e3f167fd@gmail.com>
Date: Mon, 7 Mar 2022 17:03:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 0/3] coroutine: use QEMU_DEFINE_STATIC_CO_TLS()
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20220307153853.602859-1-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220307153853.602859-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/3/22 16:38, Stefan Hajnoczi wrote:
> The coroutine implementation uses __thread variables internally. Compiler
> optimizations may cache Thread-Local Storage values across
> qemu_coroutine_yield(), leading to stale values being used after the coroutine
> is re-entered from another thread.
> 
> Kevin pointed out that the coroutine implementation itself is vulnerable to
> this problem. As a follow-up to my coroutine TLS patch series I'm sending these
> patches to convert __thread variables to the new "qemu/coroutine-tls.h" macros
> so they are safe.
> 
> Stefan Hajnoczi (3):
>    coroutine-ucontext: use QEMU_DEFINE_STATIC_CO_TLS()
>    coroutine: use QEMU_DEFINE_STATIC_CO_TLS()
>    coroutine-win32: use QEMU_DEFINE_STATIC_CO_TLS()

Series:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

