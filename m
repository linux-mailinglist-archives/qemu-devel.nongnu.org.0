Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99560564DF5
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 08:48:45 +0200 (CEST)
Received: from localhost ([::1]:57428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Fsy-0003OW-Hu
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 02:48:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1o8FnJ-0000jd-P0
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 02:42:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1o8FnH-0005VQ-8x
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 02:42:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656916970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4mOBJBYMwxtUEbwjhTlLGe486IPga/g9UrtdNuliYX4=;
 b=JRmyHHywJ9yxyDKJw9hsb7BaL7iA0ntM1jlW66FfFSkgS398y5Gy1Z1+/vrFp7TkLBlqTr
 UqE1KwmdbXxV33c5PVrUco++W8HD4jcsKDjJk35ygND1p1W6N1g8uK7dxGqNZzrhyAOUGD
 Ra/kTGXA320+VYDHbpyTeVFk2mALf2w=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-8uF0RI0ZNDykjve7ojMsLg-1; Mon, 04 Jul 2022 02:42:44 -0400
X-MC-Unique: 8uF0RI0ZNDykjve7ojMsLg-1
Received: by mail-lj1-f197.google.com with SMTP id
 k6-20020a2e9206000000b0025a8ce1a22eso2434512ljg.9
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 23:42:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4mOBJBYMwxtUEbwjhTlLGe486IPga/g9UrtdNuliYX4=;
 b=JxYxz8WIjTc0UJry44V91+CEpvHoLStNwg/jbzZNRroBOkCJ4wD4By/mdYpaW3pqH4
 kwgfYIzPB6/vGJhCScF05XpgnjZWQBcJOI0DTdFeTFe7ImLPb+M8T0ve9u1grEtPbbpD
 /oZZmKgC8Y7vjbuv0MQUKQKhEjFt9uREf/1/vMcazpgqzcm/YbipEIuUTLZPtkkAGZhC
 o/3CuM0d0UccX6i57wmObMTSXT+Dfv+B+L18xDIU1uIYVL+qNoOTMJ/MrdylCKauwV5g
 H+HP1gJ0ApQ2PYxJecEnuGswMt7S3V3oQ7xvXS9l8X0hhKMeqPXa1Ewv5gScDao7U3J0
 JP8g==
X-Gm-Message-State: AJIora9Wjbaum5Lbh8u8uzuvCyhU7sKmV1ZaLMW+nXDgJEuN3DyzLnf5
 GSLEPhrOfWZFDkzQSqMUGPJOn+wXO9JWYj8kmP7liY5TpxqrvKuD/5qMPXch13tAqWpjOFEd4G3
 XT9zyLRD1b0IZS2ppIYOXoTuqy8IXr/g=
X-Received: by 2002:a05:6512:3b8e:b0:481:1a75:452 with SMTP id
 g14-20020a0565123b8e00b004811a750452mr19006797lfv.238.1656916962997; 
 Sun, 03 Jul 2022 23:42:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vOnnFGKJMwN/PzXzouFcSS3pF3Zu6L4NLiMGqh+wuk+Mgl3NsgyvhDvimDGXgHwXVzTdOngCgmCJySy89unLg=
X-Received: by 2002:a05:6512:3b8e:b0:481:1a75:452 with SMTP id
 g14-20020a0565123b8e00b004811a750452mr19006783lfv.238.1656916962767; Sun, 03
 Jul 2022 23:42:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220527190658.169439-1-i@hexchain.org>
 <MWHPR11MB0031081716C325EBE19F8ACA9BDC9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <CACGkMEsRKNN4PkNBQEGEPpsFhFM7xLD6rVxfAk+QfwsbMoB+sA@mail.gmail.com>
 <CAFEAcA-7gj3=+bOrYheXPUxvO_sFRw0TR6UquUCm419orsym3A@mail.gmail.com>
In-Reply-To: <CAFEAcA-7gj3=+bOrYheXPUxvO_sFRw0TR6UquUCm419orsym3A@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 4 Jul 2022 14:42:31 +0800
Message-ID: <CACGkMEtipg-8BUSpO9D_vW4uq+ZCdmdfCM1VkTA74XS9AybdiQ@mail.gmail.com>
Subject: Re: [PATCH] ebpf: replace deprecated bpf_program__set_socket_filter
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "Zhang, Chen" <chen.zhang@intel.com>, Haochen Tong <i@hexchain.org>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Andrew Melnychenko <andrew@daynix.com>, 
 Yuri Benditovich <yuri.benditovich@daynix.com>, 
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Fri, Jul 1, 2022 at 10:05 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 8 Jun 2022 at 09:17, Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Tue, May 31, 2022 at 1:40 PM Zhang, Chen <chen.zhang@intel.com> wrote:
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Qemu-devel <qemu-devel-
> > > > bounces+chen.zhang=intel.com@nongnu.org> On Behalf Of Haochen Tong
> > > > Sent: Saturday, May 28, 2022 3:07 AM
> > > > To: qemu-devel@nongnu.org
> > > > Cc: qemu-trivial@nongnu.org; Haochen Tong <i@hexchain.org>
> > > > Subject: [PATCH] ebpf: replace deprecated bpf_program__set_socket_filter
> > > >
> > > > bpf_program__set_<TYPE> functions have been deprecated since libbpf 0.8.
> > > > Replace with the equivalent bpf_program__set_type call to avoid a
> > > > deprecation warning.
> > > >
> > > > Signed-off-by: Haochen Tong <i@hexchain.org>
> > >
> > > It looks good to me.
> > > By the way, add eBPF maintainers.
> > > Reviewed-by: Zhang Chen <chen.zhang@intel.com>
> >
> > Applied.
>
> Hi -- did this patch get lost somewhere ?

Kind of, actually the patch is in my queue but the pull request wasn't sent.

> We just had a
> report about it on irc and it doesn't seem to be in master yet.

Will send it soon.

Thanks

>
> thanks
> -- PMM
>


