Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4F9321361
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 10:48:30 +0100 (CET)
Received: from localhost ([::1]:40588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE7pO-0003Yc-0k
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 04:48:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lE7nK-0002WM-Ou
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 04:46:22 -0500
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:39507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lE7nI-0000Up-I9
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 04:46:22 -0500
Received: by mail-il1-x132.google.com with SMTP id d5so1337619iln.6
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 01:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j7cf+bYfCIhYtlawS90ZxaP7rnPkhNWNjFle6ZO2xBg=;
 b=W+Eqm46WrqcnkhF8krAJGil/AjwKTXhdyemxEltClqlTR8ZwBW/NwPG1WJ06MSLgei
 W8EqWyLbFoUVug0Txpz4hmgm4MLBvPSdk1VIE4G1h2r4wZtQQw0ivyiforKctxF2OHU6
 sbHLpNpM+CtnUXFcLIjiL9eSNcv8NKp4mG0g6rCAl1ag3XUbPq2GBWB/Hro523r224wj
 kCPCKPFvPrP5rL+LUWs1wgvsfy0s9vuCIvdF5o3/PkwbWtkX8WITRa8MXZ//8DEfXRj/
 HtONdk30+sspakJwBi77qrvack1yJPPWfSH3YXrKti+GmWfnHL+gou6uMNruL1G25x/B
 NCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j7cf+bYfCIhYtlawS90ZxaP7rnPkhNWNjFle6ZO2xBg=;
 b=OXILNeoBopvhsU+IYH5u1eHfpa2likPbp6sRbd8MkbngEyVUCIfgfi2qd4kfkDyi9n
 6PuSn6PssvPrCTjPB6eS79IhNa5fNy8485uIHlsgh1CtT1kLDSJbHTRUmCSAXx5hrkiE
 PKbDj6VcOxQSHGn8XneXebQf0/c5qXSGfg0FqSmGPvcyxoInk5usTcIr6zBE+bL4syRI
 Dqinz4zwyoxusAhPleF7PJpOiDOVEFShy2tsMwv2O37tQb/35GLZAuipwZVoL1o9AXNX
 bTW0uhDe2SifL3IhICvOdKSOVaTGhhozI5va/P5NjBNz9GHogKrN2J97uVJMPux+jGdy
 ALQw==
X-Gm-Message-State: AOAM533K/Mm3+JpYR+c1n8kzKLex2jOTUExaDBNJIeuf0SU9CrWFleaI
 Bn+44ALzw8zaNxqzK7usENisM0j+ZS6/UFtmUIzA
X-Google-Smtp-Source: ABdhPJz2Ae4W6sisEaZ1RpeNuDxem+/+HxP4o1Y6uOVTgqOHvQPFv4D5++LmIFACqbCklShWb44l+P22iDwJ82L6r8M=
X-Received: by 2002:a92:1312:: with SMTP id 18mr13716734ilt.92.1613987179263; 
 Mon, 22 Feb 2021 01:46:19 -0800 (PST)
MIME-Version: 1.0
References: <cover.1612747873.git.haibo.xu@linaro.org>
 <25a922038d256e47f3eb99683c5e3bd9c34753ac.1612747873.git.haibo.xu@linaro.org>
 <ae0326e2-8766-803a-ef89-1155d45fdd2a@linaro.org>
In-Reply-To: <ae0326e2-8766-803a-ef89-1155d45fdd2a@linaro.org>
From: Haibo Xu <haibo.xu@linaro.org>
Date: Mon, 22 Feb 2021 17:46:06 +0800
Message-ID: <CAJc+Z1EERnkp1QhZu0Xkrxuw3u8bFM02x0=QVfXYxCRSbXiZeA@mail.gmail.com>
Subject: Re: [RFC PATCH 4/5] Add migration support for KVM guest with MTE
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=haibo.xu@linaro.org; helo=mail-il1-x132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Feb 2021 at 23:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/7/21 7:20 PM, Haibo Xu wrote:
> > +    if (kvm_physical_memory_addr_from_host(kvm_state, addr, &ipa)) {
> > +        /* Buffer for the page tags(one byte per tag) */
> > +        tag_buf = g_try_malloc0(size);
> > +        if (!tag_buf) {
> > +            error_report("%s: Error allocating MTE tag_buf", __func__);
> > +            return 0;
> > +        }
> > +
> > +        if (kvm_arm_mte_get_tags(ipa, TARGET_PAGE_SIZE, tag_buf) < 0) {
> > +            error_report("%s: Can't get MTE tags from guest", __func__);
> > +            g_free(tag_buf);
> > +            return 0;
> > +        }
> > +
> > +        qemu_put_buffer(f, tag_buf, size);
> > +
> > +        g_free(tag_buf);
> > +
> > +        return size;
> > +    }
>
> So, in patch 2 you disabled the allocation of tag-memory.  Now you're
> allocating new memory (admittedly quite a small amount -- 1/16th of a page,
> small enough to just be a local variable).
>

Hi Richard!

Thanks so much for the comments!

Yes, the allocated memory here is for temporary tag storage. As you
mentioned, it can be
defined as a local variable which is reserved for temporary tag buffers.

> Why don't you allocate tag-memory, copy the data into it, and then let
> migration proceed as normal.  Then you don't have to have a random data block
> that happens to follow each ram page.
>

As I mentioned in the cover later, the reason to let the tag go with
the memory data together
is to make it easier to sync with each other. I think if we migratie
them separately, it would be
hard to keep the tags to sync with the data.

Saying if we migration all the data first, then the tags. If the data
got dirty during the migration
of the tag memory, we may need to send the data again, or freeze the
source VM after data
migration? What's more, the KVM_GET_DIRTY_LOG API may not be able to
differentiate
between a tag and data changes.

I'm not sure whether the aforementioned situation does exist. Please
correct me if something goes wrong!

> I'm concerned that what you're doing here makes it impossible to migrate
> between kvm and tcg.
>
>

You mean to migrate from a KVM mode VM to a TCG mode VM?

> r~

Regards,
Haibo

