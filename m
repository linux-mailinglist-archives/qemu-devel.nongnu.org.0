Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5FA1CD4A8
	for <lists+qemu-devel@lfdr.de>; Mon, 11 May 2020 11:16:32 +0200 (CEST)
Received: from localhost ([::1]:45846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jY4Y3-0004Gd-Uz
	for lists+qemu-devel@lfdr.de; Mon, 11 May 2020 05:16:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jY4XH-0003qN-5V
 for qemu-devel@nongnu.org; Mon, 11 May 2020 05:15:43 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:37123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jY4XG-0002dO-Dq
 for qemu-devel@nongnu.org; Mon, 11 May 2020 05:15:42 -0400
Received: by mail-wr1-x444.google.com with SMTP id k1so9960449wrx.4
 for <qemu-devel@nongnu.org>; Mon, 11 May 2020 02:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=WjxZVCAiLdptEyaTsoQZM+WqRzmo2ixxOlT6YYiq5Ug=;
 b=OQYWSKwaD35BzmqB0adwTpDq/U2Z3TyEac3KYoaHPkdwmAXKtT86L2b4vK+CpFao2F
 rLxyx0AxbH3N/H+0YcGWwQqFCKv43dC1AyeFuLYZCAra+eSKZL1aTu1O712LZYMeYlVU
 ABpfw4SaHWkw2grTwSYB2qn6Eqg+/dejZZCC5ru77R0BG6LegleO3lPd/ff4CjoLsQNa
 HBsHSyKPM3vyKHFFY+OK2IEYvXvDbntobtCx+Y88u8KNw9dHOc+RIiz+quyyrulhnu3a
 uy4/RegtTrf/lzYgQ3YtqeivqyjY3zh4ieenL4CAVkeEasiV5mnxspN6eCDQUbKzVybp
 a1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=WjxZVCAiLdptEyaTsoQZM+WqRzmo2ixxOlT6YYiq5Ug=;
 b=a9MYaVhyA3y5BT3NBubGikGOuAFZYtPsdgbL3LyMs1xv6GrSRRKOilt9FtH2KRZBRs
 oF5AL0jdPLRoWTdVi7LevdEipPE9GJq35yMI6yHE3zDE1mBfNhzj56KtJWPI7PzM8KzN
 Qqu64tDnFMlpwWrOOBMZhe1F+ocvipoUsmd53I/E36ryrHHBrQma6JW2Ng0W16pjsyL9
 2u5yaxjUE9zqgDXlZkBX+pe7DE+4UhlXjX84qwQUhUaMiw+VliGwFtSm0JjMY3pevNvx
 WsErP7yPo0NZnEP1jRI1oMN4MjUEIpXgENnhg4YEVCnvMDfX7DTDKPi3SZyK3nvDy9jX
 jGzg==
X-Gm-Message-State: AGi0PuY37DSoXwkTEbXy3SxWqGRjhWqEpIM15I7H/0zjpr4e1HukHUGp
 NKTPM3FpYNRiquQzjTOgQpSeTgA0+4Q=
X-Google-Smtp-Source: APiQypLVRuuII1KeyAFc3yic2asWwpdyqGtpakUhv4YuNWOghdHH+n4+kHCb4BRc9fbGqZhoXE8Pog==
X-Received: by 2002:adf:b30f:: with SMTP id j15mr19128802wrd.394.1589188540857; 
 Mon, 11 May 2020 02:15:40 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r14sm1546175wmb.2.2020.05.11.02.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 02:15:39 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A5BCC1FF7E;
 Mon, 11 May 2020 10:15:38 +0100 (BST)
References: <20200312142728.12285-1-robert.foley@linaro.org>
 <20200312142728.12285-7-robert.foley@linaro.org>
User-agent: mu4e 1.4.4; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Robert Foley <robert.foley@linaro.org>
Subject: Re: [PATCH v4 06/10] tests/vm: allow wait_ssh() to specify command
In-reply-to: <20200312142728.12285-7-robert.foley@linaro.org>
Date: Mon, 11 May 2020 10:15:38 +0100
Message-ID: <87k11irfwl.fsf@linaro.org>
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
Cc: peter.puhov@linaro.org, philmd@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Robert Foley <robert.foley@linaro.org> writes:

> This allows for waiting for completion of arbitrary commands.
>
> Signed-off-by: Robert Foley <robert.foley@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
<snip>

--=20
Alex Benn=C3=A9e

