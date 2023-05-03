Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA306F59A4
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 16:16:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puDFj-00018M-To; Wed, 03 May 2023 10:14:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1puDFh-00017p-QS; Wed, 03 May 2023 10:14:41 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1puDFf-0006U2-UQ; Wed, 03 May 2023 10:14:41 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-517bb01bac9so3510301a12.0; 
 Wed, 03 May 2023 07:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683123276; x=1685715276;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ok3dnoIOVRhWF/QeMA4JZUHCP0Ga4MRBynhtmL9YmzU=;
 b=JMzlq6AANJSz4D3TAnij2TrFC98V3bkL1w0hw1lUztjFBTU5llv3GKWRVsW8BAiI7H
 LyjAvjPDO9FOiexpkHNlXxJj8vwMLApDIazEniiI+obVrOx9JvNVI15REpyfYlXWVDfy
 3yCuv4l/tduAvX7iBVyxRYlfAS2zZO+2YWIVtBPXl7Ntpn7+S8qwJk3q041xElJaSwp8
 c2xfccmfjfovsSKx3T6Bj8s6dGkioz94/OG4j7kMT6Wz+um57la7C3ZXwUi2Vz7h7g7Z
 VH/WZf8qSohV6cMdJUvv7dpczZudzvalp5cZZYLVAWUX2qxT8ov2v21kkJ72B3l3ADh0
 2kxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683123276; x=1685715276;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ok3dnoIOVRhWF/QeMA4JZUHCP0Ga4MRBynhtmL9YmzU=;
 b=CTi4sntXfU++Sm8s/fLn/XI0p0IGv3NxUvZANZ+9m4QVDi0favsIkODCJZpyzu3mYX
 Ad3aZaO1frzG24KNhYSuNhxCFf9U8z6x4Hm5FnLqAqURmxDCXCeirbhtO3jmCFRlFnz3
 syOMkhngJIcXnSDwwbV7cLHfFAFoRMX8sYaaPYL0cWXn8g9JMsoEPDvaYptPOrUmrXnM
 OnlpJWGBjRCfmfAhoXn7kKkk9uUsSlZhio2Y2UyTfEj7ybZaDZhh0FZ/ZdiHml6Jyi8a
 ZqC5BhZrYgdROTU06Mk+oJPxhTR/+w+9kl4VPn+MjB3hZLqbA/xuKPnXNn4ecTuLcPYu
 sMFw==
X-Gm-Message-State: AC+VfDwLihleSQPLtwZXMNSKLxKKZzBYkATKB8a6XjcoV7xvqAe69hIz
 3WVNVvehHqDsvv6m0ELoWnWHzygV6xfXPX0s6d0=
X-Google-Smtp-Source: ACHHUZ4/I2s2XbL3TlysGZz1VvWH57h/7jeqr5qD+Rp59sM8wCWNHDS6YtH6ugZEWNQxcpVtGfAVCdorOREDZbcaGeA=
X-Received: by 2002:a17:90a:8c8a:b0:24e:458a:9543 with SMTP id
 b10-20020a17090a8c8a00b0024e458a9543mr2363506pjo.32.1683123276459; Wed, 03
 May 2023 07:14:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-18-alex.bennee@linaro.org>
In-Reply-To: <20230503091244.1450613-18-alex.bennee@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 3 May 2023 07:14:25 -0700
Message-ID: <CAMo8Bf+=xQOXJECB-wPZhKN3hQA1T=fVV2vcQKUa4F_4YWp7kQ@mail.gmail.com>
Subject: Re: [PATCH 17/22] hw/xtensa: add VIRTIO as dependencies for
 XTENSA_VIRT
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>, 
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 Leif Lindholm <quic_llindhol@quicinc.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Helge Deller <deller@gmx.de>, 
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, 
 Andrew Jeffery <andrew@aj.id.au>, qemu-s390x@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Radoslaw Biernacki <rad@semihalf.com>, Aurelien Jarno <aurelien@aurel32.net>, 
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Song Gao <gaosong@loongson.cn>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.001,
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

On Wed, May 3, 2023 at 2:12=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@linaro=
.org> wrote:
>
> These are needed for board creation so fail under "make check" with a
> --without-default-devices build.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  hw/xtensa/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max

