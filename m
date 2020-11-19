Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1514C2B9138
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 12:41:01 +0100 (CET)
Received: from localhost ([::1]:47578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfiJ8-0008SP-21
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 06:40:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kfiHd-0007pC-7K
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 06:39:25 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:52753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kfiHa-0005FR-Np
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 06:39:24 -0500
Received: by mail-wm1-x341.google.com with SMTP id 10so6875446wml.2
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 03:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=58Fd/Q8Lx5CT9MwOfjMhG823Rv6X9mzPNfv84/R4tDY=;
 b=hG1IoZNaNMX4fEBMV3ZCTojJD00CZQ7mMLfZkf+tw0HqI5RAjWQeRDk1a2hjabUvHT
 3kDNhaY/X4HJEdT3mgattOG8fGS9umk24wbApzKRcXeEhfRxthHzQcHQmRXMAGRhtcoN
 Z6dgL7ix002inRNd26ZtPoSOUFNCzRkl2I8Ga6x7m7PVVc94Sd5q/1ISL8je8MxJpt+M
 VP/mMVNeNFuyH29eHrcEjR29Tg5Jvq+SD61QQgBPwl5Dcve0dJiyeJYYR4DSzWneKKzK
 o9pXpnmrwxsSVRZX60y5QzxH6OmB1k/FGGBfmARwsK1eep/Xt2GqM37tS5oHNdFAnO4R
 dn8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=58Fd/Q8Lx5CT9MwOfjMhG823Rv6X9mzPNfv84/R4tDY=;
 b=kfyFpXFxytVNxky6pldidcc3f4+gcjTwMcxUS3waEMc9FswqUBYlpI6qmPw2yHgDye
 bNh8Wmj+KCgKEL8dx5Pzw/1i2BJi6SI4lA6h3nAjuUYEv7ZYRRyun/D7XQX5mWSZBDid
 xaY7bkoEZH6eUHoRcFwQd7FvkNCVHwBagN5BCI5DCyfWdSx7ZFSZDdNGDfT5iS5Sh/CO
 EHOlrWqRLR2aS1WVs2tc6SjYN4D26yja3kV0pyAdp3LA0Lkbm42oy86/vMFsGyUYxjGj
 ADWmMZNaTuKwgyErrEFvPkO09hgjWvrEIeSTOPFrr0dVskA9m9MyfCmRlUq2t/BSPzI9
 jAlA==
X-Gm-Message-State: AOAM5321CPPZEon5Z6rmxixGMklcFSRh3CtwYOJZp/qZzLOuF5emsi2A
 3Hhyv/BqtDiW9TMfywF/g1UD6Q==
X-Google-Smtp-Source: ABdhPJxGiDI3yD2/HbcpdYhz7GvZJ+eYIMbdSP8MQ7Tipp175laiw9xPu32U0MFj7TahcLvMze/Egg==
X-Received: by 2002:a1c:5605:: with SMTP id k5mr3837825wmb.99.1605785960997;
 Thu, 19 Nov 2020 03:39:20 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 35sm38391691wro.71.2020.11.19.03.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 03:39:19 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E03431FF7E;
 Thu, 19 Nov 2020 11:39:18 +0000 (GMT)
References: <20201116104216.439650-1-david.edmondson@oracle.com>
 <20201116104216.439650-4-david.edmondson@oracle.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: David Edmondson <david.edmondson@oracle.com>
Subject: Re: [RFC PATCH 3/5] hw/arm: Convert assertions about flash image
 size to error_report
In-reply-to: <20201116104216.439650-4-david.edmondson@oracle.com>
Date: Thu, 19 Nov 2020 11:39:18 +0000
Message-ID: <87ima1vamx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


David Edmondson <david.edmondson@oracle.com> writes:

> Rather than throwing an assertion, provide a more detailed report if a
> flash image is inappropriately sized or aligned.
>
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

