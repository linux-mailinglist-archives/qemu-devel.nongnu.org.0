Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 732436B4535
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 15:32:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1padmL-0001l8-39; Fri, 10 Mar 2023 09:31:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1padmG-0001iy-Sk
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 09:31:26 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1padmF-0000C3-4R
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 09:31:24 -0500
Received: by mail-pg1-x535.google.com with SMTP id q23so3146096pgt.7
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 06:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678458682;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SLLAjgUbYOAubaI92v7ALZkUlecOKp7Dj0KfhZId94Q=;
 b=hVpaZIALvugitkH+G/k+sLKgb4VT3TlWQyEH6GxNKEJFpxSn3rkiHhnqOghwrA5FNi
 KsfYW9tzDyttVtkiaf++K9XvAITMjMp0RaOuhHq+rEWD3p5IZLnb54uEme+Q4fDwsYEw
 aaofKc51VNLZiF2uTSgNMB+BBzXKhW5aJ5OMJKFyX6dsUBbjuyz4xpOVFQ4gBmzf39cD
 10k515MbbI/64RULI1w+efZaShe9XF0Bf8jcHfTd9MTx/oDs4ufk5c/CVEA16MJ7PaaD
 d+9639aGAWCe7GTAQTMiktdhpthz6TRUnauARph8M2XV2X7dRkr+113ZQEeSqxzxci6i
 dIVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678458682;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SLLAjgUbYOAubaI92v7ALZkUlecOKp7Dj0KfhZId94Q=;
 b=6t8iSVPITlQgKNluK5osiwhq1Cn2uD68OXGMO4QS74cZX3CpruzfNf9oIFa6DZ4lOl
 ouciLkB4Fb9ekFUclwEwv0Jf9IFfcoGeGmY1ZpHF1nAEzEi8al52nyVHXXSkc+JQlmB6
 FZCVCgM9tXyl2/QcQpxf6SHKFyC3OaTU5356Smg19Yutf3LaRfE4hcM9PFI3TL2/4ATl
 R87A0LhWnXy7JZhKnraZ+7dstHwMiHX6+vR6RKeJ0iRqOmeXVN/oxemy234pIcFp1fhq
 qWiFu/HJB/aQWk4CxJyPBfBoEJLBzPocGB43p2fp5pQqcEDaRT0lU1tXP7eBswHc7xce
 CNuA==
X-Gm-Message-State: AO0yUKVXqqu2Gy+FZbaYA2+GlTmDSnirN+l56VhUKYnqjbmO/lAfauXr
 LvCMlJwSzhNwSOtMnQsSxkAyUatk4F9wK/YCWHku+w==
X-Google-Smtp-Source: AK7set9Dxr5K+1FQLq+3bRCx6IBITH7aoR2u2sGbwL1iSdto5Sq29oqU3ATFOO35RGCWAtVjf0gGlx/sV26Z/jPFoXg=
X-Received: by 2002:a62:8348:0:b0:5ef:95c9:6a88 with SMTP id
 h69-20020a628348000000b005ef95c96a88mr10550078pfe.5.1678458681702; Fri, 10
 Mar 2023 06:31:21 -0800 (PST)
MIME-Version: 1.0
References: <20230307053438.2416629-1-tsimpson@quicinc.com>
In-Reply-To: <20230307053438.2416629-1-tsimpson@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Mar 2023 14:31:10 +0000
Message-ID: <CAFEAcA-ZkA_bQRdBOvr+9TOYDmV3CaQ4HUrmLnV9T3m2reKD+g@mail.gmail.com>
Subject: Re: [PULL 00/17] Hexagon (target/hexagon) updates
To: Taylor Simpson <tsimpson@quicinc.com>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, philmd@linaro.org, 
 bcain@quicinc.com, quic_mathbern@quicinc.com, stefanha@redhat.com, ale@rev.ng, 
 anjo@rev.ng
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x535.google.com
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

On Tue, 7 Mar 2023 at 05:34, Taylor Simpson <tsimpson@quicinc.com> wrote:
>
> The following changes since commit f003dd8d81f7d88f4b1f8802309eaa76f6eb223a:
>
>   Merge tag 'pull-tcg-20230305' of https://gitlab.com/rth7680/qemu into staging (2023-03-06 10:20:04 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/quic/qemu tags/pull-hex-20230306
>
> for you to fetch changes up to c2b33d0be998bf539953f1dad0aa0d1cc8d9d069:
>
>   Hexagon (target/hexagon) Improve code gen for predicated HVX instructions (2023-03-06 20:47:12 -0800)
>
> ----------------------------------------------------------------
> Hexagon (target/hexagon) updates
>
> ----------------------------------------------------------------



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

