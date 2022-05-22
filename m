Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A537A530657
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 23:49:33 +0200 (CEST)
Received: from localhost ([::1]:58712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nstS8-0004P4-Ni
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 17:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nstRI-0003db-4Z
 for qemu-devel@nongnu.org; Sun, 22 May 2022 17:48:40 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:36697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nstRG-0000QL-MN
 for qemu-devel@nongnu.org; Sun, 22 May 2022 17:48:39 -0400
Received: by mail-pf1-x429.google.com with SMTP id u15so12052177pfi.3
 for <qemu-devel@nongnu.org>; Sun, 22 May 2022 14:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oeu3aVxYQRTKtBxVdCmgWXsOXQs0aaSVb5H3s4KYL/0=;
 b=N9eIzTisXjtqM3kAVMI+86lt82lqMVm+4bC26KBTxeTssm09Q/pP7+MBbfzzFocJFj
 HtjBY0PCMJTuO5kTJVJsRBr1FmK2YnIyGtHfVBNqCuPld9jeBzk4oxIDTxllDpy/CwVF
 kf7TXidQdHKlG2ujx/cZ6qSQTP4IOk+/xNMzjACEkM0ON0JcbFpoU8k7IogEqtRaoSh1
 XGpvONdDf2V36sLbjTWHuCaEG9TZ/+doBO/W5i2ZPVXJ6N6jXfgkUXI56wgIFA47RPIR
 Sev3l+IBEBmr7psaN9ZLY2BjdZHTLTbfGcJD+CLkXoIYjdl2YCKXBU0aivA/65wPLUHe
 B43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oeu3aVxYQRTKtBxVdCmgWXsOXQs0aaSVb5H3s4KYL/0=;
 b=llzY0EFkI8SuMxU1/Z9nsRBwI8PPEY8QN7GgeEMYw8HQEMxIKee9wr/xbwHqh9bPs6
 PKTAHQxax9WuihN9Sy5sYW2SOi+rJT9EEQgYB+nOtzIt4p6KTu+NospeLZTktOeQKay2
 ioEWHWoAJMhKnC5StYtoSnzgEbGUL1mia2/MiqdsRgy9MDXFmqVDFVYDJxWW7jTuHCQa
 5/kgI6WaeS/BRMlYrrrAsuy8eU3Ub81pJa9ckGHBkL4+wJ1iP7htu51+0/Eu5inVMG/A
 t5WLtzs2n2MelB75fAh88KcPbgph7FAZUzmc/sgefBoQDMDiEPRXUSK478dYWlDQHRRo
 hgRg==
X-Gm-Message-State: AOAM5311UdaCc2sQptplPNe9Lt7Xf+I00gaJmogJ7QQ582eJ/eDtLaf7
 4wtvKKwTDNYPuNhLmAxxHKlMOw8l7Vw=
X-Google-Smtp-Source: ABdhPJx01WY80+KRi4enE7KVTqpz+0IJuWNUVRWU15XhBqRVIaoeqiA32WQtk/rP3rf8+tyYfCb3cg==
X-Received: by 2002:a63:6886:0:b0:3c5:11f4:f055 with SMTP id
 d128-20020a636886000000b003c511f4f055mr18087453pgc.44.1653256117548; 
 Sun, 22 May 2022 14:48:37 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h188-20020a6283c5000000b005183fc7c6dasm5607247pfe.5.2022.05.22.14.48.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 May 2022 14:48:37 -0700 (PDT)
Message-ID: <df1df490-1946-16b4-4431-ca4c458d14e4@amsat.org>
Date: Sun, 22 May 2022 23:48:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v4 17/17] target/m68k: Mark helper_raise_exception as
 noreturn
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu
References: <20220430175342.370628-1-richard.henderson@linaro.org>
 <20220430175342.370628-18-richard.henderson@linaro.org>
In-Reply-To: <20220430175342.370628-18-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 30/4/22 19:53, Richard Henderson wrote:
> Also mark raise_exception_ra and raise_exception, lest we
> generate a warning about helper_raise_exception returning.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/helper.h    | 2 +-
>   target/m68k/op_helper.c | 5 +++--
>   2 files changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

