Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8667C510DBB
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 03:09:58 +0200 (CEST)
Received: from localhost ([::1]:55466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njWBp-0006CN-MV
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 21:09:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njWAB-0005IN-G7
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 21:08:15 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:50900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njWAA-0001r9-1w
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 21:08:15 -0400
Received: by mail-pj1-x1029.google.com with SMTP id iq10so170612pjb.0
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 18:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7+rWRD3n5s6fGWsc+qWm1Xebr+XrZPMiKUMz3X4b3mo=;
 b=YGOHRoRdsmDl4ECV35TKkiga3eSl+TjiGr7u8OTRcpxHC6NmsTYc5mzH1btZeOymcu
 EX6MQvoqW5trin0ELDw7nfegjaD/N7cuxRxCvv1nCcesMF3CYxnOGIFROcupMZSPWfYY
 YR9YIPnDd4Opunk0vdRWx++S9Wvxx65CKxyfJgymsdHVkIEJWCShbsB6k0GTypInejky
 Inkvzgsu0WmxV2kOiKqVBdtZI6YVKiMJRa5Dn86DlZhqPdyiiTxbHN6TfvILeGa3uNp/
 R2FssqEekASC04lCOQPZdZmg303jSKCXxQ05+tcen5B5COIOHzRAF43eV6uT7zo6NFeF
 yKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7+rWRD3n5s6fGWsc+qWm1Xebr+XrZPMiKUMz3X4b3mo=;
 b=mQb8lbiDZXSgD2jw2S12D6NwFOWaBs8amg/YvAoyFBuO7vn45Gbs9mcWb2Q2HdvZHh
 iGH2WCXJ8zAmMWkaJMtZecwiyanUHt4BC9f7aVoOOJrg4XySrzA8sklSVuGMWbGAoWyJ
 g0uOv3KE/ndkvoL3ny8ajdauNraPWRTUnk5W9QXb+cYs5w4TNCW8pvom7OcGvtCiD9TK
 7AxQKJ7jRYSKi2lUWFeSa/DJbmH+A4U83OaB+J4OUxST6UJYct2LI8SlGXYABJEt3ZUv
 vl6YxVh3yMsZ91sVp8HsooR86htQ7ERjtzMpHZewbyMEtE12u9wWmZZG+WIwdMGC5eVA
 sHRA==
X-Gm-Message-State: AOAM530O7/4SHPiSzZywjA2TXBzdAduitJVSM4zhNbOfW6na4IkDJJho
 RWU3V9ong7X2VohfRUhQSEkU4g==
X-Google-Smtp-Source: ABdhPJy29G4lmh+bk3TTg86kS7QSRvGAWY8OWd55BozfU9DVH2OK8qh6VSt4BIhocrWIR5o8xL/Dog==
X-Received: by 2002:a17:90a:901:b0:1d9:4253:23e with SMTP id
 n1-20020a17090a090100b001d94253023emr20553151pjn.150.1651021692752; 
 Tue, 26 Apr 2022 18:08:12 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a655685000000b0039d519701a9sm13722317pgs.27.2022.04.26.18.08.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 18:08:12 -0700 (PDT)
Message-ID: <50b57e00-b805-5868-1dff-f4ed67a77a03@linaro.org>
Date: Tue, 26 Apr 2022 18:08:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 12/26] qga: replace pipe() with
 g_unix_open_pipe(CLOEXEC)
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
 <20220426092715.3931705-13-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220426092715.3931705-13-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/26/22 02:27, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   qga/commands-posix.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 77f4672ca2c9..094487c2c395 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -2529,7 +2529,7 @@ void qmp_guest_set_user_password(const char *username,
>           goto out;
>       }
>   
> -    if (pipe(datafd) < 0) {
> +    if (!g_unix_open_pipe(datafd, FD_CLOEXEC, NULL)) {
>           error_setg(errp, "cannot create pipe FDs");
>           goto out;
>       }

This looks wrong, since the next thing that happens is fork+execl.


r~

