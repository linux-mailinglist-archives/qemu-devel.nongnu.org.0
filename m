Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6837147C8E9
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 22:56:25 +0100 (CET)
Received: from localhost ([::1]:38802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzn7Q-00061r-1M
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 16:56:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzn5k-0003z8-C4
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 16:54:41 -0500
Received: from [2607:f8b0:4864:20::536] (port=46722
 helo=mail-pg1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzn5h-0003zi-HM
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 16:54:39 -0500
Received: by mail-pg1-x536.google.com with SMTP id r138so204218pgr.13
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 13:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=fcJvvphaSsaHFRU3hKx1ke/Yj86D9O4yKIZcyCZENaU=;
 b=E5Gty2mLrPFXkFUpUcQKJoQka4w03K9CSS4keWmBOfJk8cFHKftEnrDocV4jxANv4c
 bfv0+WA3Fp9ShOjkOMQubulj2wafYUQPxgixfs55ZYyS49cQ2q/MjHY/DHhtT91GsU+Z
 SAQ9fvl0l3u74TnGHtAh/MJiajoDgqdJaF9LsmbCGErMS0yDAiL/EgISeTgnVWMVBZt2
 4OBgEr2cmpXpytZQ/yY32jqaZB26558dEA6YWxKQWILjkQgh8uaH8IvfMMQwCbgwp/WG
 pDjGqCHMkmOS7ipa5I19YOn1R5rzBErySwUWdl5APS41b5wrSrwHiavwutxMIiTW2mDd
 BhAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fcJvvphaSsaHFRU3hKx1ke/Yj86D9O4yKIZcyCZENaU=;
 b=UaYzGhG/zGxob79oOJ6xVUDEt2gN35geHnvPTMgCMDrOwsiT2l6i0Ch6oBNic/W5Zw
 gtMFxPaSbd9XerSiON55BztnYVejCAJu0KzDirWn0VhWN2sKOIZ9E5bug+DV4tjl7+DB
 iqtfftIfkgV0sw+lJmV2q/KHJSUEFIOTW8ULg3czhrv0JJnnonOGdBBmNATrcBTos4si
 tc409kgxb1NfIMTdz7GKHDblPlxo7022B9aoy8daG3rLDzyTbKDjO2YIiwz2vmYQKxuG
 0syU8AffYZIUumBsJWhrqMEz76rO5B/YR+WWOBG75YxuOV3ofHTVugZ4AWZhMKdiUKdh
 RnqA==
X-Gm-Message-State: AOAM533ckQdfsO8bkv/AVMVvikcTLpS3eyko5hbRfeCubDLPId6re7t7
 XaWJztaJYTwrk0WoIwekZreiCeni0aa4vg==
X-Google-Smtp-Source: ABdhPJzQdtGjO8hg5MqNkyHB2//3eDJjPtFbF12eYU07l+Pn6T2gUAJLJa3P7VtxisHztOjrAN0NBw==
X-Received: by 2002:aa7:8895:0:b0:4ba:2382:515 with SMTP id
 z21-20020aa78895000000b004ba23820515mr21500pfe.3.1640123674871; 
 Tue, 21 Dec 2021 13:54:34 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id pc7sm33792pjb.49.2021.12.21.13.54.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 13:54:34 -0800 (PST)
Subject: Re: [PATCH 7/8] configure, meson: move config-poison.h to meson
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211221110526.351709-1-pbonzini@redhat.com>
 <20211221110526.351709-8-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2fcd10a3-19d0-5aad-b3c0-9ba5947b4442@linaro.org>
Date: Tue, 21 Dec 2021 13:54:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211221110526.351709-8-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::536
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.012,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/21/21 3:05 AM, Paolo Bonzini wrote:
> +genh += custom_target('config-poison.h',
> +                      input: [target_configs_h],
> +                      output: 'config-poison.h',
> +                      capture: true,
> +                      command: [find_program('scripts/make-config-poison.sh')] +
> +                               (target_configs_h.length() > 0 ? ['@INPUT@'] : []))

Using length + @INPUT@ seems needlessly around the bush.
Perhaps better as

   [find_program...] + target_configs_h

Otherwise it looks ok.


r~

