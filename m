Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDEA517FB5
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 10:26:26 +0200 (CEST)
Received: from localhost ([::1]:53326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlnrU-0008Lx-Oc
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 04:26:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nlnBo-0003iK-Fn
 for qemu-devel@nongnu.org; Tue, 03 May 2022 03:43:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nlnBi-0004pd-Kk
 for qemu-devel@nongnu.org; Tue, 03 May 2022 03:43:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651563794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jOUz7Odu6vNnoQ+bFvyo/GtNDVIbMmfzDvAyO+3QVc8=;
 b=FqJRDplCNHc5e5DkgAHoQLUfi5Rq8ZTl5WYbdAEN59YcN3VHyKRQ63I/sOqsAVA+ojanKz
 VnnQdR9rx8JYEOf9Bc7x1H5E61+S6P8F6lWlm9EevRJbqMScaWAnMpnmpYZUzm79PSt/T/
 noFqsDI+u7FaqARc0B3r+q5xPtscGRM=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-192Nl6zvN86M-YiB8wJlSg-1; Tue, 03 May 2022 03:43:13 -0400
X-MC-Unique: 192Nl6zvN86M-YiB8wJlSg-1
Received: by mail-yb1-f198.google.com with SMTP id
 a17-20020a258051000000b00648703d0c56so14882018ybn.22
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 00:43:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:references:mime-version:in-reply-to:date
 :message-id:subject:to:cc;
 bh=jOUz7Odu6vNnoQ+bFvyo/GtNDVIbMmfzDvAyO+3QVc8=;
 b=4N9fsAHtKNX8C4bV3Cqz6xxY1u8s68gJSodynVS0GPD1tNuUcHmDT+WyKCYJfRAt4n
 I2nyjhawO0Q65EffPNuWT5l86RVk+zHFtOYwpM/1spWENBE1cYzkd4baFhhxc+zD/0sF
 /KIjqrKqgTfClkIWVB/jjKK4ASlKRzian3ZnTMoofhdsNQZv0lZ9Eszndfg8BDauZEId
 IVd1UfQQhtJzm2p82ray+kNmk8OOOWmYt8Ua44AC7rMsBQ5RQI3dEFq2CYCkbDh5xhWa
 NwIiLvH4vJhEQ2MfDJb6exyv6SUc9XOzqlwdv7JFLGUudnU0UKPl9XjU1u5wx7iCloFq
 ty6w==
X-Gm-Message-State: AOAM532odUzWx84oW6i5u3Bsr5aTPdee9JG9U/Xstc+YopRnkBISZm31
 24a0W2mufqEDJpcQmSYkDIsidS6FJQk7aNl9AbXGNUu5XdnpyQgIFZQc4RAV1oHQ+SyL958Xl+w
 xRGnlK21t1/XA75RiNIsYjhTmXy2K8MQ=
X-Received: by 2002:a05:6902:12c2:b0:633:85ae:afdb with SMTP id
 j2-20020a05690212c200b0063385aeafdbmr13102359ybu.118.1651563792712; 
 Tue, 03 May 2022 00:43:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxi2866xKKS+5OJcegVrhMbFylUIEc8n+OedhJ3HMZ9byRs7T+GPWBkl2ukAcniqVIp/zAv8p8OrFwCb/OXleg=
X-Received: by 2002:a05:6902:12c2:b0:633:85ae:afdb with SMTP id
 j2-20020a05690212c200b0063385aeafdbmr13102341ybu.118.1651563792542; Tue, 03
 May 2022 00:43:12 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 3 May 2022 00:43:12 -0700
From: Andrea Bolognani <abologna@redhat.com>
References: <20220429154758.354610-1-abologna@redhat.com>
 <20220429154758.354610-7-abologna@redhat.com>
 <874k28s4hs.fsf@pond.sub.org>
 <CABJz62PTMG6GvZM7nCGxLAb0YhDuA-Yn-q+iNgcZb4=Wpq-Mfw@mail.gmail.com>
 <87ee1bkftm.fsf@pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87ee1bkftm.fsf@pond.sub.org>
Date: Tue, 3 May 2022 00:43:11 -0700
Message-ID: <CABJz62M+eEN_88_F91seLDbe--q2=1RWsfC7zX6Z2mb2pWrK1w@mail.gmail.com>
Subject: Re: [PATCH 6/7] qapi: Drop unnecessary horizontal spacing in comments
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Yanan Wang <wangyanan55@huawei.com>, 
 Juan Quintela <quintela@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Mon, May 02, 2022 at 07:24:53PM +0200, Markus Armbruster wrote:
> Andrea Bolognani <abologna@redhat.com> writes:
> > On Mon, May 02, 2022 at 10:50:07AM +0200, Markus Armbruster wrote:
> >> I doubt changing to a different alignment now is useful.  The next
> >> patch, however, drops the alignment entirely.  Possibly useful.
> >>
> >> Thoughts?
> >
> > My rationale for splitting things the way I did is that, if dropping
> > the horizontal alignment entirely was not considered desirable, we
> > could at least get rid of the extra whitespace.
>
> Understood.
>
> >                                                 But if you think that
> > the benefit from the half measure doesn't offset the cost of the
> > churn it causes, I'm happy to drop these hunks and go straight from
> > the current status to no horizontal alignment at all in one fell
> > swoop with the next patch.
>
> Show us the patches, and then we can decide whether the improvement is
> worth the churn.

The way things are split in the respin should allow us to pick up the
obviously desirable changes and then decide how far we want to go
with the rest.

-- 
Andrea Bolognani / Red Hat / Virtualization


