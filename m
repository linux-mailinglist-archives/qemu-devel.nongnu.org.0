Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4342157000B
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 13:19:06 +0200 (CEST)
Received: from localhost ([::1]:36214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oArRR-0000PC-3A
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 07:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oArOZ-00052G-VF
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 07:16:08 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:46969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oArOV-0005IQ-0k
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 07:16:07 -0400
Received: by mail-yb1-xb32.google.com with SMTP id l11so8110729ybu.13
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 04:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GeeOlx8aDwBWqkBPi6HicLNoiR9rj3KWEGMtIHYi954=;
 b=KvCcLvxugsvdeHlc/M60hn3kOB/nQRgn4SpRyPdIF4CD6npFHw3KuUjuthzoZmOzcs
 cY4LkSEoXQleJxaSWCDeDIYE0Ab1zRp8tNwxhKbj586uesy6XUfGzjFZ4pxvAdtVkJyb
 dQsijutsSFdChIhEEyFljUfjcIu4cwHS9I2PWNKIwEZY9isgmgE8eedWQ22/28sk9WUb
 VV9w3KcqmeA63AGyNRefL6z9y7yvEyCATyyISeBehrBceaDX2iOysDCb2Zyp1fj5P/5d
 Oq29+fDLxMk3TNKYHeUmqi1i1HEZKS/LfZoWeHxTa8KjjT8cZaotzwYS6roXwyjjMw7t
 FBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GeeOlx8aDwBWqkBPi6HicLNoiR9rj3KWEGMtIHYi954=;
 b=GnG/yqFBlEvNy0bU/AK/Kdw6BV5e8VIXhzhcY6kSPbvhO9k1sjcmvd2piVq3HmGuNf
 J5PwHr7YA3OrdzuP9eQLxTZBIK8Vta3nf2EkFZqlbkmxEKVnIcesFvHAOtozENAG9Clq
 fhcqrVl2mtTJ9zJzXvbkxz75o3RL+qDfSN2ZIvX6AoJnDnKBbrQ8OoZNHdEANPNzpPG+
 CpLHzgjr9nlrJsRrf4lh8MdmR+B6dRvARh4gb7k0L8iO11SWwj/N4HXC1H8zkgPv73Ve
 wc8nWGSxH5bdmeLZtxRWeoivrnMnf9NiJC17FRVBasNc7OpoJ8PYDWhMGEX/InM8tjRT
 a+Ew==
X-Gm-Message-State: AJIora9amVmWpn9h37rAgcSPdKixeSHu4OkY18d/nsMJ9fGa2Kw29OW1
 I4oCu2Lxv/ewg1bX4OHz0/rkmjTDgKjCwaKztoskvw==
X-Google-Smtp-Source: AGRyM1vXd3Vm6EZPP4YwiyIoyQAiLEIEA/mhYO0pZpGEjAWXl0N64H+Kg7e4rTjZmSP/4Naq59IfPdwbnrAPWzbOQro=
X-Received: by 2002:a25:230b:0:b0:66e:e008:a76b with SMTP id
 j11-20020a25230b000000b0066ee008a76bmr14517193ybj.479.1657538161529; Mon, 11
 Jul 2022 04:16:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220705095421.2455041-1-armbru@redhat.com>
 <87wncqmq2t.fsf@pond.sub.org> <YsgOhJLpbyODJCGG@redhat.com>
 <CAFEAcA_pA_K=06chM9xwS8BzK2W6v0g5S5Vr_=YT1A9xqX+tfw@mail.gmail.com>
 <YswEzUyQJtxAlylE@redhat.com>
In-Reply-To: <YswEzUyQJtxAlylE@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Jul 2022 12:15:22 +0100
Message-ID: <CAFEAcA80xNkyoPV78eJS5wdJ2CEtqkGQZMebuBSBgTJLNwpDGw@mail.gmail.com>
Subject: Re: [RFC PATCH] qobject: Rewrite implementation of QDict for in-order
 traversal
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 kwolf@redhat.com, hreitz@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
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

On Mon, 11 Jul 2022 at 12:09, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Mon, Jul 11, 2022 at 11:32:35AM +0100, Peter Maydell wrote:
> > I'm pretty sure that nothing needs sparse array elements like
> > that. The major reason for the len-PROP field is an implementation
> > one: because there is currently no way for a QOM object to
> > say "call this method if somebody tries to set a non-existent
> > property", the way array properties work is that the 'set'
> > method for the len-PROP property is the place where we then
> > add the PROP[0], PROP[1], ... properties.
>
> Ahhh, I see what you mean. I totally missed this subtle detail.
>
> IIUC, there's essentially no such thing as array properties
> in QOM. 'prop[0]', 'prop[1]', 'prop[2]', etc are all simply
> scalar properties from QOM's, that just happen to follow a
> common naming scheme, but QOM doesn't care about that.

Yeah. The exception is the bit Markus pointed out where somebody
has later added special case support for setting "prop[*]" to
mean "whatever the next index is".

> > If we either had a "call this for any property set/get attempt
> > where there is no specific method set" or else had array
> > properties supported by the core QOM code, we could avoid
> > having to set len-PROP first.
>
> Techically arrays are already supported at the core QOM level, because
> you can use any QAPI type as a property.  The authz/list.c object
> has a 'rules' property that is an array of QAuthzListRule objects:
>
>   { 'struct': 'AuthZListProperties',
>     'data': { '*policy': 'QAuthZListPolicy',
>               '*rules': ['QAuthZListRule'] } }
>
> At the time I wrote that, we couldn't express it on the CLI though,
> without using JSON syntax for -object. I don't think we've ever
> made it possible to use the opts_visitor with non-scalar properties
> though.

Mmm, if we had started the array-property implementation starting
from a QAPI API (or even with the idea of setting properties from
command line arguments) and working from there we'd probably have ended
up with something different. The primary use case though has
never involved QAPI or the command line, it's just C code for setting
property values on devices created within QEMU.

-- PMM

