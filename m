Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E38528A6A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 18:32:03 +0200 (CEST)
Received: from localhost ([::1]:51152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqdda-0006ZK-VP
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 12:32:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqcw9-0000Rf-6A
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:47:09 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:37195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqcw7-0001fS-B8
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:47:08 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2f16645872fso157885407b3.4
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 08:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/2yjnZk4xVQ7QW/pMc2La6sAOKnLSlA3dC6osajqex8=;
 b=WMifEoToGP8nJDygpsrhgZXQhJ8tRo4z6ZIZVE/vOC4OqHfum6CG/C81szfyAmYq1R
 MVwOXeE86bL2bx8UawrAI2aa/IBC5D2PlBdaWPLtrt6gUDM/ZAqmqIBmbIpqzTOGEdiM
 Vpn0giUOoBVt72IFis+nGlUC712V5K9gpzyOr1BINj63C+sUVhLV8WfYBY5bdiwRUR7h
 BxVTv8AYESn0JBi0gQeY6nfXxyjPI+1i1yIGIpYSDe+LeVZ+oSRt/T0wacX4Ejz/V8RU
 n2d/Vpz8LTVFQeX4t2IVD+Jli/riV/gJB/REyeaORPPIIl3f1v2jQvXeMaMYjz+LnUgA
 mwEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/2yjnZk4xVQ7QW/pMc2La6sAOKnLSlA3dC6osajqex8=;
 b=Qh6ljDsBoqi+qTTiS8Oe3Kvf1fVVstSuM0jSLkFYF7Mgo3sjfAYO0mRzXLivmmcBNT
 33FM7KnQlmue8ZUIhNVsKhe/lMQzrEkR83QvywlHO8G14P0zxtee6ucEe9TJ3hoe0WFT
 l06WP70FqC1nPgWUYgyZ85PjAkZvpmCbP739ofz2VLzoiLeZWYXUMPQY8KFwZbpGj7MA
 TFaAwiAgdXG1CU/S2C9kt1YbGftvJ7xV3KUg0ay7LoLCoz7BkKGr/GV/itTSzyfa2rnE
 Cm9035SBXjxKE7L0G6MNrVsQDTEHZzvS8FU3mRozOk9HeeZUJbn0MSYU6bJo9Kpkr1wb
 xmMA==
X-Gm-Message-State: AOAM530f76rW0CQBYqMFpGIwetpl/Fuyb6ldO7+5sLX3rSFyAr8+3l24
 ob5Z0G/U3sWTc+0AodzIxSczWB+8zBTxoMf+DaRwEw==
X-Google-Smtp-Source: ABdhPJxBZ6QrAHih2h0iYbAwuc/4i56/BNCFUtHs0ldRZ11LClmhj/g+a39hGox/XTcu759CuLcIiBnrKdOSmZwPkR0=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr21149179ywb.257.1652716026222; Mon, 16
 May 2022 08:47:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220516145823.148450-1-thuth@redhat.com>
 <20220516145823.148450-3-thuth@redhat.com>
In-Reply-To: <20220516145823.148450-3-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 May 2022 16:46:54 +0100
Message-ID: <CAFEAcA-RBUX5iXV__1AMrex21DJK7hx8mygksJa6xynJRCEW4g@mail.gmail.com>
Subject: Re: [PATCH 2/3] capstone: Allow version 3.0.5 again
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 May 2022 at 16:43, Thomas Huth <thuth@redhat.com> wrote:
>
> According to
>
>  https://lore.kernel.org/qemu-devel/20200921174118.39352-1-richard.henderson@linaro.org/
>
> there was an issue with Capstone 3 from Ubuntu 18. Now that we removed
> support for Ubuntu 18.04, that issue should hopefully not bite us
> anymore. Compiling with version 3.0.5 seems to work fine on other
> systems, so let's allow that version again.

Commit bcf368626cb33c4d says the reason for requiring capstone
>=4.0 was "We're about to use a portion of the 4.0 API", not
"Ubuntu's specific capstone 3 is broken"...

-- PMM

