Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E1C4D2CBB
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 11:03:37 +0100 (CET)
Received: from localhost ([::1]:55180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRtAO-0003oJ-5Y
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 05:03:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nRt8P-00027q-6t
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 05:01:35 -0500
Received: from [2607:f8b0:4864:20::536] (port=33655
 helo=mail-pg1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nRt87-000316-PU
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 05:01:17 -0500
Received: by mail-pg1-x536.google.com with SMTP id 6so1590623pgg.0
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 02:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=oacUnZu7qF6olqFYt0LQVuXoKTedw4xp5w0TIe0CuZ0=;
 b=QgQ3dE3awKSMF3QBouyG+IYrGbHaDvXL5UNLIdnQIQP6eOUNJLrhQdp6inC8cAznqC
 uMKbrLJowJDMs9k3kKO11aNPv+unWR4HcjaC+ODIsQVlC+U8yPfpt7GVJ/YXz/4lGwho
 X+UTCW8EaEOvaLdmGiEUw2/I+bq9OhHouKx5uMNktmcirW1AHBDB4acQIXw3ScDA/goh
 jq4JyyWDe3y/HdBI5MtUiberC22cRwOMHc06IefR2ljfBhFkJV9TLbnoU/u9o+U0zfgx
 AikkBOys0fvwdeAwTPcYfwq7bt229xU0VdkVHswceheoRaAMJP8sadMT0BO/3nscvAeg
 X+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oacUnZu7qF6olqFYt0LQVuXoKTedw4xp5w0TIe0CuZ0=;
 b=lVfRai3gdMhJYVcobZ+I3tB541+NeXQdOGxnwnPdd7hgaXXORW4xeVQGeZcgBTRA0O
 mZ/KrUlVzUUzfSekDubWYxWhNKmXnpcuX3nssCDOYxuPSsaU5MAVSdln6gkEaNa5ahgD
 TrZ9d5paE9qpuA6nobnKtw5FjhVVpywh3Bwa6niQddy5oOycD2fk9hjE6/ktlAHeKzn2
 PyYc4X3Zih2llj3C1otpLa+KGTh0a86mn7zTQ1senx597jQYaoV/RpheLfkg9JD6i9Ss
 qh3w283NEWY7gLvTwq4bJAeC2aOKJInK+VXBynd7kbLCqCbZWYyF818zENswsYods7QX
 8mfw==
X-Gm-Message-State: AOAM531ErwXHePKMxp5+HagZl4fKpaxX9uFKQIpZ4sxpeUQigCW/97DP
 skC5LbuBCitFy5LNSpaaxXI=
X-Google-Smtp-Source: ABdhPJzltlyHV6ExIzam/HlVNGBHW/RnVjJqBggDsKlZr3Xok6K1HWZgtepaVUvPzh+To6XmX/QBTQ==
X-Received: by 2002:a63:d47:0:b0:373:598c:e0aa with SMTP id
 7-20020a630d47000000b00373598ce0aamr17372888pgn.243.1646820074323; 
 Wed, 09 Mar 2022 02:01:14 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a17090a6c0200b001bf6c74bdd2sm2160156pjj.1.2022.03.09.02.01.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 02:01:13 -0800 (PST)
Message-ID: <750d1ed6-9c02-bd1b-3988-eb44665e8e5a@gmail.com>
Date: Wed, 9 Mar 2022 19:01:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 12/12] ui/console: call gfx_switch() even if the
 current scanout is GL
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <CAMxuvawuMvxWx7xtsf=PbWnu7UypNfVWf+Bufeqbi4J=SjsU9w@mail.gmail.com>
 <1fa142fb-7988-db25-c283-a6b16278f628@gmail.com>
 <CAJ+F1CLDm9+myAJdNQdU2y64Fa-2+ew2oGih_cWim1=vO=sLMw@mail.gmail.com>
 <e1a9ab86-912b-2628-1e60-4aec4eac25d3@gmail.com>
 <CAJ+F1CKJHqA5DJv1WvY8q0k2rNW+ERFbFgMGKggMuMUJCPs5vg@mail.gmail.com>
 <2517a6b9-cc34-3bb1-d17e-d4e30f0e68b7@gmail.com>
 <CAJ+F1CKrDnYdMKNh1nu8LjnQ=gJ9-umgGHW-E1D1sFO1gf=Rdg@mail.gmail.com>
 <76c68a33-b157-f127-36ee-034290bf3e4b@gmail.com>
 <CAJ+F1CLvKn3r68f7LvCP-2Rni_0G7Z21jZrPqNCByHoL6WL+8Q@mail.gmail.com>
 <c080b8ce-c88f-aa37-f47d-1709c9e6dce5@gmail.com>
 <20220309092605.5izvcbp6pougm6ye@sirius.home.kraxel.org>
 <5986332a-1f9c-01bf-e3e7-329cf2d04672@gmail.com>
 <CAJ+F1CJL_33rgpAG3s2TboxgzsgC1fEcDJ5Y=Cxc1Tbb6w0W6w@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <CAJ+F1CJL_33rgpAG3s2TboxgzsgC1fEcDJ5Y=Cxc1Tbb6w0W6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::536
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/03/09 18:53, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Mar 9, 2022 at 1:32 PM Akihiko Odaki <akihiko.odaki@gmail.com 
> <mailto:akihiko.odaki@gmail.com>> wrote:
> 
>     On 2022/03/09 18:26, Gerd Hoffmann wrote:
>      >    Hi,
>      >
>      >> dpy_gfx_switch and dpy_gfx_update need to be called to finish the
>      >> initialization or switching of the non-OpenGL display. However,
>     the proposed
>      >> patch only calls dpy_gfx_switch.
>      >>
>      >> vnc actually does not need dpy_gfx_update because the vnc
>     implementation of
>      >> dpy_gfx_switch implicitly does the work for dpy_gfx_update, but
>     the model of
>      >> ui/console expects the two of dpy_gfx_switch and dpy_gfx_update
>     is separated
>      >> and only calling dpy_gfx_switch violates the model.
>     dpy_gfx_update used to
>      >> be called even in such a case before and it is a regression.
>      >
>      > Well, no, the ->dpy_gfx_switch() callback is supposed to do
>     everything
>      > needed to bring the new surface to the screen.  vnc isn't alone here,
>      > gtk for example does the same (see gd_switch()).
>      >
> 
> 
> If dpy_gfx_switch() implies a full dpy_gfx_update(), then we would need 
> another callback to just set the new surface. This would avoid 
> intermediary and useless switches to 2d/surface when the scanout is GL.
> 
> For consistency, we should also declare that gl_scanout_texture and 
> gl_scanout_dmabuf imply full update as well.
> 
>      > Yes, typically this is roughly the same an explicit
>     dpy_gfx_update call
>      > would do.  So this could be changed if it helps making the opengl
>     code
>      > paths less confusing, but that should be a separate patch series and
>      > separate discussion.
>      >
>      > take care,
>      >    Gerd
>      >
> 
>     Then ui/cocoa is probably wrong. I don't think it does the update when
>     dpy_gfx_switch is called.
> 
>     Please tell me if you think dpy_gfx_switch shouldn't do the implicit
>     update in the future. I'll write a patch to do the update in cocoa's
>     dpy_gfx_switch implementation otherwise.
> 
> 
> Can we ack this series first and iterate on top? It solves a number of 
> issues already and is a better starting point.
> 
> thanks
> 
> -- 
> Marc-André Lureau

The call of dpy_gfx_update in displaychangelistener_display_console 
should be removed. It would simplify the patch.

Also it is still not shown that the series is a better alternative to:
https://patchew.org/QEMU/20220213024222.3548-1-akihiko.odaki@gmail.com/

The series "ui/dbus: Share one listener for a console" has significantly 
less code than this series and therefore needs some reasoning for that.

Regards,
Akihiko Odaki

