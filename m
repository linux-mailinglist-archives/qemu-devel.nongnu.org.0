Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D674A3ED0
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 09:46:17 +0100 (CET)
Received: from localhost ([::1]:59112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nESKG-0004bI-7A
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 03:46:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nES9C-0004qs-N7
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 03:34:50 -0500
Received: from [2a00:1450:4864:20::331] (port=38892
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nES98-0007h7-RC
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 03:34:48 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 o30-20020a05600c511e00b0034f4c3186f4so13073068wms.3
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 00:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VufAGFPD+GM93/hgPlHwyACHwx49ahOvAhIsjuIzI4Q=;
 b=ha0vNCtIgc5UVXybALYP2BlUycN2zvpGweuOjLQJSHYL0EEeFLkEuWxn6PZP7r7bQ3
 4L1Hb01PdCTKWLgmnq6jcZpqVUoTzkQHPJsdJeKZZPVW4Cu0oQsRPKdZ90YjZOkRw2K7
 RdjleRbmCAadeedojSybvreaiIf3FlP48vsOzsiegdBB2SiBbSsvbPbUVhAhsGi+1mPe
 xrX48o5JQ1Lt8WbJLVb6mAscxQQw3i+QRhU6ib6ZVjXgjtWyXonJsSa7S94jDmYiZzot
 scakq+oGFpAVfgAED4KG8pNiIb0eObaXHcVPCmsXw46BhHphhhYThmXO0xwaLwZuNkcF
 n6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VufAGFPD+GM93/hgPlHwyACHwx49ahOvAhIsjuIzI4Q=;
 b=ywQjtgpJsFk14IITQIt1/scBvXRMv1Qcy6I9W1f0e3UcThEpDXoWL2KkVLS0ScXUXm
 X5Wn4Yfs+eULiHbM3SIjuO0tXAExj7ZoEkstYLM3+wbcAhisY2q4EqsmjdH7IudyqsMh
 a4mXbg6Vn3o4/iYqpL3xsG+4Aw9CVhRa7tvdjEnBqq28tkVmxnzHlT9zZUk3Bbv+LJkE
 iAUldERZQQsNbgUETVkrI4guvl2q+D0E3FgiD7UKpBAih0twjO7n1h1bB58p7dzGB3MZ
 qi0qZx0m7Yo/wf09gElOMDci3LYjv3hGBkecuVb7rPXE4agUtOtvyk4FdYHD9E7wcQ95
 qInA==
X-Gm-Message-State: AOAM5324lVEAEjGRSRwmmYaick9fmqaMZkTJghEime9Dh4xy/VE9yVWV
 S5zfOeFEW87DkJJOlFkUqzrpPzjFcS4Cc8QZ8z6yvg==
X-Google-Smtp-Source: ABdhPJypUvPnXR5lAC7bywmApIq5FFlNbRf0yHpXrx/Im5n33oHY+p/Mb9sHHQShQj7HAOki7PZrR4e7Lkoxq49qNnI=
X-Received: by 2002:a05:600c:4fc7:: with SMTP id
 o7mr7203363wmq.184.1643618084517; 
 Mon, 31 Jan 2022 00:34:44 -0800 (PST)
MIME-Version: 1.0
References: <20220130235759.1378871-1-philipp.tomsich@vrull.eu>
 <a320b6f4-9e27-7e03-4e85-853028d6c110@linaro.org>
In-Reply-To: <a320b6f4-9e27-7e03-4e85-853028d6c110@linaro.org>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Mon, 31 Jan 2022 09:34:33 +0100
Message-ID: <CAAeLtUCGpLTP79pVk7jHzsp4-8eGpxy+2G_igiepksSA0Bg_HA@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] target/riscv: Add XVentanaCondOps and supporting
 infrastructure changes
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-wm1-x331.google.com
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
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 Greg Favor <gfavor@ventanamicro.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 31 Jan 2022 at 09:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 1/31/22 10:57, Philipp Tomsich wrote:
> >
> > In adding our first X-extension (i.e., vendor-defined) on RISC-V with
> > XVentanaCondOps, we need to add a few instructure improvements to make
> > it easier to add similar vendor-defined extensions in the future:
> > - refactor access to the cfg->ext_* fields by making a pointer to the
> >    cfg structure (as cfg_ptr) available via DisasContext
> > - add a table-based list of decoders to invoke, each being guarded by
> >    a guard/predicate-function, that can be used to either add vendor
> >    extensions, large extensions or override (by listing the decoder
> >    before the one for standard extensions) patterns to handle errata
> >
> >
> > Changes in v4:
> > - use a typedef into 'RISCVCPUConfig' (instead of the explicit
> >    'struct RISCVCPUConfig') to comply with the coding standard
> >    (as suggested in Richard's review of v3)
> > - add braces to comply with coding standard (as suggested by Richard)
> > - merge the two if-statements to reduce clutter after (now that the
> >    braces have been added)
>
>
> Pick up Reviewed-by tags where they're given.  Please go back and grab them from v3.


Thanks for spotting this.  Looks like patman picked those up only for
the first two patches.
I'll go back and add them by hand.

Philipp.

