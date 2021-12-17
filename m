Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F251F4789E1
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 12:27:27 +0100 (CET)
Received: from localhost ([::1]:59690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myBOY-0003fW-G9
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 06:27:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1myBLW-0002Pi-JZ
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 06:24:18 -0500
Received: from [2607:f8b0:4864:20::a30] (port=45696
 helo=mail-vk1-xa30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1myBLT-0007aQ-Bo
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 06:24:18 -0500
Received: by mail-vk1-xa30.google.com with SMTP id j10so1238773vkk.12
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 03:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Vdi9oT7/nUcTM38+jVmqzxNfh9WvISco8A/skUIcObA=;
 b=B/3m9wLejs+YgZpBMUVvzHiGZzkS5OAdr1EKJllnH8vvCE9zqfaAQOpVnHUUqmYLKM
 cWun6sxbmciwcYaY/eGTPPfdbWX+XThoHDugm2UW3v6bwAv3BBmyEd0BUUgcEeG0FVrm
 YB6VmtsoYzFb/HUNMev02NSnlGLj2igSCv8EHMnlE7HAME9b0iginC43jnGDEusHTF27
 TMnJIvf7ETzRufAzhYyehdSdCO6VDoZf26wFzAUzPKw6lvSIoNbfbVaOmy1QwiNNBIQj
 Uonyhlcuu4JTxoBXsM+in/f9ZXOVT1W3UALL/godt6CpzPZl2eXKX6uE448WCR359Xw9
 agyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Vdi9oT7/nUcTM38+jVmqzxNfh9WvISco8A/skUIcObA=;
 b=I8TFX5Btoej4e9ewgss9Z0rn/HQod4aS5GnLYy4+oIzNYYiXwlbeF0DXUkJs7ofoI/
 flKW67NyAH/eYvmrkQZgdHQ+RU7qlY49F+va6uPNSZNUfmhn3xmIq9pZeARyYdDA51aX
 9aLFfTzG/2aghWhOP/nSxEyVmOjTBUMXpkrecLem3VSLX8oaJkMNLhY3x9lfMXHjZmpa
 FmT+XJu0EB1f4LeqPfWZi2wrrUPY7z3KWf8kknk8vrYgvKD51IL5Btm3priyDjZHLykS
 IT9vkzOVxwyVrJdNvmtn32UyDXvJ5IOmC+IEOL470Hht9y3BN7tFuR4P2N0bHlF/PhGO
 Hyzw==
X-Gm-Message-State: AOAM5320QlZO87lpy/WpK2NcfftZ2pMZSUpOcuW5GVoGeHsdO77EVZGp
 gO4kOlC87YqI8lHnZpglxynXZw==
X-Google-Smtp-Source: ABdhPJxvihRt0IMBaCJP9uzfRNpusYIHPbhaK+sdB3O4xsCFE0JY9ee9LzlPWxiWcpaG6RC62czf/Q==
X-Received: by 2002:a1f:9f8c:: with SMTP id i134mr920857vke.8.1639740254100;
 Fri, 17 Dec 2021 03:24:14 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f125sm840103vkg.27.2021.12.17.03.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 03:24:13 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F1C841FF96;
 Fri, 17 Dec 2021 11:24:10 +0000 (GMT)
References: <20210903174510.751630-1-philmd@redhat.com>
 <20210903174510.751630-3-philmd@redhat.com> <875yrofxki.fsf@linaro.org>
 <34bd86db-a213-bb3a-9c72-8c48bd138835@redhat.com>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 02/28] glib-compat: Introduce g_memdup2() wrapper
Date: Fri, 17 Dec 2021 11:10:31 +0000
In-reply-to: <34bd86db-a213-bb3a-9c72-8c48bd138835@redhat.com>
Message-ID: <87v8zneap1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a30;
 envelope-from=alex.bennee@linaro.org; helo=mail-vk1-xa30.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, "Michael S.
 Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, "Daniel P
 . Berrange" <berrange@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 12/16/21 15:11, Alex Benn=C3=A9e wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>=20
>>> When experimenting raising GLIB_VERSION_MIN_REQUIRED to 2.68
>>> (Fedora 34 provides GLib 2.68.1) we get:
>>>
>>>   hw/virtio/virtio-crypto.c:245:24: error: 'g_memdup' is deprecated: Us=
e 'g_memdup2' instead [-Werror,-Wdeprecated-declarations]
>>>   ...
>>>
>>> g_memdup() has been updated by g_memdup2() to fix eventual security
>>> issues (size argument is 32-bit and could be truncated / wrapping).
>>> GLib recommends to copy their static inline version of g_memdup2():
>>> https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdu=
p2-now/5538
>>>
>>> Our glib-compat.h provides a comment explaining how to deal with
>>> these deprecated declarations (see commit e71e8cc0355
>>> "glib: enforce the minimum required version and warn about old APIs").
>>>
<snip>
>>> +#define g_memdup2(m, s) g_memdup2_qemu(m, s)
>>> +
>>=20
>> As per our style wouldn't it make sense to just call it qemu_memdup(m,
>> s)?
>
> I followed the documentation in include/glib-compat.h:
>
> /*
>  * Note that because of the GLIB_VERSION_MAX_ALLOWED constant above,
> allowing
>  * use of functions from newer GLib via this compat header needs a little
>  * trickery to prevent warnings being emitted.
>  *
>  * Consider a function from newer glib-X.Y that we want to use
>  *
>  *    int g_foo(const char *wibble)
>  *
>  * We must define a static inline function with the same signature that d=
oes
>  * what we need, but with a "_qemu" suffix e.g.
>  *
>  * static inline void g_foo_qemu(const char *wibble)
>  * {
>  *     #if GLIB_CHECK_VERSION(X, Y, 0)
>  *        g_foo(wibble)
>  *     #else
>  *        g_something_equivalent_in_older_glib(wibble);
>  *     #endif
>  * }
>  *
>  * The #pragma at the top of this file turns off -Wdeprecated-declaration=
s,
>  * ensuring this wrapper function impl doesn't trigger the compiler warni=
ng
>  * about using too new glib APIs. Finally we can do
>  *
>  *   #define g_foo(a) g_foo_qemu(a)
>  *
>  * So now the code elsewhere in QEMU, which *does* have the
>  * -Wdeprecated-declarations warning active, can call g_foo(...) as norma=
l,
>  * without generating warnings.
>  */
>
> which is how g_unix_get_passwd_entry_qemu() is implemented.

Yet later we have qemu_g_test_slow following the style guide. Also I'm
confused by the usage of g_unix_get_passwd_entry_qemu because the only
place I see it in qga/commands-posix-ssh.c right before it does:

#define g_unix_get_passwd_entry_qemu(username, err) \
   test_get_passwd_entry(username, err)

although I think that only hold when the file is built with
QGA_BUILD_UNIT_TEST.

> Should we reword the documentation first?

The original wording in glib-compat.h was added by Daniel in 2018 but
the commit that added the password function comments:

  Since the fallback version is still unsafe, I would rather keep the
  _qemu postfix, to make sure it's not being misused by mistake. When/if
  necessary, we can implement a safer fallback and drop the _qemu suffix.

So if we are going to make a distinction between a qemu prefix and
suffix we should agree that and add it to the style document.

--=20
Alex Benn=C3=A9e

