Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4BC37C257
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 17:08:33 +0200 (CEST)
Received: from localhost ([::1]:45852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgqTP-0001nX-TT
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 11:08:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgqRu-0000ig-KG
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:07:02 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:46664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgqRs-0001sW-It
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:06:58 -0400
Received: by mail-ej1-x633.google.com with SMTP id u21so35446098ejo.13
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 08:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bPFP8iDzUVh7aMKMB9e25ZhsOlkwzBvIbs627JUqP+M=;
 b=DQBxMlqg4KIRnn06rMx3A3Tfnf8HWy+mNlimUiAP++UTttv6XRZRjvXBXaeg/s3eVt
 nLaLsXEOSI0NB8tivSw4XkmiITIZdLeMeJV+lCSjQJXaVmFzLVnlaR17JC7IxKYR85RI
 CCLJ4H3bawoGWErB9/QAo6efg3ESNY03D1LQ+Cz7A2WJdFxLrp3tLk9ejIOycQHt+Hrf
 8l5O9AgikmBlpA/zOR/UxwcxWRk9T9Y15kntkmS7HEK1wUxWWf/rF53ENQEbXGXemkOH
 wiTwM7WE8qgMMlpFkOAPsn+sFDJfX4B8cbzngqJWJ/G3jkd7gpAOlz8oIkN7L6AFqe7+
 gKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bPFP8iDzUVh7aMKMB9e25ZhsOlkwzBvIbs627JUqP+M=;
 b=eFgEO17QEj75pegXVgCNszm5j3lMvWBXDO8kLExI8p4siSBtpqXYtNNTVxG4BEvFqX
 U4yl2BBXfp8kDOaoLDJaZJWGoeN9OD3tf3xQRiYBKhpHQh5Ueg2Soh6aiv0naHTuXzrU
 4kZR3nMiZPKOCzs6OwK9kF3vz1ip3leofqfcnkHD4MJw1WyHss1JO6CvRA/Uq+O1308l
 sTV2D0C0LhqBU2JeGUMbfirkDp665bGLxNoMeHUeLlH9+QTD6LENvHSiQSjTqBbM0lJY
 Md0XOGqPxJk+VU96JLFVGDEdry9E1NHthem5VLj/vWSXaW1VXIujA2oJ+58k6Y6BLSX1
 2QvQ==
X-Gm-Message-State: AOAM532lryV/AotDaNPcBOdzw6Yws5IyCBEnDKjtKgWS7hLMDl6QIxNJ
 gR28HzdEc88tKSRtUf8wUdqq9RTW7fHdM5za4BH63A==
X-Google-Smtp-Source: ABdhPJxjdwqg8lr9By/May2taGIibhIumpIhCzRXza+3zM+ib/y7AFz1olcyoCiKRPFZ0U2LHv92k+Tr6zlE0nZZZUE=
X-Received: by 2002:a17:906:980a:: with SMTP id
 lm10mr8748879ejb.482.1620832014737; 
 Wed, 12 May 2021 08:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210510132051.2208563-1-kraxel@redhat.com>
In-Reply-To: <20210510132051.2208563-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 May 2021 16:05:41 +0100
Message-ID: <CAFEAcA_g3o3The6RsSF2Lczd2PaDVzQnjgyzA8ePh7n_AzZvUA@mail.gmail.com>
Subject: Re: [PULL 00/25] Vga 20210510 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
 QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 10 May 2021 at 14:22, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit d90f154867ec0ec22fd719164b88716e8fd48672:
>
>   Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.1-20210504' into staging (2021-05-05 20:29:14 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/vga-20210510-pull-request
>
> for you to fetch changes up to b36eb8860f8f4a9c6f131c3fd380116a3017e022:
>
>   virtio-gpu: add virtio-vga-gl (2021-05-10 13:55:28 +0200)
>
> ----------------------------------------------------------------
> edid: display id support (for 5k+), bugfixes.
> virtio-gpu: iommu fix, device split.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

