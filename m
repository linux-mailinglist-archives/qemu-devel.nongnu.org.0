Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B64D3EA269
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 11:48:28 +0200 (CEST)
Received: from localhost ([::1]:45926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE7K7-0003tA-7S
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 05:48:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE79K-0006Af-W2
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:37:20 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:33783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE79I-00025O-6g
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:37:18 -0400
Received: by mail-ed1-x52a.google.com with SMTP id by4so8785207edb.0
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 02:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O4oM2TISiijknuGwtIZQfdQCC3usHnin2N3rXpO0bjM=;
 b=RgJ13VWSgrRB/cQsUGkTpbZw3OD3wSrwuxIsdr6G5gmNM24zwMfGdYGc4Kxe3ZvLPn
 7RBJQG9i3n4vyo9UZ2pG8HvJJDSNKgsNvLpuVeeONYBArq4fUHufnlGgVcV/smw9jM83
 mWvzKmdF3lh1448RAQtAxVdJPuJdI5PDtnnfClrsmdKStOJCNfdOoVpgtVSYxUtPEfGI
 B97Wlh5Q/pMfppamD9T1Kqx/eKsCMl2Hz1dS2Ql54XYBN2Isnsljsxc/QwTlCqHYY/+T
 pjWmILAoVi2Ead+usfHvpD01SDl0w76J/OaYifiVghGGVyj3Ytro7gAVjYZGF8qCe3qD
 M0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O4oM2TISiijknuGwtIZQfdQCC3usHnin2N3rXpO0bjM=;
 b=uSw08NiUzMzUT7jNAThvurTg8/ERkAWhV0y3r+sJabm4HmEusv2ICY5+XpIPA+REh4
 rCgFNvtGoPea27kcKmwe5tHZ07XhZk75Z/9iOKANISmtVR5ac5b0aFXLxwuagBrmzkg9
 KNLNVsU7mJUbdofsHFuaOVdY7dJqKUiHdPbN8GCgkI9RJzSVYZJH8Jv0DfMW7TFsbQpK
 +VtrVP6Eot+0yai0QUIhYPYxPWmfy1BItS1ADe0QGr2KQ2Gzvg2nUw/q3YgRJPHSnoq4
 QO37AyokWwbadna3D/EIsqNosjEsmy2Az9tABeH2j3nmXxZRc50wYVftBM0aLx+sIiaz
 qYHA==
X-Gm-Message-State: AOAM531lV1hZP8P7IXBW8MSYRa7aZlesAZsWLFSIqXSXe63BH3WOSWbc
 x2wy6qHZjE9u8AVUBk/NAtF8b23mE1BhMkZgAM5Mv6K01gw=
X-Google-Smtp-Source: ABdhPJx8j9sTScK8SrXAOz+MZKRIavxgYq6ghEMVCuq3hXv0LIw4h0Alijp0hxWPTjPFvQPoV0mw8LMvUqaQykjkN9s=
X-Received: by 2002:a50:ff03:: with SMTP id a3mr4325295edu.100.1628761034406; 
 Thu, 12 Aug 2021 02:37:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210812060440.1330348-1-ishii.shuuichir@fujitsu.com>
 <20210812060440.1330348-2-ishii.shuuichir@fujitsu.com>
 <20210812091650.i5np3szvdoelu2cx@gator.home>
 <20210812092517.mwcfhksoe4cgy3cl@gator.home>
In-Reply-To: <20210812092517.mwcfhksoe4cgy3cl@gator.home>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Aug 2021 10:36:29 +0100
Message-ID: <CAFEAcA84OeEooeYG_ierHBYh1akz7tw_6hAkbG=3J2DpiRJJ=w@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] target-arm: Add support for Fujitsu A64FX
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 12 Aug 2021 at 10:25, Andrew Jones <drjones@redhat.com> wrote:
> On second thought, do we want the QMP CPU model expansion query to show
> that this CPU type has sve,sve128,sve256,sve512? If so, then our SVE work
> isn't complete, because we need those properties, set true by default, but
> forbidden from changing.

Do we have precedent elsewhere (arm, x86, wherever) for "this CPU object
exposes these properties as constant unwriteable" ?

-- PMM

