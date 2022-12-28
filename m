Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D10D7657781
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 15:08:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAX5x-000515-Gb; Wed, 28 Dec 2022 09:07:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu-daude@linaro.org>)
 id 1pAX5d-0004vt-FW
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 09:07:29 -0500
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu-daude@linaro.org>)
 id 1pAX5c-0002vc-1a
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 09:07:29 -0500
Received: by mail-qk1-x735.google.com with SMTP id z17so7620852qki.11
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 06:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IjYzbIVEorvmm2KU2QPmo8PUpVrTVTmlahAm1XCKAGA=;
 b=iQtJfow2wD6/7R1czNZ3JHLSP25ba+A7M7uCzN0Fd8yFsOnaOXihxya6BC9vo2m+Y0
 zDhS6/q9Fcf0ri/h3XXfPFxF0qu6kYiCc1j+8AIyc3SO5k3u4YH0N+rI1XfdW9zLQUud
 Ej0oG/mb03HFoYsP5Wj4gwcGxV6Ft9hYxfLyljrnuVw185iR7nohjPI6M0/FJvQHzSPk
 Hf7TDqS5X0NLPfIFKFqRTWvfoLKxMda1tNJN69BXKtBhaftH39xNEurApjJlN+WeCXyo
 FqMxTYxu3BELtExYlSXyZOmXq+cppOVAcrkOWAZ+usMzSPPmdXO/OddNispjmKf3qVwQ
 L7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IjYzbIVEorvmm2KU2QPmo8PUpVrTVTmlahAm1XCKAGA=;
 b=4kFl7vpz9vcUYOTNip+G/u7NboSQMk5ZsRieBHa9hD6+7Mj4iDRkjIfJ3cwZxHndkn
 CtkHZRnNcziN6fl0xB6K/MGrpXzOo25wyyyBHwUhTrjmLrGz1YXl7WElwaoP86HbJZTR
 YKYO6B4aUAIxKAlfa4h3dWj1caHjLbTlv3z2wS2eQGDsMpYjTcsfaf/XF/NBWNji1+95
 obaAYzlAvpd2bYFcqlHHq2iTKZeqKpcQ8FSJVfEICR/VxQuJuX37h1CxXA3ZIEVqlOVL
 amIRSv80HvFIqBRdc1fuz4QZi4t1k8bf1p6uG8j0f3LQ8CYZ36cTzWjbKxBXYcJAmj/c
 ThDQ==
X-Gm-Message-State: AFqh2kqobipjdbEUJBVdaHpE/hAOryJAqapKhgNmGmRSTzB2U8flAZqS
 cY4GXC9VQA2lISArgrY/B7N0VkfTZBDTaFLSxOUc+w==
X-Google-Smtp-Source: AMrXdXscONRei6ewKvw1rTSptydY9OHTuUsNjXnmZErLRBw4G9JuWK+m9EIln4JKV83H0JWDICmub2QgkN6n5LS7WFU=
X-Received: by 2002:a37:b93:0:b0:6ed:d040:c175 with SMTP id
 141-20020a370b93000000b006edd040c175mr1073627qkl.536.1672236446216; Wed, 28
 Dec 2022 06:07:26 -0800 (PST)
MIME-Version: 1.0
References: <20211027124531.57561-1-david@redhat.com>
 <20211027124531.57561-11-david@redhat.com>
 <8a2fb7aa-316d-b6bc-1e8d-da5678008825@linaro.org>
 <6a533ba5-5613-1f96-866a-974530fb10bc@redhat.com>
In-Reply-To: <6a533ba5-5613-1f96-866a-974530fb10bc@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Date: Wed, 28 Dec 2022 15:07:15 +0100
Message-ID: <CAPMQPEJ1Nk_8TZgo2r9NtGeV92NbdUUyCszbBxwcYH-ZpFu1iQ@mail.gmail.com>
Subject: Re: [PATCH v1 10/12] virtio-mem: Fix typo in
 virito_mem_intersect_memory_section() function name
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, 
 Peter Xu <peterx@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Hui Zhu <teawater@gmail.com>, Sebastien Boeuf <sebastien.boeuf@intel.com>,
 kvm@vger.kernel.org, QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=philippe.mathieu-daude@linaro.org; helo=mail-qk1-x735.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, 28 Dec 2022 at 15:06, David Hildenbrand <david@redhat.com> wrote:
> On 28.12.22 15:05, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 27/10/21 14:45, David Hildenbrand wrote:
> >> It's "virtio", not "virito".
> >>
> >> Signed-off-by: David Hildenbrand <david@redhat.com>
> >> ---
> >>    hw/virtio/virtio-mem.c | 12 ++++++------
> >>    1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
> I already queued your patch :)

Thank you then! :)

