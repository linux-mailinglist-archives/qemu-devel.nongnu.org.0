Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6375315C8
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 21:44:21 +0200 (CEST)
Received: from localhost ([::1]:58776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntDyW-000879-DY
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 15:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1ntDus-00044P-KX
 for qemu-devel@nongnu.org; Mon, 23 May 2022 15:40:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1ntDup-00033n-Di
 for qemu-devel@nongnu.org; Mon, 23 May 2022 15:40:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653334830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+yrXN+Zy3AJUQZquwTLs4hIkthi+JXoeK6JEZ2wqFsY=;
 b=fXMKc1EcV5o2TbD2rMX/GC4hiTBSUNRU9lXn+cxD5Uo2xT+WVs6o11ler0IsoOr/v17igU
 7oGCIEknSEKc8qzHZG8hw+qsOozDb6YBLAeEG169a2IKgPaZxcQr9pB/saHGoz9VrFrms/
 Ehwu8MMiGnVoN+oaJouZiWi3aqMlOQ4=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-VZTYUabmNEiQoO-CYf2R3w-1; Mon, 23 May 2022 15:40:29 -0400
X-MC-Unique: VZTYUabmNEiQoO-CYf2R3w-1
Received: by mail-io1-f69.google.com with SMTP id
 t1-20020a056602140100b0065393cc1dc3so8744336iov.5
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 12:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+yrXN+Zy3AJUQZquwTLs4hIkthi+JXoeK6JEZ2wqFsY=;
 b=7fVUeMyGlBG9EfSTlOFl63Fsp9uIwwh8yD4VrzNP+R0TK4rKTzhFUyMkZo44rMFk7A
 D255ZhYxd0R5T/KYLrdk8xJltrnEQA0PpwjX/ip3PomuqURgg3pX+v+JCnu+6xBvBbIg
 1IExZdjgJ0hNwpWvJurgw9R5bF4ocyzygGXf3QMqV6iVpdra8ZHVkeue3mMLjkafhG2O
 X2GGFgLW/oF6O0KzldIHIEb6KpwFEKCfWyVnzVx1fHjQBvQXTzH8Bnf8wfCxNJURVfKe
 BTMtQD1n74OmgeOYlZ+w0QA4q7ONAB2rcNrT8qqU7Y2QOzv8x8sgcVWC0deFC6Lp7+fR
 rbVA==
X-Gm-Message-State: AOAM531ducFvw/1bdzE9R4gChXhLXSu1COKS8ACEihHjsQSJVNQjclUt
 asL2WYMWU8ZptAVOG+Ae3PHrFDiz0iDBX3qYKgkzF9fKsreGxw8AvZXupPhDUtkduoJbl0xxWF+
 FEVAgHAa2+V7igl9ulPIFh46CVeFZGww=
X-Received: by 2002:a05:6638:2112:b0:32e:b930:8332 with SMTP id
 n18-20020a056638211200b0032eb9308332mr5209429jaj.129.1653334828590; 
 Mon, 23 May 2022 12:40:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTpP+aBJl1EI+H6aEhKSRUSkZa33a2fn6UXkBAFag+4dvj9wzCer0zgfTn8BQznv57qZ+btNrNnxEGHLfQkFQ=
X-Received: by 2002:a05:6638:2112:b0:32e:b930:8332 with SMTP id
 n18-20020a056638211200b0032eb9308332mr5209421jaj.129.1653334828423; Mon, 23
 May 2022 12:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220521122714.3837731-1-stefanha@redhat.com>
In-Reply-To: <20220521122714.3837731-1-stefanha@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Mon, 23 May 2022 20:39:52 +0100
Message-ID: <CAELaAXwMUYGgGa1cfEp67ECKRLAeeLJVT1c8LYSnzMcRUf6MAw@mail.gmail.com>
Subject: Re: [PATCH] block: drop unused bdrv_co_drain() API
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>, 
 Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
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

On Sat, May 21, 2022 at 1:27 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> bdrv_co_drain() has not been used since commit 9a0cec664eef ("mirror:
> use bdrv_drained_begin/bdrv_drained_end") in 2016. Remove it so there
> are fewer drain scenarios to worry about.
>
> Use bdrv_drained_begin()/bdrv_drained_end() instead. They are "mixed"
> functions that can be called from coroutine context. Unlike
> bdrv_co_drain(), these functions provide control of the length of the
> drained section, which is usually the right thing.
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Alberto Faria <afaria@redhat.com>


