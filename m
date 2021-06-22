Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE493B0E83
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 22:20:29 +0200 (CEST)
Received: from localhost ([::1]:34096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvmsm-0005Zf-V0
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 16:20:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lvmrf-0004MS-Tf
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 16:19:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lvmre-0003JI-EX
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 16:19:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624393157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PhONQKPVzVnwtPBV9Bbu2us8C+O5LUVMJFkFjs0iWpw=;
 b=SpFWZ2ykdcAY4Bfoh8Ssb8W61NLZysNaxVga5VcI1Ti/qjtUKAgl7doS/kEcneJrrMrMub
 kQ0TI8KYq/LC4NkfEoRvMgfhfACpb1LRV70NwtWvmaB4USwtTD+SyGN1zCpGufaVKRsJRu
 /HQNZDBPPTB4lbLsCz6lItFhAxYcPAI=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-bM-fqL-TMW-MRN75uzOe5A-1; Tue, 22 Jun 2021 16:19:16 -0400
X-MC-Unique: bM-fqL-TMW-MRN75uzOe5A-1
Received: by mail-vs1-f71.google.com with SMTP id
 a13-20020a67eb0d0000b029025a1d69d58aso145107vso.1
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 13:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PhONQKPVzVnwtPBV9Bbu2us8C+O5LUVMJFkFjs0iWpw=;
 b=C8Xi3z4ck/hwwZvDpLXn/rDE/68e4PCV0K9whspM9VQGoB0+ArK60svDSP6FW00PNQ
 2+NeoTcq9FOom0a4PLyZAAF0yrN4Wn/O/tC0sSNCc8SKhKadQpnxmzXWItcqO2pSDE4V
 gPAyO8KPiQiBmtm/p3Cvioc/7enjJjF6saxTJVg8M+5ei3yDBJeO12jcm28S4m/NtRNI
 Os3mRXLuz7Rwd/2wZMdnpWpRGAcWcsWASZkOvGkd7d2//AvkdibCwzO6CyCJV4AMjIgg
 EVPyBr/AwKuc2cDfEKkTCIUQiqWwRibHoLEa3vpyr31JajRn6bek/AmegCpsfYmKe0j+
 CjAQ==
X-Gm-Message-State: AOAM530inmrVu18tGOqfNIjILWXdOmZp+SAtVdcYS1SJ6K+7nDvzN1kB
 CPKD6uqyjE+68pDQ5p27PwbGFRs3K2rjqKYkw2yiw79tfbWvFsBPp61JTHmiM3wkdbR7ixuKiYq
 vNN9c+JPHaAFywk0NOfSzhwsl1zS5XWQ=
X-Received: by 2002:ab0:3253:: with SMTP id r19mr827553uan.5.1624393155802;
 Tue, 22 Jun 2021 13:19:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhnQZWpkxGKWPQr6dJpHFrYORJc9cyKUgmIOj+htyJDgnE2oaeWyAajhlkk8DZKttD/rbZtEslfkrR252Y8vQ=
X-Received: by 2002:ab0:3253:: with SMTP id r19mr827531uan.5.1624393155608;
 Tue, 22 Jun 2021 13:19:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210430133414.39905-1-wainersm@redhat.com>
 <20210430133414.39905-8-wainersm@redhat.com>
In-Reply-To: <20210430133414.39905-8-wainersm@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 22 Jun 2021 17:18:49 -0300
Message-ID: <CAKJDGDbf420pNQ53UOHdF=Q7aF+CFL+3YEstc7k8=1zoBZcqxg@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] tests/acceptance: Handle cpu tag on
 x86_cpu_model_versions tests
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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

On Fri, Apr 30, 2021 at 10:35 AM Wainer dos Santos Moschetta
<wainersm@redhat.com> wrote:
>
> Some test cases on x86_cpu_model_versions.py are corner cases because they
> need to pass extra options to the -cpu argument. Once the avocado_qemu
> framework will set -cpu automatically, the value should be reset. This changed
> those tests so to call set_vm_arg() to overwrite the -cpu value.
>
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>  tests/acceptance/x86_cpu_model_versions.py | 40 +++++++++++++++++-----
>  1 file changed, 32 insertions(+), 8 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


