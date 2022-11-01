Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBB2614E01
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 16:14:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opqyT-0006JE-3Y; Tue, 01 Nov 2022 09:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1opqyR-0006HL-0j
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:06:35 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1opqyP-00068o-Ju
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:06:34 -0400
Received: by mail-qk1-x733.google.com with SMTP id v8so2968625qkg.12
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 06:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gQfR81s/a1frm8rcUtH8T8+A/+21zWEABeYc7K0cn7w=;
 b=YPq9ez/VrlZR1UYDoJkMYlmfId9nqlLl1bcI7pHzV6WlppyvuTuiu27t2JRHv4pjt7
 g1iRna0W6SWSy1vkE26fmg4rnT2oDck54uHr/PNYzxkOUmLx9TbcUhqe8FriO/E9Dw5W
 ZUuhUULrwrK6WSJkN0jIWQ2wVzfIi2Lu4EZ5pkTm3rYXpbSAb7xAiSN+MbG513lMHcR6
 dkANrx3EB63B4hKwVjt6AJfMCJVoDdSSEqlOrV3TbxCK0OXPXAWfEY0QyNxiQnjI8naa
 MJRFqguaJ8p2nnergsgs8YhS2vRCAxGa1EtiKTs43vFtbiQgtlGLcwC5qghWQOo5t6pY
 eSmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gQfR81s/a1frm8rcUtH8T8+A/+21zWEABeYc7K0cn7w=;
 b=rV6MMQHr6HPgh6dcF+PuPbu9AbMGIs/VvY2g+RuW/jIAPULyL6azKbTLJMNcLRwc9e
 dJvg4s9o5Fwt4LZfnrqkO1+PDFyFFvdsPlfCl/8f+Y496R/BiV9x/3eqLqxRgZJu13v6
 c0EUrgaqG7B9yqe6kCpKGQVJotsxNDFWpvf+f1PjtaW3+SZ/a2+WjeKkd54Izf+B+qBp
 6uJS8RS4JT7wZhSIdRDz+Rz2+ohXdxId789M/yGWK8Ru80FXytEd6NweqVFDCd1Jwehj
 L75/M5Tz80Yze/oQ1jOgLHO+BtuBpED7Ne+P4myjSuU88mPnNHUsdgMBVipHBVm0drRY
 JwJA==
X-Gm-Message-State: ACrzQf0Az4anWPK1UZfCo3K9KxXFHzG/9sNld+rOoGR3GJBGJoR0UDYX
 8jMU2d868Rt0+L0aFpG8UrxFbETQTyiRuGmtvIM=
X-Google-Smtp-Source: AMsMyM7fkxhY2Y4mzLeyEnK1vylwweDurLqpBKZ2kSL03LyzvaHwVCGPmfmIk7DltroWKdu67FMRSl69frhEXkv0GVo=
X-Received: by 2002:a37:63c4:0:b0:6fa:23a2:9fc6 with SMTP id
 x187-20020a3763c4000000b006fa23a29fc6mr8727493qkb.376.1667307992302; Tue, 01
 Nov 2022 06:06:32 -0700 (PDT)
MIME-Version: 1.0
References: <20221019102015.2441622-1-bmeng.cn@gmail.com>
 <CAEUhbmUmE12maezBm9x0EJQnTQkavMa8EcoNPd8LcHTawFQzYg@mail.gmail.com>
 <CAEUhbmWNRpZp0EvNC9snrpqTVDx13EhBzSWxiKta_ZAjcfkDDA@mail.gmail.com>
 <Y2EK9D2z4TkLb3+M@redhat.com>
In-Reply-To: <Y2EK9D2z4TkLb3+M@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 1 Nov 2022 21:06:21 +0800
Message-ID: <CAEUhbmUgZUC6ZCYMLXGjgF9f9x4BGMsZ=L8oPzCKegKfhonVxg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] util/main-loop: Fix maximum number of wait objects
 for win32
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x733.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Nov 1, 2022 at 8:03 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Tue, Nov 01, 2022 at 09:14:55AM +0800, Bin Meng wrote:
> > Hi Daniel,
> >
> > On Wed, Oct 26, 2022 at 12:41 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > On Wed, Oct 19, 2022 at 6:20 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > >
> > > > From: Bin Meng <bin.meng@windriver.com>
> > > >
> > > > The maximum number of wait objects for win32 should be
> > > > MAXIMUM_WAIT_OBJECTS, not MAXIMUM_WAIT_OBJECTS + 1.
> > > >
> > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > > ---
> > > >
> > > > Changes in v4:
> > > > - make the out of bounds access protection explicit
> > > >
> > > > Changes in v3:
> > > > - move the check of adding the same HANDLE twice to a separete patc=
h
> > > >
> > > > Changes in v2:
> > > > - fix the logic in qemu_add_wait_object() to avoid adding
> > > >   the same HANDLE twice
> > > >
> > > >  util/main-loop.c | 10 +++++-----
> > > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > > >
> > >
> > > Ping?
> >
> > Would you queue this series? Thanks!
>
> The main loop is not my area as maintainer - it would normally be
> Paolo IIRC.
>

Thanks, but Paolo has been silent since day 1 ...

Regards,
Bin

