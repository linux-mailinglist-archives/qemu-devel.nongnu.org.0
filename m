Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2663921C8
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 23:10:46 +0200 (CEST)
Received: from localhost ([::1]:58964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm0nb-0003Za-N5
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 17:10:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lm0mn-0002u9-Pt
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:09:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lm0mk-0002y5-VE
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:09:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622063390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SA+jl90exoQ9wvJOqE36MU+K9pvEuk2dUxOA6caLNTw=;
 b=Fqy+efxYFJ5wXM1GJet7uMqlK+6F+P0/J2lCs4TBWBqVxeVVifMvzKYqckMXeVTd6w2suR
 jLEejLXJ2RGJPDlbhxdbeAYxpK6FIdS/iZ0mn5odEFdXLfeG2ImzN4qAva9aRtkBO33BuL
 vHeY5nIRPgePNOqpJBo1QW6tPvOI+sU=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-fBbrIAJmMY2H-C2rYdU-nA-1; Wed, 26 May 2021 17:09:46 -0400
X-MC-Unique: fBbrIAJmMY2H-C2rYdU-nA-1
Received: by mail-vs1-f72.google.com with SMTP id
 b24-20020a67d3980000b029022a610fc6f2so722808vsj.22
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 14:09:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SA+jl90exoQ9wvJOqE36MU+K9pvEuk2dUxOA6caLNTw=;
 b=g/185BLRKDy5wnpBHxQ6UEe2PcaZYpTuUlh+DSUX5HJNCjb0xAcMumTS53qhPQCpQH
 3sXuT+/YkjhJY1XRW06vcr+c6d4r4Qc9tfshzId5lxPmRrBMRVJBWQ5VOh4W/KX2oNN/
 lDBTyoAElrA75ofJFz6lWLXUjpnCEVjzPjrt1pYUD2TP9MCo7a1zSv5egum2uHotTODK
 QmzYkWMjyPRuslYPTIQXIVh5heQwXqKHXVgRb9xqZmnEANq48OV5ebk/UbkyoizJHMoG
 Nyl8uswlh3TgdvXr87bB/FvUZKt0YKIiqmIlqViNgtqca/JjPS0vO5P6fOOKAuKZsXBl
 PUyA==
X-Gm-Message-State: AOAM533fjnxlHo0gwvmPjW4YMHnXAC5tE1HSyovTZcjt84NLpFRGmeYm
 PxyKeruTVJLX2Tl4CpQIlAFkY//TzrYyvEqWKHeg3xh4w3rRNXanM1Is7UUxhTtIfiMJ7ib57qK
 t/H0PQ4D+bFK+KjKHP4vnRLaaguI3FOw=
X-Received: by 2002:a1f:a388:: with SMTP id m130mr69897vke.1.1622063386361;
 Wed, 26 May 2021 14:09:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPLF7HdjzYN2sc+rWiGPJLq9KYf4LwbHPTrIX2ibW+hutJXzKYVb7F7KJK5eMDwuhfqrsAdjOM8KdxxUXCYno=
X-Received: by 2002:a1f:a388:: with SMTP id m130mr69882vke.1.1622063386178;
 Wed, 26 May 2021 14:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210520204747.210764-1-willianr@redhat.com>
 <20210524175057.GA1567491@amachine.somewhere>
In-Reply-To: <20210524175057.GA1567491@amachine.somewhere>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 26 May 2021 18:09:19 -0300
Message-ID: <CAKJDGDY1=HO4Y1j2fpw9Bi9FKx4Uh94cjwnNzMmL05PgkT1G-w@mail.gmail.com>
Subject: Re: [RFC 0/1] acceptance tests: bump Avocado version to 88.1
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 24, 2021 at 2:55 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> On Thu, May 20, 2021 at 05:47:46PM -0300, Willian Rampazzo wrote:
> > CI pipeline: https://gitlab.com/willianrampazzo/qemu/-/pipelines/306904401
> >
>
> While not related to change in Avocado version (I've verified the same
> behavior with 85.0), we need to investigate (further) one of the jobs
> getting stuck here:
>
>    https://gitlab.com/willianrampazzo/qemu/-/jobs/1281481564#L79
>
> Would you care to take that task?

FYI: https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg07958.html

>
> Thanks,
> - Cleber.


