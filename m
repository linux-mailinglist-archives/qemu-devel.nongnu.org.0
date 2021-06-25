Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D313B48D4
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 20:34:16 +0200 (CEST)
Received: from localhost ([::1]:57678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwqed-0001Rp-Fs
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 14:34:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lwqUd-0001VS-CZ
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:23:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lwqUb-0007a1-Gf
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:23:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624645433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iTUDCZaXDOhkk9PON8mvXfrngsbE1hs3Flj9SlCaPJY=;
 b=XmUL1Rmudc5zMvHFM+PdeXXtHaAIXGjG2DF2pprzVJvcNGe3IdQvDSpRQmvYTHw9/J4BlF
 2lii/vNJtIuMlygqa4Wtftn4agB8Ccder4+k7YIHeFu3pfj42fz+UNPNPbXu56biqiJFpL
 yqnUcyBtNbhAYpcS8ZpI5WuvrS2rl1s=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-Kl6OMgq4M86qNQw2DdbYSQ-1; Fri, 25 Jun 2021 14:23:51 -0400
X-MC-Unique: Kl6OMgq4M86qNQw2DdbYSQ-1
Received: by mail-vk1-f199.google.com with SMTP id
 m13-20020a1f3f0d0000b029024ee66c3442so583314vka.1
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 11:23:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iTUDCZaXDOhkk9PON8mvXfrngsbE1hs3Flj9SlCaPJY=;
 b=hDBpQyUgWpwYgohqi3VEXg0LasugF2uFRTUc1CRhS9eIJvjdXyHJyTnjiDFp8NUvao
 f3JWwymhz+cdA573ghIgPXOxVqwrkIcHqZJVLi6Q88OhO/mqljZsURJ5Qe7A7k9FTH6S
 Guqa6LWiRl/Dr+g5fLcpZRKjkHaq7TE6bNtvtJFqtNLf5dNARfi3tfhxJoF9tY10wglX
 0W5cE7OuYykYsdNsw+CpMec4b2KR4r/vb+Iz76CbWEp67E8G+4r1YcwFEcQ7hW915YUg
 6ywYVICBZhyUXyFnhzniHxFdBYPFUfcjTCUcRn6oHhR4uIGgtXbgM8xwwRrIaTyrIb6T
 4y1w==
X-Gm-Message-State: AOAM530BWf56dgxPPB797IqSJaW2R3O120qJ9Cs/uxlVzWX9JA/bLA1D
 eeOCbF0CjsoOpkVHcgriTj+nvn0dNm+iO3keFM0CPVV5B2k824QmFqSRPIrI+eApl0rxmQtUQMx
 wKPhsusDfc7gyQnreOm0kfcdd8koZ1Ww=
X-Received: by 2002:ab0:7642:: with SMTP id s2mr13134838uaq.133.1624645431421; 
 Fri, 25 Jun 2021 11:23:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiWEOP+sshZ7yxXc0JO5LhXPa/SuCJm97NMjs7BOZLIsBRelhbEuaYgZrCPz51SyE8Z9MZv2yhYm5OXPJUBr4=
X-Received: by 2002:ab0:7642:: with SMTP id s2mr13134821uaq.133.1624645431264; 
 Fri, 25 Jun 2021 11:23:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210625154540.783306-1-jsnow@redhat.com>
 <20210625154540.783306-5-jsnow@redhat.com>
In-Reply-To: <20210625154540.783306-5-jsnow@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 25 Jun 2021 15:23:25 -0300
Message-ID: <CAKJDGDYX1t+yTGNYj0JJpJkyfYUsXLUJjovzj--mLO05Re9PyQ@mail.gmail.com>
Subject: Re: [PATCH 04/11] python: README.rst touchups
To: John Snow <jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 25, 2021 at 12:46 PM John Snow <jsnow@redhat.com> wrote:
>
> Clarifying a few points; removing the reference to 'setuptools' because
> it referenced anywhere else in this document and doesn't really provide
> any useful information to a Python newcomer.
>
> Adjusting the language elsewhere to be less ambiguous and have fewer
> run-on sentences.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/README.rst | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


