Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F236133E15C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 23:26:16 +0100 (CET)
Received: from localhost ([::1]:33518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMI8l-0001ZX-Vy
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 18:26:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMI70-00006r-I6
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 18:24:26 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:37498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMI6x-00026d-Qw
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 18:24:25 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 f22-20020a7bc8d60000b029010c024a1407so2328541wml.2
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 15:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SU8IE3JpXBMJzyMwxxmsKXjO4iCc2ZMhpjF8kaSyxns=;
 b=kQL3UD45bhSKt9Aj1psRD5NWjx/5WRDLuizHpAyBuRj7m7Q/XUdSWkoGupA1bWMH6m
 y8hfPC+H6dGSBO+9AEdDFMZYmQaAqDNqir/hTJ7IJHNsJcq+U/BlUsbgMy/91+nhkOuf
 dcesjYrndt6fbcrD97mq5lJCbc5JgUZ3lcWKf0HEIg08hdqGpk5UYwP2dSeeXkmdAwji
 OuwOW4uIZcIuYKJGpfwmYIppcBoaGLSvyIJWeol7Cl5SWPqmFV5zqKYB+t18/IJUg711
 MsREpmPGcUEVB1tTwt5I4tLPgFMuLEeVhzMpQblygjpxfBYJCrPsYz9S/l8ofya6LqGi
 /eAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SU8IE3JpXBMJzyMwxxmsKXjO4iCc2ZMhpjF8kaSyxns=;
 b=n3HWHoyssNDdfAMgo5JZ42Ox5X0c5zXXzUE7elAjo8lxls/5ur+IO8Q7vB8fYglThx
 tSOb3hxUxz1zNk0XxtIilkt2Iptt61u2GVuOFDgw+MhUdSftXazTCxNie51yYQI+molS
 LnhrE9xDHLu/to0TTRPC7BfI8+rWGR5JJYgP91q6u4B57rID79lxes2YidWzQKXW07Tp
 6Smhj2xbe7wGsGR8dofYfceoGjCyyPjGfa1kBsQJbxib8SjWUBRNWwEdWuUgpwW8sHH6
 YSd8j2JDbn70faM0BUROXExi6zyl4+GbJKQlMNQcngoDyGbjafkTPsQ6xDc+LAfc1you
 h8gA==
X-Gm-Message-State: AOAM53343ky/no4P48W0YRVrhXtdIRLN6Bfn91qE4Shrv8XZ3UiKbFA1
 EVvGQXLOot8Vil6QyCvpWwc=
X-Google-Smtp-Source: ABdhPJzrEGeY7i1HVSetPQR+GoW9m1FD9W4QWq6DaPBVBXo53G4lcPVCuhjvzPpZY4gdcwF9t2LLgw==
X-Received: by 2002:a1c:bc82:: with SMTP id m124mr849597wmf.118.1615933461298; 
 Tue, 16 Mar 2021 15:24:21 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id z2sm23204843wrv.47.2021.03.16.15.24.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 15:24:20 -0700 (PDT)
Subject: Re: [PATCH v5 20/57] tcg/tci: Remove tci_disas
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-21-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <11c52ca9-5088-17e8-9db3-188204705032@amsat.org>
Date: Tue, 16 Mar 2021 23:24:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-21-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 3:39 PM, Richard Henderson wrote:
> This function is unused.  It's not even the disassembler,
> which is print_insn_tci, located in disas/tci.c.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci/tcg-target.h     |  2 --
>  tcg/tci/tcg-target.c.inc | 10 ----------
>  2 files changed, 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

