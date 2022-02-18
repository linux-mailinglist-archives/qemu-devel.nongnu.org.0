Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 200874BB132
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 06:19:39 +0100 (CET)
Received: from localhost ([::1]:42114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKvg9-00061c-Kl
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 00:19:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nKvfA-0005Lh-9N
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 00:18:36 -0500
Received: from [2a00:1450:4864:20::629] (port=45910
 helo=mail-ej1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nKvf8-0008A5-8t
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 00:18:36 -0500
Received: by mail-ej1-x629.google.com with SMTP id lw4so12283855ejb.12
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 21:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KdLEML2HOrp0wMbxtgoWIoLCpLMhdwH5tohyTCDkDSM=;
 b=d9NAi0c4+Tg8C7h2WgUQWaIHIx0ZbziNs7wTAvX4ep0iHS4vVBertfAf21edmI9FU8
 +/bs/03ASMZ+/xIWviyre6i+frNLtebC/j3CYZzpHIH/EfmoOLY7NyjWco3CEicLN1m8
 NbMrdW2Nu3tC2L8lB6Bp9T6lPs00TZnwvp+96HUWa7B3XedNCoGlk5468NjtW3nZMfAh
 asgThq4EKhIZ8mHNKFpon1My94c4GCr5dfPNODqBqHXngTa8bAAFzusSiS8h5muGMAsb
 oL2JK7VSYSfX7h2EiAVCq5RT/1s1u4SqyzQZJc/k/+9OzwJMrwH8SmU+IVD4g58QUj46
 y5WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KdLEML2HOrp0wMbxtgoWIoLCpLMhdwH5tohyTCDkDSM=;
 b=dcXB+9qoyEOwx6Ernsha6FIcDk90Ew6iXn5z0/PmShAUCLnqO+fdPNODHczGp+m7+w
 fLGaKg2WSIS7S6SVqGHmXn7PQc4XanXFVAYPbbLGI+NZqJ1EpXiTOgo+FeSxRrXPp2qd
 fxgK7A0RhbfKTfplpzzWJAgVY4DBJXU+75DJLBwpsOuewjhdO/eJjebxhCvJbRgCafGO
 3lhaIzdi7Cu5F+4LbZ6tkG4qqS/VuV2xBsV4kTk937glyvWxUC4iQ/jCx65GnwjWzMJz
 XvHhuDjOH3XXVUPrtJ5XqdwdaEc8s8Vc/snFO+v2AUzo1RPicv4Hn8BMjHUNmfTYc/ZY
 fjIg==
X-Gm-Message-State: AOAM533jc3ZCBH7UGBMjOINr4O4LvgdXBr8pGavXfktAOAwxmYacDJdc
 0k5278MPcfCVFWrXPye2Uf1yx0zFHOHCoSF0OiYC6Q==
X-Google-Smtp-Source: ABdhPJxlE8xvHvnKseKStVf0gdHS4ukh6hvv/0TPnwBUY+x6T+rE6mL4VWoL0p+IXKoOKtEsRem1PPJi5UHdgqRe9QA=
X-Received: by 2002:a17:906:a85:b0:6d0:827a:89d0 with SMTP id
 y5-20020a1709060a8500b006d0827a89d0mr3739684ejf.230.1645161512651; Thu, 17
 Feb 2022 21:18:32 -0800 (PST)
MIME-Version: 1.0
References: <20220207113129.2701722-1-ani@anisinha.ca>
 <20220207113129.2701722-3-ani@anisinha.ca>
 <20220214135054.2602fa82@redhat.com>
In-Reply-To: <20220214135054.2602fa82@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 18 Feb 2022 10:48:21 +0530
Message-ID: <CAARzgww21E5pJ=TgJ+iO9MwfYLMmkZJnWywtqhtZE5V1TWzKnw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] hw/smbios: fix table memory corruption with large
 memory vms
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::629
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::629;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x629.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 14, 2022 at 6:21 PM Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Mon,  7 Feb 2022 17:01:28 +0530
> Ani Sinha <ani@anisinha.ca> wrote:
>
> > With the current smbios table assignment code, we can have only 512 DIMM slots
> it's a bit confusing, since it's not DIMM slots in QEMU sense (we do not expose
> DIMM devices via SMBIOS/E820). So maybe clarify here that initial RAM is split
> into 16GB (with 'DIMM' type ) chunks/entries when it's described in SMBIOS table 17.
>
> > (each DIMM of 16 GiB in size) before tables 17 and 19 conflict with their
> > addresses.
>
> Are you sure it's addresses that are wrong?

I don't know why I had this pre conception of memory corruption and
overlapping addresses! Even the BZ says table handles overlap. Grr ...
doing too much multiplexing these days :(

