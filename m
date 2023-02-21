Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D4369E4AD
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 17:31:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUVXa-0001y6-BD; Tue, 21 Feb 2023 11:30:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUVXS-0001vJ-QP
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 11:30:46 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUVXQ-0004MB-JX
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 11:30:45 -0500
Received: by mail-pj1-x102d.google.com with SMTP id pt11so6235577pjb.1
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 08:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ou+zKNcsD0BAScBtOLJsd4lCFKkGnhO/yPO5wXiD6YI=;
 b=EgqF/vJ2mCxMeieiQS09UgaDC4LxILaJwTTXHaU2ixm6V288JKFWPclCPpNhCAfV3Z
 PHUkxzZsBU3zrwuYm5DkBvIjBce1mlO0Imv5xTx5byDFwlGboSCEwRmo7CdXbxyOBXl3
 bol4p0d43fYh/gdMzvvYP6SvJeuTqcNVu7HjXCc75e0Xb3HyNw+hgWCQANdQHO6jRhQB
 GWDf+iIDIdrGLdFWyq2qeqX+LGOlMffwOTh6bL9qloHOGaOU7z1kWH6vbX+Qh3f4z031
 zAsXx5g/aUXlCN711pUhTy3IINoCdrEWFwT0Ndmbw2qnePTTkbk4lODfUgA85EWcl7hN
 rwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ou+zKNcsD0BAScBtOLJsd4lCFKkGnhO/yPO5wXiD6YI=;
 b=fKVrko3QGI+lUse80LOAohKQJRNkZGlV8ovxlcpJuxTRnbgwDrZ2j9sjqWf0+z/WcN
 Rv8B9pCIyFX30tzpuR+X8IUF0exMxsSFwE0BGlEhGxNRvqU4AGGJP25eQgdWa7Ddd4+Q
 GARsRWmIWKuh+aR1fknrrcC8ybeh51S3mttvk3ris688igg1iO6OJALKJZtJaTdk6yVe
 2/qq6/7X7+ndM6T93gM3a/PiyZZAtqKIYui0cFriXPY7czSRFF+Xu0K2kXVLsl1SQLIq
 1WUzGatvOKmQ5zydyTLQwpogqaSgVv0FxQhuDmtCNzOvFxQZ9XVc9fNUYTLPtgoJQMLX
 vAiw==
X-Gm-Message-State: AO0yUKVDIg+/2ox3zkh6rHLnrSWHKamXKUcIx7/lPh9TNadQAvFToR2+
 5mayirIyx8UWo6DNZMVgxSdMU16nST7kFVLiBoE0nA==
X-Google-Smtp-Source: AK7set+WGx+TN5ifXvMigWQuWjEMtjU90SiKe3R2OLSwCrDGAo9KeAAOFnqpuwm3M0DwDZB+timvQamTMQQgi5HKItY=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr1882654pjb.92.1676997043004; Tue, 21
 Feb 2023 08:30:43 -0800 (PST)
MIME-Version: 1.0
References: <20230213003925.40158-1-gshan@redhat.com>
 <20230213003925.40158-2-gshan@redhat.com>
In-Reply-To: <20230213003925.40158-2-gshan@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2023 16:30:31 +0000
Message-ID: <CAFEAcA9OvObRT731oaF7kOo8z32nH+egXfDcOpw1nHormHsp9A@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] linux-headers: Update for dirty ring
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com, 
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mst@redhat.com, 
 cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com, maz@kernel.org, 
 zhenyzha@redhat.com, shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 13 Feb 2023 at 00:39, Gavin Shan <gshan@redhat.com> wrote:
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  linux-headers/asm-arm64/kvm.h | 1 +
>  linux-headers/linux/kvm.h     | 2 ++
>  2 files changed, 3 insertions(+)

For this to be a non-RFC patch, this needs to be a proper
sync of the headers against an upstream kernel tree.
(By-hand tweaks are fine for purposes of working on
and getting patchsets reviewed.)

thanks
-- PMM

