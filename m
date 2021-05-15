Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C10C838171E
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 11:16:53 +0200 (CEST)
Received: from localhost ([::1]:44686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhqPk-0007rl-Kc
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 05:16:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhqNM-0006RF-2h
 for qemu-devel@nongnu.org; Sat, 15 May 2021 05:14:24 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:36830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhqNK-0000a8-Iv
 for qemu-devel@nongnu.org; Sat, 15 May 2021 05:14:23 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 n17-20020a7bc5d10000b0290169edfadac9so2502144wmk.1
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 02:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kgW4N8hPsNbNA8O3nUoqkMmzxQV+ksd57X1LpRSVFDM=;
 b=Elr/xuR1LusvScdxTVox+wK/9Y9YRNOURx+anyziym3cyyI9A/a+afJNMvIy6t3xi+
 2ZBRna9hLgndPBvQ1nylXqXu3+FiAzxhbVoQxSIrwiKqtSjw2ukqrUaPksS+JKEGmAmF
 ALElfJMMq2l3v3AkoxS0qFPMgRYgIBg8TwBn6O2Iz8pN1DfZHi9HFPDB1AQHH3IFKC3i
 SvzGIaSiTBsb+UzLSUJK4nTiWQBVT1/lBASOkawDqeYm5J9VHI8/GED/0x9N440jOLui
 zKM07C8pQtx04ItfVKQrhrv6lI6/YsRggspU/IFDQIt8FtHf0M2fXUnHP8XBUEi+GTk8
 r29Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kgW4N8hPsNbNA8O3nUoqkMmzxQV+ksd57X1LpRSVFDM=;
 b=WhzE8FJbHShL3dusbSMT44rq2Ebs0yZ7aMXacVEDtlupxDmVd7JwxNtazCRLQc9UEf
 0QZ+YVG0xXHD9O1EMzMKhLrlQLEAmKTXypbTOGcb6WwQa+gtCoYEJKoa0K38lFfPv/Gp
 QH6TfJxfbsqz6kI/XTxaVfvgMDop45FvU4drt+wFPxN0qso5mEluLVWHPoWQtNPCOa3c
 Hsp0E6i9wvMm5yLCEJgMAZNj9EGPWGOs9UanAAqwJJ7Yng7SPYHnysDvPGn0tJP2OeW9
 MzTRhCtQAHjQ0oTtSG8dGQAcGDZEs0xx1R/gQuvFoh2y8I3UW2eIVtdX93q5Xb8uG9Dt
 EAQQ==
X-Gm-Message-State: AOAM532Jqd6o4kCz9Jb+5sJIM0XyKSEY8GQ20/5s7vq9zlwjatqVOTHT
 vjnFFlnx+/LJ1qV3BdtcDN0=
X-Google-Smtp-Source: ABdhPJx4ss+krDJLPYsjuxNEASy4CM180aOIDSDBQ35auVCHegXMH1NBqBsQS5/L5hP1DQDuBbIwRw==
X-Received: by 2002:a05:600c:4f90:: with SMTP id
 n16mr13795146wmq.98.1621070061152; 
 Sat, 15 May 2021 02:14:21 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id x8sm8664043wrs.25.2021.05.15.02.14.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 May 2021 02:14:20 -0700 (PDT)
Subject: Re: [PATCH v6 24/26] tests/tcg: Increase timeout for TCI
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
 <20210502235727.1979457-25-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f59c9ad6-df92-4111-27f2-2fa99eefc67a@amsat.org>
Date: Sat, 15 May 2021 11:14:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210502235727.1979457-25-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/21 1:57 AM, Richard Henderson wrote:
> The longest test at the moment seems to be a (slower)
> aarch64 host, for which test-mmap takes 64 seconds.
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  configure                 | 3 +++
>  tests/tcg/Makefile.target | 6 ++++--
>  2 files changed, 7 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

