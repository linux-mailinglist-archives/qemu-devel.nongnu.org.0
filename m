Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D113EEF6C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 17:50:20 +0200 (CEST)
Received: from localhost ([::1]:48148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG1M1-0002iS-U5
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 11:50:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mG1LE-0001xo-Hs
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 11:49:28 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:45616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mG1LC-0007qt-OX
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 11:49:28 -0400
Received: by mail-ej1-x636.google.com with SMTP id qk33so39471376ejc.12
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 08:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Iw4E/4AftIJSO2nIca1nB0F4OKLlsJgasvYkx3b/ND4=;
 b=Blo5ETGhqVrcNPa4FPZycuqBCidoD0eCkiNtVZy7FVI8s8R8S+bja43WbX+RQAKaox
 EqGUQrdNC8l1wPTHKRGNFEYMH/lRTux4tSSJlJ7IaF2vmFYsoOBBNhhBA3IZkNCbbFrC
 YdnUDnIcxMzTS7hQ+fKabJnMjlbQU5teJciWjXgZspMnP3b9PEZ/HLu5ADATf6bbbfHP
 N3ukQA9YOiOt8Th63QdNSqWX5hhkIVQ0F0wW4I0TgGc7m6xXbwlkd6LNVA5On/1uTWpr
 vVDyMd4eKztUygdqMVElWK0wX0ihKQtRtvWCbp1QDZE8r0Lg4dTaX3ZviG8HTUy4kSUK
 K8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Iw4E/4AftIJSO2nIca1nB0F4OKLlsJgasvYkx3b/ND4=;
 b=ZfgqeYYKOZuFiSjjeV6tyotM+hZYRbc9iRb/uueCjviZIiywpboBxQZXseyOGH5gyI
 jJKn6xCxCadtdHOsyB4pvdj72dQrwOYw3NysaTN21sGFdUdQI6wIphVijXiMC8MdRQ5L
 ACzt03VKvzbph0mmogisFCE/ab0EiSVLOQ5rC46+zIOgDbI0gD++k8GwQ2KFPKbsz7sA
 HdoHxGBTMstAZjE4dPaqfs8EsgUhkz84lJ3kZ7NK87qDqaJLAN1SR6cNamQILYGQhLxa
 clBdAVBPpjJfiL2zjUHbNH9xQ6GqOpSjPQQF1BFX0dFo+DhQq7LWUuly+/R/UpYu4O50
 tc9A==
X-Gm-Message-State: AOAM532hpM04n0I+/sSnQ27VuGEZ6Qer9CDHQZ+2mLZSI02IshWGcjZQ
 ZBgpAjWsdmB6vhYIu0OTxEreai2Gu/fQslhFk1fkUA==
X-Google-Smtp-Source: ABdhPJz0U0qGn9XsLBCYj/PTutnwu679s6WymH2lmprklZ/fqQj9859Nnz1m2WmPxJGo+OGADGkoOuZQJ4pIte9nWj8=
X-Received: by 2002:a17:906:aac7:: with SMTP id
 kt7mr4769959ejb.4.1629215364991; 
 Tue, 17 Aug 2021 08:49:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210817125356.9461-1-drjones@redhat.com>
In-Reply-To: <20210817125356.9461-1-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Aug 2021 16:48:39 +0100
Message-ID: <CAFEAcA8fr1xMLXCEMsXMo8Uoqnx16KdmPKa0g7Z=zsPOf6e0=Q@mail.gmail.com>
Subject: Re: [PATCH] qapi/machine.json: Remove zero value reference from
 SMPConfiguration documentation
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Yanan Wang <wangyanan55@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 Aug 2021 at 13:56, Andrew Jones <drjones@redhat.com> wrote:
>
> Commit 1e63fe685804 ("machine: pass QAPI struct to mc->smp_parse")
> introduced documentation stating that a zero input value for an SMP
> parameter indicates that its value should be automatically configured.
> This is indeed how things work today, but we'd like to change that.
> Avoid documenting behaviors we want to leave undefined for the time
> being, giving us freedom to change it later.
>
> Fixes: 1e63fe685804 ("machine: pass QAPI struct to mc->smp_parse")
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  qapi/machine.json | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

