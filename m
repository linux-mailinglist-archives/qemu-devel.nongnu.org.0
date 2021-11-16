Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 556A7453223
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 13:27:17 +0100 (CET)
Received: from localhost ([::1]:55842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmxYS-00043u-1I
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 07:27:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mmxUI-0002w3-Sw
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 07:23:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mmxU2-00009c-Vz
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 07:22:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637065362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UaBb1InIDjVr5g5+kMhwX62RfwJHUit7FwvSrMDTslQ=;
 b=IL9/kT1bnXqDVoPJGHmSdzAbBXpg2poFl2yD1fG/VYxpdX8GDgCm35eLhgqotf/oj7qwws
 e4Bz9pyvlv6mD3aZ3ZsGC3FHXL7W1VZ5kwM0rDWT+4yVQ+afvcFpK25mcTxcpg8qE4JGtx
 cctCx/6K2y7z087u6ysrFxF3yMLXj/s=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-sl1flfQSOB2PhJMCFiTHyQ-1; Tue, 16 Nov 2021 07:22:41 -0500
X-MC-Unique: sl1flfQSOB2PhJMCFiTHyQ-1
Received: by mail-pf1-f200.google.com with SMTP id
 a127-20020a627f85000000b0047feae4a8d9so11651152pfd.19
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 04:22:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UaBb1InIDjVr5g5+kMhwX62RfwJHUit7FwvSrMDTslQ=;
 b=wEXc3b74Mshm7UTv1EEVz34iYkSIgcn4EiugT7pJpqywmK4muyLnSG5WrhsNnQXVvX
 oKtN6mRShJ0e9m2AYTT96rZ5kAwV6fwDatfXVqNE76yoiDwyMFzSHOs0gMhe+HbTaCSi
 QOmBnDZ5e9G0Gd3V+0caMrBiPZxghME9H1dEp5AVBNhN9aDRb2Jj0lif/pLZ2ArA0o9P
 Hk/8FxXZrFBPTHSBoyuwzXirYatD4h7FEsdl5cYQkulxVOp/yIcRoMGnm0ByhdMqrfVO
 SP5+b0076cqQPQ2SKhHkcvBFibEtTD7MdFbQDC1P3yj/xnNcFOiM6IIOSyLYgxpE+JVs
 vksA==
X-Gm-Message-State: AOAM531CtmbzrmgSW4DpNEiLA6uXfYjy1w4uoEUkyhM8PW8Y7MZvwhPA
 hG6JKJCZiS1ssDcxjfadljZLfYDSUuQkoopjR24EPDV9UA651zzObK5bz5M93jIxMsNP6hEAei3
 8TShA85/Cq+xVSKDIURLt6fo1WelPd9c=
X-Received: by 2002:a65:6a47:: with SMTP id o7mr4383042pgu.439.1637065359936; 
 Tue, 16 Nov 2021 04:22:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJziCSuLZhCyflpytl62mHZsVVtN7NprPfUcd/N+EWYtiZDzeXqECv3jZgGv/VZCajQ42TUevmdgseiWN+EmbTg=
X-Received: by 2002:a65:6a47:: with SMTP id o7mr4383018pgu.439.1637065359661; 
 Tue, 16 Nov 2021 04:22:39 -0800 (PST)
MIME-Version: 1.0
References: <20211115142915.3797652-1-alex.bennee@linaro.org>
 <20211115142915.3797652-3-alex.bennee@linaro.org>
In-Reply-To: <20211115142915.3797652-3-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 16 Nov 2021 09:22:13 -0300
Message-ID: <CAKJDGDbRBE7qkbRAMVTK_w44ckC+681wmJtzNvwA9iUQqxiWFA@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] tests/vm: sort the special variable list
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 15, 2021 at 11:29 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>
> Making the list alphabetical makes it easier to find the config option
> you are looking for.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  tests/vm/Makefile.include | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


