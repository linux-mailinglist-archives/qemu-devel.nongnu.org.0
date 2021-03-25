Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3E334997B
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 19:26:45 +0100 (CET)
Received: from localhost ([::1]:54146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPUgu-0000Hw-Lp
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 14:26:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPUXp-0002E5-Iz
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 14:17:21 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPUXo-0001L6-7E
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 14:17:21 -0400
Received: by mail-wr1-x42b.google.com with SMTP id o16so3305590wrn.0
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 11:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jt/qDvi/iC72F8oKQWRMycojCTgLYw7B6eQtuyjyPS8=;
 b=Gggkrc1SSN91DGGx3tOoAjAhyz07np0eL3MAXglzH15wUKxz+9rwHyQsone/ynTRHo
 xhrNBt9SDxOOHhy+jSHtm1yEBSul1Kuwq6Tkzo6B6k8ziDnAYorEE+dN31X/eRI4vZrk
 zQLigoY9bNokYY5bPq2k6wA5+1zcPiMIKuulU0zdXjDN9oIaiOAm844Uy778+29ld47K
 wC3RNlswAZAjQyb1iyLITCsm/B1HvKi2tURHxJ7ibl9dtvDLtH+/6B/zcURyx16LIsk3
 Cqy6GP9apl7fHcJNSa4IN63jtIrR/T35wDwhidwdzFXJKmtZ9NU+qMBIv2/Qty0Qsz6+
 3nJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jt/qDvi/iC72F8oKQWRMycojCTgLYw7B6eQtuyjyPS8=;
 b=VopN7DN8wAgu4AN6KPXj1vnxLR6Mi63fNzerFd7xF72OqrhQGQ04Ik/Of6NFHCVv1a
 VfyDmBb3+NAYVzYyl/kIsEsuTEQUpohp+is905MdKcpmwa4oQcI/DQ1iO1jF8hS+6Q7/
 8MHU96GCOA6nWIhAqjAZxMNDKij8oOAgAHRKILmVcLZotz4n63Jao3Xsu7hjjI+8gS9O
 qld2D7ST9zW+tE+ZQlF0UlUqwkIexNp4RMvH3BMO01w8SW+ffi91BgdYCMBow92kgcBe
 bya926K6WJgBkWwSUmFiDeS6O6Lg7KbYYhpkqASYhS/43qubSZzbRYIUmSDmghg1epTh
 UTDA==
X-Gm-Message-State: AOAM5316dJGOQAElpHWbuvnBY6q3OvC5z+Ux1aLX5emv3LKGuse2T/Yt
 cl2JiX/I4JX32vqwX0uMVlc=
X-Google-Smtp-Source: ABdhPJxR6bWgVOCCjrYaPRv595J/LWLxM7twlvnJRaND5RquIPy5j0hMPCAcNClNEfYYl8V5EE20Iw==
X-Received: by 2002:adf:d1e3:: with SMTP id g3mr10454061wrd.195.1616696238710; 
 Thu, 25 Mar 2021 11:17:18 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id 21sm7503286wme.6.2021.03.25.11.17.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 11:17:18 -0700 (PDT)
Subject: Re: [PATCH for-6.0 0/2] document gdbstub debugging of multicore
 machines
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210325175023.13838-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1114634f-949c-2c07-aaf4-3e49e2d3895e@amsat.org>
Date: Thu, 25 Mar 2021 19:17:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210325175023.13838-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/25/21 6:50 PM, Peter Maydell wrote:

> Peter Maydell (2):
>   docs/system/gdb.rst: Add some more heading structure
>   docs/system/gdb.rst: Document how to debug multicore machines
> 
>  docs/system/gdb.rst | 63 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 62 insertions(+), 1 deletion(-)
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

