Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CEF30F66C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 16:36:09 +0100 (CET)
Received: from localhost ([::1]:58790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7gfw-0007h3-9U
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 10:36:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7geX-00072r-L3
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:34:42 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7geV-0008WV-9h
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:34:41 -0500
Received: by mail-wr1-x435.google.com with SMTP id 7so4080490wrz.0
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 07:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=kLgQB7ewPQ9Th/jUmsNz1eeSB32sdvPp5ruZX1hnwcs=;
 b=gzcazpYveoptIJCZwiBrIxqgj0xfQd7iaRiJAE+DSOxV0jqh9GIHWdip9eto/xO6X7
 wobcj6zP2eZ644hOusbsGrvd0EN/7VKJ47GJkNghl95Q+76wriUvKkyTZ1thu+GiKP8T
 rPp9v13XQLFn5qL/ggxqAqFMSC+mqR+WJp8doxxiT4I26gW0SaTHL0HDxb203eOrAY1X
 kKdAVlKF5i9v2KQY1ZZmecWjtGk/Lhlqll0DEZkymvDPJ+FcSzEzP9LewT6BZ82J43LH
 dD3W/QoW/Kd0uHTtXSo73EGSDcyPpgaUw+x3mZ7QzWtaZjA5D6lx6H5DyiP56y2u3tTW
 NRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=kLgQB7ewPQ9Th/jUmsNz1eeSB32sdvPp5ruZX1hnwcs=;
 b=t+7l1G1B61OmwKSXERaZjSVb7K/l9DpPJNT17KjqpvczLHnsAiu88TptPccM686xON
 J/VO6tdVQzq1jaP4GvM41g+wIUtJnb+h6Q4ibF0o8Qt6tNWsnPkfGEhVfpRMNRfgiZ/8
 iko3AoFsJrK/jqNnZy+zawWOxdTk/CR1PVrmTlBnoplhh0JvMDa7DgU6nwUD8KWdAm3q
 fLlvYdvH1qc6PVLE18dCy70hPwRy0ILQSHrDwKQXtX4mTbDP8NoBDJh/iv3tNrW5RlTV
 n6gpX2K3Pr+uN+cFn0gDcR5xiH+2gpszLO9gNqL4IIzAHwpH0CoWpynNJUkjVqTnnBPL
 z5NQ==
X-Gm-Message-State: AOAM533eHHAh3ysy+zo6bDS9A8zqKIHBlsYMaFP5xieX3Lh12vB8zFzc
 KlHFlXyNjDlUtbtKPf5TyKmnPA==
X-Google-Smtp-Source: ABdhPJzxbsFgnx+4hSGFzE+C0y1coVv+QGICMNJC0H1PhWzyFWEZQ5zCEnOlhzz07X+vFvSxxzm2jw==
X-Received: by 2002:adf:80c8:: with SMTP id 66mr10141318wrl.344.1612452877665; 
 Thu, 04 Feb 2021 07:34:37 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q20sm6362768wmc.14.2021.02.04.07.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 07:34:36 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 14C7A1FF7E;
 Thu,  4 Feb 2021 15:34:35 +0000 (GMT)
References: <20210204014509.882821-1-richard.henderson@linaro.org>
 <20210204014509.882821-29-richard.henderson@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 28/93] tcg/tci: Use bool in tcg_out_ri*
Date: Thu, 04 Feb 2021 15:11:01 +0000
In-reply-to: <20210204014509.882821-29-richard.henderson@linaro.org>
Message-ID: <87ft2bq22c.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: sw@weilnetz.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> This is the intended behavior. Remove the assert on
> the specific value passed, which can now never be
> anything besides false/true (0/1).
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

