Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD4337F699
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 13:18:31 +0200 (CEST)
Received: from localhost ([::1]:36962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh9MM-0001GX-1Y
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 07:18:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lh9LO-0000au-DJ
 for qemu-devel@nongnu.org; Thu, 13 May 2021 07:17:30 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:52098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lh9LL-0004Vr-Mp
 for qemu-devel@nongnu.org; Thu, 13 May 2021 07:17:30 -0400
Received: by mail-wm1-x332.google.com with SMTP id u133so2981059wmg.1
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 04:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=/aKooRIDiN0/TwKR6QRdl9zU/O1OtHf/hJRneODLqqc=;
 b=xgK6VdvmYKcrPecX3+zkAk9w2RQyd9j2bGlSudJXmDzd6hdxh57Womd04qzKQihVHq
 Sfpxbe8AgTUfjKAuZ99InR1B3LLIb0nsYiMVVrybFeeBwcdTg/WnyRM2rcNKYcDTthb4
 Nh4SNVqTUSZ2nJ+iWZkYEo3Hkxgx5clVRqt+xgpgQWKQLQ0GZDSsXYkvOYIG8Nwqe+xq
 bz2rU+ZdhSGKjI2udrkN2k6GzK6++eG/7yPnsAL7NiN0qU6bL6G3udfKwRKbcAu0FbTg
 6psIVlsry1JAPO1+VfylkJZS/5uxrvlJpUAoMyeDHU9H9VBvD8zl6DZVjMSOL5ABFARD
 +/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=/aKooRIDiN0/TwKR6QRdl9zU/O1OtHf/hJRneODLqqc=;
 b=f29mc01/WOC36xZVRTM2ddxvqLygHEVRr3Q2iW0qqkkTpvElC1ZlwjVnw+c6GnRYuM
 Tap92Zb88Y0cRdvN/FH1leugfTo+u5ygUnCtA5Aa233IW6UcQ4W30nAbG9mcCWSG6gCO
 euzlpmG3tuEdUt6cT1ok8mAMBrqU9wamrFU98KKWuNveuo4pUZ2ilZyohghIYtTdST+v
 W7LUNZ339qt+Py5vMerxmUzY4W47rA+WocQF9hvsbllsdC5FFfrcUmPRP22t7fny53Zh
 kf+nem5xik3c5htN9VSDatkalVGjS/Z0HhWXA8L2YBIKDxwVmuGX5wZV4vrDpnDrE899
 ktEg==
X-Gm-Message-State: AOAM5330yILTfjLpSW6K+SM7tMy+JOAvbW/vsw+XqtL17Xg4/5zvPIFd
 bcD1u0qGg9vtfe2MT7F0gfWVCQ==
X-Google-Smtp-Source: ABdhPJxLpb/A8kLhFs1hIQMSni5hiBfTohqYP7G4ivKCckTxr1CICkUu2DUgHZQzKpEnqxxK86HihQ==
X-Received: by 2002:a05:600c:19c8:: with SMTP id
 u8mr3269133wmq.25.1620904645574; 
 Thu, 13 May 2021 04:17:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k9sm239057wmk.5.2021.05.13.04.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 04:17:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B8FFE1FF7E;
 Thu, 13 May 2021 12:17:23 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-45-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 44/72] softfloat: Convert float-to-float conversions
 with float128
Date: Thu, 13 May 2021 12:17:19 +0100
In-reply-to: <20210508014802.892561-45-richard.henderson@linaro.org>
Message-ID: <87sg2qdgsc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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

> Introduce parts_float_to_float_widen and parts_float_to_float_narrow.
> Use them for float128_to_float{32,64} and float{32,64}_to_float128.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

