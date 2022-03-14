Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A29424D893D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 17:33:13 +0100 (CET)
Received: from localhost ([::1]:39184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTndA-0000x5-At
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 12:33:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nTnFG-0004rw-GF
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 12:08:30 -0400
Received: from [2607:f8b0:4864:20::b2d] (port=42546
 helo=mail-yb1-xb2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nTnFD-0002e7-Ah
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 12:08:30 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id u10so31687748ybd.9
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 09:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2HGDRUKrwEN1d1K0bkDUZOaGvLo7SAJZqfbA6vVtahI=;
 b=SdKfd/jbfGl52GQYetUtYUdEOsWHs/OwcXpH/I1S9dZeNmPMmDUjhk4fg2k0fckDY0
 t23UvUz0VX5KFhJVhe9QE4pxDN4WgSxdl2ub9UvFNGfWLksZPY3qve78zZUa/T+keflA
 4AqyVh/8j+AuQSOjaa97O9K94KoTPLgUsD1vsKJvk2RgSco0dDjxktClnkVR6rNfUD1j
 zklsyhplOXYFaLqTldx9pYgtu++atT9y1Dw4Ghx51Wl3kAxno8itR1Ko8ofxlm++dFis
 qihdx8K0f1b56+t1POBlkbGHXwMXu7ECfibDcuW0asoel4nuFfOu+/4Uh3pw02Ppe5lO
 w2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2HGDRUKrwEN1d1K0bkDUZOaGvLo7SAJZqfbA6vVtahI=;
 b=bFqtDKnsujrwAsc3+9qpWcoZjSI5aH+kxuDvkch9jn/it3qMV+TqCnMVDzn1iaR1u7
 f8OAxYpPXIwNXA6Wv8peGFuiqBfSIxUVT+bZsPgWhnxxRb5fllpAhA1QoTGsQXuHrgV5
 RpOkv8VdfM6EOg8bZIHXMJjko7VKDWmXzYXl7JAuUF52HflUvz4UqvIbfWHh9c3G27An
 WVJu25E07tUioztGNB4eLESCm6nPMNWNrZKdGnNJEts/AXScNEWPwjkZXdwJoaP4tBNc
 a5B3x9A0855WJg8AcAkY084nwIGcrEB1zWN7MS/xHw8ooy1j9N1xLIEn62VB49FE1cIe
 xyyg==
X-Gm-Message-State: AOAM532q54XFzdaHlTUP2jxn9b9LmeOw3TxiMIizH7Kr27hih2ue9ojt
 fBGMeb9pm/A1XAn97VlbQudb7wrnqKLs/NUzKUTMNw==
X-Google-Smtp-Source: ABdhPJyW6M/Aw8hf4XdJy6WjUtmqQsp6CbpUtiBE5nkkoLRyKFw/dasDSxXiwKCdKxH3YAqMGp/y61XBal4OddxiDeY=
X-Received: by 2002:a5b:350:0:b0:628:86b8:6e09 with SMTP id
 q16-20020a5b0350000000b0062886b86e09mr18269446ybp.39.1647274106395; Mon, 14
 Mar 2022 09:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220314160108.1440470-1-armbru@redhat.com>
 <20220314160108.1440470-4-armbru@redhat.com>
In-Reply-To: <20220314160108.1440470-4-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Mar 2022 16:08:15 +0000
Message-ID: <CAFEAcA8Tb7e+mJGaietc5si7_xZWxbTixcTSvNpB9wH_LQJ7kQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] Use g_new() & friends where that makes obvious sense
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Reinoud Zandijk <reinoud@netbsd.org>,
 Eric Blake <eblake@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Kamil Rytarowski <kamil@netbsd.org>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Michael Roth <michael.roth@amd.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Amit Shah <amit@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, haxm-team@intel.com,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Fabien Chouteau <chouteau@adacore.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Keith Busch <kbusch@kernel.org>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-s390x@nongnu.org, Patrick Venture <venture@google.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-ppc@nongnu.org,
 Wenchao Wang <wenchao.wang@intel.com>, Igor Mammedov <imammedo@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Mar 2022 at 16:01, Markus Armbruster <armbru@redhat.com> wrote:
>
> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
> for two reasons.  One, it catches multiplication overflowing size_t.
> Two, it returns T * rather than void *, which lets the compiler catch
> more type errors.
>
> This commit only touches allocations with size arguments of the form
> sizeof(T).
>
> Patch created mechanically with:
>
>     $ spatch --in-place --sp-file scripts/coccinelle/use-g_new-etc.cocci \
>              --macro-file scripts/cocci-macro-file.h FILES...
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

>  104 files changed, 197 insertions(+), 202 deletions(-)

I'm not going to say you must split this patch up. I'm just going to
say that I personally am not looking at it, because it's too big
for me to deal with.

-- PMM

