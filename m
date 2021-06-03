Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9F2399DBA
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 11:28:43 +0200 (CEST)
Received: from localhost ([::1]:54500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lojec-0003oB-CL
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 05:28:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lojcx-00012y-RE
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:26:59 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:51981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lojcv-0007aq-Gd
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:26:59 -0400
Received: by mail-wm1-x330.google.com with SMTP id r13so2969323wmq.1
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 02:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=IPqXLJSSUg3BL7L0FtjPweA2f0DBFZotva99QP0l9JY=;
 b=s8Q/lZTaW4KB7fbQKhAOP09vXL+Sll4E2TK8X1Q+Sn+VRE+vPrX2tU98XcL58Tbnj4
 CFF4EA71+sypyL4AgOCrdx1D/gFvE7p9fSVOMlXBTzOQImv5OQc33qds2cNz54eZ+feK
 HVL7uKMrOzxBvOfgNsAA4s9zZ/bybAZoLIto06sgpFMnj87epfdlE+HJDkTwWk2ui9ID
 njsSuqiMSCEHicUHvzxJZl8NmrTizgS3Z6nAaVRAg8RRO+hMzCFh4JmvlQFW4KWBVLwK
 88JBmPgmP6VnZswPHbWsylRoiRhrbu1u4/oNXiRwGLMM6hdYRweerZtJHeJVot1X0gjM
 EFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=IPqXLJSSUg3BL7L0FtjPweA2f0DBFZotva99QP0l9JY=;
 b=sxVZetfL4laaXNPFOpqIXIUUPHEWNlNKtcneiKwG39anZffjWt1c63OZ5ZulV8Hstw
 83crQFUO/gswmjK9JF7jWqBSvEDimUVgOL8Q+AhZ3XD9HIGCY4FMf5+LJj6CpvTAqO9o
 KOO1GuGbKABOhVrbJkr/MZPr5zdOOIAyG7u2KNLAQYJRy6lsbuOUDGLRzoY9+P3MxoRu
 zm81ZFfOsc7i0iovkUCup1cvsHG02BSdv5DM5qu6O/2ucfbfLm4eZZaCVksUBB+/ht4c
 5wEMxIun6YoMH/7YoDIlsTHmifbHI6afNikMdbn+OrAumQ3uNjVHR5OFUMlsdkRtaBu8
 bRDA==
X-Gm-Message-State: AOAM532nfy6qgIeqVMsScRzDtIPvMHnCbmplR1zM/rt02skMfDkjetga
 YNk7UE0DS+ufdxUWl2jUuwUdlA==
X-Google-Smtp-Source: ABdhPJz25LDZirvWrmKdLmFLth0N6VwN1SiFpfBtXuG2Jy3S15PpU4a3/H+TGvoRAomfwCrNODOegg==
X-Received: by 2002:a1c:7c14:: with SMTP id x20mr7436299wmc.81.1622712413349; 
 Thu, 03 Jun 2021 02:26:53 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j14sm5202622wmi.32.2021.06.03.02.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 02:26:52 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D8E851FF7E;
 Thu,  3 Jun 2021 10:26:51 +0100 (BST)
References: <20210525150706.294968-1-richard.henderson@linaro.org>
 <20210525150706.294968-11-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 10/28] softfloat: Introduce Floatx80RoundPrec
Date: Thu, 03 Jun 2021 10:26:47 +0100
In-reply-to: <20210525150706.294968-11-richard.henderson@linaro.org>
Message-ID: <87fsxz9u3o.fsf@linaro.org>
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

> Use an enumeration instead of raw 32/64/80 values.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

