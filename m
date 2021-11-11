Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F91D44DB0A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 18:19:38 +0100 (CET)
Received: from localhost ([::1]:43730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlDjd-0000pq-53
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 12:19:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mlDiH-0007Vq-P7
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 12:18:13 -0500
Received: from [2a00:1450:4864:20::333] (port=45041
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mlDiF-00037c-Ep
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 12:18:13 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 c71-20020a1c9a4a000000b0032cdcc8cbafso4901100wme.3
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 09:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Fjf6WG1Yx+cZ6/eQYv7cwP28ky86kOZclUhiMqlDVP8=;
 b=hKDcJQGSc42Ad6jcvXSe1EpvfxybWElseKzZq6I9jTxPq6hcmdtzORxkeGtn5Vxt5g
 O62TYWxoNqZmhH5Q1+iXdBGHoaO71EimAURgX0wvOst8Q0j2p93DpNRzZEgs0OKUVXc8
 UtbQQHlz3dFepHIYyfTf0gOVmA+DdQ8Tl/ZDcZ2bAo9nJLWOzuqUikWUcT0h43IzBfw6
 geCHJrDDjcmVgtoArMFiIjJcG5QCC+khuB9/SuWyoiWYOrdMLHdjvEUeOGD4kNk1uHD3
 I2gIIMXRMDCyLXvHxHddn6M2w/6UlsAK10YdJoCwkNKrONqU0ihZ6o7KnGQgL8XoOHiv
 liFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Fjf6WG1Yx+cZ6/eQYv7cwP28ky86kOZclUhiMqlDVP8=;
 b=GYrEa0XmD2anFtC2tEkCbdEpSMoAW+Lq5xRUrKpYftcbJ9yVgnJw+ldI2iXDKKQRDx
 qzL7Pjr7SspdmdVPRMhQBBB9LNNmg9jE0ZhhZlYvkCPApuGI/XXPSW2fXe+DNLJIpjyt
 TQh3C0tRTyMSUeRC+wj3qgB0YwMzHuUQAaFpJl0eSPqxcuXrJoC7f+jKVN+vQVC+gUAd
 UdVCtRs3DsDgqEOGHzqh+CnSuKRcsXzCBpPMNLKH+lrakQHQ3xEpg82nUgjJS7boP5Dt
 Y2xlgQJLMT2g8el3h88uFPK6LuwRGLg0iX/hYHyA7ys9cq+A98pkv44OysavysuQaoC1
 q1Bw==
X-Gm-Message-State: AOAM532CbencmVtz48DNmerx0oZfheeWJcaasGknTC4NvsQiagw/3Uhw
 vc3ly/GiuNOUNUaS0UQke7SE6ar8PL8E0g==
X-Google-Smtp-Source: ABdhPJyDs6lmvfFZW5+gQre7oxGR2rH1M1mZuEJoq4E5jGEEq5EgCD1P2Gi8T8Lgxdg+sVdp9QMLBQ==
X-Received: by 2002:a1c:2:: with SMTP id 2mr10090104wma.41.1636651088301;
 Thu, 11 Nov 2021 09:18:08 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n7sm3444465wro.68.2021.11.11.09.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 09:18:06 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9CE0F1FF96;
 Thu, 11 Nov 2021 17:18:05 +0000 (GMT)
References: <20211111110604.207376-1-pbonzini@redhat.com>
 <20211111110604.207376-6-pbonzini@redhat.com>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 5/5] kvm: add support for KVM_GUESTDBG_BLOCKIRQ
Date: Thu, 11 Nov 2021 17:17:59 +0000
In-reply-to: <20211111110604.207376-6-pbonzini@redhat.com>
Message-ID: <87zgqahar6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: cohuck@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> From: Maxim Levitsky <mlevitsk@redhat.com>
>
> Use the KVM_GUESTDBG_BLOCKIRQ debug flag if supported.=20
>
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> [Extracted from Maxim's patch into a separate commit. - Paolo]
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

