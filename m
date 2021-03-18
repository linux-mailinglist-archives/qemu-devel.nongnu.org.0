Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D813406FC
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 14:35:13 +0100 (CET)
Received: from localhost ([::1]:42576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMsnw-0004kX-CQ
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 09:35:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMslu-0003CY-H3
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 09:33:10 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:40594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMslr-000550-QN
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 09:33:06 -0400
Received: by mail-ej1-x62e.google.com with SMTP id u9so3976775ejj.7
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 06:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mrj9Jga67JjHUj5ICDa6OJ7q/AUrMjwh53x8lPKPrzo=;
 b=vRilAFu9Jg/tfiM6qqTpJ8kh79ZxZfNJtj4SezNZfaAPdYOIxJ3ldNDtwCB6aoTLAw
 ZY2mh59NIh/S4yEoK6nZn9sOstEKVxNNoyaAuZsCh1JlaBaCcL3pzCeSsEapQ7izun4M
 JgBixA+0bdl6xTZ7xJzu0umod2QXTCpNBnQ9+LMfQ+7lAzuwAJK1sPIbDxFpLiTmAZtw
 CsvDRO6/p908CHBdkeGH7w+RVCOgEDmdHK/m5qinDg6+nnEb9bdo/d1qXiounyMW+VTS
 vMqQtxfWjaBMYzl3aZd+04zBjUucVkcScj6rHMni+4Mb4HEK8W1zBNxe7OCPOJ/xzuc/
 MRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mrj9Jga67JjHUj5ICDa6OJ7q/AUrMjwh53x8lPKPrzo=;
 b=JoHby85QH5lo8nDY7HwsDLE2TGebyN+sL+NBWQwTYcFe++sD/cqopdVnRpGZzuP9ul
 Ytk/46cpZQi9LHvqwIlC4NFTNLpZ04LnDt2cJV6KUnvFoBkcV0BjB0uvFmbrsZ8mlkK1
 ZKG/Lsh8OLGt9s0jeqgDuaRri6o1OuuD4cZcTSdgtmlUU4kFweTxeiiNBr+X9yjG3viz
 V/U60KSRcp+ecyE9U76WahIdFCa+5W7WFh3p6TxJBeVfxCUOgW/ukmV93G626A2p9uzw
 df/72lffGjvgpsaq5OY3MJFXQ0upKLlBE1QgZHB+6Bwl1Li7qHOhavvG8jkYg4bs6uyb
 CvOQ==
X-Gm-Message-State: AOAM532Ax2Z5IPWHXuxHeQ1pSg3P55YeLUVpzxFxrpZp0TEihZHAiBO5
 UHi+8dlv7TXN7vz9QGcekHYBGatcDLoJaH2iHRzpHg==
X-Google-Smtp-Source: ABdhPJypsQpNT1iw0wrtkJ5YSC3r92h7tBs/Kk9DJQjgFBNIPYNlNe9joRc/r8QhpcGx5AStj0lGCJNp5ikcyRJr254=
X-Received: by 2002:a17:906:1ecc:: with SMTP id
 m12mr40670860ejj.4.1616074380887; 
 Thu, 18 Mar 2021 06:33:00 -0700 (PDT)
MIME-Version: 1.0
References: <87v99oiq13.fsf@dusky.pond.sub.org>
In-Reply-To: <87v99oiq13.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Mar 2021 13:32:36 +0000
Message-ID: <CAFEAcA8597jFxaNLdwEtM0Q9o6Wjx1JrGdeaePkkEDJz5-Y=ow@mail.gmail.com>
Subject: Re: Misleading configure failure GLIB_SIZEOF_SIZE_T
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Mar 2021 at 12:53, Markus Armbruster <armbru@redhat.com> wrote:
>
> I just ran into this failure:
>
>     $ ../configure --disable-tools --disable-system --static
>
>     ERROR: sizeof(size_t) doesn't match GLIB_SIZEOF_SIZE_T.
>            You probably need to set PKG_CONFIG_LIBDIR
>            to point to the right pkg-config files for your
>            build target

The interesting question here is why the earlier configure check:

write_c_skeleton;
if compile_object ; then
  : C compiler works ok
else
    error_exit "\"$cc\" either does not exist or does not work"
fi
if ! compile_prog ; then
    error_exit "\"$cc\" cannot build an executable (is your linker broken?)"
fi

didn't fail. That is deliberately early in configure in an attempt
to capture this kind of "the compiler can't link anything" case
before we get into specific feature testing.

thanks
-- PMM

