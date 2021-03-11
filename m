Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F90B33787E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:52:59 +0100 (CET)
Received: from localhost ([::1]:45578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKNcQ-0003x2-K1
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:52:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lKN6K-0000qi-CX
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 10:19:49 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lKN6H-0003y8-Fa
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 10:19:48 -0500
Received: by mail-wr1-x433.google.com with SMTP id w11so2270473wrr.10
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 07:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Hte7NmdbG1nTFJwihR8DYjO7bbmfBAEG1WW+4U23yaw=;
 b=C0kDdiW6lo6t/nIfkJjzdIyLBLY2UTLUdAp3rxFONRmo8BAyjkTdhhbU8VqxqOwTmB
 toj+6uwJ8G1Nf7EwA32tDpA7RcJycROeA/1xAMahNLb/2hwX+h8k2uJGUqTFRckhdUea
 wKMQBLW75aWnNA1rrHAIjiPbIWFOhU5XQs2+gQd4W8GgtcZWYaevxqwB0wyzYLmbPazq
 SoSDGOnBg84pQkIhvNrcrm5IGXZmY0rqfqZ0rmMsaSSPnQvEOEcCfQvunc0pRQ2676h9
 +IBhUPoyJCtQ/zr2l0DNG63WLQH4CaA1T9ewcPO/BAs/x4ZpVjCJtLdsHngR3130f/vy
 IUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Hte7NmdbG1nTFJwihR8DYjO7bbmfBAEG1WW+4U23yaw=;
 b=W8rxtzejl7PSBVz6h3LbuDivtrYTcl4gns/GVdJDz3Ms3F5esylUoik+EVYI+LXjmc
 9sumoZk6Z5+ZtYD8ff5ALcnyaS92Ld0mNuMRvG07fdZiZjFXsavMwYiX7RIAnXSpZ7RV
 M5Eu3uulbO6qdgaY1eE0nHT5vE3C4ZZCfYtZ0PIsRSY527d1PBqpHg3w4AjhD80HVxde
 Wpv/kI8jzbkjOfEHcKmDNhFc4aloMSSUk9POG84HEiPoVVvNoQ7BHkbBoCqODmpDT2L5
 0wUdHRIW0HOhlgyW64k0MuBBhpoT1Yukt3igFQmfqZAzJZTCiiOoqOyQs5Lj7fq4AfkW
 3ueQ==
X-Gm-Message-State: AOAM533SS+9ELKQYyfj6JridARoFd7KRsfHn0STYn9zYnsL5fXJesJxa
 jldk1Y584g3iLE/JITiMqQXK6VukTy7AezBh8dU=
X-Google-Smtp-Source: ABdhPJyHTXZPTs73p6zagqmZMpYJgjSlMoiJIBzOZ5rwcRjgGhOi9m6dnHPeAIdEJ9VF4+UW7uQd4ROBgw3+RWdUxFs=
X-Received: by 2002:a5d:4905:: with SMTP id x5mr9232987wrq.201.1615475982826; 
 Thu, 11 Mar 2021 07:19:42 -0800 (PST)
MIME-Version: 1.0
References: <20210223055800.87324-1-akihiko.odaki@gmail.com>
 <20210223060307.87736-1-akihiko.odaki@gmail.com>
 <20210311124402.rq6eiks26to33tft@sirius.home.kraxel.org>
In-Reply-To: <20210311124402.rq6eiks26to33tft@sirius.home.kraxel.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Fri, 12 Mar 2021 00:19:31 +0900
Message-ID: <CAMVc7JV=N-oCsq3r8jtK0zhY0tCfDRVqLr=fpOwRRzRnFX9hcA@mail.gmail.com>
Subject: Re: [PATCH v4] configure: Improve OpenGL dependency detections
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

2021=E5=B9=B43=E6=9C=8811=E6=97=A5(=E6=9C=A8) 21:44 Gerd Hoffmann <kraxel@r=
edhat.com>:
>
> On Tue, Feb 23, 2021 at 03:03:07PM +0900, Akihiko Odaki wrote:
> > This has the following visible changes:
> >
> > - GBM is required only for OpenGL dma-buf.
> > - X11 is explicitly required by gtk-egl.
> > - EGL is now mandatory for the OpenGL displays.
> >
> > The last one needs some detailed description. Before this change,
> > EGL was tested only for OpenGL dma-buf with the check of
> > EGL_MESA_image_dma_buf_export. However, all of the OpenGL
> > displays depend on EGL and EGL_MESA_image_dma_buf_export is always
> > defined by epoxy's EGL interface.
> > Therefore, it makes more sense to always check the presence of EGL
> > and say the OpenGL displays are available along with OpenGL dma-buf
> > if it is present.
>
> Doesn't apply, seems this needs a rebase.
>

It's already applied as commit
bc6a3565c89243f0aaa24bac6dc37fb52b16d5c5 so it's fine.

Regards,
Akihiko Odaki

