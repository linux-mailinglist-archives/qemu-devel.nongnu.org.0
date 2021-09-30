Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5C141DFB7
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 19:04:46 +0200 (CEST)
Received: from localhost ([::1]:39914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVzUD-0004wi-IH
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 13:04:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mVzQR-0002fl-Vc
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 13:00:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mVzQL-0001KS-Ed
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 13:00:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633021241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s5/iAKVu+TyoNe8NYq5NN+nhS2yMZkslZXEyxAqDzXg=;
 b=MYga66i0bGtOI0yiPJyXLIsIFPEwxHB4qxbQQwnfGlnG/JL++TvVoY4tPKYYvUnExHpu5y
 ugdDuyaQYWMVCrs8SuDxpnnPFgM6FX8nS4M8gh15crWITuwkAjIylTtBTocLi1YHYmb9KD
 LKOszpLeEWwDH5ICoSRC8I1jPPOyAaU=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-eaLhDT8WOKKwg9X9jgTHLg-1; Thu, 30 Sep 2021 13:00:39 -0400
X-MC-Unique: eaLhDT8WOKKwg9X9jgTHLg-1
Received: by mail-pf1-f199.google.com with SMTP id
 j18-20020a056a00235200b0044be510a203so2377596pfj.17
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 10:00:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=s5/iAKVu+TyoNe8NYq5NN+nhS2yMZkslZXEyxAqDzXg=;
 b=0Yv8qwp+sBn+9B0PpI01koxAPExeagxT4rkVDzK3B4uCcSuoZFdQJf+Nl7Hx/POKrg
 +8coJxsKSnDKXLuPia42qlfXvCTUOZ+tBAUsB2iKYNKhvROWymDQP+nlbLrypOnt10zr
 9FCJNmRduETvwZegHfEvHbJuGrkHR/wcskRGjpJKZLrVs2Ap0hp+NVZqzfVV/2IN/40k
 evW9NPW5OJEJUItc2mBglCIXca3PmWoA+y/ibmiJvot2XsRxegNElFxVmPuQbWp74gVi
 mF9Rfq79C3X98BbPx4Q1po4g/PYDOffez8uRdjfrZgOgCcXQEOgIN2Tfr/afjhnanUCt
 1bKA==
X-Gm-Message-State: AOAM533k/0AXcW4WjMawVkYwuufEVhuiPO8RBn4whLmEsVapDe6bLwmf
 YGIFyNzzZTAH3MiByhgvZ2BhB3oNTn41Tr9hxd0sea1ZAU1yqRgwVTh9jqSJah936TYlYcyXsF7
 oCJ4BW/FTVHRGS+pz76gEIcrFQrey2J4=
X-Received: by 2002:a17:903:1d1:b0:13c:897c:c04b with SMTP id
 e17-20020a17090301d100b0013c897cc04bmr5052404plh.76.1633021237724; 
 Thu, 30 Sep 2021 10:00:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmeoUJdZD66qQsbNuiGCjp3+QpAvctHABwNYyETZF3ShAih3k/tQlKS04dmVKTn1/f17gBdYyjol83YqNTc7E=
X-Received: by 2002:a17:903:1d1:b0:13c:897c:c04b with SMTP id
 e17-20020a17090301d100b0013c897cc04bmr5052367plh.76.1633021237312; Thu, 30
 Sep 2021 10:00:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210930084701.3899578-1-rjones@redhat.com>
 <c9a4f4ce-b626-18a4-326a-03ebfe5b5aee@virtuozzo.com>
In-Reply-To: <c9a4f4ce-b626-18a4-326a-03ebfe5b5aee@virtuozzo.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Thu, 30 Sep 2021 14:00:11 -0300
Message-ID: <CAKJDGDbtCp-aecYPs-4zK4dojo=uhez=_T2iL2yKx08guuXKbA@mail.gmail.com>
Subject: Re: [PATCH v3] nbd/server: Add --selinux-label option
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 30, 2021 at 5:55 AM Vladimir Sementsov-Ogievskiy
<vsementsov@virtuozzo.com> wrote:
>
> 9/30/21 11:47, Richard W.M. Jones wrote:
> > Under SELinux, Unix domain sockets have two labels.  One is on the
> > disk and can be set with commands such as chcon(1).  There is a
> > different label stored in memory (called the process label).  This can
> > only be set by the process creating the socket.  When using SELinux +
> > SVirt and wanting qemu to be able to connect to a qemu-nbd instance,
> > you must set both labels correctly first.
> >
> > For qemu-nbd the options to set the second label are awkward.  You can
> > create the socket in a wrapper program and then exec into qemu-nbd.
> > Or you could try something with LD_PRELOAD.
> >
> > This commit adds the ability to set the label straightforwardly on the
> > command line, via the new --selinux-label flag.  (The name of the flag
> > is the same as the equivalent nbdkit option.)
> >
> > A worked example showing how to use the new option can be found in
> > this bug: https://bugzilla.redhat.com/show_bug.cgi?id=3D1984938
> >
> > Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=3D1984938
> > Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> > Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > Signed-off-by: Eric Blake <eblake@redhat.com>
>
> this should be Reviewed-by?

Maybe, because of this:
https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg07081.html

I got confused with this v3.


