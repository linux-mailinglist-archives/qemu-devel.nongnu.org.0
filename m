Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A83535111B7
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 08:53:20 +0200 (CEST)
Received: from localhost ([::1]:41400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njbY7-0000eK-Ol
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 02:53:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njbWV-0007uZ-G0
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 02:51:45 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:46600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njbWT-0008WG-UX
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 02:51:39 -0400
Received: by mail-ed1-x52b.google.com with SMTP id g23so782625edy.13
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 23:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pChRlsTZ2IPk8jqpv+mrLYsngI3Bk+qT3q00iKjxhrY=;
 b=SmHLi27vV7WrrjddM778PYQqFUE7Wn45qLamQTrx3pIMTWYo+fRZWA01RUA88h3AQp
 5bP2j+UM7DTXMbjjZk3ox89pOBfdHOwWFZ0gXFz+su4eU2BecvABfj4EsnvvB4LA+CM2
 uxJIXiZUsMYVrs8JW5mbRXM4GZMllejTbxkuelRgTk1B/Qk0Da8YtoRm/4P6USU9+jvP
 M52uCn5B9LQidPKbxOTIQdh6cbreqIjQcGT8nJ6lct0RKIliFe/hPrH9Umy2HD0xucV9
 x+zmh0aajx3bvgVciyO+7I2eX6GnShvxk8T3uYa02Q2Pt5dcwJJhynCmU9aH3dhJKpQU
 SkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pChRlsTZ2IPk8jqpv+mrLYsngI3Bk+qT3q00iKjxhrY=;
 b=ZhB1VwvdWwaEvCyemqDWe9JyXYk5ya+iQdRlvCk1m+Uo2MmLXpMcqZB2A4KKIDlfC8
 p/pLZ8h+RSoRXTrj9ZU21hLl/vTC+XM4DjNVcr7FyGmfi/mEHW1tyGgkbAfCG/SLT3Wb
 HxZqhzOflvZI6QtYhUw0HomlQk47kz8NpYqnSOh1rT8r+ma4JeW6b6TJ2EBDFt6Trb1v
 QoBl8SYbt7QrxG3v4lEt5R0zCLoRAwy6CHkt/s/TySigb08l72FhOqT+g3Z2FXZECD1z
 OTTm/FKACtuzqMs61KdB3ayx9dfg8A+1+IWbd5HylJjBpCI4NkeVmJPgwuQWE3h2kl7I
 EeUg==
X-Gm-Message-State: AOAM533atYAJ1VpCsv3f/MqWQ0LWarpe8sLzuI58igLvfn7iSUHIC1nt
 OcCppAULZhtRkGPfEFWJNyU=
X-Google-Smtp-Source: ABdhPJwSvV2nChZ9yh9YRRt2GErpYUyFERKTtPpOmQ52nl49opu01lbA9Zh0ZUyHvG/b8NqkahqxIQ==
X-Received: by 2002:a05:6402:4305:b0:423:f73b:4dd8 with SMTP id
 m5-20020a056402430500b00423f73b4dd8mr28686605edc.218.1651042296264; 
 Tue, 26 Apr 2022 23:51:36 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 t22-20020a50d716000000b00425b6799dc4sm7848100edi.71.2022.04.26.23.51.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 23:51:35 -0700 (PDT)
Message-ID: <2b498941-6618-0802-7b56-0bdaaa9cf4ce@redhat.com>
Date: Wed, 27 Apr 2022 08:51:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 10/42] i386: Rewrite vector shift helper
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Paul Brook <paul@nowt.org>, Eduardo Habkost <eduardo@habkost.net>
References: <20220418173904.3746036-1-paul@nowt.org>
 <20220424220204.2493824-11-paul@nowt.org>
 <27db1a9b-f64b-a07b-b6d2-3c85b4beb707@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <27db1a9b-f64b-a07b-b6d2-3c85b4beb707@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/25/22 23:33, Richard Henderson wrote:
> I do not think it worthwhile to unroll these loops by hand.

Totally agree, as it would also remove most of the uses of 
XMM_ONLY/YMM_ONLY.

I also saw GCC -Warray-bounds complain about

	if (SHIFT >= 1) {
		d->elem[8] = s->elem[8];
	}

though this should probably treated as a GCC bug.

Paolo

> If we're that keen on it, it should be written
> 
> #pragma GCC unroll 4 << SHIFT
>      for (i = 0; i < 4 << SHIFT; ++i) {
>          something
>      }


