Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F395F6BE7
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 18:37:49 +0200 (CEST)
Received: from localhost ([::1]:55160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogTsa-0005k7-Gf
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 12:37:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogSjO-0000Wo-Bm
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:24:14 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:35380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogSjM-0006ko-HI
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:24:14 -0400
Received: by mail-pf1-x42e.google.com with SMTP id i6so2368502pfb.2
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sYBgvSyhe/2Dk+jLlfks6J3/je+CE+oIu8sC5zESVlY=;
 b=s+T6R9qDXMjRv84lf+Z7PxXOUJ1OD3yHjI655MAOPezXxOWOU1FUYjgGHM1kyCRdt4
 9f2w3oUVMAtl9BVRTbsS3uQodzzJLRmq0cE39J0nxPUtUbvqhaLMbL9AZuXVk8MmMTnt
 QnsxQ3yXf0KpTMZlNVMpcprW/a2/6n39wRTQ6JCgR+6Lk3cFw+7dWkK2kKpBmdplh/vW
 jU8YxHLOoZ414yhpIsFn2k6ThBmMPsdkbpj+1K7xxE9ykIYzMTYMV3p2WgcMYR5EXQpd
 wLSUXWuTHifh7nYNKoRiUUOaXzh2N1iMgHsaayDJ3Og/mbtMdvOCccKMxl3/EbFA8Z20
 CBxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sYBgvSyhe/2Dk+jLlfks6J3/je+CE+oIu8sC5zESVlY=;
 b=BQPx68xSFaQHzgGL9zaCYyT3yCUKOzpNLF5roN+UwN5JD70a17pvqHiYoLM1NiIYcv
 XvgOwPNbDzaWH1kIZpoJsWRfpGymJu5PrMsNKxQ30MJODNSoxEraNJhgxzQQTeVupLVy
 Ox2Mjx8yX77DyNez4vLSxm347xkEUVXsBmG1O+NlhucVQoRLoO1h25JztorHraSN5/Dg
 1jqJWDtTiNanED4z52mk3149CXPaakpQWwSeRLZRx6aDnrghRMPk9Wd9t7vI9YBZZ2cL
 ffB4YoxjsgvZTn6KT/RnOr+6ua0LrWgXgEZUNVOTzPAadyvRNvYwNglwkLKNxP3VdCjo
 pxnQ==
X-Gm-Message-State: ACrzQf1RH/qnxV+PF0smN88VVlFBYo8hUeR+8sUrrRa0uS7BhrytUVSL
 JrKI+qOpkjIPENvbVtGtQt/jayfPAv1FqhKoUJJlBQ==
X-Google-Smtp-Source: AMsMyM51pVVAC/E/M0RXKhSbiV4i3cbDzpD/snT0lpYeeoeAibwko6b4wLS4U/fYrOatEX7Hhsa5OXDuKeayqIHVQMU=
X-Received: by 2002:a05:6a00:181f:b0:562:8e02:ec29 with SMTP id
 y31-20020a056a00181f00b005628e02ec29mr434415pfa.3.1665069849629; Thu, 06 Oct
 2022 08:24:09 -0700 (PDT)
MIME-Version: 1.0
References: <20221006113906.179963-1-mst@redhat.com>
 <27e666ae-0a91-1843-8eb0-c816ab261eb1@amsat.org>
In-Reply-To: <27e666ae-0a91-1843-8eb0-c816ab261eb1@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 16:23:58 +0100
Message-ID: <CAFEAcA8giQ=R2j5NZoOb33Wp8MzUt14k+zFbCG2yoj036+YkOQ@mail.gmail.com>
Subject: Re: [PATCH] gitmodules: recurse by default
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 6 Oct 2022 at 16:13, Philippe Mathieu-Daud=C3=A9 via
<qemu-devel@nongnu.org> wrote:
>
> Hi Michael,
>
> On 6/10/22 13:39, Michael S. Tsirkin wrote:
> > The most commmon complaint about submodules is that
>
> Typo "common"
>
> > they don't follow when one switches branches in the
> > main repo. Enable recursing into submodules by default
> > to address that.
> >
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >   .gitmodules | 23 +++++++++++++++++++++++
> >   1 file changed, 23 insertions(+)
>
> We have 3 kinds of submodule (or more?):
> 1/ required to *build* QEMU
> 2/ required to *test* QEMU
> 3/ only here for satisfies license of firmware blobs shipped with QEMU.
>
> IIUC, long-term we want to move 3/ in another repository.
>
> Could we only set "recurse=3Dtrue" for 1/ ?
>
> What is your use-case? Do we need it also for 2/ ?

I think if we're going to change the git handling of submodules
from the default, it's probably going to be less confusing if
all our submodules behave the same way, rather than some being
the git-default and some the recurse=3Dtrue behaviour. Assuming
there's no reason why we would need some submodules to keep
the recurse=3Dfalse behaviour, of course...

-- PMM

