Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E41565668
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:03:52 +0200 (CEST)
Received: from localhost ([::1]:34930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Ljz-000699-T9
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:03:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8Leq-000267-AR
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:58:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8Leo-0007Sb-St
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:58:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656939510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MGNGu5LfWC2Q1iYFgVZc/q91DQF1pmTHBIAu1LGwG0o=;
 b=AfsXALKsMGDGGurfYR7rOwq66W1e6F08JZQlS20KqiQbexAUvty4RNHIOMkHfCuCiRM1g8
 2xc8xp0+CL2k2avghJ5yzNfuXcI0ucJK/OfXyWv3ZZhSBf23WJgPpObYl4BUMSQtJFi6eD
 Nd87fEro0+qUyImigEg4OooiMznrv6s=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-ko8tYQO9Pvy0sTvgceLZNg-1; Mon, 04 Jul 2022 08:58:29 -0400
X-MC-Unique: ko8tYQO9Pvy0sTvgceLZNg-1
Received: by mail-il1-f199.google.com with SMTP id
 h28-20020a056e021d9c00b002dc15a95f9cso894507ila.2
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 05:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MGNGu5LfWC2Q1iYFgVZc/q91DQF1pmTHBIAu1LGwG0o=;
 b=3NKzYOgvBIWH7uBNdaIxfuBxqwCJBokp2htDZ59EfQYOz0Fu8fJkUTlimTN7ckAtHf
 rgGFiNSXppzx5tgT2S5+KLpSM4Nz7wEtxwOqJrwNWXQEALr/2+X3sURMXsfsmPN+iNF6
 NjnViWaOW8gZAV2tIBLxpTMK+PufpryUi34qxUpcDRgdMCftw1OlazoTkcLn1cf62yoD
 pD7sem3DdYXSV7dU1C5JWa1AtBsJ4Ef9TrAgCzmjqRBQnMgp8nn5FIfRl3huPmnFiuiW
 2YjW3geD3MQCD07NW+JvryODPAQ8BpPt+Fi7ErT+VUydR5VwdbvXezD+jk3pqtHFQVAh
 vegg==
X-Gm-Message-State: AJIora8kqDKONxqPZDVUgN1NjoPcomahG4a5Qj+zlV3L1o0TZqgcLvhD
 dzMjlClinPpk/JiNYGGqTnFhqiKaEW5f7lScdjYhZs1QC7wBPFd6+AHy1Bu40p7sZDyPbbVQFuK
 4jXjFNIzf3u9w87E43OBZiM5j7FRmF2g=
X-Received: by 2002:a05:6e02:f92:b0:2da:6799:789 with SMTP id
 v18-20020a056e020f9200b002da67990789mr16742812ilo.3.1656939508564; 
 Mon, 04 Jul 2022 05:58:28 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vhgrR0dzsVMFibkxLKHSOAotivaNKp28cauKUKGafxhYCTmQ/cb30OmSbppN728a4ke7nKsJiHezxUJPbG98Q=
X-Received: by 2002:a05:6e02:f92:b0:2da:6799:789 with SMTP id
 v18-20020a056e020f9200b002da67990789mr16742801ilo.3.1656939508401; Mon, 04
 Jul 2022 05:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220509103019.215041-1-pbonzini@redhat.com>
 <20220509103019.215041-9-pbonzini@redhat.com>
In-Reply-To: <20220509103019.215041-9-pbonzini@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Mon, 4 Jul 2022 13:57:52 +0100
Message-ID: <CAELaAXxOskSoC_g=oX6eWLmnSNCMb3YmCDRHszc8BX22GG_yvQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/26] file-posix: add missing coroutine_fn annotations
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 9, 2022 at 11:54 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/file-posix.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Alberto Faria <afaria@redhat.com>


