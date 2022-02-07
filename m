Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3AC4ACADD
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 22:07:24 +0100 (CET)
Received: from localhost ([::1]:41000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHBEJ-0005NK-G3
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 16:07:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nHBDF-0004ge-1h
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 16:06:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nHBD8-0008ER-OO
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 16:06:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644267960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eBpEG9w4cWeWp+NwbGE2gjSePs1ZBl86hMO6LWBKAOE=;
 b=Eb0exuHFc+64FaP/Awcs5FBK1GTILSVWsCxPgaAFliWxe0IFMZgA8PJghiiORcYcrcQ0MF
 c/0FDrl/hS7YMng93ifKBkUEfqgumWhKqyOkJFHxf3SckOx5GFTjXEgdHpg81ctAaHez8J
 hpCCMHBq5sG1ojtVX0Sw6jYkMpEfG9o=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-jvsxR7FCM-aUpsv1li-mwQ-1; Mon, 07 Feb 2022 16:05:58 -0500
X-MC-Unique: jvsxR7FCM-aUpsv1li-mwQ-1
Received: by mail-ua1-f70.google.com with SMTP id
 i47-20020ab015b2000000b0033bdcb385f5so8276538uae.12
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 13:05:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eBpEG9w4cWeWp+NwbGE2gjSePs1ZBl86hMO6LWBKAOE=;
 b=DbgAkWUv4urGTbxQOlVn8fSRCX7z0HjhnIvBYDe90TrnOPTEyAByS7o6qEdbP8EB1H
 R5diU62dEV8bcF3G0+NnT1zHpBdmM4WypkPM3hcmiDDk5XVg1lg80iFfT7YdUdRmz3iG
 bOFe1miPwUmA1A9r0DBZXw0uvpAy+SnuXSYmfag4ivWOVHlkODkENSS1mu9TtUyc7PFI
 1DYHw9/LRKUBEdbC/JZAD9ITzOJgV9VKCUB1nk7y4xOB+70DEsFf+q1PKZyxWmfPrGG9
 XmWeTywDXv4PPAvl+72nIVlaT6JVkQjg+xJiXxDrfZ77RmUDbr4pYI+b5k5vpxy2wWzj
 78SQ==
X-Gm-Message-State: AOAM532lUJP8NharQrQaqJjaBUqgy3AmKYIfAL8iWG2WDtIv60gkQ3xd
 b7MFwSLMuS/Zj28zW8DW+oIZZII7VCOt17gjmH4tzFF9/WtgB1SmPwsUOBtUoW1QVVPtHktphDv
 Ue0LHhCkj1+xkEcIfqjuAfhqD7qbTdlA=
X-Received: by 2002:a67:f70f:: with SMTP id m15mr545123vso.61.1644267958122;
 Mon, 07 Feb 2022 13:05:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxPX5+DaVMO8J5SkdFZKIsxhQHoDF3E6fhiUAg9OSpLyxGF2BOHek1bL9AlIuAddXLwDrdqR6qFpW6QxjSvLuA=
X-Received: by 2002:a67:f70f:: with SMTP id m15mr545118vso.61.1644267957915;
 Mon, 07 Feb 2022 13:05:57 -0800 (PST)
MIME-Version: 1.0
References: <20220128161157.36261-1-berrange@redhat.com>
In-Reply-To: <20220128161157.36261-1-berrange@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 7 Feb 2022 16:05:47 -0500
Message-ID: <CAFn=p-btgUv5WKGOj0GyyU17vsOWkBT4_Xu=vzxsL7FH1dbjhw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] python: a few improvements to qmp-shell
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 28, 2022 at 11:12 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> This makes the qmp-shell program a little more pleasant to use when you
> are just trying to spawn a throw-away QEMU process to query some info
> from.
>
> First it introduces a 'qmp-shell-wrap' command that takes a QEMU command
> line instead of QMP socket, and spawns QEMU automatically, so its life
> is tied to that of the shell.
>
> Second it adds ability to log QMP commands/responses to a file that can
> be queried with 'jq' to extract information. This is good for commands
> which return huge JSON docs.
>
> In v3:
>
>  - Add qmp-shell-wrap to setup.cfg entry points
>
> In v2:
>
>  - Unlink unix socket path on exit
>  - Fix default command name
>  - Deal with flake8/pylint warnings
>
> Daniel P. Berrang=C3=A9 (2):
>   python: introduce qmp-shell-wrap convenience tool
>   python: support recording QMP session to a file
>
>  python/qemu/aqmp/qmp_shell.py | 88 ++++++++++++++++++++++++++++++++---
>  python/setup.cfg              |  4 ++
>  scripts/qmp/qmp-shell-wrap    | 11 +++++
>  3 files changed, 96 insertions(+), 7 deletions(-)
>  create mode 100755 scripts/qmp/qmp-shell-wrap
>
> --
> 2.34.1
>
>

Great, thanks! I rebased patch 1/2 myself as a courtesy and have staged the=
se.

--js

(fwiw: using pip, it seems like the wrapper script works just fine. it
appears as though using 'python3 setup.py install' does indeed cause
issues here. I have a patch I'll send soon that discourages the direct
setup.py invocation to avoid frustration in the future.)


