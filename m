Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDD4306D3F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 07:04:17 +0100 (CET)
Received: from localhost ([::1]:58458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l50Pg-00026u-7Z
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 01:04:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leonid.bloch@gmail.com>)
 id 1l50Og-0001g0-Qc
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 01:03:14 -0500
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:39439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leonid.bloch@gmail.com>)
 id 1l50Od-0000Q0-Mq
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 01:03:14 -0500
Received: by mail-lj1-x22c.google.com with SMTP id u4so3403578ljh.6
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 22:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MFVrfshnxgLjhlKcT+sYfTI63f+zBsrCqNLwiXXyTuw=;
 b=ixCNYmCSnzzdeSypC3/ULAY6Wam9km6FbEXrTGJUa82O05VD1jLkNmoAHQ12b7Z38K
 7/3cK2reC/CDJNpDQwaF/r6w0tXJZu+WCw0Me0J0BBQZtJniVKGyhJTaAG6onLUBUiLS
 Thm+puWckddGOYSzF1M8miYMv1C9eZ9mJhCflNMvV2c0hLah3ogkkdQtRa5YXcaUBk3O
 mCdBQNw5AnmGaffXJjcTGbVmnwaKdk/l3Uej5X8LKOp2VWG/dcD1ZB70+ulKBgMp9CAY
 X7X6pLiPzWTFWCXhi13O5Z4YMbPIjXedQ6g1dA5GtLQMmT72IS9fIUSJ4VJQh0Olgzsf
 E7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MFVrfshnxgLjhlKcT+sYfTI63f+zBsrCqNLwiXXyTuw=;
 b=X2PYsTVxlO782dYHgtnIVUdNj1ltBYMIUoAdinUsM4jgQGGTMtry7ntbF8PXyZIBYC
 h2z+yPHzoszVhezUgb51W0/hsP0mOw7HhBsZHAscu2LQ/FkciaJouUG9UryYiuEaXDpa
 iy1wMCLyn7yVVlr9iEcTaCTP8+UB9I8ldyKLreZV8GrX/aNKs1kPkw3tYrpqX3N6Sk2i
 wWiEshYdmYiUy1FdK8wmm/EKsw4AsXAabdnPwBhMqzfrJ6O8N3KJhp2uENCpH5Iqghhr
 U8C99SoeQkh6yBzDuIqpacDTv6rqcBOFs50h5LMfBq2spX37ix7b1dlGE9qvL9E0m9yg
 LufQ==
X-Gm-Message-State: AOAM531XCLUuCyosWe1fmpuXozPcGUX8ji15GnZzET0ASte1huFrH0ro
 EFQS6syWoQcOzBcVG4EmntSA++ADDaqU3pXMqgo=
X-Google-Smtp-Source: ABdhPJwL2rGFzwMaiWEZa16bNVN6XQzKVsemYqYRgULULimOaS5j3xRrLBDgye9IT4UAB0q4kNbiMwVPXONZW/072Ro=
X-Received: by 2002:a2e:b522:: with SMTP id z2mr7091781ljm.137.1611813788451; 
 Wed, 27 Jan 2021 22:03:08 -0800 (PST)
MIME-Version: 1.0
References: <20210120205501.33918-1-lb.workbox@gmail.com>
 <b866c8ad-9336-5305-131d-5ccd63be2166@amsat.org>
 <CAOwCge0Qxh6hQiqrko=Mos3WM2jZXhirhCwxdq7N1Kg_e0H4Pw@mail.gmail.com>
 <20210126092549-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210126092549-mutt-send-email-mst@kernel.org>
From: Leonid Bloch <lb.workbox@gmail.com>
Date: Thu, 28 Jan 2021 08:02:57 +0200
Message-ID: <CAOwCge3waLMeTEd=i9POpQweka8xKVh3WzjnQLvOMzSZ1XK-2A@mail.gmail.com>
Subject: Re: [PATCH 0/4] Introduce a battery, AC adapter, and lid button
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=leonid.bloch@gmail.com; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 26, 2021 at 4:40 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> Poking at sysfs from QEMU poses a bunch of issues, for example,
> security, migration, etc. Running timers on the host is also not nice
> since it causes exits from VM ...
>
> So I agree, as a starting point let's just let user
> control the battery level through QMP.
>

Thanks for the review, Michael. Yep, I fully agree - indeed looking at
the host's battery is better to be left for the user, and QEMU should
just set what the guest sees. Will modify accordingly, and send a v2.

Cheers,
Leonid.

