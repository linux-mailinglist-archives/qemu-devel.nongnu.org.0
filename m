Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD05C36E8C6
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 12:31:48 +0200 (CEST)
Received: from localhost ([::1]:50990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc3xT-0006TM-Lc
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 06:31:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lc3w2-0005c9-UM
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 06:30:19 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lc3w0-00043s-3v
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 06:30:18 -0400
Received: by mail-wr1-x432.google.com with SMTP id t18so8754122wry.1
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 03:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=vHcI78wpgI0aXwar1OvZ2uCmR7DHb+ZrEfMtvZ/N3Ug=;
 b=G+UqF2JrfIeXrsA3aYch0wFZQkFsXtAmj6RHT4yoypH9K6rkf+AZV3VANDSDEj7OkP
 UGpl6FlnqYckMqawrFkZ08B8K9xbfM/isiXt8V91ZfzwU+fK5PiQSZKx7KY2dLu5TMEB
 3tqoGbWgXb6qr5tVEOPGXxANJDFpG13Rw8Tu71dDMR8G+W3K8PtzmU9T/NToFiJg53Yx
 ISUb4EhUaD+D7OYNiLEn7LWRiFxaoYOaxFk4uzZqGfo6KQX8t1ngcOy1VaBeZnb7c8VY
 FDcmMnO3b3Xi9P2fr+K9EuJoeQ003oVuPb5bbidhxnOOvdVcuB39NM2cz2swi19Wg41j
 +dxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=vHcI78wpgI0aXwar1OvZ2uCmR7DHb+ZrEfMtvZ/N3Ug=;
 b=E5EH+QwvcsPY+3EPzoN4iDJ8XiLMZWtGJ4QtP5AtnGyyY4hxQ2MJYHA/lLHfGs13aK
 8LNTWOzPzf6K1gCeMba6FUiHMkrhvQKddRseBZ1ZP1jRt9mucMDP+wy23PW1HMqK11SV
 Iv1hY5yGfLxzsdNSeIERpXS1Y8us+G18KTJ7PUnwwFQltYIf/zW97a9Ajk0wOllaIknN
 EJzQ6arRqFHHUWYepEhYb+VVpGkoVVxXQ06g7YdioIiSG0azYIOQk+cwkz5sqeDTOj3z
 9/8MqVZgaEDYzW9odaxV2WAMKRt4XFX1Hv+Ft7GE8fvrh7lLfkbuVdM0imJ8tjap3itA
 XYeQ==
X-Gm-Message-State: AOAM530yvjLh3+X2twJs+/agMeGkHIIU2Rt48WnYxbxNCSaADVbvvurY
 tsnizxkyMcA/H6M4cxTfezqKPw==
X-Google-Smtp-Source: ABdhPJwt951c4Lkn0q5z3NRervRGNSvYoLX3SDg2FzsQvdDAbK45GpUxHp8QRflC50tX/1PCQXFy3w==
X-Received: by 2002:a5d:65c4:: with SMTP id e4mr42367208wrw.287.1619692214490; 
 Thu, 29 Apr 2021 03:30:14 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y5sm4329196wrm.61.2021.04.29.03.30.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 03:30:13 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ED4E91FF7E;
 Thu, 29 Apr 2021 11:30:12 +0100 (BST)
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-2-philmd@redhat.com>
User-agent: mu4e 1.5.12; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 01/12] MAINTAINERS: Add qtest/arm-cpu-features.c to
 ARM TCG CPUs section
Date: Thu, 29 Apr 2021 11:30:08 +0100
In-reply-to: <20210415163304.4120052-2-philmd@redhat.com>
Message-ID: <87pmydqt6z.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> We want the ARM maintainers and the qemu-arm@ list to be
> notified when this file is modified. Add an entry to the
> 'ARM TCG CPUs' section in the MAINTAINERS file.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 36055f14c59..d5df4ba7891 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -156,6 +156,7 @@ S: Maintained
>  F: target/arm/
>  F: tests/tcg/arm/
>  F: tests/tcg/aarch64/
> +F: tests/qtest/arm-cpu-features.c
>  F: hw/arm/
>  F: hw/cpu/a*mpcore.c
>  F: include/hw/cpu/a*mpcore.h


--=20
Alex Benn=C3=A9e

