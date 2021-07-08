Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E2E3C1ACA
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 23:01:45 +0200 (CEST)
Received: from localhost ([::1]:45236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1b9U-0000qS-Ci
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 17:01:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1aho-0002Ay-VO
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 16:33:08 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:44863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1ahm-00057F-Lx
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 16:33:08 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 p4-20020a17090a9304b029016f3020d867so4719786pjo.3
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 13:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=C6HCcAFQK+2HR8N4UmDneL+3HFsdgxyJ+KadxG5Sd1A=;
 b=TECnbS9XkP4bqbw4RUpfFlb3LwoUki+YAKDj7J2evZNtLssvEE2xBAd1McFo02e7f2
 RZnvkj+orZig4+SFolZZInJJCzR0f4ypm9oi+KlaZ2WMxKYJ33e/oJBl/dB75oZSyOSX
 zJo+y20r6IFFQ+/kJAUeZjDLhqdA2saza/UYjJjxmS1NBqrSVXLfsvAIrAxD1Hwet0vd
 x3hhcKqXYsJNxhxNOVUix745k+dNVXWwoX2KOnx2ulgOJVXwvV9eRvPDoQTZBbxUChls
 wTd1QcCNWUfDfdD6Sggi3Ec9l68w/WL4Cad4K+GSTH4Z4zCLSSFQXwAjMK2ZHpENZSOs
 LgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C6HCcAFQK+2HR8N4UmDneL+3HFsdgxyJ+KadxG5Sd1A=;
 b=C9FSbOZkfOGHfMGTX26Xe5RY7qhFTOmNRQs66jlQQ2MY0wHfMYP50pNHPbleSOHz7H
 K0AamH6S2fPAfexwhNYzKUzZJH2mwbtp3EngqHQ0YmA5LF6BmT6kjAd9jJ+ZOl5KO0K/
 5hHFkdLVfAMBlVBlb8emy084DvKzJUofytHbSZXIUtPX0z/wYBeY1WR+ojFV9fESh7m7
 tT/Lwbf3AhyEEO4goLMqWLYVrjXHVZ7WrAVTLOSO5lMuoTb71Kq7dwjvwdgKJ+lfeiJk
 mhG5R7QBX7hss00GKLi+W2mKdMaTOU2VzH8No4ffksGuWwKlOvZI3Fndu0S6l7txtbpD
 +rNw==
X-Gm-Message-State: AOAM531ing3DOTM1l5r7AdGhxnrZnDeQKvfHGRuKXTuYpw2C4/2Xt/ml
 KCqq4Pnd6BUFw261yUaGhxI9Ww==
X-Google-Smtp-Source: ABdhPJxk8UGhR2q8NEzDlOiE0B5AJh/gvJ8xTXdrIpxZ7yWLtikY+INixhTR7PL7pxbuMGXQ8V0yUw==
X-Received: by 2002:a17:902:6bc6:b029:122:68ea:32f3 with SMTP id
 m6-20020a1709026bc6b029012268ea32f3mr27799837plt.43.1625776385362; 
 Thu, 08 Jul 2021 13:33:05 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id h9sm4433801pgi.43.2021.07.08.13.33.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 13:33:05 -0700 (PDT)
Subject: Re: [PATCH v2 30/39] configure: stop user enabling plugins on Windows
 for now
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210708190941.16980-1-alex.bennee@linaro.org>
 <20210708190941.16980-31-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <45d1469d-e148-fb81-2706-98f5b7515bf4@linaro.org>
Date: Thu, 8 Jul 2021 13:33:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708190941.16980-31-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, pbonzini@redhat.com, f4bug@amsat.org,
 robhenry@microsoft.com, aaron@os.amperecomputing.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, aurelien@aurel32.net,
 Yonggang Luo <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 12:09 PM, Alex Bennée wrote:
> There are some patches on the list that enable plugins on Windows but
> they still need some changes to be ready:
> 
>    https://patchew.org/QEMU/20201013002806.1447-1-luoyonggang@gmail.com/
> 
> In the meantime lets stop the user from being able to configure the
> support so they don't get confused by the weird linker error messages
> later.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Cc: Yonggang Luo<luoyonggang@gmail.com>
> 
> ---
> v2
>    - move targetos check to if we try to --enable-plugins, default no otherwise
> ---
>   configure | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

