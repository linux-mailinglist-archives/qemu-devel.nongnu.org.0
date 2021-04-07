Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 787DD35706F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 17:37:16 +0200 (CEST)
Received: from localhost ([::1]:48262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUAF0-0002nJ-4s
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 11:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUACt-0001w2-Hp
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 11:35:03 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUACr-00061a-T7
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 11:35:03 -0400
Received: by mail-wr1-x42e.google.com with SMTP id u11so6021088wrp.4
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 08:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=+FyU2FGZTs9R0gAMt3ibj98il7No1zRtvewyRmZGooI=;
 b=POgqlo3A81qiiVkJiBTqxAunlbsNl2U/IwO2Ydvg8XildmW5CrWBdBuTyRmjhpAypV
 ut6uMvPow/CJWRKrDhehLyVvGP2/nAEi5vw2IuP/mgORkTuMJIGvHZJnessKFEsmmOQW
 cCEzVvZdmGrhbejNiqdlJRUKNi9JISUN7nnGU1YkgH3PMsFhBxBaF5iqhORmrQpvlqpy
 XUxQcGWrx2FqviFcrrPc2I6HKisHD4xjhWxd6fTvecF5zA1/u4FCKnU5jwnwoJ7tH5QK
 0ic04eE0MzY90fFlVdMdnJK9s82IhzbVVxTGi/FdTFkt63ktOf1U2mVMdwXRED7j7M0f
 p6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=+FyU2FGZTs9R0gAMt3ibj98il7No1zRtvewyRmZGooI=;
 b=Qo3vWW38xrzahrT+ILZQoY2a+eHfWGqOkvtFT0M+aXhw2CHrvnDx+nvkYnZd5JZVwi
 arf2LHbxmsSmDzAWbeqKUtoJW3JSpr7/9ruQYrlSomIa6jQpHq2iytFna9uSvDIzhlEk
 ifjcOGc//jZWjSoMGdjK9irm0JbSABLVQE/iJ9RQYPGVUTWVkhTPi3fRqAbuHUObJnDd
 shdZ+8eYjZluNdPXsWTTkgviVsoJwI/JEnrq7hqleEGAqD31s0CWgxeF6vCAfHVp1deN
 zWgnHvS7P+HNBUYanfQC94zGVRKK1OGJFjMStAUXB+3QJs5FibRfDptMBSV3Ffawblrq
 2PwQ==
X-Gm-Message-State: AOAM5300GrP5HNkq1x1ZXGqLDVzMuiAGoJpLCNzZbOUITwM0uc+Ampmm
 thoTJAip1iLWODOEvkLQNKA92g==
X-Google-Smtp-Source: ABdhPJwpnitTcfDhti9lCHhCs5NmrsHk7lBoCdhj4Cy7LVLDHVqOKBIqxTDMJ+ddYRMVZwTSRHpGrw==
X-Received: by 2002:a5d:4710:: with SMTP id y16mr5220025wrq.344.1617809697664; 
 Wed, 07 Apr 2021 08:34:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v7sm9296931wme.47.2021.04.07.08.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 08:34:56 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A94DB1FF7E;
 Wed,  7 Apr 2021 16:34:55 +0100 (BST)
References: <20210406174031.64299-1-richard.henderson@linaro.org>
 <20210406174031.64299-3-richard.henderson@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 02/12] target/arm: Check PAGE_WRITE_ORG for MTE
 writeability
Date: Wed, 07 Apr 2021 16:34:49 +0100
In-reply-to: <20210406174031.64299-3-richard.henderson@linaro.org>
Message-ID: <87o8equmzk.fsf@linaro.org>
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> We can remove PAGE_WRITE when (internally) marking a page
> read-only because it contains translated code.
>
> This can be triggered by tests/tcg/aarch64/bti-2, after
> having serviced SIGILL trampolines on the stack.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

