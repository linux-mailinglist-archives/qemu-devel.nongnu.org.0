Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5DE48BEE1
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 08:14:05 +0100 (CET)
Received: from localhost ([::1]:55902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Xpc-0002hf-Hy
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 02:14:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <roman@roolebo.dev>) id 1n7XmL-0001kC-7O
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 02:10:44 -0500
Received: from [2a00:1450:4864:20::143] (port=33695
 helo=mail-lf1-x143.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <roman@roolebo.dev>) id 1n7XmJ-0008Ic-D8
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 02:10:40 -0500
Received: by mail-lf1-x143.google.com with SMTP id k21so5041247lfu.0
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 23:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=roolebo.dev; s=mail;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=uk5JB16k0UKe956XM6P82s63ILGFnf13cTGV5sNnTvw=;
 b=birViMxBR0xTxb5oI7PjDZUN/V0Vp5I/FONgk1RAxtjF59YdIGwFweQoi0xXCVxIHO
 hAPPkc/t6tQMdFAJAcWKNc64dCsmSBqfMWqutx0nG2N8ZkXNPyKiDjiU+lgjPXJUj+Bl
 qRmskEJF/ZcalqfK+i1zTtQ4smVHRHgORWJD9v/sY1QkpsrPE1V9CEFj8ABYbVro5+im
 gDxyxjhomVu6/KfLx7f9cwSzi/BqG/gjnvfNZUZrKWPw2fjaFdY2megSLAVaesiIgV4O
 N/QCHN2O+/rRHmWCw+dnXrPGdHUCW2b5PPpF9bPeZ51RsUSMYWIB+RjjWVWv3DMy1ssp
 1UQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=uk5JB16k0UKe956XM6P82s63ILGFnf13cTGV5sNnTvw=;
 b=N+JEOOv/Okzs0UFS1Clty3y38j2TJlPH9zqSrxjVpJ6h4q8yd0T8CUb5EeroFXDQIf
 jJQ+O6kHqdYKNOIZUtjeFwTPF7WtUlhbDY+YKFdbPLLkGAGqxmIGYkx+y9Xw/Y0y4yZ9
 zabO2d63byFRGcN+CJO7iFBbfdjSx85CVqmtDY3shqz+c8eOa/bRteOYZKMqvhrt5hK9
 0xSEhFKlqFYB0IZUgYw/Mjkv9smo9kBZwCAIIRjwURcB6sqL5gyRbFd4+3wvxHJ8Ip3H
 0Z1k3190TsBj+0Ywh0JxwY3eSO6iLWat25HJRg9x0dtqrgZfaY10jv0X+LoFSLvf4GRM
 nNCQ==
X-Gm-Message-State: AOAM533C5c+f8RWDJrjMqXiPw3+K5Lh3xHGpC15p30T8USNkn0XSscBv
 AKj0AZukkiFNQxQ6CuDOEOTwnQ==
X-Google-Smtp-Source: ABdhPJySRHzSg6tr9L/O9+mCTSq6vxRDXph88P6n9CyCfweVjJZ5nwtHXXA3pczDNMwGinf/YXRUfA==
X-Received: by 2002:a05:6512:3f2:: with SMTP id
 n18mr5796194lfq.185.1641971437424; 
 Tue, 11 Jan 2022 23:10:37 -0800 (PST)
Received: from localhost (ip-185-108-208-32.ip.asarta.ru. [185.108.208.32])
 by smtp.gmail.com with ESMTPSA id u11sm1265601lfg.143.2022.01.11.23.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 23:10:36 -0800 (PST)
Date: Wed, 12 Jan 2022 10:10:36 +0300
From: Roman Bolshakov <roman@roolebo.dev>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PULL 00/13] Net patches
Message-ID: <Yd5+7P0Hazp+FvSt@roolebo.dev>
References: <20220110034000.20221-1-jasowang@redhat.com>
 <CAFEAcA8qJM1ekUTBQ3eyBCBi6Avk1H=MqP0vMmFdJo-MgoEUAQ@mail.gmail.com>
 <CACGkMEvdFJCY7GBu+0cMBVVfdDN+9+H14QvF9R0LZyo74ZDSag@mail.gmail.com>
 <CADO9X9Q745CTFWA+spCfzvaC03+xYR63mbSnARUEP6xYaAefJA@mail.gmail.com>
 <0a747f8c-6839-9265-e0a4-dfa42cb05d03@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a747f8c-6839-9265-e0a4-dfa42cb05d03@redhat.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::143
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::143;
 envelope-from=roman@roolebo.dev; helo=mail-lf1-x143.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 12, 2022 at 01:39:28PM +0800, Jason Wang wrote:
> 
> 在 2022/1/12 上午6:02, Vladislav Yaroshchuk 写道:
> > 
> > 
> > вт, 11 янв. 2022 г., 5:10 AM Jason Wang <jasowang@redhat.com>:
> > 
> >     On Tue, Jan 11, 2022 at 12:49 AM Peter Maydell
> >     <peter.maydell@linaro.org> wrote:
> >     >
> >     > On Mon, 10 Jan 2022 at 03:40, Jason Wang <jasowang@redhat.com>
> >     wrote:
> >     > >
> >     > > The following changes since commit
> >     df722e33d5da26ea8604500ca8f509245a0ea524:
> >     > >
> >     > >   Merge tag 'bsd-user-arm-pull-request' of
> >     gitlab.com:bsdimp/qemu into staging (2022-01-08 09:37:59 -0800)
> >     > >
> >     > > are available in the git repository at:
> >     > >
> >     > > https://github.com/jasowang/qemu.git tags/net-pull-request
> >     > >
> >     > > for you to fetch changes up to
> >     5136cc6d3b8b74f4fa572f0874656947a401330e:
> >     > >
> >     > >   net/vmnet: update MAINTAINERS list (2022-01-10 11:30:55 +0800)
> >     > >
> >     > > ----------------------------------------------------------------
> >     > >
> >     > > ----------------------------------------------------------------
> >     >
> >     > Fails to build on OSX Catalina:
> >     >
> >     > ../../net/vmnet-common.m:165:10: error: use of undeclared identifier
> >     > 'VMNET_SHARING_SERVICE_BUSY'
> >     >     case VMNET_SHARING_SERVICE_BUSY:
> >     >          ^
> >     >
> >     > This constant only got added in macOS 11.0. I guess that technically
> >     > our supported-platforms policy only requires us to support 11
> >     (Big Sur)
> >     > and 12 (Monterey) at this point, but it would be nice to still
> >     be able
> >     > to build on Catalina (10.15).
> > 
> >     Yes, it was only supported by the vmnet framework starting from
> >     Catalyst according to
> >     https://developer.apple.com/documentation/vmnet?language=objc.
> > 
> > 
> > Yes, there are some symbols from macOS >= 11.0 new backend
> > uses, not only this one, ex. vmnet_enable_isolation_key:
> > https://developer.apple.com/documentation/vmnet/vmnet_enable_isolation_key
> > 
> >     >
> >     > (Personally I would like Catalina still to work at least for a
> >     little
> >     > while, because my x86 Mac is old enough that it is not supported by
> >     > Big Sur. I'll have to dump it once Apple stops doing security
> >     support
> >     > for Catalina, but they haven't done that quite yet.)
> > 
> > 
> > Sure, broken builds on old macOSes are bad. For this case I think
> > it's enough to disable vmnet for macOS < 11.0 with a probe while
> > configure build step. Especially given that Apple supports ~three
> > latest macOS versions, support for Catalina is expected to end
> > in 2022, when QEMU releases 7.0.
> 
> 
> That should be fine.
> 

I agree with Peter on this,

There's a lot of hardware running with Catalina. I think it's useful to
support it a little longer.

Regards,
Roman

> 
> > 
> > If this workaround is not suitable and it's required to support vmnet
> > in Catalina 10.15 with a subset of available features, it can be done.
> > But I'll be ready to handle this in approximately two-three weeks only.
> > 
> >     Sure, Vladislav please fix this and send a new version.
> > 
> > 
> > Quick fix as described above is available in v10:
> > https://patchew.org/QEMU/20220111211422.21789-1-yaroshchuk2000@gmail.com/
> 
> 
> Have you got chance to test that for macOS < 11.0?
> 
> Thanks
> 
> 
> >     Thanks
> > 
> >     >
> >     > -- PMM
> >     >
> > 
> > 
> > 
> > 
> > -- 
> > Best Regards,
> > 
> > Vladislav Yaroshchuk
> 
> 

