Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 700B94296D5
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 20:26:28 +0200 (CEST)
Received: from localhost ([::1]:42042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma00J-0002Bd-1J
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 14:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mZzy7-0001Pd-Hw
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 14:24:11 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:39570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mZzxy-0001T6-TZ
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 14:24:11 -0400
Received: by mail-pl1-x631.google.com with SMTP id c4so11894672pls.6
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 11:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TvMuBxSA5bE7mLy+APsrC3HPt+LdgDdK84vM8kN/eZ8=;
 b=IQi5yysAaCtAO+ZU4LAocBxLTVYMdMrT/GHBTqycrLjFvvNfnvvgwWWzg6z0ulF8lX
 ZR9hzTqZnOAJ3AyM5dahvv9PSwC/cqvMyGg0LE2Uepqt2OumHdWwu8BjtPO7hSbc/r8C
 3nSaPKn3CyRfQIphLErkVvu1gnBtCAxVOFc6PxeOmTrBDVONSs/mnrwbmglJTdt6rXyb
 57JwSJ6uGIaBZKUA4KalGsrcVdJJQTJgpOFgVeWQwiFyjGjDcBASCD5rX1cL7X3U34Fw
 cG52de9cEhmhbo+2HeLu09+7DDWzPL4wgrGnp4+cxRYXY41yCE71jScyE/khDqCNl/49
 JF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TvMuBxSA5bE7mLy+APsrC3HPt+LdgDdK84vM8kN/eZ8=;
 b=udyktomuom6/Wil1whzBPPix62lpLyGFtTsz6Wd8IC2qWaqj0v7BbZ0/XJDj6dXOby
 sDMhT3yVrUJf35qR5MndxlMX2G1ctoU/QgJVVvJX8LtIc0QUjE8UjhHt7O7Uo5EcfAtc
 HBvDdhlRYUBu1XD2aCUBmDMA1Zz3aAVIjAroEqAGsGZGXDmTJ+YFWS0gqg3wfTvopoOh
 h0wCASx4HBrqllkxp1MNiPIg1YPPXiyHI5xbEdqtdY2yZc8gQ81ac8nykJM0BTWF8ySS
 /I08J4yOwF24hq4liDOH45IFQFI1PolsCHro6I9nk6kRtf8cLMLXz8uBbaVztemk97gu
 aG6A==
X-Gm-Message-State: AOAM530HATFzrenBzOGsiuj9Z93k6dY60yuSOE2ioN6e7zoIT6ulUK7b
 BlmHSs2C+/lRlYuVEZ08DfpDtQ==
X-Google-Smtp-Source: ABdhPJy4TrgU7FraGTGIwW9/QiaTVtteOV8wY0vZ+J8Eod6bt4NApeI7xHDsszzFA9kys5W6bjZXFQ==
X-Received: by 2002:a17:903:1c2:b0:13f:2893:de99 with SMTP id
 e2-20020a17090301c200b0013f2893de99mr12662280plh.80.1633976640988; 
 Mon, 11 Oct 2021 11:24:00 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 188sm448752pff.196.2021.10.11.11.24.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 11:24:00 -0700 (PDT)
Subject: Re: [PULL 0/2] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20211011124044.9090-1-stefanha@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <80f6b09d-9945-e7ed-68b6-cff66bb3eb57@linaro.org>
Date: Mon, 11 Oct 2021 11:23:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211011124044.9090-1-stefanha@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/11/21 5:40 AM, Stefan Hajnoczi wrote:
> The following changes since commit ca61fa4b803e5d0abaf6f1ceb690f23bb78a4def:
> 
>    Merge remote-tracking branch 'remotes/quic/tags/pull-hex-20211006' into staging (2021-10-06 12:11:14 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/stefanha/qemu.git tags/block-pull-request
> 
> for you to fetch changes up to 1cc7eada97914f090125e588497986f6f7900514:
> 
>    iothread: use IOThreadParamInfo in iothread_[set|get]_param() (2021-10-07 15:29:50 +0100)
> 
> ----------------------------------------------------------------
> Pull request
> 
> ----------------------------------------------------------------
> 
> Stefano Garzarella (2):
>    iothread: rename PollParamInfo to IOThreadParamInfo
>    iothread: use IOThreadParamInfo in iothread_[set|get]_param()
> 
>   iothread.c | 28 +++++++++++++++-------------
>   1 file changed, 15 insertions(+), 13 deletions(-)

Applied, thanks.

r~

