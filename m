Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C7A34F1D4
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 21:53:03 +0200 (CEST)
Received: from localhost ([::1]:54944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRKQA-0006Wi-LH
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 15:53:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lRKP5-00061O-Ag
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 15:51:55 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:38640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lRKP3-0004qN-RP
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 15:51:55 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 k23-20020a17090a5917b02901043e35ad4aso10011056pji.3
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 12:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jI+Keo9V78tN9EI3EajyJDUrKD6iHWW4sxlel4Ya4J0=;
 b=yQ6U1Y9VIqGNx5QCZyzu2wcXnLBJLhdY1xtjPSFDOh2SIw/TKrCWEwW482jXyVf2QC
 NcxmZ+YO/Rn639Nwsax5236LJiXQrNWSxy0ytMp8b+V2F+XSXlvFEq271iZARsRBOg+P
 o5mCBRbjILNtnpbQeEdihA9RHlwnRj64LugfKonvK5kqlVhUo8R5aBJL604JYM5JieNU
 MOE9Dje/biIAsiPau0gL2L9GCGcsyScLo5jUmx/mr7DXIia9qWVpaC6fUc+t9lNA7LF0
 i1OVJShEDJdli4RS89DSyQ56384J613fG2kEgOgnOVIF5T44+fz3VAtTG51utLeEcTWX
 vIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jI+Keo9V78tN9EI3EajyJDUrKD6iHWW4sxlel4Ya4J0=;
 b=Ngpfa996PjYVkda1FBTX8YfWvGeQC2K0cuuP3BDMQdqGgtanOit9H+7HiE9ZBfF5Ua
 dtYNmMiDgbK6V3bD/Qho/ceeIJEtfqNb3O8+Wl+VvYi1joFmLDxNy95RidMI9oX2XQ0s
 mbi5/7HP2dFlU8KxyJAf4PbZnA8y9kK8ADMjOFZL85Ldpl5TYHwZXFcVZSDaEvNIBS15
 Hq/m6eYiKUh65wcO3Fko3C9bPn9pbrag4xl5pr8SXlYip52xm2MQakm4UWOdCFK2CiH9
 9KQT2t7PoQkslrU8jYR7WS607FSYKipfNFnmhYSF+iiDM1bO2oZ1BvZWb59zG48OjOfb
 dG5w==
X-Gm-Message-State: AOAM533XiXgkcgN8WUuotZAGtu+hk5QfejIkYvcC6piALl8rGRxlWxoN
 3TRutB7cHzNyEin72BJy+NfzGw==
X-Google-Smtp-Source: ABdhPJyxn63gY8U+EeLwnmVGQx5HuvJVXc7mUeF6d4ox8HMGwHb0vvOxDpTzlUX0uyh00HKpbG/Wlw==
X-Received: by 2002:a17:902:dacd:b029:e5:cf71:3901 with SMTP id
 q13-20020a170902dacdb02900e5cf713901mr34038247plx.23.1617133912526; 
 Tue, 30 Mar 2021 12:51:52 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id h68sm20818272pfe.111.2021.03.30.12.51.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 12:51:52 -0700 (PDT)
Subject: Re: [RFC PATCH] docs: rst-ify the record/replay documentation
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210329145947.14280-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7c19395d-8808-c7dc-64f8-93b80ffaad82@linaro.org>
Date: Tue, 30 Mar 2021 12:51:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210329145947.14280-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/29/21 8:59 AM, Alex Bennée wrote:
> No changes to the text, just plain rst-ification of the original
> source text. Notably:
> 
>    - fixed up indentation of bullet points
>    - proper :: escapes for code samples
>    - added titles to paper links
>    - moved events into a table
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   docs/devel/index.rst                  |   1 +
>   docs/{replay.txt => devel/replay.rst} | 211 ++++++++++++++------------
>   MAINTAINERS                           |   2 +-
>   3 files changed, 120 insertions(+), 94 deletions(-)
>   rename docs/{replay.txt => devel/replay.rst} (58%)

There's a few instances of trailing whitespace.  But otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

