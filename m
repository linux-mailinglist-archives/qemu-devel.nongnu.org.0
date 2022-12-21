Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8064165304B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 12:33:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7xKr-0002os-D3; Wed, 21 Dec 2022 06:32:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1p7xKo-0002nx-Pc
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 06:32:30 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1p7xKm-0004O4-Qv
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 06:32:30 -0500
Received: by mail-ed1-x52b.google.com with SMTP id s5so21500147edc.12
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 03:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Idoa3ipwuyIr8dpAUuI6og3qVKKT6esemnOqF+syihc=;
 b=GSkjhKjokO9c1a68W9LlnmV5tUb5J77E36C+7tO44s5V03a5wanyb3qWEcDG8ZEvM0
 0UWF+Q1DP7YGcpp4wsSSv+sF5cwqaT36QQ2KZYO5BZpa8jT0fwm7GapBM+1ZoH70xrop
 gJpaNf1yRm6ZduA914ASHGQ3yK2wtCWp553juKFMBY2Za+2+eEQCo42RHwiE4r74cuBK
 A1HpqLhA3graKp1LnHkAwaGjb6pb+qGi0aN/ezHWTJSL8Ypp3a7npuXBv1RER5FFeoEB
 s56J9Fl5t9at3XVZEXNmrUB3GGT+7dENDcPGX5iHbxJuwLx6fdJCEFUIlaEwhFGssxhi
 Pcxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Idoa3ipwuyIr8dpAUuI6og3qVKKT6esemnOqF+syihc=;
 b=P+VtRgxZA1kkFGCC20hV6oBoX7QRspTMJSoTqbHs9aT90peOV53fIlbKByfKnyHFk8
 3b1945UJnlmZTkn90N4e/kjZeu2Yrc8MIZ1D1rexFtEAm6Hr9MzNieGmrCFENStjDw+q
 xH3ctbQBtc2yU+ZnubZgf7CocCg2hKTWGYRamD6ynOHwfev+9GYGfyiqvwbrg9rI3tgB
 NFUCi7RRFAVeQixsmW7hjCgTvJmVvHI98hUOgEJFa+4JzaVhOFhUwH1i/RlWq5WkETSu
 lcuIp4ADQQvNFmQEhY1JKNcRyKmvRkY5TyCYOmzh3q9YUB0n528nRORqz1738sedJ0yL
 FDlw==
X-Gm-Message-State: AFqh2kqSjA+UtQpyLLZXP2zAEdCKJTrwk8WnwI2QXxeRG7xytNfXlN8a
 27Bn3xpaTBCW1r9fZA892JgCIBK5ElyrLysVGVE0
X-Google-Smtp-Source: AMrXdXtgCoV/Me8VbZ+GXfOmjD+/YFNExitmdpJTpFrNsn+nNsJPTWGWykxCRdf1vPq2RlT521wVZT3ZN0Abnf61Bg0=
X-Received: by 2002:a05:6402:b6b:b0:470:307e:122e with SMTP id
 cb11-20020a0564020b6b00b00470307e122emr134421edb.131.1671622341807; Wed, 21
 Dec 2022 03:32:21 -0800 (PST)
MIME-Version: 1.0
References: <cover.1671563795.git.marcel@holtmann.org>
 <af80ce3471a473f12753c00aace94b0a9de49566.1671563795.git.marcel@holtmann.org>
In-Reply-To: <af80ce3471a473f12753c00aace94b0a9de49566.1671563795.git.marcel@holtmann.org>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Wed, 21 Dec 2022 19:32:09 +0800
Message-ID: <CACycT3sq3MwRkhaBtnRS_jR6aDiceMnP3wKgw0RpRW==RJAAPw@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] libvduse: Switch to unsigned int for inuse field
 in struct VduseVirtq
To: Marcel Holtmann <marcel@holtmann.org>
Cc: qemu devel list <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=xieyongji@bytedance.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Wed, Dec 21, 2022 at 3:27 AM Marcel Holtmann <marcel@holtmann.org> wrote=
:
>
> It seems there is no need to keep the inuse field signed and end up with
> compiler warnings for sign-compare.
>
>   CC       libvduse.o
> libvduse.c: In function =E2=80=98vduse_queue_pop=E2=80=99:
> libvduse.c:789:19: error: comparison of integer expressions of different =
signedness: =E2=80=98int=E2=80=99 and =E2=80=98unsigned int=E2=80=99 [-Werr=
or=3Dsign-compare]
>   789 |     if (vq->inuse >=3D vq->vring.num) {
>       |                   ^~
>
> Instead of casting the comparison to unsigned int, just make the inuse
> field unsigned int in the fist place.
>
> Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
> ---
>  subprojects/libvduse/libvduse.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Xie Yongji <xieyongji@bytedance.com>

Thanks,
Yongji

