Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51705523FCA
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 23:57:52 +0200 (CEST)
Received: from localhost ([::1]:40146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nouL8-0000CN-V4
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 17:57:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nouK4-0007jj-UC
 for qemu-devel@nongnu.org; Wed, 11 May 2022 17:56:44 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:43679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nouK2-00060V-7m
 for qemu-devel@nongnu.org; Wed, 11 May 2022 17:56:44 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 l7-20020a17090aaa8700b001dd1a5b9965so3222337pjq.2
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 14:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sMfpp6xTmFuWJuAVUaprNmlqUAxFozrJBPRIK2UDVAc=;
 b=JY03ubpi6nPmNB8/mDUQPldUXkFOtbF9QeaUFaXyt3h1WeLfEv+GxSI4EYW/GzlRPA
 09vXkFl2AS6NJgdes6jBVAwdXlYfaxuz4QE5mFTmTFm8tVMyn5Jwa1+6YIIkRJMdz77N
 7sWSGqe1z/UEvWG7HLyliInNwfa2ipPobjUOdWAo+NkHdJxZkg1gJkcTmHZ8qNqltqWH
 yFLyw81wZ3wxtQE+ecip4C9JG0f8OnA/oxpkaxIwqld+ahLXKyBdwTzxO8mVk08Gygmf
 9baP3wnMilQFDu8RmDxnwHT9sv0eiJSUxeGhtpV93VSTWf8eCkeye25ZTO3eqI9w3B/Q
 Wtnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sMfpp6xTmFuWJuAVUaprNmlqUAxFozrJBPRIK2UDVAc=;
 b=5GCWqQ9Rs43hslKynARUCY/t9F1stDamx5JHFJtDKaSeIP3j/T+Yaov4gGcnaleA/H
 vzpw5CLUJNMvFjP+KqpnZOaqfrO2YiwOZ9SeFgMvViK/f+YIZA34MEGo81dXT2ZfBuA1
 PCgYyvUJa9xW6/ipZJRtrtnmtzLKTAyVuXsalxNl1tdKtwtG4pXPbKazl4D1VsKgOvMw
 l5PkMr6hhx1lVZ6kf6cJrUJHDRIpVUc4hdcCSX+BObmrS+aTw8QhPo0XMurgv64gnsB1
 DhWcAtoud2rS7hHpOyrQP3mM2JGtM0y4Mk89CPDfFt9sBRKb8ipanae5Huwg0eWKEH2z
 ktzw==
X-Gm-Message-State: AOAM531/dd5hzPhXs5oaqe+F+XcO4BP9Qj1HBOC4fKLsQRuxYaMM0Cbv
 skYwgyOxIC8Q6ymm97bJqVoryA==
X-Google-Smtp-Source: ABdhPJwGti0Bo4xujUqh0478axlQsJ+phTvT5rqirlCJrWm+HK69VsLz85iVu/1oDn957Y4OPFvt7Q==
X-Received: by 2002:a17:90b:3ec7:b0:1dc:b008:3cd3 with SMTP id
 rm7-20020a17090b3ec700b001dcb0083cd3mr7511189pjb.226.1652306200566; 
 Wed, 11 May 2022 14:56:40 -0700 (PDT)
Received: from [192.168.86.227] (50-78-183-178-static.hfc.comcastbusiness.net.
 [50.78.183.178]) by smtp.gmail.com with ESMTPSA id
 b3-20020a170902bd4300b0015ebbaccc46sm2370460plx.159.2022.05.11.14.56.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 14:56:39 -0700 (PDT)
Message-ID: <9c8c68d0-cb7c-4ec5-eac4-fd915934db5e@linaro.org>
Date: Wed, 11 May 2022 14:56:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] target/openrisc: Do not reset delay slot flag on early tb
 exit
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>
Cc: QEMU Development <qemu-devel@nongnu.org>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>
References: <20220511120541.2242797-1-shorne@gmail.com>
 <cf7c27e9-3bc9-888e-dbba-25c0bb583e09@linaro.org> <YnwuFZsNjQLxOfp0@antec>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <YnwuFZsNjQLxOfp0@antec>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/11/22 14:43, Stafford Horne wrote:
> At this point how would tb->flags have the right value?  Would it always be set
> correctly by `cpu_get_tb_cpu_state` in the `lookup_tb_ptr`call?

Well, it would be set by cpu_get_tb_cpu_state in cpu_exec, which is then passed to 
tb_gen_code.  If we go around a loop and look it up a second time, we'll find a tb with a 
matching set of flags.


r~

