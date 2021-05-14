Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3730380E81
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:57:14 +0200 (CEST)
Received: from localhost ([::1]:58612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhb7h-0001BG-W7
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:57:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lhay4-00085d-77
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:47:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lhay2-0006wf-LJ
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:47:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621010834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9us4rGDyAZZje/NYXqCdgVavKDSg9B1dkB2usKR0jdQ=;
 b=BL3oNw0APuc6yWnBhaIY0OAuwejHz65ow2OYjxaeur+yHdGkYxVSkJzT6pa/4yrDhYvACs
 oInfXALI4RddUXtLu8c01rFXAB0G13C+Zua1EZ9+JcAgHg7Vro3yRwNQzsFyhkofue5WiJ
 cXXUpbDVq0jcBN64A0DAzPfUO6X/44Q=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-I_uLWpEPMwuOunAOW2ZNvQ-1; Fri, 14 May 2021 12:47:12 -0400
X-MC-Unique: I_uLWpEPMwuOunAOW2ZNvQ-1
Received: by mail-vs1-f70.google.com with SMTP id
 i16-20020a67c2100000b0290227fd428db0so13138040vsj.10
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 09:47:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9us4rGDyAZZje/NYXqCdgVavKDSg9B1dkB2usKR0jdQ=;
 b=D73fy3aUlK4WAf4SL5lHVaHh3VpdgQJmjip3E28bCI2nm5yyyf23fgV6yFHyNylsrH
 B1LYWij4GBRJJGUQgVmb5wMDQ1cIZWswovUx8/1pxJdMTUMOKUaEfFSeRIrpc5Fy4UVK
 gnmM4rV7SctLJ8IcdernsJjhqOank/FE2cCfg/Z4qfUQaycTuUirJhQeYR5hAreULHnb
 uIYhTgDvoOGO2DCBG+3GjzKgydrb+zlFbGe7ga7Ni2kyzB9EgwG9zFXZAxvgNUU6cGhx
 tAe4mI8n0cAjyPZ3Z0sQZ5TYHQExPmPsvofszFX+TkBFEoHueL4r04XV+j5Xv9MrSEy2
 tn+A==
X-Gm-Message-State: AOAM532+N401r6dmnnoVnAtb9LN4pimHcVBk2zJtaIsoh71AVZ9CXKd9
 Lhz9lHA2QEiJOPKB4KE8LXyHARKYiaDqAO/LuuRJ78jalaA1gE+8JgJcGi6/3hcXA3gE4GRR/lW
 Vm+Wnk3F5wNV5GC+Bt0izRa4nBDJ0FJ0=
X-Received: by 2002:a05:6102:2f3:: with SMTP id
 j19mr2796829vsj.1.1621010832021; 
 Fri, 14 May 2021 09:47:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOarhG8/Ajzn66204o29u8ZWRM69ZrMhVIwf8CSCdRo4JxgTs/UYclhtlNSpc/INb5KKAJ9DpmbPf+sAfiMk4=
X-Received: by 2002:a05:6102:2f3:: with SMTP id
 j19mr2796804vsj.1.1621010831770; 
 Fri, 14 May 2021 09:47:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210514120415.1368922-1-berrange@redhat.com>
 <20210514120415.1368922-3-berrange@redhat.com>
In-Reply-To: <20210514120415.1368922-3-berrange@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 14 May 2021 13:46:45 -0300
Message-ID: <CAKJDGDZgv_JO54jweY14UhNr1wzLg8H70-B__qpCbUm+Vj3thA@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] patchew: move quick build job from CentOS 7 to
 CentOS 8 container
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 14, 2021 at 9:04 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> It has been over two years since RHEL-8 was released, and thus per the
> platform build policy, we no longer need to support RHEL-7 as a build
> target.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  .patchew.yml | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


