Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FCD4BBE7D
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 18:34:50 +0100 (CET)
Received: from localhost ([::1]:45286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL79d-0007mE-LG
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 12:34:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nL78I-00071e-TQ
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 12:33:26 -0500
Received: from [2607:f8b0:4864:20::b2d] (port=43886
 helo=mail-yb1-xb2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nL78G-0005ry-Sq
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 12:33:26 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id v63so20852195ybv.10
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 09:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=d6QNWUd7Gq/2x0Y1KiyU8qstM/S/56SL3VHMirGhexQ=;
 b=BAvHQaq9titDde7XRFVaYW2p/7jYJxbY+RNTKXSdEhR7UnWydKokyLr8xwaCenRR46
 wwWIZo2cX44r7AYb56qxcZB9xofv4c7pqjmqWRCkDGgk37WGVSqhjKHks72irwhSagPF
 HTaMF3WwGNBDyCDYQea31XFraOHtjKXTw3TaWofFuOyCo3PmOW6zxbx5xL3XrP2R5w60
 NBNybgoMZSwlTHiaKEfTiaH1Tn8LvxESznDpjrzLN162achVRYTEd/pwF+sOI+1fWCEv
 5O5zpit18tFZPE0oPTO8dR7CY51xDkoXM/9BD7CxdHUNtsEelNOZ0DB4hCOYvksnnmsw
 zFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=d6QNWUd7Gq/2x0Y1KiyU8qstM/S/56SL3VHMirGhexQ=;
 b=00O3jLDLyzhXIVqCDPyufGdaog2zDeKa2PS/Wy+NQ7sWyk96Tg+9sIPHYfJwlH1HSv
 szpP+9W3MupU6CQFiiKNbeqqa9EQm10yq60AL6PG68TVAxwHmNTKhHd4QhZpX9x8dsGk
 1qP0Tv6KcUG4Q40AoD/+zXqvCrRSkyqp3jQCcrjGYzViyA0Xtjj61/5VrwjctCmvX/6Z
 lE8dKEgPrQffnR1w2i9wDLrYZ86ROoXZS6AONrzKlHvfO8nXu+xPE63tMm4xQRplZdKG
 DfixmH/i57DJYQXovRfPUFu6m0sxyxoJje7G5/7CRHxCXZHkEGuPXKvf2xrv8KYC6tTw
 FtIA==
X-Gm-Message-State: AOAM530XftURRW4ffT1P+ytHcxKs08LA7ZAdNUL8qTHff3jdLIt53zqd
 VMjzKxyStUcelYzttY22yTmsP3kHA+IPsijZ1GpVRA==
X-Google-Smtp-Source: ABdhPJwk3qCS+1JZ/EYg++CQdwT4YKGpc2qn4RtCez+W4X6PgClsjGTMGXK5oTo5zkNj7Jma4H3bQ6LUcFh5aRC3OPc=
X-Received: by 2002:a25:5011:0:b0:61d:853e:ef96 with SMTP id
 e17-20020a255011000000b0061d853eef96mr8375781ybb.288.1645205603864; Fri, 18
 Feb 2022 09:33:23 -0800 (PST)
MIME-Version: 1.0
References: <20220215080307.69550-1-f4bug@amsat.org>
 <20220215080307.69550-12-f4bug@amsat.org>
In-Reply-To: <20220215080307.69550-12-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Feb 2022 17:33:12 +0000
Message-ID: <CAFEAcA89pP021OxJM9pqivmTHWAjSSHGkNoGAJYB77OH1RpRyg@mail.gmail.com>
Subject: Re: [PATCH v6 11/15] ui/cocoa: Add Services menu
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Will Cohen <wwcohen@gmail.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Feb 2022 at 08:26, Philippe Mathieu-Daud=C3=A9 via
<qemu-devel@nongnu.org> wrote:
>
> From: Akihiko Odaki <akihiko.odaki@gmail.com>
>
> Services menu functionality of Cocoa is described at:
> https://developer.apple.com/design/human-interface-guidelines/macos/exten=
sions/services/
>

I tested this, and while it does create a Services menu, none of
the items in it seem very relevant to QEMU (on my machine, there's
Activity Monitor, Time Profile Active Application, and some other
software-development related things). In fact, every app I looked
at exposed the same list of things in the Services menu. So I'm
not sure why this is even an application-specific menu that needs
specific code to support, rather than something system-wide that
Apple automatically adds to the UI where it wants it.

-- PMM

