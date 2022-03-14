Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFC54D8684
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 15:14:56 +0100 (CET)
Received: from localhost ([::1]:33186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTlTK-0003GW-OP
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 10:14:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nTkmh-0006lc-31; Mon, 14 Mar 2022 09:30:51 -0400
Received: from [2607:f8b0:4864:20::52c] (port=40647
 helo=mail-pg1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nTkmf-0000br-Gm; Mon, 14 Mar 2022 09:30:50 -0400
Received: by mail-pg1-x52c.google.com with SMTP id q29so12849323pgn.7;
 Mon, 14 Mar 2022 06:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xzZsFMqNgaZEAKyJs05PDsW3TMdcxOzBatBXdgcUIbE=;
 b=P2VB8UvFMGk6dbmlfcOTMKmv+C9pPr5OqX0VAbeMl7cE6fLFdYtGdxHQfw/qh9ks6Y
 R/VpsoHMAKv5Ca4GkWF+c0iKWEjGj1APEQo8EKQMwqBhDYD8p+DY/fOb1Y0afpSSVyY2
 sJiMFerBPcj47lw0DNZsyMHdo7COuqN/Z3wAJxo8RS/CGhGCXqMPle7rg930TMe+KD8q
 WfrWyzNrEeNYM9MeGp3nxKbwto1U6HruNB7ya43ZzTF8jJCcoo7YcFIPru+lGNjydUWb
 CSZOYo2tFoLlr4z0QtbXLrFmPsOSipRE9ATAPAjXhCU4h2Mtixb4AB0lMSxi6gaJnlpE
 a1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xzZsFMqNgaZEAKyJs05PDsW3TMdcxOzBatBXdgcUIbE=;
 b=WB26hIHc54IQGVxbYjWit0cJGxyb5odlMeAOBFMNY2Ol20rEF0vEuJ/6aWUluqedxk
 ByoQpC84FNLy/d/AkxzcOTUMZ9L4IanNAeJwL5bqXjq5ekavrrk/CR2ETzw2R/nuA2HV
 lEBLLrx4qB4Gr5JGW6kKyApV8WzGEDGHcITyNr8txh8h0vMdxfIrOW+27/TjJpo7Qi73
 K+Ah+gX/ncxyLiv4btUosJ5eDJ5CFZ00If8Wu9izdxjNTfWLP5wxnwYb2DHUy4GUAKXF
 eo1IkoNvLM7tQgCr0knIWz4lzaKinwmqjY7i8k8UI8HwibrpOeJLqbrh4rwDd0BYjC16
 O1lw==
X-Gm-Message-State: AOAM532xr8qyJJEdlnUR485DYY3xmHn/2M3kSbw2amytlGWoTZm4GGHE
 /tjYFV+QBlm2fnBMDAHFKog=
X-Google-Smtp-Source: ABdhPJxuPUsgpVKNJKF2Ahg+hyuOcrR5/V1z66TGvXfQWgGzNZIy8K9vq+lmQs9FUaX0hPhZNXrjHg==
X-Received: by 2002:a05:6a00:814:b0:4f7:4c6:1227 with SMTP id
 m20-20020a056a00081400b004f704c61227mr24075928pfk.54.1647264647609; 
 Mon, 14 Mar 2022 06:30:47 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 cv15-20020a17090afd0f00b001bedcbca1a9sm21796284pjb.57.2022.03.14.06.30.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 06:30:47 -0700 (PDT)
Message-ID: <a63c1972-964c-ba04-5485-f910d8407dd5@gmail.com>
Date: Mon, 14 Mar 2022 14:30:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH experiment 12/16] remove "new" keyword from trace-events
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220314093203.1420404-1-pbonzini@redhat.com>
 <20220314093203.1420404-13-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220314093203.1420404-13-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52c.google.com
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
Cc: kwolf@redhat.com, hreitz@redhat.com, berrange@redhat.com,
 stefanha@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/3/22 10:31, Paolo Bonzini wrote:
> This is invalid in C++.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   util/trace-events | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

