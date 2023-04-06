Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA986D9C07
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 17:19:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkRNe-0003ge-J2; Thu, 06 Apr 2023 11:18:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pkRNc-0003f0-Gs
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 11:18:28 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pkRNa-0004xU-UZ
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 11:18:28 -0400
Received: by mail-ej1-x631.google.com with SMTP id qb20so2235596ejc.6
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 08:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680794305; x=1683386305;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DTYmK8YkPVhMeVdQAleCZ/tAcp1XekiLSY2jWJ8OVn0=;
 b=o3sXOGaTy35TBrWdA/ZCTjDHsafZroabmM7isj5bmvtyQzYNf8w0e6W2k5tDIZJOT5
 ZtB6SjqdlNsiTLK5jMTOa65QbxUKFL1QtdRlcLTCok/3waNhaSOTzSZm+sRQY+yAK0lW
 Gi4So07q5CVUbS2L9HUiwJvvYHUB6Q4vj3e6EhKcFFbiC8jMzEAQh9aTrDG3uGQUY/U5
 kzzUHFzg/wt6ZN4jsviiQ2NQraL5cbmbtq4S1ATmJ48Y0P7bFi3K5BWWuFpKUGrOiNDC
 NEYh2UGteXEvs2orgNeNIg/6c4ya/viPWQqtTpBOFtAM6nVYAKwullSbt+p47ZKT1Mhp
 zyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680794305; x=1683386305;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DTYmK8YkPVhMeVdQAleCZ/tAcp1XekiLSY2jWJ8OVn0=;
 b=z10iIItyW1NzPDkjLGeoEQsNHLaNgXa/v0izwASkbMSnHEAKUG6yyTYr6LVTHxU6kf
 W50Q+AsEsPp8TUesFZP38WNhURfbkjHq5hTvPWxGx5a8uFlu4Leu+2WGZxsZOA7qiyHZ
 lVKhCGmHzYv/HAmI2lijQzW48Q/lYqC3UTJv0xttqR6JIPpzJd0iJw+V01eP3GMCpdX9
 Ss2WEtIgHyyr9eMnrCxHlO0s4j1yS1sYEygJF3+cPQJaNhznzUD1msRLrG/eSMdAAO/g
 Mz13SLqDn8kc1VO/WmHHj7BsGA75fV8tSV1EPvNmkkxjmfh4grta0L6pKQrI0aMOrfA/
 lGRg==
X-Gm-Message-State: AAQBX9e4bVnMQWdAe1qUiaMtMrDKoOe35djvZAUCzr9ljB7Q2h+1rm7U
 5g4xLk6N5nOiJdVOkzftjmf9M4cGRAQF9Uc2SH2HyA==
X-Google-Smtp-Source: AKy350Zs8ZnFOSDFZhmrHpJmPBzmdZ0OVPINfkHmM71Js2ejfgFIiy9ZLXoyIwUqzPcpT94JVtx18iJ0Fh+BaFTYbQU=
X-Received: by 2002:a17:906:73d8:b0:939:a51a:dc30 with SMTP id
 n24-20020a17090673d800b00939a51adc30mr4786343ejl.2.1680794305057; Thu, 06 Apr
 2023 08:18:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230307182707.2298618-1-dwmw2@infradead.org>
 <20230307182707.2298618-15-dwmw2@infradead.org>
In-Reply-To: <20230307182707.2298618-15-dwmw2@infradead.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Apr 2023 16:18:14 +0100
Message-ID: <CAFEAcA-9GDCa8ZrxjZJBq7wx=pVDAdvvDvTQs_oVyhD-HNSsrA@mail.gmail.com>
Subject: Re: [PULL 14/27] hw/xen: Move xenstore_store_pv_console_info to
 xen_console.c
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Durrant <paul@xen.org>, Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com, 
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 7 Mar 2023 at 18:28, David Woodhouse <dwmw2@infradead.org> wrote:
>
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> There's no need for this to be in the Xen accel code, and as we want to
> use the Xen console support with KVM-emulated Xen we'll want to have a
> platform-agnostic version of it. Make it use GString to build up the
> path while we're at it.
>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Paul Durrant <paul@xen.org>

Hi; Coverity points out a double-free here (CID 1508254):

> +static int store_con_info(struct XenConsole *con)
> +{
> +    Chardev *cs = qemu_chr_fe_get_driver(&con->chr);
> +    char *pts = NULL;
> +    char *dom_path;
> +    GString *path;
> +    int ret = -1;
> +
> +    /* Only continue if we're talking to a pty. */
> +    if (!CHARDEV_IS_PTY(cs)) {
> +        return 0;
> +    }
> +    pts = cs->filename + 4;
> +
> +    dom_path = qemu_xen_xs_get_domain_path(xenstore, xen_domid);
> +    if (!dom_path) {
> +        return 0;
> +    }
> +
> +    path = g_string_new(dom_path);
> +    free(dom_path);
> +
> +    if (con->xendev.dev) {
> +        g_string_append_printf(path, "/device/console/%d", con->xendev.dev);
> +    } else {
> +        g_string_append(path, "/console");
> +    }
> +    g_string_append(path, "/tty");
> +
> +    if (xenstore_write_str(con->console, path->str, pts)) {
> +        fprintf(stderr, "xenstore_write_str for '%s' fail", path->str);
> +        goto out;
> +    }
> +    ret = 0;
> +
> +out:
> +    g_string_free(path, true);
> +    free(path);

g_string_free frees the GString, but then we call free() on it
as well. Presumably the free() should just be deleted ?

> +
> +    return ret;
> +}

thanks
-- PMM

