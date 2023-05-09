Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D826FC822
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 15:41:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwNa8-00070m-Pu; Tue, 09 May 2023 09:40:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwNa2-0006vZ-9Q
 for qemu-devel@nongnu.org; Tue, 09 May 2023 09:40:38 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwNZz-00047y-GF
 for qemu-devel@nongnu.org; Tue, 09 May 2023 09:40:38 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-50b383222f7so8935602a12.3
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 06:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683639633; x=1686231633;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bf1wqcR5Yo9smAjpiA/dFWnPkuayBfSB4FtraJxSHus=;
 b=PCm23Xx07WQg0NpwOjKqfIMQn3T+yu90LUyp4M4q+xiO5L2OZyl2jEOsNb+Lk0/w5e
 lMjbbK0h/XI5fVeSI1yt6R9glwAdoDyQWN3Mtcg/kqfWSAibslRBUO/uHljO59I9Tl8K
 /ON1BvsYAn0nhxk3QJKl8IMYzXNdTEIP8ZYQvOMlLPvYINCcrLo31p2ErpNJ7zd8MYI4
 mxERJnMp3tdZWMIqmFrKO027NL/rLls7YvCWm1gf3xw2xSXceYxByLIKc67Z6DzaPT4r
 1qlIjnnLLdPJeUxCovZ2eJljCIV0r09i8SdY9SqY2X6mgBLmyUP5wAntmBry2Z4AIvqZ
 AmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683639633; x=1686231633;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bf1wqcR5Yo9smAjpiA/dFWnPkuayBfSB4FtraJxSHus=;
 b=AqZYVMq5+b4LJYrleyU9ZDvePRMi6iQ9ljvtoHzPxZTbqSEKeGX50HTFue9hbM5E5b
 xIOJB1R6hhpsgy5RRs9al4FCjYNXMWh7O8Z8FTYTmTScSA4TZudYY7pa+OSMQYQE19Zp
 BCAD0rxxwvGuPUmiBqAqQfjFb2WhIG+l/fBVC2DDV+GD+tBbeqJYQzEEN6BuM9e7ldB5
 znkA0gxyBB24oNgmxiRpJnNN8aes7gSjAUPfPQQpLgI4L0tfUVYXJf+Z7GAXPD9+mDBS
 26zj18QlFrS8S67soP4OYwaXsqMzTKlo/uJ9de3na6mLfZ2AsIIVLU2VhiPZMjPvFxep
 zy2Q==
X-Gm-Message-State: AC+VfDxoFqMeCmjb+Agr71BMFqZgE1jMMD5DQ812eoX3Onx1nUN/MSW9
 yvoegmnbHki60mKE2ZbXUba3D2A/bMtvbMyxNlctkg==
X-Google-Smtp-Source: ACHHUZ50p9M14UHPlFHXaPXzAhcn3BJYe3U1ZabonGIissSyBRg+dml4iBqkOI/WDDLQNvLV1MZp+hfXCCvQUiuK0lo=
X-Received: by 2002:aa7:ce0e:0:b0:50b:c584:527b with SMTP id
 d14-20020aa7ce0e000000b0050bc584527bmr12245721edv.29.1683639633549; Tue, 09
 May 2023 06:40:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230421163642.1151904-1-peter.maydell@linaro.org>
 <878rdxeirm.fsf@pond.sub.org>
In-Reply-To: <878rdxeirm.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 May 2023 14:40:22 +0100
Message-ID: <CAFEAcA-P3Exg_up02jKmdmSrr9Cd=hUqfJZ7xAKCL3J7vWUQiA@mail.gmail.com>
Subject: Re: [PATCH] docs: Remove unused weirdly-named cross-reference targets
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 9 May 2023 at 14:28, Markus Armbruster <armbru@redhat.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > In the doc sources, we have a few cross-reference targets with odd
> > names "pcsys_005fxyz".  These are the legacy of the semi-automated
> > conversion of the old info docs to rST (the '005f' is because ASCII
> > 0x5f is '_' and the old info link names had underscores in them).
> >
> > Remove the targets which nothing links to, and rename the two targets
> > which are used to something a bit more descriptive.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Thanks; I'll take this via target-arm.next since I'm doing
a pullreq this week anyway.

-- PMM

