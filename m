Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3137137036E
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 00:21:20 +0200 (CEST)
Received: from localhost ([::1]:52510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcbVf-0001fp-AR
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 18:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcbU9-0000rI-Up
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 18:19:46 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:44023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcbU5-0003GS-T2
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 18:19:45 -0400
Received: by mail-ej1-x636.google.com with SMTP id l4so107393791ejc.10
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 15:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s69swnRzpykzAej4Nz/f6AqqvO7/sIYFPkzweVc94/E=;
 b=ClnAPmgfFZs0OSs8iQSKI5oTyOt8pxnKRXsQNGO9Ar7MGZ+V4Kl8hCNvGuwv0XHixp
 n6f9XGs1ldx9dSeSrAUh43JLFzd54a1zrWBsW2IlUkOpXLMKAX01U7qfdNN3UUbPqrhF
 euBSgTUrTYmARwbUbOtYU9tTqZCeCDhRVR82GND6STPTSh/1KiZ9YcheyOZyK8J/zE0E
 03MkmoEKTNlFQpO0QlidtzAhNrRFyMSG2FKV7VzfNGnDYC+ZdgPSsSk3YAUYZ5iCBlKl
 8OeNswcD5FCgYao51FfWI9E5RTYHl7J7SL8kK+ji1kYTbi1ZnqqX0Wvj79qZLUf1PsuR
 5DNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s69swnRzpykzAej4Nz/f6AqqvO7/sIYFPkzweVc94/E=;
 b=hW8KVfQ9E0bIFR9CH5Wqt/dp85qKl47YekwX4NKbyCzhd5xKDd2ql4LRcQXdSP6BpC
 MO3IVVVktcapldhgkAyF2IjNrJM67qq+x9ZBnOTkeO3rUDBqjKqc4YToI3n5Bf79TXFE
 2Md4A+TtiKOmNlMIxsMtboX3T++2sEk1AHBffTUKOsxsfF2JjULXaUcpA2wtAtP4KCb+
 H75KRzTAP85PUn184IXZ1Y2S/qY/sMgW4QquO6DzNnZ61mYYLB2ttd0QfcH1ak3fj0qB
 lPBS9gzXV8C79qxisAne4l/JSnGwYyQINqFdt1c/uQFgiLNFi/bqCtawE2/xRLTa/Cuq
 g4Hw==
X-Gm-Message-State: AOAM5331GZBGfwKBIcE0+l7OiFyny8AMBp7jG8eGXxTJ4g43ZlhOHQy7
 m+UYz3hQXSNRv7d78v8f2qZW3ECaQpXCQSjN+K9XdQ==
X-Google-Smtp-Source: ABdhPJwz+SWyWY3rjzzYsDU+AzgpubafAxFh2SbY+59aGI/sfgqV5w1a/OvSPdseSgb/3au99Ge+ZF/PNfQO0wAOeBo=
X-Received: by 2002:a17:906:6d41:: with SMTP id
 a1mr6730786ejt.482.1619821180423; 
 Fri, 30 Apr 2021 15:19:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210430163309.4182922-1-clg@kaod.org>
 <CAFEAcA9qz1SLh5Ws7C-xUqvnCJWfFyjjwc8STj4mdUxmCw0spw@mail.gmail.com>
In-Reply-To: <CAFEAcA9qz1SLh5Ws7C-xUqvnCJWfFyjjwc8STj4mdUxmCw0spw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Apr 2021 23:18:38 +0100
Message-ID: <CAFEAcA_2fuec2KiY=ayUf6e1y-nEuBtdU4KwL5un_mgaBaXrcw@mail.gmail.com>
Subject: Re: [PULL 00/18] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 23:17, Peter Maydell <peter.maydell@linaro.org> wrote:
> Same thing is also a build failure on 32-bit hosts (where the types
> are genuinely different sizes):
>
> ../../hw/misc/aspeed_hace.c: In function 'do_hash_operation':
> ../../hw/misc/aspeed_hace.c:128:49: error: passing argument 3 of
> 'address_space_map' from incompatible pointer type
> [-Werror=incompatible-pointer-types]
>                                                  &iov[i].iov_len, false,
>                                                  ^
> In file included from /home/peter.maydell/qemu/include/hw/sysbus.h:7:0,
>                  from /home/peter.maydell/qemu/include/hw/misc/aspeed_hace.h:12,
>                  from ../../hw/misc/aspeed_hace.c:14:
> /home/peter.maydell/qemu/include/exec/memory.h:2438:7: note: expected
> 'hwaddr * {aka long long unsigned int *}' but argument is of type
> 'size_t * {aka unsigned int *}'
>  void *address_space_map(AddressSpace *as, hwaddr addr,
>        ^~~~~~~~~~~~~~~~~

If you like you can repro this on the gitlab CI where we have
cross-build jobs for the 32-bit targets, eg:
https://gitlab.com/qemu-project/qemu/-/jobs/1227559504

-- PMM

