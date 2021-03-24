Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 607A33479B2
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 14:34:07 +0100 (CET)
Received: from localhost ([::1]:43234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP3e9-0005Kl-Uq
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 09:34:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lP3cs-0004wA-RG
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 09:32:46 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:34407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lP3cq-0006CZ-6C
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 09:32:46 -0400
Received: by mail-io1-xd34.google.com with SMTP id x16so21478097iob.1
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 06:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DZ5gW8rYPwvNvwecs5/t9kv2axinTfLAaH6qJr+Al5c=;
 b=qj8HzkSEVetS42nCChNUsj30NqyR9v/O9nIkaAByg5CgHq4n3SZpv7htfQ+IjKyCQo
 we/1W0hvyrzQM4BsQ2GEWLo2b+KSqZzymvy8xWtB7m/LjMXxo/wjQbPiWkTDJ3Fb0VR/
 +sfDm+GotZwebuAt8jxBfug17j3abrycEGDoxxCQi0PDZ58AMJc5SFVnw08Ftw4RlIpt
 SJP6CfGDPaGovj8GKT71rHbF/+gh/zFpZ3XYe22Wup9CQg1TQIGPtSz8uZ2Ogn25/YnI
 w7h5dFOo6F4dw03fzp5+J6Rwr0z3DAalz5sgkM/AQBK4L17nNayvEZ2mfoLvITNRfOri
 WSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DZ5gW8rYPwvNvwecs5/t9kv2axinTfLAaH6qJr+Al5c=;
 b=i3QYP94Ad6DMrpnknTwNBNDrT0WroaEXjyX6wnvOiqFQn18vjTljX4AAdeKbQAEyhM
 5oru2Mr5mHwzhVXGsq8JfF5bDagLKOuDboHbK6mOAc2+PNW//WBUyYJZcDah9hWACVBh
 ZX4U19TgHhh7VWfooPIdzZs3NJ84f3rn0lQs8rQwN044LGi/WQhAAZGHX7jQtOQbMly4
 F4cPAem9iBnGRVypcTeB1zce2JGPrVM4jzF6dGcBF1O/L2BTWQtn8irFTCVGHsEP4eYe
 lL7yJ2rWi+lLQBryci0s1ygEc74ZVm2g8diXBjbVnHRD4OPr7QcjLV5bhVfTjTwm+R8r
 XfiQ==
X-Gm-Message-State: AOAM531csg2sYspgFsr1cFP6A9fzm+27Ug9cWUI5YoA89BOufqWFC9eb
 2G0rQC40p1IVaykRKvz+GJYBh+o0JaARLc+RpRc=
X-Google-Smtp-Source: ABdhPJyud93Q0Jm1ybQ6Ko96ZfLwQDhShjbgjy0s3rC3xgC74HNpybH3Gzh2j8Ydwt4p+i7iJ0cFErd0Au3rJzi8D5c=
X-Received: by 2002:a05:6638:3791:: with SMTP id
 w17mr2818497jal.91.1616592763095; 
 Wed, 24 Mar 2021 06:32:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210319132527.3118-1-ma.mandourr@gmail.com>
 <20210319132527.3118-3-ma.mandourr@gmail.com>
 <YFnzsf2LgpUicPvH@stefanha-x1.localdomain>
 <YFs3RUPW81evLKTT@stefanha-x1.localdomain>
In-Reply-To: <YFs3RUPW81evLKTT@stefanha-x1.localdomain>
From: Mahmoud Mandour <ma.mandourr@gmail.com>
Date: Wed, 24 Mar 2021 15:32:32 +0200
Message-ID: <CAD-LL6hs-360h_PhvhFrxyEyXXmjfyLmwE_dvankjqYf3rPNXQ@mail.gmail.com>
Subject: Re: [PATCH 2/8] virtiofds: Changed allocations of iovec to GLib's
 functions
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000640c7405be4855bb"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=ma.mandourr@gmail.com; helo=mail-io1-xd34.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000640c7405be4855bb
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 24, 2021 at 2:57 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:

> Please use Reply-All on mailing list emails so that the mailing like and
> all other CC email addresses are included in the discussion.
>

 That's my bad, hopefully this won't happen again in the future.

Mahmoud

--000000000000640c7405be4855bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 24, 2021 at =
2:57 PM Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@gmail.com" target=3D=
"_blank">stefanha@gmail.com</a>&gt; wrote:</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
Please use Reply-All on mailing list emails so that the mailing like and<br=
>
all other CC email addresses are included in the discussion.<br></blockquot=
e><div dir=3D"rtl"><br></div><div>=C2=A0That&#39;s my bad, hopefully this w=
on&#39;t happen again in the future.=C2=A0</div><div><br></div><div>Mahmoud=
</div></div></div>
</div>

--000000000000640c7405be4855bb--

