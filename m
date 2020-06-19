Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C42F20071C
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 12:45:19 +0200 (CEST)
Received: from localhost ([::1]:51422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmEWM-0005TE-4e
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 06:45:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmEVA-0004dt-MA
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 06:44:04 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:41514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmEV8-0001br-Om
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 06:44:04 -0400
Received: by mail-ot1-x32f.google.com with SMTP id k15so6923401otp.8
 for <qemu-devel@nongnu.org>; Fri, 19 Jun 2020 03:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J/evnrWg3IeTDWY/D23DOwlpV3zddDpvX5N6ONh88JY=;
 b=ZcGGHMVGOzvFDgcXNPInnHG//0ZKDo/+8o5ziWYWK9bjPIbRVHMlQaE9LQmAAY0ciT
 MUBUfOfnCX7Qpsbf0tnS95eFzDC+RrkwF6cQ00Br1Dsubo1I4wIq6EugaRbgdSixIXHZ
 ISHciNyUwlr78Zr/yA1z4htORO2MHzONGDGN3yL17gyXcJ0NzAaEVf1+VoG9FggeBIgq
 G5KQUXGYnB8EFw6BC/VfaimvIK8I1hTSjnsh51l8Y6t9oKdH7uVecTIIb+mO9N3qYG6D
 OjvOK6xXFU8lXg3n30CTQCwmxJTe90SavyRWlJmkvH2T/RYCiZX38p0f712UwIvcwB0p
 lt3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J/evnrWg3IeTDWY/D23DOwlpV3zddDpvX5N6ONh88JY=;
 b=XzEaKbunLgEpPgQTHtiGLySFauz5NIbaEE8v2P5TC4si7iz6pPTa08a+B8iIihejcm
 p6CiFXE3omxzgQZpt6Io2k6nBtxR+FC0VSWpfakQs90gioAF4gM6d/tw/ZL/VkKFph//
 aDlONxBQr1FiL5Vwrqudj0FU0U4T5UfAwLnj8+V9lx7979fY1CpJXA/o+68ohlZ4h0E4
 LHw2xYCe+XNHocijNeoyK03C/iR7BouqhWZ6T3cWf+b6OjrOeiEWStDRZfz9lAojrn5T
 Usguq0o0lL7UfyqVt7cmP28UQvbJZpb0beQqqrK7BNV+ihNg8HVX01lFof8cZliro9PE
 rA0A==
X-Gm-Message-State: AOAM533kX+rY8HNQzHTIER4avsF0d1U1pYYIbNQ5OgcXIGrFSsO32rwj
 0iSm2NDxThR9qz8AWiNl+oSTLexlwbY9VQlPBLrEtg==
X-Google-Smtp-Source: ABdhPJydV9YmV7PnbfQOOvXAVWCFr+PutDtwpJeXMbOKS429H/TpYiaxF7JA67U3BFKqKGDGttzhEE7WDHIgZQAz7s8=
X-Received: by 2002:a05:6830:8d:: with SMTP id
 a13mr2426540oto.91.1592563441309; 
 Fri, 19 Jun 2020 03:44:01 -0700 (PDT)
MIME-Version: 1.0
References: <1592486508-6135-1-git-send-email-jasowang@redhat.com>
In-Reply-To: <1592486508-6135-1-git-send-email-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2020 11:43:50 +0100
Message-ID: <CAFEAcA9QRqUdZqdQNhwMyHyfBXscQ8cBZ=Jut7Y+-f-FKS-iRw@mail.gmail.com>
Subject: Re: [PULL V2 00/33] Net patches
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x32f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Jun 2020 at 14:21, Jason Wang <jasowang@redhat.com> wrote:
>
> The following changes since commit 3f429a3400822141651486193d6af625eeab05a5:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/microvm-20200617-pull-request' into staging (2020-06-18 11:23:15 +0100)
>
> are available in the git repository at:
>
>   https://github.com/jasowang/qemu.git tags/net-pull-request
>
> for you to fetch changes up to 71830d8430e65dd20aec4765d87e60336148e1a6:
>
>   net: Drop the NetLegacy structure, always use Netdev instead (2020-06-18 21:05:52 +0800)
>
> ----------------------------------------------------------------
>
> Changes from V1:
> - Fix build failure for virtio-net


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

-- PMM

