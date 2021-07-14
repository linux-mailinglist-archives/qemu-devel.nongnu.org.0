Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DE13C829D
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 12:17:43 +0200 (CEST)
Received: from localhost ([::1]:48324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bxW-00034l-Bb
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 06:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m3buL-0001Kq-5v
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 06:14:25 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:45051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m3buJ-0004Mk-Ix
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 06:14:24 -0400
Received: by mail-io1-xd2f.google.com with SMTP id v26so1332399iom.11
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 03:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SUsbANzlI7N6m0b2hhxisORpnsRBPZ/HbDoOz/DQaRk=;
 b=t5rggvxpxEWU9vl4xB4QYoP8DC9DdJteE+s9vMMftABBfO+WDBm3yCGZfUSGfzOTwX
 f6Uk0+bJRhA4wu52139zE2flvj21JtoDW+to2iiGI+2yjmhm7i9ZNctxILE147bS/6FR
 oI7Wt6ps68yBans2VGtsjLDkamhQTi/fv2wQfb1q3gdsuIvsRRdKfYt+R6hLCrZ1sgXM
 Ol8NKgocdU3hUnilvhqgTEvEeNpceAd2i5Ftrhvzkv0+OyOCSDY27Zr9mWJ3yP3xgZJ7
 4Sp1zqvlT19jqZyCUOUga31J1QypzXpOqyZYEwxttoJ/qAg8fCzLwuktMzXb3NT0pGeO
 5gLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SUsbANzlI7N6m0b2hhxisORpnsRBPZ/HbDoOz/DQaRk=;
 b=tZ1bYN8TNk1OJY5FewNe/YL6zL9tAZe52DdTk6+0XztyUFU3tZIzxP+rfRXMDRKy70
 uuE0jQkhNztG9AsuyP1OV5UdE2VJto+hUMebzxpD68dQBdBaWftAj9HnrC15TDi0f0ir
 RfyTpBZl7quXB5fuz1p42xQdxDngUEVbTxVg9N/LRyU6zAeNLG+DJUYzobRKoJKQUl+E
 5019oI+hoiZ3CXhKVR9G/WhZRA3lgUeDbqq1JKOD4cTxzB2YK/Q2gvyylpRMSbT+0+1e
 gFcML6XjMSil9CCJJkMGllsjud15lIEMcLYhqHsciAy6HdgFnPzcgZUfiY9qqLRHNFoE
 fxEw==
X-Gm-Message-State: AOAM530H9BqxapEuzQgPDX+fnNVLqBJpP5p5DDdyi10a9ENm4D3qcsU/
 ZlA3pVQs4jEoMwvFHBpsH9ohCCSeeYgh6er+DAdMRwRW4+U=
X-Google-Smtp-Source: ABdhPJy7zlkXM4TC0g6HaIkuy2RcQfD8sPbWKU5b1yYyYyuyuK+2RT0PAmM5/nSQC1AADItkWClvqe/fHV2EmIkAkeY=
X-Received: by 2002:a6b:e70f:: with SMTP id b15mr4488431ioh.67.1626257662333; 
 Wed, 14 Jul 2021 03:14:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210714092946.569516-1-stefanha@redhat.com>
 <20210714092946.569516-2-stefanha@redhat.com>
In-Reply-To: <20210714092946.569516-2-stefanha@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Wed, 14 Jul 2021 12:14:11 +0200
Message-ID: <CAM9Jb+gOd4eUV5Hz=xTh1ATrzEuXuDcynRy+y=ontwDmu8HyJg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] tests/qtest/vhost-user-test: use share=on with
 memfd
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Qemu Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Add share=3Don for consistency and to prevent future bugs in the test.
>
> Note that share=3Don is the default for memory-backend-memfd so existing
> tests work.
>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Acked-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  tests/qtest/vhost-user-test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.=
c
> index 3d6337fb5c..6c0891d429 100644
> --- a/tests/qtest/vhost-user-test.c
> +++ b/tests/qtest/vhost-user-test.c
> @@ -40,7 +40,7 @@
>  #define QEMU_CMD_MEM    " -m %d -object memory-backend-file,id=3Dmem,siz=
e=3D%dM," \
>                          "mem-path=3D%s,share=3Don -numa node,memdev=3Dme=
m"
>  #define QEMU_CMD_MEMFD  " -m %d -object memory-backend-memfd,id=3Dmem,si=
ze=3D%dM," \
> -                        " -numa node,memdev=3Dmem"
> +                        "share=3Don -numa node,memdev=3Dmem"
>  #define QEMU_CMD_CHR    " -chardev socket,id=3D%s,path=3D%s%s"
>  #define QEMU_CMD_NETDEV " -netdev vhost-user,id=3Dhs0,chardev=3D%s,vhost=
force"
>

Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>

