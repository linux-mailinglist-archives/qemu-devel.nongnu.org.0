Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 855FB32B8BF
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 15:53:59 +0100 (CET)
Received: from localhost ([::1]:39112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHSsw-0003z5-K1
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 09:53:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lHSqD-0000aM-LW
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 09:51:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lHSqB-0003q4-G5
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 09:51:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614783066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ujKxzCP2s3X9+bROnhvx3lZEKXxAPWIFe8L99m/55ds=;
 b=jHQt0lnJ2vvcA+poovDe+nc+MYUitpveowJ60DTsSj1vxyIp7YTC5lP3C7bleRVH5+HDTv
 RDk1OaouhiKEJttjDfjsHbZte77zoZ+FTee0sZ6FVnw0j4+8ZopJZ2Y4bujCvWM2jDnn8g
 YOsl9K0qFpbHNSXoCO1t2Wp1p/BPgGg=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-RhiL1DpVOdKTu40kE_XHzg-1; Wed, 03 Mar 2021 09:51:05 -0500
X-MC-Unique: RhiL1DpVOdKTu40kE_XHzg-1
Received: by mail-vs1-f71.google.com with SMTP id u16so2809742vsp.10
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 06:51:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ujKxzCP2s3X9+bROnhvx3lZEKXxAPWIFe8L99m/55ds=;
 b=qQS/QWl0PdSGv8p6t1aUKoedi7v+3qVYYoIb8roVH2aqueoK4J4Ri26D0ncsbQnasb
 Ofo+8iwzO3fWCqlBPPgxnWa5hCdhXP1ekFS4jpNTPKCtWqubVV6W51vIfqMSPMqrNOx2
 FdtSLJ2ZlGLW7vyvCpf0xy0UZvI+olmHtR/qrpPewWmORzzOeycynbEQcDdmHtXepAhf
 l3iSPlk8o/6zMfTt95UX/W+axZ8oHXuFHpRDeKvKXX0iElckn2TLyHgqUdYkKF8t0l8H
 W2uRggMJIxqYG6t0yipJwPCl9fyb4xHTF8LgF0yEAWwwoLADl8oKwPPkLgP3q4P0D3lQ
 h5Gw==
X-Gm-Message-State: AOAM5337YqvK5RbUgh8lGDLSQaZJZJSFnVnpEt/MAaU9OXjyl3WLzibc
 SZjleuT27vW3J5fZLhCaxgc3szGVtU8HyGabkl8IURv2X8E8L9xVebPKCwHJ2UJvREDnqYzFz1N
 yiuo9BXxW7GeNIzyaVhovbr/e0/rhf28=
X-Received: by 2002:a05:6102:22db:: with SMTP id
 a27mr15597543vsh.1.1614783063711; 
 Wed, 03 Mar 2021 06:51:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvD7txnYQpoOvUtCpX2N3u6Qr0ZGotrPWUy4rs4G8B4Qt0+ADmzMC2f+K/y9ADY8v699GH/JKC9z66uDsUIwo=
X-Received: by 2002:a05:6102:22db:: with SMTP id
 a27mr15597537vsh.1.1614783063598; 
 Wed, 03 Mar 2021 06:51:03 -0800 (PST)
MIME-Version: 1.0
References: <20210303130646.1494015-1-philmd@redhat.com>
 <20210303130646.1494015-4-philmd@redhat.com>
In-Reply-To: <20210303130646.1494015-4-philmd@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 3 Mar 2021 11:50:37 -0300
Message-ID: <CAKJDGDY7YWDmp+4xd7q6a7Vf7MwiEKk=Q8fLge=YWLCP5ZEZcA@mail.gmail.com>
Subject: Re: [PATCH 3/3] docker: OpenSBI build job depends on OpenSBI container
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Richard W . M . Jones" <rjones@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 3, 2021 at 10:12 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Add missing dependency build-opensbi -> docker-opensbi.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  .gitlab-ci.d/opensbi.yml | 1 +
>  1 file changed, 1 insertion(+)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


