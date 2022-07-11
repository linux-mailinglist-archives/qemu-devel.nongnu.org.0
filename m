Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EB556FEFF
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 12:34:56 +0200 (CEST)
Received: from localhost ([::1]:59766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAqkh-0006US-0A
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 06:34:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAqj8-0004hE-8I
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 06:33:18 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:34691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAqj5-0004A6-N2
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 06:33:17 -0400
Received: by mail-yb1-xb34.google.com with SMTP id i14so8024051yba.1
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 03:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FdC53yO37zD5qgAcUvcbvlIBc7qIgE7WCh8mPqhdEMI=;
 b=RMchPDJw5swYKEDw6SLgRlnFqp3HtqBFlz2JJwF8a90FJFxAiby+WbROgNxE659QnF
 pEx53jDXNbALnpS4PF2M5ILav2bPaZ/yafRyoG2RgwCVIJAy076sJi6A7+/PxmWQgDh1
 xSKj9qrojudvA3HSB+c0KsbXHcruRUkBQwxBiWl3nv9tO1L8SvAp+XySjVyBwZ04L4uC
 yJTyv8YoSoW6GApMMljPnSERNBKxNlhs3sSg2+9hm3ni70eJC5YqcSsAy1tTKKRo06Kh
 2B9/JE2ECDWTp/IrGH5abkwo9WJLWh+gmsDpXk+vUCUDYuoeQwpGz/vQe+yGjYvOgkYu
 H6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FdC53yO37zD5qgAcUvcbvlIBc7qIgE7WCh8mPqhdEMI=;
 b=It4kvjLPiOaxV0BY5hBsdasMB1cAa28sjegBmDUufmh70iikLaLVffNZguIyKXLV56
 kHqDuMZhFEbZa7h8+tJQ40zO4NT0P7rTBhEfkBoh14yx4TFzUlrxIkzBAIlHB6HB2w31
 ZOBp2rH9EzNQ7YzxLKoISIGgm+4SSdtp5m/ACYFarNU8YGp4JJbduZBWCxNoq0gUG5Ab
 LpeVf5p5nbUddkFw6ZCFIYmvN/4DMnqPOpOIm5SvRaG1tBjETLict41mOvqGRjGrNmt3
 q4wbXouXcfIrQ15ysEMbG2Zfcycy6idYqQ6ztjIooAHY5x/cvWkLg9HJzp8SSozvQIQ0
 cbFA==
X-Gm-Message-State: AJIora/cdviNdjR9aE4vatpoNO1ifj95RPhHBf0PCYQJM+2KLJtexv+c
 aBr7/U1d12G83xHOZ13C51lL7HlQNWskQ1PODs83kw==
X-Google-Smtp-Source: AGRyM1sLTqqiRAq5mi0xNMYmWO2dZtRPZyVoS7oxmOCNs+uziL+XfjCrOa30Z8Cb97mK9fmApHLXBjJIIEE9uX5ir/I=
X-Received: by 2002:a25:bfc7:0:b0:66f:563c:d2e7 with SMTP id
 q7-20020a25bfc7000000b0066f563cd2e7mr1032517ybm.288.1657535594516; Mon, 11
 Jul 2022 03:33:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220705095421.2455041-1-armbru@redhat.com>
 <87wncqmq2t.fsf@pond.sub.org> <YsgOhJLpbyODJCGG@redhat.com>
In-Reply-To: <YsgOhJLpbyODJCGG@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Jul 2022 11:32:35 +0100
Message-ID: <CAFEAcA_pA_K=06chM9xwS8BzK2W6v0g5S5Vr_=YT1A9xqX+tfw@mail.gmail.com>
Subject: Re: [RFC PATCH] qobject: Rewrite implementation of QDict for in-order
 traversal
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 kwolf@redhat.com, hreitz@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri, 8 Jul 2022 at 12:01, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
> What alternative options do we have for addressing this scenario.
>
> I can think of
>
>   - Auto-create array elements, if seeing an element set before length.
>
>     This is based on the theory that 'len-PROP' field is largely
>     redundant. It is only needed if you want to create a sparse
>     array, with empty elements /after/ the last one explicitly
>     set, or if you want to get error reporting for an app setting
>     element 3 after saying it wanted a 2 element list. IMHO the
>     error reporting benefit is dubious, because the error scenario
>     only exists because we made the app set this redundant 'len-PROP'
>     attribute. Does anything actually need the 'sparse array'
>     facility ?

I'm pretty sure that nothing needs sparse array elements like
that. The major reason for the len-PROP field is an implementation
one: because there is currently no way for a QOM object to
say "call this method if somebody tries to set a non-existent
property", the way array properties work is that the 'set'
method for the len-PROP property is the place where we then
add the PROP[0], PROP[1], ... properties.

If we either had a "call this for any property set/get attempt
where there is no specific method set" or else had array
properties supported by the core QOM code, we could avoid
having to set len-PROP first.

thanks
-- PMM

