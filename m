Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 738CF1DB91F
	for <lists+qemu-devel@lfdr.de>; Wed, 20 May 2020 18:16:07 +0200 (CEST)
Received: from localhost ([::1]:42838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbRO2-0007n8-HI
	for lists+qemu-devel@lfdr.de; Wed, 20 May 2020 12:16:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jbRMi-0006qr-Sw
 for qemu-devel@nongnu.org; Wed, 20 May 2020 12:14:44 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:44170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jbRMi-0006dJ-4p
 for qemu-devel@nongnu.org; Wed, 20 May 2020 12:14:44 -0400
Received: by mail-ed1-x534.google.com with SMTP id d24so3633625eds.11
 for <qemu-devel@nongnu.org>; Wed, 20 May 2020 09:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=A6McHMjUbDYLrNvZeNOspgA8RHxNqba5XUdwlTSatDA=;
 b=joLJYceP910ICiOBZVomGplUm0TqiU09MEJYxPOdm4MmRSeXnfYb6LHIV+t/QJkcCB
 O4CTwuyoYjzrOWhWk9JVweOPySUoKClphnJsy9sG/MIQIk5rgLpp8KHmxwBXT66J4Idy
 MXrJ+9DxeqVqPG13jJtk2ljMnpWX4RrzWTAgztrExqiRrOzoEp8o0/Mqrrn1bibLwbkk
 4rPRxH9eN43BS7JoNhx0KYrbf6g9ZYZxSmvolJCKAQVhtehwlijuJ7vFbwhWM10oIpGr
 ZHoUdFNQXFmb3DOj4qCWSliJu3Udi/viWaJvFH3sqacf7jfBdJGfRyqk5pXYjhCU84t0
 KjUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=A6McHMjUbDYLrNvZeNOspgA8RHxNqba5XUdwlTSatDA=;
 b=ilkCmYLLHoZGfultHQgGoXpdkTRKL95KdA+vCpEXN/T1tuNMKbIN3UvMi2pu3/d6Q4
 Omb1lLDhGEU6qOUKtLQIo8MfxiB2KlMwFocyFPkIlClQ++UTSYhYLIRJQrlKjVXcMqi6
 e+/q1BSri1Wpy5kuAmfUYAdQUsQbQjwlOjsHi+Ye3Ygjj1/MNWa/J4sSx+feB4zHIvcu
 ekmUgQscYUj7vJ6uEFi8DScO4qoj91zBbgI3AndZ0y6CagjofeLydBDViK+e3T1PsA7R
 jmm715SeoAe5geURYeSGojkHaeqtQje9B5EiNei3NiqZnabcQ3baSJZ8vdfD6/nw8vRq
 lFQg==
X-Gm-Message-State: AOAM531rRK+Y4xGYOuTN01j60kXkyR+m3RlpLr7TsTYqjYPCpV6QvvUZ
 wSX+vAKETWcx8LX/2eD7Jt/Rt3/YttY=
X-Google-Smtp-Source: ABdhPJy5JXCuErGgjb67O5iuEzL78bdhXLdf1Gpb+DUfIMMBeJKh9O4iN6iAjOVYlc++xhpkoKfZrA==
X-Received: by 2002:a05:6402:3076:: with SMTP id
 bs22mr4235288edb.161.1589991282650; 
 Wed, 20 May 2020 09:14:42 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a13sm2111867eds.6.2020.05.20.09.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 09:14:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9C7DA1FF7E;
 Wed, 20 May 2020 17:14:40 +0100 (BST)
References: <20200519025355.4420-1-richard.henderson@linaro.org>
 <20200519025355.4420-13-richard.henderson@linaro.org>
User-agent: mu4e 1.4.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [RISU v2 12/17] Simplify syncing with master
In-reply-to: <20200519025355.4420-13-richard.henderson@linaro.org>
Date: Wed, 20 May 2020 17:14:40 +0100
Message-ID: <871rneh9cf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x534.google.com
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

> Do not pass status like RES_BAD_IO from apprentice to master.
> This means that when master reports i/o error that we know it
> came from master; the apprentice will report its own i/o error.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

