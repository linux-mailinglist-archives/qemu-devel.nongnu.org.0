Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDB41FEF17
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jun 2020 11:57:55 +0200 (CEST)
Received: from localhost ([::1]:44940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlrIw-0007pu-7y
	for lists+qemu-devel@lfdr.de; Thu, 18 Jun 2020 05:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlrIB-0007P0-Hf
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 05:57:07 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:46820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlrI9-000871-Sa
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 05:57:07 -0400
Received: by mail-oi1-x232.google.com with SMTP id 25so4496631oiy.13
 for <qemu-devel@nongnu.org>; Thu, 18 Jun 2020 02:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gg2c5+CeYkgN8UC5n683/et1hcz2koYXIlS6PtlvFjI=;
 b=z4LvpdsBk1/eu0wZGgRr1QZtDAmDxTNmnYRvK9FQb8FNSloRxz595FpSPSrORrdqBs
 Sgr61SQgL+a/SFwBkoMh+n3z65TPpdYHmKAOlo6fWEmb47fpnXPgOH+HC5YPyKA+pr6a
 CQrmqizdhrkKP7VVaEzFThBveOplPSr3pswrl/89lQyvDlwUhPp1eXBZGWs6A7nIdohv
 fLSoW9tMYR/lXbt72GvPMPnp3M7htQqTfqgQyHR3zIkSoeIpIyrLDbQNwC0tr8AJyDRi
 q3dSPD0IS2DHGvXpT+nv0dAlflZsybF//sQFoTfx8KTRWBIEOPrSyiZa84LM9fnelwJ8
 qZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gg2c5+CeYkgN8UC5n683/et1hcz2koYXIlS6PtlvFjI=;
 b=byrzMciJYXQeMqZ6SHQElfY2UzqbKUjU9SDJ5Qg6sLh+XhrACDDaDfwkGr6MNzAUTf
 LZzYoc76frHeJJP49BK1zBb89dAgA8CrN7Nns6gzCACmYC7/Se25CDGOUvpHFaGtmhjZ
 2sHWTw2iosUdEp0Z60hscc/hRf5IFiN7Xa/dBfuqIVNtXFwGiyP1LbcstIK3257EzLNg
 UoK8sexrIStWGd6pQJlZdEGlCNw6Pj+hULoAa8d5RG8CcIY5VSagS0Jky1qcQuBzasgE
 sUawIKd1iVLXQG7bNd1VHVGIksN1ZUah27oSe7fznZYdp85wm2X+Rds50Mm1eRJmscui
 slWg==
X-Gm-Message-State: AOAM532NEtP+LAwUBofXY5+WWnk84qk9PmPFiAyGiYFs5UOwI8dVsWhY
 ZcfHd7EYQs7yFOda13yCRXVcnkzvZK3hN+7JI9VN0A==
X-Google-Smtp-Source: ABdhPJy/yethdqrFpijaxFE8fnjnT23rqh3je2ZnH4w9sMe2omApR802fHovouP12oAyva+BoheRlfwYVh7xsq67CTA=
X-Received: by 2002:aca:5152:: with SMTP id f79mr2121798oib.146.1592474224740; 
 Thu, 18 Jun 2020 02:57:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200616190942.24624-1-jsnow@redhat.com>
 <20200616190942.24624-2-jsnow@redhat.com>
In-Reply-To: <20200616190942.24624-2-jsnow@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jun 2020 10:56:53 +0100
Message-ID: <CAFEAcA_ZW+3jUrWKhF564j+DaPcKGKTct31cBoU0ZEnx2V7_xA@mail.gmail.com>
Subject: Re: [PATCH 1/1] configure: prefer python's sphinx module
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x232.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Libvirt <libvir-list@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Jun 2020 at 20:09, John Snow <jsnow@redhat.com> wrote:
> Using an explicit entry path script for sphinx can lead to confusing
> results: If the python binary belongs to a virtual environment, our
> configure script may still select a sphinx script that belongs to the
> system distribution packages.
>
> It is likely best to use python itself (whichever one the user provides)
> to resolve the sphinx script.

I'm not convinced. How do I find out which sphinx-build this
is actually going to use ? ("python3 -m sphinx" doesn't list a
path to anything.)

How do I use the system python but a venv sphinx-build? At the
moment I can easily do that with
  --sphinx-build=/home/petmay01/python-env/bin/sphinx-build
because scripts inside a venv have #! lines that make them
work without having to manually activate the venv. I don't
want to have to use some random non-system Python just
because I have a newer Sphinx.

Put another way, I don't think the fact that sphinx-build
happens to be implemented in Python means that we should
let the user's decision about which Python they want us to
use control which version of sphinx-build we should use.

thanks
-- PMM

