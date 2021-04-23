Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 737F73699D3
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 20:37:13 +0200 (CEST)
Received: from localhost ([::1]:43930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la0fw-0000YD-24
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 14:37:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1la0ej-00007l-UP
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 14:36:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1la0eh-0007oz-KH
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 14:35:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619202954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ulrJYRB4SCIhftYhwy43HYFe7d6LQx08Fxzim/VMkLc=;
 b=hBTrkAQldrhjGFohdgD0Y2HTofambCHQHo1BLLeSNzHPFwlI0EVxkeD96aHIwpZu7MmA+d
 YuUtZjjbbXMv+eSV5WA3852PogL46OvkFiiUzJtgrAipcAwxk9SjqiLcJs6cqri4LkT/HQ
 XsG+oHVKjw2yjgs0GbET8MvTJl6/eiM=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-MSL_XdELPXejLnKwKhYW3A-1; Fri, 23 Apr 2021 14:35:52 -0400
X-MC-Unique: MSL_XdELPXejLnKwKhYW3A-1
Received: by mail-vk1-f197.google.com with SMTP id
 d76-20020a1f364f0000b02901d17a7dfce5so8556850vka.3
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 11:35:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ulrJYRB4SCIhftYhwy43HYFe7d6LQx08Fxzim/VMkLc=;
 b=kxBi8YahLFJmOrQ3HInMucekqOvnFhL3Ldo8fKVGH43BsMVKJKcdOWc4MacLvezlPv
 6x2Yz47vhnvABDcL+YXUkStYZwamPcEPL69AFdzcEU6o0eC7VQIc2acHXkJF/uO60mt/
 1uiDAOnBV4FQxhAQuuC+WqJp2KUgwjv/E58W7Xrm+Yrwtpd+yPemJVL5XorpqSDlFs0Q
 437E8ervBA48ZaZ26dzAw2Rsp2Xkc/D1ZbrMNfFWovLShPT3Ts3gV/+FMsx3q5u1EuqM
 TJMhu0JKMpjo0qAS0u8ljgnAObHFJpDgsrXwEzcRKcmqXwbK+thrXaFTaxwHJisfTLbL
 xOUA==
X-Gm-Message-State: AOAM532fje4ecd1vNg1kOkq6k+huTC/VEOhcFnBCdd97DrnvW4mtzgCL
 brk1rciD76wBPYcZCexMX4LIDi98craA+2+IB8P47ji1EL7jtN5PfBgUIdtYdDVQpv1JTgQhFOF
 EDmHfU6qCWWAEji9TDZqAntik1m2OcxM=
X-Received: by 2002:a67:27c2:: with SMTP id n185mr5296628vsn.39.1619202951958; 
 Fri, 23 Apr 2021 11:35:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFkGQo2fRuGLezpJOlQgZ/ZiQvpS0V71Aqm/FzCFrcbOlkwBHXUyoFQuqQN7XIpl+CivMB4fLYt5TwLjbCdG8=
X-Received: by 2002:a67:27c2:: with SMTP id n185mr5296597vsn.39.1619202951767; 
 Fri, 23 Apr 2021 11:35:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210419145435.14083-1-alex.bennee@linaro.org>
 <20210419145435.14083-5-alex.bennee@linaro.org>
In-Reply-To: <20210419145435.14083-5-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 23 Apr 2021 15:35:25 -0300
Message-ID: <CAKJDGDaAYBZ+pLMXaDOzSyO=zXDfYxLfA_d2S-PfSo5X-2X1Mg@mail.gmail.com>
Subject: Re: [PATCH v1 04/25] tests/docker: allow "update" to add the current
 user
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
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
 Daniel Berrange <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 19, 2021 at 11:54 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>
> The current user functionality is used for cross compiling to avoid
> complications with permissions when building test programs. However
> for images that come from the registry we still need the ability to
> add the user after the fact.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  tests/docker/docker.py | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


