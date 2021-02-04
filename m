Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF82830F607
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 16:20:31 +0100 (CET)
Received: from localhost ([::1]:60470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7gQo-0003TC-T1
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 10:20:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7gMY-0001XM-Pk
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:16:06 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7gMU-0008BP-Ov
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:16:06 -0500
Received: by mail-wr1-x42e.google.com with SMTP id d16so3892656wro.11
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 07:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=kLgQB7ewPQ9Th/jUmsNz1eeSB32sdvPp5ruZX1hnwcs=;
 b=j89ZTFE5f5WjIj54SsNWrNWW9OJlSK5SMo97tatRl4NOzceBEjPvrL+CwifFTuSkbQ
 TgJJrOD6MJgdj2I16N5uqPnDRbEbTv9FIBpHNPApibxe6UvrV6ZIQ1Hk0e0F/+cpWyUP
 DsHI53iW9JljeH76c8ovJme2gUhNf/CHnt5qzGq3fDb1Bwl3Szlv5m2uuizgR3bg11fP
 dzRfZGvcDhe3g0IVJ99wN0fMB7RLIqTq8RGk9c9sXuPf6LY1oegpb7PQgWXMmFnFMav6
 6tmO3L26DfqdrmznE9qEbyoIS+otN9LOtQrQtz9tUNFIpiH0aW/64CWPBH88eZ7vrcpa
 GiFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=kLgQB7ewPQ9Th/jUmsNz1eeSB32sdvPp5ruZX1hnwcs=;
 b=Ci+ofQ07pua66zA2cI4tSRDaeGqzWIA+VF3d0p++iaeGJ5+MB1exbjCHSd3LBny+6x
 990DBhQ0xJWFOnYr2O8de+IBjZ0HAEOcqOJovMyvHJm1M/bd0O4r/qnvyQ+25YEwoOzm
 /mPujzp1Fud2MDmrxV3a2OpfdHCJ5GZgmkg4KOwUW8VN3EDvRcq7/9cNQuRZWxGs5399
 9cPRQv/uY6VzxabJWUMkLpkYcc0VS6O6+3mozKILNBiRcVMXWErjyP0VUafXfWBSr3d9
 slTw5B7JhLiwrsWLxAbu7g+GSviWg2buGDjTNQPA6VjHUW0npbwCXjNG44ajH7K243vs
 iVkA==
X-Gm-Message-State: AOAM532Liu+4F8jPgY8v0CACJcfvpAj0y7bsxrMtKqtsUaKWw4tSig60
 K5Vs6rySTKZfrGpQZb3j+GjB2A==
X-Google-Smtp-Source: ABdhPJxjf1WOmT+gfUSeNFIIDWQrWUZlgNa8hkWrZN0BJYlpurZO/jqFBkY8WARb9N+O6P7Cx5bTfg==
X-Received: by 2002:adf:8b47:: with SMTP id v7mr9860390wra.133.1612451760147; 
 Thu, 04 Feb 2021 07:16:00 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l11sm8086191wrt.23.2021.02.04.07.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 07:15:59 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3EE2A1FF7E;
 Thu,  4 Feb 2021 15:15:58 +0000 (GMT)
References: <20210204014509.882821-1-richard.henderson@linaro.org>
 <20210204014509.882821-29-richard.henderson@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 28/93] tcg/tci: Use bool in tcg_out_ri*
Date: Thu, 04 Feb 2021 15:15:52 +0000
In-reply-to: <20210204014509.882821-29-richard.henderson@linaro.org>
Message-ID: <87im77q2xd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: sw@weilnetz.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> This is the intended behavior. Remove the assert on
> the specific value passed, which can now never be
> anything besides false/true (0/1).
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

