Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA6B343E23
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 11:40:52 +0100 (CET)
Received: from localhost ([::1]:35128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOHzP-0003UT-BD
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 06:40:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOHiW-0005aY-Fc
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:23:28 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:44977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOHiU-0002Xj-Ok
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:23:24 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 j4-20020a05600c4104b029010c62bc1e20so8916999wmi.3
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 03:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2tdX6XHVohIBHfrF1AndjZLghv7AqtDeIRO8bj9Yj98=;
 b=mxbzL/VcGDq347a1x3nAuXdWW5QL/iDJmb5zAeD+MXlvQNU/7rZrGqsoCkUADD44F9
 jEhNTzEnm7jJMEsG+oPfc+a//TK/Ee2dK3IWXJ+945/3uZ394mcRZdkYN36stHBpa7LD
 iOCMh+2Z2g4wcB0vcL9Nb8SEgJIAd+tfg8hTe5213ha2ovfF1cCoT0BSwa1JR82vTUDr
 viEHMStgQTOAO1XJnS4y4OlygYo5wdtc47TLJbgSbrl6vuEvxDcOt7kXEhPC6a5MQrGT
 c90l7tWxKWffuSAJ6G8oW0rKISS8D36MT+owgm9czixRgIDwJjZXIEslZU25cRSCODeY
 oKIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2tdX6XHVohIBHfrF1AndjZLghv7AqtDeIRO8bj9Yj98=;
 b=AQEPmZwc4SJeg0qTDwprslXs9iNpfeOVpoIet6pkFqdUx4IqJmhsSiG95fflvRN0Bu
 tPMZaoEXEOHz2Rb8GC6TtGATZjjtnq5+W/tMFaQRLLiF4814hELW7AE16tsgspaVZ/Sv
 tnMIYHTlu+DgfE5IlawApIuzUuppN3w7jNBmgJ7F3ge0irZ1YYYr9+snUp7srImNJxjJ
 WCzgdfid/BZCbhopDM3dju5BqZQYBWr9QXGItrtBd0Q0ZftP9cqcHiSqTsJ6YuCsJ+YP
 MFgfcC4lDRlRrPY0/1iKlExbO0W1V07FXc38EaIHnjq0sLKya1SM0t+b2S+9yPhNtENA
 idDw==
X-Gm-Message-State: AOAM5338Tt7bUiALUuU7Y2jRBCb4bWXPxDKzTLH0gdGDtb36SabR8fxy
 VZxlvJjgdDUXOamyISFngOg=
X-Google-Smtp-Source: ABdhPJxJP5kzOwc4izrbr5qondwwqOPpqHtCZnrJrGvN1anz5sWPqG72fqUBuOO4rN6NNjg3fyN4Ag==
X-Received: by 2002:a1c:498b:: with SMTP id
 w133mr15737388wma.134.1616408601313; 
 Mon, 22 Mar 2021 03:23:21 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id b15sm18456127wmd.41.2021.03.22.03.23.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 03:23:20 -0700 (PDT)
Subject: Re: [PATCH v2] target/mips: Deprecate Trap-and-Emul KVM support
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20210317011235.7425-1-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0f739f30-01d2-74c1-3df8-c47c90f3a0e3@amsat.org>
Date: Mon, 22 Mar 2021 11:23:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210317011235.7425-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/21 2:12 AM, Jiaxun Yang wrote:
> Upstream kernel had removed both host[1] and guest[2] support.
> 
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=45c7e8af4a5e3f0bea4ac209eea34118dd57ac64
> [2]: https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=a1515ec7204edca770c07929df8538fcdb03ad46
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> v2: Fix up tittle and sphinx format (f4bug)
> Lost in the sea of emails :-)
> ---
>  docs/system/deprecated.rst | 9 +++++++++
>  1 file changed, 9 insertions(+)

Thanks, applied to mips-fixes.

