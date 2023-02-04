Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7602068AAB7
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 15:58:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOJz6-0005Ts-Cp; Sat, 04 Feb 2023 09:57:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pOJz4-0005Tj-2J
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 09:57:42 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pOJz1-0004bn-BQ
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 09:57:40 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 l4-20020a17090a850400b0023013402671so11364750pjn.5
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 06:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7dWmG+atlmd84kJWY3f+I8khdIEsMzYXpTBxDO3LT4U=;
 b=dywI1rESJvAmSSYblgm097XEkdyloOVN9iJdOJEHsDJ6jwa9v3tOG6MzsKs7PsVuLc
 p7D/RIcyjRZuTRdk7qujIWYlCiYbDB9I3e5b966MaWS0CfpLkfSaRPJFrC3V8+REeIfa
 J6aQ3SfaZVL6GKJd5LsCUocBWWOWeSn7JXXbx1ERub/1celr9pvZZ56gBmYzDcw7pZ8H
 U8vrQtsP2EQsWH+tYxuqWHMKdrfdVeNUjBRJ+2q5eK99mxAqgmyA56xR3DEaCy71masl
 gVmbaQTfVUKE1qjRxTkrlIwhbmmub4S/6OedoBetduUgRmPc+Yffe/y+BjS5xaafLXsN
 zXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7dWmG+atlmd84kJWY3f+I8khdIEsMzYXpTBxDO3LT4U=;
 b=t3N94tdE0gsF5doerzvlVsnHf0eOCQLapMhWOzLtRBFJjHtc2/g8TKSkW2ZeEqxjnv
 rxEC1UvDvmuzTEQxG1QIXdNbmUye8kufN8+WRZw8wxhdjYIo395ThSp+roAZRUvOeHsB
 OpyDUAP7L84ZI6WD5sH7KEVTxFAxtZ4LeZTW7P6FylTeUKjgsND6OFykDtkzcdcF9I+j
 HtC2L2rAFUl1bwtvpOTw8I0t+lbkaMpaknxkNMpL207WrW+DPdqDwLp04yoKx1/4hgEp
 ESOHXSx6yuQlsGEpvPswKgxbzHmXRLFQSNVMwhFkcK+4mQfU2zKlJo/CZO64uIxnb9NK
 yJHg==
X-Gm-Message-State: AO0yUKVYmuwqdm8XRMq1NeNeHO/2LhXZ8Y24wzxmTY5UL/Ku0X1AawBf
 DDpQq7zzYMGcR/ScWwQA7GbHstY8o7Qg5R4iwOJr5A==
X-Google-Smtp-Source: AK7set95nmkQcQWYsrnhYsmuAN7eaKl/t9bpqHNGYUDQmDsIVieHGz60+mH8v+lr3HS37cuOIFcbSnEGfa/pKs+701U=
X-Received: by 2002:a17:903:1c8:b0:196:3b96:6a1a with SMTP id
 e8-20020a17090301c800b001963b966a1amr3317483plh.28.1675522656649; Sat, 04 Feb
 2023 06:57:36 -0800 (PST)
MIME-Version: 1.0
References: <20230202062126.67550-1-jasowang@redhat.com>
In-Reply-To: <20230202062126.67550-1-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 4 Feb 2023 14:57:25 +0000
Message-ID: <CAFEAcA8TbQFZTG_M3djxiXD+42y8C=QtXrfO9jVEOY4V1PAGGA@mail.gmail.com>
Subject: Re: [PULL 00/11] Net patches
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102c.google.com
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

On Thu, 2 Feb 2023 at 06:21, Jason Wang <jasowang@redhat.com> wrote:
>
> The following changes since commit 13356edb87506c148b163b8c7eb0695647d00c2a:
>
>   Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2023-01-24 09:45:33 +0000)
>
> are available in the git repository at:
>
>   https://github.com/jasowang/qemu.git tags/net-pull-request
>
> for you to fetch changes up to 2bd492bca521ee8594f1d5db8dc9aac126fc4f85:
>
>   vdpa: fix VHOST_BACKEND_F_IOTLB_ASID flag check (2023-02-02 14:16:48 +0800)
>
> ----------------------------------------------------------------

Something weird has happened here -- this pullreq is trying to
add tests/qtest/netdev-socket.c, but it already exists in the
tree and doesn't have the same contents as the version in your
pull request.

Can you look at what's happened here and fix it up, please ?

thanks
-- PMM

