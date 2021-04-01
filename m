Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E2E3513E8
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 12:48:14 +0200 (CEST)
Received: from localhost ([::1]:38254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRus1-0006iU-FK
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 06:48:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRuo8-0002jV-CM
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:44:12 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRuny-0003me-EN
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:44:12 -0400
Received: by mail-wr1-x435.google.com with SMTP id c8so1312673wrq.11
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 03:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=8lWGvPnfnA9WMf85zTSDU63LKmYEzAXyqeRMPZlZ+ao=;
 b=eyzvq7UGnu3WpZjJI75gpug7PN65foPJ1KaXCJ/rWlvPmQNgSwHrGhx90fdKyfa+9y
 jC+KyBwlH7VdVBchcG+hKpCq/X1uCjHOdlw1f23rangIkLxudsTmJwatRQV2nHyZ66GJ
 YggN8TTUN5IqDXqzJEb5ycl0+4XZZmP2XB7YKo4Y6Q2j8aEU+leSzN1seYlcanrK3XID
 vXGHTE+UsuzUOJlhElNEQ8QE2NS6veUtFRs4QG2oZCRMsgYGElclZ8Fg5cdQ1GUHOnJg
 xzX5dbhTe4UyKSLObVw3+kzsGFUJXERL9hTbt4O/SYgSaHw3q5SV/qMwIV807wceVT9v
 3c6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=8lWGvPnfnA9WMf85zTSDU63LKmYEzAXyqeRMPZlZ+ao=;
 b=mg8p0ZBpcjDi9dF3D9UoOvyot7uQwfdFVHwdsSShgLTTfbr2oKFfoXXddWlSq9h/jR
 q2pr2J4CwPDpHk0E71JpYgsNMMRpax05nOxlLC+EOU0v+hJ8u9TF4Xom+qhjUy9uCA6G
 QFWcdFS29zKU0PTyDh+NzlDLwJToyhbnshp6PPxWLBHTXpVtTBuVCBSoDDQBvQ8BJaQj
 UzFXHpi2FJvuc2iiBw9dj/3wJZ3ilf3NtpAImgfEnba2+pYCSGQtBdqu9GN/CQeoS1JK
 QZ7VjSkF22jD5MAJxNScsNYn0+exQgBrbyqQ1dj0aqa8bIMFoxK8mm5z499LB6E/Ia8y
 LoBw==
X-Gm-Message-State: AOAM5314UdY1oz7KtVSiFq7P7LZcXTVpn0MQOrvBFm1uJqMdmSqX9fdF
 WkFhPGPj6/dJvU3ZIux1BYWxVw==
X-Google-Smtp-Source: ABdhPJyzHKCv0Nq0r6pOdSCtAQw3QSX/NFbdZcQ6Lva+qZZf0cJjjwguXSxaStNATvs9todMejSsng==
X-Received: by 2002:adf:f411:: with SMTP id g17mr8642454wro.22.1617273840120; 
 Thu, 01 Apr 2021 03:44:00 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h25sm9526272wml.32.2021.04.01.03.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 03:43:59 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 54BDB1FF7E;
 Thu,  1 Apr 2021 11:43:58 +0100 (BST)
References: <20210325144846.17520-1-hi@alyssa.is>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alyssa Ross <hi@alyssa.is>
Subject: Re: [PATCH RESEND] docs: clarify absence of set_features in vhost-user
Date: Thu, 01 Apr 2021 11:30:54 +0100
In-reply-to: <20210325144846.17520-1-hi@alyssa.is>
Message-ID: <87sg4a1dzl.fsf@linaro.org>
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
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alyssa Ross <hi@alyssa.is> writes:

> The previous wording was (at least to me) ambiguous about whether a
> backend should enable features immediately after they were set using
> VHOST_USER_SET_PROTOCOL_FEATURES, or wait for support for protocol
> features to be acknowledged if it hasn't been yet before enabling
> those features.
>
> This patch attempts to make it clearer that
> VHOST_USER_SET_PROTOCOL_FEATURES should immediately enable features,
> even if support for protocol features has not yet been acknowledged,
> while still also making clear that the frontend SHOULD acknowledge
> support for protocol features.
>
> Previous discussion begins here:
> <https://lore.kernel.org/qemu-devel/87sgd1ktx9.fsf@alyssa.is/>

I totally missed this when I posted a similar attempt at clarification:

  Subject: [PATCH v2] vhost-user.rst: add clarifying language about protoco=
l negotiation
  Date: Wed,  3 Mar 2021 14:50:11 +0000
  Message-Id: <20210303145011.14547-1-alex.bennee@linaro.org>

>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Alyssa Ross <hi@alyssa.is>
> ---
>  docs/interop/vhost-user.rst | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
> index d6085f7045..c42150331d 100644
> --- a/docs/interop/vhost-user.rst
> +++ b/docs/interop/vhost-user.rst
> @@ -871,9 +871,9 @@ Master message types
>    ``VHOST_USER_GET_FEATURES``.
>=20=20
>  .. Note::
> -   Slave that reported ``VHOST_USER_F_PROTOCOL_FEATURES`` must
> -   support this message even before ``VHOST_USER_SET_FEATURES`` was
> -   called.
> +   While QEMU should acknowledge ``VHOST_USER_F_PROTOCOL_FEATURES``, a
> +   backend must allow ``VHOST_USER_GET_PROTOCOL_FEATURES`` even if
> +   ``VHOST_USER_F_PROTOCOL_FEATURES`` has not been acknowledged yet.
>=20=20
>  ``VHOST_USER_SET_PROTOCOL_FEATURES``
>    :id: 16
> @@ -886,8 +886,12 @@ Master message types
>    ``VHOST_USER_GET_FEATURES``.
>=20=20
>  .. Note::
> -   Slave that reported ``VHOST_USER_F_PROTOCOL_FEATURES`` must support
> -   this message even before ``VHOST_USER_SET_FEATURES`` was called.
> +   While QEMU should acknowledge ``VHOST_USER_F_PROTOCOL_FEATURES``, a
> +   backend must allow ``VHOST_USER_SET_PROTOCOL_FEATURES`` even if
> +   ``VHOST_USER_F_PROTOCOL_FEATURES`` has not been acknowledged yet.
> +   The backend must not wait for ``VHOST_USER_SET_FEATURES`` before
> +   enabling protocol features requested with
> +   ``VHOST_USER_SET_PROTOCOL_FEATURES``.

I think this is perfectly fine clarification although I think there
might be a patch in flight which changes some of the master slave
terminology so with that resolved:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

However there is still the edge case of what happens after the vhost
pair have negotiated protocol features like REPLY_ACK should
VHOST_USER_F_PROTOCOL_FEATURES still be acknowledged by
VHOST_USER_SET_FEATURES.

Stefan's proposed wording which I incorporated in my patch made it clear
that VHOST_USER_F_PROTOCOL_FEATURES is never exposed to the guest by the
VMM due to it's UNUSED status. I would just like it explicit if it needs
to be preserved between the two sides of the VHOST_USER_*_FEATURES for
the negotiated protocol features to remain valid.

Perhaps you could incorporate some wording for that?

>=20=20
>  ``VHOST_USER_SET_OWNER``
>    :id: 3


--=20
Alex Benn=C3=A9e

