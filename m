Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDAB52D013
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 12:06:03 +0200 (CEST)
Received: from localhost ([::1]:33486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrd2V-0005Gh-Ue
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 06:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nrcz2-0003G6-67
 for qemu-devel@nongnu.org; Thu, 19 May 2022 06:02:16 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:33517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nrcyv-00041V-KA
 for qemu-devel@nongnu.org; Thu, 19 May 2022 06:02:13 -0400
Received: by mail-ej1-x62b.google.com with SMTP id f9so9011105ejc.0
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 03:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/41wwND8R3MXOKveffb3xycJ2/ioh911NVq8VrWNWhI=;
 b=p77XmgBu3K2NC84MAE3KgSzbB2TtLGM48pvEVcqfYsytsMQ53gkqWw5NRNw0y+eB6k
 pmejtwFv51oK5xachpCvnWE5JA7wwdK8jBsKgr/MXcWnAyIW+1uNd/OJuzyq3+JXwD8U
 dbxeG8QTol/3ajxtSbphB8R747JwmsWSYbtoEicD97Y3Eo66Ya/5CUIBrU17oTcmznpX
 qVAJ5lAbZZX6nyr53az8X+nQETJFSHlUMSwVJ6d65xRhNjRsXM7yPz6OqoqT/FL0G4Dp
 HevFl2MwPY+4kayt/MbpiJVLIW+sc6B/y51z8qrMNwdypODe4IqLxeNcJTT4dW0HtMth
 FB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/41wwND8R3MXOKveffb3xycJ2/ioh911NVq8VrWNWhI=;
 b=xKWHo0wxSdHGS3c7yRLFJYxR5c7H/FZA58LL3/4iJpjvfzTUAxq2JQqUIZxnCkM0iw
 kyaxAKzGbj75EKsJJpv5reMriUe3lcjy///2gotq+zt8qlIPELRvO8o9A5Z3HH6z+HoG
 9qzszWs7ZLuuWCkjRAIJXA2hrcWHg9g6sGy3Nu1IQnfcxDxDqWYgdeMwKJ1OgJUX0PSJ
 wHunSeR9jBnmHtRqdmkzZ4m6KzvzfvOozOsqz1qN3JNEgCgprqJXHu9lojA89ABOd1p7
 fyD+0r8ld0BkRHZHd68qcHeUYUpINIE7xaWvrrc5zlwS+WAZvcmWTAp0nqnhCSqKJa9h
 EeDw==
X-Gm-Message-State: AOAM531usM9Pj+GbSmi6P85Mf8JbyB3/1FU+eug1Ezjijcd/uK0Agj0M
 4xVlxfie4pJK+3VVPlAYTphzHROf/iPlDm8ulRHc
X-Google-Smtp-Source: ABdhPJyFqO87UQtBJW9pUV5jeGYWMUdeDlAQDZSg62jqDVyN8b3OyvuR+TrVFO+WZ+1JTXPpqxVwkbO6/mFzdHccZ0U=
X-Received: by 2002:a17:907:97c4:b0:6f8:5ec5:61e2 with SMTP id
 js4-20020a17090797c400b006f85ec561e2mr3454322ejc.559.1652954527662; Thu, 19
 May 2022 03:02:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220504074051.90-1-xieyongji@bytedance.com>
 <20220504074051.90-9-xieyongji@bytedance.com>
 <YoT8vKuUnGhfaaSJ@stefanha-x1.localdomain>
 <CACycT3s9gt9D7VU2Bkh7Lo2FjR+MQpEC06ZQpRDcVQMC_LmjXw@mail.gmail.com>
 <YoYRhX2J6kTlcoQU@stefanha-x1.localdomain>
In-Reply-To: <YoYRhX2J6kTlcoQU@stefanha-x1.localdomain>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Thu, 19 May 2022 18:02:50 +0800
Message-ID: <CACycT3v6xvawV7tOPB7PXfGLiBQLFAV=6yfEKdJfxiR4QH4OgA@mail.gmail.com>
Subject: Re: [PATCH v5 8/8] libvduse: Add support for reconnecting
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 mreitz@redhat.com, 
 mlureau@redhat.com, jsnow@redhat.com, Eric Blake <eblake@redhat.com>, 
 Coiby.Xu@gmail.com, hreitz@redhat.com, qemu-block@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=xieyongji@bytedance.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, May 19, 2022 at 5:44 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Thu, May 19, 2022 at 04:25:13PM +0800, Yongji Xie wrote:
> > On Wed, May 18, 2022 at 10:03 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > >
> > > On Wed, May 04, 2022 at 03:40:51PM +0800, Xie Yongji wrote:
> > > > @@ -291,6 +294,15 @@ static int vduse_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
> > > >          return -ENOMEM;
> > > >      }
> > > >
> > > > +    vblk_exp->recon_file = g_strdup_printf("%s/vduse-blk-%s",
> > > > +                                           g_get_tmp_dir(), exp->id);
> > >
> > > g_get_tmp_dir() returns the $TMPDIR environment variable. This means
> > > exp->id must be unique across the host. Please document this.
> > >
> >
> > Now we also use exp->id as the name of vduse device which should also
> > be unique across the host. So I'm not sure if it's better to add a new
> > unique id for vduse since the exp->id is now used by all block
> > exports.
>
> Good point, I forgot that the VDUSE device name must be unique! It's a
> little more flexible to have a separate vduse-name= option which is used
> for the VDUSE device name and the reconnection filename, but also a
> little more typing. I'm not sure if it's necessary to separate the two
> concepts.
>

OK, let's reuse the exp->id and document this first. We can add this
new option if we need it in the future.

Thanks,
Yongji

