Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF853C8286
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 12:12:44 +0200 (CEST)
Received: from localhost ([::1]:37942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bsh-0004Uu-4J
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 06:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m3bm4-0003SH-RN
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 06:05:52 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:38911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m3bm1-0006zd-DT
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 06:05:52 -0400
Received: by mail-yb1-xb35.google.com with SMTP id r132so2271811yba.5
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 03:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GWBwiAZRI2vriIoSuLf120fPxj3bWOa9TCo6f7XSto0=;
 b=uI9s9YQa+ZW27UqINQThKm3eUeAYJ0vKdaJ/B+tCOO37wengz02IZTySWkDSNruhJG
 znxId5K/kh/xm7UWYGz8q/+/zsIrbRbQ2q+P0295BfK7EBSX9DVo55pyoDiiel69uTxt
 hfQ3rdo0Yq5LcO78K5Qkg5hW4ZQJb5J3IgFzNPxznF78SW5PY2NI5Rb94+c9iWYGDa5W
 OAeT6SvHHy+oMaPn4vXfynrGuk9B2dzCADzGn5C7OAwNe127Pis0mU25P509HdiEzdjb
 TDBG9opXQiA+fNcI4cKy3rPyi5qCrJylq4L5rgGhccpATpkICjlGaEiAxq8L/hSY/5b2
 vxVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GWBwiAZRI2vriIoSuLf120fPxj3bWOa9TCo6f7XSto0=;
 b=KlDBifGERZPhBl+WBJiV+hcH+rmp3hqBvUk1FhUhaQvG2f4p4CLFFTMwQ7w6i4wpmQ
 gKVfTjStR9fueBrxXS9Od6YlIcrEhDEawEkGfoqFX3p4oFm9bklFWxOEgvdn1CSBSxiM
 1lHdoTmD5s8pCwhFt0omvLb4oMX89mhF9vqpks2sKzEZ5boS0X+vU/ZKex7PnSwhMyqn
 BgbFpWIc0uoDKPUanZth1RJapgVppsEZbnaPXEB7lBKuFsW4/vyi6Y5QWdtG/qT2JlUN
 JoS9oBMkQ/r7f+lxN7iLo6+aetpmcNU+Wr8geLcnAObf3hNh9deieUfMK8E1FzLoqxvi
 WY5g==
X-Gm-Message-State: AOAM533uVW4LcB2Y9XG9kndNsW18HJQ4rzabNy7k/IVKQ8ig3fI11fEe
 +rWwxJZFvbHZMPB/EPbqomMxdrKjA4lx46vzfBk=
X-Google-Smtp-Source: ABdhPJyEB6nW5eNqiq+WXmzVl5LlI6+j8uLRqiafNUVRBGpv2XcVPlBrzsV4YBeaLnWjIER24b+KU6SAudND6t+UoWA=
X-Received: by 2002:a5b:504:: with SMTP id o4mr12263496ybp.332.1626257148415; 
 Wed, 14 Jul 2021 03:05:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210714093719.21429-1-alex.bennee@linaro.org>
 <20210714093719.21429-13-alex.bennee@linaro.org>
In-Reply-To: <20210714093719.21429-13-alex.bennee@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 14 Jul 2021 18:05:37 +0800
Message-ID: <CAEUhbmWGG74SFjmj0_m2iEiqJHragMyrEpG9zo26HkCL=Mnr-g@mail.gmail.com>
Subject: Re: [PATCH v1 12/21] contrib/gitdm: add domain-map/group-map for Wind
 River
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb35.google.com
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
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, Ruimei Yan <ruimei.yan@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

On Wed, Jul 14, 2021 at 5:59 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
> I've created a group-map as well as some windriver contributions have
> come via non-corporate email. Let me know if you want the
> contributions split.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Bin Meng <bin.meng@windriver.com>
> Cc: Ruimei Yan <ruimei.yan@windriver.com>
> Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> ---
>  contrib/gitdm/domain-map          | 1 +
>  contrib/gitdm/group-map-windriver | 6 ++++++
>  gitdm.config                      | 1 +
>  3 files changed, 8 insertions(+)
>  create mode 100644 contrib/gitdm/group-map-windriver
>

Thanks for the patch!

Philippe posted a patch some time ago but it was not applied.
http://patchwork.ozlabs.org/project/qemu-devel/patch/20201004180443.2035359=
-19-f4bug@amsat.org/

You may drop the group-map-windriver if this patch is going to be
picked up, as I replied to Philippe before. Thanks!

Regards,
Bin

