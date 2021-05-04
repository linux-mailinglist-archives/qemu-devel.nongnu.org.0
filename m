Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09765372926
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 12:44:49 +0200 (CEST)
Received: from localhost ([::1]:34924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldsXo-0007P9-4P
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 06:44:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldsTv-0004Op-8C
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:40:47 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:36830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldsTt-0007Xz-2X
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:40:46 -0400
Received: by mail-ed1-x52a.google.com with SMTP id u13so7158381edd.3
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 03:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oocjvv7hcx3R63GzjXWkQsbiVGktib/UoD97zbPxsp8=;
 b=mjZDX3AaCgqtyw/jP8lt+rBKXEzjiR9gIwhXRoVGUNx2l8K9f+INf8TzelEruFjzZr
 cqNpkp4QbiHa9Gzp0obTel2o3Mhk0BfQRwvL3GrV3YG9MwEkyMjw5xu4CMvk5zY/D2TG
 Bv4mNQDURNHTpQZvOhft8D+/+D53i6Y+d1AbIIuw3YR7T5L363fYubZDbJBB8oNDmYch
 VB+tAsNhVFqO6qogS0OaTqGiqLXe1/i5Ouw3LCynYkml3RsIWvlcl5cWpOERMEmZRlIf
 zqksLogNNyKUdm2CrYZR8DRz/iAdfB2Dj+GxoEE9X1mmzn4G828Q0VjKJSLmYGpiA84q
 bdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oocjvv7hcx3R63GzjXWkQsbiVGktib/UoD97zbPxsp8=;
 b=q3Go/m/nP0uzFmAzziFgUIcqsdrLtepc5MbQibsQhNGTu/Vuj5SS9JZ/OhR34z7Hby
 6jWqTV5LKxsVCydbV75nfuFIt1ByyKC5cJqK7IhEM1PKrQNFyC3nAAX27USfBu1wBpK7
 C3dFJAS0piYCWz6fOBJoOgpkayb0ho4tjgzRrA2fPwpassXRVVzkiFqJ1nMl+YBwud6J
 4ZB2Y5crHoMtgcNvQ5pDbpCktRqqOXhpO33rofA/q5ljmwgUcX/dFBBqZyVqbrEjWVPc
 2hmXPlL6XmW41/gHrqaEO2uzHI76t1LeynWvU/Ovl7GPl6dZCWIQc/H8iU4M6K7CTpGa
 hE7Q==
X-Gm-Message-State: AOAM531d1Y35pAVDIpj9W8FPIcfDgkjl8nD/ovxoBbcrsY53fGc8y9f2
 JzcFNqhdG7nIvG21ceycPggQ4rjThIEIYFSguo7lyg==
X-Google-Smtp-Source: ABdhPJxxyOTv3pUMAPr+O0GQLsPf9X5BZj2FtFOKQ6WowHP2bxL4eCzRQf9tx8+kU7uQPorAFZMUrTycCYNKvsb0JBI=
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr1886881edd.251.1620124843348; 
 Tue, 04 May 2021 03:40:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210407225608.1882855-1-f4bug@amsat.org>
 <f7138901-3e7d-14ca-87a8-317089d51195@amsat.org>
In-Reply-To: <f7138901-3e7d-14ca-87a8-317089d51195@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 May 2021 11:39:37 +0100
Message-ID: <CAFEAcA_YzAVXmZDuaP3iThqqdUoknNZcBtqH8xsGukXrjxAVXw@mail.gmail.com>
Subject: Re: [PATCH-for-6.0?] hw/arm/imx25_pdk: Fix error message for invalid
 RAM size
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 2 May 2021 at 17:29, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> Hi Peter,
>
> Could you take this patch via the ARM tree?
> It has been reviewed twice.

Sure; applied to target-arm.next, thanks.

-- PMM

