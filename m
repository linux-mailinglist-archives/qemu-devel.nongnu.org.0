Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B45C94CAB1D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 18:07:07 +0100 (CET)
Received: from localhost ([::1]:53852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPSRO-0002MN-Bk
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 12:07:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPSOC-0005rk-0q
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 12:03:49 -0500
Received: from [2607:f8b0:4864:20::b2d] (port=46796
 helo=mail-yb1-xb2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPSO9-00031E-Iw
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 12:03:47 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id b35so4611972ybi.13
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 09:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZKAwCOIT2sfYlPr1Si8J5aOGMzCUl4pWbt3iYp1PfpY=;
 b=zggor37KOuVuM8dGHFgG/XO/jhmHrtW8zskSk+ZFkDXi0c/myLczvSvbqbWk2/mwHN
 7Tv3a/Ole4sdypXHGfa7jXg1IAL7Od+C1JZE9sRL1Kc9M7q7GZw0h4AclhhIf7YgqKnk
 msrPRZZrDR/hVI3ImKouuldEWIppDO+uN6hRewTap19JnGvi0yX+OMnje9YEZ7DLt5Y7
 bXOGlqxDT7EUfAa9QqAPr5I7ng6HQDKn7vxYX0T+VdRc35Iarbcu/0FVi9BF/3mzvpK8
 S8gx5fxSBXPbuWcuB68W0K7doOaRta0S5x/wTUA/XG4VqnKNoHRhMmUTLj+cTpO3LcjQ
 W64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZKAwCOIT2sfYlPr1Si8J5aOGMzCUl4pWbt3iYp1PfpY=;
 b=Nbhgr7scESip4ggEqbBxWTYPsKt1R860gMP/ajEKVb50F4mqZlHbmoZsRZsxFsGgJq
 KAO5vSaLWhzu4KETXZLa/9gukWZhBFZEAfpD0aEAPwAGHiyuY6AzgkPa2TYNGTVYBie3
 TIhwzWRePQZqLjdxHa4lXuxuNfPH8Nn83NZSK3mq9G8/G+k4bQLVYtP9C3hwXuOmJWqN
 7vsb0S2e8im2wXFSGqdIyb6j0Loz3Y3P2Dz0i1BeGfxOSLIgw9ZmNERf2GreMWLX+oGS
 UFg2GBOuRpkUeQrKvxrK8TajPv8MmTbqbrAoA/Maj9ZVDk/H7O0ugLEcsVPg7g9lKTRs
 F05A==
X-Gm-Message-State: AOAM532CiszEYJn67UF+q1yOhzatpubBpCSxtdIhE8X3m+W9Dz/p/Ru8
 gpJOpQSYGuuC31JdF1Xa3JzewqFPedklmBVpKjNFrQ==
X-Google-Smtp-Source: ABdhPJyzWwix6+uv4+4aDR0Fl4WFS7sLdw4VftTIEjgeQ44E4UQxRKbwleyljTxKyyBwm72y89S7L6QOuGc7DqipFv0=
X-Received: by 2002:a25:6e84:0:b0:628:97de:9430 with SMTP id
 j126-20020a256e84000000b0062897de9430mr5335490ybc.288.1646240624310; Wed, 02
 Mar 2022 09:03:44 -0800 (PST)
MIME-Version: 1.0
References: <20220226180723.1706285-1-peter.maydell@linaro.org>
 <20220226180723.1706285-2-peter.maydell@linaro.org>
 <20220302163048.pahjr7gkdj5jxqm5@redhat.com>
In-Reply-To: <20220302163048.pahjr7gkdj5jxqm5@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 2 Mar 2022 17:03:33 +0000
Message-ID: <CAFEAcA8WA7kc5mmhHptKMmXAa=geFi=Vs+dwaM+a3Pi8RyYW1w@mail.gmail.com>
Subject: Re: [PATCH 1/9] hw/usb/redirect.c: Stop using qemu_oom_check()
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Mar 2022 at 16:31, Eric Blake <eblake@redhat.com> wrote:
> Is exit(EXIT_FAILURE) worth using in this file?  We have an
> inconsistent history of a magic number vs. a named constant, so either
> way,

I'm not a huge fan of EXIT_FAILURE, I think it tends to
obscure more than it helps. We have rather more 'exit(1)'
than 'exit(EXIT_FAILURE)' in the codebase.

-- PMM

