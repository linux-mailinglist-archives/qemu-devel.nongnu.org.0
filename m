Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BED73DD5AF
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:32:57 +0200 (CEST)
Received: from localhost ([::1]:37392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAX7o-0006Pt-Ee
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:32:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWsz-0001c8-V1
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:17:39 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:35734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWsy-0001Z5-L5
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:17:37 -0400
Received: by mail-ed1-x532.google.com with SMTP id cf5so12643469edb.2
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 05:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=umrFQEUVCvl+/O87XcVgzHeP/awmKFwPANKgKkhRvYU=;
 b=sj+S0bfanknxHtU5hBiJPi3LyLPkRmzx5Z9lr9Rj5po+qipqdhUB1fzCGSvTm/DUrG
 fM1TdhGXKj5CBPoRV0laZ3mflRqqJwscyk5DhTqpT9rwIBRLhySCiOPqMGD88tkeP/aP
 tb4qLDf6vOUiWGAIhppiSrpE0Qq8blvwyYb3wT6HoWUedDf2x1EMUxuFH33e0zXx+rxl
 oPmntLtuDDyISi0Ui3iMpni927V1lbQk8uCzrzIYlW14iR0UscxxA9Rhd3q5c6DHvn2b
 8PzqyjIrVhthLYrz2e6dDtEhjvDxHiKsW5ATp7ZVKkQ1+9sbuAN8njDZNO39Wn+4WcNH
 Gc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=umrFQEUVCvl+/O87XcVgzHeP/awmKFwPANKgKkhRvYU=;
 b=dTqunTW7YomQYyJQNAIchqRs+qfl7AqExWqrUBI2GE+Z/XbE0sMvI5iEABYAhqFfwc
 BQqTZV8s+lPvohtYB17BfHHVrdYgn+ztA7XbMw1YWGQhTPrdUR6TUU5L/rBc3USb1XPg
 wkBTmgj9PMeCoX+muViYrWb+L5j9HQVlTAF/7TU+Vf9b61KnW6gE3Drs65tEZAYo+lni
 Rv+9kwC7NVRu3M7Hnl6fId3wY+7GfNF4vfEAa5A3EgylSvOthjGikCaZsjdDLCRwPhb9
 JDJgJjwBjB6aC1LjebPwpFikIcughKDVyaU15pCt9UQtxIRJCi3QoZhmUUn+hwxEV2L3
 CTjg==
X-Gm-Message-State: AOAM533VJ/ZhLQikNWBLiypOzyxqHcSeyILAM5DfDpKvfcolMIXzvzsD
 0Lh67KD5PdVxVuF6oc/q8JZUMVCErnYWsQ1jo/ZZyw==
X-Google-Smtp-Source: ABdhPJxE4g7Z1xd0RrCVQ5VicQCEx8gjYfipRpUd4zPYDiSvHcqO69qn5s3yGHGIcrljcm1JT+pMSQBjWsgvSpbjb5A=
X-Received: by 2002:aa7:d30e:: with SMTP id p14mr18697270edq.204.1627906655310; 
 Mon, 02 Aug 2021 05:17:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210729175554.686474-1-ehabkost@redhat.com>
 <20210729175554.686474-5-ehabkost@redhat.com>
In-Reply-To: <20210729175554.686474-5-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Aug 2021 13:16:50 +0100
Message-ID: <CAFEAcA95Ls9j5mQwW9X_YGSPJDTXC0+7X+zbVUowCPoBc0S99w@mail.gmail.com>
Subject: Re: [PATCH for-6.2 04/10] docs: qom: Fix "API Reference" heading level
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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

On Thu, 29 Jul 2021 at 18:58, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> The API reference section was being rendered as a subsection of
> the "Standard type declaration and definition macros" subsection.
> Fix that.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  docs/devel/qom.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

