Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EFE4B7D90
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 03:40:04 +0100 (CET)
Received: from localhost ([::1]:50368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKAEc-0000W7-QE
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 21:40:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nKABc-0008FI-0m
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 21:36:56 -0500
Received: from [2607:f8b0:4864:20::c36] (port=41520
 helo=mail-oo1-xc36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nKABa-00083A-Hq
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 21:36:55 -0500
Received: by mail-oo1-xc36.google.com with SMTP id
 d134-20020a4a528c000000b00319244f4b04so919832oob.8
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 18:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=I/6V9r6ddDQj0AXlMuTrrmqWesdNjeXXrgoGSGdxjmE=;
 b=mtGVRHXSefCeGgMltgIGkZhP+alEbPpAY66X2bPo8nc58bMajs+WCj636VTeZb4uEk
 UK5ENHt8H6UlbCtVky2q8fhl5pbo419f4J7SR0f/s7bOgc35wnevxXu2XpJcQvf4y1sM
 fN2IzB8NkeJe4XiVFFoXsD68Oi65zjxtBYW/NkwnrKM1Rj86OFPx+hIX4SFI1BicQxsF
 X942ejfg1izcn0n6EHZezJBPvencnrs3LVtjzHfnHopLtbOvC++I7EpyONiEVhl2UzDn
 S4gXW4ys3NMHTRQvXqtLiIwiN38FLvqn5/MsRNLT0OMWWTPKXYsfTnKr9DMcAxaGWVV5
 ChGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=I/6V9r6ddDQj0AXlMuTrrmqWesdNjeXXrgoGSGdxjmE=;
 b=e/7gfThwsZKftThWmk25OWU+BzN6VJiHuevYIBfwsgOhVXw50R+tIHcUzzjvRRFxbW
 oOcT6VXFy1Cn0b3FSOw8qMBXUnxNFeqBY16/UOPbwZCzjByo723iNSC3j/oVfuq8p1FS
 eRpHVl2rUEqyCAmG2dcI/BKdNW4TVs7P/UW5textJrGtYRQp6Pk18c7jomcqAyVB11mB
 x4inP+vg7oG9M0ZMQD/7zDFcktzPtKgQG1B8FjRvRd5TZIMGwJ5cvtvTz9D3vb3arVGi
 c3PmAT0mHqvsh+4Y75sJEEH8YHouBIwVDwYR+e7QpQXX2mPopCOclKcuwv0c4Bg+IlKG
 DRxw==
X-Gm-Message-State: AOAM533UgzyXKAl9XN2eKi1MJc7Jv/XmAtiEm6wBm36fyT4TQ3z8B74Y
 9IYmLB007jXTGY3qtUTKrLQh+DkpIGadEwSJLFk=
X-Google-Smtp-Source: ABdhPJyCpCxfR9JKlOwqDu+suz4xb/CL25VwPP3Zh1ciHyR/nVJ70aM2/bZAKn0Z2ubPka2U6Q4g/I3vPeIk7WiL3Ks=
X-Received: by 2002:a05:6871:418b:b0:d1:4e3:7711 with SMTP id
 lc11-20020a056871418b00b000d104e37711mr291910oab.237.1644979013478; Tue, 15
 Feb 2022 18:36:53 -0800 (PST)
MIME-Version: 1.0
References: <20220215170106.95848-1-f4bug@amsat.org>
 <20220215170106.95848-3-f4bug@amsat.org>
In-Reply-To: <20220215170106.95848-3-f4bug@amsat.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Wed, 16 Feb 2022 11:36:41 +0900
Message-ID: <CAMVc7JVNhx6yAFo_hYO3qJOQqysU_ejqwVuC9eXs5zusxOtDkQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] osdep: Ignore 'unguarded-availability-new'
 warnings on macOS Catalina
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-oo1-xc36.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 16, 2022 at 2:01 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> When building with GCC on macOS Catalina we get 2254 times:
>
>   include/qemu/osdep.h:780:5: warning: 'pthread_jit_write_protect_np' is =
only available on macOS 11.0 or newer [-Wunguarded-availability-new]
>       pthread_jit_write_protect_np(true);
>       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Fix by using a stricker toolchain version low range, replacing
> MAC_OS_X_VERSION_MAX_ALLOWED by MAC_OS_X_VERSION_MIN_REQUIRED.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/qemu/osdep.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index aecd2f66ec..1e7a002339 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -774,7 +774,7 @@ size_t qemu_get_host_physmem(void);
>   * for the current thread.
>   */
>  #if defined(MAC_OS_VERSION_11_0) && \
> -    MAC_OS_X_VERSION_MAX_ALLOWED >=3D MAC_OS_VERSION_11_0
> +    MAC_OS_X_VERSION_MIN_REQUIRED >=3D MAC_OS_VERSION_11_0
>  static inline void qemu_thread_jit_execute(void)
>  {
>      pthread_jit_write_protect_np(true);
> --
> 2.34.1
>

This should be squashed with "[PATCH v2 1/8] osdep: Avoid using
Clang-specific __builtin_available()"; Removing __builtin_available
makes it incompatible with macOS < 11.0, hence this change is needed.

