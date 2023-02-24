Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 745AD6A17D4
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 09:21:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVTK2-0006a3-7j; Fri, 24 Feb 2023 03:20:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pVTJw-0006Yg-Jm
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:20:48 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pVTJu-0001gX-NR
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:20:48 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 m8-20020a17090a4d8800b002377bced051so2079344pjh.0
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 00:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=f8ASVoANYRMJVrPdaQDcVCWzBy3rU80VLIk6iFG5TrY=;
 b=HqjtAn2BlRTPbZE4XRMHIS52RqlmO2Na8JiV4xa5sHtX/5WP4bPXCb5xVcMWF0zh1U
 iE9a9TIpKiEprheu+o/Zp+puVcbt/okbMuPPo6uSyp9CICH1c5ZJ0HaMBny0vlVQDaab
 52p1flu0bUez6ssxs7TXK+fj8Q+uz3YRygI8s0hP/xvczoIV8RHt4bX7//djteeKjzkv
 8LopQUD1wA5gya7PM4T6X7snROxjcPJC50I9vUnnjfLXPbE1GogI+8j+0V6On8wUgGER
 tKy9GM1vcBe5fUvcayN4PhxOyoGsfeqxlRf8SB6ug1XcL7KZFsV5WzRo1booE5kj35aX
 s40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f8ASVoANYRMJVrPdaQDcVCWzBy3rU80VLIk6iFG5TrY=;
 b=iOzRI1fhQPjX3LF3V9vEOdThTIprV+DZ432LlBiSaAiFtjuck/eUspaaGbD291FsYN
 2nkyp6nBiB8lk4NlQ8OQcndzsoFdDsYTko+NIPo5TvILQRcJvbOIo6/zN97V2+ACjAOA
 2g18mMAlYfL8HHpk3VRZbrKTBKG/Sd+OCVyqy5J9xIQmwlJDopSmE5NGzAlQNSn/Dwuh
 SvJQZqEnxxEqmnEBuylEcEGM/BHoydxWcbpF1AsPhggzWrgiSyM6NrZ8kRSfs0ycS4BR
 KIXsAm7+Fc4nO2z3IcyepwKj4rHek8zJX/vhtd+XN5JnaA9+7TXoMIRG/ON3WzTIfNZ9
 iw5w==
X-Gm-Message-State: AO0yUKUGv5HHlwM9fiAZbEPJIHArr9GX1cQwYnunbMS7XqKOyaGdIs7y
 bMMV13EMzkd+hP+UKVk4YrvAEg==
X-Google-Smtp-Source: AK7set8qz5Q6OG/aK963uu/fU3x5EnlTNp2a4EXtYVoj1tF+r/MCE7RlxBeM26A8sJEXLq3nqNGh9w==
X-Received: by 2002:a17:903:24c:b0:19c:b3c9:5b16 with SMTP id
 j12-20020a170903024c00b0019cb3c95b16mr7595315plh.12.1677226845099; 
 Fri, 24 Feb 2023 00:20:45 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 19-20020a170902c21300b0019945535973sm547521pll.63.2023.02.24.00.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 00:20:44 -0800 (PST)
Date: Fri, 24 Feb 2023 13:50:37 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 libvir-list@redhat.com, Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Dongjiu Geng <gengdongjiu1@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH] Deprecate the "-no-acpi" command line switch
Message-ID: <Y/hzVUB8Zwt99Q/K@sunil-laptop>
References: <20230224073441.1105921-1-thuth@redhat.com>
 <Y/htv0jY8CjMJ2Rw@sunil-laptop>
 <42d15527-8b0e-9f0d-4c0d-24ca50b13bb6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42d15527-8b0e-9f0d-4c0d-24ca50b13bb6@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Feb 24, 2023 at 08:59:41AM +0100, Thomas Huth wrote:
> On 24/02/2023 08.56, Sunil V L wrote:
> > On Fri, Feb 24, 2023 at 08:34:41AM +0100, Thomas Huth wrote:
> > > Similar to "-no-hpet", the "-no-acpi" switch is a legacy command
> > > line option that should be replaced with the "acpi" machine parameter
> > > nowadays.
> > > 
> > > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > > ---
> > >   docs/about/deprecated.rst | 6 ++++++
> > >   softmmu/vl.c              | 1 +
> > >   2 files changed, 7 insertions(+)
> > > 
> > > diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> > > index ee95bcb1a6..15084f7bea 100644
> > > --- a/docs/about/deprecated.rst
> > > +++ b/docs/about/deprecated.rst
> > > @@ -99,6 +99,12 @@ form is preferred.
> > >   The HPET setting has been turned into a machine property.
> > >   Use ``-machine hpet=off`` instead.
> > > +``-no-acpi`` (since 8.0)
> > > +''''''''''''''''''''''''
> > > +
> > > +The ``-no-acpi`` setting has been turned into a machine property.
> > > +Use ``-machine acpi=off`` instead.
> > > +
> > >   ``-accel hax`` (since 8.0)
> > >   ''''''''''''''''''''''''''
> > > diff --git a/softmmu/vl.c b/softmmu/vl.c
> > > index 459588aa7d..07d5215325 100644
> > > --- a/softmmu/vl.c
> > > +++ b/softmmu/vl.c
> > > @@ -3271,6 +3271,7 @@ void qemu_init(int argc, char **argv)
> > >                   vnc_parse(optarg);
> > >                   break;
> > >               case QEMU_OPTION_no_acpi:
> > > +                warn_report("-no-hpet is deprecated, use '-machine acpi=off' instead");
> > 
> > "no-acpi" is deprecated?
> 
> That's at least my plan. The patch is under discussion, but at least in my
> opinion, this option should go away in the long run, yes.
> 
Sorry for not being clear. It is mentioned as -no-hpet is deprecated. It
should be -no-acpi.

Thanks,
Sunil

