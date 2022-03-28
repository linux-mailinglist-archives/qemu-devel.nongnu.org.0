Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3664E8C16
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 04:28:48 +0200 (CEST)
Received: from localhost ([::1]:48300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYf7f-00025q-0H
	for lists+qemu-devel@lfdr.de; Sun, 27 Mar 2022 22:28:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nYf6c-0000jI-Lm
 for qemu-devel@nongnu.org; Sun, 27 Mar 2022 22:27:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nYf6a-0004q7-Ag
 for qemu-devel@nongnu.org; Sun, 27 Mar 2022 22:27:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648434459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n8+kXdrrcdtlqxCg6EUOA//xomMEr+0RQWDvztTujmM=;
 b=JT4NuAUhlKPAeI+oy3ow04zg0FCMKNnPbOMxMz+UyK7YfsqhgGmZVVpUf/Kw4+HSRnWhBx
 Zs+ZqnMA2KF6VMcWJGbdGkw+6OmeEJ1zCxpOvFGU9Y42cx/5bFlUHSRpmFGE9O3b3stvrY
 uvfBQyunnqpL1QxT8Qmw8QAG42ffFKM=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-HgEHcA9OOo2ybFNPxRVByQ-1; Sun, 27 Mar 2022 22:27:38 -0400
X-MC-Unique: HgEHcA9OOo2ybFNPxRVByQ-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-2e5db04460cso107376017b3.17
 for <qemu-devel@nongnu.org>; Sun, 27 Mar 2022 19:27:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n8+kXdrrcdtlqxCg6EUOA//xomMEr+0RQWDvztTujmM=;
 b=lGbZcjN0pWHHKNR5H1M9dRWLv222A38O7Ypkg4BjspMMcrFuLGYQ2iNpaIiis6aCy+
 Pw1Us2I+MsdoxgLg0ZyjgeFArk6o84HY6c9BQ8foH6iSK0kl673H1zuQSHQ90XH7Oyqb
 zg68k5rSXaFu0qvnUAUVMxHXLCrFVg+fzv300mBnMElKlqWXCutisXz/nc4HONxZk6uO
 xOiskdA224G6bMvhg6fTTfTc8gRbUksNhe31QZA9YdqwI3JQrpxq9I3hJX3RDpaRESlQ
 V7CaM21ev6rqyEe+bUIhKYQ7xoxFCPgZsmxR/KcShFD5XpflN0S9RfpvmDQ+x0u8wKNM
 G4Qg==
X-Gm-Message-State: AOAM5311me86SxecwBvLT6FUyKh3sJAkU/MzGUHjHcP5UHpOE3k8cmtR
 XOfbNtaJsQQrYS+q1/aEx1nAKvHQhQBVeTnFw7P9b5oa+xAzQNVisKx15sGfHE/flVenjzrG7z1
 0gMxcWaVeyFrN9DdQVpqma5a89yiz48k=
X-Received: by 2002:a81:5309:0:b0:2e6:dcfc:8665 with SMTP id
 h9-20020a815309000000b002e6dcfc8665mr17333732ywb.501.1648434458059; 
 Sun, 27 Mar 2022 19:27:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5mYHCY1dqOTFnI1i+RC1Q4QVn9sDaYc/DqfAf0VjoodDa5rF/nC8ETYyOa/wLfAtSsWQKPrOO5vPvN1dkk8I=
X-Received: by 2002:a81:5309:0:b0:2e6:dcfc:8665 with SMTP id
 h9-20020a815309000000b002e6dcfc8665mr17333722ywb.501.1648434457873; Sun, 27
 Mar 2022 19:27:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220321055429.10260-1-jasowang@redhat.com>
 <20220321055429.10260-4-jasowang@redhat.com>
 <BN9PR11MB52767BEBCF2C191614FD68588C199@BN9PR11MB5276.namprd11.prod.outlook.com>
In-Reply-To: <BN9PR11MB52767BEBCF2C191614FD68588C199@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 28 Mar 2022 10:27:26 +0800
Message-ID: <CACGkMEsfXUaummtjw8JYa8P5T9-fxO3a6vEN=aDE8s_5j_mrOA@mail.gmail.com>
Subject: Re: [PATCH V2 3/4] intel-iommu: convert VTD_PE_GET_FPD_ERR() to be a
 function
To: "Tian, Kevin" <kevin.tian@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Liu, Yi L" <yi.l.liu@intel.com>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peterx@redhat.com" <peterx@redhat.com>, "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 24, 2022 at 4:27 PM Tian, Kevin <kevin.tian@intel.com> wrote:
>
> > From: Jason Wang
> > Sent: Monday, March 21, 2022 1:54 PM
> > @@ -1724,6 +1713,19 @@ out:
> >      trace_vtd_pt_enable_fast_path(source_id, success);
> >  }
> >
> > +static void vtd_qualify_report_fault(IntelIOMMUState *s,
> > +                                     int err, bool is_fpd_set,
> > +                                     uint16_t source_id,
> > +                                     hwaddr addr,
> > +                                     bool is_write)
>
> vtd_report_qualified_fault() is clearer.

Fine.

Thanks

>
> > +{
> > +    if (is_fpd_set && vtd_is_qualified_fault(err)) {
> > +        trace_vtd_fault_disabled();
> > +    } else {
> > +        vtd_report_dmar_fault(s, source_id, addr, err, is_write);
> > +    }
> > +}
> > +
> >  /* Map dev to context-entry then do a paging-structures walk to do a iommu
> >   * translation.
> >   *
>


