Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6D860740D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 11:29:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oloLH-0001Qg-J5
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:29:27 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olnGe-0001jl-9M
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 04:20:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1olnGU-0001Rv-DG
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 04:20:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1olnGS-00047D-TQ
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 04:20:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666340423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VQ7TvRf+z/7G26hXE4YQxcVSs/NFR0Y/s5JG1TSKRzc=;
 b=NEpYUbsyxjUnYj8s6SbouYWIuNnX6ShUF2waE0woltCrVElr5NaMia9qPP0GUExq2Nncgb
 lIIJjxgJkNzi+qiwo1WqidcJxRmoufD2SIUIP201ksDczlK866/G0zqUxhfFyvICb5Gwo0
 ODoTqV1uNfdVE5mPU/fCjrCD1qb9asI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-126-cAsplIusPTK20R6q0f6Ysw-1; Fri, 21 Oct 2022 04:20:22 -0400
X-MC-Unique: cAsplIusPTK20R6q0f6Ysw-1
Received: by mail-wm1-f72.google.com with SMTP id
 v125-20020a1cac83000000b003bd44dc5242so2994411wme.7
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 01:20:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VQ7TvRf+z/7G26hXE4YQxcVSs/NFR0Y/s5JG1TSKRzc=;
 b=A9hSu9zatcQR/VzRc13Fv8NVRey7G9f/SqXFTPCXUPON63xvQZfJ8sa0Xen7tSMNFh
 RmxvWwZ1fhU5mduMYlnUpLJzcWRyWTjz5j97OvCHhfogcaV0cqcp8RM8SFzFu4fFZzZq
 XiW34/7gzwT/R71Dr8ldA7e4asaHTLy2Uk31+BlS4lkoZ4WbMq/lkQG+mD2E7JBDaPT1
 R3Row+9Kv9voi1tLjEgBTSv68CGB8bYm3MlvrzoAys7jBQ8o3dghKnqMD3/qTHJVITZo
 +tY6xgSVL1zaZXnBZL9Re1d4Lxa5eYaewfmXP2cq4EuP1UnLLIrSQXDmUPQI3Lawy6wV
 GECQ==
X-Gm-Message-State: ACrzQf1Rrnv0X9I3Wg/qwef5QsaRtjXZKuz33KiGerqz5ysJ2iKQGfnN
 f54Hw2Yg58kOnsOKsSA781Cbae0Dep8xUkxeLcryfhlnTcOcRww/cU+pPQNBm1HIJJnQp6fIjzh
 YbLj93d4A1ftY+d0=
X-Received: by 2002:adf:fb87:0:b0:22f:1880:d679 with SMTP id
 a7-20020adffb87000000b0022f1880d679mr11540950wrr.279.1666340421152; 
 Fri, 21 Oct 2022 01:20:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4KOGp3ynUz2GTiZvVP5mgb5v8P/JHlEkEHtIPQGRQqj82nevOyFSi+bsibvUAp4gb5OgAazw==
X-Received: by 2002:adf:fb87:0:b0:22f:1880:d679 with SMTP id
 a7-20020adffb87000000b0022f1880d679mr11540928wrr.279.1666340420915; 
 Fri, 21 Oct 2022 01:20:20 -0700 (PDT)
Received: from redhat.com ([2.54.40.233]) by smtp.gmail.com with ESMTPSA id
 i9-20020a05600c4b0900b003b47b80cec3sm1912541wmp.42.2022.10.21.01.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 01:20:20 -0700 (PDT)
Date: Fri, 21 Oct 2022 04:20:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>,
 Maydell Peter <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Qemu Devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v6 00/10] Introduce new acpi/smbios avocado tests using
 biosbits
Message-ID: <20221021041731-mutt-send-email-mst@kernel.org>
References: <20221020123506.26363-1-ani@anisinha.ca>
 <20221020083810-mutt-send-email-mst@kernel.org>
 <CAARzgwwd_How_h+9sHWPOrWWZ7CbX+DN-uy-KiGf1VVyVmrLnA@mail.gmail.com>
 <20221020084311-mutt-send-email-mst@kernel.org>
 <CAARzgwxfKbrxAqb15GXp4j1enDPUhGBsL5jUzFtDvJkGM-7azw@mail.gmail.com>
 <20221020150857-mutt-send-email-mst@kernel.org>
 <CAARzgwwDjjHL-1fEeuySNZm8NbnGNaeE5h6zrPz_zaANfs5dsw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAARzgwwDjjHL-1fEeuySNZm8NbnGNaeE5h6zrPz_zaANfs5dsw@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Fri, Oct 21, 2022 at 05:10:43AM +0530, Ani Sinha wrote:
> 
> 
> On Fri, Oct 21, 2022 at 12:43 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> 
>     On Thu, Oct 20, 2022 at 06:20:20PM +0530, Ani Sinha wrote:
>     > On Thu, Oct 20, 2022 at 6:15 PM Michael S. Tsirkin <mst@redhat.com>
>     wrote:
>     > >
>     > > On Thu, Oct 20, 2022 at 06:12:10PM +0530, Ani Sinha wrote:
>     > > > On Thu, Oct 20, 2022 at 6:08 PM Michael S. Tsirkin <mst@redhat.com>
>     wrote:
>     > > > >
>     > > > > On Thu, Oct 20, 2022 at 06:04:56PM +0530, Ani Sinha wrote:
>     > > > > >
>     > > > > >
>     > > > > > Changelog:
>     > > > > > v6:
>     > > > > >   - skip test when dependencies (xorriso for example) are not
>     installed.
>     > > > > >   - skip test when run on a platform other than x86_64.
>     > > > >
>     > > > > Hmm why is that btw?
>     > > >
>     > > > The bits binaries that generate the iso (grub-mkrescue etc) are built
>     > > > for and are known to work only on x86_64 platform. They might also
>     > > > work on amd64 but I do not have one at my disposal at the moment to
>     > > > check.
>     > > > On other platforms, for example 32 bit x86 and non-x86, those
>     binaries
>     > > > will likely not work. The test will fail.
>     > >
>     > > confused. I thought we are distributing the iso?
>     >
>     > No, the test builds the iso after adding the modified test scripts and
>     > then spawns the vm with it. It is all part of the test itself.
>     > We need to do that so that the iso contains the newly added tests etc.
> 
>     It's good to have for people developing tests, but for most qemu
>     developers please just have a ready iso and have avocado fetch it.
>     It's important to make tests run on all platforms.
> 
> 
> This changes things a lot and goes down the path of where do we check in test
> code changes? Do we deal with multiple repos? Where do we keep iso? Etc. having
> a static iso limits us also. 

It's the same as any firmware really. I don't see much of a difference.

> If we can think through and come up with a consensus, I can write a second
> test. Else let's just go with this first.

We can go ahead for now.

> If we are really keen on running
> tests on multiple platforms, we can have binaries built for those. 
> 

Oh my.  Not dealing with this is *exactly* what people use
virtualization for.

> 
> 
>     We can think about moving iso generation into a VM too
>     but as a first step I guess we can live with a container.
> 
>     --
>     MST
> 
> 


