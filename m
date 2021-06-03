Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA7339A3D7
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 16:59:45 +0200 (CEST)
Received: from localhost ([::1]:34842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loooy-0004lX-JP
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 10:59:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1loomp-0003Nl-6S
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:57:31 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:53973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1looml-0003kp-NR
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:57:30 -0400
Received: by mail-wm1-x330.google.com with SMTP id h3so3593453wmq.3
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 07:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=i3Rk8nKuEcGeOqlNXltIXtkABrp3ixNJfPYLvt4KV+s=;
 b=H1GWOF8ftJjJQkg2YuwfALDAHJXgCGoklTRLw83BWtobjQv9Ct4FcOKiQvfCIUtlmt
 tE8AJGpiEzkatB4tEUkLHx8HSR4UgbjAPWTCmvSUNLa504OU1TjCB6Dkh/cvRd7Zmbu6
 RpoVc2Alu0KRD9f5VnVHjNiQsebpl/nx4U5sxTABmElo8Gx95234dG4CYxa08cVjjO2S
 NbVjYkFBviLse/AGQcIKUIy+CmcTJdKmiUBouMJHpH50IcFeurasOtfXsN4byMsAVgCn
 +WlWenPRtssA0036IyIQ8//4ln98RhJo61kdxQzUpP25QmfzeRiu2TAqozmVk5holRRt
 SziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=i3Rk8nKuEcGeOqlNXltIXtkABrp3ixNJfPYLvt4KV+s=;
 b=WvUBUjYrzEpOoO7PxgegbbjebwI9kxAkrC+vvV06o5TrZVWvIjbQbNt1USq9qsZIHy
 9BSbVwuRsOdVRqzknDar6Dg8dAMR8il8vZdHgRT8zqkA/htFPCQURDLZUguJWiSw756q
 fNW21dijScFCUG85QxwsHJuaPJIgaFFfx1hzPWBa55KNV+y/3pPJn28ySElmk+CJyXun
 U5RqWOtrdSQmMMQbU5iY1XMeqhmP3DQOe7kcdgXS5enaJIKxw5OP4JZqw25RMR1gA8zo
 oY5nU7r0QYQsz0zVLJ33eMrjwVYEaiqE4lgvlkKaI7C0U0SbIL6yHYxHu0FLepsFDiZR
 fclg==
X-Gm-Message-State: AOAM533Oj3O/+kI0LhfHDWQFXmEtdm10tnKpROG+5BILYWuv+YdgxW/P
 /ZgmfHu2evfc3nYcxDQHsZyTbA==
X-Google-Smtp-Source: ABdhPJyQdtDIWv9lTOybdh/0ZYbZYumDVsE/ZWH241SPUt/SKlH5C/gUTCHMfdTJ4vpmjzV4w22Wgw==
X-Received: by 2002:a1c:f60f:: with SMTP id w15mr10530664wmc.5.1622732245936; 
 Thu, 03 Jun 2021 07:57:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g10sm3672948wrq.12.2021.06.03.07.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 07:57:25 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D14CE1FF7E;
 Thu,  3 Jun 2021 15:57:23 +0100 (BST)
References: <20210525150706.294968-1-richard.henderson@linaro.org>
 <20210525150706.294968-29-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 28/28] softfloat: Use hard-float for
 {u}int64_to_float{32,64}
Date: Thu, 03 Jun 2021 15:57:18 +0100
In-reply-to: <20210525150706.294968-29-richard.henderson@linaro.org>
Message-ID: <875yyv808c.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> For the normal case of no additional scaling, this reduces the
> profile contribution of int64_to_float64 to the testcase in the
> linked issue from 0.81% to 0.04%.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/134
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

