Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9DE350752
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 21:22:44 +0200 (CEST)
Received: from localhost ([::1]:35316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRgQM-00043t-Ps
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 15:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRgOM-0002yr-45
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 15:20:38 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:51936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRgOK-0005uS-CQ
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 15:20:37 -0400
Received: by mail-wm1-x332.google.com with SMTP id p19so10700369wmq.1
 for <qemu-devel@nongnu.org>; Wed, 31 Mar 2021 12:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=kzvDRDojxqYMcHddndzb7+t/d38gGYhYz6MzfArSfIs=;
 b=vj1Euq3ej4BX2Hnn7k+jWx47tbI+wbIzXC9cOBsnEjhk4L+nFGDhb8a71UpYoaQ8No
 0tJsICMqCdJXkqxLBbJ4tJvcb6l+d8okgE5Ugrz050VNKwBf0gi7I8kbro5lx8/CUWIk
 7NulQPHOPKPAMq2TarJ4M4JdcPkbDF+f35RHrJlWmXVfv2SXu7B3Bxpl1hxZ4tB9MXuB
 vHWHJW41jvhfFVhEz4LGGXR8+kpCUQ3AEdl4K0lrbng7gWYUxtnbWwmCG/JpuvvwIcYF
 N9LSt6YO7g/osLDpPiBC3R93FVIsMIUcBXigfVZvfJHf8aGJ58xYDM8e0kr0819OHdhI
 ugpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=kzvDRDojxqYMcHddndzb7+t/d38gGYhYz6MzfArSfIs=;
 b=GdU/YzwfRmmlg3Uv1StOMFnwEAxRlPfwQ7FdivrkzA3xQFO4Z5XQHxFTaRJ6rLAtMe
 N4usg3Yikn8e4iVuZbSUxyWHRhC940hmPgyhHtkTaSpLqUQEn8t/2r16y10TcizLVAG5
 oFLULElCegzP7QnbgSOsCBl5cpjqQ7vPuTip1ST0b4BfZWI9gPtBxKSBGl4dlxs8Kwwz
 0dm87qH6zosy+pGNUdEl5tZZE3j+Wn2UEA2+57Bv+0mfnfMLkPqaJh7O3yumcDOvMKZX
 eWlOQ/u/qUnsA9+4Bww1gJUDddn80yQCMFo76Sl5lZPMPQmyTZYOUGFq/X1wBD0ydn18
 3GTQ==
X-Gm-Message-State: AOAM530AtQSpr68EJWgwvmOhO9AKUxolzrxSGKR3VM2sLcsfLYTTcBjM
 qjczId0Ut4i5ot0ubGD4qXxAzQ==
X-Google-Smtp-Source: ABdhPJzfjM87pzI3+0UmkMQmAgdHtXlZjwbX37FWj2n/6fHWcZE8jI5sptFa/pFCTq112ea9OOtyhg==
X-Received: by 2002:a7b:c214:: with SMTP id x20mr4562618wmi.186.1617218433186; 
 Wed, 31 Mar 2021 12:20:33 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m11sm6201347wrz.40.2021.03.31.12.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 12:20:32 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5F0B61FF7E;
 Wed, 31 Mar 2021 20:20:31 +0100 (BST)
References: <20210331150527.14857-1-pbonzini@redhat.com>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] docs: Add a QEMU Code of Conduct and Conflict
 Resolution Policy document
Date: Wed, 31 Mar 2021 20:12:51 +0100
In-reply-to: <20210331150527.14857-1-pbonzini@redhat.com>
Message-ID: <87blaznn9c.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 berrange@redhat.com, qemu-devel@nongnu.org, agraf@csgraf.de,
 stefanha@redhat.com, afaerber@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

<snip>
> +
> +This isn't an exhaustive list of things that you can't do. Rather, take
> +it in the spirit in which it's intended=E2=80=94a guide to make it easie=
r to
> +be excellent to each other.

I think a colon might work better here:

  Rather, take it in the spirit in which it's intended: a guide to make it
  easier to be excellent to each other.

Other that that all looks good to me.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

