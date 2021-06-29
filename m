Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5BD3B77A1
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 20:08:08 +0200 (CEST)
Received: from localhost ([::1]:43898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyI9X-0007v1-2L
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 14:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lyI8M-0006UH-EZ
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:06:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lyI8I-0003ju-H6
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:06:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624990008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nDyTIHOsCTVB1QBS7frmRCFlgW5Zi/4ipt0UEN4rgIs=;
 b=GZdajd0izLotKvXmM3oYNrC0q9HZ9LqNCkifFiEO5giSd9x/dna1w1Q7W29kQT27PJZ3zB
 91jEr5lIY7o7DWciTn+G5jHMAHmZqxOH0LbM9/aM8YQ+3Ku2+PTNhGqMK8ooA4bmusomw2
 FA7xWu3sY83xdNnwYEK+3yJCQAxG+YM=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-lHma1zuAMOGRl0bucgapTQ-1; Tue, 29 Jun 2021 14:06:46 -0400
X-MC-Unique: lHma1zuAMOGRl0bucgapTQ-1
Received: by mail-vk1-f198.google.com with SMTP id
 c133-20020a1f9a8b0000b0290253a84ca362so82204vke.6
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:06:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nDyTIHOsCTVB1QBS7frmRCFlgW5Zi/4ipt0UEN4rgIs=;
 b=EUDQR/qfWQpwbET5ytMlfjmXuyj65/ID9c+9+u5Ke9Dsj44c+V2V/fMXYUkhsbuhit
 b8jHQmfG9jT8m7CCxQTt293IUF2IdxAYhRDqMPAdB+Rut6y66+3tt5BbeyEGkKYw4E0V
 qrajcIvrR/bJ30bnhncNNMH7MOwl2e2oYXbfwrxDsqQL76hFFNdUW+sg8agf5+nepcz/
 pd5CUeTHd2bpL5BHTZxFclSWnzr52Zd/+msBB0trguWPWI+A1pB9SkMdbE2MwuB8w2qe
 0TzBzktUc2Xv44LiKqVJeX4kpiy/z9nMMK7eaqxIoQxtnPcCgyZ033BH0EN/CcuI+K2d
 az8w==
X-Gm-Message-State: AOAM532CU7e5Y4NCthf6y3A8AvjB/y+xlXwR6M+nT9vIXZ4eiGLmDoQD
 gePFiJNVZ9WyqTemIC71I+4NmgU/xhb8iZzk3pR3FJtukNNSFl68Jhe2IErTatIbjfZ6rU2bPF+
 agugwiRWY1n8AR7dY4lNGeO1f5u9/kdc=
X-Received: by 2002:a1f:280e:: with SMTP id o14mr23379403vko.19.1624990006087; 
 Tue, 29 Jun 2021 11:06:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxN1KvVXZ3IXkoe2XuVeQ/AcljANejzrwv7mC5FjR8L/ybV95JGF4zGd/ReaIdtekxt+y4Bmah7y+bS6Pzwc4o=
X-Received: by 2002:a1f:280e:: with SMTP id o14mr23379386vko.19.1624990005941; 
 Tue, 29 Jun 2021 11:06:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210629164253.1272763-1-jsnow@redhat.com>
 <20210629164253.1272763-9-jsnow@redhat.com>
In-Reply-To: <20210629164253.1272763-9-jsnow@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 29 Jun 2021 15:06:20 -0300
Message-ID: <CAKJDGDbrt+uzyY+G5WbE0iqXFDoVp1W8daVj53RD_2ZHm=_sfw@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] python: Fix .PHONY Make specifiers
To: John Snow <jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 29, 2021 at 1:43 PM John Snow <jsnow@redhat.com> wrote:
>
> I missed the 'check-tox' target. Add that, but split the large .PHONY
> specifier at the top into its component pieces and move them near the
> targets they describe so that they're much harder to forget to update.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/Makefile | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


