Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFCB34C381
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 08:07:21 +0200 (CEST)
Received: from localhost ([::1]:33946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQl3X-00047N-VG
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 02:07:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lQl2D-0003h5-Pe
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 02:05:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lQl2C-00049l-4o
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 02:05:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616997954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/8gbOuRAYG65Oqt++W5UxJl8TeM1tmNiiP/d+9e85Wc=;
 b=OhCLMzTtXughZVnBfMosYrF5CcV433qvBfFlsMFftZN62seGaIXHAK2ReiAW3KwMJKYJzw
 CjES22H+IsIiHr9wWfHIHuN8uskm5wH6zuJH1ZETBHXFxnl4CwereTvejp2Tv9rxtVfiAQ
 G19tOnd6fejsAAkrSa4s6Tp+JT8bT7U=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-gA5CpzH7NMmyjXXI9y1Paw-1; Mon, 29 Mar 2021 02:05:52 -0400
X-MC-Unique: gA5CpzH7NMmyjXXI9y1Paw-1
Received: by mail-pj1-f72.google.com with SMTP id dw22so10742582pjb.6
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 23:05:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/8gbOuRAYG65Oqt++W5UxJl8TeM1tmNiiP/d+9e85Wc=;
 b=VF27PqoOUuXDLn6GlMzgu9HqejMfANaPUpHkzHqqciSe4BIPzs2Y1MLRnGdqtnMCg4
 qsz/zifgBjeWzAIru9qclkbSasJoUZB631CrFJM3WdKCwaJUOg5qGG2gcD9en3ZHWsnu
 qNuEtaMJ+AI+KFZ1M/9AWfhiSF1DmiHLZVcZo55V/gtkiYAO020xjhmA1jXwoe5mjMYm
 w1e2emUArXxdgmGitpzvgngL8AfZ5g/iNv6up54fLL6dKa2YquQK1OGweg2Q3evCHM7W
 qAou/QiXQogytd9LcxJ9rWzf4BA59Ei7qLXQoRi6Y97p79geb04oBqcT4xid9+gjjqA0
 cIjg==
X-Gm-Message-State: AOAM533igsbbYlm0BPCOjcAKpat21VRp6frByp0H34JW6o+66JgKWOz2
 jP0WjS/UZ30X3hOsmG/SwACZcWN5K5Fce8Qolw+aL5Qdi647yk9ZIvCQMWrkR7EJ2iO1gwXkXso
 6CXpuB5JqMH60WwRcjJPX786M8gW3a0w=
X-Received: by 2002:a63:3e4b:: with SMTP id l72mr1597751pga.203.1616997951541; 
 Sun, 28 Mar 2021 23:05:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSPmOiFycSDaKIWvEohOBxDlF+x//RFDqQiOcv+ECz2XeS+XhsHO/ExT2mlSPHyhNEv7K5mPr6dfcc8z0b1G0=
X-Received: by 2002:a63:3e4b:: with SMTP id l72mr1597738pga.203.1616997951290; 
 Sun, 28 Mar 2021 23:05:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210323015641.10820-1-lulu@redhat.com>
 <20210323015641.10820-2-lulu@redhat.com>
 <fe923c35-1172-6b55-e6a5-eddb5ffacdce@redhat.com>
 <CACLfguWy8ccnTnJJuwE0VUyZyXL5Rrg=LSEwUuHToHOEXOY-mg@mail.gmail.com>
 <83dac3f6-ea2f-76e3-3d2e-394483c3bc5c@redhat.com>
In-Reply-To: <83dac3f6-ea2f-76e3-3d2e-394483c3bc5c@redhat.com>
From: Cindy Lu <lulu@redhat.com>
Date: Mon, 29 Mar 2021 14:05:13 +0800
Message-ID: <CACLfguW649GttS+0UTRu6b9te5OaTU-D6juPKNr-EWy9Y3m7OA@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] virtio:add support in configure interrupt
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 26, 2021 at 4:29 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/3/25 =E4=B8=8B=E5=8D=883:15, Cindy Lu =E5=86=99=E9=81=93:
>
> +enum virtio_config_status {
> +    VIRTIO_CONFIG_SUPPORT,
> +    VIRTIO_CONFIG_WORK,
> +    VIRTIO_CONFIG_STOP,
> +    VIRTIO_CONFIG_STATUS_UNKNOWN,
>
> Any reason for this extra state? I think we can know whether the config
> interrupt is being used through a
>
> Thanks
>
> The problem is I need to split the backend devices into 3 types,
> 1=EF=BC=89 normal device
> 2=EF=BC=89vdpa support config interrupt. and the configur interrupt is ac=
tive now
> 3=EF=BC=89vdpa not support config interrupt.
> So I  add this bit and this bit will init in vpda /vhost modules and
> qemu can check this bit to know the  which behariver we will do in
> virtio bus  and other modules,
>
>
> I wonder whether it's a must. We can setup guest notifiers unconditionall=
y, so if it's an vhost bakcend without config interrupt support, such notif=
iers won't be used.
>
> Thanks
>
sure,That make sense  I will post a new version
>
>  Maybe I need to change this bit's name
> to make it more clearly
>
> Thanks
> Cindy
>
>
>


