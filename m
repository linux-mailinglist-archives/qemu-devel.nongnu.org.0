Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BFF4C695C
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 12:08:41 +0100 (CET)
Received: from localhost ([::1]:55054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOdtO-0002G6-Su
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 06:08:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOdsL-0001Y9-4S
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 06:07:33 -0500
Received: from [2607:f8b0:4864:20::1129] (port=41615
 helo=mail-yw1-x1129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOdsJ-00087d-Gs
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 06:07:32 -0500
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2d62593ad9bso103337927b3.8
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 03:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=L7YBLxZcRaDJ0C6BuFQscgJwIITE+R7dg1dEo9sTbZg=;
 b=ZYB3E0rLzGNL35ENd6CVMfsoukk0ZPMLXXS59exycTqwghHRjpQZk3PuF8SrAEZ0Lz
 m3+NuS8iVr1Vt+Lm3Hdt9kk0HUPXYRRaBSEiHZ9f9/jFpiaCH2w8nHWpKudZn/lJ9rZM
 VAlBSmP5r+gAJuJVSu7fI87BigCF5/xbzoFmWnUSo5plnT7wY2GyF6b7duue2RzlrQVd
 WPYbzq3QMTmicwgsD3nijKO7l0WAT9F8jSX/1rtsV8bw10IbyPJwmWE2ye43LqaaZymE
 Ydu72NqjBEra42VBupgkkC21pGyIeQvnw/26S+HZ8CbduWGAq7V9HmUVR3m8PqiQL/j2
 CMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=L7YBLxZcRaDJ0C6BuFQscgJwIITE+R7dg1dEo9sTbZg=;
 b=o+MX55Vt9v2CXID1eSb6uD1BFjn4YpX0YLNaaJog4eS7oF6NXCGvDZTMqQKefwCeMV
 dJfBxcibdaUM0schsiU80VFnerz3sWqWuZszK5qoxA6lRbfGo7PdYpcBQmJOtUSkrOpq
 jjZX4d/5+vTCuTBzSUdntgr3uWV5rJHOiwk5XYkUULSIoUk3UyT3vHXVddexvoApe1ql
 esCkvayGGbxjnrIpim1fIGz2WX06+yFncJ9vJUrQLlOCfLefUIAyqHhqq4YSHjD2YmJg
 UrC/49Ca/v+3t3cUv8tJURsCkXgWx7GyoMu2VyVKJSPUbg6bd5KKVptPKI6P6rfemKVt
 rhIQ==
X-Gm-Message-State: AOAM530w3Ez4cayBbTfYmusyCS7zWa0AviqsofQfGfRH05TxWsR9lNWe
 3Z8TqbB7NlllWd/FV4epjgiO9Sy+5W2J+AGTLk9hRg==
X-Google-Smtp-Source: ABdhPJw6w6uFixus0L44FfFbUgYITMIPgMPzI5p6OkDSwAzzHucKqNoLACJh/p/P0BlnpmI8m1AMQVSR/cpi3v3EdXk=
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr19381423ywh.329.1646046450505; Mon, 28
 Feb 2022 03:07:30 -0800 (PST)
MIME-Version: 1.0
References: <20220222194008.610377-1-marcandre.lureau@redhat.com>
 <20220222194008.610377-7-marcandre.lureau@redhat.com>
 <CAJ+F1C+QOAcjAiAY=7jcYgjJTQ79PTUDBRoJ3fzyHha2Syw4tA@mail.gmail.com>
 <8d5b4245-56e7-8384-4104-33d3ab1adf42@redhat.com>
 <CAJ+F1CK5U1agzbDztrWBavmoiAfmwW3AHcWBKRwGh9f0LRan0A@mail.gmail.com>
 <YhySJepNwSuv/zP5@redhat.com>
In-Reply-To: <YhySJepNwSuv/zP5@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Feb 2022 11:07:19 +0000
Message-ID: <CAFEAcA-MrYMhYDiwvAV8zgtFrbQTR6m5pOkwWuWOtX3fcrdNSQ@mail.gmail.com>
Subject: Re: [PATCH 6/8] char: move qemu_openpty_raw from util/ to char/
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1129
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Feb 2022 at 09:13, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
> We only support the current major release, and thue previous major
> release for 2 years overlap. If we consider 11.x releases as major,
> then 11.3 went out of scope from QEMU's POV in Aug 2020, and thus
> we don't need to care about this code.
>
> More generally though, Solaris isn't even a platform we try to
> support at all is it ?
>
> We've never had any formal testing on it. Have we seen people filing
> bugs mentioning solaris in the last 5 years ? If QEMU works at all,
> I suspect it is merely by luck.

This last came up in June 2020:
https://lore.kernel.org/qemu-devel/CAEgYsbE7s5hD+5ARj_Xt1D0ALDPDQx7uvocd5zR=
F6P=3DEzwxTZQ@mail.gmail.com/

where somebody pointed out that illumos also doesn't (didn't?)
support openpty(). So we do have at least one or two people
who have tried to compile on Solaris and been enthusiastic
enough to post to the mailing list about it.

thanks
-- PMM

