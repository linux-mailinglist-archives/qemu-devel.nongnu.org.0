Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B61D4ADF5C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 18:21:18 +0100 (CET)
Received: from localhost ([::1]:45608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHUB3-0007of-0x
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 12:21:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHRgH-0007e0-SL
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 09:41:22 -0500
Received: from [2a00:1450:4864:20::431] (port=44988
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHRgF-00010Y-NY
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 09:41:21 -0500
Received: by mail-wr1-x431.google.com with SMTP id k18so31143129wrg.11
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 06:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HpFMzhLn5BsB4ANlO+wF81Hk/y/7J1cLNpmjDOVYOS8=;
 b=FE3ZxVa5nYRsjv7SmqaY0xBVbKmalaHTjRItSWE+yiK2PqOaIILuBYMsLnRN+Lkrq3
 t8CMVQ4JAQktREGnHXgwlJ9/G//o6sUERKXlLrAASEia+CN9xPWdAM44JRKqZVj1S997
 Z/bU3sFxC/ckwrcAxg7nNHK0PvwGH5aFZCIQBxD50pC6kSAGjp6dwDh2bhscHEz0pAOg
 CbjJ8f7IX+9uUVeMiK6ViCd5w0PzGDUDn2C3pYUuJOzmsSKCkRxYfkX1878yeuNybPzb
 cv6wEr+cpBK+970hFkDUGcuNoPZ624DIZ6YEvGXZdt6oOprcxK+DMrTIZi0EjouWgvXF
 9MrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HpFMzhLn5BsB4ANlO+wF81Hk/y/7J1cLNpmjDOVYOS8=;
 b=byneBLXldSpigEETuQjlJi+as+o7dN61jEhDlOfVCbqSfg7NjwSiSzTtVJUu6RUo/B
 pI/qKaq4b+7nxY5HTluRc9bxyqaZ6bN/ZhPmhPRhgEv1GbwXeIQOznMk/IUpATc8uLFB
 k4UhVbO/WtZmZWnrZsDw7/zUv1kcQ6/h8kdMBKvQPkF7DuJ4bjg4ywUEGSgsEuHAvnux
 1klKx1es2RvNmQYb4PDuoTKe0+Z0e36B2TpUb6L1F8EkjKw+AjlFWGT1gpHsOM/GcaNO
 1z6LfoSyj9n1mygWatkgoj8efVHtT4HYinE59A8PAAQqSKbxegnAK81ApemVojkv+xnn
 F8kA==
X-Gm-Message-State: AOAM531ZPN+1tUvRFIeY1boOCgSW0O+0FykKqPRlkE4E9YuciqBzzIrq
 nxJac+5eFy+anzzby9x/HfiJnNZYzxpPSAm84ROK/g==
X-Google-Smtp-Source: ABdhPJwicJcozZKj+9fy4nwwXMelonLP0+IyVkfZswbBxspCaAaFByNEnQh/gPWKz1SctR3bLM+hyWqWi7IJgW7hjg8=
X-Received: by 2002:adf:a50c:: with SMTP id i12mr2741287wrb.172.1644331264795; 
 Tue, 08 Feb 2022 06:41:04 -0800 (PST)
MIME-Version: 1.0
References: <20220208124432.84924-1-pbonzini@redhat.com>
In-Reply-To: <20220208124432.84924-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Feb 2022 14:40:54 +0000
Message-ID: <CAFEAcA-u4GPX+izmQQZ8Uc7qCip-jNVVv+tgOW7rAP7LfSq4EQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "check-block: replace -makecheck with TAP output"
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: thuth@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Feb 2022 at 12:44, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> This reverts commit d316859f4e28c74ab8b618895d2a5e0a865d3cf1.  The
> TAP output is inferior in that it does not include the diff for
> failed tests.
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Thanks; I tested and confirmed that failing iotests now
print the diff output again.

Tested-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

