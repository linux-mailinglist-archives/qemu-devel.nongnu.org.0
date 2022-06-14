Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EEC54A8C2
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 07:29:26 +0200 (CEST)
Received: from localhost ([::1]:53552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0z7F-0003QP-TW
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 01:29:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o0yy5-0004kj-KB
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 01:19:57 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:37698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o0yy3-0001Ct-OH
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 01:19:57 -0400
Received: by mail-ed1-x52f.google.com with SMTP id v19so9994406edd.4
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 22:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jWmk2sbUxhDFN3aJ3GTbd+0tKXPZrCZGEHU4wqZJjDY=;
 b=z5D3dXsfGcMwpZMSc1pS0xq/oGU7ZKM7Kn+vDno8TrGn94tcgTVLqxG8ie4KzDSOl1
 om1Kqi1QxiiujmDkobUGmeDaNxWtaeY1NzJtQ/zDB1plVu6/eWUN9SscBQ3XcCuZ/vek
 VUXif/O5TKIeIn7aiI09fXUyinWjy6O3TNfZcTWicb4wFKBj53gUnPLDwbDNdYOH+f/c
 hZ+SPgZZK3nwptli+FVQL3RBdwVLDl500zPQx46FDPd3HUOv92BQaV/3UM5NRL7bvpag
 R7mn9JFg3C93UEuGE0lC3/1bMb1Qus6N459XoLxOzDJOxlfA7bYo5biCBr0B9ZzRViEq
 kUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jWmk2sbUxhDFN3aJ3GTbd+0tKXPZrCZGEHU4wqZJjDY=;
 b=6Lmpl8zr1nMLMKxC9/Hb421/gtAOko4QZW0jFH35+xrFSfCTCEVlZlScNPpcvKaEKC
 ZVcahjjmFA/jGv5QbjLi87pvZR1scwV47vO1cH1Et2TGNk6e/qrhJcUfsaCAZ+Vlr4R/
 N3NWxboTdywOzuUBSqREeKj8a199d4mJhQXi3p//GdV6uCAv3wbLUqUX5836tWCmf+B7
 L/5QPbhK4tAUo5YVUoCwYDUkTKtPcxmNAlyehZ5lxwbidgtNCvNGI402+KxEBCxouiiZ
 yH+6T3hK1Iuw3nY6LEMfwdhDhrq7rUejAQxu4SLfN3muwE1V5GyPbuRg8FxqFmfXTsz0
 +pyQ==
X-Gm-Message-State: AOAM532PWQeFhST1M4wpB4Wg15t5/Hpwspxp0SIXwbbyNFbzKf00gWMx
 O3Bq1Ovq/eMkSl7RR3V33jHABV+YPASN1fxrYHIX
X-Google-Smtp-Source: ABdhPJxKGHMPokBwb602EzaictqJVG0xMO9bX0zuq/iHUnRjuzbwWOyp9lS6tgPDXCgCcuNII8qUn8RGX6sHvmoy4mo=
X-Received: by 2002:a50:eb92:0:b0:42d:ce7c:721f with SMTP id
 y18-20020a50eb92000000b0042dce7c721fmr3582854edr.147.1655183992941; Mon, 13
 Jun 2022 22:19:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220609172149.293877-1-kwolf@redhat.com>
 <a8b15969-fafa-e088-d778-278891c3970e@linaro.org>
 <YqduD9+GzwNLggWK@redhat.com>
In-Reply-To: <YqduD9+GzwNLggWK@redhat.com>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Tue, 14 Jun 2022 13:19:41 +0800
Message-ID: <CACycT3uHc+yx0A54JwQdJhXciv_+QYRuDYxzYZ4nmf=r=Knaiw@mail.gmail.com>
Subject: Re: Re: [PULL 00/18] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=xieyongji@bytedance.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

On Tue, Jun 14, 2022 at 1:04 AM Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 09.06.2022 um 22:18 hat Richard Henderson geschrieben:
> > On 6/9/22 10:21, Kevin Wolf wrote:
> > > The following changes since commit 028f2361d0c2d28d6f918fe618f389228ac22b60:
> > >
> > >    Merge tag 'pull-target-arm-20220609' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-06-09 06:47:03 -0700)
> > >
> > > are available in the Git repository at:
> > >
> > >    git://repo.or.cz/qemu/kevin.git tags/for-upstream
> > >
> > > for you to fetch changes up to 7f9a8b3342ff00d3398fdc08264948762d748edb:
> > >
> > >    nbd: Drop dead code spotted by Coverity (2022-06-09 18:07:17 +0200)
> > >
> > > ----------------------------------------------------------------
> > > Block layer patches
> > >
> > > - Add vduse-blk export
> > > - Dirty bitmaps: Fix and improve bitmap merge
> > > - gluster: correctly set max_pdiscard
> > > - rbd: report a better error when namespace does not exist
> > > - aio_wait_kick: add missing memory barrier
> > > - Code cleanups
> >
> > Several sets of compile failures:
>
> Hi Yongji,
>
> the vduse-blk code fails to compile with clang as shown below. As you
> already sent another series to fix up other bugs introduced in the
> series, maybe it would be better if you can send a new version with all
> of the necessary fixes squashed in instead of me trying to make minimal
> fixes to get it to compile with clang.
>

OK, I have sent a new version including the fix.

Thanks.
Yongji

