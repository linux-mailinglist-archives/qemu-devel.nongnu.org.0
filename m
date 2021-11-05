Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B338E44665C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 16:47:45 +0100 (CET)
Received: from localhost ([::1]:36720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj1RQ-0002xI-SL
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 11:47:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj1MK-0004dm-RQ
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 11:42:30 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:45638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj1MI-0000Ay-3l
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 11:42:27 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so6720305wme.4
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 08:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kYMNx+PH4NmqEiLJMpVpnz1hjLOYdsr7CwaJ6NV8oJU=;
 b=mmAotGLYVmyACJwWYVyLVDQ7YLOM0ExyYpAw/xHIxCZ6J7iC0cq68hAYUutbv0tLcl
 iWkK+dchxaeIAhO8C74+KdKUpHkMv88YztH5KNhCDXEaUDwspupOPTPLoL08Wjlw2u8h
 1hwqXdUVtoZvCv4jG9ecHBNukx/RP+J0uBPu3/JCHBcrByVEhune3k4i1S4p2RVd9zXb
 ma4UeHID8Yd9L86ea31gw9Yc58uztAZ1DiRqUxYNr9QjcznQuSG5UDGnzmKeLwT9Mo0B
 1tHENnVNhO4MMARGIT1b116oXjETlWvSKoh6Dga5mD2SOXrCslTqV+0oAZw4T+Wh9f12
 12Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kYMNx+PH4NmqEiLJMpVpnz1hjLOYdsr7CwaJ6NV8oJU=;
 b=eJSHfyXdR3e7XMPltCdX6xzC4pAn/Uu6FQi4yng3KFAqScUy5HO2IvJJWhXE/8N1wh
 uxnba+aoNIcB3rVUhVB7O6Mwh95UqmoY+LYyQylK4JSAxMC06eh8x7n6jnegu2Ik2/ub
 u8jlI1lWVUr1bcOEv2XEzZ/wE2it+ZN7ZHM6wpSInVxhGmwqXdxwz65XPtRwWc3fnd1f
 re15lcADU8QGkLZnQmHK+mc+VSI6zOwcq2dBR17HGr5XUlvrKOrFnlFUEisYw6eXy0DH
 DDOd1XrWTNvscEEp975OjN18lOTDfpxRDIh65qiMOieZJNBV6bAArMfV3XxQGfCPindL
 IcZw==
X-Gm-Message-State: AOAM532fp/cnjoi5gGHqJ9Py2Kf1TaN7m/I19eb0xZGR4NUdDlYHezhL
 oCFtRCxRv95tEZCXwmItbQKuFeAqyyar282a+yGAWg==
X-Google-Smtp-Source: ABdhPJwa4O/kxcHuIaGsWfa5BpxNd8kM+H5C8807AuzvGT15YgJYKopTZbpwoHcC/BC7LJ4qhB6BBsiQ7ubweJ8z9RA=
X-Received: by 2002:a7b:c389:: with SMTP id s9mr31740198wmj.133.1636126944181; 
 Fri, 05 Nov 2021 08:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <SJ0PR09MB6032CFAA829AA63AF31947048F8E9@SJ0PR09MB6032.namprd09.prod.outlook.com>
In-Reply-To: <SJ0PR09MB6032CFAA829AA63AF31947048F8E9@SJ0PR09MB6032.namprd09.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Nov 2021 15:42:12 +0000
Message-ID: <CAFEAcA9s_4URTMKog9GyzHU2KuAN1L=d9LLWOLv4R4V=9OSTNg@mail.gmail.com>
Subject: Re: Pre-built binaries
To: "House, Michael" <michael.house@dese.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Nov 2021 at 15:24, House, Michael via <qemu-devel@nongnu.org> wro=
te:
> I=E2=80=99ve been working with QEMU a bit and I haven=E2=80=99t been able=
 to find
> pre-built binaries for different platforms. Does Xilinx maintain
> releases, or should I build it from source for my platform?

Hi! This is the mailing list for the upstream QEMU project. As you've
found, we don't distribute pre-built binaries, only source code.
Our users either build source themselves, or else they use prebuilt
binaries provided by third parties such as Linux distributions.

Xilinx have a fork of QEMU with some extra features. I don't know if
they provide binaries of their version -- you'd need to ask them
directly.

thanks
-- PMM

