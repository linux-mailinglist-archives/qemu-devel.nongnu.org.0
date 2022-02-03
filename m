Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E13AF4A8BA3
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 19:28:08 +0100 (CET)
Received: from localhost ([::1]:35964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFgq0-0003r6-1h
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 13:28:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nFg64-0004Z4-LV
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:40:44 -0500
Received: from [2a00:1450:4864:20::32d] (port=41677
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nFg5z-00041w-1B
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:40:37 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 bg21-20020a05600c3c9500b0035283e7a012so2298129wmb.0
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 09:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IbeOwU6l0q7vKDGRlMFK/6KVHA32SKmDPDLtWNBIdKA=;
 b=oqLFZdGVEQsgU84wsoOSH2mX/IdRAbze+fje2iAQFyz5wVzgpapQNaqPARheHY+VHA
 epBd7gHFzurVQdhnfiprF1QfmG2X26K9yLY020A7mQkCYzPwVbmQCQY3GgUSpUqEsYJW
 hgC7TMyy7TqzF+6FWWx0Lvar8lrIL7Nh/JN/zNggN1tJM1slQIg/IB3ZSSIvJeEZXckK
 9DpPY46Zpy6whSKk2mkHQPYPFbiSXf/yJNqqymbgG4Kpo2G9q3Kbm4L/yWxtglabWVoZ
 CvwveO+9pkNyoWiojSx7CsCUi+KVIsRK+6bufCZBrrmfZjaLz6lnFjomqMBR/Ng+z/n7
 rneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IbeOwU6l0q7vKDGRlMFK/6KVHA32SKmDPDLtWNBIdKA=;
 b=i3+9TNvKyJB+XdvUQlREMqz5KzRLOI2H2+QGY1zs525R9DGPWgyj8scX4Jtj2eLTuL
 iiXC7/xPuL8zXYUxhqYFyMZmPAJMKbv3lTjvzpIEzLkknuRvTkcn+aX55sTofNAmgAXi
 cjZ/79J8UN/gQN31/4sqvHCLfw2f6nwKnwTUtlF+2N3uJcKJpAJwkS/SUU7BgP4dEeEJ
 NzCId6GhBIWzo/R4U3Mpn06CsFLiO6mjXinYR3pVxpUoeNCkIW9ce4CL4HnfZ2oc/wVw
 h0CeJg3UaFERRb2QKqi/LUHyZNxiEq+EdujAUkVCtLWYX4oRNUN7cUAcAJ96FDorKHa8
 wiRA==
X-Gm-Message-State: AOAM533LNCTSJzGmFo5sGY1DDB87rLJcvDhBMDID07dJsk7nvLhHBfxA
 ErZ1D1tN5USwAy9Gvxfu3gyKTpZEr2yIknw4kTDQ2Q==
X-Google-Smtp-Source: ABdhPJxC3uk9BPHp8v2wfR47YXg7CUz4q13OYrzaJTjasgyYsZ5kYG+DXdgG3o0zjttF4fNzphw05Gll1WcIqhsx1dQ=
X-Received: by 2002:a05:600c:1443:: with SMTP id
 h3mr11477553wmi.37.1643910031836; 
 Thu, 03 Feb 2022 09:40:31 -0800 (PST)
MIME-Version: 1.0
References: <20191101085140.5205-1-peter.maydell@linaro.org>
 <20191101085140.5205-10-peter.maydell@linaro.org>
 <CAFEAcA8pS6_SYWMFJ0=EyHVQ9V1MTiM_OCjkvqb5znqJ91w_qw@mail.gmail.com>
 <20220203173640.shxkmatdcsfzzvtj@gator>
In-Reply-To: <20220203173640.shxkmatdcsfzzvtj@gator>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Feb 2022 17:40:20 +0000
Message-ID: <CAFEAcA9_3DNozRsH8+iXbs2Z4-ar=Eki3ENvZocSmfbp+g13qQ@mail.gmail.com>
Subject: Re: [PULL 09/11] target/arm/kvm: host cpu: Add support for sve<N>
 properties
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Feb 2022 at 17:36, Andrew Jones <drjones@redhat.com> wrote:
>
> On Thu, Feb 03, 2022 at 04:46:21PM +0000, Peter Maydell wrote:
> > Was this intentional?
>
> No, darn. I don't know how many times I rebased that series and was always
> careful to ensure sve-max-vq was left in the non-kvm part of the above
> condition. I guess the final rebase finally got me...
>
> >
> > I'd like to fix up the weird divergence between -cpu host and
> > -cpu max, either by moving sve-max-vq into aarch64_add_sve_properties()
> > so it's present on both, or by changing the aarch64_max_initfn() so
> > it only adds the property when using TCG.
>
> The later, please. sve-max-vq won't work for any of the machines that
> support SVE that I know of, so I think it's a bad idea for KVM.
>
> >
> > (I think also this code may get the '-cpu max,aarch64=off' case wrong,
> > as it doesn't guard the calls to add the sve and pauth properties
> > with the "if aarch64" feature check.)
>
> Yes, but these property dependencies may need to be checked at property
> finalize time. That means that the properties may get added, but then
> they will error out if the user tried to enable them. Otherwise, they'll
> be disabled and the QMP query will inform the user that they cannot be
> enabled.

Does 'max' need to do anything different from what we're doing
already in arm_host_initfn() for 'host' ? (My proposal for
fixing this stuff is basically to make aarch64_max_initfn()
start with "if (kvm or hvf) { call arm_host_initfn(); return }".)

thanks
-- PMM

