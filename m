Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6496E0262
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 01:14:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmjee-0000Eq-3s; Wed, 12 Apr 2023 19:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@google.com>)
 id 1pmjec-0000EL-01
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 19:13:30 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <komlodi@google.com>)
 id 1pmjeZ-0008Gi-Vy
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 19:13:29 -0400
Received: by mail-qk1-x734.google.com with SMTP id ay7so11543579qkb.6
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 16:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1681341206; x=1683933206;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z/NeklWL+shqx2uEqMQYby+2WEoz7O4dguSnRYAkGEE=;
 b=TjdC1xJeVqiXXUmGo7PZBeayOv/88ijcl6Udv05l/ONjpt3JAOS8NXNiwuUJsSzP8y
 oB/AVeN4ZzLsv47x5/nXXa/gvXRAebjgpjE+87lMKj6yUjfUwMsJ7V8mqumbfQejWv3o
 GBvdUfIViY26YYcw/cQXSgkG9t2dMkJ1LtRE76pTLi6Ff7P3EpMw1/2WRmiGCMjV/hVP
 tdQ7SuO7t2jN3dUhJJoKeY4c/1fLhoBPK8lODNbIDZ/ZVTs2lgko6ThuzdWR/ny0qMwm
 sirsYIesvvb0wvjqlU0RTpkAM5n7/7co2+A9wtkv1gO8Qp92VJ1/uEvQHABpSqXR2GNr
 QAWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681341206; x=1683933206;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z/NeklWL+shqx2uEqMQYby+2WEoz7O4dguSnRYAkGEE=;
 b=i6dCYsRpNF2/H7tX7GVfQPlZNqEUQTkhwkWcDqTFxQ5y8Ip+OoPz9Ifu1m5M8r42Is
 m053KeeYjPv/enEd+Tyl55/ji4IcEFQ8sWkRGNMwpkki9nC+XrGcrE+Fl9LAyAgIL6Eg
 hHjLmgKvL5n/Qu4hNud1r4Z856AAcqcK79DhbQsb3iylst8dnuJGVr1p2Cvn6F3FnoJM
 0//OL+m8sO1lZRRq4cvQm3tXmKHuS6rpqhdDkkWOEgUDv4aFyKRnxwc+iR7h1hnDHUFC
 zpMubTbGmryo3btSh6+Tj7Wn67p60x/3pgm7WXACZmTO5ULFPCWNfYxOFf5REZE8C2UT
 ci8g==
X-Gm-Message-State: AAQBX9f1Ev8+vCfUNrnHu1bZ0jFjDV7Gz1dEP669tPA7W9IYbk/skcPU
 wncoNxWXvZhm5vHGQ8cSpcVSejqI0Nvhu0vGUwseUQ==
X-Google-Smtp-Source: AKy350ajWMFQdUnTl7/2096OEEKjiebKCUhALfWYVDdkSGo+LHxFmUfKhYJXvTGYtb0aH4Iyco3gqzzSKxf4prlkQwQ=
X-Received: by 2002:a05:620a:15ab:b0:745:6b06:8a0c with SMTP id
 f11-20020a05620a15ab00b007456b068a0cmr22413qkk.1.1681341206203; Wed, 12 Apr
 2023 16:13:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230331010131.1412571-1-komlodi@google.com>
 <20230331010131.1412571-11-komlodi@google.com>
 <4f19c8280191fe2ed1f8f7c25288e93de014b45c.camel@codeconstruct.com.au>
In-Reply-To: <4f19c8280191fe2ed1f8f7c25288e93de014b45c.camel@codeconstruct.com.au>
From: Joe Komlodi <komlodi@google.com>
Date: Wed, 12 Apr 2023 16:13:14 -0700
Message-ID: <CAGDLtxuz_vz7vvynuQE=GuXtpGt3eB_BsJwfW8CiPAtrwg6VzQ@mail.gmail.com>
Subject: Re: [PATCH 10/16] hw/i3c/aspeed_i3c: Add IBI handling
To: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: qemu-devel@nongnu.org, venture@google.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=komlodi@google.com; helo=mail-qk1-x734.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi jeremy,

On Tue, Apr 11, 2023 at 2:17=E2=80=AFAM Jeremy Kerr <jk@codeconstruct.com.a=
u> wrote:
>
> Hi Joe,
>
> > +static int aspeed_i3c_device_ibi_finish(I3CBus *bus)
> > +{
> > +    AspeedI3CDevice *s =3D ASPEED_I3C_DEVICE(bus->qbus.parent);
> > +    bool nack_and_disable_hj =3D ARRAY_FIELD_EX32(s->regs, DEVICE_CTRL=
,
> > +                                                HOT_JOIN_ACK_NACK_CTRL=
);
> > +    if (nack_and_disable_hj || s->ibi_data.send_direct_disec) {
> > +        aspeed_i3c_device_send_disec(s);
> > +    }
>
> Shouldn't this be conditional on the ibi being a HJ request? With this,
> I'm seeing the DISEC happen on *all* IBIs.

Good catch! Yep it should be on HJs only.
Will fix in v2 as well.

Thanks,
Joe

>
> Cheers,
>
>
> Jeremy
>

