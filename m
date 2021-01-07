Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D15212ED770
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 20:26:49 +0100 (CET)
Received: from localhost ([::1]:57500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxavo-0001Dk-KS
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 14:26:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxatI-0000iw-PF
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 14:24:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxatD-00085N-Kk
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 14:24:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610047445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mp922RAgz5QDJt81aktAF28VKWmVRZr6j5H60fQK2r0=;
 b=cqwJ3rJA/x/FvA0pz80cRLYif+KVxS1poKq2sI1KnL77hGebq8kmIp7eyT8LSTXmHUsJ5c
 sAnsRUEZe+IyUdABijwtlF7zc8wA/VEMz8TWiQrHM1asozrkX9TaUR9eUkroZjPAHZ8p8J
 N+7ScXBwH7ucAuPCRKsQT9cQULw0DWk=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-_yUxuvEwOomItPuTfxYNsA-1; Thu, 07 Jan 2021 14:24:03 -0500
X-MC-Unique: _yUxuvEwOomItPuTfxYNsA-1
Received: by mail-pl1-f200.google.com with SMTP id h23so4615447plr.13
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 11:24:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mp922RAgz5QDJt81aktAF28VKWmVRZr6j5H60fQK2r0=;
 b=Vyso+c5VXBZlLjuXm+4y27mKEE4rmNirZeFmJyXML3hAV+Nb4kioKwcNxUIm85mENW
 HbTLTc6/MhsOn9fceq72kSEc58gCDj+2qilmLGIRH/57oBn8FR1iS5rVeLWZ5OvMKrb5
 jhDUPxiSJFSnPfO5vJNd5lA4MPyYnKWeMCrhbMXVNolOqhWXSv6sv29Q6j47BB7Bo6WF
 C4wDPp5JeODZ0MNgs0YiuudkH6MLurSKWyDOrsEw98MKKcETj0fBisTjRwkQJ3zlLe9V
 C/z2f9rSp1usNUhq70RbCe6YCrD11DQvyBfgeMOuqWAY5ap1TtXAofnYaO8DiiHJj5nB
 9DdQ==
X-Gm-Message-State: AOAM532fba1xojPUryrZeZfkQHJa8MQr2kJp9Wiy18pe05BZsoI7IyCm
 lWxN4dlev7uE0EpYSCH8ZaKSwiBub1lJGeVF9QiiA17cBZM+Gb0rCWMoALoH5M0l0prC3p3h5VN
 ho+YBMdm6cpluVt8KSn6EGq4SGPULFzU=
X-Received: by 2002:a17:902:6903:b029:da:f458:798c with SMTP id
 j3-20020a1709026903b02900daf458798cmr360793plk.68.1610047441954; 
 Thu, 07 Jan 2021 11:24:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw1Vn6mAzVifcqPwgQPnc98PF/knxFWQiTIn373mATy2LoMATcbuvEyC/6oszBz3x1KiNrUt4ME5ixAEaOZCXM=
X-Received: by 2002:a17:902:6903:b029:da:f458:798c with SMTP id
 j3-20020a1709026903b02900daf458798cmr360775plk.68.1610047441659; Thu, 07 Jan
 2021 11:24:01 -0800 (PST)
MIME-Version: 1.0
References: <20210107171719.477856-1-pbonzini@redhat.com>
 <20210107182812.GI1029501@redhat.com>
 <dff4499e-eb4d-f96b-5f82-51352561d231@redhat.com>
In-Reply-To: <dff4499e-eb4d-f96b-5f82-51352561d231@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 7 Jan 2021 20:23:49 +0100
Message-ID: <CABgObfZt-8gG3c4WTZqd0Ls0VEe43MFc_mFuykoZvDP2ZGu0gA@mail.gmail.com>
Subject: Re: [RFC PATCH] ci: ensure that all jobs use a shallow clone
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000d4fdc505b85461d3"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d4fdc505b85461d3
Content-Type: text/plain; charset="UTF-8"

Il gio 7 gen 2021, 20:05 Thomas Huth <thuth@redhat.com> ha scritto:

> on travis-ci.com you can
> only get free CI minutes for non-sponsored FOSS projects.
> So let's simply not worry about Travis-CI anymore.
>
> Maybe we could rather disable shippable now that we support the cross
> container builds on gitlab-ci, too?
>

With pleasure, starting this discussion was an intended possible side
effect of the patch. :)

The main issue with Travis is the non-x86 builders, which have no
alternative yet.

Paolo


>   Thomas
>
>

--000000000000d4fdc505b85461d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il gio 7 gen 2021, 20:05 Thomas Huth &lt;<a href=3D"ma=
ilto:thuth@redhat.com" target=3D"_blank" rel=3D"noreferrer">thuth@redhat.co=
m</a>&gt; ha scritto:</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">on <a href=3D"htt=
p://travis-ci.com" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blan=
k">travis-ci.com</a> you can <br>
only get free CI minutes for non-sponsored FOSS projects.<br>
So let&#39;s simply not worry about Travis-CI anymore.<br>
<br>Maybe we could rather disable shippable now that we support the cross <=
br>
container builds on gitlab-ci, too?<br></blockquote></div></div><div dir=3D=
"auto"><br></div><div dir=3D"auto">With pleasure, starting this discussion =
was an intended possible side effect of the patch. :)</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">The main issue with Travis is the non-x86 bui=
lders, which have no alternative yet.</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Paolo</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div=
 class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
=C2=A0 Thomas<br>
<br>
</blockquote></div></div></div>

--000000000000d4fdc505b85461d3--


