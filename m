Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0774F532751
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 12:18:17 +0200 (CEST)
Received: from localhost ([::1]:48782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntRcF-0008DD-PJ
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 06:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1ntRZ4-0006g1-Fg
 for qemu-devel@nongnu.org; Tue, 24 May 2022 06:14:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1ntRZ1-0003v1-LX
 for qemu-devel@nongnu.org; Tue, 24 May 2022 06:14:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653387293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lyPfAYV17m0LSQieCJHwtPTvQA+u86v5o9yGe6wRasM=;
 b=Qi4d1v7KyPyrYudRMB3jUFwG84GJPzVMgtIu4t6h8vadMUKMBrfJ5QRgiAzw2MePbR8cOC
 1ODCaTOHXICiMh/PQ1P1BZ4KVzO+X+KZin6tCTfc+T1rE1kN/n2VR6BCj8BWo7lK5ASUCy
 g1G0SsXRahq/4AcUnpZXg+jG+uW3mhQ=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-208-KA-3RhAjPzeo6_MKYi-xwQ-1; Tue, 24 May 2022 06:14:52 -0400
X-MC-Unique: KA-3RhAjPzeo6_MKYi-xwQ-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-30026cf9af8so15797647b3.3
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 03:14:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lyPfAYV17m0LSQieCJHwtPTvQA+u86v5o9yGe6wRasM=;
 b=ZPSuoL81OA7WKpNo/UD3CfeoYagq6kUp33qSRW0FnLlu6I1pOgyGt5jL8qMJNmik83
 idzHtOhq+URWlLjwNPlMyjI5xo58kx1C0LUqgAF7loLxH1NF57quypql/KcogBYQB+yE
 ZGDjeuIVgPXE5tSqGUsexv95co9l9HGxarK8le0oIV/YiqKsf/ngqrZw7c5OvUWhHEzu
 cllggnqkn6To0ar5dgqmWF238G0/zAlqqCSLwVdWa0eYRS+xWWPiAni+v+FbRHl0R8RV
 UB07wGAUHY+deyWQQrJ2ZPpJJ+4d+MWYYsM3YA88kzLhCcnps6NfRXsXGU0XBr289SgO
 /yUQ==
X-Gm-Message-State: AOAM532s7o8tkLsMw2dRCosrDn2wKn271HAB+n+7sSJz9fa3AZYrQN6b
 m/VqsUGJxjgB3zYot5o0BQz6wjxRLJmlXTdVLkvK80eEshgZty3a5diWlFaqJ6rg9iWN/L1pWU5
 3eWukvORwH1A4RxAFqk0i2x3gfvpgnQ8=
X-Received: by 2002:a25:2d4b:0:b0:64d:a722:b4ae with SMTP id
 s11-20020a252d4b000000b0064da722b4aemr24772807ybe.87.1653387292207; 
 Tue, 24 May 2022 03:14:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvVJCP4eg7MyCq1hSoXtB6RdlOuBdyg/KS8/lUN6rQGCJPCh+t3gODWdkTr2C5fD+LqXcELa3ZQCmwDI7pYk8=
X-Received: by 2002:a25:2d4b:0:b0:64d:a722:b4ae with SMTP id
 s11-20020a252d4b000000b0064da722b4aemr24772797ybe.87.1653387292014; Tue, 24
 May 2022 03:14:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220523194111.827805-1-kkostiuk@redhat.com>
 <20220523194111.827805-3-kkostiuk@redhat.com>
 <541f46cf-fc45-f7bb-e121-2aad216e11d5@linaro.org>
 <CAPMcbCq7fzubG4ej7p164vwQkCMChjWBubx27R=kVxukWDhuBg@mail.gmail.com>
 <CAPMcbCqeQ_7YuJg+eS9Qqtq9ptRb57_wfT=jGOuHYtx64M5azA@mail.gmail.com>
In-Reply-To: <CAPMcbCqeQ_7YuJg+eS9Qqtq9ptRb57_wfT=jGOuHYtx64M5azA@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 24 May 2022 12:14:41 +0200
Message-ID: <CAMxuvawvaZBp0sxV-jwQuDwxahuFjN10BDcBcgOn88XpN87RPA@mail.gmail.com>
Subject: Re: [PULL 2/3] qga-win32: Add support for NVME but type
To: Konstantin Kostiuk <kkostiuk@redhat.com>, Stefan Weil <sw@weilnetz.de>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
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

Hi

On Tue, May 24, 2022 at 12:02 PM Konstantin Kostiuk <kkostiuk@redhat.com> w=
rote:
>
> Hi Richard and Marc-Andr=C3=A9
>
> I looked into the compilation problem and have 2 solutions:
> 1. We can add some conditions to the win2qemu definition and
> skip NVME support when old mingw-headers are used.
> 2. We can bump the version of the Fedora docker image to 36 or 37
> that is used for cross-compilation tests.
>
> I think the second option is more valuable because we remove
> pregenerated qga-vss.tlb file and now we can check VSS build only
> at Fedora 37.
>
> What do you think?

I'd try to do both: fix compilation with older headers, and bump our
CI to f36. I don't know if our windows build environment has strict
requirements like the unix/distro (build on old-stable for 2y). The
resulting win32 build is often shipped with all the dependencies (like
the installer from Stefan Weil). But there are also rolling "native"
distros, like msys2...


