Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA6B2DC6AC
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 19:42:44 +0100 (CET)
Received: from localhost ([::1]:50776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpbl5-0001CW-MP
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 13:42:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpbTx-0000c2-ET
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 13:25:01 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:43417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpbTu-0000Xn-Fy
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 13:25:01 -0500
Received: by mail-wr1-x42c.google.com with SMTP id y17so24106875wrr.10
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 10:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=xdDPmj1W2fYCoFOzDxIKfVwRWg0qBK/iaWe1CDAT2vw=;
 b=i2n6jkfmFt2uGWd9dM2McyCC47DoITkI748NhEoa0QBtEMyvDOv1pQF2Ddd+aptq4m
 AMWJ4zO63E2Cc4FJAGv7UWqU1FfOi3m32CitsFBgaMxql5jNC19fn2SUXYQ3iN+ziDUP
 KDI7dBJOrxgMMnxnnyOCkh2W9tPHyQ8k1yyt4C+9wgIROTVeqr1h7ySgcHUekb8JYO4F
 0sWQ44baHEfROEuNLny5wjX/HqDVnuEcI0cu8OUIr3cNRnfso+KMTBgilyQqqg8zwInY
 jpN7moM9D7VQZ4GOQfv5v5AVQTR1uNDR2HZKRRq096t7hGhACIACfRH1NYIfFMZV7AWV
 DjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=xdDPmj1W2fYCoFOzDxIKfVwRWg0qBK/iaWe1CDAT2vw=;
 b=g+W3MCjp56SgwXk2gu5bztEhaDrRFIKy6cf/OPCcsk7UQnG40fJk+wPCGAam5SF8GY
 e4d6FHjYXil5IaP7zt9iu3hqDKdeG0jJOMS3uPkUYMz+hT9yZnsJ0qjHNU7iB9sy69HL
 48CNT3yldaTZ7m4SGIOwRv9TAe+jzl/D15oXLHbNYd5ePcIJtHOF9b72WfnsduC5Hrek
 NO2rZgKhUnr+pZM0K130CRaX5QkGfU/AbhSD3TPR2w7v5A+RiAR38XKCd7/XXaKrn2Qc
 j+Bmyi7mHoh4nD/52xs8KKtxCEeMRDMloepF1rT47xE9S9zYq4DUK8DocLzbZvPyUkmd
 deKg==
X-Gm-Message-State: AOAM530rqZ6QwNZiXAzXhL5GK4kjEiND/Lh6wCQaSdcP/21jj8qMpm6/
 D+6PwmgCkwGrZO5DLTthpoSX+Q==
X-Google-Smtp-Source: ABdhPJxiF5rSlYjSBsaVYMXUUep3gTEFUtt8KFrMbi9WHGjEi23VQGme8cDMpQ/jiwD0cJINZH3ljw==
X-Received: by 2002:a05:6000:1d1:: with SMTP id
 t17mr40771009wrx.164.1608143096770; 
 Wed, 16 Dec 2020 10:24:56 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j2sm4220543wrt.35.2020.12.16.10.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 10:24:55 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E662E1FF7E;
 Wed, 16 Dec 2020 18:24:54 +0000 (GMT)
References: <20201216164827.24457-1-alex.bennee@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: Re: [PULL 00/11] testing and configure updates
Date: Wed, 16 Dec 2020 18:23:58 +0000
In-reply-to: <20201216164827.24457-1-alex.bennee@linaro.org>
Message-ID: <87ft45sj61.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> The following changes since commit af3f37319cb1e1ca0c42842ecdbd1bcfc64a4b=
6f:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream'=
 into staging (2020-12-15 21:24:31 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/stsquad/qemu.git tags/pull-testing-161220-1
>
<snip>
>   - hotfix for centos8 powertools repo

As you have noted this requires the cached copy to be deleted. I'm not
sure if it's worth handling that in code or if you just do that manually
before you merge?

--=20
Alex Benn=C3=A9e

