Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4300D40EA37
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 20:48:00 +0200 (CEST)
Received: from localhost ([::1]:49242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQwQR-0006v7-BV
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 14:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mQwOH-00064Y-M9
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 14:45:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mQwOE-0007gE-6R
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 14:45:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631817938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rq2ZVG7EVXqTO0obdiWFPBkcC7Kde5aN+NSPzfVcZmc=;
 b=YA75zVuNA4Xeiyq9fw5z8xLo9r9XNjamItLCW+e2bXFc0SjVeaWun+wgPkbN7rzkDJm/V0
 BBI54ObCN+lRQdIX1daPvyPFAcZOnFI0D2aGHri63Zwtr2HNTcojbxxgJCvlWjHlKsSfmU
 K9xIKWfbgcYuxj8o/lqUyE3+FG9tZF0=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-C_nIXpQtNHGPJQhC5AMpow-1; Thu, 16 Sep 2021 14:45:37 -0400
X-MC-Unique: C_nIXpQtNHGPJQhC5AMpow-1
Received: by mail-pf1-f199.google.com with SMTP id
 h14-20020a62b40e0000b02903131bc4a1acso5544047pfn.4
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 11:45:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rq2ZVG7EVXqTO0obdiWFPBkcC7Kde5aN+NSPzfVcZmc=;
 b=anmwqYFBta5ACDdpm6wbbXLPO/XTanKLrAFdqVfTpJUjQzaxWss9aJLuuyTbtViCSE
 5rBZTzYybUv6V6CK0PwMOqHxQ3tnyCMZMonaBsPgAGDrY38brgYhk1jRv1jF0sV7pAKT
 PbcbE7dCxcrGtO6VD+cT+IKQD66N6F+RD2xnWZvXoSl6dGjdmLljABEj88zU46rQLC0N
 ntDo5x4ZZ4ETEVDkwLZ3ol2SLHtlwgPcJeIppD04HbM0sHYZRutu0ZG3hjOo0szdGxO8
 Iy9KujFTKIXV9eH+kA9G/qqe980G2fv+Mz9i8mv+G7xDhqBVbsCOrZ45JNpNMhQYrm8V
 u8ag==
X-Gm-Message-State: AOAM532Tr/dcnshC4OKqHFoi9NYqOND0dSYQCXNhYnQhf5QsjAZIF8Cz
 dKuExujPQKmBVxIEiwNjEYXGAcd8TlW9+zSlmtRofd3Xd4MKNwjjNctHHX89zY/q1gGHPbtzSFH
 5q1lEO4EkTql2r1DDIvKu18WHr9dN6Qc=
X-Received: by 2002:a17:90a:5d0f:: with SMTP id
 s15mr7761945pji.10.1631817936253; 
 Thu, 16 Sep 2021 11:45:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwam43VR8viQWiTdK1c/ShBRwMiRmduRGJ4EdVpNOcB47TvFjFvJS4wEPMFGWsOZ0HvwKekHVDcrFFMuMN9EOY=
X-Received: by 2002:a17:90a:5d0f:: with SMTP id
 s15mr7761921pji.10.1631817935995; 
 Thu, 16 Sep 2021 11:45:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210916182248.721529-1-jsnow@redhat.com>
 <20210916182248.721529-3-jsnow@redhat.com>
In-Reply-To: <20210916182248.721529-3-jsnow@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Thu, 16 Sep 2021 15:45:10 -0300
Message-ID: <CAKJDGDb_663=mW1noEUA4EZ64O5Tz_KG947bCWthZfVZn5C_YQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] python: pylint 2.11 support
To: John Snow <jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Cleber Rosa <crosa@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 16, 2021 at 3:24 PM John Snow <jsnow@redhat.com> wrote:
>
> We're not ready to enforce f-strings everywhere, so just silence this
> new warning.

Oh, boy! We are good, thanks :)

>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/setup.cfg | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


