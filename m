Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CA46F5B59
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 17:37:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puEXL-0007SL-6N; Wed, 03 May 2023 11:36:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1puEXG-0007RD-Ry
 for qemu-devel@nongnu.org; Wed, 03 May 2023 11:36:54 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1puEXF-0004nA-3m
 for qemu-devel@nongnu.org; Wed, 03 May 2023 11:36:54 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3023a56048bso5028630f8f.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 08:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683128211; x=1685720211;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WW+XyDn5ZXs7zk+juth8i+Nno3sHS+/0ozvwMliQtwU=;
 b=unL2Wox2HWL5bZdUs5o8mgwQ1ceTmAxnPsSJ3dTEQoX9Ef4eebWmHlpLgN0bAiP59o
 BL2C7ByRa9J5HClfvoF1mDtJJv3SCBFLGJlMeszu9JN7k/P/x5xzcg+YZuAlsbPbAKVE
 OAgMMzBYpyTJWiuD0DmJNFWavpRoLiDIhfi+ZH5S9H/LoGJ0QdjOoHYZRFr9DJ1WD4Wl
 fRFOT9WtU1AkB5jwyA6JwDyA7zrojEZEr40LQaMt6W6h0reyOcYy619Ro3BOOI1bui5Q
 bm4BDx4iV6uxa/yandQKbK0bwNWi4vb5JUDFZyUAbcdEh6mMY87rX30fCkGCLhxILns+
 M4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683128211; x=1685720211;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WW+XyDn5ZXs7zk+juth8i+Nno3sHS+/0ozvwMliQtwU=;
 b=SxZqF4HJOvuR3RaPrETSOno/l1uEqv8rCShl2/dSa4YSL0Fy/CqiX3Jvxb0VDL5zvh
 r5i38zFwTf+/4P/y22rq/jHGFmUVhgRP+shXa9y0WHQ9MsJ8JjigLXhaqRe53HKRq4f0
 yc3k4PpBD8GpLdZjWl0rAUSa1NFzBYUVPPcshFly5XQakqHNOMekHjrMvIyffo10Uqxi
 Yw954Ge91Udd9gF6ufIv7afgTX1EKQc0ko8B4Hl0RVAhQxL9We104Y83WabLNM+yRZZ/
 Quw4R+PcM8Vq5cgI+3QlM2nhM0Hib4tbuBp9icS+BRug9VCsD/u6ZbJsCLt77Pm49ZV3
 o9nw==
X-Gm-Message-State: AC+VfDyLF+s/35JOmNut1Ejdpt3OCezWUOXRelEQ8CjY3LbYbEs4H0Lh
 IiHZTa98BvsmuuT4x+U+ApudLg==
X-Google-Smtp-Source: ACHHUZ6t+LG3mNFLrCyMiVd8uE8H2QtRI2XfqRW7Z/pnraEP3bDwXfz5OUqBDqUhlUbXrnHehVu0NQ==
X-Received: by 2002:a5d:5387:0:b0:2fb:bb97:d975 with SMTP id
 d7-20020a5d5387000000b002fbbb97d975mr332219wrv.47.1683128211079; 
 Wed, 03 May 2023 08:36:51 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 j10-20020adfe50a000000b0030631f199f9sm6991877wrm.34.2023.05.03.08.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 08:36:50 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4824C1FFBA;
 Wed,  3 May 2023 16:36:50 +0100 (BST)
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-6-alex.bennee@linaro.org>
 <531a2eab-f0e6-46a5-c021-c82746c1ae38@redhat.com>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>, Artyom
 Tarasenko <atar4qemu@gmail.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Thomas Huth <thuth@redhat.com>, Leif Lindholm
 <quic_llindhol@quicinc.com>, Gerd Hoffmann <kraxel@redhat.com>, Helge
 Deller <deller@gmx.de>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, Stefan
 Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, =?utf-8?Q?C=C3=A9dric?= Le
 Goater
 <clg@kaod.org>, Ilya Leoshkevich <iii@linux.ibm.com>, Pavel Dovgalyuk
 <pavel.dovgaluk@ispras.ru>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, Mark
 Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Aurelien Jarno
 <aurelien@aurel32.net>, David Hildenbrand <david@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>, Joel
 Stanley <joel@jms.id.au>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Fabiano Rosas
 <farosas@suse.de>
Subject: Re: [PATCH 05/22] hw/arm: Select VIRTIO_NET for virt machine
Date: Wed, 03 May 2023 16:35:03 +0100
In-reply-to: <531a2eab-f0e6-46a5-c021-c82746c1ae38@redhat.com>
Message-ID: <87y1m5s9yl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Paolo Bonzini <pbonzini@redhat.com> writes:

> On 5/3/23 11:12, Alex Benn=C3=A9e wrote:
>> From: Fabiano Rosas <farosas@suse.de>
>> The 'virt' machine uses virtio-net-pci as a fallback when no other
>> network driver has been selected via command line. Select VIRTIO_NET
>> and VIRTIO_PCI from CONFIG_ARM_VIRT to avoid errors when PCI_DEVICES=3Dn
>> (due to e.g. --without-default-devices):
>> $ ./qemu-system-aarch64 -M virt -accel tcg -cpu max
>> qemu-system-aarch64: Unsupported NIC model: virtio-net-pci
>
> With respect to patches 5-17, very few devices need to be present when
> configuring --without-default-devices, and thus need to be "select"ed
> by Kconfig.  You should select a device only if you cannot even start
> the machine without --nodefaults.

Which is the case here right? We could skip tests that explicitly
instantiate a device but these are tests failing with default devices
the machine tries to instantiate.

> Anything else should be added by hand to configs/ if you use
> --nodefaults.  In particular, failures of "make check" when configured
> --without-default-devices are *test* bugs, not configuration bugs.
>
> I didn't check if _all_ of the patches in this set should be dropped,
> but most probably do.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

