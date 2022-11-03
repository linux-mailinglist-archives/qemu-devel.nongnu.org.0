Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B107618834
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 20:08:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqfYY-0007w3-Dj; Thu, 03 Nov 2022 15:07:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oqfYW-0007vw-82
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 15:07:12 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oqfYR-0002hf-8S
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 15:07:11 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id r3so3377978yba.5
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 12:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RZptaINCAEgmcazsOZgI/xKME4fG9YdzzlJSbLr3vow=;
 b=PYt6ISHwS9OfsETMcw+yXcncU3EZdN0AroB6hJSngp7b/SuHuZ8FunqgVJt+Tt56GE
 jGPaqD7gr2FAbmKkaqfVEveN9nE0pPDp5cUlz4cxPhVpfxLB/C33DIv7xe/zXkvQHXYJ
 Xsqv2WVmjGwNoupw5z7AzntygrG7zc0+Incih0zqmIMsuKnYI01rNMryWU47kDXaIjuP
 EWjbIA57rIrieEWc1QSmt0ZHa9zfChb0Sk0UEjmYYlzeW+sJv3SK+khUtcTIDJBY0vtW
 gdRO+9hJxRcvgcmq1zST6HU/UzMRTSolRZExCUtEhZEUc8fCdI9l3p4oht5WIIEY/Bho
 hKUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RZptaINCAEgmcazsOZgI/xKME4fG9YdzzlJSbLr3vow=;
 b=CTOUZUZ/+Gm+NR1+sXfyiG8LV4X0s/4iJWSfu8TeHUF6r72T7OlyIVepN77XX2KgeW
 QVXfy/xds33AOYyS3r8opaK0yDd+9SAPRCdqrgVLi04ywUBcjC5d6k5g0FKXRBZPjS0F
 Q/d8O74qMewXiprCQ2+V4yxEw1HGktYH/fKeQP8PWGjcAPFFvPRwERpKUfHtJ0zC2zwk
 H4xXKJ2dyp/qGgC5dmb6GF2DpoA3zbpfweT2dxmj8JV4EIQ2EkKOhZFpUqt0UfwIIaDc
 kLV+14VfGm+029J+YbtCB8n0BzUaBM/+YPaORfQVcqjhDNhZxkbWz03uWP0/Fao8zDiL
 JDsA==
X-Gm-Message-State: ACrzQf0402HJN8w8boajcUMO9YFhm1BnV7e5lnjIkhzXBgAcwIf8LwLr
 aFa/rak9dk9hZZd8JWhw5sEJg/S+eZPBIh4YpRY=
X-Google-Smtp-Source: AMsMyM74KaNZCsh+UgLq48vnxHWXZJiIfTZsNM0erAahKa/wPsV8RE3juaGwnN/Vmsldo2pNb71UNv66j2jjIvT7Rzg=
X-Received: by 2002:a25:6412:0:b0:6cc:6507:bfae with SMTP id
 y18-20020a256412000000b006cc6507bfaemr27555015ybb.537.1667502426094; Thu, 03
 Nov 2022 12:07:06 -0700 (PDT)
MIME-Version: 1.0
References: <20221103173044.3969425-1-berrange@redhat.com>
 <20221103173044.3969425-3-berrange@redhat.com>
In-Reply-To: <20221103173044.3969425-3-berrange@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 3 Nov 2022 15:06:54 -0400
Message-ID: <CAJSP0QW_soqfj9d=6nkvzMPUzZGwzhfRDXg7QK4Q8OkNCO1+xw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gitlab: show configure/make args before running
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Beraldo Leal <bleal@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 3 Nov 2022 at 13:30, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> When debugging failed jobs it is helpful to see the
> full configure/make args used, without having to search
> the gitlab config file to figure it out.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  .gitlab-ci.d/buildtest-template.yml  |  4 ++++
>  .gitlab-ci.d/crossbuild-template.yml | 15 +++++++++++++++
>  2 files changed, 19 insertions(+)

On IRC Mark suggested sh -xc "$CMD" to avoid duplication. I'm not sure
how to get escaping right though.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

