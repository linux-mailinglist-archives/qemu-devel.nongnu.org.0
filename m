Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82343442985
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 09:32:01 +0100 (CET)
Received: from localhost ([::1]:49536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhpD6-0003Y3-N5
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 04:32:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mhpBo-0002OG-Vx
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 04:30:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mhpBi-0004UZ-BB
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 04:30:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635841833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IeP+VR4mv22uCp6nN2ae397JM4eFGlCFqCtQgYtg1m0=;
 b=Fruc64dxJJmxHSlssA4SH3TH201jB5AMQyM7z2jkieq3s180jnMWZNduiSteGowUz3Cr7S
 Pib+4jsIcr8dIu5jxONisFRca6GQunWVV2ldJIrxXIZ0TPRSYeZ1iDZ/PemMOYw1Pc6kaz
 0496Vs7+StaoT8KKcl4Lqvexkwqxpn8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-fANgRLhlNOCCXF_GWh5o1Q-1; Tue, 02 Nov 2021 04:30:32 -0400
X-MC-Unique: fANgRLhlNOCCXF_GWh5o1Q-1
Received: by mail-qk1-f199.google.com with SMTP id
 j6-20020a05620a288600b0045e5d85ca17so12176908qkp.16
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 01:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IeP+VR4mv22uCp6nN2ae397JM4eFGlCFqCtQgYtg1m0=;
 b=xu+n7Hbn+fhaawlO7fmK5wnfUzFEnq7ctz3ex/ANhoPm0p5RUQQWdg0mdb7slsJ2x4
 Sfo5c10hfdZretUFtrttGE+oFy6ABe+n2hAyGZa717VwF9+iR9lkNoJsz2eGvldpGYNd
 2rFpVaAeSs+6/73dQzeVTUMlmU+o9YEbTc3B8IxQagbK1aYRQAEHhhpHL/DYkfysSfpt
 2OWpRvZVNMAjL3yhxU++Y+T3cL9CHM5YxRdFXQJ5SbUGfgcKHMHJffKFqXpeCfXup8R1
 THsaXJDXJVIR3LoG6enRatFf30MHLPTDkGdtUMzLCs5EMHM3p5vbxFpYINje1uPI4Mug
 jqOw==
X-Gm-Message-State: AOAM532+pYp0bIAgedRsGJWkdVlMyBdNW6u5wWngJwgx1B4MhbUUYM9B
 N2M2vISRf4A32UvSbwtt0RreM/wPsvWFbxvueZwmTvLz3TSqd3rGJkl2V0b2GKY94sejOoDTG6+
 iV2VXVoYj8wUD8+xfQAtTZx8+mxt/Dyw=
X-Received: by 2002:a0c:80e4:: with SMTP id 91mr33476082qvb.57.1635841832239; 
 Tue, 02 Nov 2021 01:30:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyq3C7KPAnNBJOZvZDaKcMpcwcPEPvw9R0f0ZxGQVmf20YwYXAuF2xlrFz17lZcHyeDSZfm01S1qlBc5bjnpWw=
X-Received: by 2002:a0c:80e4:: with SMTP id 91mr33476064qvb.57.1635841832114; 
 Tue, 02 Nov 2021 01:30:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211029183525.1776416-1-eperezma@redhat.com>
 <20211029183525.1776416-6-eperezma@redhat.com>
 <87zgqnnh5p.fsf@secure.mitica>
In-Reply-To: <87zgqnnh5p.fsf@secure.mitica>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 2 Nov 2021 09:29:56 +0100
Message-ID: <CAJaqyWcJL4q3=pNUfWrg1cgFcV5o6naX5cCLyw+UvRWBHGM3Eg@mail.gmail.com>
Subject: Re: [RFC PATCH v5 05/26] vhost: Add x-vhost-set-shadow-vq qmp
To: Juan Quintela <quintela@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Xiao W Wang <xiao.w.wang@intel.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Parav Pandit <parav@mellanox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 2, 2021 at 8:36 AM Juan Quintela <quintela@redhat.com> wrote:
>
> Eugenio P=C3=A9rez <eperezma@redhat.com> wrote:
> > Command to set shadow virtqueue mode.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
>
> You need to keep care of:
>
>  Markus Armbruster      ] [PATCH v2 0/9] Configurable policy for handling=
 unstable interfaces
>
> When this hit the tree, you need to drop the x- and mark it as unstable.
>

Oh, very good point, I will take it into account for the next revision.

Thanks!

> Later, Juan.
>


