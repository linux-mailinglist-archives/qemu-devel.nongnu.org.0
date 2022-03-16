Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6724B4DB1C6
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 14:44:35 +0100 (CET)
Received: from localhost ([::1]:36382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUTx4-00039m-Fb
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 09:44:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUTXm-0002pU-CB
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:18:26 -0400
Received: from [2a00:1450:4864:20::434] (port=43559
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUTXk-00034X-1R
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:18:25 -0400
Received: by mail-wr1-x434.google.com with SMTP id a1so1555884wrh.10
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 06:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=YpKTKqU+N4bhSk0OlZ6PQxNRrQzrHfyYD2SssRfq6+Y=;
 b=GU+6IBpgPbFSaoODPXT93UwE/NEksQWyWIXUPQJ1zMnKJcJ2EUOAUz/0DWZ7UvZ/rT
 OyR8xdFxWASDYZzRpM+HYooG3YFRl5lHsHxszmTvQZUQ+AUjAAloeEtpIsSyszZnOor4
 MZtZ6GZZaRZAIvgidWf++0jSfZyWbfawcxq80FmtXFrMTEhiYEGXM/VM5tvFpE4p+pUK
 sMXgrcU5CbsrYqLSI6N/+o7Qi7657gx0jLT8wKtE75ejPy35n1zIS7XHJdNAG6vfZz9n
 Lm4oY3Fjh+lmCTumXQN6MBvlGTu/tGG90127y1y5YK36XDN0ueU+ommsGKdBtnDlmOgr
 TTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YpKTKqU+N4bhSk0OlZ6PQxNRrQzrHfyYD2SssRfq6+Y=;
 b=CEXKDXHi0v38tpflicjqNgkWRySKZH9uXSxQyTwjpQzGcKQGIkgeY9VWuddob6qygj
 Z1SlEoFyeBnG5PwnqbajgbrM7cyjo7x7ZJKWchxoGW1lCgBjgMLIG/lMbc97/v/1+F4l
 E5J9W2uwsuDYu2DzzOKIcSlYPzuJ1cSq1AX+anavmYFuklnHtD3u+BUkO0qeGVsAJ2XU
 nruq4GIxqL4uo/5Doxp1DaueSN7YgWJuOWC13advgG3n08EYg7kvwsO++zaZiA3Eibx7
 4V0/qVXmCTxfDVCQm0rf0OXbfC33qJ4PDFaDbPyHO3Kmx2S0Ev2d4+2Z0sDzHt897nyH
 mz1A==
X-Gm-Message-State: AOAM532dqyN+PqtaXhXsnQl3UiIwz/3TlIEBpc9PK2Y+i0/Wuh24lnKl
 f5cXqPOPCv9dCi1PHI8Q8p8=
X-Google-Smtp-Source: ABdhPJwNWyDyr5NpAYgWR9MTUXOj4tfbarL+vxlx+Z/ZeNLBCDIf8FvJt9/3uO1LR6qUadDwEHwvYA==
X-Received: by 2002:a05:6000:1849:b0:203:96c8:dc71 with SMTP id
 c9-20020a056000184900b0020396c8dc71mr19676685wri.572.1647436702589; 
 Wed, 16 Mar 2022 06:18:22 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 189-20020a1c02c6000000b0038c57df82aasm1744534wmc.20.2022.03.16.06.18.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 06:18:22 -0700 (PDT)
Message-ID: <15170a5d-ec9e-1c1e-08e2-cc77efda8c82@gmail.com>
Date: Wed, 16 Mar 2022 14:18:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 13/27] Move HOST_LONG_BITS to compiler.h
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220316095326.2613694-1-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220316095326.2613694-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/3/22 10:53, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> This will help to make common code independent.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/qemu/compiler.h | 3 +++
>   include/qemu/osdep.h    | 3 ---
>   2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

