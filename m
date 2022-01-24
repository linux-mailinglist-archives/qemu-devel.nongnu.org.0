Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E470499C99
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 23:09:43 +0100 (CET)
Received: from localhost ([::1]:51826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC7Ww-0008Cv-Ad
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 17:09:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nC7Ut-0005ZG-0H
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 17:07:35 -0500
Received: from [2a00:1450:4864:20::435] (port=43925
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nC7Uq-0003Ih-V0
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 17:07:34 -0500
Received: by mail-wr1-x435.google.com with SMTP id v13so16198398wrv.10
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 14:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=p14GOKmCjk5Ep73p5nLADClucE2x+c1Fc3S4JUibzAI=;
 b=pUNAreFowXU7Hw+kIDEqeIHKLk/txj0SlXh3hGvdil7C+sxGu1ntsqfRfp9nCHJxNS
 Cg2eqTq0MBJzPDWe9cjfhiqOQf1StDHZsuEofTv1JDw+ILRRCt6VOq6APHbFIITAA+Tt
 GUJ7XKGqFjJRlITl+uQk4pXJB5YBrTLqpeSpkI2MHiE24atCfEjPXpt+IsYs5Wn2Gkmu
 SoDY7TWZACfw21qG6DF/KVgrH9fFDTt93lKqw+zvC1qbTUiNOmRPtcdwSpSSbAaPMS+i
 F6jg5u10xygwftgHYf8288DppLFfPLSY0J+DhZY1Bj45dGnd9WK8xgCVDihKrKFGL9vK
 X3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=p14GOKmCjk5Ep73p5nLADClucE2x+c1Fc3S4JUibzAI=;
 b=j15J2Afl9Qnop1Z65B+lNi7yafm4u6nH1+K6+OlHvCO3cnNLBw1LwcNJE3JFEnFKE8
 y6Ng495RDxsul7WeqY3n0NllPi8L/CoI8tzImV+2zllsjW3eJp78MSolFbvu4bmdHLd4
 vu+WWh0o3QDqgMhfsCeHyXiJ0fAaPH4zzVcr8spccDEkZNIn+MwdGufd+KgYfTMsrTY4
 rRcu1w/eQmTexLekeVrBStVMVuRn9ne8oURnwKhTyGEySX/N/E4kejQYq/JJj6OL1cSq
 rTXh07eMdpyejPVwSqkWjHgfHNiqvrgV3C2VZl/kqd/fwWDIi/q8mh+h8LK61motKzXs
 gSag==
X-Gm-Message-State: AOAM532+/WjcCELZxCnMel2KESTEp8byVfU9zoFmLWl5/QdWFd1oewMZ
 FdDovq6VK9JB2+fuSiW2sS8=
X-Google-Smtp-Source: ABdhPJx/sIFzTO61ug03a/7XJ1wfg8Y4SHUOSO73pmm0QZf8mqXdHxvJUeK6uNCZv8LCtTUs9ycW/g==
X-Received: by 2002:a05:6000:1886:: with SMTP id
 a6mr4909541wri.573.1643062051473; 
 Mon, 24 Jan 2022 14:07:31 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id p14sm5739209wrr.16.2022.01.24.14.07.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 14:07:31 -0800 (PST)
Message-ID: <285fe45c-16fe-d429-d7e3-96f9569d925f@amsat.org>
Date: Mon, 24 Jan 2022 23:07:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 15/22] tracing: remove the trace-tcg includes from the
 build
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 aaron@os.amperecomputing.com, robhenry@microsoft.com,
 Luis Vilanova <vilanova@imperial.ac.uk>, mahmoudabdalghany@outlook.com,
 minyihh@uci.edu, cota@braap.org, Luke.Craig@ll.mit.edu,
 Paolo Bonzini <pbonzini@redhat.com>, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com
References: <20220124201608.604599-1-alex.bennee@linaro.org>
 <20220124201608.604599-16-alex.bennee@linaro.org>
In-Reply-To: <20220124201608.604599-16-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 1/24/22 21:16, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Cc: Luis Vilanova <vilanova@imperial.ac.uk>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> 
> ---
> v2
>   - dropped includes here instead of next patch
> ---
>  include/exec/helper-proto.h | 1 -
>  include/exec/helper-tcg.h   | 1 -
>  include/trace-tcg.h         | 6 ------
>  trace/meson.build           | 1 -
>  4 files changed, 9 deletions(-)
>  delete mode 100644 include/trace-tcg.h

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

