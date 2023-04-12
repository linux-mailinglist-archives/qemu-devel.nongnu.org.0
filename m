Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B47876DF885
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 16:31:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmbU3-0004kD-2B; Wed, 12 Apr 2023 10:30:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1pmbU0-0004jg-8F
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 10:30:00 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1pmbTy-0000qE-SG
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 10:30:00 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-947abd74b10so518633566b.2
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 07:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681309797; x=1683901797;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=DGRnyytDanfvuWjYteUwLBosUhVe+cTazB0GlhbDI4A=;
 b=p98j93SX/eCWst33DD1EIcGPRKifRCshKrh4Dft4CHVwO6arGLaDlH7cAmAHF3ARc4
 OMNa5iZHeAtgde4ThbmbjRVIh3ZBHo3ZKOx0xjBM0zvCktlsH3yQmK++ARwjMMs52yjp
 m5ZFFWW0fvVFF0w2wMHbcOoOUyVDR5il7XiwScLMy+LwI3IqAItmqXCJW6Fy2MkJonip
 XSjvPJlcf2dHnypCY+vmGJpukswHnWmQeQmiBVDoiOGiflDp6IrPkqwX8iZFmqwEGFcc
 nY12lILPL6ekeHqRxjfO8pHwm8SLiRDiDgXp6pG9UIFm3eMiraYmsL7pPDj2dCVpIYmu
 v5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681309797; x=1683901797;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DGRnyytDanfvuWjYteUwLBosUhVe+cTazB0GlhbDI4A=;
 b=q+EUYpR1sYT//vQ6iILWkmeAyGu8LT3NdS7KwgzaT+2d8YRwKWQob2p8kwI+D16dNr
 bsbAm+D/qx4ZQ5XOogYiDLlF7+FX7EUB26q+twvoZDfJoV8a0+rS7G1X/d38U7zTpxsn
 QvWKgRYBW5Kq4RxlBGoo/dVLp72UUb8V5Fs9x6QcgrjkIJws5IhWpZ+ASseJ9OWKjBh+
 Nl6UG9UpZ/jnGh5Yh1OnzaTpXIDxxMgJA5uWLXeISAuVpexNa+58PqACt28rACxB5vMa
 EW23MH3E6seZ3ATfKK2HRgVyVSFAQ1So7aTHEKKR67uGnZkP1/af1Snlbl6weWdIDUYj
 3U7w==
X-Gm-Message-State: AAQBX9c/IN+E5ZmV3oxVkKNduHkm3IbbhMEaYksL2XLObtqho+XkKMlW
 UxuSOQC1mEjB4f0Cz1sIbefgMT2k9wp6H36+BWvTBKAv
X-Google-Smtp-Source: AKy350bB/iga+ea2d+FYPKjqidoKgF7jeK5L7gvXov1RcaDeU0GMdNNT/o+DT9qg5ftdkOMboEmkpiLI7zq62XBSPno=
X-Received: by 2002:a50:bb05:0:b0:504:e136:1ba5 with SMTP id
 y5-20020a50bb05000000b00504e1361ba5mr1910810ede.7.1681309797378; Wed, 12 Apr
 2023 07:29:57 -0700 (PDT)
MIME-Version: 1.0
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Wed, 12 Apr 2023 16:29:43 +0200
Message-ID: <CABLmASEy_gK+hYPXHRjAk=F1QeigqDvQSikEL=vM-QxnMF0oTA@mail.gmail.com>
Subject: Re: source fails to compile on msys2
To: qemu-devel qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000003aee0705f92471b9"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=hsp.cat7@gmail.com; helo=mail-ej1-x62a.google.com
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

--0000000000003aee0705f92471b9
Content-Type: text/plain; charset="UTF-8"

Yep, fixed

No idea how I got that wrong ;-)

Best,
Howard

--0000000000003aee0705f92471b9
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div>Yep, fixed<br></div><div><br></div><div>No idea how I got that wrong ;-)</div><div><br></div><div>Best,</div><div>Howard<br></div></div>

--0000000000003aee0705f92471b9--

