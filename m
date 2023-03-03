Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C19096A95DA
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 12:14:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY3MJ-00056b-Fh; Fri, 03 Mar 2023 06:13:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY3MH-00054J-De
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 06:13:53 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY3MF-0000gf-IW
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 06:13:53 -0500
Received: by mail-pf1-x435.google.com with SMTP id ce7so1291271pfb.9
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 03:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677842030;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=771nX0xx/KFQs9t+cJRFBeu+fP6pT03sAEMlxCA2kn4=;
 b=ct8K8vZsnMUE99Xwwy1LkpVNHyxjuzr5OVLOlSBFg4OgYbvVshh+jBvoLTSC20Fc3B
 FtDjRslMvZWNpfjKTQubMupP0v55OFQDaA6DshgB3u9ndDTr746MENlrvAlpdGR0Kd3a
 GztdNr+D2j1OvQ1YTDA14dVEvaajEHOeoq06NAuW/1w8xPP0GGZlquC9nurx2WhjQUXW
 O8y6GbxFTxvLy0cM9f1ekP1WTt/kKWtzlliow7fhruvGV0KQQDaI1YGvS5gOiWEDLpzS
 12V38zydn2epsJr+Z6nYFNlWtr0KnNLJittWhc/dGlBpC4JTvt+jacwT6gWZNOd5s0P+
 xNHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677842030;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=771nX0xx/KFQs9t+cJRFBeu+fP6pT03sAEMlxCA2kn4=;
 b=ZQQn7SAsjHilSLDQ86akULrNuVrloUNLF9UGWo1nROwAP8Dg4bwqvQi/ZXnP88lfLz
 AeD6qNrod3UfJCPvGUdXvC0EZy+P/aIZ1j6hKyhUtvNi0aMgnPp0wxciOgYXXnqOwZhb
 qPY/a4OK9gcSIflUnB5D05QJBTELZCHBpL/vJXDjzOOJInDp4MzIKEzxS+1jD+G8dwa8
 p8KD9yLmrmGnuSMWwwV1+X9OebfTG8H+yJRJ6gczue9p4RoJsRDkhZ0diOyl2989gQVH
 LKtDjmT5Rddcracx7ye0L3G8kRccSK5peqrcBPWMVSdyz4OuHufGeeNSiR8R32gVa6dq
 H0Ow==
X-Gm-Message-State: AO0yUKUxPvK1A0PJ0H3l9WERdsAV+0WsJlWNJ95qfrUve7HThiapb0UD
 8kTZF3PgbYCvOsK+QMjhTmXVfRAC5L6MAWJMMCeWBg==
X-Google-Smtp-Source: AK7set/x/WDdgn+S92hQtOBJgCidOYOIzwhzhmI8pfKfzDc4K8wJXyjZeel1XCw1H0yJAhaHt/0OexozxTAKdEQJxEk=
X-Received: by 2002:a62:ce4e:0:b0:5a9:c22e:7764 with SMTP id
 y75-20020a62ce4e000000b005a9c22e7764mr725402pfg.5.1677842029563; Fri, 03 Mar
 2023 03:13:49 -0800 (PST)
MIME-Version: 1.0
References: <CA+LXE64nmGveP834FfUKxfrGN5dGX-615-OvFsTSLCuoKombmw@mail.gmail.com>
 <e06d72d1-9628-2b5a-8ff9-7a1bedea087f@redhat.com>
In-Reply-To: <e06d72d1-9628-2b5a-8ff9-7a1bedea087f@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 11:13:38 +0000
Message-ID: <CAFEAcA8dDqym3PrZszxrtq6JMNkWxcL9LjwmMeW2aXbU75V3fg@mail.gmail.com>
Subject: Re: Is the fix for "DMA MMIO reentrancy" in qemu stable now?
To: Thomas Huth <thuth@redhat.com>
Cc: byzero <byzero512@gmail.com>, qemu-devel@nongnu.org, 
 Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 3 Mar 2023 at 11:00, Thomas Huth <thuth@redhat.com> wrote:
>
> On 02/03/2023 09.27, byzero wrote:
> > Hi,
> > The bug class of MMIO reentrancy is fixed by adding a member "memory" in the
> > struct "MemTxAttrs", but the patch only exists in 7.x version, which is only
> > release version, but not stable version. The latest stable version is 6.1,
> > and there is no stable version being released for nearly a year.  According
> > to the docs(https://www.qemu.org/download/
> > <https://www.qemu.org/download/>): "The stable trees are located in branches
> > named stable-X.YY branch, where X.YY is the release version.".
> >    So I want to know that if the patch is stable enough? Will the community
> > be possible to change the way for fixing the bug class?
> >    thanks for reading this email.
>
>   Hi,
>
> as far as I know, there are currently no more stable releases, due to time
> constraints of the stable maintainer. So your best option is currently to
> pick the corresponding patches and apply them on your own before compiling QEMU.

Regardless, note that if you care about security issues then you
always needed to
either be using a distro provided QEMU or else be doing your own curating
and applying of security related patches. The 'stable releases' have always
been a convenience for people and distros interested in bug fixes of various
kinds; they were never "quick point releases for security related fixes".

-- PMM

