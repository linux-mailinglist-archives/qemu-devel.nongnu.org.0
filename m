Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A5924257F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Aug 2020 08:33:03 +0200 (CEST)
Received: from localhost ([::1]:40174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5kJq-0003dp-C5
	for lists+qemu-devel@lfdr.de; Wed, 12 Aug 2020 02:33:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1k5kJ7-000368-Ed
 for qemu-devel@nongnu.org; Wed, 12 Aug 2020 02:32:17 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:38990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1k5kJ5-0001NO-Sk
 for qemu-devel@nongnu.org; Wed, 12 Aug 2020 02:32:17 -0400
Received: by mail-oi1-x243.google.com with SMTP id a24so896172oia.6
 for <qemu-devel@nongnu.org>; Tue, 11 Aug 2020 23:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=/NDb08H/5WaGOnb8aaWjpa/KTe4f/4VLErfVEkcDEfY=;
 b=YtNgQxooKBYcEdUX1+u1xTMbD1ggX/t6qgMl3gywUdHw7mKmcfSc7UYeA0Aglzbi6M
 /tuWGRGYuWE7xyisyr/krYDHQmr2aZ67mB8u3nHX6LC1WNkg7eWVQrEiVXcq03lwg4Bm
 ZgFq/OEI/qdYsNSgVIdx4qQRbPrdR7Ub83/NZ57bdH07+w1YRhdn2K1lJIeujMrGH0SK
 1qZt/aigGy415Ea77FzaMOgP/J4JhbAjJEeSgfAvaWPFS2L/lUBq+cCbQeSmmFRHaUKZ
 A7HR42PQakbRXQO9321tvEsEwbRjj25HCuwEcz3YQXQJolxSaXPlKzNZeuFTPNjdLzrE
 VEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=/NDb08H/5WaGOnb8aaWjpa/KTe4f/4VLErfVEkcDEfY=;
 b=A0jumQ+XK8asrOGv8Kesz1lATrABbSeCwd2za6YAyrX5j5AV5VtGfOmS781/bgZebV
 Ec0+eW/zgdsgHgLag1iayikOP1RUD8JsXa1zxUODN3VWKac2b8S3tVIQZAfEgI0YHpi0
 vzAOc9AIIiWiy5pflAUOBN2pqdPjQ2QhTLhgagp+oS1axGZitfnfO8oYKQ0NivQh681o
 c/0Uawn94cn2paSdWAMwxLEfVuOHd1YAMOWBxGhLgW29/lWumkzh/qjPYB+QpXOQyb0m
 W94MtOGFSABO584Uk64AIzR+x2aQoEhbo8+8hfDzPAW6jc00IjGGR9UlSBZwsEHIqwWl
 ISAA==
X-Gm-Message-State: AOAM531PEhN4E7rAQf1nBmJy/c73IrUfJbn6eHXhGASwGtwar6aEpRHq
 rf3yNf/tPUZIkgr5RhRgrSGGZBJ1RytteavEN/pGHw==
X-Google-Smtp-Source: ABdhPJyZu4fszMbTQ+WnwnVIo50MnTJXj+67rYW19M+mEVSQBKEJOlCW/MV3HjlgcGnF15VNZWemjK+6Jmk5a8GyuXs=
X-Received: by 2002:aca:aa13:: with SMTP id t19mr6365712oie.59.1597213933914; 
 Tue, 11 Aug 2020 23:32:13 -0700 (PDT)
MIME-Version: 1.0
References: <1597079345-42801-1-git-send-email-pbonzini@redhat.com>
 <20200811154241.4vzuxvhbwt7ztfvh@steredhat>
In-Reply-To: <20200811154241.4vzuxvhbwt7ztfvh@steredhat>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Wed, 12 Aug 2020 08:32:02 +0200
Message-ID: <CABLmASH9rXQjnYYbADtaq5f4c0uqr+kv10p=hC7GR9wF-EzPUw@mail.gmail.com>
Subject: Re: [PATCH 000/147] Meson integration for 5.2
To: qemu-devel qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000002950b205aca8595d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=hsp.cat7@gmail.com; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002950b205aca8595d
Content-Type: text/plain; charset="UTF-8"

Hi,

I just compiled qemu-system-ppc using the the meson-poc-next branch with:
git clone -b meson-poc-next http://www.github.com/bonzini/qemu
qemu-mesonbuild-next
cd qemu-mesonbuild-next
mkdir build
cd build
../configure --target-list="ppc-softmmu" --enable-sdl --enable-gtk
--disable-werror

qemu-system-ppc is invoked as follows:

./qemu-system-ppc -L pc-bios \
-M mac99,via=pmu -m 512 -sdl \
-serial stdio \
-drive file=/home/hsp/Mac-disks/9.2.img,format=raw,media=disk \
-boot c

Both SDL and GTK GUis are not found, while the configuration overview lists:
SDL support: YES
GTK support: YES

Terminal says:
qemu-system-ppc: Display 'sdl' is not available, or
qemu-system-ppc: Display 'gtk' is not available.

So qemu starts with the vnc server only.

Best,
Howard

--0000000000002950b205aca8595d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>I just compiled qemu-sys=
tem-ppc using the the meson-poc-next branch with:</div><div>git clone -b me=
son-poc-next <a href=3D"http://www.github.com/bonzini/qemu">http://www.gith=
ub.com/bonzini/qemu</a> qemu-mesonbuild-next</div><div>cd qemu-mesonbuild-n=
ext</div><div>mkdir build</div><div>cd build<br></div><div>../configure --t=
arget-list=3D&quot;ppc-softmmu&quot; --enable-sdl --enable-gtk --disable-we=
rror<br></div><div dir=3D"ltr"><br></div><div>qemu-system-ppc is invoked as=
 follows:<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">./qemu-syste=
m-ppc -L pc-bios \<br>-M mac99,via=3Dpmu -m 512 -sdl \<br>-serial stdio \<b=
r>-drive file=3D/home/hsp/Mac-disks/9.2.img,format=3Draw,media=3Ddisk \<br>=
-boot c </div><div dir=3D"ltr"><br></div><div>Both SDL and GTK GUis are not=
 found, while the configuration overview lists:</div><div>SDL support: YES<=
br>GTK support: YES<br></div><div><br></div><div>Terminal says:</div><div>q=
emu-system-ppc: Display &#39;sdl&#39; is not available, or<br></div><div>qe=
mu-system-ppc: Display &#39;gtk&#39; is not available.</div><div dir=3D"ltr=
"><br></div><div>So qemu starts with the vnc server only.</div><div><br></d=
iv><div>Best,</div><div>Howard<br></div><div dir=3D"ltr"><br></div></div>

--0000000000002950b205aca8595d--

