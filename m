Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A5753CC24
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 17:17:24 +0200 (CEST)
Received: from localhost ([::1]:48312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nx93C-0000YJ-RB
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 11:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nx91V-0007Tl-5G
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 11:15:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nx91Q-0007jI-Jy
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 11:15:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654269331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JmoCgHGVJ9yyB06tjVGcoAbeAwtCQgCYNssDkl7CgOc=;
 b=isP11q7FH2H6ZPAHMFxvmvmPTNlUXeJ9VS9RNWrkfKAyjhcgo6XbXfg14FGckv7O5KwmgU
 +RIdbHsnt49zhcvi63MwUw9hEC2fOTC93IFzM+saGEKFF3lGVIRzs+iTiSpQ7fWWtjUHQh
 Qg+oNIIRqE3ygMgTTSbk8mGoKabH2ks=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-287-RTvYeYLUP7asrdEqg-G9hQ-1; Fri, 03 Jun 2022 11:15:30 -0400
X-MC-Unique: RTvYeYLUP7asrdEqg-G9hQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 g7-20020a056402424700b0042dee9d11d0so5648743edb.3
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 08:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=JmoCgHGVJ9yyB06tjVGcoAbeAwtCQgCYNssDkl7CgOc=;
 b=Di1+zRjZLQUGw0gpyxVgweHWTp16NA+NX4DowMMkkDtzJmKcHiylwqn4QcIoK0MJVe
 QY8ui96cJtj4KLLgQ0T2Mj4DqpDFyf2yqtatYuFHY0ij6VHGt4SJgV+AnGsHq0t2Joxl
 myTEP1CT6VB6my3AEwhALEqwL+vtn7aIvWqUZAd05HakC3yAbWyzP6oXFrAZ1piMgKSm
 +I6PH+jbWiYf/2fkXphgYOq3PtqQI/hNeHM6VdGhgh/QtgAhqORn3Ub/okLOEbc2e4ji
 B1cGkveV1BQzboL2Yrepg8siiL6QnUvMVaObkBTE4/iqv2O94lELCDtvtK8omycLBNWD
 7t9Q==
X-Gm-Message-State: AOAM531S8l8vHdRhu2rl1EJxOBd2jO19wU/S8b8yUCyoKXGjPH9QvtM6
 u8Y2oNLQqfUB5+Jnfwazcol35OVETvFv/KQ7RNzNXA9SNNxkCYgKp6yfUmTqpLEYJ5sHtxxJzfH
 TFf88neGya2mMHTg=
X-Received: by 2002:a17:906:a219:b0:6e4:86a3:44ea with SMTP id
 r25-20020a170906a21900b006e486a344eamr9233932ejy.385.1654269329417; 
 Fri, 03 Jun 2022 08:15:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2vy1O4K9DD0v3jqRz17yt8q8hDqX1gRF1AJPbbjdpcvtVrWonvBymMcFFEZP28lyyGI2h6w==
X-Received: by 2002:a17:906:a219:b0:6e4:86a3:44ea with SMTP id
 r25-20020a170906a21900b006e486a344eamr9233906ejy.385.1654269329115; 
 Fri, 03 Jun 2022 08:15:29 -0700 (PDT)
Received: from gator (cst2-175-76.cust.vodafone.cz. [31.30.175.76])
 by smtp.gmail.com with ESMTPSA id
 b6-20020a17090636c600b006feb6dee4absm2935134ejc.137.2022.06.03.08.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 08:15:28 -0700 (PDT)
Date: Fri, 3 Jun 2022 17:15:26 +0200
From: Andrew Jones <drjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, f4bug@amsat.org,
 alex.bennee@linaro.org, cohuck@redhat.com
Subject: Re: [PATCH v2] tests: Prefer max cpu type when using AArch64 virt
 machine
Message-ID: <20220603151526.6wuerkzb664u4qoq@gator>
References: <20220603111849.1481100-1-drjones@redhat.com>
 <8baf9cbc-3cd4-bcd7-c60d-b68bf0784779@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8baf9cbc-3cd4-bcd7-c60d-b68bf0784779@linaro.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Fri, Jun 03, 2022 at 07:04:01AM -0700, Richard Henderson wrote:
> On 6/3/22 04:18, Andrew Jones wrote:
> > The max cpu type is the best default cpu type for tests to use
> > when specifying the cpu type for AArch64 mach-virt. Switch all
> > tests to it.
> > 
> > Cc: Alex Bennée <alex.bennee@linaro.org>
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> 
> For avoidance of doubt, copying v1 comment to v2:
> 
> > diff --git a/tests/avocado/replay_kernel.py b/tests/avocado/replay_kernel.py
> > index 0b2b0dc692b1..c19022ea977d 100644
> > --- a/tests/avocado/replay_kernel.py
> > +++ b/tests/avocado/replay_kernel.py
> > @@ -147,7 +147,7 @@ def test_aarch64_virt(self):
> >           """
> >           :avocado: tags=arch:aarch64
> >           :avocado: tags=machine:virt
> > -        :avocado: tags=cpu:cortex-a53
> > +        :avocado: tags=cpu:max
> >           """
> >           kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
> >                         '/linux/releases/29/Everything/aarch64/os/images/pxeboot'
> 
> This will *not* work without further changes.  Fedora 29 will is old, and
> will not boot a cpu with FEAT_LPA2 enabled.
> 
> See 11593544df6f ("tests/avocado: update aarch64_virt test to exercise -cpu max")
> 
> Which makes me wonder if you've actually tested this?

I only did 'make check'. I'll also do 'make check-avocado' for v3.

Thanks,
drew


