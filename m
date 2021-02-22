Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F450321DB0
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 18:05:47 +0100 (CET)
Received: from localhost ([::1]:45572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEEeX-0006Kr-IP
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 12:05:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEEYL-0004Ga-D5
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 11:59:22 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:44489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEEYJ-0001iF-Nt
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 11:59:21 -0500
Received: by mail-wr1-x436.google.com with SMTP id h98so15021466wrh.11
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 08:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=QfQoP3KVKTz9KAZgwHGlUrmdD6mOjIaAG0gCtK22elA=;
 b=jvtjrEZw1+OrgsB3MQarfjKP+tHjt+rldNJRTPN/J3R4xCvbZspVFAIJ7IcGcoqRuk
 4Ilt2xMevCKFIfMnICglnUv44vY4Ch/kzgP5NlpmWfBR/8vfziVaw9KSH0EJXMgAFrtU
 72W/uHThTBn7YHdc9J5L9df05KxRe2TvHaRaoc6xUg1sbTz2YUYMppoAonEDYw/NUr6e
 vWKeDwUz6ITlHA9XWKQTjx/spFZzG0F5EnsEnjzYl5Sx8PPTLgGOVlee0TErsAVjRK/E
 k/TEDBbTC8zh5thDeZd8309dwfvjlXg5Mhoqg3TmAFX14u77oFlWVgWttmveOdePCSd2
 F0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=QfQoP3KVKTz9KAZgwHGlUrmdD6mOjIaAG0gCtK22elA=;
 b=fr4Cc597UBAvJAM7aEkVmtliZaWV+TPZui3QPaEbgFJTxbRQoqwTvlndoAqypjs4bd
 9rzv7fyxoMUlKPagaVAnfGK40qoSIFLpT9Q21jWcZ4zAUnYcelwiasS5V68MlfBmfjNH
 La2R/0qn0L4ZESx+QFKUPzs/uOPUBMqUYpQc0MIHxUvsSWa4OeJTjv6ghS+uZM5op3gi
 siASpfV0rkWoJ7C6HmC8ZKOtk74X7SWZsBrhIYJk3BduRN6byh1bqj5RJrgK+YPIvZz7
 1W83IRiL/mzIr+bcVVWgcElr0ofIpPUce2Lb57+omotz7nOYHJZkl6hwByn4Y3plj/XB
 BW2g==
X-Gm-Message-State: AOAM5308LHtcqxCmC8sDynA60ml8pRgfbx30m5s0sumVx3WdfBt9LH2m
 bnGStizA+ZeBF5fGCMhFToctAg==
X-Google-Smtp-Source: ABdhPJwHxUUY4lGKVsqiOUP3sJUlzLR3B6vZT/UK1XW8MP0mTqQVy31cuAGQ9X/xwZh19F1G2h+FTA==
X-Received: by 2002:a5d:6392:: with SMTP id p18mr9492422wru.426.1614013157991; 
 Mon, 22 Feb 2021 08:59:17 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m24sm8867014wmc.18.2021.02.22.08.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 08:59:17 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 63E221FF7E;
 Mon, 22 Feb 2021 16:59:16 +0000 (GMT)
References: <20210221092449.7545-1-cfontana@suse.de>
 <80a645c4-866c-2791-ac9c-91118018a44c@linaro.org>
 <1ae56383-7664-c2df-9402-97844cfbeade@suse.de>
 <16621e3a-bf32-8032-501e-f1aa3c37aff4@linaro.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [RFC v1 00/38] arm cleanup experiment for kvm-only build
Date: Mon, 22 Feb 2021 16:57:32 +0000
In-reply-to: <16621e3a-bf32-8032-501e-f1aa3c37aff4@linaro.org>
Message-ID: <87mtvw5997.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 2/22/21 12:43 AM, Claudio Fontana wrote:
>> Regarding terminology, I think the mismatch is throughout the code right?
>
> Yes, e.g. the top-level softmmu/.
>
>
>> So many of the existing "softmmu" files and directories should actually =
be
>> called "system", or "sysemu" to match include/sysemu right?
> Yes, please.  Let's not add new mistakes.
>
>> Maybe it would be good to have clear documentation about this in devel/ =
to
>> use as a reference and end-goal, and then we could do a pass of the whole
>> code to fix the discrepancies in the use of the terms?
> I suppose.  Where do you suggest adding those couple of sentences?

I guess if we are formalising the build structure either in
docs/devel/build-system.rst or maybe CODING_STYLE.rst (which really
should be folded into the rest of the documents).

>
>
> r~


--=20
Alex Benn=C3=A9e

