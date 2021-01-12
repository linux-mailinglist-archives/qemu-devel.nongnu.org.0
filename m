Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9522F3344
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 15:54:07 +0100 (CET)
Received: from localhost ([::1]:54482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzL3e-00066m-PM
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 09:54:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzL2S-0004tn-GJ
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 09:52:52 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:43330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzL2P-0003XU-CI
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 09:52:52 -0500
Received: by mail-wr1-x42b.google.com with SMTP id y17so2757404wrr.10
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 06:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=xN4oyTmaVBXFHBkXbWQoXDdfaGr7J/UclJC+4K0IxrU=;
 b=US0h2s5EcFVW33+hIvuTNkmlOXtoGMRyKkA+4xyidx1TKsT0CftSKusDYnZsbvdzcq
 bv0QmVCelFJtSo42hEyhkHAG9EIxmZFS9N6Fg5yjH/q40jRt/zzKAc8pn3qEeBfB5qvJ
 hCcZ+P5+w1Eew4fELND0lvHfxeaQWTOrdPHchuwQNRlmb+rTRZPJQV0LFMJ/xXe2R3M1
 mkoGCrl96EDOmPDmDvqFnf2cabMkeuzOF9nepDMxt2wOSCMamPDSvbPaTo7ssrnS0u75
 LdReILS8JikY+HlwRq7rq/A1YAYnhZ/boOKxGRmMbMrH5qc79T46/KTZlMw2r45alKc3
 n+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=xN4oyTmaVBXFHBkXbWQoXDdfaGr7J/UclJC+4K0IxrU=;
 b=WmK9h3LSGejHPOSvlMnOaizUeUTJtQy4c4aS7hcSGvJfxIrjkIMU3w63YmhsjpwRAV
 1O4mMpodg4IJIcsi6KtU1WWyG0txhXsiKYwaoYQcADiKxUe/dZKpxr5y7l/pXlBPiGTo
 KQOwhEyNQXfI0BL5ia5JfXKT+9sGJvQcMXBCwNQbIt9+EcEVZ5t6INtoj5xuAuyMAHQ2
 LKaP10VOr0DbMm2TGPgDDFQWgVrkDCw86dv6Nu4CU/e0V1uOdWoIHCOrsXdi5EweiUmk
 XPpB63H2ufQbVikqDBWRztm6TKfYgdbikWUV/RHpd11CKYEyXzc85LdysDMjdpK8lDRb
 Y6Xg==
X-Gm-Message-State: AOAM533y5y17X8Ot9wMehTq9VEPAVDPnMo2YpWHokDOK+le8h75DE959
 6k8n0dBYvVlKOh21T/mZM7oWEg==
X-Google-Smtp-Source: ABdhPJxAHZw7lV+RCGOHjs6Ax7YgqqhTHdXxNGMuw1SKvPfYecvfv0JzhEtcPyhAJiIg8lEsTbF2cA==
X-Received: by 2002:a05:6000:90:: with SMTP id
 m16mr4788459wrx.165.1610463166796; 
 Tue, 12 Jan 2021 06:52:46 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u17sm4190012wmj.35.2021.01.12.06.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 06:52:45 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C83A71FF7E;
 Tue, 12 Jan 2021 14:52:44 +0000 (GMT)
References: <20201216160923.722894-1-stefanha@redhat.com>
 <20201216160923.722894-3-stefanha@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2 2/3] tracing: convert documentation to rST
Date: Tue, 12 Jan 2021 14:52:39 +0000
In-reply-to: <20201216160923.722894-3-stefanha@redhat.com>
Message-ID: <87mtxemclf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Stefan Hajnoczi <stefanha@redhat.com> writes:

> This is a simple rST conversion of the documentation.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

