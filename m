Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E989639C6B
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Nov 2022 19:40:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozMYZ-0005KN-Iy; Sun, 27 Nov 2022 13:39:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ozMYT-0005Jj-CJ
 for qemu-devel@nongnu.org; Sun, 27 Nov 2022 13:39:05 -0500
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ozMYR-00034L-Tg
 for qemu-devel@nongnu.org; Sun, 27 Nov 2022 13:39:05 -0500
Received: by mail-yb1-xb34.google.com with SMTP id k206so9555766ybk.5
 for <qemu-devel@nongnu.org>; Sun, 27 Nov 2022 10:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SdtZFcEJptLlfXYRMnEw8Mj0ngW2v0zWe3I8yeMqZVA=;
 b=aRSSSAwfB70PzhLqqIkchF/RP8rE/4WV9ZNHdUP4QGN/P94M+LeKlYEF8rrPTy8hen
 7dr8DLsqNbnqEIK0sj13IkvtMQDfuTmE5vItV15VJe1qUn1nt4Ssh3uld+Gink4xUEQf
 OwQrFOXdURYjOOIfljUT0dJGNyZFC0t08/mQSFPaZpJl1tdvjHlzJS0SwwJdqfXgMtSG
 5/HkDQ9qjyxooj9hwLr0RT/lpDynDw9QQrHtlpxzv2nNaEMEYs9Nl4AaKIQfafyL+cRz
 zL1gWhgzjcwuupAsitbP4HAmBTzn88xmrBtbuspjQ7FyzZfFv+jd6kwgskdG63zQ9437
 15yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SdtZFcEJptLlfXYRMnEw8Mj0ngW2v0zWe3I8yeMqZVA=;
 b=sGkGmFjCt3QqTGG/Iz5i/0TV+KSGwKQ92RkFI7jNyutmcK8Gah11w48QoKPuF+vsRz
 XqZb4LgYpW5bhAGuDyK4tlFW2sqyj5xKKuxDu/xnXA8XFdH3zy0wbDlSbdD+CRiGDTF3
 p0EpbV7++RJRSxVYJnIasHaLKDYfC2g1u7Y+/P3V9zS4Jl5nwCTQaPqhaE5JxDu11HXf
 2ki/0//D0IGXmJ330VV6nva2Rh/x1hO1N2/8gxDlgzv2YnhkgpSse7mMQmsgKrG6pU+v
 /i7y/sobq1Tk4IvCpW7VxqOPzH49m9GbEOvXWzu+sTAwZC8cTFhXMtSt+a39Cb9mDm12
 2Csw==
X-Gm-Message-State: ANoB5pkDZAuJilUI91KPE4uHVivsJOHn60iK93v9QfmtoHSVX2vXvH91
 B0V37GIGX0ZsoLsbDSfNNrWg1HXJFpRqL1elZW8=
X-Google-Smtp-Source: AA0mqf5GvKMpHtWXWaDSICwR4iE1RRZzTlst13nINrRp4WnpwG83xQOmBy4U+g3krz4gbrlsjqnHtjoQmgKW/jE6fGU=
X-Received: by 2002:a25:af54:0:b0:6dc:e3ee:3e60 with SMTP id
 c20-20020a25af54000000b006dce3ee3e60mr30881002ybj.58.1669574342687; Sun, 27
 Nov 2022 10:39:02 -0800 (PST)
MIME-Version: 1.0
References: <20221126152507.283271-1-sw@weilnetz.de>
 <CAJSP0QXaWMq=z943sLHkZtSDLSaezNQwtJaFy9A12yyh9zfSoQ@mail.gmail.com>
 <6a22b163-a9f3-45f2-ebca-2959c35688bf@weilnetz.de>
In-Reply-To: <6a22b163-a9f3-45f2-ebca-2959c35688bf@weilnetz.de>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Sun, 27 Nov 2022 13:38:51 -0500
Message-ID: <CAJSP0QVk6bMHGiZazk1w4bYOZPCt1=BLMct8LFFonmvzmhzY8A@mail.gmail.com>
Subject: Re: [PATCH v3 for-7.2 0/6] Add format attributes and fix format
 strings
To: Stefan Weil <sw@weilnetz.de>
Cc: qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>, 
 Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb34.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, 27 Nov 2022 at 13:31, Stefan Weil <sw@weilnetz.de> wrote:
>
> Am 27.11.22 um 19:23 schrieb Stefan Hajnoczi:
>
> We need to wait for Michael to agree to maintainership in patch 5. If
> we run out of time I suggest splitting out patch 5.
>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>
>
> Citing Michael from a v2 email: "pls do".
>
> Stefan
>
>
> Hello Michael,
>
> I just noticed that MAINTAINERS has no entry for the files in
> subprojects/libvhost-user, so I did not cc you in my previous e-mails.
> Should that directory be added to the "vhost" section"?
>
> Stefan
>
> pls do

Perfect, thank you! I have added a reference to that email in the
commit description.

This series is running through CI now and will be merged upon success
later today.

Thanks,
Stefan

