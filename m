Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E78248430A
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 15:08:46 +0100 (CET)
Received: from localhost ([::1]:34828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4kUW-0001vO-P2
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 09:08:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4kSp-0000ga-Ks
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 09:06:59 -0500
Received: from [2a00:1450:4864:20::435] (port=38456
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4kSo-0007Ej-1Z
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 09:06:59 -0500
Received: by mail-wr1-x435.google.com with SMTP id e5so76406796wrc.5
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 06:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5167/CBbe2R6zUOp0WuNIoVmYrzeZJoMse5tZqnnNvA=;
 b=VdFQXX53JLg0stif2foaYxpg+BhpMXhEJHrZb42zCAmSQNg+UpG0HtJ4grTqyPQT+H
 1EdD97GuFygvf8TCcl/zCvxOIeugGNMmAG2x3mHVVgOb3kyw5rpSRX0feByEWnxekQQQ
 CnF7ysCVF2R/EKsmIxDkTq9i/skkOhhwcFwnlX9wHWERQgsi5Z3aDRIbX+SGRsj3Xr76
 4KxgKyevtKbt5CQDyOF9Z2RAvuVDxDwiNnHmMEaPOGdIa1WPp0DHrTlOr3GzByfH65lV
 AMYfAV+cD3tUD1tr72md9KzK/vQrybmIbZmWQv/DiAcrYC4XqLfkJO+A88W97295iS8l
 uXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5167/CBbe2R6zUOp0WuNIoVmYrzeZJoMse5tZqnnNvA=;
 b=0r62WPcFRn4LFpkTHg+30iokF8QsOJ97CE8avbOQQanpqD3Os5GZUbHkdcIFC+UFg4
 DKZqrxhEjuPtVUG5LMtlANUlty0JkSKTObcBboLPAfIRZXfQAOdohehFuaTEQlSh95eL
 A0qU/PRQTjctGTmWggxIWUINc1NT2hRkCX/di5dvnjilKekjGXgCAowfxrMNX3auE2Pw
 ayU7wCXeGzGoR8vS5HCqmvHT+P6csbBsDPLGxyuc2f/9yDYvBLuc/kb7YCQYevdtjOK5
 00TNdPhPX7NYfGqwKTTbiEBxue48J2pgSaWKkopMmAjmfZ5g3sk8z9rx/zAUyXxGXc+Q
 PrUQ==
X-Gm-Message-State: AOAM5321Ry6K+1tXj+v/6wuE2jZrff30zu9R8JoaUsP45g8mu4F+VVwD
 JU7REe24yEDzbQbCDglLYQk=
X-Google-Smtp-Source: ABdhPJx4q2etD5dpfyNDaln+nNG7cqTJULgEHMaoqlilv0DCW01KHXMLo99netrAy1lk5jI+I6NfuQ==
X-Received: by 2002:a05:6000:1ac7:: with SMTP id
 i7mr36230273wry.7.1641305216421; 
 Tue, 04 Jan 2022 06:06:56 -0800 (PST)
Received: from [192.168.51.187] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id h204sm38244515wmh.33.2022.01.04.06.06.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 06:06:56 -0800 (PST)
Message-ID: <a24b8e9e-2cc0-894b-18eb-ee42a224b890@amsat.org>
Date: Tue, 4 Jan 2022 15:06:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH v4 7/7] tests/tcg/multiarch: Add sigbus.c
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220104021543.396571-1-richard.henderson@linaro.org>
 <20220104021543.396571-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220104021543.396571-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: git@xen0n.name, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/22 03:15, Richard Henderson wrote:
> A mostly generic test for unaligned access raising SIGBUS.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tests/tcg/multiarch/sigbus.c | 68 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 68 insertions(+)
>   create mode 100644 tests/tcg/multiarch/sigbus.c

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

