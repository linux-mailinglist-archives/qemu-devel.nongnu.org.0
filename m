Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E126FC2C2
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 11:28:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwJdl-00059G-7M; Tue, 09 May 2023 05:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwJdj-00058v-HV
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:28:11 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwJdh-0000us-VO
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:28:11 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-50bc0117683so10198441a12.1
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 02:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683624488; x=1686216488;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=H/9g1Ix0VvfWcms4RMR1WpCwyCH/rl1hW82mqXVJe0I=;
 b=UnATFZwO1K8G14VYNVgqa1H0g6GLGcWgsUK1BGondXIdNdV5XlEmPmpnuIpoKcwf+k
 x90j6TKB4J3zQqDspgUo/dAbi4jBx+j3ILaHKBo6Pn7zR5LMmf/Wb50uegSjCIj6Tgz5
 zO6g6ljwHunuW9JX3jjlSaB3xGFVl99OxrpKgL7LNINUT0dIpF+09VXSnBZSuBISU6v9
 U5U5PR9TCqe+Mu8Q5aH7iB1Z8IfjiXg+eChi+iIYysa61xmMVnWJ8dgxMCbJDBbJsSMn
 hyl7t9fVU7Ey2ABCo/NK1IaBm5rFpzl6JMMQeEcr21KuHboJ3lOa4O3GWggwPenLDFoK
 KmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683624488; x=1686216488;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H/9g1Ix0VvfWcms4RMR1WpCwyCH/rl1hW82mqXVJe0I=;
 b=Ucfk/oXXH/pTcyxDt9qx7dkJvZvyUThDDGWJwVOQM86Tl3Pq3D4YQmTm8N9jQw/llT
 FsWjzXZ7ZszokqVN6Cf0L7aBUWS9loGUBuWUbASTImfYU94keklt9XqsrpKyI1DlKtjD
 qenIHRXZ3xh6oACnCjN5EsrzqQCMKw12paK5axxCjbRJXIG6eB2j8h95Id3jCiJZrTqM
 IG59ZKioRyE2eKm4AZA99r9uPluXiiKoxHApXIXyp9reXU1NlccRoKAsPJNIm3AWQ3k0
 U1eSL3mfsewOfy6LL2j4Xk9Jzn0QK2TYHwpH486A5YuvvDwtsOAnL0q6rsqajLpkSu13
 Lo3A==
X-Gm-Message-State: AC+VfDw/Sv9aPebygsCFbEz8/kGqp9eayBIfP35E5vb6aYu1D7q6ujEU
 av71nkDiZYB9d4Alga1gqs2a5hTWEXbbWdGyt0KumQ==
X-Google-Smtp-Source: ACHHUZ7fzwEDnpHzH6zTGaVIKQ0959Ds1y56Ppeatv6jbSo0SvmdBwFyAEhe/QY9GFPnLle13rAU7smEEPjxwFqeZu4=
X-Received: by 2002:a05:6402:3456:b0:50c:cde7:285b with SMTP id
 l22-20020a056402345600b0050ccde7285bmr11851376edc.29.1683624488080; Tue, 09
 May 2023 02:28:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-6-alex.bennee@linaro.org>
 <531a2eab-f0e6-46a5-c021-c82746c1ae38@redhat.com>
 <87y1m5s9yl.fsf@linaro.org> <5fb214d8-4a54-f896-f23f-fe9e646e4b2d@redhat.com>
 <CAFEAcA-Cfz8CkNeTQodoSitocBmm4ddk25Dq8x=5FiiGvaS34Q@mail.gmail.com>
 <e7185f74-f041-05b1-0f76-bab6d724e796@redhat.com> <878re4cl1u.fsf@suse.de>
 <CABgObfYYFfGk2X6M5MxbEbVqCYOp1Km53xkTNrfHwkK=aZOpyw@mail.gmail.com>
In-Reply-To: <CABgObfYYFfGk2X6M5MxbEbVqCYOp1Km53xkTNrfHwkK=aZOpyw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 May 2023 10:27:57 +0100
Message-ID: <CAFEAcA91kfdgP3GD8OzgpePX6yXxsLZgARfsNhjY8WyEtKwUuA@mail.gmail.com>
Subject: Re: [PATCH 05/22] hw/arm: Select VIRTIO_NET for virt machine
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel <qemu-devel@nongnu.org>, Laurent Vivier <lvivier@redhat.com>, 
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 Leif Lindholm <quic_llindhol@quicinc.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Helge Deller <deller@gmx.de>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, 
 Andrew Jeffery <andrew@aj.id.au>, qemu-s390x <qemu-s390x@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Radoslaw Biernacki <rad@semihalf.com>, Aurelien Jarno <aurelien@aurel32.net>, 
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Song Gao <gaosong@loongson.cn>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Mon, 8 May 2023 at 23:24, Paolo Bonzini <pbonzini@redhat.com> wrote:
> --without-default-devices is not about choosing to not build
> some devices; it is about making non-selected devices opt-in
> rather than opt-out.

Hmm, so it's basically "the person doing the configuration needs
to know what they're doing, the Kconfig system will give them
no hints about what devices might or might not be needed to
make machine type M functional" ?

-- PMM

