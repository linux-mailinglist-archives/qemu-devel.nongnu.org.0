Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C985470E5
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 03:19:09 +0200 (CEST)
Received: from localhost ([::1]:37458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzpmO-0005SG-HH
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 21:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liu.jaloo@gmail.com>)
 id 1nzpkM-0003wk-2j
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 21:17:02 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:45902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liu.jaloo@gmail.com>)
 id 1nzpkK-00066U-JO
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 21:17:01 -0400
Received: by mail-pl1-x631.google.com with SMTP id q18so597320pln.12
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 18:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KufhUy1jdQmJ2pdSDzhiiEWuTNcFIEkJ+gAnNI8sI9Q=;
 b=NrQoOfsPDMkTpePIzoHCl09wgYDyqlMyYD5PA7QGhRos+jxEBxt4hDxPWnJ/43oYsq
 qx9YLM5RYrxOuX+saMviSOk0tRtfJJWPvfyYLBm0e5io1CJhVeYCOAJMztVwDOgSsEPk
 6VUxw1cvBAvIPSngwOvejK4Ntu/n+LKBmDrKRmd8mDCm+y0JXyFVEYGuOze1qbvvFYgh
 EccTYQso2qNT8zC2U35srQj+ZhF0+/qkciXOf/AvVpWzqrmXYX0IDL4h+M89CHCWSwKU
 E2y7uYw2afsfp7/MnwEBOmIMZ0eX8jFs2qNCJ1JlGThcszKzlSqPU3WbTOFSXeOdg3eQ
 5PTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KufhUy1jdQmJ2pdSDzhiiEWuTNcFIEkJ+gAnNI8sI9Q=;
 b=cfsPDgSRFnHMBXnXNcRAwjt5peye2SK/q57/pPZLO8pYUot6JLbc+2AYpJ8AMq2hKA
 orp9qLWqtYnnFcepkgLiPBZoYYhuMBvsYqFVIKTbBeiQrm3BNbdWeQxT32sbKdbdYQcH
 u9b87l8+k7K4/Q5gfuU25oR74tXKZ0J266Xk7Z2xd6oL/CZ71lnvLfvvmIUI6UktW6U4
 RlgBqNVxYCDUmt3OOPPLgrDL6gMJZjr79s9/KkUgQKBUOacSGGnBf29caU30dSqcnW/7
 EQugf7rVr442eYC6+OS7T4KQ1aZK1tFe2qC4eMMXxkkNf/TKO+0ikh2C35tee1+ctjEB
 RERA==
X-Gm-Message-State: AOAM5330Rq7dJoPPa+Hx55AOqICfeWHWme5ICn+g7LmWn711A0BqzdqS
 YYM5OEZVaLHL93jSFc33FM+qogQA68ZvZngNew==
X-Google-Smtp-Source: ABdhPJxF07TGdLWcyZFKLvRD86Xyh5mOYl7i1CjY68vOgUE0DlxGPbO7KOrv3jwGqkPatTzKZMIcLtBrKJbDBVzQpnU=
X-Received: by 2002:a17:90b:3ece:b0:1e8:90be:4cda with SMTP id
 rm14-20020a17090b3ece00b001e890be4cdamr2573271pjb.67.1654910218299; Fri, 10
 Jun 2022 18:16:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAOYM0N0sA-H5G0GjED_YHHrHyLJ6vy7+y+jB5-s8J=kAH+eogQ@mail.gmail.com>
 <3e8331e3-c1e8-5f11-81c5-c9b3481d1aaa@redhat.com>
In-Reply-To: <3e8331e3-c1e8-5f11-81c5-c9b3481d1aaa@redhat.com>
From: Liu Jaloo <liu.jaloo@gmail.com>
Date: Sat, 11 Jun 2022 09:16:47 +0800
Message-ID: <CAOYM0N0qF3Gt--bKRzT2_JKytJAkqb9y7ocbeeV5XaYAsqYvUg@mail.gmail.com>
Subject: Re: about QOP
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000b26fc305e121cfde"
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=liu.jaloo@gmail.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b26fc305e121cfde
Content-Type: text/plain; charset="UTF-8"

Thanks!
maybe QOP stands for QEMU OPs? that's maybe.

On Fri, Jun 10, 2022 at 6:31 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 6/10/22 04:01, Liu Jaloo wrote:
> > Dear Paul Brook:
> > in qemu/tcg/README:
> > "
> > ...
> > QOP code generator written by Paul Brook.
> > ...
> > "
> >
> > Is there some text about QOP? or basically what QOP stands for?
> >
> > I can't find out anything about QOP from Google. thanks.
>
>
> https://qemu-devel.nongnu.narkive.com/bCtjCaPs/hand-written-code-generator-2
> is what I could find, but the server is not active anymore.
>
> Paolo
>

--000000000000b26fc305e121cfde
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks! <br></div><div>maybe QOP stands for QEMU OPs?=
 that&#39;s maybe.<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Jun 10, 2022 at 6:31 PM Paolo Bonzini=
 &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 6/10/22 0=
4:01, Liu Jaloo wrote:<br>
&gt; Dear Paul Brook:<br>
&gt; in qemu/tcg/README:<br>
&gt; &quot;<br>
&gt; ...<br>
&gt; QOP code generator written by Paul Brook.<br>
&gt; ...<br>
&gt; &quot;<br>
&gt; <br>
&gt; Is there some text about QOP? or basically what QOP stands for?<br>
&gt; <br>
&gt; I can&#39;t find out anything about QOP from Google. thanks.<br>
<br>
<a href=3D"https://qemu-devel.nongnu.narkive.com/bCtjCaPs/hand-written-code=
-generator-2" rel=3D"noreferrer" target=3D"_blank">https://qemu-devel.nongn=
u.narkive.com/bCtjCaPs/hand-written-code-generator-2</a> <br>
is what I could find, but the server is not active anymore.<br>
<br>
Paolo<br>
</blockquote></div>

--000000000000b26fc305e121cfde--

