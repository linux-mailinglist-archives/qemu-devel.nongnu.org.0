Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA885589F9
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 22:21:54 +0200 (CEST)
Received: from localhost ([::1]:48492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4TKr-0007sk-6m
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 16:21:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o4TJr-0006zQ-Dm
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 16:20:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o4TJm-0003TR-LJ
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 16:20:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656015645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h3+eg3WJ7fPMlLbYbl5p1/nEWBeCY9zAjgg3paAkfgs=;
 b=ZPtkyLav8musFx7qMDv8uc4gIDdfNte3wqt+nM9282sAhxAwGnF2UjZsKqeqgH1xsrIrgM
 Z0aShD6cNs/yzW64jQIOPXE/qHS3aYlpft+/tUEVBDeigw8zMxMlFxgjy8RWGELj29SLaD
 fXtOWEq0BQ45nL4bZ+H9w8aGhqzlni0=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-452-McBmsD0TODWqc4TgH_Xwpg-1; Thu, 23 Jun 2022 16:20:44 -0400
X-MC-Unique: McBmsD0TODWqc4TgH_Xwpg-1
Received: by mail-il1-f199.google.com with SMTP id
 i8-20020a056e020d8800b002d931252904so62325ilj.23
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 13:20:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h3+eg3WJ7fPMlLbYbl5p1/nEWBeCY9zAjgg3paAkfgs=;
 b=i+Yb5+EoTfmG/Rjc0A3ChiGLZSzM1J9ZKnkxmT+1bTkuoYj/JX6/0Bd1+TAX3KR3IL
 habv/i/WvQdxHgjAqSL3Q8WzhjL7I3801UK6Y6AyT/60ZYmwzzcOIFb+NtW0vw61MWgE
 5bPf18kRHq5RJeYDcdinbdwNKO4LH07ffXZzoCn6LdxqX5IbCNSiyLwDmaOrB1WJi9ab
 5CL71s9URyvkzdCnnLLFRZSqNh1Gx0mWOF3CcToYETzAqsRUFi6eCeiuu/OsBmbBa+L3
 7imEsVp1CWalmwzqtKOODPvzE0Pdl9DhZYtmGnYJ55pSHRV5pP9PRa2UubRQWgXZ3Pnc
 iKdQ==
X-Gm-Message-State: AJIora/fbREBXG6RwhuO3OIneqAuO4Lub703C9D8oyEctKOrsux9HgvB
 2siggl5RyTifLT9fklp8RgeW1/eW3ajGEf3PbtYw4qJneeF5GHCJrvTnhmhsnhUyML8b2caLkHK
 Wlkj26cteG+v67UOQeqYQqueeJed4TDc=
X-Received: by 2002:a05:6638:2605:b0:332:23c3:c4be with SMTP id
 m5-20020a056638260500b0033223c3c4bemr6193552jat.129.1656015643513; 
 Thu, 23 Jun 2022 13:20:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uSEJyIc5VWhjjIN/fpBQv99fQRc8ri6FwZUGw2mJnG2T2sH5MxHYMQioWkgRDDSIN5ZtMraJvPwKw3iS/9cx4=
X-Received: by 2002:a05:6638:2605:b0:332:23c3:c4be with SMTP id
 m5-20020a056638260500b0033223c3c4bemr6193531jat.129.1656015643346; Thu, 23
 Jun 2022 13:20:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220609152744.3891847-1-afaria@redhat.com>
In-Reply-To: <20220609152744.3891847-1-afaria@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Thu, 23 Jun 2022 21:20:07 +0100
Message-ID: <CAELaAXwNOCsrgFtxXhAvnU0RpY4p=wSedZXJ7YBf+w0usLZ5bw@mail.gmail.com>
Subject: Re: [PATCH v5 00/10] Implement bdrv_{pread, pwrite, pwrite_sync,
 pwrite_zeroes}() using generated_co_wrapper
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Ari Sundholm <ari@tuxera.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "Denis V. Lunev" <den@openvz.org>, Fam Zheng <fam@euphon.net>,
 Jeff Cody <codyprime@gmail.com>, 
 qemu-block@nongnu.org, Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, 
 Hanna Reitz <hreitz@redhat.com>, Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Jun 9, 2022 at 4:27 PM Alberto Faria <afaria@redhat.com> wrote:
> Start by making the interfaces of analogous non-coroutine and coroutine
> functions consistent with each other, then implement the non-coroutine
> ones using generated_co_wrapper.
>
> For the bdrv_pwrite_sync() case, also add the missing
> bdrv_co_pwrite_sync() function.

A gentle ping.


