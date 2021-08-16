Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDA83EDDF8
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 21:38:36 +0200 (CEST)
Received: from localhost ([::1]:49178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFiRP-00030Z-3Q
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 15:38:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mFiQT-0002LP-UB
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 15:37:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mFiQQ-0002Oo-2m
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 15:37:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629142651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JeZH8MllqQdOwHHSTizb2K1J1u00tFh0j28qXTzPIBQ=;
 b=gaxlDwNnJrYhSc+IU56H2BILQAO3xsFp34dwildVg0xKi/oez2XaWl5QiJLLGdeK8bhF0K
 HuHNf0+DqWSw73JCnZGWgWZyfd0f2FdzQC1roE3wDzntd4umxvyCgZ7V3qhK+H61ts0S8w
 KM02Mn0SSa9UmcPlenF2D7sjX0sVnJY=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-8QcC9mRGNxWbDNe2yyy2cg-1; Mon, 16 Aug 2021 15:37:29 -0400
X-MC-Unique: 8QcC9mRGNxWbDNe2yyy2cg-1
Received: by mail-oi1-f198.google.com with SMTP id
 i18-20020aca2b120000b02902678052797bso6963065oik.13
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 12:37:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JeZH8MllqQdOwHHSTizb2K1J1u00tFh0j28qXTzPIBQ=;
 b=EdGqoqzNPYuCRriIqxd96M2faiNWHbaoq1s5Pgqj/p4J6g2ziZ5LA1fACa9X0p7bPk
 FzJBJn9uUKVeejM1dO73d4ICllS0Ys4Fj+xq+NORpmoKMOtfo2w/mmFP7QvyMxC+XWi/
 /tgtdLL0tJGhc9rG/9AcQIbA8EeuqmnztLEQ6FA4Q1Wf7N5rYtX5pKpPcxtbnD15s0vD
 9fTdz3lXS6Ix8QumqtjMlbrJJ/1OHUJDks4YscTgKYHk5TXeYK+PHIHN+bs2GEXeRsB0
 ymkgHi8r00FEeRLAIz0bZNvGDslbrxjhknJb9k2Ri3E7Hht+pv4rJSdkzbHP2mI3OBKd
 k7CA==
X-Gm-Message-State: AOAM532LEyma96dgxk5uO3TAIzcJWWKQ/xlBPJ/If9CxKo0l5/voEDrl
 K3BKI91pWbysPYdLfDJGTFv9yBl/TW238oO/m22SsycKO7K2LZnx+rAtOT/iTcv/wU3S+if2V8a
 PjrkHlKAn8lkAu7/sdxr1u6VVal1FbWw=
X-Received: by 2002:a05:6808:f94:: with SMTP id
 o20mr351338oiw.112.1629142648976; 
 Mon, 16 Aug 2021 12:37:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcUEfZZPbNxziAbXvMnSUnzNvHcKKRFWh8GF+hjainPJScosNkFxyDCvSRxum2Md+IgRLYh/6r7Pd4CDJDsbA=
X-Received: by 2002:a05:6808:f94:: with SMTP id
 o20mr351321oiw.112.1629142648872; 
 Mon, 16 Aug 2021 12:37:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210730201846.5147-1-niteesh.gs@gmail.com>
 <20210730201846.5147-8-niteesh.gs@gmail.com>
In-Reply-To: <20210730201846.5147-8-niteesh.gs@gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 16 Aug 2021 15:37:17 -0400
Message-ID: <CAFn=p-ahiZre_UVRLWH5rRbgHpNcDOHTMNuhsiR=kU=16t1afA@mail.gmail.com>
Subject: Re: [PATCH v3 07/13] python: add optional pygments dependency
To: G S Niteesh Babu <niteesh.gs@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000dff2bb05c9b2547c"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Kashyap Chamarthy <kchamart@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000dff2bb05c9b2547c
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 30, 2021 at 4:19 PM G S Niteesh Babu <niteesh.gs@gmail.com>
wrote:

> Added pygments as optional dependency for AQMP TUI.
> This is required for the upcoming syntax highlighting feature
> in AQMP TUI.
> The dependency has also been added in the devel optional group.
>
> Added mypy 'ignore_missing_imports' for pygments since it does
> not have any type stubs.
>
> Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
>

LGTM

Reviewed-by: John Snow <jsnow@redhat.com>

--000000000000dff2bb05c9b2547c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 30, 2021 at 4:19 PM G S N=
iteesh Babu &lt;<a href=3D"mailto:niteesh.gs@gmail.com">niteesh.gs@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Added pygments as optional dependency for AQMP TUI.<br>
This is required for the upcoming syntax highlighting feature<br>
in AQMP TUI.<br>
The dependency has also been added in the devel optional group.<br>
<br>
Added mypy &#39;ignore_missing_imports&#39; for pygments since it does<br>
not have any type stubs.<br>
<br>
Signed-off-by: G S Niteesh Babu &lt;<a href=3D"mailto:niteesh.gs@gmail.com"=
 target=3D"_blank">niteesh.gs@gmail.com</a>&gt;<br></blockquote><div><br></=
div><div>LGTM</div><div><br></div><div>Reviewed-by: John Snow &lt;<a href=
=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt;<br></div></div></div>

--000000000000dff2bb05c9b2547c--


