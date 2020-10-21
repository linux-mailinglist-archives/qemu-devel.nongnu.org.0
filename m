Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F5C294B33
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 12:25:53 +0200 (CEST)
Received: from localhost ([::1]:53274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVBJY-0000QX-6w
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 06:25:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kVBHV-0008BN-7Q
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 06:23:45 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:38385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kVBHT-0005Kf-Eu
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 06:23:44 -0400
Received: by mail-wr1-x444.google.com with SMTP id n18so2435690wrs.5
 for <qemu-devel@nongnu.org>; Wed, 21 Oct 2020 03:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=Ad3LWd75S3nxO6z0r5GtDRKanQVJNgns2RHs/rm0bnk=;
 b=X/e8p8F/AvF3C72tJG+A2ZJI8VXUkpAoAi3nlzB6EEN6EGNVIV7OaXs+BD73ig3H6O
 ALWEGGDgFXBHslGjVx/cC77eOaGtBsq2YD5pzpUleXrijFKmJRRimga9idvShifajCjf
 7n3eH1tPo/xzJ7xcf/TrOH51AduHKr2OfmLfC93xgut1XSO6LZ5aGCdaBmNGPKNWptsX
 HZy7GvK70zBRPk9mPy9GPUOTtUIhXDmIA/0EmaLQlJTD+qhLn9IdgEaPhQTeVJnC5Uyk
 CgUP4j/4v11rFy5z2YiSKnnEuDxvdV/GfF8I6PN93Sm1RrTb9D7z7J2DlP4A9B8rbxLr
 IQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=Ad3LWd75S3nxO6z0r5GtDRKanQVJNgns2RHs/rm0bnk=;
 b=NM385oWEf/1Z6yglE+evm2JVfWz+X+icQZAbdTUJ1fHxhOJZMCNohkscNgJsUYcFID
 2snK+yKseO8EMm2/zaB914gQxGMNwDH+K4ESl2/bE0Em5PGOJUyR0fsaU7Zzqw7XLXbM
 3TBKe8NLYfjZBSpjn4nqU/VwOmfSTSD58k82WwL0bRjZK0shVTd+4rJoRedwNm0fF5Ki
 CRDASIvXLwwOvSi1LrTajqodyH0jVS28GrYGV1VrWi746tr13x7S9Szk7/AZZPAoV9PT
 Rz1jbo4oTYNjduzjoXb2MbABXVDi9FUc9putao69VAD9NLabdabjqZ4d6+QquG8g2Rtt
 3Y4Q==
X-Gm-Message-State: AOAM5321zaJkhJ0vKWVx+mKK0hFOKqqz6BQfYu3HZYSNJQwWGQ0E+gJq
 8N7XZqjX0Ts8P7yahZQAAiRJGg==
X-Google-Smtp-Source: ABdhPJyGhvrjz+FLCki86p3F//2mSvNkKxedLOF0Mqh7jjsqMYEXzDHJXj4R9mW+XQKwAjq/FSkxaw==
X-Received: by 2002:adf:8562:: with SMTP id 89mr3806387wrh.214.1603275821194; 
 Wed, 21 Oct 2020 03:23:41 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 30sm3201368wrs.84.2020.10.21.03.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 03:23:39 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AEF0D1FF7E;
 Wed, 21 Oct 2020 11:23:38 +0100 (BST)
References: <20201007161940.1478-1-ani@anisinha.ca>
User-agent: mu4e 1.5.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v2] Adding ani's email as an individual contributor
In-reply-to: <20201007161940.1478-1-ani@anisinha.ca>
Date: Wed, 21 Oct 2020 11:23:38 +0100
Message-ID: <87lffzx4gl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Ani Sinha <ani@anisinha.ca> writes:

> Ani is an individual contributor into qemu project. Adding my email into =
the
> correct file to reflect so.
>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

