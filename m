Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DD11DB8BF
	for <lists+qemu-devel@lfdr.de>; Wed, 20 May 2020 17:55:09 +0200 (CEST)
Received: from localhost ([::1]:53024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbR3k-0000FQ-DW
	for lists+qemu-devel@lfdr.de; Wed, 20 May 2020 11:55:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jbR17-0004iv-3Q
 for qemu-devel@nongnu.org; Wed, 20 May 2020 11:52:26 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:36752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jbR15-00016Q-Jn
 for qemu-devel@nongnu.org; Wed, 20 May 2020 11:52:24 -0400
Received: by mail-ej1-x62d.google.com with SMTP id z5so4481824ejb.3
 for <qemu-devel@nongnu.org>; Wed, 20 May 2020 08:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=62ZyJoZtqvVb+YSvUWP0BqmQxz7WBVnnr8bKhUSYceY=;
 b=ay92jhRm3J/LYXUeIwxclaTsIACQSGvSVMCXijQq9XMUv6qHmxGwEnwM56WRqovuDK
 +n/h6wssjISY/jCF4ow8EJWLdO+3KWuLIsZ/zkDBcGkFQU/1GkZrQN/mBLxj2hdfS7ZL
 BdXL59EsM09ZzhgT8o9btVFl1yjCz2Qfto8vqomcrlKCWeKjCnYsDiV3A0GW5C3px6Ut
 CqUPxfJvxYyv1TM91k+EJD9xKR9sv8JWf2OBPtrzWq7Ju+OVsEaycYWGGP+MQrqP/Ee5
 yCITEFwM2wl3e3Ycr7hZQ6evInrwqAAQr7kGif0n/IQ5yvQdpYJUusr+gW3GmyTXRdpO
 cNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=62ZyJoZtqvVb+YSvUWP0BqmQxz7WBVnnr8bKhUSYceY=;
 b=QHG5O20Mpg4RB/Vt99GDdH4SY6bxCWWzrNiVlKkq6I8g7oO/xCcDhtkA+gtkCScudk
 j/6CSk8wYxrFs09y64KX0rVNhsOE/HEnKrzlRhorogy2Z35+6yIROYExCFfA4cXyYnPX
 PAWGNAOVMxpwXv0XLantMay6Aas4ZdIPxN7Ltczg1TQ/iHOPyElUrfuHLXPrQUBxkDpr
 6+uQArya3Dnj7giMA01v07sjus2z8QMEag2Sg0FdYasYOA23+r//nNxBmt6ouZtbMJnh
 6+AZsAhGr+AIVquyjKxUCROT4XDE4RwdtZhBitG+Iip04lpi9rKlZxadW+2x24KJsH3m
 Fp7Q==
X-Gm-Message-State: AOAM531ZNoNHrDSkOX3M48V/Gad0eYlT/PoNlHRsaOdqKhXGuHtZqh66
 e4B/KtJb18jwZQ0bMZfqVe3yJA==
X-Google-Smtp-Source: ABdhPJwHopEeY72uuE00ITHgynZ4bf1onqlay3CsEr9Hm7hYZJ7eswyIYxB3g6kxF/L3zpkpYReNsg==
X-Received: by 2002:a17:906:64c:: with SMTP id
 t12mr4157170ejb.524.1589989941541; 
 Wed, 20 May 2020 08:52:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a15sm2211854ejj.104.2020.05.20.08.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 08:52:20 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 967911FF7E;
 Wed, 20 May 2020 16:52:19 +0100 (BST)
References: <20200519025355.4420-1-richard.henderson@linaro.org>
 <20200519025355.4420-11-richard.henderson@linaro.org>
User-agent: mu4e 1.4.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [RISU v2 10/17] Pass non-OK result back through siglongjmp
In-reply-to: <20200519025355.4420-11-richard.henderson@linaro.org>
Date: Wed, 20 May 2020 16:52:19 +0100
Message-ID: <877dx6hado.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Rather than doing some work in the signal handler and
> some work outside, move all of the non-resume work outside.
> This works because we arranged for RES_OK to be 0, which
> is the normal return from sigsetjmp.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

