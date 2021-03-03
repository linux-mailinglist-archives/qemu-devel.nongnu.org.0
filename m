Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD9532B7B8
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 13:09:17 +0100 (CET)
Received: from localhost ([::1]:49240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHQJY-0007aN-Dj
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 07:09:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHQHY-0006CW-QB
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 07:07:12 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:40293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHQHX-00033a-6v
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 07:07:12 -0500
Received: by mail-wr1-x42b.google.com with SMTP id d11so23397516wrj.7
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 04:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=KMxxj8HMokB2Gelq169Cln39KisZFOGuIPMMYpUdau4=;
 b=RDqZKZklUtEr/3bO6j10VG7sr/gbZglkhABeINdyAeQ5A7oHBHCxY9ybwpSH/oYhOP
 zKw+4zYSqJSm1Qzqlsvek8eH3Agi98yWkgv3IQVThXSTFxNMwc19q5rDkWeqM+dbkTGk
 M518bQTCUUVPjJeJYv2H0oNqX2EzJhBx6hilvaVtCSC1jxFS/QQYeLwpvLSamnhcBb0G
 YOHbynzI3tE4yfEaaPBWB6G/n3tr00x+Ts4EHLpJH6MaROn6alV9ZhusKdCYFcKeTUuz
 jXZDMaEzzZ91DfDy0uVhnztk/1/cVUNl0FgF9Ghxwd73WLZdhAftWBDZ82xVodze2OpP
 8zBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=KMxxj8HMokB2Gelq169Cln39KisZFOGuIPMMYpUdau4=;
 b=XDXvok4gGnAI+VV7dIEz9DPuMEXgp5Ldit72LbNHQer5EVPnRt+9QYT/4gkf/jJ72u
 s3U9EJrnN8hix08YByCAAH2zV16ZxpnippabpHLQaRN5HB/thfWQW5tCuw7hkIE5KToA
 P9pTA43/tAngL0q8OZHmY+sJQi7Tw1KNNg70sC+V7B7EWPHqr4Tj6jdhExyG2j6IwNZh
 u/Y6NR6+mY4m/+x5WxyuXYVhfx6/fMZWlp38lXAG9vNDRkgphND5CuYTNSjgpWJ66Yq+
 /cBH9fZD0BXC4UJpGvGBc6R/Z/soIMvkuOn23lkUrXHg8ryOfm4IbXbZwp49ESf6WpYX
 Ee7w==
X-Gm-Message-State: AOAM532H5g5NzJDtHElkP6u0woFsPCiJrTfTZFeTVqXK54gDZ18peOhc
 Wc30uwVfLOCwrmshpSkVe1bpxQ==
X-Google-Smtp-Source: ABdhPJxultcj5uP4choc2M6K3Ps/zekG2OtPxZNk57pJKBS7628oJyIGcOpkgdU095urSmebx3rvqw==
X-Received: by 2002:adf:9bcf:: with SMTP id e15mr26289937wrc.276.1614773229917; 
 Wed, 03 Mar 2021 04:07:09 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n6sm7767789wmd.27.2021.03.03.04.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 04:07:09 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7218D1FF7E;
 Wed,  3 Mar 2021 12:07:08 +0000 (GMT)
References: <20210205171817.2108907-1-philmd@redhat.com>
 <20210205171817.2108907-6-philmd@redhat.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 5/8] seccomp: Replace the word 'blacklist'
Date: Wed, 03 Mar 2021 12:07:04 +0000
In-reply-to: <20210205171817.2108907-6-philmd@redhat.com>
Message-ID: <87wnuoh24z.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Eduardo Otubo <otubo@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Michael Roth <michael.roth@amd.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Follow the inclusive terminology from the "Conscious Language in your
> Open Source Projects" guidelines [*] and replace the word "blacklist"
> appropriately.
>
> [*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Acked-by: Eduardo Otubo <otubo@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

