Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B22952F85C3
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 20:54:00 +0100 (CET)
Received: from localhost ([::1]:36256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0VAV-0007pp-8D
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 14:53:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0V9e-0007NV-EE
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 14:53:06 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:53562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0V9c-0007h9-UE
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 14:53:06 -0500
Received: by mail-pj1-x102f.google.com with SMTP id p15so5567183pjv.3
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 11:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3bs5xcrZ9LyHBLAtwcKrXhrWvfu/7/Kyd6NvS1oE+iE=;
 b=qgN3wSMSn5p4DgmOLyRqquDHTtOzzEhoAb7ws9gSo/1g69+D4qPAazwFKn4v9YO2Ku
 /ZAlw/uTM1u3gp17bqB9aLlWGoAD6QM30sDesTsx+erOuXLgq4Vjr6hpWijS69NmTTD/
 Sf0uHjr9xzIbxAC80QN0kNZJYXOcwEsO3LGdRG2q5YM6GDHhAVbVapqjkPq8IIY3ywl6
 7sXW1b0JInPvDtS0TgnB1Yi3Dp7JrZ94S8bx3Xk+4IQZy87+3aaKINLtSKotq/SRP4Wb
 y0/54ipwLTOTx3DUz6Eajgf/1TBeG7bNKpuPc0gaEJACzV7x+SnrJfR0XjSj58lAxXrI
 VvVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3bs5xcrZ9LyHBLAtwcKrXhrWvfu/7/Kyd6NvS1oE+iE=;
 b=tZgPloqVwJ/1kfFxuVTbNel3Ov1F/yTi04U+XsXo18lEw4ccugTB0hzwBUYMD6fGY5
 tTjp03ur0eebLAiQLCMfeG1yCUx+mJ8UXg94CuIhhi+W7OnTUD3+bGtvbptInPJTEmUX
 IEgXT2dca4IiQt/bilEkGd5BlD2+P2nSNtYrUV9drcGK/zAw/7GmGIsXej3gygsHacD1
 TRaPcyzaZX355tCcHh5ZyxQ/h5RxmRglMHal9/mFwiwMV6dDg24q9ovCr5xoSaBvDmAz
 DJpcrhxpaQfrUPwuTRsNt1hdFbo/pol2sX9Juj4goMUkjF8Vu/M7QeyQVSzFK+Kp7jGe
 DbNQ==
X-Gm-Message-State: AOAM533jn+O0fdOx85Ldt9ogfwuetEB3qu6q5kne6ayxMtqkejfVKnkO
 fTDuGOT0r2nol5hXRRxFu2dMBg==
X-Google-Smtp-Source: ABdhPJxaYVdwHV3fth/mIA4Z2a9SQ9LoiRAUl+gBmFsHHaJUGVJWnZ+qMDZC0fb8G9JF0sPBsZ5rag==
X-Received: by 2002:a17:902:8c85:b029:dc:31af:90a6 with SMTP id
 t5-20020a1709028c85b02900dc31af90a6mr14202094plo.37.1610740383417; 
 Fri, 15 Jan 2021 11:53:03 -0800 (PST)
Received: from [10.25.18.3] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id x15sm8539795pfi.184.2021.01.15.11.53.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 11:53:02 -0800 (PST)
Subject: Re: [PATCH 03/15] arc: Opcode definitions table
To: Cupertino Miranda <Cupertino.Miranda@synopsys.com>,
 "cupertinomiranda@gmail.com" <cupertinomiranda@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
 <20201111161758.9636-4-cupertinomiranda@gmail.com>
 <7336e0b3-13e8-a3d7-46fb-a4ea942c5c16@linaro.org>
 <214ddc83-cf6e-20e7-0a86-92af851809e4@synopsys.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <82625937-3d2a-857d-4791-77f60a892e68@linaro.org>
Date: Fri, 15 Jan 2021 09:52:55 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <214ddc83-cf6e-20e7-0a86-92af851809e4@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: Shahab Vahedi <shahab.vahedi@gmail.com>,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Claudiu Zissulescu <claziss@gmail.com>,
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/15/21 7:11 AM, Cupertino Miranda wrote:
> As you know, we reused the code from binutils to implement the decoder.
> In that sense, we kindly request to allow us to do it through binutils 
> development flow later on. We will change the tables in binutils
> and those changes will also be mirrored to QEMU.
> Is this Ok ?

Yes, certainly.


r~


