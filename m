Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AC8278F4A
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Sep 2020 19:04:12 +0200 (CEST)
Received: from localhost ([::1]:47354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLr8l-0005h9-Q4
	for lists+qemu-devel@lfdr.de; Fri, 25 Sep 2020 13:04:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kLr6x-0004Ow-6Y
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 13:02:20 -0400
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:37804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kLr6t-0003zQ-Vi
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 13:02:18 -0400
Received: by mail-ej1-x643.google.com with SMTP id nw23so4596932ejb.4
 for <qemu-devel@nongnu.org>; Fri, 25 Sep 2020 10:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jp+FkEBxc7lOHaDnUcAjTB2/DZWhb7+IP1xpb0PPxEQ=;
 b=c1C+RhBL6leXsX+Jw/VMvBEAjxnnom+p/GxOURXjr0kefvroAo52uRKn8JB3O3hjjs
 /m4MjrdXrvNw2QrQrHA5tE/TiREf5WkdB5YxbhJa6zrInGcAPwITsAHQhIYE967uIORF
 WAJqcpIIybZc+24zDeHAQowwyEuAAQwQRfSocnIxbDHa3NzjXf5FlcDzbTxPwoIZuoA1
 arEvZsaIHhGDBjVP4dKcsUWNtNc2GWBq3BMyrTOzQn0ZPeqPUBqwRk9OEZoW+hxk7EKA
 aQxscYa3GBwXYop6VXNrgRJoS19nEdT1RPp53jqAxbOIdzJaXSXzzS9cp+bmnOX+owBl
 O7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jp+FkEBxc7lOHaDnUcAjTB2/DZWhb7+IP1xpb0PPxEQ=;
 b=c5hg9DFpcExxkyoOBQiPIfnNHUf+wCBJvHVnm14zIkQiOS0iuFqIQW3a6vgat6IrEz
 SpcP2sAidC79ugoao7oqgl+39WTp3210DNV8xC3h407vGIlRq19iIOLUTLhBy2TtA2pC
 6b3Zd4wsaDugcDAaZXllJh2i9PsYauGjGX0MpvmZ8uhIOlpeyrLn3Vj48KtwROnNtVaO
 Fn7RqC4tE9VdX30jZTINAP6DopA7FW67kVr7SiGfgJCw8K6HOvIJS0oNgs6fuk5Vr4yB
 PY8advd8Q2o0b3CKhUR3bczxOoLyBGkTn2ODBSf7IY6gFcFDsfoyFRSYYj6nxOXwUru/
 bDuQ==
X-Gm-Message-State: AOAM533NGovt2mXL8JlA6SSANkfQruwQ4ww9aAa4+qWZ+NzzrGqzAqsw
 YB+I0TBtkANpadhwCP5jiyHbDKjmIhywFv9Mj/2yZg==
X-Google-Smtp-Source: ABdhPJwnz+Ggrc8nzV0pq+AYPsf9uVkwJj6qVXzmN2RwYSl6arx1VuVlmoCQilPIh61ccf1daUURaGKWsOg1KdoKBdE=
X-Received: by 2002:a17:906:1f42:: with SMTP id
 d2mr3527326ejk.407.1601053331286; 
 Fri, 25 Sep 2020 10:02:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200925162316.21205-1-peter.maydell@linaro.org>
 <5d9726b1-e4f7-f9a3-02ca-9f893925c6ce@redhat.com>
In-Reply-To: <5d9726b1-e4f7-f9a3-02ca-9f893925c6ce@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Sep 2020 18:02:00 +0100
Message-ID: <CAFEAcA_yZ8D6SsryA_ZEFdKDXxHAFE3gD6+LUzDKSbzXwY_W1A@mail.gmail.com>
Subject: Re: [PATCH v6 00/21] Convert QAPI doc comments to generate rST
 instead of texinfo
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Sep 2020 at 17:54, John Snow <jsnow@redhat.com> wrote:
>
> On 9/25/20 12:22 PM, Peter Maydell wrote:
> >   * although there are HTML anchors on all the command/object/etc
> >     headings, they are not stable but just serial-number based
> >     tags like '#qapidoc-35', so not suitable for trying to link
> >     to from other parts of the docs
>
> I suppose this answers my question if qmp commands were going to be able
> to be cross-referenced yet.
>
> I'd love to get that working so I can make smart references in the
> bitmaps doc.
>
> We could even amend the QMP code parser to insert cross-references to
> the function names, which would be *extremely* slick.

If you'd like to have a closer look into Sphinx's indexing
support, be my guest :-)

-- PMM

