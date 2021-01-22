Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 499A53010D5
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 00:19:12 +0100 (CET)
Received: from localhost ([::1]:52950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l35hv-0000A2-42
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 18:19:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l35gY-0007gg-Vb
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 18:17:47 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:33104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l35gW-0002SF-AU
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 18:17:46 -0500
Received: by mail-ej1-x62e.google.com with SMTP id by1so10019624ejc.0
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 15:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6IKd+4JJx1LhSTDb8ojJo/ksEFtnauqyeo1ZwuzZzuE=;
 b=fDSxSdfyAAHPBolMfHFu1C/aUb5QPmIGu6RSpUDwDNSGWUduEuh9oEa8KrHmKd76N/
 GUjTGL94nNMZ7yfPSoVU3HFrAMEcORL5SuNoJIO+PDfBdLtliknYbZRvapJBDMDuhCj5
 NtQSilz1o2JQUH7c/pdenoo4Fp5ymbuHTrE7NeSm1e/0lOYyHh6HO5DnJDXmZAwrr9Wf
 J6w2a00t6/TIYHthJj9JjwerQyhVnNWxMks8Q6KksJL0d0R1KqM+VKdJx0I/ofJBqmjr
 t0ZmFO1QWI0v6KQXHFT58l/GNyB+0hiTclzWXJW9mtXjEQi6Uo/B4wcmERZHHsUHO7sx
 yx1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6IKd+4JJx1LhSTDb8ojJo/ksEFtnauqyeo1ZwuzZzuE=;
 b=hxZ/H7Vos2/u8NKqI7ySeP24xB0SLdj3oxDHvaa2rO7hck0UTWFRhH2TSzdG15lNkW
 kyICIhmvfzYdXquir2FjcSnuf77U1w4XvQNPJtseiHiAn8/qpeAolyF7M36VG0rZgQl5
 6Q8Rwxe3YNlRvDkgwK1gJFFZJ5S0Z9UuZkeCju/Vc1SIrImQbCFm4/b5ziTfZv6zlBia
 KlFX/pReV22kG2Ai4e8pjKQoCp6qC6U7dkrH6v66VxvMdikwxIPIj+YG4FKDPtffhvZB
 4YIDxWYP2+utqlrXCEN9n1DJguIlTQQLo2iOXOeiFowOCuOITlfs9s6k1Axx/8FLd/CC
 4wtw==
X-Gm-Message-State: AOAM533PPcPz1HKszzK+a1CfeGujj6VR0ZlBbYkxEG9yaWVSg2+E8vbl
 0oTmtWwu+tJF6xSJZreqe0EIsd8WyDqwhdF9L628tQ==
X-Google-Smtp-Source: ABdhPJyo8dFDyJ+qYgKqpO+ET6WGanxyePQHRhhJ4mdibK9OynP8XB5LcIL5VNEcyVEHBe9FLGaT8iIWzOMsSyCsRwE=
X-Received: by 2002:a17:907:1b10:: with SMTP id
 mp16mr4561106ejc.482.1611357462610; 
 Fri, 22 Jan 2021 15:17:42 -0800 (PST)
MIME-Version: 1.0
References: <20210122201113.63788-1-j@getutm.app>
 <20210122201113.63788-6-j@getutm.app>
 <CAFEAcA8V1nv1VV6t8UN25JoA7bw96xSBamaw6VnfBavOQjj44A@mail.gmail.com>
In-Reply-To: <CAFEAcA8V1nv1VV6t8UN25JoA7bw96xSBamaw6VnfBavOQjj44A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 23:17:31 +0000
Message-ID: <CAFEAcA8hA7_isLsAtyS8oSwcfL9nRjdSehL+qLj5C2MycbzLoA@mail.gmail.com>
Subject: Re: [PATCH v7 05/11] osdep: build with non-working system() function
To: Joelle van Dyne <j@getutm.app>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 22 Jan 2021 at 23:12, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 22 Jan 2021 at 20:13, Joelle van Dyne <j@getutm.app> wrote:
> >
> > Build without error on hosts without a working system(). An assertion
> > will trigger if system() is called.
> >
> > Signed-off-by: Joelle van Dyne <j@getutm.app>
>
>  configure            | 19 +++++++++++++++++++
>
> Can we do the "does system() exist?" check in meson.build ?
> Untested, but looking at the existing check for "does gettid() exist?"
> it should be two lines:
>
> has_system = cc.has_function('system')
>
> and then later:
>
> config_host_data.set('HAVE_SYSTEM_FUNCTION', has_system)

...looking at how we do the HAVE_FOO_H settings, I think we
can just collapse this into one line:

config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system'))

thanks
-- PMM

