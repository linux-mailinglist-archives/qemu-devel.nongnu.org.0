Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1994CF096
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 05:16:11 +0100 (CET)
Received: from localhost ([::1]:41474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR4n4-0004gF-P0
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 23:16:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nR4l9-0003FZ-Mh; Sun, 06 Mar 2022 23:14:11 -0500
Received: from [2607:f8b0:4864:20::22f] (port=46843
 helo=mail-oi1-x22f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nR4l8-0007iT-5F; Sun, 06 Mar 2022 23:14:11 -0500
Received: by mail-oi1-x22f.google.com with SMTP id l25so13926147oic.13;
 Sun, 06 Mar 2022 20:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zyv7w+yGwNqBOdN28z/MAIaUl64Tp0sUTixsuKOlcwI=;
 b=Xd4ISEicGCfn8EE0qcGDQ4baoOkvGMjmVVIteLUd70bS7TBtyc0LsW/Wm7PWL38clV
 UGRfePs6QJ3zOv/EZ55id8arPUbD2R+6DiXJRjLQ7zf2L0FC+d2qSz8GjvTk+OY0efFk
 JPbtSazR2aRdC8rPeFxOZ5Z0AeHSyrOrl78Ey8Eodp5ydvleIh4pIXYa5fNclE6XqSsG
 fXDVARP7A145OZ+W3pKP1HdcI9u40PrFaHLTXQPnbn2DcctZVALPycXmuIgexrlnaIRU
 mXMX5mg41SYnJQCbJfS96C+BW3fgcx22ixe6RyI2orWjGoJ7yevg5lGaA4hiXyeiph2Q
 7Mug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zyv7w+yGwNqBOdN28z/MAIaUl64Tp0sUTixsuKOlcwI=;
 b=2xn2tKaWPLHh00iYA1uAUbSDU6KjMbfc4go8YI7nfuIjWQybyZVT/QTOen9jKwG1j6
 XdNMBBe8N+GaTqyIDpW9qgzF3gNmmU54qh0wMT4vaGhI3fmeCYHecQvTppZbPTbiXi/K
 wq8pVpMQvHcit/xWySQvrcGoMjob9jfABcEV97q/xAJUX6hsmoTRgO3bwrSuoJoRiDsQ
 vy9O3PY/cPuoMgrT46nxxTKOldSOw4ARsVdkzzICIiwbEWcV5j3O9ULgO8s691Z3/nw0
 h9kYyGUtMyXZZk+foXjkND/uZS2NPmNxNbUvjLXi9bLYDb0SCETtO5GlmvHQovuaQmIr
 k+5g==
X-Gm-Message-State: AOAM530IsPwJuuKKpuP5i5WFGth9j2VJFFxwFrsDTEpyWLw9MXW+cBlx
 dR7hkD9zHgz6vr3WC+g1fyzM4a+JTPJaq535WmI=
X-Google-Smtp-Source: ABdhPJyZFBN+DUM+ssEhTf0PUgoHMfDSwudKZ+wGNNBWorcOQzpUztZBf6eo97pkQ1yM/SlZedTJnHD6ZWV4Lh+ckBY=
X-Received: by 2002:a05:6808:220d:b0:2d9:bdb3:15b2 with SMTP id
 bd13-20020a056808220d00b002d9bdb315b2mr3868649oib.88.1646626448899; Sun, 06
 Mar 2022 20:14:08 -0800 (PST)
MIME-Version: 1.0
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
 <20220306231753.50277-16-philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220306231753.50277-16-philippe.mathieu.daude@gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Mon, 7 Mar 2022 13:13:57 +0900
Message-ID: <CAMVc7JWiBdtt9W5uK0FuW+XEZkB6bj8q0V67wDRf0K7y7rd39w@mail.gmail.com>
Subject: Re: [PATCH v7 15/22] meson: Log QEMU_CXXFLAGS content in summary
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, qemu Developers <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Tested-by: Akihiko Odaki <akihiko.odaki@gmail.com>

On Mon, Mar 7, 2022 at 8:19 AM Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  meson.build | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meson.build b/meson.build
> index 8ca2b7c8c2..0d38b2e72a 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -3470,6 +3470,7 @@ if link_args.length() > 0
>    summary_info +=3D {'LDFLAGS':         ' '.join(link_args)}
>  endif
>  summary_info +=3D {'QEMU_CFLAGS':       config_host['QEMU_CFLAGS']}
> +summary_info +=3D {'QEMU_CXXFLAGS':     config_host['QEMU_CXXFLAGS']}
>  summary_info +=3D {'QEMU_LDFLAGS':      config_host['QEMU_LDFLAGS']}
>  summary_info +=3D {'profiler':          get_option('profiler')}
>  summary_info +=3D {'link-time optimization (LTO)': get_option('b_lto')}
> --
> 2.34.1
>

