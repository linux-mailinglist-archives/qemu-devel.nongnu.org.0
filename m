Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AC64BA84A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 19:32:12 +0100 (CET)
Received: from localhost ([::1]:34046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKlZb-000205-8P
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 13:32:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKlXk-0001H5-CY
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 13:30:16 -0500
Received: from [2607:f8b0:4864:20::b2f] (port=36857
 helo=mail-yb1-xb2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKlXh-0005MA-Tq
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 13:30:16 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id c6so14868623ybk.3
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 10:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WZXPv0304nZFa8hNoGbS4yYAuT7M3qYRZYOBtLusbWs=;
 b=sFCotR6VyaQytBbRMp1FtO7xHl1dhMCEcJ4iZCr1Aa6GV6rlaB9nnkec33//UGcTcD
 oTkLxDeVyHOa0s2ZOubru4uQGFSL0DvbXD3XL17t78IH3ODx1FS87ks6KhLWmw63lgok
 UlQ6aXmv+41+ItS7dd/w8MK8pAZ6jai5uCxCCgUqAUYsWANGZo0lcBmYJCKlJRZiInhr
 mxQXIT45B1q6vKRgWsWchOwP5Vc9atnSCu83uieqgSwebaG5XiyV7WQIRJutmRyk5Yql
 4rw1STI6tpL69t5zK1zFFpDBfZxuV0wWFxS+wdXktdNFPQrUJwOmXdYUKjCpIkkHINc8
 4NMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WZXPv0304nZFa8hNoGbS4yYAuT7M3qYRZYOBtLusbWs=;
 b=K+lX4gyoqVd+6TDxYrrvCSXD8A/U0Nq9yj3g0iiwH84W0alnwOX9nVEPFoop+eI33E
 9uktsBvQlj/PSlWGMLTO3GIjbtGb9znpQH2kVcOD2VJ5kAYQFMgUS8LUHQxu4DjGONQo
 rUsqfQwf6Mm5fl7m7xA8gGBFsssWTYfIHJwhtYIMyz6bVuEEcdXbFGWHOCtAH7udegY7
 R7BldAKFmBTZPwy6DYN/eK55tLc7OLnuuBkSSPNNEuexjFXfR4GuW6uGE+5RzR6w0Oog
 2uFJRTUE3/jpmoDHfHgTm/hkWoAuzJipWn4wCfsfS/UsbQXJmQC9pyZDrIHjW97RAHD3
 zTJQ==
X-Gm-Message-State: AOAM531nJUJ7LR00Lb8m7sfQRSvHz/3smyBRcIIFEprPUd+PCI9LmtUx
 DcOw+ZrbEiUAvD2jx8bVXkBFyZd3AldEP7CjhkcBmw==
X-Google-Smtp-Source: ABdhPJw7ZAXcI8Z2mo8H2zDXhsLqjJQm799coJi82WRTL0UGqppmkA88dzogQ3ZnUwaNUr4umzuJ/sLTBgYQLb8BCdE=
X-Received: by 2002:a25:27c3:0:b0:623:249b:1213 with SMTP id
 n186-20020a2527c3000000b00623249b1213mr3911739ybn.39.1645122604763; Thu, 17
 Feb 2022 10:30:04 -0800 (PST)
MIME-Version: 1.0
References: <20220214185605.28087-1-f4bug@amsat.org>
 <20220214185605.28087-3-f4bug@amsat.org>
In-Reply-To: <20220214185605.28087-3-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Feb 2022 18:29:53 +0000
Message-ID: <CAFEAcA_9ixAF2v+RkTHE+pej3EqUemd5ykw+3T84iKWC9Y7sTg@mail.gmail.com>
Subject: Re: [PATCH v5 02/16] configure: Allow passing extra Objective C
 compiler flags
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
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
Cc: Li Zhang <lizhang@suse.de>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Feb 2022 at 18:56, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> We can pass C/CPP/LD flags via CFLAGS/CXXFLAGS/LDFLAGS environment
> variables, or via configure --extra-cflags / --extra-cxxflags /
> --extra-ldflags options. Provide similar behavior for Objective C:
> use existing flags from $OBJCFLAGS, or passed via --extra-objcflags.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

