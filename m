Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EE5565642
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 14:58:29 +0200 (CEST)
Received: from localhost ([::1]:55276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Lem-0000R2-Hd
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 08:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8Lc1-0007q3-Is
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:55:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8Lbx-0006xG-Kb
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 08:55:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656939331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BmA4sI4LySYkIV+GS00a5i7POUjFTXcWUym+RiceoVs=;
 b=WomAY9+rvCO2brTMpwjDYchABRITK3QbO+JAHGGPAkXFX1yjrbBVenAnn1N+jwW6AiIq5l
 n5xzGeT+9DOtoUtA5+5yN6FKkRDMOhElrnjkIU8v104xszqlhW4jBq6MRUH0dmbn90Agw3
 Vy67tdrNYaO5JkANi65VQPx9mXJBYr0=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-S3SXFTxFMTiYnithZAlAIA-1; Mon, 04 Jul 2022 08:55:30 -0400
X-MC-Unique: S3SXFTxFMTiYnithZAlAIA-1
Received: by mail-io1-f72.google.com with SMTP id
 u25-20020a6b4919000000b006729aaa1b68so5627556iob.21
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 05:55:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BmA4sI4LySYkIV+GS00a5i7POUjFTXcWUym+RiceoVs=;
 b=DZYd+UAHkPNP2MO7gJQZuM+C/bHjoWrPiJmthPLjJenrANZc0JiQ81OWa/E5q/3TZd
 OBa6zR1go8jqEQ99x8sj2l+1az17aSpN0UTT/v2KxhKzJu21LIb/Yfe1HfM1cEhjAQVx
 EYgn0dHcp7brQwsp8qgQkKFBF8R/cQSbKfbSnqVS/ZwmcjCgG/hzr56Ti/cY2NiawDmG
 Ped8aHjVtj3p/9HPF7bMtjUe1OKQoSaMjs1ecmSeggKBDXQ0vSQoVYlmVfmkY19aHFkk
 GkMksrfjTBNgKlhJ2E16AykpMaPjBClVgKpI5n4MZ8RldiqasdinMTlXDZDzHZrbWH9W
 stkw==
X-Gm-Message-State: AJIora95fGXdp7DUwxBsc2GSRbDnWhlbpXt9abGQuWDBFh93mFBVYEql
 7wLBVzeotSqtIp5B9eZvO6DBz1PZMzSbELXeqQ58DV2RigTmtpsReGlpih8wadFd0lDE15LqB38
 mob6Q2Ue9eBfme2BDi8uZs35P7m/SQIg=
X-Received: by 2002:a92:cda5:0:b0:2d9:5bc5:6661 with SMTP id
 g5-20020a92cda5000000b002d95bc56661mr17286714ild.16.1656939329592; 
 Mon, 04 Jul 2022 05:55:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vhDMFK2xthOVM17Zxt5/XGXVFr2fDKi09z/EBprXe4ew+LKaW2VGUEOGWnVEbXcd5/49f0NXQu4fUeOQZbSx8=
X-Received: by 2002:a92:cda5:0:b0:2d9:5bc5:6661 with SMTP id
 g5-20020a92cda5000000b002d95bc56661mr17286707ild.16.1656939329437; Mon, 04
 Jul 2022 05:55:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220509103019.215041-1-pbonzini@redhat.com>
 <20220509103019.215041-2-pbonzini@redhat.com>
In-Reply-To: <20220509103019.215041-2-pbonzini@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Mon, 4 Jul 2022 13:54:53 +0100
Message-ID: <CAELaAXyTqXK6oLmW_9PRn6NwPBhVF8W4LQF4N6p5xJp7Fd_7KQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/26] block: remove incorrect coroutine_fn annotations
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

On Mon, May 9, 2022 at 11:46 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
> This is incorrect because blk_pwritev_part() is called by
> blk_pwrite_zeroes() and blk_pwrite(), neither of which has to be called
> from a coroutine.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/block-backend.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Isn't this sort of justification the wrong way around?

Regardless:

Reviewed-by: Alberto Faria <afaria@redhat.com>


