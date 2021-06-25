Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C403B48DF
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 20:42:51 +0200 (CEST)
Received: from localhost ([::1]:44492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwqmw-0003KA-JH
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 14:42:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lwqkU-0001aW-9M
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:40:19 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:33327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lwqkP-0000TY-PX
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:40:16 -0400
Received: by mail-ej1-x632.google.com with SMTP id bu12so16653052ejb.0
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 11:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=i6zdt7F7qzQmrdkzq5mgWKg7bzoWB5/8NlDbuE8eEug=;
 b=yDv/Vb/PhCtUlL/JZdWLeB1XmNykTRBo4+tlvkRB6BoT6e1ntVcRG2/kzQTazfkfih
 t2/VHtzQcyiLegBEQDyQlW0eDVslAI9z+oQsFOxciwOM+5YAu+1cd7vMzrHPUv/TLgMI
 RxBNwIbRZ1JoojdaKCQBeYgOXBEJgpkf1SKaM1dE4Hg219LFDsxW8rhDJkQVlk9U4b8E
 GKhZEvV7IPKWjpeADFNwcQw8jp2TQ934yDNtHV0gaiGdW2gvELNtIUFkISIh0QPtmpdY
 fINktzcoW7ApK72b/qf//zelRXVC/WsfBr3TXwEjadgl+XpnxftuHCsxE3t1EuGsw2OV
 VhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=i6zdt7F7qzQmrdkzq5mgWKg7bzoWB5/8NlDbuE8eEug=;
 b=TRWuu1yAzC//EKJ19cdw1PGNBkk3RvyEibRHUPqkw8Aq0RFFbStOBiFlYF8J9i1Aj2
 555ES+Ei55/uqnYybfMuv4vzXIQlNfvSnhHRJ/rEsjNBTFHi9T2k0kH+VcXLw9rysv8s
 yYzcOdnPkQD7pS2nzrcwbe0lVyWZsW4eYmQryx95X4xNnNKbA8c0TNUfLvDXy5hHnMDK
 /qkBEU4qJ5+rAuqcx9VJDAPvGSN+oPfF29DydcuCZLYYYt3dP8L9r+fJIjA2yA0doTAk
 WvUknTfMqygpyymlXcmNJsBkX8F4eI7C+uKrIAyLdnIA8h5QuvGoH7xC+zDo3hRI+7AC
 p95Q==
X-Gm-Message-State: AOAM532JJfFECd21x2yM0n4dkfcdDm4lrr8hmhAy74N316qXYROqBpI5
 L2qYJJKlGzex2/qoTlxfWlrDv53zVqM6kw9m7KRGhg==
X-Google-Smtp-Source: ABdhPJwqy0768mbp3oVPCDLQGSxL+eg59QdXeqmQxjdyPpqGVIPnUTGXsSDgxQbrFjRqBQA+AkcSema+QOnJJflL6/w=
X-Received: by 2002:a17:906:ce29:: with SMTP id
 sd9mr12723454ejb.56.1624646411798; 
 Fri, 25 Jun 2021 11:40:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210625091355.25673-1-alex.bennee@linaro.org>
In-Reply-To: <20210625091355.25673-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Jun 2021 19:39:35 +0100
Message-ID: <CAFEAcA8FWompYde5gUXqfm3sP8boNJgP8yQDh5wuTE54ap=UQg@mail.gmail.com>
Subject: Re: [PULL 0/7] misc fixes (docs, plugins, tests)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Jun 2021 at 10:14, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> ----------------------------------------------------------------
> A few miscellaneous fixes
>
>   - tweak tcg/kvm based GIC tests
>   - add header to MTTCG docs
>   - cleanup checkpatch handling
>   - GitLab feature and bug request templates
>   - symbol resolution helper for plugin API
>   - skip hppa/s390x signals test until fixes arrive
>
> ----------------------------------------------------------------

Since I applied this, the gitlab CI has gone green again, which is nice.
However, it also seems to now only be running the "external" Travis
job for "master", not on the pre-merge "staging":
https://gitlab.com/qemu-project/qemu/-/pipelines

Could we make it do it the other way around, so we can detect
Travis CI failures before pushing the merges to master ?

thanks
-- PMM

