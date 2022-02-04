Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AFF4A986E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 12:31:13 +0100 (CET)
Received: from localhost ([::1]:38346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFwo4-0001ED-3U
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 06:31:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nFwjd-0007zN-6N
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 06:26:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nFwjY-0007Wd-KH
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 06:26:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643973984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iTbJbqXG9HC//cO2k6FWiI9UsrIzJnukP/spYbxyLl4=;
 b=IdsS3+UfuDFU2GHpsDWkoj/vQyB405myxfYZM3mkOlAjzWX/lR0SVGF3oQP8r/N7jQsYot
 7VPo5R2OG2fH6VO+T8MHtiMNWaTSIA6ble5kR4qdTdQGX1opfngMT9CpxvJb8foo4NbVuQ
 ajmhnzBFIMcY70yf37TVnPdoUax8eSQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-l_9tlyOcNQu6TNg6_VZmsg-1; Fri, 04 Feb 2022 06:26:22 -0500
X-MC-Unique: l_9tlyOcNQu6TNg6_VZmsg-1
Received: by mail-ej1-f70.google.com with SMTP id
 mp5-20020a1709071b0500b0069f2ba47b20so2389937ejc.19
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 03:26:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iTbJbqXG9HC//cO2k6FWiI9UsrIzJnukP/spYbxyLl4=;
 b=MLR7GVMjeCaYXJf+hWvRhMSVMKnx2GXmZkcqPnqOZ450YXgvu06f0XJGjABclQoxSE
 Yhv8mOPMBOPCm6CkcME9Ih/m4r4TS8hBKdU35RjIxS8IYQz9pXwG2MSQFt9YMKUYKoW2
 L/DBYR1UQB6QhQKCqe1TB+AI+fPw0NC27QIavSGqyj2+0o8zWB0NgtsD4lL31VfwU25i
 gvf7Q8JBVbT4oAgWweGCS8Yugvl3ey3qrk1Ta0TctQONpMY1O65u8UBglsx2gxAa9CyN
 fdgIiGqDxcdYpIiZuk5qtCNOm5P4sL7r0r8H+ktfVUSUOk+0oHM+bfkLQnmo1Umy39Jk
 QV/Q==
X-Gm-Message-State: AOAM533g+h5CnZX6MDTVVyemUTp8FIUro5ceFfR0NIG35cGMVOwBCefF
 uDtWSM/2SsP6KjGsgcW5aSKjC1JFQ/j1WgUBTIsKok5Ux1RfTUU+Lo75M3bQWKc4cwsKoWdvepr
 zWZVJsUIovpG19rs=
X-Received: by 2002:a17:907:7e92:: with SMTP id
 qb18mr2176223ejc.555.1643973981821; 
 Fri, 04 Feb 2022 03:26:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyp3cb+5Ewr7eluRiiLM1M+0a51Hh4tWNYlvQQdkXEQGaHAiNvNPGUnFnkx9doXkhL6q4huqg==
X-Received: by 2002:a17:907:7e92:: with SMTP id
 qb18mr2176212ejc.555.1643973981617; 
 Fri, 04 Feb 2022 03:26:21 -0800 (PST)
Received: from gator (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
 by smtp.gmail.com with ESMTPSA id bx18sm693334edb.93.2022.02.04.03.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 03:26:21 -0800 (PST)
Date: Fri, 4 Feb 2022 12:26:19 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 09/11] target/arm/kvm: host cpu: Add support for sve<N>
 properties
Message-ID: <20220204112619.ouocuiwbzlv4n2gs@gator>
References: <20191101085140.5205-1-peter.maydell@linaro.org>
 <20191101085140.5205-10-peter.maydell@linaro.org>
 <CAFEAcA8pS6_SYWMFJ0=EyHVQ9V1MTiM_OCjkvqb5znqJ91w_qw@mail.gmail.com>
 <20220203173640.shxkmatdcsfzzvtj@gator>
 <CAFEAcA9_3DNozRsH8+iXbs2Z4-ar=Eki3ENvZocSmfbp+g13qQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9_3DNozRsH8+iXbs2Z4-ar=Eki3ENvZocSmfbp+g13qQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 03, 2022 at 05:40:20PM +0000, Peter Maydell wrote:
> On Thu, 3 Feb 2022 at 17:36, Andrew Jones <drjones@redhat.com> wrote:
> >
> > On Thu, Feb 03, 2022 at 04:46:21PM +0000, Peter Maydell wrote:
> > > Was this intentional?
> >
> > No, darn. I don't know how many times I rebased that series and was always
> > careful to ensure sve-max-vq was left in the non-kvm part of the above
> > condition. I guess the final rebase finally got me...
> >
> > >
> > > I'd like to fix up the weird divergence between -cpu host and
> > > -cpu max, either by moving sve-max-vq into aarch64_add_sve_properties()
> > > so it's present on both, or by changing the aarch64_max_initfn() so
> > > it only adds the property when using TCG.
> >
> > The later, please. sve-max-vq won't work for any of the machines that
> > support SVE that I know of, so I think it's a bad idea for KVM.
> >
> > >
> > > (I think also this code may get the '-cpu max,aarch64=off' case wrong,
> > > as it doesn't guard the calls to add the sve and pauth properties
> > > with the "if aarch64" feature check.)
> >
> > Yes, but these property dependencies may need to be checked at property
> > finalize time. That means that the properties may get added, but then
> > they will error out if the user tried to enable them. Otherwise, they'll
> > be disabled and the QMP query will inform the user that they cannot be
> > enabled.
> 
> Does 'max' need to do anything different from what we're doing
> already in arm_host_initfn() for 'host' ?
>

I don't think so. I think we want max+kvm == host and max+kvm to support
a strict subset of the properties that max+tcg supports. We could try to
provide all of max+tcg's properties to max+kvm, and then let them error
out when they bump into KVM limitations, but when we know they will likely
never work (e.g. sve-max-vq), then I think I still prefer just removing
them.

> (My proposal for
> fixing this stuff is basically to make aarch64_max_initfn()
> start with "if (kvm or hvf) { call arm_host_initfn(); return }".)

That sounds good to me. We'll get max+kvm == host that way for sure,
and I hope that host supports a strict subset of max's properties
already.

Thanks,
drew


