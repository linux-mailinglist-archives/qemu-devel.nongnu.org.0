Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8B930C9BB
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 19:27:36 +0100 (CET)
Received: from localhost ([::1]:60192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l70Ol-0007kp-II
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 13:27:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6zw1-00083v-PK
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:57:53 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:35057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6zvx-0003Bw-FH
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:57:53 -0500
Received: by mail-ej1-x62e.google.com with SMTP id a9so12969624ejr.2
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 09:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QH8MelJmbJex1cSJPOldYXUQwa89eGaqJciyUaFWMWM=;
 b=dP0M6aVHYY/sEj4ujAFyW8+ajwFWNbePhrnm4uxNc9GnRHRdmkrFcwrK1uJFFJDY6S
 SVGsADl0OUKUF5rL8vRaBWPBHKQFD9NNxk/VI2KiU9qz2guJPRC0LmF5rKVQ8onNTuus
 fyQN4DqXU8QipqSk7kHOc61PM4L7nFg5dF60mfem1hcPS8dTfu1Pu6RnjmUXI3rW9Ltf
 WpHCVFXjRRAI8Qw+Pvop9bXlthvmBklAvH/YGGH21LNJMli8Kn93TAvxJeC+ctnSSPsD
 75L8xX+qs0jW8O7uBug3Bd0xib74+a9xPtg0UI5LemNG58ZnnXKHnBJ8GTWQ0byt+YSM
 SVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QH8MelJmbJex1cSJPOldYXUQwa89eGaqJciyUaFWMWM=;
 b=JVt5Aeki/ABP0v4D8Nh/H6N7rWHkGwP20fCXD+ZCuiDsaCRCqeIKiIB63uHeBVwSvx
 m/33ps73zJeLIfDR1kgsOyNuEcGVSYIPBF+M7HDLIrnMDb4ToSjoy/HO1XsbNoRq1CYk
 5y1xyDv3dSLs6ugY1HG2Nv4LJ0VUM0ba/8s80DYj4DKa2/o0mUZnKub+pzIRIsl5bCGQ
 TwdhMkc+VotCB692SZyJwObW+HQPRB++Ix2nnh3BPuDKab1g71TvKhi2zy+UEy8jpi88
 5CABNEVxJvGPUwY0K8a+iHbr8QyqHUYVNXADyxbBHBlP8G0wHZfNUpXFos3l0sMyp48i
 kL/w==
X-Gm-Message-State: AOAM533gaPYO+zhgQhh/k4iWpptFuwNDXFa0bZAmzoMP09F2UnCqOA+H
 QUq+rtu0hm4/n+jXFu+/nT+H4pB9LihgURqG2SLiWQ==
X-Google-Smtp-Source: ABdhPJzAQZDjROms7Lnmot6rUd1V15BHmBOCHRrcM+CS67QwWK1jpyzk9j/vIZtyymEzO9ltdK3NHXjJ6GB3iM4T7Hw=
X-Received: by 2002:a17:906:1d51:: with SMTP id
 o17mr2926983ejh.85.1612288667439; 
 Tue, 02 Feb 2021 09:57:47 -0800 (PST)
MIME-Version: 1.0
References: <20210202162834.269789-1-kwolf@redhat.com>
In-Reply-To: <20210202162834.269789-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 17:57:36 +0000
Message-ID: <CAFEAcA8uFez0XQGCkhHZEVE1NuH--NBG-uYM6=sqmhiXYWJZCQ@mail.gmail.com>
Subject: Re: [PULL v2 00/10] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2 Feb 2021 at 16:28, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit cf7ca7d5b9faca13f1f8e3ea92cfb2f741eb0c0e:
>
>   Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/tracing-pull-request' into staging (2021-02-01 16:28:00 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to 26513a01741f51650f5dd716681995359794ba6f:
>
>   block: Fix VM size column width in bdrv_snapshot_dump() (2021-02-02 17:23:55 +0100)
>
> ----------------------------------------------------------------
> Block layer patches:
>
> - Fix double processing of nodes in bdrv_set_aio_context()
> - Fix potential hang in block export shutdown
> - block/nvme: Minor tracing improvements
> - iotests: Some more fixups for the 'check' rewrite
> - MAINTAINERS: Add Vladimir as co-maintainer for Block Jobs

Yep, this has fixed the issues with the NetBSD VM setup.

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

