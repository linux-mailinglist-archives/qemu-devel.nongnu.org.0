Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91063197CFD
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Mar 2020 15:33:14 +0200 (CEST)
Received: from localhost ([::1]:49956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jIuXR-0001vc-Ca
	for lists+qemu-devel@lfdr.de; Mon, 30 Mar 2020 09:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48871)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jIuWN-0001DW-7W
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 09:32:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jIuWL-0004vO-UD
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 09:32:06 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:39612)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jIuWL-0004tO-LK
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 09:32:05 -0400
Received: by mail-oi1-x232.google.com with SMTP id d63so15639296oig.6
 for <qemu-devel@nongnu.org>; Mon, 30 Mar 2020 06:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y1Xefw/bJnVUzey7CLXKisvMVTbbRtDR/ZP4vZBiY64=;
 b=GDDvGrJ98H7iqQuvRh4XAmi/PgVAjVsPIeAdzRBD+dV4SQiSXGtpTET7HHqjrMNBSz
 99/UUwkvyQiRjRuNd2DgL0ZjA7hJxjR8oTLSK3dPAadt0sw7FAq939f6fnv7yUH21pSU
 qq/Bbb01qhMHq/mRfgV/coYy8Fn7/qxxuQVLQg48zHo69IKw2BZztvfT/xK17v2FZkAj
 xaR7/SNlKYPxyN7z5vLbTtxt2DgjC53kwfRkvHfWkwO9uQSBub3OSjbvGhtkgW10aiG6
 QesiVw6zfIRwaAEmInE9IyGrmof5UIwVil0//3dnWzaUmdxCR64h0VEPZM3K2XNw3yK8
 pJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y1Xefw/bJnVUzey7CLXKisvMVTbbRtDR/ZP4vZBiY64=;
 b=M89enKmooQB75NJAiUsjGvIjeFcQzMWzOQAKws+nummy67ikeVll4IzP1aQ0N2q6gC
 GR7DZZIO6pTbDY6Q96X+qnZWW3P8Uu3PtPX1S4+J5v1PI0d8H7oVyWI96v//oDwM93xB
 E7Y48+SZ5AGhZkSf3TavVRToww6Bd/vYiNauAp4txRHm8tWenVE+k/uyXJvH16v8YcgU
 B4XaA7XH7m+eFc5mrZ73rfGfkKOfYMacLrrYWYoTcSPhNCbdnzRdWSlQMUCIpin78r4l
 Oilul4lHc7ablhcs+9rtKxqHaYBy4mtigjXd8VC+PciIuRAPojQe3A6eaenMJE5AmP+7
 Vrzg==
X-Gm-Message-State: ANhLgQ3GjR0lgEEse4T4ZRaaTtU26zdYMryoxUV2MhIpgLM+iU3Hn5ir
 PvaS5zRl1T1CEyHM2j2LEauWQA+St31yJSdSUED5JA==
X-Google-Smtp-Source: ADFU+vtoXvrEpg8DjRbqRpWEBvPYMYz7G+11OrclpuOQDC/4P73KJRzCdZ+kgJvuvQF6+dc90emVB4A6oJX2iQS9NVU=
X-Received: by 2002:aca:c608:: with SMTP id w8mr7776841oif.163.1585575123554; 
 Mon, 30 Mar 2020 06:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA8E6goDHb-7kKCTp=wSpBsuJcfjMmLP0EgymiEL348r4A@mail.gmail.com>
 <87v9mmug73.fsf@dusky.pond.sub.org>
In-Reply-To: <87v9mmug73.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Mar 2020 14:31:52 +0100
Message-ID: <CAFEAcA-9U=EAXAtPDh_AnO3eUbM_jcRBuf4x=0Rec0EC-v2mNA@mail.gmail.com>
Subject: Re: deprecation of in-tree builds
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::232
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
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 30 Mar 2020 at 14:26, Markus Armbruster <armbru@redhat.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > AIUI from Paolo, the intention is to deprecate and eventually
> > stop supporting "in-tree" builds, so that the only option is
> > building in a separate build directory. I thought we should
> > probably mention that in the 5.0 changelog, so I wrote up some
> > text:
> >
> > https://wiki.qemu.org/ChangeLog/5.0#Build_Information
>
> Overdue.  Thanks for doing this!
>
> > Suggestions for changes/comments etc welcome.
>
> Looks fine to me.

Consensus in the thread seemed to lean towards having
the 'configure/make' runes auto-create a build directory;
if we want to do that we should probably not say anything in
the release notes, because we'll cause people to change
unnecessarily. Or at least have them say "We recommend
out-of-tree builds. In future we might make the commands
that currently do an in-tree build automatically create
and use a build directory for you." rather than a blanket
"we're going to drop this and you should change what you
do now".

Thoughts?

thanks
-- PMM

