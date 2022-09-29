Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7365EEBD4
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 04:34:59 +0200 (CEST)
Received: from localhost ([::1]:34910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odjO5-0002D5-LF
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 22:34:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1odjLe-0007nL-TL
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 22:32:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1odjLb-0002u0-GK
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 22:32:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664418741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6EyXzVc/9uupW1U4HnvRiOsgheSC3SOTx2LK9f+kHUU=;
 b=bPR6vGLzkODuV6xqob5vsqPrfYaav4wFFidbtp3JW+61/U35ic6WNKLeoVTjDJgynXj/Bo
 VDlcuI50l9VT6ilMqhuLKYSp44m1XkxB+4Lb+0yiOgqSEjYeVJMYItGixKQI5prWthjLpM
 Y+xuolhmwGk4anOXJPi8O9SU0yVmSKs=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-384-MGkSANifNGeQ6UAWfLXKJg-1; Wed, 28 Sep 2022 22:32:20 -0400
X-MC-Unique: MGkSANifNGeQ6UAWfLXKJg-1
Received: by mail-oo1-f70.google.com with SMTP id
 f11-20020a4a920b000000b00476997f3fa8so1128057ooh.20
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 19:32:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=6EyXzVc/9uupW1U4HnvRiOsgheSC3SOTx2LK9f+kHUU=;
 b=mxJfiDIyAk90ju4EkDX930SMAikJc9/uHcTUvWgrwY3rPZqvuMZr/5NRlLP0btM+jz
 k7IXe+Mc/jX2NCK7dBNuIcvGGiv6WkodtW3T1YvNl4/UAk0gdVfUfLrkFl5y8yfWmBpY
 6ha5l8eCf7MBImySbE3yrrm6VTbN3jO6dR6q0pO9XlKh595pDJSL2sCGSBjxc7qx1AR6
 teZ9uenq9/4ibhHkRbjZuf4HMdDGBq+9iU/02/cVWBOMJb10qsk3VpTq1L/ZUYXqVhkn
 PziWtal54Nd0At1rUD3rf4ZJgNwAiJCNbtNxhPzjrMNMTVks6zNQpXPwx5w21LKCcpUE
 Ce5A==
X-Gm-Message-State: ACrzQf0/U2fRfIaB7B5CCI7xUC9ivuO0jcP5OwKL58aHlzRBLQH6ZLM7
 RD59LLmSMugvp4XSbv12oUOhBhRc4JmDnkKfkel8EJxADl0y1YXikbUOF/zQJUeBQGYBLjzLsdb
 KL5SMyAw76bhOM2m1GDpJvyWQnbbW3bQ=
X-Received: by 2002:a05:6808:1304:b0:350:649b:f8a1 with SMTP id
 y4-20020a056808130400b00350649bf8a1mr492475oiv.280.1664418739570; 
 Wed, 28 Sep 2022 19:32:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7i3YnYvOM6mvVhjirzGk8YIUd31O/fZ/vaBE7EGaBrZHE4U3FsIOYDdSK2ZMrPrXQQ4xisAVCApUmBZjBn5WY=
X-Received: by 2002:a05:6808:1304:b0:350:649b:f8a1 with SMTP id
 y4-20020a056808130400b00350649bf8a1mr492467oiv.280.1664418739362; Wed, 28 Sep
 2022 19:32:19 -0700 (PDT)
MIME-Version: 1.0
References: <a7da7e40-6f7b-79a4-709b-da0e71def650@redhat.com>
 <93033078-221d-23d2-23e7-13eab59cd439@amsat.org>
In-Reply-To: <93033078-221d-23d2-23e7-13eab59cd439@amsat.org>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 29 Sep 2022 10:32:08 +0800
Message-ID: <CACGkMEsQSn_GOBcs64JEDUHt3T7XOBL3LLM7yvqwwR5xvvD2dg@mail.gmail.com>
Subject: Re: If your networking is failing after updating to the latest git
 version of QEMU...
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 qemu-discuss <qemu-discuss@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 29, 2022 at 1:06 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 28/9/22 10:27, Thomas Huth wrote:
> >
> > ... it might have happened due to the removal of the "slirp" submodule
> > from the git repository. For example if you see an error message like t=
his:
> >
> >   Parameter 'type' expects a netdev backend type
> >
> > this likely means that the "user" mode backend type is not available in
> > your binary anymore. To fix it, simply install "libslirp-devel" (or
> > libslirp-dev or however it is called) from your OS distribution and
> > recompile.
>
> Thanks for the hint Thomas. I'm afraid many developers will miss your
> email.
>
> Jason, Marc-Andr=C3=A9, could we improve the buildsys check or display
> a more helpful information from the code instead?

It looks to me we need to improve the build.

Thanks

>
> Thanks,
>
> Phil.
>


