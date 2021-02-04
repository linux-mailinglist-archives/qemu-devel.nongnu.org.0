Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB8430FD25
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 20:44:57 +0100 (CET)
Received: from localhost ([::1]:35998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7kYi-0007ru-N3
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 14:44:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7k8J-0002U9-UM
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 14:17:40 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:38478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7k8I-0005NS-8A
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 14:17:39 -0500
Received: by mail-pf1-x42c.google.com with SMTP id d26so1484196pfn.5
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 11:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Rwr8+w+8QLQa4NLGa76sskWeG9fQ1kfdnCR+lBjpAzo=;
 b=DqZeFyA9kuD32L+T5QnRGlLDOqWu4nhOlZarnLoZckuLc/GXNkaI47ew1hiSt7qj0+
 xS5fMWZAuXjQdFC0xMHLsnjWs6kiALV3KGRq7VJFrd00J3qWYvIMhhtIKz0T2l6LSEkZ
 WIFTKUBlaVngRnu0EnGiGuN02voAIoxMVhh7UAlt1yN0l8AP8VUjNQE8Cm+FY0EqgFMT
 d5UPDX1wNTX2w5OieZDPktyJn18jHF1E9g+l4nBJSXD4Q3yOy7z1mQgG/qBMy5hMM7kH
 8RNJqSWqc2kO3KzmsvHy6v46FU8jClbtK3PtlR51ZYuJQ1NTklloEGrS6tBCrlyCNVdA
 GQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Rwr8+w+8QLQa4NLGa76sskWeG9fQ1kfdnCR+lBjpAzo=;
 b=fSt0/vu0XbZO9lDhsdHRJAnK1yaLfIb6AYNP/KIkPSy4qxIJKkEvTnpTztU/etvVqg
 tvZ0D7rcIyvN7l0/hUIFKUkYWCqPUkQhfbP6Ry7c66ETSWDSrM2YhlnjQ/cqJvIkIW6p
 n9HT5BKdN018tjVki77wXMQkH5aD9Bd7Gy2R2HTVEdR81YIVPjbqMx33VP81hgyg67ep
 ITeVGgLt/sp+CKXllHG+1VaKteNETVW0EucrMbF3uDBpziAX9mnGJi0ifOZViO8auWoJ
 BjYq+B0o+M4HtZ1gu6fXIKEQicmiz33eykR+uRtrgg8ZIYZ+I8tSgBWHjXWVNg4qvHEE
 8vtw==
X-Gm-Message-State: AOAM531eF0y/0Hn73ZsiQID6vU/QtlBG2NDGg2jg4a1KtyyE0ft+Pp6e
 V4CY7XA40btjQFpP2Ua8WQn9BmpaJQdQbjJj
X-Google-Smtp-Source: ABdhPJxMM9lXqYHVjv8gsZaBxjWBf5hm/va7BuW9qra9Di9vf9fQOgI8s4A6jifqt389hnqfXoMvGQ==
X-Received: by 2002:a63:c10f:: with SMTP id w15mr457203pgf.99.1612466256656;
 Thu, 04 Feb 2021 11:17:36 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id k9sm5869331pji.8.2021.02.04.11.17.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 11:17:36 -0800 (PST)
Subject: Re: [PATCH v2 04/93] tcg: Manage splitwx in tc_ptr_to_region_tree by
 hand
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
 <20210204014509.882821-5-richard.henderson@linaro.org>
 <87tuqrq3hh.fsf@linaro.org> <82078884-4213-158e-9e1e-7d9b6b026536@linaro.org>
 <87a6sjpt2z.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <574caf59-95f6-73c6-400f-0fdca2035d77@linaro.org>
Date: Thu, 4 Feb 2021 09:17:33 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87a6sjpt2z.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.182,
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
Cc: sw@weilnetz.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 8:45 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> On 2/4/21 5:01 AM, Alex Bennée wrote:
>>>
>>> Richard Henderson <richard.henderson@linaro.org> writes:
>>>
>>>> The use in tcg_tb_lookup is given a random pc that comes from the pc
>>>> of a signal handler.  Do not assert that the pointer is already within
>>>> the code gen buffer at all, much less the writable mirror of it.
>>>
>>> Surely we are asserting that - or at least you can find a rt entry for
>>> the pointer passed (which we always expect to work)?
>>
>> What?  No.  The pointer could be anything at all, depending on any other bug
>> within qemu.
> 
> But you do assert it:
> 
>      struct tcg_region_tree *rt = tc_ptr_to_region_tree(tb->tc.ptr);
>  
>      g_assert(rt != NULL);
> 
> and rt is only NULL when it's !in_code_gen_buffer(p).
> 
> In tcg_tb_lookup you haven't removed an assert - you just ensure you
> don't fail if it's not.

I see your confusion.  The arbitrary pointer is the one that is presented to
tcg_tb_lookup, and passed on to tc_ptr_to_region_tree.

The (dynamic) assert has been removed by not calling tcg_splitwx_to_rw in
tc_ptr_to_region_tree, as called from tcg_tb_lookup.

But tcg_tb_insert and tcg_tb_remove do not receive arbitrary pointers -- they
always get a TranslationBlock.  So I retain an assert along those paths.  (As
opposed to SEGV on the next lines, I suppose.)

Suggestions on how to reword the commit?  Just include most of the above?

r~

