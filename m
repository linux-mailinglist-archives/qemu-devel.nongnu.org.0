Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A8E39A319
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 16:25:49 +0200 (CEST)
Received: from localhost ([::1]:48992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1looI8-0002al-Ff
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 10:25:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1looFe-0007q6-J1
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:23:14 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1looFc-0005tM-QQ
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:23:14 -0400
Received: by mail-wr1-x431.google.com with SMTP id z8so6015765wrp.12
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 07:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Nz9AkJylwqwYsGNp6IV0A7cidNC8Psg+sYMZTRQZB20=;
 b=dEuPvjPs20N2JkvxAk4JCWyQci299RmSCiJ/4HGK0pizG8gBuBqy4VgTdd301Zy0cz
 +dYM+OK1K361VIcLNoXaJ5x7NGb4P7XZECu/hpOUqLPniNjvQrwXrK4sSEA0YfPNUH4x
 xlysvIBv2vFQ1E6UlEtQK8+L8QTnIisrtQso3aIEgOAZnLJ81Cg7fC0KtULpJDML7Gl/
 2GozIIo5BJbS4Do/VvjRm5cFxppTvnmsle9ehcWVuY8K833OWQ2kz7CJ7OwUANFwhhqc
 waWVpfPMkDQrBpACvl81mzpZ3J+9K1fDoA/TsQVK/MVKYLvOAoKA8P+k8o9h2QUHvuW+
 ABXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Nz9AkJylwqwYsGNp6IV0A7cidNC8Psg+sYMZTRQZB20=;
 b=TK/jlBUir589PrPmwLpx/x26BBSmwctn1AVosfocbNHV7pEN1XyM7RufyMrU6tiGXT
 roi256wiE1jRGm8DqS1oKMms3BA5NUhl4xKMVHTw4IZ8gjtQosPAPnzV24g683pNkyVR
 /efSneP3pPlXiWFYWTjFKFkcUVyCRiiClMpM8IGP6/9Kay9YYo/9WubJESqqCEa6WMSG
 62TBbT7aL23+3/Zlxnr+AuMw5BKxvlcCnyPBtzZqZbOSoGsRnSA0rKxsj3GmITlvL1gf
 /JBBRwSGT9YiyMYRsA9Uov33w61/e1JuYF28INR4BFCEPBy/JSK44jVncnKZGjArHSrb
 n+Ag==
X-Gm-Message-State: AOAM5310xAJtb0WhBkf3bAM3wt3hyWZOCGRA2FQVugees19I+o2ysynl
 ppyqhMjve8iDScE4l1IY35df8Q==
X-Google-Smtp-Source: ABdhPJz9oIHwZHXEPMGZMuni0MobONpYSFlaj/wy5L8mQeFVcz+ccr37gRaBcKsEzZyX/H8ShWOONg==
X-Received: by 2002:adf:f748:: with SMTP id z8mr239600wrp.115.1622730191035;
 Thu, 03 Jun 2021 07:23:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o17sm3333137wrp.47.2021.06.03.07.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 07:23:09 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 226CA1FF7E;
 Thu,  3 Jun 2021 15:23:09 +0100 (BST)
References: <20210525150706.294968-1-richard.henderson@linaro.org>
 <20210525150706.294968-14-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 13/28] softfloat: Convert floatx80_add/sub to FloatParts
Date: Thu, 03 Jun 2021 15:23:04 +0100
In-reply-to: <20210525150706.294968-14-richard.henderson@linaro.org>
Message-ID: <877djb9gdu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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

> Since this is the first such, this includes all of the
> packing and unpacking routines as well.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

