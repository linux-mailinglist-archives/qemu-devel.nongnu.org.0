Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDE252A544
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 16:52:36 +0200 (CEST)
Received: from localhost ([::1]:51580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqyYs-000801-TE
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 10:52:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nqyW4-0005jr-BZ
 for qemu-devel@nongnu.org; Tue, 17 May 2022 10:49:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nqyW1-0003Rc-QT
 for qemu-devel@nongnu.org; Tue, 17 May 2022 10:49:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652798976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K2rmzT0HL46Gl3JoBbPKoEp8Zvd/CJMZUcvYI+Regj0=;
 b=G0mL/JxLSkJga0aD8A6vYyHEZVu1KpafSsrUyEOMFd0cBg6xHFDHbZwN/BFJNPk0T433Ps
 gYc2K2bIapZvBhFoK2UyxT7nDnoI6uFxNECEGhQZDKz998NQMErthh9X7kBIj0DOWWNwZF
 RGGg06bT5WoOW37iMRjAEeIZP9euROY=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-81-XyjdWMu2OMSFSP5bc1deQg-1; Tue, 17 May 2022 10:49:35 -0400
X-MC-Unique: XyjdWMu2OMSFSP5bc1deQg-1
Received: by mail-io1-f71.google.com with SMTP id
 n5-20020a056602340500b0065a9f426e7aso12578296ioz.0
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 07:49:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K2rmzT0HL46Gl3JoBbPKoEp8Zvd/CJMZUcvYI+Regj0=;
 b=5G/eqJweLVPhxUPxD6UaBp3N2JofRQZpq24lAs7EjhMgBnyVFNztYDcFrmewdEQLzp
 q8+dgDC32raEgr45ZAbXSxFcZCIriu5W8vVo8MuBfQICj3VIkMgln4Is24KQ6sZd82L8
 4ehyjF2+8JPH5/zDKFrbjQ4k4uDRVXGGNJJi1m+EvAPVmrG3ct+2nJ6wMzmPgSaoVOgT
 chakcT0HJE63jKmEWMoChK4rTzsaIT7eAczYnITC0c9WYFXJtOTlv9dLrVOwx55mhb2Z
 Nx/1bMjJUhoSS2C+ZE9H8e2N5CRgF+NqXKTZHYGBHEe0efYhWKZhCopPFUdGBNQW9r/G
 WlDw==
X-Gm-Message-State: AOAM532f42jGHYkltnSBIOLHsnv5Z4btbQWiQhD25eQhMEgYlV/BXPt5
 RqyXSOYd871d83COu4tWzIVyltsk5q2njPWWcKSyp7bEJQtdq8+glH2wdPVq0C5yrIS1d2lweAC
 hJ5gOe/CZeMwflkNd4yG3pmxUTj3i+e0=
X-Received: by 2002:a05:6638:33a1:b0:32b:8e2b:f9ba with SMTP id
 h33-20020a05663833a100b0032b8e2bf9bamr12096402jav.93.1652798974902; 
 Tue, 17 May 2022 07:49:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyO2yG4v9ezGr5i1SMszvzLzmF3BNLFIrKWhTjGolmpgN4TezNMX2w4sP+0J385A6opHwRfQNKgAZJE33PHYI4=
X-Received: by 2002:a05:6638:33a1:b0:32b:8e2b:f9ba with SMTP id
 h33-20020a05663833a100b0032b8e2bf9bamr12096393jav.93.1652798974754; Tue, 17
 May 2022 07:49:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220513155418.2486450-1-afaria@redhat.com>
 <20220513155749.2488070-4-afaria@redhat.com>
 <20220517143221.3vzwjierhnl4wx4x@redhat.com>
In-Reply-To: <20220517143221.3vzwjierhnl4wx4x@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Tue, 17 May 2022 15:48:59 +0100
Message-ID: <CAELaAXzG6z1fBs-B3PqoO=HZkb+Z-Umdj5+KKRnhHmdt3nV9WA@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] block: Make 'bytes' param of bdrv_co_{pread,
 pwrite, preadv, pwritev}() an int64_t
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Tue, May 17, 2022 at 3:33 PM Eric Blake <eblake@redhat.com> wrote:
> ...now end up calling QEMU_IOVEC_INIT_BUF() which tries to do
> .local_iov.iov_len = bytes, which can silently overflow on 32-bit
> platforms where iov_len is size_t.  We need to add a code guard that
> callers do not pass in too large of a buffer.

I see. blk_co_pread() and blk_co_pwrite() use assert(bytes <=
SIZE_MAX). Would that be an appropriate safeguard here? Or should we
return an error?

Alberto


