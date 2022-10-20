Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF02F6068C4
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 21:19:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olb4d-0001MV-DF
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 15:19:23 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olayp-0007P3-Ja
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 15:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1olayh-0007Ng-BO
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 15:13:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1olaye-0006Ba-F9
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 15:13:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666293191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=roFI3iULXOGumI4q7r4eT4Mr0CDAsSrGZD3siRdEgH8=;
 b=btVmklVL1bTh0X7eaz2ExZlvWkZImSRgllglyGvimz55+TQMeHUDfnhLh20rLWm0SwajQG
 ghvNgy9Dzrhhmmsmew9dYhcNG/uFQSVMjPAvR2FwJyQ3hHMJ0/X/F1E60mSl1t9bCqGNz0
 STpfUTLotI2R77I3ZH9lyBxnIM6gnts=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-132-Utqz2uKvPYe6QTvEvUVmHg-1; Thu, 20 Oct 2022 15:13:07 -0400
X-MC-Unique: Utqz2uKvPYe6QTvEvUVmHg-1
Received: by mail-wr1-f69.google.com with SMTP id
 g4-20020adfbc84000000b0022fc417f87cso99405wrh.12
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 12:13:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=roFI3iULXOGumI4q7r4eT4Mr0CDAsSrGZD3siRdEgH8=;
 b=ydqlJo2mKpQd8HqKYgPanoY0MKYQvwEWthtckQM0sEBZhTnvPgs9a/BHHLg9sCjgX9
 WS16cDKkK3Q8dokJd1/EftB2AQYd1hO7imVd1AFZJIZDyfWs+j3rAGI1hPnwsJnOoROS
 6TjCEffqYuKcbI8hh/4+7MwzoiMUXOeMYuzi+SSucHpF5fARGc7sEpGl20YMdS12Qg6M
 jMQhjetLyM6P4HpF3ElYYgE2Hae6ODrRC478agnLmLWnBt1lB6Zu7Tr9amYVkwMdHtKg
 2jUbmYHQJP8rknNeDpiYcf6FAPVic2+LIQiwW8RGqGzrso+B2ivPRLdl7Tio2Vx6DYaa
 Mm6w==
X-Gm-Message-State: ACrzQf2zmlSCVkghL0Lp6YnX4K/yo2XzKOa8AOj+cgDz75kADKvqDzwx
 Ytrem7QMSCdUCydR3rPwtPtJHacWrZyc+xgUlpqTLVPmeKSiWI2qQMb7LfjkZtFNKoDZ7k6FX5w
 uGosqQhKE5JKAAeE=
X-Received: by 2002:adf:d23a:0:b0:236:467e:a3bc with SMTP id
 k26-20020adfd23a000000b00236467ea3bcmr2632493wrh.542.1666293186441; 
 Thu, 20 Oct 2022 12:13:06 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM776T+LFVwcKF9C3v9ZUND8hyLnzNTsCDbsXzwRSlnMXFtmmw+ib8FE5lMuHI21Tjk8w4W95g==
X-Received: by 2002:adf:d23a:0:b0:236:467e:a3bc with SMTP id
 k26-20020adfd23a000000b00236467ea3bcmr2632473wrh.542.1666293186120; 
 Thu, 20 Oct 2022 12:13:06 -0700 (PDT)
Received: from redhat.com ([2.54.191.184]) by smtp.gmail.com with ESMTPSA id
 h10-20020a5d504a000000b0022a9246c853sm17116066wrt.41.2022.10.20.12.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 12:13:05 -0700 (PDT)
Date: Thu, 20 Oct 2022 15:13:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Cleber Rosa <crosa@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Qemu Devel <qemu-devel@nongnu.org>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Maydell Peter <peter.maydell@linaro.org>,
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v6 00/10] Introduce new acpi/smbios avocado tests using
 biosbits
Message-ID: <20221020150857-mutt-send-email-mst@kernel.org>
References: <20221020123506.26363-1-ani@anisinha.ca>
 <20221020083810-mutt-send-email-mst@kernel.org>
 <CAARzgwwd_How_h+9sHWPOrWWZ7CbX+DN-uy-KiGf1VVyVmrLnA@mail.gmail.com>
 <20221020084311-mutt-send-email-mst@kernel.org>
 <CAARzgwxfKbrxAqb15GXp4j1enDPUhGBsL5jUzFtDvJkGM-7azw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAARzgwxfKbrxAqb15GXp4j1enDPUhGBsL5jUzFtDvJkGM-7azw@mail.gmail.com>
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

On Thu, Oct 20, 2022 at 06:20:20PM +0530, Ani Sinha wrote:
> On Thu, Oct 20, 2022 at 6:15 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Thu, Oct 20, 2022 at 06:12:10PM +0530, Ani Sinha wrote:
> > > On Thu, Oct 20, 2022 at 6:08 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Thu, Oct 20, 2022 at 06:04:56PM +0530, Ani Sinha wrote:
> > > > >
> > > > >
> > > > > Changelog:
> > > > > v6:
> > > > >   - skip test when dependencies (xorriso for example) are not installed.
> > > > >   - skip test when run on a platform other than x86_64.
> > > >
> > > > Hmm why is that btw?
> > >
> > > The bits binaries that generate the iso (grub-mkrescue etc) are built
> > > for and are known to work only on x86_64 platform. They might also
> > > work on amd64 but I do not have one at my disposal at the moment to
> > > check.
> > > On other platforms, for example 32 bit x86 and non-x86, those binaries
> > > will likely not work. The test will fail.
> >
> > confused. I thought we are distributing the iso?
> 
> No, the test builds the iso after adding the modified test scripts and
> then spawns the vm with it. It is all part of the test itself.
> We need to do that so that the iso contains the newly added tests etc.

It's good to have for people developing tests, but for most qemu
developers please just have a ready iso and have avocado fetch it.
It's important to make tests run on all platforms.

We can think about moving iso generation into a VM too
but as a first step I guess we can live with a container.

-- 
MST


