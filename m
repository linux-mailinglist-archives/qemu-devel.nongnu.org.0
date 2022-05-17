Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0283C52AEC1
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 01:39:51 +0200 (CEST)
Received: from localhost ([::1]:58564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr6n7-0004vM-QA
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 19:39:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nr6jo-0003oQ-Ck
 for qemu-devel@nongnu.org; Tue, 17 May 2022 19:36:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nr6jm-0001Dt-VJ
 for qemu-devel@nongnu.org; Tue, 17 May 2022 19:36:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652830582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gDeQesmujrPHug0lmRnewNYONBu1eCIYWRQ/HWTskq0=;
 b=MLJjB/Lgmb+tXXo0gJ/aV10F9aQPwFOztyWhnb1+zuT3DEzqJN8+Ki0yztXXqHOvERASW5
 iqTguJ4C1axRZd1yWDBXJWQr6xnhaH5UNxwFlJHdamhBNM9rgNw3mVMYIPUQoqLaV2Y5u6
 pnJNwS7LesEz9kHbStwMWCTrsGc73zk=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-8pYP81nlO6qg0d3EAGNTsQ-1; Tue, 17 May 2022 19:36:21 -0400
X-MC-Unique: 8pYP81nlO6qg0d3EAGNTsQ-1
Received: by mail-ua1-f71.google.com with SMTP id
 c18-20020ab00b92000000b0035ffe6d403fso358000uak.5
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 16:36:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gDeQesmujrPHug0lmRnewNYONBu1eCIYWRQ/HWTskq0=;
 b=AIiCOqLXB0pz5WPe3e9Gd/hXSmJuZezTGgTs9NOzbi2TxIVYx/4d1VGsEHg2ulwKc7
 iSriVFvezRJsVR0EP2w89/Qz7fn0UdDxw/YC5dkpNLwItJCf+inVZnuCT9z+VT98ozlN
 mpDDo+hu8MEst1h3PyVAzGlv/ApSVHGJaTu47RvhAJxsFRJ3EGXIjvYwEMmEheoUqqZy
 8gO9+4906Fc+YYGmFEPPHM8KTCtm749uGFNuaF4eWTHUKzU4+03cbAgCFg5Sz30sug07
 CPPFT5McnWpWi4RAz9gVOKJWpSPdyCuPdp/pxuCLg6FRn0QH8SSDrReMIpGIaZyXGtaj
 IH8w==
X-Gm-Message-State: AOAM533SPfpvRqUwy7fguNY+/xUuQA4geLFpvSGKdWMjwH+H//InCSDN
 5S4/+BsaYY8YuQ8BDVqoHT36lOMhLFQWEsUYmv4glWZQodqVpYLWF5y0YXlKv/FBlXfjW/i9FRQ
 3TPZHp35/aaBGkmHr24h4WEdBsiqOu38=
X-Received: by 2002:ac5:c925:0:b0:34e:3e84:75b8 with SMTP id
 u5-20020ac5c925000000b0034e3e8475b8mr10206555vkl.3.1652830580575; 
 Tue, 17 May 2022 16:36:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRofSKA5zvFqLnF9T8FDyRMsPW0cBTeF7fu53oq3xmzWv+SCrHo9xKl/a7c+DLCKarLTw7t2OWMuS7VhnsaYo=
X-Received: by 2002:ac5:c925:0:b0:34e:3e84:75b8 with SMTP id
 u5-20020ac5c925000000b0034e3e8475b8mr10206546vkl.3.1652830580418; Tue, 17 May
 2022 16:36:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220516082310.33876-1-thuth@redhat.com>
 <YoIKwwlXpdNrfxRB@redhat.com>
In-Reply-To: <YoIKwwlXpdNrfxRB@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 17 May 2022 19:36:09 -0400
Message-ID: <CAFn=p-YMgMBheJTkWBsia5GVr_OokZkgFw+v02BZP9J11WEV1g@mail.gmail.com>
Subject: Re: [PATCH v2] gitlab-ci: Switch the container of the 'check-patch' &
 'check-dco' jobs
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, May 16, 2022 at 4:26 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Mon, May 16, 2022 at 10:23:10AM +0200, Thomas Huth wrote:
> > The 'check-patch' and 'check-dco' jobs only need Python and git for
> > checking the patches, so it's not really necessary to use a container
> > here that has all the other build dependencies installed. By using a
> > lightweight Alpine container, we can improve the runtime here quite a
> > bit, cutting it down from ca. 1:30 minutes to ca. 45 seconds.
> >
> > Suggested-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > ---
> >  v2: Use python:alpine for even quicker execution
> >
> >  .gitlab-ci.d/static_checks.yml | 14 ++++++++------
> >  1 file changed, 8 insertions(+), 6 deletions(-)
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>

Looks good.

Sorry for fooling you with my python container -- I am using it to
ensure a very wide spectrum of version compatibility.

Reviewed-by: John Snow <jsnow@redhat.com>


