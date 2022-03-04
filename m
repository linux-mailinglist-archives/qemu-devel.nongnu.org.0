Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7464CD08E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 09:57:57 +0100 (CET)
Received: from localhost ([::1]:42746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ3l6-00081U-1l
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 03:57:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nQ3ii-00079H-IR
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 03:55:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nQ3if-0007tu-2S
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 03:55:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646384123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gDUYfAJ0FQjCckNo4JICwZtn8uYSZZMrr8sbQXjaATI=;
 b=cc/esIQttJG4KLyfVdwRoJFfGBamSF7ZiCQ8lUOthDQDLtsaT1dUABC0046l9MWDSfvNiX
 LlxZeMI7uyF62M+CtFBoA1fXRzm2Wnz6fL3e/AlVC4lRSEYA5A+Mlbi45ZfDVI5LHU8EjI
 kJLT3rHUoY6HWWp4gEax3HsyLgabskc=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-168-y_YmNw4cPCe5l9CRjZkVeA-1; Fri, 04 Mar 2022 03:55:19 -0500
X-MC-Unique: y_YmNw4cPCe5l9CRjZkVeA-1
Received: by mail-qv1-f70.google.com with SMTP id
 g8-20020a0cdf08000000b004354e0aa0cdso819395qvl.17
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 00:55:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gDUYfAJ0FQjCckNo4JICwZtn8uYSZZMrr8sbQXjaATI=;
 b=ndCaIw+1wbW/TZV2XjhT8dyN/TU/aX8ClDoVWPsZzx6M5OP13nGt5coXIE8H76M66y
 1NzeS17t36Jzac2FE6ycYSeXuqUYDOM1QNXzKQ5TdFYNguYlKt5xk2MxEyoy4Wa+Fr5A
 wY7aKYub+CiJQxBUEacKzZi81VspcXaDIk4lSiv9m0nMF/i6j9ZQoBwww4/6pXYYnNoE
 vmU1igBg2/HTflpgsQEGDX1OFOBIORBWAFBYwMWH/d0DT05XWuuKTyA7uYIxudl9t3xQ
 xfEEg/q/2Znf6IQ1nn+xVAbPTi+xhaCp/SDMaRzFGkChx1kGh+7fjhQajJS/f9PGtQbK
 mxmg==
X-Gm-Message-State: AOAM530f75nfRjIrj9wlhPxdG71mfUIS+r001J7UQFyJkUughKd4X4SW
 dDkLYcErvo/E76MaqicM0vQHzaNqlLZh0BwRRqoSvl1VcBmZmwQaZTbqqoL6LxYSehcVpC3u0hd
 7wmFii0SEn+zd9HjilYaaTxRtskK45ds=
X-Received: by 2002:a05:6214:104b:b0:435:17bf:da07 with SMTP id
 l11-20020a056214104b00b0043517bfda07mr10109470qvr.91.1646384118957; 
 Fri, 04 Mar 2022 00:55:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxbLgKdllXDExkWlyBk3m4J8epOtxPU1/KV5ybIY14+E59je8tYVMcxQq9nKm2VUuDjPWx4GrPhY04r0t5+oXg=
X-Received: by 2002:a05:6214:104b:b0:435:17bf:da07 with SMTP id
 l11-20020a056214104b00b0043517bfda07mr10109435qvr.91.1646384118790; Fri, 04
 Mar 2022 00:55:18 -0800 (PST)
MIME-Version: 1.0
References: <20220302203012.3476835-1-eperezma@redhat.com>
 <20220302203012.3476835-15-eperezma@redhat.com>
 <87ee3jeff1.fsf@pond.sub.org>
 <CAJaqyWfKQKWMs-tLRyuJ=C7VrsFUS8KHiXQVZHqfj_T5_zeBXQ@mail.gmail.com>
 <87bkyncklt.fsf@pond.sub.org>
 <CAJaqyWfSkfV_FDOMD326SWBQAzK3=bxG+xfUZEmXeYudTG5cgQ@mail.gmail.com>
 <877d9a8c2t.fsf@pond.sub.org>
In-Reply-To: <877d9a8c2t.fsf@pond.sub.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 4 Mar 2022 09:54:42 +0100
Message-ID: <CAJaqyWdZRz2XVV8xtojntjhez+dYJrMMLmuWz71mFa3o+Y8SMQ@mail.gmail.com>
Subject: Re: [PATCH v3 14/14] vdpa: Add x-svq to NetdevVhostVDPAOptions
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>, yebiaoxiang@huawei.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 4, 2022 at 7:30 AM Markus Armbruster <armbru@redhat.com> wrote:
>
> Eugenio Perez Martin <eperezma@redhat.com> writes:
>
> > Yes, that's right. I expressed my point poorly actually, I'll go the reverse.
> >
> > qapi-gen.py forces me to write a comment in the doc:
> > qapi/block-core.json:2971: feature 'unstable' lacks documentation
> >
> > When I add the documentation line, it's enough to add @unstable. But
> > there is no way to tell if this tag is because the whole struct is
> > unstable or if it's because individual members are unstable unless the
> > reader either checks the tag or the struct code.
> >
> > I was mostly worried about doc generators, I would not like to make
> > NetdevVhostVDPAOptions unstable at this point. But I see that there is
> > no problem with that.
> >
> > Thanks!
>
> Yes, the doc generator insists on features being documented, and it
> doesn't provide for documenting them next to members, only top-level.
> The common solution is to phrase the comment like we do in
> BlockdevOptionsFile:
>
>     # @unstable: Member x-check-cache-dropped is meant for debugging.
>
> If there were multiple members so flagged, we'd enumerate them all.
>
> The generator doesn't check you do this right.  The existing check
> guards against *forgetting* to do it, not against doing it wrong.
>
> More questions?
>

Got it, it matches my impression. Thank you very much!


