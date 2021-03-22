Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F1A34461B
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 14:44:54 +0100 (CET)
Received: from localhost ([::1]:39110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOKrV-0001GQ-Gb
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 09:44:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOKof-0007qw-Lj
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:41:57 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:46668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOKod-0001SM-Qw
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 09:41:57 -0400
Received: by mail-ej1-x630.google.com with SMTP id u21so3380267ejo.13
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 06:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=1jAXJ16t1yazFUusUkzI7dbOnkRXCXlLwL1nTNSeZ3s=;
 b=KJch9B9ephF7ThkhhaF11AQVcsPu6+SbI8ZzT6RCqb/n7JQzZX5r71iQJ1rI+uVCnd
 2Ytauh9+FdrOqxhvg0LvUSYDXIw0T+ZOZOc/HGrMMRwvF9z/raHn5kgIAr92rs81BF4u
 F+2L0aiTDZVqoQrdeM4QshyFxAjbRJPRRvzEa2DRziiZu/AjU7Cr6gxuv7ApK6L02BOU
 /p4zOuwNCyLpJ2cR5edgxhS5Pg0oqx7sRZQjCFWChPtE3rNCzXnGpOiJw+7aXCqMalcr
 bnzy9JjPLaR7xULUD1YGJxglDgMATxp1oE6MEecZamL7k9zsP5N79lQQhUrea78yi7CL
 nhlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=1jAXJ16t1yazFUusUkzI7dbOnkRXCXlLwL1nTNSeZ3s=;
 b=EdhdP8mD1H0fOgm6ZL2CIhnW9TUdXm+jcHZPBOaHa2i2Qn/KmWy4r0ZnsC967bZ/kL
 vyWarYz72GRIBmtE55aBfJFn0DzQeiSzoDvJj/SHfYdDOWseqcDxpzNK4Gr8htwdei4F
 3tor/900lKQbqGRkQ1/nICsfx9FTrdVIxmLcmwt1NohAEQg7ndENsv/b+Qaz5rQyrb5c
 oXC2jZ+hCr7oBNZNU+/z9gYPljMkaCrfGIZn/2yHKRm78Wt66UyKarNlPFutHMhLOIab
 lfN/kkUFKNsgkoXQP/bKF3LHhF5pyFEaimSckURYUejmkjAYyPLWmUlQ1/TvVECP4NkB
 emDw==
X-Gm-Message-State: AOAM53179kGf4PuNW13Tu/c1bhmj1bUgUtcQfLmC1/ih+XH2aLohiyn3
 FMt8cRjpACmmyMKiU8S/xz67qA==
X-Google-Smtp-Source: ABdhPJzoFvcNrZ907SABz7fRO/SReFbW9yDGhbmbXeTa8e1BvlZhZzBU/anhen5FGojmoVm/aW+b8g==
X-Received: by 2002:a17:906:9152:: with SMTP id
 y18mr19511302ejw.19.1616420514185; 
 Mon, 22 Mar 2021 06:41:54 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id mp36sm9368021ejc.48.2021.03.22.06.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 06:41:53 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E7F061FF7E;
 Mon, 22 Mar 2021 13:41:51 +0000 (GMT)
References: <20210322114739.4078408-1-f4bug@amsat.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH] tests/meson: Only build softfloat objects if TCG is
 selected
Date: Mon, 22 Mar 2021 13:41:45 +0000
In-reply-to: <20210322114739.4078408-1-f4bug@amsat.org>
Message-ID: <8735wnl2zk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Emilio G . Cota" <cota@braap.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> The previous attempt (commit f77147cd4de) doesn't work as
> expected, as we still have CONFIG_TCG=3D1 when using:
>
>   configure --disable-system --disable-user
>
> Use Meson's get_option() instead to remove the softfloat tests
> when building with --disable-tcg.
>
> Suggested-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

