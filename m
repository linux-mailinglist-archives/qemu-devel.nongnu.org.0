Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7AC58945C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 00:26:06 +0200 (CEST)
Received: from localhost ([::1]:37832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJMoW-0005ug-Dm
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 18:26:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oJMm2-0002Si-BW
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 18:23:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oJMlz-000173-3H
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 18:23:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659565404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PdlskIjfwZgDxAgAxjTTEI1NNMnEdrYqngGr7Q0OIHA=;
 b=IBYtKzO54N6nCLCMAemAPm6XYic5KPlDLqOFEh0RZDhpKa+1sphdvRmdtWuyLuV4ySzRZy
 aGDWVcLoDCdpwEBi5orw8TBBi/BJcDoJQyB4vmhPKx5aSLNPtpzwwg4IvNZ9wrHl290iVp
 ATYJjJJhtZbfuR9Mux44buE0yfisoJw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-aHtcYA8mM5WLXS9oMwjlmQ-1; Wed, 03 Aug 2022 18:23:23 -0400
X-MC-Unique: aHtcYA8mM5WLXS9oMwjlmQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 gn23-20020a1709070d1700b0073094d0e02cso3281376ejc.20
 for <qemu-devel@nongnu.org>; Wed, 03 Aug 2022 15:23:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=PdlskIjfwZgDxAgAxjTTEI1NNMnEdrYqngGr7Q0OIHA=;
 b=xP4bBw2ygf5ylHOLyHq/vE/G9b2xHVswqoLIIv5arG39j4ljAqosBCib7Ti37qmesS
 JYz3IWIa4HgloBd+IfUw1i3HqInXn2lFJRPYYvm+NatvpqTo2bkRsoauDwqdoQ/2LOjn
 Pc4X/FsVaAF6x7N2YzCo1Fy07J2D4IRWgzskFPttaUilfK2QjQcv1TKJs5y0UwW2lOPS
 bz6PyuUgTUTahoBPBwaKUc0NaFtRr+IBRm5TW8uMNq5h7sDx0sF/7jMcOxRJN1rnNpeF
 jYyEQTEreFPX8tvr3CpXWDwc4euJovoh/cG92OoIQtw+RupaEO8GAXARhxSgmDX8iRvI
 2KCw==
X-Gm-Message-State: AJIora9MXy0qB7aFqldFQV+MFTGUNSyJCFdHelBp82b51GnB4exUs6Yi
 GxdkTt2Yuz7MdEJugM1IP1yvgHR8EYO0EzY8JBvCmUEKPtx1V7wJiiv8iUw80KGRxv1J5TlaXej
 Atg+VdJNu6W2O5l8=
X-Received: by 2002:a05:6402:13d6:b0:43c:b98f:5f74 with SMTP id
 a22-20020a05640213d600b0043cb98f5f74mr27471196edx.392.1659565402068; 
 Wed, 03 Aug 2022 15:23:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vtAQpn6dYU4aScLXL7zJLKFHRk76Xpa0eUWeTIPHJdP3X9U1Y/WpaR3/GiR1JSa9acF/GAaQ==
X-Received: by 2002:a05:6402:13d6:b0:43c:b98f:5f74 with SMTP id
 a22-20020a05640213d600b0043cb98f5f74mr27471179edx.392.1659565401839; 
 Wed, 03 Aug 2022 15:23:21 -0700 (PDT)
Received: from redhat.com ([2.54.191.86]) by smtp.gmail.com with ESMTPSA id
 u6-20020aa7d986000000b0043bb8023caesm9913290eds.62.2022.08.03.15.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 15:23:20 -0700 (PDT)
Date: Wed, 3 Aug 2022 18:23:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>,
 Laszlo Ersek <lersek@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PULL 9/9] hw/i386: pass RNG seed via setup_data entry
Message-ID: <20220803181435-mutt-send-email-mst@kernel.org>
References: <Yukk0YOFgkPwcTzG@zx2c4.com>
 <a3ddd211-a569-4348-c3bb-2ff509fd6ccf@intel.com>
 <Yuk9a0v+CNnzAX37@zx2c4.com>
 <CAHmME9qDNmX7TYio3TxgP_xFL1LGUoKrT6w=OG_1c688ZSdvKg@mail.gmail.com>
 <YupTaZlkyy1/9FUC@redhat.com> <Yup0FIOLLo0thP8u@zx2c4.com>
 <Yup5TG2kZs+TifEJ@zx2c4.com> <YuqraGAFyCibc1h6@zx2c4.com>
 <20220803180115-mutt-send-email-mst@kernel.org>
 <Yurxx0OZ+mfWdZ5M@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yurxx0OZ+mfWdZ5M@zx2c4.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Thu, Aug 04, 2022 at 12:08:07AM +0200, Jason A. Donenfeld wrote:
> Hi Michael,
> 
> On Wed, Aug 03, 2022 at 06:03:20PM -0400, Michael S. Tsirkin wrote:
> > On Wed, Aug 03, 2022 at 07:07:52PM +0200, Jason A. Donenfeld wrote:
> > > On Wed, Aug 03, 2022 at 03:34:04PM +0200, Jason A. Donenfeld wrote:
> > > > On Wed, Aug 03, 2022 at 03:11:48PM +0200, Jason A. Donenfeld wrote:
> > > > > Thanks for the info. Very helpful. Looking into it now.
> > > > 
> > > > So interestingly, this is not a new issue. If you pass any type of setup
> > > > data, OVMF appears to be doing something unusual and passing 0xffffffff
> > > > for all the entries, rather than the actual data. The reason this isn't
> > > > new is: try passing `-dtb any/dtb/at/all/from/anywhere` and you get the
> > > > same page fault, on all QEMU versions. The thing that passes the DTB is
> > > > the thing that passes the RNG seed. Same mechanism, same bug.
> > > > 
> > > > I'm looking into it...
> > > 
> > > Fixed with: https://lore.kernel.org/all/20220803170235.1312978-1-Jason@zx2c4.com/
> > > 
> > > Feel free to join into the discussion there. I CC'd you.
> > > 
> > > Jason
> > 
> > Hmm I don't think this patch will make it in 7.1 given the
> > timeframe. I suspect we should revert the patch for now.
> > 
> > Which is where you maybe begin to see why we generally
> > prefer doing it with features - one can then work around
> > bugs by turning the feature on and off.
> 
> The bug actually precedes this patch. Just boot with -dtb on any qemu
> version and you'll trigger it.

Sure but it's still a regression.

> We're still at rc0; there should be time
> enough for a bug fix. Please do chime in on that thread and maybe we can
> come up with something reasonable fast enough.
> 
> Jason

Maybe.

-- 
MST


