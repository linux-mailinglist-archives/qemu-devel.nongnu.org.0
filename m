Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 421B93DF11F
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 17:10:11 +0200 (CEST)
Received: from localhost ([::1]:50284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAw3W-0005U7-9C
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 11:10:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mAw20-0002y9-VA
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 11:08:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mAw1y-0006FU-6e
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 11:08:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628003312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WnhKpnfFJDG30ecjvivdqKnZSbNaS/sw9zxkmttMUhE=;
 b=cLbjdVCLyOpEMPA1Ol1Fnx1MdIVidQMabZiZ3YLGFolGzIZdPRGCnke678mcFqEr7Bq3cv
 E3JHh3AyuXMjoeMA1mv+CK+5Lb1M9yoIMO+0IzejIaFgrsbz8tRZlZzqb8kBGS83RHS4/0
 F3rN83mtztU2qoG9KCaAdRfI0xwL3P4=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-_QcnteNPOAawx7ihm5HX3g-1; Tue, 03 Aug 2021 11:08:30 -0400
X-MC-Unique: _QcnteNPOAawx7ihm5HX3g-1
Received: by mail-pj1-f70.google.com with SMTP id
 16-20020a17090a1990b029017582e03c3bso3278675pji.7
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 08:08:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WnhKpnfFJDG30ecjvivdqKnZSbNaS/sw9zxkmttMUhE=;
 b=A1jVk+eMURCdX8ExRA0lOaXeBQnAjdwtwg+qSSJUCtptPP8eh6boLNeoY4nSlPHy4/
 lEIPe5yNY4cCoKWQuRepyzfVXNAeWLSnzr+7hf+LxBAWYUEGLCYFdnFcNDZsUaiuIZlI
 1/YvWSQM5jYEwSUqRIy97xezguRiqGm/deFuytU8IJQrSkP6+RQ+aD3Is/cmjlL3K9+4
 73V1/JahukAr7m4Cm+pXKVV3ZtwXEZJOqubavRd5SRhikmlLOL3TGJ4NBhViZI6OUBVR
 OFm6/uH5HBueXRXutT4hQ95gqUv3cNxftLUdr2yUwEy+5D0Gxn7VgHZVf/bB8R68sP0V
 Sr3w==
X-Gm-Message-State: AOAM532FFVtbKLK5+fNGUryRPaFYZU+rXmxj7bAWjIq173iXm80UAjF+
 zwEsF+t7MviDDvDAcAWXm8YW5k4myv7O4S1SQcUV/eSlcOBq/pDzgzy5YjNVjKfw1Jn38xiXwLu
 IVKIUpbOU5G29ET+QRIws5Xdj9T+CRfw=
X-Received: by 2002:a63:385:: with SMTP id 127mr244513pgd.58.1628003309381;
 Tue, 03 Aug 2021 08:08:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxG9EFkk7NdWRUyvuqOi8vXfM/kr0EQ65OLHbTtiEaZvLYjjKrG91F9JAehtP/d7T1o7TO1Dnrw2KHIfAUHEM=
X-Received: by 2002:a63:385:: with SMTP id 127mr244481pgd.58.1628003309003;
 Tue, 03 Aug 2021 08:08:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210730143809.717079-1-thuth@redhat.com>
 <20210730143809.717079-2-thuth@redhat.com>
In-Reply-To: <20210730143809.717079-2-thuth@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 3 Aug 2021 12:08:02 -0300
Message-ID: <CAKJDGDbCzY_D0pm4VcR2JQvWqpkd3ryyAkpYA=FEKDn7JQ=0nQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] gitlab-ci: Merge "build-disabled" with
 "build-without-default-features"
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 30, 2021 at 11:38 AM Thomas Huth <thuth@redhat.com> wrote:
>
> Both jobs are testing more or less the same thing (building QEMU with
> features disabled), so we are wasting precious CI cycles here by doing
> this twice. Merge the jobs by using --without-default-features by default
> and just adding some additional --disable-... switches which are not
> covered by the generic switch (yet). And while we're at it, also test
> compilation with "--disable-fdt" (which forces us to change the list
> of targets in this job, though, since some targets do not work without
> fdt).
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab-ci.d/buildtest.yml | 97 +++++---------------------------------
>  1 file changed, 13 insertions(+), 84 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


