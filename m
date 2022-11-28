Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEB963A6BF
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 12:07:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozbx2-0007GM-62; Mon, 28 Nov 2022 06:05:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ozbwz-0007GC-Hh
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 06:05:25 -0500
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ozbwx-00042L-Oj
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 06:05:25 -0500
Received: by mail-yb1-xb36.google.com with SMTP id z192so12841674yba.0
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 03:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=b9dcBLUx+oszkdb0HP4KdK1vgvD8Pq/EBICAw4M5JR4=;
 b=Re6yxv7UY/tSERp+4M4qyNim3OrGEr6m7WwA0PEZ5nARQ+k9yjJQDPXe2cSe9rP5FM
 SuwzO+GT5m1tyCeYIbRrk/tuVSu47vc9Rz1vqrJoJVtZfHPh1W+ucv1KCQAZw7AAMADi
 L5Xo6rW9yn2QdKq5rgJ7pEAz2Y+XrcnJ6OqhGAWHFdIbpMlSgePfpWyGpdiO8+vylYDV
 BvCLemnmW4YUvg95YJ/itrkpsotQmSFyNI6Bx9c/6mEdZ6otC8xRhkXpvBfxe9rStGw7
 MVXsKbvKlN+qwo63i1ArBlphMDYfUJVBwm4UvJnoCbuDKDlxKTSbpuUNtwdwmiMsey3X
 mv5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b9dcBLUx+oszkdb0HP4KdK1vgvD8Pq/EBICAw4M5JR4=;
 b=4zzU5IQL7mG/JIe17UDCa2AITUtxlyskEEW406kKyaRAwZD/orJc2qJcz4TLpCbxkh
 oD2AJBBcgrtzfWf4LSy6VAR8dtgPtaHBXEkva3JEbXvy40CP91dQnWzApglB9pO6uezk
 YZzs+s50Iqsq2+r/jmjrMSRBEbMZxbXj91ru2tW0CVSyxrX/8Ccmza8gOWNmP0+33/Cb
 Q0r1Ph39EPlXbFWHAFuuFM8AVfOfYlpQVfxkAdhppRq9HahNjCRxFilPh5BvHaV6l+L3
 t1dtBU6wSd9X4LQwg2ex8GBiNXPs7IzZG2AsbScDnn69HkstAyzMqkzX5n0l7GKlQ6AG
 705Q==
X-Gm-Message-State: ANoB5pmeY812sygnGMg0R3HiiRymwj3YWb5fgZLLBW4UiRh4das9PbVI
 ijgwlNZkLhZWEkwMfzc1pGsRXVIu4wh0u6bjUiA=
X-Google-Smtp-Source: AA0mqf7KnhihQKIhSTod3GEuuYtGEXhc/XuXMtyfVJG8JqWBLGnvLp/ibBBYfY2icVEJJmWsWx0JD2S8HiuYZUo3mxw=
X-Received: by 2002:a5b:f02:0:b0:6f7:6238:3c62 with SMTP id
 x2-20020a5b0f02000000b006f762383c62mr2064906ybr.209.1669633522719; Mon, 28
 Nov 2022 03:05:22 -0800 (PST)
MIME-Version: 1.0
References: <20221126152507.283271-1-sw@weilnetz.de>
 <20221128052856-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221128052856-mutt-send-email-mst@kernel.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 28 Nov 2022 06:05:12 -0500
Message-ID: <CAJSP0QVpyONQAQM7jChMJ64w=wc-_MdUjdaSRbBxqj7HiKccYA@mail.gmail.com>
Subject: Re: [PATCH v3 for-7.2 0/6] Add format attributes and fix format
 strings
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel <qemu-devel@nongnu.org>, 
 Laurent Vivier <laurent@vivier.eu>
Content-Type: multipart/alternative; boundary="00000000000006deee05ee85d980"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--00000000000006deee05ee85d980
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 28, 2022, 05:29 Michael S. Tsirkin <mst@redhat.com> wrote:

> On Sat, Nov 26, 2022 at 04:25:01PM +0100, Stefan Weil wrote:
> > v3:
> > - Fix description for patch 3
> > - Add patches 5 and 6
> >
> > The patches 3 and 5 still need reviews!
>
> Series:
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>
> Stefan you said you want to merge this?
>

Yes.

Stefan

>

--00000000000006deee05ee85d980
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Nov 28, 2022, 05:29 Michael S. Tsirkin &lt;<a =
href=3D"mailto:mst@redhat.com">mst@redhat.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">On Sat, Nov 26, 2022 at 04:25:01PM +0100, Stefan =
Weil wrote:<br>
&gt; v3:<br>
&gt; - Fix description for patch 3<br>
&gt; - Add patches 5 and 6<br>
&gt; <br>
&gt; The patches 3 and 5 still need reviews!<br>
<br>
Series:<br>
Reviewed-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">mst@redhat.com</a>&gt;<br>
<br>
Stefan you said you want to merge this?<br></blockquote></div></div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Yes.</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Stefan</div><div dir=3D"auto"><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--00000000000006deee05ee85d980--

