Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 528F23F3218
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 19:15:44 +0200 (CEST)
Received: from localhost ([::1]:43440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH87L-0006zB-DD
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 13:15:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH85y-0006Ez-1n
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 13:14:18 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:44795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH85w-0000pi-Iq
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 13:14:17 -0400
Received: by mail-ed1-x532.google.com with SMTP id s3so2715983edd.11
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 10:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nb1dIzmHK1yhbwxQgwsLAJaBpW0gFe8PthvVsdukGWk=;
 b=KsWhewmW87q69dnEYcV0jvFa8tHOdiH4BmzHTDMF0w13wTiakmsA8cmoxlKD9xq8UD
 5IWvsbl7PycjqrDUDkwXcxgFUM9UK8vcfPSsd7SQA0ZfWbMktngajvwidQsjxXaIpBMc
 M3dhxpEryaqgNWHoLsWX8yy0/cDSgwOj6tAnjWkkjMYFDOAX9uIphqEowecfjFmq/MPj
 z6uerdvM7OiOC7utIiI4jgLK0Lcn/LXerfbJVO6j30IGlxuUH9HK5ofacRMou4oXM5xS
 yivg/UYPSAWIV+XFZNajhhhjw9byotES7AloyHhmZegOHgH5iPeZUnJ9UHOh6kYcUU9q
 OPFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nb1dIzmHK1yhbwxQgwsLAJaBpW0gFe8PthvVsdukGWk=;
 b=Ikknj8GpgmcMkUbOmRa84W88vCcJadFbCsKlyl/EK16VbzVqXZo7MJUBuA18mLypp0
 lCNyp6uyAhs4/JrlVuyTKZ70wXk9UCoyugnIeZ9tragDOSROMifESQzbhDocce5M93JN
 vsCxz8Id1q5zHpw/HfKpa62+d4ylDco1q5rqL2iSB+5iscKj8P8onYz6rTGAoSJQzbSB
 FzjnHWQjfgCtHWgyVI/jruP+xOLOshlpSIV5NAGTCVE07ADtJnoOoef7v+LUyF7w3QQL
 4k/ADERyqzrudafR6/p9IL2fwPChO/5VIBWC5RnvgIuoioXhbTVkgOxDnj1FAkb6G3e5
 Er0Q==
X-Gm-Message-State: AOAM533WwV0r3mYZG5Zni+q65Im543EBkeqya7GisNS++AmImCm/xhb+
 SEd6lR21OsUGU42sPopFjwXax0w1LB52BeZPVRn+EA==
X-Google-Smtp-Source: ABdhPJwL7zoOdGJhc9vNDtBek1fDdkJQFEAZSNhV5Wk20TyA1PM7QzVAJWDegdippC+2h2QYf32VgnJBrAY4vEqqnh4=
X-Received: by 2002:aa7:c0c6:: with SMTP id j6mr12251009edp.146.1629479655098; 
 Fri, 20 Aug 2021 10:14:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210820155211.3153137-1-philmd@redhat.com>
 <20a53e29-ba23-fe0d-f961-63d0b5ca9a89@redhat.com>
 <d68297ca-7be3-48ab-e25c-4f55dc735670@redhat.com>
 <20210820184048.4a5294c4@redhat.com>
 <5699e784-f120-25e8-d0c6-b3e53ed0b883@redhat.com>
In-Reply-To: <5699e784-f120-25e8-d0c6-b3e53ed0b883@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Aug 2021 18:13:28 +0100
Message-ID: <CAFEAcA-MnnQJjDE8inau7AGUMdjqA1Q4AUgaCqkGK9HsRKY1Yw@mail.gmail.com>
Subject: Re: [PATCH] softmmu/physmem: Improve guest memory allocation failure
 error message
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 20 Aug 2021 at 17:59, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
> Anyhow I still see the size displayed in the error message as an
> useful hint:
>
> $ qemu-system-i386 -m 64000
> qemu-system-i386: cannot set up guest memory 'pc.ram': Cannot allocate
> memory
>
> VS:
>
> $ qemu-system-i386 -m 64000
> qemu-system-i386: Cannot set up 62.5 GiB of guest memory 'pc.ram':
> Cannot allocate memory

I hadn't spotted that we were doing the size-to-str -- I think that's
definitely helpful because it will catch cases like the one here where
the user didn't realize they were asking for 30 terabytes of RAM...

-- PMM

