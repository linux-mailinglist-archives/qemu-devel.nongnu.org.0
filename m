Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A0667D0BD
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 16:59:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL4di-00015k-TG; Thu, 26 Jan 2023 10:58:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pL4dg-00015b-Gq
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 10:58:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pL4df-0005FL-2B
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 10:58:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674748690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xqR3zYfvC0zwg/6iKJHZy91KP2ZfpuyPlVLypYuY25I=;
 b=TvdR/mVfOmxaE88+A3iyjp7PYnhfEPgV4p1CKJwIUJ+Di033k8wSD+9HM/HFi09inrvxSV
 PM7fP9NbFJAyO20GtlwRe3Z33UFm+L9fVQKrWJKP1hZ7dy8pca4KCvKnERmE+YGJiY3hUN
 oO70p+gwD8jNGiX9oHMaF1P/WiN+W5U=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-312-4HbmIbsJMG-YvhvwvFOQ2w-1; Thu, 26 Jan 2023 10:58:05 -0500
X-MC-Unique: 4HbmIbsJMG-YvhvwvFOQ2w-1
Received: by mail-qt1-f200.google.com with SMTP id
 v15-20020ac873cf000000b003b6428b16deso921178qtp.3
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 07:58:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xqR3zYfvC0zwg/6iKJHZy91KP2ZfpuyPlVLypYuY25I=;
 b=cMd9H/cGxFXZAXU5WqtsWWjy1gtPNGjYe01dxRL2fS2FyC1jiPB5a4DGLjZ2TM/Hfu
 gHw9bVaoWCJj7K0g29GHtMwkKOTVij4bGYiH2cnVwhmLGq9TH4XlaSeqSSei8tmrhxoG
 ckddtaTSP5xfHpj6Yixcnb4Cxp5YtTW/Dh5xmg3qbXhP4RN7YrkEdVZdNP48qlkTU/GF
 v+w3/X1hGZ9C/OpGbCBrgOajoy33gzq9kRO5hJi9AGdq4ijQHsLy/fEpxe2+jDI806c8
 kNYrJ5xd4ytxuW8QrJT75OlKwgA52/ZFx5s7/EkTIlRz7q2vYE7SvqrAvFymRkLNnmUg
 I0yA==
X-Gm-Message-State: AFqh2kqmN9xXpY7WInXCQSyeuFIn56Zajf2deRf/ksmqA/931j1LKf1y
 V9Q2ALBqFJ60imAfgMFchBCy4TRE1O7ktbScK2ocNs8xmWj9xvmf9Ll8PZzIBB92/EJsqQ+fodG
 XGSL4G0/JiZo6uiI=
X-Received: by 2002:a05:6214:3389:b0:531:7d95:bb7 with SMTP id
 mv9-20020a056214338900b005317d950bb7mr50126630qvb.8.1674748685204; 
 Thu, 26 Jan 2023 07:58:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvw8NxiVIHMA8lqzWFuGa7IH2SKV/41DsAITMSLqKaB95ILpAseP2mwZO4DTBZHPlZfPrfZ6g==
X-Received: by 2002:a05:6214:3389:b0:531:7d95:bb7 with SMTP id
 mv9-20020a056214338900b005317d950bb7mr50126612qvb.8.1674748684931; 
 Thu, 26 Jan 2023 07:58:04 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 a191-20020ae9e8c8000000b006ee949b8051sm1113734qkg.51.2023.01.26.07.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 07:58:04 -0800 (PST)
Date: Thu, 26 Jan 2023 10:58:02 -0500
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH 2/3] util/userfaultfd: Add uffd_open()
Message-ID: <Y9KjCtRex0N1uhou@x1n>
References: <20230125224016.212529-1-peterx@redhat.com>
 <20230125224016.212529-3-peterx@redhat.com>
 <28e8528a-3143-7e10-eca0-f16eb08043ad@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <28e8528a-3143-7e10-eca0-f16eb08043ad@linaro.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Thu, Jan 26, 2023 at 12:04:35AM +0100, Philippe Mathieu-Daudé wrote:
> On 25/1/23 23:40, Peter Xu wrote:
> > Add a helper to create the uffd handle.
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >   include/qemu/userfaultfd.h   |  1 +
> >   migration/postcopy-ram.c     | 11 +++++------
> >   tests/qtest/migration-test.c |  3 ++-
> >   util/userfaultfd.c           | 13 +++++++++++--
> >   4 files changed, 19 insertions(+), 9 deletions(-)
> > 
> > diff --git a/include/qemu/userfaultfd.h b/include/qemu/userfaultfd.h
> > index 6b74f92792..a19a05d5f7 100644
> > --- a/include/qemu/userfaultfd.h
> > +++ b/include/qemu/userfaultfd.h
> > @@ -17,6 +17,7 @@
> >   #include "exec/hwaddr.h"
> >   #include <linux/userfaultfd.h>
> > +int uffd_open(int flags);
> 
> Preferably documenting what this function returns:

Sure thing.

> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Thanks,

-- 
Peter Xu


