Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BED4B5FD829
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 13:14:05 +0200 (CEST)
Received: from localhost ([::1]:36020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiwA8-0006sa-8i
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 07:14:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oivV5-0007uZ-Ah
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 06:31:39 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:38885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oivV3-0007pp-0M
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 06:31:38 -0400
Received: by mail-pl1-x634.google.com with SMTP id c20so1425811plc.5
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 03:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wUrB3Ia+LrhOUrq0NGqNaV0bsBeTtPh27i03z5r8f6w=;
 b=tvhorjsqjXsG4ZoLHN58EVn76M8cnayDLzhuAJR0zZISr7Un/JkrCnjfDzuMA5Fc+Q
 dnreTzuL9HWv+XCb6eZiTdKdy+cIyf7LRZAB9lL35GAddOuNF+90+R5On24jxIuCueFJ
 A8VBNakS+pnnvFArlJjNXWB2MDxyhsBl67RG9pXbzfgGhRtfBWKNT0YEcx3IFHOX+8G7
 IENU0fwArNyhvOYEwMTub2iGI/SNDMtFO/NMQiwGvcKLM5LtNC+rAp7lbmRAXAvoANqJ
 zq0eo2YVlc801xW1TcWUbTUv6HGIX+2gjKj08JIdnSYc5ZvFtUoDDstJeLAkkoJdlUfz
 cHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wUrB3Ia+LrhOUrq0NGqNaV0bsBeTtPh27i03z5r8f6w=;
 b=GYPGrSnap5wyqYCTIBqfo0jlRTOodBXCQjyYt7VHquQTo5ey5KZ0n0A6qXxDyF3IKb
 SuNIET2HLpMz9gaOLuZCmt9EceWqFHR1aARAC2HIw5lkpGqKkeCEDHIHi54YGiEpHopU
 3GaUhEmuV/U99Oi/Fy+BcDhOEBIXCX++lVz/8UbmXLkfFcilxnaKABy2CO7uc4/STN0U
 6OM0w/ZQ98EAha+vJgDF5WleHEveLcn6J8y+pCVbxC6S0qXggRs85fE6ouVMp3Ktx16D
 7c1eMbjoHAlswBa0OhEPneayUp0HOR6eeBDHnHRL50VfwNdk5BGoBH6XVmiln3Ndd7Db
 teIQ==
X-Gm-Message-State: ACrzQf3bhnedat3cnpF+iDPN33ruv3N5d5/INRQxhAx/JG5Pe9QkFe/b
 p9jGpA25btN7gNpnHsHLncpvjM7GEcB1uT5hbMr3nA==
X-Google-Smtp-Source: AMsMyM4VA9zxQOM4KzAkg5wnZXzseNPLLuxQ9EwY0ctxt0vD78DyxnP2WHFeE6YLZOIwLTUHt+GGM72mrpVuY76F338=
X-Received: by 2002:a17:902:aa8b:b0:178:8f1d:6936 with SMTP id
 d11-20020a170902aa8b00b001788f1d6936mr34632984plr.168.1665657092424; Thu, 13
 Oct 2022 03:31:32 -0700 (PDT)
MIME-Version: 1.0
References: <20221011224154.644379-1-peterx@redhat.com> <Y0cEjAT6yMX/Xasv@x1n>
In-Reply-To: <Y0cEjAT6yMX/Xasv@x1n>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Oct 2022 11:31:20 +0100
Message-ID: <CAFEAcA_wvnwoSo8jnddEJ5+87xxRdXLpR0r-20E5JkLTTXXbzQ@mail.gmail.com>
Subject: Re: [PATCH RFC 0/2] qemu-thread: Strict unlock check
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Yury Kotov <yury-kotov@yandex-team.ru>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x634.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 12 Oct 2022 at 19:16, Peter Xu <peterx@redhat.com> wrote:
>
> On Tue, Oct 11, 2022 at 06:41:52PM -0400, Peter Xu wrote:
> > NOTE: mark patchset RFC because "make check" will easily fail; but I didn't
> > yet dig into why as I'm not familiar with the code paths that triggers, it
> > can be bugs hidden or something I missed.  So RFC to just have some thoughts.
>
> I just noticed (after reminded from Dave) that the reclock was actually the
> recursive lock, which definitely won't work with patch 2 at all.
>
> OTOH I also noticed PTHREAD_MUTEX_ERRORCHECK which does the same unlock
> check that we can leverage (and it'll also check re-lock from the same
> thread which causes deadlock).  I'll give that a shot instead.

We used to use PTHREAD_MUTEX_ERRORCHECK, but stopped because it
does not work with the idiom we use for handling mutexes across
fork() where you take the lock in the parent, and then unlock it
in the child after the fork. With glibc's implementation of
PTHREAD_MUTEX_ERRORCHECK the unlock in the child fails. See
commit 24fa90499f8b24bcba29 from 2015.

thanks
-- PMM

