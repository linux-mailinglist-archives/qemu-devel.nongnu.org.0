Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A2B48C812
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 17:17:57 +0100 (CET)
Received: from localhost ([::1]:55128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7gJv-0002rE-Qk
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 11:17:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <roman@roolebo.dev>) id 1n7gHr-0001Pd-AT
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 11:15:47 -0500
Received: from [2a00:1450:4864:20::131] (port=46924
 helo=mail-lf1-x131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <roman@roolebo.dev>) id 1n7gHn-0003fd-OC
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 11:15:45 -0500
Received: by mail-lf1-x131.google.com with SMTP id d3so9775880lfv.13
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 08:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=roolebo.dev; s=mail;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=paUwj7dH2gJ6TrJNsUsL2LHNWC+CYv7oPrz4Bkz8sPM=;
 b=Q7HVmmKbRfM9Lx9HPIzC0Ezr4ySlK9hp5ose+cp10x5EAlQ3wNq7ZSmRrNpEiz1+NG
 6H0LeLIV9r522+PJdl8G1u3Q8kB8rrJDhiTO2VFYZWMdSK5JjNIc+00/bH5KOJ1iMPTn
 wpZ5WmR9OZ6rlMN2+oDc2TnRvKq8Ih+Iq1wb1uhuTkgKakwV4yn4BnmOgeiUcZ9XpBfr
 jDjUWjRLShSEIntmV9vYfpnlu+9i7GhSP33pzTjDnzkVSB71cRW3cyj/5TiVpMHD2Itf
 MXjURZBSMW9tJwhhpk63yh8jAHV1NDOpHFCfFQ/lMtL+TjaZKtxy2xREpwVcF/dJSozC
 TrcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=paUwj7dH2gJ6TrJNsUsL2LHNWC+CYv7oPrz4Bkz8sPM=;
 b=wR4JFazuZKc4kbt7Yi4qljRiscwCTUPWnHtylhH5qgS6q6y62GCrdgpiT7ZaCkhV9o
 +4kWr3Bv8Hsp/5V3Dwmvnhkrv9aRJMaX5A4c3cBffYPIiAFJ4N9BNkJy9JsoL8NAOZuE
 nAAagsobjcX3aVNX6OupRw3crfrgyq0ydA+v6L+JK0BLZ4p8WRpYINWua1HK7GGb6JwX
 +eRWb+s6KXAitnTpgRjAjvz8scClxS7Ez+LeHjkBJYksMm57pOt1PvWZXh+IrPTGao2W
 Z5it9621RPKdM/F2SSlhg+nHtRCmUwCKvhiwcsuTRWJf5weoRb2kNldJGwsxNSk9/+xl
 c1lA==
X-Gm-Message-State: AOAM532bYMBcuYKReARPhncSTgmZSl4O09YVsQsdSeZk4l8KvJWzCsi0
 58o+RHM5mRVnAaQNWhJ4QSj4QQ==
X-Google-Smtp-Source: ABdhPJw0MClYhG44KAZD7+EpKL3PXJ1tnDbzZK0Ki58bHog21eVnRJ/jOedAi3R8pR1UEqO0HLUkew==
X-Received: by 2002:a05:6512:689:: with SMTP id
 t9mr319466lfe.354.1642004141617; 
 Wed, 12 Jan 2022 08:15:41 -0800 (PST)
Received: from localhost (ip-185-108-208-32.ip.asarta.ru. [185.108.208.32])
 by smtp.gmail.com with ESMTPSA id v28sm30180lfg.101.2022.01.12.08.15.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 08:15:41 -0800 (PST)
Date: Wed, 12 Jan 2022 19:15:40 +0300
From: Roman Bolshakov <roman@roolebo.dev>
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Subject: Re: [PATCH v10 0/7] Add vmnet.framework based network backend
Message-ID: <Yd7+rGl6rtpXHVo6@roolebo.dev>
References: <20220111211422.21789-1-yaroshchuk2000@gmail.com>
 <Yd6ILKV75g4jll46@roolebo.dev> <Yd6PzI05p7y7PkGy@roolebo.dev>
 <CADO9X9Snf8GBkBkwkCQ7Ks2cpRKpCM5Y557FssyS5LctZdBu2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADO9X9Snf8GBkBkwkCQ7Ks2cpRKpCM5Y557FssyS5LctZdBu2Q@mail.gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::131
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::131;
 envelope-from=roman@roolebo.dev; helo=mail-lf1-x131.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, phillip.ennen@gmail.com,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Phillip Tennen <phillip@axleos.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Howard Spoelstra <hsp.cat7@gmail.com>,
 Alessio Dionisi <hello@adns.io>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 12, 2022 at 04:23:30PM +0300, Vladislav Yaroshchuk wrote:
> ср, 12 янв. 2022 г. в 11:22, Roman Bolshakov <roman@roolebo.dev>:
> 
> > On Wed, Jan 12, 2022 at 10:50:04AM +0300, Roman Bolshakov wrote:
> > > On Wed, Jan 12, 2022 at 12:14:15AM +0300, Vladislav Yaroshchuk wrote:
> > > > v9 -> v10
> > > >  - Disable vmnet feature for macOS < 11.0: add
> > > >    vmnet.framework API probe into meson.build.
> > > >    This fixes QEMU building on macOS < 11.0:
> > > >
> > >
> > > Hi Vladislav,
> > >
> > > What symbols are missing on Catalina except VMNET_SHARING_BUSY?
> > >
> > > It'd be great to get the feature working there.
> > >
> > > Thanks,
> > > Roman
> > >
> >
> > Ok it turned out not that many symbols are needed for successfull
> > compilation on Catalina:
> >
> > vmnet_enable_isolation_key
> > vmnet_network_identifier_key
> > VMNET_SHARING_SERVICE_BUSY
> >
> > The compilation suceeds if they're wrappeed by ifdefs. I haven't tested
> > it yet though.
> >
> >
> New version with Catalina 10.15 support submitted as v11.
> 

Thanks!

I appreciate that.

Regards,
Roman


