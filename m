Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 241703697FB
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 19:09:38 +0200 (CEST)
Received: from localhost ([::1]:40502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZzJB-0004Xo-7b
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 13:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lZzEm-00013b-1n
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 13:05:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lZzEk-0001QN-5i
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 13:05:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619197501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RoGxIx46aL6KvcyVr2wCqLZCtvc9w0SJVsLb7NOFs4U=;
 b=DxBocxkKZhUlWOK5R2LB1VrQMFJb4T9Y8rnVlPgv5eX0TunxXgTKqy47nrlxi1MRvOPyDO
 3O3TfM8O25m5cFUKQ/JAEk93szCi6SAdB6rwDfTbfXYxgrtgjShxclF6J+Ig1iAQkECcfx
 3/TFZ3wl6K0krINRIkkKDCQMLOSsAw0=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-Y_lHBhjKPPWACNhwcv1fbQ-1; Fri, 23 Apr 2021 13:04:59 -0400
X-MC-Unique: Y_lHBhjKPPWACNhwcv1fbQ-1
Received: by mail-vk1-f199.google.com with SMTP id
 4-20020a0561220884b02901d0e1d6a03cso8448685vkf.21
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 10:04:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RoGxIx46aL6KvcyVr2wCqLZCtvc9w0SJVsLb7NOFs4U=;
 b=RM2nPgIaxUvxufy8buCgk2dlwaQO3Dh2Dv5TYIVo4NKrYdla2ZuD6VWXRmyGN0rDae
 7DADazXYR8JQa/98FWq4VJK32009YFDdL1dbwl7odeVp4e9FYe201OwiQwtwWIooyGdb
 Y8oafOl7O3RDbP+nsebNx2WDaM17Fb3Lod4VtTyB1vD4Sc5RZXaXEsitB4VVpVyCxaK8
 b8Ex/MFItSlXxIty1LZP2ZU6zTO3DTnzJ0KfXVgedaLLU+oEDSq/1wLOFt3greXkbTnq
 DmGTHkvjnKlkxIrEN46uzYse6eeHhBJs40uG/qf3Ha5qpDqV2toJZXWwuVwHMNp9BUkm
 61eg==
X-Gm-Message-State: AOAM533JfmnHvfsKCdbJpBwOetBAViq1w8UzqZyUBWHvTOtyBhL+mCBo
 2eVc+IVhS8FiqWPd6kBn4xopNthl0yEYH/UXJs3ADIKBRq/taLV9v/at9fL80et4pQ1r3pe2MSo
 yIKz4ru6Tqa1aaEJy+XoP8BIX0itP8zs=
X-Received: by 2002:a67:ee0a:: with SMTP id f10mr4498055vsp.50.1619197497819; 
 Fri, 23 Apr 2021 10:04:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/BOsgvgyy/but8TDBdyfZYYxmWoMi+aMfnD9FgaHUk1E6f6+xO8EeptNZ3YBJfTgLviKNfwe6VYrk+pR66/g=
X-Received: by 2002:a67:ee0a:: with SMTP id f10mr4498025vsp.50.1619197497669; 
 Fri, 23 Apr 2021 10:04:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210408195237.3489296-1-wainersm@redhat.com>
 <20210408195237.3489296-5-wainersm@redhat.com>
In-Reply-To: <20210408195237.3489296-5-wainersm@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 23 Apr 2021 14:04:31 -0300
Message-ID: <CAKJDGDZBgPRXSJHbce5Mfap895KrV9pciar+taYGZd1mE9wLGw@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] tests/acceptance: Tagging tests with "cpu:VALUE"
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Philippe Mathieu Daude <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Cleber Rosa Junior <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 8, 2021 at 4:59 PM Wainer dos Santos Moschetta
<wainersm@redhat.com> wrote:
>
> The existing tests which are passing "-cpu VALUE" argument to the vm object
> are now properly "cpu:VALUE" tagged, so letting the avocado_qemu framework to
> handle that automatically.
>
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>  tests/acceptance/boot_linux_console.py   | 16 +++++++++-------
>  tests/acceptance/pc_cpu_hotplug_props.py |  2 +-
>  tests/acceptance/replay_kernel.py        |  9 ++++++---
>  tests/acceptance/virtio-gpu.py           |  4 ++--
>  4 files changed, 18 insertions(+), 13 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


