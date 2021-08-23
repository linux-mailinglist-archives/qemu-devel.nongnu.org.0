Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B0A3F4F79
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 19:26:23 +0200 (CEST)
Received: from localhost ([::1]:48160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIDiD-0003yx-1Z
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 13:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIDgv-0003CK-5i
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 13:24:57 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:53215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIDgt-0001Ac-NX
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 13:24:56 -0400
Received: by mail-pj1-x102b.google.com with SMTP id h1so6572429pjs.2
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 10:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HunMQAUWllsCCiH5r4N4fV/NOFQXblysBbApOn586s0=;
 b=M1N04jpqA+D68aE6auMIl81C1HwlBTudaWHvCy+pQH9VX0/cwyh9cwufZiJ45B3l2M
 eH5MaX8pswj3aEASy0j+foUxp84j6wjdFr5e3v2pbsh/Actn6tgExTTY1d4EQB2yIOG0
 dFlYHG7dCh267VtvAsg+rIjmS2thQRtPnQ8iwKDSTnfufrOUSJ1KMkJlxGIlFIo6Yjwm
 b3RJa4OHnw3GIMLfJn4DTcWGF08Pyu33uLlXizXo/werw3IHeyi8xibdcs307sHsosA/
 I3Atd61W6TCkI4C19cxXI1rr8pu+WUMQ7SE8iRYBiswMCnBOtlTN5wsXHdvRIYse84nj
 A0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HunMQAUWllsCCiH5r4N4fV/NOFQXblysBbApOn586s0=;
 b=kP6euhQQCPgg4/e7kBvxPwB3MwBwiJhBctJHyC6tQOJz9/dSj4wDlIYXXQN+E4iPWU
 vkLXu+zPoPHh4HXe9V/MZk8DgLHdZ/KFfOv91hLwlXeMDV04qwkFuJsv5ZAw8xnfklgW
 dPvBI/fy62kJZOLdrt+CS4SP3YXdmCXUFLmXEV0+lFNc9F0dxOgCwbg+IU6zjfmoqH76
 xFLgKPGbW5BnmnePrW4sqk3f6VguvR/HYvrJqhWzMNgPU7RclUM3thV92xPoVLIB2Wt7
 oVocsg+nhrxTJq3IgcoKQm0wohYDrmzcu8MHEvfvNa0VMG4sAfKVzh/U1nCFjHynk6AI
 rpXw==
X-Gm-Message-State: AOAM530pfC6Cmit3m8/TmpkdUkjB9uIxmsp/ar+ZUjaU+6sWRE5EKNMI
 I/4jTf3dq3H2T3imL+JdL6GgfQ==
X-Google-Smtp-Source: ABdhPJydqap1BZux8u6zb+PY/DiMI4oLOrbff2cLOt5W1J65OY5pZljvjA1KnDxXB6LdD5iqx6T6Yw==
X-Received: by 2002:a17:90b:4d8d:: with SMTP id
 oj13mr21148644pjb.74.1629739493861; 
 Mon, 23 Aug 2021 10:24:53 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y62sm16437667pfg.88.2021.08.23.10.24.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 10:24:53 -0700 (PDT)
Subject: Re: [PATCH v3 09/15] target/riscv: Add orc.b instruction for Zbb,
 removing gorc/gorci
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20210823164038.2195113-1-philipp.tomsich@vrull.eu>
 <20210823164038.2195113-10-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <afc2a061-8667-6240-df60-6be5f6078313@linaro.org>
Date: Mon, 23 Aug 2021 10:24:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823164038.2195113-10-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.023,
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
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/21 9:40 AM, Philipp Tomsich wrote:
> The 1.0.0 version of Zbb does not contain gorc/gorci.  Instead, a
> orc.b instruction (equivalent to the orc.b pseudo-instruction built on
> gorci from pre-0.93 draft-B) is available, mainly targeting
> string-processing workloads.
> 
> This commit adds the new orc.b instruction and removed gorc/gorci.
> 
> Signed-off-by: Philipp Tomsich<philipp.tomsich@vrull.eu>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

