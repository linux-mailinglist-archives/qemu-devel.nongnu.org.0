Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DE843BB82
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 22:22:27 +0200 (CEST)
Received: from localhost ([::1]:44204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfSxm-000109-4b
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 16:22:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfSw4-0000Ch-1C
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:20:40 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:42796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfSw2-0003P0-B2
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:20:39 -0400
Received: by mail-pg1-x52a.google.com with SMTP id t7so621183pgl.9
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 13:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wuWdxNPtj0F1cYWlstXVqrF+y7XheO/eKzXWPc+dHYQ=;
 b=Wn9SuGdFP2LKf+bEpK1m9T90aWZX4togi5Dk/fgDAHFs7k1y+fhZNfBYtPCeM5DNF4
 v0ph4buNy/qSWXYCoRtHb/h+Xpx4H9PceNP/1cHd4ekvS4S3+Ba7PZFKPk7nJYABEZVL
 lwWpjl5iHzF34Ig6g2eLKXyF7a1SX9U6JAoNY/Do54mGd/BHHljOELqt3oUDdqdFo4Sw
 3dBZL1LnzOQnAg/f6V4uqeTM+GZSOR3PHXnfiZRvrYkoOCH6lNkQAIayapSbPvO50t48
 2B0XbwF+SXnTNFGwpsX8jvm5E8cWenX/gQgnURC8X/Rfz5YsZvjj5qg6/R66pxmFc+8i
 ElwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wuWdxNPtj0F1cYWlstXVqrF+y7XheO/eKzXWPc+dHYQ=;
 b=mJeFeZhjQ7VgIMxuMCUNzSTWwXLgUM/q6Mb7GESCulV/4qqyuAZ8fkuIIKlj+FP6KQ
 ov/UvFIUYxitQjv+sayuX7uXXTSQRDTcz1X/ZrPkjpEBz/DbGXBTwgCD48vbGw+V10E0
 9x33W4MOUPk1j5/t7U4l/QlNcQBa5MWhVAiX+FSdCPMW4u0fk7yJ1OeOy+0dvr/KZpoT
 zVDzhnil6biU2CNwLTZSTWqwWfUWzNJqOMPTBdeOzx3zQpx9xakrynQJicNfHCZfalFP
 Qk6vwXgRN85IrAYnJ0GO1CAA00bkftOtnpEYWdkYmW06iznlHM1JcOwFS2WpnBsUZbfb
 RCRw==
X-Gm-Message-State: AOAM530IhRKCVitmx/vLP4e1JMKYrnsNUBeMllogzrje9pyp15Co3wu+
 D0smhTEoWQS0uSvjnDoB6PeFyw==
X-Google-Smtp-Source: ABdhPJwD9jUZvRb/nnaCw9YCAfybhP47H+kX5B5Q7AdlY1orgKZt2zZxwF1VIuHuuOToZb8MLAe4kA==
X-Received: by 2002:a05:6a00:984:b0:47b:f5b0:7226 with SMTP id
 u4-20020a056a00098400b0047bf5b07226mr13558508pfg.62.1635279636091; 
 Tue, 26 Oct 2021 13:20:36 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w13sm1709765pjc.29.2021.10.26.13.20.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 13:20:35 -0700 (PDT)
Subject: Re: [PATCH v1 23/28] tracing: remove the trace-tcg includes from the
 build
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
 <20211026102234.3961636-24-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <062296db-fc75-ae8b-908a-7f4eea7796ea@linaro.org>
Date: Tue, 26 Oct 2021 13:20:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211026102234.3961636-24-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.215,
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
 Luis Vilanova <vilanova@imperial.ac.uk>, mahmoudabdalghany@outlook.com,
 minyihh@uci.edu, cota@braap.org, stefanha@redhat.com, crosa@redhat.com,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 3:22 AM, Alex Bennée wrote:
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Cc: Luis Vilanova<vilanova@imperial.ac.uk>
> Cc: Stefan Hajnoczi<stefanha@redhat.com>
> ---
>   include/trace-tcg.h | 6 ------
>   trace/meson.build   | 1 -
>   2 files changed, 7 deletions(-)
>   delete mode 100644 include/trace-tcg.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

