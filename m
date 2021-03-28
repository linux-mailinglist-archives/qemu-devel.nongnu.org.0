Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 191D634BD3A
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 18:21:51 +0200 (CEST)
Received: from localhost ([::1]:52034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQYAg-0005Gx-5S
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 12:21:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQY8X-0004Jh-Ol
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 12:19:37 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:38615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQY8W-0004I9-AA
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 12:19:37 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 w21-20020a9d63950000b02901ce7b8c45b4so9992738otk.5
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 09:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eW7aGdy5LgH1Yi9tzTe3IqQ9dDnHHkTEh2w2NWhjQY0=;
 b=B337fgW779J6pElv1hkH9eBsGldq8b4U7HanbRU+7FYuce1fBCjY7xD/n4a+MZYh9w
 5W2+agDZzedOjC61oIdhV9aw3T+gzUFBHjWuDNnieUAbu/yyjYcegpCATdVVGD0lQUUs
 YyV1MkBlNfRXaxEm+lgreTvy2+nEdMYffSpX5TZy231Ydbds8/FUEPDlkWWfp/jX8BSa
 ZC8fbtwoObGqfBs5kI6J89pUlqghIx7y9r6CbrwiAnJfyP9raGfSUshfcvD3uDic5b97
 yvHSnSgit/Jl+1ZVt8J9XoW752xsrGjmwDWVfuJkWngGWTc2b1NazrPS1LkJf09UU9JF
 NXUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eW7aGdy5LgH1Yi9tzTe3IqQ9dDnHHkTEh2w2NWhjQY0=;
 b=dGZ0WHRk9EqibrFOYGyVXIJrIrEOGQDP1kHZBSRHEKGupTXkgc71x8aTWFTTyxUviO
 vMnhguU3oMjPyG20/Iax1ZbxGfYVoNTL1rBTg4gANuPIp2A/SSEh4ImH79Gd8MJYGyq4
 fduf/nIqs7fdWhS5sGjh6CHaQqN1GHyfrjFV8pkH+WqtnQUszz3yc4vJsqkJHKJ2YLbE
 I+ZNV7Cc6sRRKk/q+nEMItgvi0bJeKO3K04gHSw7D/3ewiOo7i8saH5f0+ML/7HiCjMu
 TOhFv0NdlcC4EiQ2eoXjMDdRoQX+TJm5KRsgXV5d7Zxledgy2HHWNHlV/fsqGdbJ8BYQ
 ksRw==
X-Gm-Message-State: AOAM533Y4YZo4+0zhm4fD8fWJn4IKRRF2KXoFuHjQBGBD/UmTy7C9BRu
 zx4DWCAndeFnEE7O2GeHmUigLg==
X-Google-Smtp-Source: ABdhPJzsgWs75nxn3NFbgIjye1zj/lxCWuwfhNe8SmL9GLrQdlc+48ZZ/c+T/bsHiCLarQtDp84iYg==
X-Received: by 2002:a05:6830:140f:: with SMTP id
 v15mr19044313otp.36.1616948374833; 
 Sun, 28 Mar 2021 09:19:34 -0700 (PDT)
Received: from [192.168.211.34] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id k8sm3022771oig.6.2021.03.28.09.19.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 09:19:34 -0700 (PDT)
Subject: Re: [RFC v12 28/65] target/arm: fixup sve_exception_el code style
 before move
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-29-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6127864e-f269-e55d-fbcc-8041cdddf33a@linaro.org>
Date: Sun, 28 Mar 2021 10:19:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-29-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:36 PM, Claudio Fontana wrote:
> before moving over sve_exception_el from the helper code,
> cleanup the style.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/tcg/helper.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

