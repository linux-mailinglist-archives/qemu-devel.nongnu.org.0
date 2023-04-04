Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2DD6D6BFC
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 20:28:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjlOO-000581-GK; Tue, 04 Apr 2023 14:28:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjlOM-00057p-EK
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 14:28:26 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjlOK-0001y9-ME
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 14:28:25 -0400
Received: by mail-ed1-x533.google.com with SMTP id er13so93326010edb.9
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 11:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680632903;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=r+d5Q9YLXYIEcRrYG4TRRbzODXP0vlh3YF3733MY38Y=;
 b=f3BpCBNxoILDtSyKj6axT8mrPBlR5NN0lRzyoX5tdjNO/89HEPknpa4WvDWvmDY58B
 BI0hYUwNBgaMA8tYJ7g1HLqAvUExLBy3m1U1+4LSeQHitztp3uTADQEFWKk3ejKh8zHG
 d8eIbwe2BJ3fYazGz2Q4bSoA4I96qXA5V+g/6roXRdYcnwfhMpurLv7XqBXSibhOa8T4
 uZcgEoBlNaqEyFJ1VY53AKfCGcQ/Cel/7ok7tvgZq4mf9GXwVfV67QswY7pBPxG4byhj
 5Gzf52tGeynPD3urXrj/SVyzZcSHBswX6C3Zinr9W2c1498cvHXAwVpExI0VTjq7CdSU
 bAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680632903;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r+d5Q9YLXYIEcRrYG4TRRbzODXP0vlh3YF3733MY38Y=;
 b=5g3OftvfVnHEwx08Vsr0egw1lNOr0Awu0yThFNkqDW1JiGbRPh5Gr/NcnefEgEu9Va
 RqsxcCQDOvYVUhCdyW+IEat1AntXNWrpMnNdDmQ/0a2jAS2df/kgoJ04olX329HlX0Kv
 MSkeq7MwHakjH8oOnzV3CwFaYr0CTFAsVHzIzUX4t4nNn+mjGY1qv7MnVEHpDeKNtwJy
 DZFK04wcd6cfV7nXpITpWgGMo1U36FWBiImMuNJAzhqUc1HgMBBHbGqDDIwEhbvu+O1U
 a4VK2jM+LdcgTDiUt1iYKM4dWlInrtB+ep64s3urnB8RlVq+KRJ1dpm0KdtlYfpJ0DmY
 x5Mw==
X-Gm-Message-State: AAQBX9cskIqlm4XN8Mm+3zTdyBCr2Y74jGwEUn6YOy+1t+lYY5lYG5S5
 VvgcqFb0AIWnsLdQXqJqkUQglwD3fX09HVyBkr5mhQ==
X-Google-Smtp-Source: AKy350ZT252GSKd/98j6Mu/b60fK17QV1dP+JE4fqqkBHdumFzII2W394UiPvTI+M3TSV0LF0wvFMeuQ5PxM5EcMK/M=
X-Received: by 2002:a50:bb43:0:b0:4fb:7e7a:ebf1 with SMTP id
 y61-20020a50bb43000000b004fb7e7aebf1mr222707ede.6.1680632902832; Tue, 04 Apr
 2023 11:28:22 -0700 (PDT)
MIME-Version: 1.0
References: <daaa71eea7fa0c4bdb70131d794ce8e5cee0e0c2.camel@infradead.org>
In-Reply-To: <daaa71eea7fa0c4bdb70131d794ce8e5cee0e0c2.camel@infradead.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Apr 2023 19:28:12 +0100
Message-ID: <CAFEAcA_-ejPodtPeaJb1xpS7aK1ApQtE1qdRU7L5aJO_XzgPZA@mail.gmail.com>
Subject: Re: [PATCH] hw/xen: Fix memory leak in libxenstore_open() for Xen
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 xen-devel <xen-devel@lists.xenproject.org>, 
 Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>, 
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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

On Tue, 4 Apr 2023 at 19:25, David Woodhouse <dwmw2@infradead.org> wrote:
>
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> There was a superfluous allocation of the XS handle, leading to it
> being leaked on both the error path and the success path (where it gets
> allocated again).
>
> Spotted by Coverity (CID 1508098).
>
> Fixes: ba2a92db1ff6 ("hw/xen: Add xenstore operations to allow redirection to internal emulation")
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  hw/xen/xen-operations.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/xen/xen-operations.c b/hw/xen/xen-operations.c
> index 4b78fbf4bd..3d213d28df 100644
> --- a/hw/xen/xen-operations.c
> +++ b/hw/xen/xen-operations.c
> @@ -287,7 +287,7 @@ static void watch_event(void *opaque)
>  static struct qemu_xs_handle *libxenstore_open(void)
>  {
>      struct xs_handle *xsh = xs_open(0);
> -    struct qemu_xs_handle *h = g_new0(struct qemu_xs_handle, 1);
> +    struct qemu_xs_handle *h;
>
>      if (!xsh) {
>          return NULL;
> --
> 2.34.1

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

