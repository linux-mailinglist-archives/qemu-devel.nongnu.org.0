Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A61BD52CE4E
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 10:28:38 +0200 (CEST)
Received: from localhost ([::1]:40916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrbWP-0006yY-HX
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 04:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nrbSX-0005PL-4y
 for qemu-devel@nongnu.org; Thu, 19 May 2022 04:24:37 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:45939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nrbSS-0006n9-0I
 for qemu-devel@nongnu.org; Thu, 19 May 2022 04:24:33 -0400
Received: by mail-ed1-x535.google.com with SMTP id er5so6020838edb.12
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 01:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lgvne7klxpK5CRkDwB2Zfz1HayZaLtDYEPiqnHK5eeE=;
 b=wLN9uVJfNtSzDQC8iNDSRf5Nmt61kTIaIBGYPgudjDnw7pSrOZg7xz+DFI0XaM8/QH
 aj+i9hLGBMQx+zQUp3+oH5qjHJ2i3hZJY777MV4p6jgwGgB5LlD3EsEnzG7d/t2GpnVe
 lFoE0F/Fcp0ahh7ZvUO4tm25bJwDN7CoZetS7IGoLqW6NozLw4KbbbmcBU6xk6kYYgty
 IXsa0idcXBROqGknTXv2WKIRhwyLlF7BxirIsy+0IlaRK8DOLCg81e1NnzUI4cVXuO/D
 8TvI3TQ1a6MZWbV1aDH6o/f7U/IAtjc1LTsO8EUmOAYIjl+7T3A+fRGq2iMNt3/uOeBd
 g7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lgvne7klxpK5CRkDwB2Zfz1HayZaLtDYEPiqnHK5eeE=;
 b=P3DXX5sLZQ+/uzXKiTQj0oIwDc7YZ+AOk/FBQ5eocUIEfYhLqOGu4WFYx/HFhAbNf6
 ngAqhX9WXMll5N80rDXzrkwiLx3j5kG1u69eEZtHbP5BYFuKc5IOyvioiI6DgRTEZiR3
 zepVaIoOiH4XCSBC9C1TO7HlUZff9Aigq6XT3vIXtbh8qb44ybgA7ltLZgbeOlAU4IX+
 jL2rbfdAozN3N+nIXW6oyFAZhvj5yYRicOJLuWemN4kvKluEPV8qbr7N3Qms2BqgXnIz
 WzXyuCmnjL2eRfctglm9X7fgVXx9XNEDVUJ6vkRf/CHYiUCVbZYAEXWteDNgz7CK1PLg
 Elvg==
X-Gm-Message-State: AOAM531GPmRK4a0fzvlIV/ZST/vuAFPoh4gjAkxQaVrm714if4Ulths3
 KQjhgMuuPopC1fNzYbaccLccZhBuCXGdV/jkv+75
X-Google-Smtp-Source: ABdhPJz9DQ/297SjCGUTBSpPHjNRIzrhvPYpbiOTjg1ufiA81vh4k86maepsh1L/JwMvVw3DGgzUfQGx+tkW1HKUMoY=
X-Received: by 2002:a05:6402:5298:b0:42a:cb63:5d10 with SMTP id
 en24-20020a056402529800b0042acb635d10mr4027231edb.415.1652948670029; Thu, 19
 May 2022 01:24:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220504074051.90-1-xieyongji@bytedance.com>
 <20220504074051.90-9-xieyongji@bytedance.com>
 <YoT8vKuUnGhfaaSJ@stefanha-x1.localdomain>
In-Reply-To: <YoT8vKuUnGhfaaSJ@stefanha-x1.localdomain>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Thu, 19 May 2022 16:25:13 +0800
Message-ID: <CACycT3s9gt9D7VU2Bkh7Lo2FjR+MQpEC06ZQpRDcVQMC_LmjXw@mail.gmail.com>
Subject: Re: [PATCH v5 8/8] libvduse: Add support for reconnecting
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 mreitz@redhat.com, 
 mlureau@redhat.com, jsnow@redhat.com, Eric Blake <eblake@redhat.com>, 
 Coiby.Xu@gmail.com, hreitz@redhat.com, qemu-block@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=xieyongji@bytedance.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

On Wed, May 18, 2022 at 10:03 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Wed, May 04, 2022 at 03:40:51PM +0800, Xie Yongji wrote:
> > @@ -291,6 +294,15 @@ static int vduse_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
> >          return -ENOMEM;
> >      }
> >
> > +    vblk_exp->recon_file = g_strdup_printf("%s/vduse-blk-%s",
> > +                                           g_get_tmp_dir(), exp->id);
>
> g_get_tmp_dir() returns the $TMPDIR environment variable. This means
> exp->id must be unique across the host. Please document this.
>

Now we also use exp->id as the name of vduse device which should also
be unique across the host. So I'm not sure if it's better to add a new
unique id for vduse since the exp->id is now used by all block
exports.

Thanks,
Yongji

