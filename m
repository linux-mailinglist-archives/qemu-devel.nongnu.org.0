Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 764B932D951
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 19:16:21 +0100 (CET)
Received: from localhost ([::1]:33194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHsWK-00016t-51
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 13:16:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHsUX-0000f2-3j
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 13:14:29 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:37033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHsUV-0002Tv-E4
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 13:14:28 -0500
Received: by mail-wm1-x334.google.com with SMTP id m1so10584583wml.2
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 10:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=jShEF6OJ0qsdOkUPCDGFFmcNCDIowiZS6GkyTuYmo8o=;
 b=xoEmCqJo9RmLQc1JLWOr0WfhftTRyJQjgqUN80t/cS5d79l9wHhJ/ZmhL2RIuPwxYc
 igpz813/HcPuFljDR1qlGUTora88ZeLkAmxHPiQcjcIjJoIof1zn+1PF1TDSvfx5zHZS
 w10Z4uR5uw2uHDcuLtedyqJS1tUTdRgtz49HxUv/79UIvM7+RGs3CJSEywPVnuWNq2A5
 kwkGN/VMchZF+4qYN2Cs9XSdhwmdgjh5ONgCPB3R4MacqP5LxP2mcrBqTWdB6PyYNjY+
 nj33CG6imjdwW8fmAMGrE76sf3UiwYBr/WLzfI0B3B7Skw6sn+thW1RVLWAaCjAhgV/1
 t2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=jShEF6OJ0qsdOkUPCDGFFmcNCDIowiZS6GkyTuYmo8o=;
 b=toro5wPlaED6F/rrhwf4oYY2A9KDfR3Iw195Xk6JDHSvlNwMBjCcEL9i1WN1yX9uMX
 qy5e37Yol+AgnvjxY0iS2lfD/5eWzRQknafPI4vFplAG0aYso2GfL3O3nbX5RE0CA6N9
 FBDrB1gpY7Aev0QdS/fea2XrrwdbP3aV2W5x1yneBA8fadg37a9Toi/Y4MG8VikAlndW
 ftfx7ryQuQpQV6bEZKbiOizUJZ7s1cnAtOb4HFtruKsdKPrI2UO5IcZj/jtetzIoAqzt
 YY8anRBxarZFOPhqAbVpdHIXIjNkdaWjtC0lmrb3xtNCIDOvcg/szNdQqIyYxUBXFpyF
 kPxQ==
X-Gm-Message-State: AOAM532osVPcnLgoOQtte3BIQ+azguiVM25CcGzYvvs6Ixd+i1AC2OuM
 SP9UYtRG8bwwpP30QVdoicxu1g==
X-Google-Smtp-Source: ABdhPJyH1tz8KW50odRf11yS+17ll3HqHSocjRcVqOmK36Mqg8F/xa8Jf4B1NOI17Cc/mHExWvt23Q==
X-Received: by 2002:a1c:32ca:: with SMTP id y193mr2470994wmy.56.1614881665784; 
 Thu, 04 Mar 2021 10:14:25 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g9sm106110wrp.14.2021.03.04.10.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 10:14:24 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 442AC1FF7E;
 Thu,  4 Mar 2021 18:14:23 +0000 (GMT)
References: <20210303145011.14547-1-alex.bennee@linaro.org>
 <20210303165554-mutt-send-email-mst@kernel.org>
 <YEEXhBClR6GRLDu6@stefanha-x1.localdomain>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2] vhost-user.rst: add clarifying language about
 protocol negotiation
Date: Thu, 04 Mar 2021 18:11:26 +0000
In-reply-to: <YEEXhBClR6GRLDu6@stefanha-x1.localdomain>
Message-ID: <87tupqg51c.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: Jiang Liu <gerry@linux.alibaba.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Stefan Hajnoczi <stefanha@redhat.com> writes:

> On Wed, Mar 03, 2021 at 05:01:05PM -0500, Michael S. Tsirkin wrote:
>> On Wed, Mar 03, 2021 at 02:50:11PM +0000, Alex Benn=C3=A9e wrote:
>> Also, are we sure it's ok to send the messages and then send
>> VHOST_USER_SET_FEATURES with VHOST_USER_F_PROTOCOL_FEATURES clear?
>> Looks more like a violation to me ...
>
> Looking again I agree it would be a violation to omit
> VHOST_USER_F_PROTOCOL_FEATURES in VHOST_USER_SET_FEATURES.
>
> Previously I only looked at VHOST_USER_SET_PROTOCOL_FEATURES where the
> spec says:
>
>   Only legal if feature bit ``VHOST_USER_F_PROTOCOL_FEATURES`` is present=
 in
>   ``VHOST_USER_GET_FEATURES``.
>
> So negotiation is *not* necessary for sending
> VHOST_USER_SET_PROTOCOL_FEATURES.
>
> However, I missed that other features *do* require negotiation of
> VHOST_USER_F_PROTOCOL_FEATURES according to the spec. For example:
>
>   If ``VHOST_USER_F_PROTOCOL_FEATURES`` has not been negotiated, the
>   ring is initialized in an enabled state.
>
> Now I think:
>
> 1. VHOST_USER_F_PROTOCOL_FEATURES *must* be included
>    VHOST_USER_SET_FEATURES if the master supports it.

So added by the master - still invisible to the guest?

>
> 2. VHOST_USER_SET_PROTOCOL_FEATURES does not require negotiation,
>    instead the master just needs to check that
>    VHOST_USER_F_PROTOCOL_FEATURES is included in the
>    VHOST_USER_GET_FEATURES reply. It's an exception.

OK I'm now thoroughly confused but I guess that's a good thing. However
if we make the changes to QEMU to honour this won't we break with
existing vhost-user receivers? We'll also need to track the state of a
SET_FEATURES has happened and then gate the sending of things like
reply_ack requests?

--=20
Alex Benn=C3=A9e

