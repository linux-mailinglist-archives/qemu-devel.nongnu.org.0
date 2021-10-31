Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0578B440DBB
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Oct 2021 11:12:35 +0100 (CET)
Received: from localhost ([::1]:44600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mh7pI-0008E7-Kl
	for lists+qemu-devel@lfdr.de; Sun, 31 Oct 2021 06:12:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mh7nk-0007G2-BH
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 06:10:56 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mh7ni-0006xU-SV
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 06:10:56 -0400
Received: by mail-wr1-x42e.google.com with SMTP id d13so23761166wrf.11
 for <qemu-devel@nongnu.org>; Sun, 31 Oct 2021 03:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rIA6E0Gv4ZlWKAg62TWFUvqbPbW0k8LodnMTZiJmBhE=;
 b=G180uNi+tBfuCmHipzqPo9jNF6XL+4VYSmFghzPRy4O9052wEF5TZ9bDHKitr3CHsB
 /XpLgGErmrv9XzudDtRnZEduSDWIurEwazT9lwI+VB+1rUOSDJw5AReTzL5DcMTeNcfn
 B4GHYUp3NGqcaufWoRpAPJ5DtIjKYTSpYCslAU2sGzIzqdV5Zr8XiSFX9j3sNZxMCGs7
 WGXor82QCVOPkHXPIqwacpdcjTQa+HRSWb3FGA9QUe5xMAI55uouypx13FnLCTKrZpJ7
 solWkBr6RsEJfTwBcIGFHYh2JTjkKxn9vC9u0VkMltk3GXZ0Pq0jm8bvDO7MFRd2qeyJ
 6JQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rIA6E0Gv4ZlWKAg62TWFUvqbPbW0k8LodnMTZiJmBhE=;
 b=vlVtb1WFVEh6Xh/lF1b81XwXYKSV1B37jNysBFuU2syq2eGRynriO/XNaLCL+P6OmN
 D9SsEQhQ161BCvCVXSBFQr2BPBZOx9j/zrKHi5+9ch7WQA1Ms75PfEVenHNCp5cskAfO
 6RSj57TlZgJR69Bv8Vs798ZCrOSSGZTIHSPN3wbI/l5LdCm/PRhfR7x3Q1DULyY0mGOX
 pjFB5ndleMPcIGdPgno48CDvQAJ3KFn3WPmA2m9LGqU9ER6iQ5BTT/mawoKHByl417XW
 F4jqr9X8LmI0zT9jekmTNT9opRvT5NR0HQNa0tnMnstKnrHGtM2B3QVTmG1FEJJTMIN0
 A0PA==
X-Gm-Message-State: AOAM532YZu1CmV3YCEPilBaDnbIFmFEtarwkuuz1utX17vw67q9s0uUP
 hMNoKLbaRpP2vbYgjiSuUZU=
X-Google-Smtp-Source: ABdhPJy4oZyw+Iqs48eqbo5eFIdY/7MiZNBgQh9eiHfF8zv+iU0lN7xZWlSbJDVKokgUuEIFLY7dmQ==
X-Received: by 2002:adf:ea90:: with SMTP id s16mr24877872wrm.288.1635675053032; 
 Sun, 31 Oct 2021 03:10:53 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id g3sm13062455wri.45.2021.10.31.03.10.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Oct 2021 03:10:52 -0700 (PDT)
Message-ID: <a5d4eb0b-9afc-d6ad-36d8-e7b3a19deb1c@amsat.org>
Date: Sun, 31 Oct 2021 11:10:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 46/66] linux-user/hppa: Remove EXCP_UNALIGN handling
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
 <20211030171635.1689530-47-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211030171635.1689530-47-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.426,
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/30/21 19:16, Richard Henderson wrote:
> We will raise SIGBUS directly from cpu_loop_exit_sigbus.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/hppa/cpu_loop.c | 7 -------
>  1 file changed, 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

