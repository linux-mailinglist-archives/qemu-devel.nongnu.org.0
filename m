Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FD44D79F9
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 05:47:03 +0100 (CET)
Received: from localhost ([::1]:48052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTcbm-00087x-Qn
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 00:47:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTcYk-0003Rq-NR
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 00:43:55 -0400
Received: from [2607:f8b0:4864:20::630] (port=41863
 helo=mail-pl1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTcYj-0004Sg-BQ
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 00:43:54 -0400
Received: by mail-pl1-x630.google.com with SMTP id z3so12514713plg.8
 for <qemu-devel@nongnu.org>; Sun, 13 Mar 2022 21:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dEq67PFbYA/WPSzoHgwS6FtrlVD/RRO14HFXNSEfqNE=;
 b=YPjioEbb1EpggSI9eAncMiQ/rikop0kShT5Zc87UeZ1RkHbb0aFpvheq8jg0OwVIfQ
 esXu4wSdJo+zco7XjM6KLnoi21BY1eFd5Lf/gq1Zwa02mFeyAX3IRncA6C9JbX0d0XyG
 99/Bv9nmaj1n6EP67Q2HvAj/zTV5g7R9HvBVN9tv4tmi1w4Dz5QMwAGkZGAd830CjAL7
 sGTYng3BbGGqYZWoJ4HtEgNaV9DbY8zwWZTVAhaXIqEtxSz9B5T+5OA42OWKU2mtcIgZ
 DHLPZuUi84892xywUTRLtbR9vs6w42H1j0h+K3yCPyBOLwlZuoqhVyYaL5QahaNX1RMC
 EzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dEq67PFbYA/WPSzoHgwS6FtrlVD/RRO14HFXNSEfqNE=;
 b=Xf+2cUrr8SAMHl6D3DwF7fI5Y4tDQU9pTXHlS+yxBpfzeHsdbblg3IMbNQugcT6qAo
 V7gfkq0xwyYHzS5I85gloffvlGiHUy8XgG/41z7VHZMedXqlNceBBhj7+0XRS7tzq3qu
 3TUAiRM92T+5ZIDAsO7eQvNKQmCtmNmG15BHUqSxGG9668n3UpY3WV6PX1DnaDEXrLJb
 NW9osSLtJ9Wk7Ijx3UXmif/kgMIYi8Wp8rNgmXvxqljmSOWMmXE5NrNf8vFRk0HCYFvh
 +/JNwhXS94oywBSLGDlkl3VsdgrClpAtRfkbIi53dvavP+IxHmQO0Y7aFVG/AMjhrFZF
 ktnA==
X-Gm-Message-State: AOAM532eINuZoTU1Nhwvt97+ai9iVWCswBZQw98PCAiXCdeXfOiYDna6
 qOGdS6CopuHLoxupb9hby3o1C8HOIFr9/Q==
X-Google-Smtp-Source: ABdhPJyXN/26SGxAhP7kb+vcnwkySDoOk801r8G8W4/bItYzHiQnOvXP96TwvG1g5X/GIrvyvqRJEg==
X-Received: by 2002:a17:90b:788:b0:1bf:41d:a9ff with SMTP id
 l8-20020a17090b078800b001bf041da9ffmr22917979pjz.116.1647233032056; 
 Sun, 13 Mar 2022 21:43:52 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a654006000000b00346193b405fsm14850151pgp.44.2022.03.13.21.43.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Mar 2022 21:43:51 -0700 (PDT)
Message-ID: <a4ad47df-3c1b-6487-eabe-1d63ae800e2f@linaro.org>
Date: Sun, 13 Mar 2022 21:43:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Question about atomics
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>
References: <CANCZdfpJVWFjrQDiYJy8xiw-THF8_3GNcu=0Pmbvp_6zAJbfHA@mail.gmail.com>
 <5bb620d4-96f0-cf7f-5530-af529a32c78d@linaro.org>
 <CANCZdfqwA8HbxYhud8pKxF_f=BMoMtrO+R=zg7GiKesz8_YZvg@mail.gmail.com>
 <e60a4298-17f3-d3e7-bf94-bf2dbbe83141@redhat.com>
 <CANCZdfqDSNhQYnb1PWi-753cJ4FvO-JBFmTW_mAAdezOQSDF1g@mail.gmail.com>
 <CANCZdfp61n8M8Qc9szvfqYcHnqnUADpkPmL9QHW0uDKDffJ2NA@mail.gmail.com>
 <da134ea5-ffe9-d544-62b4-1914aad15ab5@linaro.org>
 <CANCZdfoC8ArxyvD3PpBWiYdqONR32oeqioqk42CeoMeKRgecZQ@mail.gmail.com>
 <45371f77-cae6-bf96-802d-6a3e70d5e334@linaro.org>
 <CANCZdfrMaDY=0u-HAB9GY69NUTHES30V_agvZhCw3Gnr6aOomw@mail.gmail.com>
 <d8e85004-de8d-fe7f-6bd3-a86ea5bb8e6a@linaro.org>
 <CANCZdfrTNdXx7xz9mcw5rXK0bbwh0mF2iLX1JGeAXWHv8zn4+Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CANCZdfrTNdXx7xz9mcw5rXK0bbwh0mF2iLX1JGeAXWHv8zn4+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::630
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/13/22 21:09, Warner Losh wrote:
> Oh? Out of paranoia, how can I verify that this is the case when compiled on FreeBSD?
> Perhaps the atomic sequence FreeBSD uses differs a little from Linux and we don't trigger
> that code? Or there's some adjustment that I've not made yet... the code seems to work
> on 3.1 but not on latest, and there's been a lot of changes to tcg, so I'd like to rule it
> out since there's a lot of other change too and there's too many variables...

Can you point me at this code on your branch?


r~

