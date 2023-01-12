Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A256679EB
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 16:53:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFzj7-0002n3-Bt; Thu, 12 Jan 2023 10:42:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFzj5-0002mQ-0Y
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 10:42:47 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFzj3-0007BY-4f
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 10:42:46 -0500
Received: by mail-pj1-x102e.google.com with SMTP id bj3so16304707pjb.0
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 07:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Z8gVHU1VU2NPtxdKFLTnkhHGb0S9sUHXyh+zwwHsUtQ=;
 b=h92WB5Sr8GLeWNb5okkttLIUMowSStgTXUbgSBNbwyn/59jeBe1WB3nVkDRC8e1yAT
 w9UcB5gdttn/N+1mZ4j0chT86xzfCRsGP6Gz+K+c2+0VLGIKr/2Ya5Vzkw6d0W1xZXQC
 kJ/o12osyrI/PG1NTHp78MGbk0gQnKkPiZRYYg+n5zTtPxaFKT83cprBRsp7fc2GH1aw
 0DZCQC06TGngY2JpJYaJ/NWtJhzIEe84KomiA8NJ6ggyiuqyS5D1gKcZ/aHSOzny7WzC
 2+dCiumUVXw93h8TGxqMAhz1TAGTAyg2aMTwqCZCqDRUviVnTbblCDFaofAFr7RNItUD
 gBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z8gVHU1VU2NPtxdKFLTnkhHGb0S9sUHXyh+zwwHsUtQ=;
 b=K2g6xBbkr3jJbqKwgUDPyNYmaF7Iy1HHHQaFRclrX6N9m7nSyJZ+Ph4ym5EI9irhHs
 ifWr7lbw77PxEtJAt0P+FBqyXfonXPt8nXjLzsgtnZSFWoBj8muBsAaAJQpO/K5xU1MS
 SdpewCShmeBojgMU0venYgmv0oa28uV05FKDRb4AMUTgarSZEydc17sQjlaNsaF6qBB/
 qdPR1oE6Gg1PhGGXCTAyPxzVghJ9zldRtM+NZFE3RXOCYQoFxVLubpYM6IMSBGlRkfm7
 9tWhMjIDL97UmsvNYJE+UzzBIZn+tJWdpbT8fbVrW9M4zfQNrxLIO7zXIakz3JNXGtwO
 gEaw==
X-Gm-Message-State: AFqh2kp3UR8fbxA+NnZC/yR3Ejk1J0nzbVmDwK6UUtnOndHGcwZlLCFE
 5dELn2eATfg7Xg0PD7smrF9i4BFnL8l9DyPGUMG8eg==
X-Google-Smtp-Source: AMrXdXt2T7WE51DJty1AsZlbDtCHFFGvPgrilSSPV1AYf6gC+e8PuZ0gx9IS4xchtdzIJaUGXZchWg95TVhN7QDDFrI=
X-Received: by 2002:a17:903:28d:b0:194:6083:fd50 with SMTP id
 j13-20020a170903028d00b001946083fd50mr200261plr.19.1673538163491; Thu, 12 Jan
 2023 07:42:43 -0800 (PST)
MIME-Version: 1.0
References: <20230112134350.469317-1-pbonzini@redhat.com>
In-Reply-To: <20230112134350.469317-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jan 2023 15:42:32 +0000
Message-ID: <CAFEAcA_jHwM8w19XoB2S_-j5hw49gHd1LFyDvq3qC9Bf=hk8yw@mail.gmail.com>
Subject: Re: [PULL v2 00/29] Misc patches for 2023-01-10
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102e.google.com
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

On Thu, 12 Jan 2023 at 13:45, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit aa96ab7c9df59c615ca82b49c9062819e0a1c287:
>
>   Merge tag 'pull-request-2023-01-09' of https://gitlab.com/thuth/qemu into staging (2023-01-09 15:54:31 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 75cc286485742feeb00f4b446f5682765792323e:
>
>   configure: remove backwards-compatibility code (2023-01-11 10:44:35 +0100)
>
> ----------------------------------------------------------------
> * Atomic memslot updates for KVM (Emanuele, David)
> * libvhost-user/libvduse warnings fixes (Marcel)
> * i386 TCG fixes (Joe, myself)
> * Remove compilation errors when -Werror=maybe-uninitialized (Eric)
> * fix GLIB_VERSION for cross-compilation (Paolo)
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

