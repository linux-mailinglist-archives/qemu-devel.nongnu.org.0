Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 058BA3CA0C3
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 16:33:32 +0200 (CEST)
Received: from localhost ([::1]:57556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m42Qd-0002Aj-0i
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 10:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m42OV-00019K-Rj
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 10:31:22 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:46980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m42OU-0006r2-68
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 10:31:19 -0400
Received: by mail-io1-xd2e.google.com with SMTP id p186so6656497iod.13
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 07:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=InVyrsnS4xSE0ho42nbn0V7T3xKfd/8vP8i2Oz3QWR4=;
 b=kcOFc7EJg6vy2aCMIVZOqpfZ6AfCUDKMxP++Ii8mnZK4hdoOJTTz7ky1bbpybXDtuz
 2MhKVqt7LhksfibJRLw+AVJfnW09ki7j2QvbhqpstHq245EGDKHeVQKItYJrTUSkOCzW
 b4SnlU/I5k7/oXJ+EqJZLq9DE6QPpt0sErx3WUzaZ2HIoRsJ1DRrHgTO7p2C6g9Maz45
 9u3ZufPJUfBoeG6jfVz7GbQ27x9yzc90zc0heXw7IBNeas6nZ0lXCcMFkUGN3BfAW2Wg
 WxKiGVKXUECuMJYJRdiP0TBELbvgWEre4+C/1sGjv0+qbN0VldHc2HGdm163QLKexzRo
 R12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=InVyrsnS4xSE0ho42nbn0V7T3xKfd/8vP8i2Oz3QWR4=;
 b=Pf3Iv/vW646CRWNj3nuFhJcKMkhpSwLkbwjiIwGOvxcFHXscyi/RNmD26z5U7fVt8z
 q4PLZEssC8il7lawHUZbreb45XEtVSrQEoxER08Ej5xKIXOivvQougxBLiRZlhf27vlV
 e3IkGstOvADSc98CkrG94+T686pVi3VlwbLRoRfmoik3gam1yR9WvYLH9cjz0QOel74F
 6+NPOMCglu+/GWORiQw1QJbvVV8rSTx7Btz5ZB18NW3dufjjNBnmbUYeSTx4kGJnK+3I
 g19G2HR2Nw2nQnU2scUlQyYwttYXwc/cXKgm+0G0walc0xL6bBr34ChTJeY135XMY7EP
 aLrA==
X-Gm-Message-State: AOAM5314phzxKgnUU7t+KDwaVAI9qflYJYavJAOKYy/jTprxyc7N5aG5
 v0RJXGK1843+SzJzl9RkUE2LPgZFFWPSiGb9pgc=
X-Google-Smtp-Source: ABdhPJxg6Vchj0Cl2e6WhFkE4I9x0VaSCTz2kKfIX4Ap5YnKh7lSYHY3NIki02aWQkEdHCqe+pa1RlPlxBmaDKGVMRo=
X-Received: by 2002:a6b:4e02:: with SMTP id c2mr3472548iob.166.1626359477161; 
 Thu, 15 Jul 2021 07:31:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210714182056.25888-1-alex.bennee@linaro.org>
 <20210714182056.25888-21-alex.bennee@linaro.org>
In-Reply-To: <20210714182056.25888-21-alex.bennee@linaro.org>
From: Mahmoud Mandour <ma.mandourr@gmail.com>
Date: Thu, 15 Jul 2021 16:31:05 +0200
Message-ID: <CAD-LL6ju4f+v_dfqZ+wsjaS=J1HXfYGzWYgvXSHFQAu-nYALGA@mail.gmail.com>
Subject: Re: [PATCH v2 20/21] contrib/gitdm: add a new interns group-map for
 GSoC/Outreachy work
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000e9da5a05c72a5276"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=ma.mandourr@gmail.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?C=C3=A9sar_Belley?= <cesar.belley@lse.epita.fr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e9da5a05c72a5276
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 14, 2021 at 8:28 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

> It makes sense to put our various interns in a group so we can see the
> overall impact of GSoC and Outreachy on the project.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
> Cc: Mahmoud Mandour <ma.mandourr@gmail.com>
> Cc: C=C3=A9sar Belley <cesar.belley@lse.epita.fr>
> Message-Id: <20210714093638.21077-21-alex.bennee@linaro.org>
>

Reviewed-by: Mahmoud Mandour <ma.mandourr@gmail.com>

--000000000000e9da5a05c72a5276
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 14, 2021 at 8:28 PM Alex =
Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org" target=3D"_blank"=
>alex.bennee@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">It makes sense to put our various interns in a group=
 so we can see the<br>
overall impact of GSoC and Outreachy on the project.<br>
<br>
Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.or=
g" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
Cc: Ahmed Karaman &lt;<a href=3D"mailto:ahmedkhaledkaraman@gmail.com" targe=
t=3D"_blank">ahmedkhaledkaraman@gmail.com</a>&gt;<br>
Cc: Mahmoud Mandour &lt;<a href=3D"mailto:ma.mandourr@gmail.com" target=3D"=
_blank">ma.mandourr@gmail.com</a>&gt;<br>
Cc: C=C3=A9sar Belley &lt;<a href=3D"mailto:cesar.belley@lse.epita.fr" targ=
et=3D"_blank">cesar.belley@lse.epita.fr</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20210714093638.21077-21-alex.bennee@linar=
o.org" target=3D"_blank">20210714093638.21077-21-alex.bennee@linaro.org</a>=
&gt;<br></blockquote><div><br></div><div>Reviewed-by: Mahmoud Mandour &lt;<=
a href=3D"mailto:ma.mandourr@gmail.com" target=3D"_blank">ma.mandourr@gmail=
.com</a>&gt;</div></div></div>

--000000000000e9da5a05c72a5276--

