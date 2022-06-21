Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1745535BF
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 17:19:32 +0200 (CEST)
Received: from localhost ([::1]:46978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3ff9-0005n7-5q
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 11:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3fc4-0004ET-Fa
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 11:16:24 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:38752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3fc2-0004TY-Sc
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 11:16:20 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-3177f4ce3e2so110672457b3.5
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 08:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qu9VG2DWb9yDEii8UW7ZeZBFsFvGUAS9BUO3OKjlwV8=;
 b=wVa0hBgVkUxz30tBRf8ElDaWL6mllpYt3jcO8Iey4MQpUe/rMm+zCx3wv7WISQc53D
 l3RKhLIe15Jy62xeHwwiTXOm7zzs+xMCdMO665cqp/v97oJ6rZbVUZOeO6yHRv8BZNh8
 fFLypVA/A5+58xRMn4bkfYlO0zfcUDfOgVeQlZMwLuXWkj6zkQNXg5o0wJ/92WbTcRXz
 nbRssG8DIwDRWr8CAqrulYZ9VtDciR29GFjgAnZfGo7CTsfZv/nfGkamsPUYEzThji8+
 9BNp7ZsF0DMeUso84hZ7lZsRhnF1rcw0PYWczZyDQsU+pp/2ueKm3T9rzxf8Q1KiZOUn
 XkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qu9VG2DWb9yDEii8UW7ZeZBFsFvGUAS9BUO3OKjlwV8=;
 b=nVp3qBXie7u285JaHGFhyP2pvUXDB/1da9xWYyYnCK+oGKGGVtqTI7ouB6t2MuW/xS
 /eVUt3Vsu2WmJ8NjOClC7ldGsPBeURGycIUkFiBlUafUsMhGbdY1AMwsFWuP6443DYMj
 Kh63xLNit0QKcF13TauvFzZ6YMbfo+pqHudoPNEe4Uf3OcZu4R1797CBGI1/0htwIPI/
 XsCr9gYIP5KYLDOekWRwynYL7Tx4UCeWnTyhOQqmCW9xZwmnTsD6WSX3W28hiMF52ySm
 TjWQA6MjMDhzFqHQbHTbe+1rt9xkcoXnEg7YD8UnFZp2W3a4PKLsobFvZ40PSzG+mm2g
 jFvQ==
X-Gm-Message-State: AJIora8ULdS70vAN3HY0BU9trLlc4UIXLHJuunAvb76k7L9nGR2vqTCl
 5U9TNFtlVeAEjcbaAvV93TP5S4N3c+Y7OroUJqZW5g==
X-Google-Smtp-Source: AGRyM1svy5ukNB7HoJH8ZEqX9ZsKs7tRt+tSgn+wvcHnAOGzHy3Z98VSt0LqdpEyyZ36hURZ5oFkwwmPkecKnTF+574=
X-Received: by 2002:a0d:ca0f:0:b0:317:a2cc:aa2 with SMTP id
 m15-20020a0dca0f000000b00317a2cc0aa2mr19040088ywd.347.1655824577618; Tue, 21
 Jun 2022 08:16:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220614212131.94696-1-akihiko.odaki@gmail.com>
In-Reply-To: <20220614212131.94696-1-akihiko.odaki@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Jun 2022 16:15:40 +0100
Message-ID: <CAFEAcA9H4G=t5c2F519Za7-X7yH4cZZyjspNLBu1z3=YeDw+Ww@mail.gmail.com>
Subject: Re: [PATCH] ui/cocoa: Fix clipboard text release
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 14 Jun 2022 at 22:21, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>
> [-NSPasteboard dataForType:] returns an autoreleased NSString,
> and callings its release method will result in double-free when
> the global autorelease pool is released. Use NSAutoreleasePool to
> release it properly.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

