Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1776C33BD
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 15:09:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pecgC-0000Wv-Qh; Tue, 21 Mar 2023 10:09:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pecgB-0000Wk-0Q
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 10:09:35 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pecg9-00065s-Cf
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 10:09:34 -0400
Received: by mail-pg1-x531.google.com with SMTP id z18so8609071pgj.13
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 07:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679407771;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SiR70lJlKx1xiW3Y/p3/gGTVxkK/lMtTJgiYH0xJQrk=;
 b=s/lGue2VP4c7gdRZYehT8Kr7gUAhBHELE0jUA5fMke33XSCeNX/asRf0H9oFMtoCOm
 WNwypArpZRekc7yQnUMT8V2sB8mAoWIGcNetk76FQp6qFVbGt4GyxslmzNFErsd0Fvoy
 cwz8W6gm/46Ebkp0k1/+c7vBUUAahznIKl/rwOCbhsZTiAsifoJZotz1dLGuHpgcPYSK
 EB3PJy8/yv3VrMLx/o89T49Rrddx/1zTojiQFYszUZDlQyRx1T7z3PEXjaMD+mmlJTKS
 t/1Wy5I8mq6t7wHG+eWdiQFw6bt9N7ffooMy2ZvLuj5tVpqwny8UxfSnjNSuElJhbAwD
 njWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679407771;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SiR70lJlKx1xiW3Y/p3/gGTVxkK/lMtTJgiYH0xJQrk=;
 b=AmHHfCgpyvKpBEr7pRtAL1JqpzZH0uVI1v8tS23Ujxs72fvaONBsZICg08CYOXOnSn
 3fCTGZlLKlpjujAruxaCWyH+UhDYB/T/uRseu9dfm9KV9wIVVZkd3oIXj+ROZR+YQ2J+
 razfMnLQXqmJaxkGdZ/abwotZGTKuejc3fTKHeXwHHIF3biMlGbthwCC1BM4Ogn4hOyZ
 u+LOdjDWe1b92FfTUoOoT13SSmuchFP0JXXv1yOVvUVq7ybsQ/txYXJHNKqCZRdQKzHo
 Hed2XiBfcCxfP044p+7KggU8LfRWExZS5jHtgks8I25cvtVMIggVZP3SFLYmxcCz23MG
 IOsg==
X-Gm-Message-State: AO0yUKVD99LitXXTbC6CPSnbQWAJS71X+V8x4UnSvFY9zLwxPzb46/oa
 9k9MMhqWIGIZeUbXlBGoFc5TkuH3iCS6fKwu6zsKCw==
X-Google-Smtp-Source: AK7set9ii7+qh55B1XJMA9OfFoxSJ+jOksm6zFLj0reQBtO13AZIIE8CPD3kCTcHW7sjfKdjDWQRaAdxR0Zj/cNIaaI=
X-Received: by 2002:a65:63cf:0:b0:502:e4df:5f3f with SMTP id
 n15-20020a6563cf000000b00502e4df5f3fmr710863pgv.6.1679407771670; Tue, 21 Mar
 2023 07:09:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230321090334.1841607-1-marcandre.lureau@redhat.com>
In-Reply-To: <20230321090334.1841607-1-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Mar 2023 14:09:20 +0000
Message-ID: <CAFEAcA_WnceaUsAgVa5u65h+dKRXV3_UXtrL63JhEFvLV8YMfw@mail.gmail.com>
Subject: Re: [PULL 0/7] ui/ fixes for 8.0
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 berrange@redhat.com, Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x531.google.com
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

On Tue, 21 Mar 2023 at 09:04, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The following changes since commit aa9e7fa4689d1becb2faf67f65aafcbcf664f1=
ce:
>
>   Merge tag 'edk2-stable202302-20230320-pull-request' of https://gitlab.c=
om/kraxel/qemu into staging (2023-03-20 13:43:35 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/marcandre.lureau/qemu.git tags/ui-pull-request
>
> for you to fetch changes up to 49152ac47003ca21fc6f2a5c3e517f79649e1541:
>
>   ui: fix crash on serial reset, during init (2023-03-21 11:46:22 +0400)
>
> ----------------------------------------------------------------
> ui/ fixes for 8.0
>
> ----------------------------------------------------------------
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

