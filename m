Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6BA48A576
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 03:12:35 +0100 (CET)
Received: from localhost ([::1]:49640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n76eH-0006qP-Sb
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 21:12:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n76bw-0005vq-W8
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 21:10:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n76br-0005lj-Ny
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 21:10:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641867003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+8Orbrn7ZGlkAlnDzXwzVur3iljhIQ2kzfzVv28ihSY=;
 b=Z8gg1Z3LSwiJHypaRhKfbKZGBExuuEwTojb45KqQn0b5umXKVeBNwiGr1lS73lgTsbte2D
 vFrEpfVodFxXSiaFwi0zyNXJxcBvYFqWJRjuMTDBNs6jmqrZrOKQ9MvbfRrofiYeXlalsT
 DGoTfdfNNazSHCndLSCVXljSA0nR5/w=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-MjxOa9RpNH6Yd24hD4IXPw-1; Mon, 10 Jan 2022 21:10:00 -0500
X-MC-Unique: MjxOa9RpNH6Yd24hD4IXPw-1
Received: by mail-lf1-f70.google.com with SMTP id
 d12-20020a196b0c000000b0042afa90ae9bso5434827lfa.12
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 18:09:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+8Orbrn7ZGlkAlnDzXwzVur3iljhIQ2kzfzVv28ihSY=;
 b=inDC1p3Jpoj/sfE9f88ymPCMe0YuBaBLQvNp9xAjRoP7zWYMPn/hCndGxHDBBEPc9y
 EXFgX2/bKEKF+oWMGmAnQJq8L7lQs2vaj+yJ8OoRYXEx/y86uI6howJluDDjalOAeo2W
 w/A1d7UDxoOaetUZI11s4UCWn2cdqG74xI24zx6g8swpfcFKmOrT8sDrzBUkiyuD5VVu
 s+9vHRrHo+Ck8cMQQ2YcKpK4XJBvlH2pBIvK2dyTLVRTJF2ENCb9rbe4w0WU+zOsb3wD
 5t0yanirU0w+HDZZeh/4tVHNfOL1mGjWICLapbq+b2vqmde92mhDqh7w0Es3e8FH8ejX
 eo2A==
X-Gm-Message-State: AOAM532KG/VqydZIHxqyZ6CQfVgmnyfZYkhGnqw/voxEknBbFw7XHNSo
 vhXN/2XjKYXb7shcnvZe+pJNA6RXc2To9jbDuN213M8Sw+aQT8oM1L6iN3bkfwJFGDzfF7G6Oob
 TYHoNdLPRq49LkG9slPWZjxtjCXKNpQk=
X-Received: by 2002:a19:760f:: with SMTP id c15mr1763538lff.498.1641866998243; 
 Mon, 10 Jan 2022 18:09:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwC5fjVaPfmP26Mj1TuGUjXI6otRnI8i9LU+6kaV61BRdZXACTUfz2V8yvQlQLLIfZ6tCbXToNy9Mv/RTmM2kE=
X-Received: by 2002:a19:760f:: with SMTP id c15mr1763525lff.498.1641866997975; 
 Mon, 10 Jan 2022 18:09:57 -0800 (PST)
MIME-Version: 1.0
References: <20220110034000.20221-1-jasowang@redhat.com>
 <CAFEAcA8qJM1ekUTBQ3eyBCBi6Avk1H=MqP0vMmFdJo-MgoEUAQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8qJM1ekUTBQ3eyBCBi6Avk1H=MqP0vMmFdJo-MgoEUAQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 11 Jan 2022 10:09:46 +0800
Message-ID: <CACGkMEvdFJCY7GBu+0cMBVVfdDN+9+H14QvF9R0LZyo74ZDSag@mail.gmail.com>
Subject: Re: [PULL 00/13] Net patches
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 11, 2022 at 12:49 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 10 Jan 2022 at 03:40, Jason Wang <jasowang@redhat.com> wrote:
> >
> > The following changes since commit df722e33d5da26ea8604500ca8f509245a0ea524:
> >
> >   Merge tag 'bsd-user-arm-pull-request' of gitlab.com:bsdimp/qemu into staging (2022-01-08 09:37:59 -0800)
> >
> > are available in the git repository at:
> >
> >   https://github.com/jasowang/qemu.git tags/net-pull-request
> >
> > for you to fetch changes up to 5136cc6d3b8b74f4fa572f0874656947a401330e:
> >
> >   net/vmnet: update MAINTAINERS list (2022-01-10 11:30:55 +0800)
> >
> > ----------------------------------------------------------------
> >
> > ----------------------------------------------------------------
>
> Fails to build on OSX Catalina:
>
> ../../net/vmnet-common.m:165:10: error: use of undeclared identifier
> 'VMNET_SHARING_SERVICE_BUSY'
>     case VMNET_SHARING_SERVICE_BUSY:
>          ^
>
> This constant only got added in macOS 11.0. I guess that technically
> our supported-platforms policy only requires us to support 11 (Big Sur)
> and 12 (Monterey) at this point, but it would be nice to still be able
> to build on Catalina (10.15).

Yes, it was only supported by the vmnet framework starting from
Catalyst according to
https://developer.apple.com/documentation/vmnet?language=objc.

>
> (Personally I would like Catalina still to work at least for a little
> while, because my x86 Mac is old enough that it is not supported by
> Big Sur. I'll have to dump it once Apple stops doing security support
> for Catalina, but they haven't done that quite yet.)

Sure, Vladislav please fix this and send a new version.

Thanks

>
> -- PMM
>


