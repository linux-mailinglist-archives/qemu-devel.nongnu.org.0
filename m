Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBAB3A7C8D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 12:57:43 +0200 (CEST)
Received: from localhost ([::1]:57472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt6lK-0008Ho-GE
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 06:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lt6jp-0007U0-2D
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 06:56:09 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:36429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lt6jn-0008Kp-IA
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 06:56:08 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 h11-20020a05600c350bb02901b59c28e8b4so1465204wmq.1
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 03:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=jJrIdLC5F9Kw9ahZ4a7uOY8UxXzuGxz9diQISvkrW7I=;
 b=CC9xAO8fOrp5RcBhqgbg4iynWu+fg/VWwMuII+LJ6e3SmcjnG8sVTVK9h2UCsm2D/y
 EjOpfm+Dr1lYZguKfUHcbi86sEnMuI1IRe0iVvc1WwdjafJM9TyZT8s56c9cIn540ZRi
 lWiQj07fn1aD1K6sHniuv5N539hJU3655/jGQz+7lDf4Or2NbkB9/Dm+GllWSJeq2Z0d
 JgD9rmZwg/QeWxLHYHszsTcKZTCKKuzi5brBcQ3vL3if5l9dkHcPGk1FROoddfDInMMc
 i7tQfdXX097Ygbt1+EglMVSGRV/IWGurxJZnEOEMoIgid88YtYM4vBN0t2GqEsLFsSUz
 qPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:references:date:in-reply-to
 :message-id:user-agent:mime-version:content-transfer-encoding;
 bh=jJrIdLC5F9Kw9ahZ4a7uOY8UxXzuGxz9diQISvkrW7I=;
 b=dOfus2hYUZr5broZ7ORqV6NYsVI/z/4M5kewvEJ0LJInNJ0U2IpD/XX5lZsLDTUyTt
 AY3A83FrXuL4Ei+vH0KxQjla1Njdfni6WX9gr5Rvfs1CB2s9lLweLi3zVp+oW8OEm/me
 GvOdM6O5zmkaBa6bREbXDCg29OIJCtHh+n4g/pU2iOWNh10unDfDDDtGtsKuveOmGPMa
 DC0lwm2FruNChRN+8wPe0WOADZ7zMQrdHBs+rUMup2rsRsFEsO5YdLFvnGwA+KdkuuQ+
 H2Zz3b+1hDcYAWQumj+F45wJ9oTiT9EsK3KRx8eS7ZHM/68zVTmeZCd2Q32Kuq+7/Xl2
 2q+g==
X-Gm-Message-State: AOAM5321zPthCXK4ifMSjJigiFYqGAQSXug6rFC/2vWUvoDPKoTxWdSl
 XqrGa82NNEr1OmSioLqVSgjevQ==
X-Google-Smtp-Source: ABdhPJzODoA4Lw8YtSCA753ZXwka1vihEdwG0Tmww3vnNH7jxo3OHhHIOvdp2ia9COwcjlUvckXWaA==
X-Received: by 2002:a1c:cc17:: with SMTP id h23mr21773353wmb.129.1623754566026; 
 Tue, 15 Jun 2021 03:56:06 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x7sm19337654wre.8.2021.06.15.03.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 03:56:05 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7EDB11FF7E;
 Tue, 15 Jun 2021 11:56:04 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 4/8] util: Pass file+line to qemu_rec_mutex_unlock_impl
References: <20210614233143.1221879-1-richard.henderson@linaro.org>
 <20210614233143.1221879-5-richard.henderson@linaro.org>
Date: Tue, 15 Jun 2021 11:56:04 +0100
In-Reply-To: <20210614233143.1221879-5-richard.henderson@linaro.org> (Richard
 Henderson's message of "Mon, 14 Jun 2021 16:31:39 -0700")
Message-ID: <8735tjiegr.fsf@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
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
Cc: pbonzini@redhat.com, thuth@redhat.com, qemu-devel@nongnu.org,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Richard Henderson <richard.henderson@linaro.org> writes:

> Create macros for file+line expansion in qemu_rec_mutex_unlock
> like we have for qemu_mutex_unlock.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

