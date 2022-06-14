Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A166854A852
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 06:49:18 +0200 (CEST)
Received: from localhost ([::1]:46512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0yUP-0000cA-M2
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 00:49:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0ySJ-0007et-TR
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 00:47:07 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:47065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0ySG-0005XD-1a
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 00:47:07 -0400
Received: by mail-pl1-x62b.google.com with SMTP id d13so6781484plh.13
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 21:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=MPVs8irn0hVaIAxkgTr91sMun1IJvTEwGBT4x0HOpQg=;
 b=yqq0FYem4OrcAjlD26XLcbpeCIF4RvuA6Pg3TR86jWBYbaGS2h9JChaV+w3mr/lx5x
 bDCMZceTwjE7x00gQCPK6UYYIkurT6ZmW7yNc3Rwln+FnSCMJiDjdgw4kEthmXUv+u1G
 XUGuDtoLp+EFLQsbbYWUsKdGMhuIElqBszMqqNVd6OZSfzBkLWxt+j8nzvpTEhiDlWaV
 z/CTUseFSb2RpH4MalvekzEOwESCz0vQ6SARkhKqRhFUOS55jjI1KlAer8LrJ/PDVf+J
 4lsymY/i0iy2CUJnuN3uWZw7ffiOeUyWyuZYq9Rl1jPHW33LMwGQSH1QnL9YqeLlZhPl
 7tYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MPVs8irn0hVaIAxkgTr91sMun1IJvTEwGBT4x0HOpQg=;
 b=4QUnsz+Zq36yWODnZ1t5RAZDpOSATiWyGoI4SI5H8dMPGn19MbsZeK2uPnmqrG2Sh9
 qERHhsfKSv9oQZit5mi3Tw+RGrhoj9396/p1UsC9c+hbrgWlSmFqyZv4r9Uoej24H9+Y
 47o6BChf13ZrAvSUKpi+mX2pI4b8RhFaslf12JwdWNeFomech3supCuxYjOWb6ttaS0v
 kTSAAz0Czyx7rc5PKCHGHAhKuygpeJA4M4SOaP3oB0q4CT/8YTcN0MPYZA4cjFW3VcZF
 rgnZLhslaVUJEgwxdjcrDXTqojbmRI2zXuifJVurIUTnMNfGe1Ww8vWGQKRfZWnOd7ne
 zSCQ==
X-Gm-Message-State: AJIora/DXCeVNCiKb9Rs/nMQNh71LbJC7XcJNbShO6AT4xq3EVdN7Fxo
 +hhjBCQPKEzGxhr6BvcZeUvpmA==
X-Google-Smtp-Source: AGRyM1sRD/tdwKovwSSuQ8pxSfZAwmkksSnPqa/Xq3u/w6rQnT3CPV2vfZ0GVP0YuU57+AXG3EtNrg==
X-Received: by 2002:a17:90a:6602:b0:1e3:17e:6290 with SMTP id
 l2-20020a17090a660200b001e3017e6290mr2512812pjj.37.1655182018939; 
 Mon, 13 Jun 2022 21:46:58 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 ix1-20020a170902f80100b001615f64aaabsm6023003plb.244.2022.06.13.21.46.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 21:46:58 -0700 (PDT)
Message-ID: <751e05ff-92c9-453c-728c-03a31d84e372@linaro.org>
Date: Mon, 13 Jun 2022 21:46:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 08/11] bsd-user: Implement rmdir and undocumented
 __getcwd
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, arrowd@freebsd.org, jrtc27@FreeBSD.org,
 def@FreeBSD.org, Stacey Son <sson@FreeBSD.org>,
 Jung-uk Kim <jkim@FreeBSD.org>
References: <20220614042010.40327-1-imp@bsdimp.com>
 <20220614042010.40327-9-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220614042010.40327-9-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

On 6/13/22 21:20, Warner Losh wrote:
> Implemenet rmdir and __getcwd. __getcwd is the undocumented
> back end to getcwd(3).
> 
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Jung-uk Kim <jkim@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

