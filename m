Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEEA3C7560
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:57:38 +0200 (CEST)
Received: from localhost ([::1]:42114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Liz-0004zo-Ks
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3Lhn-00031o-Ei
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:56:23 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:40569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3Lhl-0006Y8-7K
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:56:23 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 g4-20020a17090ace84b029017554809f35so1729496pju.5
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 09:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NNm0q/CSOpjbbFfi7zGx2wpAET1Nqgh9aD4RIizsF6s=;
 b=q+CQtISKXO7AF0VBlx29TFGgpCRsyypCjlUaSRWqSCut/OeunrjCGDU6v9qKw33tN1
 suwHXsz+7BkxNxZmZsWZEmv5ba34ERHfTe0rTtuZ0d+F4jSKYr31Tr60QJpLH3SAWwyg
 RMxMtMm52yciAqblE5vLn1GTp03qOaPpePZP9nEa2dPhg5RmRyxUX4C4qGpK2RPNLTu0
 R3lYdIvdCU2zUviaNv2Qj6DX5PF6cnT6zfRBgZvDX+oXo1chzxKsvB7GhpNbUk/19Lvh
 net44+IAxfry20xiOqKT200OfbDksAQcyzgT4LZtN0l+H3dzdV08KTTQIeUam9cTIo73
 466Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NNm0q/CSOpjbbFfi7zGx2wpAET1Nqgh9aD4RIizsF6s=;
 b=G8sXazoNblQFPiF0Q6y6d51ezwDkQ7u/22JP0m5twL7ihbKjR4mZYT8kSBncq8b/WR
 5Lns6eDQm5BlUF35n+w3f3XqY1Ir7ThzndeBFJgH1MU1hOIQGpuPnnTXY3nBXTb0k8Qh
 9Sdg2JYnWv9rJDy1IcPTQGMgcjsqMdjuLfmbgmHoDfW0y27Xz1xgcbHhyk6oaKr1ozjf
 kJeNpe8Qqtq6MSFD6x8aOCojuiQwiw46t7UGROZzcdbotiWIvcaPc1o08BwcK4FLWyR2
 A8tH6TjKcb+8kjGcVWLfbd3oxp5kmo6Y9QrOSiz1dJAenL0W0dysYPb9L7bo0MSVFATJ
 PdEQ==
X-Gm-Message-State: AOAM533dny/Oqr/P1PCXDcGQXJrItLbOCys8EK7KZOr2MeQ7vlvs0T/4
 wfK8FnFH2ZJ+ltsQ1Sw5tv35yw==
X-Google-Smtp-Source: ABdhPJznnqOBJoA/KSHRTTNVQOT5FUItgjhfULkNMqmnx27U3PG/tThxSzDLoQd0ZyXwCYr3nw8ldg==
X-Received: by 2002:a17:902:e885:b029:12b:25f7:9b15 with SMTP id
 w5-20020a170902e885b029012b25f79b15mr4240296plg.57.1626195379572; 
 Tue, 13 Jul 2021 09:56:19 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id c24sm23188024pgj.11.2021.07.13.09.56.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 09:56:19 -0700 (PDT)
Subject: Re: [PATCH 0/3] Atomic cleanup + clang-12 build fix
To: Cole Robinson <crobinso@redhat.com>, qemu-devel@nongnu.org
References: <20210712155918.1422519-1-richard.henderson@linaro.org>
 <f186b5b5-8db2-a43b-d5cc-2563d76c7211@redhat.com>
 <67a16913-363a-8157-d5fc-1350702b431b@linaro.org>
 <4cc4bbf6-d856-35ab-3687-3fce79b7f8d7@linaro.org>
 <e37ae8b2-441f-f7e1-b125-78bbd85ad4a2@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <207d666e-b319-dda4-9707-7fd6905dbc33@linaro.org>
Date: Tue, 13 Jul 2021 09:56:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e37ae8b2-441f-f7e1-b125-78bbd85ad4a2@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.368,
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
Cc: pbonzini@redhat.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/13/21 8:18 AM, Cole Robinson wrote:
>>    https://bugs.llvm.org/show_bug.cgi?id=51076
...
> Richard can you clarify, do you think the errors are a clang bug as
> well, or strictly a qemu issue? If it's clang maybe I can get Red Hat
> llvm devs to help

There are minor adjustments that can (and perhaps should be) be made to qemu, but the 
major portion seems to me to be a clang bug, reported above.  Assistance with clang would 
be quite welcome.


r~

