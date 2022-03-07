Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EE44D0745
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 20:08:44 +0100 (CET)
Received: from localhost ([::1]:54370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRIip-0002h7-DF
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 14:08:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRIhi-0001Hd-9w
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 14:07:34 -0500
Received: from [2607:f8b0:4864:20::b29] (port=44779
 helo=mail-yb1-xb29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRIhg-0004Y1-J3
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 14:07:33 -0500
Received: by mail-yb1-xb29.google.com with SMTP id u61so32970001ybi.11
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 11:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cl5rC3fJu27qrD7YIXJOM/SX0TXoVrEWo0Jk1NsivsI=;
 b=p/bqqKQ8jHulMAgnLCXAmC4HFUSOarw4ZlfHVsAPW57LjjgG3Cc3EOjoBX3QQkiZ3C
 6x4W4TQog4Bk4QyfgreLgfBLJYNDLbkm/i7W0tw/tn665Wf0LQRwGPM/bkHeL+IIIzLX
 XiZOIfEWYzyB2eEEton2dAz03FX3pxBTFCb2Z02KdPvx1tg+7ZAeg3DvRpcG1Q4kLAGL
 u8hUBa3Za/ZBhzRE4pplM4OyDPl2TNSYXuBIz6fF0DICezwAnNgtc5yYyYlVjc+gUx8K
 DSK0xc/bbfXLoHJEiOjjK+RKPmEeqcNHGHcErlP5KWNv1z7Um2SpiV63gP+/1M6wbDIX
 5LwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cl5rC3fJu27qrD7YIXJOM/SX0TXoVrEWo0Jk1NsivsI=;
 b=0C9VW5ejp9PD46mXzBpfcfFzsbNVihadles16ELiSiDYCo8M7YNBr6TNZV16SfMh2y
 svCuvoeAEkBOozpj75m8Udl/3Cf3kyDS1FyiIBvdkHk7q/zX5/6x1jzwpfq8WADzKh9t
 PBPZ2+jcslbd9KahMz0IV0MMObD4wiUjWoK2tHGuxjjSU3Ukx16ZV9G/TGiy66A3h28z
 g8bZ+gppLLhkDS03lud6Yn2+YjwWNB2zKg2VSTnNmbziRV3Qpe97lxCuDVMy5MIbZYgE
 mE2r5C50QVo20Z+HKkXdANd7h51DAhEeo5/+/LgVq69tR89zOSaSPfkKF++Zo5hFVT74
 /kWA==
X-Gm-Message-State: AOAM532Rk1PYaSkZ32SbQ9nJDpe/0HVH/hcynA/X5rFDczrq3xD4Lmjx
 5RW5QTbvu7BrUCpw4OxQVc+rt1r/rSwHq0SADXaEgg==
X-Google-Smtp-Source: ABdhPJwn5CI2CQI7rXGSTHmvDIggkMTn0fajk4BdvFih3aJHrGrWZTY5CkFm31gZwIBd/tY7zCblM/6DBSE45X/xTdc=
X-Received: by 2002:a05:6902:83:b0:61a:709b:d841 with SMTP id
 h3-20020a056902008300b0061a709bd841mr9021761ybs.140.1646680051398; Mon, 07
 Mar 2022 11:07:31 -0800 (PST)
MIME-Version: 1.0
References: <20220307103549.808809-1-hreitz@redhat.com>
In-Reply-To: <20220307103549.808809-1-hreitz@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Mar 2022 19:07:20 +0000
Message-ID: <CAFEAcA_vDeyVCsziHg9rLEgF8jZnKU1KEACWqoAHD4ZTXsOJpw@mail.gmail.com>
Subject: Re: [PULL 00/23] Block patches
To: Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Mar 2022 at 10:35, Hanna Reitz <hreitz@redhat.com> wrote:
>
> The following changes since commit 9d662a6b22a0838a85c5432385f35db2488a33a5:
>
>   Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220305' into staging (2022-03-05 18:03:15 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/hreitz/qemu.git tags/pull-block-2022-03-07
>
> for you to fetch changes up to 743da0b401cdc3ee94bc519975e339a3cdbe0ad1:
>
>   iotests/image-fleecing: test push backup with fleecing (2022-03-07 09:33:31 +0100)
>
> ----------------------------------------------------------------
> Block patches for 7.0-rc0:
> - New fleecing backup scheme
> - iotest fixes
> - Fixes for the curl block driver
> - Fix for the preallocate block driver
> - IDE fix for zero-length TRIM requests
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

