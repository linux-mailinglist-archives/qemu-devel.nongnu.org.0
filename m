Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6290539B9EE
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 15:34:23 +0200 (CEST)
Received: from localhost ([::1]:45172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp9xu-0002Dl-Fe
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 09:34:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lp9wz-0001Zb-Ra
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 09:33:25 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:34608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lp9ww-0005nZ-PQ
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 09:33:25 -0400
Received: by mail-ej1-x62b.google.com with SMTP id g8so14579831ejx.1
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 06:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pxl86Hm7EmMSHUy+GitYRgWKiG2eUMZqev0TomRsQq4=;
 b=IJqLs/qz2Xe622bcCtoz+Zm4fOyNuYKmp8GCsc9jZ3D4H72OfG6O998ZBWnJGpJGD7
 wY3aJXpwqLRXHLwQ/ph3c9tmvdDLJlqPObpO4nbXb/i98sZvfxGcV0pQeSfM9zhmowMg
 QPNl8P7vCoiY1JQ/LKRkj5zZxk/BDWn72w0l6hc5zdRKPlMhBSZER3QGrPUVGBN+P0Ro
 ChVZ8pYaMEBGqNtf0fx27lqrgp9SuKGAklIGJwEY3WobqdFzGdg/ZFY8zi3yrq6oQOMg
 Noala6acouml/gkUzBJe+n9Zq/m3RMRydpIt28M8tFG9rSKf70V59FOBaCPlubBvJK85
 C6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pxl86Hm7EmMSHUy+GitYRgWKiG2eUMZqev0TomRsQq4=;
 b=Uzv7jQ2jTV7g5P4xXchHODuylGEQEZP24EnHfZyUagPBXKxZqCIFW1t0BvtfnV2VSd
 wFv0fEs3y4blgEedZAGh0NXJi1eTO2evhPe5FXFkeI21cVtaNvzKlo1+r/O1w+0KfgfI
 yuLb9V4bU0eUplpREbD83+y+HrcprJDagrtAQsC0S4LrSd0ug34VANFncI8njUqmQIPC
 7J8zFECVli3zxzMIheRoh/h57FHgSQexCMb3+IKEEb4idXMzqz3vEQAxb3Rqq+cac4WE
 zoD9gq0LNh2zCyEz0bOYWTp3SsMQEI4WEM68PhHL/OaN7Y1Alc6ef1+1Nm8/Zdfuuk2z
 Rb/w==
X-Gm-Message-State: AOAM533sI6cxP84+kL2C2C0Wk1ni7Eu38sMz+gr14XwN/AqvyDCIFbr6
 9ANixG/kTR0S/hP4eMSfP6lkL7tpA0/ri7y8aWUO4A==
X-Google-Smtp-Source: ABdhPJyzSD7gFhhQZo4S/PS580uxOjtLt9wqmVHENv+A/05pqVER8LLmJPL6M/N+3emeVCFMEw5hgMGjIm+krdJ4F5k=
X-Received: by 2002:a17:906:b294:: with SMTP id
 q20mr4120262ejz.382.1622813600059; 
 Fri, 04 Jun 2021 06:33:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210604120915.286195-1-pbonzini@redhat.com>
 <155dcb87-c6ab-de58-e2cd-c6bfb478c56b@amsat.org>
 <YLonThBK4yhIEgfL@redhat.com>
In-Reply-To: <YLonThBK4yhIEgfL@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Jun 2021 14:32:46 +0100
Message-ID: <CAFEAcA-dhCg0VTLJH11ZUO=-aQwtufvMyXqqrkyJY-isCzxFsw@mail.gmail.com>
Subject: Re: [PATCH] vnc: avoid deprecation warnings for SASL on OS X
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Jun 2021 at 14:15, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote
> VNC/SASL isn't going anywhere. It is fully supported on Linux and a
> critically important security feature.
>
> If macOS removes SASL, that sucks for macOS users, but then in that case =
I
> assume HomeBrew/MacPorts would bring it back to life, because SASL is an
> important feature for many apps.

Also, Apple marked these things deprecated 5 years ago and haven't
dropped them yet, so they're clearly not in a particular hurry...
(they probably mostly wanted to nudge mac-native apps onto whatever
their own-brand API for this is, would be my guess).

thanks
-- PMM

